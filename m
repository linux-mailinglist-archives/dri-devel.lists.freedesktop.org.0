Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDFB22DFFE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E8F89DE6;
	Sun, 26 Jul 2020 15:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0BB89F89;
 Sun, 26 Jul 2020 11:13:12 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id gg18so10839557ejb.6;
 Sun, 26 Jul 2020 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tNAVT9gld8ytdUafqDbp0LRRq+hyh+iiBGbYdB7ZOxM=;
 b=kVUnJWDPN6bBNQf+whJB42R11Hv00qYaftuHcTPkOHBGBB9Ot9QHSEiXRV21lvGbC1
 Bsgbfz29Cq6a6xj7BsLQ43L3r5oSkDCIdrZSGKfviP6mnXibs5sWjDEZXIBh/gZNu9Df
 4uvtqbWmHJT78ufd8xB7+mSBYIZaeorOj2pUBstnXtB+7QlKSG3H2UM9gvWZ/EWdPPji
 K6B80g391V1xXyAuUo1xwi3HcBkMfxTQzb66zx38JqDqy7TKjGc1p2EpNOoA+PICCHsJ
 vgCXEN7+OKlYxgmflGbK95V6aWfwWYLmjQsHseh4OnkYcV/vk+Zb8Hva/u+6Oi7qysQC
 /BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tNAVT9gld8ytdUafqDbp0LRRq+hyh+iiBGbYdB7ZOxM=;
 b=L+7ZP5lJSggJQwNduu9KXM6tFPqK3QaZdsOaDK5wAMBFWGZm+ttDfJ6x8p01K+/J23
 +6hqfGqvptNJ5Z1HWgN+Ek8mmxz/v0vXBEC7oxJGy/Vjc8JFvk+yzFBm7iYDkdbwMoSy
 Yv7BLWW+wQx4XwaLKYVc+rlee1Q+YjyHsahqu9q7v2P0VPw9q2jlUaZL0li3ENvylXQR
 PRvJSqlAaij8vTTpgdDI0cyBIVZ2Du25zWZLgPqk/jvf5NbvHh+CYsNgXuzl/+L2r4TQ
 RzI1bf56KtBDfgOXeTxKB0xkTuLJfsPIgu5GptORX7etlt4bQ8MDgvFkrVlbzjQoIYE2
 TK1w==
X-Gm-Message-State: AOAM532TLTErfW6kNIL7X9xy621Vig9Jhq+hEspK2BZba3D3VKA0dRJ6
 vUs4Ok74oWmT8GHRYyemll0=
X-Google-Smtp-Source: ABdhPJxhh+2o7B1rrZWbt/vIi6TWE/wpm02xaRpF0P5sfdJfxl2Fsk/0i0N8uGD+jScbEkBbPA9T9g==
X-Received: by 2002:a17:906:4558:: with SMTP id
 s24mr12647062ejq.144.1595761991022; 
 Sun, 26 Jul 2020 04:13:11 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:13:10 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 0/9] SDM630/36/60 driver enablement
Date: Sun, 26 Jul 2020 13:11:57 +0200
Message-Id: <20200726111215.22361-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

This series brings most of the changes that have been
brought to sdm630/636/660 SoCs apart from device tree
part (I cannot add anything unless some [1] smmu quirks
are merged.. blame qcom!)

So far, the platform is shaping up nicely, though some
peripherals seem to be living their own lives (I'm looking
at you, modem!)

The QPNP-REVID driver is taken from downstream but seems to
work fine upstream. I understand it may need some cleaning-up
before it's merged.

Current out-of-tree progress can be seen at [2].

[1] https://patchwork.kernel.org/patch/11643603/
[2] https://github.com/konradybcio/linux/commits/ninges_labs

Konrad Dybcio (8):
  clk: qcom: gcc-sdm660: Add missing modem reset
  phy: qcom-qusb2: Add support for SDM630/660
  drivers: usb: dwc3-qcom: Add sdm660 compatible
  drm/msm/dsi: Add phy configuration for SDM630/636/660
  drm/msm/mdp5: Add MDP5 configuration for SDM630
  drm/msm/dsi: Add DSI configuration for SDM660
  drm/msm/mdp5: Add MDP5 configuration for SDM636/660
  clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk

Xiaozhe Shi (1):
  soc/qcom: Add REVID driver

 .../devicetree/bindings/display/msm/dsi.txt   |   1 +
 .../bindings/phy/qcom,qusb2-phy.yaml          |   1 +
 .../bindings/soc/qcom/qcom,qpnp-revid.yaml    |  38 ++
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   1 +
 drivers/clk/qcom/gcc-sdm660.c                 |   4 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 198 ++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  21 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c         |   7 +-
 drivers/soc/qcom/Kconfig                      |   9 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                  |   1 +
 include/dt-bindings/clock/qcom,gcc-sdm660.h   |   1 +
 include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
 18 files changed, 961 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
 create mode 100644 drivers/soc/qcom/qpnp-revid.c
 create mode 100644 include/linux/qpnp/qpnp-revid.h

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
