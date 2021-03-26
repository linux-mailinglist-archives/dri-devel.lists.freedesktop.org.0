Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1E34B27F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 00:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5166E6F4FD;
	Fri, 26 Mar 2021 23:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C526F4F9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 23:13:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id w8so3263672pjf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTdHDCHlxXS8HeXSDnDZD3RZIWu2U1jLMoVFhKk9uuM=;
 b=tqk+vNwsyxyoPrT/4uwLsfPSsJfJLmHKaH2sFf9Sm0hHUaMOyD0iGRPb0pdRxQTDX+
 jnhfqs7rmr5I0Ne93LEoZRDLlsVEgYIZrGkawQMhANhZVdN6pCpoEglXU8xepaaz8X7g
 MVT62FH0HE1RG6WK7INy6F8iFN5yeyIN69xGySnE9/aTSYQ6lBcJqhYyqWgCMHGVtePP
 OIlOWe4srTlGGGaFZvawZAIRQ7+3UsfykJqdrI2X+PqRhny5h6W9vd3wGGi97x2zOVR3
 AK+ULm6tEVndXhLQOBXx7PBOOvscFNj2wXezcU9dbJ2JnnIz8gEYnygRABk64icizlQI
 nDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTdHDCHlxXS8HeXSDnDZD3RZIWu2U1jLMoVFhKk9uuM=;
 b=lK47IesOqeZ1NDCqOk7Bu3xjOLhg07KrpKTWgQJyCBHYCRngZ26n1ilMxBZgOXZ8PU
 B0RRLvybAepy26m/cQ/GO0EDq8mBHor80yLnTeiMZaJFlYSKl5Mv62Hp4vCS0yrSLzoz
 8K/3QX8pBdXhvDX3PorKjJEva48y4P4hx7e//4MZNwxzuZ2CAFPQ+kr0RAAkRJozNX1C
 F2zbds78KsyDCfmwDMT0jMgOCA2a4+x0SEpA4sHYmXaZ3sQGZsa01XEomBdY9CuAyWA3
 oPAeiUxkrsxkUjKQ5EtbqtYUm0STLROtL1X/EesIgM8AOEsHcndTvRLiLMC5d6C58PaC
 CyQw==
X-Gm-Message-State: AOAM532MRIUknanHbQL/T0vXcLWqdwQedp0GeEfGCPmvUsAuOwSOuwod
 KcBft8ViQecMhlbvIuoZXmeH8c8xphM9ud6b
X-Google-Smtp-Source: ABdhPJwrLBWoDVJESET9o3RwESKcoXCf5vFjRT3X//QluFNvOGifh7lmWXe8XeObhYGuwGrnT5VyHA==
X-Received: by 2002:a17:902:b40e:b029:e6:837f:711 with SMTP id
 x14-20020a170902b40eb02900e6837f0711mr17334986plr.2.1616800386711; 
 Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.138.77])
 by smtp.gmail.com with ESMTPSA id a144sm10289325pfd.200.2021.03.26.16.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: msm8996: Mark the GPU's SMMU as an adreno one.
Date: Fri, 26 Mar 2021 16:13:03 -0700
Message-Id: <20210326231303.3071950-2-eric@anholt.net>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
References: <20210326231303.3071950-1-eric@anholt.net>
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This enables the adreno-specific SMMU path that sets HUPCF so
(user-managed) page faults don't wedge the GPU.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

We've been seeing a flaky test per day or so in Mesa CI where the
kernel gets wedged after an iommu fault turns into CP errors.  With
this patch, the CI isn't throwing the string of CP errors on the
faults in any of the ~10 jobs I've run so far.

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6de136e3add9..432b87ec9c5e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1127,7 +1127,7 @@ cci_i2c1: i2c-bus@1 {
 		};
 
 		adreno_smmu: iommu@b40000 {
-			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0x00b40000 0x10000>;
 
 			#global-interrupts = <1>;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
