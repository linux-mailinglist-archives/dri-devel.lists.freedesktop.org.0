Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA5ACF6D7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6F10E9F1;
	Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsuQiSsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38DE10EA0A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AE7TS011697
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
 RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=fsuQiSsJj30cmtJOeqGzFAOFOOi
 Mo9g9UZe8WJq1PPD7eQVIt8R5IZUIh67C1TGbNLloUQIsOTxpMNAv67WMWJTDFNT
 B6tRE2tNQKmSJCfsGadiw3A24jpEeY51zWCBGKhANib6A8v8Rp4B2b27lLQcOnzF
 HZuQSbSmzu71tfRzKSMeGj5AKOr5W+oPGWhEa7ojUooMJfCn0rEoElpo99QzmmN3
 ekLfyOl7t2TgoE4isly4ZCs+sPVXtv8YXJHk6PiSOJgv7TwS2usKykUNPE1vGuQz
 N2ka+cPVXlqAWV/5xR+xBOUo65tCfP5hyeAlYlda0jF1PwHM7/UCm2UEYXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wg08k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234f1acc707so11271805ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148384; x=1749753184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
 b=wDvpgTjKbAS+CiKBupNZRZy9fP6KfGibzLrxDIrwsz2jeJFT70cpM4VyLr1Pi5nq3h
 RhY8ATQkYn5EDVJG/TmAJplv45/M6a8qDWuZ9NJt74AYri81nUd23TDe62ugk0FE4s4l
 bevXFmH1vBNYLtCKij85PnQHZJKu3SPwI9EEASommsqh45khquN5cUMhor0GwVx1fE/e
 pfqklttXpR32/Gc8q8HuTeiwaTsGUhZfbOLlrm1A9mLk3h2SQMSRs3gbSl65STsXiOYp
 e9aHdX145h11DLjMdEYk9PJZQeSYJZdlut5PVgddigOOC68xsqevNOR80z/PKhLOZljb
 yHnA==
X-Gm-Message-State: AOJu0YyzchUC09DVvMWyY7+KhAGIUdZk6gJ8qoKXazHk4mfYJAE2wAdk
 42TB8XiR9/rfgIjqWw8awk1HloYhA7nBRdIE3F/0Ye6NeIGAnOm9EEOy0g1UfoGBkhBXBwpYuz0
 aiiEr+AXFCorfRwG0FgtpxlPnV6Z783wNFqU+wPwuZiRG2wLS1AWDKHLzpXkQxM8Da23D48ZKpz
 +huxA=
X-Gm-Gg: ASbGncs+chXp5PlY2CXdITPvd/Tv3Mk7nqhjNvc5P60iV43jiEtKvxcjMoPgSF8G4f3
 /Po3qtqJZ4PBO4zt9m5jAkWLkJjE+kvruLfxP324I7ExWs02WQ05xglW5CDr1jrrOTsPkedWtVw
 J2DCr4stDZXnupzJEW00qDYf6SBg0jw5xph8U9LFhlMWuqVx9+17LhDcwr27WPnElpVSJ7J60N1
 zARsuFkRj5804TRmfZ44qX58UKJzVNweeZQoWezPbU1O8GRyzaNXhhjM+A0ya3RCyRSdtn2uUKo
 /KOtOVPFnXeoacUunNLI9A==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id
 d9443c01a7336-23601d19e7emr5805055ad.31.1749148384404; 
 Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE26cHcfxJduxTai3lL8l1HHuGp3dVml0D45JxZwDr8TR1f4qPISu/CmoAgjVwvP7kZpTw7SQ==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id
 d9443c01a7336-23601d19e7emr5804655ad.31.1749148384001; 
 Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf471asm122647135ad.164.2025.06.05.11.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 26/40] drm/msm: rd dumping support for sparse
Date: Thu,  5 Jun 2025 11:29:11 -0700
Message-ID: <20250605183111.163594-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a2c_uAdMv-yrNQfIc0DShZpa68dp19Oz
X-Proofpoint-GUID: a2c_uAdMv-yrNQfIc0DShZpa68dp19Oz
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6841e2e1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX1Ejmm5wWoLYN
 S57fOuWsCEuKDO4mW82H46LYUlk9PywbVT4c/Hnnhquh8PPs+JBotlY79cfOuBDWARL6m5jojso
 EvIoGYuVMzpfQdV4i8/vpQ3Xxx3IMDiM65o6DzTchRav7kEclfZL/2hExTKiFeCpy/jcpU97CSm
 XqhhNu4iSs5TPjqtvcyRJ5AyHfaO/LbRxnVxw81JqEwd/X/dZZ34Vy9LBL5aWPXiEwS37X493W+
 ymy5jrQj2Cfcjut4yNR+lZQ2pDjsXLBljl9eFeOIY+XtldWMPeLf5R5V2sh7EXRvtp4xZ5Jhv/3
 Ha6Q6nfcAZtrWF+27AGyKW6oZe1lq9YX0jDnIBrEkMa3/iX7MZemX5u1528MQPubNY5i2/5RNEs
 IYWZUekAhLyCerhbh1Vonujn2cTt1JSBVRmggmpyO18FWp/qdsev/rX/meVUwc48/DqxKVj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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
2.49.0

