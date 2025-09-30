Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD8BAB8AE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5810E4EE;
	Tue, 30 Sep 2025 05:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRSxTvwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E1E10E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HhIX016964
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lD8r2e2rQXKpcYbDTG1aNeGFcMr3BAGIKMWE4YEmi9c=; b=MRSxTvwHpVBahrjd
 nq/iS3H7dX6EvFuceP3VerW4XrssUFTuNuLTAMSU8ALLtNcSAZO6akToUOPN6Mwd
 1dHLgvS1BMOCtXQy5tTmR0Kx953v4OzIwEa7W6P5PB7BgMk97C1GnNo8JSLvO5Dr
 5UoQm2n/Ek2Rpqevnktzvtq+QAmJc/PGfmWA1P0fqhlIrrv6GL82jhHwYdE4k4xj
 ZAGpDTXSIrfoOCSjdcS8wJa14xLXTNlUcn8hQpdrc3HV8xl9Cd27TqU1rHkZDZCQ
 6zWSIzAkgIu+nS/REsfi6xf2wZSW8xwUD64baKbRvqaYCGZpafag9iW+Vt1dMUf8
 I7dFgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hfj01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-332560b7171so4922430a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211472; x=1759816272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lD8r2e2rQXKpcYbDTG1aNeGFcMr3BAGIKMWE4YEmi9c=;
 b=sJv8ATDLDcnIOsUsTjYoKC+al5krk8/oAtlAGIaMCsvymjffICB7M2GRyn59ci0XPj
 qft10OK/uHNzPJHTZ9blGEdsRHcsDbE0AiW9cedzVueICHRso6/XKzqMKgH73zbmwnl2
 FkWmQUciqhAHc0pjjw6Y3m2g5rKI4JN3Z7HxFj+FyoGjV9PFy4m43iTCBMxz4HExNYrV
 FxlJr04PzZs41Vf229gyUWOZ8clqYaexyfi+lkmkBbbH9KRFF9iBVEM/TSupz+ao2+jd
 HwTZw72MVe2aQMgT5diD3i49I/tzy1wcPKDYlUyB8pZSDhjjcdEK80095pMSCLVslAQT
 1+qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjDHrOGYr7z8UDSdUpt7BmHu+jjkU4fbRVkaMaBAOttYdra4XBf4+v1h9EjeNUfsg0OzJy8dveg3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXJ6yTwpijd1KmRDFqizOchMscqBX9rzKXQqoYZQ5uEHCBXe4w
 MRuAUQhzjsg2+aTKArUN+1eX68SKzPw8XPdPsz/UN8xvh+qvWmBzft5JWa/mr76QW/arQOxBHtW
 5p38bIvZki2Hc47nVjIaWmyJYyAoq1HMGI2RA77XBE6jmknXkmbxRP1+/+dwnWcNaTCEmOB4=
X-Gm-Gg: ASbGncv/GaUzaakvPHfkJiQrJM06ntEJoju9oyNT1lgXXbOo1nQHJJvz14Q8Oc3DUfF
 fcFi3Xpx/tIJGDSDgp178pmSqa1FAyL49IkxNAtM9l2SKKpRRRW/cjprQEbIvdW1nmJyMm6DEvi
 MeFQaEl5/iavrlhMcJUxWOL7fnt0YvfauXeHpwikHh07kggwrkXcZJNEL4EeUVdP7XrNfSvCe1p
 IC9Fcz0Oly8OvSXrXIyRMA/XRAMM1wQoWmlUsRfqaKaBEoPmrjLOWreVEc/gpHOfE6K9WKQUHoN
 wCbOyjGZXP5M793lbBugVvaj5IqAwCHQ1Bn+X/srRvHZzph/w+Jzt0pUvNdVEdJTdJAPUw==
X-Received: by 2002:a17:90b:4a8d:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-3383abe29aemr3429168a91.1.1759211471775; 
 Mon, 29 Sep 2025 22:51:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUcq0Uz1FQZ6IM91g9dyNdKIgX+Q2JDA65eYPBWa8yOPA/i4dhscVh5kJ1tUKn8wh3/fy7nA==
X-Received: by 2002:a17:90b:4a8d:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-3383abe29aemr3429128a91.1.1759211471122; 
 Mon, 29 Sep 2025 22:51:11 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:10 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:16 +0530
