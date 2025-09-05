Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514EEB44AC6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150DC10EB00;
	Fri,  5 Sep 2025 00:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsvKhhdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1110E352
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584J41Da004654
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 StUJ+iCclmQ41HjQV5lQ20sHIRMRDK/w0JA6wzKy7T8=; b=EsvKhhdRefG6BvSE
 VcdRNNHHDo1rurwOaTlz5MI6kRnAH4hto3HRHbxTAbf0adpztnciBAucp8a2F/P8
 EWiGKYy3wKKBQXgE+E7ed1b+HfUSwMDlMrXkTk2rn/DFNa3WdFSgqpIharQ3kx8A
 VmmIt/YORqQOFwy1KPUUiXK8ujk5Ran7FG5NmfAdatXKSD1ETqQmG2l+636k4gXj
 BllAAhhEYWgDlO9m3PBBNTeAkfxEB3EKKb0du47O8UfOzGGwa91pB2rZAMZxJzpP
 X7FIFmc901GSpM79F9U2hEZza4RYAuuASY2EVI84ZUI/ebZ4/UAX2Xvm/gdZKifL
 bnh4nA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s9bqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7f2942a1aa1so573388085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032723; x=1757637523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StUJ+iCclmQ41HjQV5lQ20sHIRMRDK/w0JA6wzKy7T8=;
 b=wykkDJj14aADn6ybLLs5jmIEDrvC1kwwN668LwxlV00rOtILFqSX4sLoVb2ocBC0ft
 6GBaOcAFtrQ/tnsHckp54OseHsj8PYp2RFNyBT8fJTkLnr8+zBczXoZD5gXhYe4Ub/as
 8aK4aQNg814+1J/be81d/nyZW1zw4Ul6TZZvNVfkz5VVDZS67ZcKfrDd7JvjhHmFZEud
 SKMHmzGZm3GPYfbzMpbj9Zv5euYyXiiwDLqZGJ0jlSbqB6aBpsQW7//SAcCBEQjAq2ea
 dyvIsjPW+Tb5bmyiaKeD+HeoGAKUIt9JK3+2E9a1BBwyR5KpmfeL1fRaGY4LKw0F0roH
 zPbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5jG0gcy5VBh0O5/Xd+6SQ1cLaDNJB9nNHznUhyhzVNnAAPCTSyaxy81AnECvGE3WfNv2kKrf0IZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOxIieWKGxnGeAp9kJN493pss/i4HR4p6tY4fUFzx9TDBoFsCV
 wox9sL81FX4sjNLAI7RHq6aefuFAGvwGZspfQYffVf8D4LhtlXeIr4Ce3knP6HHmD8b7KzsNS5q
 tK18hkLKvUVvyfW2vr2noM4vArOTu88L0bMjpUHSTPLK8siPNX5Fgm9kM3UVmJW9sAsVjyKc=
X-Gm-Gg: ASbGncvLiZtxef21Aj7pO4Kub9W7NW3EtCOmG8ax8y0pvSC8k3TOIArsI71mFpjwfe9
 zhHky0O9E5Sx/IFw6e11AyOv4Z+GfXiILFst4y/aUc73UPYxVt/Ons9HWrCuOGjtw9yTdMBnip8
 85MzpkBVvp3lKOWf87gFSqn2C1NoYnNFjAHEiS/N1qFxtBXQGPBBzZ9U+Nin8fNHj48p/0nOP/Q
 vtRLDNsKu3stUZZ9TqMhvnitG8WELFs/piB5J1AloL4UnHiB+0nQTeRqNNLALJGKk+cKbACUyUB
 yomHt6/54ZKdVMUBCzzxrnJpXGKB8iV8HgDkQDRt8gWK4fqe2L7onT1qhcNH1TPcJ6qh1wDxQhA
 C8wAXLcpp2+sNSA1AjZ0O1yjO3LfSYKTKNaB/gamdgN7lZdhtFopT
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id
 6a1803df08f44-72bc5842ebcmr27109346d6.31.1757032723169; 
 Thu, 04 Sep 2025 17:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6x/823MfOPPReu6md6Lo6garBg/o9gfwd3G1nNGaUC//kgW1+Kkl8wp8jUJc0HWSYSKQcog==
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id
 6a1803df08f44-72bc5842ebcmr27108936d6.31.1757032722658; 
 Thu, 04 Sep 2025 17:38:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:31 +0300
Subject: [PATCH v2 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-2-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=o39sacG97yC+L8l69fpJCUgj4xq9EtSHTWrOyUyGs+Y=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YuQ86D6f/u6GrN+nWmnXu5+GF+np/mLm/+Ff8IFGU/t
 FL37reUTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMpHUF+z/ze0uNinQ7I4qn
 LufqN2dVaSnzi8jVyFiqrKz0h7Fc8Mz31eq90z5H9dSonV6k8cHojt2SvH1MJ/zYI1ROz2mM3yD
 NvdJls0Km34KGuZyZQjVVkofD1A+yCmsLvchKUboktfjQ35ieIo8MRcOpT2couc959tt/8lfuPr
 7TFzXPz7z9Yv2tN4KhwQqX5+roK87Kf104dcrCZ5Y1wd+f3qzxY/UyjGT74TjN2zQ2Z0HEkwuc4
 sbBiUabEqcETO29sEzpygwT/wqp+sz/pp+t9s/prud5wzbr8r+0xUGrRAPn5dqWl5VstL8jV1X/
 KqI57VCoU5KXZNHD6BB1du0/z+K+lMrV5m+ati1V28gLAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX7OXzpYyxcEgc
 kgPDRjYmz0vt77L65aa/urLPEBGKiIk/TRQmCHoqB1rJoB4x+JQvBV/cwk2M/I8TuGJzLyvqrlv
 +HyjZhpOjlKtDvJ/wsEgVCRg6pycQ+kMCQ3mjiLqxiiqdCkKC/Urojg+CWCyGm323cAaJuR1d4E
 8xe+dSZaM9HTrf4vnpjBb4nq2cQo48imJbeBSZb0p/1wzCtjbpJQNtrxOesTcBpIOvrdbROMhXP
 Au1FXqbVGc1v2yff6uQQhqndNi0J1HBlrbtctfIHyOg6d32ru3nwEstRV7vSkhZUtdqgDwCrYih
 YnnGSkBmlmutxp8z0Ey+mRXJiOM4Mun2gz0bhc9sMDnVaFCcdZrE+d6lFqQZS+u1hbKvifIxzlQ
 zwBSySA7
X-Proofpoint-GUID: N-lJHM0V-E1F5HeRnp_djCzLUcKH8ztK
X-Proofpoint-ORIG-GUID: N-lJHM0V-E1F5HeRnp_djCzLUcKH8ztK
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68ba3114 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uYEdUiPHXpurYBtsK8sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
Specify num_planes and fetch_mode directly in the macro and remove
unused parameters.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_NV12	8
 
 #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg, fm, np)                                                          \
+bp, flg)                                                                  \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGB888,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(BGR888,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, BPC5, BPC6, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.47.2

