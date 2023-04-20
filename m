Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE276E874D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBA710E7F2;
	Thu, 20 Apr 2023 01:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092910E7E8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:14:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a10so1034887ljr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953296; x=1684545296;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2pjPggDwV+63wJc3gh5cASauH2FrG6WvSuw6/4vWXZk=;
 b=KARctsjb+Uom7cLN02eTYZmsdVBgGiMpxh4JAawF6BPkXh+w7FtS/Au39d2sSl0iAp
 qPdLpggmmbBHGpMz6s79jMMBsTS4sv5i/+8ewn6f7O30v+btVBnoLQxFhwF2FcdJlgwJ
 WseVJ5kP5JTwUS+JQIOmuW2wRsXT7vrIuYmIGqQpg74L/TnpBXXBqye+rxgD+KZMBBi1
 q431CNebUVHuGz0ybcUIqtE5SxKceoyOvnYw5zXt6ux/azcsfUozuQNkldvCjT96ABQl
 kdd+WXU3GfuklIVX9M8z+QHGt3WzPo+qJtudgce3HV1Ht4rsTmS5QUGxv9SdUEOyrloH
 Bdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953296; x=1684545296;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2pjPggDwV+63wJc3gh5cASauH2FrG6WvSuw6/4vWXZk=;
 b=cF7LHz/Np09pwbT51pCdZPz/Mrjjcpe8mjLB7NmS03fpmXVxxOU9y4jYv+TxHJwIWP
 FDe0kZ02RZzpIV+fTrKyrFZyVi9mYo3n4xB26lOnXa6zTLShb8waL6an7xcdlFpSYW/s
 lhEZm4SG8ENV+C6TNbTrwH1gGl8l1aJatnOkXwu+saxYTzcwk5Y58tRHo15V/YWW5ibi
 QU2jyAhGj1xtTrFHal/183eaysojA0v1dEiq9ihpMNJmmvJvs+XZWDXYmvHe6I+5f4OE
 9QvvOEoAfVfa/qGIBw1ykYsS1hcodXZuAj1sPoK8KiudeSB37tyfx+YFBSIJtp9CqV0w
 KqRw==
X-Gm-Message-State: AAQBX9d2s+/eidmzV5fx2q05bs+A6LoOyFpq0zZIhHq7FHLkD8lofEXf
 DuUdAdgOv+cXWneohXgHOW+igQ==
X-Google-Smtp-Source: AKy350aHSdiCakiatcUlh9SQx/aSM/u9dQY9zoHmDOU05vWYsC/6+iItfVB+iAgcO/hbVK9945emIg==
X-Received: by 2002:a2e:9a95:0:b0:2a8:aadc:f162 with SMTP id
 p21-20020a2e9a95000000b002a8aadcf162mr2506673lji.51.1681953296417; 
 Wed, 19 Apr 2023 18:14:56 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a2e2419000000b002a8dce82cf6sm28853ljk.32.2023.04.19.18.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 18:14:56 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] DPU1 GC1.8 wiring-up
Date: Thu, 20 Apr 2023 03:14:53 +0200
Message-Id: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2SQGQC/x2NWwqDMBAAryL77UKMr9arSCl5rLogMSRVCuLdX
 fycgWFOyJSYMgzFCYkOzrwFgaoswC0mzITshUErXatGK/xtkR36uH9nh91bVVPf9t3LW5DEmkx
 okwlukSjs6yoyJpr4/zzGz3XdvYT8T3MAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681953295; l=1362;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pRHWMRjt/n9zLCczjy/Yn/VbOiBgkQ1FtQZWTc9Q9rU=;
 b=JJ6i5qpF1MvRqD4DAygLVZUDtlpMNWpPh9eMvOEZe+8x04Wtsqq7pdDXh7F7vxVR2O7WsS1fScsC
 xwAzpJkqCZ/+gAiDEimRKnfQG7CuG6aVE522+WRSzEaNoA4nw444
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
dspp sub-block in addition to PCCv4. The other block differ a bit
more, but none of them are supported upstream.

This series adds configures the GCv1.8 on all the relevant SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
      drm/msm/dpu1: Enable GCv1.8 on many SoCs

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  4 +++-
 9 files changed, 55 insertions(+), 53 deletions(-)
---
base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
change-id: 20230420-topic-dpu_gc-6901f75768db

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

