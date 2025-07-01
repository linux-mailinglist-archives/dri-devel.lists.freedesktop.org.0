Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F5CAEFF82
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5833E10E5C7;
	Tue,  1 Jul 2025 16:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmIPjjF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A6010E5C9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:21:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A7WvQ025200
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 16:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0+w5ZpBtBKx9XMObDCi7zYvJA0s3GIDL4r9tOJGZS2k=; b=QmIPjjF8scfL9ukU
 mGB22UBepB2VRVfze+b/rcLsoVx2UMIoo6pNo54kyO1ThGCogQ4rGT2hghx7w81b
 R9luX4qyoDMldq/4QLo4slv60zJ9NF9U0Ozy4ppw3yqCGVWQ4HIawnrKyIyyTDXE
 4cuQSm1RKbPaVUO4xvFAWIui2rgF+c3yKNfIP4A9kKmHgCxKw+/MwlMl2RlA5DQc
 zsgnfKB3Bscxph81kuX2XbgPo0/m2whk6tae0mjb+/eiAxcoG+crCKI8I97qR+lO
 w+hwbVozghzlbWZ7/z/hpCukpypfrTTZZBMIEsU5TdwGek3Q3COCrUjjp6+/JMKh
 FI9MAg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64ptjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 16:21:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2fa1a84566so2583586a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 09:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386867; x=1751991667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+w5ZpBtBKx9XMObDCi7zYvJA0s3GIDL4r9tOJGZS2k=;
 b=TNbxj7+0d5syUu5RyqyW+4xMGkkfHBzIPVdEuFDVxHGQYPzzxPCeHdIwHvU7/j7fdl
 3zF6+b/5kG42Ex2+YEQuhnLFWOPaI+LTGXshMS4Rm/EBkDgCNBCw1W5qJ6sZvi6k8gWU
 wKofZB5NRoXBaZoBlKsU5WdRJmATQyKiqt1n3gzlmDhZafgRv9aoMfUhS1nBDb45MTtd
 ph5472hnMvxH11TaF9y4g6KfN5IG4qIOeBke+mHeWopB2VnJQg9NobQtpCqG4eKFwMr3
 MXwYm7Gshqjgu+VY7Hoq/XrPoLtHpHza1Wux91ms/47SEC++ZkLpuNdrWL+LfThnWlWD
 JrpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuTyoveytCGKVVYCOW1m6AVqzy6U3VCtpP9HdJuFcEBxKJGKuhWk5oz0FTKNbuNrfPnwylyKr2PCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytHxmJjRLVIUzN5RuihehEHgqpCtj0D09hdJbBprjkrHo6TW2p
 bA2LeIhcs6FnexKC+tLvZG9zfq79jWFRaLZsiy0pgxEr0LjDhCphQMm3mla6asD22EMa35M/eEY
 fHwWR7SGWHrSnTq5uoftm4/YajiBOMFeEd9fBPeNtmia9fA6+Y5HiWkV3gWf6SfdAXjMGHubteU
 xhhsw=
X-Gm-Gg: ASbGncvMCo/IWGWFs2fBRZ6Jr1Upc+qpXUqqhaTgsgQ8jqsGMQz7WYGUriWEDDHHhGR
 d/IaPjBUen5gEWq09IRoqR0XMW5533tT5aq7t9kxm7MfdjogYitEF+kXk2DLpXwlKVFHZ+Kp1G3
 owbh8GJlxAJgdklyB/CfGWR0Ss4x9HYWEqFCnedXCN7cugY7+LgXRdBJJZUtF9SwRoL6ftZf2+y
 YH/PcikTmFaxQpG0r3oHy//LwgEo1UjT6+hUp3s/p7Ol8ZfhOfzYmMofRBznmb0wVmczoVzKiaw
 cvOuuYoDPAXRJDir2Q8jdwF2srK6RvXsTF1c9QzU7WMtXOE=
X-Received: by 2002:a05:6a20:2588:b0:1f5:9208:3ad6 with SMTP id
 adf61e73a8af0-220a18337a1mr30392725637.41.1751386867010; 
 Tue, 01 Jul 2025 09:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdDDA7VRG+NDWgAWPFIw88bukUBqM/DPB+EDNZhxmferppqBDMOlnEwSYgc6UqRL52udBz1g==
X-Received: by 2002:a05:6a20:2588:b0:1f5:9208:3ad6 with SMTP id
 adf61e73a8af0-220a18337a1mr30392659637.41.1751386866521; 
 Tue, 01 Jul 2025 09:21:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:21:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 01 Jul 2025 21:50:44 +0530
Subject: [PATCH v2 1/3] drm/msm/adreno: Add speedbin support for X1-85
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-speedbin-b4-v2-1-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=929;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XFr0UsCyCOcjko1cdlmNH6cXzSCtwggWcwGF5puvtvU=;
 b=gJ6pDb5Kn9ocK1b4VzRIL1H8oWfTVEUJc9L95LY3O/MAF7x4Ci2ZmVPs4eB2uMPKeUYNs9xCW
 iljqWpYNTajCtBJ1dpzplJyl6f+VNaEjMIm52m+wF+Cybsq6is50ods
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68640af4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gUrcRKAgYtiFYHip7zAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfXzE41W9Vi2dFm
 k0kZYDourVNfdSRw3M1FGf78e0R5rlHr4+4rI5QcKVbZxGy5pa7G6cn2UzTK46ZFocwmcEmtRCX
 fwGEIcuqG19Vv3LUbPAJGGsmUjaw/FgWMZ3snbAAIEKMQO20zh6E0Zr/PlnhpYS7+lZYe/wKiir
 Wloxb+v2/6PxvqifBzBMytPennMwuUj4r/SKVV6tCUYRWy0n7KBi9RhfVABhHwfqdmFriMvu+ph
 eoG5beS+3H2rQYe3s9Sdpkj+DQmUG3JeDdvYxtlueO5/kqnZUYdaANUEPJ55Ve6Z/zOufFSMUCM
 Aw9bKrwOhKnU3QNDx6IbiTPRfhWr8BlcahCY0wyboHeD/W7leIdeNwFKketPJIj4dPtqOow91HY
 oGKeOTLhdpX92IR0PN2kLScgpdKj/GUtZrXu2noAFJcKkplbcrdkljbWAKUDglwdTGYjFocp
X-Proofpoint-GUID: BR-IbD7kMLrbk85pIEf3jlKjdWvz3jPy
X-Proofpoint-ORIG-GUID: BR-IbD7kMLrbk85pIEf3jlKjdWvz3jPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=956
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010110
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

Add the speedbin table to the X1-85's entry in the catalogue to
enable SKU detection.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7748f92919b883bbcea839a61158ab52e6e4e79d..2fdaaf4372d381c351df92b8dcb21da0fcd02776 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1442,6 +1442,13 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 		},
 		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,	0 },
+			{ 59,	1 },
+			{ 7,	2 },
+			{ 232,	3 },
+			{ 146,	4 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.48.1

