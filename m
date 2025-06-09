Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEDDAD24A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B5210E3EF;
	Mon,  9 Jun 2025 17:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFmIYHui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F6F10E410
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599LItZ029821
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
 M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=DFmIYHuiFIm2j/q4DYDF2lOaPG8
 vjM9yH/w87pXIYloXTsVEv6twpb0jWJTThbJ5MI5E0qF62wKbc9U7Fp0TDtjRWLc
 wCEEtwHQRq6vpOJx6QP1AmbYLKWCnG9k2IvJ4TuLCy8ZhifcLUjKNQxj7pVJwbYP
 4Yegyxruw4YrAtOdmVGWabtnkku3OHKY891DhWSrI44pGjQovrwAIGino3cb8xWB
 DDhYSlIbQB0U9CXFbyd3t0/nctrNrKfXZ5voRuN1SyCpELXsjGJ2PDqh8lu2tJDP
 9X+JdtTE1vu6G8XfCMatQ9gTnWduivB6yBJFxKfvtkLVbqz+joXoCu5Heuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11xw6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2358de17665so42895165ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488688; x=1750093488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
 b=o1qC2knAz1Cz+vQ0w9FL5mO6EJQ92AEe0ARVFP+l3+4nWPVu05t5zGl/VMHQ7i0Rl8
 lKGepffRBvOjkwvJ1MpfXEpypHpGig3Zq3bdEVl1/RaIMNxj+hQkZvJD0FrjzbgEsdz5
 361zRCb9xy5KAAB6mEMMB9OsdD2SYCH2tDUF6pOK0NG8OUOy8uuQDQUNISxMPnzIFQB5
 Y2ICl7CiNM6bNkAfqv56czUP8IQmXs0ZUbnxODacIT8qINOZ41x+IMWXpywHVhzscrBq
 w38ieEuaIIiVmzNo5u9Kisy9O2YdZOLOf8TM05CoW+6rkDaFbNp4kY5PEeMrHJYTYAwl
 rJ2A==
X-Gm-Message-State: AOJu0YxCYE8DBHjQzPI4czxAWxUMPi8AvQtyAZGJCZ2BJTmni2ISWxZO
 AKuc6uCoZMSgA+Vb3CbKyfTOEXYoQAK5JAaN0RGN6CVsjpAX6pUQx1PLsVAHM8vDmY320XHSZvt
 A3N5zBBTbXeKcmo0YIiDvpf58vO8dVQdateIG4B1RS8cdlKPAri4sYtftL4W4ggB6TMnZDE+4lm
 NrRNQ=
X-Gm-Gg: ASbGnct4g8hgOF11TPITFwx/zEqLIZPA3/RqSXxU3rkjQ4sgbUKrHrLeu11Q0uiiR5h
 /IhXwRpaDx3FQdXigKP4oZUyZDBX4R1Q64NgXCxRQGRf6RQ7ZzH24Wy7mnxnC9qq11Rv52KwcO0
 74+xaXCHOJ7qCO2hgsRB5xaeVj1OQ/fRIz28rdAv5lZQJy65u4nRBab1JibzSCL0yzIGhZmuRHV
 lW4h+hqhgNQL1jM3BG9iFuiHKMPPN7dzCABmpiKFIlBO7spycAAjNW1rnn0az2y2a7N82YPTMEt
 9xlPQ1nIT4v18vFkCnFqjg==
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id
 d9443c01a7336-23601dcf348mr200552545ad.48.1749488688248; 
 Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Cia52Pz9TP+vPUc/qxfkyKQnpKKCfw3Z7/NYylirl2PJBjN0RgEB3Shvrl9SsiqWE2h2gg==
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id
 d9443c01a7336-23601dcf348mr200552095ad.48.1749488687819; 
 Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236035069f3sm56821685ad.231.2025.06.09.10.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 10:04:34 -0700
Message-ID: <20250609170438.20793-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5A2L11DlmPoUn-j5BW-QvPl_sZKKPsfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX+JBcL54mD0Q4
 eBrxcqYMW2sgaGuXKXIOMldwmQt1XaevShYljfXsgJLmVdqHeeONurFMF7bCKb6zqLnr7VMRnaG
 hJJt8vF7GDbheEmIP+aZ8+wsUCaqqC2f27AHCbTdqpCHcu9YuF9AjdnwZk7efukJhon/MtY5swU
 LmEmOCz52wyqFj1bv2DgZX4M5IRAVcPT45NLx5CkGNiOMi4wZZhA8GDsQpjGtvplJ+R4Z9Y7NJZ
 CceOvrhdcfZk4OBbcbgzKB/j6b82KZ5r3S1AqWQYOTEQFcNjKh+XivxeyV8x/JQYu18P1jmGL9L
 q8HDnX2GmENBXDAVjafrKYMtFGZZBSQmYH0l0TpX2BBufUp814EFLtT+/rcik1/DXZZvBKTm/cK
 tqQcoNCZLZryKidAnIAhBZyW29TSVv9pViSNAhHERBoodGcoqA5dkQ8sKoBFRGtHHSTH5Rm3
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68471431 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5A2L11DlmPoUn-j5BW-QvPl_sZKKPsfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128
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

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0

