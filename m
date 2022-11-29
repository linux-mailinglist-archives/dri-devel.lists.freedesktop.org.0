Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0163C9CC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD1610E3BE;
	Tue, 29 Nov 2022 20:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B001610E388;
 Tue, 29 Nov 2022 20:47:00 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q7so18632969ljp.9;
 Tue, 29 Nov 2022 12:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSu1txevdRDvf+sjHpSwkWYMoyBAXs2clWWE081Dl98=;
 b=k4BZ95Py3bK6fYlB1MFLHgwl9yftQvPDe7FUCSwJx9NQx9uYWGh2Nziw+P2NhPKGya
 Z5zHfkIB9YbpADkcqcowkrxPJ+oVd6yHlvjUDbqEhDjUi8jzfVIm/jfrFBK7mNs5aTHC
 9meg/WDqrTCZO+Ty6MprnrssnMy5RcK/VSagXAMtMMgo/df0Sr4c8K4+sWZ0lLuOTqQS
 gm4gyRPHU7Zg7wwfZzG+7BCxrh3M2Vf+8P+MXZPOQiHNy1Gcrj689hKYVCLHs9qyeT+s
 KaeVmMq8JTxedXK3T5f0Pw7SqhuZJeNUYfiMQw7hYzf5I35gbXmU3OXMmRcOI1qeVq0j
 D10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSu1txevdRDvf+sjHpSwkWYMoyBAXs2clWWE081Dl98=;
 b=ztdgG2mnQ5I6OcjXBOnSy3gcHLzCNTKxR3OIGUVEk5vU+QoqTlGUUZqoa0mon0QBNi
 NoL8JBH5NpWTYAeNkcUdEnmOzmXHpgAe8Sia/nmQjXY2TPLmqqdbSPCCgQ/oJbWdJJmB
 o6whc5JW+aTK4sVUkRgzRMpNVb3z+qXA2NBpJWIwUqaoJea/UoePnI+iNaEWEPbsFzAA
 lowK5P76cEtpdxyZsH9xaI9yvgj466IpXeFYQMAWIlsV9YYFpFisiBEOt9a1FE7EXqwV
 1X0qSPGGT4jLdhxhifVGpH5bWiOM1reK69Rriv/+4D/eO/VLxXr9M8UlTmxB3r4mlYcx
 kcbA==
X-Gm-Message-State: ANoB5pnxv02ZjS+qDi0kzwx99JJxKEw0qcxGd0mlQ2fMUun8/LWRi5++
 CGO1EVkAsVwH4THua08hnG2W0X4hsBo=
X-Google-Smtp-Source: AA0mqf6b4m0gfYTm1LbzzS6QI5kunJ/QHByp8GuyhrqWdvKwvyEVcGMVdWoL+KA45eTUcnkhZEpDGA==
X-Received: by 2002:a2e:8619:0:b0:279:88ce:468f with SMTP id
 a25-20020a2e8619000000b0027988ce468fmr9177924lji.312.1669754818712; 
 Tue, 29 Nov 2022 12:46:58 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:46:58 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 03/12] arm64: dts: qcom: sm6115: Add cpufreq-hw support
Date: Tue, 29 Nov 2022 21:46:07 +0100
Message-Id: <20221129204616.47006-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129204616.47006-1-a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cpufreq-hw node and assign qcom,freq-domain properties
to CPUs to enable CPU clock scaling.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0340ed21be05..2003a2519a54 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -842,6 +842,17 @@ intc: interrupt-controller@f200000 {
 			redistributor-stride = <0x0 0x20000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		cpufreq_hw: cpufreq@f521000 {
+			compatible = "qcom,cpufreq-hw";
+			reg = <0x0f521000 0x1000>, <0x0f523000 0x1000>;
+
+			reg-names = "freq-domain0", "freq-domain1";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.25.1

