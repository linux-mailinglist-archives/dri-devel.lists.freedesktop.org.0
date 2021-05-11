Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02E379E25
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935546E0BE;
	Tue, 11 May 2021 04:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034F6E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:18:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x15so4118106oic.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2gAze/d2HhwU52kaGGE4CzwuF8hxkdmKXF6fTfpRgJQ=;
 b=xmPruj5Ol/5WVN+yg0dvis7WQJmqsskkOQ0V8qsxI0yXHWqWDa9cBRQyq1omDx7FBf
 9VNiG51IuqfoS7lSSdTuGtqI4EaphhEdBZK1VDMLI6a+kCEt7T6k+ZgONxAlJY1fG11U
 F8O7mDI0BI2AqeQWvCGe0QA1+lJByPrqBz4UN7psNR9gBJ3nFKkjgsTGl+3sC/b7MVrz
 +Odz88CUWt52iLTrv7HmcldOjyrcDMg93pwRGOzDfMDIDjSuX1r75HuKEuLTygxhOm7g
 mGBV9IL1lxk2G05njMZBUEPW6jyipYR0hl22FvNJqDsq5rub9AM+CPMVkbGyXTJ+t9ew
 yZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2gAze/d2HhwU52kaGGE4CzwuF8hxkdmKXF6fTfpRgJQ=;
 b=TNolzW2+hUk09BrNZru5awJ3dsiI5OhaSKOZXpj34Z3OOvGoY2cd6ZfriXYw9hVszI
 7iqXK6BH2xCYrc+dtdnPfCdsvRGu8+drGXCWw9R93IB7FC1F8kG/SRbEudNl7OEDGFHk
 KKO79VSiMwam+rOGuQk7YFp0//xRYzb7dG5HhPdbLhExj8Ub/Znp4Njw+F0q7Ew85Nz+
 aiqD2MY/ix6x71rNnuFX5WuJpVXZmgxMwBxL2l7xsySlb1GJlglrXbr1EOOSS/uxEVyp
 qi38yi6oFo+PP1MRcID1S9RlTkliTFUHNsBMF1cdpaPigf6CQOScHpeKZk4jxbxbONuc
 s+7g==
X-Gm-Message-State: AOAM532gTAkJ0Q73dSkpRMlpAPxuufLZIW15atD3xLzgssd79wp/LzxD
 Kyva8XGlz7kgJgA8RicNdl+dGw==
X-Google-Smtp-Source: ABdhPJwZiSJpC1yfaFwq6I5I/qh9ChuguphuwWx64P5vFbYL1sdXIvh2ElBMbSY45mAtxgT6MDw1cA==
X-Received: by 2002:aca:f5c7:: with SMTP id t190mr1954043oih.67.1620706734899; 
 Mon, 10 May 2021 21:18:54 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id z15sm558647otp.20.2021.05.10.21.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:18:54 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/dpu: Qualcomm SC8180x MDSS/DPU support
Date: Mon, 10 May 2021 23:18:48 -0500
Message-Id: <20210511041852.592295-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches adds MDSS and DPU support for the Qualcomm SC8180x platform.

The platform supports running 2 pixels per pixel clock cycle and the bootloader
enables this, so the first patch adds enough support to the DPU driver to
disable this again.

The second patch shoots down the data path configured in CTL_0, as the DPU
driver picks CTL_2 on the laptops, causing graphical artifacts.

The third patch adds the SC8180x to the hw catalog.

The forth patch is included for "completeness", but needs to be reworked. It
updates the IRQ mapping for INTF_5, which is where we find the eDP controller.

Bjorn Andersson (3):
  drm/msm/dpu: Introduce knowledge of widebus feature
  drm/msm/dpu: Clear boot loader configured data paths
  dpu: hack up the irq table for 8180 intf_5

Rob Clark (1):
  drm/msm/dpu: Add SC8180x to hw catalog

 .../devicetree/bindings/display/msm/dpu.txt   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 121 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  36 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   8 ++
 drivers/gpu/drm/msm/msm_drv.c                 |   1 +
 10 files changed, 188 insertions(+), 11 deletions(-)

-- 
2.29.2

