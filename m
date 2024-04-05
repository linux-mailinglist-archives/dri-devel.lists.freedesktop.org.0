Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D772389982D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2679113A85;
	Fri,  5 Apr 2024 08:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k+qMJako";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BD410F2EF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 08:41:37 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d52e65d4a8so28309001fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712306496; x=1712911296; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hrz6dTaTK0KlWdsP16Esc0J5gm77xoC0tsefEzseqJI=;
 b=k+qMJakoTwr29HcjouLtPRWoryQc8udQidcBCRhSlrboAWO67GNFugOWBzWljOCBqq
 v1b24HWhXpiE7VGznS455MLxVk832zck6k0emZrop1ypny4cEp9/4XnfRZ8Qj87OLYCg
 X3eZuMewZP/7Wv2Re6Mp7bTCBoJ5Nj8xUQ596QmNnnTGMmbeFV1Unev6jUs3B2iE+hSb
 H/fUc0JBMAs5GSbDz56hLCCUr1hp+8DVsZNH1OYHOZng1Hjg8wKdYvBPd/CQ7hXP3LoY
 deKfYTq1VAk/gypq/uZE2H24rsF7l9e/Gcl6AYFuzDLt8mpLzydmgaDlPbuEKf2fFUJT
 +eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712306496; x=1712911296;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrz6dTaTK0KlWdsP16Esc0J5gm77xoC0tsefEzseqJI=;
 b=fiGYekQRvrr9NbdoSsnG4ludl9hbU90hqMZEHTzo2FhxQz60+A1bBz+p1Cs+nZJV0i
 6VDYXDx6W7UxmTQ/XVyFfm3PNjmw7c55uD+fW4nXTfO8xczDpNb9Yih8WIOoQ/iBTd2y
 1g73P433+gsVKxAqLherFMvr3oWpBphGR2+EsHP9HC0f4Niviiiq6JWUXDa9k18pB3Tu
 uI0Ct94hOrDgTK3MVNPCkGy2fI0it0h3USNkcX6TuUu1IO/JdHTbwLYLhBlUok+/9Yv+
 i1IElHrbZ9jMJo/xpdcTmQ2uIfYlZnwDXvc3BbtY/55Jjr8ZS9SJSFOIeXqCLzsdqTm9
 WMOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhuMB4Xp9r9JIh+thJ+tSRrkMZ7QdyEJfQLdD4lc3wkPD904E4lHma56iztxHKGcuZf+utahitSOTMQareu6rNlIFKqCyN7mYzGHPaIa5Q
X-Gm-Message-State: AOJu0Yw8l9d1fJ03H7j/pRMmDGFEFN4SIWgoMkefcsJcgzCfueAcxEYH
 OVSV/P1v06EzfFpTxwEDFIfG2v3Zmr2DyBvwp0M0HaB+aYL40FNVe66eNlqa+iI=
X-Google-Smtp-Source: AGHT+IHl3jTu+OEG685vV8yMxLBRYabQaLyZqwz5PST4j9X2muXdZOgk98CH4aGQdnIUsU0cCkQKzA==
X-Received: by 2002:a2e:9658:0:b0:2d8:68ad:1e87 with SMTP id
 z24-20020a2e9658000000b002d868ad1e87mr671436ljh.18.1712306496187; 
 Fri, 05 Apr 2024 01:41:36 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl.
 [87.246.222.101]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:41:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:30 +0200
Subject: [PATCH 2/6] soc: qcom: smem: Add pcode/fcode getters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-2-ce2b864251b1@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce getters for SoC product and feature codes and export them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/smem.c       | 66 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  2 ++
 2 files changed, 68 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 7191fa0c087f..e89b4d26877a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -795,6 +795,72 @@ int qcom_smem_get_soc_id(u32 *id)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
 
+/**
+ * qcom_smem_get_feature_code() - return the feature code
+ * @id:	On success, we return the feature code here.
+ *
+ * Look up the feature code identifier from SMEM and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_smem_get_feature_code(u32 *code)
+{
+	struct socinfo *info;
+	u32 raw_code;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	/* This only makes sense for socinfo >= 16 */
+	if (__le32_to_cpu(info->fmt) < SOCINFO_VERSION(0, 16))
+		return -EINVAL;
+
+	raw_code = __le32_to_cpu(info->feature_code);
+
+	/* Ensure the value makes sense */
+	if (raw_code >= SOCINFO_FC_INT_RESERVE)
+		raw_code = SOCINFO_FC_UNKNOWN;
+
+	*code = raw_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
+
+/**
+ * qcom_smem_get_product_code() - return the product code
+ * @id:	On success, we return the product code here.
+ *
+ * Look up feature code identifier from SMEM and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_smem_get_product_code(u32 *code)
+{
+	struct socinfo *info;
+	u32 raw_code;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	/* This only makes sense for socinfo >= 16 */
+	if (__le32_to_cpu(info->fmt) < SOCINFO_VERSION(0, 16))
+		return -EINVAL;
+
+	raw_code = __le32_to_cpu(info->pcode);
+
+	/* Ensure the value makes sense */
+	if (raw_code >= SOCINFO_FC_INT_RESERVE)
+		raw_code = SOCINFO_FC_UNKNOWN;
+
+	*code = raw_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_product_code);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index a36a3b9d4929..aef8c9fc6c08 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -13,5 +13,7 @@ int qcom_smem_get_free_space(unsigned host);
 phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
+int qcom_smem_get_feature_code(u32 *code);
+int qcom_smem_get_product_code(u32 *code);
 
 #endif

-- 
2.40.1

