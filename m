Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724520C095
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 12:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616BF6E14B;
	Sat, 27 Jun 2020 10:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCFE89395
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 20:44:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QKhfYZ018492; Fri, 26 Jun 2020 22:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=STMicroelectronics;
 bh=VAK04oSRk0V+FpML5MYWWrN1uyiNMP52mYEOCgEuyy0=;
 b=En3YcPGlNbOcgJbE9RC4i56Zv0gjiuCnKBrHFsV7zDF3Fe8wfWhqjtq37N8GkXBJvPiy
 Vdwy8f2NaqhHE4w6YJUST8+zrMpkW6bvo0E169FZCJXSUzhVdPuRefNYk9XTMr2j/jAU
 I+41pYb7x/ZVAC+cse1D+bnQs4Fc1XqR4t5f6FJTXCZ+SnWmDvgsUo8tnR7UATGA4nyM
 UYG+L7ZY1KmSVEd086O5GOb2QrLDRLLeJXitLhtmqtRXoDrEVQBwLKIQt9YLr6qLc40p
 qlz2Fl48B9BO6Upn2ASgKCR+J4+D1f5iusyEondu385bSvmohJvL/njgQv9PkEPQs+PH hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuv9t2mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 22:44:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B416A10002A;
 Fri, 26 Jun 2020 22:44:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C0512067FD;
 Fri, 26 Jun 2020 22:44:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 26 Jun 2020 22:44:12 +0200
From: Antonio Borneo <antonio.borneo@st.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/connector: fix minor typos in comments
Date: Fri, 26 Jun 2020 22:42:52 +0200
Message-ID: <20200626204252.44565-1-antonio.borneo@st.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_12:2020-06-26,
 2020-06-26 signatures=0
X-Mailman-Approved-At: Sat, 27 Jun 2020 10:12:42 +0000
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
Cc: Antonio Borneo <antonio.borneo@st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of these comments are part of the Linux GPU Driver Developer's
Guide.
Fix some minor typo in the comments and remove a repeated 'the'.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
---
 drivers/gpu/drm/drm_connector.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d877ddc6dc57..cb62fb8e594e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -38,7 +38,7 @@
  * DOC: overview
  *
  * In DRM connectors are the general abstraction for display sinks, and include
- * als fixed panels or anything else that can display pixels in some form. As
+ * also fixed panels or anything else that can display pixels in some form. As
  * opposed to all other KMS objects representing hardware (like CRTC, encoder or
  * plane abstractions) connectors can be hotplugged and unplugged at runtime.
  * Hence they are reference-counted using drm_connector_get() and
@@ -129,7 +129,7 @@ EXPORT_SYMBOL(drm_get_connector_type_name);
 
 /**
  * drm_connector_get_cmdline_mode - reads the user's cmdline mode
- * @connector: connector to quwery
+ * @connector: connector to query
  *
  * The kernel supports per-connector configuration of its consoles through
  * use of the video= parameter. This function parses that option and
@@ -991,7 +991,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  * 	DP MST sinks), or high-res integrated panels (like dual-link DSI) which
  * 	are not gen-locked. Note that for tiled panels which are genlocked, like
  * 	dual-link LVDS or dual-link DSI, the driver should try to not expose the
- * 	tiling and virtualize both &drm_crtc and &drm_plane if needed. Drivers
+ * 	tiling and virtualise both &drm_crtc and &drm_plane if needed. Drivers
  * 	should update this value using drm_connector_set_tile_property().
  * 	Userspace cannot change this property.
  * link-status:
@@ -1131,7 +1131,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *
  *	It will even need to do colorspace conversion and get all layers
  *	to one common colorspace for blending. It can use either GL, Media
- *	or display engine to get this done based on the capabilties of the
+ *	or display engine to get this done based on the capabilities of the
  *	associated hardware.
  *
  *	Driver expects metadata to be put in &struct hdr_output_metadata
@@ -1614,7 +1614,7 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
  * variable refresh rate capability for a connector.
  *
  * Returns:
- * Zero on success, negative errono on failure.
+ * Zero on success, negative errno on failure.
  */
 int drm_connector_attach_vrr_capable_property(
 	struct drm_connector *connector)
@@ -1759,7 +1759,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  * HDMI connectors.
  *
  * Returns:
- * Zero on success, negative errono on failure.
+ * Zero on success, negative errno on failure.
  */
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
 {
@@ -1788,7 +1788,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  * DP connectors.
  *
  * Returns:
- * Zero on success, negative errono on failure.
+ * Zero on success, negative errno on failure.
  */
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
 {
@@ -1840,7 +1840,7 @@ EXPORT_SYMBOL(drm_mode_create_content_type_property);
  * drm_mode_create_suggested_offset_properties - create suggests offset properties
  * @dev: DRM device
  *
- * Create the the suggested x/y offset property for connectors.
+ * Create the suggested x/y offset property for connectors.
  */
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev)
 {
@@ -1963,7 +1963,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 		size = EDID_LENGTH * (1 + edid->extensions);
 
 	/* Set the display info, using edid if available, otherwise
-	 * reseting the values to defaults. This duplicates the work
+	 * resetting the values to defaults. This duplicates the work
 	 * done in drm_add_edid_modes, but that function is not
 	 * consistently called before this one in all drivers and the
 	 * computation is cheap enough that it seems better to
@@ -2076,7 +2076,7 @@ void drm_connector_set_vrr_capable_property(
 EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
 
 /**
- * drm_connector_set_panel_orientation - sets the connecter's panel_orientation
+ * drm_connector_set_panel_orientation - sets the connector's panel_orientation
  * @connector: connector for which to set the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  *
@@ -2131,7 +2131,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
 
 /**
  * drm_connector_set_panel_orientation_with_quirk -
- *	set the connecter's panel_orientation after checking for quirks
+ *	set the connector's panel_orientation after checking for quirks
  * @connector: connector for which to init the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  * @width: width in pixels of the panel, used for panel quirk detection
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
