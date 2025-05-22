Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D0AC141F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8778710E96D;
	Thu, 22 May 2025 19:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnZgKkb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A583E10E8CB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEsRew013436
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=; b=XnZgKkb1y5kCdNSE
 DDCpHhfHzDETU7Fc+uWpW1f2BnDyapKJhLGf4bAqOi3nxv36LfFth/LyXViovxpI
 Vay9jtGoq5Wmuwbyzeiw3Fb96oJafy4H33mXEKn0C3A0TJGxR3j2U7HEUkXO6gPs
 XfO5RhlvEyeTfw2iz9phucwQ5KcR+M4I4rn9WEsg+1Sqirrqx1aNofM9Y0VuZCAn
 7p3dHDUzr2SOeESpyUsGljkO/ydL1qc0g77ITCovFp5XsRQATDnyYg7gVFDSpgfT
 YRfy700/cMXK4WjSBfrCCNAKlwyebbnuDU5KsDc5Ga10sFOECJFgaIzoN5wPXJpY
 sVw4IQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fntv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so1372503785a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940694; x=1748545494;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=;
 b=NqDlXRP9/vhRG8SISTByowR4o15RsX/QbG31AU1IdE15fcHjhIFUiCNti5Ga1B9BLv
 hmpkUghPR8h/lYFZNbqg/50WDFg0w2ASlXHkPgUN+7WfME5fF0NGWKjkClA/0H/HdW9t
 TGhBO54jqMUWih7cdo9HB382gUQKeT1lGo04QBV30l2bzhbLVOxoJBOWlBNaGM75KUld
 Z3TC42Y5aYLAfnBjG2bbP0nOUEc5S24AHAGNwy39sXBgGdC1dgBHO2vio0t3HoTK5F57
 0aOsl/FyFHqlSqcDLwEHb1zohTRnVkehB/pc/5IhvlviIqpobj3FaSqH4tAWf5+XNxFR
 uirw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNS8ZPllaEx48zAtNJtKHA/Ij4A6qQO1ZAnEn+F/OvtiDvtm7bMKMDYK2HrKDWyarMNG+0ZGkfA4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz9yxJlmvQFg0xfvg2sTglEDhw6U2nbrodbq/Zj1l9TfBTrOgx
 MbpuwgagBwhJaW/c1q3AO85LZeq0yr5NknloMRPog2kBuC3WSfbAHExtNwwmkM3ngf+PIMp83gp
 LogUixvjQhM5vwg0PWbYWH12D+xTqzgelFeBjbxmrqUxG6sUon8FThIyP8RFjmgN+8ZPrN3k=
X-Gm-Gg: ASbGncurB/Sh+ZoCgm0Bc6wpfnMdlicGUnErxcadgUnSmCjQbTvxcosg7kOxkE7YLeF
 qrIVPIHNJhAok8tOo2I9nANVKUgTo+JHhJeLzkWYe5INjPrSyyoSf2qzA9GDkDyq2FIcnrl/lT0
 ilPrsoFZEN5gSXK90wedSNyDdhpbq+4aJFpbLLeLDsLFkI7fxdc1/rKYK5KDswOlE281VW8sGkw
 nQB+L0lAHEj/OHbJwFJhuDqxAK4gLr60Z8t13vNpOyVlUX3arkN8Z7ujz5rOctnuM1Blbt87ykl
 T3TzS7jVrzONNMisx2BNQ9O5rYuBb6FDE/SC8sMfbiIfvwJUjOCWBosMKdvJJ3JvW8yY3iczuZ0
 M0Km6Iajy0gMNTCjvl4zMDnQs
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id
 af79cd13be357-7cd4677d294mr4167211685a.44.1747940693786; 
 Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcLc2sPE5Sg0jgDhOzm+gjAvrwhMlfl9yw4J/cxGCECts0yRwpyzhheSdHFWbTSgZfN+8qw==
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id
 af79cd13be357-7cd4677d294mr4167207085a.44.1747940693346; 
 Thu, 22 May 2025 12:04:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:48 +0300
Subject: [PATCH v5 29/30] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-29-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxAdYTmaogRQHBMvHaDa09r4i4VRhS75YE1TSgSsEq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3UAMR8c8v1LH0Q5G+F+m4l8MrzYG4LWw1Z+u
 LhhMQ4xUX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC91AAAKCRCLPIo+Aiko
 1eScB/43JoU+oCxhxPw8J8RbiyMcraZ8IT3l2HsG6AYvn7TMPCqdkAlbM47zI0Hir17zhVefYZz
 yKxNPG4vh9+fnzoLUr5h+TFrwVUIAz31mzA4TE0+t9libr48MWMAmWbDC8YXTeu2guOOg14LeJs
 2eRmxS3Qs0Txcd77G55RudXbmZhbgd9enJ+tRiT0+Osjoj5xBMYPK4IGa2B96qtX4ZW821QuRmb
 VuOLOywiyra8uqmdVYtQSXV64wDBndYCC7ttalKBGTvUO5vQYB2GgQlw/pftMqFHMw5ZEZNjcXK
 gfI++5ls+vfXoZ5U7Nhq9NwmxAKqzrMnCIWsTLRZb2GQal91
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX6Kd/PW0M2xiG
 6SRR2K294b+iuexJ4J/qRjLlOugQytaFHynyMcraMYkBfW/CDLAip0QBL5g5ltS/E8MzA0/blJr
 sDwgTzZnd1Mft/SNBqy4OowfUl+ysXbMZmpF989goUELHEX74qXSFtwyyFYjK1OJKcOsuOCBVud
 YZUdlJIejEtfTXGvqk9+uylVElQtAT7Xek9cUcniV3Mduf1dlrKb4FJ5Bcg8vjWCqT1jaReb5a3
 4/7aSvLnm1ZGYaD7ciXwv3gcNjL8tpxtP9YL9ebyTSlEnpnx5SWHU12UkjHY/81k9iDyxYpTEn5
 Et4H7BrpQGEyJX/2URLO6/4b2BuhjytuNPJiHbepLaDPgw5U65Wq1yv1HIrXw923d7hz3gz6Olk
 Q58pF1+xc51J4BLHUwd8gDUMAZ7iUjnzPVxELEtpIasLCzkAOXd6WkXvxfxg0bedDURZgV1t
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f7557 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pzAK92WBBU0_Ph01Bp4hnfwxA3SQgCgg
X-Proofpoint-ORIG-GUID: pzAK92WBBU0_Ph01Bp4hnfwxA3SQgCgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
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

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

