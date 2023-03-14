Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F46B9309
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72710E79A;
	Tue, 14 Mar 2023 12:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2A410E7B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m4so6726098lfj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
 b=nlnvdtT0jYFDekSBiKe7kjUgKmeWkEU7n0KtJb+UJLMZg1jzoGWP3xgtTelAmnACbh
 AA/ExRjWQucoaj8aSZF2s0Csf1EoU2R1WE/e958Uj2/o+Mz4eEucxi8rxcCUljmRLhoZ
 F1HDrxg7hUqEUYLPhNivl5i1idRb+Qlxeh3HIahd8uQKoKq/Toz+sWV6UuEJxZg3E1nc
 N9aaFO48cremURTz8R2Fm7ffMf//BthoMS2ObeHCSOy3O8dakc4RXC5mBOP/bkBldHrB
 crA1RnK7faaSzYwIjcOOcEco4q8JmHmX6ajsWPtbuvh5ku9HjIr3+bkM0nE4MeuLFBEJ
 DT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
 b=5o4CtOVhrtthy6HDJAXzZjDC7ldPPGgkWioGLggnyP+LJ1wfEd5+p9G+vairUs9wD9
 S8qSJjy45SdeZxoPNc+LT+JEolI+UoDTY//7/vEv2mZrXqfazSOJn9pSzgZpZpmzTodK
 BmALvJj+cZMpI2ObY0lerACavFcvsGEHanhbNuhHt5p0EK8HdEf2kAcGvcxIwgSVAL38
 79NTfASmXfpk6jmRn7RBOT/sdb2akdCXIsA+Jqsvn1zH6qzDyb1GqKRP6miE+a3enkQ0
 jkZRngRjitVM2yEI+uBlj/YSyb6FEbb2vrtRH/fE1aYLXY+tow99SrHh7ZdFTPXgIF/f
 g3wg==
X-Gm-Message-State: AO0yUKUeogeZAD6MqlMqATK9xJGmmz+JoR9pN3xzYpO/VF0UGcaeCVwd
 Nwvg5CbPfPjQi/1xsxqlzUWSYQ==
X-Google-Smtp-Source: AK7set83jGmoRhPfkqMbcEJHHm7krfEcVsYNn3fRI8hjQUMi1nyZZcK+S70SwgroH8ClftZB5Jk5Hg==
X-Received: by 2002:ac2:446d:0:b0:4e4:b9b4:bf25 with SMTP id
 y13-20020ac2446d000000b004e4b9b4bf25mr748332lfl.68.1678796066123; 
 Tue, 14 Mar 2023 05:14:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:25 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:48 +0100
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm6115: Use the correct DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-10-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=835;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fTDJ/Pk/K83TEsz8nt+gatYoQ7InKrC5bjtKXy4Z9Sw=;
 b=HhZ4vHeSq1k1zTiLWtKr3SD+hh+THRKo/3SDYCP8seyGUW6Irn5LUOqcX+223SewxioRXEQR3Uzk
 jQn7R0qWCdG+pjWnvGDWgOMp24G1gVyrZyKTgLB39uI8m2Ev/nR7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the non-deprecated, SoC-specific DSI compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index fbd67d2c8d78..18c7eedff300 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1219,7 +1219,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 

-- 
2.39.2

