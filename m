Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3849017E6
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 20:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660B910E1F3;
	Sun,  9 Jun 2024 18:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H1HMgaQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C0510E077;
 Sun,  9 Jun 2024 18:43:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459HhUa5025786;
 Sun, 9 Jun 2024 18:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pnCC1eCBgLg/HGu7nVSVY7
 PHMrfKVvumlukAnrs1Wcc=; b=H1HMgaQQQD22P2v0A7+TfbDTGTJd83BtsbMlWb
 xo6cFP+er4wOdzrEGomJxefb1fZrfbo3Vji/GA0hkCOR7iZo8vc+zwzw7Wo9E20o
 0STMpVXmzBEOkqzDdYKYElNcgfc6lQhuhgf3DxtRd/h5xEFC67MrgMCMBljwAluZ
 JocYrC9c0wQYKhVpVuZP4qVJj9HbRq/l8mF6pAovRpyhW1B0mSS5hdLOp6MkJLvh
 398EtzKK+pq0w/TrFrBZY66iKBioaQet70xF3253eLJZotRKZPdQP/zETgllbNQQ
 C5FutB8AfLWV4X+Ulekj0m4hasJljASFlNTWDd+Low8uQOiw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymea6j25x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jun 2024 18:42:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 459Igslj016770
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jun 2024 18:42:54 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 11:42:53 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 11:42:53 -0700
Subject: [PATCH] drm: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240609-md-drivers-gpu-drm-v1-1-89e9a316d513@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKz3ZWYC/x3MQQqDMBCF4avIrDsQYymmVyldxGSqA00qMyqCe
 PdOu3vf4v0HKAmTwr05QGhj5U81tJcG0hTrSMjZDN75q7u5gCVjFt5IFMd5tV3Q5RC6Lqbe9y3
 YcRZ68f6PPp7mISrhILGm6Zd6c113LFEXEjjPL0edEmiDAAAA
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
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vOb4KCfNPRdjiKspCIwi8ZbXRIcn7Qzu
X-Proofpoint-ORIG-GUID: vOb4KCfNPRdjiKspCIwi8ZbXRIcn7Qzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1011 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406090147
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
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
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
 drivers/gpu/drm/drm_mipi_dbi.c                 | 1 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 1 +
 drivers/gpu/drm/drm_simple_kms_helper.c        | 1 +
 drivers/gpu/drm/gud/gud_drv.c                  | 1 +
 drivers/gpu/drm/i915/gvt/kvmgt.c               | 1 +
 drivers/gpu/drm/udl/udl_drv.c                  | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index daac649aabdb..ee6fa8185b13 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1475,4 +1475,5 @@ EXPORT_SYMBOL(mipi_dbi_debugfs_init);
 
 #endif
 
+MODULE_DESCRIPTION("MIPI Display Bus Interface (DBI) LCD controller support");
 MODULE_LICENSE("GPL");
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

