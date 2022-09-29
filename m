Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1E45EFA9B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4990010EAD7;
	Thu, 29 Sep 2022 16:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEDF10EAC8;
 Thu, 29 Sep 2022 16:31:19 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD5CE5807D7;
 Thu, 29 Sep 2022 12:31:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 29 Sep 2022 12:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469078; x=
 1664476278; bh=ppECgA0vV60jwER7wgvOwFkKPnx8uo3zbTvDH7vA0Ms=; b=j
 qR2Q8S/5AlWwFZFHFjxSoayo4ga3X3sRyqIB1ZkoK+49VZ9Q9V626UHq7taWZhTx
 utXuade6PQ4Mz9zarVmd0VNUx47SwN9jZ56pahIY5Q3QNJkqIZyd7kRFymhOyyZ6
 KzBJrtxkzfZlJhZbMP2cWJpyB4/C6ix833eYnXpFf0dRy90fL7gbt1z/N+ZcvyJI
 fsW/5OANYrkcAPdiwpEBQXzPaXc+1oJNDtm/jhdj6zq3Ra49gZ0iTm5CVsolJrev
 FD2LV3z+ltXhsd5g4HJkXCVdaBumCQPVpr432z5kbmdORhuXn3uKpSEhZYK3QH2f
 OachzzszCgzpoGmUTJ2AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469078; x=
 1664476278; bh=ppECgA0vV60jwER7wgvOwFkKPnx8uo3zbTvDH7vA0Ms=; b=e
 xACVtubgY5CXGQ0Xz+cuqxoiwnifpBwLtdZzs2LV3jb0l5StBphweB6dA+1aI6yq
 IZ22Rea8w8d22yuEg95M2LNWyZWDaS+yzxiQnHe1I/4FVQrL83qSWdq8urb50FaK
 RRF1ZmOo0sYAyTlH90yKFkJVDEq0/9ctGTtfppqfNMBlvzrpqg6Xh6djxtqTCvdb
 kq2uJS3GEB1RLyASusKf9g+ClGGT0r/XRNhNtr+0ycqtlRRebUetL+2DwFX9KgBy
 G41jck8iEscXP1dffXbl7N+s/IOzqDC+X05ngPYCqgDaDTatBlSmn2sX8MJSvDnv
 AvLzCuEUTvRZTuokwQpsg==
X-ME-Sender: <xms:Vcg1YxKEeMGlSOgvmC6jMsfSEHBsgX1l36cp9nF0MkT098NumAKcow>
 <xme:Vcg1Y9KDhkvNFQq5oHLT0NDHF_UjGI0vjox2y9gmamgfsqEjfb70dK_fdLogrOF9q
 Bhua_9CwnagVgsPCoM>
X-ME-Received: <xmr:Vcg1Y5skrZuhQurltI0dAAv5Xvq9MdigqIYZhKhwHQMprn4_AqVtjHBDMilD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeevjedukeetveevfefhhfdufeektdfgteetgfeijedtffeiffehueeh
 tdehieekueenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:Vcg1YyZEY0V-ATDXuSJwjfRHN2PnjM0dUdOc_N2yDFRqHaTy4h-dog>
 <xmx:Vcg1Y4bsyb1Pgk0jAd_8z6w4S-TXtn8dgzxXrg2BKGv0IrlnmKtnGg>
 <xmx:Vcg1Y2C16Pl8AyGYzZ718n5sB0AhGw6N_pa8ep-CdtSdiOytb-Tv4g>
 <xmx:Vsg1Y5EfDCkXDXftObn7Y-giZ0KARIBnXsF_ggxS3UhI7GegMTlexQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:30:58 +0200
Subject: [PATCH v4 04/30] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-4-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=4846; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qjDqq1A+9Ucno5z67Zt6QwIQFbrGe4GVO0kNjE+s+wM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9xu7LQNn1h5a/IbpyWlPCc13239Oecrz+ftgvwhanIv
 Jiyb0lHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJtJUz/LPrUN9p9zLuS9qPf2/OdF
 xaa9YdIfxB/mHopDXrTi/me5bM8M+c5YXK0aynOX9aV6ZdLDj9e6rP0psX//PuvCQqOOfyvis8AA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have two sets of TV properties.

The first one is there to deal with analog TV properties, creating
properties such as the TV mode, subconnectors, saturation, hue and so on.
It's created by calling the drm_mode_create_tv_properties() function.

The second one is there to deal with properties that might be useful on a
TV, creating the overscan margins for example. It's created by calling the
drm_mode_create_tv_margin_properties().

However, we also have a drm_atomic_helper_connector_tv_reset() function
that will reset the TV margin properties to their default values, and thus
is supposed to be called for the latter set. This creates an ambiguity due
to the inconsistent naming.

We can thus rename the drm_atomic_helper_connector_tv_reset() function to
drm_atomic_helper_connector_tv_margins_reset() to remove that ambiguity
and hopefully make it more obvious.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Removed the unrelated subconnector documentation name change
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 6 +++---
 drivers/gpu/drm/gud/gud_connector.c       | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 2 +-
 include/drm/drm_atomic_state_helper.h     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index bf31b9d92094..dfb57217253b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -464,12 +464,12 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
 /**
- * drm_atomic_helper_connector_tv_reset - Resets TV connector properties
+ * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
  *
  * Resets the TV-related properties attached to a connector.
  */
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
+void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector)
 {
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
 	struct drm_connector_state *state = connector->state;
@@ -479,7 +479,7 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 	state->tv.margins.top = cmdline->tv_margins.top;
 	state->tv.margins.bottom = cmdline->tv_margins.bottom;
 }
-EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);
 
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index d0addd478815..fa636206f232 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -355,7 +355,7 @@ static void gud_connector_reset(struct drm_connector *connector)
 	drm_atomic_helper_connector_reset(connector);
 	connector->state->tv = gconn->initial_tv_state;
 	/* Set margins from command line */
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_margins_reset(connector);
 	if (gconn->initial_brightness >= 0)
 		connector->state->tv.brightness = gconn->initial_brightness;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 64f9feabf43e..99908137dbe7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -542,7 +542,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
 	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
 static struct drm_connector_state *
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 3f8f1d627f7c..192766656b88 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -70,7 +70,7 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
 					   struct drm_connector_state *state);

-- 
b4 0.11.0-dev-7da52
