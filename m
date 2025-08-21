Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA11B30261
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 20:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0E10E294;
	Thu, 21 Aug 2025 18:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5m7PP76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47EF10E294
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI94ul003016
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b2aaGGi9vgh1ezkBA9wTuECFddorJT4shW0GuOItXNs=; b=F5m7PP76e/eiqROC
 vH9TlsXcBMa8M91NDemycmNCAihQsQLASWEUqCp2o0y2hohDkUdhxUQx2zKT4uqe
 kU8cjQB5PsR4nEvu6hQJAnmzhHLDNX8KG+PXeCoY2kbLfu13JzBr7U4/C7KynRHO
 9DDygMSCV0AuBdA0y04UTLCHFbKYlyxM6sUKzdo3zMQOLz43Lqzb/xS46JJY5pav
 5g4IJ3Wa2zmxuVgy3W5FISh/bzXr6vohl8DNmkaPLKstKXS67hXF36qCeqh17dCf
 8PwX/OYICINDfKkAZekxKU6I7jvLE/uXF3pwMPnc+eImw1OoDrsPqQpLFzAJGCbv
 twpptg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296j4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2ea91aa9so2246550b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802578; x=1756407378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2aaGGi9vgh1ezkBA9wTuECFddorJT4shW0GuOItXNs=;
 b=mDNZOo/E1/khQdwkgaK5uQI3WsDFW/myFl0HUr81GDDvsTf8oV5xw2u/aqlKlw+Ei5
 YHX90l9tyR/iADfx+Vq+4KcSLyACvFyiH0jLkcg36PANA7sUO2VFBlUav10fBQbcCGAO
 ACeCBydsnjOG+dgl4Ti31sjleadv3Tc2niP98bYiwjH9bbXTArTg4leN37+3kHZmqTSM
 VPfSkkTP3bqPc+o4UeReuD25xo5jHm3CuL+/Xy324EoYLm5kYzfzDvqFlChJhIddR9c/
 asnExtLD3n7pYCBsVjUePVVKCWTxH9Ykzb69TalJJ7RK6qD2FfhWAJNFvpCiRh8pgI3l
 oShg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZvIjUPC/yOKY3gfokfdjM8xBAOmSvLDRAeTSkuUo+ViNr1V8v4DcTeVdGOii3zBgZ/K9qEhN4qLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKt//kaIU3c3gGsKTvGaHRLbxL2koxjLqeB2FHL/RKmgndAlEX
 XMy3a+poczLTKfSl2FN3j6qYzdUhd47KOL2GcNkS62ytxi0Hj7jLpT4G8vWtQ5n9oLFuL8orbiw
 6FbuDzrRPdnDCeaZv+ovfofYCEaXjJRDY0Mtaj91POKv1GnYzQLkibIgTQlfHMcSGetwrZE0=
X-Gm-Gg: ASbGnctECoUY0r4UToiCiWJ2jxLqG0nQiJx68p3x60bBUDlgoxxgo9iElTK5xPp9Cte
 8H4Zoa3QYq+ORwGNhscpTj5IqF0NmjvczrWS+52KTd6bYBgNh5v2E+YsQ8/OEoAXkiL2nB3aHzz
 7pZ7dyG++nehTcmqIlLAGfuxc7a9CFWqypbHzScgwW3XiTbEfU91bXNvRnCgDet8QGItCye0aUB
 rofbox4l6jtjpsxRPNDFaUiE5Enq6zJIxGwcKIuV0WIRqii2xKwECHOS+Z0H3L+emxxWyiS3VE2
 Uj/1YGOkI+iryYBX+12+ol18lQf6XnbJ6PO1gVJHo7DPctwul20H+zHfBdIFvzj5
X-Received: by 2002:a05:6a20:a11e:b0:240:1bdb:bed2 with SMTP id
 adf61e73a8af0-24340e1c5e9mr249967637.32.1755802578304; 
 Thu, 21 Aug 2025 11:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/PvcztiKQ3+ysLQC44wdzL2nnd84bffnnBw7HXxvb3QajRBbw4ri6k6aeKp1I8dqHAddoNg==
X-Received: by 2002:a05:6a20:a11e:b0:240:1bdb:bed2 with SMTP id
 adf61e73a8af0-24340e1c5e9mr249926637.32.1755802577894; 
 Thu, 21 Aug 2025 11:56:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:26 +0530
Subject: [PATCH v4 1/6] drm/msm/adreno: Add speedbins for A663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=831;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dh5yRCCrqgo7ITPRxOGs22CFdqaavTKFG8dmxBRd41I=;
 b=/5kTakfykQ3AmdnUdoMQ4AB9+wrpS6Sg4icxX7Pn8G4w06qjqaLrqdMWxoFfR2c6gCf1yXHzU
 hcJfMlyo44VADh1a3HtlGxlKxaAgKW+a2+/QdkolNcZo5tFG1ddh8Ea
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: mxmCDiIbpfguo52TugOhWtjhad1eTV0E
X-Proofpoint-ORIG-GUID: mxmCDiIbpfguo52TugOhWtjhad1eTV0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy7u9Ci9Pe5Pp
 S1Nuvy89AVleLnHxYXF++7KYPC83A76QpggVq+/LN45LDtU4Lt447eljWPBvRlQmmNLIGNszq6d
 lalfD+zZ6eSOI1jQIfoBBcbauRxNPmD702T6J8YvKHi21n/TZTsR/e8mrTskUiAM9NuZJgOkH9M
 K0KucZjg6eazx72iuZYoIMxOgog+Z70G04d3QMOtYIaoW6y80JkdL6CZfoKLBCftp6q5rG9ReYA
 jAs3CgCUWi2zjhObPifUeNZ3g3jIMm8RPmzEv8AcOxqgXmlR/0xbaQ5qNYSAOGNQcbn+gWABkrc
 QWaz8QC5hwiDOfnWNDiG3+vtFL+U62L6DxmI8L3wn8cEyeAj4Eeo4x3N8yacAdfgdw40pRsvtsa
 Hz2WV9uBIOVHm60fLqpA5wXoOfi67Q==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a76bd3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=HtRe1b87dyxWHwbGPHEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Add speedbin mappings for A663 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..2b1c41f6cfeee912ba59f00c1beb4a43f0914796 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,

-- 
2.50.1

