Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9EAED081
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998BF10E378;
	Sun, 29 Jun 2025 20:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWIAqm9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A1310E36F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TI0P3p023812
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hadax31kM4+
 sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=; b=dWIAqm9DjIy6I+bHiuy9AGa3Llt
 tljGI8vcWhDYeWznraeqP3dLKCFULD9GJTP6o1ZllXUvS3OVuMKD5+T0giGHaemg
 gToChcO0Ab0fMZ53tnUzbZs1t/h1NEP+I7PrSPmaqNYro+/+qkTPHs750QW7pRP1
 YlVvAmByiL/WTTnSOmLOuH/6J9Mb2z2jnRFOY0u/F6NvXxxHoAAjicUAD94CVaXH
 oeTZU5R2cCnbGSgIgm31zZ6ZspwQiejE+WnXxjhNzA4mDYQqIzELx1Mj9V8P7v2V
 hZXV5oa2RrWO2dNrHVemGlFb+s6QWOr863DAM5AVq6GX6XFsDX4c8Wpm4Ow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3138e64b3f1so1701467a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228206; x=1751833006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hadax31kM4+sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=;
 b=UNXhp9E9JpZoYkEiKCmb+VnW9psjVCAxUKzjtkMrS4luPOpbfx2kPPeihqnofW+31x
 ksGW7hreEVPlgcY4abad9RhqKACeuhr3zbS00naOT8p6Mg3VYkkIsCoKZURWeCs3BEE5
 mq++PWabHF17EzFG/ir8fGwFX2AXbtlxMc8Du1l6FDWANpA9gHEyqMPc31JTOn2qU19W
 tbd83iJQcpcBCnNw/hi7wMtXNzU4VxvYiBnaQ8FgOzFeemslHKDhYsubGd6uAeQcRE94
 IKh8gPYNpdLBc8Vs/AEQZ7uWZm6kXYKvru7CLCx/3/Me311rDdogbmSpgnN0nQBzGGfy
 N3DA==
X-Gm-Message-State: AOJu0Ywmw7DOLFUQ5Tp+DhhIwntX3WS4EFVkRxbJAGwBCwRQyq0aTDA/
 bzNLr3oqTDVxIBsjRg/t3FXlH4aG6UuBKqjejBltAJax3kQ7vFAodqHJP8VJn+8CznqplOvHhBC
 cfQ1fjmpORs5eCJEcyAZ4MA2mgY9zzhP8ijyyq4z7AGF1NrtqCX9+lahth9VpJGH+rjxyKHyHq4
 +N2IQ=
X-Gm-Gg: ASbGncvzhAzutRvvcAbbWUyogmkuPJyQ5dQlxAqN1HhmwMmJSWSK6ryFZL3Hejq4o7l
 7MtWBew20z2cmwESzIOpHv+C62EQnqEtBY6zTckLw+sAD837cv22od56HT4NMIT53ITixKFqj3M
 nJhDI1EVFvcW02GBTINdQAlWAml8dHqOgaAe0NrUg3Pz28Jeg7lq8+D24LYVYZNJXkb/Go0FWww
 6KnXHcx15RJI6Znvp97BL4kTl91eEqSZQMAQ9DZG8sU6J/10E2zZqyOBtOHVzKK/HXwUUkLuHVJ
 CNGeb5h0xiMO1qkZGydZonNtAy4171qWuw==
X-Received: by 2002:a17:90b:4b0d:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-318c910a238mr15355605a91.10.1751228206363; 
 Sun, 29 Jun 2025 13:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr+QQ/LPBQuRXSDVeP1yQmlH8FH0SOjYXUqYKGHVd3ZKkPXg2/4lxBBqn444PNPlZLSOChww==
X-Received: by 2002:a17:90b:4b0d:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-318c910a238mr15355587a91.10.1751228205899; 
 Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f0dsm12695469a91.3.2025.06.29.13.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 20/42] drm/msm: Drop queued submits on lastclose()
Date: Sun, 29 Jun 2025 13:13:03 -0700
Message-ID: <20250629201530.25775-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f2f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Ga_jwTeKHRAxic0Mvtu1Hu2bhxpPYwst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX2pBTYkarZHfL
 Zs3tgJO8Fm/jfCvvIm4dAawgLTxB1fD4RWPDhDzSleGAgoOp1HNVeN4KC8D3IdLdZ6qAq4lJ8ce
 3fUSlZIwe8u+6zti7ENk3udwTlpH69quBhLN1WxczKL2CBKhoQP88U5cEZwKZLCSdvypISP+Gvp
 tZtAxnK/Usq7AUWKLmW0v89r4mcJwhcfLV9PWMR7jtiZMJKMVOXvou33uzzSjMwRaES8jQ24Hlk
 BqHfjwFSGaqqKqcW+HrGbwK3uKH3mxZZtdcThzqDYNkpDHWo0b0rESk6KY3XA77Tsext5wnO2QE
 ShUqBq9Qr1OCdFwnVYeLkaxANuY+rQZpoaDdBDRWJfhc7eK8kDQ2lq4gzNQlgkrvwiOx3pHroe8
 GHjG8v57CtZDTJLStIIDkDk/eQlH24HcsFEAxHcUKEZaCyABzFIy0M0A0pH4RNhRe7uTWASP
X-Proofpoint-GUID: Ga_jwTeKHRAxic0Mvtu1Hu2bhxpPYwst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 488fdf02aee9..c4b0a38276fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -254,6 +254,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 231577656fae..a35e1c7bbcdd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -356,6 +356,14 @@ struct msm_context {
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
index 552b8da9e5f7..b2f612e5dc79 100644
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
2.50.0

