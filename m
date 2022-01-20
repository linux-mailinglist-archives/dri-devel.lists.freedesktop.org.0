Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF91495131
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992EB10E45F;
	Thu, 20 Jan 2022 15:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207FF10E45F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id C55722B00152;
 Thu, 20 Jan 2022 10:16:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 20 Jan 2022 10:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=mLNfVDcx5fgjaRocHX0P81AfuCf86f
 M7OwE1yvVJ1s4=; b=d8awcBAF64VlczFq1Ayida1tL4JL0f2JhrVZImhroKVSlw
 MX/IJm3bPnwGmOyCMwUKD6AxTm486UuJuL4IZ1FTPWTC3tV0XILb524xH/kMvLoJ
 IEVAfaqctEtkFgvr4uJs829q5guYDpVSc15X+WgSsXcF3/rYPdT4kpSSuP2hwOHk
 qM+VDw7uz84z7gJ86INmib91yP1ETGr2/wNaQIq5ZZ5++el+r1RpJ4vIguLlWogW
 koT5jBY4icLJNyupA+g8rgnx73J10sYj6/9saLDP4W8LAoA7v3fMXNUVUaZnt8Pr
 WdqUBYjnR+wtkAM/GFTR9yq1AUkfgthZ8Hfto3fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mLNfVD
 cx5fgjaRocHX0P81AfuCf86fM7OwE1yvVJ1s4=; b=liaeJc12SXkgroLCwkNUEq
 78mxGU34iL8Hh+Ik0t6AC/chmZhySwOmNs4bsNPnr/N7Vtaj2BdHT/bgrfBo03zI
 3xiLGnDotczKQtWbA0jy74bCINMxQ6o+O52H4Q6yU4Qrf+MykUmirywf9SdN0VPZ
 jgkt2SXVDxLJHd1vXBKneuNlwKP+zQti70e/8mU8bcD4cePoFn9jZH16REJ3DHOD
 IYtKHVoaiLd68KTm87bl9+mRRcS7LZQaMBpFlibAnW3aUZywTMXHowuoyXg29Ir4
 nTX9f8bLrXsteQcIFEAAn1NwCdjLzHjx1UqtNMtjSd1iKU3F/RNUFwsbHbFSLLGw
 ==
X-ME-Sender: <xms:3HzpYRTEjJK5uyZJziYWoO_x21r4q2ZjXNaLfsofGTiycT6t9qCzXg>
 <xme:3HzpYayQf0DY1g9ZRVimT34zDRS0t9D6muXPXq0y_U9SfisLkNIXrMmDXDYb69319
 kXN3ii7VzZjvl0p2bk>
X-ME-Received: <xmr:3HzpYW15O5DpzO9eDi4CnpxUQ6rdbxOefSCC1ahSXEVPiuZGetz_WvA_U4DJhzO7TSlvaZwe7Pr8I3HFhjIpXR8EGINiActrjOer14Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3XzpYZANypN1qAvrch_bKKiz8vQ3fgy71giZVExa_61VOFJ4LDbC1A>
 <xmx:3XzpYajqOhI0hANVzOLgWA6VLGxQ28EIRDuA56bq56R9h7YsmOzo8A>
 <xmx:3XzpYdp1rzUKsfNpdRko3arOfe5DD9IqZIfzVRkFHsZg73h-h3RxpA>
 <xmx:3XzpYfZ2Uftf_LBFZb7OiJxQ7qNl5W-oMfsYGna7_ULw2n7PiNi7al9Q_hc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 04/16] drm/connector: Fix typo in output format
