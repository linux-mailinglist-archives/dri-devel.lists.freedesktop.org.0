Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3917F12F6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA10C10E3B7;
	Mon, 20 Nov 2023 12:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819DF10E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50aab20e828so1574998e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482395; x=1701087195; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjbqDcif3jzflMbhtEmEZ70pT8i9f+MEiRbeLY07kxg=;
 b=i1EXDftDwcdWdNJOWL802Mf6KKOIJP7Eh0ZQsY09G2Me+k6MlFhdOblEv2Ks8obZLM
 SCeP4PcdeBib87QqYu1SH6eafQjFL1dFofjs5VjieDTBhGXonm/8rYxRZa4O4OlLgVch
 IP0rlYzaim99iTbiRjhBqaYh9EO6HWQCINAq8ENtsAuIuaIZFllRN55EIvjf65n21wB5
 KBxlUzGO9fINqvdAxLwzxB8weg46kqqTFUrwlRXKjtm+/TVypVG+ZZpLQqtrBz5yXJvF
 L/w8fS4FHlqUGakV6Kj2zIVpebIxJ9pRK3N24XlAQ+Tg0gY+Nl8Ec9aRwT/3RYa1IquR
 RiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482395; x=1701087195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjbqDcif3jzflMbhtEmEZ70pT8i9f+MEiRbeLY07kxg=;
 b=ZT+l/mY7mn2ZLyVS//0RPW5aqVEfb7D+N6cCbh6K4o7dNY/jeAEiDU+6Nt0MHGrWGA
 z5pnNbJkdsOnzdHgTSZfu+hncJ6LQStdX5IUWc1tHE2ELYPJt+8xBd6hWtnlkyI9k1Mh
 44ySoXDKjOV/Btni6CaW8Ke8DCPaX/qVVHAn7EnO+h5aJsxBepyU74ZzkK9JP8gBbcYF
 Ve5eJvecV0BAkOkJx99jpHFQGIo0DNvn3V7SMBxDGO072S/CN7Rjf0rWlF55lbawkp1d
 xCL+XSyMsRGii/aWPC46KbwJRNrQMPDNyl0e3/H4eZ9Px689Lr4nqXSiGJSnOnBZ/D7i
 6JDg==
X-Gm-Message-State: AOJu0YyfeCmFTtrFFsncHcMjO96aXlgOWNH3jJs87ZCaxjiXe27SG9Qe
 kyPWuIy3EGCRKKGiatvSn2NBWA==
X-Google-Smtp-Source: AGHT+IFxchI6MuaO4+QAa9CHUiTl9TDpRwO40gYUBYra2bKUEs5p5Bv739G2JhMQRJKThOE6+wo4lA==
X-Received: by 2002:a19:650f:0:b0:508:1edf:92f with SMTP id
 z15-20020a19650f000000b005081edf092fmr4746097lfb.40.1700482395544; 
 Mon, 20 Nov 2023 04:13:15 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:55 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc7280: Add 0xac Adreno speed bin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-4-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=2100;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0f0QQnvO1OvRDYb4hv9oWcG/BSDnRfhPjCkhWoQhfrI=;
 b=0Nffh216XN36a8KAHzJ+iTGHOH9zXgzAyU8cqvps3yJau91tC4fBXin93gUZGtvNdoae0OqNE
 JbFUivsMLrcB0AtbFGl7/mvtmfceuIcCm5lRdcD6IOsN8qbnAw4NPGS
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A643 (A635 speedbin 0xac) tops out at 812 MHz. Fill in the
opp-supported-hw appropriately.

Note that fuseval 0xac is referred to as speedbin 1 downstream, but
that was already in use upstream, so 2 was chosen instead.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 6964c14ffce5..b4e6951d9359 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2630,14 +2630,14 @@ opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <1804000>;
-					opp-supported-hw = <0x03>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-450000000 {
 					opp-hz = /bits/ 64 <450000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <4068000>;
-					opp-supported-hw = <0x03>;
+					opp-supported-hw = <0x07>;
 				};
 
 				/* Only applicable for SKUs which has 550Mhz as Fmax */
@@ -2652,28 +2652,28 @@ opp-550000000-1 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <6832000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-608000000 {
 					opp-hz = /bits/ 64 <608000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <8368000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-700000000 {
 					opp-hz = /bits/ 64 <700000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <8532000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-812000000 {
 					opp-hz = /bits/ 64 <812000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <8532000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-840000000 {

-- 
2.42.1

