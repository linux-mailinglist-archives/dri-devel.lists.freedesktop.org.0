Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B230A63E151
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8865610E4DD;
	Wed, 30 Nov 2022 20:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73CB10E4E7;
 Wed, 30 Nov 2022 20:10:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z24so22174158ljn.4;
 Wed, 30 Nov 2022 12:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZI36fDcXOdBjV+BrFI2iVTCVlIJAblM9KI9TL7sAns8=;
 b=TLnqAXll6nYU3/cRmZ9Qb5BrSLih5PKDpNI/nN0IqYBT75P7ZTfcaSxQ1vzQCOphf1
 4dH78gHGmendt1LXrbeD4+DgE4L5Q1Ar+dpwrJTJMLQoLLsfPNSXb3aLBhgIo2QXxUIl
 z2EHmQR9O+O9Fg8sPELylItlPE2bC+O3x2pQWtdtBbdg8MHUolxP0hjRyK8m1z3Y1EET
 sQMvyqPamW2HGY3/x76DRMZILwQ9/RCxhVcN4en3dfpiWOo+DoydkfsH17u5YcVTIdaj
 DN1oVmz6ath7K/OXtf+KBHb9dGM8mYbWxhNJs3RT7M0HOFbjak8fiQp/42Njrl4Z/GiB
 NcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZI36fDcXOdBjV+BrFI2iVTCVlIJAblM9KI9TL7sAns8=;
 b=rtte7Pwl+KvTkegENiynb9MF67Mp9lCJh8Fuc0su6lAG6fNMuSDT9AgEXsKom/9dXE
 ePN6ogAEtX5SCSPMGluFtZwdWW+AKcOaLacRyIZ0K2JaBF7rRpw8daJ7WkLDfwwtiKBX
 l6F42ig0HyXbTL6z36FTHThPDT1GLWo/DpRmU6cEPl6HmIhZ4Q3WSp1o0hFuc++yqARK
 nJUGYURem/ztnm/yzla31j4Ghcex7CfrzoPvjBGnMhxrdDHSalKL3KD8H7zHK4Rp6V5b
 oux42XmLzTC1MYNw8PaxQmpQa8yxmdEySybqE9oCYnQ+/mmzbw4jSciZ9IEf7wBnxPGU
 Nz5Q==
X-Gm-Message-State: ANoB5pl+2dhNXp1C3dWW0IBFQt7Qb6MplTD6A844H23jftCHM3WSDa2L
 mZF3DqyDqiSGD+nwfWuruA8=
X-Google-Smtp-Source: AA0mqf6fR/tKq40y1o1ew89Q6kWJtu3M42/4bXxdpMmVeT0mXXt9SSBGrAf8yGd0Pz6k3OUuLYKWqA==
X-Received: by 2002:a2e:be08:0:b0:277:857:87ab with SMTP id
 z8-20020a2ebe08000000b00277085787abmr13626350ljq.442.1669839023684; 
 Wed, 30 Nov 2022 12:10:23 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:23 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 12/12] arm64: dts: qcom: sm6115: Add smmu fallback to qcom
 generic compatible
Date: Wed, 30 Nov 2022 21:09:50 +0100
Message-Id: <20221130200950.144618-13-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130200950.144618-1-a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
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

Add fallback to generic qcom mmu-500 implementation.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 38b903592a57..572bf04adf90 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1233,7 +1233,7 @@ dispcc: clock-controller@5f00000 {
 		};
 
 		apps_smmu: iommu@c600000 {
-			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm6115-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0c600000 0x80000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-- 
2.25.1

