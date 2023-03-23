Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB186C64D4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F28010EA74;
	Thu, 23 Mar 2023 10:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4941810EA6A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m2so19870841wrh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567130;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NXsWO/AvbcGFTuUSdH/Ht1at3O5Z+IWMIafYvf7D2hY=;
 b=A9nrFruVwvfmdqAa9k/GzLJISL5s8P9n/DnONHFbHsC4BZcSiPBiEWZW4SndgxqNqH
 AFDBsjSdFfjmF8X+3YJVe1NhRW4klv0GCccjBnuHu6WS6mBFEV7K/Fq3xwfR2//IN2o6
 mjbX6TWGFtGMZazqhza4iYRg+bjhcYb2RjvobGnTYZRMRZpu2N3n3BEDCMbmppRoU+vR
 Egm2SgKlW78u920qdCFa7U5TfJ3M8KvW/ey5y+fVHJAnz0K+7x6xxXwRMCZMSJMmIudB
 9WIBg/dGHgJK3KfociRtxSLXRXLa3gfSBgqSTAIIjmMiNbNFBuIZnrp9L3RLEeIZQybc
 unFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567130;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXsWO/AvbcGFTuUSdH/Ht1at3O5Z+IWMIafYvf7D2hY=;
 b=0EryT6iohBlMLsgiwT2uHKq8SBXO8FyxNbmvg3nmUlO8/gH0cCJtN8cYG6KZNbVIUO
 zAipgFEJ2R9zHJ7bKmBdpLBtal19dkKjHKzAQtA2c17VZfqimY5j6u/gi9ZgqhieTHtw
 2QY1XLlS2WpWO5OyIAZCrG9FIFCpo9WwnrbUNz1N9Mh5UDoKrXpBm+q5ABirHGgrjifw
 y5Tmx5WH3Qaj+MheDhb+ZO132D7WgT6hCMA+pcp8CXUwPmqz8UxzVNITEB0XNUoGpd3a
 dORDEgjwZ+sUyhyEft3evW+Lyx4i1EFOFJWs1o2j4BvHgmrpb3ueWVpcQlgypxX/9+aj
 ugbA==
X-Gm-Message-State: AAQBX9fme7Wnlc5CvJxreAfYxYaR+Pxscsx4MKaUIY+q4z3wgZaver2c
 g8lGeNrRMSZNrqMibwmzF1VCBA==
X-Google-Smtp-Source: AKy350Z33LMigoWNcasOJWMOplYwZYW6nEi7NOOO6EGbUFZGcXiy7Ec1b7YTrrUOUFvjfEWS/EaUfA==
X-Received: by 2002:adf:decb:0:b0:2d1:9ce9:2b8f with SMTP id
 i11-20020adfdecb000000b002d19ce92b8fmr2257319wrn.66.1679567130680; 
 Thu, 23 Mar 2023 03:25:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:19 +0100
Subject: [PATCH 4/8] arm64: dts: qcom: sm8450: remove invalid properties in
 cluster-sleep nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>
X-Mailer: b4 0.12.1
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
'pinctrl-[0-9]+'
domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 78fb65bd15cc..ff55fcfdd676 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -255,22 +255,18 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-l3-off";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
 				min-residency-us = <5309>;
-				local-timer-stop;
 			};
 
 			CLUSTER_SLEEP_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-power-collapse";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2700>;
 				exit-latency-us = <3500>;
 				min-residency-us = <13959>;
-				local-timer-stop;
 			};
 		};
 	};

-- 
2.34.1

