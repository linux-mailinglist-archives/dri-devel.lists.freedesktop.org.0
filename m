Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A84A9197C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6ED10EA80;
	Thu, 17 Apr 2025 10:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NfQlLStz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB6910EA80
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:35:07 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so779544b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744886107; x=1745490907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V5alxNm/DLkzjQ9ZfukVKFr2c1g7/WejA+wG2G/ssrc=;
 b=NfQlLStzM/M0P0SYhXR9j7r98C4+n7voYJ+WLQbCixv4Kg0chqzbRI4SnRO4ObHvGp
 +0ysrP8RKYLB+/8c6nivHV4TszUvVSsdnS+Z545tSXkIbDgePuH6VEOWvDZMYvQEQsPz
 Bbhd/I9gKU9f17N5V9Dzi+sB8ti73DMNFkHINPbtz2phTJvG/T3Yhmm1fc8nKoVc4QVd
 ctYXtvFaacsUUs75yIBcNmQgCHGw/rdpVhFEK6XCNyjtL3EmUoQ3n3bOrY+RQVodR9rD
 mElrpltvsDuyGfTY+kOVDzBx/RNzTXs8pW6lOE6xtkycDR1AqrIHXjfJS8w3Nrz+5/m7
 3Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744886107; x=1745490907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V5alxNm/DLkzjQ9ZfukVKFr2c1g7/WejA+wG2G/ssrc=;
 b=N3zXEWt5imTAz3bR2Etnv4psztN+OZRzepGl04BPr9oXbGKNY00oQWfHRIBVoNDoJS
 a6ik/cVckimQa8Gmm70XRGdttuHaVTUt4IJwT/7rtgIX1KkGBqfO8p5aBMSOStgqLVu4
 BszJsrs+EOCQ/DvYIRfejKyLJRXd4e2rEgSlVDcNdUi+w2oZYwSjTTQMkkQciOBPdnHG
 AfInOZjJwEhfZRRAefNmCa85qnjtG0Ej+i4VmJAuOngrX4h9pGa7KzYbRT4aBX9RK+5J
 7vevPCOeifSoU3mHl696VQAqKviVXQLLToJe4BPQf7vdbKhdOzh1k5kLRlQS/2tVCA6r
 drqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI4d2419ivao1RAwsY/ZhhAePghEP7sSjTjDzq1lq6PH5u0oiKMkWBWvHri6CtcPPeRsLYnDDjUvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3IbVIjpIPw/KpDrzIiu1+j/L1iiqmtx4N7qanLuy/Fi2pByne
 lc5xpaSZi5ZOoQlZROka2x3BMv+EVx7Bt1/hb/QuC6MD8/TxB6gp
X-Gm-Gg: ASbGnctEpQ0gjJqQu83QSAdfr3TV/+ViCLHJ9pfP5SIkMIYhNse43m7tOq0VNVg9cV6
 yM7gqWz3dgyr7fP8kQ2S/anZUEJY2Vxn9meZdbsllGWW84F+hW/6H9f2vxdyzqI/MsuVKf/v2fn
 XCsSNByZ3ir3NhZbdz0BB++FGal7y4e6MUdA+q5xxgaVB8UM8/YFsOl04nNV8NCG2s/EDKz8j8T
 kYSxNbKTaYMUGMe7UOpa+4Dfk+ThraQbw2Ho6Kb/Lp5o1rBKgD+jlQgV7GUMoDeWewX5eZye3Mn
 kS835zy9bQTXoWjPuOTX6RuzOX28oq45oGX83cmsJ4jq3BFnnnO9nKA=
X-Google-Smtp-Source: AGHT+IG46dsdwMApeeROd0P8FHUNsfcsg7uqz2ZNUbeyxe7v6pPDAr+96aBvmoyqg4xi9S2Y2pJ/BQ==
X-Received: by 2002:a05:6a00:2442:b0:736:ab21:8a69 with SMTP id
 d2e1a72fcca58-73c264c576emr7125034b3a.0.1744886106678; 
 Thu, 17 Apr 2025 03:35:06 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:579d:5312:b7a3:7e17])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0b22202ae2sm2681585a12.61.2025.04.17.03.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:35:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: simona@ffwll.ch
Cc: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 noralf@tronnes.org, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/tiny: panel-mipi-dbi: Use
 drm_client_setup_with_fourcc()
Date: Thu, 17 Apr 2025 07:34:58 -0300
Message-Id: <20250417103458.2496790-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Since commit 559358282e5b ("drm/fb-helper: Don't use the preferred depth
for the BPP default"), RGB565 displays such as the CFAF240320X no longer
render correctly: colors are distorted and the content is shown twice
horizontally.

This regression is due to the fbdev emulation layer defaulting to 32 bits
per pixel, whereas the display expects 16 bpp (RGB565). As a result, the
framebuffer data is incorrectly interpreted by the panel.

Fix the issue by calling drm_client_setup_with_fourcc() with a format
explicitly selected based on the display's bits-per-pixel value. For 16
bpp, use DRM_FORMAT_RGB565; for other values, fall back to the previous
behavior. This ensures that the allocated framebuffer format matches the
hardware expectations, avoiding color and layout corruption.

Tested on a CFAF240320X display with an RGB565 configuration, confirming
correct colors and layout after applying this patch.

Cc: stable@vger.kernel.org
Fixes: 559358282e5b ("drm/fb-helper: Don't use the preferred depth for the BPP default")
Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
Changes since v1:
- Improved the commit log.
- Added Thomas' Reviewed-by tag.
- Added more maintainers on Cc as panel-mipi-dbi.c has been marked as orphan.

 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 0460ecaef4bd..23914a9f7fd3 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -390,7 +390,10 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_client_setup(drm, NULL);
+	if (bpp == 16)
+		drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
+	else
+		drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB888);
 
 	return 0;
 }
-- 
2.34.1

