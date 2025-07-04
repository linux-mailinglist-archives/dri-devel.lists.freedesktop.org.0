Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED64AF99F6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 19:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E9610E359;
	Fri,  4 Jul 2025 17:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SP2f9R3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A6010E09B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 17:44:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564DVau7019593
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Ln9K1aZ7occVpcksNgIQY1Xb6OInD1HFG8L
 +w5gb4lw=; b=SP2f9R3IZG/DoJI+RUU3QJ3PvGBOAV/A/nJIWA4cAVoqnofiY+u
 9nLvPSYvT9mXGDGLbSsmVNLcfRY+dmHhFo/Op33lTZvWiNocrDCtbuXOGyl1WZXu
 ePiyu1opSy8b9shUreWgzOWL4jfN0LsDnxP3GU+mAD/wp0HyWo7RmMPaY88xeUwz
 hftUSUYLo5kbNSyqX73Rl7PJkYStocg2dwg7JxsXtm3AjAyS3KMTXYfjKk2X0XfM
 0UnGE0o9LalVoL1WFqxq44xIP2GvWuqrNuVY16T9NV3qFZrdgPzbDHA0J4qInbAa
 OU9vXg67MbIFIzzyloLHFOF5uuZQx2BIS0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxvpxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 17:44:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b362d101243so784314a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 10:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751651079; x=1752255879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ln9K1aZ7occVpcksNgIQY1Xb6OInD1HFG8L+w5gb4lw=;
 b=i/n3mgCpM70I9ZAGkR0SxSDtYDJ5TvaqlxaBSuzbIYkhG4THrG03wjqzyfFPfR1oe8
 U7o7qoOD7N7s+S4BmGyGBnn6DcHGIKYuPZNYtbqA8L2P+ifxeve5a4XOTTqaiEBvOOq0
 oaEux3WqhV6VwQSh9RZM3Wq0yHpskBj8tpnSZiarDbMVpd9gs8AsH1NOZ3AumUZPAVKf
 PZmGObyqeXe/Nz0MdCkc3nGqGOAsq6sz6UxbxrcIPpeeLiqzYePK6PVm2MR6lWuw9sy8
 6aOOs9M8Uu3ZqujQB2vRuGJvT7iCVNdjjvtfPOMYBH3xwA/z4asj26QuPaHBB+grqF3Z
 wIeA==
X-Gm-Message-State: AOJu0Yw/2lhhYLpdlH0Jv983N854UmrZfVk7QMicKDNU61rE/kp1bZkw
 29Ml4uYMOMoqp1EB4+ItbsVv2MhF2QlvLaltlgn7jEOY9QP6x9lA2N2eAP+wYFPRflrGRnKPkfF
 NkeYVU27k62sKpxNrpvXUAfEsY6xoex8qwsFQfPzb2Y+veGGODaVU1ecCSR3N2Xw2YpkU1cUvXt
 jdqEA=
X-Gm-Gg: ASbGncsU0B/lnAvJMGLdrh/LhU6cv/0ueFX5UhSB8qnUu4HXrdKu+efqMepx0NCyCIj
 GaLoeL1kGPW6uTduaIIttpZl/hJhHzQ3kve2OtSj8dIcN1kEDjq9Ko0PvPVlUfJbf9qhoo/JxkO
 J/pTG1BB47up/WHqkLERbUmQ4hFlGspMAnLYaqsvqqRpSHggY1YrkV6JqmCuqbYlOgcYHh7G/iW
 PruQ8ChvjmFNiWEkeV+wxqO+ObZgLqkbeBQHTlF0uIQfwq4o+SLwFn7JwnE5cV/yl9+nWtapfNZ
 OhuzjdOMu6XSQidZ/J70yZ5wWp37gQ650g==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id
 adf61e73a8af0-22608fb3070mr3625361637.7.1751651078741; 
 Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Jl4EFpWHf5IwmZK4Vr8g/FAU4AIrSYjd7kWPFYX4w68L3NQh92fr5lAW9BcjJu7BoJ7+og==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id
 adf61e73a8af0-22608fb3070mr3625338637.7.1751651078312; 
 Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4180dd8sm2731263b3a.100.2025.07.04.10.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/ci: Uprev igt
Date: Fri,  4 Jul 2025 10:44:32 -0700
Message-ID: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNCBTYWx0ZWRfXxfNG+qZC+5Ag
 n/40Sc5h4XXwk61wCVTFOGvL1T7KRqtADsdYRlZkdETN3kDC+Af2uO1IRSQP6WLurZIZxWUSjIj
 jKVFa7citrZcsIZGefDHySWIahhJt5ANdoY+upqQQ424yvSBgGB/ttdf9IFLJYLX/kSEt9Ghg+U
 gGhoPw4dPCnoqt2Seyh1uSKf43gLLdct9mk8UDaLYYWmqCpzOifGmdutSQ6KSdZIbaEjJZHv6oo
 Opazkuvht4BwaBeCyL1ejuUf4WFUaqqLAuWM7BHdm5w+mb9pes+dYIqwCvvloAzRcGj3RzTNueL
 fturxkeLYNBrgEPIbd6z5olV6A/OCmC/Xt2E9nQaU1+deGf2T/GPiEV+sFZ8Xvu8r49iSR+pgZg
 AgVlOy5ZI8fIg8TlCLcHCOJqZu39FmPF4lYjgbtSZeyoLa38GztlI08IgJsRBtu3PYV0T8W8
X-Proofpoint-GUID: kN1hjcF7gDiQAHeyskTER30WgC0N9chy
X-Proofpoint-ORIG-GUID: kN1hjcF7gDiQAHeyskTER30WgC0N9chy
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68681308 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=8iDXaJqXtVj3SukbGHsA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040134
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

Pull in igt updates that are a dependency for VM_BIND, and will reduce
msm_mapping flakes.

Skip msm_mapping@memptrs on sc7180 (the test should be checking for
preemption support, and skipping if it is not supported).

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
 .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
 .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 6f9b7beddcb3..d502d146b177 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 04bedb9238586b81d4d4ca62b02e584f6cfc77af
+  IGT_VERSION: 129d5b10baaadea1d6cd6377341c4cb42e7ee6fd
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.20.0
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index d4b8ba3a54a9..154b047787b2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -32,3 +32,8 @@ kms_display_modes@mst-extended-mode-negative
 
 # It causes other tests to fail, so skip it.
 kms_invalid_mode@overflow-vrefresh
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 022db559cc7d..a9bb3e1ad75c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -23,3 +23,8 @@ core_hotunplug.*
 # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
 kms_display_modes@extended-mode-basic
 kms_display_modes@mst-extended-mode-negative
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
-- 
2.50.0

