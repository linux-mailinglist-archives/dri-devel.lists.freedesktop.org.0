Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C879DF2C2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 20:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA51210E5C2;
	Sat, 30 Nov 2024 19:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VWVUB/8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF9910E3F4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 19:08:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EFB185C567A;
 Sat, 30 Nov 2024 19:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB82FC4CECC;
 Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732993737;
 bh=hqAKmns3GJfToP3zAXRQaDGsgbUUADfXFp5gbTXfOJY=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=VWVUB/8GESqTBU7id9i4jq3YWmrDhf3kX9p1BuDBxt+vAdmo0nfVEfKNHPk5qxjnh
 2rdE7jLt1LI2LheNMlFv3eY+Xx6K6H0g7G20aUkKy4a992Fd3Y67wCgmPObTl0tK1p
 9taTVXtoQRBEJLLGMuOv4Rg1tuRT/cYoJ2URkYAyrsfenVDUsouyxJu71eb3kXToHV
 S5fmPSFh+uo1GUW3nro65f9it3u6Pv4OstQjRisf4lMI1IwUgXZONbBTJNz7XOZrNV
 F1MaAQxgadaiP02JR5+44oL9MRteweDExyZD6QqnofgjNpv950oKzGrHqgjr7d+BXc
 VI0f9jFljqp7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9C565D7360A;
 Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
From: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: x1e80100-hp-x14: dt for HP
 Omnibook X Laptop 14
Date: Sat, 30 Nov 2024 20:08:51 +0100
Message-Id: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNiS2cC/2WOzQ6CMBCEX8Xs2ZpuLRg8+R6GAz+t3Ygs6SJBC
 e9uJd48fpPMN7OAuEhO4LxbILqJhLhPYPY7aELV35yiNjEYbSwi5ioMih891cx3NaNVhc6Oha+
 aE2YtpNYQnad5M17LxIFk5PjaBib8pj+XsX+uCZVWzprceG0y66sLd600gbkT7p5j+iaHmt5Qr
 uv6ATUhK2u7AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732993736; l=3019;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=hqAKmns3GJfToP3zAXRQaDGsgbUUADfXFp5gbTXfOJY=;
 b=pu3b5VwGlHRyNkzkQoKDekoTp+dNcxUAkccnJSuHeKGE41aXN0iRC+QxT0xLXdzhlBZsutEOn
 hD4VfeEnzI6CkKI3ZvGMB2yXAwIWVQQacQxDpn8Mf6OLj4VVbm6aFkr
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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
Reply-To: jens.glathe@oldschoolsolutions.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce device tree for the HP Omnibook X Laptop 14-fe0750ng
(hp-omnibook-x14). It is a Laptop based on the Qualcomm Snapdragon
X Elite SoC. There seem to be other SKUs, some with Wifi-7 (WCN7850)
instead of Wifi-6E (WCN6855). This dt explicitly supports WCN6855,
I haven't found a good way yet to describe both.
    
PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140

Supported features:
    
- Keyboard (no function keys though)
- Display (IPS 2240x1400, 300nits)
- PWM brightness control (works via brightnessctl)
- Touchpad
- Touchscreen
- PCIe ports (pcie4, pcie6a)
- USB type-c, type-a
- WCN6855 Wifi-6E
- WCN6855 Bluetooth
- ADSP and CDSP
- X1 GPU
- GPIO Keys (Lid switch)
- Audio definition (works via USB)
- prepared for DP Altmode

Bringup work has started with the Asus Vivobook S15 as initial template,
worked from there by comparing and copying from the CRD, QCP, 
Yoga Slim 7, Thinkpad T14s. Special thanks to all the people that helped
on #aarch64-laptops [1] with comments and suggestions.
I tested on my laptop, mostly. Since the dt is also in Ubuntu-Concept X1E
[2] there is also test exposure there, with some feedback.

For WiFi to work you need a board file matching the board string [3]. By 
experiment and pure guess I found the already existing calibration for
HP_G8_LANCIA_14 to be quite nice, it gives 866MB/s link speed here. A 
patch proposal is on its way.

For this patchset to work you also need patch [4] in the tree,
otherwise uart14 for BT will be mising.

[1] https://oftc.irclog.whitequark.org/aarch64-laptops
[2] https://discourse.ubuntu.com/t/ubuntu-24-10-concept-snapdragon-x-elite/48800
[3] "bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e108,qmi-chip-id=2,qmi-board-id=255"
[4] https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- amended usb_mp_dwc3 definition to reference both phys that are used,
  as suggested by Krishna Kurapati
- Link to v1: https://lore.kernel.org/r/20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz

---
Jens Glathe (4):
      dt-bindings: arm: qcom: Add HP Omnibook X 14
      firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
      drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
      arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1693 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    1 +
 5 files changed, 1697 insertions(+)
---
base-commit: 02d920be494a5f953319e7589d23a8ba3f00ce05
change-id: 20241116-hp-omnibook-x14-90539fac715d

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


