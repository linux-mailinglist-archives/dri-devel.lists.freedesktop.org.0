Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD628FD724
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C382110E80A;
	Wed,  5 Jun 2024 20:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aEgx1PaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE49A10E402
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:27 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e72224c395so1979781fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618226; x=1718223026; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jMT/dov4rCwVnOSBADCi4X7D61kduzPQ+R9fcxd3Uto=;
 b=aEgx1PaEz+96TwMsXiRwutVM8bPU/eef+odVKNg2gBfxAh8uvXQ6VmFKOX0auDGM0r
 UDc+6fx4RdFnIDudFjDUed51LpYNNEmK4KcqyPv6vkr7hbiJ1z/WpKEuAP3BxKZLbxaI
 Fm5sMDfjlKrWhBA10sLx3UNQ2yCYEGGhGYz/DemAwflj8CPY0CGjv5xIYJl8gHr26bcj
 YuFjGSRJzbiMF/Yea/USD3RFW/cQ7HxyjVcS7wI+Bnag8P6sdw9WothqMVc23nW5u2aZ
 hcNvV1vpXEq9GnAdoN5aYmDEnq0eYNLp1j9YvNRLoBpO/VjCUlCwVWQtx67x10Qdpv6C
 dR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618226; x=1718223026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMT/dov4rCwVnOSBADCi4X7D61kduzPQ+R9fcxd3Uto=;
 b=Q3zPyshiob5E6Xf31hwWVrSbidXEE6YKPprXozJT24qWxsUuT+2+bkmX8wTHZQJoN6
 YJWjdQnU0pcTk2pbwNpB4zp9SpQ1AD4UEToXBEAoQ56Uv6QD/oWIkIa9k1qwKvLZ9XuU
 dYnldI0Xnc6aJe8r0m7c5DE2oYr5dW15POPZcx/N3ShlvfiLb2AxFhD6M+zaS2H9rYRe
 YNQC44zmMWxjWwgv86RgQSRPTIaQWht1x2b4ahhFSzrfF1KfpqQnP617ijV3Zhf5hv93
 I13dXBlpKC/XVeNeghYBuQyaE729xzwo+2wLWxB5uaLj8JqzRRycZ34/61KGRAXDPZk2
 6NKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJw2szP1OfNXmycB8dnbU1GtbeDZDyv7/X8QZnLbj+4YKniYQyOPGAY6J7ZZ6yg5ENMPOs3zgwnxLncjqYln47tFwcmMWUDiJGUYkKN7ta
X-Gm-Message-State: AOJu0Yx6cdc1Bl51nESsaVAqcuq4D4KJ+V8oYCYQbxtbWXsuktOG0FuW
 8YqetG8FYmobBYpZUA+AdFXYFuMc9ZsWv7VoLnDBYMOc/yH/JXLVbZzjv+qlBlA=
X-Google-Smtp-Source: AGHT+IEuGR6zo172budNUpiwYhBQNuR5eJEdRRfWLY7Lr+ygWqIyqGnJ89qQjCt+KNbyocrh3WLYOQ==
X-Received: by 2002:a2e:9305:0:b0:2e9:8497:46ce with SMTP id
 38308e7fff4ca-2eac7a71477mr20869651fa.46.1717618225806; 
 Wed, 05 Jun 2024 13:10:25 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:25 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:15 +0200
Subject: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-2-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
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
X-Mailer: b4 0.14-dev
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

Recent (SM8550+ ish) Qualcomm SoCs have a new mechanism for precisely
identifying the specific SKU and the precise speed bin (in the general
meaning of this word, anyway): a pair of values called Product Code
and Feature Code.

Based on this information, we can deduce the available frequencies for
things such as Adreno. In the case of Adreno specifically, Pcode is
useless for non-prototype SoCs.

Introduce a getter for the feature code and export it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/smem.c          | 33 +++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h    |  1 +
 include/linux/soc/qcom/socinfo.h | 26 ++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 50039e983eba..e4411771f482 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -821,6 +821,39 @@ int qcom_smem_get_soc_id(u32 *id)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
 
+/**
+ * qcom_smem_get_feature_code() - return the feature code
+ * @code: On success, return the feature code here.
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
+		return -EOPNOTSUPP;
+
+	raw_code = __le32_to_cpu(info->feature_code);
+
+	/* Ensure the value makes sense */
+	if (raw_code > SOCINFO_FC_INT_MAX)
+		raw_code = SOCINFO_FC_UNKNOWN;
+
+	*code = raw_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index 03187bc95851..f946e3beca21 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -13,6 +13,7 @@ int qcom_smem_get_free_space(unsigned host);
 phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
+int qcom_smem_get_feature_code(u32 *code);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 10e0a4c287f4..608950443eee 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -3,6 +3,8 @@
 #ifndef __QCOM_SOCINFO_H__
 #define __QCOM_SOCINFO_H__
 
+#include <linux/types.h>
+
 /*
  * SMEM item id, used to acquire handles to respective
  * SMEM region.
@@ -82,4 +84,28 @@ struct socinfo {
 	__le32 boot_core;
 };
 
+/* Internal feature codes */
+enum qcom_socinfo_feature_code {
+	/* External feature codes */
+	SOCINFO_FC_UNKNOWN = 0x0,
+	SOCINFO_FC_AA,
+	SOCINFO_FC_AB,
+	SOCINFO_FC_AC,
+	SOCINFO_FC_AD,
+	SOCINFO_FC_AE,
+	SOCINFO_FC_AF,
+	SOCINFO_FC_AG,
+	SOCINFO_FC_AH,
+};
+
+/* Internal feature codes */
+/* Valid values: 0 <= n <= 0xf */
+#define SOCINFO_FC_Yn(n)		(0xf1 + (n))
+#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0xf)
+
+/* Product codes */
+#define SOCINFO_PC_UNKNOWN		0
+#define SOCINFO_PCn(n)			((n) + 1)
+#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
+
 #endif

-- 
2.43.0

