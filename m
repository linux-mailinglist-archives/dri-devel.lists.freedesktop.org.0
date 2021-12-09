Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB146EE55
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF92210E668;
	Thu,  9 Dec 2021 16:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBADF10E116;
 Thu,  9 Dec 2021 06:17:47 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso4005671pjl.3; 
 Wed, 08 Dec 2021 22:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ERNdknSdRVKl939EP+EZZR/PoW0Nj1vOL+LFqLPaFaE=;
 b=VnKZQdzGR1KwvVlbMhJ9w4yN5SAgf36Tsu/EQkyNyyDawfgQ9W+WbDf1o1BNf73lum
 LNDL0ZsH9/EqlAIF4Fno0CGooNpVWAJnpiEx/h4Ps2yE9uCrxI9wfG/Lk9U0XHtDZbSs
 7lpV5zElgJ16wRwhg6Bx9McSbWutm+HQ/EV7H2OlaVe8d0FJv51Mtvtylcg/gy6cq5EZ
 UCrvSfnuFJ23q+ZlJUbDbXF6sJGXVJTDI+jt4mkVgjJUvV9Rz9GXZ3+7dhS5vZXqbAaX
 4C/iBOy85IGRN/mtQhSfYjy4y1x5WLzd60NZGpmQDiFfHv1Kf4Qm0tDulOeOFurPk/Kg
 Eazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ERNdknSdRVKl939EP+EZZR/PoW0Nj1vOL+LFqLPaFaE=;
 b=DarKV38RzE7w+4uANNtYycLCCVBWDTvefFsEorcWRq3HOEnB6T8nAWlONpo3eGFMmm
 J78QBUcJTnweD2SqQ9znjDL5tE1VpAmgQA/rUyDR8jPxsRMaCSNtKHQjVW7rzmNVfiJa
 BQaIUz113cW0PdsG5oPx5+aB5Lm2auJcem7a8NmzparOXk57p2B5VBCtItoO3GLHEXjf
 tJEXGk5o778maw8I9B8PnkZ5aao5GUfexz4E3b22yJ7USK5Tfjp8P6sbgmncLjGskRVU
 CW+Uh/MB5DGaOImljPNz0Ff4f+giTkCagK79QAy6S/+h2/K8eDnivNvome6bNfiAh+iX
 goEA==
X-Gm-Message-State: AOAM533bS6bUIyryj3vUjp3DtW3M4oE705EVfkHWyCWPiaGT9ofNXK10
 tpEzo17gXgDAwlQm9wohBxEV5rIvHnc=
X-Google-Smtp-Source: ABdhPJxALjGW3u4AEFGEvQxsHH3WOQo5kRwErZMyqNAPO4fMR36Pgv0iMSHN7+mt1Z/nZUz0vkYO5A==
X-Received: by 2002:a17:902:6a8a:b0:143:905f:aec7 with SMTP id
 n10-20020a1709026a8a00b00143905faec7mr64773494plk.8.1639015108752; 
 Wed, 08 Dec 2021 17:58:28 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id m10sm3619593pgv.75.2021.12.08.17.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 17:58:28 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm:amdgpu:remove unneeded variable
Date: Thu,  9 Dec 2021 01:58:23 +0000
Message-Id: <20211209015823.409947-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: alex.sierra@amd.com, dri-devel@lists.freedesktop.org, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cm>, Oak.Zeng@amd.com, Xinhui.Pan@amd.com,
 rajneesh.bhardwaj@amd.com, chi.minghao@zte.com.cn,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Likun.Gao@amd.com,
 john.clements@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chiminghao <chi.minghao@zte.com.cn>

return value form directly instead of
taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c     | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c
index 5cf142e849bb..fb92f827eeb7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c
@@ -37,12 +37,9 @@
 long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	unsigned int nr = DRM_IOCTL_NR(cmd);
-	int ret;
 
 	if (nr < DRM_COMMAND_BASE)
 		return drm_compat_ioctl(filp, cmd, arg);
 
-	ret = amdgpu_drm_ioctl(filp, cmd, arg);
-
-	return ret;
+	return amdgpu_drm_ioctl(filp, cmd, arg);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index cb82404df534..269a7b04b7e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1742,7 +1742,7 @@ static int gmc_v9_0_hw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	bool value;
-	int r, i;
+	int i;
 
 	/* The sequence of these two function calls matters.*/
 	gmc_v9_0_init_golden_registers(adev);
@@ -1777,9 +1777,7 @@ static int gmc_v9_0_hw_init(void *handle)
 	if (adev->umc.funcs && adev->umc.funcs->init_registers)
 		adev->umc.funcs->init_registers(adev);
 
-	r = gmc_v9_0_gart_enable(adev);
-
-	return r;
+	return gmc_v9_0_gart_enable(adev);
 }
 
 /**
-- 
2.25.1

