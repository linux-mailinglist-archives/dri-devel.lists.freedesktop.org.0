Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DACE1F82B2
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48C26E419;
	Sat, 13 Jun 2020 10:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2446E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:19:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e9so2289232pgo.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2xT2fd+04yGsx4w4dLprxX7O4DDzKAl203LfbKnnxUo=;
 b=U+KYJQWnfvJ+zVC5RFvsV9s13DDkJjJiMN7EQm6V0bnmQJOEGRMmv212DXHpnmT8ui
 UAJoOxmQPeF3I49i0ONBbStH3OwrcZQWVhR2zQ906xwb1nbhcpx5o/aVnDhtcZH9Ixmw
 T1L5jxgAh9skebzrItlzw3V218eodsctARYdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2xT2fd+04yGsx4w4dLprxX7O4DDzKAl203LfbKnnxUo=;
 b=TkNxSQONl22W3A9rP3A7FbqUFpMv7LlM6XOZsvW0zEgMdE5hCGt2XoFrJtPys0X8BE
 uj56h59K/b4xwBWY81doyew3SXe/MRh3tVVKK/M1hiXvq4jE0o4YtOLUvXbctdjdSyDk
 PQvcc5KnCVDX+gdv2b+lvFhIkcn/pbSth7FuRgZGUXRgbi2pKtOviMopcodzLHbWYMWf
 fbN17CeZSY45KqJBnQonogOU9HPGj1ROEKNHy4hNW/3EBzAOTW69lLtvEbAJCCJl2PlW
 5SfUDA78/7iFC8J75TDGD4WDur+BgsavAlb0iA3SBPgVQ/BEd0dhex0/VAfTKxhKK+lV
 87jQ==
X-Gm-Message-State: AOAM531zEEO1ykDq7hlRcJ3ADegkm2hpaBeMF+rznLfAwxjPUkzr6bin
 Zd+QZhAQs1B3MHxlzc4F8gbmkw==
X-Google-Smtp-Source: ABdhPJwTrgAAetOxWub1RoiCbbyZU9Ht90/0QE5mD4xtRsGamL1pSLWQoqyMNz4C+kp1REgobA4fPg==
X-Received: by 2002:a63:c50:: with SMTP id 16mr4687007pgm.143.1591867160768;
 Thu, 11 Jun 2020 02:19:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:19:20 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH/RFC 0/8] Support qcom USB3+DP combo phy (or type-c phy)
Date: Thu, 11 Jun 2020 02:19:11 -0700
Message-Id: <20200611091919.108018-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manu Gautam <mgautam@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, Sandeep Maheswaram <sanm@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series is based on v5 of the msm DP driver submission[1].  I
haven't refreshed this to be based on v6, but I can do that soon.  In
the v5 patch series review I suggested that the DP PHY and PLL be split
out of the drm driver and moved to the qmp phy driver. This patch series
does that, but it is still marked as an RFC because there are a couple
more things to do, mostly updating the DT binding and getting agreement
on how to structure the code.

Eventually I believe the qmp phy driver will need to listen for type-c
notifiers or somehow know the type-c pinout being used so this driver
can program things slightly differently. Right now, I don't have any way
to test it though, so I've left it as future work. For some more
details, the DP phy and the USB3 phy share the same physical pins on the
SoC and those pins pretty much line up with a type-c pinout modulo some
CC pins for cable orientation detection logic that lives on the PMIC. So
the DP phy can use all four lanes or it can use two lanes and the USB3
phy can use two lanes. In the hardware designs that I have access to it
is always two lanes for USB3 and two lanes for DP going through what
looks like a type-c pinout so this just hard codes that configuration in
the driver.

Here's the example node that I'm using on sc7180:

	usb_1_qmpphy: phy-wrapper@88e9000 {
		compatible = "qcom,sc7180-qmp-usb3-dp-phy";
		reg = <0 0x088e9000 0 0x18c>, // usb pll (or serdes)
		      <0 0x088e8000 0 0x38>, // dp com
		      <0 0x088ea000 0 0x40>;  // dp pll (or serdes)
		status = "disabled";
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
			 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
			 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
		clock-names = "aux", "cfg_ahb", "ref", "com_aux";

		resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
			 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
		reset-names = "phy", "common";

		usb_1_ssphy: usb3-phy@88e9200 {
			reg = <0 0x088e9200 0 0x128>, // tx0
			      <0 0x088e9400 0 0x200>, // rx0
			      <0 0x088e9c00 0 0x218>, // pcs
			      <0 0x088e9600 0 0x128>, // tx1
			      <0 0x088e9800 0 0x200>, // rx1
			      <0 0x088e9a00 0 0x18>;  // pcs misc
			#clock-cells = <0>;
			#phy-cells = <0>;
			clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
			clock-names = "pipe0";
			clock-output-names = "usb3_phy_pipe_clk_src";
		};

		dp_phy: dp-phy@88ea200 {
			reg = <0 0x088ea200 0 0x200>, // tx0
			      <0 0x088ea400 0 0x200>, // rx0
			      <0 0x088eaa00 0 0x200>, // dp phy
			      <0 0x088ea600 0 0x200>, // tx1
			      <0 0x088ea800 0 0x200>; // rx1
			#clock-cells = <1>;
			#phy-cells = <0>;
		};
	};

