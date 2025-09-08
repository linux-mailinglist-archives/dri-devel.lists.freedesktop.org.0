Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D96B48E88
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F016510E521;
	Mon,  8 Sep 2025 13:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TtXaoU7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC86F10E521
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:04:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so26316295e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757336665; x=1757941465; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F+BmpLQdceYRG7RY6FfRDG60NShGiPldYqA/h5za8sM=;
 b=TtXaoU7bFg0w7xeJAM1mHLcEuvtFI3Cl2qHE0AFD6Yqu8KfQXH1AXU7GiQYxSia67E
 5Y/aSqGvOkxfjN1nmDcfDb/zJOLAXPd/nDIMFkeH2r2d6gV0EX9zhsKjAUnxIlYgQZdj
 bkUPSCHmed+clmywweIMlTax/BjO6Cive1GlznpdBJY/pfztxdsU39Smv79BFM90mfv0
 l6Fv0Rwwg5d28LhcGMmdztiZ8W7iuzZdHRcsnpv/orqJpqAf7q9vs5HnLiDbuyCpQ62X
 TtD9hpRyYMPZnjEfZeSXviPEpyv0UYMDPmt0Gz/g+37RLwI7tKJE2QURP+6xiKSKHAGa
 LxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336665; x=1757941465;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+BmpLQdceYRG7RY6FfRDG60NShGiPldYqA/h5za8sM=;
 b=doGZCXhytop2RTr3ppfkETtTVtv4yoQEb6DepvXgBNLYzbmhudE6p27yrFUh7HJg2P
 1+xhzdUefRW2WbXeedgGgsXgr2Jq2mP9qbPwr8KXArK7biRMw9c9xKRN7EyaNZR9PQQ1
 8hbohiQWrvNHnXHQ2wx5giQmbxOd7abvQd0v5hmq1oEicG+8lh0MXKIUPkablyyhjvSU
 9sulDDH+8C9U0iuxhKZEx9wg8XTE+UkNZkgNVySRnKwgFSVbxoQ0x81MTCiUYB3b0Sp6
 RdUzND3U6lumG1lWYC2jnJogxQUysDsd7P04V2WB1xhZkW8S9oyG961MI0JtFYHAIjbc
 fSXg==
X-Gm-Message-State: AOJu0Ywr8R/n7bW+HBqIsPWESJy3fK5Y9TARIYXmGuQmV7Tbsht952m/
 ASKhFJoC5vv5mYr0q7q96B6w56B19lFShUQzRN9j0cIedbH3zK52gjf8tUeGLHHE4X8=
X-Gm-Gg: ASbGncuptHZzgtaAFl5RbzNAGrn3s0L++GiY3YZxyys4pWaGGGdwrhKBWbMLyg9dzXO
 dWqsOlry1lyUaCO7qQxadh2694GDwNCJEUHEgz4/ZSkvCTXla9C/87MW/zBGlToy4cluzXfUBzs
 /qJirXkxcEJtERWv0ZBBFqCRAqcnFeUF9+99mbrEcG2ZHSOJzvXOhGyptwwYXMqEQklAKJJk0ub
 sbhMArpU3F3Hn8weZ01gVk1cGaSRKyR/ZY92GOlRAhvLmXlZkJ1E6Ab4bCbpmWk3RkvxcV4BF3I
 js8ROvre5fHbJ9mokP9LrXdgGUUQONYR0bp5qpHd84k2kK6PffHk2cmi+jceT8SYhPDYAeb9EDA
 TYRn3kB1E+S1wiJtvjLWiFeExa76+g/kk1GhdZ3oca8Xp1BYF6EOUDg==
X-Google-Smtp-Source: AGHT+IGTXRp8nBogkgIlcEf9RUlMXZE1MYZ7qwfcb5uuGBnjJTSjf3Iluna5GLbfmKKFomw1sOdvFQ==
X-Received: by 2002:a05:600c:3b25:b0:45b:9a41:5d58 with SMTP id
 5b1f17b1804b1-45dddea60cbmr64611275e9.4.1757336665015; 
 Mon, 08 Sep 2025 06:04:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:04:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/5] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add
 support for HDMI output
