Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A83B18702
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107A510E8E1;
	Fri,  1 Aug 2025 18:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmOizVTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4BC10E8E7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfrHF002804
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3TY7JajUGvg
 SQAFX3ZoHDjZ0l2tg+rnsIJNFhfiXB5I=; b=GmOizVTFpFkXh8LhaF8YLtKApVo
 4TfIABwqGfxA73oKsdDx699Dvb1VgoTq9XgleS0+7GOMI88g7klEjKW8R6oBwWDT
 55jd3WJDZZusaPyam3JgmK3W31YzkcVQgUwk/SIF2moOs3CGyMlLWioiMpWK23EU
 7WveXX9E6ihf+CijRH9+Lm6F4c6ox9piNFH+QY37X5XcVLNjpfRaNGmel4+JLlaO
 pD66DNl5cMAFZCqmWGexPnyG8v4MFfYKuyclH1U1lazq002YjO7neXWwmrCufRN0
 kuAkunvG9fZjnRVa8SR/dxub3UFl9blVg97QGG/eDd4RPFgjKakAesguVVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrs286-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31edd69d754so1175533a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071225; x=1754676025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TY7JajUGvgSQAFX3ZoHDjZ0l2tg+rnsIJNFhfiXB5I=;
 b=T79w0a0Uh8z8uHqBe1pYCvKmvTy/dUlyO2XK+nluwSf6bxBOU2IxgDko7GXfEhA6gK
 sYq+3FFxadETx8T5fzzix3Mw/uiGtUB1qh5MH93wDM72lYf9BTZBKZ8XEPXXBW0uIpbN
 rbDQh80EOmaoPG1F70XEGutwaN4KjOEChQ54JE8ZupkQOiMpTUnwSFFXQp31+wtppMJj
 7uMICy5wtR6t4XpyDXqoOz8+kPopXHeAQtCGyLJt858Aqpe6pmKTsO/euonyrtqEgmcP
 vGpnwpOeOmpNvFrxUHl6BefxCbLBSVjjhKnr6TUawEa9fuKUz+qowmxijMhmLdlEjXAu
 DybA==
X-Gm-Message-State: AOJu0Ywi67OhFKVCs+5W8fCV502hRs0YAwHIt/Vl3c6+ROwfAQKUXoC8
 FpAxHC/kpwuyHou37YHEginlwxwYY8m0ipPaQ4HmgdtKj6BzFhIK81fwgyix9IF7y7KtpEngmOm
 Uu9GUoV0ZmPMZYzurenCkC63/WKelsCGviIen7jirmZ+KRla7/R0c166JNTDQgdF/tQ8xWC5ZE1
 pMo0s=
X-Gm-Gg: ASbGncsNXgu08h18sMQQS8mJddQZl19QAAZ46tdoIWxmQuSYTt8/YFWxvRC4eMUvreb
 Xq0fRoRxfPLVjBe1IO0s+vNLqzpU3dHIiaKvCpELnNihOmQTeJBhyTDYdGbGTKeUc3s3Ro1FJ/h
 PKoIyYT7m2PyH0edt5vr8ABGGCHAh7oZSW39eA9LdeADT9BckZV2/ikINlNZ4/+tig/wLUvXarO
 GNznY6RyLUofOTPilVrf2ehFiTvX0MxKvNO/wsblHjdq91URui+DTO8FhTt78GDUKWq+HBQr9Ti
 3IxwqqazgXk9wq0fIjti2x04QWFTGhL8U60hcG8m/XwQhQZgGTw=
X-Received: by 2002:a17:90b:2246:b0:320:fe6d:860a with SMTP id
 98e67ed59e1d1-3211629d087mr935839a91.18.1754071224697; 
 Fri, 01 Aug 2025 11:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX5MtZHVrDtRtNwnDqwNS5CiFJn1C83bZxhXU0qOaY2Ye0o4TdoGfd9YmU32DzzAJKMfk9aQ==
X-Received: by 2002:a17:90b:2246:b0:320:fe6d:860a with SMTP id
 98e67ed59e1d1-3211629d087mr935769a91.18.1754071224045; 
 Fri, 01 Aug 2025 11:00:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63c25f0dsm8105815a91.0.2025.08.01.11.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:23 -0700 (PDT)
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
Subject: [PATCH v3 6/7] drm/msm: Fix debugbus snapshot
Date: Fri,  1 Aug 2025 11:00:03 -0700
Message-ID: <20250801180009.345662-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688d00ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: o-z1CR1PNtCXhMg-AJmoHE2-83n8gKMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX9H67s6xj8XBp
 UsRw6xiHL4MTkAIhKT8hSDeV+N7kLZI8TCEOQb/xAp3FFnd8LuUCAAApJpY+btAzJofFwZmurkK
 utB/Uhu8kj2KwdrxDuzx+RTUNYhBBlYIIrqog2qnB0rGzN1tgUScQ5rbtlXkW9xKjE92Dz7YqJj
 lFCdxxJ+nWFdPPPmW/5W0xzIhVRCTT03HqZFVwL9crroaCrLxpJPr0SnGhiLyNkaTxOMdBvNVw2
 AprXXrPJBDJexC/uP8BpeW8LpURg2z9yItwtKWESKmU/hOADaUVxZbcPRL7pQC/k+E5FYpK2sSL
 gH7tH7JQU+/nDB0ENSxDQhDSVm/5jSRR4bIbA8z7gwAaaW221SjbhGPpEcIJNkes33c6V8TTSEJ
 TUrHa8ZQXwptGmNDaEyxDdMsRBkiD4U4UIKxO0PFZDyNVuLjUv+7VKvZxYlFEjQRKrWL42H9
X-Proofpoint-ORIG-GUID: o-z1CR1PNtCXhMg-AJmoHE2-83n8gKMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138
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
index 2c7a52fb0b9b..4c7f3c642f6a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -438,8 +438,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
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

