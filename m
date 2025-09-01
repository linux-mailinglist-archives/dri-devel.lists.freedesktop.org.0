Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60021B3D8D0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 07:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D45610E314;
	Mon,  1 Sep 2025 05:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A30KZJ12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F7910E314
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 05:33:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VLvUvZ011187
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 05:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=PJrhcPrDxtA
 aLTpVBo5ImLLvyFEL/Po5FpTP77TaIGs=; b=A30KZJ12n1dWhu6mLT9rw9wgQcK
 gfs9yon9+AtQtNpcldkE85XmjQ8n2KDpnD+JxcS9B7WCuKAkdP5ltQKOtB2LDFJc
 hNJnchzLUbdI7/ovBr3kkBIiVWqB+pRJg+MQesWf16741dNPhW5COpvLiW+2fUDL
 diawTtiWSA2qjPl+2DO97qblct/7mWf/xDK/+7I3d8ahV2jTWMVhoi5ZZDO7i1Dp
 0e/URbQQqewFL3+TogHhqgLAajku5HjBo4q6w2/LiCrKor9WJBwpK1rpSqAuNMZA
 wDEian1iPbnGu7zoNPrp0kXe3Z4LR1fmpd+CoMXCegnviJJIEnzQZ4VZW+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuuc1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:33:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-248942647c5so54971365ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 22:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756704831; x=1757309631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJrhcPrDxtAaLTpVBo5ImLLvyFEL/Po5FpTP77TaIGs=;
 b=SVwIARAZs17n9fchjvE8Qy8P1PeVe29D7PhxW6TCpfysxsIPQH2gDYNVh75obfCXV2
 Xva+rpiuHuW653f9gy/NrNcGcGsuLBhO8QXpYB0BYuxATP2zMtWnugkMK//tZ4LgU0C8
 96BZyw8TJsBaQMggOW3cCsYDvIAZ4qNlTQoga5bcYmI9795nlCcfp/6pa0zielIsNnO7
 Polhz6EgHjhjoGR5hL202Va8HVgguxZPaONBE6erO0m9xsS2dR/cpdiKL+vnOTgrxbo2
 +ZIWPj9aKAQh8wla3wKNgkwmvFyPSnxSmmQpbfhpf/alJwCjpG9gGMvsAwwzZF2Urb1Y
 74qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTYkB23QAxzQSwwHisakqauk0aNeVrIOKxiLC/tP+YlkU/5M5/gA31p1L/zRqgc9T5riqGeQRJIDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgdOfeRed2cf8JZP/rIFSICqjvIT+09EPNdV1ZAmHJv6JB+EWN
 11WiP2k2zx6MD+iQ08/TdFjSExwYszxGbNovvGjsvVzXOzANriFUAA9pq3p9MzdfT4h3C+h7GmI
 XoERzOrn0ZYPpq+lAEc/zXsGsSFHegqYgQG7KUJv7nbHdWZrnwgzP4NfN2HeFxjGM6fWyczs=
X-Gm-Gg: ASbGnctj/prwXQmmHf5DZ3XXm6SQQN9cX0mMj1iy0BnDUrFG5B71JqGv5WRZFLKrQS9
 7MzWPiJa+vcr+ATsrafzCjHmYH3My5hn92vDcr4m4ucbVW0/j+X0CswTI2GUhjt83iToc5f3P+m
 Wzk0kMRR/lvM6/6I41GwWhfdQ9zioPqxYvsI2GsdQ5fFW7S81OqYjZpsLSjepc6yDRnEg+eZvN2
 7sfktEFj2qDH4tsyedHO3jGqaApZknS50NNL9M2XOjvNWbRagDfLCoxxxEI+Sn2ke7xnBchFWGe
 ZYX7n9BYqs8Q4MW7qEkzT7Vwk5HAwOSKAPYp3ap+KY7YftjHQiRbmFPNPSYcP/WO2vUa5Sm+
X-Received: by 2002:a17:902:ef43:b0:24a:9342:ecc3 with SMTP id
 d9443c01a7336-24a9342eedbmr70826205ad.14.1756704830908; 
 Sun, 31 Aug 2025 22:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhqpEk7q7A/DBRPo6CsBLfJOQqRNoGke7j4NG1VUXwsA9wGhUFFD0Jkvw/joCd7egv/h07Uw==
X-Received: by 2002:a17:902:ef43:b0:24a:9342:ecc3 with SMTP id
 d9443c01a7336-24a9342eedbmr70825845ad.14.1756704830377; 
 Sun, 31 Aug 2025 22:33:50 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24906589986sm90575215ad.111.2025.08.31.22.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 22:33:50 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1 3/3] misc: fastrpc: Add polling mode support for fastRPC
 driver
