Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D2903E1A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144FF88EA1;
	Tue, 11 Jun 2024 13:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ACXUAdni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9010E166;
 Tue, 11 Jun 2024 13:56:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9bbQN013082;
 Tue, 11 Jun 2024 13:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=jWwTS6KJCt0lEEIDSYms9t
 vUy5UMkXCmOkbk0Uzj1Kw=; b=ACXUAdnirLxPiRT2Bbq/F91X1fV3xBt4brPukQ
 tUaW3sTgJUacjxY4F912o1OuEqG+mE7PQA+pIvuFkWZioh9bJxc8x23DiUY56wW8
 nXOUeEkUQl3EDicXa8e/EJLSASbpaQX9zqF5CWllzBNyrz82tRCr0fE7It++ho3N
 eCSbIv2V8UrHLfw8wh7NF0ItblI9FftcXHfmhvURp6TiWvP1ZnHzD/cC2jpq6fi1
 iluSn4cY9zdEQD44OKE2V+akVlGsKpZJRufk8k6AX2APmmJUYh1IGkMh6sfwJCaJ
 cz7adpt1dqn1uHjHnRLZato6Xy3MZSJYHSCspX5ymhcU+/uw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm458nyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:56:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BDubgH027092
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:56:37 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 06:56:37 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 06:56:33 -0700
Subject: [PATCH v2] drm: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240611-md-drivers-gpu-drm-v2-1-0b7d9347b159@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJBXaGYC/32OSw6CMBRFt2I69pl+lFBH7sMwKO0TXmILttBgC
 Hu3sABn9yT3t7KEkTCx+2llETMlGkIBeT4x25vQIZArzCSXV15xDd6Bi5QxJujGuWgP3GmtlLG
 1rAUrwTHii5aj9NkUbk1CaKMJtt+r3hTmBbxJE8bd3lOahvg9LmSxh/6uZQECao3aKFG5m1CPz
 0yWgr3YwbNm27YfDsIbgNUAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Dave Airlie <airlied@redhat.com>, "Sean Paul" <sean@poorly.run>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gvt-dev@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cPRmd3M4QhByFG9Z8m_AHs22QTegWQ4G
X-Proofpoint-ORIG-GUID: cPRmd3M4QhByFG9Z8m_AHs22QTegWQ4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110101
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

On x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/gud/gud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/i915/kvmgt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

For consistency this includes drivers/gpu/drm/drm_simple_kms_helper.c
since it contains a MODULE_LICENSE() even though it isn't built as a
separate module -- it is always built as part of drm_kms_helper and
drm_kms_helper_common.c already provides a MODULE_DESCRIPTION for that
module.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
This is the last in a set of patches to drivers/gpu/drm. The
preceeding patches cleaned up subdirectiries that had more than one
issue. This patch cleans up the stragglers. Let me know if any of
these modifications need to segregated into separate patches.
---
Changes in v2:
- Removed all references to drivers/gpu/drm/drm_mipi_dbi.c since it is already
  being handled by:
  https://lore.kernel.org/all/20240425125627.2275559-1-andriy.shevchenko@linux.intel.com/
- Link to v1: https://lore.kernel.org/r/20240609-md-drivers-gpu-drm-v1-1-89e9a316d513@quicinc.com
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 1 +
 drivers/gpu/drm/drm_simple_kms_helper.c        | 1 +
 drivers/gpu/drm/gud/gud_drv.c                  | 1 +
 drivers/gpu/drm/i915/gvt/kvmgt.c               | 1 +
 drivers/gpu/drm/udl/udl_drv.c                  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index aa93129c3397..ca5a2222ebc0 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -501,4 +501,5 @@ EXPORT_SYMBOL(drm_get_panel_orientation_quirk);
 
 #endif
 
+MODULE_DESCRIPTION("Quirks for non-normal panel orientation");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 270523ae36d4..250819fbc5ce 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -453,4 +453,5 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_simple_display_pipe_init);
 
+MODULE_DESCRIPTION("Helpers for drivers for simple display hardware");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f1..db2b7d2e246f 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -678,4 +678,5 @@ static struct usb_driver gud_usb_driver = {
 module_usb_driver(gud_usb_driver);
 
 MODULE_AUTHOR("Noralf Trønnes");
+MODULE_DESCRIPTION("GUD USB Display driver");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4f74d867fe1a..38830818c120 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1985,5 +1985,6 @@ static void __exit kvmgt_exit(void)
 module_init(kvmgt_init);
 module_exit(kvmgt_exit);
 
+MODULE_DESCRIPTION("Intel mediated pass-through framework for KVM");
 MODULE_LICENSE("GPL and additional rights");
 MODULE_AUTHOR("Intel Corporation");
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1506094a8009..de78a9b0eed7 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -160,4 +160,5 @@ static struct usb_driver udl_driver = {
 	.id_table = id_table,
 };
 module_usb_driver(udl_driver);
+MODULE_DESCRIPTION("KMS driver for the USB displaylink video adapters");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-gpu-drm-0d9933ac8281