Subject: [PATCH 11/17] drm/msm/a8xx: Add support for A8x GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=26656;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=SWO/s+9EjPEsr8V7Z5nnrd8GP9Blev+ofxyWNgt/FQo=;
 b=SU96urx3O64P5phXfejP+zxrh0NjAiyQ1DNMxwY1wpMPru7038rRSW43SHh+kLibI2RmlffwA
 Yc0e3B0a45pCDRoP04fbgVK7pS6wTzSxSYmEAznVIuueSVdUBNBSy5O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX516Brr50Ip0+
 EEIQWA3Iy1Mu+TTQYRBykQJoXpO/JPWDhOgLC2KkUk8gcK7NwhsEXtBIaL/EUmyu0BF/i6FhHvW
 zeBt7hvDsn7pJvEjZXuauuKal+ATPn48Pr9iTANqb4sDGE92Qo2clEdedQ2TIzIv6Mnmwbevgxr
 yOiBgz/WAJyxHEiWU0yFVwPl2lv8plAE4xcAyMR6OoJFQYIoonKXZ+Xou7xeyxF6twHVgHeoZ5r
 +pDJt2J+ldfRTxNj9cP4tVcGzj8QbSiNN1gZePIydU6NNRqW8Io+x8cq61YErxJQ669ZjXVU55s
 OSy4jMHmOXgGvca6qLS9usmoTR/UFcZoR1Wase4msUgKTHwG7Z6MSTu1lNGNMN3d95pqL4O/MPF
 yIDd86TAwa+Gw/7Un21LN3H+7W35ug==
X-Proofpoint-GUID: uD-4p1OkJazxAvhKpc8RamRdn2QrCMZY
X-Proofpoint-ORIG-GUID: uD-4p1OkJazxAvhKpc8RamRdn2QrCMZY
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db6fd1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RsfoXIdr71syKxn2W_8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

A8x GMU configuration are very similar to A7x. Unfortunately, there are
minor shuffling in the register offsets in the GMU CX register region.
Apart from that, there is a new HFI message support to pass table like
data. This patch adds support for  perf table using this new HFI
message.

Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
to simplify handling of MxG to MxA fallback along with the additional
calculations for the new dependency vote.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 161 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |   5 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  53 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h             |  17 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  48 +++++--
 6 files changed, 242 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 72d64eb10ca931ee90c91f7e004771cf6d7997a4..e687f5cc7ee59c2156d7e1d000106796a9680fd5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -224,14 +224,19 @@ unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
 
 static bool a6xx_gmu_check_idle_level(struct a6xx_gmu *gmu)
 {
-	u32 val;
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int local = gmu->idle_level;
+	u32 val;
 
 	/* SPTP and IFPC both report as IFPC */
 	if (gmu->idle_level == GMU_IDLE_STATE_SPTP)
 		local = GMU_IDLE_STATE_IFPC;
 
-	val = gmu_read(gmu, REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE);
+	if (adreno_is_a8xx(adreno_gpu))
+		val = gmu_read(gmu, REG_A8XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE);
+	else
+		val = gmu_read(gmu, REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE);
 
 	if (val == local) {
 		if (gmu->idle_level != GMU_IDLE_STATE_IFPC ||
@@ -269,7 +274,9 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	/* Set the log wptr index
 	 * note: downstream saves the value in poweroff and restores it here
 	 */
-	if (adreno_is_a7xx(adreno_gpu))
+	if (adreno_is_a8xx(adreno_gpu))
+		gmu_write(gmu, REG_A8XX_GMU_GENERAL_9, 0);
+	else if (adreno_is_a7xx(adreno_gpu))
 		gmu_write(gmu, REG_A7XX_GMU_GENERAL_9, 0);
 	else
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
@@ -485,7 +492,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+	if (adreno_is_a8xx(adreno_gpu))
+		gmu_write(gmu, REG_A8XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
+	else if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
 				adreno_is_7c3(adreno_gpu)))
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
@@ -493,10 +502,15 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 /* Let the GMU know that we are about to go into slumber */
 static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int ret;
 
 	/* Disable the power counter so the GMU isn't busy */
-	gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 0);
+	if (adreno_is_a8xx(adreno_gpu))
+		gmu_write(gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 0);
+	else
+		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 0);
 
 	/* Disable SPTP_PC if the CPU is responsible for it */
 	if (gmu->idle_level < GMU_IDLE_STATE_SPTP)
