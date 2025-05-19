Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FAABC3BA
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544410E3BA;
	Mon, 19 May 2025 16:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyzd7qcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FA010E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFkMgF023215
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gsIzya/eBNdb4ab4rRxQ1tjNK779o0t+RrG8HSI8IGk=; b=Cyzd7qcj3bgcrrwu
 4s2MoTS3mxa2x+H6h4FLjrzZipzwVYmR5fsiNXpeXR+Joi5fXDCw/eCNFYvH76OB
 TVcQuF7Rd88MTL1WbWgfScFEv6GKk3TSsS0eUCQGu8Og97gEfG/w81dRoJuWbCZh
 RnC88UlWyCJWun+SbKJV0e6I3dD8TCnwkv984XJO/EW3+1JKVnE2D1RnDmpG9HWn
 Am/0zRa/C0/BizI+R6uRl3WOdgMNLE036VErK03wWcTTU+2fa2tpb7Gd19T9AMKA
 qXIcugio6/vgmo0S93t25FU6nq4PfldLTYXMn+1iw1L6CDt2PKC3MM5f1tdBlUC0
 lO6kiA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041sg4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3fab1478893so1651172b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670719; x=1748275519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gsIzya/eBNdb4ab4rRxQ1tjNK779o0t+RrG8HSI8IGk=;
 b=U8T5vErOCvv3WlHm0Ox7aQCaWEMEQVzAZXIbtKCyYaE3iushpRtqq9Wp65mDTmT7fp
 cQErdd+x3HJ+kRrfTGjDxltgbYgd/e63HC9gP0i3mfuy/xBDEOldg/A/NPtITnDx20eo
 zN78EJhCpA3tQIdB6UJsoQhS5S8OpH5umW4a2LvPikqIPtWcEw/7RTM8ZIU5E2wlR96l
 P3okMg8Q6JAOnMJXm0vA5HYZSoXUNS1bNmwYLLMp+iKVOObCCu4V7Yanl0kPYMJzEAqP
 +HXmaQo5Cew7MvoMsg47Xjfc2ZPoNEm1laOf5fjVPS14iIsnCXdFF/C2veBQRX/EtrQq
 vtPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUogGqfr9T6T97FVeZ0juzRu9ptoDsDBSsjbH/R4n2jZ7vRbMJIKu4xHjFHjazJCkvOlInIzstFP9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcZEngRqkKfOlz6uMx8TJYjYdKU+j3iF4EO1eHndTiNHliuw2p
 TxaLDZj+f/thfyKOng1UjSdtZRW4KrilgoSLaqBvP4FzCTmSjVOtw+BEGCHFuJW3P46Ajonb67+
 hxBhS4jDIdRzLdUkYk6XPA+QSU+ZG6fJuEiKHijBaBD4H1KIeAOFRe2NFTCWWB/0wsAzMzr0=
X-Gm-Gg: ASbGncvqoFbcMGZMe44sQCpchljPF2NXO/2g0kZRgHUwTKOx+nAvOoX6jtYioIo8N2M
 W2xV5QlT4TZ204YcA7i+Xcko7goxLm+qv22BqCbQZ+Wb1NRUKIaXKAWAYq0JlLcdKScl2YQCTG5
 Dua7JoECXn8mweYYSxCNMKQiQoFdMZvdPF0FxuFnYTY41nGBjfhVq1rMApCxyf21vA4WtBNcLlg
 xJWd+cCTa7H4tW0lcRLX1oY2ugvoVApXk8hwLGu+GIBmGV9N/Tkw25rYRG/SbFE0OzLHkm63DJ5
 1rcMxlzs+B86hanyPgSWn4ksY9Vfzx7+GBeqYX3LgibgrebuHo0kKLqVo2DdnRJkyfI8D/t8Dsq
 MBVPdpxpjyFvQ1QdHBMU8Lr7E
X-Received: by 2002:a05:6808:1b85:b0:403:476c:ca20 with SMTP id
 5614622812f47-404da7e2ec5mr6460941b6e.27.1747670719103; 
 Mon, 19 May 2025 09:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEub7x1dRS4B9iMXiGcC0JC5HkcwCviFd2xJmrk2MlU11gZcT/P7NCUK/jOPgrySWLHaknKvg==
X-Received: by 2002:a05:6808:1b85:b0:403:476c:ca20 with SMTP id
 5614622812f47-404da7e2ec5mr6460906b6e.27.1747670718671; 
 Mon, 19 May 2025 09:05:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:30 +0300
Subject: [PATCH v4 28/30] drm/msm/dpu: drop ununused PINGPONG features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4il2Rm+AnjZK+9o9fCaz79Bb9Oko/V7wFb8PYj5DVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9OaF65pIo57+EP/tFZFqKgM98HIfjHBP/l
 Fv4ONTZK9yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1UFwB/4+iT5qUqSv0isF16eMN54vlGEEwBvzGcbqpiuVPYA1F8Ki4p37sYwYA5btD4tW7xitVvV
 v2dtRtXN47hslX5mj/aEoRYfO844j+t1+qSKVixvGRvXgVa4KXXEUAcxzdBErFnpcO3F4o2Ninw
 5ciXVnXlnrC46BxCyK0GlRf+Dmda9LNBaDfCuW5lot1pAhFpcftGe9SW7ae+wmwcRqM9baIO6GZ
 v55kvQhLbpS0XdPVSMvfmPbHjkEEVxDkN9xneM5JDfIPDdB1ajUFbAoW6eemA0ndckDho9D7hdX
 fZjU3ru54h974EhEsJP46J+S6eQbD+67N/JFm3UNi6/tmUXm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX9g8aLDrU/FA/
 0TqI/y0Cg5bTp7leD49X/nCbeVmm/tmvn/hzygOb962IYFkofKk+etICPusxgy01GVDitxVJY0H
 Lut3YmpqXK0rBF6NjnSoBbgNdWvHgMF7Yd9RerQok/N18l2wlEf+N+NWULsyx98XF3ulcPshecg
 ieb640u+7qBPNLIpllwDZILHndnTkAYCZSn+ZRYC0nwudy2edisKJMnvV76mChDbV9pXSh7m8aS
 601tg6a/iArlpy9fbEJqfhiFIIGuIx6e1jcoYLjcXo4P5R6WH8Bnn5jWZiu76jv0rbdMpZtU7JT
 W9kWq+wrIij5x9A19/eXG1EvSKLzcHWekgS1poovP5FQsv+u3oDwCqVnzTn/ruaLFYdO8o6Gh9R
 QEOE5rXEOlaKc5MUrPpej7s6ls29mBp4COEWsyY5SN6021UgdeBv2r0d1cIknuPtujkByTFU
X-Proofpoint-ORIG-GUID: 9TwQHPb-mYC4jG6uegqJxnf-FiMHYKR_
X-Proofpoint-GUID: 9TwQHPb-mYC4jG6uegqJxnf-FiMHYKR_
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b56c0 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UzLktXvLB0hFtr4V4nYA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=881 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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

All existing PINGPONG feature bits are completely unused. Drop them from
the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,18 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_SPLIT = 0x1,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

