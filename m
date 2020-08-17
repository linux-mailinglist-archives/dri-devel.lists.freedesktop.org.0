Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A22479BE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 00:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B856E0AD;
	Mon, 17 Aug 2020 22:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA276E13C;
 Mon, 17 Aug 2020 22:03:32 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d188so8920611pfd.2;
 Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmKaAGgfZx42q6QOIHx5Lo8CK/gYxLGoADMxgJD50iM=;
 b=ON3+IT8Ii061pwCIRRZqlM9dlVHI9VqTJH+YgqCVJh08kX4Wa87xBftx90qimud4bs
 hoV/afh5Gb91orSJP31DsykdtRqKHhTX8T6FzxOg9HAAKW5uixwIGFTHaGaIzqlpkaTp
 QXI3gdMrm73rnYCJlvYVTmfDcYNea6kPLUYU2muv65ubqjwAKEetUt2WCmpPY6fVKs1W
 UOeGwRgYvcGKocNyZpk4dVMW+KMbgXFaif9rZdJd8n/KRbKHz5sttxdGREVQR4oKm8Nx
 sedk3E4hsHzD4lU0wCGki/wwMi0KdaQ+hOu8IjJUqIzrcdjVU5SLAoB3SWJHeiNOFX19
 bVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmKaAGgfZx42q6QOIHx5Lo8CK/gYxLGoADMxgJD50iM=;
 b=Cpyhr+mIrtgn+/Ab1hH3uFidFqiIp+hJfmoWPFuKwZ3un+wtoTXRiw5eJbdJqwK50r
 Tttf1YPmw5NUMeCR4FFSqCDDOkJbAvBJulxquweDIODQmiT9/mXZeVX6D3H9dUJtdSks
 5Gj2yyavbJui57IpgsThr5ny2b5OXjHaLz+VQvMbSIXYuY/oDelo4+l6/s1NcTxMVA6v
 003mDtRz1dr/wkHXg4HWOdcIoYVuJOzhcCtkJTazsTFhMQODVvMkOwZNZjxJiYD5K6cE
 Gj0BDSA4XeTDzciGYG2wzjXKXPWrA5HZkx2xvHqLANBt23WFuQmhEj3mzuK9rQ/o2Sn+
 43aw==
X-Gm-Message-State: AOAM533guPLmllKI0A3ojC7Cm+4UPzGtK4M9sS9pEiDSQz8E7wCLLDgM
 wP8g6QAvO8HH5IZKKjcQVj0corYElE0Mzpbf
X-Google-Smtp-Source: ABdhPJyHVZ2OTKAViaAMnr6GsfifqWWu585AcJLDTY67ZRAWutmwR3M2K3MJr2/0BsfVKF6RaNHzqw==
X-Received: by 2002:a62:26c2:: with SMTP id
 m185mr13108433pfm.115.1597701812121; 
 Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 bv17sm18615468pjb.0.2020.08.17.15.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:03:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 18/20] arm: dts: qcom: sc7180: Set the compatible string for
 the GPU SMMU
Date: Mon, 17 Aug 2020 15:01:43 -0700
Message-Id: <20200817220238.603465-19-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..61ae67186691 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
