Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232B54BE03
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 01:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2441710FC41;
	Tue, 14 Jun 2022 23:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2797E10FDF8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 23:01:38 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id e24so9746987pjt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RWlMcK/WiHaE2lupDQgc+icrhgmdMQxgOsPbDDDl0aE=;
 b=rxZaCTVb83tYMLMGAxqk8WP2FjGYRIoCovnvFYKSSOhMElgtlaDdZdSZMKPgSK4Yvo
 rC52cpeIJXo1GGTArDPxTrvH2g0j3p7QIUY5w78AbPKw2KsYXheKA8zc25on4qL9jc7k
 Pux+AQFyh9bQxZS2Av8mD7rxozr+inA00Hb7dAzDh+Di3oqIzFrchKq0vkDUvlbHaxek
 DRfGsep2dsYUDMjpJWrl4htAQKqUQVJIsWTNYxGeAn5KVIyPZqHF/KFc4lT4YMeLJIf5
 ry7iVS607W8w4IYMtJIee9psu43QKUIBJbDZIHwrUeV5l21LlnXFp0dg9U3JNTJh/a2F
 me6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RWlMcK/WiHaE2lupDQgc+icrhgmdMQxgOsPbDDDl0aE=;
 b=RGa5cuWaZcXrRKrfcZRbkCbSz9hT1Kk+y+KtCpSv/qIgZXCooHEvjhh1sU6oms9WH1
 3mGrxKWrjbNpRTTr9AX08JtlGSV8/uGq1cGGq/K/nejpmtskN09CfmOfwQPyMfK5xfD4
 SlzX8p+wRpiLlwUtH/91O1Uv5vDP+Ra9A9xGfuC+6/+wiBTVDA+kENCD8FUcylJ57pvX
 2/jh1WK8IBgKPwE1xfSoSS6jddaG9iLb7ky3LLrapxizWPqU/d/JxRZxlLPMg37SozBg
 J8GKybuGMXJUjkfcut1QH1Z7hmYi6+zi4QZtwk4O9juPZIl/Qz5y9uR5hi9M3qK2ul7c
 hiag==
X-Gm-Message-State: AJIora8zde4wBGrNt7LxDzVIQLA8nigCGLoHEGv3mETw7KqunZGybRSh
 6BTgOS3+5s2fO9OSJZaGRI/GXaIEfWUzOjckm+7Ifg==
X-Google-Smtp-Source: AGRyM1sug/F5zUgorGwld6/cvjxSjJ3Ba76jZNwLVen3RaltHSazhsqEJzh8eunYtM28ILlpP5FJ5Q==
X-Received: by 2002:a17:90a:a605:b0:1ea:6b4f:915e with SMTP id
 c5-20020a17090aa60500b001ea6b4f915emr6825913pjq.60.1655247697545; 
 Tue, 14 Jun 2022 16:01:37 -0700 (PDT)
Received: from wildbow.anholt.net (97-115-79-125.ptld.qwest.net.
 [97.115.79.125]) by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b00168c5230332sm7787768plb.148.2022.06.14.16.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:01:37 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu: arm-smmu-impl: Add 8250 display compatible to the
 client list.
Date: Tue, 14 Jun 2022 16:01:35 -0700
Message-Id: <20220614230136.3726047-1-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
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
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Required for turning on per-process page tables for the GPU.

Signed-off-by: Emma Anholt <emma@anholt.net>
---

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d8e1ef83c01b..bb9220937068 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -233,6 +233,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mdss" },
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ }
-- 
2.36.1

