Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CEC5A964
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8610E10E972;
	Thu, 13 Nov 2025 23:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGtxKzUH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sd5ZofUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AC210E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMasxN1582991
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CB6S9RVY8vn0wwCs22L7iOojAOJ0e95Ai4UolOq6vfE=; b=KGtxKzUH+J5DQrn+
 b39dfSRZwLf6w3PqwnzLuD56w9NEAa7HaZLr2mWjRVzZzzwCFoOmPeAbyz7nDD/g
 gA1v4MOc0aOqQjbfUdWG4JXqjjtvKfunW7IHSKhwphD9XdaS5ic6FueqWpxbM+ji
 vLl+Un/09Lw/eEzw7GPvvTgzz9sptbc4g6f0zz08qFgHbwMBx960KQp+QgcnfyFc
 u9CmChwS6XrHHbhuzCl3JHPPRwTZP4OnDZgEGpStQ14pn14lXzUdmtesflaivinD
 r3bbk5h6SNq6dnm2z9JBP2qCTSU5qVuREnvwECjPk/UH3Epz5tNSmITRRgmDhJYy
 t1IpMQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr49n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b991765fb5so1514326b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076677; x=1763681477;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CB6S9RVY8vn0wwCs22L7iOojAOJ0e95Ai4UolOq6vfE=;
 b=Sd5ZofUIK9e6p9vL82b83dRR+ZVHz1xFhYxhFNIAapBbOyUUj4rRy8n4qjmRycTMvi
 Vvcs5wjpUiX4rJQs4e0tf8aMvAw5MlS0EuATQ9zNFzNdXs5jZ8i75ZkQzDhMt9lNIThJ
 m5Zp1ezrjWFKKt4FoYR0Yw3S3WuTqa+bviKo/p9GJKJrf+n/8ZkmmqfjqqGTs27K96aq
 61Xyv41dsVuwpvB3NWt8xRhGEzzP8KokqkBkHlm2grqnjwI2BG4xKSXvVhwmD9eteGEN
 EKyPDjeAan6LLfzKmE70wPRUA//U3BW0w0r5hUZ7xJeXmN+dUVdSxfpi8DovXn0+9scV
 y8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076677; x=1763681477;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CB6S9RVY8vn0wwCs22L7iOojAOJ0e95Ai4UolOq6vfE=;
 b=AeQQusfzV1np/0CiGrxDqnypoUeR27EOg6lqS87T40f19weSxuGqILQxEEnteAaw6q
 tO0IWcB/b1eUNEtl5rYLedWXHFW2vIGB+CcxIjcc5nKlYpK4dxyfPXIubsC+AjBBMgJZ
 LB3hnmoDpbUH6SN6RFa4H2wiIJ1YH8+jEOCSvXbWLPRAMME86trbsfFFYau+mKGwIC6i
 LvWgQSPrk75bpiM8jQf2lgJC0uSd48UBra+ZBtPNJMzZwJvncmlFPIEIlmIVj9LVdLNx
 NptJJWBo5wbKGOwBZb1EXSzJOOrZivluIlfqQArTPPQUGF3hjaOSANRsF7/KECD/PpHU
 Pi9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+pc/JNNMbY+pn3lwGVyqWMKRCRww7LBFx4xB3paSAdX4mXqySh259I9JuvS1VvtZXOZ/dqiJn/70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDr6MC08AO9Ykb8VXsf+QUxvne1JU6DwNqv+J5OYkV4hBf7nMs
 kyRIqUXA6EQSYo932Qd7NS9UxwqurjVKiRVKqS/q7OMkEay1B/IWL5vpgWjRrVmIGCrW8BcxIsl
 cXKyyV5lH2H58v/xsBQPBbSoRj1sYsWoyrp49D3AGoGwIbUqcBaO6ogNiSpmP/vGGH/egieg=
