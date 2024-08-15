Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE69542EB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660D10E5BA;
	Fri, 16 Aug 2024 07:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kX/W89ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9B610E4E7;
 Thu, 15 Aug 2024 18:27:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so1474192e87.1; 
 Thu, 15 Aug 2024 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746456; x=1724351256; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eDeRwV2Ek/u3WsfSOVcYKLDPmJx4mXCOUe+RX2CIgaA=;
 b=kX/W89uazLWMoRMnNKClRMVyMVKHv6hiFR0mfuGufqu9zaMaQjsrNUHwD5zZmU+QVO
 tx+r5g3GYlt/ld2w4OCDRbYxBy3+9iJdGOiazpZHmSwFLz0bSrHFFzGkgdOLq9xaaL4m
 ckk1vTo2du8CErTN5VeFJfp9ZVRJyZE8WJSLNw4cQTvfIPUsNl65fB2doA+JJn60Njst
 SfvVq6cCRWS7U06ZGZ2MXIcT8pNAEyffjxwcnRKKY9Hp9pXqVuSGUsbAUse+FrAP9N1o
 hKl4vtmLjzfphtEh4o6Tfgmvc2rCODhzsbsot74IhgQeOtD7ucGTskiTo2b2T+8wk4kv
 KfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746456; x=1724351256;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDeRwV2Ek/u3WsfSOVcYKLDPmJx4mXCOUe+RX2CIgaA=;
 b=e5yDAXZc0rsk2GGOi49smgLkev9U1FGfjeN7UzYAFrpxe6nxK8s8LGRif8the2hASJ
 2zRnJN0krvPaXM8BtOl98plVkSa4IAaO8pQKhUuMIozRHNWQytRT8Di3CAXsacGsIeYU
 76Sv06/zYRoGz4wlAw1f4ec7zgI13weaFoJwGUI6Rqbnu5AF5EcVnnsMaiGaqfIfaxy9
 w5l/MuuhKd8WJcEbqutC5ZISXFFeh3eF2ccVRibq1HlZU+UIa6AhtQ8vcb4JV44eepTx
 AivwMSQ1hcvCJbB1GFn04TMYv8Hd+Nhp+GBUN/n6Qv7NSdAZC69ZauEpXNx7yIxTQEhY
 eZMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4sJ3ypoKvVd+4wyAdAWI43SfInJRaeZuRu2ecde1QpmO1UMQUtWnO//XL4BZtn28C/UY6cua+gyGc@lists.freedesktop.org,
 AJvYcCXmAJiBI57S0LufmES38sHpBu751aP1TPdtoaxcMidbggCKO6mvY892n3sqsJlVGCWDwvBLoIWNtMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0O858APKOnqaQ29eCneQ13NFs9H+S/swFeqPNvl5sPUETdmEx
 oaKyl9QJcVgJewxnupmXDcC0sDrJieyaC4yDx2KGThnZLJYI1qWY
X-Google-Smtp-Source: AGHT+IE/pleE3fWtGlNcvdyFzC9AQ+6sLINiWW6BRFJveiUm4Fyav+aIWWLCA+PGt4J8+auruWaGQQ==
X-Received: by 2002:a05:6512:3d8f:b0:52c:c9bb:2ba4 with SMTP id
 2adb3069b0e04-5331c6db15bmr189065e87.46.1723746455626; 
 Thu, 15 Aug 2024 11:27:35 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:35 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH 0/7] Preemption support for A7XX
Date: Thu, 15 Aug 2024 20:26:10 +0200
Message-Id: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJIvmYC/x2MQQqAIBAAvxJ7bsHMyPpKdLDaag+VqEQQ/r2l4
 8DMvBApMEXoixcC3Rz5OgWqsoB5d+dGyIswaKWNslWDPhAdPomGrm0UJlxnos5ZY6a6A+nEWPn
 5n8OY8wd+ySwjYwAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2060;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=cRwN/x/kiyImoIrMMN+pY8aaRgOsi9x3TvEygQRibF4=;
 b=QUSsONzmPFUjFZRdDJx4QCCkCC6gVtRN6Ob110oWVt/N3lvDxOq5kPfsqhi7+YtSYcoLNZS2G
 7DUighCkJoJAwixUOEGuNHE9KsBFUIkIng1l+EHHuMXS0RISoj7FiGE
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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

This series implements preemption for A7XX targets, which allows the GPU to
switch to an higher priority ring when work is pushed to it, reducing latency
for high priority submissions.

This series enables L1 preemption with skip_save_restore which requires
the following userspace patches to function:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544

A flag is added to `msm_gem_submit` to only allow submissions from compatible
userspace to be preempted, therefore maintaining compatibility.

Some commits from this series are based on a previous series to enable
preemption on A6XX targets:

https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
Antonino Maniscalco (7):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm: Add submitqueue setup and close
      drm/msm: Add a `preempt_record_size` field
      drm/msm/A6xx: Implement preemption for A7XX targets
      drm/msm/A6xx: Add traces for preemption
      drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
      drm/msm/A6xx: Enable preemption for A7xx targets

 drivers/gpu/drm/msm/Makefile              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
 drivers/gpu/drm/msm/msm_gpu.h             |   7 +
 drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
 drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
 include/uapi/drm/msm_drm.h                |   5 +-
 11 files changed, 995 insertions(+), 16 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

