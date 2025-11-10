Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D691C481BC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C49410E42B;
	Mon, 10 Nov 2025 16:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyeuIyz6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjeqQ58d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF6A10E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:51:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAGnlwa4073875
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jVLv/uuU3JLI+2HIhCPmdUPs+Ebzue4D+35QDRwfYvo=; b=SyeuIyz6FatLdy85
 2+R2RrYS/LZQlPTNKhjelJkKMXoqwAE+ll8dntF4uoosoiZYfd0yzzIXRdHNd42h
 H0o1CV0SeN7So+TAQfEufvTlaX2BqQHhdT7MJXAGhXuV/Q76jkXTkQWcWiw0qdIl
 jlhDw0lEANwP02sulVTYTJOkQdTwcp9sHOJlz2Hrg5vEivBArOZhBjAw0eCQRHHV
 svzQ2FQfZENUbur/QwDwRHnhhWcB+5vcteZn+DQm+VsJRTExcuxfk86qvkoV+jLk
 2CcvL48hUC7rwW48X5VRokkli5psjR4iAj0UXdRrQ8WLMuB+apK+TFegXrz6GRlB
 fkrelw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkws807b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:51:49 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7c6c8dc8322so6324904a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762793508; x=1763398308;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jVLv/uuU3JLI+2HIhCPmdUPs+Ebzue4D+35QDRwfYvo=;
 b=XjeqQ58dW3BZCCJD6nOk0yTgHAJlzfhhPdp3lZEtBtmF8dctnOBaeTSKLar34bu31t
 tGVN9AGovwbyo3LDEuOO5HHgeKdMgqZifvfZjyZ4RSHhuiPdhmrHBmEmw0DPfWqT8g5v
 3izLK9N6xTmOY5NRaCakkCHwlpsIcbwsCZab35rO5us2eFISSpDFI1fXxhWOUgbOkZpB
 rIOOHU/pe8HgULLaQRcfDgbg1g4rI/HvRKz1PZvIhP0Pk9iYy8lYA2W6r5ijS6PR0IpC
 wmO1PtwNjbraNkIfM8iIiT0dQsbPA/0AwPnJ6RBgMTTVPGVQ7rC/B3S3M2EdNCMinQzo
 LVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762793508; x=1763398308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jVLv/uuU3JLI+2HIhCPmdUPs+Ebzue4D+35QDRwfYvo=;
 b=Ni8USt5NwXiFOtSYZVcN20xLE/RX8d8PPUsCSOeF7XSz+JMvCz9e7qDZjFIb76f4qy
 fj7Mkdg4SBmilYKXY3BWCcn5H/j6UhjBLcqNIXGWychY5E1ou3kOoruk1BtZzjPk1TMe
 NSohk+/IlwHxXaarKzjhOJS0fIf4dPmHMAIrr7jH/44fNSkmf4eXialN1RfjgFOeBohG
 43VyBN8JlNEhu4dBhiov6xBJ9IFw9Qy4BWXPWX6QFy14K2+bkyGHJav6Qd0YTcTreL7/
 v/PjJWmwWtviLn+A9UrP+O+Qs/fHqy6MOl1zNXRRZCa1K1iDkvDhWzN315U596j2m5Si
 iGig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxrEjInfaVqytTmlDyKTYIHAld2IJ78QmT/u20eaMLp0xNmURQaFla0GZj5quiZ3q4T69hwzxbZK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsDwuvrwIzV9Wpj1C7rQHKX3wnZH1PRTnoIjr/CXrOgIagONUP
 ciC54U4VSEVsn8Vi+xkC8++Zo3tJOz74G9BuBBJ6fhA2nh9oaMC6dmJWA64jpK/XZAEGVj+vqqq
 PIaTiiWqJy0TnhBUbAWlreY4NL+MSToqrd0JV6o4z7L6IjUn4JwAS3M5IX8c4H2+FJqQ9JF0=
