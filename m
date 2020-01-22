Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B382D145D78
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794956F8DD;
	Wed, 22 Jan 2020 21:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299416F63C;
 Wed, 22 Jan 2020 21:06:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0z6QcPUdW/uXxIdghEyKXZuPO2kiQKh+A/l5GGDD98+9Or9Sfp0TjMD25qngMM10GWDOqBXqRf7wckgj1w5i2H1WIpo3Zql5fKBP1UaUKBDLrq28hEPRWuX8dExrLl6wJdywzi5eXFnnA4SQf1+0v0Iv4wLzr5H4JPAbpfHloBBk2lt73UYDNKLOQ0Y+Kw2dLkhapAqi5k2k7AJI/q7VIVlS022NuoOxPcFlx1vdzO4+2RvBNwaMR80Q4xkomMHvGBgodqbdzTdsl/oKmrwxkpnGL8lQ+rdJGa1M/yggv4bsHM1y69MaxhzfjPjdXp88hh/PUFlwrfpvuvcsreSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D+wR5EHrHv8O7glSetKnhrowMor54RuNEwpe449tys=;
 b=VjrtRgYGFZVaeqIKfOJFW40/r+IqkXfruKyA/MrwQLBGEr3BzEK5Cw5aTnV/lOLK3zmZooKyQj+gd6Fm/3cFOhz185nFrWr0BXa0eaN0/5/ntMp2bs0VojEybT+MgUe+mGik1dmMQslpQniJUKGmOBgIlUQ5lw0BLAu75XlFQLketiIAzpw6XtUXvXixTHOUb62XO7Dz2+Ua5TmroTD5RbUi3adKm7Q9daBlwBzwCLrGBHBmXPZwh8R7uSX6IXWU8/DsXTfkiDEbk5GrLQxlAo6U1jOQvf0hT/suIOZztd4xJBu4Ltk6IpWYmEBpncs+neOgXRMe4THwadA7OyclhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D+wR5EHrHv8O7glSetKnhrowMor54RuNEwpe449tys=;
 b=ELd/qJOh6oNspSrbru/u0KyI3ZHKSepVKROXTuNLxyJWiUlZjsY/zJ9mtZw0m/CuhFURbX5SGBP2UY1mxH6dCF8KEKVO3miS7KFGcKG74rchnfElWRHsuqHdBiU19Csmaax8PS/xMbQ2BdQ17S+XtChdPWcpVWL5xYFEWxI/jCg=
Received: from DM3PR12CA0092.namprd12.prod.outlook.com (2603:10b6:0:55::12) by
 DM6PR12MB3564.namprd12.prod.outlook.com (2603:10b6:5:11d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Wed, 22 Jan 2020 21:05:59 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by DM3PR12CA0092.outlook.office365.com
 (2603:10b6:0:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Wed, 22 Jan 2020 21:05:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 21:05:59 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 15:05:57 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 15:05:57 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH 1/6] drm/amd/display: Pass amdgpu_device instead of psp_context
Date: Wed, 22 Jan 2020 16:05:43 -0500
Message-ID: <20200122210548.2647-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
References: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(428003)(189003)(199004)(336012)(426003)(4326008)(356004)(70586007)(6666004)(36756003)(2616005)(186003)(450100002)(70206006)(5660300002)(26005)(2906002)(7696005)(81156014)(8936002)(1076003)(8676002)(81166006)(478600001)(6636002)(86362001)(110136005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3564; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aa8697b-873a-4cc0-4225-08d79f7ee15a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3564:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3564BBEC138ED82F6EA75019F90C0@DM6PR12MB3564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRH8hBZYWz0L9LI1brGBr7HAO8lWwHxeuToD2uVHpMOeo7AaqUjaBORCEhyhCojQpmNjBdCeX7ITz+VPcIYBVRmJWzHWm8t18bPto4zUz4/D02enyCHf4hiPzutrjJtg7yfC8mu04XfVyG45+2VtzUCJpUd4j4EUk+VwNf0utGXHH8gAiSlgrt02vQxwHNQaFfJmZvn82AU2I69YLVUQmNbi24A8Nsur3HmV3BuWRnHtMrxPrcl5GYefRTDx1be+peA+kOCmNaTrohgXodPOMIDZ/+WORpAwQzj4hzB/EWE2vOPwHClRTxvXgllttBb218ggoDpNHO7AAJIoXtysxrGz8bh53R4eCs1PgTuX1EVSMVuma55WikVxOwzdAZR8/3jcILqnHZhiRdh1QaJT3Arm2wq4NLiMUr4coNwL+rmtRPLe3oSg+VbaL/qx+5WV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 21:05:59.0107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa8697b-873a-4cc0-4225-08d79f7ee15a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3564
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
We need this to create sysfs (followup patch)

[How]
Change the parameter

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fe80d6ef9a8f..30e19dc390c8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -960,7 +960,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	if (adev->asic_type >= CHIP_RAVEN) {
-		adev->dm.hdcp_workqueue = hdcp_create_workqueue(&adev->psp, &init_params.cp_psp, adev->dm.dc);
+		adev->dm.hdcp_workqueue = hdcp_create_workqueue(adev, &init_params.cp_psp, adev->dm.dc);
 
 		if (!adev->dm.hdcp_workqueue)
 			DRM_ERROR("amdgpu: failed to initialize hdcp_workqueue.\n");
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index 0acd3409dd6c..a269916f7dd6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -338,7 +338,7 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
 	hdcp_update_display(hdcp_work, link_index, aconnector, DRM_MODE_HDCP_CONTENT_TYPE0, false);
 }
 
-struct hdcp_workqueue *hdcp_create_workqueue(void *psp_context, struct cp_psp *cp_psp, struct dc *dc)
+struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct cp_psp *cp_psp, struct dc *dc)
 {
 
 	int max_caps = dc->caps.max_links;
@@ -360,7 +360,7 @@ struct hdcp_workqueue *hdcp_create_workqueue(void *psp_context, struct cp_psp *c
 		INIT_DELAYED_WORK(&hdcp_work[i].watchdog_timer_dwork, event_watchdog_timer);
 		INIT_DELAYED_WORK(&hdcp_work[i].property_validate_dwork, event_property_validate);
 
-		hdcp_work[i].hdcp.config.psp.handle =  psp_context;
+		hdcp_work[i].hdcp.config.psp.handle = &adev->psp;
 		hdcp_work[i].hdcp.config.ddc.handle = dc_get_link_at_index(dc, i);
 		hdcp_work[i].hdcp.config.ddc.funcs.write_i2c = lp_write_i2c;
 		hdcp_work[i].hdcp.config.ddc.funcs.read_i2c = lp_read_i2c;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
index 6abde86bce4a..331b50825510 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
@@ -30,6 +30,7 @@
 #include "hdcp.h"
 #include "dc.h"
 #include "dm_cp_psp.h"
+#include "amdgpu.h"
 
 struct mod_hdcp;
 struct mod_hdcp_link;
@@ -64,6 +65,6 @@ void hdcp_reset_display(struct hdcp_workqueue *work, unsigned int link_index);
 void hdcp_handle_cpirq(struct hdcp_workqueue *work, unsigned int link_index);
 void hdcp_destroy(struct hdcp_workqueue *work);
 
-struct hdcp_workqueue *hdcp_create_workqueue(void *psp_context, struct cp_psp *cp_psp, struct dc *dc);
+struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct cp_psp *cp_psp, struct dc *dc);
 
 #endif /* AMDGPU_DM_AMDGPU_DM_HDCP_H_ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
