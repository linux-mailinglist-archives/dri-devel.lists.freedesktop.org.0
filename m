Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0ED9B82B0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4157E10E424;
	Thu, 31 Oct 2024 18:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIdX0BYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A0A10E424
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:38:41 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37ec4e349f4so774525f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730399920; x=1731004720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27kCo1mR4iJmRM3zJrNqpDvOFiT8VVKtUlW/1QgXgq0=;
 b=lIdX0BYcRoliuauOHNgWOnklKULLwAIJVrGa31RLPZ6ujvCBNzp0TVNdDfjY5p0kHX
 a+16WrzlcoyxFO8cc11ZCLhh1/IwkNROR1amWU2w5pTvg+v6R4bEzwcQB3UJ378pCE6A
 fyXmiwlgyAxp7/jfh8EDvUzeHM/mff4pl6WE4zOl5CoyS1v+HAv4IyuGqSP3leqPLvVT
 4dkuUOYcgvdrNLB92dLUkX41VGP7sVUKRKNOHnbVU2DH6X988s3VYBW4BS34POKgcL3+
 4ZmcymOyU9yvPwBSBmUdedDhb3jq8AzRqrVFsHBKuYdM2HMF8Jnr4hMlW3TT2Rhildcj
 PYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730399920; x=1731004720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27kCo1mR4iJmRM3zJrNqpDvOFiT8VVKtUlW/1QgXgq0=;
 b=k/U66k6DwpA2RERFp+l7F5RXx8/9CmMi0Zh+H4sGmvhBCIgUQLgVERb2OXqRNNYLBm
 CGay6jT31gGxkx4W51RCsRiHahrIhruH0+lNV5pqnZYujjc47a/7fBgoKECqkxhkMx9/
 6s/MzHnjbgqfcy8kzYFmR4YnNzBTyl+e2OPCTWbu6NBVMteqDGBxQM/fyE9TE8oLd4BB
 FsNBs37E/ug6KQ+2UhxBE9yZBH+SJPW7CASDzzVa6pilAdM4hW1DEzW/bTM5/2DRoEkM
 B60QiJlKFULEIyLCQUqIDRcpSuOGyawjrKuHwRsQf4NQRhc24L0W1GkxE9KsEbXc04WV
 NCeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmSh1z5ujSb1Ud6gtOpbtvarl2dgImq1CtsrUVX20CC3cz24xl157z04fvZgePg/TczkcHDqQgPIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8SGHOGRL/3rOqjmBsuWOqszosZtmD9GAtm7sWEa5n/MG+AXJk
 qrRr2v1PXiQ9ih0nkkcQGjfjKmS24xUfe2XMi9K+HFEriN28FlPI
X-Google-Smtp-Source: AGHT+IFiaoyewmrju5yI7tATCE5NVdZwpDz1t6VbsmauInkDV3+XBSdCXBMl4Glx/g5ldfJR3Ucf2Q==
X-Received: by 2002:a5d:59a7:0:b0:37d:46fa:d1d3 with SMTP id
 ffacd0b85a97d-381c7a6d60emr737043f8f.34.1730399919476; 
 Thu, 31 Oct 2024 11:38:39 -0700 (PDT)
Received: from fedora.. ([94.73.38.214]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c1185b4bsm2864049f8f.112.2024.10.31.11.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 11:38:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/vkms: Drop unnecessary call to drm_crtc_cleanup()
Date: Thu, 31 Oct 2024 19:38:35 +0100
Message-ID: <20241031183835.3633-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

CRTC creation uses drmm_crtc_init_with_planes(), which automatically
handles cleanup. However, an unnecessary call to drm_crtc_cleanup() is
still present in the vkms_output_init() error path.

Fixes: 99cc528ebe92 ("drm/vkms: Use drmm_crtc_init_with_planes()")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 0a5a185aa0b0..25a99fde126c 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
-		goto err_connector;
+		return ret;
 	}
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
@@ -131,8 +131,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 err_encoder:
 	drm_connector_cleanup(connector);
 
-err_connector:
-	drm_crtc_cleanup(crtc);
-
 	return ret;
 }
-- 
2.47.0

