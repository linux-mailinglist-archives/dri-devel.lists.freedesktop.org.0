Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI1pFa6tj2lqSgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 00:03:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD7139E50
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 00:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1A910E1CB;
	Fri, 13 Feb 2026 23:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQtGqikz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlCOfRvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC410E1CB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 23:03:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DJxYZ41280562
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 23:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=v9zcAzbE8fM7wVN4+5lYRN
 cGLf12p3L4/oFrWpvP+70=; b=fQtGqikzjhoXp1t2H2zKUhQGSfqAnAeEP7nKpx
 5uxZwrWLeMnRZ0i6Gs5t9mQ21wwPqdxc0uh7kySUOSnSvP1XLzu3zMLlwBSnAw6R
 qrebYC8DxjScfjhZDFpsAd0EXMw6vnV61wqFjjcA05rGe+XAz1NxT7lcVX/2u/2X
 ahIGar+J80VfD3doP7gzWWxeMTR8jfSAIzZDjZuhWSb9Du5DpsilBA0pvcBexPjs
 suIQmWSiEzBCHx5mhJAEFUlAOu5bk+HU1JqCfU9zroPC9UsB/hchigoTP9eCUzDY
 4BzILpuZvrAuOBDrGzbzjCgXefq7ACH4AyUwuGwTcvgvuTQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caakjgdbb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 23:03:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb4b8e9112so47937285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 15:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771023784; x=1771628584;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v9zcAzbE8fM7wVN4+5lYRNcGLf12p3L4/oFrWpvP+70=;
 b=PlCOfRvsLKDF5TAvGjfmgz383vbQf2GbpCguuf3eXKis/2RCUJcW2NfaOmTRy20ibX
 86dwht3T4eRGMil2oYKUxDJt8eDzUmNIQLDQ5NImZqPA/bwppJXyjZiyxIzIX66QAaeH
 ZnMhOw0yly92fJ/ilbnRffdYMguka9IgawQ3lHA9gVOYyuZdDqQLWafuddy9s1aIwyzk
 1CG1Su5vZq7v3pa2TMHByyAEVkUL5aefX0aAl4hryxyFsE/y+5nrl1bUf2OKcGrlb37j
 JSpeWdxwvBP6W4YdLXCX6BZ0hNm78dHkDkh6S+PqTENrM/PdYa6FQezrv8VjfoGq2pmB
 quxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771023784; x=1771628584;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9zcAzbE8fM7wVN4+5lYRNcGLf12p3L4/oFrWpvP+70=;
 b=obFvYHhYDL2ybmIgmTj0LI8b6A6XXvbLTxOJ/4JGJZ5XxHDTCOxIZhHNF0vFHM6P0Z
 MJUQSKJ9zIPiDicPxy3awY9uSRVXb0IYsi9ZlKGP7GuLOX5fFcNkeDYSPp5nax6jxrct
 AabHXXgdwLVreXRq68eoOoFS4K4lgwf9VDgXBQcXoNfReRsu3sm60vYd/RYxrcBUHP3p
 GOKkhma14Ca7sLPu2Nkiowzu6wzGa9IN8YsFgYf0zsbSa/MH4bqsySRhTcgaBCHrE07c
 G23LaBfdIiun1x41iJH5EMX59VieAOzZQo05ziM+wb0vbDh/uRw1mVTZ7px4fwJSI33d
 oRaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAy8lFma5yuJPtgtfoojQnUxTDscm0GFfXpfJI7Th9Ux+lu2jJo9HkgSDnbclPKBYHoV8+FKPKKAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsKBbzrN6zeTf1Bn01NA/XMjjbjr5fnZREfxxqe6u9nTTWJF7Y
 RNdjCyMpB1h/j7FnqlMTSji9tDkCkJfwOw/upXrIeu7tFeLMiCUl17jTcZwGlMM162ysD4uMu6O
 m82BT2aGBlDxOn2rG5bEVb43RasGJF+7XWkbA6PqENo4NN2h0INMFd34+adl7jz9j31cnOjU=
