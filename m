Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4F4C5B32C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35E410E122;
	Fri, 14 Nov 2025 03:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0FqKBvM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0ioUHjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7D310E045
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMawH81688702
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sybVXgpP0xgwK0gFVwiFyD1rwurwukp6TOQLmHVXzOc=; b=D0FqKBvMlp6q0wcM
 xFwMxTyxv7m2iTTVVNL9BDnlG2L3+iFb3AdPG4GccUpFWG4Qv1CLXnndnA31mL51
 QLW5+3JAqt2lDGDT+gXQ44FwtXsPfQlz8TE5fmxFLmHY06nm/m5IPLnnZV/GJfWI
 9bJFAeFTfEkEqcRoT0qa0mNDv0RWUA2874Lvawv+eHB6S27EoFm2c7dRkmXffAe6
 vN1wYrGlSW+sjd/0fceAOS8v23IHMwws3LHja2CGnltydQhCGmIF8u7zaVYKKNgS
 1VCCaFD0bOqjBd1BFN87ayVy0OsLQW0iNFe4OTCnmoC0lLp7dcb9XZy6Jc/edzm9
 ti66IQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0ph7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edb84fc9bbso88141311cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091820; x=1763696620;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sybVXgpP0xgwK0gFVwiFyD1rwurwukp6TOQLmHVXzOc=;
 b=F0ioUHjRMMV1tCLlZc1aElXTHjDHTlgRc65cMDB8SkadrBsWnstwBumCECIxGG4Udi
 92SaooRKyo6hLVbV/4LgBkghAI7QDG5xlP+sAJy24Te0DyI7OrlrT6o4d4/L8r3yEV5q
 xJ6HKhKDByfGwJj9Eo+NZHo4EA4HwviTGyBUFFviSn/rHs40nTKCB7Tl/GCj4qgiBBa4
 dhuPR6AgsGULdToyg/C2G9hC7IkW4WuSJ94H4ZruuKvBL+rlF/0DzNsJ6es1h7dZXNkg
 mc8+uWrV/BIgbSyRFqXgxFG6BB1LBg6PHzMLN/tc4bYqpxmwmoDUJUKW/VcLmuGN8pSe
 P5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091820; x=1763696620;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sybVXgpP0xgwK0gFVwiFyD1rwurwukp6TOQLmHVXzOc=;
 b=MluoAuyeIcoeRhtnyFym2jhdzHKHs6fSDzx4pNDI+mal0mO2PWNny2Tl+/5sTnXlw1
 VBJVglrdRfsL/+CTzWwDndu1r00yxVs1XX0tCKqyiqmmUJrn6uVVv2rbLMUQJeieo3Eh
 5CEJy8YIFNC7Z0L6MtM1ZLsWhQmtoBEXs6vFTM4XnuIZRuXon4H2WahNkM2uxeTunpla
 EUeZNi96DEXzjgtDmwCay5zIm8Zv/8ErD0tTp9Et0gIwbcNmSKMfrXamqJeMr/lIMADf
 gFg64H+UBmuA5QfoJlnM+spuQHiTFGRrKaF/SFagOHMmX3194KHDbg6fJIqbYf1GCnJd
 lcsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLvQOoOlW/2yjGet/kewd6VCWGlkjXefu+HfLZ6+jGiJSCrO4jA8HeIVdDckTNItdHMmvSmCLN80E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFJHQTGRCIT+I4FnT/+sqefTalsIJDSz1FrYGJf31iUpKdF7p6
 ZNPYzM+gHi/hIG98oc+nwMYD1J03yRHyZcNAqSv8TXrcEM0GCLYEmvONWUOBnAFkB1zoHHKO+Ym
 EMaMFXWbfR/OJqvOeA4IDw7SLTeQKL+mKaRF27R9pHVSsUar13PjAc/PLUWNdPyh2WTf16Mo=
