Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EE3F0E62
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 00:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846E6E8A8;
	Wed, 18 Aug 2021 22:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84A86E8A8;
 Wed, 18 Aug 2021 22:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX3e4I7hh4TX0IsZZRJ9o86fkcoSEh5ECHkSbCql9EggJWhDRm32qM9ZoBCeaw0P53V2zFn3sTWZtQRyBsbfK6VDLJ02yUJVF9LTH4Hp0R9RarKyReZ7YpYbKIP6hS7Zekls/zcykReZjXr2cxoz+Ot0wS2VqtqExUS1oCa2kt14gNx8xkOB15zlXCYeSZjQhzsgxadCA/sy5evlu06AW6ZnzkT63aWZNGv2BhdeS6cbucBAJqE8T65wDxw//pdK1W0+tFTm5wXZGUK92zvzXceylETqqALQ0K8b5NqzXrU0BNCakvT0DhT0HEaJcZcE+6sFQ4ITXFHHYw/pdrvu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UYUZapQ/r5InYaQm2ABgO/hBMYZrazFA5v7Bew7hAA=;
 b=X+E5StvVeRiT/edL8IOuq5cBjXhNS357lFtBc53oGqAapyJSj/+sV4DaNXBAmwAVV+t6K4cD0vK/miL7qlm7sA/JqUU0j8w2GS+qaQ3AubgcFarNp46A4Z5f96k7nCMTdeA+lXMvzv0e42hwL0oYN6t8u4V27JrwYhUjvutcF0xYSoiMMKjS0wo3V2eUd4ZRh8avIwzdHtIaSJ6cRNt/vpnBn96Q0/ScQIwXlCLahNdiXj97VxtFeBSGZkrnrJsDLyEAnPyzIALQyWFi21xVXm2AjFkTqwvhKGvZyyA+arTNpEd9B72Vj/Al/Dm5vSN1iR0GSNE7tjjeGeh/5f/Ycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UYUZapQ/r5InYaQm2ABgO/hBMYZrazFA5v7Bew7hAA=;
 b=e3Ttq0QrIlykZ+0blcWlC5DrGbpNIbVkMg2S3JAnRfeinKQEXKz4rPdtxuSoxTQeHhg6PKv85C/H+cNobTdyeNKT0I0PYWg2juAxpKfd2prXV3Oo7tUOL97JvCmWZdIC12O3ntD8fOiILlzOKf1joXUcq8kfT1GDJvvYgzbaajA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 22:51:56 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4436.019; Wed, 18 Aug 2021
 22:51:56 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.14
