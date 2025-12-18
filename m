Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59E5CCABA4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 08:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986D010E394;
	Thu, 18 Dec 2025 07:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ypId9kNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3310E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 07:48:27 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso111845f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 23:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766044106; x=1766648906; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e7ZE95SplxYAa2I5rD6vCrU8ZZMgFLy87k6hNcutigw=;
 b=ypId9kNF71gYkySAUMURR5RZLwPhllozPxq9PLis2Qmag3LO965gd3XXRLBDmUFIiO
 nvcw8Y8CdB8kjGH0NdRv5LMEyzenbfPndMyjv79D8KOpDWeMkYWf/K7jXbOnZV820j9p
 /4WzrucLPprm8dsjvSEXpe8chMXormW+teqt5nA29Dy5d78K/GlEHeO/eTt3FGliaVbV
 k8BMBOyouFIt48C0Bl+hSkfsdSbwgijVrMHY82FZxuwNVs/6tP8iNtj8cdeZ7n/P1Pgt
 yQRDS5XAsVTItMreBNMR75NgQbJCezgc7Fb1ukxRqu9f8wU+PY7l4b0/CsbvFCQwA11X
 rrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766044106; x=1766648906;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e7ZE95SplxYAa2I5rD6vCrU8ZZMgFLy87k6hNcutigw=;
 b=eoGG97u44F3lK346zq+PUkDmEgV2VZCbNaGq+rtIcpNrxKqIju04VArYv87jXL8v9K
 yLNeK6j7sxPxs8C/x+ItFFFi3ZvNgANarr7p0sYUQTlSmIuPZNscwFTD1lmIz7CCC57K
 Q0dFAFwx7b978lxPijkPIEoE/8tVrZN3GNZDAGJLmmlaBBiWcr3X3zUa1i6eJeX2dia+
 c2IyrpOukePg0ovZU43GZWeVpfKD49zicerZhiLgWkCjY+bNmFTQoD9DQLUpLI6JRjUv
 7YSWTQcqpOy6IPMX3RngCWP2MPgpZ8oiS2nmdR7j/dcu3d8kWeMD6B3uW6uOIuAVSYzU
 Tffw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3mOG05W2qAofc2NRigIPRxLFhXInFYQszZvFX71f2OB23qqp6FN3MdrJIboRrOK6BlCI8HgZsEW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKx19hOC3/zKdtjPxGpPRaUqHCfUYoCehnCM3iUk5Bke7LfRBC
 V1ir4MiyM44Grg+YhYG/PtN36+qLLVTfO1JrGYoSnOk+XqGWxOMZArrBA4q49MPID2s=
X-Gm-Gg: AY/fxX5+W9HMBKIGSeCoLb30jv9YPa20asgHdATjERG6ei6qeogU1zIRITxMk3hhYKt
 6KnVmDs6WoN86UMOteIHteelaR9vgan+oxbNk1pFAhfHwsuj6QD8FQw1BQ+JYlgxe5+Y2fgyQQY
 7qBjGaVkFUw/A4PHWPSgfaXlvYs2XltGncUPXuWvSlm429fzpaa5J1M19nKMCMPgdgwr3jczZbi
 jCkquAW2OhFf0DhA6aH/FGqeziyel3gDNdGH5oh4AaJC7k/j+7pHlcHkugWAfLpYPDPikKA2A6G
 bD/8Eo98DydnSGLFiegzvCHGmLdrLMm3wumEpS7bKUy/N5JzCjxHBzOGzgwESKJ16ybEJDqofQD
 /vetS5J4hWS5bb7OCZJhM4cZCuknqQHac7ixf6SpX88jEuq3ctgDAtzX2oeISLc4CVE77AGJbZO
 3gXy1mcKsbwPL2YxA8
X-Google-Smtp-Source: AGHT+IGTaiX6+GWVlWWsGKoSnaaCVhAOGUzRDquHUgw/uNubRmsnDIifoVO+9W063s/iHJmhvllI/A==
X-Received: by 2002:a5d:5d09:0:b0:42b:2a09:2e59 with SMTP id
 ffacd0b85a97d-42fb42d8644mr20214681f8f.0.1766044105681; 
 Wed, 17 Dec 2025 23:48:25 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432449346c9sm3359309f8f.5.2025.12.17.23.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 23:48:25 -0800 (PST)
Date: Thu, 18 Dec 2025 10:48:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panthor: unlock on error in panthor_ioctl_bo_create()
Message-ID: <aUOxxvXXtHHfFCcg@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Call drm_dev_exit() before returning -EINVAL.

Fixes: cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 98d4e8d867ed..165dddfde6ca 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -923,8 +923,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 	}
 
 	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
-	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
-		return -EINVAL;
+	    (args->flags & DRM_PANTHOR_BO_WB_MMAP)) {
+		ret = -EINVAL;
+		goto out_dev_exit;
+	}
 
 	if (args->exclusive_vm_id) {
 		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
-- 
2.51.0

