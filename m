Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44DB186FE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D2810E8E4;
	Fri,  1 Aug 2025 18:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzLsOGhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E246910E313
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Hg4Mg030980
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JAyYn1wklNQ
 c4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=; b=dzLsOGhnul4nZ5I7+cQsdMKEAmV
 gy5K7ViT1KebwdmpHhsypAx1PONroiKyBavoudtKCdQNorSg+gMmGFdpq6cesjML
 fKvxyLVeGv+cA1HYQ9yuw2ssO5F9097RZP276dHkgy+ulIsuQGqP9L6AXqwTbhgx
 Y7ForzOSJnf6lfeY1aTzNP84TvmYbjGXEcfDstVT7uqja8L+fpK5l4xCq/la9GX+
 axyTjm3WGDRuO4H3+ZC23Yh+ocAwpA4vJslTLl25v6TqYwDPuc/dS1zvtpPz2k28
 lRgFBPeTnk1BVFNpEnJSWwnsds5omm1fcBaEeGgEmpkrPrzwjnWs2B/QtsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2vm6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23fe984fe57so15766695ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071220; x=1754676020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAyYn1wklNQc4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=;
 b=MEfynA/cDX8MYgRVznMgLhFMuapLnv1CmjTkjuWt0jp0g84OPOUmEExTyN/H9OD7oA
 zt2HReEiaoo0Yo7bKJ1qg4/6Wo6xJT1/6UrWlE1Lp4YpQVT2wkfDQdxEoczEWIo1klXY
 9Qq7e8SfPvoiK0Skw2Nx43K0wR4qKOY+yoFu4pGNKonGqu1nrerAdLqF8+iONuqniXWN
 90lGW/8DtHSYmdDRW9BDgvC4vfFsHd6PJpdGKyzwaCQP2T52PdREfmMfmuMbYucQ376o
 OFBkR3RlPxB/pFeOQ2UQUz2/N5k9m0qsy1Q0vpo5JSYNVU3Irwv+0C3rcRFYgpewXfOK
 Tf8w==
X-Gm-Message-State: AOJu0YysJAorX/qWwI1NrF4HQJfMOa9BtT2eTotMpKGyZGYeesFL7397
 lVAA3x+hPqSzEut671Lo9NlKNEiPKBFX1kZlcJKatP50OCoehXu3MeiV/hLcot4D0fkJcRfQYU7
 gb8H5Y2r+ILUlZLEu3JcmAxAx/x1OGk//m1oAwoK8R7K2TdiZTDo+ldMGdVwDQ4mmF7OQZ68VoA
 6qcfM=
X-Gm-Gg: ASbGnctFjlKUjtI/fmPS7DPhwYQfOOyiYGbruSsPU3N5Sy5jo/R7zo/CM+RKxFrRhyh
 rEAllgboKVcwKln07Z68x6L0ZqWCaN+nWSDUMIzLm7xcG5FyKpB/eYfBuX/mZyLH18/MyAge46E
 EZooyqO83Icc6rH9Aj7zJtxRazLWUA2X5DuavDdk6NvZp0/NOfVMmB0IcIs6/bTxx56p52xgXzM
 o/COhHfzAHovdtkZmaVXs/exggXJHcpZ8yNRw5VsHbMMuqcVf9XMYssViclQrnO1PdDuHf81m9I
 by/6YiDXUmRcdVUf0j57qelCcf4MkJtFz3To3Pg2066ZWGkqoSw=
X-Received: by 2002:a17:903:110c:b0:235:f078:4746 with SMTP id
 d9443c01a7336-24247030c77mr4913485ad.42.1754071218960; 
 Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq88m/8XtM65tFOPvwPzp0RMN6Lo0LKYxRrxCCtaSzhjaCvj19hJqOoPXnJBjwX5k93B39mA==
X-Received: by 2002:a17:903:110c:b0:235:f078:4746 with SMTP id
 d9443c01a7336-24247030c77mr4912905ad.42.1754071218424; 
 Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b43dsm48563275ad.136.2025.08.01.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
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
Subject: [PATCH v3 3/7] drm/msm: Fix order of selector programming in cluster
 snapshot
Date: Fri,  1 Aug 2025 11:00:00 -0700
Message-ID: <20250801180009.345662-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7TPyRAXp8LXk-hmulbTe453qUgSRiUUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfXwYwaNmuqGqxn
 ztSGCz+0IIUKpysahnNifqhyiK+PH3XROIt8qhGpwQNuUmtOm5+74tLfbg5Qr/sBhlSIyE3pYc1
 gARsY3yrYXA2n52ZboZJ44WS5tw+32HhhaDGqsv7l0WFIVmyUQshV9umCO9s+joQakLeDv6jh1w
 SFhS+6Qzg4+JAWKBR8HYpufwGMys3cKt5Y6SGuvDPdVcCLeozlP70+344b1J0aO4uEC5z5NOz9a
 ML333fokQIh15t8FAQ3hE6mXI0F5kj4kDvyGjT2BrDiW/AIZ/LrMTdkcymJ6jjNBIoRbzzLQvfm
 F4pQLiiOXPbY/O97Kx586rk+pmFHz3lLZ0NPwKHhKgUQrK+G5AqlgjA+sxvEh4kiQFwEazr0cF4
 voBFxAyyLCMGwxhXAlv+3Goa6J6G18aiteX32mcAW7VmR8eDloazoUKL+1KZcJ3SWNpWwYj/
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688d00b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7TPyRAXp8LXk-hmulbTe453qUgSRiUUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010138
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

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a35cec606d59..5204b28fd7f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1

