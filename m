Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED48B636F31
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8376810E66D;
	Thu, 24 Nov 2022 00:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9566B10E671
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s5so269007wru.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
 b=S3iq9reBoNXzjyZUJ4Y1oiTjkQbS8Ds2/ZBf83ZYm+RwXkFfktXpOQD7E9KECYGAZB
 RDTMqDxNcDmdcpuIOEGbRPTHvm2gSzax/TaSJb23/2Umkx50rbTeBZGFqQ8x6SzJ+Tm4
 Mbfb4ZgcDxme3I8zegWrFAnkA4P4U4fqctsBVVaV2kaRxePmzBdsxm6IJAI22NbIJ3Az
 LDcdel4HN5OWHlQKuczzkDY2ETb2Vz+D0hCF7TiQFvEp/vUDv0suDlAZvZeeXOIZKUhr
 ENw5YYBTnH1XVfiFPEjTd0bbyNbdgQ2qBbWX224Y/eS0NRielSAfzTl1+EBIXInvMrYZ
 r6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
 b=KCOg1YHfb+zOhEvWuekfBDmKCkifh4NbbnnlvNtyoiS56SIA402Cuw0sHkOPCT6kcy
 0ztG0RybZ83ajaWcud1qhb/ymovNXZK6hqKu0iHRLEqDiYLMcNL9EHbJOSo4vjO8z7uJ
 xdB0+KAW2PusEi2KdwUgl8q4TsT9LSWCYhL4pLFn6Fsr86MNIh8KBlv1itWdq20nbc51
 uRcd8Ofk12snxXl5wmctxW+hDxQSj/jRI94jWPW/l3lHz+VkEvtJIbB/AaKME/KjajIS
 /npRlzlrQt+s3XM91MZAuWtGfsKQpUNgLJDsuABWx/+g8bFhSW2BnQe9UWJpCeLb8UkA
 LrJw==
X-Gm-Message-State: ANoB5pkQegz6OXGNIN0bnVSaz1sZyUDKCRGARJB9QI2iE2YgAvGFx1Yl
 yIWnO9xx64gZxAPMKHNBWwU7bw==
X-Google-Smtp-Source: AA0mqf6fjZn0prOEpCWcToLazE5h25TknfPSJG2hbEg0kzP8UkJ/xnf+irWkERN8nfS904+UjNdNZg==
X-Received: by 2002:a5d:5744:0:b0:236:b7c6:7ef9 with SMTP id
 q4-20020a5d5744000000b00236b7c67ef9mr6874183wrw.10.1669250895693; 
 Wed, 23 Nov 2022 16:48:15 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 09/18] ARM: dts: qcom: apq8064: add compat qcom,
 apq8064-dsi-ctrl
Date: Thu, 24 Nov 2022 00:47:52 +0000
Message-Id: <20221124004801.361232-10-bryan.odonoghue@linaro.org>
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d036dff4b14f7..a8b089eb0dad2 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1287,7 +1287,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl"
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

