Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBFDC3922B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 06:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506010E805;
	Thu,  6 Nov 2025 05:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJr7EOIz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHe4FIsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFE210E805
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 05:08:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A655drs3217553
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 05:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
 VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=aJr7EOIzgAvUY+6EuNLCcqqUO0k
 0hOlOF/cmOdgrgwuiCmS0jCQ3FhRZjj+AU+o5mkoWwveuEJedOTwCcA9BjqhWVDX
 byTOws9ZVIZ1tjY/RRAHmf/VlR8cDRe1pEL2nEXPoRIL/jeT7YS2novXlpA53ptN
 N+5zGWLY70WUDUpQdfYYm46HYt24eX+bUzqyxf052D32iO/GrSL+o+ASz5Zz8Nc1
 jLZBhl8E32ytWuvWkr0lAB0/Aa2kCt6XrI7svpNpqT6T5MkrxTD3TtrXUQDNaf8G
 3mlaZtey7Bbso0yDC+WM7fYGjWWSandu54UQPS3aewVunhPllXy/Xoy6/Gw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8n7pg09y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 05:08:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7aff2f41d18so664226b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 21:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762405728; x=1763010528;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=FHe4FIsBPDRfZ1H6h36xEAMfTpxvPyXodj2ZJwFV4XdQJyuG1jVTIUe9LXvRQRIUZP
 w5SFu1YtdDHFQrMeGuyrS/Hqw+Rh01aySqi+xVzD6bbgHrKMTO8oLJjv25tQd9Am5XNt
 HrYZ1rzBhbs2xVV+GGfjG65ulZPYAaZtKxPW+J9jQ7avpR0KY1UGtSE1SjC52m0yGPp/
 WIklXBRx+sqSJgwxfqS0n6WBZTPZVC9LZVo/72EQj7i20TKXtHwWoyd7g3bpKJgtV1k7
 pWkIOGNF81JdPrgbo6SwUols4ZCuRWNh7YmiJL9aZKCVe7hOYL4qSlu1fWcwamY6XHTH
 i0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762405728; x=1763010528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=H2ysI6VVBFTxj5rcXOnamOc/e2/yDHxQ2m+Ptx4lTa6NHx8yOU9Rz1TMI1+y2UxZK4
 h1vePcbB1fR6ARKpJAbnRQQyyHCMv3eHLeT0HYER8onPgjuBVuxktRE1RUX8P55f0ZGS
 tIktL/MVLKMNDMJFEiWgKJxdVcpHzyXZvbxSywn3n6S5SCizLgk8nAjHTq61UiiKHyGW
 /j4ulcQy12LV8k+P2J4iLphC5kGKTN+J19ehs1zsY64imLNuzkkc8aLkH06XSpgsgIB5
 p6iGuX7Cmb3sSxfUYBsJR18N6e8oe8NLTEUPkRxUT0ej/4o2W9QcAUfCqzxWSBAHoP0v
 DFcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhbaYQNqbeJDu4IsRV+CMnVNHL4YrLu5DcIGv5D0pKHs/GOwix0qVRTLHlkzvaxnb87dpqs+CWDi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnTq6QtYRC0jEzb3dTWX5YOfnHT05r9b/h9xP/TAieJtpJSwop
 AgRs47VOWIwXgdqTu4X0n4DjrR0g9OwTx6HIfPzBRPEb8bQrfnrXqCAiaxtxuzxhZCA1OnXul1H
 6bFz4zkMSNxrepbO9tl1iPsHnWmvT4R5MOFx3KL33ihfKAZtgucj2nzxJtemBoIG81hUbU6M=
