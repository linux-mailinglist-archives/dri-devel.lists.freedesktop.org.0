Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72338CBBBD0
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 15:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122910E4A3;
	Sun, 14 Dec 2025 14:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WSow5QxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D3F10E4A4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 14:51:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13C01600AE;
 Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD25CC4CEF1;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765723884;
 bh=rH3IkQkrsA/AWaXIXsHO77HqVIDnpkmif5HEE7nJ4BA=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=WSow5QxC0ES0QbaFalKu2/AnWt+ghzcZhlY5a4LpFKZ9c0mFppE1tL/tr+PpOPBoM
 2qWsBYJIRXUnvvg/u2blDW2RFCeJWq4McrtzfCbe4IdgV+Xddlqi69MBfFFE1NG5a+
 tSsoUg3W2XowrYyT6djVsCbNhXcL9+XAz8Vq0vUUO7BV/YFjms322Kc7YLIr1/wecB
 kBEogSBA9dQcOQ9u0d3QWiuQBx/kfnfdrM1BN26UDAYtosJGAT5tmWJ2+4MXKXPgQk
 e04WXA24irnToEEcaOKExMEGvz3IEugEmxqJft2byoTrES2Le3hFPsctMzZy6iBaoR
 qi59029UZlPxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 98BADD5B158;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v7 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Sun, 14 Dec 2025 15:51:16 +0100
Message-Id: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTOPmkC/1XRTU7DMBAF4KtUXmM0M/5nxT0QC8eeUEuoLUmIC
 lXujlMQTpbP9vc0Gt/EyEPhUTwdbmLguYzlfKrBPRxEOsbTG8uSaxYEZEBjkJdy5XeppEHknCh
 qC07U15eB+3q1Nr281nws43Qevu7FM66n9w4EMP8dM0qQsfOdN71Fpfrnci3TY/oWa8NMG6WgK
 arKp5hzx+Aohb1STSH6plRVCl2kTgNkH/dKbxRtJtSr6hzY3ueUgt0r0xSBbcpUlVMIThG7rMx
 e2a3aTGir4sDGhGx7jdTU8rvggT8+6w9Nf1telh9F5ZaWvwEAAA==
X-Change-ID: 20250419-pixel-3-511edc2a4607
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5142; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rH3IkQkrsA/AWaXIXsHO77HqVIDnpkmif5HEE7nJ4BA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pWhWQdWzYuRHyFci8HaUI3Y8S5v099rmr9
 Vuxj348dsyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 cmYOEADDiv0pNKrqDFkD8sltTuTTJdk7egD0db0uvLdqECWRwXGY+pWlDSwn/G+NWqOO1N0TInC
 /n4BiTwOs0NkWc8dK1tVR+Q7rA+dw1mGrN7tNOZFVXA7lLZNe9G7q2be3qGgb5vp8XOjkcYPT7s
 djdJNHKe2OUl2W1kYvVxb39xEr0yYGJVzKj9uAF/oho4xVGB2FuW2kpvXiK1GJBEsjNFThL63bu
 AcsJ+cp64GWDdeqvbnQdMWHj7uGxwPBRm+JMWAH1SD9hPvMKql6QPFazi1I9EHRBBz3KUf5ECM3
 D0JNeIa2DkHzCiw1ImBEruEQ2NJ9I64N07jQ3zRBmu3zssi2aJbcCDRAqxPxQXGCvALjqKg3Sqr
 JEQpFhE2Q77IkqYt8mmyUMDFBLdfaDP7HmMMTY4AgpiS5RkrbDtPf0rwy53zh1iavGvPHOjXjr3
 RlsTPMU0LkcafB1DlRzGCzVoVingR4p4nceIcAMiXtibcyBy16n3dqpldrpc1IeAWenE0O7HzzV
 vqePgajWYIXibTHu1ZsjRpT38Odt/nJadVSSp3E6MM3ZewowTHBex8KihkMXXmfnaHtLNBL7G5l
 OV6NoEgoN9zVUoUB9tHsLLdqRX3q01KZHHOx8YKIMRLKeWqO+/dOXflzzH+9bvNYk2ZP/6iXJ5z
 Yg9GCCfuyLmwrpA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds initial device tree support for the following phones:

 - Google Pixel 3 (blueline)
 - Google Pixel 3 XL (crosshatch)

Both phone boards use the same identifiers and differ only slightly
in their connected peripherals.

