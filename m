Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFLGCL8OkmlLqAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C522D13F5C4
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770510E36C;
	Sun, 15 Feb 2026 18:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+RgyxQW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayd4dtRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEEB10E36C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61FBtQRh094263
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wwOwIZrghwl
 5hfUtSY4NZTKubqv0dn/EyjKwV7U9g9A=; b=E+RgyxQWdFXLZYrSJYq5GRl3oig
 HV9uQBOR3sDUmD8PIfsybURlJxigPozzSSHtQXEdYHefD8jtBrK/DH0jGSMYNAfe
 eQ/vXvY6j4aEKajjwKXB+0Xi2dY4TnmxotEAETbDVt4F5lANd8YjBGasdTTrzUqF
 qatfTrsSvRq+Wlp90+ADZQmfpUQwK0fpfVF4fw5G6iQCFZKUUOBwQhrj84HuaxpB
 KVKYal5eutZm8NVkKEtG4ajciuxqN52MWW86dc1CTXgltqOEIW8qleCWuW5jODJ0
 r3BQKoKZLWedg4EMOG320WMXHlFtV444FxWQfv9KcvPvgusj4I7aC1Y9PCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8tj7g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-35845fcf0f5so1313572a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771179706; x=1771784506;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wwOwIZrghwl5hfUtSY4NZTKubqv0dn/EyjKwV7U9g9A=;
 b=ayd4dtRP9RptnNuhoysnTrhTQJBnfkhN9CJSWneo/Je4P0qyJhX+46Dp0ayghN4N6s
 VceVpEmuNDVwYymKuvdtjVSTFU0Q8q19njqcEuuv7BOpySxIWjNjbOCY5Uc1z6vueMsk
 p7VoGAehtxkCpr2EqD2tMqkZnn5gG0qRo5oXstu8dNCos6Na8RbA+98tPuJDCEWfy04E
 mn+K5fcWQp32VNicYcLJTQx0FwRSu6/1Fo2wQblkTzWw+2BP1mMgVV4jr/22iqsEQ+3t
 WKrThg4QTD5LMpAM+T0X42Ql14mW0f/hyeF+p3Q9W6Esz1U3/QxlinH5Tw7thqQj89RD
 KY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771179706; x=1771784506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wwOwIZrghwl5hfUtSY4NZTKubqv0dn/EyjKwV7U9g9A=;
 b=cMYTQU+YpBT9V3ya/oELwQv5UBwMaC+eLgByBjzgMN1nEIGHg2lIkCUfGJj1LfMRB6
 4tyfnL3U7rskjr8XqdrSp9KoGnhMNbJVs656NRGLpPjP61HwhUDTQ+Icy93hlADZpapZ
 ODUqYj6tv8/RIiEbjKdoxB+xaJ1VxEt4L2P+Pm6nnqwqmRhGNwbbzyaAuRY0PvGkCmWM
 HU6hMyyFaEIj587OimdCsmaPORWFgo3fS50zHNPx+8sdi/JoFpiSP+QyaQOcPcWVPLiP
 8gbzCXdA9vEOfo+RcEF0dsDEknNvouF50pvIjYEZwTcH3deDlkLQ6EPccb8LmfMR4aFU
 jw/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYSV4zxQHy/oEM2Uc2aDvoroalBVEtUT2qlmIPa59u6JuZsKOYE/A92JIt/aa+6vuT8kY68XN/HRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjEBoqjY38obF89JBrBVJJ3AtmFSV7JeOKK6kwDTXdob40O6dR
 1vFNdzWWA2TrFNITe1A3UdNte1uTtQnVGqvA8YSLnynQ8bBh3FYIxwacxUACO//jMHslTNHi0AH
 7/GMdCe/GKLgZTuDSyKCDnjcQlOVoThZNc++kH4XZN4tg4kDXwVBqwX2psbBMlWuhWDE342o=
X-Gm-Gg: AZuq6aIQEu/yvafGikPM53aioq/aacRibxclC6zjeurX9QX/Vxzp0lCwPYxQT+p+xvW
 k1cxmLWrZa5XDmG34sAY9Lnd4GCEy7z9Jb28uI938RQ0CMrTtfqdw5W8914zagMi/EQuGU005we
 fCpbovpGI/G2N32g1zUkmY5tFyDJL8eOecx6Jpij2RxrqmgFORKbCBzU9u4qCmM2YSAsh66b+nH
 7+VtpyqWszHjgmCfpC8U8lRkpRT+qbIgOBu+qMDwtTRV21JrtYk6hAItrsUZAdQjPUS4Wajt5OP
 87Gl1hrNd7KVo+0zqdLn/3trCnkrTZja87FQXjLfO12KHLX0SQAW/d+iJyZ/mHx51NxFADucjsR
 ZUf0N3ETToM9pCh0gSvNGEVXr6v++M69tDL4SGfp+JbjTZOGHLmxbfA==
X-Received: by 2002:a17:90b:3e48:b0:353:2972:74a4 with SMTP id
 98e67ed59e1d1-357b51ad1c2mr5356583a91.13.1771179705642; 
 Sun, 15 Feb 2026 10:21:45 -0800 (PST)
X-Received: by 2002:a17:90b:3e48:b0:353:2972:74a4 with SMTP id
 98e67ed59e1d1-357b51ad1c2mr5356567a91.13.1771179705097; 
 Sun, 15 Feb 2026 10:21:45 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 10:21:44 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Sun, 15 Feb 2026 23:51:32 +0530
Message-Id: <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfX0i4ch49RHKIe
 ors8kcecushoUojR1LkzafT9xZBxg1ek/wKShS5Q5oCcvKtXbYU6S2CJdfZnmVy7nCKvVtiyfzP
 3wt+YtWIWd7OotrX3EHdJsDMlPs/VYIkPJpsgwMvL+kUE5ibHqtiWJks7IlFv8ejXP+/dS2netz
 BnoUReXCjOoDK6VUKyyTJzFvH+XJ1FmCPGKkq4cqLsfbjLE8SsMxcOJFjxDeLiL/ePIxUyhWG97
 Ni6gEsKt2/nPnfxVkq0NmUmzcIDB9lVDzJxd5HgELooHZz5Z4VUnqFQVDLc4LyF2jJ4kS1QE+My
 s3LOBPx+U1E7cwKM8V4XbtMvJAEW3jILD8KkXwEogDqnBQBj6DAr38kyJaBa4aVMf7vvmH/qnG8
 Bxp2oWzrXPIIOw/3I1IXedel7uIsCQXPRu6J6UF/pAX24HbEOfCphfuWAw2oJ+JsWxscNt8ZYVT
 zg4rIM/U2/z/oB+g6xg==
X-Proofpoint-ORIG-GUID: tRW3Tw5hU7e_bejb9v8IBnurIZRKzXNQ
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=69920eba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=hRzSbfjIAxXVlyYcgJ4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: tRW3Tw5hU7e_bejb9v8IBnurIZRKzXNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150154
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C522D13F5C4
X-Rspamd-Action: no action

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
index 4f5a79c50f58..ce397c687161 100644
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
@@ -1018,6 +1019,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1120,18 +1122,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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
@@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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

