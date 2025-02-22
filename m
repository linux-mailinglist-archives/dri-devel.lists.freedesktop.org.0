Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B067BA40AD0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 18:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB4710E052;
	Sat, 22 Feb 2025 17:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="w9BPuyrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D0110E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740247093; bh=zBJm8w0eoEzjJRQwRdP3zJ15CnTfGY4H/uK7c9QWlZ0=;
 h=From:Subject:Date:To:Cc;
 b=w9BPuyrmUaGnbfJlWkGyWpo/IbSNmcqqd51ubJKse5SWIEVv6viyfqAxKjhvKZXrp
 +LAXWHzyIRfjxFUzOBjwHYxVOtNtiojtfCoCCNJoo2Tj7yh9nPxZCsNx3AbCdCFkZU
 tJi9NKkQAg9LRWKc3PxzeSmRePxcS9aZrj5P+QCg=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/4] Add display support for Fairphone 3 smartphone
Date: Sat, 22 Feb 2025 18:58:03 +0100
Message-Id: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACsQumcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMj3bQCY92UzOKCnMRK3SRzy+QkY2PLVDPTJCWgjoKi1LTMCrBp0bG
 1tQDkCxt6XQAAAA==
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
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=zBJm8w0eoEzjJRQwRdP3zJ15CnTfGY4H/uK7c9QWlZ0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhAtOMgMIIULVqOl2TfliSKPzCtAe8HUnHgGm
 ZVVHmyUYjeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQLQAKCRBy2EO4nU3X
 VpFeD/96+G3P3rXbbcjnbQmEG/uTd4hWh4s+cFUlOLKY8NVoYgct7oRsdw0fK3se4ue2X7FFLSj
 1AxwNkuoiubDChk6zgSxwV2iQTnHpKSM6U3THaM/fmGDZA506i/UzB8lY1NU4iu+t/13BfSUHoJ
 3s3GXwltMwmZz5vG/S0bFwnGJ1ETLcH7nWro5nbKXgTTnUv/pi475rfTP+f23+CUACXgRcqLWwA
 Uc0suIdFts42ZTzFxakDTOT83xcrY4jV60nH+rFHN0XbosQ9+EWt2Ykz8vcmmufQItBPE5bhmvK
 VpjrajLLa/Lss8sAMesn6DgxiCsHBqt6DmXp3cwmuPEis8g+whap3prH/2J0f3ow8itF2XQ3TUW
 z8/WfXsAhs0tLo4+dQnbV5/zaitAPOVw55AxTijDtqXwI+hYIP50stJ46H3BpCbn8EWhHpKTLPM
 2tnp893Mmgz29wWdOhcFQ/KprcgtkFj6qRdyClPNgYG5GJRB537NYvzCBAX4D/RJw+wycIUAliI
 0Z9+YIfdujir8ssEhtH9WBPHo1YNt9vKjX1f0+U021GbGU73yYL7Fr3QIYtZkzRzOE0OMk/QZ/n
 NM+GxdeKIZ2nEIS8mtTwKo3nN56qD3fl2OgqiK2GxTmAtY3n559CCNC/N28r7MiL6DV4Un3r+qR
 JxSoXm6HU6sOwOw==
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

Please let me know if you have a better compatible string for me to use,
unfortunately unlike Fairphone 4 panel, this panel doesn't seem to have
a nice unique model number from DJN, it's just referenced as "FP3" - the
device it's made for so I've chosen "djn,fairphone-fp3-panel".

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
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

