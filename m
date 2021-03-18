Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD033FE2A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 05:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BD06E3C6;
	Thu, 18 Mar 2021 04:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5C66E3C6;
 Thu, 18 Mar 2021 04:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7gqfpXP0J1GmQ/0fWgdEGmzhh+KSboxFwrXSc4kSAbLvxU+4A2HylJl88ONi4cntYA6IAXn32NE+kMwWMXGnS8qXPI5PEgjCa/u6TK9/P+yjx5/1AUtkeXLu0ADrBoD7BXnZ9603mFKPQxeo0qhv1nCnmy1BPKG7sZ7dRXzjvKHxySzEDTj0fO92uXOfilVe28z2RmFOX7/vVNUiHAIEFw+l4BAE7aR+DgdAI88OCWNzEfAoljQbTwTOm302JSkPgeT2DYvegOxh99NOQT3s+4WsR1YFqyqnXGirkOPzmgG5lamFVJWJsl+KFg63xh+TVGK8h+1Pg4GhHe2+L6r0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMvuLXq1nXNI3/dEITfOshRR0s0FxgXrn9jMP2D7738=;
 b=aJLtyKMfTMOetSwCrKT9Pdqb8P3qBnP48kXrkCUs9H4zNlZQ5PaZsIkyNbm614qu+z6WcmOGNgPxqkZQgmyT+jdlz2jiz9JHELuwOYZGPU8tJW6JkyYmrXWKZL1n3vHy1bSgq5v0msM7lDhw66rVbEAvw2GG9WoXMNMilPVkV2zC7SJDGBSAzqsbnDGJzILvBPMd1duuKtg/l8tSMv2O/fvz3cWnroBx/iHqfxSRjmwmo1dcFOR6AHwX/ZJxnF8qqXZIohvGKOGIGDPQowpDfjM5ImX+YudAp1+ZfRjZiREDcb/9kfaYNSXr/dSUzJpyMJskoiSoVZZV2XqC1D03XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMvuLXq1nXNI3/dEITfOshRR0s0FxgXrn9jMP2D7738=;
 b=1DYFNYpTz08GdBTCxy19WzCXIuMTTZXq3XOcDvMyZo5d9saKFhz3JQrVDTKN0zNF3l+Bm6qI2Z1ZrJPRdPSyVA5PEExxYhTSFiAYzwDNYmYeOEdKM0cQ7K9+M7vf14XWRPVqDqaH808jUkSpfG8XvzQNKbpUh8vhfqspWzdKwtI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 04:29:14 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5deb:dba7:1bd4:f39c]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5deb:dba7:1bd4:f39c%5]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 04:29:14 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.12
