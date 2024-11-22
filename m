Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D69D61FD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19EA10EBFB;
	Fri, 22 Nov 2024 16:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PtHoLXWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF9410EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD73A60005;
 Fri, 22 Nov 2024 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E53FflVZUbLnlF8wplWhxBERpMv4taFo3hTXjKtrZCU=;
 b=PtHoLXWJH0/6BA86CIHExNewbrAdsOGcPzSbF1IfrKNuZX4BJQTPeCS25v9OAc7Il5tZAm
 MCnKEcaqT4J40LrSHTKYrymGmOy5IRMnPI1IGWWvdeknfdMveIl8yQ89Bc0zol7FQaYHSy
 g84X3Ioa7SwFOTEwMPilTovRuPrRr/CzcFIuL2o50/X32xNg50mJa0Dhl351ugCCIBCEk7
 py4Ql/CtlEq1hGVa5Ii70aYhZtTzVhtVdux74DXVwSUYh2pSzhQqkpAUHsVgi1kERhLPyh
 WPstHDoe7S1ttQfkogGgO2rPoYreUfCk1hz1zPGsytIiUPSxiMaulKgftI9Tnw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:19:08 +0100
Subject: [PATCH v3 8/8] drm/vkms: Add P01* formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-new-color-formats-v3-8-23f7776197c9@bootlin.com>
References: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
In-Reply-To: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DCYx66irwTSpBabckwUwZmGruKQUcBMtLxM8Do3N2IQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK74GL6Vhqnot+DzZiz2Gb2MKlgyveVzGXgPM
 +Jhf+j7xvuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cu+AAKCRAgrS7GWxAs
 4mv9D/oDnKG8lR+N8flppo33NvpPhyMa8bD3jAMRvLb/FL2nu73pMXwIDsKcS92Q224p4AQiU6h
 RvEoCNeWOqp7mzon+d2i8S+mXEDZDq0tzEd+D4y5kvCLbvAhZNNfo8rcnW6mKON2r9se7u2yoL0
 sRvSV/xp723fSehYpiFLgisALxslaWswFvwvL16hlm0PnhowbsKPndzpuP+Ve6wgtddr8FI2R8j
 g/ClZPpE1CuKnfbxbqXBtbiWfvfkMnLWHcUudW22WPkceneYsfTd48U+cUbmN34Fu/QW6BQNDg3
 aFCDSSSbthn37VyK6ye+1E+1nb/uctHW734k7Xs54CWCwTXKBa2pk7QEunxOIet3b3GDf8bayCf
 pATVk/YipLYCz2yh/CIbIblgNVqhDA985ML/Gh/RnIaLgQ070U3m1wqHv633wCIsR+vDrqR7rY0
 JD3UsP/got/3HbmiIEadODNALWqy/Y6TNUhl+tPavfOa+0WL2K3ePW0/EW+cGUpkdu4Zja7P3ci
 xp26Py4YCP8f6t8kUNtltqwGxfLjVehXLgxCXiyp7VDXc8+uFlPi+fj6Uj9PSW4IkrBl+SO1qRL
 7/f9RZKHCrXhHXjSCCxwe0qoTBY8KC32hdmYewnkcUo/gnNtYnWnMRyj5AAxByHI2o4Lljui+vF
 siTK1ZIx+hEr0XA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The formats NV 12/16/24/21/61/42 were already supported.
Add support for:
- P010
- P012
- P016

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d2ce5848eb3fb667a882d1efd7c8af5baec97bf4..c895126e9136bff7820ac7dfc1a3b6418c9ca2b1 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -535,7 +535,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
 
 READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
 			 y[0] * 257, uv[0] * 257, uv[1] * 257)
-
+READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
+			 y[0], uv[0], uv[1])
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -728,6 +729,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_NV42:
 		return &YUV888_semiplanar_read_line;
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		return &YUV161616_semiplanar_read_line;
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YUV444:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e82b60fcda4bc2f2337e9c1e65515548ee06c9ed..4ab0fab4dd09f4be14308afb2f52bc6465f6396d 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -41,6 +41,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
 	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
 	DRM_FORMAT_R1,
 	DRM_FORMAT_R2,
 	DRM_FORMAT_R4,

-- 
2.47.0

