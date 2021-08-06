Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60143E208B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6ED6E8C5;
	Fri,  6 Aug 2021 01:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD033891F8;
 Fri,  6 Aug 2021 01:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCkjp2lxmQCvlm0A7vZF8mGlZRekjmptselJ6RSoAvqNOuy2SxamKcDPtQGd4DKPE7drkz8XG3wOhcPuQwrP6+iA0wkGrD6MqQSVCtvnMkD03cq24i/TJY6Kml/4KOuT3MXwAoWaCCO8a79QA8v/xYN/8xXl9Xdssqi2NpdeYcSzhJ7yvwIODf5M8zRyoUQR8da25PAkqEM58UBtoEz/umtdZYZKW9YwKIBG1smjEQx6/+2UVM/QlRkMsFVX0WBfpS+2velSJ3qhIa9lfZbvgS7igsmkzhCcWkrFCA5G4X/X4wPImcqjSPqo5qEO6fxNeUyAgQHdNYpNVT5gfOiN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH3YwR0BcrzVtsYk8oW2VSr+onl7x/9FpY214lMSCvA=;
 b=VARAB6F2PdRcuFH0/UDN5jzTrOQ22nRX7uoHV9ky6eP00Z/TXcscDbN5CN6fYAJiW8PjLGX9Mzu//Dxs7JAYH/j0tJD96dkHGgODlTKvqANfSPSCkbXqvFHd0KQAzjAAULjxn6kzGNb22MK9+YIUO0/Nckpe8u9Yeg6Q4p2014MOP2+khorF8C0dUvZSYEi67VLgi/N4oc0NJRLJoKcp9PB9MyemrvVNCDLm70Jn/9RLtN3RIItYHnnE14dIXY1Ky9CWybfg+F60dKjV/ls4311j9yCdj8HFnh2bHthsmShGGAmph1HAACX4MlS6VehIcmKbnnJXjR967hdDfNT2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH3YwR0BcrzVtsYk8oW2VSr+onl7x/9FpY214lMSCvA=;
 b=QTYY25ufDXEcb2JxLeMhqTtZkiitQHx18AlHjLWwm9fqypUeLceXbK8HLIlGovD7hNJkI6xBcLqCxXS6mcI3LRz3JDgLRWubxvLB365zdKUOnWQVCt41+krAX9unSnlSW8uuon+Mdkv0Ox3I9+ELtjghP5qCeOEzzVK9FMyUIUI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5256.namprd12.prod.outlook.com (2603:10b6:208:319::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:16:50 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 01:16:50 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.14
Date: Thu,  5 Aug 2021 21:16:35 -0400
Message-Id: <20210806011635.1055841-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::25) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 01:16:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 915d8c13-d4d9-447b-4c3c-08d95877de3f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5256D26A3E389F4207063359F7F39@BL1PR12MB5256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cn3+PVtAZSOExv/caUHrHeyCwlxlapUqq1E1LTV7K8i21JFzFr0CCzd1fojvwuC9gRmJtCWwZDjZe+YHLPefRST9qoFvxFWjuL8XaD9bsnt2T5ukgRe8TMfDV8m2pCRHsUsjo/kAa/xwQojtrxvBWx995Ol2ywtYUcIZJyxWFHig4zm/WLhkSIHTJePmOdyq8QN05D78uOq9Jp9GWuY9BAbYjDbphx+FS4HWV4NS6KwDKjjNSDbFQtfU6K5yk0NJcP7OM5nFLUGFAilMNVPK7GhE4Y2p0zEFVDR12xuAOVxzuSDwqsbppHj/4TaZ6nHkQYV8xC7eXxAC/jS3lfOOBTlEDm5AS3bavj8Cxghm/oCK0/tJ1uISIezJX+n2EECfQMRvCSuCPofXwR24gnyynLLuPje91OaqhWunhop37XO74LURuustiiOqso/QCUulBDo7VbSbU3DCItOCNzFmLphzZLjpKnMzCNkqIeddYMP5YHvH/8fxXCsl4bBcRdqy7A1mhEZyJgNVf1mIr8bIKOLGgHTxs8EJ0+4DrKVJkKCrw0nlSc/wkwpehTyllo76EBIfgm5mWCvcg0nJIktUdRRqy2REU1mPCkFAscNgQ70ojIPlFzURX3EA7F+MNj9dq6p8oeS37c/V/SQAzYNcHaqFJw+Nc8HvLsQeAUdCBvu0mpGYB4KzL9lV+Jh92te91sm+zgbsFsFHIW65dV9JrbuZn2lmfteKdRqBu5AxsxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(186003)(2616005)(26005)(2906002)(478600001)(956004)(6486002)(6666004)(8676002)(6512007)(8936002)(4326008)(66476007)(66556008)(83380400001)(66946007)(36756003)(1076003)(316002)(86362001)(5660300002)(966005)(38350700002)(52116002)(6506007)(38100700002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i3fkgTcF2nhhsaYzmGhjVPq4aMf1LabazxyVLEWncEX617+2kpHGcZW6S9xy?=
 =?us-ascii?Q?uWUYopwZThC8tGWMUkRUqtWiPfovyWfZ9n9T4+PAgMKY9CT6MZxqnf8dKrw8?=
 =?us-ascii?Q?SjKXdiA5xgluwOwuLG4pNzFfUuYAr9IDZ1bPV1m3+XipeLRsXoQ+swekZXSg?=
 =?us-ascii?Q?WZwdeFnzGogFAID4d7ibPAz1MRTIZFNp2E5qvGpoQXkHj4Ac3T/HfGVMZ8kh?=
 =?us-ascii?Q?3nEPtFiy3Hsl/OnTD3nzMcy6nH956IwAf/fR9dMhh1vkm2TGuwjq7abW1qZt?=
 =?us-ascii?Q?plr1d8wslrAxgoZhIs5nr0x1VFi+AEYhRW0gEwmls62lAlbEOYXnUBMwwkLT?=
 =?us-ascii?Q?VSBrNVdPTUXDgv+KiqC2zwH1jKA7MAL866elRsj438Krn6C6OE6Xl46uYjZv?=
 =?us-ascii?Q?dXkBjRwbi2X71diPEew+8t4QUNxtU1thUG7IN6k//d97UWg3JG5i7nHCu4QY?=
 =?us-ascii?Q?ikN4svXSEpy5+QxIOytJNIhxpa+T+AnApRjubgGRmH0zNyUOnjpaYGFtViCL?=
 =?us-ascii?Q?tBRZu5eCB827p6GtW2nX1TOTd3/76j6p1mxD7C5ONp7zJP2NQFnyOCNjwWoy?=
 =?us-ascii?Q?wOZVAf02thY3mnncv3rM2PKogRSYyLbFs7BtdP9hrDZVB7jCEhrSHBmWdcK+?=
 =?us-ascii?Q?zxy9ku08UHb5dUyl+wCD2wc0EODKQKEABy4SXDFV1mJ5nmGOSNG/CuogXr8F?=
 =?us-ascii?Q?y81MxL5C4YZHu2ku6tWma4u4OWSyaJ1ZEsseFFHRI6my1Pg6gYR0QA8tna2J?=
 =?us-ascii?Q?RSu/TrYNXt160/hiva4o+sDgu/vp4SO8aocqGy1fncxcrzjE0n9FtO/nIs5b?=
 =?us-ascii?Q?W1nkcOdXa09fX9V+Kp8B2q9Hdv9N+GGijGJHKxsVx8A1eWcRqalpI6oAZWUF?=
 =?us-ascii?Q?ff63PbBd+TY5rpbUTQ+O0SMl3CI5q2dSfK4oSak51vqzpXAT3DcenzvxjkJT?=
 =?us-ascii?Q?ZDHGIyqQephWO13xQ1PBOxrhc0utM0fPo5jrhONZeB/A/I+c8corZURR0n4E?=
 =?us-ascii?Q?weR2kTGRTDcoSa+e1xw9h9XgjagTkFgIuBiWejYZGfNAiDUtlTSUL7E1dZpC?=
 =?us-ascii?Q?2sZGgHm6i6iYh0TDRTKIl07PczUPOy9CclsNm1BCnvJVdBn2cKVWNLJsW9VU?=
 =?us-ascii?Q?EuDQ1E5xIBDaSGo6iWpkf//WUIiyDmHj5BgPzh/3Tdn3kjho0FRflp5TUCv0?=
 =?us-ascii?Q?2dAXfgSqf7AybtCn14/Lmw1hWV0IGxns1nUfnDwIvS7QTWqlBwDdI5M096io?=
 =?us-ascii?Q?GgY37fe86vQEorQNPtqEEDwjARzdMps6B78Qey+pZGYfS7kNHGDbxA+B1NIO?=
 =?us-ascii?Q?s29GyQLmy5X57LjzlCJeO6AO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915d8c13-d4d9-447b-4c3c-08d95877de3f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:16:50.5127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/mBEW3chbAJtjSltVCEJbMT2wv62L1FVxy5sv+oexuOwsJ/VFZeyHfyMf0zChH3t99OtSZiAPaKPajlTPDV8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5256
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

Same pull, more S-o-b.

The following changes since commit d28e2568ac26fff351c846bf74ba6ca5dded733e:

  Merge tag 'amd-drm-fixes-5.14-2021-07-28' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-07-29 17:20:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-08-05

for you to fetch changes up to e00f543d3596c71201438d967877138ab33bb3de:

  drm/amdgpu: add DID for beige goby (2021-08-05 21:02:29 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-08-05:

amdgpu:
- Fix potential out-of-bounds read when updating GPUVM mapping
- Renoir powergating fix
- Yellow Carp updates
- 8K fix for navi1x
- Beige Goby updates and new DIDs
- Fix DMUB firmware version output
- EDP fix
- pmops config fix

----------------------------------------------------------------
Bing Guo (2):
      drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
      drm/amd/display: Increase stutter watermark for dcn303

Chengming Gui (1):
      drm/amdgpu: add DID for beige goby

Jude Shih (1):
      drm/amd/display: Fix resetting DCN3.1 HW when resuming from S4

Qingqing Zhuo (1):
      drm/amd/display: workaround for hard hang on HPD on native DP

Randy Dunlap (1):
      drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled

Shirish S (1):
      drm/amdgpu/display: fix DMUB firmware version info

Wesley Chalmers (1):
      drm/amd/display: Assume LTTPR interop for DCN31+

Xiaomeng Hou (1):
      drm/amd/pm: update yellow carp pmfw interface version

Yifan Zhang (1):
      drm/amdgpu: fix the doorbell missing when in CGPG issue for renoir.

xinhui pan (1):
      drm/amdgpu: Fix out-of-bounds read when update mapping

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c             |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h      |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c               | 21 ++++++++++++++++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c   |  4 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c    | 21 ++-------------------
 drivers/gpu/drm/amd/display/dc/dc.h                 |  2 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c   |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c   | 20 ++++++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn303/dcn303_resource.c |  4 ++--
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c   | 16 ++++++++++++++++
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c   |  8 +++++---
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h              |  2 +-
 14 files changed, 83 insertions(+), 31 deletions(-)
