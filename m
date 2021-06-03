Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3463998D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 06:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5046F38C;
	Thu,  3 Jun 2021 04:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAB06F38C;
 Thu,  3 Jun 2021 04:04:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q19B/tmwRyuGI0HAOg+QPmk2llfwb41A2w2mdHzt3ZajFwdW66qqLQcZZtyAXoh43NAHlMzen1lY3vdmHVDsbMGWKpq237PFgHlebGVKpEAZk1rtzkNnpgANEKDkZ5dxvyVpqbr/I9XJztWpeWM61cZf9FbjQz/b+QFqH0BXLUhv7jjeXFOb5OtJGZ/UgGnJ5z+uB6O5CP7jj0smjvzGPOybiFXWiBLDYuMCw/3bh244rtOhtUaSj8O9cD7fg2Be/dbuK9Ux5xd8e665lVuqsmYlCOMewSwM2GD72GwIfEkBxoUc1Cpc/NQ7si/I/iEw4TyxTRTNZsSUiL38Ak0vYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVx0peunXJ7KuE4b1YrOG8AwK9+XSkhqe6/mJYNscBo=;
 b=RDsTiOO6T5qPo3+6uXkDnuUlESH0esyL6fjvRn0ulUBNmzwRED7t4v5XLGPdv0tmI93yaxmdJD/jfZ0/JKfiDSKoVmajKlYRQ0mAhdI2N+cThMlG4v06vXn/K0YRNIiGtFxL0xOVQunNvjmqPe+hkBqfE3bxEasJcxPDGg69ThEeMfnBkSA6lhkyka2vH7FN+nggfc4D3tWAMM37XbICvKhZw5Vncz+TK+Z3GsXWT2ldYVxBq6327HkZVc0BsWJ5X8JbQH5LLTL7ZURspKThN2GNYXCi7w7bEFb41WrTYqKb1Anb8bsvOd62NFJX6vHB1XbuSIsIlpI3MFAHGUVY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVx0peunXJ7KuE4b1YrOG8AwK9+XSkhqe6/mJYNscBo=;
 b=zGs1BB9tl8ZLyFZrV9MHG03OVKvJidT3Tno1y4pDwKPyg8Uf6tISGLkMBsupcb1nSirIaVAJ70FP63TqMa94veMWionuVDCV2z0ZpkwtpYqQ/CaJ+fHbbZr/lmPZYeIv+eDYClrb/+zNOX3s6FhqkYx8u2DfhnMlqAQGjn5TAI4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3758.namprd12.prod.outlook.com (2603:10b6:208:169::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Thu, 3 Jun
 2021 04:04:26 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 04:04:26 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.13
Date: Thu,  3 Jun 2021 00:04:10 -0400
Message-Id: <20210603040410.4080-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR01CA0016.prod.exchangelabs.com (2603:10b6:208:10c::29)
 To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR01CA0016.prod.exchangelabs.com (2603:10b6:208:10c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Thu, 3 Jun 2021 04:04:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29201739-1111-4132-f951-08d92644ada8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3758C89E4C427591F159E368F73C9@MN2PR12MB3758.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOWEne9lE2dD7pYmVfj+VQkFGqAj1dGmMB9+nXxrYuDj2mtPFCqRslO74V8iheQBJOMxTSM1+D12LZyHbj3eDqTptq1Ph3ril3K72EFCsa7/LI9v98OlfYWx+53bDCsJ5vIaD/p5o++RxCWlaZmByiQDcd3e55tLz71OG1ZUogOd+QFdYX/dM/9f7wcX7WxlIdwyc+Y2hWHBbnbqiI2nw5u1EBL7n5ByXK5RYnF1LkalPwCpoWXUxbKAQCbd4XcmXIMTwdKUouFknKqGXf4mFhUU0ArKpaSmmRNEV3FwhsrlxjwcZg+fnO++LiqoyuWfg2Kr/HAZmJtC9S/oJw/dTqfCxrudBuSpMjWxRiLTGAnl6ZH4poQYfHcppXI+55zWWXNGBnZfkQp95cTkNF8XST9aA9qlR4kzDsANtyjmzdraTz+79sVROQavYI51h4+2a6QE+tAuOT28pHpWr2xDUDbzaCqWRm7gqbrcABhXfTidaEbUrcy56we+vOO1vj87EXgIi9FsHDs2v4Ki/yumPXRwVBGDky5hlg7VYt6biqLeYguGPatPqnvF2P9LFPACQtsTTc7aZMtUvyJM9OSeRtp3AC6VW5Bw6XOqM3KCOYK21E5xcr1Wr3ajvLNIyeq3++9eY2BhM5fvZx+TbqSHPIyBK4/OoLw8QLgB2GnZMqh7tOEHyAYtjmCFt4ytdnRmKb5FyQhEbCmOnD1ZHqrvWVH1F71TthunE6UmFaXuqEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(8676002)(4326008)(5660300002)(8936002)(966005)(6666004)(478600001)(316002)(83380400001)(1076003)(6506007)(26005)(16526019)(956004)(2616005)(52116002)(66946007)(66476007)(2906002)(38350700002)(38100700002)(66556008)(186003)(86362001)(6512007)(6486002)(36756003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JtpWkGd+KzZZCLbEWjr1CtlCPcYHvKe+Y9FcgQV2NmBDvKMg+0etEuFU5GIb?=
 =?us-ascii?Q?88qu3o4xUGfrASH7hMpTokRSqa2h65RnSUquJuEnBvoMz86V3kx4eCSN0dnn?=
 =?us-ascii?Q?eQpYIutqGbONdN3O+2jk2RlvKaeOFmZtOQ5jx9Ic4O/fe8KbceDNHfN+xmjM?=
 =?us-ascii?Q?hNtKyFiEYhqlSzne/I8gVZH1Wf79xzWgwyFbSjxQLXNuF5txkDPRcZ8ffOTm?=
 =?us-ascii?Q?v2U2SYu74xxD5/Bcewkw/XtEnwpvC3lybOjhupnpg8WKoi/K2bKp0dXi2VWb?=
 =?us-ascii?Q?Y1vZ5RfjcNLnG0iMP9rTdqia3bPNg8PHfAvRIC6IxZs7M7gFDUOS5sGNpwVz?=
 =?us-ascii?Q?TfN86g9fwMSe9lM1d9nwrVj4bNdkI1DM/78+gTzs6bdOEJt6UKqdSSvzBFIv?=
 =?us-ascii?Q?TJCZq24gwSqfvCQms5HqYc8xRByQ+l6TGtVGFWgs4UDawNOZ3OrJ0m0S7aN3?=
 =?us-ascii?Q?scCqNYgRLq7OnocO+PQNRIyE4EQUSnY8bTPXvF8JXdnrbIfXLWy7f6QheArV?=
 =?us-ascii?Q?Zn+a1Me2JukaxCHX4nIdqlrN9/Guj92Yzvvy5Ax/6mlYUpPmuGtO2YlNWsww?=
 =?us-ascii?Q?KZRG0dQ8nr2UEp4itr4QP+ir2SRv/0dORrHJJ0rOhJRJGsRxYWWWN0zN8cD2?=
 =?us-ascii?Q?Duu8ZXzi4akkdYKU3S8eXXD41pM8GHppa/Ix/ScHRBZoe74FJRs17zxfR/Mv?=
 =?us-ascii?Q?7bz1OPUH2ZaipCVVTLI0WRRX6hEqjN1M/yHTU7PYEyY/utk6wM0S5nnG9mdw?=
 =?us-ascii?Q?Bp3qsw9XEn96wFq2okXDQfor7vJOqZofxayXrUlza8Vxqebdh6g/r/DIeMHf?=
 =?us-ascii?Q?b5w1kjstnpOi7efsTvn8cI4wVrpHDXhbCPV7vamAYBte5tQ4IzutSqlteXju?=
 =?us-ascii?Q?Egm2Ke4F5ngKnNH3GKI3pBSYQJQ0z6xBmUf10d94NE7vNc/h2SdxbTMD4/B0?=
 =?us-ascii?Q?3oxksSVxXyMkX1XlmZ1j+CUr3VNBmpu9kZ72qU3p8ZYPGDGhixtzazL3gChZ?=
 =?us-ascii?Q?5LRV8FCxJCfDbH02D5s6YhYyxXC+6y31yK1Sm6cDoy6lCqcKCi1KgSmB9Abx?=
 =?us-ascii?Q?Jgp7CNGfc9m1mrPXCMhsRYXtUZdpuHrP0DA523gimKZhSyHIxEgtb4pP/EH4?=
 =?us-ascii?Q?zJGO7FMGJRunRjd209BBKFp2QS7MHvg5OtXsWdlqKhDwmBC5GVkwKaIytB76?=
 =?us-ascii?Q?LxjkGC9tSHAZDe4EVvSwwfmk3LtTkRvedVGmDY26vsm9DO9BO77QLQVKE86T?=
 =?us-ascii?Q?QUMEwjRhJOmk9nkE4Zyg4xSo7cD1rysAlLNlEJK1AU72pl+Y49Qqzu50kcag?=
 =?us-ascii?Q?BQkGrFKUvKtPSmR2PuS/SKo6qW7GCFfmIQpCTYjV0HAnWA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29201739-1111-4132-f951-08d92644ada8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 04:04:26.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7L6GvRp2VXlQRvFQGGeGup4RhuC35lb42i3EG0K10G3f9DC91nDwGqGCaXpN1vR6LHFFnrMb/cso9ijsxqGtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3758
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

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.13-2021-06-02

for you to fetch changes up to e7591a8d56bab89c617dae055446b6337ec32dc9:

  amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic (2021-06-02 17:58:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.13-2021-06-02:

amdgpu:
- Display fixes
- FRU EEPROM error handling fix
- RAS fix
- PSP fix
- Releasing pinned BO fix

----------------------------------------------------------------
Asher Song (1):
      drm/amdgpu: add judgement for dc support

Bindu Ramamurthy (1):
      drm/amd/display: Allow bandwidth validation for 0 streams.

Jiansong Chen (1):
      drm/amdgpu: refine amdgpu_fru_get_product_info

Luben Tuikov (1):
      drm/amdgpu: Don't query CE and UE errors

Nicholas Kazlauskas (1):
      drm/amd/display: Fix GPU scaling regression by FS video support

Nirmoy Das (1):
      drm/amdgpu: make sure we unpin the UVD BO

Rodrigo Siqueira (1):
      drm/amd/display: Fix overlay validation by considering cursors

Roman Li (1):
      drm/amd/display: Fix potential memory leak in DMUB hw_init

Simon Ser (1):
      amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic

Victor Zhao (1):
      drm/amd/amdgpu:save psp ring wptr to avoid attack

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            | 16 ---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     | 42 ++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |  3 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 30 ++++++++++------
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  2 +-
 9 files changed, 52 insertions(+), 50 deletions(-)
