Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A169D3E9C7A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 04:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86816E222;
	Thu, 12 Aug 2021 02:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A806E220;
 Thu, 12 Aug 2021 02:22:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNU3ke9MxCyOom2lpfwXHeNvxY5r0Ek5klEJ1LxG3dTiMdx+9zARH+/G3HaLW6w8OwNUwZNrtxTAWiO0EPNHRnBKo1N8HwFpqT8fYPS4RPlslqmE3QyCyYbRUU4nF3+ZF+nxqONpx2bHZJsF4fhUk6rGkYG0DBQDSHCY/PalcFc/IYL9V0MbfkzQjpBLnDIR4gnA6H0WSesLjkw/0tldiOPrSRYTV4uk/zvRgpLJswO7v4WccFhn1XZfjf8+zO1R5jQw2kkNgRuJvD5VJkalrVGuISmUMR4+HGK8cpT7znOXGS57AL61iGMZTH75GS1r5IkfIz2+2hk6sMk4RX2apQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvBn8k86mGCOynS6XZ33o57G+7MkOYC/6s78FaC9yvk=;
 b=asc7dgDCOXJN72jY8u4XUemiVSSTSlyI+N+8dZkyArsgPZKbfKyLOMfPaZ6twU3rPo6FTNeNevcX95uJUH2vMbIM0GDzxp9DxBaSyVzcqUdVIfUaYjx+PQxISW21bFXwBgidJ2kQZD/B297yXa1mSOKFO/F1ccx0V/yiapshrGfbCg8sVb2hHoTZnZP0EUkY3W9vWWWGy+maSqDjhDvU5IWXYbvDxWOfHhXEELZliNsQaVz3EEszWFIauT8MnIbuoxoag9f5rP0UrwOOZTovfF0mB5xBaW/S9jzcgSxz5DowKUYzMPDh6UUJb3qKEt5Zk1SvCfDx6oFfnXBRUZkJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvBn8k86mGCOynS6XZ33o57G+7MkOYC/6s78FaC9yvk=;
 b=Hp2v++o6eRkzPOB3lJylxG9BSUg30qide8VJyJ761vHKU9QXlPY0OLqpY7LdoYqtibqpN2jWMPqNRS8VujKDQf5vvItHj+TOl2kNyP3JDLpyfRhkqAszxIP//ICyJ4F44pv+KgPikCQRDZCQvwaInol5RhoFUJu3z/aQeEkMRBw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5142.namprd12.prod.outlook.com (2603:10b6:208:312::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Thu, 12 Aug
 2021 02:22:22 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%5]) with mapi id 15.20.4415.014; Thu, 12 Aug 2021
 02:22:22 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.14
