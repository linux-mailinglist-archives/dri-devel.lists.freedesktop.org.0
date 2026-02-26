Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH00CaZioGk0jAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:11:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9EE1A84BE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7C10E97B;
	Thu, 26 Feb 2026 15:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/fiImOP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QS2SdZ17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103210E061
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:11:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAL5Qv3747796
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=J0r3jYLWEnp/BWKHaJsNvzTVG8pjtsxStmS
 gUqG+I9k=; b=a/fiImOPkyv4qUrGb1smtEAsLLo920aD8vqm9O6JL8y8s9gF9qq
 gh6ERprUhPKzfiKi+iXcn2cI8Ev20UVKMaPvRl2fk4s6l/fDV3T0kookGGcA6W12
 PKCoSgOx7sFetxd1402PyE0yoO4OoxwyphxG/GvQ8qFZaqT4ZmddETvkshg/91+v
 DiWTOO9+XkAL3Y1H+DQ+XPj9GT7RONaOjNl4mwSQr1Og1994tZIZ3E6sE8qVZSiL
 79iONeUdkobm6WnErZpGGo/rcnNHoCpKxziHFjJgEA8ZPz8GS4JEq+7xfBfSrX09
 19gRRucGswDVYMdulFt4fWqB7RfxIgogp4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559kncv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:11:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-35641c14663so926314a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772118687; x=1772723487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J0r3jYLWEnp/BWKHaJsNvzTVG8pjtsxStmSgUqG+I9k=;
 b=QS2SdZ17xI2/X6zYI6RcxG6FCvBsplhSo3LArx2VrhniYWlNTXJ0D5zxUIsXRpAd/9
 oRHVCPc7ZflUBA1rvB0IUyVx4L25cZLSPM5/lWZSUpk96x2MqeL0rsz3JRtRL95+xmol
 nyvcbhF2TX5acLn4CqR5YK+hKker5I1adeLaGYt5zin7So2vPg46IXR9eDfwrfPMbBX4
 VUSl8gwndRlmszXPoFWwFiqMKpNwEQ00rFb1wc9t84GiIPeYufeFt7gCcHn1+bLyjgk7
 KzDbhlAoL7JjK3u4lDVhkDtsvMD4qiMbNj0jUDngkpizNqJ6ji+ELlRx4erEvvrTTr9h
 7tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772118687; x=1772723487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0r3jYLWEnp/BWKHaJsNvzTVG8pjtsxStmSgUqG+I9k=;
 b=f5ZztLWFH6aCzqYwGaVVkGgfN6P4Um4KOsspl8tqgXk+SVLmfH6jfhjN3n88bKwh2v
 DGgBTiLx+KL5EaYfw8ZkfAjUdL9QhRzalI0DWw3dkQm2O6Bv6qjVc8vL+aCm3Ssg8LdQ
 iArU8jUzwK4e1F3jBemnqxNh85eKAnTqvTZ7ldvFbMLkddLWHJlFrLMIz2SzGvaoGXEj
 p4UMwvpnTJitnj3Wp+SE4k1+BexNQPb5X7E/Vwzl48QiKj/A2xyMRj+Jc6YKOzwmpKWw
 AquMIy87cG+y7xWadUBLOFl0wfzQdjzQBjbyUiFz2hy+VCGrzX8GB3I55W3Mr5KxUohi
 sOMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtzJx+xjj3HJxWNXrp7kXdq0LmjXCIKIvvx1OPyZCCR7UiUUaFWiyBzsbuszXICF7qPaPTjGDirVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTQGelfVbK3OsGvZw0sI8Gqj5sLhlOXNEgtZ1hd8O96EayeQBz
 W5d6BAxvWmFaYW6CqgzmpqNjdasKeCvvZFm0FrZM6r2aGr2W7dF4UxUmzTlWwwrk4irJII8sCzA
 WeEcfJg7F5gRVUYaiNlxn6PgEpbnqHXjAux4UHMvg6uxwSvOGcKJUdTM5id80/hagLUNA4uiINi
 4gaqk=
X-Gm-Gg: ATEYQzxktWlnm1MwDYwZpEkwzlAgEhr/GJBshRQC7w0O+GtcHxqpuoaN+nLODSoi2UZ
 ydwdqRTqRheYRkbOQKjLIxwIFVn3TFPfAn+cEQD1tlRVIcSTvtlmpfs0F/vriMGDjIzAdbzfj+g
 U2ntIP+bMGrDxkzFfmp2OKPRT67LE9nLDveRhx3tDp6zuT4cFnLYvQuqJE4ktgf0EklY9QXtnpM
 3ihQ4s7QdUG3exr79mGIZ4usFdcECvHwwFz7J7zBDBYhR2siklRoGR+v98p3G/DSYviGS6YSkUf
 Sv+m1KqN7BQwYFcy91ad0mgqRLheq5+dZX8SZ4nR+t0GeDFcxgRwkA9oFrtTPTqqr1qCHAmOhi7
 jdsknpYDPT5gClnYrLUwIvoPyhWhCoYqtCAg73Kg+QxAN
X-Received: by 2002:a17:90a:d645:b0:354:a57c:65dd with SMTP id
 98e67ed59e1d1-358ae8c2efcmr18642456a91.24.1772118687405; 
 Thu, 26 Feb 2026 07:11:27 -0800 (PST)
