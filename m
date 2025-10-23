Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B876C035E2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366A410E182;
	Thu, 23 Oct 2025 20:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ucVLIOJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B5E10E17F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBC22453EB;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A695C4CEE7;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761251069;
 bh=G79ir8utLb9umTKYTzv7I1+PuyJXEzDtEHANXl0nmDc=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=ucVLIOJEus0Vpw0lfgQkbf4eBhq2tz8jBe5ROHCwOtL/JcXOHHRAGpFge1DQVbxOz
 Ec1rzKIiTM4wIeonmTql82Ur4Okg3ryJfdeaGFFYcfJ8KYL/ZdYYbDskMXLCmEBwTp
 JtAwEHQAAiqFG0CDPwUYg5PpWCGpN5sH4W/ZW6kLm++tgugitDSxRLWZEG+uj84GzJ
 sktXiMsIzIxzNaC3UsGpX3C3unr2LC4fIFwKTQ85Sd4p1WEC5qfN6NWAP4KE3eoZky
 P0euXTOn3r5DoGRmXoMENWneenRNexPd5P36zbqkND8G/PO4AfWRWM8pS/KgtYqRl3
 oT+Giqjg9FheA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 747EBCCF9E3;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v5 0/6] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC
 with AMS641RW panel)
Date: Thu, 23 Oct 2025 22:24:24 +0200
Message-Id: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPmO+mgC/1XMQQ7CIBCF4asY1mJmBoeCK+9hXFQ6KBs1xTRV0
 7uLJmpZvpd8/1Nl6ZNktVk8VS9DyulyLoOXCxVO7fkoOnVlKwJi8GR0tmJioBFQR88MB0cUhVU
 B115iGj+x3b7sU8q3S3//tAd8v98MzzMDatCevAG0jXWx2aYx3Vbhod6RgX4QAVwFqUBCCS12H
 Mj5GpoZRFtBU2AQiIatPXgwNVzPIGEF1wWyGBHCYJ1r/3CaphdfAOU0TQEAAA==
X-Change-ID: 20250923-s6e3fc2x01-f9550b822fe5
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=G79ir8utLb9umTKYTzv7I1+PuyJXEzDtEHANXl0nmDc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo+o77fC7m5Z0llmrkxux/zMuGv3Ru9hivzCwnc
 S+ywSf8j0GJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPqO+wAKCRBgAj/E00kg
 cq5lD/4nIxT+jFu+qVETxI06L4ZmjZC3faaia8pMYt1ZpyV+gz3fTF0PPiat8BVCX5jZpbYAgXy
 jDOgNUyC/10F8Gjt3Uh3hLuyNUwTUFSMTkS/JcCYZoEnb/0UtBrcOzBiFHoGvz6m0xfJtKZlIGD
 8DBNjSzKdvI2LQ9HHjwz30Bp2ga/IGkP3igGFol0fC7XzJFv6EwAqv7pX2u65XLS4Y+UHBNXM3D
 ya0yuYnzycoTxZdHvCBn1/WI8q58xe6CuREExWj83NV2h48BpkKmDS1QJXREhXA0eKwl3qhJzf4
 WIK1msdOiN6vCFUgcMjdPhu/ofRdS2MlUuL6EA99gSfyKpRI/nSvxAObkyTDoFkT60yMm0mpgcl
 /c5pC0iwgGNY79uQ6nK2oPGzKeAaI+9BMr5PG6qY83isdw78GSNIbFEhXUAj7AEfvdQ5oBScNR7
 nkVg7OLqaseZI0U7y9UXlyWF25FbkYpATKnyJqlkwWkOqMwjvaMRv9PZI/eQhEaT6nxrQSazaHr
 VnMz85lgEW3Y6bd5NH956I2nK7X1hxdLGBK3BJ0NBrcXUcUzQsDZRdc3GTPeWqLV3MR4t0yBS24
 OF8jtmjq3VaAwERi7kpwCoxCacEgrGvZjGW2kt18fPypp7omq2kUjmmUr8QFfc3UXJ7RAfORhya
 Hi7m0PlPMqBbiCA==
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

This patchset enables the display on the OnePlus 6T smartphone.

Patches 1-2 add the bindings and the panel driver.
Patches 3-6 document the panel, pinctrls, and GPIOs.

Since the display node is shared between the OnePlus 6 and 6T,
the following warning appears:

..sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'

This will be addressed in a follow-up patch, as the SOFEF00 DDIC also
requires additional overhaul to properly initialize and function in mainline.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v5:
- Squashed removal of compatible from simple DSI panel with introduction
  of the panel definition. (Konrad)
- Link to v4: https://lore.kernel.org/r/20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz

Changes in v4:
- Use refcounted allocation in place of devm_kzalloc()
- Added include drm_probe_helper (Raihan)
- Corrected te-gpio value from 30 to 10.
- Removed legacy compatible samsung,s6e3fc2x01 from the driver (Dmitry)
- Removed old compatible also from panel-simple-dsi enum.
- Link to v3: https://lore.kernel.org/r/20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz

Changes in v3:
- Use mipi_dsi_dcs_set_display_brightness_large (Konrad)
- added legacy compatible samsung,s6e3fc2x01 into the driver (Dmitry)
- extended compatible string to
  "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01" (Dmitry)
- Brought back
  "dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible"
- Link to v2: https://lore.kernel.org/r/20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz

Changes in v2:
- Dropped the gpio reset polarity change as suggested (Jens and Dmitry).
- Fixed unused warnings (kernel test robot).
- Added a pinctrl config for the VCI and POC supply.
- Removed patch "dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible"
  while the compatible is used in device-tree, but without any driver
  serving it, do not touch it (Rob)
- Added more details into the device-tree about the OnePlus 6T panel properties
- Put display gpio -pins into one -state block.
- Link to v1: https://lore.kernel.org/r/20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz

---
Casey Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: Update compatbible and add DDIC supplies

David Heidelberg (5):
      dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl
      arm64: dts: qcom: sdm845-oneplus: Describe TE gpio

 .../bindings/display/panel/panel-simple-dsi.yaml   |   3 -
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml |  81 +++++
 MAINTAINERS                                        |   6 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 113 ++++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   | 385 +++++++++++++++++++++
 8 files changed, 579 insertions(+), 25 deletions(-)
---
base-commit: 606da5bb165594c052ee11de79bf05bc38bc1aa6
change-id: 20250923-s6e3fc2x01-f9550b822fe5

Best regards,
-- 
David Heidelberg <david@ixit.cz>


