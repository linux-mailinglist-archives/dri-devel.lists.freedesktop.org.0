Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47DC55F28
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 07:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417A110E2B8;
	Thu, 13 Nov 2025 06:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcrg7R39";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcRhUQhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF38910E2B8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD11ZcI2910121
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
 VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=lcrg7R39k/JhY3JsjXhOBdEOMng
 +MhLO3kZspSmlGJ332Tux8Tuo4mnP5zNXdVmVl2aIL41paRaqIggpnHiDJeTVjAM
 CtxtkBCtKIIcwmUo31z9ty8IcVNQHnm5Ia6vJCmGhNJJ8DpjKhq2R+ygnaNNpEqY
 GdcWCtzmd5UdbCsX6ThTtAb5HaSZbtKAQ0eLJN2NnrNHoT0JhadMx1QhjowGO4Ku
 tfe7OXAlQxPOuGHMYKoes23cCD27vtp+AEuEYxBV2ANysgIsyV8GciF1KU8mXcfw
 PLMdBU+3WM6sE77jlTCqPL8axxuCvPn/3mtOiYaHJ13Eps00381ODLISePg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acygm9xkr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-bbcf3bd4c8fso532094a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763016080; x=1763620880;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=YcRhUQhbJJNMQHZqpuIJvFkMsltMdYBU0VOKThqib+S+1Jc9X5bwdl8oKwLdp6pEs8
 XeNU11Ti+E0Y4jikJ86Tp0GIJH/p4AVWtiQ9J/geC3qUfvb942anIsZB5i+SDD3Mz0AS
 kuarIgI8HgtIImSlAr6ReDtNzi8CesrOt+KJyLW0uv2s+wFwENCi3KknDvHF1gr4uWDu
 Pir6gsFip9IHcyopiqMMkRVKsoZYBE3GMphQhJlEN8K0NndwbJiFXPFm1Lt6thujN7IH
 BqWSuEZ5TpuIPRxcEANjUUg6AeCVJIU91cAsbHrax1kPCoZpGEwDpJUfFDdmUX2Jf2nQ
 EtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763016080; x=1763620880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=HaJSgS1jOBX1TRNNH6eZpaO8MRQee0R/Uvw326PxHFeKu4DLCuVSDf3gRJJ95qDXt0
 IWdf8g92eUIGzoJeXvKn4yru4zKrgG3/8FWLh9JpGQAV3Cq1jS5GP1/yn11120VyZqJE
 QllPzZZXDH6dvD2nAw/W9C6dNy7giL6OgBNvP0tulYL0ZtOAb3982lDAU/bjAqDaudJE
 XbaTPAv7JxgJhfTEFPHR+PDcwfkrtPMquORTaxx5hjtjCWdMwpmRF2F5AfciQpWNuaFZ
 gYIzVSqsnihoe7kbeSvoRM/irlysFsxkNJjA78mHnB+Qt1HH4io/swE8Z9Nb28LHaj5l
 UqoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4/cdRXKOfU7OYHXeHqCOwgXymH9Fhi4T3+SZLzkRCLi9QXWwJtstDiZQxPZVOwIXzVt1cYnkQz88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkNUPB2gmOEmriFCXYFbX44SNnOgdPZOJE5He67tCCs6LEdGKb
 jS/ERDY59xCgQAY+7ta8C22s1STOwIxtXC0fylrLIDfL+IrB7Y38VC3oSJe4e5dAjIwdG/vYvjB
 mVdZnJC5MXYThqvbORoBUbu7pOUSA5a9NLZPSZj6/WAcbTgaEwg3ntITmT2mylFcFrSMyZr8=
X-Gm-Gg: ASbGnctAu5hvJ4oxR/DfW91p3wvmoXW3n4rq/Z5Eee3k15yWCMO4QwYS8b5yVNuClx0
 ttq8ISA0Q9S5c3omtdu/N/21wBrSNmsuyziS9bq/Iuv+MNkjB8VdwOi9xrSS1/1Em/81ihyjyG0
 G6V4+OoIDVGXf3gUOHDD5Ah+m0UPrtR1MGCIc8MfE7jVTob+Pg+9u7TJLhJ06aCBnS5ExRqscEg
 XdbAm6YTNNk4J4Gi4LTL5fez4ukEWkpOFnNxn6AWcoGIcNL8oY+CNrQugGUSb2cxxyPByP6TfRe
 Qga37OzZWnLjG/MOKrftMLaryq68wg2d1U50hg2xyVu1gMio89yp3Djg6QGFxcZ7By49oQqZ4Gy
 EyPN5L4cEbfPK/ey4HwgUIN7TZy3Gb/A=
X-Received: by 2002:a05:6a20:914b:b0:354:1d68:4cd with SMTP id
 adf61e73a8af0-35a4f6924ebmr3655275637.11.1763016079645; 
 Wed, 12 Nov 2025 22:41:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtQXaEJw3cpwnHLq9LAZYgHeBTeUkFAJXdBKUg5ZDdPcbmmAje3PWxAh4kNGtp5umDsqMu7w==
X-Received: by 2002:a05:6a20:914b:b0:354:1d68:4cd with SMTP id
 adf61e73a8af0-35a4f6924ebmr3655234637.11.1763016079132; 
 Wed, 12 Nov 2025 22:41:19 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36db25bfbsm1138419a12.1.2025.11.12.22.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 22:41:18 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 1/3] misc: fastrpc: Move fdlist to invoke context structure
Date: Thu, 13 Nov 2025 12:11:09 +0530
Message-Id: <20251113064111.2426325-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9p_koiMccFhjHnpoO0e9PVSm_5si1W2v
X-Authority-Analysis: v=2.4 cv=E/fAZKdl c=1 sm=1 tr=0 ts=69157d90 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 9p_koiMccFhjHnpoO0e9PVSm_5si1W2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0NCBTYWx0ZWRfX3KfHdkARYcMb
 39Tc0PiB8rWtG4v+yNpttED3gopkufKs3ReHiYdvdF4m714pSs0sffuUtYUykJ46/hCKnE8yCDx
 5t3+6TFkhPlOVGpnu2IwlMmvGmWq9Ja6Wa6raOf098cFC6PH1K6Mk0gWU+O2S1LlJNkvOlSPCQG
 jnHXAj4Zxsloy8OH8w89SxN0QLAVvPAmDixKhbpIP+j8myVMeIVLs1b4eG1WbfPbxRUoglB2fjk
 0E7Ed1UVSjmMizXzgGp0AjoH+KjNfOC25alaSzD760a/m/2rxfwkul9ejTmvBThmggs214wxQqy
 1caw92yJTER6Ay0wcQ26RvdYNQhPF89VlxAbimTEO+lqg5Kkpz5ckLYIedbZE98qfuyFx/rHz48
 np6nZmppTeJ2O3NUkqPCVFBANu4PKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130044
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

