Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9005578CDB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 23:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4911121FF;
	Mon, 18 Jul 2022 21:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Mon, 18 Jul 2022 21:37:07 UTC
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org
 [213.239.216.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 199B710F7DE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 21:37:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.178.197.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 85B24140197;
 Mon, 18 Jul 2022 21:31:06 +0000 (UTC)
From: Caleb Connolly <caleb@connolly.tech>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH 0/4] Initial support for the Pixel 3
Date: Mon, 18 Jul 2022 22:30:47 +0100
Message-Id: <20220718213051.1475108-1-caleb@connolly.tech>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series adds an initial DTS and display panel driver
for the Pixel 3. The Pixel 3 display uses DSC (Display
Stream Compression) which has been supported in mainline
for some time now.

Functionality includes:
 - Display, GPU, venus video transcoder
 - Modem/WiFi/Bluetooth - ModemManager seems to fail

The touchscreen uses some HEFTY downstream driver, hopefully
we'll come up with an upstreamable solution for it soon and
make this a bit more usable.

Amit Pundir (1):
  arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)

Caleb Connolly (1):
  Documentation: dt-bindings: arm: qcom: add google,blueline

Sumit Semwal (2):
  dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
  drm: panel: Add lg sw43408 panel driver

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,43408.yaml      |  41 ++
 .../display/panel/panel-simple-dsi.yaml       |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm845-google-blueline.dts  | 652 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c      | 586 ++++++++++++++++
 9 files changed, 1303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,43408.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43408.c

-- 
2.36.1

