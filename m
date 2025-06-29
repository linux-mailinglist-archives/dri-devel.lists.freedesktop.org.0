Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429EEAED088
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F3E10E36C;
	Sun, 29 Jun 2025 20:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDnx0LU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03AA10E369
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJS97Q019727
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
 wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=fDnx0LU4V7NKf/OHFe3W029fWfR
 KMLSNdTZblHmLjLR4dw5jo8GT82U7nL331ZLB4da2Ebv10vQNaHHN7wZYlOuN8ZA
 AbFWH6WOffGfZEmZF9Z6umoVB38M2p+bvwxkZjlRfEtUafuRHAkoMrD7ZqVMFqxw
 C/wj1zYnnTqFzIOV13KLVfR8lPZcoyixUOICiTP9IO+PHn7PHMw0j9f9Y411uV69
 LPatx/1jiGL1ixD9ax+1Kdq96MaiCpufalbmnhKIHKoUzcNVs7nCgmR9sa5BiLpx
 03EXbT0njybEpmzmMwpMb+Ljh0cdiabMHwcOrRVWZyc+L8vBhEg1JIn33xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2v0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31366819969so2831198a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228217; x=1751833017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
 b=Z6yPex/V0sCl3ul0uD8OFFrDoqlnyqafUFj/1xPtCJqBIHWz+S3UVPH1iuYN0WDZzJ
 Cv3si4EGJGBknj+JMpcOuB5a9xM2VsTX55+Gi0xGBSYSlnzoYzmRw2Qq0JzZyyaigXXD
 twuiFPL6Tx2QVxQRUIJK6qVpyajrZszyNUDlyBitP/FMQx2u5QeBeK9FIMsG3VWP/iQL
 GW0Tv04FkqmToA+HgzmXN6lNLZGzKc6Bz5o92U5B2EuCdfg1q4nj9b4vds8M9ccWA0mB
 zfxmC95tc0zViHjfeKjJen653hrcFH+YxweoCXmuNugKtopAqdeoXeE0dDyaRfQmMFFa
 OGag==
X-Gm-Message-State: AOJu0Yz1oNXoZV5+d6oKI2tzzYA4HdWGjgTgpBeW4z8Ii6fnx+ofxSVH
 LFayMpwPmERt3Q1iJURfLO1gdqV1FRjz12Cv8UblY4TrOgkar53c+wWg1T6PzyWcJqM9Hl7d3i8
 +g3/c2X24oG44jzL+PycIFi0fK96a8MRVubDUCQld5oxoS47Pe2Utg3E9lY9Hnd8fxhPf2Yu+L/
 cO7tw=
X-Gm-Gg: ASbGncuBI+WorwmLntu+H9UddPMvdL2I/KvexBxu4sZ5reD2q9JFfi707g4RH7LYQ6S
 ObgBRGdYP7/UstPJGtA9EWlFxzANETNUVw4BRnehMpA9kyiDQq2NCVAKg0a+2VbPkhsCzn431r3
 Zjnelz5m+IE3zxBkRqSzdHuDsgUbMV1njoY2wvu8+BOebNBYQYNhOM7xIDetXax6lgdJmWUil6H
 mB6V7YVlDO2BhUg9sj70stJhwkRKu90ShrqIxqWg6L2pNtLrCBa0vZl9a1LglMHHQzScI4/KX4Z
 tJGP1pA5NbKucIZOSHhEVJRkPsQNYYazzA==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id
 98e67ed59e1d1-318c9256c7emr14508874a91.28.1751228217630; 
 Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp24Z6Ubl0Mg+UKuim2CPGQfJhFY6T/tHTvs17eA1pXtmVUu5AgaaxuE8ttGSFY1Jqy5xm5A==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id
 98e67ed59e1d1-318c9256c7emr14508860a91.28.1751228217278; 
 Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f02sm11646942a91.1.2025.06.29.13.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
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
Subject: [PATCH v9 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 13:13:11 -0700
Message-ID: <20250629201530.25775-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7yRT9OPoNqwYHDxpfI-wDlhTaEtzSxxI
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68619f3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7yRT9OPoNqwYHDxpfI-wDlhTaEtzSxxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX/dJ6L4NESHE5
 aid0t7GfGk45iAIO+TJnTMsxtOfRLnxOvh0br5QVmylsvguVEu+77gQwX6sbM06O3zzrmnx3bME
 H7AZOaaimHfwRLjxddbg7uy/tFnqAsqA6BfHHmfepHXJ8lL+fAYYmYHztKPSy/OJk7DOCZlEemd
 /jR78vSuUyQMi523j0knpmalZ/GoC0SZmivAIJ0V2do0mIy0wa/b+OA2EompDOgMsBdPHOVsgsn
 JqS0lAI6QdcSLh8xt5DJcPBbzkKlGog7nhW02ZNLUNeGK2s6KcwOhEVQ9LWo6DByWboVjk+/U3k
 lfqtjKoiBKasfunzcYZ8RpLLYjtUC3pf8z0teVS9vEXhDoTS/Knn9mEeIBFgg4WJpIlsN6amO+c
 Ztjr0O/RD7i+WsyY6dru7Ss9pNG1BvkS2h3cLJJNZ0/PHZXitBMR3/Jtf3d2NzW8iJ0MOrU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.50.0

