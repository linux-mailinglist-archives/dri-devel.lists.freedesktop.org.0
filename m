Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB32C5A920
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F302210E96D;
	Thu, 13 Nov 2025 23:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfMAHJwY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDQC4OdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547710E96E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMavN51745467
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=; b=BfMAHJwY5fxflr8P
 IXw0KyTixDRZMxONIjC8C5SVj9SF0YbfculQH5Q4xUy5qHHqli1kA7y5jhD20O/c
 pUG5GfnGViNRoG4LxV/HVdrwP8NKJvlgoN9gT6S0ZmHxCETGdfmjQquvxqaeWJm6
 us0rc7eUJM7sSh+2yEuhjeu+nOYohKRDFDS5kttL58rDPgbqdgEo5lJk/HUCCqvR
 iMBfrQWPMspWTEx+O//AyKxez+HIvs6zB1eHQsAs3vzGZ6KeXVIHNv+aB1NZRqY1
 0BdPBPDkMx/HsPhy93CyflRAd4f2rNqtLfjHQDqNY2Sd5WH/l7N14hm5rau/zu7A
 jSkYbQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eg40v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7ae3e3e0d06so1146016b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076638; x=1763681438;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=;
 b=PDQC4OdF44VGsgbO+UWEnkFbwan4Z6biG8/XmKovXbhyDxZlxnVpqN9r53Y4SpIVSE
 rIjoiGRnfPaTlm8YmfhwwI/bOinNVFNY/FpV8bF/CuHVv3Bn61Iw6fnEdp3am25Zgkgi
 HR/cIChCc4p5xpH6AbEkUdjMK861+UFu0eVsjMKegZtKbVRbhjzW6wAEhZu/KS8oplbT
 6V+popk3vfzLo10036j4wDzHK8OBL3NVG8G3+Gm+q9a83IK1FFNLzZU/DeBK3QdenIdV
 4tBveC2itvi3q1RC99NenXGWgQSmPvDcti8zLAffQvPGTSfm7dlCp1ThgPb3L8txCRix
 dfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076638; x=1763681438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=;
 b=lvqFU6I7NgmtW7l3Q8YimDtBkxP63+VHVUuBACkxhaI7JghSVAAsdz0qlOTl8lKYKz
 lTVOKDP+qVwNXIdFLHEPi0IOFyoISvxMIDz/vdX0rNXSO4cpmP3kO5jUBTqPhCj8oRM8
 p8CSNuSUurpvb9FtdEk2GVDRwpB5jrF+16/x5kh84+a5waWj0oueEmbGojOXj8iSG7kn
 zDYInz8RFlVZfvzHYtYESripq+RnSTcvuspGs7jmTtzXzAxXjwVW7iI+HYffXTsAky8/
 Ldyc5ZpAJ8zd79sYF4vy6WtbTBA9uUu86XrwVux3Etl70VvASeLE6bJ1QgkolgEqxrMn
 WxyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6t8Zv5+tzZOHpljxyj8Ua297L+azCHxGVnkvYFV+9cMVgS7fIYJpOLRVTiAcmJVrM/YVTBx9BwAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4bmEB8FbPtnFNTUw3EOm4pLSnDHOOfL6ViRi2RDaQNjvyvtzF
 XpFoGCFsj5kTcqejdUJXYJoDNTDRlFRFjInSMX+HrjHws/bnndlPmlI5prQHbPMhepoFT1+52k+
 PdSv9+vhHLojrflE8bcTEAQ4gOKckHmOjKFQCbuBOwZiPLnA1NIjhQLItkRpygirC65o3TYk=
X-Gm-Gg: ASbGncvKK5Cgp/ivguE4gtLN+kjLaHCldPLU0GzyaCSRBQNPJmkK1tXaCeBs9CvOqnE
 dx8V+wWxD3cb7q8gd2OsKq31RKlajsOYCHVQstOpjqQ1sitElnArIqCOx9/1PsKwrqfytrxVGlA
 uxhTHMbCqeYhatIOsDt3UMAZV6aBP8IQG9KOKI8C/daPbaXsw97Ljd9d/9JIVVlZbJONuKf1JQl
 aC8AQGFVnnyio6ULIeTAYpYwf/YGlD7TDmPZRgmG+hZXCUH3t0mrRJbp3l69exI/8b+rxLtH4oa
 eaSXfXgOZQXbMHrSIFpvZaLTVoNnIq1BiD+/Liv9zKNeZ5fzBXgKzesHsA1QMj0ih+3J2ujQZvc
 5aTZDvJ9kRZOWV3N520FH8e8=
X-Received: by 2002:a05:6a21:6d85:b0:334:95d7:3305 with SMTP id
 adf61e73a8af0-35ba22a4e5cmr1764929637.28.1763076637808; 
 Thu, 13 Nov 2025 15:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEn2fDftnkPr0EHpOpGMZQLIPAqXnlxWXCkdgBWD+7nx4rt/A++vHmEwuulwWe68hN+6xKeg==
X-Received: by 2002:a05:6a21:6d85:b0:334:95d7:3305 with SMTP id
 adf61e73a8af0-35ba22a4e5cmr1764869637.28.1763076637246; 
 Thu, 13 Nov 2025 15:30:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:30:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:04 +0530
Subject: [PATCH v3 07/20] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-7-92300c7ec8ff@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=aLTgU8jaf8pYFojJF1knRYGUYls1un+XUkalxDsrrq0=;
 b=Tk4URntM++zmLSb6MOWmkLrsE9HFNdTk7nCYDUKwhHi9SospA9oJhyJsDSjF4eU3RjzsTrddk
 U5TuaRXL3yADupie5aIE/4U2SHV05LRHE+SWVpJw7MFgF3uJWO4lapH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX/ABhVQ4dubXw
 1tALYaA54saqLOhfwMVrL4PHQan19sNqQH2EKFQ221G6gswLcNqNY6D7JZyg9WID87JIqqYtSx1
 nfGIw7LTXELP8FwXskpcKen9iN1GkR3Jeiz9MW2R1ARFSCAsDj8P9axuhqVQL+/6Va6CPPdzFBz
 CuIZJKRkwdaM8y5xVzKpmb9i9IolAkSA8tHxR1FOeyu6mfQ9rOPxmxPfTIDGxyCdDdp1z5jWbPv
 ABcd1RIW5Sz5awWMgRPnffIBspOKjqr0fYXOSJBQou+v8nWrW4swpy6XvhLAj6wW1SiWkvZoMeb
 RotmALKTbkOB9S18AfvO+WVaKF7vx+mQgXIEptWl/VDXg/MOdeN40HaUFThbvGDQE0ZDblUYHls
 M73EgpIRHfgT9sce/YKyDLY3I+vMuA==
X-Proofpoint-ORIG-GUID: Pi1Ba6QZIchKr9dMXQJYW3qYeMK3dZpW
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69166a1e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Pi1Ba6QZIchKr9dMXQJYW3qYeMK3dZpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
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

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9c6af226b076..685763c12690 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2615,7 +2615,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2660,6 +2660,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2691,6 +2692,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2724,4 +2726,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 19a1a1f699bc..34b09cb127ed 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0

