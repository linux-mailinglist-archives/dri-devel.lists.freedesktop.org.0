Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE8AED08F
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D4E10E376;
	Sun, 29 Jun 2025 20:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXakVDdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C11B10E37E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TEjL7m018005
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
 4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=jXakVDdUTAXAmDbl8kMVcFG7Poy
 NYeUqU4wYtJYTznqIKlLMdkB64iRMu4VxGlEf7rUxr6V4aj+EYwBcXxScLXkN6E+
 I17FoWrVG36f3ft2xOxNoPEAjMBXmiAgkiLPyDdPKJoabrfhrPjuHs221FxmkK00
 BFAUYDkiYV0/LwyzilPfBq1FwSAIGfWz/P/7RhHz0wLC2tGT1lgh5EvudVXMnX+2
 hPAKJ6sRQbLVDztGxyC9ibOo7aq3SHFXMImizRKHK7Zj388KHIyqoOrtN5PkhhFQ
 UCGdhhGMrAYEszD5UH6Dbq5b8B0/soxZczk9roq+doV6UvaNyxg3Al/YcMQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801tmp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74b185fba41so564305b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228215; x=1751833015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
 b=hkzhaWG3FLhOoi4Ggdpmqz3schfBIYcXVlg0dF+uJIu5otVJjg/TVxCdN1aWV9F8t5
 yQZz0eWuc8RliAlUeTjXId6xouuFkNc+gdWHHtnfxllG0HLMSpOWRzpawITI2KxpSKJx
 SGdONwASbDEM2bFP8RWQMlkgPNTiZU1MdU9J5GWJ+uED1XORA29Rrro7ZQX9dE83tOe8
 eLSIIyDnC21QTzQ7pbk8JRxDpv36MgYD7ouwiHBpbTOjJxrx2cbFU5zbZZB0VXJPIdkT
 RB7mNaIBUEl7rUSLBSJXSEB76/3Sr74fefpxjq3f3NqoX81x6NyXOZWU2aKrQbcQnfp/
 ek9w==
X-Gm-Message-State: AOJu0Yy66AraxaZxF+CyM1kG1wbb+zr/dDAz2rLCDX5mv7WEp2VTqDSp
 IcVCBokpYo+xLzQSg7DG7xXY3HlKk9PKqQNm4yCGnFUeQ44RoTKwIGr/Ow6i8YedYWqSZL+cmRC
 2v2YLtCvd09VCWUsxxkHmHh+Q65ZgqsiPJ67rB60iLWrQqWyTEWqKqtOYASAGFdxCOEO9lsQ18f
 qPFlk=
X-Gm-Gg: ASbGncteyA7PETdp4U3RNSEc7XsYGX5hTr9UHjNY3emh4y5fGMm0rFttQG+/igivAzD
 dCK7q6Uhf8FOZJBl+Xky/TMOunnRZ5vWISWpuFrORsHlOVtfyktqLjTaUF7Tzj+00m5QgfBh7xL
 899FAch+noHBJTgVttpi6JPRljRGBVGrrHp9f9vohZA7/EKCD3N5fa928fcl5o684Kgoral3qVs
 z3AuPj0u6dFAVOENhF7y193sZ4NnUfrg8eQyzvCGhU5TQ7pOmN0GFZBDDiVij2r6n8zkG7YQjut
 aSBNZwXgqOqHEzwDcr99OOi3MNKP5SXCPg==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id
 adf61e73a8af0-220a17fa94fmr14766042637.38.1751228215058; 
 Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHLdPOpOfhHnUXca9fxgn7Is+j9F3do3zCU7Zho79ZKpG8mV5KD0ItKS+VliQr14UVvffFHA==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id
 adf61e73a8af0-220a17fa94fmr14766020637.38.1751228214658; 
 Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54099casm6902136b3a.3.2025.06.29.13.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:09 -0700
Message-ID: <20250629201530.25775-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DMeFHIl2eeYQjYUhHfR-6fTg69I_P3E4
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68619f38 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DMeFHIl2eeYQjYUhHfR-6fTg69I_P3E4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXy80X6sD2m53h
 gZy8u4pwN+ay37eTubhVCUYqzab5QqfFLieGofrNOT6RAM6/3qBokjW77FZG5q+GOBaZQQ2IUe6
 2Z9UQ+EyrA6zBh3rvqzQBn12vlpELW0IK0DsfRLlE4cX07TjhWS+u+Pd81CL45QQTVnwrwPpWkx
 0f4a/x48hgAW/50A/A7sM7UDFG4iS2lsbz4a66H2+VS4UZAFx76Nyxl+TIexYYSCtmJBQms/xbo
 beOPofkRnSFxyd0rExBcn53wDszu+qMdPbq9R134sz7sTc/hsQFRttNPR8W/LyeDrycwpZXHnH6
 l+KwIKckg/TWBsiOB09eQz+UoBPHbzG714ZyY/0wCJSpmCPUfsGZjOPOkCUIcqdzIKFSgAWbDSJ
 /wRamjMOZSAR2eJoGFM9A1vSKHT4XWHd/YR2OHdlK0fdeK6qCH4VcpEchaBb60em2hM7MhO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

