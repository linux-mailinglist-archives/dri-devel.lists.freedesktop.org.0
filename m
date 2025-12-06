Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E2CAA6FE
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EFB10E2E8;
	Sat,  6 Dec 2025 13:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fc9TUIcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138D38985A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:34:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54AA6601F8;
 Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA53EC16AAE;
 Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765028084;
 bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Fc9TUIcp14ROVpX2bXITLBwgo/+wwuJuCQrXQcFrWllQnh7K1vzWzT7pvG6lz8S9o
 BCTX9TXpYAMgz/+l5QsPj3c9JPmec9gdxG3Udbh5Xrii1o50jGHJ9XSnYiPeV3yItI
 99pgAehMAB6KDk+ghAnEZdK8+Lnt9rRPaW0025adiv1EcJzkm0U5eTYvRrj5iwBubT
 XALoCwJt5hVvVKifakVXrWrI7hdPqMnZ8aPMNBpzP5i69SSjkBqqM4ZJYfv2uoXpvw
 HEQ8buHcwSjvKUSowS6XuvhoRozXhDSURjYGIaegM3VhdAACH6AW+wSKW1L0+52Qkw
 qk39374fWej4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DB36DD3B7D5;
 Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:18 +0100
Subject: [PATCH v5 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-1-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vnt/xXHh7c01EXNWnpunAXvFyH2vLjx4UfYXxFc1+5w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwup2N1oiIS9xWiWvjTHX9KPfgx5ywx63Mv
 pnwSS8wgs2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 ckxwD/9EqAjogwvcakPub3hc3GzFT7RcCSDhB3usRiY8qE0ulXukulIDRz+rOxxaXnOR0Epbq4I
 ngF+zXNNPnhjmZvu0JoijIQuFPP6U8N23jh9c/mP8v/PdkmkElF5TXxa9vUGumwzbthlSQ5VWwL
 n7TNQSl89hVWHz6abxBNJm2TPo9izfjhrcbQPjujc548O67sFPRIhSq/7xzIpb3yPfE50On5vwd
 mW72uk6l6kJhtGmUJ0IKEJXm8W6MchRTQlo9jDiYsa/DemSQrZuiDfLzsjDaIFYqG4TkjQXi9Of
 vRK+f+yIN/0h5f8m47BovNv7PamXxeyoWGZmY6YcNO4N9qev/HGCZpaA9oXV046IfRtyZDN0MuO
 TSKwuR/qXjNFO6JJP8yCmeGnrj1oYO7sjesuFJ5X2DDN2vQ7WFRIw0r6wDZQ+P0P8oGCO4H0vJM
 UM7e3TDhCl96O9ZkSFxvj8zM/7BSLOgDW7v6k3XAoRpaHbgbVUV8HTt6GdHazm+47DbWNhJxLoJ
 T+flF/ar7ap6GfMQBCzVXxOSDYlpS/MIcUzeuFNHan8sfBK2JezZ+kJRUTe6hr0qHq8OvwY8bBT
 3ANxlKpdBtAAs6tQaNyBuL4EqsTa2SeB/QO4mQERwzzTNjbahvS8BA7IXuWehEnTeZQtBGNB+zD
 StKM1bpQLCfCX4g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Document the bindings for the Pixel 3 and 3 XL.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010..760b6633b7a55 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -900,6 +900,8 @@ properties:
 
       - items:
           - enum:
+              - google,blueline
+              - google,crosshatch
               - huawei,planck
               - lenovo,yoga-c630
               - lg,judyln

-- 
2.51.0


