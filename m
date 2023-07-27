Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124D765875
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C49F10E5C0;
	Thu, 27 Jul 2023 16:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C43910E5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:08 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so2060192e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474866; x=1691079666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O0gt2sdyxSe9SAFA2SDfY3lBMsGmyCB+Vdw8rRnEe68=;
 b=QIG5tKsDUgFBn2kqXi5MYBxoqcZ2xUc8fRZ7xG7aWI9GyZNEVy2RcYR3MnoSUT4OE1
 /utlg3qREKBJ/ONlCF5h6J7PTJ3DN2dU8uvGy/YAgePVwoSZpg1D6S2afo5SiV5pfWqE
 K/l0AA1gek0oTFU3yz4G8WX3dmICMXm8Q9Be16MbU96F37TcvKzyApL664OXUlvjOTyP
 nWPJhU3IIyHwHh/RgeAwVKfojocxySGzdDdTUyS1WuGh3uXDQluEWWtU0BvQNiTIGrtW
 tbcbatHMdfpXF7Af8rSq9BOOP3X6APg0NLjLoNujzzx630ZsnFBQypwZHT3FwqfHbgY3
 N/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474866; x=1691079666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O0gt2sdyxSe9SAFA2SDfY3lBMsGmyCB+Vdw8rRnEe68=;
 b=a7SKusor6wsbtCATkWPcTH4PecxJ4CilImmmDDqHCkgjZpQQdP51R4Gd9ILfwrGBGv
 aAIxZnZWvErl6QKYW60l2/sBarqe1/cPN/rLq/NUbTSZvqQB9bxpyJpZoxBxaLv9HaFc
 lWODbh39QTp1gbVIzrfWV6js9v8FQDvFay8Qu6FBLMUW/kpfAgWsMMBZRKeJExzP5b8B
 jQb5o0dTdx3ZtAFcmZfFInfTI8nngdM87cp55l4pjho9WakHp2rt4KZQLse1iXHgF6uh
 GZrmNhkXtoVfxY2OaDgn89gsaByFkAuO+bUqEeKN5Mpn+Y035sKxxGbFQJRo2j839Apb
 vfDw==
X-Gm-Message-State: ABy/qLYK+dmNo4hEKSOMZ9mcp1X+PuXe85FC7SDVN9vQdiOr7d/8VUBE
 KBlCL/gCfG3LnD/WRxnwCzllwurKyPDR1Zhe6rg=
X-Google-Smtp-Source: APBJJlETnhEDO8TnnPl/jyIZKBXXZr8KA1fPpMS+inlVZ9cs/XGYFOf8dVrwWDIW7yoT1IytBZo0aw==
X-Received: by 2002:a05:6512:3e02:b0:4f8:77f1:299a with SMTP id
 i2-20020a0565123e0200b004f877f1299amr3079932lfv.42.1690474866435; 
 Thu, 27 Jul 2023 09:21:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/7] drm/msm/dpu: drop DPU_INTF_TE and DPU_PINGPONG_TE
Date: Thu, 27 Jul 2023 19:20:57 +0300
Message-Id: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
performing the MDSS revision checks instead.

Dependencies: [1], [2]

[1] https://patchwork.freedesktop.org/series/118088/
[2] https://patchwork.freedesktop.org/series/118836/

Dmitry Baryshkov (7):
  drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
  drm/msm/dpu: drop the DPU_PINGPONG_TE flag
  drm/msm/dpu: inline _setup_intf_ops()
  drm/msm/dpu: enable INTF TE operations only when supported by HW
  drm/msm/dpu: drop DPU_INTF_TE feature flag
  drm/msm/dpu: drop useless check from
    dpu_encoder_phys_cmd_te_rd_ptr_irq()
  drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 49 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 47 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  2 +-
 5 files changed, 47 insertions(+), 60 deletions(-)


base-commit: be4dacf4eee1c4e2e91586e75e95b2852274dc58
prerequisite-patch-id: be3f3e5df89f9f2cc6b6289a83422d65e29d4900
prerequisite-patch-id: 59cd61ccd3cde7218fe3db6a8c672faafb7167f5
prerequisite-patch-id: d493b9bd85d518c15ca94f22174cb5ab2e2443d9
prerequisite-patch-id: 6a5bf3083c3da70ca110c17d54027e96c0335636
prerequisite-patch-id: 670883101f3b5dca122501f2828d8e45a6843b38
prerequisite-patch-id: 5dacdaf8ba4b369b966ca341db6691b208476fa1
prerequisite-patch-id: 5d8ff96e0fbea3358931d9d1fcb1bf114ae172df
prerequisite-patch-id: 9d7a4964337aee22c325fa04424f1e20946e1bb4
prerequisite-patch-id: 7310e0a9f3aa611cb080930a4c8247ced69ed5d5
prerequisite-patch-id: ec7e1b84ef2780c43cf59e2c2bf638d7eff188fd
-- 
2.39.2