X-Gm-Gg: AZuq6aJi9zvDLOPygHwcD50ReyFQ7/OHkLueadVzNzR+UZDQVIB6Ef059p3ASagzPyA
 dEeCIIzTXEZlVWC724a35ctmbk6vIn4kTRZAt2EQ66miG3gaK98S1pqM5SR2KqrCJC303hpIznW
 88jzJV8DuasKXVyzltp1inj6ZKBkqBV7Kd0iectDfpJt2AXx3mKX60/RLgUjt11fKtAEvO0xNnl
 KlSdNUdwFItXm6zz0BkzPVUu/ws0pCm33JWbSsnuB4qWXDByajTLsNj02w/p74cVAePFOrjDqh3
 jNKfb5NALeDvCv1n90Kz2001eUEtpz+mE348MG/qRtvwwOPh2sOBJdehQsntZd33Y17Ii1vVqcs
 rFyU1NNDVj1vdf8khaPgp7vHhfYtf7WBIR1L+NjIMiwyIhq9h650pxOJEJHun00+KBBWAp8gBzg
 4j4FUuKFUmBF9l73CJWxlYB5lIIFI/Zg9MGGM=
X-Received: by 2002:a05:620a:3901:b0:8c9:fc46:235c with SMTP id
 af79cd13be357-8cb424afcb1mr449270685a.71.1771023784099; 
 Fri, 13 Feb 2026 15:03:04 -0800 (PST)
X-Received: by 2002:a05:620a:3901:b0:8c9:fc46:235c with SMTP id
 af79cd13be357-8cb424afcb1mr449266385a.71.1771023783593; 
 Fri, 13 Feb 2026 15:03:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5b062asm1806491e87.73.2026.02.13.15.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 15:03:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 01:02:59 +0200
Subject: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKKtj2kC/x2M0QpAQBBFf0XzbIppE35FHrAXU2LbkZT8u83jq
 XPOQ4aoMGqzhyIuNT32BGWe0bQO+wJWn5ikkKqQ0nGSEE/2FgJvMOPaSeUBcWMjlLIQMev9L7v
 +fT9UyhE8YgAAAA==
X-Change-ID: 20260214-revert-dspp-less-8426dee24b92
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3587;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i33TyAUL6ghJdbWFyMgzRLYcTygWgaYUFBacwDIWYoY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpj62k0mI3LT5UakhcdPql0XWEriNUOHLR+ZgCN
 V19RcwsqL2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaY+tpAAKCRCLPIo+Aiko
 1cLGB/9G2vD96HD1P3/HGbx+hqB96ArIo8y7ugP2WEmk+fgpw+zl+Jw0WEPFyqCfbEApY1zIfzk
 7GCfVr6camfzwpxfYAEPnV0r+JhY0fIvM/0LgndWQ4iVyoU+Q30ywgURP5/EGhOxNBHYNG5s0oI
 auTFdjy0fM05/O55R4PPWHRITrkS7mxa7y58KEVxYZtKCi0uwmQaq7s/DGkw9g+O1bwa4EUyC8r
 3efxcBwnXJC00xL5GrojiGanJPvRMK6XvEGKRtH4IDgBkxaao2ZQIKss+2ygs3kqKZWRhLPg+ZN
 dd9S4K4k1Nl/aT6tDnlpjqUn240/TocaBAjs71uqyuBbEti2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FvMIPmrq c=1 sm=1 tr=0 ts=698fada8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MJBLmyKdI3ciMax9VxIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE3OCBTYWx0ZWRfX7+3DXxd6RCRw
 0omCTgUdm6zIzA9TAPnu0jlXtbeOHnW7GLo83c+MYWVAJZPUw40AgUfGoktrhCUC425Z8d7yfqq
 0TUOtPU73xs4j8tMCG4fMShFjPb1nLS/9EVwcMOkSH90N70DzyHsW53Q6vUlbHPOj5ZY3LTfFiu
 TypSXtbcLFQvTP/+EiD8RGx1Na2+7YfvendtRt/VYH/a6g3HdWoldd/pe7YJyYKEskucZjCPOYe
 +XCmUrA0z+gNZymkVYdJUEPHiA0o6xVkdR1IgDuymc+CF7N58YzwooMMFphcqUChKwc3RgH63ys
 GK+7qdtPcV1M+oTvIYv5AZbGNgTsy2bjTELnwMgpiL/VaeaplnzUPr8iUSIFGJB6GnuL76eY/ak
 cFTKzuqibHUxInggho020MZ6ucHb3+zn/VUDYGy2CnW/ZnEwUx2mVS1xIu7l+AWDSScqSiXIf6t
 fvtZrGLakXj5eNHG+bQ==