X-Gm-Gg: ASbGncsTfyGXyC/JUMhZ9AWoJlZOnxG/2MKfwSdEPprV9eBkV+0k4rqif1P8PvE88B4
 GzlIHLX6h8L7+E9CmHWjUGF/SwDpGUxxKkUSwiP0jl9bjddJf3zqyGiZARsdIR4JfyVn1qNYFoP
 bNm/W6oShDmSUIuVywSHVYnkrJ6SOz7hT1U+r5GMOxQRvciZYzcTTV3+Gx2syOb9h0IVg4182Y2
 kNVfZuqZCr0bmAO4GOLWm7SdFNrjxb8Fmag6mOsUFblQaIZ6taCb2oobxhuUl7ffSEMwECb0Vqc
 X7VcPHBJW67iAy+LdcQuALee5d335Ex7LlRwWkZzbGuBJH1wa97kDPOQEOtvAc8pCrwZhrpzJvw
 WtIUaAEECZhDgV4gPjHMQBik=
X-Received: by 2002:a05:6a20:432c:b0:334:9e81:4e5b with SMTP id
 adf61e73a8af0-35b9fa7d7a2mr1620110637.5.1763076676410; 
 Thu, 13 Nov 2025 15:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdM1TwSBI7bgq33ThxEnHBZmojfXX5geEyT5PoZRuCcR8MI8vCw1SVH8pAT63wHxcRCPzgVw==
X-Received: by 2002:a05:6a20:432c:b0:334:9e81:4e5b with SMTP id
 adf61e73a8af0-35b9fa7d7a2mr1620072637.5.1763076675794; 
 Thu, 13 Nov 2025 15:31:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:31:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:09 +0530
Subject: [PATCH v3 12/20] drm/msm/a6xx: Share dependency vote table with
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-12-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=6424;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Q9m5CNKx9FOzxd+4ydSe4NBkO7HUkggyOwY3jdIpxD8=;
 b=NPkyBRxYexgIIAzKrksfzpRy0u9mDbXENkjhYmm8cIG5w6QdjcjACga2a/91CypC7DfAVDUlE
 r5RFSeSv+zNAAJGYNDldjht8qM2ircdr6UAw9rn+VDW1ghazd7F40cF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69166a45 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jvJuTtenM57zLa_9FEIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: tr6BdiNulFc9KT9aJFe-lfj9KIE0w8yZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX4iQUtOBStKd+
 sHqgmCV6Rp2+a/pzl56Sfw9xISWWRsG+1hUJeMDbdOEUWfXK/eOD92fHKGUNfRldZdXt92pN8xH
 z3SOP+T3gIVZBmFC1skj6T3AAc4WiMU12ljziVaB4uD/UAiCWH256lJuSdii+YFbxo7Hh/7Yh8s
 y9tbr7vu/II52qARE5iLUDiKZkxkCIXPh6GOcu3Ljc4+rLAVzmEZzGiZ3xuK4K0tc+j3TSskEgP
 PTDdiMPOBGpal8mSxeAeJRLOGnRvRPyHMAB/BNV+cQWSBBlvHjkgNZiApyn+SFfdV58Xzky2X0D
 0V8/VQSGqPNKprH0Hi6YP1CpqVrr1FeIPRYR+0l8xYqSvQ+cjASn385TQk/3Lchw6Uu2Hip2cOQ
 JzgJiZ/ydqPc1Hdv2osiwhqt926SmA==
X-Proofpoint-ORIG-GUID: tr6BdiNulFc9KT9aJFe-lfj9KIE0w8yZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
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

A8x GMU firmwares expect a separate vote table which describes the
relationship between the Gx rail and MxA rail (and possibly Cx rail).
Create this new vote table and implement the new HFI message which
allows passing vote tables to send this data to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
 4 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f32e1aba146b..158c0cd2d92b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1590,6 +1590,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
+	votes[0] = 0xffffffff;
+
+	/* Construct a vote for rest of the corners */
+	for (int i = 1; i < freqs_count; i++) {
+		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+		u8 j, index = 0;
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
@@ -1623,6 +1674,9 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index edf6c282cd76..2af074c8e8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -97,6 +97,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
+	u32 dep_arc_votes[GMU_MAX_GX_FREQS];
 	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gpu_bws;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 550de6ad68ef..da113e5b535d 100644
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
+	tbl = kzalloc(size, GFP_KERNEL);
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
+	kfree(tbl);
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
index 653ef720e2da..6f9f74a0bc85 100644
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
+	u32 type;
+#define HFI_TABLE_BW_VOTE 0
+#define HFI_TABLE_GPU_PERF 1
+	struct a6xx_hfi_table_entry entry[];
+};
+
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
 struct a6xx_hfi_gx_bw_perf_vote_cmd {

-- 
2.51.0

