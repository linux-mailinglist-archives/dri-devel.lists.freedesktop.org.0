Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D6AED068
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014ED10E35E;
	Sun, 29 Jun 2025 20:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4u/sYh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D377310E362
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJaqma029289
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
 ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=e4u/sYh26Nu+yUfdzM8Vm2zWilv
 XJBsX7EHwcKoHwP8YGOgaSdTUZZ2vzfbSEGoboK/KdGO1Z8343Ihc4Wjw4yxmsMD
 cZN5TwIeKJDgr0pv6b7dayED+I9nWDQdu6/S9NOZn9VMO8Ml90KzkDNGvglE7QnR
 z88U9I+Xw6H42rEGwHzV4THbVlu78CBK1d1BYeqXKxZoE1Tg/ODFQL6Lf5RXqDAW
 28tic4tDS5qdoKNkmzTFgGaBXpmEe4tgjFbS/JxU1Gd8Y3qYVjjyxWnlgN6Xktsk
 Dugrte7Vxjnrtf+lfibvnFa7rd/VL8o0/Nn/LIIX+TLVXX1C2ImXfjo3vNQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2msg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2c36951518so4382117a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228188; x=1751832988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
 b=MAl9KvlDLgWAwX9uDVtYIGRd/eG5hFwKeK7Yh2Fy3+sEFuPcGskoRv860cybovKr2t
 zYX0WTWZCR+XbaUgMTRiP9lcZ3qPo98eVrNbB1ShS5K/9ZKQnRfIfF2KOFijQ9Urhe1L
 mLPp0vB0nqjacQPkVNrYE8KEOFm1bjKwhWFLA2R+isfq7QtMYMQaVMZDzfU63PPEJ771
 Re1Hv+MNEgQOkIW1DBnhFfGHSFYHEw6AaMh/ePoml2xlCtvVfTTYkZNDa3/2Qr1cSzIE
 nLvmNGh/epHG6oW9a3QT+mN+He7yzpB8enreKSsd2faM9+R/P86g+oVBTkw9gUs+XPld
 uBrg==
X-Gm-Message-State: AOJu0Yyfbw70XdWhEO65zHNAYiUkQqfRi9Rmz2eH3Y8DT8P7uwqEbxzY
 xjxumDR0NjQ/2gD6N1MucPBCBB3xb2nI3qtmqNWwt3Yqk0HIlkaVgtOX2oKJbPgRV0BX7++Ahdc
 1WQh8sG6zrhsMLi5aQv8BeJAop1XWY3qumDj40E3m3OsTS+4NO/hfG80Pb+/B1FcjLP8FbUxlAM
 Cenrg=
X-Gm-Gg: ASbGnctUKcvtJWylN3QBGYaA5QUkMGHq/IVF923BWERzOv4x3waar5o+UXWtfXpkaUf
 R2y+ZUz1mUwHOl8xx7J8II6JAgta3EvYB5wLA5hBQZtXjP4sKGKj72eumlfnNt+ho9hlbMQ8pMW
 dOD4mf/oHRGhELzC6oBLLNe7ibil9POu9DDOs66n+2KPjkSA39HhdF92P89SyBupfTbeHLceFC/
 gh/gYniiOiCJBvTJLMq6s26fb3aUemtqWmW4ay/y9oQx78lyepdDOrmoVFnLtgieLHZkXr8SNL2
 2R2hjIcBUL/CojUbp9xqb8FxFqMN7V4lUQ==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id
 adf61e73a8af0-220a181b968mr17871078637.22.1751228188448; 
 Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxbBSzM9ICK5hml2CqQZ7X32XpGFPJlqTsRIpEN5BqVeVXDnuT+nk46z1uPRQyZhJCmaLVA==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id
 adf61e73a8af0-220a181b968mr17871048637.22.1751228188064; 
 Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541d233sm7603622b3a.61.2025.06.29.13.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 13:12:55 -0700
Message-ID: <20250629201530.25775-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f1d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: rwYMtTwukyk5uE68VLLP1y9PQMhdsCmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX8THn9O6s9vdr
 E51YiGIfYbEiLlA5/JvSGx0GrrV2EI69F9QTgTVK11DA7rmoXJ4dH1o2AT07U0cH+0ze9eKRxpR
 Rh9XQjrnSXWpo0mSy2dkPvEQ4Ntjai1x/Kw/gFZa1VIyhME+hIsRJXGj8u8gkOn7JH8WZBNiMfL
 fEvoXXrWHBruT1okTgzvfQpH/L57fkFbBgK5Mb3sV7cA+NzBQJr69d2Oqm3wjGfFUPqryzzXsTL
 Ufu+WNiU5N1v3YKVLRG0rt5WuGD8BIuyndvIZrC5TABtUdKse4s8I7ujtqJhXQJsaKOws8oi+qY
 4sRZpOGR/L1oWFWhaHEE4vyVPzTl2lFuRnuUqEKW6KcVtjASf+cWe3m82BTaRhHD4WaRKMRFMlu
 n9mY+jTJ9ucaOhozTewsTteEHlOdR0a6Sy1YF//rSKCJCPHlHkZT83zw7PKofpxWMcDwSyo1
X-Proofpoint-GUID: rwYMtTwukyk5uE68VLLP1y9PQMhdsCmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.50.0

