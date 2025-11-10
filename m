Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5FBC48085
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1E410E2D2;
	Mon, 10 Nov 2025 16:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6rQHslm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="birfpKxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3368310E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAGIpEq2992484
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iV/znKW7U9si3XUyikMkF5tEkXmABb/YADc0YtaaeEs=; b=A6rQHslmiIVnmrUH
 S3StuJbU15UqbaBFIeLF014LL+h4R192RfkDqHa5966mWKIo2HQrpnfwQ9Fl4Xs/
 d2Kr1UbawKDvhrTWCBIz2EnctvAQ+IqkjyLxXh5KDemC++zLr2phwNHFGTKjGN7c
 1hRLhsabpIVFMc8JeMaQWUdvUU0uVaET7fgIGaN/zCQgPREE62zjmbcpVBC8d5BH
 RW5K5fRzIJfvRi+zAjz82zpg84XoT37mcNaJ7w1MlnFKd9JtIefvYxJLSjH4EA7e
 Sdj2pHTQifdJFWyCn/AWUnpUX80McJxznXDcfnUlonuuplNB+UlyzzzmQ8XteHrV
 XSkB6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88sawx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3436e9e3569so5106941a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792811; x=1763397611;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iV/znKW7U9si3XUyikMkF5tEkXmABb/YADc0YtaaeEs=;
 b=birfpKxHyH3YxKatimAIK9YtqYcNEn4ekh6pikDzF52y8ICb9glLJ6AJ61RN7CesWC
 PMiFiusFPSrHh1LdQX9eIW2ayja74WVkx98u64c9ks5LeKHY0gzRnSkQNsFFG0X69kil
 Oqi84XugcOC3PZ6ozf1b91yYiiFnJc9n/WsivNfAqW9stVmhxtcVpkmveIYBKefWiNUM
 PthKdl/xNynW2hZVJQrYWzQhvUXDdp/75EeJrwk4UBCf64GEVYwPjEVC1CxKDI/Ewt3N
 J5XYEXhctEsiTXLZ6gb86tuhwnR4GN8yWtMYKky8/luPwTZtcMbAYBq/jRZbZIBIVcel
 Y16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792811; x=1763397611;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iV/znKW7U9si3XUyikMkF5tEkXmABb/YADc0YtaaeEs=;
 b=f8qYRQeEAXxvyK5pGxM9u9HtPI3oghvdMTr/hyrkbljJNakQe7jjgL7NbqJLxpYloE
 DMA6VUyRRqzcRNS8SsY8A3h455zgbmaIsGmXhi5Vtj0eQcfU5AxBEY+PlqW5aXdRXP/W
 +CBhXV9yP6W2UGM/OfezJAmUge20D2v4w3ahJhfkxJLz2M1A4P/aHECUVWL9cS36yZRi
 cqLn0gTkQYr9lPJeVFrIfjhqkVEUDgpSQhwvbCxz6cB9mA82cw0yb0tM7EY0Nr/U1tfu
 oUS1oescVVxbVAEskdrrujSrCu/Jdf37MpEugwi338UlgbNmyivHHx32FoCsFsr0SCFJ
 lY9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXBPes3i9iMEIneOJSx5EnLWy0wdNDVFHoB+j/YVXTSsxLh2bVtYmU5HgITN7ViBmqKRLvFPn0eLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyemp6K7u+n9A4qjHztDVDZlnvOEKCS1WaoXgFqcPIZj4/IDPwH
 ZOLdM9ojBAGZsRKj1jQNQc6LfqP2qBJ7jCsl78GRv4ZgoZP5nrlCq4p3mUkKwp0kT1c8SIoWo0A
 YKAb93Yyus5tHuIyehp82NitP4Gwx3R3sWn6p//YqivnCaING4MwNy49m4FicaSRELob8O+0=
