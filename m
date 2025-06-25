Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF688AE8D69
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A464210E7DD;
	Wed, 25 Jun 2025 18:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RluCK2o2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2E10E7DE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCHZg9031297
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ffdUUPweRzg
 vpO3v9DoMvCSyNHDyemApNNm03T9kbrM=; b=RluCK2o2vLtJJnpmimfjCEGt4SF
 HpILbEhqSZg6S/LvsfJMADHiwSNZZENM9MvuHNZazy6iMNs7iw4fIa8JD/f4V0W2
 7uoCjdAKHMiMRwDMi2drF8RujBPRvNw0EtDyYjZXTWjmQrTjU7Z/0mjrHFk5xKfU
 NB/B9bLQzHL6paGWjExlP3zcfoj0tNJ46UOELvBllGmxgVcE4PwJssJpyUYWUyGz
 O7x8harkijKoAbYiGiEQFMuLU4bmT03mL/K9TNulNvEpRJ0I9JS4U/qjJAOZdz8L
 xQNzh/R+/qss+e7xIWuZNTf/FFEGZ1y4eEUXQ/bZYkQg37Jhsa2aiPwHRVw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmtk0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7377139d8b1so194566b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877933; x=1751482733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffdUUPweRzgvpO3v9DoMvCSyNHDyemApNNm03T9kbrM=;
 b=hDH+7phaRVoOQm1V131V026BsB98byth0hT8T+HmvKGll869UXIR5+dmBLen6fh8Jj
 nxZIGTy38cCmuqjqSuw149sYBdThmx/xpRpH+f9Dt1aBRbJR4cd8Mj+ud7gExYD8mbbi
 bRxyI9RsHN3n7apMC/o1RuyeaGkr4jXOcgvv4ay128FsEgDwsRQ02XwdLTvxhSzltWMq
 pYIhZ779Kvn8nPVYDQuX5DQZUbo1rtWrRRmInTEUgv5Z+t1X5BkFQQCNGGSQsHlkV47j
 rHXaRAcIoSUCdOXL8+ZaJFZznanlGDWlrYJIowTeNNoIuxJBC2oYIiACkanh+MLn+9Xd
 dCtA==
X-Gm-Message-State: AOJu0Yx7p+xmfAfRZ2jdBjUyteZ7D13nVD+P9YF+3Xa7e/dTswYbbXJB
 umOT2faBpbZYs3rtZeXJRvhOzP54uZBjsjpCL2i7dl3gWXls7CXze1klI4iDsdvB9ZoY2YeO7yJ
 PJXIpzI/ULYacIM8IGWEaRGwZIQZ609PBmHzAUeGeJ3QGe5vDPDnEVAc5q7y/QbiXeDla91Q9uz
 4QCvY=
X-Gm-Gg: ASbGncv4BYtRBIe8qtiv5XgwgWHoN5XdI2qcmrx+WWzysDExqUmLT5C+A+dQJAsPTav
 Ie3oqgkrMk5adYiBtCeQb84MA5fhSoPQDs87bKhXVmTr6VuTEl59eAUzQgUVloVS/PsEfK5hGyw
 +9NpU+DLPCPcrVNOyfuSWRPMGsbfp2Uk4TEXVMeUaMzUi3FPwyGjtHkKpJCZp4Utn9ICEEBFf15
 wynCdIDy29ZiXS9u+J87C9d4p5fJw1pkCOKdjMwIZMy5L1M2OR7ZFt78uupshl/RFGZgu5jB1Ik
 QZd962rNWk3YFoAIUSvS5z81BsS8A4yg
X-Received: by 2002:a05:6a20:3d85:b0:220:193b:913 with SMTP id
 adf61e73a8af0-2207f33227bmr8106690637.34.1750877932955; 
 Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR0kw5bnLdP6IBPTLphpUWcdTRJzruak++T3jSrLRaNiq8qRkCEOilIj6df1ql7bzZsWpPBQ==
X-Received: by 2002:a05:6a20:3d85:b0:220:193b:913 with SMTP id
 adf61e73a8af0-2207f33227bmr8106655637.34.1750877932520; 
 Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8851b26sm4805260b3a.122.2025.06.25.11.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 20/42] drm/msm: Drop queued submits on lastclose()
Date: Wed, 25 Jun 2025 11:47:13 -0700
Message-ID: <20250625184918.124608-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -MXGHSz1CoFbTFJDy7x7XBbaKGxS0EV2
X-Proofpoint-ORIG-GUID: -MXGHSz1CoFbTFJDy7x7XBbaKGxS0EV2
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c46ee cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXylQnVQmXiP8/
 gv06NOytYhxRn/hc/q9GOsdIpWCCsdAwFvQGxz7sVmDnxxVpWQAeHpG/hpJiQALUXSYAUX43wWb
 EHi87py35zHJf4B7RLZPTxkaJK9UKSNxo7oN94qDYlcLPnva75amhGPYUsWVA4c3BsncS8Bcqh9
 Za3aguKNMcoM+VlJAOFzaOAoIk/WxuWk7Ekwd1bC6tt5rCaL/6GEgreKvjKpmL5qHCd9eNsTQAF
 4JiS2kUPbsw/BVR+Iy9zb9lCmt/dO6X8m5vE7HF9TzzOkNYQt3uSGFujYwXohmwVF9kxmhnzKaW
 e99YX3W96CGeTyXY8D9d2Xt/dl7wGWt3tKE/h0xdV+Vt8Im9zot9D5+2d0P82cTbDXMRbOZHPTL
 lqiDgBorUf2YJKS+LWX3ced/CrUCx9nz9kqcHoj09Q8k1A2Ur9m65hiu1PjA4v6cwRp0lwXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bbf8503f6bb5..b8bcd5d9690d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.49.0

