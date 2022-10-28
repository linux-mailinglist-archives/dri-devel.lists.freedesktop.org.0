Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E996110CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760910E81B;
	Fri, 28 Oct 2022 12:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3A10E803
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id t25so12446008ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GHQKP2WRD5u3btbTtOeqec49hRgZbwQ4CBFF9a5nqqE=;
 b=aGwFe+cjRvwTlK/2papTY0NVUyA/CNvUDd7Ev8PSs7yCSU2oteW21EellklP66v9ds
 KIYAGe72henmkXbOHWcpsAw58ZRYYMlpzkKBdaCouisIXGjNeM51l+fnfJRVxG1rletI
 EPXzN4DAf60BpUAWAbETa5/POlpNbDYK+iYHgr7+UjWvlhn0BdPoajyLi7DiXjHXFwF7
 5TPDEa8qo7ijXEhleBE2QqZNKhrlKHap8MyfC1TGoapKM6mOWs2P/uSCQrd44bALdrCF
 c11TcvVoG1zlPXxj+G4To9A4lW9xGGQgZppO0futtKUYoXc/s+PlauNCETyZezF549/e
 GGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHQKP2WRD5u3btbTtOeqec49hRgZbwQ4CBFF9a5nqqE=;
 b=PvlWc5gJ8bGEncfrnvs2qWoskJPrJ5TNTDkz0Q2gyZAYHkH/dRPEKTZnoGycLu6o7P
 LsICU5OGxqOZ49oMlFyBUntsnm9AVDr/NgbISJPo+UE2FZi9cNLYEAvG4b8K73T6+ky4
 IqfmasdvAfv7yIGA2QjTMZ6wuNa+b1anvQfiJFwMFy28N/cx8IfLljtsuge8mWiO6ikm
 D4icEIx1r/mRWtq15+yU81UYDpdL1COPP2WByk/JTc8xOtdD8oU6vl0v2R21RN4JWFpm
 2ytMPGBS47IfQAVyamqr4FXsCCdgHolT3K0qmr39BHlY70vdM3Nh52PIx08tBAggXLYF
 KUZA==
X-Gm-Message-State: ACrzQf3uMSjiNi0ENQJzP0xgfMmOaxLkbKWspHCWmVTtfV1ltkpjdtKU
 E/vi98UKTsEVWQoAa9z8pDTCMg==
X-Google-Smtp-Source: AMsMyM6UPjeZggV2ofJpsk9MB/vfhKTLc/1WSnx0EL1Rb6b9o80UYFxJes1SuMKfqvZxbCq2MkoKbQ==
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id
 fj2-20020a1709069c8200b0078157524f2bmr45370555ejc.561.1666958910136; 
 Fri, 28 Oct 2022 05:08:30 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:29 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Subject: [PATCH v1 5/9] arm64: dts: qcom: sm8350: Remove mmxc power-domain-name
Date: Fri, 28 Oct 2022 14:08:08 +0200
Message-Id: <20221028120812.339100-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mmxc power-domain-name is not required, and is not
used by either earlier or later SoC versions (sm8250 / sm8450).

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e72a04411888..606fab087945 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2557,7 +2557,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 
 			power-domains = <&rpmhpd SM8350_MMCX>;
-			power-domain-names = "mmcx";
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.34.1

