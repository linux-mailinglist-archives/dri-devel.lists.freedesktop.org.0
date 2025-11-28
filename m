Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1BC90DC7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 06:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4051C10E07C;
	Fri, 28 Nov 2025 05:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYN6muF5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfKpuVhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949C410E07C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ARMupQa2442441
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
 VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=GYN6muF56IcEBaCOcGXR6byt6YR
 Y0ew8MqWafkQ7uJ0pbFwllIyJ1Vc47RqKBivVopa0Cer1+Yx0sc72Rqv4IRG9BE6
 8/vR7mzyyyMZ8uNt5BQlqJxi2df1aZc4QRMrUNrn3qX/B88DwVIkaF5cZBOXVRZU
 JCOsaYLudUvomInjPYB3Jkp3+ROA5qZiv8lnlocQZO5dheonS6SO85H4Wr40d1CO
 5It7KaZ417v4PX285eMadyVUugauh2KWeU75S4uVdOYzYzeKg7ZhE5ROVf8wrKN2
 /AMhya4fsRhQnPRF3U352x/CzoMypw/gvXxxh6pMBNWK5InKcnP9Rov6qpQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynt46w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29848363458so27080025ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764306343; x=1764911143;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=cfKpuVhiQIAA6ivH5td3/a0JQENTkDl2NSQLCOnshFE86I8bMHPhhWLP8fa0T/rpl7
 xXx5yabsjAs2uKua+DQ9jVblB8aDAZG7eg7oJbgLD4O6p4/c0DN+whxvBLqLJo99qaY6
 0b1BUEEm8MRCqwyZoDMbYy3AEImT+cjCXKENpF5uHLgGtibz1Y+cuhONE9Upp72F8gzU
 /3nzLZuhuZ7MPSLI3uO+BMebYmU9c5+lXTJ/dFmki9lKDbJMXwg6YF5MLcJObUEN4u5u
 bVrCQUjACW7Oo75G52lq/nJb0qw+GJCND0r8X7zYrokO14B2pvzm48wJoqlOVqOyzvEN
 CFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764306343; x=1764911143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
 b=BMn9W1RiD0RqRCC8jEkFBeJyvGLCY8FCFEIXT0J1Hg9QaFqftAzhGAzYEueGKo5lrk
 uum6ojRxPYfsocxt5xlZsDLpNELTq00Jk01k797RfiHpqoOzkYTk5UWakgUo9pO0wvhl
 ouG+hITTddNhFNSN/+SYYDODriCE0tRlLjLqlSjgWcB4VPQCOPq0FdUP9J5nAiwcZUby
 wyVvAaTfChQKeUGEAxpX4X5lZiNmDs/foDFa0kZ4cPBeVoLMExO0cNDKoyrgsUaZTqWM
 75W1GokDS+ekzj1KaVEMMqC8DJgnC8sfjeSOEXEOxU0khlRd49A+5S53obi6mB/VihXc
 k69A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6xQfgZaJmma5zkR7F2FQdwLGmT55xNf3LNJs5vgzP3Vvxml3HiN2jB4ew8bKmyvN7zbE41N5Lm/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSPSIM6+xIXs+5JP5j0I0Fhq1EXOQtF4phJj/vNM9pzg28T9j2
 PjqcYc1yH8Qki9w0TEDm1WDn0AMALY40/ciud0jvTdwNK0iHZaGiaFKuFdhUkdM6y8NpUsal5Ep
 ToBQDM+kqSMgVef5xpaqrNy/LIMHdiyitSCRKyJYAmtsl1ruNPCXpPznm9JZMfr0PHNxI9tk=
X-Gm-Gg: ASbGnctMerV9CB4D0dEVtNSBXzX8lJk7ROr1mYDvSQxqgkXhF3i7fSQXd4S8ZsqN8n8
 uWppgz/eV7v+lxDgP5LcvrGkVXutw1QD1ivw6RL4Lss95Y8a+Cbww14X4cTDR+DI4LpOoRfIc5i
 MBuuOnUpXHp9AmG6WtxwKF2QLBC+Wz+MId+Wk0Wzlap26dyfii4hlBIMb8qJkV7ALfO/1VqEThz
 HDjYcQKOHBHPjKI8ie58tVn9n4X4FYpj1zl+jsD5WdYXQQPoHR7dCKkH4LNDBJjxz/7KoNOAB/I
 PPzbQmwucm82ZI6bqis53kMT4tvFM9cf2HJRX/7FpUqgZmDi+WPXYWzKKOFZaQT07JSUqsA6yLS
 KSNwtcXwPJv2ZU7Qc6EHMgokFj9cxAEi7Z3TlaR9Oig==
X-Received: by 2002:a17:903:8cb:b0:295:70b1:edc8 with SMTP id
 d9443c01a7336-29b6be917a2mr313234405ad.2.1764306343273; 
 Thu, 27 Nov 2025 21:05:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGttVcxC48I1qXIGJ8pQYFoTXX/seoyTogxzon7pZSukIpd1r+O3xQjxLuzCwzZDbvVHZOVGA==
X-Received: by 2002:a17:903:8cb:b0:295:70b1:edc8 with SMTP id
 d9443c01a7336-29b6be917a2mr313234025ad.2.1764306342721; 
 Thu, 27 Nov 2025 21:05:42 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 21:05:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Fri, 28 Nov 2025 10:35:31 +0530
Message-Id: <20251128050534.437755-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4F1K4BA8IBXmYzH7XfeCx2nLpHhtjyS9
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=69292da8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNCBTYWx0ZWRfXweNPMERI4rAL
 vf4yFG3SQ6LRQ7s3hFlIa0jvy62H/Zs22zhzPk1ukc4Q6NX+9szZ7Qtd/NlV3RvBWg35Hmu3jPS
 NccsindBWUiTgvFdx9syiRVL5WCsJW+RMNLuED97hnc3KMeehv0VyU2FE2HcEZHVpHhpn/Syl6/
 w7XdINfmPRYoO/eTWKU2AJCFj/r6i+0nLm1F6Wp7Rm9YfPbLbhaHepqVNTZ58Dh5Z5RF00KQh7z
 61ejyolQkHojjnzGVf6UaC6768i5RnqmQN0AnZ610T65wm55/sveglDeLeSHqj8u22ZDZaqOMtb
 5gVOm3EApguoAJ4MC3Qc87c766yc9cja8kuIdtciORQk7zNujpV8EK5SSneNuU7u/s4Ja9Yg801
 TPLaXkgWEcB90YB11o2/5PxQPHgRxg==
X-Proofpoint-GUID: 4F1K4BA8IBXmYzH7XfeCx2nLpHhtjyS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280034
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

