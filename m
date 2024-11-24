Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958F9D6D5E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 11:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1E610E200;
	Sun, 24 Nov 2024 10:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n46VcJjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2EE10E1DF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 10:01:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8EC0AA402CA;
 Sun, 24 Nov 2024 09:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BAB5C4CECC;
 Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732442469;
 bh=wsiWmyEwu4YNSWKps6tXSxMb1RutH3lVHwYYksxB0QI=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=n46VcJjgrQWg0gin39QbCuRxut/3Z6IzIUIsS+sA6JJhsNlhmpwMOA2dt1vQVIvND
 j7SJcwl+wVsEfO7O4ghrHgc1be6Rdw1HqEI4AcestZ2n0itBv42YAVWCneNjHIgoCZ
 mygIpyE3WS+CjRTQor1pQU5LmAokbv55T2amxL1EbCGajXkI23X9eE4K1qVhamTwEd
 ywBORZnCVPdabGTVTvvD4VKOFZi+sHmEZQljpEc924++gMEBbpC7Sd4QZHwLNQU+O4
 7aJ+sbJ6PMo/UIKt/rM/kUxqslFKGLYNPl2fMekUvHt8Un2p35vtbC+8ujdfihUkYg
 FCnT17QsUseYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3072EE66887;
 Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v3 0/4] Asus vivobook s15 improvements
Date: Sun, 24 Nov 2024 11:00:56 +0100
Message-Id: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFj5QmcC/4XNywrCMBAF0F8pWRvJo09X/odIGdPEDrRNTWqwl
 P67aXEjCC7vcO+ZhXjtUHtyShbidECPdohBHhKiWhjummITMxFMpJzznIJ/+vqhbF836McOZqp
 0ZkwhKilTRuJudNrgazcv15hb9JN18/4i8O360YT8oQVOGS0zqIypRMoAzq2desDuGFtk84L4a
 4hoALsZU2ZFHnvfxrqub6RDhTz4AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732442467; l=1685;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=wsiWmyEwu4YNSWKps6tXSxMb1RutH3lVHwYYksxB0QI=;
 b=wMo89KlcYiVtbpv3CmvyQ2to4ZkboF/CtjQQKLMntm1f+0+og1b/bOfmCy+L0Or5QNGBGlBGG
 /8olbMCxBN/DUoRth+saS1ecD+A9h0S6NfXITmKyvBoxJ6A5KS9emRq
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
2. Add a lid switch
3. Add bluetooth and describe wlan (depends on [1])

[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

---
I seem to get a warning that the pci17cb vendor is undocumented (wlan)
I can find this compatible in
Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
But pci17cb doesn't really seem like a vendor name to me, I have ignored
this warning for now.

Changes in v3:
- Fixed commit message formatting (line wrapping)
- Fixed bad indentation (lid switch pinctrl)
- Fixed bluetooth addition and added wifi description
- Link to v2: https://lore.kernel.org/r/20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com

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

 .../bindings/display/panel/samsung,atna33xc20.yaml |   2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 201 ++++++++++++++++++++-
 2 files changed, 202 insertions(+), 1 deletion(-)
---
base-commit: 98fb106aa5265aab0d857a942c410a753b470cc0
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>


