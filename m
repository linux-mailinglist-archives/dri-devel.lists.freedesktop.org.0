Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B312CC87097
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC03E10E45F;
	Tue, 25 Nov 2025 20:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m+yI24/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992A289823
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 509AA423D6;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C380C4CEF1;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764102580;
 bh=HcjUdd9T9QSsQ5GuvvInsaJ4crU9adlSwxknTlihAVQ=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=m+yI24/zrIIDJVXzxxUI0TlIJHnF84Mi1VwM9agSFfmSGwdnTTLS8syh/iYfcYOmj
 KsH0E9TgvxqhXaH0LjNSjX3moO4/qD0P3aLktkvOU6bY2hae2IQ3+ThGmeqbpkg/ir
 s2j0HglIOrSfK4QAs6HiK6cqK6D1UC/Lq2YF+W56+gD9KFwyZhk0HDQ28sfaGAe/FK
 WLeru20OVSYJ7wp+VZmRBYF0LEqNAgyoDJc+RSpFe/AC7IL0l0dOPEqa74pc5+JOo0
 6rtDssToHgel/kN+O/fJh9d1J2MFb4mTWTnwsSNuDqayiwCV/6xphjwtkohNrwh5da
 gwHIYKs7tijKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 05106D0E6F5;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Tue, 25 Nov 2025 21:29:35 +0100
Message-Id: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8RJmkC/1WPyw6CMBBFf4V0bc1My6O48j+Mi9IO0sQAFiQo4
 d8taESXd2bOydyJdeQddewQTczT4DrX1CHEu4iZStcX4s6GzASIBGLMeetGunLJE0SyRug4hYy
 F69ZTGVaL6XQOuXJd3/jHKh5wma4OBEi+jgE5cF2oQiVlilKWRze6fm+ebDEM4oeSsFEiUMpoa
 wuCTJj8n5Ibhag2SgZKYqZFEQNYpTdqfr/v6XYP/ftPh3l+ATAda0UdAQAA
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4070; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=HcjUdd9T9QSsQ5GuvvInsaJ4crU9adlSwxknTlihAVQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGxhovoR8nCEh+W0YpAQlmryuH4u4RrSXuma
 PGa5yAD3jGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsQAKCRBgAj/E00kg
 cufbD/9OEyHL6hR7wMBmTOilhg1WH9oye+e6GTjuZsneNQT+ggLDu7GgWUBRDjUTRrRy6DCAemb
 GlhCzVyQO3x0RWg/W7cjLc80/zc+6KB8ZylOjJdvJ7MlfeJJjAsi0Nk3jWdvFin++GD9OQo8bAE
 WqvBWaBv2NoV5buoxgfi8OCM7EgoKm4+l9JJ1KtETIewcrJ58j46hh/5yWuRqHu/aOZRUnDKV7p
 uJHPz2ev3rE405LPWVGK/MXOwkuuw/2cBMZlN3GSG/EFEEuY4tjGfjBXfG85hBcgyXvy1BeDTj1
 ikaAh4qW/b9pabiIeOdbF5Ddwr4Xnse9eB6kgUOp+QSeXm+VNoy2rNd6YJ7us7ociusr8aNSe7y
 2WuslVq/2WQG0YrGpCtbxO1eTl89802poOm0iTp7qmfhW3h6hWre5Z7PZDS5VOE1RTZnRObRXsL
 m6wz2dbM54NTdrhUYuAbrRSCMGDIKHCcBKrrSD/2ESU/PC7Q3578Xx0Nnne+O6XrrLP43TswkM3
 RImsY2wabKLxsIfO9IAVlVNCOmfeFH0PccCU8mGQlnXCQsGfzFO+/vQ6pJm+YHultz9+I3fhEcD
 XoRdSeoFjrRK1yy4/k/9Y8TiICvHsxewLkFUQ/0/dxoCjPqX93c9cW+ToBOMIBnOeke48QbILMf
 hxy7tBhRlZRfE6Q==
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
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  77 +++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 528 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  28 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 124 +++--
 7 files changed, 719 insertions(+), 55 deletions(-)
---
base-commit: 31b46a54c8d266c0dc68cfbefca22a671d1e5783
change-id: 20250419-pixel-3-511edc2a4607

Best regards,
-- 
David Heidelberg <david@ixit.cz>


