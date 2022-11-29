Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534663C9B0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D9110E3D3;
	Tue, 29 Nov 2022 20:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2F810E393;
 Tue, 29 Nov 2022 20:47:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b3so23906525lfv.2;
 Tue, 29 Nov 2022 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzEeQBd4qVGm9JgmmMP1iyLQB+gK14BZ1mh6GaefoH0=;
 b=dEQMO4MmRBxn2n8P8ZFdAJE1AWzKRPZ37ygPrW7O7fww+tAkRsi63ThQuw4tHQikLg
 DP0/BQHSpVA4UOscQO01pcHD4YUWc+MIEkeNI+vca4T3IDHUkB3jhWgPFhCtp4NougfL
 JUHUzbXWxE7+FuPHFN/f7gH1AeZprKBaeDeb0JEHPou79Ya7i5Us6sSa/wrqEhOaDUgR
 ofty4EZcklUW74HSfeDEz/Tozka19N8hxhVuZS+9H4kutsvfAtzTtoZ85ZAHNX9sB70H
 my2vds6MjKMpCejA1ZVxPtOsn4yamgjVZU+7mSdcCZVJz/qzmI629oFT0DzmUjWQhp1Y
 xPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzEeQBd4qVGm9JgmmMP1iyLQB+gK14BZ1mh6GaefoH0=;
 b=o247il0G+L5Y1X+K2UJ5oaV0CbyZZQmZcbj6VLT8rcLYAYGxLdaz2bStT8iXz6zESP
 vhavegc2aBkVn8rxVli7fwidFRDBUt7Bkhhfi41rRnTq4K8jDkkoJIZXYYbA8Ssx2ulb
 ccx0uCcQVm9qop1OM6KtUEelLSxhXmy67oA5IBSx/8NbwrAd44eSh1FHP9wuD8cp5maY
 BwRp8d8DIooWUo0Q6nDFckSz1XfR/NfodV4DUfmFw+hISTl93WvqJcg0kFwSf+y5pHsM
 2LPLix6qVW3UyxJ3CxlJE/2gL29opzqIDnqIuoRaKe4h+fpHxp3JT7pA1nYGaJbfifyJ
 FAWw==
X-Gm-Message-State: ANoB5pnHpOdjSK03PPj/8pFRc+HwdliAjuOs2ISJkpkcueB8EeSedFFw
 LecXHwvrs19h7IA7f62VQgk=
X-Google-Smtp-Source: AA0mqf6mJkKMHnG6+nKkmTXcj/ijy8QDO0d6tdmPbqUNhwl6IlU6e8RfwRfjgxvFbLGJR4ilyQU7JA==
X-Received: by 2002:a05:6512:784:b0:4b4:a304:998a with SMTP id
 x4-20020a056512078400b004b4a304998amr14912583lfr.555.1669754825367; 
 Tue, 29 Nov 2022 12:47:05 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:47:05 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 06/12] arm64: dts: qcom: sm6115: Add rpm-stats node
Date: Tue, 29 Nov 2022 21:46:10 +0100
Message-Id: <20221129204616.47006-7-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129204616.47006-1-a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add rpm stats node.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 04620c272227..6d14bbcda9d3 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -538,6 +538,11 @@ rpm_msg_ram: sram@45f0000 {
 			reg = <0x045f0000 0x7000>;
 		};
 
+		sram@4690000 {
+			compatible = "qcom,rpm-stats";
+			reg = <0x04690000 0x10000>;
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,sm6115-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x04744000 0x1000>, <0x04745000 0x1000>, <0x04748000 0x8000>;
-- 
2.25.1

