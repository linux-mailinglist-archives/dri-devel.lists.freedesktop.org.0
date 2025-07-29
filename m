Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D9B14FC5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32B410E65D;
	Tue, 29 Jul 2025 14:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwE4C6zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AE610E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9Kjum006590
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bV9napCh09s
 i1kGi9emra2vbNQVuKZFFrQKfXkn3mks=; b=cwE4C6zi1myTmBMi/zSeVDwYByp
 cSRwkxUl1oaeXRMzSaMvqhpXkRVPK7kz8kHclbNaBDupQMhj61Qp0oUo8A7W21PY
 1v8lIH+9t+BoNHrFJR/vzp1RXA8Km3JIZF0uDZXWnS7jidqhfVTVp9/OCYuV3D7n
 9q3Vjb3ibCyjMjyJbJUDLUFXWBoFkbM7ib1uE/+WBkRVXLPohlGS/EC/Mtz3o8iF
 z2UwZevKN/aF0lmno08TbILqcfBtX+mFS76YbbTK1+jjYjpP0hz7VW1ItKHQWdQF
 CRHhHqA74hzgTv6sA/U+9Vdj+GAOKVLS/UZPWFU+q5MzzJa/9yPAQfi0SMA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr8pdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74d15d90cdbso4882504b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801067; x=1754405867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bV9napCh09si1kGi9emra2vbNQVuKZFFrQKfXkn3mks=;
 b=HgghO8tZG9pWMtyxAsu3KvVLfrvK/37FgJxjvOqdFXvMWAegD2Uz8UCScjwZszRVQU
 ilAsB+8okhYILw2kotDBb5VfUZECHwI5K3JZi/3N64Xeh1Zcs5mYQ+3nBbQCMRq8zY/w
 nOxP8PWxTxieVbunNQ16HKmWuWu9yjWwVGcoDU/saWc9YFX2Jst5a0qjJrWt+AmiF+BO
 ApwF/eZ4kXn3p+ZSXkvaoUQtiajaNBMkXBTMt3vOIyyxtXMaYLXzH0UdChvNZHnI4fg+
 wa4DIiCVHNSuvK40ZBJ4ZYglM9Pfqfqj9c0MC8yz/eSvqPQhzFEXbdWBj2vqEqquW+ZN
 YrBA==
X-Gm-Message-State: AOJu0YwDfcFlG8v1Xk9p8vZDF9jcfAZmo/fuXPKAwC0UwajGKJ0VbwRY
 MGnxpsYrNI1+6hORw/eYvzhadcg9KeXa6M/l13LLq/h+Py2+pl0sdcbn8ygpgOTLjXks6OAATPz
 xdtQCRgf2xBaE7tr/MSCgRaCKblirKOVXATxMtEDzXuhxR3pFMtk6oc4NrL9oK/wlM55KBRbNHx
 B+Ra8=
X-Gm-Gg: ASbGncuNXAVguZli7KFZDaGf03CpeXyAmPaJ23t1F7Fa9QUmZtHsduAor3tOJe51vlf
 1MVUkYSoTKxUQEWXLX+IX4g3ne4T4i2EES7Y1zOBp1+lZ6Ia7pBZDX+a2On/nP5pd71A1uHeo1F
 DzdopM8mp/Beus/KVH2m+5VV+loegFE7wwQ72fcKLaxJKfhTAylG7Ecm1HnAWcfxKj/DRQDp630
 s3wD12SdxKJp+XiXO4HAZjRdGNayrzcJDpCzxmELh6Hi50k0BbXSHq9wNxd73DwHAu75K/gJajN
 vjmw/eQo7A5HgSJriWOohDYKoLk1eJOoxFvg4Nfkgc0ey7CzXME=
X-Received: by 2002:a05:6a20:4322:b0:21f:d0f6:13ba with SMTP id
 adf61e73a8af0-23d6ffe8724mr25354392637.1.1753801066747; 
 Tue, 29 Jul 2025 07:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkVUdWVY1jgk5W7nGQYN/xwaTvSOwMDc1T4fWKqth8CqZfG64KwyTPkn95VrDifdcVac2c4Q==
X-Received: by 2002:a05:6a20:4322:b0:21f:d0f6:13ba with SMTP id
 adf61e73a8af0-23d6ffe8724mr25354282637.1.1753801065484; 
 Tue, 29 Jul 2025 07:57:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b420db5d93bsm1812782a12.27.2025.07.29.07.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 6/7] drm/msm: Fix debugbus snapshot
Date: Tue, 29 Jul 2025 07:57:23 -0700
Message-ID: <20250729145729.10905-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX2mcflXL0fD8E
 n9x35rZEu3zeHUNXO+w+mrkNQXuuDjboiIP7N9yAqAq9yFwxcymOv2VJcMF91XZdKbfJgGcSdWw
 ALp5oltNQKI3PM4ecAIvUcvkHLR6wyQaRebUup0Tysb7Aya5bC7HhdezzyyqRm+lrJCwxqZ3N53
 doCa6sJ5TiBMkgoY2brx/PVVoscwanT2qHgwGCpYm3B127xYOk0yCOwxnjgwEGlDhn4pzPsvKWG
 hkqQXDbrpmO1QDNb4XoMLsJAp4eYQbt7ZcnOMybl8+ywm0sAJt3V1xv2ya1RRxrOuJXISc9duha
 rnszEFETNiIn05Aek7Xsxyhnr83Mkb//hw+6JCAUPEhyQckAjwnoT5S6PdA1wBsrRJiEcjZm8r6
 eiidVMhfRSfufeRB3ZJvu7VfsB8aP2OK8Emuz7JTiOzF9L1QGKc7z9qE9vulaL6mqjUyw6M2
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6888e16c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: BY_cdgJRN2L7Ueot-7m9Fn2Se_R4M7pP
X-Proofpoint-ORIG-GUID: BY_cdgJRN2L7Ueot-7m9Fn2Se_R4M7pP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290114
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

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 8317e1107389..ab9b35e44778 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -430,8 +430,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1