X-Gm-Gg: ASbGncu1OWwiEBPK6sWBjQx8CGYlc3Ev3wb3nu6079WI2YlcGs5oG0TgeeojD2X6SBm
 if4UxLw9cO+ynAtjDScCE0TcqIP+KS53LF9PbOjwmB29PvSTDst0Fj2YT5pl4BQAKPyksP8/9Ld
 gc9yUygn58+6DmtaOS1xq5RQg/BKNPWlGQRaZp6aeX5v0Cl8jInPB7V/0vh3Vm67U14Hz3PWT78
 tec9hkZksmwIQa34c2L8758p7b75u4T4DnBGnq76iLE54FP4SK3suvoeRdgUuC0DiwjBXFP+Ga4
 J0lO8Gg9ggwZH9QI/YhHrof+HlIkdyja550VXU7Of9dSrTks8kIBN4CmdlhbEvG0ZZiLhlwoWL/
 0wJyQUKi25CdWaXLieg66y+U=
X-Received: by 2002:a17:90b:3904:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-3436cb7ddecmr11924026a91.7.1762792810728; 
 Mon, 10 Nov 2025 08:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxMbgQhc04UUBBl8KqK7L90DQMlCFow7FtAuE+Sm08cSoXaNGWepFZKvRH5NqVi2igq34D5g==
X-Received: by 2002:a17:90b:3904:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-3436cb7ddecmr11923977a91.7.1762792810117; 
 Mon, 10 Nov 2025 08:40:10 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:09 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:21 +0530
Subject: [PATCH v2 15/21] drm/msm/a8xx: Add support for Adreno 840 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=13810;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ZoDxsnWrv3j9TZqMymvratIMuMKRmCCPfOyr310MEN8=;
 b=NA/Hr0HFSGngb+YKLEi/m9MVdwZobCYTQRNspABw7Otslt3is62WGHAJtoJ9bn65RdA6yNiRy
 4gTvBac2PioDQDuW82MHpNTsjZlrO743GZ/PhnnxSjOWiaurloZ0O1c
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: AzCwr-OLmQ8j66vxtUig8elv4WcRLkxw
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6912156b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lZNMzuGAUUwLop3inxgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX3a6T572pW0eg
 gjT57KnmsIYlHyIAjAXtXBMaqhNLYpp7GZs0wciBkGSWCVvRUeBf+Lz4OeWYJDZzlABRN6rECFp
 D2uWVcqcS3t1R8hWSNSsbkleBIdErSmuzQzHGTUSeUpWzpNowFrz1z0ANDL+gx1ygeLb2AAtRap
 B9JgmCo/cUGAr5W3L44+LciPoUkFDyCYqUSNRxm+jv8vAETlMuelRR/ayKNeZduRd6ANxi9BtMe
 EjJd5PI9oW+zpocj+x502wjXpqIDfYi/RmMUG9AfRq84bWyEs4jUQ6gKElTF7qP9xjwsGMdgy1M
 4PNHaGqmjjQFtnhMSyw7BMINShGqs8d1BIVTB4cXiDwKaVpktQUFhGxhj4hcg/iLxkVEbJzsepF
 GalJDvviJUI3YpUkW3YApenu/Q5gzg==
X-Proofpoint-ORIG-GUID: AzCwr-OLmQ8j66vxtUig8elv4WcRLkxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
in addition to the SKUs supported based on the GPU FMAX.

Add the necessary register configurations to the catalog and enable
support for it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 211 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   5 +
 5 files changed, 226 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 9007a0e82a59..7a5887b5ee47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1612,6 +1612,216 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