X-Proofpoint-ORIG-GUID: brdOe0mtGoRqvTELsYZDYDEnCuX5_Gyz
X-Proofpoint-GUID: brdOe0mtGoRqvTELsYZDYDEnCuX5_Gyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130178
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EFAD7139E50
X-Rspamd-Action: no action

This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
DSPP-less LM first"). It seems on later DPUs using higher LMs require
some additional setup or conflicts with the hardware defaults. Val (and
other developers) reported blue screen on Hamoa (X1E80100) laptops.
Revert the offending commit until we understand, what is the issue.

Fixes: 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/r/33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++-------------------------
 1 file changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 451a4fcf3e65..7e77d88f8959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -350,26 +350,28 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	return true;
 }
 
-static bool dpu_rm_find_lms(struct dpu_rm *rm,
-			    struct dpu_global_state *global_state,
-			    uint32_t crtc_id, bool skip_dspp,
-			    struct msm_display_topology *topology,
-			    int *lm_idx, int *pp_idx, int *dspp_idx)
+static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t crtc_id,
+			       struct msm_display_topology *topology)
 
 {
+	int lm_idx[MAX_BLOCKS];
+	int pp_idx[MAX_BLOCKS];
+	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, lm_count = 0;
 
+	if (!topology->num_lm) {
+		DPU_ERROR("zero LMs in topology\n");
+		return -EINVAL;
+	}
+
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
 			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
-		if (skip_dspp && to_dpu_hw_mixer(rm->mixer_blks[i])->cap->dspp) {
-			DPU_DEBUG("Skipping LM_%d, skipping LMs with DSPPs\n", i);
-			continue;
-		}
-
 		/*
 		 * Reset lm_count to an even index. This will drop the previous
 		 * primary mixer if failed to find its peer.
@@ -408,38 +410,12 @@ static bool dpu_rm_find_lms(struct dpu_rm *rm,
 		}
 	}
 
-	return lm_count == topology->num_lm;
-}
-
-static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
-			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id,
-			       struct msm_display_topology *topology)
-
-{
-	int lm_idx[MAX_BLOCKS];
-	int pp_idx[MAX_BLOCKS];
-	int dspp_idx[MAX_BLOCKS] = {0};
-	int i;
-	bool found;
-
-	if (!topology->num_lm) {
-		DPU_ERROR("zero LMs in topology\n");
-		return -EINVAL;
-	}
-
-	/* Try using non-DSPP LM blocks first */
-	found = dpu_rm_find_lms(rm, global_state, crtc_id, !topology->num_dspp,
-				topology, lm_idx, pp_idx, dspp_idx);
-	if (!found && !topology->num_dspp)
-		found = dpu_rm_find_lms(rm, global_state, crtc_id, false,
-					topology, lm_idx, pp_idx, dspp_idx);
-	if (!found) {
+	if (lm_count != topology->num_lm) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
 
-	for (i = 0; i < topology->num_lm; i++) {
+	for (i = 0; i < lm_count; i++) {
 		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
 		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
 		global_state->dspp_to_crtc_id[dspp_idx[i]] =

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260214-revert-dspp-less-8426dee24b92

Best regards,
-- 
With best wishes
Dmitry

