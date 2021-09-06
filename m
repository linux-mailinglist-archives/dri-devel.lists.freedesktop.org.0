Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF055401262
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 03:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51868959D;
	Mon,  6 Sep 2021 01:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC558954A;
 Mon,  6 Sep 2021 01:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMrJMVf7k1b6mYx7eP9IQ2NDvgG7j7sYXVZWZ4UDaAxqu5TrQaJ4ZDFqj1TZQitqKeauf715JgYq+u1+LbnXgVOEkQFPFsZEBeO33WFNcYN2xZLrBm7UeHL6s3g/N6dCY9qhdK0rQ2GEaTKDTffakuQ5UrTf6B6x9MswlUTmMVG3hsntdHQaOvC5IWEHnJXr9+Wm6k1nLmeOfoXAicg9oZoWtSEGH2pFF01VvxU+X/5TVqg5guuW128VW/uwrZ1RixC37dpteLenTOrVS1p9C7h0QX724l85+6Tj8QZjcxo+ldqAe42JHluN3tRBI5jvaCo+EXpM3KqAhPwuonR0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uUPblAhfqg7vjw9iGgeqrvdzecPY+cZICHIiiiSNnVE=;
 b=FNr6CluQJgX1xu5MyPlYE/B7/iexYa2aOCL3d5glE50nwTS6DcevMcZTYZDzKDUNhM5czg7+M3Pn4ygFTaV+oIOlV7DEe6uBmEXepyvtArQaNTW1AiSN2PfXcLBaxmXwQNrM6IxLaMYdwTw4JwInBSWiKB+GrwpXlGbuL2Fl4Kaz+jm5lwW22G2hw1QBL6EvEC8y/2UFVFpdUNHa++hWL8dSDnrAtzf2iDynwkBGmUVW+GuVBXRmKE6iq7EHK5LwurUekiTRWcAx65eQroijenMgTCqv83YBwICDtNnysRYRX2DhUNzltVUc7abba4Xohw1pNKXngSAUB5g8qC/0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUPblAhfqg7vjw9iGgeqrvdzecPY+cZICHIiiiSNnVE=;
 b=2J1DtxTxMYWnOCF/qeUoVs5ukKSZ4HdGmJvcS+L/TDy/JD+fgr+4m4LW8FU99muX5Z67Byw0p1DyA1vNuT1TKf3xiMTG78XTerUl9vcrm3jPscEuHBmidCmZrDzlXHuWFdiweu9pYT9tiW4XyPuAvaNAFNEz5YDe7Zfe3Hc7Ifw=
Received: from DS7PR07CA0004.namprd07.prod.outlook.com (2603:10b6:5:3af::13)
 by DM6PR12MB2874.namprd12.prod.outlook.com (2603:10b6:5:15e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 01:12:25 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::21) by DS7PR07CA0004.outlook.office365.com
 (2603:10b6:5:3af::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 01:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 01:12:25 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 5 Sep 2021
 20:12:22 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <chenli@uniontech.com>, <dri-devel@lists.freedesktop.org>, xinhui pan
 <xinhui.pan@amd.com>
Subject: [PATCH v2 0/2] Fix a hung during memory pressure test
Date: Mon, 6 Sep 2021 09:12:08 +0800
Message-ID: <20210906011210.80327-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87a14dea-1be8-46c6-7ec0-08d970d3631c
X-MS-TrafficTypeDiagnostic: DM6PR12MB2874:
X-Microsoft-Antispam-PRVS: <DM6PR12MB287449212B8181230140019987D29@DM6PR12MB2874.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gr9c31I55T+kr072SGNti0fakNTxMI7/lHw4mZzvq9gHjvWqnUnGjGqmpqLrKg+/X9tGwqvduZPHD/hMUYprfojlAEqdShL0EEIBw92li3FPmlEQtTTK+grPH46HSplMMrlKB4kriL06EgBoQpLoulP1/b0zMv+KvFkHFmUnOT7lXDJn3gNvVUdcltfFKVzKWsic+3GyF0tEZi6th74LNP4E0eG6zyidvcr7Mllc/rasqjiUX2TaXIfymaU3HTFLh8HovIudDPX9p/HxSgA55va2DkFHDDYBHgtzmbcwRN9fZwoZ/ZgO+w6xmwo9qQPVRC+ZMO6Z0ZPCXBeoKfELk7nS1YmlfzX6FEQoGa+Qi8PA7fv0HXOK8zn7N7Wv24KFZ5xUcrLYdUKbwg9jE4xAxHEXjQOwVW8W6XfKzoOWWwujehRgGSePhc2ulL8oUSJflJXN80qeP8CgbMsVy3Hxyt5C/I2XlL4FW+ouuykuWn6zoKBw/gFmam2GBj9VX7cN/u7QbH80qV5bpwgg+TX3cfz1yLFz+98AqFtOH9fsNfAd6y2Qbo7SbFvpsWLQ5fqDIEVYJz+R6yGhN90pOtB+ExyFwWLY95jLzn0iMi1XeqDN4H8rsgKl3+Il+EwxedoEfHasrUtnEjbZ0oBVp0NLUO643udWAYCydZ+Vos3yykB/DzYP7Jpc7+JPqosB+fXAwXgHZY3JRkhSLptq3Op1AxBmsJvLAf4XGF1HfIBqrIU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(36840700001)(36756003)(2906002)(7696005)(336012)(426003)(2616005)(5660300002)(8676002)(316002)(6916009)(82310400003)(16526019)(81166007)(186003)(1076003)(356005)(86362001)(83380400001)(26005)(6666004)(4326008)(70206006)(478600001)(8936002)(70586007)(82740400003)(54906003)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 01:12:25.1898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a14dea-1be8-46c6-7ec0-08d970d3631c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2874
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

A long time ago, someone reports system got hung during memory test.
In recent days, I am trying to look for or understand the potential
deadlock in ttm/amdgpu code.

This patchset aims to fix the deadlock during ttm populate.

TTM has a parameter called pages_limit, when allocated GTT memory
reaches this limit, swapout would be triggered. As ttm_bo_swapout does
not return the correct retval, populate might get hung.

UVD ib test uses GTT which might be insufficient. So a gpu recovery
would hung if populate hung.

I have made one drm test which alloc two GTT BOs, submit gfx copy
commands and free these BOs without waiting fence. What's more, these
gfx copy commands will cause gfx ring hang. So gpu recovery would be
triggered.

Now here is one possible deadlock case.
gpu_recovery
 -> stop drm scheduler
 -> asic reset
   -> ib test
      -> tt populate (uvd ib test)
	->  ttm_bo_swapout (BO A) // this always fails as the fence of
	BO A would not be signaled by schedluer or HW. Hit deadlock.

I paste the drm test patch below.
#modprobe ttm pages_limit=65536
#amdgpu_test -s 1 -t 4
---
 tests/amdgpu/basic_tests.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
index dbf02fee..f85ed340 100644
--- a/tests/amdgpu/basic_tests.c
+++ b/tests/amdgpu/basic_tests.c
@@ -65,13 +65,16 @@ static void amdgpu_direct_gma_test(void);
 static void amdgpu_command_submission_write_linear_helper(unsigned ip_type);
 static void amdgpu_command_submission_const_fill_helper(unsigned ip_type);
 static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type);
