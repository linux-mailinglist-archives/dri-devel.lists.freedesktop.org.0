Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72171250841
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E626E51A;
	Mon, 24 Aug 2020 18:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ADE6E514;
 Mon, 24 Aug 2020 18:43:04 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id o5so4997013pgb.2;
 Mon, 24 Aug 2020 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
 b=cKnPnNCTWkaPr7f7iLMlg926WJU4UrOaPzfxFuLlQmLn9Y7XcZslcjvmp0E6xfwtOz
 gkZQ4IxM+pDxd4psoqGqo7WxSHhR+rc9dYIzzwOlOCQ54tBGHD34WnB4UECsRykp5Z8O
 en2Cp+5/9BQErxsjVk1881aQLuK1GHfb+6Audna0letrJ1mnS+M9eeRvQ2l3nnk7CkYZ
 VuSOgl2NAMCIReBC9EYVI7F2m71uuDLKcVLwZ/+E7fsvoPVq3BNE946SmCMo451CQMyq
 H0ykDMGQU5viHtIQmzaf397UPKBZhq7vuQRH58n7N/mCbXaIvgplxyPjozVjUFMh4ZGu
 VEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
 b=kVACd07N4EmFish3WQQK4w1+6pvYiWr7FGgCZDcCldt3csml8eOUSBA8PGfr6rs4pJ
 nxnGo8kJziX7SGJ1pqpHuvpybGdh6lJo+5bM3dCp+TvdFigvM6Z7BPOX/eaqdQkLcHxI
 BicC7C1bPuOKOpXuzjtfkp7zwJ0LxWV1BJ1nVOw317YtQPArksntPpDvVpZC+/zQR9Ee
 xSlyApAuDpYFI8mUautge5qZeSGZ2x7uX+XQ+v/TuG95Fl4CydenlVAcXlM7182y6cXb
 uNhtFzgq8m9aF14mTQ7w4/EvMgf8SSNRRbZUemftVlZ9ltu/DJRn42NItrs/qMuHLYCv
 h71w==
X-Gm-Message-State: AOAM530bOrmg7HuSkYjOFfU1LJtItd29GxWiHodwTSOa+ypE/z6TToir
 3LE6eBiOsYr9XFJPtZOOcogv0Tg5dWwgjSLz
X-Google-Smtp-Source: ABdhPJziwKfT/ADuD97U1DcjSVUyIfoo1r/o3mFvVUDV/G+U1SSbfm8cvQlIS6s62gMCK8gPj+Br6Q==
X-Received: by 2002:a17:902:b193:: with SMTP id
 s19mr4902466plr.194.1598294583688; 
 Mon, 24 Aug 2020 11:43:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id in12sm241872pjb.29.2020.08.24.11.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:43:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 18/20] arm: dts: qcom: sc7180: Set the compatible string for
 the GPU SMMU
Date: Mon, 24 Aug 2020 11:37:52 -0700
Message-Id: <20200824183825.1778810-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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
Cc: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
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
