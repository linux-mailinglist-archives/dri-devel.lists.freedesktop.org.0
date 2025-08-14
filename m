Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243DAB25FFE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B071810E299;
	Thu, 14 Aug 2025 09:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxJTJZ2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B285710E223
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E922VA011070
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IwbNIn2nq6yZlb6xLIzEou48MqgT0iaVMEMsW/WzzXw=; b=pxJTJZ2qCq+VpQnQ
 iquiYT8KXL0uf9XG3NeWQQdsOHwTXimb+tuVX/VfqobrD2ZSpbCdxCXULJPUu7Br
 /U9ihwNNEs5rcwtmFxseEBOFDhuY1tahvRE3VHY6fLy62PyzED5pbQY5/hVeKj/k
 Yt6qhw2zs0k3o6BP+LEEc8TqZUOzyKVQRyqmUa3i0ELOsy4fkisOfTlBCbdGl8Mh
 DGkbXh0g/bXxj6rJ2kulr1dEfhtavgrO9Lgmr8E6lKyD7YPH7CvFLB9D1cEUxLlG
 2hAgs6iGxDx73cGAPx/68yiYADVqG8VdbmdmTNBIMyzT7tCIIb74S5THN0ulVUPQ
 LooJQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbj7hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109ad4998so32225961cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755162238; x=1755767038;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwbNIn2nq6yZlb6xLIzEou48MqgT0iaVMEMsW/WzzXw=;
 b=hEwrU6Qq8p9Y/eOiczuAdXjes3Z8+7/bovpW3Lanhtvm4JImkifSuRL/2SZLDUWBDV
 Ngq8LwzyBKTn2kvKfRUM7icl4C7vtXA3ooh85EXAjMSH94cL9zJHmkW7MYBODUKzfLRy
 mf3egIQHicy2VorTpyl1D8d1H0W/AzMV6Li4Owbs2gljq0c+aUWqHvsuuG0HXdo4OaIk
 rzpu6fJX0B9+tffDJISy7wiMh2yoDCPTTAfPW03zDyNGxAk+/FltR3HJPswKFhY5D+F8
 sYD79uRtzr3HiV53GPht+M2EO3FtaVV1ehtCgkdr+eXEX+Xzn9Kn0shAfvTIDZFE1bIT
 bEGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYWZbrE5lZmyKymbBCWAcY4JkuKbp813/jgMC2DpeoQhb5KdNkN8C9EfhMztFyWgV3dN/Rfx0D1Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS/gCHQ3XT4yVHlgQdo8UcN3MCYYxJTB4+hB+sgDedKSYsb8gi
 DlXfLBHkBaKCe0FkeZrGJ549tFjCqg3l5oSu2++7tJobNuksYiLdzpthOKYOjCTLoBW0hsJ8BGq
 NrMZJyxeFSzdaclfm3jbQnjFLVfmgSnjOxMIgNrt1vE0D7k3+5hoYdUZ3YSyZAImEDcOLUqU=
X-Gm-Gg: ASbGncv3nmuAazI2GnIfzSfc29S8W1NAUu6g4pnmDnqUfFGYhmXNr/G94ZYGnzntgPN
 HsnV097qnifJcE9Ktyk0y30Woj/BI88ZwFRenTVu8Znp8G32TC1URFFK6KIuJ/sgf26BbMFSavw
 wxARL2OGXz1PyD6af0twI7miG3B50+igEYCe14VW7VOfl5IJQbmXfRX3963xxN2U4fSxysKwLCw
 uZbs7fLCH9pw8I9Ofe7MCyFxw/CqrZXCVkY1GRr2mHCpblQzSdpV13hIHRqgZtFxOw/Jv2tuSM7
 VEZ/9h/nmUuPY1EKs6Xwi2g1dmgwtQvWUReY9JdQpBeFqcqZLpr9uvzGWleFMazs3Dthy0htR7Q
 TWu6wmYGCYIy3cxE+Rb4agjI7vhO143Y1ewLjdbLJc/Uo7CZAhmmK