-static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
+static void _amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
 				       unsigned ip_type,
 				       int instance, int pm4_dw, uint32_t *pm4_src,
 				       int res_cnt, amdgpu_bo_handle *resources,
 				       struct amdgpu_cs_ib_info *ib_info,
-				       struct amdgpu_cs_request *ibs_request);
+				       struct amdgpu_cs_request *ibs_request, int sync, int repeat);
  
+#define amdgpu_test_exec_cs_helper(...) \
+	_amdgpu_test_exec_cs_helper(__VA_ARGS__, 1, 1)
+
 CU_TestInfo basic_tests[] = {
 	{ "Query Info Test",  amdgpu_query_info_test },
 	{ "Userptr Test",  amdgpu_userptr_test },
@@ -1341,12 +1344,12 @@ static void amdgpu_command_submission_compute(void)
  * pm4_src, resources, ib_info, and ibs_request
  * submit command stream described in ibs_request and wait for this IB accomplished
  */
-static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
+static void _amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
 				       unsigned ip_type,
 				       int instance, int pm4_dw, uint32_t *pm4_src,
 				       int res_cnt, amdgpu_bo_handle *resources,
 				       struct amdgpu_cs_ib_info *ib_info,
-				       struct amdgpu_cs_request *ibs_request)
+				       struct amdgpu_cs_request *ibs_request, int sync, int repeat)
 {
 	int r;
 	uint32_t expired;
@@ -1395,12 +1398,15 @@ static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
 	CU_ASSERT_NOT_EQUAL(ibs_request, NULL);
 
 	/* submit CS */
-	r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
+	while (repeat--)
+		r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
 	CU_ASSERT_EQUAL(r, 0);
 
 	r = amdgpu_bo_list_destroy(ibs_request->resources);
 	CU_ASSERT_EQUAL(r, 0);
 
+	if (!sync)
+		return;
 	fence_status.ip_type = ip_type;
 	fence_status.ip_instance = 0;
 	fence_status.ring = ibs_request->ring;
@@ -1667,7 +1673,7 @@ static void amdgpu_command_submission_sdma_const_fill(void)
 
 static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
 {
-	const int sdma_write_length = 1024;
+	const int sdma_write_length = (255) << 20;
 	const int pm4_dw = 256;
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo1, bo2;
@@ -1715,8 +1721,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
 							    &bo1_va_handle);
 				CU_ASSERT_EQUAL(r, 0);
 
-				/* set bo1 */
-				memset((void*)bo1_cpu, 0xaa, sdma_write_length);
 
 				/* allocate UC bo2 for sDMA use */
 				r = amdgpu_bo_alloc_and_map(device_handle,
@@ -1727,8 +1731,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
 							    &bo2_va_handle);
 				CU_ASSERT_EQUAL(r, 0);
 
-				/* clear bo2 */
-				memset((void*)bo2_cpu, 0, sdma_write_length);
 
 				resources[0] = bo1;
 				resources[1] = bo2;
@@ -1785,17 +1787,11 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
 					}
 				}
 
-				amdgpu_test_exec_cs_helper(context_handle,
+				_amdgpu_test_exec_cs_helper(context_handle,
 							   ip_type, ring_id,
 							   i, pm4,
 							   2, resources,
-							   ib_info, ibs_request);
-
-				/* verify if SDMA test result meets with expected */
-				i = 0;
-				while(i < sdma_write_length) {
-					CU_ASSERT_EQUAL(bo2_cpu[i++], 0xaa);
-				}
+							   ib_info, ibs_request, 0, 100);
 				r = amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
 							     sdma_write_length);
 				CU_ASSERT_EQUAL(r, 0);
-- 

*** BLURB HERE ***

xinhui pan (2):
  drm/ttm: Fix a deadlock if the target BO is not idle during swap
  drm/amdpgu: Use VRAM domain in UVD IB test

 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 8 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c            | 6 +++---
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1