Date: Thu, 18 Mar 2021 00:28:58 -0400
Message-Id: <20210318042858.3810-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: MN2PR20CA0066.namprd20.prod.outlook.com
 (2603:10b6:208:235::35) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 MN2PR20CA0066.namprd20.prod.outlook.com (2603:10b6:208:235::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 04:29:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad6917e0-4598-4839-a042-08d8e9c662f8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40648D09F7C4E596677C7427F7699@MN2PR12MB4064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WHAwH3MI5v8F7vjq9WYzXbHXz1isXNyE4pHAcfwbLkWHrQEksS5Zv58v6EbmhCUDhtRpR6l/LuBmsluHhojilZsmuaFVGxSFKRX6g1pzrKJFcm6lbew0PVXn0tDy2G9mRdDRNL0rdttOMuSDxk+XCm8MKQ5hX7t7DabyGuf8COG5BJSKvsU1su8LxzrfYMzkoxVwmL9aWiAA1EqTxSRdkU3SPhTObDGtzljHLPEky0XO+ODz1BFKrZFPuPGuO5qd5hyq2tAqaIck2+/H09xPtCsFU/MgdDGWzAzVaI1N2hzsFBrZVPNC3O1xV4Ai590Y6umSksVnDOaCEeUMC4HfdXBFH5iGTR3pnnWzbzaf51K+owdiest9Wcl3YPEvTufuMbW2P3OF5GIuK1YCzinOeLbX4tn3d5w75O9CBbwiTmtqQYeKLE2+lTQ7nIdONFwzAAuYncAjZL9wPFk7HAfJDSkWYiKoeD8YLdsi02m8K71JJVB5C7b3R0ddG+ZWBDbDV/PjzzR4ksXSQ2ssoUxa6TpaiCnrRFoOaSmcbN6zHCx4Xka226OCMLd71pMvCQAX10yJbU02GPd4pYnPMU2JTeJBEvxlN+e4Hw8/F032EOfBYPI1Ilkqt8q0aPszSOoxdMwUmfRaT4d3QASw+LVelM4NdurU5ZQcXeIOxa8050/wObIXoHad6UiFTcKiJh6b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(36756003)(8936002)(26005)(69590400012)(4326008)(478600001)(6666004)(6512007)(8676002)(316002)(86362001)(52116002)(2906002)(2616005)(956004)(83380400001)(966005)(1076003)(6486002)(66476007)(66946007)(186003)(38100700001)(16526019)(66556008)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k36H1GiOFkV37sM5FwM5bzsEa0+/JrPj6WbQ8F+fgdNC2WAn7aJpFLD7KVVw?=
 =?us-ascii?Q?ntEyiOop4Db0XBbiNaCl7U/wimrRGHAIjgFzJ5FQPpOJhPi8qYZWev6RguwT?=
 =?us-ascii?Q?s0BU8C2ejbtACIFSnrOJszT1w5r4Wde9iDGcyDDSd81Al6kzPa3OQcsyUKhP?=
 =?us-ascii?Q?Ngw4y9drqKllU659XoH9X/d77ECnScMU2dAFXLz+1t3pNDHh/ysDfGRxKX0z?=
 =?us-ascii?Q?ev1uuV59anYYK4d1K4z1qziG7wSR8r3PDj6h9aErI3KM3uEitekekzHRZaUD?=
 =?us-ascii?Q?bVCDpV6xgZKYNRJe96JFl92w2tV52s/yghnRTqTAmIl6v+0p6decjwMTs75T?=
 =?us-ascii?Q?KSuLNdkbXvPTwFcHByXe1IxwgIOkgI0+ayB1AWfZIyoiMpKGx/Smu6frD8eG?=
 =?us-ascii?Q?WPcTmtQ4s319sVc61Hn2bAR5YHwCnlKqWBIQt3cywgQdpNAH9uzhBoZ0eMEc?=
 =?us-ascii?Q?H/vlnZ2LDJvC3+9jU4VreHGTIFeqdRPhGetvcOrbW+9boAJ+l8vmmE8ggrys?=
 =?us-ascii?Q?BoAZrahnngWvFqd6lqNMvhVk8Lu4/RnA6mNyfBUPrNSYUVq8iBVImNjZ3ss/?=
 =?us-ascii?Q?U/8gYsVRkuBEc6VdZja3cEDFmFGSy7kzwgVkayupVWYbf4ucWHdmHiaJgxcr?=
 =?us-ascii?Q?bQ3oDv0oyy8SilTomzmXh6hdKPWuveQAxkA/ZSNJ1014vMyRZSSPE4fA89bk?=
 =?us-ascii?Q?F+JVn2NFTJoQ4hA58Guq/kBV6v+iqWzIqZs/XgjNWr0HZNPxhO930MDgh/uw?=
 =?us-ascii?Q?v4WmfxucpeOtlguovQNtUuslp0WSatxe3FxE0FWvEHOz6EOZFmuXY2+sw/Aj?=
 =?us-ascii?Q?GAqH94E+k6qgDHbZYIDgokE5q840GCXqokrh+HgwStRf1wj2IweeOA0OweZR?=
 =?us-ascii?Q?ucgzYUEuT3iHiXOIogUO5b9v4SyZAwhWPs/kZ2PXqglFodJcdSgpySwjlz3N?=
 =?us-ascii?Q?KEMeoZp1BXRfQWv0FCp6FNja6mlps7/VT7JA16OqM42frcQozI3LAf2X5jUJ?=
 =?us-ascii?Q?MYg7FMicZdWyo6OaCopSf+8cIyKWBozSDHqV2ExWIuBVhMvgytKqGKGdbni0?=
 =?us-ascii?Q?a8TLY6FnoXkqRCeMMWOi2ymylfRz4NToYPyrafm2bdEiDouHqzgIpBQdHnOW?=
 =?us-ascii?Q?snwYdyuVbufXPxvjr0p+zyhJCmmweYGfLAK2dg719TXjxxrvwP/JwnJPZTLr?=
 =?us-ascii?Q?mCeawl3V+r1z2VlY1HO5Kt1LxXY3i7axxfyVAq99z42UIOw0kZllOP7Wfw5q?=
 =?us-ascii?Q?YNtWt5hEF70gHLBmpdDFkKk6Uk8Riarwl3eUNBlcICt52NccekLZ9X+gGU6p?=
 =?us-ascii?Q?BuDpVQvDH2zuI3haWJGOlcNy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6917e0-4598-4839-a042-08d8e9c662f8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 04:29:14.8383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vkO8nzZ0uv4EHTrouqlscdbyIybzYI2peSUTIr25loCqwhiMjEoTZQxrmV0rxrFe04DoLyOflwUX+Jk8KKJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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

Fixes for 5.12.

The following changes since commit 4042160c2e5433e0759782c402292a90b5bf458d:

  drm/nouveau: fix dma syncing for loops (v2) (2021-03-12 11:21:47 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.12-2021-03-18

for you to fetch changes up to beb6b2f97e0a02164c7f0df6e08c49219cfc2b80:

  drm/amd/display: Remove MPC gamut remap logic for DCN30 (2021-03-18 00:05:22 -0400)

----------------------------------------------------------------
amdgpu:
- DCN 3.0 gamma fixes
- DCN 2.1 corrupt screen fix

----------------------------------------------------------------
Calvin Hou (1):
      drm/amd/display: Correct algorithm for reversed gamma

Dillon Varone (1):
      drm/amd/display: Remove MPC gamut remap logic for DCN30

Sung Lee (1):
      drm/amd/display: Copy over soc values before bounding box creation

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 34 ++--------------------
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  5 ++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 26 ++++++++++++-----
 3 files changed, 25 insertions(+), 40 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