X-Gm-Gg: ASbGncvhSG+gdW7Ff1IXO3U8Xtj2Poqi0z+/IFFD0C0JsqBiHUlK5XNAHsYQh0rn1mI
 gYc1CeNH0MjpzMgjtSiw2WynVezcotEQDfmzsft8zZHdrZDFMpWKaL9iCAsdD/ini1GoFyZk9RX
 Oabj03BHjQgrswN0JwYDje88421001BVZM7ufxtPOUpjAF7q1VXpUue2ujOEl1gPuPvG+bp1v6W
 8A1wrVS1gzmzEhYMf1o4viUl+Nbr3sTyJxHbEw45s+OEpABJZydKTYH9WOhQDdm2xE44EyH0JDB
 E5oz6CiQfMgqY8QorSGj53GS22vXGnO/bVlQJygMEXuwJUyhmK/Sm7xgQ7h9YHm7gxhJHjP9MU2
 oqOaXBgbS23rUBGUwR/xZuoE=
X-Received: by 2002:a17:90b:4a4d:b0:340:dd2c:a3d9 with SMTP id
 98e67ed59e1d1-3436cb29cafmr13753913a91.12.1762792786332; 
 Mon, 10 Nov 2025 08:39:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIvIbTFe8vuD1Bz6N5pB1xeotjvWHsTfTNEQm7fcGL0bvPFEvHnVFmeK5opyNFF8Eu0di/Wg==
X-Received: by 2002:a17:90b:4a4d:b0:340:dd2c:a3d9 with SMTP id
 98e67ed59e1d1-3436cb29cafmr13753847a91.12.1762792785680; 
 Mon, 10 Nov 2025 08:39:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:39:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:18 +0530
Subject: [PATCH v2 12/21] drm/msm/a6xx: Share dependency vote table with
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=6454;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=fzcOZoDy4nq3d1scAOabdvRSkEECFucdbBehDf9L/KI=;
 b=VcSuVp5pUILjkNbbAkvSmqBrk4aayo/fsTUBVzwaNTz3CHX2AlKGXQ5LaBwdFwJi1nzrR73j/
 q9575BU+fqzCv6CY6sZocpNExlHPL3t9jvx/n4wB/kI2MbotaH6lCK9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MyBTYWx0ZWRfX4rxY2J1aKOw7
 qWOk9TZrehFDnVBsrSib3tXnkityaUrHPmyR0sHUalE+xMcC/G4BK60RrMJMyjos3o7P68ETWeU
 AcEXzvaaIzkR8I5zq3qO5T+cdmFK03UFbHai9e9AihWvoqcuRHA2O+MKCn/fPG1UTq5L+Pw1CCD
 xGnKxSEkU2Q9kHl4jU8X7BVF3eel+iRpqwD9nweEkDz3lKxqW4AhJHcLlTRBrNpLyynQ24mgScq
 C1q2IIZtSYbmgWdfHUyGvB0eRht6gnE4Br1YHxpeMJUKsjVnYi/QX79d4T++GTKe3LNGgah4dTX
 IyiMUWPyJqP7nnwqB2A9AB6matRbK9VYVQdzpi/49BkCyMG8tNmikCQNJULE2fyNFmpGD+QOZ43
 4dYdPO+dLw+wOaKo0ZP2T+Jw8MXEaQ==
X-Authority-Analysis: v=2.4 cv=Vosuwu2n c=1 sm=1 tr=0 ts=69121825 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jvJuTtenM57zLa_9FEIA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: l3a7hB-ZjV8XPkOeS850fIfjlJPqbe7A
X-Proofpoint-ORIG-GUID: l3a7hB-ZjV8XPkOeS850fIfjlJPqbe7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100143
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
index 8597d7adf2f7..396da035cbe8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1591,6 +1591,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
@@ -1624,6 +1675,9 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
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
index 550de6ad68ef..64618fd69305 100644
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
index 653ef720e2da..e12866110cb8 100644
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

-- 
2.51.0

