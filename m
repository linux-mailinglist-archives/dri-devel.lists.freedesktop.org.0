Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B354B69A9FD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740B210EF69;
	Fri, 17 Feb 2023 11:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A882310EF65
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:13:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y29so956073lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=20OCfuLzA9fqgo8AT1mDWVtFNDiuNjsVIu2uoLHzxWk=;
 b=M7B9dusj6MIYmuDnw4a2+gkHtOEil5pVYeLlsyq0LtpccdoRJkVfAhfKtNG1wbNmgT
 Yx671npsFn+FMm+XEgqGdrr0U3yCjYo8GltBUXigdpmsl+gfVQMTefQrjVUqDP0m8akd
 mkqBdIFYbEmBbNObAt2vFzbJKot1qX5m3/NXq7YRTypAyFv7Pwp2JxIrudmJvK0QoZV8
 OVm3wCu1WOdeW1ja5/iLUHMZnRnDAOPp/BYu60DfwqiXnTqN8w0WC0aWvRNnUE5PaIhf
 Dxm3z5FY4/x9+CySIcYZ8tNc0etWFFWxscTPmj3Y/WGCBEz33RRn8sQVXgUM6zEE8KfX
 fn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=20OCfuLzA9fqgo8AT1mDWVtFNDiuNjsVIu2uoLHzxWk=;
 b=0oGNc/WfiJCjm6qzyvSyoMoEeWrze+oWaccZ/G4lrEIn9fTuhwIuogoaVwSRBkK6DK
 WNkcK0eORFYMAYbki0wNTLx+ISaGsUcjZ3RL0yCWBLzMdxg3krZRNwBbXfEPuKjr8drQ
 NgLRB2pZ81h6u18ZBGXi9l3kPVqtO2YDS+YhuBB2dUyGxSa485JWQ4/tAhayaviSWE/E
 YziBdALt4OEg3fhIgztISFISolvXrKLTBfJ3j6XubmU+xYji+7BhiUTkVWO0tRbZlvPc
 7DkVD6Xb5kY+HY+1fVsf1usSo60J+kLZoGhoxi5ZH10gMzcALFaZMw/UArT7Nce/OlPY
 h9sg==
X-Gm-Message-State: AO0yUKVQgFe0RDfZ/N3WooNkTcEuHIn0/4qEtmZUy5gk19rZHdDyD6L5
 nzmlGgAbApkm7auJG73IYSMK0A==
X-Google-Smtp-Source: AK7set+Epg38ByI5yc4CuXBGxCUll56QIUpvMysNvjurttYEVN/0HvhURZSTZm/R+gytz24gNeGfLA==
X-Received: by 2002:ac2:598b:0:b0:4dc:8510:bfed with SMTP id
 w11-20020ac2598b000000b004dc8510bfedmr327637lfn.65.1676632399844; 
 Fri, 17 Feb 2023 03:13:19 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac250cb000000b004b564e1a4e0sm642683lfm.76.2023.02.17.03.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 03:13:19 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Date: Fri, 17 Feb 2023 12:13:15 +0100
Message-Id: <20230217111316.306241-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
without the generic fallback. Fix the deprecated binding to reflect
that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on (and should have been a part of):

https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/

v1 -> v2:
New patch

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 41cdb631d305..ee19d780dea8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -37,7 +37,6 @@ properties:
       - items:
           - enum:
               - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
         deprecated: true
 
   reg:
-- 
2.39.1

