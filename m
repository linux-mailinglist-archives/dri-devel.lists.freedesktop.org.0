Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A570A37FB87
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 18:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9CA6ED72;
	Thu, 13 May 2021 16:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013F6ED65;
 Thu, 13 May 2021 16:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeO5cjjDpQ3xRdlgdB92zGKHNmwVUHgIbnIM/zQzC0VeTqfTUTruN90YQyZ9hd1rUGev2vsxWHUFyQVr7F216XkeTW9J0HKZpkIlDKYAZlPzhp7j5bRVZGEwWVVcblzlB/dbJYrMSLgRlSHih12cmpdciQQvL6j4MA3XnfagU6nelB+F7CZTjWhiXqPzCEWZ+FSCjM4wmLN7ocJvVu/sAYW1q11LGkP5gGPzFlPheMKaXLogV+L5VBXehpnFPbVaApYqX3Y9lETZ8aeVa/epLOxU0yrgjW+FMdQEl607jGlCX2OJEo7rUCVRGtzxzMATUKeEiI0BVwVxrK5P4tgoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JtQGs2Vzt5kOx54fXyc5MXXJXfYpAZlqL0LWjL9srw=;
 b=devc3h3QRx/+CRAfXjXdvHOJWFkTTfSI3QLUntdIi+F2NvWKtXtrkrXhrOkO6vl5+8wJqHoyMixOTjcbMjF6I7zcBTfjhAqU4qJeKSRQFsLco18D7FHgihyq4hymqH3OHVP2jFWmW8Ritry3EnjUBLmFA30Fp7z7qh59ve5q+QvbD67hfLV/WaekkwN6478llpUSlv6hpYD+SqyCaJLQzaumBFKJn70udVQHh8t5zffn6NY1CGX3De5cTuQecXQnrNj0hWHCu7k6yDl6urrLdjIjQKhgg1F81seang7eS4tWGH2dG3he57zzXzNb71WJbZzERRFDKMxSnTzWdAGTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JtQGs2Vzt5kOx54fXyc5MXXJXfYpAZlqL0LWjL9srw=;
 b=cEIQgtgCg0yNYWlJRVcpragdu6ZuYdp9ro4LkPkHYqTh+d/KTSzj032XVObQ49YViFojddwANt0ANdVBWNyQP6BzIF1no8J+kWS7g74ofWLhbdFKFccOqslhpu6jTBtEUrC6ke8htPKFPL6kTnKY7o+/SIOUijgF9oFSPsB3SOo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 16:32:52 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 16:32:52 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-fixes-5.13
