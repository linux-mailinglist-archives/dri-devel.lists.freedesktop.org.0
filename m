Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3531661B9C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 01:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F8310E22D;
	Mon,  9 Jan 2023 00:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5170F10E231
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 00:38:25 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f34so10606471lfv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 16:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
 b=Wu0B7Qz4d+HF4VN3O0b07OAZGHFRT8W5ltF2V1F1zh3f0M7aWH0ZOLoq0a8RENM+Dr
 idqiFIfzIq7/Rcin3TxcdWdC/Xm0iSjXMVvvcfRqKYmktqq/yjlwNGc7KSNkkgYpJ/Zz
 PEIjiGeiljuGKWKAQ6xjAEQV5TTzGpYUurrWzzQlzWlGN5GgIW2SpGBujG9BoSQcarVk
 r1lC3Er54Nafns/61KVY0W3zEj/j2sLBWJd01m+pyfiKWUMdCLt7mkWYmMzg//VYX4tH
 mNpB1LShtL2xV6Ma7nTTvWgUIa8c3XSTbdse6k91mDVJM4pGbRODmvUW/fbtsM0ZEMmV
 8lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
 b=4HboVPB5bGYZcrr7nIHai9qf5EyxXC6rOPIDAqe7oF7cNrnpIjpuif1lfE+u5g0MHB
 VN6nt0W4Bio9hT6NCxMDVrsYmtR1fhTbiN1e6YSkow7Zw+/N+dUDuBSer0S+Z2ZXg1mD
 qCaVrEV+ff7IYY91tDq9+g7MhnKEoma/p4nj/x/oiHPpiyN7tkbZdK14eGrjPfdQC3To
 S2vSCT7ikUYv7H1BnIE61YeRQ3nIP+3VwRHBrKb3zH6DBXkFGJNpzwhslUsWihaLriO3
 aE/BwguQdPFYOIOYRAQshGDWGEiwspK8ZEkpsw6/EagjOeysf9tBt/pqOhMNSklu7CIN
 Tbow==
X-Gm-Message-State: AFqh2kq6+zyOyBxNcGMlHVuqWglS/Jl3wVGh1C78QN4Rh2Th6ZK8Xxiu
 jmE4/0F7pdmX5YQwD0qezrcZVA==
X-Google-Smtp-Source: AMrXdXsZwTNuUt7RSJ0rayIZmo5j1dAbR/B41RqdSdqnrpLXL5OcFNp3b8E2E5fK5HFQXD0+2Rk8wQ==
X-Received: by 2002:a05:6512:15a3:b0:4b1:3970:43da with SMTP id
 bp35-20020a05651215a300b004b1397043damr29043220lfb.51.1673224703641; 
 Sun, 08 Jan 2023 16:38:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:38:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string
 to mdp5 node
Date: Mon,  9 Jan 2023 02:38:18 +0200
Message-Id: <20230109003819.245803-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
References: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
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