@@ -592,12 +606,16 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
-	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc", NULL);
 	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
 	void __iomem *seqptr = NULL;
 	uint32_t pdc_address_offset;
+	void __iomem *pdcptr;
 	bool pdc_in_aop = false;
 
+	if (adreno_is_a8xx(adreno_gpu))
+		return;
+
+	pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc", NULL);
 	if (IS_ERR(pdcptr))
 		goto err;
 
@@ -732,7 +750,7 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
 
 	/* A7xx knows better by default! */
-	if (adreno_is_a7xx(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
 		return;
 
 	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL, 0x9c40400);
@@ -792,7 +810,8 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 	u32 itcm_base = 0x00000000;
 	u32 dtcm_base = 0x00040000;
 
-	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
+	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ||
+			adreno_is_a8xx(adreno_gpu))
 		dtcm_base = 0x10004000;
 
 	if (gmu->legacy) {
@@ -856,12 +875,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu)) {
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
+	} else if (adreno_is_a8xx(adreno_gpu)) {
+		gmu_write(gmu, REG_A8XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
+		gmu_write(gmu, REG_A8XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
 	}
 
 	/* Turn on TCM (Tightly Coupled Memory) retention */
 	if (adreno_is_a7xx(adreno_gpu))
 		a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
-	else
+	else if (!adreno_is_a8xx(adreno_gpu))
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
 	ret = a6xx_rpmh_start(gmu);
@@ -886,7 +908,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_ADDR, gmu->hfi.iova);
 	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_INFO, 1);
 
-	if (adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a8xx(adreno_gpu)) {
+		fence_range_upper = 0x32;
+		fence_range_lower = 0x8c0;
+	} else if (adreno_is_a7xx(adreno_gpu)) {
 		fence_range_upper = 0x32;
 		fence_range_lower = 0x8a0;
 	} else {
@@ -920,7 +945,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		chipid |= (adreno_gpu->chip_id << 8) & 0x0f00; /* patchid */
 	}
 
