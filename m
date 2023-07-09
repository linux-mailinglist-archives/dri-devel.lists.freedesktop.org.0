Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153F74C0E7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 06:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DCC10E1B5;
	Sun,  9 Jul 2023 04:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29E10E158
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 04:19:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so4684531e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688876370; x=1691468370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtSrYaIq7E+bfiv9WFvstL0iH9rSn8rZct5gFh+ctJE=;
 b=Oi+ZYvxf8GX903TXcsqddTN2aEv9XgWgEYuAeZwyo3CINQZHOdFoRSZ9zDhjVruoBR
 0z90xv5U/ezAKYsy+rHpHqmkU18orLxkW8fO0yECZuF5Mw2xovMBQrWXF/c3GpXBf6PR
 QbLnEPsou5nZcPe9GpRXAOP1zsXy+g62SWGxQ1XCeyyrngbmx5oIfX+UcxJscF+AqLbU
 WbuBbbGuAz+pk2rka5Z8b6y0oC3g9DaRmj01jkqxusCkzp03dH2hQqlg2Gb3gkiKVf2s
 ieFK9CDrwFwsKERFnUHAlrd+E4YlXgT0/YZGX/eyNcxc/fUSzRoyqFsiDaPq8DIAm5go
 snDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688876370; x=1691468370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtSrYaIq7E+bfiv9WFvstL0iH9rSn8rZct5gFh+ctJE=;
 b=Y/i1/Gg8eaRF1C2wGSnz4faxUnmnJwAl/fat/2he3LxMAV+UGZE0ulRFlG6Cd1MCSJ
 0Eo+8qIlnZQxkycq/bd8GW43Qc4wL+83zbmAUSwP/az/6tu+gxZ2qQwgLbX3R3XjCm1v
 IHpgan4bIcMbWvEldrD++rGzbo/GFTcfRpwwiG/AOvnTd17Sp9eFEzlj4zxd5Z0GvW/t
 D6HPc/7A1tQM4+S3ImA+XXeBMf/+nvZ6Zo+ActI+w8IxtnrtChu+TSwq2rvgzpkbwES9
 k+bnpSet3rBm1kpj2+IhqjTgXUJhVOubWPhjTUp9i9xZNfMDXAX2rlfym7FSBHmrfEc2
 lvmg==
X-Gm-Message-State: ABy/qLYDfYss/8DO0JHzBpLGNmERHseX6KyXGe1F9sD+iFkdaxbA5azg
 B7DFje6Y+X/6wOe0XxDwIh7RPg==
X-Google-Smtp-Source: APBJJlGXNNcq7x7vL8+xDsC8wx/7kapblUcToH8V0brzlPbiAMw2LC6KWslkuQrRQ/SWEyq4fYFtCA==
X-Received: by 2002:a05:6512:3c9f:b0:4fb:829b:196e with SMTP id
 h31-20020a0565123c9f00b004fb829b196emr8752428lfv.2.1688876370646; 
 Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/5] arm64: dts: qcom: qrb5165-rb5: enable displayport
 controller
Date: Sun,  9 Jul 2023 07:19:25 +0300
Message-Id: <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
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

Enable the onboard displayport controller, connect it to QMP PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index a03f334a3d01..210c60025c32 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -656,6 +656,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
@@ -1436,3 +1445,7 @@ pm8150b_typec_sbu_out: endpoint {
 		};
 	};
 };
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.39.2

