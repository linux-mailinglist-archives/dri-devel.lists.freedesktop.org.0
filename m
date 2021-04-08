Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B03357B9B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 06:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746BF6E9F1;
	Thu,  8 Apr 2021 04:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03BD6E8DB;
 Thu,  8 Apr 2021 04:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAUbLlTJjfxiuwcFGGUiUDHejo2+MDKxPreS6a0wr2Ot1QyD1dH5AuOPWX5qjWAX3TyMvxLiBaTEZUkj2PLGddRb1XWbBB/HfZyMNg2iO4qWpq7G3uvZaPcKixS6e/a1jpRVbrf068JMDmmVzQaHZ7yc7asUs6qwTufvR9/TcPTInIC/rc4JMJSzG9wM5EGT7y+mB/ehF2pPW3ATrY93UtXin/gQPrwNu9UKM5noMdIGQbYSBPDb/P0TF3RAcJJ64GokrrKfRoXGPyY/VuHuRVfRT+e6grMte+s2mK7bWzWvKAxqcMW4ayOVxJV1bvggkEwDADhlPmf3SQl9wOqhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHbSkfSkyfnlmVK27d4ANL/XIannZF1JCLuHscP0rgI=;
 b=A8YoJU+T2oWAxNmPku7iTf47cKbVkgoX65mT15IWh3lRut2Zr4+dK6J244RIy58g5RSnYTZlARX0vpsdXgGtOidoC1HC+r4g4nWlxOfzXv3KXTlZHBxfWn06D/0/djkWEY6QKVprzRDsyFc5SWzddEcny3tkUZzFRIR421UnZ/qlf81BE7UJepYL2VM8G0P8q3O8cBNmaTlCXIzVumRCP80Hpxu231Nvphgs4wI822EszjegQ0iga1EbHLVG3Py27pmUksz2vfcfmuljkO9+OzZM60zUyJtFnhLU3WFzagaZ+OP9Iig0/rOaadPWavcm3IXPXlP7cKaPcH8EVu6ANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHbSkfSkyfnlmVK27d4ANL/XIannZF1JCLuHscP0rgI=;
 b=GOqWSk55KDd3mkDYzioHihzoMhdnzE35KsLIcRhQ4tq/ROeRfi6tGYGEIe/4scCB3FmUEu+nfqQbXgPYVo6/1Gfw/aKMgStp1QjqLTaS1YpwA+T/DSOrnLGTZynNR9HyP234gJa6YUw/UkIvcFlFEGQ8R2RJRa34G3FnuLvklEU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3919.namprd12.prod.outlook.com (2603:10b6:208:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 04:55:29 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 04:55:28 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-fixes-5.12
Date: Thu,  8 Apr 2021 00:55:12 -0400
Message-Id: <20210408045512.3879-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: BL1PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::17) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 BL1PR13CA0222.namprd13.prod.outlook.com (2603:10b6:208:2bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend
 Transport; Thu, 8 Apr 2021 04:55:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2b07e1d-1bca-4483-72a9-08d8fa4a87bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3919:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB391901BA13F257B593EA47CAF7749@MN2PR12MB3919.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vit3cfFWMv2hkGFgaB40ELPlxpMi80jSZDlgXghupyeY+sqKszgfwt9uFjG3uXMKE257AYG35PLSNLzOtWa2xbXoyeT/y6wWPiLmcOW6AgW/V/uTZQcAxIgGm89d6GJ04RGuOm7SYyE4QKIHw94xUVEoTxne069ad4vQWaAKOyv/m4jLTggS1yfwXiO/lyHSRSGZED11mbC+gU9X2pY/ycNPVcDNn2EKSItmqu6c0G7UMueWGKpkDRLCq31Dls3AinBjQLI39m8T1Adx/djttvEWm0hVSGGwy+56MyJHyVLDgDRLOGYCSXSQOQTnilp9hfSGAsegdJvSSi/n4D/Bv0+gkLB/TaYB7E1x0aUgrChrsFU6ZtEbLjkVqKOG35wJeP8yRPwcgLNvltmxDWyFOFo2loIAgz4u1FAcVUHKTM7/xIYWJ4iP6b1DMi9trcI5AlPkuqu6FZzta+HGpJULABn52TJKc3xGQ6IrnpKgUGeAPEjd+AbexOW4MCJk474k5G/2L6jKBT8mJx+jdarZtFLG/s+otKEmAD+WrYslyNhHRgVx5tNdjdFP4lpUlWHqq2g5eZq8tYy3SMlWWBlNmuekZ4vQjdCt0w2mmpD7mWs48KXJEQZU+rufgNZ7gwhKb9cPKEB+TYhi9BTjkxXWwNWcdClp2J2Kko692PnqnKDKFFzQFbdAsebUBj2hWxUelmYDrxNgWmZQsl1L5znnwLnfskJBdh6/7AMgOiFfb+SyKzun8Ab3SOB6IB4Ks8uCx6CgESbMkTyLG3j4Yjnqqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(8676002)(86362001)(69590400012)(16526019)(478600001)(2906002)(186003)(8936002)(316002)(1076003)(6506007)(2616005)(36756003)(956004)(26005)(966005)(6512007)(38100700001)(4326008)(6666004)(66476007)(66556008)(52116002)(38350700001)(6486002)(5660300002)(83380400001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F7gd+vurH+L3KfaNjpS4XOAeVeD8Owit49EG8EeN7Kl5UaNh5/J/WR3xOZfe?=
 =?us-ascii?Q?AxVLQnb0S9gPdVbHs+LLBfurayaYH46Si0Nd0TKcadHP12Pjjnrrf2q4934O?=
 =?us-ascii?Q?WXDI2z/kUPeWMivIgn7QjnejdByRUO83tXpIfqqwNwz0/nGmJinheO3dfI9t?=
 =?us-ascii?Q?byJM+JPl3D6uGbrnDO+QdqYxYDMR2sP7TtSE9FAyk1v4lZJib4QmzTXWrcEV?=
 =?us-ascii?Q?RBv02twlMvcNvY3vzMDVCfgaNj+3E+9TgBh/pCFrPzcRLplk4OJ2bwY/0PII?=
 =?us-ascii?Q?MHtc0uvVsvBW2+PnqZazkSMSizgVTfpdGwr2wV9pIFMxNNdtfaBsvCRFad2k?=
 =?us-ascii?Q?5fZgXjHgtVUfpMTq4roXA/jVNJjhjU4Qku1idUylyvS9JbjvNHZ+fpUnRikD?=
 =?us-ascii?Q?zlZ0mfQKpXp01WecHKZ3Sy9sse5zFXrKMrBUjpRXLSE7kwZun3JeTA6bePZP?=
 =?us-ascii?Q?7UJJgY7qB5OS7ccRT2ulYJs2dnKz3bQR2RUqk6XWtkJd3TGRDcgFP/Gqq7WX?=
 =?us-ascii?Q?7VwO0JPMowu31D5glp1SK/ZeURRfxOrG8N/dkRdWfR5uzZx5Yh6RSxzr5pKL?=
 =?us-ascii?Q?QJKWl5WbpABe2cXnLbIdscfwsiHs6rIWhQ7HHWltXyOBIliXUuNljLVoHyo3?=
 =?us-ascii?Q?w0QaaDnDFZkTqwu+wA539AWU4q12DnWpJz0EYLlxa42oGMliA8am6k5K6kM4?=
 =?us-ascii?Q?0UCmJUqfa/RwE6gmCkWZn6znRJfsO/7v6wr7E8wBxu2zDchwz8fnKbgSb39h?=
 =?us-ascii?Q?ticwUO1su8wpPOn4T14bMTl0d+mq8fWyr6/e0H/2oFkYvr+b1UVBkaL4kq6B?=
 =?us-ascii?Q?NLiihhV4OgyZ8l+GRNkLvpTYve55lmKr1f6cIn4vQIB5R49mkOeG4afyhhhX?=
 =?us-ascii?Q?ZpY28K/CdU/MZO5hcLJykNyOUVtoVqbSl6Zj1CLOrEcLvgy9MwKCb0uBiNri?=
 =?us-ascii?Q?okoUUVp7CUZrr64WS8KnVhqa5K1vtXeOf3AsZdQCG3jTCO5Bwm++a3BkPKGb?=
 =?us-ascii?Q?Hx7D0WVVY7NObX5oklGhEBRhtXzNBJ838C9Wr4+1nZ9VMLN5nSs4Q4mUZtxS?=
 =?us-ascii?Q?mf7rtYql7L80c/SXppp1MprL52vRQF7ULCK7Cl0J9FlOnTFH+67pvK92mafQ?=
 =?us-ascii?Q?OyqKl7nv9NrISVNITSdUlRWVpSGmvWlVm+aqic6UZcav4HYfGWlhFAicS0a6?=
 =?us-ascii?Q?a6LJ281C4Dyrqa1g0ey3JI7rCYghIQjBx39Fd0hEK2CAXSgVx9Act40UOhA6?=
 =?us-ascii?Q?DVtnWvMFEZICggeydmEHsvylbHhok7u44Bl7ecTTWsdVLf9BuhWB6OSV7D5b?=
 =?us-ascii?Q?oFNt8SqMmtlvUYlNkIIISIGy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b07e1d-1bca-4483-72a9-08d8fa4a87bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 04:55:28.8417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFTsw1L0sznhbOlWQTE9/4YVSx8b4N6doOzbnwP2L/436xILRK/EaFa5GbSu9bVsN+FtAOSFN/0p9q9GhyekCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
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

The following changes since commit 6fdb8e5aba6a33fe5f1a0bd1bcf0cf2884437ead:

  Merge tag 'imx-drm-fixes-2021-04-01' of git://git.pengutronix.de/git/pza/linux into drm-fixes (2021-04-02 04:53:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.12-2021-04-08

for you to fetch changes up to cdcc108a2aced5f9cbc45920e29bf49819e5477f:

  drm/amdgpu/smu7: fix CAC setting on TOPAZ (2021-04-08 00:36:40 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.12-2021-04-08:

amdgpu:
- DCN3 fix
- Fix CAC setting regression for TOPAZ
- Fix ttm regression

radeon:
- Fix ttm regression

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu7: fix CAC setting on TOPAZ

Qingqing Zhuo (1):
      drm/amd/display: Add missing mask for DCN3

xinhui pan (2):
      drm/amdgpu: Fix size overflow
      drm/radeon: Fix size overflow

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c             | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h   | 1 +
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c | 3 ++-
 drivers/gpu/drm/radeon/radeon_ttm.c                 | 4 ++--
 4 files changed, 6 insertions(+), 4 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
