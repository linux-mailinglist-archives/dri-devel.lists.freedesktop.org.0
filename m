Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F38AF9DBB
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6714D10E146;
	Sat,  5 Jul 2025 02:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEvRdK7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D65510E146
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652CIvt029399
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=gjy4TsFninVe5bPVihlWoJ
 GRkiWlNHpU3ZfSz9r0mGI=; b=KEvRdK7vKZsc64O1isantDYYOvYOQKNHrxauG6
 ConzIya7qW1oBjk7wAHtrNccPxFztnk4H9CaGfHaMZHSK3becWugA/dpW40gGkWl
 JKWmmqnOi2OnDE8vm/UiV8JH2S6Z9EcvK95gSuWGsQdWqXMYaXUh8iUBpbLCJ6+X
 QDd3rx9ItRWDcsZJfMaHE7wCaMGPDBKZ/vGQpZcBRL3ASLNqFcJnvEf5CxM0GIt9
 Vfvlm6iEUdlqxV1hMV1dgne54Ydnw/T3CpLGokTs76qg0AM3Po8/Cen/bPMCDY1f
 8CPjQ88IxILEqRttzb+WUD07LmTTxxpq91LDksLPVtCSh40A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag126-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4a6fb9bbbc9so38717501cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683648; x=1752288448;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gjy4TsFninVe5bPVihlWoJGRkiWlNHpU3ZfSz9r0mGI=;
 b=aV8Mh+m7PvxK8ctg/Y88Y3SJQNETHUUQUXJ/Fr0RuWGUUOTn/ohqYakmMO4awvyWJ9
 KlGG6Qidq7wV4fGZh/Nr3WetfO0Vl7mJGnqUlMMwX3BOM5qqXt/pRd9QXQDstkF+h6fI
 qaI/jO5UXj5B42GzMPTo7JZ/xJ5eWw8waLSuyNs72eTzMX/CmnfGAfguxrUbgn4NFxvH
 nEw6jcaFzstBFh4k1uu/gNd02KKWu1z2j5ZvHRYi+YFKvFSpuR+knWMWD7w/4ixzamOg
 Dg+Uw7rDm6n26OVdChogO+7lhau7SJ8p1nO8Zb6Ba3tcUwgMe480v+X3+Kw/vuLvmbah
 QBOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD+Z3iiM7cGGgaeNcJv3HZ405JdoqX4g5WSymGWezKewViNBZFIsX/AzLrH8QGboZD+MBMldav3Rw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf2h5qrf+P6GyENYJlXjDNBxQWBIbbWKQ84OJCbpMNfzo3ZoZL
 tEdJ5mbNRsUnG2tS6I/jzsVpcY2QFbCLj8reUENbwjo+b9f9TJgT3OW8plXIYIVwwg8bQBDD+Zy
 qixGi0GsqtdHg6wLsxxK3xJtdsS2N8Tr63SkRbBvxRsTjSOOeFCmDtoBVYT9ePBO0Y3lFvZLqNC
 6+g62Pfw==
X-Gm-Gg: ASbGncu5DAQ5hGKzcI7yVnVA7Va9H25EZa5xeUVmZZCbWLXSEKcUm8CwpWfGB4GTNy0
 EhCf3Yuo4E1UuRUFSbvmioA9lPzZRCzqb7DL3NHzRDZ9anyRpwqzfD3qAPaOf0zHyHKWVpnnouV
 5VgNO8zGa8Tf3GXN8ixFTorCTYDhiM43U7pe8/lHnfaSOL2IvgNGozrG9HR6ho5nekdYJihtUzI
 eCmfvBxXfJBOdPsKrWGiP9OjmOHTkDfeC/ESw0caxSOQA2Djtu6Ro7ikaE1dBO1wwafkFryDbkj
 mksacBZ+N+YOW2Tl7iDdqegFWcOEGbUB8oMVROwbZKX485VwKVlIwvJDipC9ScpBdPqgIAhrzbq
 gFKCFQqMcwzMuBgrP35KFxls1weFA+GI6V+Y=
X-Received: by 2002:a05:620a:2485:b0:7d3:9218:6d1b with SMTP id
 af79cd13be357-7d5effa5066mr170819285a.25.1751683648229; 
 Fri, 04 Jul 2025 19:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMjGKSOCRv6Aeyw2vw6oMPWzpEEhkYFVFUNj5HTXRFl2we4vDYiTxbSAstbuCsTQWU2PJ0sA==
X-Received: by 2002:a05:620a:2485:b0:7d3:9218:6d1b with SMTP id
 af79cd13be357-7d5effa5066mr170817285a.25.1751683647785; 
 Fri, 04 Jul 2025 19:47:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/12] drm/msm/dpu: rework format handling code
Date: Sat, 05 Jul 2025 05:47:21 +0300
Message-Id: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmSaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNT3ZSCUt20/KLcxJJiXYMU08RUkxTDRMMkSyWgjoKi1LTMCrBp0bG
 1tQC+/D1DXQAAAA==
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=a02lPmZKv/naTYZA9OmQPxvGdxGzUfJ3jTjVREOZLAI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI82lipzpyCC4LKN7ThdLaL0Fuf/bVrrEFXL
 N5kmFgLvi6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1avgB/9tgZuAoAH5++lDQAjlCepbdpElh8X9Ms6JNzVhuMPPabCS0iVhoseTNfDSNRIsDHuNqlr
 r0LPD/AvQDvHxoW1x364Z/uayPIkC0wFq0jw0BCdzhMadMGEukEVv2hmgG5GWBZAFN40egpPmGV
 MUP3TOrXlRv4CFBcCBnob3qm+c/EWMGb7pDlFOyGyNi6vVqZx9CfgSVCu6sZSkC7VdUe4a3lr9Y
 mnI/ugKxuBeamrAb/WW/Jsdvl5d7AcXSqObpe7RmcDUap+F/5NukqJNcagojo32b0RyBPcBiTa/
 FlnUHvKFxm+YbJvh66rI/3t2d6WXnpP5NTq0SJ8d6oWAio+m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXy2dvGMaS80zJ
 r2ehH1WtOTyMnLKig2JkGwV0VPhHedY3OBRLS4qaniGeZYVb0kLS8/uer1itUGMKAIh/g6cVPeq
 CzPC3nRofrZUJMrFdLtTB1v43gHZgFr0ndI1uZknR/l6daWlaekYTk9qJKY3B5ZlXERTMifu+x/
 GawFmVUc/pThV+UTisnd9h3w03K6lfCgR4V0qb3wTy6D3bXtotR7Exaa6eZNndaufiAM5ncWepf
 dxylKvKeTsJVHj+6BGXnXsI7AY2D429j9aYtfebK7yE0tk6AuaSOpRwZVficLyB0WNhrOVLbObx
 zvbUQ8XjeHpzF8focLCkCy8sZHCl4trFyReowVMA1k7dFCWeypAOE2Mzhbxdi0i6pU6En1C3ZaJ
 R2vGf2yM2Unv5GCeJC/MPuD/haknImcntjcfzY+2zCs2rfLn27VMYIgB6DUkpEcnxCiP4Xy2
X-Proofpoint-ORIG-GUID: HOpiyHqctRMaa35gcEbyMFDOZMd_XPtt
X-Proofpoint-GUID: HOpiyHqctRMaa35gcEbyMFDOZMd_XPtt
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68689241 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ilABv6Z8GYNuw7svrMYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017
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

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  178 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
 3 files changed, 394 insertions(+), 1553 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry

