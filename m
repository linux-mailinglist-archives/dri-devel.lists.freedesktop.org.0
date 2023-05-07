Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFC6F9B87
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD41610E2FD;
	Sun,  7 May 2023 20:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B2310E2EE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:28:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ac7de2b72fso44101151fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683491325; x=1686083325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hbb+Gw2CW/HbmhZliVRpGRsPwJqaiAgOusSFBwss6U=;
 b=LhaHy5o46LDizECgcW3NDO4ChoSF+jVfMHWkOM6/9BLz/LjpwWu1wRhV5eb0xUgLSG
 JI8Ccfl93neNJMCQ+XFFnHfFG/6wFxCCOccFEWLkDwI3Rj8vJCPGjlmQmvkeqk6WIvyC
 N5GFuGUe7XyMYCMXXEiqsXPdeeOg7XDR832jeoW3fyzLkv/CS2Rq2ukfGF4srAo2GKaF
 sPDPHNjtjCwc6Ydt5cojWEYd/iaj81rZrB5+HKEp3ETo0z/mnpsqWh9yhh84zfmL0sjg
 XKofPsBUmBs46Jcg069/JykjrvHRpNAW6aMtUv6qzSZc89jYxyjHdltnTUeJ97q3ZqSN
 Duww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683491325; x=1686083325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hbb+Gw2CW/HbmhZliVRpGRsPwJqaiAgOusSFBwss6U=;
 b=iTed/wDjy0VT96HqSyWcJ41i0kY142gBR7yNIZb+vFtoMOpvxktkKpFJmoTVPIYj64
 R0BBr12qlgZXxWVlnEKPhA3LtGLIvs5nJ0N73PfNHuF1PF7kruPb51/j3gszH08F2lUj
 8jRFt1N6qcaQkdhKYOj/6sW9cPMIxChiYs8DhHl35Ba28RbxCKcLK8s/afz0nmObkHbH
 d7Ojlw/zs+Dcwj4BBh8O85oXd3Z4oC0+9IoQfmb+Eb6who1S4okRY8/UnSjw3n4zeXYl
 Cx+CaFJzoLhAvaPKVOIen7vnw3mImUoxa6R5VRbC4rfjHQlOvyF50XVuKTnwHnS8KZXH
 QMPg==
X-Gm-Message-State: AC+VfDyC0z+fr2K49BdMPV5VIajNY+n0L5hczDhm/URfsqFgCFEP0XVs
 VNIydhHs7NLeWwxdTWzzk4uf4Q==
X-Google-Smtp-Source: ACHHUZ7Yw1Dh/Uvxhe8otO9aoqhqpF2X2SkGV+rxNZnajmiPKx/Poiv2C2uF++k1Fio/WtE+SkwuOA==
X-Received: by 2002:a2e:938c:0:b0:2a7:6fee:2503 with SMTP id
 g12-20020a2e938c000000b002a76fee2503mr2221516ljh.14.1683491324878; 
 Sun, 07 May 2023 13:28:44 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f25-20020a2e9199000000b002a8bb52d994sm928043ljg.25.2023.05.07.13.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:28:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v1 3/3] ARM: dts: qcom: apq8074-dragonboard: enable HDMI
 output
Date: Sun,  7 May 2023 23:28:41 +0300
Message-Id: <20230507202841.2339127-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
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

Enable HDMI output on the APQ8074 dragonboard device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 72f7e09a5bbf..850427bd2f82 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -20,6 +20,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		hdmi-pwr-supply = <&pm8941_5vs2>;
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&mdss_hdmi_out>;
+			};
+		};
+	};
+
 	reserved-memory {
 		mpss_region: mpss@ac00000 {
 			reg = <0x0ac00000 0x2500000>;
@@ -90,6 +102,24 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_hdmi {
+	core-vdda-supply = <&pm8941_l12>;
+	core-vcc-supply = <&pm8941_s3>;
+
+	status = "okay";
+};
+
+&mdss_hdmi_out {
+	remote-endpoint = <&hdmi_con>;
+};
+
+&mdss_hdmi_phy {
+	core-vdda-supply = <&pm8941_l12>;
+	vddio-supply = <&pm8941_l12>;
+
+	status = "okay";
+};
+
 &pm8941_wled {
 	qcom,cs-out;
 	qcom,switching-freq = <3200>;
-- 
2.39.2

