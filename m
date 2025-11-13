Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A415C5A8EB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8339910E967;
	Thu, 13 Nov 2025 23:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQE1C7LP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPaSckXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAF510E966
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbFa11497489
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=UQE1C7LPJm9301dA
 s/+45xtya6dKHJw4ywyVCmAOJCFCYGSoQ/Tw+B1jQvDUtVdlltohTbrtBobkF25z
 GglE27Z7HJl6jHg2K0tw3THfyt8p8k2uzgtwWCmAZGw5SHhNnY8J91QQTkTTGOBW
 uBPuulh//YChgSmCTokka+eZhRZRQJNTTw08Njw30JbZUc1Y1b9exRrPE0PcQKWd
 BB0CtBOI0BQJyCd4Jnc+OvWkK8UrxSE9W7I/DtJpgbuHvDd2zZFKk+HnaYo8E+0a
 O8LeWLrwYi3t4/S/34PGPxlGx5jGPtgG5c4vbPl6RjBwBCKQ7sYQE9hIK0saT4+D
 ZSUG7g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hr3x1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7ae1d154993so2753317b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076599; x=1763681399;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
 b=cPaSckXMjkIZmhc+OkDHv2ZQ57zBHH7dKzwDAtS4CDdvqSIEvzpDHlicrZaK1/7yXn
 P+1yUAuGEB03rvsST93IWE8GX2H0p+beNGRSKDHE3b3qUlgyVeHDNbd5E0ZUAoGUffrt
 gREzXaRl70FYnqyb+3oxgPFTXI/10WaAT53a2qY24XpG3X44qVkw0VPJgPP0RITf65gs
 9fxyM35aBGmMpHCJ2CTUrVvaN+yuM06ILYlN7gXjSvAPozumlTMeWJ72n/j6mizrRNCy
 9y1WTlR4xRjxlevazXTZz0s3K9zoffZ6ZZON4V4htlcniIZTwt53XdvVAwCfaXom+8/C
 igrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076599; x=1763681399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
 b=EyjAdTSnzcjFZ3L2tqLgsQk0YTBq+alwlHEqcxL2/EggDyv0oTuoEH3v2q3bM5Z/Rf
 efwEW/vz8AHcEh5WcMcCb8q90kiE/kvs/nOZM+g9wYB8VSFwrj216hAbw1o8ruXTLhox
 O8Zb/R+/bXUWgFx63gE3/v/VXdJ04QCq1UL1u9RwWsaOx/LhAZfdAWMpre4lzWvWYUjI
 IGlYRl20vXAawfqDzfwoF2iaw4zfSzLYklg9t+QGiVxpY2T6Mt9ewYd94Zi7LI7AbcDb
 QnlQ3sdkZ82Y/y+PfpZ8Z08+w2qkVqTGLxn7we2tg1XRiMXnVH432683nTyxXaQ+cOf1
 WNYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvIRwen+cE0FMxE2mlyqBPJ/lO5+eTtKCIcQQmBT3dyIhePGhAzqnnhQUV4gdE79Gay/5Bv8/hlGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgj7FmArcxJj4g3ZcCjzNLxnV1vH9x7yOWGuqH5HObdLextSfi
 wmu7mqTWAnlhroaXWOMn2gGVjFEuEg+hMhfgJKlOl7Wkd3w7cIvD7WJBF53ZxdTHjAlU8InaATh
 AhpqnVVZSjXqE3HsytD6absXsxyCmc+hJlBcG87JNekDtUayyIixKzqhbd5oCapu1rXN+hv0=
X-Gm-Gg: ASbGnct2QiZybFXHdZXAExkm+cty1iwW3bwXATD90OFWnU2bDlbuyTgjQfbvydj5bb3
 X3QOi8XWw2gmJrD+H613txbcERrnS648hjLuaIHvdXF0HpVsPnlfAHyMM1bNE4TSlSg50hQbFAC
 9tkbpraPi9m9obHNZ8KYDhePwgyfOiiKQozqdgFvh0IgtXfHx/Tp4dbbcv88eAOvb6q3hiWNqIy
 YHLqBLf74iK0Ly8JyOyRYaRxMBPm4CWAnu8k/fauyEpo8V61CpM3oMN12CkXVxwkdcuiUun1OMA
 A/DYrFlIrdosE08BsLjB/2BTP2DFABGj+0tlRzt4hYxH+AsAkmweAfr0b2Pl/ZVm+yG8yQd2UTf
 ihkpqcUH8sJ1eCoatBLuiyz4=
X-Received: by 2002:a05:6a20:394a:b0:347:1a7c:dea7 with SMTP id
 adf61e73a8af0-35a52789993mr6748080637.31.1763076599058; 
 Thu, 13 Nov 2025 15:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe59CpeNjRSyNw92JEuQdzL8WkgOpZ7xPVnMY1vuZEtJlI/TUBl0nb1yLfJqJlaxIYROr9Fw==
X-Received: by 2002:a05:6a20:394a:b0:347:1a7c:dea7 with SMTP id
 adf61e73a8af0-35a52789993mr6748048637.31.1763076598546; 
 Thu, 13 Nov 2025 15:29:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:29:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:59 +0530
Subject: [PATCH v3 02/20] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1529;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
 b=/XPn6y9/sGaZJkUAy9FCP9e1/me5R2Ws/cxZiiYLXvbvNvzGaU1VsNsVvvUc5TDgOddrJMTKG
 G4t91gdKb/CCVOPapjdmn8NaruZHcRKYOt5SqLB3n0oACbqmHWKpKKW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: QqqXhcVa4m2CWIDU11vHDaA-foYmUyvp
X-Proofpoint-ORIG-GUID: QqqXhcVa4m2CWIDU11vHDaA-foYmUyvp
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=691669f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX9q+MaX2pC3gj
 s8VafREYez9YKSJ/eskqIyRi9tC6yhObDQjM6ygwC8EEHZs2QXakvzHh6VmaazffI+jkoiArKDH
 n1xuOYyHWbKMpXqMeHxnacBU1Ta41Cmf0mNgpMCKkPj7mKRV9/+fgHtQ0oeLVFSwIuDGTdTByl8
 MMB0dt+UDjVt34Cf8gMgEoECq0/qYwJBH8X6mp7yUgMt6gkRLC7DI60FxeLn2rbKZ7izMnEel54
 TpRcHk1KLMwauEvLblZQorG+GSh/EbgbK5iEgOqO87I+4JcAixtiRj6Ov/ajC89UgSpLp1lIK4s
 rbBp89e8Gb2HIb1TOCe7ialfrMrKoJAp775XO0zaB5Mf5ci8BhmildIrZ/wg716ZDFWBgdDTqvh
 TClXkM/HLk/4mw25J37SFpJIVCR/5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
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

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..605bb55de8d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0

