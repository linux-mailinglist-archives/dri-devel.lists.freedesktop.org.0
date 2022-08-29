Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1225A4D2B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F93E10F200;
	Mon, 29 Aug 2022 13:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4421110F1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 1B2BE2B05FBA;
 Mon, 29 Aug 2022 09:12:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778741; x=
 1661785941; bh=ZOUld/v3fqwEg7IGW6tGDT41DPLt0Lfah3fjUTcgbpc=; b=g
 /ygx+NnVHUz6W/ywvCNFn+xh02OQ9tp8JwGbVFSgUpKdqiZgP+rMKsG+ccUmaZFD
 NfIVtp8ks3/1noWIAhRcteJNxYvp80NwrR7+7FnNrbC2NAn2DTzzgklKp6pm3O9U
 fOIJh7z1FGq2+Y/Nsij9cm2CXFHOpdbk9Ul+KRCdB7yc5iDVSOrrgh2Cdbs9K6A8
 oX8Sk8Ubakai78jUa+snPaON4nMyYT3ljuenOGVTucwlcRCgN1nzeS8GYEODKkAE
 KrRRF46Se+tr81L1RcBSh3Qv3wAhbiARzvuZPgcc8tLNR17ZsLFKBPtEfC4rlPRE
 RHKQRigOW75k4r1FaureQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778741; x=
 1661785941; bh=ZOUld/v3fqwEg7IGW6tGDT41DPLt0Lfah3fjUTcgbpc=; b=A
 TT3OGdl6RU9/Rm4elzm4Exq3UNekOVV2wqAtiTRgHBHxqEhxsvcJHGo1A2QcB+FM
 z9P1+/jteDn4vEXuQtKj9MHCbXjwyUIPZ6UMtjouSPE/v5pP2mf5p+kNrdvn2k4W
 seNi4/81QXJJ7f0llZVKhMijHBc56e4CQ5YAqH3MsvaqVWg3yBG7PKvuRj5pGXZ3
 NqiUC7FGHjiFmwzhrVFU5JqBBzpYziDgO5xxzl9L0HxUqil1gh/aSdr8/ZwDkPBQ
 /zNw2skRv4k+x61ovk5t3DyzFEgzbHogPhlEILFDa+XIK6l/ypl0h3d1ZjuAVwH9
 2NIXJAvKzNmK/GfMx1WyA==
X-ME-Sender: <xms:NbsMYwA0Z50SMt1C4439TBesDGfTufkE1iUKUB7bnswNrysadREr8Q>
 <xme:NbsMYyhAn_UEq1ePmVh5jP5LSRBHu99qlr3tOvVgaRlT1bwv5lqXIVUgCT_0h5zi2
 zj-W2zbU0UE1RqH9-s>
X-ME-Received: <xmr:NbsMYzmZsnSDWs_nPWYUoZE0RrBAVDAzdovAKeBj4e6rTJ8PoqMlTyVVcxtt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvueehkefhhefghedugefhieevhfdvudegleeuteetlefgudevgfet
 kedtlefhtdenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:NbsMY2zfIxn4Uo4kh982u3Uafg130Bi4zMUJfxHPhs7zG5MVwEge6Q>
 <xmx:NbsMY1Tt1MpFLVRD5ROmzzNqLCeGzFFGapYl02wad1tCj5pQ0WHFzA>
 <xmx:NbsMYxYhOcyahsEDVyj_Sy3t9YUPjUZV_B6uct8mnL0esS5xszqIfg>
 <xmx:NbsMYxImev_YfGcjjoRMrRix6LYmnjBfSRCSUGVl-XrsilTjIaKoPC-Lkuw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:12:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 03/41] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
Date: Mon, 29 Aug 2022 15:11:17 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-3-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=4933; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tneD6WL3cA9YngB/zjXILq0672FR3xbphbAAyAQ5g1M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+QbFvh8k7rUZPI7asqriudtjVVuN1hUenat00m/7DPl
 pOSyjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEcwMjw5PSFv3OILffXmnnXGx5WO
 UO8j7eWrcwzU+1QSj45dfVsxgZWq8prj2292TmtwfhVY/0ixsCfq7S5b4jtTKHq5NrikAxEwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have two sets of TV properties.=0D
