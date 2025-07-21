Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534BB0CD29
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 00:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7810E089;
	Mon, 21 Jul 2025 22:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBUwIuEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195F010E089
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 22:08:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LEev22012555
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 22:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=iQD4iU1b13+mJXTJjK7EXVdX561Lk/IT8he
 qfle1jcQ=; b=fBUwIuEZ4oUWL67Bn1xXjrYnCc1LCatqCPLeo9eFHEDSgdMxgLJ
 gGU9z2t9oX9iIBCcSUapmMX7wOdrG56j4Qfxj52QTrwuRm8PSAzHnUiSrSAgoRuc
 lRd0t4qNVYLlIF7nGZcdZHd1f0L1XH4Bj1LhyMeJsnLNWyR35In+etn/z1aBHTQP
 cdLhJYnn34CLgLOeHNoBI8rh0Xz+xl8QbV5vlO44fuxwJMwTk9v7m77FohV9megl
 YFolpF5IybmquHvhSZwKBzer/qOQsALat+OY+Xg6xXKm7UXXvKLYOnGKkviiU1cI
 ESTXPLYEElR2tfyr7kca3jXl0vL/SAzqh8w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6hm3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 22:08:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso5282426a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753135701; x=1753740501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQD4iU1b13+mJXTJjK7EXVdX561Lk/IT8heqfle1jcQ=;
 b=My3uzOiUsU94DKlWp6ZevcosOawM9GTZHjihyjY5PKLE6m2v+IEmxkTBU9sKFbTzaO
 0froR+d7kyodxGW7DfRaMFW+U6j4RaKATbzEuBcvW93W2+NGvWgJrZS7y3pR556s/cUc
 6MW95UA/Q471PhxJMzgPTEbc7xyNG5yXLAHSiejQg7z0lm9msRm5wtRv7fjBLxcG6zQS
 Ft/D19X0yzoNBDWeAQ/AJ86tDybvjCEaYA432HxCXc5T+CqR6vWzkXqcnbFctXZ52kDO
 oINWIp1ju+i8LLKIBX6L/LQsWrb2GZ4NHMbxfjmlrR5a6aHsurWlV2fYywhnJZ9EP9Rk
 EDJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR8todl24K9cZCMaXhzp+gFwjlMptcIowNhoaSXdTCbQR5qNpbtVXNSe0u0UReiVcLsOUuIZyxALE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysYq7ZCcWXWUQV2r0rkjZnXxyev0Rogb5g7gDjTtUQvYqGxOlo
 9r6yiUF7NjdUYg0Pqh9VP3MuAV4Hf6mztTdxqiBQvCtQLOlVeyIRnZWlaV+S6W1oln4p7eSBF5F
 2ivVEWbxT4myrnPRKT9yS/oLzWoNFqulkuxIg9502ekA3IEEQoptCytX6RtHrEgPa0Yl/sKw=
X-Gm-Gg: ASbGnct90D3Efvl6xyGzrH3AEFpx4xBwaFCQ5h+9ZTmhHJZf346QWKmUYoatZdhUUoK
 D0801NG/dAGgCQXmKMP3dkh6oUIaQQN4SMqXXBSoKP0gF4uphHqP26Qrcu/kTe3xdRX1iADTG8P
 KWF4RcVrnq68IdhogXne0MRrHibZU1gTJEQhjWnuujXvwNS6o49uiCShd8vlHjkum90Lelxa8Fy
 2KjjkiKCmeJw3ewVKQKq4hIOjjJbeOQijJ5cJ5vyb2nPhAr93DqFeqosKFOmIJcw/jLGzv44jCQ
 fVigbxwObsB39vZ9DPhNU2wkFCUKzVA6xgZTiKEuR5201laSfiwQNKi71D9UnieQE6BoO69EL+f
 n8xaA5HsXIUhpkT+7r14L/Q==
X-Received: by 2002:a17:902:f642:b0:234:a139:1217 with SMTP id
 d9443c01a7336-23e302a2b4cmr203854745ad.18.1753135701585; 
 Mon, 21 Jul 2025 15:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcnHZWd8CeTH7ihD+mg7cdkPUSLou1oEhob5J/ysSBy9goh62ETv61j3YmyL1ASG5Acc3yiw==
X-Received: by 2002:a17:902:f642:b0:234:a139:1217 with SMTP id
 d9443c01a7336-23e302a2b4cmr203854555ad.18.1753135701195; 
 Mon, 21 Jul 2025 15:08:21 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d9504sm62929755ad.179.2025.07.21.15.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 15:08:20 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Update email address for Carl Vanderlip
Date: Mon, 21 Jul 2025 15:08:10 -0700
Message-ID: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687eba56 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Gbw9aFdXAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=6hizN-QJURE5XGzEQWwA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: f3O0DfRcLtHqyZcNyTw7tbRzUcp8bYIO
X-Proofpoint-GUID: f3O0DfRcLtHqyZcNyTw7tbRzUcp8bYIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5OCBTYWx0ZWRfX4KY5ZbX8o/h3
 sIJ/uEOC3ZXEodv/nhQln2g4mYsjUzT5iGNXzHPhPD9m5h99QexreqF/zgHYi/Eu/9KOuAalF+Y
 LWGWCdEymaLWaFEy8DGaP2BDXcMIMK/SUBf6ru8gjhUcSXg4tEvvEhEWzFeAU4swqRmqlyXuT8D
 rNF3IOrex6G7Uvu545QD6E4qoh6/+mjPAZhZMBeUOVx+CZi0cT8ls/zEB+OeQ9LDE84BaAaTIhr
 jEgtHsDdXFshlsyDsE2mEylvcZGhCnmo+jpTdbyj4C4pHylTkD5fBWCe+g4VyHOz3eqloRoINR+
 hYCqJwBAGFyvexr+2Z9ptsSWf0xLch/FcoUNEeQhwqFSQYMRoZ4WRM8J0bVRLeIi5E8TGD/aOkw
 LnJ98f73fk58Py9kWyVZtYDteP4HdS0Mt2D9YwS2TKT0kSRGU5mjH4DDKe+Ki0Ix9enKGqBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=685 impostorscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210198
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

Qualcomm is changing open source email address policy.
LKML and other busy mailing lists use the oss.qualcomm.com domain.

Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
---
 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..d30f31ea01a5 100644
--- a/.mailmap
+++ b/.mailmap
@@ -163,6 +163,8 @@ Casey Connolly <casey.connolly@linaro.org> <caleb@connolly.tech>
 Casey Connolly <casey.connolly@linaro.org> <caleb@postmarketos.org>
 Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
 Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
+Carl Vanderlip <carl.vanderlip@oss.qualcomm.com> <carlv@codeaurora.org>
+Carl Vanderlip <carl.vanderlip@oss.qualcomm.com> <quic_carlv@quicinc.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
diff --git a/MAINTAINERS b/MAINTAINERS
index d97e091b1742..5bf68fc65114 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20400,7 +20400,7 @@ F:	include/dt-bindings/clock/qcom,*
 
 QUALCOMM CLOUD AI (QAIC) DRIVER
 M:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
-R:	Carl Vanderlip <quic_carlv@quicinc.com>
+R:	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.43.0