Date: Thu, 20 Jan 2022 16:16:13 +0100
Message-Id: <20220120151625.594595-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI specification mentions YCbCr everywhere, but our enums have
YCrCb. Let's rename it to match.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../drm/arm/display/komeda/d71/d71_component.c | 12 ++++++------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  4 ++--
 .../drm/bridge/cadence/cdns-mhdp8546-core.c    | 18 +++++++++---------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c      | 16 ++++++++--------
 drivers/gpu/drm/drm_edid.c                     | 16 ++++++++--------
 .../gpu/drm/rockchip/analogix_dp-rockchip.c    |  2 +-
 include/drm/drm_connector.h                    |  6 +++---
 9 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8a46b8430f1e..7963421fd42d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5852,7 +5852,7 @@ static void fill_stream_properties_from_drm_display_mode(
 	else if (drm_mode_is_420_also(info, mode_in)
 			&& aconnector->force_yuv420_output)
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCRCB444)
+	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
 	else
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 8a02ade369db..42510fdea27e 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -1078,11 +1078,11 @@ static void d71_improc_update(struct komeda_component *c,
 	mask |= IPS_CTRL_YUV | IPS_CTRL_CHD422 | IPS_CTRL_CHD420;
 
 	/* config color format */
-	if (st->color_format == DRM_COLOR_FORMAT_YCRCB420)
+	if (st->color_format == DRM_COLOR_FORMAT_YCBCR420)
 		ctrl |= IPS_CTRL_YUV | IPS_CTRL_CHD422 | IPS_CTRL_CHD420;
-	else if (st->color_format == DRM_COLOR_FORMAT_YCRCB422)
+	else if (st->color_format == DRM_COLOR_FORMAT_YCBCR422)
 		ctrl |= IPS_CTRL_YUV | IPS_CTRL_CHD422;
-	else if (st->color_format == DRM_COLOR_FORMAT_YCRCB444)
+	else if (st->color_format == DRM_COLOR_FORMAT_YCBCR444)
 		ctrl |= IPS_CTRL_YUV;
 
 	malidp_write32_mask(reg, BLK_CONTROL, mask, ctrl);
@@ -1144,11 +1144,11 @@ static int d71_improc_init(struct d71_dev *d71,
 	improc = to_improc(c);
 	improc->supported_color_depths = BIT(8) | BIT(10);
 	improc->supported_color_formats = DRM_COLOR_FORMAT_RGB444 |
-					  DRM_COLOR_FORMAT_YCRCB444 |
-					  DRM_COLOR_FORMAT_YCRCB422;
+					  DRM_COLOR_FORMAT_YCBCR444 |
+					  DRM_COLOR_FORMAT_YCBCR422;
 	value = malidp_read32(reg, BLK_INFO);
 	if (value & IPS_INFO_CHD420)
-		improc->supported_color_formats |= DRM_COLOR_FORMAT_YCRCB420;
+		improc->supported_color_formats |= DRM_COLOR_FORMAT_YCBCR420;
 
 	improc->supports_csc = true;
 	improc->supports_gamma = true;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f8e5da148599..a694988d991d 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -223,7 +223,7 @@ static void adv7511_set_config_csc(struct adv7511 *adv7511,
 		config.csc_coefficents = adv7511_csc_ycbcr_to_rgb;
 
 		if ((connector->display_info.color_formats &
-		     DRM_COLOR_FORMAT_YCRCB422) &&
+		     DRM_COLOR_FORMAT_YCBCR422) &&
 		    config.hdmi_mode) {
 			config.csc_enable = false;
 			config.avi_infoframe.colorspace =
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b7d2e4449cfa..eb590fb8e8d0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1537,9 +1537,9 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 		video->color_depth = COLOR_8;
 		break;
 	}
-	if (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		video->color_space = COLOR_YCBCR444;
-	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 		video->color_space = COLOR_YCBCR422;
 	else
 		video->color_space = COLOR_RGB;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 5530fbf64f1e..11f5aa754b91 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1553,13 +1553,13 @@ static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
 
 	switch (fmt->color_format) {
 	case DRM_COLOR_FORMAT_RGB444:
-	case DRM_COLOR_FORMAT_YCRCB444:
+	case DRM_COLOR_FORMAT_YCBCR444:
 		bpp = fmt->bpc * 3;
 		break;
-	case DRM_COLOR_FORMAT_YCRCB422:
+	case DRM_COLOR_FORMAT_YCBCR422:
 		bpp = fmt->bpc * 2;
 		break;
-	case DRM_COLOR_FORMAT_YCRCB420:
+	case DRM_COLOR_FORMAT_YCBCR420:
 		bpp = fmt->bpc * 3 / 2;
 		break;
 	default:
@@ -1767,8 +1767,8 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	 * If YCBCR supported and stream not SD, use ITU709
 	 * Need to handle ITU version with YCBCR420 when supported
 	 */
-	if ((pxlfmt == DRM_COLOR_FORMAT_YCRCB444 ||
-	     pxlfmt == DRM_COLOR_FORMAT_YCRCB422) && mode->crtc_vdisplay >= 720)
+	if ((pxlfmt == DRM_COLOR_FORMAT_YCBCR444 ||
+	     pxlfmt == DRM_COLOR_FORMAT_YCBCR422) && mode->crtc_vdisplay >= 720)
 		misc0 = DP_YCBCR_COEFFICIENTS_ITU709;
 
 	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
@@ -1778,15 +1778,15 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		pxl_repr = CDNS_DP_FRAMER_RGB << CDNS_DP_FRAMER_PXL_FORMAT;
 		misc0 |= DP_COLOR_FORMAT_RGB;
 		break;
-	case DRM_COLOR_FORMAT_YCRCB444:
+	case DRM_COLOR_FORMAT_YCBCR444:
 		pxl_repr = CDNS_DP_FRAMER_YCBCR444 << CDNS_DP_FRAMER_PXL_FORMAT;
 		misc0 |= DP_COLOR_FORMAT_YCbCr444 | DP_TEST_DYNAMIC_RANGE_CEA;
 		break;
-	case DRM_COLOR_FORMAT_YCRCB422:
+	case DRM_COLOR_FORMAT_YCBCR422:
 		pxl_repr = CDNS_DP_FRAMER_YCBCR422 << CDNS_DP_FRAMER_PXL_FORMAT;
 		misc0 |= DP_COLOR_FORMAT_YCbCr422 | DP_TEST_DYNAMIC_RANGE_CEA;
 		break;
-	case DRM_COLOR_FORMAT_YCRCB420:
+	case DRM_COLOR_FORMAT_YCBCR420:
 		pxl_repr = CDNS_DP_FRAMER_YCBCR420 << CDNS_DP_FRAMER_PXL_FORMAT;
 		break;
 	default:
@@ -1882,7 +1882,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (mhdp->display_fmt.y_only)
 		misc1 |= CDNS_DP_TEST_COLOR_FORMAT_RAW_Y_ONLY;
 	/* Use VSC SDP for Y420 */
-	if (pxlfmt == DRM_COLOR_FORMAT_YCRCB420)
+	if (pxlfmt == DRM_COLOR_FORMAT_YCBCR420)
 		misc1 = CDNS_DP_TEST_VSC_SDP;
 
 	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..b0d8110dd412 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2540,7 +2540,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	struct drm_display_mode *mode = &crtc_state->mode;
 	u8 max_bpc = conn_state->max_requested_bpc;
 	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
-			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
+			     (info->color_formats & DRM_COLOR_FORMAT_YCBCR420);
 	u32 *output_fmts;
 	unsigned int i = 0;
 
@@ -2594,36 +2594,36 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 */
 
 	if (max_bpc >= 16 && info->bpc == 16) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}
 
 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
 	}
 
 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	/* Default 8bit RGB fallback */
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 471b577dca79..1a1016f47989 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3776,7 +3776,7 @@ static int do_y420vdb_modes(struct drm_connector *connector,
 	}
 
 	if (modes > 0)
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB420;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
 	return modes;
 }
 
@@ -4279,7 +4279,7 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 	if (map_len == 0) {
 		/* All CEA modes support ycbcr420 sampling also.*/
 		hdmi->y420_cmdb_map = U64_MAX;
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB420;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
 		return;
 	}
 
@@ -4302,7 +4302,7 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 		map |= (u64)db[2 + count] << (8 * count);
 
 	if (map)
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB420;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
 
 	hdmi->y420_cmdb_map = map;
 }
