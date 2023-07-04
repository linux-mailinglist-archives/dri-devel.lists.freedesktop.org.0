Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CB7476D3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BC10E2FF;
	Tue,  4 Jul 2023 16:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B50B10E301;
 Tue,  4 Jul 2023 16:36:50 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-392116b8f31so4065661b6e.2; 
 Tue, 04 Jul 2023 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688488608; x=1691080608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wsDIOc3R7jPNwTF/e6mDLa85oKfSVIk5sf29NNlXYoo=;
 b=BNGhEo+uWE2gf6vcAtz9IUj1pNkWKnQ/9F72dBHhIdx5lmFGHct7rGrHWMJMrEidQE
 WixrlzXEOD2kSQrWV4ukAl68JI5CNYt59zH9oSxi/OySWJLvLG9L8Bvod+YhIeFUVO8q
 U+aS926WL2MznTIUSAjaG/+aBHvNuXkQOSjJ3i5pMGVqU9kUCyPGLnmKRyr4M795My8I
 ftgZVQ0jURW1323MrK2KzwJW+nJpeVofDL/78Y7m2oY4v2prYJt/ElLRTvwCkP8YGPZY
 3Usy/Wy0BPRPwGvdbOPc6c43vzXfBuzZ3LdXvb6SNyKh4udJBTDJK6p4jN1Ynn25AsBa
 yBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688488608; x=1691080608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsDIOc3R7jPNwTF/e6mDLa85oKfSVIk5sf29NNlXYoo=;
 b=jjuYUrPr/8g1+b21elZrpTsCiOfiRAP2wEz3xVxFSBvptVtqYke/cq5P93OyXS0Nyc
 dYA+wYhkBtM1UFtSELRByZ6TUgvo9yhSbAP7mxT2aztesZz45Atj0nodf22LDeRyUY3B
 oBr+yZRJSpo5UwpmTZHeLLpUoeZhYJRg6I2lxBLBM6vStE0jH009wst7x8zECi8E5vS7
 rIeZNdlmM8IrULVLrcrLYoJ8joa5qAOFwGnkgQT09y//uenDbetG47utFW0fpVFpQT+o
 Wp1NGG3NAzbQNo7QP/CbhWnme5WCj2NYZ9lxdr7BGySxv8G/4BffEm+B5pAZPbYMw1Td
 rVsQ==
X-Gm-Message-State: AC+VfDyLN3qLxdquHUzpk++PN2uX+SlanXQ1BYVCXFPmiYjm6v39I0Ua
 k+rpPnWvJnprByYW89HA40rpLrjDB/s=
X-Google-Smtp-Source: ACHHUZ5CifixBgOlH8+wBhSbr7oMIhcVC4UGtOJbSsbDi9p06FpbFUtR6PZoChSy3HyYsBG5FxRCNA==
X-Received: by 2002:a05:6808:1792:b0:3a3:69de:d385 with SMTP id
 bg18-20020a056808179200b003a369ded385mr18508474oib.6.1688488608703; 
 Tue, 04 Jul 2023 09:36:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 k23-20020aa792d7000000b00682ad247e5fsm1013081pfa.179.2023.07.04.09.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:36:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/a690: Remove revn and name
Date: Tue,  4 Jul 2023 09:36:40 -0700
Message-ID: <20230704163640.6162-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704163640.6162-1-robdclark@gmail.com>
References: <20230704163640.6162-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These fields are deprecated.  But any userspace new enough to support
a690 also knows how to identify the GPU based on chip-id.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..ce8d0b2475bf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -369,8 +369,6 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a640_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
-		.revn = 690,
-		.name = "A690",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a690_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ef1bcb6b624e..cf45007400c8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -310,7 +310,8 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 690);
+	/* The order of args is important here to handle ANY_ID correctly */
+	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
 };
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
-- 
2.41.0