I had to put the serdes register region in the wrapper node and jam the
common area (dp_com) in the middle. Sort of a mess but it was the best I
could do to make the driver changes minimially invasive. I also had to
change the node names to 'usb3-phy' and 'dp-phy' from 'phy' so that I
could differentiate the different phys in the driver. Otherwise the qmp
driver was already mostly prepared for two different phys to sit next to
each other inside the phy wrapper so it was mostly just a chore of
moving code from one place to another.

I'll also point out that I found out the DP controller driver is
resetting the aux phy settings right after it configures it. The last
patch in this series rips out the DP PHY and PLL code from the drm
driver and wires in the phy API calls instead. In that same patch I also
fixed this aux reset behavior by removing the bit that resets the aux
phy. I believe that the aux configuration is broken in the DP driver
but I fixed it now I think.

TODO:
 * Update DT binding for qmp phy
 * Clean up phy power on sequence a bit so that it is done in one place
   instead of two
 * Allow link rate to change after phy is powered on?
 * Make the runtime PM logic detect combo phy and power down both?

Stephen Boyd (8):
  phy: qcom-qmp: Move phy mode into struct qmp_phy
  phy: qcom-qmp: Remove 'initialized' in favor of 'init_count'
  phy: qcom-qmp: Move 'serdes' and 'cfg' into 'struct qcom_phy'
  phy: qcom-qmp: Get dp_com I/O resource by index
  phy: qcom-qmp: Add support for DP in USB3+DP combo phy
  phy: qcom-qmp: Add support for sc7180 DP phy
  clk: qcom: dispcc: Update DP clk ops for phy design
  drm/msm/dp: Use qmp phy for DP PLL and PHY

 drivers/clk/qcom/clk-rcg2.c                   |   19 +-
 drivers/clk/qcom/dispcc-sc7180.c              |    3 -
 drivers/gpu/drm/msm/Kconfig                   |   13 -
 drivers/gpu/drm/msm/Makefile                  |    4 -
 drivers/gpu/drm/msm/dp/dp_aux.c               |   27 +-
 drivers/gpu/drm/msm/dp/dp_aux.h               |    6 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  247 +---
 drivers/gpu/drm/msm/dp/dp_catalog.h           |   11 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   58 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   50 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    3 -
 drivers/gpu/drm/msm/dp/dp_link.c              |    2 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |    1 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |  123 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |   81 +-
 drivers/gpu/drm/msm/dp/dp_power.c             |   78 +-
 drivers/gpu/drm/msm/dp/dp_power.h             |   21 -
 drivers/gpu/drm/msm/dp/pll/dp_pll.c           |  127 --
 drivers/gpu/drm/msm/dp/pll/dp_pll.h           |   57 -
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c      |  401 ------
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h      |   86 --
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c |  524 --------
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 1103 ++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   80 ++
 24 files changed, 1133 insertions(+), 1992 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>

[1] https://lore.kernel.org/r/1585701031-28871-1-git-send-email-tanmay@codeaurora.org

base-commit: 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
prerequisite-patch-id: 627a6baa59c072bd77bec81580c3c7ebfafb91f4
prerequisite-patch-id: 867c626c7ad458ceddacc7d47007fda855855ba5
prerequisite-patch-id: b32de781ef4575f6e2811f5d877747e6f517a430
prerequisite-patch-id: 670511d27642902829faf0c5929c829daeeb004c
prerequisite-patch-id: a0db84ff788ba79e4df84642658d3607726fbeef
prerequisite-patch-id: 12421c3c5b640e91613fe780e9d11eb91604f25b
prerequisite-patch-id: 0e064646903933b0e162a44ce392f7a4875116ce
prerequisite-patch-id: b394fb01b5c82db8457311e30403902c445407fd
prerequisite-patch-id: 0770e225225c1b82953a668d0b162ff3191d2955
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