This is mainly focused to get the base functionality of the board and
being able to use the upstream DTS within Linux and u-boot.

Booting
-------
For older Pixel 3 bootloaders, bootloader-compatible board and MSM IDs are
required for the kernel to boot, so these have been added.

For recent Pixel 3 bootloaders,
a) you want chainloaded proper bootloader (f.e. u-boot),
b) you can also boot kernel when adding back TEXT_OFFSET
   (partial revert of 120dc60d).

This series is a beggining of cleaning up and transitioning support from
sdm845 close to mainline tree to the mainline.

Until merged, available at:
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4/pixel-3

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v7:
- Added callibration data for both devices.
  Sent variants to the ath10k mailing list. (Dmitry)
- Replaced "drm/panel: sw43408: Add enable/disable and reset functions"
  with "drm/panel: sw43408: Separate reset sequence into own function".
- Enable cci node, as both cci_i2c0 and cci_i2c1 works (tested with
  i2cdetect with regulator_ignore_unused).
- Added front camera and it's eeprom placeholder.
- Link to v6: https://lore.kernel.org/r/20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz

Changes in v6:
- Disabled dispcc on Pixel 3 XL to keep framebuffer reliably working
  after the boot. Previously I used framebuffer only in u-boot.
- Link to v5: https://lore.kernel.org/r/20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz

Changes in v5:
- Document 1 MHz frequency for i2c2 on blueline and add placeholder for
  the touchscreen.
- Rename vreg_l14a_1p88 regulator to vreg_l14a_1p8 as it's 1.80V.
- Move panel _enable() function below _program(). (Dmitry)
- Link to v4: https://lore.kernel.org/r/20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz

Changes in v4:
- Updated panel device-tree example to contain the both compatibles.
- Put panel pins into the panel-default-state and drop the suspend state
  as it's not yet used.
- Also, sort the pins. (Konrad)
- Move the framebuffer format to common, as it's UEFI standard. (Konrad)
- Improve commit descriptions and add Fixes tag. (Dmitry)
- Link to v3: https://lore.kernel.org/r/20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz

Changes in v3:
- dropped Documentaion: prefix from 1st commit (Krzysztof)
- Extended the compatible for panel driver.
- Document reserved GPIOs.
- Drop some useless statuses, sort pinctrl. (Konrad)
- Add placeholders for the known i2c devices.
- Link to v2: https://lore.kernel.org/r/20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz

Changes in v2:
- rebased on next-20251030
- generalize chosen to -common (Dmitry)
- demystify rmtfs_mem qcom,vmid
- use qcom,use-guard-pages instead of lower/upper guard block
- merge port@1 endpoint into label mdss_dsi0_out
- sort pinctrl
- sorted the nodes inside root
- put status as a last property into mdss_dsi0 block
- rename volume-keys to gpio-keys   
- removed LS-UART1 label
- removed gmu block, already enabled
- removed accidentally introduced WIP crosshatch panel support
- removed useless panel_pmgpio_pins (Dmitry)
- removed usb_2 as it's unused on production units (only devkit)
- move mdss node into the -common and disable in crosshatch (Dmitry)
- move battery node into the -commonm
- move framebuffer into the -common (Dmitry)
- add all firmwares (Dmitry)
- add Wi-Fi support
- add Bluetooth support
- add missing gpi_dma1 node
- renamed regulators to follow regulator-foo-bar BCP (Dmitry)
- adapt to recent cleanup GPU's zap-shader node
- Link to v1: https://lore.kernel.org/r/20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz

---
David Heidelberg (8):
      dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      dt-bindings: panel: sw43408: adjust to reflect the DDIC and panel used
      drm/panel: sw43408: Introduce LH546WF1-ED01 panel compatible
      drm/panel: sw43408: Separate reset sequence into own function
      drm/panel: sw43408: Remove manual invocation of unprepare at remove
      drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      drm/panel: sw43408: Improve wording when reset-gpios aren't available
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../bindings/display/panel/lg,sw43408.yaml         |  13 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  89 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 536 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  36 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |  58 +--
 7 files changed, 705 insertions(+), 31 deletions(-)
---
base-commit: 1afd6a72e30f55f3a1699180d01d969444ad4469
change-id: 20250419-pixel-3-511edc2a4607

Best regards,
-- 
David Heidelberg <david@ixit.cz>


