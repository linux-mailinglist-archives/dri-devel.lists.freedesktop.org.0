Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED4145D76
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140066F8DB;
	Wed, 22 Jan 2020 21:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8976F63C;
 Wed, 22 Jan 2020 21:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W99ZDTMwCUGoGPJYwwPXbmNTnKd9afQHBeekFfMFUZDwcwLDcprSiyFTmOWAmNJg1TfdKRQN5pO0NTg+P9DdHVa9evp1BzrobLmvy/DeRNgctUajKm3jHnqfDEXivKmJ4OlHix1KmeXtXZOl/WqsEolhRCV3kSQcGWt3zRVQLCwy/u4O2ep1mDG4xS5oW9tsDscp2QK9PJOyRLd0HY3HD//UEItN6qTPef9/MhPJtWjvQupOiZVwXJFKGjUptwI+wF5/VyWmfOfY1XTuhPg6KcsEcUCNgPtXWQVDBRKTZ+wyonZJ0JtSGuq0HvQC3965rlDCJPLBLRROpCD7Awsr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h25s12haoap5ZnIHOpgB5Mn8mM/RqFoNuZm23ERPXGA=;
 b=W+5SeY4B8WK2elFaJwf5UJnjg/zuFtBONclxvCTdl8dSOBqbJfS7tbDwF02rvorAJXaT8S2dIrh/AEYB1/0G7g8AWWHb/bwXuC1mkrx5Spto5JS1vXa36eUfSR4LZkgwNFVHxk5FD6AD1A861jcLMClHKxuSL2MTFTZy4TXbCuxG+abTmF/BVOgzfwzikDHi70wf69M9WPyayhpCjYdQ91Bv1RRrlV308SJdyvk/Pl7LF9s62BEfLdalsEtI8qjZ130wFQ2W891YaCIPErVW9iZqmr3XdY+rUg+KybtsI1OMED7iymvKyw7j3+cb2r/nWmkL9mJNFWUT+LEKzjFPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h25s12haoap5ZnIHOpgB5Mn8mM/RqFoNuZm23ERPXGA=;
 b=Y8iVaJ2Y6X66Ac6k5j6+sQ0/2I2iEPRLh8demgJNiJJzy9iFW/lw70e+nrhiO4xDE63IzmUVFREIAOhvy/9qsDW3D9ouvmqQfgJpbsqugNiQrg9ZSOsKUBggztKRlgE60M2hG0qeR14arl/AIm1LMzEm2jPJLhzc3wfUTxDBtig=
Received: from DM3PR12CA0093.namprd12.prod.outlook.com (2603:10b6:0:55::13) by
 CY4PR1201MB2550.namprd12.prod.outlook.com (2603:10b6:903:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.21; Wed, 22 Jan
 2020 21:05:58 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by DM3PR12CA0093.outlook.office365.com
 (2603:10b6:0:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.19 via Frontend
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
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 21:05:57 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 15:05:57 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 15:05:56 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH 0/6] HDCP SRM interface v2
Date: Wed, 22 Jan 2020 16:05:42 -0500
Message-ID: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(428003)(189003)(199004)(26005)(186003)(7696005)(450100002)(6636002)(1076003)(4326008)(5660300002)(70206006)(81166006)(426003)(81156014)(2616005)(336012)(8676002)(70586007)(8936002)(6666004)(86362001)(478600001)(110136005)(2906002)(36756003)(316002)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2550; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de427eb4-3908-4ff0-fae1-08d79f7ee0bc
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2550:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25501E8F4DF26355D6AC9B53F90C0@CY4PR1201MB2550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3tcHSKP36IqccGXx0nkeVVzCK+T1uy6jJxlpuyXzpcJ3gZ7V6nqG96zCuySgWrh8vd+CSjpzqcn/pTc+jQWwii+hhL7y6gHSmjcclhw2FhzCA+xaWkUrG0oRbE1YebJy5qNCimaJAF04op+AByoXgmAAcuZCWNaTh1qlmgPn+wL+o6RKEIY1NMCMLUXqoEjftN8mMa2G29BpTO/ytKqo1gT6Izxr3vjhxTbC0wY9PEO7rm5YwOweOb6Tmp7iTfCJM9x9YOb1mi8m1ux+PHhDSKzZPh/d2Qds2vW6gZu7nbJXqZsvTZAGYZKkell+oy5FDcjakeLmlGm6OTkCH2edLuHQd/tb81oTg02yMbnq+WxZNCxYwFqDuFj1fVChxsygSePobvy2i5F0cB71Rp6FvTSeif8NCCB/VomHAKgfUMtZ4GTZ2fH9erGeWpoqdkG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 21:05:57.9800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de427eb4-3908-4ff0-fae1-08d79f7ee0bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2550
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

These patches adds support for SRM loading. SRM has to be saved in a
non-volatile memory(spec) and PSP can't do that directly so we need to
use the driver to do this

Since the kernel cannot directly write to system storage we need to provide an
interface so that the usermode can do it for us

v2
-update commit descriptions
  drm/amd/display: Add sysfs interface for set/get srm
  drm/amd/display: update psp interface header
-update comment for sysfs
  drm/amd/display: Add sysfs interface for set/get srm
-use define instead of a magic number
  drm/amd/display: call psp set/get interfaces

Bhawanpreet Lakha (6):
  drm/amd/display: Pass amdgpu_device instead of psp_context
  drm/amd/display: update psp interface header
  drm/amd/display: Add sysfs interface for set/get srm
  drm/amd/display: Load srm before enabling HDCP
  drm/amd/display: call psp set/get interfaces
  drm/amd/display: REFERENCE for srm interface patches

 REFERENCE                                     |  49 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 238 +++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.h    |   9 +-
 .../drm/amd/display/modules/hdcp/hdcp_psp.h   |  26 +-
 5 files changed, 317 insertions(+), 7 deletions(-)
 create mode 100644 REFERENCE

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
