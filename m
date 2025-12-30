Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB652CE8C8D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 07:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2903B10E7E5;
	Tue, 30 Dec 2025 06:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQC5liGp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZAWxKiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B92210E7E5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU5RUDX898850
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
 VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=gQC5liGpXVgNHhF4H0v7VM3rUtQ
 bdR7c38yZm9uTqQicj1XeDAxMNuW6N7aeO1r6yhOri4Djf0u4uurlkkfJQa4etGq
 lOQPdXvMUjxt7IuY5B1wnN1JyDhnR9z+wdYd6MdhwGbAkb2AX2cd2KJ2cNomXAPT
 +lNTBbbG+oGUjxCIZJmFZ4OdvTJZN5rFBO1a3O3Qa/lC+3tlLN7fb17rVer413JY
 PyKxRekNsr3iCfegm0ICPtdaPW1k1ZbNV6UPw5ZP5zcK4tYaR2j0Cw4zLyuW3j3G
 r+Tno1K1kOwsSOEkujnf7kib9U8B+fBss2jUXqwKuaL3bmVfNn+X47b0p/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky047u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c7d0c5ed2so10196121a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767076120; x=1767680920;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=KZAWxKiuj3TLSfMG5HycUXVgP1g9ALgA/3BLsjtPQdrgd850VOp31mawkxf43psehb
 OEEui6T7bFF8hQFeKxeKb4Fs0PRPjzRBcTsmb4wqGrwy1tZXLtErWLecwhPuCjPZwm9N
 yaLI0jG3i6ZqfpyVnTIfcgvU7EwNQ6ybgKTgGc+jESd/+td/eniExnKgB20nITNKXWR3
 tJ7ViLNwBEaUBXSX6anE8/1bbmyyPc7OdNy2WVNfhvYpuay2xPphRAl4rQS39y1DiNPy
 whC9ovpj2p80Vt+6zIt2XTkgLwzbwyBQSHiD9CQE/31Q/SLFh7fMvhHdjDdkvr0va1mH
 uQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767076120; x=1767680920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=YPGCdwrLzCX1Tyqfst+8ATgQGu0/C+GHCo6gCa0qDDRHbaZ4L84Hv0smk8A+PQvTST
 Mzs5SOVv5kSX4uV6PGphZ6UyDCj5Rc8OieHffkZAkISbvwJR2nBEdsKGlO5/he4l6AjY
 wDPSiqJhGMqB9kaMHnY7Uzs9PWtZ4qb+nlM0oUG/X2zBhN1lAwa+C1x2N5mkgkTbio1C
 GcH3lAEEA7cjHXsPGLStPIXUqGF5y5TW2cTu6H/1oywfQTlydt71p+1mRvkaQMcrLE1g
 uY9yz3vRixT1q2AZmiJdDLtASBJ6vVeeYcOZNoaw25MY88wAQmay6v3LQDRLmdLR4lnD
 v5NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtbfQBPPryVdHRuYOwV2tGpI0QMK0iCTUrB9OLLIuqWPfAnzIoASwP+dTJ9gyolGRpPTsnuLJiT68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOs6fDdPoBG50cyQrrabYNhptrNf17a1JwYMGB/e/eUZZvGM2r
 r5gSrj5b35pTtwJQYX1REfbI7pGYcA2SEpMgdTyEVWPVuSECqiNKKlHa86kSrTu4lpnutpqyrZw
 Ck7FAMHLLlqvlUyPgjEGHL8fxt8OAhQ+a6NNlQk0QeI85Gs7jioKeXIvHCu6p4T5ZbhRQP0o=
X-Gm-Gg: AY/fxX5RbrdgOAsS0vO3rJrJcX5JZM8imG8Vq3CEkuUt+1frLR67ArXb7P6/HbL49MF
 P2Hz6UnLextu5rD8ASQ51zbzqtmWKZ1xlNA+Ks9bLE2xSxTRTRBvilVjdXj/1/2Oo1kUMkGCaY5
 qFvr3vdL0HYEljadD1j01cxSSBs4HK+LKvg6/uq0Bu/9LzJa+DRehPoZ08ICfT8wJEXNmPtHqVe
 ttF70b/d7OAReztZpPanuK8Vte4pULkgx+ykE0/nFjD6bE3LddI/NOIKNa1/Hlf7UEwcHMjZevG
 LOIOml6wh3iRQtm8yKW4UA8cfwwEmOdvCXJsMkJ/UIPY6DP1gyH1fP3p6LpfadWZlZoMjw54eeW
 5ZmHjVWLcDVSz+Rhn8wnwHHojoB4iSKDTJ7k3QnCgYA==
X-Received: by 2002:a05:6a20:2451:b0:35e:4f06:4fc6 with SMTP id
 adf61e73a8af0-376a81daff8mr32915502637.33.1767076120342; 
 Mon, 29 Dec 2025 22:28:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMC8S1tcREodptdIQyyuwN5nUQy8IuK3aPyGljG7nPIvam307pIjnVBo/03fbiCYSgImk6wg==
X-Received: by 2002:a05:6a20:2451:b0:35e:4f06:4fc6 with SMTP id
 adf61e73a8af0-376a81daff8mr32915482637.33.1767076119863; 
 Mon, 29 Dec 2025 22:28:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 22:28:39 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Tue, 30 Dec 2025 11:58:28 +0530
Message-Id: <20251230062831.1195116-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX0m1qS8S6rCZP
 r65gmcLqXPMLrqKe2lGt6jqT4omKJZbUWur6SOZXULd0CZRVz+m8lSQQqZ6HEu91vnvzCn+Mm0a
 9+fXQ9MubKVnBur3qSEvwzb4gzfMTnTrYRchon1ovgtxzZmtJVsul5UPQAhDj5C4QWNLKyIJ3ah
 bxHa75Jo3u5o8Bkof5/nBIA1Xr9z/Qdtr+d3b0ANUTLEdUl0VCUhaHbhRRrobUhG1I6h9+82bkf
 YliADCaNj/TfwR4bRfvBzWOttBEn/GyzNLXH1Cy6yjMPXJrKafrwgJRHAOIBb/0Gkw5/Hea1T5A
 wEyFNIcEcOHublRKTnqUAk8RKiaiNRRDa3w5nynZOsKQ6a026kkFFh3/dR8gezp0tWKnEm0HK0I
 +7H1fRDeoSBUmlpzr4n+TLlpz7Aqyipad4dPTu4LGTMg16OtFu94QovgsixkYe30HVdvNACPu+V
 QpX3ZUQMT5pnMbM1f5A==
X-Proofpoint-ORIG-GUID: hSHjWf-snM1Lc70IKX6hyIMvefTE7eLO
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69537119 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: hSHjWf-snM1Lc70IKX6hyIMvefTE7eLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300057
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

