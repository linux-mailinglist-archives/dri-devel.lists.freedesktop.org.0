Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA59899827
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3646113A87;
	Fri,  5 Apr 2024 08:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NBc6TYOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B410F2EF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 08:41:36 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516d536f6f2so341237e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712306494; x=1712911294; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gSABBNNlKEhtSsrOAA7jkzf/IIG0fsXnntsFQ9SmQNk=;
 b=NBc6TYOeg710Z+I6kCbhWcW+nAlRPJa81kzQU3AiIcRZjbs/AQAH4VXo2pXk8tF9yZ
 iMtWu8ipR5HB7SWcShtmfWuDrUntT5T2ujaauHVfaaAHbQYWIx2C/wxRw2uMZBeK4dX/
 smcNx9dx5rq9Pm7JqTdFa6fPqRSBo9T1sbTccz0BLyOoZnQVbMITXiZIDqjvFVlwGiEk
 oXBaXZxkph/BiF+CwxCoFxITYkcSi77cbaBGqXGScBCCa2EI5oFOAN7+uugDTpxNLXqi
 e7i7z88AR1av34bIMOsldCWY8GLiPqX08tRKmweOq1TAA+T3xwcIi49Qd3M7AYqSv+Ez
 FCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712306494; x=1712911294;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSABBNNlKEhtSsrOAA7jkzf/IIG0fsXnntsFQ9SmQNk=;
 b=CAyrZqupWYNaeOnhqI+64+4aE/LaRYC1LwL3Pf74kTv4CGyTZSUVBds5VwnKItwWQ5
 FcsmZHc3gVKd/5c49uN6w93CFqGfTHK0XvhNm8sIrqLccxaxI5ZWIasHmHroabAZNhGk
 BMdP4ZF3yliVt7lU40jjLE2FphucPgjKyXHChkXxN+tfYDfwvzvGvyVE0y84rGeEhthb
 J10RHwgd1U1Zw8I3RZqkSwunVOnMqfG3fjUzd+7pKtGUxGtyhpIBbRyY4BKVouZAjU2t
 6VRqKBBBSRo2s5oU7pZsXczqsj3C4IUfSmTdosayYBHMVqOwtLkShAiisg+E7AoPcPwT
 o+DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2yZ5QIZeFfr4m4CrrZKwdi49s7Alorv3t7Opom41OVmVlsMy1hQEpg8hzI4sOte284+inf+t4K0OSvVfuWtbbbbr+8OqkcIgdwdJewfT/
X-Gm-Message-State: AOJu0YwdN/uX8AdjAPfa3Ih8EeSCLUNOZqjxl6Mtj3pQSYky5Lzu+1vG
 h++L4/eEN8eQo/FdC4n8PR0vlb867jSCFZx4Wjd3erFXZqMBCEPhsopq76BAz00=
X-Google-Smtp-Source: AGHT+IGElqD09S+bJG4HGQvHSKf6D8Gm7soI+u09xdQyhSPfpytTlYXflLgvpGmtQOzdAf/NVzT1EQ==
X-Received: by 2002:a2e:7d07:0:b0:2d8:3cd3:35d with SMTP id
 y7-20020a2e7d07000000b002d83cd3035dmr709319ljc.33.1712306494294; 
 Fri, 05 Apr 2024 01:41:34 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl.
 [87.246.222.101]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:41:33 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:29 +0200
Subject: [PATCH 1/6] soc: qcom: Move some socinfo defines to the header,
 expand them
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
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

In preparation for parsing the chip "feature code" (FC) and "product
code" (PC) (essentially the parameters that let us conclusively
characterize the sillicon we're running on, including various speed
bins), move the socinfo version defines to the public header and
include some more FC/PC defines.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/socinfo.c       |  8 --------
 include/linux/soc/qcom/socinfo.h | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 277c07a6603d..cf4616a468f2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -21,14 +21,6 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 
-/*
- * SoC version type with major number in the upper 16 bits and minor
- * number in the lower 16 bits.
- */
-#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
-#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
-#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
-
 /* Helper macros to create soc_id table */
 #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
 #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index e78777bb0f4a..ba7f683bd32c 100644
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
@@ -12,6 +14,14 @@
 #define SMEM_SOCINFO_BUILD_ID_LENGTH	32
 #define SMEM_SOCINFO_CHIP_ID_LENGTH	32
 
+/*
+ * SoC version type with major number in the upper 16 bits and minor
+ * number in the lower 16 bits.
+ */
+#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
+#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
+#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
+
 /* Socinfo SMEM item structure */
 struct socinfo {
 	__le32 fmt;
@@ -74,4 +84,30 @@ struct socinfo {
 	__le32 boot_core;
 };
 
+/* Internal feature codes */
+enum feature_code {
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
+	SOCINFO_FC_EXT_RESERVE,
+};
+
+/* Internal feature codes */
+/* Valid values: 0 <= n <= 0xf */
+#define SOCINFO_FC_Yn(n)		(0xf1 + n)
+#define SOCINFO_FC_INT_RESERVE		SOCINFO_FC_Yn(0x10)
+
+/* Product codes */
+#define SOCINFO_PC_UNKNOWN		0
+/* Valid values: 0 <= n <= 8, the rest is reserved */
+#define SOCINFO_PCn(n)			(n + 1)
+#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
+
 #endif

-- 
2.40.1

