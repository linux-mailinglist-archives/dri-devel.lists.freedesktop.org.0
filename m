Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BD636F5A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70B210E685;
	Thu, 24 Nov 2022 00:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942A810E66E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v1so214196wrt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=nZq0LPUCzHJydTVKuG9joKgS9Qp7pU83zNbU+NQ20OQf1e1drNWPcarofOJ4TPxY6G
 pbgtIt4W4cAFvpt/5B36QxjMAnM0ENr16AZ5xM16GtVrRWHgkasfMF2utVpixdDgr874
 Wrd0HZtJd2D1Hgs4C4YuVOIZZ/2QgE6WsklCpndc26fisc3bqhvtjZMlvTAyCG19jWFL
 EKwUlZsWoF3zpsRp78kz5avnTgN8Igg2lJ0XLzYQhQP6dVoCCSqjM9nnFP21Rncvnm+j
 RiRcKyiF2cfiUeeuUcuf6MdqkScJw2iIN44qGBZZ6pU042/jvy9B7RqBJRtGtpxU7kfo
 iSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=MAAg60BpffEz1+69OzBqzsDOR2QaKGph0SJQfjVmdcIh27YM6fuBZTb9+JzzeCnbYr
 cMACdWH/t0XRDzDDeaWyqAyk7bex08yXifAT8HxNI5MFtoguOCOTKLwLYuvXyUhtWwvf
 WsI0DhsX3v7OjJgF+D+GxCYZ869pHjEk8kdSjKBzyqwLHDQPpiwB0VXherWHdh1r3p5U
 6zRwEwknj2TNI1OTktjRKV+DRFrUEqdL7ce6bOxvRJz0z2O5ar4xwqL4IqFhcto3XrdP
 +zjIxzAuhwyFJBnqqK8EU3vffHYJYhlHLtOATbE/WuCn7mYkaa0zJB1ugq0w7gD6kUQr
 Ocyw==
X-Gm-Message-State: ANoB5pks9xpSOm7JK8HuGfyhuNeQ5Tib1s7m3Y6zVJ4PfZuovkotGtqk
 mLHE0u6a5FEsdnTDE4hNNU618w==
X-Google-Smtp-Source: AA0mqf6wmkoiUIkHFGYgoiY9tEn7mW3LakV3Zlc0BdyUOyrcyG1anqxl5v9rPZjACtASN9zGPvI3fA==
X-Received: by 2002:a05:6000:1564:b0:241:e722:3f8e with SMTP id
 4-20020a056000156400b00241e7223f8emr5430030wrz.133.1669250905128; 
 Wed, 23 Nov 2022 16:48:25 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:24 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 17/18] arm64: dts: qcom: sdm845: Add compat qcom,
 sdm845-dsi-ctrl
Date: Thu, 24 Nov 2022 00:48:00 +0000
Message-Id: <20221124004801.361232-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm845 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5420205417c81..c14e49c9655c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4522,7 +4522,8 @@ opp-430000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4593,7 +4594,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

