Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F21AC1401
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC1310E859;
	Thu, 22 May 2025 19:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="My/lwRct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC210E892
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEsim3020973
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 meSvyd78U1CHNUSu1sjX6MVvdc93GQx+HAJc+T3ka+M=; b=My/lwRcteVTKz3B5
 lyMfSYmXpea+e8fBktUmgG1OfNTLd/1xDDUQyF+5b10vMyErxH2hhs8fjPwP2eA4
 6JD6/WeS0OAT8ZGtzFpfQUwjpachftX8VVJhAc0fWKDEJmxgFsxbNMypo/roImmP
 8O538JZXkzFXuMrhqT/zXVPPxv5CPzzvXJHlYm10xhr3Kn6yKOu3TRhNVPInKcas
 Hya+d2+Df8tGCPDY79VkDgCMOUqUi9I7t7jH6Rexyxttydd9FMKF37x48pCuRQKZ
 6VWGQGQRkbrCK9lpUk6yQEeeKcTFl/jlwWE29PARImClkNV5aRzDemkNFi56k6eV
 aaqFBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07nvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f3b94827so1330272185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940654; x=1748545454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meSvyd78U1CHNUSu1sjX6MVvdc93GQx+HAJc+T3ka+M=;
 b=DCEyJVSbIBRRluiMEZIz8+EwUaoxpZMNlPUSkXMNKOE+ClHvpIIg7mPGXRg6Cy9+AM
 GZewFvn6/ULmOB1VBBP03R5yYGnbaCn66iFUpTuzZxLa2m2jvm76Q4aDaX7K2tgST26u
 xX6SEGoJMezsKTqFhebLGNxLz9wtkwemSIZ41b/UipPtZlcSG7UNjLGQaCLIVT3O5+ZV
 evCMbk/p1hDgeTJj5fSBGUAuSzwL5n8h2Gqsy4TUw914d1clQXlaBHQapYQmlgRSWoOS
 Ulh9KKaxWeqCxXfEyqreyqNa7uWNi+SA7lXnfFSGgvLqydCPNXHD0W5Imdr9r58I6Uft
 oJEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUchUHb+5gEMM6XcD+0FenQFfRe/CrZyGB3EA/ZUzi4KuVIS3cssr0YKgYE0il+Mt51A2JGe/FNAcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRYxSqlkjemkRGooBnKJt0KihOjZbmaEpXJMSsQTwMuogtp84j
 r3Dfjh3AJNAiu2+SaIVb4qzDnx0CGW2YtV8DE1l7cf4RCpxjc4XZ5k/DjjMfpJSLlRddk9uXxss
 miKd/o04gJ4H6PW57X7I2ntUGFQmOfQhIrVuS1PND+HhwpWEczu9Zkb6UxKHHTawuc0qL534=
X-Gm-Gg: ASbGncseq97JryFrnHcUa5K2Q0W552vnYEPr951PXxqQB6a8Fb2Q3r7DTrsDiSQTSIm
 h5LCC0BGRJIwHWek4QLXiqrRjJxyaLPryDb85cio1eAJoWLjxhJRSEw50kKiANCe4EC8uQsJrKC
 rU1wkxEGiw32G7E6MO9XfIs3Br8op9GNRz/i96DzsLXEssiE6QqA/NRIsWEewlt7QBJ4KtuPSV0
 m9LRmM/X/ldGWj3Y1/VyGqkyd8AbioeUTtjYy3M2u8qgOww5AkaCnCF/7/qYYwpUksyKEIKa5ZF
 qtd9zhAZubww3PVj627VUkH2bdBBBVhWLHpb/cAdV49aZmhWulOO/lLqwpiQFQVh8FtHYwjK6tc
 TADoE/OJ2eOkXKIYAUw5wle1A
X-Received: by 2002:a05:620a:269a:b0:7cd:c6:40f3 with SMTP id
 af79cd13be357-7cd46707ca2mr3516548485a.2.1747940653719; 
 Thu, 22 May 2025 12:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEoBlcr8uJlH7OZ06CowCuAOkcwitzCRot/aYYoXoCrZstqB6iXIlg4LXR2UGY+FiR+3ACNQ==
X-Received: by 2002:a05:620a:269a:b0:7cd:c6:40f3 with SMTP id
 af79cd13be357-7cd46707ca2mr3516544885a.2.1747940653362; 
 Thu, 22 May 2025 12:04:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:33 +0300
Subject: [PATCH v5 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-14-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aJLcwGKHuUuyJyLVdSDXU6TlIm9ioIVYSavHMvjyGfs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+yd8mTk2bq+c+3TmX5ynanBR5/773oyf8stvcI+eqP
 5xp8ra/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATuRTHwbBc9W6r95vWw+vO
 fEo33H74bI/AE3GlkzUmPAceJlx7W6nltuSGa/Cfnu9PgpfZ8dQ5y2d4WaU8/cZoa53SWLSzhXH
 axj0qGb67lFL1Cu4GN/Z1NzzNDGRqeF5/ZL2Ng/qpIzOebbr7bRpf8LJivVq25Nec3SeMQzJbeh
 iqt/zjqxS9Nfv+5t8Wa5sz/Pivp8h0MDoYn7Ew+/5rsrqPzOlGreCOWhcjsfu3jbxaan77z9B49
 ZdP1v3L+rzV6mJZm2t3OWxqVZVaEh/HzXzAo0bXgemC+/3WegtTnRB1c9/6wDVXt0lJ3f/Gu0aZ
 m3cjr/1ZFr2+vrTST6amdU827Co+kc5yOMKYYf/j57MA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: XpI2f7r-JBtslQer0d6UztC2BUQdmpIe
X-Proofpoint-ORIG-GUID: XpI2f7r-JBtslQer0d6UztC2BUQdmpIe
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f752f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXzlZHlxFpQAm8
 USHV1x5ZATXToKjeRyJzVaim9gpYpXa7lvOzdjtsZvTs6RldmKD30OtxcvY846CqiqScdz2zNHf
 3j2jN0pmxrX77YLQYQu4BqMOhIWw7W2H71ydPOL0M58ocu0W9NFmX1g4nahSrUs8YtLMRfhCyyC
 axxXG9CZ5SjyWGBxSMxzN5XTLpG4rzVLqu6mpJDRfNjxqRx/iOhsjW6N3K/33VAdehFKhuc5DAX
 UXCl7bhuWtzv9ygmYR4hx1g/tYP+fOlOdke9edk27SB2gUQy6CFjeQCkF7fJj2uroffmn2fT/td
 hcSqyfKRZzYKS9NCtjtcELSRbabmv9CwPwFexitWreeWlYJnnFlNQ91MzRr5+UDWSGdVqQX/wYA
 vx2Ut7/FnrPOPZqAEKytS4AuC5eewdN6xlabG8T7TJFfA6l6U5j8c5VBkgftVTr1UU546qGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1244dd59648d11123c507a1369f28f952d047fd5..4482f2fe6f04e58408b55994d885ea1c717c6a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf6b2392efb47fa8c3e3c5d17f1a72341872e18b..e1c6df3a3b72ffb5a816bd18266a35abe723fbd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,12 +143,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

