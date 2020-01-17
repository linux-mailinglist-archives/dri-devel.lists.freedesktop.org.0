Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66441403BF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 07:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE97B6F3AD;
	Fri, 17 Jan 2020 06:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC676F3A8;
 Fri, 17 Jan 2020 06:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7qzkcprfmAPHkrcYXFtvL3H9/ykEs9Hv/BvQ1v9DVQ8Caoc5rcH+MxHboixMrhvzrJ9F873VrbYNkZdo4FMdLfR4IN7sLvbUsxJJ8agQ78lAL+Ev7cl/BYFryUjscRnPMauNlTdaIQLfOAqlAxGpR5bb95X9YAGY0t96nQ9qSo6shPxECgp6sWAnNb/DgJDZjBxiQNICesq1eGQUsNo9eRRePbvbp02HIXghzFYFyCiXB2kVxK939FReuEwzGk2/ZfC2P6UmyWhflz/YwstWxISDHgLJwADcrUEJxFgPX9XBvESQ7y+xVrpRLMErQwJYNOhxT7hZlDQyO+Ms0cEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo40VYnRwJmRMZf0OTvsiZ8W9rJ1k8rT/oZw/pxjzRk=;
 b=QYrJAO3X6yOJ/voV9ru/dTQKEhlQpi7i2qzaMj6ItwITq+dMf/NOCdWrg/CzOeR2nm9YZD5SLzCiHf4BysTyQHKXj5VSinZTOeto0s9ZGGCAXvNqIP2KqkKRPX9lnxgHH1KRLwhlwk28TqLq3oRFnOPZTsLtKcVFPiQKbVuQsWAnnesCtxDCWoZbWH6YgULjdGRfX/gOrJlgD6Somftw477TXpKbDayiP5ymmSXDXlcaTa8pgQzF6M89nDXlc6iYK6Y9OaRaqEEagbsWeMWGyRxp4LsB8QMIoI5dBkkSCc1k4eDPcmlGR6XMR9fRk3tZ6JmxBBcaXuZV4tQ6bb1OXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo40VYnRwJmRMZf0OTvsiZ8W9rJ1k8rT/oZw/pxjzRk=;
 b=hR1v9i3JGDLQ1uyR6AqK0mZgZV/WWQ4i9OV4mkSOMJc29eJpqNdLrHAuJMRlfBZAhO/I3kKbBc3Pa0uEfa19a9xUqeVkk0XeACORLzEjhzmAzbaobPGYjqK2i/ZX3RNsYTtVwRckML06gabKb8CoDPO8FtA9N94CdkAyKIrW1Hc=
Received: from MWHPR12CA0047.namprd12.prod.outlook.com (2603:10b6:301:2::33)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20; Fri, 17 Jan
 2020 06:05:08 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::203) by MWHPR12CA0047.outlook.office365.com
 (2603:10b6:301:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Fri, 17 Jan 2020 06:05:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Fri, 17 Jan 2020 06:05:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 17 Jan
 2020 00:05:06 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 17 Jan
 2020 00:05:06 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 17 Jan 2020 00:05:04 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 0/1] Take SST-only branch device into account
Date: Fri, 17 Jan 2020 14:03:49 +0800
Message-ID: <20200117060350.26358-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(428003)(199004)(189003)(110136005)(4326008)(5660300002)(186003)(7696005)(54906003)(15650500001)(336012)(26005)(36756003)(70586007)(316002)(6666004)(70206006)(1076003)(426003)(478600001)(19627235002)(2616005)(8936002)(356004)(81166006)(81156014)(2906002)(86362001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4197; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b687ea5-7af6-46ea-de29-08d79b133423
X-MS-TrafficTypeDiagnostic: CH2PR12MB4197:
X-Microsoft-Antispam-PRVS: <CH2PR12MB419752C865AEBB63781EA585FC310@CH2PR12MB4197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0285201563
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3gjJSN41p1git+R4UGKhs6gRQSWOGrKLW7KPbI40LGQQeanI9vpI5hQRVQVeYUyKoIW0wR2o31cQuYBYKLupMDdpGQj9LWtorjqsIiKv2pfKsJNlEES9Q2qSCCKopqtYhkt6e/OmHzExjfAKueSgg8jHjGFqO1xV+c6ndcYYglb31eAu08McNH+6ij0V455UAL8a3KIojoPVUDElcWTSamMRA73Q3cwkbORV8Rn6fZmy8M5WPBqjkwNvgTOHiIReIOhghXc+zenQ/NBEWvwQ0rYJU1Fplzmb1eBtxApmKKUqE4XITCeFUYgqTbLDbKouc7k45cgamwsQDbtub/REAWIE8A21s0i77OnvJ2tIpdsxZN5suwEIkBQjUqqsGZP3p/J+5OTr2sbYs9GbiIW0eris01CDZNLQJarFj4G0m+2cdc7pHBHE1bVDVc5CwSosPO9/3XdPyJrp+5fAwTRZ1N0xabaRfz/cYMgOAIGXs4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2020 06:05:07.7223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b687ea5-7af6-46ea-de29-08d79b133423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while testing 4 ports MST hub from StarTech.com.
While plugging in and display a MST monitor(Dell U2417H), change the MST
feature to off from OSD. Monitor then can't display anymore.

After analyzing, found out that the CSN reports the specific port from
Device with MST Branching Unit (Message_Capability_Status=1 &&
Peer_Device_Type=010) to SST-only Branch Device ((Message_Capability_Status=0 &&
Peer_Device_Type=010). Current code expects peer device as MST branch
device and can handle sideband message once the peer device type is
declared as Peer_Device_Type=010. But for SST-only Branch Device, its
Peer_Device_Type is 010 and can't handle sideband message. For this case,
we should follow the same handling procedure as the case in
DP_PEER_DEVICE_DP_LEGACY_CONV & DP_PEER_DEVICE_SST_SINK.

This patch is trying to add the SST-only branch device case in and remain
the original processing logic in current code.

Changes since v1:(https://patchwork.kernel.org/cover/11323075/)
* Squash previous two patches into one patch
* Combine if statements to have code cleaner

Wayne Lin (1):
  drm/dp_mst: Handle SST-only branch device case

 drivers/gpu/drm/drm_dp_mst_topology.c | 140 +++++++++++++++-----------
 1 file changed, 80 insertions(+), 60 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