X-Gm-Gg: ASbGncvtuqenOJiR/jrH1Z1/WnAtBb6vSolkDK+a7INDYnD9RIU5LuLTKv8GwFXo2Cd
 NpqPluorbKrVVgScZqPqyq2ye1Q9Z3nEZwDBbBLgBNVrbVgPh+Gql8StMKzd0cLUTXaU1rJBAWJ
 YYeoAwWs4+LRRj+k40TNP24hpdjE9ms3AN4dIY/FoUAl66fCCsjUN2cNEjQ3jZEgaq65u8AmmIW
 zdXq7ANep3ru0JRe75zUYhNs76lBQz2bpiWxCK7Kovt3Ngm8JhCFRMfcSv275aNhuSbjGlmb/WS
 hxagmEuFKhHPsddooyZCxlbX60pPyQLyPt31p2d0YOZyswqYxt/yeNLLMh50fIlYuGrlKWrZANc
 tFQuKBVtIfsAwn6xiES8GX1o5CxNjsHg=
X-Received: by 2002:a05:6a20:4329:b0:2e5:655c:7f93 with SMTP id
 adf61e73a8af0-34f866ffcddmr8038726637.33.1762405727760; 
 Wed, 05 Nov 2025 21:08:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9x/9PQXFxurYjajKLl4M0E+BvzwI4iNtYKbcQnSyyKegfSdBjBGyv0hbXFx4kxfKFSUcyZQ==
X-Received: by 2002:a05:6a20:4329:b0:2e5:655c:7f93 with SMTP id
 adf61e73a8af0-34f866ffcddmr8038656637.33.1762405726586; 
 Wed, 05 Nov 2025 21:08:46 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7af7fd5238csm1185862b3a.17.2025.11.05.21.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 21:08:46 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 1/3] misc: fastrpc: Move fdlist to invoke context structure
Date: Thu,  6 Nov 2025 10:38:37 +0530
Message-Id: <20251106050839.3091707-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DTbnwDCM82krgVT47-Wk3NIZiAGf9wW-
X-Proofpoint-GUID: DTbnwDCM82krgVT47-Wk3NIZiAGf9wW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAzOCBTYWx0ZWRfXyKGqYpFzLSFJ
 qgIDvWL0HrzaRRltZrF0P8Iziiej6ckCF06lnQYWydLJZgmolUdszUa4rr5G5ErAuMjChn+61e+
 p/t1YV3tQsRA18zkP/RBcejFSmP8WFl0oYhSpggi0ourdIh2xzJc1b9lhZnchrx66TPout15ShJ
 7aw2Fiv0AmLeCt51bYg/o6kd0hg7ehwibUHAUdoEIU+g5wu96OBC8IgK+ccwWzDw2Rb/yaEX8Eb
 wPLauqvNtWcNaQM1uvvjnFUjkJTldu/WmJ99c+ug/fue8Q7Qq+yt7OkU5wBKmPQLNuazv7Im78u
 oqI+DYvwactzXiFEMsLXNr5jnSyU26Vtml3hksnkKyFCahW4ZI0KYhnQUA5h/g++MftRb6uijBZ
 M5EawT9T7OSQd/TxpuqZUpm9mc32ig==
X-Authority-Analysis: v=2.4 cv=ErnfbCcA c=1 sm=1 tr=0 ts=690c2d60 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060038
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

The fdlist is currently part of the meta buffer, computed during
put_args. This leads to code duplication when preparing and reading
critical meta buffer contents used by the FastRPC driver.

Move fdlist to the invoke context structure to improve maintainability
and reduce redundancy. This centralizes its handling and simplifies
meta buffer preparation and reading logic.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..679cd8997a00 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
 	int pid;
 	int client_id;
 	u32 sc;
+	u64 *fdlist;
 	u32 *crc;
 	u64 ctxid;
 	u64 msg_sz;
@@ -987,6 +988,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1089,18 +1091,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	union fastrpc_remote_arg *rpra = ctx->rpra;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_map *mmap = NULL;
-	struct fastrpc_invoke_buf *list;
-	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	int i, inbufs, outbufs, handles;
+	int i, inbufs;
 	int ret = 0;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
-	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
-	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
-	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
-	pages = fastrpc_phy_page_start(list, ctx->nscalars);
-	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -1122,9 +1116,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 cleanup_fdlist:
 	/* Clean up fdlist which is updated by DSP */
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
-		if (!fdlist[i])
+		if (!ctx->fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
+		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
 			fastrpc_map_put(mmap);
 	}
 
-- 
2.34.1

