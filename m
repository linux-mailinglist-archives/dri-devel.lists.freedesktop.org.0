Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9A145D81
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A26D6F8E8;
	Wed, 22 Jan 2020 21:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9FD6F8E8;
 Wed, 22 Jan 2020 21:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJK92d6+JXKrFFO+x0dryzOTCi7lMH7n041HM2cLdvviIRNte1jN842IrXh24BEtACH08R8viYDqFpCr2yYJE2UixwckvkCrnnVEZLIfKDo+bCL+iPpAZc0G+Q0GSryExaUWn0X+VPp4ZKux0uTmGx/z3TrDApl5CCl2NvKmWKy6Gn9tSfQUdtAgePQONaIYqQAhmEgPKZQ7KMfByaBnyyklymLK9WpgLDgi3xTmqgzpHqApSLOjnFb3SYcQ8Hr7T3/gf+ebVCucTB+4RLRnepPIPObdFpg2lCTSaNd65pSeZGlmTFjf0nQOYGyYcXOmeFgnSkl+7BvjeBj4MT6Fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkmAngcFeI/vCWh52AxitDxdqKXXzDjojvoem70IUqQ=;
 b=obh2ZJ2ZB4cBKxjUgfDbqHP+rhRKoMzmAbF8tyhegezcGmqHyiInecUFf5iKKYAW04sUAUsP2k4251sMn8gLa2w52iQD5xLUjITtwDG9aP3WW/v7MseQ6vN+onC4KfEVZ8lYwIN9zk/3vMzhOnfaHUTeQmXJ8eWbhTPe8ssURcTqutLBSvqj+ugq5RyIWl25+N9N51GD4XwCTWCHpMEpSvWwDxdk4P2cCghhtmF6honU2Rigi4lFDk5i3JBzk+1FPpx01KE1+MEpC7AJZ4fbo/D8QTgr4ZY2DGv7XJVlHtZTwj9x3kkZV8g5tjbB15Ey+vGrbGryFUysL3SDOYtHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkmAngcFeI/vCWh52AxitDxdqKXXzDjojvoem70IUqQ=;
 b=gpiMwCtAmvT/TAQML/3L0bUEb6VWbMRv43yLXx1TN6yxBlADvkMAk6VKdSsgm2l3hrUaIfvaphH2xPVQWeCYDnLtkAyGYx/Ij4+OjdzssWnbj/5f9rOSuDtlVJUSZc9jspehimfmclYcZ2EK0DNY0kB0MrRMGMU0NawycVTYG2c=
Received: from DM3PR12CA0093.namprd12.prod.outlook.com (2603:10b6:0:55::13) by
 CY4PR12MB1143.namprd12.prod.outlook.com (2603:10b6:903:38::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Wed, 22 Jan 2020 21:06:05 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by DM3PR12CA0093.outlook.office365.com
 (2603:10b6:0:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.19 via Frontend
 Transport; Wed, 22 Jan 2020 21:06:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 21:06:04 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 15:06:00 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 15:05:59 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH 6/6] drm/amd/display: REFERENCE for srm interface patches
Date: Wed, 22 Jan 2020 16:05:48 -0500
Message-ID: <20200122210548.2647-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
References: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(428003)(189003)(199004)(186003)(6666004)(450100002)(26005)(6636002)(1076003)(36756003)(7696005)(478600001)(81166006)(86362001)(8676002)(81156014)(356004)(70586007)(110136005)(316002)(336012)(2906002)(8936002)(5660300002)(426003)(4326008)(70206006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1143; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 767bd8b3-28d1-44f8-ac60-08d79f7ee4b4
X-MS-TrafficTypeDiagnostic: CY4PR12MB1143:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1143E4501AA61F9A1D9C6361F90C0@CY4PR12MB1143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZCH46ZWjGTGeZVLHRrLw9N8AQ8IbMb38KjOwOxGCftw7riMb3TMs4ulZRgVoLpVRplJ/vJvDznmfWEl5keAHRFbfOUtuRVFYHIG/Xd4E4YYaI3UUDN9lxR+4TR/oqZ4l/AMeoevo57+u63mtO/f6kD7Eo1nCnXD2DL3yB0DayJyQVOMwePcdAjoElNJT0ur8jJfw4e1o4Ff62igeNvW9DTgGPxJvij0JFU8n9ylFQFwXqdB8402E2C1LjAnWwDFUxE8zGclHy9OigWPRufK3relauTClMZ6VEHABN9G4HHk/ExEQz/nBVyd+4B2xt5XQ8fBnU/sI7264Yc09GTiTaV6hmb43xf+Ja0pqHJtwwr65jHGo4CKRhNhjP47CFakTKLXGBrQjFN0rtaym25EyekyUktsnwWiduYmvb1nku5gseLVZ+QNGI6wPXrCgZ4cM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 21:06:04.6374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 767bd8b3-28d1-44f8-ac60-08d79f7ee4b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1143
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

This is just a reference for the patches. not to be merged

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 REFERENCE | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 REFERENCE

diff --git a/REFERENCE b/REFERENCE
new file mode 100644
index 000000000000..2e53f9cc82ff
--- /dev/null
+++ b/REFERENCE
@@ -0,0 +1,49 @@
+SRM interface Reference Usermode scripts for ubuntu. 
+These are just reference sciprts to facilitate the SRM interface for amdgpu.
+
++-----------------------------------------------------------------------------------------------------+
+| Main script, this is called on boot/shutdown/suspend/resume , it calls the sysfs to get/set the SRM |
+| FILE: /home/amdgpu_hdcp_srm_script.sh                                                               |
++-----------------------------------------------------------------------------------------------------+
+#!/bin/bash
+
+SRMFILE="/home/SRM"
+sudo cat "$SRMFILE" > /sys/class/drm/card0/device/hdcp_srm
+sudo cat /sys/class/drm/card0/device/hdcp_srm > "$SRMFILE"
+
+
+
+
+
++-----------------------------------------------------------------------------------------------------+
+| .service file, This is placed into /etc/systemd/system/ so it runs the main script on boot/shutdown |
+| FILE: /etc/systemd/system/amdgpu_hdc_srm_boot_shutdown.service                                      |
++-----------------------------------------------------------------------------------------------------+
+[Unit]
+Description=HDCP SRM boot and shutdown save/load
+
+[Service]
+Type=simple
+ExecStart=/home/amdgpu_hdcp_srm_script.sh
+ExecStop=/home/amdgpu_hdcp_srm_script.sh
+
+[Install]
+WantedBy=multi-user.target
+
+
+
++-----------------------------------------------------------------------------------------------------+
+| To run the script on boot/start run 								      |
++-----------------------------------------------------------------------------------------------------+
+sudo systemctl start amdgpu_hdc_srm_boot_shutdown
+sudo systemctl enable amdgpu_hdc_srm_boot_shutdown
+
+
+
++-----------------------------------------------------------------------------------------------------+
+| To symlnk the files (adding to these directory will run the script on suspend/resume                |
++-----------------------------------------------------------------------------------------------------+
+sudo ln -s $SCRIPTFILE /lib/systemd/system-sleep/amdgpu_hdcp_srm
+sudo ln -s $SCRIPTFILE /usr/lib/pm-utils/sleep.d/95amdgpu_hdcp_srm
+
+
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
