Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DBDAC2E80
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 11:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9D610E209;
	Sat, 24 May 2025 09:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YtMQ2W8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDB810E1F0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 09:19:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBBDB5C482F;
 Sat, 24 May 2025 09:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C8A5C4CEE4;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748078354;
 bh=1Sh3eOdpOW8Ue2CYxhXAVSHZrEqvZi2ABTfq/nJrQuY=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=YtMQ2W8jfLJ6vpTFaDFH3f+GC64hIP1MSInpNLQkQLQEAIf5hWjf7PPGlhzP6xtEO
 aWIsCQmi73an2qpgvNQhW57OIvvvxXhSblvzxTmTzv1eA1+8cqzaSgVkL5oPZ7vBYX
 PPXQbd1h8joNWKzU8GP7RoO4Yh8qS8CG0hkkSockcRK+Z9zn5mOXKX0YyCRbxj+YM2
 pzCYxYWpXao33OMUIO7pjQQtp4czTrcKsZpgmVrYyh9b/i0F/7RQdBI1wvlb8ESr3x
 g58VFRc0qA2fKRTcMAcvFJGy5eLLP8L2d8B2Dcqivoe/9aCBxfNuiWXcN/svpj7LwU
 YWCyCUZ7DF6sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1787AC54F2E;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
From: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v3 0/6] arm64: dts: qcom: Add Lenovo ThinkBook 16 device tree
Date: Sat, 24 May 2025 11:19:07 +0200
Message-Id: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuPMWgC/3XOTQ7CIBCG4as0rMUUCpS68h7GRcugnaQpDSBRm
 95d2sSfjcv3y+TJzCRYjzaQQzETbxMGdGOOalcQ07fj1VKE3ISXXJaSMRo7pihEarUwoqpA1x0
 j+Xry9oL3TTqdc/cYovOPDU5sXd+G/BiJ0ZKCkVqolksj9NENEEzv3BDccIv5l7Dv8ElWMPFfR
 H0RnpHaiKZRILUF9RdZluUFzwMaafAAAAA=
X-Change-ID: 20250511-tb16-dt-e84c433d87b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078352; l=3991;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=1Sh3eOdpOW8Ue2CYxhXAVSHZrEqvZi2ABTfq/nJrQuY=;
 b=wNa7s6Z5wXZmzZw6KuclikJryzkYraTHhTZeUt+Ro36HrK5XsNHbTGUowu9sjfB5aCDTFKzSa
 ct1NxCtsRjOCtMkMQ0yqTi69vKr2FFf8H7tQVHjvKjxU9gHT7m00o6F
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

Device tree for the Lenovo Thinkbook 16 G7 QOY

The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].

Supported features:

- USB type-c and type-a ports
- Keyboard
- Touchpad (all that are described in the dsdt)
- Touchscreen (described in the dsdt, no known SKUss)
- Display including PWM backlight control
- PCIe devices
- nvme
- SDHC card reader
- ath12k WCN7850 Wifi and Bluetooth
- ADSP and CDSP
- GPIO keys (Lid switch)
- Sound via internal speakers / DMIC / USB / headphone jack
- DP Altmode with 2 lanes (as all of these still do)
- Integrated fingerprint reader (FPC)
- Integrated UVC camera

Not supported yet:

- HDMI port.
- EC and some fn hotkeys.

Limited support yet:

- SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
but not UHS-I (SD104) and UHS-II.

- The GPU is not yet supported. Graphics is only software rendered.

This work was done without any schematics or non-public knowledge of the device.
So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
ARM64, and pure guesswork. It has been confirmed, however, that the device really
has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
@43).

I have brought up the Thinkbook over the last 4 months since the x1p42100-crd
patches were available. The laptop is very usable now, and quite solid as a dev/
test platform. GPU support would be nice, though :)

Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
fingerprint, camera and HDMI issues.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v3:
- removed changes in x1e80100.dtsi and x1p42100.dtsi - resolved with [2]
- fixed schema errors with correct compatible string for the model
- added power management for the camera via onboard_usb_dev.c
- amended node ordering
- changed the panel driver used to edp-panel, added panel in the driver
- amended x1e80100.dtsi for exposing PM8010: This one is not present in the design, 
  added /delete-node/ for it.
- removed commented-out lines for sdhc, specified which don't work.
- corrected ZAP shader firmware name
- Link to v2: https://lore.kernel.org/r/20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz

Changes in v2:
- removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
- amended qcom.yaml
- shortened the commit titles to fit 75 chars
- Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz

[2]: 20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com

---
Jens Glathe (6):
      dt-bindings: arm: qcom: Add Lenovo TB16 support
      drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
      usb: misc: onboard_usb_dev: Add Bison Electronics Inc. Integrated Camera
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
      arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook 16 G7 QOY
      arm64: dts: qcom: Add Lenovo ThinkBook 16 device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    3 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    1 +
 drivers/usb/misc/onboard_usb_dev.c                 |    2 +
 drivers/usb/misc/onboard_usb_dev.h                 |    8 +
 8 files changed, 1672 insertions(+), 1 deletion(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250511-tb16-dt-e84c433d87b1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


