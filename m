Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B1D10771
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A6410E136;
	Mon, 12 Jan 2026 03:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwg672vS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHSBt1Mf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97310E136
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BKs4hm3734270
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=; b=lwg672vSfuiYiMRu
 gr2kq5uFAF5RopeOXYItZdoSz4shghVmetHZll12uPQsZj5AhT9wBMDq6J80vSaK
 2Xtztv2OoqurgKHlQmi/tU71IkGg6DWwjG6Jloj8tAtHOO4WbTA39gK6m4PMwcgY
 30e0aFi8TSyuI6liEZ5m0pvOFX0pMU3HXogbb+fEeGTUYqLLaB2iJ1MWaqrgsADx
 3AoKZImh2hSsVU6FWXclsG7tLgMQRx0utCtoehnA61vMeQdnXxRQ/UqwOShlVuvM
 CPeK1nyg/BSZO0p0lKol3XS0I1XhQdpHBelpqD33FNBcoQ0Ictcdw5IWZSAmzu3V
 UUYZ5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeuskben-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b17194d321so887171285a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768188220; x=1768793020;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=;
 b=CHSBt1MfdB+fBPqgU+chC3hoCQ2zKnmYrQmWPlpHSajubItfGbCiRluapPY/WW4F10
 eLdeYNd30cAJXkKKkthgvQLLDAOj+riSFwtJFd7Sj9Yxc0aCN58Zd4K0KyGWBGTfP97g
 2FD2rLSdggvaNUKUzCPRGNA/aDwteHbO6ZTk6SXk6liuZHmPq8f8v1yNfYUKCK9KI93/
 l24mbDMwdJDRbVsSiJ1i+SCPu9MRnjXUyIpL9Cx/8kUr0pMmVg6NCJ+g0vDajN6Mti0o
 ZHV0gjNjpQHFMSUAlV1ggyaboxfSBey/wfQ8P2KcTk3nL+bI1xz+oTtxWgxAwpCXyBPA
 KMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188220; x=1768793020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=;
 b=Ur+KQdd+o6faVV/Y4NOUOcm9/rwGUYd7X2ohxjtYH4pz5dqzhZMCJJeibpNs/gh35S
 5esuCAYtt6EC3kfh5S6Eui1Si3H8ionFWEFeGjD7et6vwzxz6O4SCNoGoZX9PGQ6erl9
 XYowX01Mahq+OuIUwGvABiCkSxOOQuFaaOJNnMqsWYOHpebdBr/AwWdudETMEbtADE7H
 PCUCf3ZMn5PeyE8j/wOXfyHc0FxgrQOszmzBVVnUCL+ubRjgE4c+mNzi+5zsu3xuPbND
 Jeb96xEiPFGsq9tIQMYqtA6iDIOcuWWnzzT3cXb/dfXtHDhxSnsg17yriM97NtJAipsh
 o4/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1EB/O12ASJZtHTIGoozX3F/xStsNqiLds9vnxaRKdOcOWiGBu4pBYsHkVFFMGOfrmdTL5iwFCwhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym9EO2T2E7QfzLzmOkE53SC3jH/Edrc1dVZmwi86ul4bwjehHT
 H6NbMWUlaJOE1/eH/E64OfEWea4bY6QaCTXBrw2mPwk+DpQO4TcgzrS6+KlWmk15PTunyFY6i7z
 yYT8Y6F1Haj6Hyqrv3X3VI0v+KugyLHgOJk2ufkq9JboYVHC1mamwCGqTL/yrEOGN9cPVwng=
