Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07B133D7C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A95F89A1E;
	Wed,  8 Jan 2020 08:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2A86E878;
 Wed,  8 Jan 2020 08:45:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEpxpUr3PSq09KMBKL0K0gwZMTVzkzaDwUhZLT0uz6LCQAE4SvnLc5+KvU3kBcBuZqO+Ro5NNzWt2csYPQcjoUDSr+HcuF2x6tm9DlbD5dER2mLmH7BcQbioblnUZNC2QAeC20N4ZmAT9C/aMPM0eIWx+bO6KBd6anJkDw71kZgfeSIH7Z2em/6C/7BUwwb/uaGFf1OiJk1YJHEbylVm3nxxEqYXNv6ItmumI2P8/NL2sMb8CRKoe391dVFkOqgujzDfzxD+KK4R+dJSkHOj/FJOiwI6PVYK/Pfqu2lfVygklpgwGWjvsgNs/hD396ERZb6QaHVD1p54j+KBEE19xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW7DNv7mCiXeQ4RK13hVb+UDxeMurrd9ZGWVBBtVC/M=;
 b=iKVhXiDBa0i0Q13T105J5/3cBxKph7w8B5xvrGI1k/ArNyWhfUCD6B46Y4PGoa8O3sQs+kifbcjMcAthK46UJPmauvEQjBUyN9g7YusGsneQF5tKAefV3kQRFD9UDAFy+yNQcEafYqktukIRHLRMzHqKRXqQkNM7N7Fp9uIPKbbhhe0oQzf6Bm7UKPHfNLsyOaOjpUM3smmmxU7GkMci/n4dqZTsifDDDPfOfRB1yaQodJlCZseZ8t/o81ySQ7pfwHbrvp5zf/8SSjUj7ryke64UPH8kPwSp4VlRGmjF0hVgJAXCK143jzLQeo8lqhsVjH2Av+mVkE+kJULoolnMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW7DNv7mCiXeQ4RK13hVb+UDxeMurrd9ZGWVBBtVC/M=;
 b=w/ZzSN0NcZJyD6y0OeyxAqnA6D9dAfkQZ7EIJUdc+H2yh/O8lrlv3FgrOhhyLdHU9jCmKxc6Tzqd5iJqzG7hmeL5J1es4puQS5iqLlu0wqRHs8dTC9UcOz2n5sFwVu0bfai4NYrPPvdDcQJrHJBx+mRsyLWQqXSwEtRm3DzwlTQ=
Received: from BN8PR12CA0031.namprd12.prod.outlook.com (2603:10b6:408:60::44)
 by CY4PR1201MB0005.namprd12.prod.outlook.com (2603:10b6:903:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.13; Wed, 8 Jan
 2020 08:44:59 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::201) by BN8PR12CA0031.outlook.office365.com
 (2603:10b6:408:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Wed, 8 Jan 2020 08:44:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Wed, 8 Jan 2020 08:44:58 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 8 Jan 2020
 02:44:58 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 8 Jan 2020 02:44:56 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/2] Take SST-only branch device into account 
Date: Wed, 8 Jan 2020 16:44:14 +0800
Message-ID: <20200108084416.6296-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(189003)(199004)(19627235002)(81166006)(81156014)(86362001)(478600001)(4743002)(4326008)(110136005)(26005)(336012)(186003)(70586007)(2906002)(36756003)(54906003)(15650500001)(2616005)(7696005)(6666004)(1076003)(5660300002)(426003)(8676002)(356004)(316002)(8936002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0005; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1fd928-489b-45b1-e417-08d794170b35
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0005:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0005F68F4AD47702CA72F577FC3E0@CY4PR1201MB0005.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 02760F0D1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4km7yzHhrsZjwjUf5sU/OkH8PTQOx4es2M9ycYNkyTb2A10N5aldHWErT+BaAbGPLhmQL8psnoI8hmJtJkiHTT6gqEmBRz7IOk+KnpALVI+mTbPyakPqFxcJftQ8gjpzBnl6HB7kMGS4Wk092Uak+tgEMtaX9Uz/GzkPPI59i0hWjTzPifmv4+dz6e2Mb8qFfdYJ+q0byqHde/EgQzrwMxxUW6KzxN/JbEwdTq7saQcqusBdvt3zAXEhazg5+eUgjQDRqXDjrTHsj8Klcnw6ms+eIAqDBQeH9X9UEZgrU1siPilTdPkbsujfWlpp621/9Bb2GbjnaItaSvhgQoFIE9ug5PYhMQ1dwyxZXZpNCzUlXE3pj3ocpFZl0levprDqsvIU4Qj5bVSGdOMz/VgVaeMKFyBhGIAI4EFh/Vxt7s90XJI9W/lV8UVsnCLE/w9N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2020 08:44:58.8603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be1fd928-489b-45b1-e417-08d794170b35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0005
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

This series is trying to add the SST-only branch device case in and remain
the original processing logic in current code.

Wayne Lin (2):
  drm/dp_mst: Add a function to determine the mst end device
  drm/dp_mst: Handle SST-only branch device case

 drivers/gpu/drm/drm_dp_mst_topology.c | 147 +++++++++++++++-----------
 1 file changed, 84 insertions(+), 63 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
