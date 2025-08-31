Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE19B3D317
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 14:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A87010E2DC;
	Sun, 31 Aug 2025 12:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="jW9nqQbC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CJzs2e+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44F010E2DC;
 Sun, 31 Aug 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756643377; bh=wcjl887H9qoorQWShXf6Wly
 U3a8kHxCqn+dkIRbrhsg=; b=jW9nqQbCARTaB53zjkeBmYgEo3bSR+9ci4+2bDGyWg7VLsINPY
 lKcbbzXjRTxCeYnnhIpoQqYRfniNl/TFpaxIKudT9U7D4Yp7EA0356lrytyu6EWnZCnRSEaf7pd
 MRnfJ56h1HAfBrnlHXIMf4tU5Bn7tWToRsuf60LKMSAueeZZfRUn4nTesjo+v9nKeZ0IuzELgae
 pwppIoIOcLnkJPQ78qMEdKrXIvcHBMYzHJajSaeHX5QM6AzSreg8UyNWAm48aeaKtcKAjvNFcax
 FKoSEA9VMc4KMsiQXMAcPBgcDu29ZZOrME8N5+3ZtEA/Rsu15n1Knq40yXgUR5OXZkA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756643377; bh=wcjl887H9qoorQWShXf6Wly
 U3a8kHxCqn+dkIRbrhsg=; b=CJzs2e+CSsmprw9Ueajhf/tWxg27Wd4gsWnhupfjozD3ePsv0e
 kKC+00k9ITy7u/borMEFwuIbEwtTcwpHXHDw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 14:29:27 +0200
Subject: [PATCH v8 4/7] dt-bindings: display/msm/gpu: describe A505 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v8-4-b7dcd63caaac@mainlining.org>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
In-Reply-To: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756643366; l=919;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=wmw2TX8XeI2jwe+eIPMA5Br3dVaIT7iuD5zo+71Kf2U=;
 b=RbPShjv5MKWNvSkEm+xPfDJeWQqTzNuY4hV+79/V/xWYs26D9HDtKUgaPKzP624mKYnEXNw8a
 cCz0frRxlS4BxqoYqpuVnZwHdlG5sNSTTUviMcNsuUefS5MGzmPEmBj
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Descirbe A505 clocks it is using same clocks like A506.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 7ef80f9fac8b2927b2a69100a7f6c729d9d188ab..3696b083e353031a496a1f299d8f373270ca562d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -252,7 +252,7 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-506\.[0-9]+$'
+            pattern: '^qcom,adreno-50[56]\.[0-9]+$'
     then:
       properties:
         clocks:

-- 
2.51.0
