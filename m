Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68982B3D8CC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 07:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C0110E312;
	Mon,  1 Sep 2025 05:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ7+w11O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADB010E310
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 05:33:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNMN0J028545
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 05:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IZcy5lp3+vK
 2Xkym55v5I9nDuPWPklB8MXh1zD3Z1R0=; b=iQ7+w11OrxfQUsfxmvTyDK+EBtq
 jGmee8zOY9L1DuuEfWOg6r2Mnn11XmjEImMxmJJbn/TWpgB4WU54Em/KY7jHmSva
 3MnCrQ09cN71KnwzpJRDTCtcDp4A3+44wXBkZUcpcJQS4tzaTa40f8VAnWuQp6xG
 rKPXoU+s6mfsesd2JDxesa+hHiBV4uP8iPcSuCpbYEcVY12p95R4uteT4WUO4W0E
 1oTNYFQ73RSMgJah0i3jD8AEI3c3wJVfOmAf5L/Qhb2dTVjJsXDfqMBDvqNEzUrf
 3+4DrdIdNROugZBrsN8FKMC8Id5w7LZcsT4UURYVf8YVm+E+tVzu63boHZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuuc1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:33:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24927876fadso29768765ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 22:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756704825; x=1757309625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZcy5lp3+vK2Xkym55v5I9nDuPWPklB8MXh1zD3Z1R0=;
 b=mEmct6xW/TO954xCsEGNAftTovLIQob6QHuI+63Gvx5Rt7801UG7XgmpNi7sgAuqnY
 rMj1rEzIK6X0LYDpzjt+S12Ym1KjUqYiuSlQBM7PULFhz2k4NADphmhsCuXkmumjXkyu
 bHEhBFBLtGrcX23Ff+1fCHHKCNb98b4NfWcb5ArlLsMXO3ehAMRmvADn0jTBa7F25YoJ
 ElHl/Wfdt4PRYP6CbWl1W71a9ILJ5rWO3qo4Oezqv+AwxLC20kGvW2uD0N5TgwEqc6oP
 5PthbVyO2Aa/RlqTev+dqHhxJJ+i7yYAlXljli+PoZ0RL2SG9jzwU+ktbASQEqeaNpvp
 JzzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoICn7jrYEBsiK8GMZwZo92VrQUw3KAhufHTof4/qqJf55dOaSEwvYytQTphgPo5/ZCqvd/ZRPTlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyph6qfpRpBgrDkG13sStPJDMxbun8wHJYSpmI15c+kteunDllo
 c4aoqxLJWh++BuqhZrDfsO+R4Se/EYOclAwS1ISDhAUDAjQ9YwJsin5ar1GyQ0Z+HVIGfu8fFvQ
 gfQW52QtswhwBVd4XkDABDaMl+r7grMyADgyqPeSUW31+hhlfM9HeWzjIUnCPFR4Xb0iARxU=
X-Gm-Gg: ASbGnctd00KqHfdzOmhmrIqIR72ZxTjXNpw/EM/YOc1eojBbSwSxsYVVeyLH7S5d2h8
 TwUQnZe0cArA590q/xa4TUbhLK7QgoKc7WRxYxf4kG32M2TRZEiwpnrr/GtxHcbBLa/6HIfzUu9
 1FG1W2d/QwNdutoRje9QUGUjc/hrNaj5sWJJcqyAkJ5AaTsXU6SeUetDQrgtLaDrJQx3/gfLDT5
 lrM8SRSw+eDq/0OBXwfIzfVNiGBiPnCPXTFMzY8wdqGqF/0vDNmzdZ+XWvFpsHBqszJnnHqzxvs
 JEH5LHfWUiwTbpm5nGSJqyQqUCsJOBtvrJIW2LvShHQJ3m/9zJVt+/DShSGtbcwkottZUMRv
X-Received: by 2002:a17:902:d4d1:b0:246:6113:f1a8 with SMTP id
 d9443c01a7336-24944b29febmr97024715ad.40.1756704824567; 
 Sun, 31 Aug 2025 22:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/9zfC50PCoALEOMly7nmWm821nvB1XXDGFIo7ShyQjJnQNMbN7EffzVijf65eEHW2zFlzKw==
X-Received: by 2002:a17:902:d4d1:b0:246:6113:f1a8 with SMTP id
 d9443c01a7336-24944b29febmr97024405ad.40.1756704824090; 
 Sun, 31 Aug 2025 22:33:44 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24906589986sm90575215ad.111.2025.08.31.22.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 22:33:43 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1 1/3] misc: fastrpc: Move fdlist to invoke context structure
Date: Mon,  1 Sep 2025 11:03:34 +0530
Message-Id: <20250901053336.3939595-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX2S0BkFx8TOEf
 zxIoyUEUGlagJREAfcJVrz8S1ImedoUWg23YOKreLicENoKuazWPORrWObsgDJbxn5cXzu80Xn3
 x3iu0LMQtNkyKgdQ2OhEsnseJXV78IxrYB62M1GiBec2yjlbQAwNUqYsTBi0olVXacudGGGHP8j
 EboWQCSj3T6ghHGQZTpe5UERSS68s27AFOSpAclXNZOEwsKaY1qgb9LD6R8QypPS6O0Z5TYnIMd
 aAUc3OO4xIWRxjKNgIUuS99mLFkSREACkLptQK3GkaVEBwfb2QKD4f7myyVRJxNrrkhKWSUhuD2
 RPdEXuyVA38CqjxzqGz2UKOM0SjzsdYlen7Dn5pECPaKl3ezqwHWp0zzCOvUmwMez9InpB9yJHq
 OChXKl4O
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b53039 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=oXf4Wg5VOEMHQw36ysEA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dRDyuu4tNA1clRtyFxlMMFdiPFosss8s
X-Proofpoint-GUID: dRDyuu4tNA1clRtyFxlMMFdiPFosss8s
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

FD list is part of meta buffer which is calculated during put args.
Move fdlist to invoke context structure for better maintenance and
to avoid code duplicacy for calculation of critical meta buffer
contents that are used by fastrpc driver.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 621bce7e101c..0991ac487192 100644
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
@@ -985,6 +986,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1087,18 +1089,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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
@@ -1120,9 +1114,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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

