Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF2A5E6525
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B9510EB57;
	Thu, 22 Sep 2022 14:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F50F10EB6D;
 Thu, 22 Sep 2022 14:25:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E1B6C2B05B0E;
 Thu, 22 Sep 2022 10:25:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856752; x=
 1663863952; bh=i9unItsm3a3vM09vyHvrM0LwqCiC5ydn42Al/bALvVY=; b=X
 MWc9DTbRxORF6Hy+zZ08Kejuch4Cx/i3W7Xc09w0ajgnOcVCta2V254R5MjbR5T0
 un3rKTEWfcnNfVtHyVCM6pZiaHUCfMZlt1Hup0Pz5wq9xOdraVGSS0FqZApkTKXD
 wgu7uhICR4XRdla35k6AwKRjxBQD18FKLGNDU8tZ9Z4Gd/0BDOaoDeu8x5gmmr6i
 Ls81SK/MTM7v+CXINLJcxl9RXzVP1hDTioU20uknkIdqikrNfaTCsvWKw/AUoF3K
 EkMeWCay8S45Tmf77qwmR94TmK3dtkPNH7z2tsBmjexRlrFGt44r+hmQQEPnJph5
 sze22f/37pkEHos8i0HQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856752; x=
 1663863952; bh=i9unItsm3a3vM09vyHvrM0LwqCiC5ydn42Al/bALvVY=; b=Y
 hZ6JXoTCqlNoLZw+88MU/fxYUVJ8ck/5g3ijOxYBPPOmITTCY3wMxig0tNoCUog6
 9WLRDRVjSrYtZ5J6zNyhy05xM0C/VW5EWsvIQkdwVSQOL/b9YOmol07GznE2FDG2
 jq+ZlfYfpFuIrBH56sK/F4jdTV52xcJ54TRUS8jUbdRT0JaczGuGXwnFk2edA3tu
 vMY/6yqGadXnUlpIz6adABcna6qIcXg8yk01DT2fnoBIu1dwMIwML35gcF3QouxL
 3wl9FgEcalIKI1lqrp8RSIv/taGzodv9uhqH17fCi8sNeC6zsUM1VK8ygBY5hCyn
 KQYbMxyMt9jYSIMBNSRFg==
X-ME-Sender: <xms:bnAsY7_Sn8IhfwT-T_uMhDCfIMB1yY_O7sfKDRoGsjfwRqtSQA7y6w>
 <xme:bnAsY3txbqf9qNevqsXOqeMPvD9pLJqMotDSOD0KOEoNWvWXUQ3uvxx6mlSOH6d7j
 knfMyaUQwItsKSrM5w>
X-ME-Received: <xmr:bnAsY5Arv8JZbmIXJfnoBzc0DLT0UlAymL2s2CFJa-XSQsdwRHSXiSVmRX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepveejudekteevveefhffhudefkedtgfettefgieejtdffieffheeuhedt
 heeikeeunecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:bnAsY3dYLPp1H-_UxT2P3Zc1hSZLgfbaYtOjt-W7hBekjNb0OA4U2Q>
 <xmx:bnAsYwNZVFjBO_u_e_Z4_z8oHze1W3J0cZSUi1PGZCio2FqA5x19Ig>
 <xmx:bnAsY5k0jY3426QKWA_O52vwXcx_H0fkb4KsycW3GJR3l_xugqPCXA>
 <xmx:cHAsY1aHGruQCuQRgUUqbIkyhClEHlj9Pk46GPY4fhrZfzgzuHKV1_2n5HY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:25:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:20 +0200
Subject: [PATCH v2 03/33] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v2-3-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4923; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=p2LpArUJ8YB0hNgt7hVrVP+WwQ+3bZgbszS3vXAQO7Q=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQFc8xSuSP5f/3/ygvLW2lwDZ9uupK4o7p9nlt0XnLLp
 qE9GRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZy7TAjw6vWGNn5k2NnyCYXXveb8H
 Pazbr9ll7SBntiJD7tFlPoyWJkmN3AmX08SSV+wuOjK9LlVexNVyhXbNylZnD80a9tfx2T+AE=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

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
index 4d3ff51ad2a8..fe01ca5a07d3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -396,7 +396,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
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
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 248206bbd975..23112f0c11cf 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -692,7 +692,7 @@ struct drm_connector_tv_margins {
 
 /**
  * struct drm_tv_connector_state - TV connector related states
- * @subconnector: selected subconnector
+ * @select_subconnector: selected subconnector
  * @margins: TV margins
  * @mode: TV mode
  * @brightness: brightness in percent

-- 
b4 0.10.0
