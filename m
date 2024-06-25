Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478B915B9F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 03:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069FE10E2B2;
	Tue, 25 Jun 2024 01:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UxTtfnd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC3410E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 01:24:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OKPawb020252;
 Tue, 25 Jun 2024 01:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TGgQiO3DHhSPQrnbxpOMnq
 EvqzOYsn3YIaLa20v34S4=; b=UxTtfnd/D7aMmQE79aL9pHv5eXam6+9+zexeOw
 XEe6DxpHF6d3CXSY5wN9qvjODSaAfBG8sTTQv4jPx9IyRNcy4NZhv6wMuty6vkFD
 PpON+ufYBIH5uVlJeBnGJ+goL4GyTKc6iO/8CiDTgRpubFMyDX8oKzlSfL3aGPwt
 jHfimUMp6J4vQl2ul59UQibUwOlKcgW8DjRZ49vG//Jf6pFtCJqIhaB39/M5Z7RN
 udQf2kCumaM0jCp0wG6AS8zvVtzqAzRqkXbak7+HK1UEgF0D6hAHj2ZyhvScWATV
 PuIp2VRrOTcdFsq1z1A93lVn8MUYa0HWsVTljfmwXKpf+ERg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yn17v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 01:24:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45P1O9Tv020112
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 01:24:09 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 18:24:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 24 Jun 2024 18:24:07 -0700
Subject: [PATCH v2] drm/ttm/tests: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240624-md-drivers-gpu-drm-ttm-tests-v2-1-76bb765e19c9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADYcemYC/42OQQ6CMBBFr0K6dgwUxODKexgWtB1gEluwUxoM4
 e4WTuBikv8W//3ZBKMnZPHINuExEtPkEshLJvTYuQGBTGIhc1nldd6ANWA8RfQMw7ykbCGEdMi
 Bob+ruuyrGlWpRVLMHntaT/2rTaw6RlC+c3o8pG9yywoO1wC244D+6IzEYfLf86NYHM0/x2MBB
 ZimKmRpmpuq9POzkCanr3qyot33/QeDClwc7gAAAA==
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q5M6Zy3UVhSSizd71Wwtrs0Vof4sAJWx
X-Proofpoint-ORIG-GUID: Q5M6Zy3UVhSSizd71Wwtrs0Vof4sAJWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_22,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250009
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

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_device_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_pool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_resource_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_tt_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_bo_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_mock_manager.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Rebased on top of linux-next/master to resolve conflict with commit
  "drm/ttm/tests: Correct modules' licenses" as well as add descriptions
  for two new modules recently added.
- Link to v1: https://lore.kernel.org/r/20240609-md-drivers-gpu-drm-ttm-tests-v1-1-d94123d95b4c@quicinc.com
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c          | 1 +
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 1 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c      | 1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c    | 1 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c     | 1 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c        | 1 +
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c    | 1 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c          | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 407c31b21872..d1b32303d051 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -633,4 +633,5 @@ static struct kunit_suite ttm_bo_test_suite = {
 
 kunit_test_suites(&ttm_bo_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_bo APIs");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index bc8281c03420..1adf18481ea0 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -1221,4 +1221,5 @@ static struct kunit_suite ttm_bo_validate_test_suite = {
 
 kunit_test_suites(&ttm_bo_validate_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_bo APIs");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 0f235a834ede..1621903818e5 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -209,4 +209,5 @@ static struct kunit_suite ttm_device_test_suite = {
 
 kunit_test_suites(&ttm_device_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_device APIs");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 70f40814b26a..b91c13f46225 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -301,4 +301,5 @@ void ttm_test_devices_fini(struct kunit *test)
 }
 EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
 
+MODULE_DESCRIPTION("TTM KUnit test helper functions");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
index 7f34fecd3fef..f6d1c8a2845d 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -230,4 +230,5 @@ void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
 }
 EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
 
+MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 5d4dc5b1c6d7..8ade53371f72 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -433,4 +433,5 @@ static struct kunit_suite ttm_pool_test_suite = {
 
 kunit_test_suites(&ttm_pool_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_pool APIs");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 77be0942ab62..9c2f13e53162 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -332,4 +332,5 @@ static struct kunit_suite ttm_resource_test_suite = {
 
 kunit_test_suites(&ttm_resource_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_resource and ttm_sys_man APIs");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index a8c76dbd6913..61ec6f580b62 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -398,4 +398,5 @@ static struct kunit_suite ttm_tt_test_suite = {
 
 kunit_test_suites(&ttm_tt_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_tt APIs");
 MODULE_LICENSE("GPL and additional rights");

---
base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
change-id: 20240609-md-drivers-gpu-drm-ttm-tests-f7b63f46eb3c

