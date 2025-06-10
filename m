Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F61AD428D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 21:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9E310E2E2;
	Tue, 10 Jun 2025 19:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="rf0vE9fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BA210E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749582620; bh=bt8hlLHTrwKMFKhnLmxmc1bUTURzOKO+OeNYuOUXZ0Y=;
 h=From:Subject:Date:To:Cc;
 b=rf0vE9fNFn3L/XpdmKMOZwQmrxRBIOqZ+5WYCTw7rXyvarB+PFQTgCOtEDLrj7GXu
 R++Z6AiYBtytsLunNQxxHUTmLkbw08s1b+HpEpS8Em+9GLQLcObjLdZMXiZHWRt+YQ
 E7GKjGbK6p1v8i8t4OzXYuibVJ3I5C9vM//bCeFk=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v3 0/4] Add display support for Fairphone 3 smartphone
Date: Tue, 10 Jun 2025 21:09:18 +0200
Message-Id: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN6CSGgC/23MQQ7CIBCF4asY1mJgCFVceQ/jAuhgJ2naBizaN
 L27tCs1Lt9Lvn9mCSNhYufdzCJmStR3Zaj9jvnGdnfkVJfNQIAWAMDDoHhNaWjtxN3ReKeUwUo
 7VsQQMdBrq11vZTeUHn2ctniW6/u/kyUX3Pv6JAFlZTRc2tHbJ1JKBxzZmsrwyfU3h8KFk0FoI
 3Ww+MOXZXkD7lfNDugAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=bt8hlLHTrwKMFKhnLmxmc1bUTURzOKO+OeNYuOUXZ0Y=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSIMXwUIyLIFHIOZM+WFtISTOmnJTRnaZY/GkV
 FOlfgOKsF+JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEiDFwAKCRBy2EO4nU3X
 Vj1UEAC8+Bxrl53cu/BlSJjlK18DdTiJMb5dYVXRbFL1B+ykuTzV1fHgl9oiMaMixebRdVlTWOE
 9TottO8Qt7JyAdsUEidO8uvKIDTVfmhrfsiy9HB2FjedK9d6MakAtRQFIuRRA3th0KpEYbRQaDN
 b8XWa+MvHH4YQ+oiBWWieigacpLIt1BgW0h+qIf1RT5l3u45wvRvRCzZ6uQYrOXabtB7fTTduvt
 9qOIjuCg/C1K5BN+PqFYeYHbA8TIwddd62jRT3cJapoCI0dDabK6/TdorM5gJnUWPhWEcZGJkp6
 KXagq3dybLfTMlNPU9Io+4JTrM1GcD+kaqA3WB6eFB5YuSGannxLfNMxxQW+qNNbBZkF3Jjxzcs
 98FNC34mXsax4HizNt9DAjVOh128MD/+htuyySAs4/gbDRiD8fX4deQbpYSGzAOwdX31Et51q6h
 845qsnbtngoaEEipML6Px0rUQ4PTOZ6MIWFH5Fo9+FVDFUGN+8NTjL5tsPnAirverWkV7c8QsOr
 oI1VRwIug/BYz7zFVCbzdxi2YFgXKIZMpThV58fGTO9ravuPTudFlN2mtnpFkYsPQ+EeOkXAPeL
 IP0MDU+4jen/Oe6bKzZw8KHRlWMSMFzfOyDOMbVv5WotgE0wW06ThRtDw+JJtUZdSLDUu/2Z9V1
 h082reK6QwIuUAA==
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

 .../bindings/display/panel/himax,hx83112b.yaml     |  75 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  62 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       | 430 +++++++++++++++++++++
 7 files changed, 581 insertions(+), 1 deletion(-)
---
base-commit: c8a9a1ae369c60953b27c01162eb72b0422b9532
change-id: 20250222-fp3-display-b79cb339e65b

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>

