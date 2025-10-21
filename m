Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8EEBF631D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4710E5D3;
	Tue, 21 Oct 2025 11:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rRszY6hf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414E910E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E5FF74373E;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B42DDC4CEF5;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761047587;
 bh=blLYQzw7Fm/i30T1vjILSnrxGfqml6yfu8ONDXj51Y4=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=rRszY6hfcEdp+PtctmpjxP7ov+6pUDiRB07YU6SQ1YZ8okt3q7yBc9IbYz+yIt8Nn
 euGxSzrh12BkhJp4MWlwKpTBzX6Jc8nSgDx2r75vuCmJSJsmnLgVgAkbV3m0qZOlTm
 iDjKaUlzs8lNRQg9dP10HXB88wDvXXe1RXmwtw0KAPbKCE0kDw33WgRtSLkmDjDenD
 BFRBlNVkgcTFPDv5Y22Kb40vL8iGknGB35kPfkS56zeFTfRiW6vDC5sfRhO15q0cJ/
 SCR5hpc0yKLNzfxIxkc0MIQGf9Z+mqSYtUzMn+bYRFAATyKiuRP4xzjKIfXoVIBx/j
 Um2qXB89duhuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A215CCCD1AA;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/7] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC
 with AMS641RW panel)
Date: Tue, 21 Oct 2025 13:53:00 +0200
Message-Id: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABx092gC/1XMQQ6CMBCF4auYrq2ZTm2hrryHcQFlKt2AaUmDE
 u5uIVFh+V7y/ROLFDxFdjlMLFDy0fddHufjgdm26h7EfZM3Q0AFBiWPmqSzOILgzigFdYnoSLE
 MnoGcH9fY7Z536+PQh9faTmJ5vxm1zSTBgRs0EoQudOmKqx/9cLJvtkQS/qAAKHcQM0RBthKNs
 liaPZQbKPQOygwtgZNK69qA/MN5nj+JGJNQFAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=blLYQzw7Fm/i30T1vjILSnrxGfqml6yfu8ONDXj51Y4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93Qh3FPzNbk+JxqhgQdlfcVYFIdEF2EHd7ELL
 TRtADqcSFiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 ctkjEADNUBvs+NxZnOwNAZwk86zOFwp0a16dxx05NpX/5At4jHxdWbsxoBt34OfItoomBxZKm9p
 XQqo5vMG/5i8YWOByEe7aotWghqpyTIU8fCGqXI4rMQJ2yJZst/FAlNnRFZFQI2wMAmdY3fkSFJ
 Sawc+6V53Uzryn567OwBc/c15EYf5ieAKAuXIictpduLpKrHegnB1yMcMnskwPaICFxWWroEj6G
 uRyJ64jR/m/r4lyHK8ls+rr7r3sBWzX0Lk4DVi9MZTqvLqI8sjwzH6Ft3dlz5IRWhtwtavmgog9
 kR8y9YW8HeT3T9d78YtubjQFANx/GqCOmV1f1/nyeIvOd6n5jjww+eNw0rF9M8p4d1cIlEBREEY
 qctt9fRYVhtTMhJaEWHQqHirBMDioBp5TddDw5PPdmcbMrV+/1fTbURFgyKUFp6NXvWg2y3W22w
 q5EocidMjTyfF1y1O0BZfcwqrOqzALLndv9lcbjjTFubcAbDUh2jf1N14IX3JFq4KVpt2B0XJ/p
 ng6R+FgWH5fFUlqCL6Rj8ubyGulUxazCJzrMdXMBiZ8oVUtR9IVgYEI3Aofk6sZn9l4NXkBPT/5
 bRvjRZVMOplRoBiZT91rZXv3ldrspcOZGBKEncMoU59KOMbGv2U3E74IpwPMJeiyoQuNRIz0W9D
 /TN1mtmvYosKJMg==
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
Patch 7 removes the compatible entry from the simple DSI panel.

Since the display node is shared between the OnePlus 6 and 6T,
the following warning appears:

..sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'

This will be addressed in a follow-up patch, as the SOFEF00 DDIC also
requires additional overhaul to properly initialize and function in mainline.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
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

David Heidelberg (6):
      dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl
      arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
      dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible

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


