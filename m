Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08065506D0F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80610E84D;
	Tue, 19 Apr 2022 13:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E64510E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:04:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id q22so2181514ljh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51y0snB2GUgkqHni5/VdYz/z1Uks4JZTasXp07lWCwc=;
 b=krgPmScwiYNT2fnOQoG+U/F5ZqZHDi1ZExMVupJiEUYyWrTMOMLk95Idi1CaQ+m8Vl
 Cq6zd8hZJK+ilNjf5+y7WNiaJL5G7dHbxn8eWRnmOi9VLfDEWvTeb28BPd+x5sOHtkqt
 MxksRdXGrrcsZd1ZJ0l23jw0M0uFjB09G2SSTdYA7OvnviTy3Gybljymww0kwr/gM4WT
 BP5VccwpA9oB3qzvRuia5DxEz6Ca4GMKJRU1voaGuaI91fK/xXYW72MaYXnbJTzlOI18
 UznWHujLlK+5f4Gw5g3xV9gbIWiVCucOyEGIATMJ0ofhcvgAeXsS/yfxFcJ8SsgCWnP5
 OjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51y0snB2GUgkqHni5/VdYz/z1Uks4JZTasXp07lWCwc=;
 b=rqxjBpfxdShRjUtf1OvIo3OnWo13gD3Qm0dl/gx4kJpsvc/P6OLWRJZnKV+Y5IvOwl
 YAjgafFuHkUqkvIv3ig7ApPmloszU8Yd8XpC6G5Ajcf6g+3d05kH27X1TEwoRvKd1U8I
 +6um04j3iygzVqTSgjczvFMYGlHwF7+/B0q0+O6bksmap7nG3/iCocMoC97tu0QNm1jn
 d/e5cRvMxF6+EjQTkPnVpa+r3t89neGc+yB8ddyO6Xt77bD2/82xLsi5V///X3DsHG/K
 eu15B+5N0pNrctZc8TMWIHPiVl3GJNfng7v7p2gWFLrZDmTs9tUopI7MLO1gf5tbkR6V
 rIng==
X-Gm-Message-State: AOAM5324XLOuXHuHg1unBwlrf+DEYGPV1GpllIquf2HoVmau/mmN0WqM
 PeEO3wUeY9ZgZ8kYktfXzNizfQ==
X-Google-Smtp-Source: ABdhPJxvXRNA7D4IGqYmR84etmLXxAFjgH3awFAVSeFJZs7nF3oksNfIfkvKk0MYPRquOpK9ov50xw==
X-Received: by 2002:a05:651c:103a:b0:24d:b8b1:b333 with SMTP id
 w26-20020a05651c103a00b0024db8b1b333mr6957160ljm.460.1650373463640; 
 Tue, 19 Apr 2022 06:04:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h28-20020a056512055c00b0046bb80943a9sm1508810lfl.277.2022.04.19.06.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:04:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm: Revert "drm/msm: Stop using iommu_present()"
Date: Tue, 19 Apr 2022 16:04:22 +0300
Message-Id: <20220419130422.1033699-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e2a88eabb02410267519b838fb9b79f5206769be. The commit
in question makes msm_use_mmu() check whether the DRM 'component master'
device is translated by the IOMMU. At this moment it is the 'mdss'
device.
However on platforms using the MDP5 driver (e.g. MSM8916/APQ8016,
MSM8996/APQ8096) it's the mdp5 device, which has the iommus property
(and thus is "translated by the IOMMU"). This results in these devices
being broken with the following lines in the dmesg.

[drm] Initialized msm 1.9.0 20130625 for 1a00000.mdss on minor 0
msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pm4.fw from new location
msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pfp.fw from new location
msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
msm 1a00000.mdss: could not allocate stolen bo
msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
msm 1a00000.mdss: [drm:msm_alloc_stolen_fb] *ERROR* failed to allocate buffer object
msm 1a00000.mdss: [drm:msm_fbdev_create] *ERROR* failed to allocate fb

Getting the mdp5 device pointer from this function is not that easy at
this moment. Thus this patch is reverted till the MDSS rework [1] lands.
It will make the mdp5/dpu1 device component master and the check will be
legit.

[1] https://patchwork.freedesktop.org/series/98525/

Fixes: e2a88eabb024 ("drm/msm: Stop using iommu_present()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b6702b0fafcb..e2b5307b2360 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -263,7 +263,7 @@ bool msm_use_mmu(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || device_iommu_mapped(dev->dev);
+	return priv->is_a2xx || iommu_present(&platform_bus_type);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

