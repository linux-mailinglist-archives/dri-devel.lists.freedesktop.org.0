Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8D8B0E45
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8610113C23;
	Wed, 24 Apr 2024 15:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FQZYzapv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC78F113C10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 16D2261BF5;
 Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB173C4AF67;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713972570;
 bh=GHuQ1HT+FCoEdjc3sTAOaE6jN4Sii4ShQFjHbxCz/4g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=FQZYzapvKPsStieqUCu1gfkOJ3Hl63RXAFnRMHTtB3ebc+OmeGPVe7Y/CngvMGqal
 M49hFPk5N/CPqn+dzlnHP8aZWz3OcYqcvoee7gRWkk4idwNM55Do6xS9TTv9DaiCyT
 IoumS4hPT5gXpKOgdP1TjLHyXYVyFf29CsKmDZWfVLiEb7CFCZ70sHSjzGUhY+23Ic
 Ew97MMdfmAiTJe3GFumxmZ4oWCGa2637ImEGul2TspgxEub2InP8lPtKrLCgOLGcUb
 JShv/xwCtCZfCrpWYhdpXMkiBUf1cviouDhU9VW2Vglis+fkx62TaHqe9SXO5kCbW9
 ZdfDIjV6d34Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A2681C4345F;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Wed, 24 Apr 2024 23:29:14 +0800
Subject: [PATCH 09/10] dt-bindings: arm: qcom: Add AYN Odin 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-ayn-odin2-initial-v1-9-e0aa05c991fd@gmail.com>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
In-Reply-To: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, Junhao Xie <bigfoot@classfun.cn>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713972563; l=733;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=IWMEwTxqsDx0Pa+feRUvwg8F4G6cj6QTAKgbPe9K9dg=;
 b=iD8DU0abmJ2QjedN04FauD4gidVpA+VEmLsIeXWjq4WakuoBBDP8fgdmXR8tOuuCLrz2NnT7r
 64ShVrCrXD7BVvnsjrEyKIz1oDbYkgB17nJGRA3pr/Nbocbh+33xUJm
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
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
Reply-To: wuxilin123@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xilin Wu <wuxilin123@gmail.com>

This documents AYN Odin 2 which is a gaming handheld by AYN based on
the QCS8550 SoC.

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 090fc5fda9b0..8e991f2bd9d8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
 
       - items:
           - enum:
+              - ayn,odin2
               - qcom,qcs8550-aim300-aiot
           - const: qcom,qcs8550-aim300
           - const: qcom,qcs8550

-- 
2.44.0