Date: Mon, 08 Sep 2025 15:04:17 +0200
Message-Id: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHUvmgC/33NTQrCMBCG4auUrI1M0lYTV95DXOS3HdCmJCVUS
 u9u2o0I4vL9YJ5ZSHIRXSKXaiHRZUwYhhL1oSKmV0PnKNrShANvQXBGpzCioTNzAhgA7e0Taa1
 tq1ttuZUnUi7H6DzOu3q7l+4xTSG+9ieZbet/LzMK1LNGWdnU4IS4PnBQMRxD7MgGZv5BJPDfC
 N+QxhgPzp+l0l/Iuq5vVuxBq/wAAAA=
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
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GJhPHTORzQeMZdAUCocINlbQeRuM3KT1od1O9w0/Xmo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRVDMVGgxHzLejb7eBbyoFwp6E4YEQMRKPg72/U
 Rwjh/ruJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVQAKCRB33NvayMhJ0VxID/
 4wFkdgfYu9J7loTdKrRz5TqNDd63WB1xnl/W4hVSu2QdX9wb2jyH6rUY37phQY9rtVycGyJTzy4cnd
 bi2OjtCN2t5VD8MJF2QB6RTWRYeGqRu4Rturr3w/3WcTHwlJ854MSYrHL2hppI1f8bZyB6wqswekus
 xYvmd2waH5jU0iXp1rLwrCdBphUPyvJylV8oSUb3kyIcZjNbgmjUpIuBSZIkBekeYsesIh8s3Il5zg
 oRiIcBFWFJA8XLfk4Q+Rva2EWkGskG1obCzljpnJDspCLDirzii4iD19ShH59aTy7dJu36GdP7/Qsa
 ISdwycHc7lETEQ7dzSF14MzvjAzSB5fDCqhA7eny3MpxBperELbkHibfuDBClM4cT7u7wT4H0jwh0U
 EHwpwuOgpCH7CM4z4nqMmOKlwUy8hZursraRsi2sFYghdAKSJKOK95FakAnAYIcTDPRNDcNNdACV4j
 mMhQ4hD3ZW0YNJbhQ+PVu+9XT7Qw+eBcueBCBbTZJVj5Za25jgprIzt8y85t6nv6yz3nAkUAM8dNC0
 ACpUhXWFsEKTVcFO+3wmtS5pPNqWOww0dSqma3wv4kx1s0LeU/ZKSbdWR9fPnVjnLXQno4onht+nvJ
 f9JXE2dW/js9wgGCRf5Z3Ca4GV19HstrNjpQYFXQ7mQtwZDhH+hhVM9dOVCg==
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

We need be able to specify the lanes mapping to DisplayPort
and/or USB3 peripherals when not connected to a Type-C complex.

Add the documentation for data-lanes in the out endpoints amd
use those in the driver to setup the right PHY mode and
orientation.

Finally Add all the data routing in DT, disable mode switching and specify
the QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Depends on:
- [1] https://lore.kernel.org/all/20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org/
- [2] https://lore.kernel.org/all/20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com/
- [3] https://lore.kernel.org/all/20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Move the static lanes mapping in data-lanes in the out endpoints
	- new bindings
	- new drivewr implementation
	- new DT layout
- rebased on next, fixed simple bridge rebase
- added link frequencies for dp2
- Link to v2: https://lore.kernel.org/r/20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org

Changes in v2:
- Model the HDMI transceiver as a simple bridge
- Switch to a static lanes mapping property
- Link to v1: https://lore.kernel.org/r/20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: bridge: simple: document the Realtek RTD2171 DP-to-HDMI bridge
      drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document lanes mapping when not using in USB-C complex
      phy: qcom: qmp-combo: get the USB3 & DisplayPort lanes mapping from DT
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  59 ++++++++-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  82 +++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 132 +++++++++++++++++++--
 5 files changed, 270 insertions(+), 9 deletions(-)
---
base-commit: 947efd54a86984b5f7dee9cf18c1ee82ec0361a2
change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

