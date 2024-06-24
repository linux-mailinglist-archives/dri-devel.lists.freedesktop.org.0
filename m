Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F64914393
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1510E387;
	Mon, 24 Jun 2024 07:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="cG9qQc0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF5F10E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:37:32 +0000 (UTC)
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719192638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DPiqlmEdz+huNfaROcH5raunMQ5usV08vHBbUzlLmCw=;
 b=cG9qQc0PZkl1dB6yVj+jn2lK8UicsWZM3D0LzvIOEwSfgetD6G6UHfBP9xvG5qwJjzTpOE
 SD8sCVfLf5vUHl15aOBk99CqC+LdoBNUBGKLdyNnAffz2IZ+1COr6HSPuqzVfQX/niD3wT
 nX7IBe14b0YS7NyPbJF7awojtTrhHLxSDz48MqCuIYyzILGt9sdK9K3KUgH8rFvGLsFBUZ
 Edu9xHVjD6NNRZCXFDZDsK8FEE5bOAmc6tfs1NHfuj0g3I8NIkqz42roKZsAIz/hHaPw79
 8vAjFg4uOoXn2p69zdu+sTlbQQzGrUoxjGKF8M1QaLtZM/RVKXhBETQgcWKeYw==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: frieder.hannenheim@proton.me
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Subject: [PATCH 0/7] qcom: initial support for the OnePlus 8T
Date: Mon, 24 Jun 2024 03:30:24 +0200
Message-Id: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDMeGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMj3fy81IKc0mILXXMLCwMD0+Rkc5PEVCWg8oKi1LTMCrBR0bG1tQD
 oLMmyWgAAAA==
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Frieder Hannenheim <frieder.hannenheim@proton.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=gJySDeHNzUMmgMAkltwdLfTj/QGlTPa+btmCWyagxfQ=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw76xnu21LktGELVLl8li5pECNHzaMxmAwP6
 3ccGaTDegKJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMOwAKCRAFgzErGV9k
 tqQQEACBEGnd4APKL/QmKXVWbTeiHSqyBBlpUqUsLFCuLkIgqz1g/qO33s+Uk7oN0ifamwnTAMt
 hVlzvjklOWa6tnNYRQSVOPxhzVgmnDvwbq+8nc8ff+3BMY0hZYP9UXheV0nHzZ8zIj8lQ/zOI+y
 osjh6iPfuVO26LPZgj2S7fW/oSqIwacRIxwjL7DFfDHVIpzIQABtpXTh8qPMK4x32wuMAQJGBZH
 FTGREQApSbvnmg+oed8D33ziLu1OHjjE1ykNh6Q2qLQJ2/UbKs/GkhnxjSUdsjJMQxuGVe5o4Qn
 3CkVhtGhkKxDx8pJAyLMzOyWRU+JtOGz2kZydbbbOqjNFIuSFAPEdky2AmMRBIiEOl131iAzrpl
 x22qsL5q+I7k8wNd02Gymb/O//t/kGgoJTDEPE3txQ1Of00+WKRRr4dcyc6FKcipp4RyBZxodQv
 1z8V0H8tQEfPBirbvqtTMUDo9AxJvAN+6B9TOXoI/oKo3fMMGlchJzogywy6TlE1Zum4rUO63Rt
 5oKCdhC3qEftaUSrwvTq40uSu5209j/ozkYdjywKf0XQ7s6u50bTZuOHPIHdrL7Q5POeXDfKI+2
 +2/eCExf4ogNYGzk7qbI14/+vq+p786SeLnlfadUuPlyrGYppiLulb39ysN/VYt3wE3z9jyS74e
 pobjEGbxdnYHrkw==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

Add bindings for the SM8250 OnePlus devices, a common devicetree,
touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).

The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
featuring the Qualcomm X55 5G PCIe modem.

This series introduces initial support for the 8T, adding drivers for
the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.

The panel driver suffers from similar limitations to the LG SW43408
panel found on the Pixel 3, namely that after toggling the reset GPIO it
is not possible to get the panel into a working state.

Given the apparent prevelance of this issue, particularly with DSC
panels, I believe this is a bug in the core DSI code, and not a device
or panel specific issue. I think it is still useful to accept these
panel drivers into upstream since, from a users perspective, the panel
is fully functional just by leaving the reset GPIO alone and keeping the
regulator on. The only (theoretical) downside is worse battery life,
which is a small price to pay for a working display.

The Synaptics TCM Oncell touchscreens are a new generation of Synaptics
controllers with a totally incompatible firmware compared to the older
rmi4 touchscreens. A new driver is written which currently only supports
the S3908 controller found on the OnePlus 8T. Downstream vendor drivers
suggest that the controller supports custom touch report configuration,
one can define the exact bit packing of the touch reports, however the
combination of controller and firmware available on this device does not
allow for programming in cusotm configs, so for simplicity this initial
driver uses a hardcoded bit packing to decode the touch reports.

With this series, the OnePlus 8T can boot up to GNOME shell, connect to
a wifi network and browse the web with GPU acceleration.

The touchscreen driver included here is loosely based on a previous
attempt by Frieder Hannenheim which can be found below.

Link: https://lore.kernel.org/lkml/20240327214643.7055-1-friederhannenheim@riseup.net/

---
Caleb Connolly (7):
      dt-bindings: panel: document Samsung AMB655X
      dt-bindings: input: touchscreen: document synaptics TCM oncell
      dt-bindings: arm: qcom: add OnePlus 8 series
      drm: mipi: add mipi_dsi_generic_write_multi_type()
      drm/panel: add driver for samsung amb655x
      Input: touchscreen: add Synaptics TCM oncell S3908
      arm64: dts: qcom: add OnePlus 8T (kebab)

 Documentation/devicetree/bindings/arm/qcom.yaml    |   3 +
 .../bindings/display/panel/samsung,amb655x.yaml    |  59 ++
 .../input/touchscreen/syna,tcm-oncell.yaml         |  66 ++
 MAINTAINERS                                        |  14 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 866 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  |  36 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  40 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-amb655x.c      | 420 ++++++++++
 drivers/input/touchscreen/Kconfig                  |  11 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/synaptics_tcm_oncell.c   | 617 +++++++++++++++
 include/drm/drm_mipi_dsi.h                         |  16 +
 15 files changed, 2160 insertions(+)
---
change-id: 20240622-oneplus8-788005cc74ae
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7

// Caleb (they/them)