-	if (adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a8xx(adreno_gpu)) {
+		gmu_write(gmu, REG_A8XX_GMU_GENERAL_10, chipid);
+		gmu_write(gmu, REG_A8XX_GMU_GENERAL_8,
+			  (gmu->log.iova & GENMASK(31, 12)) |
+			  ((gmu->log.size / SZ_4K - 1) & GENMASK(7, 0)));
+	} else if (adreno_is_a7xx(adreno_gpu)) {
 		gmu_write(gmu, REG_A7XX_GMU_GENERAL_10, chipid);
 		gmu_write(gmu, REG_A7XX_GMU_GENERAL_8,
 			  (gmu->log.iova & GENMASK(31, 12)) |
@@ -983,7 +1013,7 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 	u32 val, seqmem_off = 0;
 
 	/* The second spin of A7xx GPUs messed with some register offsets.. */
-	if (adreno_is_a740_family(adreno_gpu))
+	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
 		seqmem_off = 4;
 
 	/* Make sure there are no outstanding RPMh votes */
@@ -996,7 +1026,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
 		val, (val & 1), 100, 1000);
 
-	if (!adreno_is_a740_family(adreno_gpu))
+
+	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
 		return;
 
 	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
@@ -1024,7 +1055,10 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	 * Turn off keep alive that might have been enabled by the hang
 	 * interrupt
 	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+	if (adreno_is_a8xx(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A8XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+	else
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
 
 	/* Flush all the queues */
 	a6xx_hfi_stop(gmu);
@@ -1128,7 +1162,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	enable_irq(gmu->gmu_irq);
 
 	/* Check to see if we are doing a cold or warm boot */
-	if (adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
 		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
 			GMU_WARM_BOOT : GMU_COLD_BOOT;
 	} else if (gmu->legacy) {
@@ -1457,7 +1491,7 @@ static int a6xx_gmu_rpmh_bw_votes_init(struct adreno_gpu *adreno_gpu,
 			vote = clamp(peak, 1, BCM_TCS_CMD_VOTE_MASK);
 
 			/* GMUs on A7xx votes on both x & y */
-			if (adreno_is_a7xx(adreno_gpu))
+			if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
 				data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
 			else
 				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, vote);
@@ -1489,13 +1523,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
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
@@ -1506,13 +1541,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
 
@@ -1566,6 +1595,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
+		unsigned long *freqs, int freqs_count)
+{
+	const u16 *mx;
+	size_t count;
+
+	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	if (IS_ERR(mx))
+		return PTR_ERR(mx);
+	/*
+	 * The data comes back as an array of unsigned shorts so adjust the
+	 * count accordingly
+	 */
+	count >>= 1;
+	if (!count)
+		return -EINVAL;
+
+	/* Fix the vote for zero frequency */
+	votes[0] = 0xFFFFFFFF;
+
+	/* Construct a vote for rest of the corners */
+	for (int i = 1; i < freqs_count; i++) {
+		u8 j, index = 0;
+		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+
+		/* Get the primary index that matches the arc level */
+		for (j = 0; j < count; j++) {
+			if (mx[j] >= level) {
+				index = j;
+				break;
+			}
+		}
+
+		if (j == count) {
+			DRM_DEV_ERROR(dev,
+				      "Mx Level %u not found in the RPMh list\n",
+				      level);
+			DRM_DEV_ERROR(dev, "Available levels:\n");
+			for (j = 0; j < count; j++)
+				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
+
+			return -EINVAL;
+		}
+
+		/* Construct the vote */
+		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+	}
+
+	return 0;
+}
+
 /*
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
@@ -1580,15 +1660,27 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
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
+
+	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
@@ -2043,14 +2135,14 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	 * are otherwise unused by a660.
 	 */
 	gmu->dummy.size = SZ_4K;
-	if (adreno_is_a660_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a660_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ||
+			adreno_is_a8xx(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7,
 					    0x60400000, "debug");
 		if (ret)
 			goto err_memory;
 
-		gmu->dummy.size = SZ_8K;
+		gmu->dummy.size = SZ_16K;
 	}
 
 	/* Allocate memory for the GMU dummy page */
@@ -2060,8 +2152,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 
 	/* Note that a650 family also includes a660 family: */
-	if (adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ||
+			adreno_is_a8xx(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_16M - SZ_16K, 0x04000, "icache");
 		if (ret)
@@ -2118,13 +2210,14 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Identify gmu base offset from gpu base address */
 	gmu->mmio_offset = (u32)(start - res->start);
 
-	if (adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu)) {
 		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc", NULL);
 		if (IS_ERR(gmu->rscc)) {
 			ret = -ENODEV;
 			goto err_mmio;
 		}
+	} else if (adreno_is_a8xx(adreno_gpu)) {
+		gmu->rscc = gmu->mmio + 0x19000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 55b1c78daa8b523147435a86d6eb629dbad18acd..2af074c8e8cfa775a7d35a786834dba30395c8c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,8 +19,8 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
-#define GMU_MAX_GX_FREQS	16
-#define GMU_MAX_CX_FREQS	4
+#define GMU_MAX_GX_FREQS	32
+#define GMU_MAX_CX_FREQS	6
 #define GMU_MAX_BCMS		3
 
 struct a6xx_bcm {
@@ -97,6 +97,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
+	u32 dep_arc_votes[GMU_MAX_GX_FREQS];
 	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gpu_bws;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 550de6ad68effacaea09751891c2528464bdfcc5..64618fd693051ee7b24406292a86bcfb28f73172 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -23,6 +23,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_START),
 	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
+	HFI_MSG_ID(HFI_H2F_MSG_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
 };
@@ -255,11 +256,63 @@ static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
+{
+	unsigned int num_gx_votes = 3, num_cx_votes = 2;
+	struct a6xx_hfi_table_entry *entry;
+	struct a6xx_hfi_table *tbl;
+	int ret, i;
+	u32 size;
+
+	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
+		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
+		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
+	tbl = devm_kzalloc(gmu->dev, size, GFP_KERNEL);
+	tbl->type = HFI_TABLE_GPU_PERF;
+
+	/* First fill GX votes */
+	entry = &tbl->entry[0];
+	entry->count = gmu->nr_gpu_freqs;
+	entry->stride = num_gx_votes;
+
+	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base+0] = gmu->gx_arc_votes[i];
+		entry->data[base+1] = gmu->dep_arc_votes[i];
+		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;
+	}
+
+	/* Then fill CX votes */
+	entry = (struct a6xx_hfi_table_entry *)
+		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
+
+	entry->count = gmu->nr_gmu_freqs;
+	entry->stride = num_cx_votes;
+
+	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base] = gmu->cx_arc_votes[i];
+		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;
+	}
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_TABLE, tbl, size, NULL, 0);
+
+	devm_kfree(gmu->dev, tbl);
+	return ret;
+}
+
 static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_hfi_msg_perf_table msg = { 0 };
 	int i;
 
