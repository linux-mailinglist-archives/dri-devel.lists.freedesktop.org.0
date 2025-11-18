Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA697C684D9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23210E453;
	Tue, 18 Nov 2025 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbrWAn92";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFRCeUQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749AD10E443
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6fQ0r2272050
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=; b=PbrWAn92/UAvnxop
 hVL8WnJV+jyrdZzcyx1IT/cxgRshVWUIpNNYmpgd0uNI8bQUiI6E/wR/5qbJuMli
 g4WnDzjNychYcH1QO3cuNwZ9T7MUPXucS7v5Iks/Yf1HuFscEtsB/Arevxk0WlIy
 dzHEaJFVzJevTlVtzBF9+JCLxTJzJUvvbkswwb4TtyTKWKz1PCrkDHJHPYwpoTYC
 CIBzRN8fSp1fVTZPmm6F5vrFtfHBbhXPb4TWUNy5HZ4OCW2ckXGxtk0rU7rzzB/t
 GebM6rn1rYpxTwISucZzRRXNd1PkicUaaqIHjuNqrZiakCW4N002lOqMde/ZBhbn
 bz6J7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgc7r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-297d50cd8c4so168339735ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455940; x=1764060740;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=;
 b=LFRCeUQMe/mAPsimGLCOa3Qwq6PMbBaQtrmknz5kseSiTLNSq4cchoP0ZsSlsmtlc2
 X3Tlp+a57Al4TbGvTrbDu8576k4clJVZXJRDxpNtnHHEwzzjj1RNv1xEuwFrvgq6ssbB
 jRX3rZ8W1wAL90ALQkSTdRcjhzzRHAg6dU9xv0Hf1TfsJpQYqETJerLkwbgMirszm9UJ
 GCpt84y9sCwpt5y69GPAVEiK707TH8hv6UkBDQg6aaSMRnGQxByCHRjt4U2OG1diIbu2
 PD682juJXfq/vJCYXg2PoR1//CHt8JDNAlTZZxpQ0fnNPUOuIGcSHTD7Vs7LybzW0SrK
 uolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455940; x=1764060740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=;
 b=OvEdsQNRYZNMPL6i8jaGSund0tYUoJUUPChDS+0Dt+RK0Z0t2DgaW1zHG+NehzZe1j
 vQQmlQnsB1vSqVbV+fJSFyImLdZJF2bkSKnmpkQtGwpf/QwFHevw7tSOjEpL76JQSp9w
 aUTZCbAjeRA3brnIduWcbUrhIboZYDfKjfcBQC6KSgjufZYpYrhh7gHYeYaUac5Gj5oR
 w3jdZenzoXEty2RGBBfTRnaY1HQMDtEEULEFzzoWFNsz3lBxIe6Tzjaeq4lsGgFXFKlp
 MYmiD+etA2wxaBbY6CreGFLtBGrHz1Yk4zROjmziqJgsfmjbr2YoZgJjKTW0F9A0es1P
 8YBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW360Q0E2a2DvIIobhtdasGqUompCM0pHKdNq7qjGY3akq/qSl93vI0NHGGeXJHpXrZcc5bItj8Dvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ECp2DrWMLQtTM1DSpXR8RHSI3DQk5VQPa1EPR/a3UwqRJpoB
 A0wtE2em/9kYE7merJGQhN72Vcu1RkmElnUz6B0j0j/+pmEZPbOzDnAVM/y6NS7aMAh7rPQlEhU
 rP09Ri5BXc6kL03PGScdQvSfOIUzm2JSv2wGFXxjHTEOHOm/KgSpc10NeZy2DGfm0CwYmTbA=
X-Gm-Gg: ASbGncs9kCOg/Qw9pUleNzt7JdWqYRIGrtwze0tNVPHCeU3oAXLiLwUpbCoIJqu3tj6
 IWn8cAK5QXKu59GTrqvyBJMp6T/4gp1YAm31iF0cBr/GobE7yDMKHCFC10NxR4sNJm+nLQhZ01U
 HmxemSFsiHK/77YvIrq84Jf8aqeams0cEyHsFiZci6LN/omRmjjNaRfzjFGtS6S1BjoM/s2A8LS
 aTBrQJcSejVEoErHBIj8AdEJZvo5q8oEufPYoWMlxigucHi9nwCjJZzayEk9ELqwjbn/naj17x0
 UQwZ+EXeKpsemr+SnqZZmhVGgE7jZY25+HQGbtadFZ5HJhJCS25pKlyLd0J2sliJkldl0WfPh2F
 WchllYLmTdgHxVLrZL1rEFGQ=
X-Received: by 2002:a17:902:d4c4:b0:26a:8171:dafa with SMTP id
 d9443c01a7336-2986a6d225dmr192584845ad.21.1763455939672; 
 Tue, 18 Nov 2025 00:52:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY5DSlIVYM8XbzjgfaGaoj0qv84BBjOFWR74NO9yqLaQacZkB3oED8rW587lTo9DK6YDF0CQ==
X-Received: by 2002:a17:902:d4c4:b0:26a:8171:dafa with SMTP id
 d9443c01a7336-2986a6d225dmr192584645ad.21.1763455939244; 
 Tue, 18 Nov 2025 00:52:19 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:52:18 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:35 +0530
Subject: [PATCH v4 08/22] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-8-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ye3E3o4bkNQLrLn0I1sQjG1xLLVdg0W9qxVP6kAlZGU=;
 b=uO/b3x2yM+ErviiHC5Yiqi/gnDy9JSeF3Bmq3OXfo8eK4rnUn7HPMORG4OtVFdsgLXpz3DYe2
 wILpk1MLNgzC4XeeECdd+yI2O2WBC6cJabZuE7vqvTFBDIx8LII4tbD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXztEIoi8Ri71L
 l1GAaN1X+/ZuLToPzZzD2W9XphgLfgtUCiEiS4e7Yx/NJUPCpvBXzY/tOLA4zHBiMbuIbdyyc+K
 zrHSNFfQsa/YQwEEIvE7B4orjaLqKT7JjwjXsKc1xX7PpWKYdBxeV4o5/ubf+k9M2agDAXNzcZb
 Wtr33WK4jBXNJcsRdkeAYNFrZtX+SmhGxKwfN1ixpsagA+0szcR8yIfKo4U9gYFU8hHfFcXlc6Z
 gHY/cZlLJyfwOQSEbpt+SqdwAGG1XB2yKwHqTxAiJ33oSoRmf5wVsRrYuoQzFbH5wa0fYtIsRMY
 Zn4YV0O8+awTjj5fDAwIbvevLuYSpHsp42Mvyl/P3X89N3iFHGY1ydN4qWHLhchijyQUM6fkzal
 Djre6mBh3td5359S5D68FPBYhVMbBg==
X-Proofpoint-ORIG-GUID: QgpMHzkmnotSq1wApGeSKZmKObzWmQzx
X-Proofpoint-GUID: QgpMHzkmnotSq1wApGeSKZmKObzWmQzx
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c33c4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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
index 575f2f9d3b1d..9edd23d419ec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2641,7 +2641,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2686,6 +2686,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2717,6 +2718,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2750,4 +2752,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 08bb601b3bd3..922d2dee70fb 100644
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

