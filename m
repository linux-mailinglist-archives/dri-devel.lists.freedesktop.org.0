Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF17793D6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D63110E6AC;
	Fri, 11 Aug 2023 16:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9546B10E6AB;
 Fri, 11 Aug 2023 16:05:12 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso18907275ad.3; 
 Fri, 11 Aug 2023 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691769911; x=1692374711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZRMmH5v/BxY4ax8oeXvl1jWy77Sd8S2/awGfYcHbs8=;
 b=GJDMPCHFPULCocVk+R3xk7keeGDRvu06pOGCvVMjSbu8Kw9nnq63erYCOvZFYAWPlD
 WNg42PS21/FFwxvdwKtbv5GOf6PXH7K5PS7FyenLew/86kHLK4M28fvXYhzwJJpdHFMn
 S5pvK5VnHIv+96UI2jf8lVuyerbdY5LORdZy+VYqORYkQGJZrHt7thOwwMZWHB+MOmk3
 7kwAW8abFxjMm5qgmiqJmt4YnjHBWUdnYlg8Fdh1tDYIyBZtlRD+CU3mzkg5WGkbwoXC
 9UrH66Da4SlXXwXWOiLAMq+01u34d+mTOWYV97gy+iFWmn9wl8TFyy+BSzY7MIttRAP/
 KGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691769911; x=1692374711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZRMmH5v/BxY4ax8oeXvl1jWy77Sd8S2/awGfYcHbs8=;
 b=Ipb18Zk8h3qVdhXndht+fhhZssJ2lMG6YX/qqWxsi1tFQ6nxDlnzOz8+hF0YJ5z2eq
 zuxklv6OMVEKjJy+oLsCgsNQwyJ5s/+Ur++bit33CSl2xqQV4H1YTGzCeKuajYavLmo/
 3EAVTNsUKC5ahuFvW05FHOIzajug+4ERm1eDmOcrNDIDqSiq8MGrvYILezslzu55CpJV
 qkHnZ4PxSbIPSa47IOJ0dUjSUMD7IpsGvZwUV6D7IIG9hWwHCFMm5G1YP2nDYuAPZDis
 pHteZpl7lsbQiabECSrHBirfP3FYtAZmfEPtIODMTS2yK0s5buCM+T8hMl3sy82kh+Mn
 I7vQ==
X-Gm-Message-State: AOJu0YxAs5dZoHgWuKcg8MOIbDKXPtmPpeeLhfjLNc3r7abiM7tJbU6P
 YZhkJZ8lsXU5XpjCeOgnwjWEvPk41Ys=
X-Google-Smtp-Source: AGHT+IGAXs29hkurPfxRsosPHD9dA5tnRT8kdv9dJQhVbh1vnorPPHLqbLtmGuzzWKlU7fmXj1LrnQ==
X-Received: by 2002:a17:902:ecc6:b0:1b8:1335:b775 with SMTP id
 a6-20020a170902ecc600b001b81335b775mr3280309plh.0.1691769911361; 
 Fri, 11 Aug 2023 09:05:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 iw12-20020a170903044c00b001bb9d6b1baasm4089085plb.198.2023.08.11.09.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 09:05:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a690: Switch to a660_gmu.bin
Date: Fri, 11 Aug 2023 09:05:03 -0700
Message-ID: <20230811160505.174574-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

There isn't actually a a690_gmu.bin.  But it appears that the normal
a660_gmu.bin works fine.  Normally all the devices within a sub-
generation (or "family") will use the same fw, and a690 is in the a660
family.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 1ed270dae148..756a9cfe1cbf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -478,7 +478,7 @@ static const struct adreno_info gpulist[] = {
 		.family = ADRENO_6XX_GEN4,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
-			[ADRENO_FW_GMU] = "a690_gmu.bin",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-- 
2.41.0

