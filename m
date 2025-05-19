Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DAFABC3B9
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51A510E2DE;
	Mon, 19 May 2025 16:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="grqgZ2fF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4910E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dZSp002857
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YsTiHmb7isyOGDE8/KruduhKbyDLygH1h/oqB0G8slw=; b=grqgZ2fFQ9BTdgqv
 yCZh6AL7rJj+RInWywzUr/B2eIKUI+OtTXjAbpiKxSG4DjW67IXaoiXdRP3Nqjmo
 8Bt4N2yzjYWY1yExF4ajwKmphNSFaCDpAoFhiVLf3B+En52caYR4MSyQsxsPHtb4
 gN9yJRQVM7+tXlHt/JvOys5LOgp7wUokyrDLd/sK7K1GN7jdwn9jKIR+w945iA18
 g38J0RmIop2JuqzvP1thKIoKqnczIueyoAVmadeCDiOET9w0UrSkvHeUqGQyeYbt
 IS7/06FZKSIDfIdUEytVdcfYQP+ojeOzOzfM1HfQ64s+/1+NN7pB2leZ1LI8ttVX
 0ZSQfA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1ath88w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:17 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-402ebf9ac19so5178571b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670716; x=1748275516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsTiHmb7isyOGDE8/KruduhKbyDLygH1h/oqB0G8slw=;
 b=viVBNVQ0gPL7mDeo4v7QFX96qZJCwtonsJYupAebZeRkHA9NYQrUlSq59qY6E+Mktl
 9qs304o41DORXl0+0toNkxyDbPpM5L54Ohw7r3EKR+LBMImgomPtXoulUUTB/BMulcDZ
 +ZsPnD0A51EE+C8pvAq8O3HLt8A+gHt0ZDuowYWVDUN+yT+RywVydMlPZGBPTeyv0vL0
 bLYZW2rSdzIu+xkZLoBa0eoLAfcfmhuIkzEQCOPg/vJSI46OnzpCUT4G45gU9JBiS3ZO
 tWQhMgFXfWl43AYroWnw7ZdUyDkUQLHzvMstvxzFoEiNr8eO8uwvke2yL66WMLI91S1I
 YioQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVNbO8UkApTyj+w483dwCTn+H3zuwwAh5DcCV5P3+CF1o1MNN+jq+qcqgltX94KM1PQUW+k9Y3GiQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztsEaa6cuEV9G6jWPi5Db9hACx0e7VLCNj3oP1Iaz32T/5tu5H
 ElwQANCitD2BYlbFrNFBBYp6ibLoNPMXyznnNJPdLjsDetMW8lrOZasrKnLa5miyeyA83gR1rTD
 G70ssCHHwsTjw2vOP+DTOk6aE53rfkbDdoIdJFRU3vAN7IeOalVZGyS9yNXGpBWipP9OFIwY=
X-Gm-Gg: ASbGncu7VuiiLaR/nS2QXXIzolKVnfspBW+HAflhoyH2PTdkaspn4p2e4w+UWVcbp+J
 Dt6I17IW709evMswnlwMXCP0Q8eD86njFiJUis2xpQzJqeTySl+q3X2tLKLeWRlS4YlV824FPxm
 YclRqsAq7/tiU4toUiyNczJcpcgjyPj95Ql7IuQ4TxvxJ0CejRDy7SLk/crj/UvVQte8DSsbXlz
 Fp37b1758Ll23uqqzTOuYhE2IFWQqL9IpsZY7z7vfWKgqZLROtAKBsOfZqpY1vkd5a4TOYeAokr
 ZrBhpxcobPABuy7rwJTgUMy7UiiSVSA6joIaadueqd5XQPPcNm1uM0ONvsBMqcraNY5GrowFwAk
 PK2vypQy3pl9dYbHQnpe+hCUI
X-Received: by 2002:a05:6808:80b2:b0:401:e61b:fe9c with SMTP id
 5614622812f47-404da74dff5mr8212327b6e.20.1747670716707; 
 Mon, 19 May 2025 09:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe4piQ562b4IOVlspGzW1msi0MQVT0roIPekkjKhApRunVY8STLa/lKHyb7Sfjigf0Vz9hDg==
X-Received: by 2002:a05:6808:80b2:b0:401:e61b:fe9c with SMTP id
 5614622812f47-404da74dff5mr8212292b6e.20.1747670716365; 
 Mon, 19 May 2025 09:05:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:29 +0300
Subject: [PATCH v4 27/30] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=35MNqdGvRYdhOY1x12AD2ENSpIyXidrM7J4u6sckI88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9GtkSD7GO8np7rUoAPPvY9u3OyoyXxiVmR
 mTnJv+kZ3CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1dmuB/9l91KzLmh6ICG00cmsuDjo+lRclidTnIkHB3cZDpt7aXjjXGYF1PL6rF31Ybg065aUiry
 EpsHViQ4PU24UoL74miDjFbJHl7PxouVD5uwXewnDqeBtSSu11Gr1EWqB3tMBkhBgv1Cy14reAD
 vV6B4+cUXHeykRD5f+tDnXmqNCmAltwySmMPfErk45931ZGXGcuU7DZU3dzg7/Y5kINZZWMc7N0
 eoBVL8UT8817QgJqv2Mu8Bgb0EIBTrYD6q0cbiTTEH4WiGjm2XFAjZZZ99LFlwdCl5ZkZH03xKa
 yqIfL0vk+wVXXvMxQBGfFYYqOD3aVT6Ki2OT55m+v+I5fYcy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b56bd cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ROdM2xkebP1eUrOBjpBEbhqTxZIQVo6X
X-Proofpoint-GUID: ROdM2xkebP1eUrOBjpBEbhqTxZIQVo6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXxr6gmpqgLZZd
 JfTW1b943p/ULpCn3yuqOgfnKccr3Hh9yi3F0pLCXHKJcB7lDtsXn2Bs8/uRs2lVQiZm8EbRwf+
 ssRXpeGKA9xwqZmsbZOVKY2B966vmihclcWchxWAkZA9oPvsHwfLecK5ciZpYqlsT+ZNTseS5wN
 7WHUHB4MUEZQ56tL1mZTig2bHNChbKZnmRPUa2NiR6QuYcGxQ+ZiXhjR2A1N27EAKW5HJ8CTXi+
 hMd9+zNnARnr9jc7Lv6d2AsVKkOfuQf98F226+I7zUX1EkTJtny/2Ie6viGKrvDDBqEvZHOanpv
 wIzEdpdxLqn7j0GYI04348glk1R/Af3LJ2V/AUXKohHjfxdqpNgSG4vrLOvuyoyw37d77JUnMU0
 5PlZm2tTVS0Xn93MJ6DbhMhUtKTbA9A29oSkEbBK+ujUxxYBLZX6igq/B4n8h8xwRec3NT3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=795
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

