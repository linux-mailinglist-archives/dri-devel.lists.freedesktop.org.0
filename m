Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F9A3CBAA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 22:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD910E895;
	Wed, 19 Feb 2025 21:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6YyJEnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB47510E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 21:41:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGX4Z8011609
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 21:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=WtJk7J+L8STgsfYU6SmyrwCAbVUZ+0/gGqo
 u6kln5js=; b=h6YyJEnpFmO83l55NtwqxqZb3fjuNT8fjux95Yak8rY34a/ljg7
 SIpSbC+5VqH5GVOUjXCHRt3E1qadunbl5OhYXIPVZ7nRzm90wcC6GLofZqnY6t7q
 RhkA0Sx3vQX3wLQPZPhzIvFfgNDV07Ep3ZGbc22cImmbtMztlgasnbqKN3iX5lpB
 qPqjdE4fnbYm76QxMN8M1REgKLaoS9P0X0nd7O5MrTyl82Eru2yipCXAMyD2BUfj
 HYiIw61U/gE2VPTl84PaMaP/yLazCD+m5hCkAcL/E4JZ/Rl6Jay0nQk2sVmu8gCl
 ugk3WNDUGjKXqb8G7k+rwtWL8x7BazNtQkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3m0ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 21:41:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2217b4a48a4so5004555ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740001278; x=1740606078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WtJk7J+L8STgsfYU6SmyrwCAbVUZ+0/gGqou6kln5js=;
 b=kTYGFq/HnRkXTe2XFxJcXZN940G9gVLtWZ7KZ9OMby2CEQPMM3D3RZ2cIIOC4zFZ+E
 zr0QcfxphEktmp3Pc3733j7phWuSV5MObJdcXksuwCvGD/dAAfNJ2ANVggaYJYh0k0CD
 wbvd7k0muCe2uFnDkPWKnYP71afT+XtbQcrh1YLp6sx47YpADb2rBezIH9kOarc6crRV
 YXPy8mtnhbaVTxB38A15yepa9tcf4eCyzwBtdEwvZIrIV0aUPmzBIH4BxwtCPszVwfPm
 HsPS7v34BmkqWEhrg7DJ091rxuee+wGmMMOpb4T0aUOjGFNiXcJVUZNqi8wUHSBnYgc2
 nwYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNAD9FKqk2gBcYxjGhXXHDEtbyDVYfQoPXEMcVMJ6LCJeFIRMYaqB/hp5cqgMtYMTs4p0vLsm6b20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0YvufWNwSyI1tqDkDtCF7HxngfaakEO4xF5pfPiHQic4FxQGY
 7GfayUaS1BRRfZeRl62bBzqsB4IO3bX060OVx6O1Gd9mXhGIKHMU4YZeGi7iTfCWdT7rXuxBps5
 AJde+OrmQ8NwH2BhnRcHCsNK+27+O1ZCvXB0r9VSiWg7fSLDhGIzTh2+kKw5DxihkTpBiVZ8Jua
 E=
X-Gm-Gg: ASbGncsSGFrGLiRpG+bbpKlJQGn4mflXY3+yFUFDWs202HKHUklEmg9kIWL5TDHsF3X
 /KOkRyUB0Rz9lgml+QWrmn91TT4f3ME1RGVsz+fCNnVXZ45pC75AB3by0PzFiwC3KjsIS+HpDBB
 bW6MN/sWQ3yFwcC0fCYqXWVf0EZH4b3+SKep8COosb3ySQVCnf/yYF+BjZ/G5g0BVcG+PkqCpPs
 c2opATDRwLWkH9DJin2zwnWZrzwy87iQFw0DDPh02C1GhpGusoIA8KkfO8Ksqjo6BcBcztuWdXw
 X5Pa565XOE94PdB2mkz48cSLgd8WnWmjHS8fBiAd8gdoNPHzC8LPug==
X-Received: by 2002:a05:6a00:198c:b0:730:8386:6070 with SMTP id
 d2e1a72fcca58-73261445ce1mr32387868b3a.0.1740001278125; 
 Wed, 19 Feb 2025 13:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYy8GSI+yB3hoPIZBl5aPJIOh94NXuDkh6EdcQ4qKTjkPx3KBxkM3IM4tfQQ7jjYkV93lZpQ==
X-Received: by 2002:a05:6a00:198c:b0:730:8386:6070 with SMTP id
 d2e1a72fcca58-73261445ce1mr32387837b3a.0.1740001277752; 
 Wed, 19 Feb 2025 13:41:17 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325a8236bfsm9732983b3a.31.2025.02.19.13.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 13:41:17 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Update my email address
Date: Wed, 19 Feb 2025 14:41:12 -0700
Message-Id: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S8vgWgRtiF4APcneQtKPdtCFArHbx4tN
X-Proofpoint-GUID: S8vgWgRtiF4APcneQtKPdtCFArHbx4tN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190161
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

Qualcomm is migrating away from quicinc.com email addresses towards ones
with *.qualcomm.com.

Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index ae0adc499f4a..f4b927e48ad1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -320,7 +320,8 @@ Jeff Garzik <jgarzik@pretzel.yyz.us>
 Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
 Jeff Layton <jlayton@kernel.org> <jlayton@primarydata.com>
 Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
-Jeffrey Hugo <quic_jhugo@quicinc.com> <jhugo@codeaurora.org>
+Jeff Hugo <jeff.hugo@oss.qualcomm.com> <jhugo@codeaurora.org>
+Jeff Hugo <jeff.hugo@oss.qualcomm.com> <quic_jhugo@quicinc.com>
 Jens Axboe <axboe@kernel.dk> <axboe@suse.de>
 Jens Axboe <axboe@kernel.dk> <jens.axboe@oracle.com>
 Jens Axboe <axboe@kernel.dk> <axboe@fb.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 950e8b7c0805..815a28c7e6fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19426,7 +19426,7 @@ F:	drivers/clk/qcom/
 F:	include/dt-bindings/clock/qcom,*
 
 QUALCOMM CLOUD AI (QAIC) DRIVER
-M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
+M:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
 R:	Carl Vanderlip <quic_carlv@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

