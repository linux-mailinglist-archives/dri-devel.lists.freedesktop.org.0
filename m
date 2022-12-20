Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347896520CD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D38410E3CE;
	Tue, 20 Dec 2022 12:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2673610E3CD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:37:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h16so11551528wrz.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
 b=eF+PhFf5qeLqtrw+IAez0BiPQ9HYoGvX7UcXyiaLnVZqXe2DyTL24DuL9/CjVL/1d6
 vwOE00klSdPx0UJBw06rX1r9eWdiqvwMisycqNx2T3dJgfgGdDNMRypzNpoau9JGIn9M
 D8QShZEwthKERVHWXBLSPsiDzXIcL8Ht0iXtukVcVMDRCZoH70Z25Az1jFFtHx7EW7/1
 ipEBrGdVlVthSpOBV7pLccubnfw7OKa04pJVPUzoaPqQBPDA2V3zipvjhZ2CJ1BuEFlR
 uEoNYxvPcJm9N3n4n37aTsURsMiCLWCB8c9eZDvK//Wf+ggp3G1c62W/bk3fQYJ/qWV1
 AM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
 b=egJ0H08BXBXss0v/5OQG08Cs4rXUE5Nj48o2sD4D22fh9LTH11rm+hr323xv6Z5pS2
 J4Dm8ejlXaqcEBuEPkC+nRX1YszVM5PR+S12rT6OjjUk6t9/ys6h5Xor6T8XRB4zJXG5
 altIJsC708salbwpEHNv6kRzhwRqNWz8vpw0k7TQohlT+U8JJRILSyJF/R5eikeKY1kZ
 KtG6IPEghzxjdCnGY58pqZSF6Ylk09NqU0TGykg5ABg5ycKubMc0EQDPOaJqrgRowvr5
 Y9RvKzCHnpeabT4Pi6KQ1gaYXinL/2pPdtR10B+O4qAE/viuweWw+JZdmDbADuFYna7i
 y+PQ==
X-Gm-Message-State: AFqh2kpFq3iaGb7oPHgnC1s94fQpCjIWPb3MriC6coDnRewYCxBa3Txs
 xPK8BxF+jMmnaA84eR3aRbPhDQ==
X-Google-Smtp-Source: AMrXdXvpt552/j2eYpyiJEvx8Y8iUdWPP8nWFBZn584KDHLE94EqwOEvXHfAl0Y2Sy4/Ct53UZYcSA==
X-Received: by 2002:a5d:4143:0:b0:262:3647:c1b1 with SMTP id
 c3-20020a5d4143000000b002623647c1b1mr997538wrq.58.1671539820722; 
 Tue, 20 Dec 2022 04:37:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:37:00 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 20/21] arm64: dts: qcom: sdm845: Add compat qcom,
 sdm845-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:33 +0000
Message-Id: <20221220123634.382970-21-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 65032b94b46d6..623e5d7dddfd2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4645,7 +4645,8 @@ opp-810000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4716,7 +4717,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

