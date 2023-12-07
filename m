Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEB808C8B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08B410E90B;
	Thu,  7 Dec 2023 15:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117F910E907
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:51:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 892CA62005;
 Thu,  7 Dec 2023 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5804C433B6;
 Thu,  7 Dec 2023 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964271;
 bh=hSiOZT7I1AlS1gpPTNWhjWxcUL69aElzs2JoN5aOHC0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aSS3aJgdltZXzxT+fgn0psGO3PXlcKP/sDU7QsEBphGeThZd7WvfnjeuTYXUAoJl6
 W3UInt9yE1HPeppX1mfWCshHz2DVM61Gl7R+kPh2+gESTs0+i5OR0Nhe5oxzuTyYMa
 OUPI7GkjEVfdWxOD8YuAM1tbrxLtG3F/RBPxVWZczIf92BMWcGPdF51qllDOsUjNLv
 C2r9rVUjd9zb6GvSa9dfzKWC2YFsNxdJ8ZtJ2q7IjTxOoFkd1/C3VwKUtrIOdoIIKT
 wxPhvags5RIDBvoa3DGsT1iRjBseHfpbT4+aOjiK+NlCqoL2258g1cO92UsTF4fAXN
 G6IZOm4KG2qtg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:58 +0100
Subject: [PATCH v5 35/44] drm/rockchip: inno_hdmi: Drop HDMI Vendor
 Infoframe support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-35-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2822; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hSiOZT7I1AlS1gpPTNWhjWxcUL69aElzs2JoN5aOHC0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9sesy4/MpEnIFEg+5vVAa2dT37LrHj08kWPgM5XZ
 pu9058c7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEDKoZGSYy3poZbX4jjumJ
 dO+prZv3X77j7L9hBYO67J3nTRsmn2xl+Kfs/p+/aVZP3kLJXU+cPntzpjit+X/qTHuh8XVtATm
 eEkYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI vendor infoframe is only meant to be sent with 4k60 modes and
higher, but the controller doesn't support them. Let's drop them from
the kernel.

Suggested-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 59b2b676b7b8..9c64f94ede6f 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -157,11 +157,15 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
-				  union hdmi_infoframe *frame, u32 frame_index,
-				  u32 mask, u32 disable, u32 enable)
+				  union hdmi_infoframe *frame, u32 frame_index)
 {
-	if (mask)
-		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
+	struct drm_connector *connector = &hdmi->connector;
+
+	if (frame_index != INFOFRAME_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", frame_index);
+		return 0;
+	}
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
 
@@ -177,28 +181,11 @@ static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
 		for (i = 0; i < rc; i++)
 			hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
 				    packed_frame[i]);
-
-		if (mask)
-			hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
 	}
 
 	return setup_rc;
 }
 
-static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
-				      struct drm_display_mode *mode)
-{
-	union hdmi_infoframe frame;
-	int rc;
-
-	rc = drm_hdmi_vendor_infoframe_from_display_mode(&frame.vendor.hdmi,
-							 &hdmi->connector,
-							 mode);
-
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_VSI,
-		m_PACKET_VSI_EN, v_PACKET_VSI_EN(0), v_PACKET_VSI_EN(1));
-}
-
 static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 				      struct drm_display_mode *mode)
 {
@@ -210,7 +197,7 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      mode);
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
+	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
@@ -306,10 +293,8 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (display->is_hdmi) {
+	if (display->is_hdmi)
 		inno_hdmi_config_video_avi(hdmi, mode);
-		inno_hdmi_config_video_vsi(hdmi, mode);
-	}
 
 	/*
 	 * When IP controller have configured to an accurate video

-- 
2.43.0