Date: Wed, 18 Aug 2021 18:51:37 -0400
Message-Id: <20210818225137.4070-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0030.namprd19.prod.outlook.com
 (2603:10b6:208:178::43) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.191) by
 MN2PR19CA0030.namprd19.prod.outlook.com (2603:10b6:208:178::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Wed, 18 Aug 2021 22:51:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8183e2f-f8f7-4c0e-2fe7-08d9629ac791
X-MS-TrafficTypeDiagnostic: BL1PR12MB5141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5141200275EFAA1C061435EBF7FF9@BL1PR12MB5141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6hfmNrGVB2k7te6nw7x4YKEh7102xluquYN1ie8aSiHLvFkRioRk5+sDHglm+Zzp+hxu2tSRn761weagQJqmYkpOBIHTOELfKvJ22XUM2U4ueJl6ZnpGY2l0RQXuQyMaJY4vgUNpG8a9cTvFPDVLMX7pnrVI47IGBgYtQCYp6H/iM1xrlkHnMfb/AsWj22OCtgdEeJKL84g8utBS6WxPZbSVnhkghilqX1MJtr/MebB7t01SvQwiRK/y5KprMf3pxgpdhJ3R2+Mjzu31NZ5kjhyB50VERoTB1avzdQNESFk+pJaOnIpYZroFCfi9v8fjyW47qk+0hYARPetWSS03qFoIKEke+c/IOwlZO6ZLN++3npxV5vw+7ciEXA/IivjODpZGaE/2/0NZPB1krvuduFcLcwhaOaMMqpoKaI9yre2vIBDMTpdBHf2Oa7IZwhDrweL0NKmtVFWmZ7sxqn7cHWLq5f/GE2jARAP2bTUQkrT7NF83tVewmm6LctsKJc/+r6gHBki6Vn0fY+XsHFb+3y86ozNDW8IQEanpCMQbIjciGXUlRkukd54Yd2+uJangPmmzC2+ntzhlxK6XSFF4nahDg2a5O87zZsLJ51Mvfd+YKSm4cxxMddJwf4Y39Ngt0JLaSFIOeNMs6o0yP1LtAHqRRz47Vt7PIkLNoZ3IyozgkgyczI/gOXPES5pPH1gojvnQLJfy/Kmmm8tC7sVXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8676002)(316002)(38100700002)(38350700002)(6512007)(4326008)(1076003)(6666004)(2906002)(36756003)(83380400001)(508600001)(66476007)(52116002)(2616005)(8936002)(26005)(6506007)(66556008)(966005)(86362001)(5660300002)(956004)(66946007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Elt1KN6MSWyhGtZSBzBux+l5QOieFDvb6FHZi9ZPddVGp8wlHXGfAAZTE6e?=
 =?us-ascii?Q?z0S04uPDLSFzEQg/8bikzvD5qXNJeebdR25Sz3qxooLONF65yzfLFrUyiGNm?=
 =?us-ascii?Q?W5OlTTsnqYi8xBnPrau9d3Akxjzd5rIqSkTHL6n5l8qvT2olD613IsiwXUkq?=
 =?us-ascii?Q?juiGyJ7XiHmn78kErnjfYiLL0WRxiF0OYHIkwlxq3IIPejh0wQPemD95mvnr?=
 =?us-ascii?Q?V9cK747wKnhan985qc/KfKKKpF5CpAnvrGyr047MDJXSRGmg8qHGeEDLOp9D?=
 =?us-ascii?Q?3vHY6Dw+7w7DzywEL08lKLmbaC9XJcjGXtk87tnQgqFNPVkKoUmKOMKt79BY?=
 =?us-ascii?Q?zwSQECq4PBiirumxbrI8oTJajW3/Cxs4GwSLoDKK02sxBdKUDzAq7RnyJYVb?=
 =?us-ascii?Q?G2tSbZtoaG0qeysm1iV2V7fwNd+5mhiRizcmT9bzcO2XtrXOPmFcEiwICOqo?=
 =?us-ascii?Q?oH2pyPGY+G8H72pmHF9AvVlziw6BZs7eP604u2XGNIxeRZGdha0EKBNOHirZ?=
 =?us-ascii?Q?rMchFsWoagwQr4945Xy/9hJvO/xu1efphI/4Je2zFfwRGrFQknOvu8zbVcAn?=
 =?us-ascii?Q?igM0fYTYjbaFRfol/SrzBTO4b/6ayoA2d8j5vD9CyhLeUL/A8QoYPF8UNk9d?=
 =?us-ascii?Q?BeRPxpvSki60tMzfVjQoLs61Wsv/jFJp3Y+6UCRTrj5lbdWhbCWlwGcwhb8m?=
 =?us-ascii?Q?ULMUYUYJP9Nvn4txR1GrkiLLJsufR44FLQw9jMvBB7V1otVDSyHyD6iPVFlt?=
 =?us-ascii?Q?DqDowvFWJTO5zvvbTuiliYZBsQU5bLmg5K5TmLtuGunuRgpCUJmuB6qLCGaw?=
 =?us-ascii?Q?z+RGMvwWdw8bE/H4g2fiLz5GsUyUPcBO0SS85TRf4Psv8lzoA84Cn9d0twSc?=
 =?us-ascii?Q?TtWMMsBrR4IqcPuSisMuM7HiS3OBx+ZSlYczAfjz6Z+LYu7dcBAuoYcg+ay+?=
 =?us-ascii?Q?I4xIfsUnCHr5MGQz12TsCh2C9XsFtrKDFsSXswtMeF+vVGuOrdeS/C7Yv0gm?=
 =?us-ascii?Q?B+lSkJ5Q1/kLbPgMiCDjhb6AwkiEHJgsVqh6Vj3eiSA98gDCRK2jqHrdMpEK?=
 =?us-ascii?Q?mdF/c82zUwZtD01choQbRXlT+EZpjO8+g2MCxMc8ns7KE7VhSRPZV4HHUAuN?=
 =?us-ascii?Q?XK+jx1wDsK8PnqXkPEo/sbS2UxjWd/U3QQPr5QZWrSYTndA5irp+aUs7fO9V?=
 =?us-ascii?Q?sanow7AofRRMw1fLwGgHA0wKWusM+Mz03gDoySI/xuO0KBxFfGOzd6C2kRHy?=
 =?us-ascii?Q?vYcXr7/ontnLtjl7UzNX/Ph6SmwKtchQOo3r9TnzWAU5fdShahC8co2s/Ym7?=
 =?us-ascii?Q?ynCIhxzzLjIkdg4pDp7xNoCr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8183e2f-f8f7-4c0e-2fe7-08d9629ac791
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 22:51:56.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GytgbUR/08j1/26whZTbMSGWfwNV9YOVHpPoHyTxvybs4JRz4BvSj8nqXoiXCTVzwg5O6hImZatEZ9x002U6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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

Hi Dave, Daniel,

Fixes for 5.14.

The following changes since commit 7c60610d476766e128cc4284bb6349732cbd6606:

  Linux 5.14-rc6 (2021-08-15 13:40:53 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-08-18

for you to fetch changes up to 37717b8c9f0e8c4dd73fc522769cc14649b4f657:

  drm/amd/display: Use DCN30 watermark calc for DCN301 (2021-08-18 18:30:00 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-08-18:

amdgpu:
- vega10 SMU workload fix
- DCN VM fix
- DCN 3.01 watermark fix

amdkfd:
- SVM fix

----------------------------------------------------------------
Jake Wang (1):
      drm/amd/display: Ensure DCN save after VM setup

Kenneth Feng (2):
      Revert "drm/amd/pm: fix workload mismatch on vega10"
      drm/amd/pm: change the workload type for some cards

Yifan Zhang (1):
      drm/amdkfd: fix random KFDSVMRangeTest.SetGetAttributesTest test failure

Zhan Liu (1):
      drm/amd/display: Use DCN30 watermark calc for DCN301

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  8 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 ++
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |  3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    | 96 +---------------------
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c | 12 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |  1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |  1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  5 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 15 +++-
 11 files changed, 53 insertions(+), 96 deletions(-)