+static const uint32_t a840_pwrup_reglist_regs[] = {
+	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
+	REG_A7XX_SP_READ_SEL,
+	REG_A6XX_UCHE_MODE_CNTL,
+	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
+	REG_A8XX_UCHE_GBIF_GX_CONFIG,
+	REG_A8XX_UCHE_CCHE_MODE_CNTL,
+	REG_A8XX_UCHE_CCHE_CACHE_WAYS,
+	REG_A8XX_UCHE_CACHE_WAYS,
+	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
+	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
+	REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_UCHE_CCHE_TRAP_BASE,
+	REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
+	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
+	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
+	REG_A8XX_UCHE_HW_DBG_CNTL,
+	REG_A8XX_UCHE_WRITE_THRU_BASE,
+	REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
+	REG_A8XX_UCHE_TRAP_BASE,
+	REG_A8XX_UCHE_TRAP_BASE + 1,
+	REG_A8XX_UCHE_CLIENT_PF,
+	REG_A8XX_RB_CMP_NC_MODE_CNTL,
+	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
+	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
+	REG_A6XX_TPL1_NC_MODE_CNTL,
+	REG_A6XX_TPL1_DBG_ECO_CNTL,
+	REG_A6XX_TPL1_DBG_ECO_CNTL1,
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a840_pwrup_reglist);
+
+static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
+	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	/* Disable Dead Draw Merge scheme on RB-HLSQ */
+	{ REG_A6XX_RB_RBP_CNTL, BIT(5), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	/* Disable mode_switch optimization in UMAS */
+	{ REG_A6XX_SP_CHICKEN_BITS, BIT(26), BIT(PIPE_NONE) },
+	/* Disable LPAC large-LM mode */
+	{ REG_A8XX_SP_SS_CHICKEN_BITS_0, BIT(3), BIT(PIPE_NONE) },
+	/* Disable PS out of order retire */
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00c21800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	/* Disable SP2TP info attribute */
+	{ REG_A8XX_SP_CHICKEN_BITS_4, 0x00000002, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	/* Ignore HLSQ shared constant feedback from SP */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
+	/* Disable CS dead batch merge */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(24), BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(7), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
+	/* BIT(26): Disable final clamp for bicubic filtering */
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ },
+};
+
+static const u32 a840_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
+	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
+	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
+	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
+	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
+	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
+	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
+	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
+	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
+	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
+	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
+	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
+	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
+	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
+	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
+	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
+	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
+	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
+	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
+	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
+	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
+	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
+	A6XX_PROTECT_NORDWR(0x27882, 0x0009),
+	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
+};
+DECLARE_ADRENO_PROTECT(a840_protect, 15);
+
+static const struct adreno_info a8xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x44050a31),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80200_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80200_gmu.bin",
+			[ADRENO_FW_AQE] = "gen80200_aqe.fw",
+		},
+		.gmem = 18 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a840_protect,
+			.pwrup_reglist = &a840_pwrup_reglist,
+			.nonctxt_reglist = a840_nonctxt_regs,
+			.gmu_chipid = 0x8020100,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 19708 * SZ_1K,
+	}
+};
+
+DECLARE_ADRENO_GPULIST(a8xx);
+
 static inline __always_unused void __build_asserts(void)
 {
 	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
@@ -1619,4 +1829,5 @@ static inline __always_unused void __build_asserts(void)
 	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
 	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
 	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
+	BUILD_BUG_ON(a840_protect.count > a840_protect.count_max);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 396da035cbe8..cc969145f612 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -575,16 +575,22 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 
 static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	u32 bitmask = BIT(16);
 	int ret;
 	u32 val;
 
 	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
 		return;
 
+	if (adreno_is_a840(adreno_gpu))
+		bitmask = BIT(30);
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
 	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
-		val, val & (1 << 16), 100, 10000);
+		val, val & bitmask, 100, 10000);
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 7921b4a68937..031ca0e4b689 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -227,6 +227,7 @@ struct a7xx_cp_smmu_info {
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
 extern const struct adreno_gpu_funcs a7xx_gpu_funcs;
+extern const struct adreno_gpu_funcs a8xx_gpu_funcs;
 
 static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
 {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb4113612b82..554d746f115b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -34,6 +34,7 @@ extern const struct adreno_gpulist a4xx_gpulist;
 extern const struct adreno_gpulist a5xx_gpulist;
 extern const struct adreno_gpulist a6xx_gpulist;
 extern const struct adreno_gpulist a7xx_gpulist;
+extern const struct adreno_gpulist a8xx_gpulist;
 
 static const struct adreno_gpulist *gpulists[] = {
 	&a2xx_gpulist,
@@ -42,6 +43,7 @@ static const struct adreno_gpulist *gpulists[] = {
 	&a5xx_gpulist,
 	&a6xx_gpulist,
 	&a7xx_gpulist,
+	&a8xx_gpulist,
 };
 
 static const struct adreno_info *adreno_info(uint32_t chip_id)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4c0d9024d497..f53ceacb1419 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -569,6 +569,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
 	return gpu->info->family >= ADRENO_8XX_GEN1;
 }
 
+static inline int adreno_is_a840(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44050a31;
+}
+
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);

-- 
2.51.0

