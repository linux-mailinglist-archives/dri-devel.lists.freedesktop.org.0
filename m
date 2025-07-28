Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E89B14354
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDFE10E59A;
	Mon, 28 Jul 2025 20:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxT81nkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2A10E595
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlL44018828
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=9HL2ElAARF0
 /fbev6G08+6TVwHe8Nc/ReEeD7pJWGHU=; b=gxT81nkXjsjgayio9XdonbnMeD7
 L2+voPgFoghEPofYHzvzSJ3hLfkheUpUwp6AJecqOkRU/RpXsAyZVmft8OLRHRnp
 OSDvwcAEzcHv/ElcJ3SY/f1Qbxxtxxa+xYZ4qM17D4MU5kHoyDqkRFBXqyE92xrg
 DENhi4NVNJJ8NBdEu/wuWBSRQKoO9FfrcFszkovsvso92EplmAaXrABkXkSeOgXn
 fWB0pahpyQocRVNF4ucOqG89ghmh/G9mxs8epGopELP7oQ97O6fGXcHyR6TM2+G8
 0SEehKRpk9xWcynZbgpAh4d1yU/CcuhsMleGjbACtCb06aQ1m8BJo5lihjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85wu32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313d346dc8dso8225437a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734866; x=1754339666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HL2ElAARF0/fbev6G08+6TVwHe8Nc/ReEeD7pJWGHU=;
 b=WTmgHTUN0xMEDwdb0p2QmYceqSIxGzEydPllSbfl4QxJv2G5oASx7KlfL2lxsjaY49
 2trztSNmVRW9K9u/Ybob/iPM9Jctcw3Tcy/ifcxxaIy8hciuGDSkNfWygYi0AkufR7pi
 jFMHlwUdhYnWbqSqN0EwKSmlvsGOdy276W0ZCPzUCl9v+RyJ7lM8rqjPHG+i+Rx7qddp
 TzSCzO49F+lfSQsQKb4q8EAyJ08KLBdOqUHngs6kPVPncFRvKiyYCUZp6ZLA8o8R2Np3
 mEGeRohjW1G7xabk0FPdLnJalnN/Hib9XFL7f6YElHBtnSoJAD88ETf56M3KYiKByRp+
 qN6Q==
X-Gm-Message-State: AOJu0YxLVqgNR026YXKaDCdadK6lts2K2iuFAdtNs9bo+ONrcvsS21Ro
 4Y57vRRaNvIzDnPQc0inGVFeZ5DQN5dUiVWHLAmN2mw3CrFK+lYV6mJuGqw/ZXvT7g17QtjuoQt
 O1EEXJZooxM9L+th5XbmWPLBK9i4rPhoIihLMPtw1Vyv7ObO+nW1zbN4qLu4jdV8cIIrIhMd7GF
 KgjLI=
X-Gm-Gg: ASbGncuMhn35quwG1wn7PotF38fo07taQS94yLKGUjXkgUHf84N+3SOnKsKa+GLs4Fe
 t+ie3jFTUZj4X4SWCUVLiHdU91BNi2Mut0DPAdIcrj64QWyTbvzmiezGgPVTeH63/NK2HKO7HnN
 aIXDdZkY6P+3N0Nj96sdlb5TXjtqI2zpe3dEr9hdyT0upTtFiDc2QK9GEPzB/RhrgAjBrbg5xiz
 OBjDlheOeIc7JkgRjiSEFm25q1JhKRBadb85k4CkbBcl2x+HJcP8X/vjpKyNNzIpEnOYQhXlGYr
 I4ZvLLyvq/EDuD9VDDGj04k1CM1pKQUnfWPTXo0y+oaGg3hECqA=
X-Received: by 2002:a17:90b:564f:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31e778582ffmr20598893a91.11.1753734866624; 
 Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEdJ9/dscUM4BqdHSg4PGTK5hxCSdAWWgSIKT1qLZOsCkP8tbWQs3GjcAPYzq2dmolO2Bt7g==
X-Received: by 2002:a17:90b:564f:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31e778582ffmr20598863a91.11.1753734866210; 
 Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e83545d23sm6505289a91.31.2025.07.28.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] drm/msm: Fix debugbus snapshot
Date: Mon, 28 Jul 2025 13:34:06 -0700
Message-ID: <20250728203412.22573-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0OSBTYWx0ZWRfX7kOLfb6YqpqB
 KgAV6iJ4xOfpmnkqVMawTdsfvxzSsSFTRKxNvN4ykbiFhQ12mv34zxcCN0TVoEILGGLB1wZUd2g
 gwvoifktiEI0Mvd/UgbO6Qiniy4zxnrQBHR+83lg5V0dR0nIhhO7JnfvUoY0LSalQeQOrx273lk
 O6O30JWhX3f91y8pSw3dCmP+qw3zE2QSCBzZEHwEobOl0acLPk3tAR0TcB9ziPJxiKEOkYaXM75
 n6Kts0I92Kxj/oEi9kUwBO9fQ3mSerdqybPCkKDP2Gnyzy70VPNCD3SQxoQu2/ya6dzQXRklI5X
 3zZ/6GCEYnHUTfo9pDZkFytOcLJ+6QiylEujrGbdTzI/PgeyoTtQZusBgWNvo82rxyTSyCNBRb/
 kCcMDuJFfftzPOma8rnKl7br+E1xki4ZGBSMvUEJ3FHKALxXR7uYeQJpkWc9CL2uIqLxqtAj
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6887ded3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: orJScCxpUvPguhouKb1CgKs3TXuq5l6U
X-Proofpoint-GUID: orJScCxpUvPguhouKb1CgKs3TXuq5l6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280149
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
index 33df12898902..4f0d8c0e6ac5 100644
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

