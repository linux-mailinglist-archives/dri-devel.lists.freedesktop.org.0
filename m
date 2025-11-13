Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A3C5A954
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB5110E974;
	Thu, 13 Nov 2025 23:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcmpx793";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EO7nrXj8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE0110E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMagEo1478296
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=; b=dcmpx79369qnBr4c
 +yDP0pXqwJYJZ3z8L+GDq616nmiqW8Qg2ScL+qoEIf2jnxoIUYZJZaHtOvT/9F72
 12mzK9VsMrKe3e78AZ/opjEFYnwWS5brVEoy67HQwAoRcjk+fU1Ksg+nn2eD2IZR
 kwoKBY6zD3f3Qs7Zu9mEr1t2nlmVtnKiWxl6VjogbG62ykWpOl6CZzK7nOeb1vzo
 j+7COuUwy1YBGWT2lJGc7yNvu3M2yXzFzszpOo3NLQtL2maeheQhr8JAMgJOSfGZ
 xxtW7dwzoOgmeg0DXAkuGFdAvdprY0WOLiKs+Gy8mhs8wMzWS4LimAD/fyD+ivit
 xbHaLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dr45q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340ad9349b3so3287514a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076669; x=1763681469;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=;
 b=EO7nrXj8rlyVQ9EZshZUiBsTHacnshds1S6S20UyHe9Pzn6IH+jUFVBwMc4sXeKvCY
 icYdgKMjlDFLR7C1o822kqYo+DSirbz5/ccIP0/y/nhIkwzmzBTJYiuCpjWFQC9ZXM/G
 QfurJypetVP1B7zExY7DXaKYe4gI8qiBGEhTDTVBaKX1eGGwl4HSGbQzTiUGLn2WfGxw
 kHCUn+wCftKLsLqDDiqVi2HgdpbUvTq2ZyJlA6c1JYPzsi9PRvdzsAJFPPOqD05nu1as
 tkdgalynWeagFWvMh2C911cpG+Ao5SdmZeZW5w7xvMcAYBpsbdO5j9Fapq1f/LvS0Cc8
 BMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076669; x=1763681469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=;
 b=wGl8e7rjlvXDOnzoLUgqQFGHW0rep2uY76+dzGT1Oaw2+qlQBFsC1z8P7UzGYbzWRY
 /ZixAq4Un/I38Bf24i3uMGoDIUtVmj1/lX4NR+yPB7K6eI+gi2vf1je0ES8BgFmoeQ2k
 B2IxhfL8C+MMzpC+u80OnmgiKQ5ds0Cxv4tMO5Jz4RMwVUZEerWeG4/NYhDIWlAZu9BA
 gQ6H+euTFqhGp8PYtwlRNfVFNM3lYCE7fzEVr6d+ydZVcv3tfPDTTEcK/1qj61CG8Cxx
 ILFZC4EazIdCYKU5FZSbvkMqGb7RixJ6Ic6O3gpePcyu28jXKCRRPW16g0R7LOJARY/A
 kLhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTHQlldLtJPz6391iB5EJ5J4oU3cMjL/SHoFypavA/aE2wXhlGKNip/ZmxMyliAqeLYVMLpyxNMaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwswjeDvXmteW7C44jTlMHaD1+BEPaFuXUYL+OA09uVCpD0kL7
 Ank7cXNZDAAAPZ1cUDVyOoy3MWKyx9WFA9Lkkovh2OoQ8zry1mGDvAEDTJX85cxyg1LZPsg5VZu
 yTH81XG+H2K86vJKtmyYbjzWXF00i1GFnKDqZlD8q2bqboFi1g8AwqVxvL4nXKIo+IPKR6LE=
X-Gm-Gg: ASbGncsSlYFostlZramMCpY1UhVF1JS8MdQxOBX63mLbkr4gNYMOzMhXJpuYpzPC72V
 gcljN/Wzw3b/ZQBm+NRtcSZMDtedbfH+f836Ed+6ZBuifFmHueKeWLV6HkbvPXJWTD0kjQj222R
 I1B3p5OId6N6Xa0vBjFRqnO0O+0lJk4m1I7d3XAon577XrJnUnNeIFXSp5Rltta9CBa1OlGOvg0
 ocrzbvVh6nG9s+++FZz9B7xNTxxjr2gsrwSvCCEE3fz8tPEfwdE+IfPrs+6eEFN9MKmmOZpCOAH
 2uQoch95C9AM597r+hEp9HwPhDZe8fxop5fxYZA52zKMc4QLN2ppZ0m5Fk8r7lFz92iCZ8wg65N
 W/lealyh/XLl29uaRolR0oQE=
X-Received: by 2002:a05:6a20:3d1a:b0:342:2a1b:86fa with SMTP id
 adf61e73a8af0-35ba1b90665mr1474118637.45.1763076669163; 
 Thu, 13 Nov 2025 15:31:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELj1AccU1iAtNlF/d1rwvp3D0O0GtJ2fmP978ebIYh6+n2bRYHdSZZAqBoSZaQIswf+5R01A==
X-Received: by 2002:a05:6a20:3d1a:b0:342:2a1b:86fa with SMTP id
 adf61e73a8af0-35ba1b90665mr1474054637.45.1763076668465; 
 Thu, 13 Nov 2025 15:31:08 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:31:08 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:08 +0530
Subject: [PATCH v3 11/20] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6xiTxu+QK2g5DX1T1txHhYRR5FauCvoidVNtsUXBMYQ=;
 b=IttmFcbenAkdyewwx77FnOo0XWIhoBfw7cDraxU2XeqU/3OiNFFUAG7R+9K8RedUjOJawDXlp
 Jb4HDun0pjmA42rV3ROB75c/jOtuhSsvRqvyUfDYw/rz2cgt1d0uQGa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69166a3e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hSVtljP3Zedx29eg7RRtYUSB9pDynUFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX+VjVlSa5vSyh
 2KBZx4RYR2wFNAshTFdnRK+NrE7LCBiO1zuy9tAJTHPbovzKnWqC5DPNV/r/8uJkg+tHbYWiQ88
 Y0i37v5k6QvlnC4LsNYzPiXNuiHvnrzCiLRkDczZJkY/Lg9MYcStKcbafQOGqVGIoRt2Kze5AjK
 u/puegGN2J+5QEAgvcbZ39UTD9uNb3WqQa/hqPmmIn28iU7zGPNxopuPSftWEt8lJNiEN3DkYPt
 HBKIJOTABFRxoxzShHNfWVCIdRGH13sVdLeK3z1MIH3EFIfFYccvijiUhQ+O7jJxHaCAGSNFTXn
 NwkePvrTRXctH8iDypKjS9jajtoKJlwF0sRiu2XWVoA0ehTWOV5BuOazXyk+53tO8LzqkBsnFMN
 56LpkJoybKjk1RwEl/2m914+3IHcEg==
X-Proofpoint-GUID: hSVtljP3Zedx29eg7RRtYUSB9pDynUFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 53461be14dc3..f32e1aba146b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1518,13 +1518,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1535,13 +1536,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1609,15 +1604,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0

