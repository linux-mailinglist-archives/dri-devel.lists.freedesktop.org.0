Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A947ACF6F0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6E810E94B;
	Thu,  5 Jun 2025 18:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXA9Wbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB1210E9D7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555IC9Ro007519
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
 O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=ceXA9WbuldePiP1fwN6+udy+e1k
 zqyUbAgBYusWJWfHYY4kfFm/K0aawt/sYiW1G8BSm2EE0nTADmh60oO7FVz0vQMR
 z/tF0PAbx7foEOk99mZtnt4zHGmpblk0em+WjnIKT6Zc74UFxpG3rXjmBWPpsLZE
 W60X/0laxlF+KYplboT16JvyXU6EAApu3SPYzU3f/43CDr7TSQa/eWApHT3uV6fW
 5EJmuRZ+J6pX9bLeQfeEhhs920qfkyS777SN2amt0KYFv2EUYfo+vpzzESp/BGB9
 hQfgixpIwqPw9LEG+Q7YY4/Hxkf6xl5cdU4uRviMZgtv+uUqIFgr3mh2o2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747adea6ddbso1092224b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148402; x=1749753202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
 b=m53XfovqlBPw+1ILsT4czHEpxqsG4q6IX/kgbVspjguBafzCxUq6C5XGY/j5cZNSLq
 cVW20D5ZxcHCayJDYplR2ap84efL1sPB6KZ3YenqbohNd2VP8/p0rBdo0+/mxhLJcD5t
 zk9EJ6Z5dm8sfXjDO2JBtZucqb/xQbWvGGRZyPrRzPwj7/diL4Az6gEocKRytBa8kliu
 Ritsev2+tUQDo/k1W5yxXmHaRAH7i8IUadQUl8XjbC+pUKoxVrAPRBJRw8S9anqGs2Qg
 pst+Oh5j3EIFIXSaJxXIyc5iApASrHXl7V8oGuTYoe7BE9Py5Ekmh5x37KjWPJ/TMnWp
 a8Eg==
X-Gm-Message-State: AOJu0YzZsZqWRLc/XUVA417YxWxtHXVN9OxKmKz+mJc2cCMeYWiQeY1+
 rKV3znamnAyM3M6amrobG2rx7nAqFRuqRDESrMi80JsuQLJbv549sIqedG9JMdvmGDOcxIKeS8m
 WZ/6g44gOQHEovOjymk38lFlfU7qgoWYtwzhm5hEhnmOU8s2bbtzEI6ehB83HcCZv6Sgd/YnvnR
 Lhcg0=
X-Gm-Gg: ASbGncs+UtWdqa0tHtkUmpmjXxybUSglvRcaJJjtQC/8E7YH3TEzK9Y7HDIkAsXXT44
 glisFWBoKG5GuqtkczaPnpwIsaWpqHXK+SlbI1O40G8X2e2YagEpmHRgM2xpMrCa2eXlY4cZ4pe
 fpDMStlIvrb6FUrpIW10nQ9DN3VgQo9zytj+WCoQMpUUG9naUeTf+kFKBzydzq/E33lJJ+/WtNy
 K7QrfB+AB8Xk+/PruPVspUPguLgAU6mo/NKU0Tc5L1+c8a4M23N5nNMsWGb6adG4Bjm0PL55kaY
 RHIXOEkRT+KYUeBDxCoQg2i+Cd8wpqmY
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-74827e80628mr887811b3a.10.1749148402069; 
 Thu, 05 Jun 2025 11:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBuTKC6/naA3f/kWh7qz2oby28B2fruyWvYz+LKZRKvKVwuNe4K9bJXRX956fiwilQlAHacg==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-74827e80628mr887775b3a.10.1749148401687; 
 Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeaba2esm13094969b3a.49.2025.06.05.11.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
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
Subject: [PATCH v6 38/40] drm/msm: Bump UAPI version
Date: Thu,  5 Jun 2025 11:29:23 -0700
Message-ID: <20250605183111.163594-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e30d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfXzhzeirA5dhEs
 NS2QA+7X40kRfKVtENbGfjFgvAUdh8P/Yo27/PIL8cBq6Ql4A9jnsiwjYumMn+RGbjQNJNSslCW
 Kv3jO28WTZjy3zTpKZyxY3NQ/SCtNXDD8HDvCw/6UG08RBGmtDhdvTAd2uHyyxohEGKckkuQaWR
 /r23QE7w7Qa2llcRf6jJtTkKlUDWMYX9sdXf50Lgk0RkWcmLqag74/W+SlP/AV+jz1TpQC5wMOE
 ExBbm714svVjguJemTBYawHn5u/Dxa2Qj3kmyhaD52ZfHh1yifs3SAC9A+RGm36VkKzdF3XGdRy
 5q0kmm+adajjxDltRTXNEAFNkCpg3P+a/hhngqbmdyQBp19t1oQk5/Y9TeAqOW5M0JSQxAbjiFD
 kE9Etfb/yy1r0ON4UuyxyvlIA9yg4gI1sqxAosQWWd24KG2NVTcHqvvwxqgN0aM4RUUrZA9y
X-Proofpoint-GUID: NIRkKTReBlpQozWw-gTYSbyfqt-41moW
X-Proofpoint-ORIG-GUID: NIRkKTReBlpQozWw-gTYSbyfqt-41moW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166
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

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0

