Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C7AE3601
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823E10E193;
	Mon, 23 Jun 2025 06:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="2/WaBj3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E0710E182
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:45:00 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-adfb562266cso684972766b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 23:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750661099; x=1751265899; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uTpIpbsJT9oUXdYXUp1B/jgdIiWHQ6mEsslmG5LurCE=;
 b=2/WaBj3oMeJFPsDGfHQen4/onC6saDXKluaOH5fa0yWxC3Vsop2EdC5HHht8vYPwvD
 UR1Myuzuv+iKkgu5xJ6pd6AI0dx8ztboSucX6jyf9cmoSKTcM8zoJrRHkcaU4/dFFuns
 DTV+XbPhSRnP/nr+Pl5qs7nwngdyJGqVSmbs87m3A7LPHAbbhnNndG1AirhUuF4hiH+x
 oNBw/IiaDg32jIESzRi7wfiIqbOvQGXVY2wYm31WBNCd6MtBc8niiZUYbJBanxNICOf3
 dhTYyBYUfh74e0M6R6VLVD6kB1yeF7GZfXWOS+altO9koilm+fUANOyXx4FGDBAeilyo
 jPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750661099; x=1751265899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTpIpbsJT9oUXdYXUp1B/jgdIiWHQ6mEsslmG5LurCE=;
 b=RK1W0evhIg+LJrS4m75LYcDzl6qIwyTuC0MWNmMJ/6IKip0G2uUovoCMeRnVJJGNqw
 aeatUhA4Y+lfWW0ACa+sYEfyLr3WALwaa6eQshixG8pE7RorF1uuSczE5DGfx4lt9wQn
 NUY10LxG+U76/DM88P4HdEmLBDD79fhYe13MaU/+jiKMesJROx1v0gCXGiF+M/XNveRv
 696m4QoAXaGng0zmnh1SXUDh9IWtSJQt693Dy+W/WusK4vXOZAA/TwjoimR3WJvLKOIH
 4iYxK5Do2wfXdofINYy47tpPp+mIKlMFfdRdxioPhIp6Lc+qd0RpEH8oT0P3HE7cEY0W
 KdUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ6L2bxG3CEEVDqb5ZVPbn72RjejqK9bP2OD9TgCL8BwwbLfb+Yi49eYsc2DRb/yyOGkIeQTstO5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB+NMdtOsHL39sFXOdEgRp/8oYaaQBu8+snh2y6vNmriNZk40K
 /+A+O5eyPI21u0vNsOPwbnxx9uG3CRQh7/FsY0f5DNvJruQsHTW2YhPDdvLC7JawOx4=
X-Gm-Gg: ASbGncvgFdVRNMO91/A3d5MRJ6Mi/jddFpnd+kedwQqP3d7S7K4j+2y/9u+RDRQkTGo
 8tpriufA/okDSQOVZC5fNVkdbuLA1OogwlkHi5dA5TnZwgEJeEGeRd66Jt02mVGStkNxLTP9+m6
 tdHXKLfZgJ1OSBWpXd80SaP+y9dOYjwHmCTtRXBZP7RrvZ/8Rag/p5/2HPc11voa23j4e7BxKqU
 mrbQxgrfAGh2qNghaCJxBa+KrSE2+PW/xPfeugTJf02+toE+ig5wHMExO1ZqZuohHJU2VrB/rG+
 H9s6C6a6tGbX2TfBspVcN/GaxJtkfH6jsYg/PHAWjTbPzQfLFoIF7cAFlP+r7Rwcd/wSLOgt5Su
 vJQRtvaCgIy29kKfogyqgaLd7MG0twZnT
X-Google-Smtp-Source: AGHT+IFz7kDahVsqdTj+a5KcPoxkKtMDN2hTfcr/X8jn9acL7zz5DDVx99WzLXxoM8vxkoixi21RhQ==
X-Received: by 2002:a17:907:3f85:b0:ae0:6620:7f with SMTP id
 a640c23a62f3a-ae066200670mr917673166b.44.1750661098692; 
 Sun, 22 Jun 2025 23:44:58 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:44:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:47 +0200
Subject: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for interconnect
 paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=3575;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WFGg8eJbYpqqu4c1SsExqGZhg0kBCQL20U67P0aKA3M=;
 b=KSAo2uksGIm/+/BS8fjSyT+6mi+LRF2bl6GllAefMrpSwVVulFaiF5Qh5JwSjHsRXFQF/0C8X
 JOy9miznMoGB8qCL+OMaXK0deqERRAc76ov+tdX6Ihv+2jk92C4Abk6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 349219330314e3421a6bb26ad5cf39a679a5cb7a..47d213e20cab1dd1e19528674a95edea00f4bb30 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -2,6 +2,7 @@
 
 #include <linux/aperture.h>
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/minmax.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
@@ -225,6 +226,10 @@ struct simpledrm_device {
 	struct device **pwr_dom_devs;
 	struct device_link **pwr_dom_links;
 #endif
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+	unsigned int icc_count;
+	struct icc_path **icc_paths;
+#endif
 
 	/* modesetting */
 	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
@@ -547,6 +552,81 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+/*
+ * Generic interconnect path handling code.
+ */
+static void simpledrm_device_detach_icc(void *res)
+{
+	struct simpledrm_device *sdev = res;
+	int i;
+
+	for (i = sdev->icc_count - 1; i >= 0; i--) {
+		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
+			icc_put(sdev->icc_paths[i]);
+	}
+}
+
+static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
+{
+	struct device *dev = sdev->sysfb.dev.dev;
+	int ret, count, i;
+
+	count = of_count_phandle_with_args(dev->of_node, "interconnects",
+							 "#interconnect-cells");
+	if (count < 0)
+		return 0;
+
+	/* An interconnect path consists of two elements */
+	if (count % 2) {
+		drm_err(&sdev->sysfb.dev,
+			"invalid interconnects value\n");
+		return -EINVAL;
+	}
+	sdev->icc_count = count / 2;
+
+	sdev->icc_paths = devm_kcalloc(dev, sdev->icc_count,
+					       sizeof(*sdev->icc_paths),
+					       GFP_KERNEL);
+	if (!sdev->icc_paths)
+		return -ENOMEM;
+
+	for (i = 0; i < sdev->icc_count; i++) {
+		sdev->icc_paths[i] = of_icc_get_by_index(dev, i);
+		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
+			ret = PTR_ERR(sdev->icc_paths[i]);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			drm_err(&sdev->sysfb.dev, "failed to get interconnect path %u: %d\n",
+				i, ret);
+			continue;
+		}
+
+		ret = icc_set_bw(sdev->icc_paths[i], 0, UINT_MAX);
+		if (ret) {
+			drm_err(&sdev->sysfb.dev, "failed to set interconnect bandwidth %u: %d\n",
+				i, ret);
+			continue;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, simpledrm_device_detach_icc, sdev);
+
+err:
+	while (i) {
+		--i;
+		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
+			icc_put(sdev->icc_paths[i]);
+	}
+	return ret;
+}
+#else
+static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  * Modesetting
  */
@@ -633,6 +713,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 	ret = simpledrm_device_attach_genpd(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_attach_icc(sdev);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.0

