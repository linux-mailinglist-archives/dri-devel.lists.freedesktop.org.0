Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDBCACB44
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B3C10E3E6;
	Mon,  8 Dec 2025 09:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A9GAR7TU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677610E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AF97402F3;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1B7C4CEF1;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765186945;
 bh=yqbCSGhD5k2lVUISfIm2sNs+NvrZA6pd3Nvs2Ab90Ps=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=A9GAR7TUo6VJb7YgIenKX2RBPF148sO0eO7hNn8lSYwAf6bMcjc9ox5FBmZGSJIiX
 YQViGmQ4U5pI3LIDuSp5BFzcrzugWcLFbWmfuOgAAZL5XdkVpqY2hFADYsBE9KvM/R
 ucA3aaDSpxUUfHZ3JehlquzDIprpg58xFRAWOiAy1ePV1BkhCQuNrRT0/OXhz11RGU
 I/cEEzly782fIEJVV64yTVkN41WP4V4Sconme8+RGaT/3ONdPjIem7VkstOBaG8vtn
 7pwhpNytDVsApijhkkQFDSFdHq8pLc0cp0+AZCHwmnBP2w4fCI5ksjr+tzZwpH9ixG
 xV9KOEfd5iQmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED49D3B7E1;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v6 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Mon, 08 Dec 2025 10:41:53 +0100
Message-Id: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGGdNmkC/1XQy07DMBAF0F+pvMZoxm+z4j8QCz8m1BJqixOiQ
 pV/xykIJ8tr+1xZ98ZGqoVG9nS4sUpzGcv51IJ5OLB0DKc34iW3zAQIDQo9v5QrvXPJNSLlJII
 yYFl7fak0tKu16eW15WMZp3P9uhfPuJ7eOxBA/3fMyIGH6KLTg0Eph+dyLdNj+mZrwyw2SkJXo
 imXQs6RwIrk90p2hei6kk1JtEFEBZBd2Cu1UWLzQ7WqaMEMLqfkzV7prgSYrnRTOXlvpSCbpe5
 q+Z2q0sdn23r622tZfgDNuctaiQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4629; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=yqbCSGhD5k2lVUISfIm2sNs+NvrZA6pd3Nvs2Ab90Ps=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/Lcq/JRf3ZEjIEknLcqxSE1Z0idlyDVOEF
 ViITX2VgFGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 crisEADNFrss5l85fkAk0/vUnrw0pdq0daTkaLDLMsDC4DpiR4tVjr2QrP6R4V6itpHMg5O1KvX
 TV77J5xLS7fklDwr5NMlIfcE2yGSVTV6/4xrM4GivzcnP4BijKPvK8yzHFWNM4OX+TlW8XMPwkt
 MSuI9JXY48wH88StR0TDLus6aUaso6cWcc7j83HqkUCJzHAjSH9ZmGxiA6SrBqmYVmIc2uctqcl
 JDpiUcTVVs2ZNctnpSfNJs1InRxQPiXkieMSMkDuoNURF7zh1RwIVaJMWtxAixbgAqHrXv+iPFF
 4v2Dpt68m3CBKXjIryHMVdu6Gi23rzUEMl9KFA3KyD5/blFNg8hc4OwSsX/57EHQ2m7GVhwMeNh
 r1sfmU+ztMxUkJmkBDqjxkLiS1hk/pfEueJ6hGpJYsmMxfP+vVv+qzVL8l9W5zOcyfU5Zr8H+45
 eV8M3t+gAmWMrUJ8D8HYbHuux1IJ/QLVn17jhGlzqidlJ1hA4PAGfk5YLUFlss3Ym9Bwa1fLCO9
 K3JuxLfjPsiKf6SqMz3dTfKtRXlwG8TkNZV0bpnroUJECbNZddiJQdDkudcFH6GvrU6h0QL+//k
 ZHD0ylk9k/nG+nCTy5tDe/DRVhZH1C/V9ZemTRelxiHECaPvqe7xEVTe2EgLaNiyxZwNDwkn4u/
 cQgOoMNrKR9nmmA==
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
      drm/panel: sw43408: Add enable/disable and reset functions
      drm/panel: sw43408: Remove manual invocation of unprepare at remove
      drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      drm/panel: sw43408: Improve wording when reset-gpios aren't available
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../bindings/display/panel/lg,sw43408.yaml         |  13 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  85 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 524 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  33 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |  86 ++--
 7 files changed, 709 insertions(+), 36 deletions(-)
---
base-commit: 3ee7acd1ad2603a7acbed6692661f853065d7007
change-id: 20250419-pixel-3-511edc2a4607

Best regards,
-- 
David Heidelberg <david@ixit.cz>


