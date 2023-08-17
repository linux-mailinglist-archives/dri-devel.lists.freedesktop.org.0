Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18777FA08
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5063310E4E0;
	Thu, 17 Aug 2023 14:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411110E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:59:47 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso1013492266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692284386; x=1692889186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcfI9dJEQGwO2jpUJU2BmFA8ECYrDPYOAyZ+fcK6u6s=;
 b=qqdMTpkEEYUo+2H0ldiuOrd3i053WCImL+6eghhBSKXWsN4ra0gICZTvfEi+FX8yL4
 Ei4zqsl+hSTfgYaUbSuXqRgvXGje67UkoisUOd1TN3JbYJGkyFIhsAo8igOFNE1r63CB
 AbJMGZD9hNGu8HiOOt6NuasrWYRxEr0gNEOh+2GftpKsKXifEL44VkdP2BiqvnPySTEr
 S5plSdA/82CwIwcc3CrMfrE1r4fyNZZiKb2LGgL3qLq5W5IAH8I/TsjNDEDSxtpw5lsm
 dpNtVOsMJaOK/9kvotTflTTMRUkg/5cwFT4Btyg/aqXFd8yV4K3VLtK2yLCBGNB9L3UH
 zRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692284386; x=1692889186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcfI9dJEQGwO2jpUJU2BmFA8ECYrDPYOAyZ+fcK6u6s=;
 b=iOWbBLlZytJ4wYygDRm4GibR7nfLkSr9UleVTBAHN4k5B9u6R691fJFu28EPhjmxUh
 0qmHxQJRCu08PfQ9Dhn298sE5N8NALyOY4AQv5T/aH9m6HlnVuSLomSJnJnSNBYCv8E8
 uM/lqXflydEKyphQ9njRdUNqZyqFRPM/qVMTHkaaoX4iM4MJda0m35+ck89IX4hPpU61
 Zq2m61y4ogWwtlzjv7dczT/uJUVP50JWswOiAhnDNHWVzIaKEsYcwu3RZw2dgGRm6w/H
 u3o0radLGt8RDegAy3q/DvOC2JAvd+Guu9jbsgkuaigkW/O1u2XQStl/FMQ0/X6vsIVF
 SNkw==
X-Gm-Message-State: AOJu0YxkRPRr1tIBz7T3GBf3VSq17xex0AKcYx2phw/++y8cJw8q1Qck
 VvY8NLzbc5z7MB65dbiW6l5dQw==
X-Google-Smtp-Source: AGHT+IECi+eaQXrTqAbnKkv+RqFUnl86IqnerKbx0KVhX6hpc4uR2HN5mcfm7ey/sghhrQyauD8hbA==
X-Received: by 2002:a17:906:74ce:b0:99d:f7f1:cdd9 with SMTP id
 z14-20020a17090674ce00b0099df7f1cdd9mr4093338ejl.50.1692284386344; 
 Thu, 17 Aug 2023 07:59:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 07:59:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: qrb5165-rb5: enable displayport
 controller
Date: Thu, 17 Aug 2023 17:59:39 +0300
Message-Id: <20230817145940.9887-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the onboard displayport controller, connect it to QMP PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index a4f7a9f9c22c..3bd0c06e7315 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -656,6 +656,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
@@ -1442,3 +1451,7 @@ pm8150b_typec_sbu_out: endpoint {
 		};
 	};
 };
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.39.2