Date: Mon,  1 Sep 2025 11:03:36 +0530
Message-Id: <20250901053336.3939595-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXxqjB87wPyTWD
 HfwIMgLDu61GCuHqcQeXfTda0YJCq7kv8TOw3hYZy1VlqvKY6EDQsat44ZQ5G+IAhgZm/89PMGX
 mCHevx2Rhf84/EQjLYt23xrjhQX0Fr5wolpGaNr0IhESxSnfmmUlZtdB433RTE5KoWkHQ/ebJjK
 UtAdCA56hT/uOF62jo5ZLRG6Osb7WlCAPRdbvr5k7FIC+0EdG6pL4CcZX8B3jO4bcOEgJLTSLXe
 xTzxGg4I8S0KQPYazy8fvW7PKey4CABuQdo+x61shQzz1CdzjQqfUnvmpb/C10crM4a9DAnlEe7
 IPb2zNOLzYAkYLCXmNEH135RSkN2EbHm+BTK1vbIBFk82VwnxHVEpid9IQjviVTm/Zo+bp6x6TR
 71b1pYzw
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b53040 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MwYQ-C_c_HC-XfEYhDkA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: NIVd2wJo_myYROmMzVquhhgdyflXVWx9
X-Proofpoint-GUID: NIVd2wJo_myYROmMzVquhhgdyflXVWx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. This adds latency to overall fastrpc
call as CPU wakeup and scheduling latencies are included.  Adding a
polling mode support with which fastRPC driver will poll continuously
on a memory after sending a message to remote subsystem which will
eliminate CPU wakeup and scheduling latencies and reduce fastRPC
overhead.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 121 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 114 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 57e118de6e4a..939a3e3d29e2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,6 +39,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK (0xFF00)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
@@ -105,6 +108,20 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
+
+/* Polling mode timeout limit */
+#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
+
+/* Response types supported for RPC calls */
+enum fastrpc_response_flags {
+	/* normal job completion glink response */
+	NORMAL_RESPONSE = 0,
+	/* process updates poll memory instead of glink response */
+	POLL_MODE = 1,
+};
+
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -235,8 +252,14 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crc;
+	/* Poll memory that DSP updates */
+	u32 *poll;
 	u64 ctxid;
 	u64 msg_sz;
+	/* work done status flag */
+	bool is_work_done;
+	/* response flags from remote processor */
+	enum fastrpc_response_flags rsp_flags;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -891,7 +914,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -987,6 +1011,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->crc = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);
+	ctx->poll = (u32 *)(ctx->crc + FASTRPC_MAX_CRCLIST);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1155,6 +1181,83 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static inline u32 fastrpc_poll_op(void *p)
+{
+	struct fastrpc_invoke_ctx *ctx = p;
+
+	dma_rmb();
+	return READ_ONCE(*ctx->poll);
+}
+
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
+	 * or until another path marks the work done.
+	 */
+	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
+				       (val == FASTRPC_POLL_RESPONSE) ||
+				       ctx->is_work_done, 1,
+				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
+
+	if (!ret && val == FASTRPC_POLL_RESPONSE) {
+		ctx->is_work_done = true;
+		ctx->retval = 0;
+	}
+
+	if (ret == -ETIMEDOUT)
+		ret = -EIO;
+
+	return ret;
+}
+
+static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
+					    u32 kernel)
+{
+	int err = 0;
+
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
+	return err;
+}
+
+static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
+				       u32 kernel)
+{
+	int err;
+
+	do {
+		switch (ctx->rsp_flags) {
+		case NORMAL_RESPONSE:
+			err = fastrpc_wait_for_response(ctx, kernel);
+			if (err || ctx->is_work_done)
+				return err;
+			break;
+		case POLL_MODE:
+			err = poll_for_remote_response(ctx);
+			/* If polling timed out, move to normal response mode */
+			if (err)
+				ctx->rsp_flags = NORMAL_RESPONSE;
+			break;
+		default:
+			err = -EBADR;
+			dev_dbg(ctx->fl->sctx->dev,
+				"unsupported response type:0x%x\n", ctx->rsp_flags);
+			break;
+		}
+	} while (!ctx->is_work_done);
+
+	return err;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1190,16 +1293,19 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD)
+		ctx->rsp_flags = POLL_MODE;
 
+	err = fastrpc_wait_for_completion(ctx, kernel);
 	if (err)
 		goto bail;
 
+	if (!ctx->is_work_done) {
+		err = -ETIMEDOUT;
+		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
+			handle, sc);
+		goto bail;
+	}
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
 	/* populate all the output buffers with results */
@@ -2462,6 +2568,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 
 	ctx->retval = rsp->retval;
 	complete(&ctx->work);
+	ctx->is_work_done = true;
 
 	/*
 	 * The DMA buffer associated with the context cannot be freed in
-- 
2.34.1

