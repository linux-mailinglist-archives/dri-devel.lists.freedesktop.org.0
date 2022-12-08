Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B364662D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 01:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636A510E44B;
	Thu,  8 Dec 2022 00:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D6110E140
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 00:55:03 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id b9so22794333ljr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 16:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZPnPCur3ovFUOH0LYhAuqFKoVf/x2ysNxNnklkbflE=;
 b=Z0n6nWKpFQW/U3hRqkkWGv/Jb0DbHroQAvTC/kUChu/mZvqVpmao4hqnZUEstRDnar
 jFyyH2TPR3cH1RLq/2o4c4TCgTrYZwOJaw5OZxWvsC9tCWL6BGI+94EYdu507Vppm1NL
 SuKztwVjHMSpFB4FuD3UvvL4Gwj/jHnbJhciHElDwCMG2KfDmEI8FrgNAhd5FMLURQ+5
 CE0RWcJ8ux4Xrq5d1oiGTIpxxVWE3nQJEPd+dtpvRjDvSfIRt1409B4gu6TVKz5fhVTg
 Cr4940woTLVdGDKDR1LupLDIm3xmlNbZXGbOKmc6bpLuC0bsC6mfAIx7l4HKUGcWFxOJ
 qahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZPnPCur3ovFUOH0LYhAuqFKoVf/x2ysNxNnklkbflE=;
 b=wEtuTOgcnW15+zCKgPxWuv3CQZoAwKLMwORsqLgq1VMW2b7AunkLJXSCQAM2HE4ojw
 dPCtDbtOx7Wm85k02aP21Sznr4f3u3Dhz4KfNbKpnIDoOSZHGjvsd/w3XafkmUcVaK5a
 e2DXjuX4pWRwFjXOvh5FkVP2WnRUQmfOXkgPnWpLO2AYNHRqjCco7JHyMSjrYuB0SlhO
 u0hK+q+kzoP+MLOosOk3f5J1hqMMpsMljter3t3f5aJh7bXudGZFz8RJDRKQsWqZp5Q2
 JxscZMhOB2PAQc+Kkj5oKGuDbeyTqsRNTdBvZDVLguwyYheYNfNZjkLk/GnXXVZOT+rS
 isWw==
X-Gm-Message-State: ANoB5plhosk/DuTPPTuaXoyp8X4qVwwWQXRWVMm9k0SvXpMZ6JNSBZvO
 QD6z6xuMegurqkInCCO9n8TjHw==
X-Google-Smtp-Source: AA0mqf7gr4D6xoe4jHfMdSszRKt/ebLETLphZftpO3yonssF15zrpEQCAd1CIHbl/lXZjCwUEqiigA==
X-Received: by 2002:a05:651c:c85:b0:278:f572:c9ac with SMTP id
 bz5-20020a05651c0c8500b00278f572c9acmr31528058ljb.73.1670460901823; 
 Wed, 07 Dec 2022 16:55:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:55:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string
 to mdp5 node
Date: Thu,  8 Dec 2022 02:54:57 +0200
Message-Id: <20221208005458.328196-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c0851..0cd59088f9c7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1549,7 +1549,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.35.1

