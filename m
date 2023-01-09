Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81B661E24
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 06:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF0410E26F;
	Mon,  9 Jan 2023 05:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BBD10E26F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 05:01:58 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o7so7383453ljj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 21:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
 b=rabUfXrZj9srcbLYoOx4/vFBoennFGXE9BohXN29RUFrWAlWo0s4WCnH82+be1OBvC
 3NexbCgKhvCw6WQAgKk6B9i4Gof7HXYNXWTXo3Vcbi3imgPoVvTRhA+RPSK+dNlo7/mD
 oNNghloWaT+SMpuxh75Oo8P2VGWrWuuDtdakRuz0p+bxS95jtvUcdQXQmQiGqxLwgVdW
 DyaXpGHisUS0++mNwv+0+zGIXYCkiycSdjslX7GwIZc8tiZneNQkvhIKlWIwNjOO5aoy
 5CnBYBECJRhjBh8u2Q5uYbyu8ENHuM0TsnVBLITaOMt0r9EXAqeqxBQTmsspDUY+42qM
 1Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
 b=DiPIs8orYUrdBbbEJfNnGWrmW/V+trdX+9ijIRpMKGWNhLufXqzxBoX0toRI5/QfvW
 05oyZ2O/pf/aUKkcOHjNhSp2fS1F1uBk8R1qMrVX6QKpAXmQnS+MGsVOrYbDZH333A9F
 k4OjpX4EeALT6+FWbURL+KSHMSQeUnMEGkosutRI+5nc6I6Kb+0PvqI14sfzC8iOU0be
 So4V1/iroER5o2BMn32E7GW+rYdK8CsqyYLHLHPlsujRkL6XRX3qt0h37Miz92onRma5
 ZBDDsEPpOl65cSpKVDsQVNmtyx3zSMrw06LchS0DzwCgG6eE6BwvfqEG9Wwtjy8lyLV0
 xgDg==
X-Gm-Message-State: AFqh2kpvWnBz5PxNSz1jM/eO+q8A/XyqkjRn7s3f4IXTdVOn0nldQp73
 wvEL3PVOTl04b3h+snd/Ny0/IQ==
X-Google-Smtp-Source: AMrXdXu9eMpvd7PLGEHAUuuTDmo68Besxd4fVT3EUBanv3mfoE7E5yIoFHas7c4Z8KStCI1azvy50A==
X-Received: by 2002:a2e:5450:0:b0:283:7f20:a89d with SMTP id
 y16-20020a2e5450000000b002837f20a89dmr1470407ljd.34.1673240516197; 
 Sun, 08 Jan 2023 21:01:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:01:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string
 to mdp5 node
Date: Mon,  9 Jan 2023 07:01:51 +0200
Message-Id: <20230109050152.316606-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
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
2.39.0

