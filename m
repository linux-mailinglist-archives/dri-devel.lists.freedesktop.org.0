Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1E25EA39
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4A06E267;
	Sat,  5 Sep 2020 20:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D90E6E2F3;
 Sat,  5 Sep 2020 20:05:15 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id j34so686017pgi.7;
 Sat, 05 Sep 2020 13:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMN6Aad98rZkq5O2asxI/gYil5amAFJMEDxEz6HXvq8=;
 b=Pns3oHCbWFzzejByOVGuRtp6qKL3sl4mj7AykBUBeMIX6DG8SR1IsoN6Ja6JU7Mmo7
 89KRmzbpwRMJZgVFooJIgnPncIpgSt+0EQvYxbEtZvr/exYq5DPPfS7S+ncnjbEhencR
 RH5YuTk5AGbsVWb0tGdT7dOwa0QwL6iFKmCTJEejA59iNmhNep/3QwIBxY7vvSa5bfZl
 928en8I2HTpfpoKWubThI/PwTsU8ldfmeANtINBPqLG2F2UTWsghPvDW3iuMWy0jWS7r
 KftJtF16JX0Ubuj9I3CFNVPkiwX+Irnt9JioDg924zLZRFRuzWi8RIzaliNNfS10b6oh
 2IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMN6Aad98rZkq5O2asxI/gYil5amAFJMEDxEz6HXvq8=;
 b=rmMWN4gbWZgPRIfxsPpZJh5TiaHxw7X5kryPmgfliiA947x1AW4pa11v/c8mLM2wsX
 g75OaGMWL6BOsC2y143yKzKhzq3TQN5pbmn5URd5MJkt/x9z78/GxJCjUsfl4g0hvuzV
 RXkyapvSsVqv9s7Wi/uyvO8u0Tya//ckGDVEpAD+WZ8Yb2KxYLOgGebVrHazTqT/gRio
 Ui2r17xvk8nONPV9vCx6b4Hw+vwbUdV2NcpCgQW13J/d8ORhyTjw1aviveL3K3sHtXZ2
 8tZ+N5ign7fCdxCxg6f8+qSrbYyLavQ2YQjNKH9mTocZKZqS1YiHQ9DqKBRIDRphtQhh
 wZKw==
X-Gm-Message-State: AOAM532J8EZg4FngxYI38c5MYPtMuYpddBqHkQkCITgXTuB2mwy9m8iU
 kkta6st5ojo5JTE4WyjtLqfACIEhduKEHymmioU=
X-Google-Smtp-Source: ABdhPJxtD01crAlFjZ6W6bU8A0+Jv4zKtX9LztW24Q4Cb6srFiKHgkdX/x8tPcvikAdykSvAmRGnSg==
X-Received: by 2002:a63:fa10:: with SMTP id y16mr5293364pgh.304.1599336314974; 
 Sat, 05 Sep 2020 13:05:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e18sm8722752pgr.53.2020.09.05.13.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:05:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 20/20] arm: dts: qcom: sc7180: Set the compatible string
 for the GPU SMMU
Date: Sat,  5 Sep 2020 13:04:26 -0700
Message-Id: <20200905200454.240929-21-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