X-Gm-Gg: AY/fxX6wzdYVpEN5vHhDU3J84lS0DRWVF/j6J4lPOwJ2vMTQJFVsk1Fn1i+jFz0ZaaT
 toO1tUt1dK4fYM4mMtSetAXKt1UabUn2vHqyWvfcelvpQPPFuOMD6aed94o2mDa0zliQJuY9i2Q
 8I+cEWSxTQ2SCgoT+NtND0zTUOAey8VGcezPythaMJnUSWvML22aLx6UrGUidUbQncKuow8wJhK
 6mTRzvwgXKHn7K/G908VmhA5ktRusdoaUXfsb1wgVo6sFDSgp2QVCab3/vYLs91h5bDU5PKFwz0
 kEYuEyzTVaXLxbGp/oXhs4KqLR/oaMN++vSpW14ebjgPiQx4GS1ni7pHAq/AyV34ImVum+F72tN
 +5an1KpsfqJysGmxeYEVYiEDnxfiJq+ZOcC23sVfelZ9Gufdjbk/Z6U+tyiKBoDRspwtoTjbp9L
 7V1oVJ8dfmtHxN1sXRvYc+Oxk=
X-Received: by 2002:a05:620a:2589:b0:8b5:9f70:d4e0 with SMTP id
 af79cd13be357-8c38940c03bmr2295578685a.88.1768188219712; 
 Sun, 11 Jan 2026 19:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhRYqINNGiilfJktGY1a3QidR9dZtC/TGNBRD3m0CpeK0zV5Tl0mD40AXvWvDl2toWpsPckw==
X-Received: by 2002:a05:620a:2589:b0:8b5:9f70:d4e0 with SMTP id
 af79cd13be357-8c38940c03bmr2295577285a.88.1768188219218; 
 Sun, 11 Jan 2026 19:23:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:23:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:23:30 +0200
Subject: [PATCH v2 1/2] drm/msm/dpu: simplify bg_alpha selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-rework-alpha-v2-1-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QdHxLyA4MAw7riR6PM0xKlPVvxw0TXT2b0nWTc5++jY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGkzRM0sbLWl/Sv3hK/B492DWbzsS2z/RVzMV
 Pt3sacXROCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRpMwAKCRCLPIo+Aiko
 1VqbCACqZm08A4ACCAUYVTnkoETDGW8vofWybnMFbT+1GE0TZiAs9TkKY1QOmm/hepBjr1PoAI3
 UlRiO1onsgw1QiP2IpZ53+A3Dw5JJB3giv6YQP0BtvqqgfUx01cNJuoGETeLm3BTpN/Xqj6+WGx
 bY4UMQb60xX5r+YB9x+CzeX+hhQmhSdA+okoGJKZiu5vLBkJ8dHQ6OHLPeycOyYrKHhIq/jtcXM
 hQCXEEqGGhjdBTh5bor2BfnliWZUlM/VlnfEXW5RqsvG8squDUJMplD2rp0FwHU5m31iCm2yGIv
 pR+KtN86n2MfAg1lXacJGKqff2JiynRnBdITNp9QypuuIn/R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EgueDgHLGcxXX_Xo2GH0ZXB7gMbCZB1I
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6964693c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EgueDgHLGcxXX_Xo2GH0ZXB7gMbCZB1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfXyYBW6M1geOH1
 cmoVyLQEY0XhigF6gMlKW7kiAH92yTUkjO9rVxioT3S3nGoI7mZqQLBfUQxpCWHEwORxUaGs0bW
 e5Kj1rsX24i0PrnNa/LhcXOTBAT86RwUFmwNYKtkcOcEjDA4NwjZn7z4Xj2Xnc67PjO5fQicJId
 8CultlL4RBSe6HILPToUCM0ocaXfwf8xWKUws89K+iGOQhSKXTOY8hzBmN4O/VvC+bwH6rY0KwL
 rJLrEYrDkHNsp+XnEgu8USdgLprRvFMqC1VJttsyFYm0FfvKnYJ2wvLzY/sUykPumEs+sZLE3KB
 IEv4EYAjHytnOpdZHxPg9SLkNz2fJLpmrdkc7ImFrtp/0Zo2o+mxZxPDCRjH+EY/sPSBkS8bdjY
 0f+vv/lSIHEJQwgZw/5z8v0uCTw8+fkp8m1OMkBXuhvUiwHkJb1lKmcbMy9IUSdY4rNynPMGCCK
 UjR+lfs65HNjgO5wceQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120026
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d06c950e814..f6827ed71f4e 100644
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
2.47.3