Date: Thu, 13 May 2021 12:32:28 -0400
Message-Id: <20210513163228.3963-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.161.79.245]
X-ClientProxiedBy: MN2PR15CA0010.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::23) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.245) by
 MN2PR15CA0010.namprd15.prod.outlook.com (2603:10b6:208:1b4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 13 May 2021 16:32:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b416e40e-2830-4ca5-9760-08d9162cc0d8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44864C622E5BB0D366929448F7519@MN2PR12MB4486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JyYVuHwQ5bNQue3/Td5wO00UxKaCiw/NlO80j3W6UPZ0sNZVqmV5ARkk5SA1hqM+YMcfWiJW467QDoP2WYy2X1lS8Quc+UZrx2uv7tUG3vTxM/zIpFQGn20V8Yjr7SkZP6Ix0l2CGr+gktVicslCFf0sFKTJ1At+lSDL1Kt4G/wsz/AbAfsMDf/6e4ZKT3Htel2qaZF6i2oONGRSzJUchajrwEGdVmL2IMJoA1WsHOaV3F14JkzmCaGGvkkyRDsMwwLldPzAWMW3LEQQYN6vnQ32dwcLlTQyKuAD98PohVI+hqexVdUjTjmFaSJ5HD26gaDEKOA//2KtJpiZXcq5GzhJs5u9BoclFW0RzyA6fflW4nOP9tMOXTr6TfeOIaqBjrMro1Xt6lwpjsh637q/FoDHVtA6cctiQN+5dKY7SfxIBsd6uytRrJSVNKrNo+yD8msKu3JR0GndUt1/VV3W64H0okXRevJOGQxx+xMSxNSYAPtgHEscqYWr1Vhv3Qyn4a820o/3hZt1HHiZkM0fePFbOMviGtSGIFbZDnLCQR0wqKV875R/f0vOCasypmndL1IXBBaNJX3yjs/zwdAHrw52sUuCP9VJtPQYQ3bH9vUmIG3T81aWJRX7ZNI+0o/dDAALUa/tgzDTvp2PzyatWgeexq0zih6Jipzs41GqwqzCHcoqseWW89nDIgaYUF7ts7IV7O2zS6f0JWp6pGDw57akjr9IKagpZW6ONl9Oy88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(478600001)(66476007)(6512007)(36756003)(6506007)(6666004)(83380400001)(8676002)(1076003)(86362001)(6486002)(66556008)(52116002)(4326008)(38100700002)(956004)(66946007)(5660300002)(16526019)(966005)(316002)(2906002)(186003)(2616005)(8936002)(38350700002)(26005)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gYE2NzPJG0o8U9xa6jB7HD2qeML9B56atT5YV0715/UFkfCtXxoQB6434t7x?=
 =?us-ascii?Q?hXe6JFyyv+6/5Lm5vdJym1VR2S49RVEjoLAxLRvQX0KR3TNzPBWYnasHjOKG?=
 =?us-ascii?Q?hZ/FfFfGmtNi7+AFfR3K9k552k6MkCte3NHjE1K7bL0SxZUF64CK9PDIEyrK?=
 =?us-ascii?Q?G0gx6/N4WkIKqOfrRaeVlzbLBmM9QvE2oTXVbs0gYGz1NhG6jo//MEtxJ/8q?=
 =?us-ascii?Q?VhRaed3uT23ALuXVqRPq/yUweZEHPq6cfU0DfGHxBGCN+maQXy9lFjYLkP6W?=
 =?us-ascii?Q?Oi1jsYmSE3yO8ZyTzR/dpSNBmT2mMY9X2k+CQ8nOporflbd/gX8Tjq8FLDQb?=
 =?us-ascii?Q?8sdZXl0SuPxdQBLpnJomPXM9pGAKiemBk0mDLVRE1LpWsDOMUXic0EC+t+7e?=
 =?us-ascii?Q?nhlCOoqMKAHdwHPWLl8q3a5bHKtFsEZLiLqKWif3qoe3v6kyrmhTnuKUNOHY?=
 =?us-ascii?Q?Jr8OQ//pgXFWrOl67BCyofe01kjifMZCFDQOBE67cpUaNzXfycfJJSpCW/4A?=
 =?us-ascii?Q?y27J+I6TWeGqMvi/aZiIE9z3pysdwDqvLb+l+12XrrLAUWPCFSdXdKCg4VBc?=
 =?us-ascii?Q?IHQW/FnGy7dTl1IVheNjy5lNXLekI05AWtyca84PyQMaWIGljSTpgpgtszxn?=
 =?us-ascii?Q?WIpL8oWuE7HG5LcBbMOG2tUhSYmGvrXX48jw7F7jMAL5qm9ynkY2pIsrOZvM?=
 =?us-ascii?Q?Pn79Z/P22BkAdNhgyGCzFPqE6uH6qot/li5C6/4ivlCwmBgPst4hf92zHiON?=
 =?us-ascii?Q?zbbyKgc/Qxy6fBkjUBXnm5FNpf3X3RaBQENkqh26xJkPJylUPMz6Pk2dBq4u?=
 =?us-ascii?Q?mOdA+v4piJzNejm+2hFwGrTEZ4ENtbuhgsE+AS6/gM/7MO4++Q21k7KvogBe?=
 =?us-ascii?Q?8qDZCZqS7JEwy8F6NWaVBMy8mBxRv5Wl/ENCE/RLfj3EDyzHRrtEl/6/7/0V?=
 =?us-ascii?Q?RJm/n4NXjS6Y3jNkwtsmYb+XP2J1BG9DNrTEIzdHXROV42rH/ZLnPM6IBOQp?=
 =?us-ascii?Q?LkKDForwIxobpNLTtpqThmsiQRBLtfyBSaIiLzb78Pas8+tXru7VC3RXn6ed?=
 =?us-ascii?Q?wmwrlVrPgeTHAeHHpvyhm0DtDdvzmTCOJSSPE++f97qlUyQmPj9oggZhhoS2?=
 =?us-ascii?Q?7AhIvyY+tKJV23+7MUZQXnl+IodE1GpPWx9fniTMcipLpZafya+JaqAEE6Qu?=
 =?us-ascii?Q?+zbxjikE1PPYPUePJkOqCokpqg2wcJtP+VXsMIurC62NCKKD/ZHQ21xakumF?=
 =?us-ascii?Q?SprLDk6UBoZl8y9nvPzqc/WlGqEsOlzWfFyp6RTMXQhDN4pr/iKH9my4IIIe?=
 =?us-ascii?Q?xzCqWxRdeWMQvz33cQWfX2gH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b416e40e-2830-4ca5-9760-08d9162cc0d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 16:32:52.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zyxcwrol5B+VA8sJIX88qYzJnEpKoC8JusGuPLSkEE0i6qwLHTy68taIyQxWW/Eq1LcRj7gtSxnvAKjOlnv5hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.13.

The following changes since commit 875d598db60ac81e768fdfd2c589f6209038488b:

  MAINTAINERS: Update address for Emma Anholt (2021-05-11 20:38:08 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.13-2021-05-13

for you to fetch changes up to 5c1efb5f7682e2072ca5ce12cd616d432604ecc0:

  drm/amdgpu: update vcn1.0 Non-DPG suspend sequence (2021-05-13 10:49:29 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.13-2021-05-13:

amdgpu:
- Fixes for flexible array conversions
- Fix sysfs attribute init
- Harvesting fixes
- VCN CG/PG fixes for Picasso

radeon:
- Fixes for flexible array conversions
- Fix for flickering on Oland with multiple 4K displays

----------------------------------------------------------------
David Ward (1):
      drm/amd/display: Initialize attribute for hdcp_srm sysfs file

Gustavo A. R. Silva (3):
      drm/radeon/ni_dpm: Fix booting bug
      drm/radeon/si_dpm: Fix SMU power state load
      drm/amd/pm: Fix out-of-bounds bug

Kai-Heng Feng (1):
      drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz monitors are connected

Likun GAO (1):
      drm/amdgpu: add judgement when add ip blocks (v2)

Likun Gao (1):
      drm/amdgpu: update the method for harvest IP for specific SKU

Sathishkumar S (2):
      drm/amdgpu: set vcn mgcg flag for picasso
      drm/amdgpu: update vcn1.0 Non-DPG suspend sequence

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  28 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  38 +++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  13 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   6 +
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c          | 174 ++++++++++----------
 drivers/gpu/drm/amd/pm/powerplay/sislands_smc.h    |  34 ++--
 drivers/gpu/drm/radeon/ni_dpm.c                    | 144 ++++++++---------
 drivers/gpu/drm/radeon/nislands_smc.h              |  34 ++--
 drivers/gpu/drm/radeon/radeon.h                    |   1 +
 drivers/gpu/drm/radeon/radeon_pm.c                 |   8 +
 drivers/gpu/drm/radeon/si_dpm.c                    | 177 +++++++++++----------
 drivers/gpu/drm/radeon/sislands_smc.h              |  34 ++--
 17 files changed, 409 insertions(+), 303 deletions(-)
