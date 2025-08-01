Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F08B18703
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B67C10E8E0;
	Fri,  1 Aug 2025 18:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaNmEuGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B12410E8D7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Hg9Fb008601
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V9+fcbz7W94
 r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=; b=aaNmEuGKHrB1W4wwaq9fNwiKsFi
 GSNG2TX3N1hxhlRe2h2eeq+HWvw3CR55m6E0ZY+j+KoEH6u5mRGiYX5iuRxcDScb
 ooi8+X8R0l7PXPVBUGiZofF5JLWuLapA2S8GoR3qYYNlZ38Hzlthr8R8hF8tcCBF
 CyeTClbDv5gfq17XjYHCvGuB+6YYtQz3XjLeeNIkflsEOX/Ra1hxy/KOWC7x5N6t
 p+3qJpeIWwj3jmNkl+vcI9lTiB310XNujd+irtH/K732OXq8MkkRB3CwBwYLYRGY
 EHoKiMMEa5wiANXuNszOBoEXAzrjQJEZenrhoSHVAqHSVxdDsrq7hPBCICw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwghc6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31ea14cc097so1785348a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071228; x=1754676028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9+fcbz7W94r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=;
 b=faH7XGvoYTVVfZc4+6Hs4Vlym86X96I4nwE9lTHQEO5nX+Y16wVOzjXwsVHtOcg6fE
 yyb1PrrbR0UvpW+2RP31fGWC/NtNMbmtH7z+6oMAPfQ2Cfg0w0zpjmM4SlO0zOneXAPw
 aj9J5tvVmbD50QGfg6mlmqkOjrE7xNiv2I4ndsrGvSm6AuPeP1XtOWFlccuRBXh5tmNR
 l5WrpWmgm2IWajAc3iZDHFMK3GD+CoaQKQQBh2Q/rvbzAEKL3Au54TxSbAFT5NJQrmm2
 M7frR1I6akkjhckjfH9Owp8dpGQ7TYyguGhjuGn0IZAauDMyAGIHpEjPOH4xBFOmjCG0
 8EXQ==
X-Gm-Message-State: AOJu0Yy53g2etzQY4bbYJaEL+XG9U1t8Yi0ZtXeoRIq6r1Lks289TSi6
 Aboj+gv2EEdn1kB4o3qZaymX7KTkxpP0BW/l/fh8MIkKs6Eq/HMWxh3pVFNZ+gB0tM5yTUJi/Nf
 +KJ8POyjGVAW0pAik0bv/aZvmF9r3TPwr/m/6bnfMQF1WW16YGi98euO5ala7Bb4ZYnKi8LOTsS
 tIxok=
X-Gm-Gg: ASbGncvkJZ+LoPVJPw3fNxD4EDnvZoIercd/2qpYotnL6qff16O2ib1pWTlfnF/JK1g
 0H36rPD7Ke9l0dH9wNVJue+tKu5Ckmn9fwScuAy94e2kMN4FHhSa+U8qHv7+V8CQXzATPomaPlO
 LO//vfG5dWkJtzcYyTaFcyQgfaUKKb5BaZaypMQxUAawzGln8QlwX4NfSnIoB1QzUJuxtiErQgn
 CGuyuFkBhNmy9oWDmnhuWEi1NFMZ7/zQvG162z8nZsFy9E1682CLLbldWhnBimlP9V2uUtA/oCC
 eK6TOrfsMabKHzSOouwBjMdTc2rkBQx5kRATgKuG0BHFJsGYSOI=
X-Received: by 2002:a17:90b:498d:b0:312:1dc9:9f67 with SMTP id
 98e67ed59e1d1-321161d9bd4mr1027089a91.2.1754071227828; 
 Fri, 01 Aug 2025 11:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH0dkuAC+cmmCazD4s9F12bafJvjQsxaVASh+WEL94pt/xIt0kpv25mM+WKaVod2hnX2+8ww==
X-Received: by 2002:a17:90b:498d:b0:312:1dc9:9f67 with SMTP id
 98e67ed59e1d1-321161d9bd4mr1026863a91.2.1754071225861; 
 Fri, 01 Aug 2025 11:00:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32102ae8b5dsm1260245a91.3.2025.08.01.11.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/7] drm/msm: Fix a7xx TPL1 cluster snapshot
Date: Fri,  1 Aug 2025 11:00:04 -0700
Message-ID: <20250801180009.345662-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688d00bd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=zhZQclFZcvAaLIcfx54A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Or1OX33VfadO0YObhsGMCn6v6ILJvX0X
X-Proofpoint-GUID: Or1OX33VfadO0YObhsGMCn6v6ILJvX0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfXyfyMudYDXRd7
 zZBLskdS+L0EIwicoyTZD8wHphYO9SD9k6hbUKBBkiQr5RmvaXmqRLxy8GuSxt2rmYxh6u4jezq
 2eueXe4fDzjME4ppFWXiw+Iz64aZuAsNmWtpj8zakR745oAFs7576Tg+/ZUD0kuyTcV9b/+MEzR
 vneV5KRUF1hUUjeyJYW6vqTHFHaAnwEjTsGwQDlG9fcDfC/S3HJp9Lyf3aNIP08By77QCVLlu8Y
 1poc6dCQYzQTCkiAUeKLS0OZyq79GnbgM+AoChtSM2o+G4JXe3OStUrOExgBEvudnvay7fSxzvc
 NYVY40qDVpwXpFhLwNS/Cg8Ei4rLfE2rbQXaZxqCFGpaRGprMvaf0m6wWtb/tIItK7ZVgj23Y4/
 2Sq4WjcoCF7p2dPKne3w+Z+7vIFqEHII0CPTdoSY4iNWnJ0XdFeDlnWJkJv6gy2eGp6hciEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010138
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

Later gens have both a PIPE_BR and PIPE_NONE section.  The snapshot tool
seems to expect this for x1-85 as well.  I guess this was just a bug in
downstream kgsl, which went unnoticed?

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 11 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index afcc7498983f..04b49d385f9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -668,12 +668,19 @@ static const u32 gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
-static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_NONE */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 	0x0b600, 0x0b600, 0x0b602, 0x0b602, 0x0b604, 0x0b604, 0x0b608, 0x0b60c,
 	0x0b60f, 0x0b621, 0x0b630, 0x0b633,
 	UINT_MAX, UINT_MAX,
 };
+static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_none_registers), 8));
+
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+	 0x0b600, 0x0b600,
+	 UINT_MAX, UINT_MAX,
+};
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_br_registers), 8));
 
 /* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_LPAC */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6569f12bf12f..772652eb61f3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -573,6 +573,8 @@ static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+		gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
 	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
-- 
2.50.1

