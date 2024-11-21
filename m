Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B49D4928
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7151710E8AB;
	Thu, 21 Nov 2024 08:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Qh1A3DZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03810E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 08:47:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJpaCW005741;
 Thu, 21 Nov 2024 08:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4AvMX6aXFHbqw/g7dZS4/asi8D2KEz0bf+nG6W9+gv0=; b=Qh1A3DZSqw9E9Eap
 je26cNK0UwuTLJsQ4luvi+EZ++YfdI01xRDWbJ+rtSfKhr5By1aebF25U5S4PSmv
 LaLAjNErlMKzSEvcpiQUwUQ/Py73dBGb5mmPBV11scpDzSEBmuu/TSGoZXoypQW2
 2s8bWdWo2Elb37asAQFSsxwY0vI8lvW0EZw3ibbxqWjvJ1aNeyC5+rD23WXDxyKQ
 Msmzlq0ZjBbvzkWs7P/dDh5N4Sx5/kelmjTpNohy+CWsMS+ChbNSlzXLh1VQ98U8
 v+9C48j3u5YAc3dw3bTSi/64wetIwUyRZ5B8jt7mh9Ohc8h9CS16twLwrzNQACIz
 mXcQMg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y80nrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 08:47:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL8lXJD012526
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 08:47:33 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 00:47:29 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v4 2/2] misc: fastrpc: Rename tgid and pid to client_id
Date: Thu, 21 Nov 2024 14:17:13 +0530
Message-ID: <20241121084713.2599904-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
References: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JIzm28MtTpBheIxjUmQtAJghv7yaW2fZ
X-Proofpoint-GUID: JIzm28MtTpBheIxjUmQtAJghv7yaW2fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210067
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

The information passed as request tgid and pid is actually the
client id of the process. This client id is used as an
identifier by DSP to identify the DSP PD corresponding to the
process. Currently process tgid is getting passed as the
identifier which is getting replaced by a custom client id.
Rename the data which uses this client id.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 48 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 08f223c95c33..93826de9c191 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -140,14 +140,14 @@ struct fastrpc_mmap_rsp_msg {
 };
 
 struct fastrpc_mmap_req_msg {
-	s32 pgid;
+	s32 client_id;
 	u32 flags;
 	u64 vaddr;
 	s32 num;
 };
 
 struct fastrpc_mem_map_req_msg {
-	s32 pgid;
+	s32 client_id;
 	s32 fd;
 	s32 offset;
 	u32 flags;
@@ -157,20 +157,20 @@ struct fastrpc_mem_map_req_msg {
 };
 
 struct fastrpc_munmap_req_msg {
-	s32 pgid;
+	s32 client_id;
 	u64 vaddr;
 	u64 size;
 };
 
 struct fastrpc_mem_unmap_req_msg {
-	s32 pgid;
+	s32 client_id;
 	s32 fd;
 	u64 vaddrin;
 	u64 len;
 };
 
 struct fastrpc_msg {
-	int pid;		/* process group id */
+	int client_id;		/* process client id */
 	int tid;		/* thread id */
 	u64 ctx;		/* invoke caller context */
 	u32 handle;	/* handle to invoke */
@@ -235,7 +235,7 @@ struct fastrpc_invoke_ctx {
 	int nbufs;
 	int retval;
 	int pid;
-	int tgid;
+	int client_id;
 	u32 sc;
 	u32 *crc;
 	u64 ctxid;
@@ -615,7 +615,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
-	ctx->tgid = user->client_id;
+	ctx->client_id = user->client_id;
 	ctx->cctx = cctx;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
@@ -1116,11 +1116,11 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	int ret;
 
 	cctx = fl->cctx;
-	msg->pid = fl->client_id;
+	msg->client_id = fl->client_id;
 	msg->tid = current->pid;
 
 	if (kernel)
-		msg->pid = 0;
+		msg->client_id = 0;
 
 	msg->ctx = ctx->ctxid | fl->pd;
 	msg->handle = handle;
@@ -1245,7 +1245,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	int err;
 	bool scm_done = false;
 	struct {
-		int pgid;
+		int client_id;
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
@@ -1294,7 +1294,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		}
 	}
 
-	inbuf.pgid = fl->client_id;
+	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
@@ -1364,7 +1364,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	int memlen;
 	int err;
 	struct {
-		int pgid;
+		int client_id;
 		u32 namelen;
 		u32 filelen;
 		u32 pageslen;
@@ -1396,7 +1396,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	inbuf.pgid = fl->client_id;
+	inbuf.client_id = fl->client_id;
 	inbuf.namelen = strlen(current->comm) + 1;
 	inbuf.filelen = init.filelen;
 	inbuf.pageslen = 1;
@@ -1504,12 +1504,12 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
 static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = 0;
+	int client_id = 0;
 	u32 sc;
 
-	tgid = fl->client_id;
-	args[0].ptr = (u64)(uintptr_t) &tgid;
-	args[0].length = sizeof(tgid);
+	client_id = fl->client_id;
+	args[0].ptr = (u64)(uintptr_t) &client_id;
+	args[0].length = sizeof(client_id);
 	args[0].fd = -1;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
 
@@ -1649,11 +1649,11 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = fl->client_id;
+	int client_id = fl->client_id;
 	u32 sc;
 
-	args[0].ptr = (u64)(uintptr_t) &tgid;
-	args[0].length = sizeof(tgid);
+	args[0].ptr = (u64)(uintptr_t) &client_id;
+	args[0].length = sizeof(client_id);
 	args[0].fd = -1;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
 	fl->pd = pd;
@@ -1805,7 +1805,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	int err;
 	u32 sc;
 
-	req_msg.pgid = fl->client_id;
+	req_msg.client_id = fl->client_id;
 	req_msg.size = buf->size;
 	req_msg.vaddr = buf->raddr;
 
@@ -1891,7 +1891,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->client_id;
+	req_msg.client_id = fl->client_id;
 	req_msg.flags = req.flags;
 	req_msg.vaddr = req.vaddrin;
 	req_msg.num = sizeof(pages);
@@ -1980,7 +1980,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 		return -EINVAL;
 	}
 
-	req_msg.pgid = fl->client_id;
+	req_msg.client_id = fl->client_id;
 	req_msg.len = map->len;
 	req_msg.vaddrin = map->raddr;
 	req_msg.fd = map->fd;
@@ -2033,7 +2033,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->client_id;
+	req_msg.client_id = fl->client_id;
 	req_msg.fd = req.fd;
 	req_msg.offset = req.offset;
 	req_msg.vaddrin = req.vaddrin;
-- 
2.34.1