+	if (adreno_is_a8xx(adreno_gpu))
+		return a8xx_hfi_send_perf_table(gmu);
+
 	msg.num_gpu_levels = gmu->nr_gpu_freqs;
 	msg.num_gmu_levels = gmu->nr_gmu_freqs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 653ef720e2da4d2b0793c0b76e994b6f6dc524c7..e12866110cb8ea0c075b3ae5e4cae679405c4bd1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -185,6 +185,23 @@ struct a6xx_hfi_msg_core_fw_start {
 	u32 handle;
 };
 
+#define HFI_H2F_MSG_TABLE 15
+
+struct a6xx_hfi_table_entry {
+	u32 count;
+	u32 stride;
+	u32 data[];
+};
+
+struct a6xx_hfi_table {
+	u32 header;
+	u32 version;
+#define HFI_TABLE_BW_VOTE 0
+#define HFI_TABLE_GPU_PERF 1
+	u32 type;
+	struct a6xx_hfi_table_entry entry[];
+};
+
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
 struct a6xx_hfi_gx_bw_perf_vote_cmd {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b27974d97c7512ecae326eb2d22238330d6c52f0..9831401c3bc865b803c2f9759d5e2ffcd79d19f8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -50,6 +50,8 @@ enum adreno_family {
 	ADRENO_7XX_GEN1,  /* a730 family */
 	ADRENO_7XX_GEN2,  /* a740 family */
 	ADRENO_7XX_GEN3,  /* a750 family */
+	ADRENO_8XX_GEN1,  /* a830 family */
+	ADRENO_8XX_GEN2,  /* a840 family */
 };
 
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
@@ -555,6 +557,11 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 	       adreno_is_a740_family(gpu);
 }
 
+static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
+{
+	return gpu->info->family >= ADRENO_8XX_GEN1;
+}
+
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 09b8a0b9c0de7615f7e7e6364c198405a498121a..5dce7934056dd6472c368309b4894f0ed4a4d960 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -66,10 +66,15 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f81c" name="GMU_CM3_FW_INIT_RESULT"/>
 	<reg32 offset="0x1f82d" name="GMU_CM3_CFG"/>
 	<reg32 offset="0x1f840" name="GMU_CX_GMU_POWER_COUNTER_ENABLE"/>
+	<reg32 offset="0x1fc10" name="GMU_CX_GMU_POWER_COUNTER_ENABLE" variants="A8XX"/>
 	<reg32 offset="0x1f841" name="GMU_CX_GMU_POWER_COUNTER_SELECT_0"/>
 	<reg32 offset="0x1f842" name="GMU_CX_GMU_POWER_COUNTER_SELECT_1"/>
+	<reg32 offset="0x1fc40" name="GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_0" variants="A8XX-"/>
+	<reg32 offset="0x1fc41" name="GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_1" variants="A8XX-"/>
 	<reg32 offset="0x1f844" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L"/>
+	<reg32 offset="0x1fca0" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L" variants="A8XX-"/>
 	<reg32 offset="0x1f845" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H"/>
+	<reg32 offset="0x1fca1" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H" variants="A8XX-"/>
 	<reg32 offset="0x1f846" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_L"/>
 	<reg32 offset="0x1f847" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_H"/>
 	<reg32 offset="0x1f848" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_L"/>
@@ -89,7 +94,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	</reg32>
 	<reg32 offset="0x1f8c1" name="GMU_PWR_COL_INTER_FRAME_HYST"/>
 	<reg32 offset="0x1f8c2" name="GMU_PWR_COL_SPTPRAC_HYST"/>
-	<reg32 offset="0x1f8d0" name="GMU_SPTPRAC_PWR_CLK_STATUS">
+	<reg32 offset="0x1f8d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A6XX">
 		<bitfield name="SPTPRAC_GDSC_POWERING_OFF" pos="0" type="boolean"/>
 		<bitfield name="SPTPRAC_GDSC_POWERING_ON" pos="1" type="boolean"/>
 		<bitfield name="SPTPRAC_GDSC_POWER_OFF" pos="2" type="boolean"/>