=0D
The first one is there to deal with analog TV properties, creating=0D
properties such as the TV mode, subconnectors, saturation, hue and so on.=0D
It's created by calling the drm_mode_create_tv_properties() function.=0D
=0D
The second one is there to deal with properties that might be useful on a=0D
TV, creating the overscan margins for example. It's created by calling the=
=0D
drm_mode_create_tv_margin_properties().=0D
=0D
However, we also have a drm_atomic_helper_connector_tv_reset() function=0D
that will reset the TV margin properties to their default values, and thus=
=0D
is supposed to be called for the latter set. This creates an ambiguity due=
=0D
to the inconsistent naming.=0D
=0D
We can thus rename the drm_atomic_helper_connector_tv_reset() function to=0D
drm_atomic_helper_connector_tv_margins_reset() to remove that ambiguity=0D
and hopefully make it more obvious.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>=0D
=0D
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/dr=
m_atomic_state_helper.c=0D
index bf31b9d92094..dfb57217253b 100644=0D
--- a/drivers/gpu/drm/drm_atomic_state_helper.c=0D
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c=0D
@@ -464,12 +464,12 @@ void drm_atomic_helper_connector_reset(struct drm_con=
nector *connector)=0D
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);=0D
 =0D
 /**=0D
- * drm_atomic_helper_connector_tv_reset - Resets TV connector properties=0D
+ * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector prop=
erties=0D
  * @connector: DRM connector=0D
  *=0D
  * Resets the TV-related properties attached to a connector.=0D
  */=0D
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)=
=0D
+void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *co=
nnector)=0D
 {=0D
 	struct drm_cmdline_mode *cmdline =3D &connector->cmdline_mode;=0D
 	struct drm_connector_state *state =3D connector->state;=0D
@@ -479,7 +479,7 @@ void drm_atomic_helper_connector_tv_reset(struct drm_co=
nnector *connector)=0D
 	state->tv.margins.top =3D cmdline->tv_margins.top;=0D
 	state->tv.margins.bottom =3D cmdline->tv_margins.bottom;=0D
 }=0D
-EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);=0D
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);=0D
 =0D
 /**=0D
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector s=
tate=0D
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_=
connector.c=0D
index d0addd478815..fa636206f232 100644=0D
--- a/drivers/gpu/drm/gud/gud_connector.c=0D
+++ b/drivers/gpu/drm/gud/gud_connector.c=0D
@@ -355,7 +355,7 @@ static void gud_connector_reset(struct drm_connector *c=
onnector)=0D
 	drm_atomic_helper_connector_reset(connector);=0D
 	connector->state->tv =3D gconn->initial_tv_state;=0D
 	/* Set margins from command line */=0D
-	drm_atomic_helper_connector_tv_reset(connector);=0D
+	drm_atomic_helper_connector_tv_margins_reset(connector);=0D
 	if (gconn->initial_brightness >=3D 0)=0D
 		connector->state->tv.brightness =3D gconn->initial_brightness;=0D
 }=0D
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.=
c=0D
index 84e5a91c2ea7..6877add8e1fa 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c=0D
@@ -396,7 +396,7 @@ static void vc4_hdmi_connector_reset(struct drm_connect=
or *connector)=0D
 	new_state->base.max_bpc =3D 8;=0D
 	new_state->base.max_requested_bpc =3D 8;=0D
 	new_state->output_format =3D VC4_HDMI_OUTPUT_RGB;=0D
-	drm_atomic_helper_connector_tv_reset(connector);=0D
+	drm_atomic_helper_connector_tv_margins_reset(connector);=0D
 }=0D
 =0D
 static struct drm_connector_state *=0D
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic=
_state_helper.h=0D
index 3f8f1d627f7c..192766656b88 100644=0D
--- a/include/drm/drm_atomic_state_helper.h=0D
+++ b/include/drm/drm_atomic_state_helper.h=0D
@@ -70,7 +70,7 @@ void __drm_atomic_helper_connector_state_reset(struct drm=
_connector_state *conn_=0D
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,=
=0D
 					 struct drm_connector_state *conn_state);=0D
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);=0D
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)=
;=0D
+void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *co=
nnector);=0D
 void=0D
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connec=
tor,=0D
 					   struct drm_connector_state *state);=0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index 248206bbd975..23112f0c11cf 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -692,7 +692,7 @@ struct drm_connector_tv_margins {=0D
 =0D
 /**=0D
  * struct drm_tv_connector_state - TV connector related states=0D
- * @subconnector: selected subconnector=0D
+ * @select_subconnector: selected subconnector=0D
  * @margins: TV margins=0D
  * @mode: TV mode=0D
  * @brightness: brightness in percent=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
