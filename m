Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8125EA37
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4296E2DD;
	Sat,  5 Sep 2020 20:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE116E2DD;
 Sat,  5 Sep 2020 20:05:13 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a9so1550736pjg.1;
 Sat, 05 Sep 2020 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+yNzi+IfDJ+cNS2yHIl9Dls9a4nGW3uD+2qdWnyzD8M=;
 b=UTKpz2e0fmP8lundyyLqa43ZaE2gfiYn/WFbs0DFE91pu/FrF/6vCvGUxBZlKPbPRm
 fAMS4auuAv1QVfBXoLkyzv9TY36+tSXGem18lPaiRHlwABNE70meHg5WAabuPrtSc6KP
 6kLGaNpVoDUlHmEs6IAKlNAKoi2WxpMMTchmRXqRWeKEbWtS6dTqqZBf2o9CiiEUU6JZ
 kepRLPknTnJC+UphLKOnCh2Z3yeAXsCgDrv94722++cjfZwn5JkWhUPXuJARlsaLzX6c
 5XhfoZgPIqmCCOix6dYY1jpSwRJif+rgxOMVI40UKcWq0qQHm8LOl2099cdzCK7kGkja
 8pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+yNzi+IfDJ+cNS2yHIl9Dls9a4nGW3uD+2qdWnyzD8M=;
 b=ZGihq0TM+mOYUCiv6QSwOkBIMThas9qh6HsLOZC8AySJPuMGU0iRaA9H9wsS1el009
 ma9mc9nCPv+kDYLs/VKeu5gdeofS3DQhAIuwJ6GghnymzK8lI3ImgaPAn3pCl3pkRX2V
 kZ2kz3Sw85r4ryTOKmEvs6Mg4ugv9jujDxsILIJrt5vV2Cz++jTewiFXxPZbprU669LU
 l3cTlnTuk823Ic5GdFFhI+2NxBQ0yUN1zHmVzICCzVMIDdGRlYwE05rvdrnSvKNknCxB
 bdixjB0ltPh/cnbth9yy0pEHo5hLG9T667f/UrzBRkJFu+uSObPeiE+6KgsQVb31zSzU
 Xrow==
X-Gm-Message-State: AOAM533SvUqtvUegObI2vyL+CmDDTqlRMzr76iOqtFdBH7BLkh+YT1Ut
 QRC0wd10ERX9S4JdLXnlMsd1wVo2k1ZefKYsVbY=
X-Google-Smtp-Source: ABdhPJyle2EeXQmObRAlh9fqauTMVZ1Ol+lTwAdWYVdznQgUP1KJFr1LiTJu0OLz9LRPeIb7okWUtw==
X-Received: by 2002:a17:90a:5283:: with SMTP id
 w3mr13912915pjh.201.1599336312677; 
 Sat, 05 Sep 2020 13:05:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j20sm10591603pfi.122.2020.09.05.13.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:05:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 19/20] arm: dts: qcom: sm845: Set the compatible string
 for the GPU SMMU
Date: Sat,  5 Sep 2020 13:04:25 -0700
Message-Id: <20200905200454.240929-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 9 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 64fc1bfd66fa..39f23cdcbd02 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -633,6 +633,15 @@ &mdss_mdp {
 	status = "okay";
 };
 
+/*
+ * Cheza fw does not properly program the GPU aperture to allow the
+ * GPU to update the SMMU pagetables for context switches.  Work
+ * around this by dropping the "qcom,adreno-smmu" compat string.
+ */
+&adreno_smmu {
+	compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+};
+
 &mss_pil {
 	iommus = <&apps_smmu 0x781 0x0>,
 		 <&apps_smmu 0x724 0x3>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..76a8a34640ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4058,7 +4058,7 @@ opp-257000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x5040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
