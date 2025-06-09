Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED56AD2585
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6A910E437;
	Mon,  9 Jun 2025 18:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="camXxapc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CCF10E430
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599tvLk027295
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wDKSo0B4Owx
 KLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=; b=camXxapca/C/5sga8qhF50Bxhjt
 SNi9SsTxyiRTTSRo4DiMOYHTmJIyznRy+nIm4KDSepuTlI9zI2V/Nv1SVFme4ppy
 xGz6ND1y8MjBFX+E/YWoQVeYv9Yi5jrzitoEX5XnxIzhA2bzI20f5oaJTpcNC9rK
 x3pdqu65IFoqIuQHNc9Dfmb7+el7sREE6HY/Fevb5kpdPwJCPmCqDcpK0g6M1EIu
 Lzbtj/pE5qH640sgzDdUEBAAKrudRZOEwJagqickt5+q4D0xvUALIPxwVtFBWkWq
 cx12eOXdsfHOly3DJmTLE1pBUmZj94gUou5T9GEEcRgQg5nxkI683CZ9GPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jepn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235e1d70d67so40944665ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493485; x=1750098285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDKSo0B4OwxKLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=;
 b=n7jR6gb8ZtRNr+MJinXScCWwumekHxcmeVoeFJmOk0RdJiqEqfFEfh9QOXnCwuPzwP
 qOLoNTH5oFK7lLPNwH+bjkNElAjueSmJk9rwuLeAyS9q//NkX6aE25KyMC+/mQ2dJKA1
 btG6GRdve996xihQWsbEgvifyNG/zWFgdPrWsIaVlb9JiOOOuwfX9SzoNagrt5UUwv+t
 i6Cz8r5AsLS5eJDNneF2PCivxrfpaFWoTWmBuHSvKBgrf6fo1ldWH8wgN/2lBYujP5Sh
 jpQfF+HVHQGf26cUMHQlPPgmW0UrSJWQ5bl0itwAGq6Ufo3cgmZ2o28aBp2XSbNPWKnU
 VzIQ==
X-Gm-Message-State: AOJu0Yxq4GhRDrPrvjZUw10eYkrHeN0vzfGwoJNhkENOayT+dOIKASI1
 sngOipT4Qv1oz/e0S9OXWqGMhggE7C3OFpbpi+J99wA8F5qjNHhEjnRKjJI8w6LSwTDgaCaoXoI
 k2PAbnje4HsErNSXIx0NJ86vQxWA8Es84Nd1Pg51E7JbZKxrUKioZAw0Fv1Bez1rCkwqGvNCXBQ
 7TQuM=
X-Gm-Gg: ASbGncu+JiimrpwbUadgIXrquVpARQKR9bNHlA1jggmfTl31V1PE/d0/KBriCfbzktg
 tXIYxXSFcEMdZRijdj5YGIJY//I3OP9AXggckw8ys+Fx9zjobzJKbpN0m6/F1YazLjL5j/X8qwI
 OHxvPpzF6Hfr7TW1XbJq2HODM6crGGXU2YVBB9k89Rjd06o6r+/u31tRbrE3Fzf6mtYtbC0HGWU
 gsYU3mR/L+gcohLaxbK/qgdXIhKugzENmWLDd7dn5TF8BNpfn8zVDCl1GkGkpqfc+bi7XsOmHm0
 +DQNj4tlHZzBl36K//reqw==
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id
 d9443c01a7336-23601cf68cemr203519895ad.2.1749493485361; 
 Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2xRWfunGxYuE2OM2dbnnHB5b46Yn438TRpEDL3+xKAueWZPA4Xlpunoydd121jW5MCcyDKQ==
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id
 d9443c01a7336-23601cf68cemr203519705ad.2.1749493484921; 
 Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fcea0sm58136435ad.103.2025.06.09.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 11:24:36 -0700
Message-ID: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=684726ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Ol_4jsEp3WXZOuo_yzjOYqOKp3uu3J-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEzOSBTYWx0ZWRfX5HaLLCNHGwmI
 qBgodIRmfO15U8+hf4ZKYtLL5Kh117YMelGD4pgHIlcDOamYhMSqXSKwoEmHF/9PUFlG6Tl7UnB
 4uKcQqHqqs2N/ve1Y5IbiL1p2z0TpYoW6q6hWJVSyXZNnaaQuJLEkaXPZDVb0gtGk9VwB+tESlO
 ifkpBB0ChwfXX0PxhZyeG4FJ+tvkyfz93CgYs5+Z/vTsGrly/L0ao0LE98jzQMZXyiWBYqVDj6p
 nuyrivOytz0agDebkxfSkx/BgaaTBmKnf8Fn1Fj961juzhwxHwF4MgvA+/Wy/vdXEiknDFV9KuV
 VwKoiRuBQYVm5UbcpOtqP4Zs8UxV7cImjXBpZe1UJ8gVLWamqqYSlDWk7vCX3bDSc+x/siNWhen
 xtUW+fYT8mX/uiY+FkGJGbmHSmXfHajXf+9m9NJFj6lWayPORxaEWyzcH7EWPKNeRF7CyPlK
X-Proofpoint-GUID: Ol_4jsEp3WXZOuo_yzjOYqOKp3uu3J-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090139
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

We are going to want to re-use this before the component is bound, when
we don't yet have the device pointer (but we do have the of node).

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..778e6ae7f137 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -133,9 +133,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return NULL;
 }
 
-static int find_chipid(struct device *dev, uint32_t *chipid)
+static int find_chipid(struct device_node *node, uint32_t *chipid)
 {
-	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
 
@@ -169,11 +168,12 @@ static int find_chipid(struct device *dev, uint32_t *chipid)
 	/* and if that fails, fall back to legacy "qcom,chipid" property: */
 	ret = of_property_read_u32(node, "qcom,chipid", chipid);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
+		DRM_ERROR("%pOF: could not parse qcom,chipid: %d\n",
+			  node, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%pOF: Using legacy qcom,chipid binding!\n", node);
 
 	return 0;
 }
@@ -187,7 +187,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	struct msm_gpu *gpu;
 	int ret;
 
-	ret = find_chipid(dev, &config.chip_id);
+	ret = find_chipid(dev->of_node, &config.chip_id);
 	if (ret)
 		return ret;
 
-- 
2.49.0

