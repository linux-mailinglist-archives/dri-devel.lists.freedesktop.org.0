Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2686A0816
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B09F10EB69;
	Thu, 23 Feb 2023 12:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103010EB69
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:07:03 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b10so1820959ljr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kU1DhHqljkZnMyZ8L0mfvbfdXEv07yxf2+yc3rbwTBA=;
 b=PYQZM3L2LumSLyw8wcCvEpFKJeoS7thhe/+9xJHxQtEQ4+LobuF5sEKheGM5Bhgv9a
 wbMdwBtRz0l3SS6hA/rhcWf6qMjaYrkGPrV5YgMreAsrt3oE0XzzWYR1PXuoxcyVxJd8
 HHbq8ShTi/kMCc9B8S2NuGipD3j3rBrDAAgh1i52he9oNhp4UcQPk51PF2eUkELBpire
 wwHD5B/5vmh9rwmXtLhJ+NQt+t6Qmh60cnNfjGbtWIVlSV9zw9v4sRZx8SSY/lUTOMrJ
 L3nQnAlfQy1Rfx4iBNKjUxK1tHP++eLtew8HYpB8EImTjZKM+eUdOrgLNxOQl26Fiq0E
 tapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kU1DhHqljkZnMyZ8L0mfvbfdXEv07yxf2+yc3rbwTBA=;
 b=m8cGBeLBIiM+tXs2FtTg0RBaaqzi9cSxngZy1+LVRpQ0kz+W/M0mZAUmscNjs7h5Sd
 cqJW4NXySbqdNfdsdfvUuMq5DapR7YGmIxPz4COn20LzgGYhulj37p8r59WKDYCgi0go
 6hH8eb22vSTn0iCzqUGcQi4e3S4iHJDq2qe9L4WNx9kIeHj6TTpQEd6dlpkpfvB/yRkV
 /cFPQMDr+YysKvIwp3i/4lphy6C4JhyVOwdcLcm7aaLnLahq64zfjZs3Ub4LutO6BYrq
 5mGxvWtk5xcmwkTEBydfxnHX1ZYB+nkT/N1fPUV/D9W4e7jXti51bYIQdf6ZMs8i+xPE
 Grig==
X-Gm-Message-State: AO0yUKVaqXqOeSKYJy05UwKbsOqkZ1aVT4JBa7scXDn+7AA30xPZxejJ
 jLfKWi1V4Cp3icmArTfc/5dKeA==
X-Google-Smtp-Source: AK7set+VgAFb/5QtFiJTtVw7Lkm+EfmrUhUt6x98C5jyNKNo/8vE0EAKnvJZmYI876jSaQ6jtDZ1Uw==
X-Received: by 2002:a05:651c:158c:b0:295:9d2c:c5b5 with SMTP id
 h12-20020a05651c158c00b002959d2cc5b5mr1217095ljq.12.1677154023428; 
 Thu, 23 Feb 2023 04:07:03 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:07:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:46 +0100
Subject: [PATCH v3 12/15] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-12-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=diEdpVPV98iDyAF3qtuCIpbTUiF49iB6aIjsVbWV6Sw=;
 b=ZkCJF5gp9SXq5tTFz0avDKLTNJiqFPEk/lO8lIguPILtj3GJe8qp7Dwgbk2fVNK0eKEvODJDTQ+H
 O5dIDuC/BSYaR/lZLPu4xYN+7gJPClPMteoXtQm13k4Gtpt8w4mQ
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eb24be772934..f694acca931c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2222,16 +2222,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.39.2

