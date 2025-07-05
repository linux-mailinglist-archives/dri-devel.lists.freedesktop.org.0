Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AFAFA091
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 16:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D5610E22C;
	Sat,  5 Jul 2025 14:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCbwx1Od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430710E228
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 14:52:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565EN1fj011007
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Q8N8EuMWRa1
 mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=; b=iCbwx1OdTY540JdijeWz6mmxNtN
 jcHGzufMgNE6sGGCM60+73X2CC5hB4a6n+mVQ6+mYuuvlMBiz2FIIWOUV/trq2ee
 UMff44up788BP/9Fy0qCuDj1vBt9XfVc7m0n9deNVhbfiOA/yIg02c60zEYg+UFT
 1gw/mHwX4iTa19joxGK3rdMAymAyIvH2bunT62OgXRwX5Q7P9EvI+qpC+eXw27Vf
 1gkUdMMhYJm7/xKconn3a1m1U3sFRSv5D9e/D3rcx7cZEu7LCUTOdHVBF0WeeYQK
 d2frJQa7ongKYNGoDsd64B5leBQe7HyseXZ1q8o4dxbEXvxwAO/VLaoPQNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk15b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 14:52:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748f3d4c7e7so1241568b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 07:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751727170; x=1752331970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8N8EuMWRa1mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=;
 b=MfXkIqkn0T0y6R3fMJS8qNyfP3TtPY76KJ/CJW85nCltgfkLwXShR8BTqrtoPXiGlZ
 AZRyfDBrgfIucRD4ReqXcom9w+WwEyM+p1T+OSbGi+WjXgriEzIv/1XNYdctUOdiXWPr
 Ot/VUHAs7RWxsGqwe8I8nRL2bfs042lw8X9a19nqmbLMjZWzz2HBTQEiMaREYcCX3ggO
 Dhf5GktuVcoC+HkuNlVoDUUrcXIAHn5Vk2CNcJZICgMUQ/R48D3noqbMqRb/7a+Hltbq
 WdU+JSyFqI/KfDYuJgtrcwYtKXrZJKdig1txC6Mf8lIIYqGV0LDYOjx5dXVTpkkbTtyg
 1lJA==
X-Gm-Message-State: AOJu0YzwvOp2N5s51/LMQ3yGf/mpuCJhYqmeIHtkYvIx0s2+8ENjl+UV
 /jpKUfgU8glzmNqeFkrAdysKvR1nGjPGQ9BY0Q+loH5JUod1RhHKjyvbmqty2Opah+2xND1GbrU
 BJQ6LXtKXDWIlbw2/vJHvorAhpJCI4T1XDyYNnzqbDUSUYcfIP/zjeNoPoE6OW3kWh2hF7EK9XU
 Cl1VU=
X-Gm-Gg: ASbGncuoCTGEVT+BKBSa8xrLnAlBv7OgxgXXf91V5mEZiAKlqgmS3a2SFQUXSZlPakh
 rFxv8F5y8oeasOQjf63dXUh/YQ8W67IfFIEhktpqYj1xCTxLNIhgvfvMiJr08gqNjzLnR7KmQXs
 rCwBefWIdyCexRSV3ej0AXzfScCtD8vzFKnglEvrFolT1YZoqXW4PJgNVyqXuZFF41rTAzw0p2g
 nesEBAx1K8ti8juEqEzuuIbqsbgrHLObgzIQXNjDS2mtRO6XFq33p3f7N7YQsHEEp/JOH6nb8ay
 UgpivnU/zy98iRR/8vBIBRoHV9o+rfg2aA==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-74ce65d7abamr9077985b3a.20.1751727169714; 
 Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl5WMxSoNRG+3cwNkna22DGFREi0kKhH38n/zY2ySFcmwRRf5Bf2PvyWedYjvXUGUcKiTh2A==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-74ce65d7abamr9077958b3a.20.1751727169338; 
 Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4180e47sm4753893b3a.103.2025.07.05.07.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only driver
Date: Sat,  5 Jul 2025 07:52:41 -0700
Message-ID: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX7AtM2TzcmC4V
 XIDGMa5MUEnlizhkaSV5zccSRi3rDASDdS5PCdDRWjeMk7r8sfu5F3KKCP04ipuoqRjV1tbSoln
 MP+Iz/jfwRnk1mULLXpUvK7uuJHwLfoopsPPsm617E3EUYm7MWpZZWfaRxGP3SHYg6rpnqyhFlx
 wz83vZc5PNTkqV3C1cioB193zp8r0bTd1HQa2tBd3/4sEHlu4JTZbLBcnzRB5pNTal9v7A2IzC2
 zDlhxaG1cc6ZQOPKK7K4cJiDP7D+JGtoqbp0yzqsDyaIQ28uWjEFNL9gMLbv3bdPLn63B4elE8I
 WAib/QuhgUeOjfXZkXv52ebnY4OR+wFSruTiFdgKEbyz6w1Xe8/1+v7aYaG+vmxkrVkPYUtpKqK
 SdDMpAj45KApkkiDBijJYIoXWHY0IuHMKu1qcoegJfWNbCHDe/0MmX65Nh6DsfyMCObJUXlG
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68693c42 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=2c09coKmtNN1XW7u8z0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: yU9GIAuf57r-glGOOmW5MAX_x3rhnyJE
X-Proofpoint-GUID: yU9GIAuf57r-glGOOmW5MAX_x3rhnyJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=906 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097
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

KMS-only drivers should only allocate dumb buffers.  The driver custom
ioctls are only meant for the usermode gpu driver (mesa), and not for
general consumption, so they don't make sense for standalone KMS
drivers.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5695de1bbae2..3c856c0ae855 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -864,8 +864,6 @@ static const struct drm_driver msm_kms_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
-	.ioctls             = msm_ioctls,
-	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
 	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",
-- 
2.50.0

