Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05C5AA95C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C390310E7A1;
	Fri,  2 Sep 2022 08:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB610E7A1;
 Fri,  2 Sep 2022 08:04:08 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u1-20020a17090a410100b001fff314d14fso1399930pjf.5; 
 Fri, 02 Sep 2022 01:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=xoQDghImqhS/6zj7SGq6Ohv76jgSNxfDTje/23luiDU=;
 b=NnS+8SedQ4bz6H/oZQ1r2rl1gOu8h2hljraTclYGG0SXW4GsDCNk2TJNSSffzRM1zx
 Yccpx43h5qtuL3gBQptoagxx1lNxQMdML75CvVHkf6ZEwq8cYcSgNWnGNSFLBczwd5Ga
 ztKJ5126sthQ4MOk67HUBHslAqxzIB1Ig2yJd7BDiqJ38IfPilF69EPUl6evMArGMR8F
 j5pKdcvmBFKHF/BhoU7iGtc+QAKR8mAn/j6UXYRJN4bCA+/8S9EAh/IndwCg1LRG+iPO
 bq8qrbdsEwxOmMQmaLqUg3eqGQbM3oMbaKNrS72frXo+MD5iQIsd+f8mzYkYq/kdMUry
 IWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=xoQDghImqhS/6zj7SGq6Ohv76jgSNxfDTje/23luiDU=;
 b=t6p0W93Hwls4B+LFvHeg205hjx6jZv96DQxOM87C0aWr9C0fh2itJ8c26SImhATDBD
 XfTCbDBbm1yAhLPBbfAlPrsBMKy2UmIjkqV57Q/h4fKKbisU5X6qOD+AAXCpnr2eCcK4
 ey00WK1CNLWeDCMR4BMKfTgBJfEoDLrAI70C6T6VzufecrlElUVFR2QU7FBHVwAWzwiF
 mTb0G8mDfF1CdqPEv3FdwEQiL7vwBcxYf/ltS+lz4QEEEdUFGG945nHiXAYuTbfbvdGD
 gjZP7FbqX+FUS0rmyM09f2os12JDQXx3x52cDm3X2n9pbATO0igN6C4d6gPqTmb9Dp2y
 10cQ==
X-Gm-Message-State: ACgBeo3fS2lFAh7cO88kqcsHFoTfl4giMGwbqgR0g/M9FGBxksrPd4lF
 GXEZkUWXrMvfNxCEHHt0Q3w=
X-Google-Smtp-Source: AA6agR5s2iXThen35iy1rvWxabUcM2CsCsvtmeSug61sb89oguI2Y19eHb4TmPs1cyoyuERCO1hycg==
X-Received: by 2002:a17:90a:174a:b0:1fd:f273:de03 with SMTP id
 10-20020a17090a174a00b001fdf273de03mr3546160pjm.188.1662105847930; 
 Fri, 02 Sep 2022 01:04:07 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 c201-20020a624ed2000000b00535bf24008asm975545pfb.207.2022.09.02.01.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 01:04:07 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: zhang.songyi@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH linux-next] drm/amdgpu: Remove the unneeded result variable
Date: Fri,  2 Sep 2022 08:04:01 +0000
Message-Id: <20220902080401.320050-1-zhang.songyi@zte.com.cn>
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
Cc: Jack.Xiao@amd.com, airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, ray.huang@amd.com, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, Likun.Gao@amd.com, zhang.songyi@zte.com.cn,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhang songyi <zhang.songyi@zte.com.cn>

Return the sdma_v6_0_start() directly instead of storing it in another
redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 2bc1407e885e..2cc2d851b4eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1373,12 +1373,9 @@ static int sdma_v6_0_sw_fini(void *handle)
 
 static int sdma_v6_0_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = sdma_v6_0_start(adev);
-
-	return r;
+	return sdma_v6_0_start(adev);
 }
 
 static int sdma_v6_0_hw_fini(void *handle)
-- 
2.25.1