Date: Wed, 11 Aug 2021 22:21:53 -0400
Message-Id: <20210812022153.4005-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::13) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1PR13CA0098.namprd13.prod.outlook.com (2603:10b6:208:2b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.6 via Frontend
 Transport; Thu, 12 Aug 2021 02:22:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ecea503-00b6-4c82-e7b2-08d95d38045a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5142E292E4FADFC90A31E2ACF7F99@BL1PR12MB5142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gyrlbXAREBQmQ/MIctA4CQww1al9Pb2XltiOut3EJ8FLtDYIqEbY0yRwo1uFPvhl/uxUAm9KJ3FJJhYHHY10fk8ElI35xYMeF7+T63XHUzsuxHQDRdC0zn6iE8+jX8UgRbmTf4pVEbDD7l5x/Fgjs+S4a2pmptbKuZcDpj7uGZZ9GhqWmYfyCnPAolXht4uw2mELnX8bJNNJI2cdAUVjr7lJAiCHjjMHsqWq7gePsK/BiSuP8cfZSGEklcolcwdsXsaen8SGjC3lIT6OVz7cxuDZDDEMt0ETX78CNzn/jjXG8Lk8YaG3Llct+i4sAGK74dG+2emXcNaCcJZCCjmm4ncCnkQ1+PzU5/lNHOC+L1JrshS6gvGfa55uRjictIyNDnJT1Csh+zFgei5CxzWU6Wv5E24ggt/oMrDpk/XGoiDsIWeuZTr7KXC5cQKjEyGufg4qqD4btK1cD9mLKxS+Qa9DB5AgWzM/0yBdLb6QudNUShP234PlNeL5rjXwvbFRf8n2VIAePc8N13LC9W/5Q3Kpve74cIuaMnVSNOZSQZXrk1MK4yei+xPuvWqLn4E4hOolSq3puGHwCcEkvbEJ7yrED2PH+ZQHrIBIF8XsncXWJAdSvRds++R9NNvCU+zLtGRURJvuly5EglgweCC1aXYb4y4UWOLY+RxF49djCjs0+l8ri/n1Tryni3qXDGL5Mjdaneu9QXGyVyQ8BIwn8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(26005)(66946007)(8936002)(2616005)(5660300002)(66476007)(956004)(66556008)(186003)(1076003)(2906002)(86362001)(36756003)(478600001)(316002)(6512007)(38350700002)(6506007)(8676002)(38100700002)(52116002)(83380400001)(966005)(4326008)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2uQe6HdLaWhUDxBri2/90HSDpCJsLYVk/ZfQm4JzoDZbW0cAVB6IgRu7Ojq?=
 =?us-ascii?Q?c9Ao5Rsd7Fc8IiikA7XOBV5Q9Go2PYNWTti70eoknObRjRJleX/1heXL/g8d?=
 =?us-ascii?Q?E/sAqvh31X0nOFNtg/eqEu2yM6q+s3yMZnqHu5/+Aa11ShGekTyYkD7m3Ovg?=
 =?us-ascii?Q?fREbqmp7GwcjsMlU+itEWn6T74XaPXoQoYzjnNmQku2Kty0It/eKxzfUuW7o?=
 =?us-ascii?Q?z1M2pkgDRy8RZsztzxYpyDDvNjPEMOualaXGPYlOhN2atYU7cVIIyBlnm7yF?=
 =?us-ascii?Q?4Kaygxp50Vu+zAanLPXmKXoapV6fQErpgiATOgOh+WkA2tHfJs7TQRfihx7e?=
 =?us-ascii?Q?mEcArp9JTckrae2//q2jxwDTo5FGLeMEqGZp1DDQIO0crLeFsaSy9C6jzVt4?=
 =?us-ascii?Q?d503MKAnnlldu2VrytVbzW0Ft1BQxsR2A8drzM7GRJRME9d9N/ATpemItode?=
 =?us-ascii?Q?OKjjLRqLUA+Vzc/5R7I8fDwK1Dh8stGIAfK9Zm0OgSIhsbzVjURtWJfCTqH6?=
 =?us-ascii?Q?pWExBQ8zfRg5WfdxxrJ1mIw5Pvd7JZjDLqSqJsuLcRvE/4oqFt1aBmrsc1yn?=
 =?us-ascii?Q?ifozArLARPvU9RmpHFkaX3bPsui3Ub8ioMxjGoIkFs5rc3WL5utNQY1SJ9W8?=
 =?us-ascii?Q?cm35+z0+myiYsF/2UQa+oXqFB3k7Vxl4BqRp9V9XqZxAHC+gmilQ2Mb/RfxK?=
 =?us-ascii?Q?B1Cx1/J8qQpWxxvD3Q3rcps0Z6tIH5YrO28Q9z7dTGpzIIfA7lVJ/mwX5WF+?=
 =?us-ascii?Q?X9TXqSWxTvtraUN23nO6EDRQpF4AKT7UA0iG1T4V54FrHCYB4adBIZN/2jF8?=
 =?us-ascii?Q?kzUJT2EnCWJ1WCLeXYqv2QmLYY2JC+Eog70RJ60ckdnbU4cMVWO6TkYbKnek?=
 =?us-ascii?Q?dQGq4zU7ZnhI6ArHZRtXpmKZZ3oY58Y9y6CZsxWP8YYJ799NJkZj7Q9bGeh7?=
 =?us-ascii?Q?EFj5LJ5q9twpcA85MRsqD7M74UNFoy0WDS4ssQB/pMtjJ73wDe9OtdK8ggIA?=
 =?us-ascii?Q?f44HkgJ9RvuosTbLOS0M4Qu6uGdzVdE2e88S7i8SEdZ0BfuQ9j+Z1rhy3RGR?=
 =?us-ascii?Q?Wv1+JTwTjbexYg290B7w0gytGuqC6daYHCl505mfTZzm4WOnR4uo+YQy7oyS?=
 =?us-ascii?Q?z1TY82ePIjbvWTQKTdexePY4NI7ncqPchBH7cOd3uUa+S0YZGdwT+An33rvl?=
 =?us-ascii?Q?Sle/HWsT9p0OnUXhzb9JLimJWqyc5jXhoMdxpMm05pMJclbJfTVNfgqPNyg6?=
 =?us-ascii?Q?pMzTL9yeGlN2ZGua9YN3Q6HqrV7L7kKA1HZEZ5JlLkvSt6xfLl+Hg+b1qI+4?=
 =?us-ascii?Q?w6ABy2whUodnAFLSMsYYg2AR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecea503-00b6-4c82-e7b2-08d95d38045a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 02:22:22.3956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ma60UO+BgBxAUN2WiMVZrZ5qne9NLD8ZVSSsHLQtHycTuvdNgVULmRH8QwAwS2AcQEe0fxDkQSWpa/s6HgPqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5142
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

The following changes since commit d186f9c28008810d8f984d6bdd1c07757048ed63:

  Merge tag 'amd-drm-fixes-5.14-2021-08-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-08-06 11:22:09 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-08-11

for you to fetch changes up to 0cde63a8fc4d9f9f580c297211fd05f91c0fd66d:

  drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work (2021-08-10 10:43:06 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-08-11:

amdgpu:
- Yellow carp update
- RAS EEPROM fixes
- BACO/BOCO fixes
- Fix a memory leak in an error path
- Freesync fix
- VCN harvesting fix
- Display fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: don't enable baco on boco platforms in runpm
      drm/amdgpu: handle VCN instances when harvesting (v2)

Anson Jacob (1):
      drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work

Christophe JAILLET (1):
      drm/amd/pm: Fix a memory leak in an error handling path in 'vangogh_tables_init()'

Eric Bernstein (1):
      drm/amd/display: Remove invalid assert for ODM + MPC case

John Clements (1):
      drm/amdgpu: set RAS EEPROM address from VBIOS

Kenneth Feng (1):
      drm/amd/pm: bug fix for the runtime pm BACO

Solomon Chiu (1):
      drm/amdgpu: Add preferred mode in modeset when freesync video mode's enabled.

Xiaomeng Hou (1):
      drm/amd/pm: update smu v13.0.1 firmware header

 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 40 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 12 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  4 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  7 +++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  1 -
 drivers/gpu/drm/amd/include/atomfirmware.h         |  2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h      |  4 ++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  2 +-
 12 files changed, 69 insertions(+), 11 deletions(-)
