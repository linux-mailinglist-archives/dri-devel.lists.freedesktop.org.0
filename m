Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC32479BA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 00:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0696E130;
	Mon, 17 Aug 2020 22:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB026E130;
 Mon, 17 Aug 2020 22:03:30 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ep8so8306943pjb.3;
 Mon, 17 Aug 2020 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
 b=ZL8fnDvw2JO35q5KslLETY9tBaGJ6NBbXqEA7vYHRSLYx4P/opOuvZH6Mnw0NP08bX
 jPvTBwPIAKH37k3g7Jk9u+swo58YqYz/aTtg2qzWBIQjlE6Fz0nWrJY1Wi62AIZ/XAL8
 zTxxQ80xVY123z92lHmO3OtQdR7PSR1OQH/2EA0pKUfmIGOKDseiT7j1cYQ1f8KLr54W
 fzAWM+IXCZnD0oxyv6NO8WxdmW4/BW5sOKEYN+WiTR+vb9FME4m2K4+CI3flRms6Txvx
 p4YWE7fWjSidNKQe/De9YjSdtotAtG49tOwbIXVLbZb9eTY9k54o8InXzXnQUVIeMja3
 GtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
 b=UVQGN+6U3THDFy2JRnY1KW/3EMoOAfL2HxMqObf/sqWr5EfA4LCU8YvnD18ycYDJ3G
 re429FF7d3svhu8lKZsas6yPdPAn4dorW0r+qlJMg9egwe3VA9A0OVsHUxHPXv0UIS15
 be7ynf8EH4dVk6kKMZIxFI+xOcsPDQON8fYls3qyjCOebQ5aANv1PoM1Yj+RvXJLdrz1
 FyxrRf/XZR//HSY5wv4TutRAmJEbpXeSrqOZKXFe07Tus0CTktXtt9FBaVJ0jpZ5KKSm
 sQCJbCqMZlaBKA7V99zPXJ9syBPEvkKMcqK+NV7qmr3ckIrVcH+eyH5dSTTsdPq9RcgT
 eGSw==
X-Gm-Message-State: AOAM532+ihsaIu5Slj6M+W5DHNZZXP8Ke/oJYOueUUqQMlqnaRmaFYuV
 8HJ5aW7E9BsiWsbHlqD+J/aRDLnAlSG2IYMM
X-Google-Smtp-Source: ABdhPJzcpHZhmDBtp9AUC/rTQdXs//5Wga3CPsk+w6f9oGQlu4dMZIhJfEHvZb6UuQImgc1is5O1JQ==
X-Received: by 2002:a17:902:8546:: with SMTP id
 d6mr12962504plo.218.1597701809511; 
 Mon, 17 Aug 2020 15:03:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 f6sm20966585pfa.23.2020.08.17.15.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:03:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 17/20] arm: dts: qcom: sm845: Set the compatible string for
 the GPU SMMU
Date: Mon, 17 Aug 2020 15:01:42 -0700
Message-Id: <20200817220238.603465-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
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
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..6a9adaa401a9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4058,7 +4058,7 @@ opp-257000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x5040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
