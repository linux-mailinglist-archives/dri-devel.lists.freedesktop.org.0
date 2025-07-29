Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85FB14FB9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1E010E641;
	Tue, 29 Jul 2025 14:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiqUseA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582A210E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8p1EH023457
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0qBkf9JDSmf
 FwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=; b=IiqUseA7ZxZPmNVf5O8ZEZd1UjI
 snNXRY+1zeGSC0McZYDyiy3tCUSqCWZKN5mQJbLK7Gg89m1ZgWtPV7/p5wxlq/0M
 nUW2js4rF28MoR8IZJtfLwdB/+SxEZ89AZ+20387HNM3Kn+TtpUzc35HkkOFAIVs
 nH1ChZ1XwEWuKW3c5gGgc3o0iB4rr6pbROPIU/K4mEft3R6ED0X+eTIEyXzIyeF7
 VU+Nly8soc0ZPqljK5L8SNDaqD7O77bs1yKd8CMMaKukeSBWyMWe0LsrGAjgprF5
 tMmhAUIJX1songUbbQ2tXmdkk7UJ8uc48fv8Jjua/b88SH1Qvuium1K34Ig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qrfvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b31bc3128fcso8846771a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801060; x=1754405860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qBkf9JDSmfFwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=;
 b=b3blGa1GiCuQrH7xFNsVrIbviAVD0LNcPYpu1r7Ip1YaBkfEc8CDWclgsjmq9SxIzi
 Myw8BwF3aqd0DGbTRr7JhNVYZLYZdqv+9/mNU2ImdlbYkGPRP4qpQOeZEEEyPCToTbzW
 jEexkFc+rgdwa1QbGlUUwhukOWucP2NRf5mY6cUGvY+6hiI21HaRcKSK2L+RdKKqUFdR
 4ct7L/2t19+YMUAMTyqSVKb2OxEsa1Tb6KLRjyHq2NUOdGRQ5BhZyPxzDF1JmKQa4MDl
 yz2C+aT6EzKBYB15arou7rsgN+bVybJWLHu+vHl/MNddmkbifXWal4k4kz6ouXYiPp/q
 8V1Q==
X-Gm-Message-State: AOJu0YwB+CFUpBxdhY0ixJOHbY4vAgdnHJgeXvLigtY12HyO4/BPEMPa
 dQOfQGfo/KlqEeslKnJAFSFYOBQKs4mtnwTKniQAtc+X+z9juYDtB+jgIzWuTR2YbCTUSsg32Nl
 DwatYh6GbSiTNjyuvzFgJT7eDAVsaoxnP6FGTdIkQJHBbZnZOBw8JbDjplPI7mG+SkawUrg+VOQ
 nkx6Y=
X-Gm-Gg: ASbGncuj9pBPgUbL9DwgiNKhE3JiTMD7Rjk8Egr6Lsi6SdGnT/KnUGcpzO07RgqRhx+
 wiQDvkQhTX/vGyeyYekmmFaKvKb7Uj2ICKrHUuUjB3kB+HzafsdGMUoutXrdrI0HHATxf6jGzA2
 VHLW4Ftu8cRv/JD0emixXAJxmtQUzRjwhSmsteEE6RLj2rpTuyMkByU3Vh4QyytnHk3vahpu02F
 lVCe7ubHdD2I+07zMUlQaovfwnvGwFoLtkOAFRG1aG0KUjIQi2neGmJN/sq3sgeakKwfIPUuTH1
 QTBVI0CYhPPSYcRVk2nitjc48s8UXAVabBzkbJFOmyMtQTDk6Ao=
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id
 d9443c01a7336-24019531719mr133423295ad.2.1753801059452; 
 Tue, 29 Jul 2025 07:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4GKtP2sJEpJJxujTV2ZRkIuCi7nOh6GWilBcpkOTveTX8D8XdwMAVNRZGCDv3ocJrDEVyw==
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id
 d9443c01a7336-24019531719mr133422875ad.2.1753801058983; 
 Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24029726586sm48279835ad.19.2025.07.29.07.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
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
Subject: [PATCH v2 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Tue, 29 Jul 2025 07:57:18 -0700
Message-ID: <20250729145729.10905-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMyBTYWx0ZWRfX3Jw0YZX8V0s4
 D1yqPzG4zaN9TCZxH0vLsNuKcS8et9DkPrd/POdx1nBuDOrxGZXka13P7xPA69fAWIETCBEojiK
 TuLGgnScPweIzZdHabuhzdSHTZgTgO0UOrjmmUYvVZCPTHyaZyXMWYbTKb6K45MWCSpxenjU+6m
 SndsAFa0Qd/DELeuivFG9evNQR4RP2szggRBLzOwfB/Cu6Rq/Nz+Mm/vM/8Yu8ijWBTarRhTV/J
 tMbopgyBa3MzuwG+zp2JtNQWdclflozxg/e1GbgDJmzjK/WiyaPHQBxpRr/csN74B7zrbw4Jayr
 Nb5nnMMqD1L0deRklvhwodNkWyWKw276uZlFA6hg0lvxnFbqka2tqehJ0JQ2kqRyMz/nBRVzufV
 o/sTv6S6Sniq5x+lvb4wA6qQ0EJtHKjH2JXmeUwwbjL8bhiBwLufRLQQKTkYJ8BOu5YpX+S6
X-Proofpoint-ORIG-GUID: G1dQvhsOQfHm4kyQkMlM2Ajw8czxVA7W
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6888e164 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: G1dQvhsOQfHm4kyQkMlM2Ajw8czxVA7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290113
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

This is needed to properly interpret some of the sections.

v2: Fix missing \n

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index fe38ea9328d4..a35cec606d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1800,6 +1800,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d\n", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1877,6 +1878,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1

