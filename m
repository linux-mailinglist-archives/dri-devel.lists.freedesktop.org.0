Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4FF6520B6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDE210E3C1;
	Tue, 20 Dec 2022 12:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F397910E379
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m14so11582175wrh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
 b=s9TvukM0HHt40g/oUshz08pAm1Q1CZk37Hc7ZgrtA3pTX4P91kpKacGCvFtDDOoiaq
 Urn5YBNn4KxB1wJO1kdfafpEsrPXw36E4c7WENt6I6mQPmIrZsMnGJTy/rEE7aW8dO0g
 cKHpiKtUnWfHzu9GWeGowNCRfFmI3odBfpK6TsDi8arGXgPQTwpRpnH2DC3V63DAcdtS
 E5s93nHUYDlGSl+M21R13xcFyCdZDMABI+KcM5itdy4YP++wWYgApDgatkGwdHDXIlhZ
 5Q2tGXAd0iZm6sTDHhEURgfRmWR2CPCdQ969Vz/CsMDlyV3YdyehIIx/DY/AaPxk5lnN
 hkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
 b=OlNROgdhDgFSEjPsLYhgq4LrUQjNKQnsyuywz5uAy3Nvt4iWBy2Rfmrtys7b2eXqeJ
 HQb1tvzNZ3Yj/1AdbzKoeSn/TmDasHIHGfYfnksLwv3fIVEpUUwmYPanyNina/vYZgj3
 9ojEmvzv4oVKmLqNVyagI+5PwEtLP1TZTzAG8apKfOHI/KHBjKK6GU/MyzS5J4/46uZH
 29TzQNd0FT5pwDQwo0FbNe2mGtrqhdEaPRLBMaYNJhDDUdK+nzdcHpQxioR6PYTf+TRI
 jq666rdR0/LVzeZYhJUDeaXYDHscPh8QeNL2QY4kJy2ZX5karjzOsrN8jagmqKcPl6TB
 6hWQ==
X-Gm-Message-State: ANoB5pnkVyWFAZ9uZnJFdCGu45/Q9fBX7bxMCBDQQRabhnhWZY1YISem
 DmjFjwYl2SM7x7kMunjV1sSbHQ==
X-Google-Smtp-Source: AA0mqf5FEsKG8y0jl+VlJ7xAJlAbyC8Axb0e+cF5OkY4VbTKZbsDhwKFiVS4XiDLWAZv0WxJaHGpiQ==
X-Received: by 2002:adf:f205:0:b0:242:1809:7e17 with SMTP id
 p5-20020adff205000000b0024218097e17mr28988045wro.6.1671539798229; 
 Tue, 20 Dec 2022 04:36:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:37 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 01/21] dt-bindings: msm: dsi-controller-main: Fix
 operating-points-v2 constraint
Date: Tue, 20 Dec 2022 12:36:14 +0000
Message-Id: <20221220123634.382970-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index f2c143730a551..55bfe1101d6f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -138,7 +138,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