@@ -5158,9 +5158,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	/* The existence of a CEA block should imply RGB support */
 	info->color_formats = DRM_COLOR_FORMAT_RGB444;
 	if (edid_ext[3] & EDID_CEA_YCRCB444)
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
 	if (edid_ext[3] & EDID_CEA_YCRCB422)
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB422;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
 	if (cea_db_offsets(edid_ext, &start, &end))
 		return;
@@ -5388,9 +5388,9 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 
 	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
-		info->color_formats |= DRM_COLOR_FORMAT_YCRCB422;
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
 	drm_update_mso(connector, edid);
 
@@ -5645,7 +5645,7 @@ static bool is_hdmi2_sink(const struct drm_connector *connector)
 		return true;
 
 	return connector->display_info.hdmi.scdc.supported ||
-		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCRCB420;
+		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
 }
 
 static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8abb5ac26807..70c1d93b82df 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -117,7 +117,7 @@ static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
 {
 	struct drm_display_info *di = &connector->display_info;
 	/* VOP couldn't output YUV video format for eDP rightly */
-	u32 mask = DRM_COLOR_FORMAT_YCRCB444 | DRM_COLOR_FORMAT_YCRCB422;
+	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
 
 	if ((di->color_formats & mask)) {
 		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index eaf0ef5f1843..64cf5f88c05b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -522,9 +522,9 @@ struct drm_display_info {
 	enum subpixel_order subpixel_order;
 
 #define DRM_COLOR_FORMAT_RGB444		(1<<0)
-#define DRM_COLOR_FORMAT_YCRCB444	(1<<1)
-#define DRM_COLOR_FORMAT_YCRCB422	(1<<2)
-#define DRM_COLOR_FORMAT_YCRCB420	(1<<3)
+#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
+#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
+#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
 
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
-- 
2.34.1

