Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44870259A39
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FC16E8B1;
	Tue,  1 Sep 2020 16:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622316E8B0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:47:41 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so889154pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJrx+AWRDEEJgr3DuJf5FGtuFm676MmhtRSCNhrUo5I=;
 b=d2/URyDwjchuggwTyHw8d/OgnYrxNo2olK6OBqsGffjs9tubNZacMeAts3N4QEfxw8
 5Q6mP/Io1kZ6ShbzKsdMp66CaPux8VHjQyV2cKCN9Xa0KLS+9ZSDrVarpGKC172y1hw6
 AfTeVgZ0r3PwraILILQvgL8q68+6/C3O3c2itMcUplLuX4Uw8as90AeNj4yxr2mng2/D
 U9PHtA6MttoyqkO7LLkNGz6fP5ePa4dmCRHpzecQ94K0BOVx9z2rfL9ZetZaMKGMMvxC
 zICl0CqJ2zk04r8CDOMEUTsvAtNeEM+44tgYS4vy503g6QOoJCmAH7g2srag0k4AM47h
 dE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJrx+AWRDEEJgr3DuJf5FGtuFm676MmhtRSCNhrUo5I=;
 b=Vburehgd2n5oKRJokzLibjPLaUdQTgycaScYOKGNEmWecHPAS5dOJuqe94HPGJEWHv
 W2gIR3b5Z1Tjnlp6ZRiOJLRAsVBFzQCu3oPmur8Y/6FpHG6MI77ZByhngYy10JomGYQW
 buRGQ8Mc54/Q/akj6ys1EMjc/xrCJQiEPkF9J+lEMBD3u1/ILm6wMG1gNbysrjBIPZuf
 lZV25MvgtA+JCqOWskDKQR/jGiQrr7AoOi74oCfu9EhrSySbfz87LIE5bgSwZyZPhw4j
 hWdIalSzZzA5T0N1o142aehd2goMdvCZ8TfW1N+r91T1sMKlf/G+6DFLUMvGd8xNOCh+
 xvGA==
X-Gm-Message-State: AOAM530xmQV3ElhRjGBt6emYtV5E+Phky4vbjxen97D4RcoXFW/cVRjG
 8diasozZ+xCqCAEo8sKtQkSYWxh82eDI88ku
X-Google-Smtp-Source: ABdhPJxfV0FiOo9Kg84TzFlg6WinbO0JkLmr3QdQ0ZPhheez1khfYC5+K4MYQGR60MpSKWKBwCPGmQ==
X-Received: by 2002:a17:90a:718c:: with SMTP id
 i12mr2397826pjk.101.1598978860386; 
 Tue, 01 Sep 2020 09:47:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k4sm2755950pfp.189.2020.09.01.09.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:47:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 19/20] arm: dts: qcom: sm845: Set the compatible string
 for the GPU SMMU
Date: Tue,  1 Sep 2020 09:46:36 -0700
Message-Id: <20200901164707.2645413-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
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