X-Gm-Gg: ASbGncv7u+x0H4hn96er0H+M8dLZ18P1nL/rDoJtVH8ZG8KSQG865PsUGkZ6kceCQQz
 hUYNsXCDHtQfv9b3eSsnUby9f3lGxrXGKkS3bXR43cIQZAu98U/DSHusfCdX/ztaEVoGdo5Y1bc
 JMeHmbRxdIxctAxk2mYtgMYEzZQZzRba4oUuoOvDi4roIDrvbROlQVZYdMNKd15jfblraOTn8W4
 gOAemRHnv2KkPSiWwK8XIqIgQhSiU9mWsmSxwyOkSPpW0bV04jOkZyDolUfA3g1hD0WsTAPouXL
 jkmArTmJ5r7W9woRm53Fq222RyP7tsttH2cI3uPiengK72m44ooSpHp8O7vTLl5Mr6jYH3Z+5/v
 LhRd6qPG1RdW9lJ7UGoQfiIYwjpNMBCw/8uy5Us+NvhNl5UiIkL+L9x7g9deCNi371LLg90agUm
 r3DB4y3srcCT8q
X-Received: by 2002:a05:622a:1a0e:b0:4ed:9a2b:a906 with SMTP id
 d75a77b69052e-4ede6fa96bdmr67943511cf.5.1763091820023; 
 Thu, 13 Nov 2025 19:43:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwF718hmTMotBQ0AAu6G10L2telBfH4RNG+l+ASha+DbrSIb8DzyqDzAQHoCEuZwXoRWZlPg==
X-Received: by 2002:a05:622a:1a0e:b0:4ed:9a2b:a906 with SMTP id
 d75a77b69052e-4ede6fa96bdmr67943321cf.5.1763091819450; 
 Thu, 13 Nov 2025 19:43:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:28 +0200
Subject: [PATCH v3 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-1-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kg6ZgzT0hlwWlWupJv9iz+ZS8koIsZ11L+KUs3ZMWyk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVkm1hatXLE3E1Z6sn9t7C1RLJuKNM5z0fBO
 SSwOmzGLEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZAAKCRCLPIo+Aiko
 1aH7B/9HMrkK3oPMs1TRbKq0LG8kaNHUS/SGqVhZ0qTQwUFwh0/DSW3SDDrhamIONkuERpJHQsM
 iQZs76Ao0FVDkDY4yTRV3AKESnW2CFPqZH2gp1GhbkR/KOUS99SLI++Y5VRA5coa6E67SFP0zE1
 94Akz+QMs4+8zptF4iOYePvrMzLqxrqS5uWCZF/rplucL2mldcfGd1WMXs8LBf96dyyaz2QIW5r
 MiAA/Dg9jMQNe4TKUWonszVp3YLINZwXj0LPwNPWUcPm80EYkEfCOIL5Tmsze2EMifUBN7s875g
 HXl2P4rKkORTBfnE2G/SyOpddp7REMXcsYvPSTpF26eEqZ6I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: hO0gr-TWSo3JQf0IvSaVN3hmmoZy0XfJ
X-Proofpoint-ORIG-GUID: hO0gr-TWSo3JQf0IvSaVN3hmmoZy0XfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX/MCrEBVMHY3w
 kSAW1p0zj7qnFLrX7kLAZN9IvkMfvJoXrGZMkLFJn8J91UV1VipkzEsDMd7ernvPAQxdzby2nyR
 8dw44tTsJGXNlY33kGAR2LG040I1YQbzxQBmyoLCfrA9WFB42kxhPbAbHahPFRsEU2xW2OrEhxp
 tv9a8wv/R/AkXiIPs4tu9JkEn8R5NZ0b8Y4npxCGPdjFxJPxuz8ZfIUrClqT+VQM0vux7CQ5C1v
 ttNs32bGY1fylFP2xyj99Dh4ho8dJIap9Zd0Wctq5duscRV3ipZ4P6MnC+C5+C4MNdFtq25yKww
 tpHwQkaNLcEOHzCHbQkykoP6JwSgUYNCDFwfTnnTWqonNphvt6sg1/EWp9BfdNbajFTB0RFtdg0
 MVwy36YMdCiVsWUoi2WCtBTPNzbWeA==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a56c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

Interleaved YUV formats use only one plane for all pixel data. Specify
num_planes = 1 for those formats. This was left unnoticed since
_dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	/* 3 plane YUV */
 	PLANAR_YUV_FMT(YUV420,

-- 
2.47.3

