Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9EB63523A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D6310E504;
	Wed, 23 Nov 2022 08:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61E10E4F8;
 Wed, 23 Nov 2022 07:44:53 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id p12so15923358plq.4;
 Tue, 22 Nov 2022 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DkNCuvzVKZTIBNAMLhyXJqvNV8XoAxmEaDHLKjpaxZk=;
 b=GIZt1ORBmaG7n9RolwWkJ49wmMDAqSAEdkZa8bbfIDHYwD7sXZ5/XEVMkrDHclYtz2
 hhoMoHNj7Y+Mmh577ISuaMfObcYKtff0K5UFEBv1HUMsUl4g8q4atXrN4jWDmw4GrQZk
 m8p8q+ZvAWyb3GLIY1EMqlGI5EvucKfaalL/3RVjz4mcJzzKdqUwKrALJl69n4Rpi9bW
 VY54dSqKoGj6mF9EzI0t6Wo6GK64PWy2CCKzTH8n1VVRJGoNoSq76mKwj4h1ptCcfhjn
 H4ZSYewVbLviJZWghcZqHwaGu8e3L1DJDj8eyHHQtEBRFXvJeFPsg+C23QdYTOGIqK1z
 Fx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DkNCuvzVKZTIBNAMLhyXJqvNV8XoAxmEaDHLKjpaxZk=;
 b=cWZxJ8EZlSUvWIPYlxYSrAsmZVPkbW1VZ8BJdH4PdNMJzDhXaad+uksRRJh6fdGnQ7
 EggBKYJZxlUXX9K4m7Kv4nsnmmyr/zT4OrKC5taH3orCpLBcVSqK04HqCCr3MNcv+cLF
 Vl4RgZyemdOA6e9ocvVnt8jr31yKiV0TIwDNLMab/dzrGcgo8XkrOLRyHjfSY2mGw5rG
 BRz3qIHPJIsT8jCVVBWYWScFBq55ch3CWvLB68wwNqq8GLQGl2YqBPM97U3E0X2goYe8
 lcmQH7g7+uiJpZ1S0850vKzQYLJReDiKhqq6CBcCDVO4tHR3FU5+jNR2668WOvn9m/4F
 VEsQ==
X-Gm-Message-State: ANoB5pnW8rkqtrfHjTvJf/nVZXB8cch+p1rsQvQbP1pjxI6LiBedHVKD
 Rg0VCKTh5WAi2VyoHOMXsNc=
X-Google-Smtp-Source: AA0mqf4ueg2nmqyofxlnFvFtstNwE5iLMoeyWgBN/2X4G08aj/OkYsyL4cJ3tIrLa+4UEKHwNu+I8Q==
X-Received: by 2002:a17:902:b691:b0:17e:3f0f:5ad0 with SMTP id
 c17-20020a170902b69100b0017e3f0f5ad0mr12056528pls.162.1669189493415; 
 Tue, 22 Nov 2022 23:44:53 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.9])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a170902714300b00188f07c9eedsm13290823plm.176.2022.11.22.23.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 23:44:52 -0800 (PST)
From: zys.zljxml@gmail.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: remove redundant NULL check
Date: Wed, 23 Nov 2022 15:44:37 +0800
Message-Id: <20221123074437.1841014-1-zys.zljxml@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Nov 2022 08:21:41 +0000
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
Cc: Yushan Zhou <katrinzhou@tencent.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yushan Zhou <katrinzhou@tencent.com>

release_firmware() checks whether firmware pointer is NULL.
Remove the redundant NULL check in psp_sw_fini().

Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 36 +++++++++++--------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index effa7df3ddbf..77b966ab5439 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -484,26 +484,22 @@ static int psp_sw_fini(void *handle)
 	struct psp_gfx_cmd_resp *cmd = psp->cmd;
 
 	psp_memory_training_fini(psp);
-	if (psp->sos_fw) {
-		release_firmware(psp->sos_fw);
-		psp->sos_fw = NULL;
-	}
-	if (psp->asd_fw) {
-		release_firmware(psp->asd_fw);
-		psp->asd_fw = NULL;
-	}
-	if (psp->ta_fw) {
-		release_firmware(psp->ta_fw);
-		psp->ta_fw = NULL;
-	}
-	if (psp->cap_fw) {
-		release_firmware(psp->cap_fw);
-		psp->cap_fw = NULL;
-	}
-	if (psp->toc_fw) {
-		release_firmware(psp->toc_fw);
-		psp->toc_fw = NULL;
-	}
+
+	release_firmware(psp->sos_fw);
+	psp->sos_fw = NULL;
+
+	release_firmware(psp->asd_fw);
+	psp->asd_fw = NULL;
+
+	release_firmware(psp->ta_fw);
+	psp->ta_fw = NULL;
+
+	release_firmware(psp->cap_fw);
+	psp->cap_fw = NULL;
+
+	release_firmware(psp->toc_fw);
+	psp->toc_fw = NULL;
+
 	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 0) ||
 	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7))
 		psp_sysfs_fini(adev);
-- 
2.27.0

