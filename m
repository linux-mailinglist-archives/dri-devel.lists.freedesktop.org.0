Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78353578CA4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 23:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9640010FB71;
	Mon, 18 Jul 2022 21:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52010FB71
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 21:21:15 +0000 (UTC)
Date: Mon, 18 Jul 2022 21:21:01 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="IzB/Ub0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1658179269; x=1658438469;
 bh=uuxbUlzCKdnpZQ6Bkv9TYCn2NI7EQjaHey/D4Mc3tUA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=IzB/Ub0GgV5wggzkvrEZqasbSUjxuJFUti94hWvwN4T9SiWQOiqfoiEZBaC+hOM8j
 j6G+owLYtmjMfyApEl7cKA/gsN17SBCNTcV3YG/0VWGiiR4LBolk3QXt1ctiL36V2J
 6T6OTTZOGHseIGqKwess0gITCrwBS3gYJ/eyOzFc=
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/4] Documentation: dt-bindings: arm: qcom: add google,
 blueline
Message-ID: <20220718212019.1471265-2-caleb@connolly.tech>
In-Reply-To: <20220718212019.1471265-1-caleb@connolly.tech>
References: <20220718212019.1471265-1-caleb@connolly.tech>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the bindings for the Pixel 3

Based on https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlo=
wski@linaro.org/

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index b727467e86c6..b3e1004673c7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -320,6 +320,7 @@ properties:

       - items:
           - enum:
+              - google,blueline
               - lenovo,yoga-c630
               - oneplus,enchilada
               - oneplus,fajita
--
2.36.1


