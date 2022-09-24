Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE65E8A7F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F197210E563;
	Sat, 24 Sep 2022 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5124610E55B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:16 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a10so2473426ljq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OnDsANKSvA70i+JsQIe4TNZbXQvnl7esF1EhWeKPkA8=;
 b=R712gjXK3EYz4All+iX6C7YPUwMeIKjscHrlnkzhc6w9QXpTqyWIk8jFo0kVuI0Prz
 zR2VIQEnyiogeXSNVb+vm06qTY/mVvRxXXmKMJWE0CgFxoq0W3VLmUe76D9tZW2750st
 auTULiJ/iY3/FSFTQE7dx/hqSIDlfOhjUDEFguNPe3we1t8CLl9HAv4VrFOfRsdqvL+l
 Cu/4BWE+TbvnHTJDbb+PdRgPY69Olpktr43nFrVVjPYU70tD2bTW2xuxZ4RmUqrFBqa7
 SVn4YFMYmN2Aaa3k7PGFJLmp2i1NHJkDl1+Jjxty8ihbNeN36RyfklZyEY8JB08YGPfK
 wYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OnDsANKSvA70i+JsQIe4TNZbXQvnl7esF1EhWeKPkA8=;
 b=wCq1ZN9gRtXWCH5PJlNTv+Bst9fo0osjBhOyveLqrTvwWEJZsyLKNyzSFAqJzhWIzY
 kZHI1S1HHRnxM9uOA1MFLMUeOG4NPc8yaoKCTQzIlUjaFlFan7fNwPxN6GQhPs/KmVJJ
 jyolPmI5mQ5EAGbxuQSJPbdrgtl/OWU9cf0AzsEJcMWbdDz18B48iXlNo3AfUQhfp1Ru
 M0ntEdtWgv60GK16bWwxxryhebqHKD4khR3fTzDOLbmupC/yKJhC/eYUhosafGOJm2e9
 DlqDdwMtJuXneJyxbMjGwnv+ZJ3XV1+6xNp5t00KEf1EV8X0TYeyL0ZwBvofP5WrZlFR
 Um4Q==
X-Gm-Message-State: ACrzQf0uvP9CGRG8qNsFu26ZUecOUsT9iHtnzKS3UH5ydZkVE2ncK1gd
 B6lkI/1+iX3sPPcEHj1IoZQWnw==
X-Google-Smtp-Source: AMsMyM75fwOz2p6pVgvnnexlXeIj4rYayWRp/1bI/Abr+vqH39iYqBxTF2pqVKwlmjn8WS76IBmH5g==
X-Received: by 2002:a2e:9954:0:b0:26c:5555:b121 with SMTP id
 r20-20020a2e9954000000b0026c5555b121mr4252741ljj.280.1664010075865; 
 Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 8/9] arm64: dts: qcom: sdm845: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:07 +0300
Message-Id: <20220924090108.166934-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f0e286715d1b..df6427ba2284 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4537,7 +4537,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@ae94400 {
+			dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -4609,7 +4609,7 @@ dsi1_out: endpoint {
 				};
 			};
 
-			dsi1_phy: dsi-phy@ae96400 {
+			dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-- 
2.35.1

