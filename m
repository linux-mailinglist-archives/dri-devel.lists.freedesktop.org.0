Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF23E0CD1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 05:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F1C89FC9;
	Thu,  5 Aug 2021 03:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F4289FA9;
 Thu,  5 Aug 2021 03:37:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlHCouTOouNHYDRhPsgPFxqexNEca8xU2KjC8kz7PD+7quflpEDSV4V4as906cJzOsT2J3p8QzLpt0X6a2bsDh3SZpy2rjFruy0KgHYyMO4UP3v2QUrDPFfAVV2iiWTZKR3MqUwLtTGdrOVQz35n6NRCZzJjvDUio2y2JlMxKTxtEftO78X4ha64SSxog+fYLwQydFmQUygdtjPfHAoEG8ityBX8Dfhu2xwbzywLCp/xkmnkegdOJkq/r8jwf7Un6N7xAOoA7SNHyt/RlN5yW1tGlrIZSAMlRwLGjPhIAF1jSarGGMdp44Dl20tkQlLCFGRqN9ZWjMwvBLJ1pGsY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEdrKJCVeM5SiWhP2zxtWaRYi3p/El/k9C7KGAjcoLQ=;
 b=JyZFoU5u5/WEJq977gQlqn62Ut9nmN4MVg8vHuuJ1J2vXaZCQ1owvvOnC6EqX6sYTuHIEaJJhmSX7NhR8livH1XXDCFAnIVBqKcYQmsfpRZK6V5qlXIcjluhoL8m5pqP0npsRHtDs+gAsfC0TLZx8Hx9fhfZMHan3HkVf5y19CV9Af8+gedHWB2MlnIjQKd3oeVxhYFaX7i8la8o4dbOikR8BQJW5V25XQx8Hk/p44PLsNoMEqxvr+xMPwTj0UoMcmrvYzglOsFABZbry6NM8j39OktyGbxYuIiAyYezFyb5/oKrCTPr5ieFVojd7rfcTYL97zMqjsbGk6AvlTjhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEdrKJCVeM5SiWhP2zxtWaRYi3p/El/k9C7KGAjcoLQ=;
 b=BTQwMjMpnCCJZ5kbxuR0UvxNtkbzgnWgh/Sg+Q7wsqRCRtCCgq7w/XpczM9hwpxavaW5jp+6BhtIyZYMcxGRVymbuDoRnqsISBkjlTcUkIyTjuU9hJ592rRStx7r199ldqYtpklF90gvJ72O212qILynIYD+bMwPtpDDCM+LK1k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5159.namprd12.prod.outlook.com (2603:10b6:208:318::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 03:37:05 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 03:37:05 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.14
Date: Wed,  4 Aug 2021 23:36:49 -0400
Message-Id: <20210805033649.4091-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::35) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1PR13CA0120.namprd13.prod.outlook.com (2603:10b6:208:2b9::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend
 Transport; Thu, 5 Aug 2021 03:37:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95f8d841-75dc-485a-d8b5-08d957c24b47
X-MS-TrafficTypeDiagnostic: BL1PR12MB5159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51593A6972EF991E112C89B2F7F29@BL1PR12MB5159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dRYM7N/GsEvj3e/ux1NINZKzr4y/uq0f/hAsoq/ZXK72B6A35oq9f6brcdM8kklE2/ZE+eiqQ12/zTmFUm7QnaGWRQJ0hZToVdyoWTzJh0BIQyd9qvUns2lLWevBIRTpCZSmPkB8MTzFmEO3IABdHMlEocy85o6WRfxcwjUX9KJ1t6hRDu0H4XuizF2wlsMhFx1DBjMHrG53Nmxen4u/Zq9cLCXuBvuRaqllnZYehQiIqf9q8lu3uURieDbi8nza9IkEjjzoC1yDyPPn9IWBDvRmf0cjqhK0VwwHIOps/BReRFN9rmJmiX9fOrRfBY9T4bb7hkzFVMJI2/foCWaReNG3NjRd/3ysHiiX3IcLlCyLwXJCWcehlx97cmYmBAG+MfyZLkGpZdR+chCMsAJ1f0h8QnQePoiJsy+hekpJ3yFJkuNgCJfuAmre5WYvzZwbOvOIRfJvHxXLPhOzE3acqH6rZhw3lHSeFx1tGZMOdwhyvLOQ58X6StNwSiiPm4kAm1QKaKjhzHIJbyLAQ0T2Ft33/RnjWQCe7eS08Q2SoUohdlOjxyphOG7MG3cUlaVCFcIVYyeoGwEhqeU+T1bvC+ZXeEwCdcHjvvdQnr6i+GvZvJfQb86p8cCKnpb0sBWYlj8fFl1F5mv4g7Uf0KuB47FFtsqllOMoqiMXrJctfofiZPs521xMyzO4oq04EVj4Q2fGhtdDGc3KxydZ8NEMYUteBNHVOcULnOqFlwvR6HY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(966005)(2616005)(38350700002)(316002)(2906002)(6506007)(38100700002)(478600001)(956004)(6486002)(4326008)(52116002)(5660300002)(6512007)(1076003)(66476007)(86362001)(66556008)(186003)(66946007)(8936002)(6666004)(26005)(8676002)(36756003)(83380400001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TnHXnTeGuBnPYa1/pKF1dgb95FU+fgxwbdNt1P/H6FnHzW4XZ4GrHFRRL7CT?=
 =?us-ascii?Q?s8Y4sWsz7mNLjBb88hYPejB+UovE6GxLlRB1McOKoAOiY58eR1keLcEOAYCe?=
 =?us-ascii?Q?gAxqjoFiNEsUuI+9/k5mNlBCLhoDNOAJhKDynt5SV3ij+QyilNreNEymB4eH?=
 =?us-ascii?Q?hfaaBhJY+iZoYBx+1cmnVcxWdD5ZEgmM8wcdvfQlT88uwjNJDlpPGX10hlYn?=
 =?us-ascii?Q?z86JlN85LFKTgW76vHDFNnKXu0V0EK0vG67ITTXvJHH5q1UGgh2tFSumCqUq?=
 =?us-ascii?Q?9qqGx7W37QLGjQIkJQPe2qp0/DO5ythQMFM0WF2s+QLHakLiw5ZTqHE1xayt?=
 =?us-ascii?Q?kNqt4Wz8JmqPXQ/PK5PnqoJ4hKwlxkj1MJqX96TMXY8pF6QceVZ0nQJ8Bo+f?=
 =?us-ascii?Q?h2VT6DnEcBzsa0IP2YFFMj82aBeR5oGe/cAcpd2VFuRkOiflbEsj9b3hgyhE?=
 =?us-ascii?Q?ScX5tFPT3IOKCmyxJne2oYaE9fZOaGLvpLWcMjttqYXqcq2XNwfeTQ6nNcPt?=
 =?us-ascii?Q?z8Alf0dAISQ8Fa7JiQnjVlxGiKQMOtIzrdX4y/gh7YHsj1HB36TvjhHyWPqh?=
 =?us-ascii?Q?HWSNAphWzfzIci5U2WJZPzJwPBo4O0fGVoerdkR3XoD9d3L2K3zuFJ09y6Wg?=
 =?us-ascii?Q?ruqE6EFXZBjv546JrTKVu2WCAfUIUMAx/oz+AjPQMhY+LK/tp+1mZgfmNPHx?=
 =?us-ascii?Q?N4TP/LUV3l99XUCuQAhp1t1X6NH+7opcSm85lrljjqniPlVEvZiN5SG2OmpJ?=
 =?us-ascii?Q?aOsJhvikWAjsfWMKLadbXqOslb+CFj1mUUJZiv93ARVGnHodOCkajD88PkuQ?=
 =?us-ascii?Q?3HY4dP94plhEsxpdtJjuvuqK1KgTrZSnc7cCy0fxwURRA3eCKXR/R/OmU3ZZ?=
 =?us-ascii?Q?IB1rDKqB9rDZLcgM/+bR/h4cy5WAXu6xiotjIkhwdaIl577klr7EoAGqgoYe?=
 =?us-ascii?Q?/JHObD8a+OA/yDS/+Z69wjSJvGDs8I/2LRD7thzd3RO2aNh6c0mkOUN9M6Q8?=
 =?us-ascii?Q?Ce3mRaSGbh3Vuw6W0d45W+8DtJchCJxT4+t/UnXABarnBa3l1RNV3sMlLJp8?=
 =?us-ascii?Q?N+GuDTzpTtxwgCDRBnPQuBdRtrT3RytZI0dg9EjsQFnZIMlP182sGUCxNIwY?=
 =?us-ascii?Q?+myyXLX0/FnEeej3QbTrcvslWQy2hN25/5X6XwL1a00frRpBJLQWpKOAL7VA?=
 =?us-ascii?Q?96w/KKzQXbKHeTc64Ou1mR8/zn8pPifrWYgYEk7W8o/USKU81bbSBe6a7xYS?=
 =?us-ascii?Q?NbS3rruPw2unD9WN2bRFcpk2WUrqfw4Iff6Im29y1qHpXZTJMXeA5a2M+Gss?=
 =?us-ascii?Q?PbVpUb8sc+cFSk0nvMoRp34e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f8d841-75dc-485a-d8b5-08d957c24b47
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:37:05.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQBoDwcG6cjBZ03p9+qzE1+KggQfWMTNjYvIeoGu4OB7zwE1wPDd22JWq2W1DOPqex4o3k1V2IK1/1XMqNqKbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5159
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

The following changes since commit d28e2568ac26fff351c846bf74ba6ca5dded733e:

  Merge tag 'amd-drm-fixes-5.14-2021-07-28' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-07-29 17:20:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-08-04

for you to fetch changes up to 574fdb20f3e2b001eeddcaf4f16a5c8258243323:

  drm/amdgpu: add DID for beige goby (2021-08-03 16:59:16 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-08-04:

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
