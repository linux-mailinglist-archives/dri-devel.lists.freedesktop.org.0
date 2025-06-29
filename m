Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF335AECD45
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B7510E2D6;
	Sun, 29 Jun 2025 14:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlXxyggX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050CE10E2A3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T6TXH4016217
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
 4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=AlXxyggXs76xsX25YWGkU6K2syu
 PdMb0WExu5Uw7MAZYV54/ahuEvU22JTOSuWDXJyLK9V0XlthXx8UnoSW8dmc29p5
 G6tJItREbn523lPzu8Kf5HQgkxgWvPwtkutRm2gromlX0vXpj/9Q5yARTzqihu3A
 ZdGeqhkDfFndE0v+zavpU+VqZ1MQ3Z9/FqQHcdvrzKfhmYDhDXX8y6GG+1X5ffkl
 N4z3b6nbd/PHAx+U4UNAoGgw3qChs0f+AZypaSgI1d1V73DNKnyks2/sf3gMtx/u
 PKaFq4ppxXA09hGHoRLA+0gFGAA66ZQ1rO0a8e1ZKrLPC6Ny6WXVL96GvXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23494a515e3so26512275ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206079; x=1751810879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
 b=WtUog7krvoGQ5QLCA/UB+XAkvsx77NDm7hcS86n+3Y3w6ykjlZdbAu4bkxlIqRUorW
 2INwDNYbIC4iCXoOs6f0w/H9/qiEUiQ1LDJ9yZHLowindO9sh3TwVc8F5JUgmIkUC5Dp
 K2uaF51HtbtF/2UMgJ6Crk9U0esBiHxZSQXMAw8lQl/31rk9JSxCDqDheQEKbQNDPYwd
 OIW0/MwLxQQskEU5LN1Dy3OTn0x8nyiQ9XDRc71q8StYLjU9EuTf9hJQI0KmXLfstl7q
 bhcAU7n/axckvKDiXs9UKtLIZshYKfkqkoU6/sYO6K+z/v4TGDmvvW/ut9m4NIQHhSVv
 Xxqw==
X-Gm-Message-State: AOJu0YwDNxeMRSPEp6QzZAlOm0fn4nWwR8KJ4FeG3g8iHSj7WLoUpmU8
 9yYpVvDQS98K7wibMBW9QnpSCSvYeMQB2vRGq7hCsDbbnC5hT1noT9nFQ++DWPwSTQW1mys0yxu
 2fwswXb0QYNRAPMAL/Oye1TsU8Kv1moupB+jmOx89AXHiDAt850oyIZigUUnzUFHJ+/mQi6tT6g
 uS9bU=
X-Gm-Gg: ASbGnctwXNrIxkY+RPktvT8b5tf5PL5pMCuHQxmN2cH9rCN7n4dTbETw2vbP5FJoTgv
 Yfc6IrwhjF2oO6AHJAPpNVC5sqCwaLneU6qjj1kzioRo5R01RgMx4vFwi5RMWyHUp+DpZBeqG3u
 mNx+kKC9xM6eDBirpbNSBedifsqcgkTGL7o1S4qsC8i5jZJZTNkTmR9jWb+abYOrR1/kDClbb2H
 4ihM+QMdThynxh7C/eqZE8mr+vp2CZ2UDLaKYa+FKmJu4CKgVfMYF1fdlmDmM3ghrs0Tao+/zUw
 YqpJcOAalmuS7oid4KWvpklFEAzVRRAB
X-Received: by 2002:a17:902:dacc:b0:236:15b7:62e4 with SMTP id
 d9443c01a7336-23ac4608402mr153208585ad.38.1751206078776; 
 Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPNU82btQj8+J4hl9ShbsqcvJusHMltr9q+oeq9oKFgZGq/rOI6AAZr3mn9fhniRP+FGNn6A==
X-Received: by 2002:a17:902:dacc:b0:236:15b7:62e4 with SMTP id
 d9443c01a7336-23ac4608402mr153208245ad.38.1751206078346; 
 Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e21c8sm62124325ad.36.2025.06.29.07.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 07:03:29 -0700
Message-ID: <20250629140537.30850-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i1ee2Bdc5arwachHuCB_ZRB7HyjnctDd
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: i1ee2Bdc5arwachHuCB_ZRB7HyjnctDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX88ijP3FAvL0y
 tZMWUts1x4IryWxO2dtJ86BW3Kk44NXntiS9Dmr2mXMZJGTIujBNW8L9oM6FkcI9kdWmuQ2WJ7O
 Zp//A3+Cq/UmVLRtLbiGITRKtFUMJ3kZiYHOUaqIQwFu5jn7KBOXwUnFqCTkFIF41Dtf1uyA+QN
 dFAEk3EYfTKfanpjhR9Ic3y8Prki1ve1DOW0nt3Y95zirw517WDNMuWisKnrJZaqpyvNnJHmD6y
 ZN12DPtiSjWClcxvwdbDYYZ7mRU7qU/8bQ9v/aMBnpqELE9jdPFmpiDTCq76PNWkqa05KjGzgAZ
 yfptXoO3v3CUtgbLFQLq2SoKol4qCKu8cj/cCGhfLBm9PAY2rkLxPptWDwK3qtw1MNtumV58HlM
 plehCvfqph2D3Rya4++AH/SllMHCLH+7YjbFw77zl7HcYqL5ZorA6uYKqP3iDr9sd52XWGal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

From: Rob Clark <robdclark@chromium.org>

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f2631a8c62b9..3a5f81437b5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -403,14 +403,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.50.0

