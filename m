Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A453674F8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 00:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149096EA05;
	Wed, 21 Apr 2021 22:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648D86E037;
 Wed, 21 Apr 2021 22:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4cH4VgEbf1ptQ1Mr+f+g6pbPo6ePEihrF7/pXAG70/h8Xs9gj0iUY83lMratNRKYFKoxghzOeftCJ9cuohX8yhE9X8DU0fvZJqiHfsUvE4oMIZbUNh9/oE4Dof79/mLwT+hpIpQZEP66LJV60a25G0g7E6j9gsf6CLcrgFs1wNCjWfuU/AwKHtngW4PHOnEeACoUz93BpYW9OBAtwADV0n5rDnItPClbGzeM2CLWYbVn7OEPrPn1cVCXxivKGns3eEwo3/mmedz0EFg5ZCXVmp7EUiihrMoKnmUGzL+WL2zFVPeMK0Mn6qgONlDx/72Sw8w75d1efGNZFm+54znEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpocIr9YrD6myAOcJ6XoPyGcYdq3+ErRY8jiOK7dUNo=;
 b=O1pdaArPQdTU8rJpPg0cJDI+lr5MU7BI4I3jaCMcaem+GTW5eI0o4DFD55AZ6Ydrb7a4e+zvx3qdMzRpx0AzInC8MGJHKlEFZIiMde+ua4CHRQp8kSqV/+Ql1WUU09S7w30nT5AQXxzAIYGKTSCWeO1vhGNvTfHTp55RjSa8c0mn6AENqi6GzExZugwG7ihhUeEup/gS3+1hOv9qizwLiOvyYrib+xYMC1+Ka4LNKbXfRAwsafOE77GQYOcEO9n9axWeVtQlvTfF0EayRMF7EQS6kvLnZ5lNHeMrKWlBikNmmRlJH4bDDClyoJGbCpioe/5Y1nFPJJo9gDENnDeMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpocIr9YrD6myAOcJ6XoPyGcYdq3+ErRY8jiOK7dUNo=;
 b=A1eF5NwttYQwevB0u19BaI3pOleOWC0XjVKGity+rJhvcGoRx6DklHikK7EAugE5iYMh+LuTkQc6gIULfWF6sboTfRsKt9zOqx2BH9P4sgAaCNufe34i9Anw0B0bMW6my6SJbtmHWpDUFxiVS4l6TQfC2Sz9EwAAdMEWqM9SLLs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4831.namprd12.prod.outlook.com (2603:10b6:208:1b9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 22:05:20 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 22:05:20 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.12
Date: Wed, 21 Apr 2021 18:04:56 -0400
Message-Id: <20210421220456.3839-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.245]
X-ClientProxiedBy: MN2PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:208:fc::39) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.245) by
 MN2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:208:fc::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Wed, 21 Apr 2021 22:05:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7466c56-20ad-4c2c-4adb-08d905118da0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4831:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB48318331C6CBF2EC87EBA4CDF7479@MN2PR12MB4831.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G2rg9pnjgutj1qxE2h9+RNglGijInBtVImvjI9WxvCNrdttY65uTXoLrUnWYrPfSavrnPK1+ZPmbM1b+iZdI2hP1D8Vj9KWP/XuHoXmfnDbwiZqJ+TXwVxpkES2locb5K9FcQoH9ygnNPKBOekMo2kNBwqkhst+m6qfiRFPo68ybgPywL1kOASmdO9JjTwvqEhDiNpm+77GTcbpfOR7TXzEH6EhUxb+HGOeYDIRc8Y87mr9PoV+S14dUwrGOk4fJ+HMFLslt/bDmO10ddHk+6YxivSs6aaOzRdh+2I0WtMDqyUtKyaQudhaCcvuDmUn1g0sLtiUfzXF+oES3z/WCZCJh3G730aZGw/PvoE6ZFtfcMV3kf+/ZNE163TX3WAMh0PbqMB4yKXzVenP1XAQi76HehBNo0IzLMxnoRJwAkIdYFIvQPQQQDKGRSyk+clPhVq3tyI3M+bjzfuCWlaxjqG3c4iRctZDYPHZml/R1Bw52F6x0F0JlYI6uXS6OTeBkb46tc6v6TLqRGgWeysBgx3tppcyI9DkwEGRdjLYck0YFZu/YKJ2X9bRbpdrWISDplQX8NY4UOAhqpurupxOd5kHGOVQYliKd67pyr0AnRWHcNS+xLnVim2XR3sudDtqeVSe6ZMPNF7EVZMtoJMXjW6PNVoAbn0q4J4KFxQTH04UuzzDtzXhDh8PYsWMZNGOGBKodD5oV0kyI+388SXU9LKtrPkJtiPiBOVYoX9qLYus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(38100700002)(8936002)(2906002)(6486002)(966005)(478600001)(66556008)(1076003)(38350700002)(36756003)(83380400001)(6506007)(956004)(86362001)(2616005)(52116002)(26005)(6512007)(16526019)(8676002)(66946007)(66476007)(186003)(4326008)(5660300002)(316002)(6666004)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2trBcUFVeCkQcyswKeBOsaeVbOZLpU0PsH/FM5Pxet0CPU3JPl1kh9mWJzit?=
 =?us-ascii?Q?ZYOlkCBRZ61MWAbvBUAxS1WzRrg6Dhlnwv/nrrMil43g3m3KJzNimmC6bIN3?=
 =?us-ascii?Q?W5Ekc4F2PR+luJqydBVbB7fSbyItDlYEEs5X2Au+MlKmTdV5FGH59ZHcOI92?=
 =?us-ascii?Q?0/r3ivbTzY/ix9BUP5La5xLoKSxkiOv2j6/hOeOJSAAYJs7eTMnHiCvxsZdX?=
 =?us-ascii?Q?GWhLOfLBGKKwnmXI1+6t+e8FgNiobojYwRfBXD21xbMUM3nsEe6UPrUHALhM?=
 =?us-ascii?Q?HnnOmZTFA+KmYeyDWF/udcEl3glDi6rJTREvOUdNSOK6gXWTdc61GQcWmr4U?=
 =?us-ascii?Q?4xofilgk0tZvThfa8k4HyOp+BwpdQgXY0JxF67rqUjLlp+Iws1AHxLSQ2uEE?=
 =?us-ascii?Q?MawiWQ8T3iHHb1wff2e/lOsFmoJVnlSLwk/RsRFffnmkPNs9KoVnt23t0zRi?=
 =?us-ascii?Q?zHT0jP3nhI2apW5AIAFIfOSGJD79TsPQpF4HlLa4ZZRDg9DZSUQXR1IxywXb?=
 =?us-ascii?Q?sewFbVeLJlSr33pR9wPFyf1245nijYM3jh4ixwSgB0Dk37jo3d6DxPDcI7U7?=
 =?us-ascii?Q?VDsBWHDm64VaJmPMbgoXrCRQJPPSICku03yxl5w233FFexWlVJ4KHe5QmRUz?=
 =?us-ascii?Q?BLRRgD2SshdDQd5BeXiPGHGSuFvv59HTVL5UI0wsMMkwTtoiIPsuxW9Jkw8a?=
 =?us-ascii?Q?dUd0HfO9STqYOF0FzFousZlvwBc4Ls+HpE9BwU9ph8iK/XHRK/mnSRgc1p37?=
 =?us-ascii?Q?fD0EUrUA9qSBFuJXEHq4M3Lc1J1EnSPnXZ2sTqGYxhZLAapWDPI/JPAHjr5H?=
 =?us-ascii?Q?y+3hYonrCPECSXLlblvQ3AFgUCsiM7pvmXECCqKz7f+BhDQrapEo1KuDWLh2?=
 =?us-ascii?Q?JO07FjZvDeB4xAHas4DsRtNx2PzrMVSKSMtm8nuMowbTTpHq5IDu6SuqW7il?=
 =?us-ascii?Q?PD3Go4s33XZhVzXq5kyds6d76qsqJqpMoKkF/zvdOl/Lct+mVRu/e8t7Yo7/?=
 =?us-ascii?Q?20daMax+tV56Jf3IoaIt5u99yCvtUbuMb8aRbV39oTsh9f/UXxslELuDKhVS?=
 =?us-ascii?Q?hBP6X4DZIZ3h5JvrUTxp8tcxgtc8ddccERnUo1nLJKS7dtorw5mUSa3oLXYX?=
 =?us-ascii?Q?z+tIYu10juYuckk0HJN2OW+2FPdUuV+ls5fhugnKcPbGsUL33zSNBVvlV+on?=
 =?us-ascii?Q?IyS+WhuKeSgN3Bg9HO8rrOX9AJrTX0vFPx5nddrfI34jI7icIzNGe+mCY5y/?=
 =?us-ascii?Q?NfpQSvjEkMiX+u62MVbv6+jNa3vJf1xAkO0b7VAIubr1odehSZIvRd0dZzm5?=
 =?us-ascii?Q?6AKsQXK20+G9AgNXcyXhCoUq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7466c56-20ad-4c2c-4adb-08d905118da0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 22:05:19.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Je1tCg0S8Tp+e3KPjjJSA80qcXia2vwZqgNn1DCK0QWACABEVc5tthA6axqVbIf7Ip11mYGto8kUKb/DG2mSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4831
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A few late fixes for 5.12.

The following changes since commit 796b556cbfdbe0d65b9793e63653ad24f9fa033c:

  Merge tag 'vmwgfx-fixes-2021-04-14' of gitlab.freedesktop.org:zack/vmwgfx into drm-fixes (2021-04-18 09:27:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.12-2021-04-21

for you to fetch changes up to 24d034528ef06ad94cfcf4394beac0443ab1b16d:

  drm/amdgpu: fix GCR_GENERAL_CNTL offset for dimgrey_cavefish (2021-04-21 11:19:26 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.12-2021-04-21:

amdgpu:
- Fix gpuvm page table update issue
- Modifier fixes
- Register fix for dimgrey cavefish

----------------------------------------------------------------
Jiansong Chen (1):
      drm/amdgpu: fix GCR_GENERAL_CNTL offset for dimgrey_cavefish

Philip Yang (1):
      drm/amdgpu: reserve fence slot to update page table

Qingqing Zhuo (1):
      drm/amd/display: Update modifier list for gfx10_3

Simon Ser (1):
      amd/display: allow non-linear multi-planar formats

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            | 10 ++++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 ++++++---------
 3 files changed, 15 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
