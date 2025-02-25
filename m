Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40FA44E85
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8151310E7F1;
	Tue, 25 Feb 2025 21:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="HV00NfTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7454710E091
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740518093; bh=nR6hbYFkUCK7cDGEqRMA6HXEwebdg5p8Ni/y5RZ8urg=;
 h=From:Subject:Date:To:Cc;
 b=HV00NfTQJrtce6Kh8S2yuDRUVwmPdjUf/2qTRg4Hanqg9nhVS47ezJ8D+wezJhAYV
 LuewNpMdPj2N5m5Ztm7YG7rNBqc8kNssJt8qC1YLREvX3vKdsGW+0fy5cAOtV1INsj
 lp7kN5EqayamNHxumnPWjqJKVpRBnKGfzWe9rUxc=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/4] Add display support for Fairphone 3 smartphone
Date: Tue, 25 Feb 2025 22:14:28 +0100
Message-Id: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQyvmcC/23MQQ6CMBCF4auQWVtDhxTFlfcwLGg7yCQESEeqh
 PTuVtYu/5e8bwehwCRwK3YIFFl4nnLgqQA3dNOTFPvcgCWaEhFVv1TKsyxjtyl7aZytqoZqYyE
 /lkA9fw7t0eYeWF5z2A486t/634lalco5f9VIum4M3sfVdW9ikTOt0KaUvuJrZIapAAAA
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=nR6hbYFkUCK7cDGEqRMA6HXEwebdg5p8Ni/y5RZ8urg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnvjLArkbrqXjAPVx7+znIk3YYPUv79ruiJ0V6b
 TX4iCQIZPKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ74ywAAKCRBy2EO4nU3X
 VugzD/9O7r+tOdJPcuS2PL50nLO9kIANHsyzPjubgmIHTZYzi8WWmCeCutjLBicUZVBqoRBXw6m
 lkJEUESiWUCGWRziJjn0HThCbh2RPESdAM6Yey5v9y+LZQMNrrs2RqqbCIwMEtFyTuDBwjZI4zi
 Erj0ZTGOr8fynA5/Pno9zyo0r/VXjkEhkrUZfinI2Vya53ug3iww5vK/BntEC4YHTxboxUQLBGZ
 k2tVybx1mNglwySxWWs+Sy4lKzMBuAqQdpM/wUgx11EW2CtbCCRe0xek/Dsuqn1caTDxc6NkSsF
 qjdT7ZQjRXqAUgwjG4YQn8Cc69xaif8lz89MKSX66RB+yBaFVdrmBHj3qxDSNyFFfhEtLIf7FmE
 nSdPEYuTI/iVajWjofAzJ5nLjNBEEPyYBHxWge5+KeWOfV7Lj2fxCdy6hDKrMbvHOHCBCkeXm72
 F2VVFuXu6RGbOg7HkSjtX2bJ3DnYrRL6Eu6G1XscrWROhFk4+x1R5qPnu1YAdGrB4ESbK3CeQel
 oSOKjqNnG6niahxbNzTIWv8kUj8Pd/Muy7v0J70TuoDiGqsYj8voy6QEKGhmEtkvpD3rvnigc33
 p2VrUkyEUVaC/mUKeq26XKTU4aUe73NCebhaDKtc9yMnQIep5G+liKzkO7hUw3v1MlL/HFsOfJM
 kK1vndaWpbQua7w==
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

 .../bindings/display/panel/himax,hx83112b.yaml     |  75 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  62 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       | 430 +++++++++++++++++++++
 7 files changed, 581 insertions(+), 1 deletion(-)
---
base-commit: 197aed880d4de2127c80c389ec62601b7d837351
change-id: 20250222-fp3-display-b79cb339e65b

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>

