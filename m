Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B0024437D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B536EB12;
	Fri, 14 Aug 2020 02:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723E96EB13;
 Fri, 14 Aug 2020 02:42:10 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id v5so1362383plo.4;
 Thu, 13 Aug 2020 19:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
 b=WSjYyuU3IicqTzGKZ+qyMjOajK0Y+CUj5/an3UNid9VEFQQQ/GpitZqkA4Xu71HuQ8
 uyDetJmFxIA+LZ4XKMdbTacXBdQ0BS3SOFEr+zfj8Vs4H+aqeVXRsK6JQK/JbDEBN6KL
 KRMXnTA5bzHXH18nGWyEk4Oe0sZ/kKopVL4uPgbxwS47tJ5mL4kSYON0DOcpPgu4ncj3
 JPOGnNh3/vssv6qpnjwMjU1C0PCegmTgZmDWFyDlNeNIQ2ThNiwnKSOI0nCAg2qqb6AX
 sLmkxHWNJBh1RrM51cityB+EYPnBq7MWoZfATphAbQy5D3+kK4PBubVAY2hgGHqvs2Xq
 TPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
 b=dmBh8H9p+4kISFnCRXoniB0B/b7i53/i3V3zOCrDgGG7gz9MAYEmnUxtD3OCz/a/Ob
 asLucP9cnvv2JH3Qt9dURjoq+AGx3WzS8xjXbnUZVj5E+ZtVLTH/wMjHC982X0B26DGT
 SX1uZQcBljdjcLBqth6wXbUXsy5yL9gXLeMni86J8dArEe4J7SzLSd6fU7hKhjWQgO6e
 nr07qiT2wlWJ11BK3KnAKn9n9+sT5XlOZLAI5vkujxzKpOKCMJaU/GqJob0QLWwRkra0
 rHWVWpY7wA+J/kBP60oUdTT+bTLhNC0IF6z43dzopzfx7HTA5mQUSZevL/abIlblFjma
 o2Vw==
X-Gm-Message-State: AOAM532nWecR5pWa7rUZOBo3sSfHGd8TDnjw7gK39f0hoT0PsOSjmrV4
 /5CvMTaCzo444jMf75GOUG5NW+G96N4wGw==
X-Google-Smtp-Source: ABdhPJx2Hm4qJq+ws1Wzuo6A7am1wv6hPi7gD/YHP4Z3vqtJe3/ztGrQUEPhXJiyo9idH9IbGNEomw==
X-Received: by 2002:a17:902:b701:: with SMTP id d1mr562133pls.92.1597372929283; 
 Thu, 13 Aug 2020 19:42:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id x136sm7189060pfc.28.2020.08.13.19.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:42:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 17/19] arm: dts: qcom: sm845: Set the compatible string for
 the GPU SMMU
Date: Thu, 13 Aug 2020 19:41:12 -0700
Message-Id: <20200814024114.1177553-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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
