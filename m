Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD1AD5C37
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0410E6BC;
	Wed, 11 Jun 2025 16:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZhNMOlCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC59110E3CC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749659638; bh=MTf/rXDUfXQ+M0fFpjuXZS6A1tPRdx76oitjXzouatU=;
 h=From:Subject:Date:To:Cc;
 b=ZhNMOlCS/TNaV5B6wJtvWtG6fguZt8tPfHYXXLoBB/L412OULYuHQystdTLX3C79a
 ycJD7N36yQnUi2JFsYFd5hKrybwCBDXpphNTNDUlJaTOu8BBMnKtSmV7beOzhhqVDm
 DTnlolGoh2o1GLZuPTxR8XegFoesG/Q2+Ld2Fx3w=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v4 0/4] Add display support for Fairphone 3 smartphone
Date: Wed, 11 Jun 2025 18:33:14 +0200
Message-Id: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqvSWgC/23OQQ6CMBCF4auQrq3pTG0RV97DuChlkCYESCsoI
 dzdwkYxLN8k35+ZWCDvKLBLMjFPgwuubeI4HRJmK9M8iLsiboYClUBEXnaSFy50tRl5nmY2lzI
 jrXIWReepdO+1drvHXbnwbP24xgdYrvudAbjg1hZnQAKdKbzWvTUvciEcqWdLasBfrrYcIxc5l
 EJloEpDO1x+uQax5TJySilVGtYP/vg8zx+7qSVcJwEAAA==
X-Change-ID: 20250222-fp3-display-b79cb339e65b
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=MTf/rXDUfXQ+M0fFpjuXZS6A1tPRdx76oitjXzouatU=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/OnS9o2peAoDaQ0ANIrY318cgpqfn0RiiNi
 JE34aiFcb+JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmvzgAKCRBy2EO4nU3X
 VtD3D/9+GYx+hEjt37D/F8AUy7ISdiUfhSeAOK79GT4mAqKSnuHnpsQpk7OozqNhxMTbo2qemAl
 MTu5AwyW9dWhSJ7aFhCvKn2Nw54rezkiAF3GXetOlq/qKTmUC4lzMd3DCSYKX2WcPIlqpujgdWc
 8Xc+p1eUkl4w3DmZUulCaAYdnC/mfbTlyLPfN4k8Uzj1fiipVoEf+OBmBgE5DhFOMgWnyJBzqUf
 RQbdQWTZxkxjygaSYld0CAKWw+OhkW1gBX/I7tHranxi7cJU8dVLJ40eaN4rbm9J1RB6GJ8d7FO
 QsrWBM7pCABzaGXXaM3jsPCTQnYcJpyLqDv28D/EuSjwm/TPGFS+kzjB+ENJzrcNBZ/ywTmPrVC
 TBUtXYs5/9lTv9HJguxoL2jk75utW4+end+9BC/UYCQwNbeNJzW9LKAH8HzQw5nDDnuWp3SSoum
 S+e090293NItavuB74d4KH7Y8qlHzGptQULpfO6PqiWJsgjnxkXWWVvUiK52XwxeynFesNpgVM4
 jJ7KM+K62J/XbWZo6Ri0ILL1f8FNaEvQTqppGqIonal+6E8qEVWq1gtZ2YxW2hJzQOTwpudR0wP
 SaspRmRoCWVUEF8YlEKles+soqr6fx04/gkcwn+l6amZwla/dT/hCzTvKoJ/iNVLalAsI9YrDhA
 1U+jHXAoFtfeD/g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
to enable display output, and enable GPU as well.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v4:
- Drop "port: true" from bindings (Krzysztof)
- Use devm_drm_panel_alloc (Dmitry)
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu

Changes in v3:
- Pick up tags
- Rebase on v6.16-rc1
- Link to v2: https://lore.kernel.org/r/20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu

Changes in v2:
- Change compatible to "djn,98-03057-6598b-i" based on other docs I
  found
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu

---
Luca Weiss (4):
      dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technology
      dt-bindings: display: panel: Add Himax HX83112B
      drm/panel: Add driver for DJN HX83112B LCD panel
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable display and GPU

 .../bindings/display/panel/himax,hx83112b.yaml     |  73 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  62 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       | 430 +++++++++++++++++++++
 7 files changed, 579 insertions(+), 1 deletion(-)
---
base-commit: c8a9a1ae369c60953b27c01162eb72b0422b9532
change-id: 20250222-fp3-display-b79cb339e65b

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>

