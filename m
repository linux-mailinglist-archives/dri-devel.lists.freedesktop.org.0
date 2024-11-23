Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06749D6917
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 13:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10D10E0BD;
	Sat, 23 Nov 2024 12:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TqI4h5g7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335AC10E070
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 12:59:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87D6FA40346;
 Sat, 23 Nov 2024 12:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB411C4CECD;
 Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732366739;
 bh=gRTpoiz71rEZ3HEhPa5QBWzaIeCM3QF+8GY8L2ThZMU=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=TqI4h5g7r7iu7STjYURGiYnIM5o3GxJC5v7RDOM7KQbTZR9nD5gc+jVy4pBpsF2yp
 nuDvzFpMx5/vs2Rq345JTG43P93axb0Ewt7xtF5fRKaGDH6Bkgx8jWXj1VNioI2U98
 TMQWr1IKAycA4+z51Yd5rQ9XM8bU94WakvmsKVS5JpBn9YCrpgFHHz7PzRWKANziIr
 +NzxW2CZMQYxouZpA0Lc/qLkXAWPyj7dOvsVU/KE8KK6O7ZYfVzAfS9h0Byhyq/PAD
 2+Jpiuedo7q4fXrd1kLn8hNWsIHOU0fULxMxCTt0EzZKzXjygh0kpxDxXv/iagDHRX
 egW403TGFihVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C44A8E6ADF9;
 Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v2 0/4] Asus vivobook s15 improvements
Date: Sat, 23 Nov 2024 13:58:52 +0100
Message-Id: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzRQWcC/22NwQ6CMBBEf4Xs2Zq2gIon/8MQsimt3QQodpFIC
 P9uJR49vsnMmxXYRrIM12yFaGdiCkMCfcjAeBweVlCbGLTUhVLqJJBf3DxN6JuWeOxwEcaWzp1
 1leeFhLQbo3X03p33OrEnnkJc9otZfdOfTed/bLMSUlxKrJyrdCERbz5MPVJ3TC2ot237AB1Kf
 q20AAAA
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732366736; l=1132;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=gRTpoiz71rEZ3HEhPa5QBWzaIeCM3QF+8GY8L2ThZMU=;
 b=MODatZrh/bk+k0WvKk5jsrWTZsQpXoa/lqa9kKOJxymK6Qyl0TGqe7vy0/wuKcbNZJs7+mAWj
 LqMReLG/gtYBYkRFPII2dBPjLg6Se6DsoDUJ7gRNEix7oZGpSZmEqn/
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Adds a lid switch
3. Adds bluetooth (depends on [1])

[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

---
Changes in v2:
- Add missing gpiokeys include in the lid switch patch
- Add depends on for the bluetooth patch
- Link to v1: https://lore.kernel.org/r/20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com

---
Maud Spierings (4):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../bindings/display/panel/samsung,atna33xc20.yaml |  2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 61 +++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)
---
base-commit: 80e87ab38380e4ddf238ba3d8436357c3e0b52d1
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>