X-Received: by 2002:a05:622a:8e:b0:4af:f25d:e2b0 with SMTP id
 d75a77b69052e-4b10a9cc07cmr27540481cf.8.1755162237835; 
 Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ndUZeYqkNWDQoj2EKZFvT82uY0VC8Cv2swBSR7P9JT3fLWisPRgnABIUullFaurpyb7ihg==
X-Received: by 2002:a05:622a:8e:b0:4af:f25d:e2b0 with SMTP id
 d75a77b69052e-4b10a9cc07cmr27540041cf.8.1755162237374; 
 Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333f8cec11asm1720061fa.23.2025.08.14.02.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:03:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 12:03:52 +0300
Subject: [PATCH 1/2] drm/msm/dpu: simplify bg_alpha selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-dpu-rework-alpha-v1-1-b4baa4ffa8fe@oss.qualcomm.com>
References: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
In-Reply-To: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iMJRmARhSb1qXSk4SUYiXVNL3suv0fUyow+jfxnnJDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonaZ5C08EvEWaNICCToRqfci+V/llxHEZsK7d6
 VHKUWQyiSWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2meQAKCRCLPIo+Aiko
 1aECCACyvWUX7kkfk8qmbd/L2OFNGcQOvCZ5c/p3qwoUvB2bm1hsP8Ggmq3+xYl6tpyuNmTjgSx
 xLpBlujHfcCypZG5gRrjLcoCwaiy5ixvxUvUweo/kZ3eHHgIXQUPglVwY4oHBqgCWl4AEf1XT9L
 v/00spXJh6cfVYBhs+txtWUk5P1DIUNcccPAqcn8wskRcEYrzBpfQA6XZe5LAqN7Bhi/HeYhqfA
 /kmU5irHbeOX+C4Sq+nBdwZIxdqCD6ZRKpF42JPYXfN9tOb2wxJySN9FWeg0wHHqd/dRChrtXap
 waRolPzQ5Lxh21Hfzx7eg8hC+iSHSIxAR+xBGBwAMSWrSTjT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689da67f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2sBj1B31IKE0
 AJzCLT1JZH8yQAtyIVsLqrYdi1TeOGZhFfDEZIxUide3W4b5lMid1E0ZMc+LmTKvNqirqLqn65y
 BGmdP3HH+jNVW/LG3mynr9bcA/zalWAb6VBoV/DeOkwInU4rVjCkVQ+kCYltuw6gOzcg5sYbAC+
 FR515Ks9OfckDepsewIXeRqXqDjJh5ltAU/o34J6qmNDoj+1leD//k2DkaUiuL1DLwyyWnpDvjW
 IcOe6JBmVGaDmD2GVmK9pRcBCSN5xewNAfR07uUOJ8PAf/neoLsKce92Ha0mM5egwBYFDBrRGN7
 h/DxnpSo5o9YYNJMY9Th+ghr0SMkK6BJY/gmJb9j4Efi+lpMnxwmqD+p+RWp4Jw9hJVeziEovRi
 38EKDCgF
X-Proofpoint-ORIG-GUID: fH5g6yD992yzWk_-ZzdDkoYRGf48hWxr
X-Proofpoint-GUID: fH5g6yD992yzWk_-ZzdDkoYRGf48hWxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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

In order to be more obvious in fg_alpha / bg_alpha handling during the
blending programming drop the default setting for background alpha value
and set it explicitly in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..651159e8731194d75b52c05158bfd1c9bad8b10c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -335,13 +335,13 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		max_alpha = 0x3ff;
 		fg_alpha = pstate->base.alpha >> 6;
 	}
-	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
+		bg_alpha = max_alpha - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
@@ -350,6 +350,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	} else {
@@ -363,6 +364,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				    DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	}

-- 
2.47.2

