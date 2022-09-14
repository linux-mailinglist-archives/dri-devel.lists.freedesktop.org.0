Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C15B8DEF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 19:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803410E00E;
	Wed, 14 Sep 2022 17:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF5710E00E;
 Wed, 14 Sep 2022 17:15:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r66-20020a1c4445000000b003b494ffc00bso3468544wma.0; 
 Wed, 14 Sep 2022 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=MUUM7KwzU+2KZkzhKF9P1/j81tXXvszfc0LUASC7ZGA=;
 b=bRGqzBulJ+h3aIK0GSYu1WGuD5E1GKrDaNVoqbN9x6qq2eM6+4zcGuC3IqvXqCsmPp
 AtaoY84k3Ba73psWci1jKHZi4UD4ctih2nShAjtbpBzh37b3J3S2F/KWUwlM2374Au4g
 lWValPIYyouOXq0gAzbd4QfdJ5DgZjShNZKtccpQzNXKrvk00h5OmDW0+S0gVgTwKvxB
 6UBpM+Rnm4BjYMl28L2qBzq3PB4XZ7SxSMPyMo5nzU/ZgTk/EHqJ3WO/Yj75gbm7sNaz
 4+b1lL7DBdAQTon+NMFP5Tu82E+FXIoq0oR8oW3s0mo6dYKluDTtxTsduHZTd9NuwN6K
 w3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=MUUM7KwzU+2KZkzhKF9P1/j81tXXvszfc0LUASC7ZGA=;
 b=xBZ+j/qeEX+YSsyVd47NO9Fpa6wcZuB1Mt78A5v9l0qEXsKUfhAcdZVaez/g+q0paf
 c34ecauw0RyDlj6Xc1p7qC0XGIfTBtiZn2U1DdjwR5tqgmhxlRhq5Vof+ncj3kTNCot9
 B82SKoBZSC25d11T53Dg6kfxeRICWfGv95ABeD36zv7rWQKDRCiqpAQ4YJ+elkd4Ydba
 O+7XQ/rZuZYfCA7KRYwd3pOY78djlpouOOUq9eZ+4PszFVRrTn31D5Bk95wGAIumVkfv
 8eYDGi0WAZ+OUraacJmc26HB9e+8eNJEslS4WaUantXwVH012IaxEut7KMo4cyfxqj4g
 Y8gQ==
X-Gm-Message-State: ACgBeo1GC7C1Jbwlff8yBO5E5e+YpjcljnvNUGue4+/3ESyHPOd80YTc
 RKhZHdWGKU5AXClrxqqCmHM=
X-Google-Smtp-Source: AA6agR6Rc0CCCWkOiOfheIsc8ANCtg+0ygZPaJ3PLf9IFqpYv7zMPhIFVAi0bPlzLhkr2GM/6vsOOw==
X-Received: by 2002:a05:600c:1546:b0:3a6:a99:aa7 with SMTP id
 f6-20020a05600c154600b003a60a990aa7mr3738358wmg.109.1663175707237; 
 Wed, 14 Sep 2022 10:15:07 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 bv7-20020a0560001f0700b0022a53fe201fsm11769459wrb.68.2022.09.14.10.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 10:15:06 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdkfd: Fix spelling mistake "detroyed" ->
 "destroyed"
Date: Wed, 14 Sep 2022 18:15:05 +0100
Message-Id: <20220914171505.54154-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a pr_debug message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7522bf2d2f57..c70c026c9a93 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -898,7 +898,7 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 	if (!mmget_not_zero(svm_bo->eviction_fence->mm)) {
-		pr_debug("addr 0x%lx of process mm is detroyed\n", addr);
+		pr_debug("addr 0x%lx of process mm is destroyed\n", addr);
 		return VM_FAULT_SIGBUS;
 	}
 
-- 
2.37.1

