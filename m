Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE339259A3B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD746E8B0;
	Tue,  1 Sep 2020 16:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50A6E8B0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:47:44 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 67so965763pgd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
 b=Q9J0siRiCBTUvlTt1kvK7tVe6kE41TN+kIDNXErBGCMEu1mS9WGl+7HnaY7AizAAhM
 MGgJn5r7Rof/eu1Uou0PMSTw5hFRpugiRYy1Zicok/Tfuyw1H3V1tq3kahNYERz3c8YT
 bXHl75p+tvjsOILMrKaZDr3cZEd5sXyOpNnNhuqDgkx3L6L6Kb3YuoljJJBZkNLHwbFo
 soPQIChGhslKZccNHRLkXXS2dp3278kCoXtym2UYyH9+JavhTLC8/CcPIIx8CECq/6fQ
 wY6/1CctuejLklrAEC2Nb6tplD1fgnMzEIXMROD7R3A/ASkM5gP75Pv1ZPmEFTZQnh5W
 DuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
 b=BgFRM1UxjafOe6s6dcqsyNoyiKk8NhkNMLsdB+/XQALCkNrTbrgy+iLoxgVSblU8bM
 Ha5wgm3Ey2XBA1SEGJG9IHolBemV9QB/A519zwW8ccAcvBrA5lcvX340TfrDniSW6ro6
 +crBSRY6pO7s7Dgrxny9nFZ7r8pSopf9LTkjzGVQpU99RvzuH1dEWLmFCqjG05Q+D2kT
 +cT2KSLyBRY5OHjqlgrQ2pXHB2mIe6Y88Cih+FElVNu9PqWOagZxOr+Fj+R5lyi19Fnr
 80A3S2MIVo/L20yVeuhuBdzrPtogtJYr4DTWAy7lZz1FDD4FbO+p0gKwxPfKxWZYrHEd
 3/zA==
X-Gm-Message-State: AOAM530DapEDV662D3Vc5dVRrPx9Zjcs7zxTvZAZleKzEIqE2RFbc779
 xqnctk19Y/fz+sK7bLSSh500cdam/iPIxQ==
X-Google-Smtp-Source: ABdhPJy7payz3Vghp5VrIVR/57rRNtRm4gc2iwL+b/6W66VztvW4dVIOty7fJYRx21hhgXmVGY0cFg==
X-Received: by 2002:a62:928d:: with SMTP id o135mr2763620pfd.22.1598978863218; 
 Tue, 01 Sep 2020 09:47:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w66sm2622381pfb.126.2020.09.01.09.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:47:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 20/20] arm: dts: qcom: sc7180: Set the compatible string
 for the GPU SMMU
Date: Tue,  1 Sep 2020 09:46:37 -0700
Message-Id: <20200901164707.2645413-21-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..f3bef1cad889 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
