Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97DAC2E73
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 11:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897FF10E19B;
	Sat, 24 May 2025 09:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uR/5SOvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC29710E1B7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 09:19:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AE76FA4A12F;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37130C4CEED;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748078354;
 bh=NywEqeDWKIE3DJOODAgld7o8NJRiMHAFoJbk7OTyI6I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=uR/5SOvAlooICmQl+drAIMv5dS8CRWyGSVlMnbggC7vQmJclZoRR/FAXurGPnJrc8
 SFQbTfHRW7Cl22N5ZHcfFS091Pn0hyLmESJQNc3oMYN2cmSUDSHoF6JOOFzwkZ3xK8
 +E0ODQpqcEcu7EXAWHGFetpSyrsDXKKtIQRGSydOKijwgGFPRxFSjr+HDi7nIrk3ct
 J1X0bl2NGmkub1g0x74xdzX/vz0hLqrO9b4zlpUAVPRkO2LdWENWM0W0U8WERU+x/4
 gNpvmHkWZMXNYG0nCc89v5mNt3h+Kw+Tx/czFMgpq8D6J42TnwlGN84IYugXxYf+a8
 uewnVZRps/dOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 259BEC54F30;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
From: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 24 May 2025 11:19:08 +0200
Subject: [PATCH v3 1/6] dt-bindings: arm: qcom: Add Lenovo TB16 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-tb16-dt-v3-1-17e26d935e73@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078352; l=905;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=2g8SM9lGMgdWyCMNBhCp6KQKXsIP6Oe0w1ibkHBucW4=;
 b=xz/DTjymTkjW3jAKwrwD2tr5eegtPJAe6HcgyLVa9GiExzlhcosG3xdgykZoBQMtTweaRSVe/
 skNL2rPQNUOBNpa+v4/EFHPqRFbQDhHake7o1c3klEN174g/KVdZGen
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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
Reply-To: jens.glathe@oldschoolsolutions.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..5654aaf825955f8000355600c0ae35b74676273e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1153,6 +1153,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1


