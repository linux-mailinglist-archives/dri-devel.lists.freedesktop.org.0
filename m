Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70FB0B5D4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5266F10E364;
	Sun, 20 Jul 2025 12:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgExPltN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EDA10E364
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K7v71S023258
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GUUWHPjbvH6QTNjk1RlubS+78L4dbRVcEyaUCE6DYUY=; b=HgExPltNrDystxWj
 WZSR665Nt+p9eq7eWJL4f2uy3uI+HpwXDQYDrPnrlciuwblpGP6a1lROBcGD/GnX
 iO/qiPEJIpwUaWVhp8WBMubwqXqMs5upEjfl6snNyjaVl8AIYNQm/OVyVGiBRyrp
 MWhfdC07X46zqFp8bdmMfMnCnYB2DBZxrSnhGY5lyTO2/J9xPyYl9k6ldIw+u1t/
 GMzzRKZuvNFuhgTbGUozprK1iRM8lFx5NYcti+vysoQyt9+ck0cUKxkgv4KieOHC
 c+EvBJbQj9GQKhRmYSIlIfB/T23yTX6bidXWecrSzzrSKOeHfArKug4atTbBbT22
 3XivkQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj3yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso5316431b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013818; x=1753618618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUUWHPjbvH6QTNjk1RlubS+78L4dbRVcEyaUCE6DYUY=;
 b=HEOyDdKdrtPJI5oT/J6tD92B8WosG210/ol2Yx0v0Jwro2mm+eSDKXNs2iaU2pMslk
 avRYOv4BfedzMRay0XERHQoUVdOr00mYOVOl4XUmWo9cqq7HLnPs/oLwyUaHFAnhxRFu
 /NwciIaLwMw5w9UiWwX3JT3o4ERuUqL1VyDCMABOtv5L4f4wgA5dfo2ETdJp4UYwEzFV
 vulnl2KaKsPKdjazN2BgIV0gDNoTZIYZIuCdYt7N1Zyqt8lCrjPdD/86+dSRHmklUTih
 ibuzHUOCaUaADzEjYGzFxY1FE1Hvm3/hnJZ6J1dIctcGKDHgJwWa8QnjZfyqsBJ3kqMN
 ndlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWvGh4dg8aiRGr8mkA19Nh754uZBzgOTx/o3lCh9MaIeC+X1lEND/P64QahsG9YFFqt3YyRCWv4EQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9da2thwSrTbCeBtBV0i/tdIwManTPAIBKfUZDw0ZnDlven/N0
 Gu3XdofoYUeyqV8c5sF1I8aPLyG5NNShyz5zWuVaHYC0hHN2bRjN8h6Pw/HKnkJFbeFTZ17/6l+
 osyHWPbSvVZjM60agBrg7acvmfXEOGQ/oqRxkeIhA0CHkZThz4oNpP8qX++9TB130+8JstAmMSu
 KQZRs=
X-Gm-Gg: ASbGncsxVEhfgX6aSqFGz0s8Q/J/xYyk4y2elDIGTpOp2VPaIj8FhnxA13xO4/4XPsp
 vcz1jLCaDRLJajpEmEiX4WhKlOEoiFjK2uUINM+SQl5MjvvPYue7KVoeCFdQLZ9CojqOMrngTKS
 Qp4JnHc3WyYbu5ntgHJSjMFUfcbrrKUPkFSL4DGZugrutPCpRTO4YZ6djAqZQRtohRbOURrSTEh
 tijh36HFEzBPSZKxS4DjxB7RU+hEUxyyNFJ6lIalNCDj3JXptFG4jo4A/Uh25jORP1fW7JodJf1
 1l8ng8xiqycDUM1vrq72iiClyA4jp2W6fbvcEwIAezQa6hhSTTiJgESj1Q/5whdk
X-Received: by 2002:a05:6a00:1307:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-7572558c61fmr24351249b3a.19.1753013818086; 
 Sun, 20 Jul 2025 05:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2Vjaw1ovzeerTh8e3mq89qtc7qgvuqtULfKqLQ9vBCRz3+D/lvo3jTsyzzzXJz4o8Q5Sl3w==
X-Received: by 2002:a05:6a00:1307:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-7572558c61fmr24351225b3a.19.1753013817655; 
 Sun, 20 Jul 2025 05:16:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:16:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:03 +0530
Subject: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1332;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=V3hva8uUglYlyb//OHKwJr7lHWspUGiRoLgjciN1ylE=;
 b=/a8q8Jnntk2Oh0OvDR281W+cUylzzDVAVr7i2H6et8pObobL9+nzaq243ZkTe+PAVHRFFJ5xA
 hd2GgfpCPOLCDh2kiyxqoNAVe7BveNjYHWS3I8ME97cIVRxBYs1amvF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: X0BBnHYvef-0wRL5u--OJ-CUkOwhkP5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX8NSTZ31fQaa5
 dWwAdAYAw+sXEqvqIZ8Uk6h7Syf/gPy18X9YOb9NT8OyfpyBqlvcWBq1UPddGuhw1kiC9s1JPVg
 VDGFFnUsWho4xXfcSwYhWe3AGjzSOPBhjW6GpalaG8DoJF/jqvSrZP95MD1zebWT04gfLSZvOum
 cWErfZUXWBNdrR0o9inmjRr4EDixq4vgc8Fcy+UGzmXO12PG4JSl0RHgTjmcGkPVQuejT4bm7hU
 pj+rl76PvOL10WSZw/KfW2qiJPaN3D56UiOpEeqEajdR1a6rWQ+rcNzbHNab4bZfrR4SZDDv604
 waZhgMR7LjR0hKOP50iZx/W0dBFAq4X02NyBv5gtwu3msXt6YNJM82y4IAbC7dnPSIu9dTazTUA
 ixflFeP8mxyjF6lOeBK+jQfwLVuHl0ZTTh/2QW4WuaH9DrGuTg1qaR3AwgLdBTRsLku5D9/i
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cde3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vRh7XmUrzz2ipe4V1moA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: X0BBnHYvef-0wRL5u--OJ-CUkOwhkP5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=713 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

A minor refactor to combine the subroutines for legacy a6xx GMUs under
a single check. This helps to avoid an unnecessary check and return
early from the subroutine for majority of a6xx gpus.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	if (!gmu->legacy)
+	WARN_ON(!gmu->legacy);
+
+	/* Nothing to do if GMU does the power management */
+	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
 		return 0;
 
 	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
@@ -925,10 +928,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		ret = a6xx_gmu_gfx_rail_on(gmu);
 		if (ret)
 			return ret;
-	}
 
-	/* Enable SPTP_PC if the CPU is responsible for it */
-	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
 		ret = a6xx_sptprac_enable(gmu);
 		if (ret)
 			return ret;

-- 
2.50.1

