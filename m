Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12686661E50
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 06:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9610E280;
	Mon,  9 Jan 2023 05:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7810E273
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g13so11274031lfv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxCmYI5w6nxSiqH6mYIJV7nQi3+kDtIa5UINsO5Pmjw=;
 b=o4/UvsEtBooqsTfdDvZ4V6Dw9b6IPeSH3r9D+ICRd3/FqS3ykTsMlhZlKml4B8QYK2
 6pWJ47Uk6IXqPlJVReUTgvFYpltrdnF7w0b90VKB3dnZi4iAe9bjKIVqqZH4JIfrTJNs
 E5oaEdqqno73RolkzszE59NYapReoH6b7MvHwYasTYgImDaG5/bqwrDG0aw6YEBc78ge
 YRLiF5zWwsVHNoFaJG70z7aVAbhUWD02OqBpRf2wpFDBm0NvggaTy3o+Ju2HQxGJrTwW
 fzCG/IkMhiOQBsYwl7gVfJ75Ae+xPGxA2c0sLy/jRLqY0pAN3DCA2HM3DMc+E4jQzpvm
 l0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxCmYI5w6nxSiqH6mYIJV7nQi3+kDtIa5UINsO5Pmjw=;
 b=AZ6F2/0zver/IM77ZW7th1z5wtnMl0RyZjFxkcp9saliqU2sLmGVrETYh+wZKqw+vB
 vUioE2dNIyfxqfQyxr3VGJIi6zMkLjmt7mbYJ7mdQo+p9PFDciRBl6oruY78nHgG2zmr
 AZe9fHN7/W5sV5g65MKAr53SexsIf0OFZ+mA00IsvMkD73R/4kDM51z+sZXr4h1tGO8x
 3CCHYY5oAkHQ+aQzdA5BcEQdFDvfGOPf0LvmsSMDJUgDn0D7F8R+WAEQ/uxV4/pp7sxw
 MjgBEW1y/vnej1OcimmSsB2W83lqLF2+EtZYUH7dplyeLaS7TI6Hwed9jgKR0Tn7Q1BE
 FGsA==
X-Gm-Message-State: AFqh2koRI9Ap6H7TOaUFFo7D1Id/82xucfpGyVYBwNj/vCSzt4Lgsm2S
 oR/BMpjrKxxUu+CXgVG3S49HdA==
X-Google-Smtp-Source: AMrXdXtzC8ORw8pqBQvThcAQTLn4SruOsYGLbWvNTAJ/HjwV2v5SQsxMPYT2GZ3HsPLYQLBB+dU7tw==
X-Received: by 2002:a05:6512:259e:b0:4b5:5bc6:e3de with SMTP id
 bf30-20020a056512259e00b004b55bc6e3demr19630790lfb.65.1673241245630; 
 Sun, 08 Jan 2023 21:14:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/6] ARM: dts: qcom-msm8974: rename mdss node to
 display-subsystem
Date: Mon,  9 Jan 2023 07:14:00 +0200
Message-Id: <20230109051402.317577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 0cd59088f9c7..bb69247d7ebd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1525,7 +1525,7 @@ mmcc: clock-controller@fd8c0000 {
 			reg = <0xfd8c0000 0x6000>;
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