@@ -99,7 +104,11 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x1f8d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX-">
+	<reg32 offset="0x1f8d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x1f7e8" name="GMU_PWR_CLK_STATUS" variants="A8XX-">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
 	</reg32>
@@ -120,9 +129,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GFX_MIN_VOTE_ENABLE" pos="15" type="boolean"/>
 	</reg32>
 	<reg32 offset="0x1f8e9" name="GMU_RPMH_HYST_CTRL"/>
-	<reg32 offset="0x1f8ec" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE"/>
-	<reg32 offset="0x1f8f0" name="GPU_GMU_CX_GMU_CX_FAL_INTF"/>
-	<reg32 offset="0x1f8f1" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF"/>
+	<reg32 offset="0x1f8ec" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE" variants="A6XX"/>
+	<reg32 offset="0x1f7e9" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE" variants="A8XX-"/>
+	<reg32 offset="0x1f8f0" name="GPU_GMU_CX_GMU_CX_FAL_INTF" variants="A6XX"/>
+	<reg32 offset="0x1f7ec" name="GPU_GMU_CX_GMU_CX_FAL_INTF" variants="A8XX-"/>
+	<reg32 offset="0x1f8f1" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF" variants="A6XX"/>
+	<reg32 offset="0x1f7ed" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF" variants="A8XX-"/>
 	<reg32 offset="0x1f900" name="GPU_GMU_CX_GMU_PWR_COL_CP_MSG"/>
 	<reg32 offset="0x1f901" name="GPU_GMU_CX_GMU_PWR_COL_CP_RESP"/>
 	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
@@ -130,8 +142,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
 	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L"/>
 	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H"/>
-	<reg32 offset="0x1f8c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
-	<reg32 offset="0x1f8c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
+	<reg32 offset="0x1f8c3" name="GMU_GMU_PWR_COL_KEEPALIVE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x1f7e4" name="GMU_GMU_PWR_COL_KEEPALIVE" variants="A8XX-"/>
+	<reg32 offset="0x1f8c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE" variants="A6XX-A7XX"/>
+	<reg32 offset="0x1f7e5" name="GMU_PWR_COL_PREEMPT_KEEPALIVE" variants="A8XX-"/>
 	<reg32 offset="0x1f980" name="GMU_HFI_CTRL_STATUS"/>
 	<reg32 offset="0x1f981" name="GMU_HFI_VERSION_INFO"/>
 	<reg32 offset="0x1f982" name="GMU_HFI_SFR_ADDR"/>
@@ -164,6 +178,14 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f9cd" name="GMU_GENERAL_8" variants="A7XX"/>
 	<reg32 offset="0x1f9ce" name="GMU_GENERAL_9" variants="A7XX"/>
 	<reg32 offset="0x1f9cf" name="GMU_GENERAL_10" variants="A7XX"/>
+	<reg32 offset="0x1f9c0" name="GMU_GENERAL_0" variants="A8XX"/>
+	<reg32 offset="0x1f9c1" name="GMU_GENERAL_1" variants="A8XX"/>
+	<reg32 offset="0x1f9c6" name="GMU_GENERAL_6" variants="A8XX"/>
+	<reg32 offset="0x1f9c7" name="GMU_GENERAL_7" variants="A8XX"/>
+	<reg32 offset="0x1f9c8" name="GMU_GENERAL_8" variants="A8XX"/>
+	<reg32 offset="0x1f9c9" name="GMU_GENERAL_9" variants="A8XX"/>
+	<reg32 offset="0x1f9ca" name="GMU_GENERAL_10" variants="A8XX"/>
+	<reg32 offset="0x1f9cb" name="GMU_GENERAL_11" variants="A8XX"/>
 	<reg32 offset="0x1f95d" name="GMU_ISENSE_CTRL"/>
 	<reg32 offset="0x23120" name="GPU_CS_ENABLE_REG"/>
 	<reg32 offset="0x1f95d" name="GPU_GMU_CX_GMU_ISENSE_CTRL"/>
@@ -233,12 +255,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
 	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
 	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
-	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX"/>
-	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX"/>
-	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX"/>
-	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX"/>
-	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX"/>
-	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX-"/>
 </domain>
 
 </database>

-- 
2.51.0

