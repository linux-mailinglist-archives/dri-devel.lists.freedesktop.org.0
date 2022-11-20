Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1016314E2
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 16:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5E710E126;
	Sun, 20 Nov 2022 15:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABEA10E10B;
 Sun, 20 Nov 2022 13:41:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id b9so11929914ljr.5;
 Sun, 20 Nov 2022 05:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PNF/kNtbO6GK1B3nzJQq6Q9EeflceLft+xrnXuyeMeo=;
 b=DDnt9gVC5ya+migDiScvg5lZuWSaBByLu4liDWKPFUASHA939CLQMs8PBoBNeTvCxm
 iUA5oZEFkRe5SJ5gSTq5DJq/2p5l5pwIQxaje7pi3vV7Lr0X1u0JBChXgmjeMcEUrvuV
 eFYbATH1bILvOcXPPvJKNxzu7A4zZxjLe2bNpO5JNmQzzoidDxwFf7dHNlC4oVulvFqC
 cysGz1VOplPYltdogRf1A8Jd4B4+NdlkK7AFJJ9phLznqORla6nY1P7PMZ8gkR6Ex4/A
 6HwNJsVUwB+Iyja+4J9FTAI5sKKuMU1Qd61Tg2yv8XzqHjoHDAf3S/3RR+kwogpdfetb
 CHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PNF/kNtbO6GK1B3nzJQq6Q9EeflceLft+xrnXuyeMeo=;
 b=CVCSk96mv1k3TKa7zTqmlLl31YM+OLB7ZNzGZ1wgCWieN6gFL0DEern5B2dlPOfpj5
 jrbBA+8x+A1ksgNCfQ6rvJd4VE/l+oohnxVtthV8BN8V4o0yi2bElnLlfPqpt4Fpgy3U
 1SP2PcUdbBTWzjfS20+albuiTuWafYUEKy+vxL6BfCl9SftpuxEB3Jz8j4pQQSUsgiId
 qP7Y44hBJJr867ddqsOVPUIixTslGcaqZglupp+J+56GSVT9IEkjoawJk2mOIdJz8y7x
 ceIemq/F0dJNsYo6qq0RLXthKb1d5RdR9tE0huA9STsJ16UHker/2l1btKUf+i5+6r0D
 u8WA==
X-Gm-Message-State: ANoB5plk3SEDahqodtHdPNtZzwbfbm3BZqw0aX6ewiBnwu7LUwhN6vqL
 Eg6xUqLLXkzJzOvmSLg4ayA=
X-Google-Smtp-Source: AA0mqf61XDCq0NCQSdMy3bngtqan9E4X4cICS/OiRi0bwydYg4UvH5qZxFbhuWbViFRaeJQWlIK6/A==
X-Received: by 2002:a05:651c:2002:b0:278:a1bc:ad26 with SMTP id
 s2-20020a05651c200200b00278a1bcad26mr4853728ljo.235.1668951687554; 
 Sun, 20 Nov 2022 05:41:27 -0800 (PST)
Received: from localhost.localdomain (cds73.neoplus.adsl.tpnet.pl.
 [83.30.168.73]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056512114300b004afac783b5esm1536287lfg.238.2022.11.20.05.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 05:41:26 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 0/2] Add SM6115 MDSS/DPU support
Date: Sun, 20 Nov 2022 14:37:35 +0100
Message-Id: <20221120133744.24808-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Nov 2022 15:26:22 +0000
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
Cc: Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Adam Skladowski <a_skl39@protonmail.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for MDSS and DPU block found on SM6115.
These patches were tested on Xiaomi Redmi 9T smartphone.

Adam Skladowski (2):
  dt-bindings: display/msm: add support for the display on SM6115
  drm/msm/disp/dpu1: add support for display on SM6115

 .../bindings/display/msm/qcom,sm6115-dpu.yaml |  87 ++++++++
 .../display/msm/qcom,sm6115-mdss.yaml         | 187 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  87 ++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 6 files changed, 368 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml

-- 
2.25.1