X-Received: by 2002:a17:90a:d645:b0:354:a57c:65dd with SMTP id
 98e67ed59e1d1-358ae8c2efcmr18642420a91.24.1772118686829; 
 Thu, 26 Feb 2026 07:11:26 -0800 (PST)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359037af167sm6218250a91.15.2026.02.26.07.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 07:11:26 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user
 structure
Date: Thu, 26 Feb 2026 20:41:21 +0530
Message-Id: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vrUVVW5uB6MP7mbi8p3CQ-_cNb26_-bo
X-Proofpoint-GUID: vrUVVW5uB6MP7mbi8p3CQ-_cNb26_-bo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzNyBTYWx0ZWRfX+Wkz7AyZMS+V
 u28jVA6rx7oJi1S8obZXWVhX1/KVZkCbh5AMaA+CXUKtY6oGnbQ3PPoeuOIe5wmupVXt9XvH6LW
 J++YGXVsoSM8fdTo+9bMfYFG6rbnokAbt4vK+Hlpvzhrn6C7b6hhPYgwMwszmQp6te4wEVDjci1
 uY49PWgXgjLTgPjBt8RTleKS+GyRm9+s4XORpN58LPcVtFnvdqspNiXSckRl7/pvk7Cb9UeIqwV
 LNrCPVFB5ghiDE6elPqCHPFIUHs1bLuBkYDXx3e3wF6I3IIHkp3BmWRUSEdbJ1mMHxqfQuzabGH
 y3TXL4DswW580MbIhG9hccZ/Jzm2iFwwGCaSJRX3jwjbAN/26gjIsHH4ExTSigzF+nEZe0ZlDmF
 ZHDwjLGSCtMis7En1eZnI/emcUM5TVnkV+U9Xp6As5cxNd9Im31WKhkrbn2TKA8e38T34umoXzU
 dCWHS2HDTYZxkPTM8Lw==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a062a0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ixtUXsZW3yA3m9atQOEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260137
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anandu.e@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6D9EE1A84BE
X-Rspamd-Action: no action

Add reference counting using kref to the fastrpc_user structure to
prevent use-after-free issues when contexts are freed from workqueue
after device release.

The issue occurs when fastrpc_device_release() frees the user structure
while invoke contexts are still pending in the workqueue. When the
workqueue later calls fastrpc_context_free(), it attempts to access
buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:

  pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
  lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
  ...
  fastrpc_context_free+0xa8/0x1b0 [fastrpc]
  fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
  process_one_work+0x180/0x450
  worker_thread+0x26c/0x388

Implement proper reference counting to fix this:
- Initialize kref in fastrpc_device_open()
- Take a reference in fastrpc_context_alloc() for each context
- Release the reference in fastrpc_context_free() when context is freed
- Release the initial reference in fastrpc_device_release()

This ensures the user structure remains valid as long as there are
contexts holding references to it, preventing the race condition.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47356a5d5804..3ababcf327d7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -310,6 +310,8 @@ struct fastrpc_user {
 	spinlock_t lock;
 	/* lock for allocations */
 	struct mutex mutex;
+	/* Reference count */
+	struct kref refcount;
 };
 
 /* Extract SMMU PA from consolidated IOVA */
@@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
 	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
 }
 
+static void fastrpc_user_free(struct kref *ref)
+{
+	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
+
+	fastrpc_channel_ctx_put(fl->cctx);
+	mutex_destroy(&fl->mutex);
+	kfree(fl);
+}
+
+static void fastrpc_user_get(struct fastrpc_user *fl)
+{
+	kref_get(&fl->refcount);
+}
+
+static void fastrpc_user_put(struct fastrpc_user *fl)
+{
+	kref_put(&fl->refcount, fastrpc_user_free);
+}
+
 static void fastrpc_context_free(struct kref *ref)
 {
 	struct fastrpc_invoke_ctx *ctx;
 	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_user *fl;
 	unsigned long flags;
 	int i;
 
 	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
 	cctx = ctx->cctx;
+	fl = ctx->fl;
 
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
@@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
 	kfree(ctx->olaps);
 	kfree(ctx);
 
+	/* Release the reference taken in fastrpc_context_alloc() */
+	fastrpc_user_put(fl);
 	fastrpc_channel_ctx_put(cctx);
 }
 
@@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	/* Released in fastrpc_context_put() */
 	fastrpc_channel_ctx_get(cctx);
+	/* Take a reference to user, released in fastrpc_context_free() */
+	fastrpc_user_get(user);
 
 	ctx->sc = sc;
 	ctx->retval = -1;
@@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	spin_lock(&user->lock);
 	list_del(&ctx->node);
 	spin_unlock(&user->lock);
+	fastrpc_user_put(user);
 	fastrpc_channel_ctx_put(cctx);
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
@@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	}
 
 	fastrpc_session_free(cctx, fl->sctx);
-	fastrpc_channel_ctx_put(cctx);
-
-	mutex_destroy(&fl->mutex);
-	kfree(fl);
 	file->private_data = NULL;
+	/* Release the reference taken in fastrpc_device_open */
+	fastrpc_user_put(fl);
 
 	return 0;
 }
@@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_irqsave(&cctx->lock, flags);
 	list_add_tail(&fl->user, &cctx->users);
 	spin_unlock_irqrestore(&cctx->lock, flags);
+	kref_init(&fl->refcount);
 
 	return 0;
 }
-- 
2.34.1

