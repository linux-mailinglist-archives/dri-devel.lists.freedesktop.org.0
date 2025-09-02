Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2CB3F955
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8310E601;
	Tue,  2 Sep 2025 09:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FTs63hBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023CE10E601
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:00:34 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3d17731ac0fso2850418f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756803633; x=1757408433; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wqoSTMfnInHzXncCAvecG0yOfvdXdS/1fhZi2BozDIA=;
 b=FTs63hBFHDc9KARAEjuZE3T2d4UAbw8e0ygVSSjAr+xWbHQDjKpKO1zntQi1VJUgtC
 V+lx763oBU/PMMYoMwYc2WxiFcab5i7e8p3XIxtjHb8WzPYF3yjnVGw8MFCIjO+aJ7Re
 wLgPQrC+oV3q/OcIBcf0NhJsRhSYEEG9VqHyEdiLTaA4KEk9pC9V7HM5W475WthacjAq
 DbHKJh02oQewpnOubGKRWt6olyZ26XsY80v2Fgp1lcG+OyITVAQ4eGQU6CsbOCNf8OaO
 YweSTv1W7uKpT/xp/C05AaY5lVSuLggUSoMqy+HpVQ41E0zu/WnJib7yHG74eFTAtQZ8
 4AXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803633; x=1757408433;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqoSTMfnInHzXncCAvecG0yOfvdXdS/1fhZi2BozDIA=;
 b=rftYIsYnWoG3+5ZbGbevbzT1zqhESAEaj3gyeZm0GN387PxxAQb5JeRIY7KYDqrkyH
 2Bn9GARAN17eRBExygoBQYOhoN1yObraeTZy+aEkSk9lXQQsGDQzZ4iXY8G982DA2HFA
 juj0gKNU5oBvMQb4h6N2apP+zCDJm3p84WOg6h5k2KFUvTdd8C4jT35uVmAbqzLA2Vl9
 kaLzgR+4kOVY38bPqSoChROG8ph6Zgs+Yv8qssa3ErF4BTPKvEQzpDw4eMhWXulZ2GI0
 OHo4B4qjRy9wWupvBa7iwO3TvAt3kf1rvD3EET7ECd17ZRKRRCpvFgSOIOc+5K4AKJJk
 QcQg==
X-Gm-Message-State: AOJu0YyuJpsWT+eaiD7Xe+mh0840Kb5Hy8JVjytNmKXPz3p7q6GyMK+u
 2ilzAMefbGlzUGoyFjQYhW/tyaCTirwiG1kfXsgQYZq5X8n9wlyAqVvNQTPGatz8Dh4=
X-Gm-Gg: ASbGncsdTEWH4XiMwJbrU6APUEC84BuHBsjxSQtU3lzMQNCwGPhvrTUlbymKcLdoCEu
 x8rTdc2yOFq7yNDCCW4RRg+GQCrqvTmyI6k9OT+6KxOe4bZCoVlpWEreGULQrHicCkVV/zc3yDw
 mAaV6P2CrPpt2ZMcCw57q5jcNnvsPZvXBSUad7jS6DzaBhvltUjMx4ZtYkmFd9CnBubmzwOb70K
 qJ7NeRyGZPuINKcOuLGQUibZO8L468kJ+qVYbqhf+cepDZ6XmLCfp54kN63Vn0Kr9LqMa8U6ytg
 woXQebsh1/y7UdJJBaEx07zM+NVrWN3RkTPkDRilD+dekzwn9O8MiNRSmIo9hTTqv+DXPjeimEN
 RpGGAZLeCwazDG/duiP4ucokBHhN1wTgOunU9/K2bw+ohHW7DXU0Auw==
X-Google-Smtp-Source: AGHT+IHchy/28th+xU0fzEQUhWURMN5gK9cGjR/X/RP803Si12JCXg77wbS/BLHAWVSPPSGpdz0iUg==
X-Received: by 2002:a05:6000:2007:b0:3d1:abf7:e1d9 with SMTP id
 ffacd0b85a97d-3d1dfcfb948mr8671065f8f.35.1756803633392; 
 Tue, 02 Sep 2025 02:00:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:00:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/5] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add
 support for HDMI output
Date: Tue, 02 Sep 2025 11:00:27 +0200
Message-Id: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuytmgC/32NQQqDMBBFryKz7pRJ1BK76j2KC2NGHWiNJBIs4
 t2beoAu34P//g6Rg3CEe7FD4CRR/JxBXwrop24eGcVlBk26JqMVrn6RHjfFhhQRTu4tWFpX29o
 67Zob5OUSeJDtrD7bzJPE1YfPeZLUz/7vJYWEg6o611QlsTGPl8xd8FcfRmiP4/gCwVV0gbcAA
 AA=
X-Change-ID: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/AvEkFL8ZPL0QX5wT+kkkwMlzldfAIudlswK22svjfo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrItc0wBzFb+X3fEn+n3Klrj6iXvjRNIAzCMweDN
 97yr+i6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLQAKCRB33NvayMhJ0dyLEA
 CApfG/eA7wleGCfq+kgzplNW95NCgw/c1jiZUk7LzJpgIIhaPA+iZ7lDhGD6SFQRD3/jhLVwl5BOVj
 E1GjnmzBI2tguTepGzydl369M+EbnzI64QUq2b3KiaM8K0aKXM3+HvUVuaqWjbm0rQU0r1KvCNN9YF
 yhdxMTLthirxY2ffP2yAjRvKPUAQco4t18XUGOaV6LttkAt7qWXayvYongE7r2kNJKxPemctif77ry
 SAA3WK9G8HtOFtSmUg+N4sQXgkj3u1FRelH1AHkPLAPYdGurTFd8rTTToLDyAdSpQOOQbnfgCPpELO
 5txIHesHPB1fN2hBPRvjkj6nA0zp6J48hNIuDpH8wULfG+VfaA4vI49Vz69TTzUxKQTuiuY/2n1zm0
 wkahQWU5Ta3ZmerGV+u+kbkTBOOlX92fuRzJ/FO5Seub53eQgn1fcHoKKgAxC0tySQd0jaP8bIDyuO
 iI2+TNaVJv/VAA+4sYzdgDja7T9639qw4cuCDPNUmzR/wGKM2wTwHT0iL9KakxrXSnx7t8G6rjQ6r+
 QvpBAa5lItszFDL8n39IXkUoJ0RH65ob9oSNonK/h3hjvbwQhSQ+8eLascE5fo1njFhJ+EdvMmoh86
 CNgKvbR8K9HOBYXbnGSxucBckKWbI41HqZAaTRzMKvFT8IOo1UKSCP4mXQhQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

Add the needed property to specify the lanes mapping and
use those in the driver to setup the right PHY mode and
orientation.

Finally Add all the data routing in DT, disable mode switching and specify
the QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Model the HDMI transceiver as a simple bridge
- Switch to a static lanes mapping property
- Link to v1: https://lore.kernel.org/r/20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: bridge: simple: document the Realtek RTD2171 DP-to-HDMI bridge
      drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document static lanes mapping
      phy: qcom: qmp-combo: get the static lanes mapping from DT
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  29 +++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  70 ++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 118 +++++++++++++++++++--
 5 files changed, 214 insertions(+), 9 deletions(-)
---
base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

