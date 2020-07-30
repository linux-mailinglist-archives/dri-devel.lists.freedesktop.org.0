Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A72339B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1536E0C8;
	Thu, 30 Jul 2020 20:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2BC6E0C8;
 Thu, 30 Jul 2020 20:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa/ZIQOJTaFePX5rDCkAYr5XelCjVxxnVzM/ktei8+CYlghI61l30Rtr+A4Tm1ZiAQP45WrQVoHxR0XnJoyhQl/d/53Tpzn1BWAhzR2mMqUOtOWkZtH8M+evXes+PTPR9HKADxsOpwjnnTrdeoldjj4ZlTfIWK0gFo2F//cZI5oQXDQoEUm+H9LGi2R0/QPQEy0zFFePy82Oo0cxcTuulB7sElBKAd8hw2Wgusx65P6yFbUSRHK6iNOZLketqZaX6YeglMcs7bjhBpTURsfez/0IlFRf3xy8m4EGvF51HnWKTZ5DBBK1xUYfd6xYYz07XBZDoEOgKKX8OGl4pg/Wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e69Ilo/bMBgpQW8I3mYz9pocP4dv/eVrXfcpyGjez4=;
 b=Rm7H0iMICZNiQ2GHzRH6cw4BWa1+Bdr4nRa+phYhwlhs/zDpLDWFzful08Zp+8MH3Y+621dUw9eTvSGufstREI3WCPU45GTl+tz1+kAwFq2vgPjh9OvJWEQAOy66MXmSb9NDgGtULgRYjIV85IdJ8I1AzhdB1N5yg3UqoURK5XlDcxF0qAkneG9puuKBcgnKk6Iou8Op82Az6ZV9TEXRl8ogoO8z6alt2/Q1xWAzG09q37JkqwTSI61Fcm1S1o4VlmMSmyx2NS6ibJRIi3sDKbembCTT7DdfLPlvtRWSILr2obBKHksN5e6FeJ32nL04ywjgYbT0GYpMB6eO6lW54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e69Ilo/bMBgpQW8I3mYz9pocP4dv/eVrXfcpyGjez4=;
 b=Uq8lsuVgNNskcDycUxvm9dWvEQVjIjX9IKE92FJFhBAR66oSFVBXAVeEU643l2Bh+lheZ436rEX1CoqHPbAsBc7HH0lMDV7WeM2TWKGnLYTKKfv3dFn6/bzT5ENFWIGq0gpZR3sYOHyCHcbdukriAt4GQvw5m8NJuXwiunzfwg0=
Received: from MWHPR18CA0036.namprd18.prod.outlook.com (2603:10b6:320:31::22)
 by DM6PR12MB3915.namprd12.prod.outlook.com (2603:10b6:5:1c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 20:37:29 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::e6) by MWHPR18CA0036.outlook.office365.com
 (2603:10b6:320:31::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 20:37:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:28 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:27 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:27 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] drm/amd/display: Drop DRM private objects from amdgpu_dm
Date: Thu, 30 Jul 2020 16:36:35 -0400
Message-ID: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 491b7617-6813-4f72-c1fb-08d834c8607c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3915:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3915EB926D5187A42DF16D60EC710@DM6PR12MB3915.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKPhf3V5BqTeFTg2mIDuQ7dEQwWlaLay8L0Evv135v83e+5dwxj7lTAvjZC9ZkatibO8u8UbPBPGkCFulRQ4zzdKdW7G/qqpC6vpgxoPRm0Oqie/0YwlCH9co6Yi2dNkGm3iSeUdI8b1pncGmzsiS6yEFPdEP3D9b4Z0TpNv3zQh4/ghsHmRJpstac2nZWAcy+V7SalN5JjbjHxbp+Sk+QZWpWNys9lgZRXd5f5UkJzAvDpbe0juEduU3gsVexDZHlQwmK1HdM+Yb+NS5Yd+ENN9AgrHCsMCw83ZH9sNXHdN8aYi31kBi7Xg924UAcNoHuyHiRrZMDoVksZXSIA1JwmX0FPVVsL/VUGH09S6/z6RDpMfgAy/bMTCgOsfL3EnwDSnBw9mznqeY/aGEyr570tr68iabRy8R6TBODoaqXCQo73zpZsLCsFB215ZuMF2b3QhgM9jW9MoanW5i0eOm6Bi+nwzL6ZRiRLkx/cQygc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(26005)(82740400003)(4326008)(336012)(2616005)(426003)(44832011)(8936002)(2906002)(5660300002)(81166007)(966005)(110136005)(83380400001)(6666004)(316002)(478600001)(8676002)(356005)(450100002)(70206006)(47076004)(36756003)(86362001)(70586007)(1076003)(186003)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:28.8248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 491b7617-6813-4f72-c1fb-08d834c8607c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on the analysis of the bug from [1] the best course of action seems
to be swapping off of DRM private objects back to subclassing DRM atomic
state instead.

This patch series implements this change, but not yet the other changes
suggested in the threads from that bug - these will come later.

CCing dri-devel per Daniel's suggestion since this issue brought
some interesting misuse of private objects.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=207383

Nicholas Kazlauskas (7):
  drm/amd/display: Store tiling_flags and tmz_surface on dm_plane_state
  drm/amd/display: Reset plane when tiling flags change
  drm/amd/display: Avoid using unvalidated tiling_flags and tmz_surface
    in prepare_planes
  drm/amd/display: Use validated tiling_flags and tmz_surface in
    commit_tail
  drm/amd/display: Reset plane for anything that's not a FAST update
  drm/amd/display: Drop dm_determine_update_type_for_commit
  drm/amd/display: Replace DRM private objects with subclassed DRM
    atomic state

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 967 ++++++------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  13 +-
 2 files changed, 343 insertions(+), 637 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
