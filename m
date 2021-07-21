Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5DC3D1977
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 23:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7426EA55;
	Wed, 21 Jul 2021 21:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401226EA55;
 Wed, 21 Jul 2021 21:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ/rdNHnQw7w6u8HXSWCsUuAbpIvsDh1e199i12P0p9z6AtQYhynwPhnC/dZOsWVl9Q63BcL9zTtyWLcVRCafcFVaS8bm/wwc5t7FS3AbYtEyb8imaijkT1YfGeJKHTq7861ktFswrrWi9mo8+5Quf2mfZu7s39BIc/EZgaBW2xgHMW/XSc40X7hgJCDEcbjvZ6P8ugYx7DjR7wMkfgVTTqI7GbQR2jIozkPlEeUcU5rFW3xRWOKsz1wx4F6DaPhyBRyzLdvecZVH2EEQdwmiz1YZbOje4rbY8YDSJbrNjoWXCEMYngFSPU9TFp5pWtCTEfCvjAImYEXNipg5EfsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGi+gLoRnZ4+OqeiDcLYvjA7kgOh4amcYyPi5CyPmnI=;
 b=lnuDI73430K5FQgmC9HhZXKpdUeMqc9adtTlhG48S3aNsLo2b9eJyeJ04wFtA1czwv8Xb+wNSFqRBhVq/FPhB4jNuyWCTG5/r9wzvSeiaDU9CMIT+foM6OvUEAhD6BP/YOXerL/wl+TsAVNUSFxH9OBqbgyemIJWdwKqWfccLO4OO3eNFlGjT4Ra2lBL94WiXq+Ni/9qtJRqXSrcXUUUnbZOpp4AZYKxRsO3q3DUrrhAE4aY867G6/qFlrsJ/0njPCUrNzPSLnVaIqdUljX+hYY4YmqrA3MtKlplUVj7TjjeM//OkuoAa+Ui6hl+3v6CT3XNLmS7KvDgctgER6GOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGi+gLoRnZ4+OqeiDcLYvjA7kgOh4amcYyPi5CyPmnI=;
 b=noTVr8a0clIlA92QSKaGSozQTwnR3HjW4T87eflLiXhnI8FrxJpagpNu6m/0jcnARXt38o2/J67e29AypV5mJH00NzzNFb3WqMNiTpsIqL5ATp83en4jw6m7kUfj7R8VZ1dVn/fvYXJiJI5GXh3ntXMEHX9xkYAWXwZ+wxZ4vs8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Wed, 21 Jul
 2021 21:58:15 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4352.025; Wed, 21 Jul 2021
 21:58:15 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.14
Date: Wed, 21 Jul 2021 17:58:00 -0400
Message-Id: <20210721215800.17590-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::31) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 21:58:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a879bc2-ba13-42e1-dd2c-08d94c92a3d8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5093BA4A24506F72DE7CC786F7E39@BL1PR12MB5093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hojqf9oqmmRuLVRi3ko+1KBv1mYKehDOKBNRjHXt5Z9RSqwSDMoSiMkEP34Q5fmXs9tR3gt/Vexl9ps9Gxw+lpjqLsd8dnqhc+JyxbzlJkSJ6nMftAfJ7Ht+3uEr/G4+mog3evCOiQbcBsAN1v4X3EEFK8XqTDu35fDPM1As//loBbVnLwU7QGYOfFB0jDBiQ5UFkHKi+CMINs0w6Nnk1JJaM45rz3nj4fL4Br1voLbVIjKDF8JAd4wU91B88pP4hmDmBM/RZxGu/hFOWKdgi59wcG+OS2ILlXuAajEQreD/YYrHipKXEXq5I3HLEjSqqZD6gq5B9qvT7eyf1O41sZqbQHCPYpsYULQlhIdnv2vnX+QVpNpfr6pY97Rv4b1QMtM/3ItMY2pyeK2Gs4lFpF7+Rv6xL9nMELrBVLp9UuVNDhTJPntDtJEuYHq0kx8P6xE9MoTmbgBWTctvPZLEs+f88HZRKAIPr6E0u1D1hLc009skHA8GjzzcCBcfimXLuhWaWQFdVQNClrWEnwMtasSDIQwb6gO7YlgqrvH5vIXGDzoTiHEV1SU0Cv2aed9gOPuFYX1NkH39oOuqIlBp3h3X2j8Biv3wCE39dD7lyaGCTKYeNb+25IEgyKa3tCgAdzpa1TU96DCWGZa2ZwLnLsYb2pxgIpRTOdHcipZZzbs8OZszi45EiIGv1umM5uGtGJnwJIhj8Zg53IgmdaEiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(2616005)(316002)(5660300002)(66476007)(6486002)(966005)(8676002)(186003)(8936002)(52116002)(478600001)(66556008)(4326008)(956004)(6666004)(6506007)(66946007)(6512007)(36756003)(86362001)(38100700002)(1076003)(38350700002)(2906002)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pB7GeC97sHmHMkxM/OuZ/eZz5qFYY8JPUr+Ne243Kiso6Z8wNpr40qE+SgRN?=
 =?us-ascii?Q?65AmTsgpS4+C679HvAcs/scrB5gpJsQqoMjrSnjc5F8ddEzzrRjL4SEnee2V?=
 =?us-ascii?Q?/eXoiEBxaxt0M24TacKF8r3FgdiiMUA1fS3ALT/6rSSV4D6LSyiQ0OXZJipV?=
 =?us-ascii?Q?vDwjjyOlFQh4pdTmiIVh6Nm9NmzZgU9D5K3a7mvq5BO+Gof1s3AuT07FoJxS?=
 =?us-ascii?Q?mqUf3KLdAgC8s3dXkheRUEY89VAC4ORv1xHf0j6VVK0dqVlHmFj6ar8fr8zW?=
 =?us-ascii?Q?+7SRuYQ8+Z1xi9UUTLclNB7rY6IJxoG86MM+Y6VWbsTdq+uc3eYwscg5TQnW?=
 =?us-ascii?Q?7TbaVgiMdrR+MzyF7b9d8wvj7W98cWAAnT+HpegiTUJZdFm2cHLNlhA5IvwB?=
 =?us-ascii?Q?tZIEwCYJjuBEtUHazrWG4JtjkRFAbl1oyH7ZfDE/BSpbUxqJv5tZAuffvCs+?=
 =?us-ascii?Q?gZHjF9NBeNkI+Q7P0CfEsWUKc+AOId6x7HVOfU3+/wpY4+bmpstE7qzWnLfe?=
 =?us-ascii?Q?Hcbm3SEHUWjvZmnL+JaTPSlbC8mxXp+lb87abPquQIRGoMnqA6AxOez+NwY3?=
 =?us-ascii?Q?8mv8jmyPtKoKjtDSZeUG6d6BweHR77boBtxd2FAV8p4pwmfrxXR7/nT7flMQ?=
 =?us-ascii?Q?82hR3USOQfRO7Su7s75EQ+H+q0d5zFFfAJtbJy1F8SfKBwZRvXtjQw9bLVra?=
 =?us-ascii?Q?PZCpgHNhBFGyNh+hZT4TZ7cRGJM+gTWWp4iqClI3wiHSRsmWhG29uWrOWyJI?=
 =?us-ascii?Q?P1onchl2BUc21kOlmCtFc8aeDXLfErc7xPgMvMBSpHLnqi/Z3TOmK9hmDhuc?=
 =?us-ascii?Q?5O7ll6+I2JnamrHEDXSVfyl4fofdOia/LLtvGWGgyCHGmk9nE/4M25v1q3Sa?=
 =?us-ascii?Q?iX9i88ZaS3/Rao+nze4hNhtPOt3e52Hd3+zWYf8wN6sGUzQZ+lPs2kmxsXsN?=
 =?us-ascii?Q?KPutBuFboj/GP9m6YJ3r3livZC9yBECzDuyBktyZZUWEgD98wT9PE5AZL83W?=
 =?us-ascii?Q?kFLj7ZsApvMgFYcSoU1KbqMecl0fiuaVADnZNf3C27vYMRkjjNr4mk/XFZTZ?=
 =?us-ascii?Q?AE0LJ3jm0bnp7XR+ixFRgp2+7R/hi3kYxnrk4ze0cGR6VA4dvK5FbVoJg1It?=
 =?us-ascii?Q?Hi/lE5OPVL11BUuToZt86vTUNqXcmainmjS0r5nnNrtXJ2YxY9xljAltO/b1?=
 =?us-ascii?Q?Ypv3TPbKjigowzb2za92duguUXG1N1wpqtf1r1WHB3sjOtVc+ZS406XLmZ2W?=
 =?us-ascii?Q?iZHkOABwzAgl9sYHDcl/uYsGmfpfZFEbQio1KlR6p7tzD8G5Zwq5g0jvCPop?=
 =?us-ascii?Q?3c8KUC6ItahInRfn/NlVpJip?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a879bc2-ba13-42e1-dd2c-08d94c92a3d8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 21:58:15.0039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4E46diX/hF6s2rVUwx5NKJWzZyjxXVWfPzT9vLQzMPigNvlZr8qbjUhs8L/tkSBnxiGICqXHCiriN2ZpGt6/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
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

Updates for 5.14.  Mostly fixes for new asics added in 5.14.

The following changes since commit 876d98e5511d8cfd12fc617a6717e7a8ea07be17:

  Merge tag 'drm-intel-fixes-2021-07-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-07-16 10:53:02 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-07-21

for you to fetch changes up to d80cded9cc25f841d5250d2e94a7b42be1e81c97:

  drm/amdgpu - Corrected the video codecs array name for yellow carp (2021-07-21 17:47:28 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-07-21:

amdgpu:
- Yellow Carp updates
- Add some Yellow Carp DIDs
- Beige Goby updates
- CIK 10bit 4K regression fix
- GFX10 golden settings updates
- eDP panel regression fix
- Misc display fixes
- Aldebaran fix

----------------------------------------------------------------
Aaron Liu (2):
      drm/amdgpu: update yellow carp external rev_id handling
      drm/amdgpu: add yellow carp pci id (v2)

Bindu Ramamurthy (2):
      drm/amd/display: Populate socclk entries for dcn3.02/3.03
      drm/amd/display: Populate dtbclk entries for dcn3.02/3.03

Camille Cho (1):
      drm/amd/display: Only set default brightness for OLED

Eric Yang (2):
      drm/amd/display: implement workaround for riommu related hang
      drm/amd/display: change zstate allow msg condition

Lijo Lazar (1):
      drm/amd/pm: Support board calibration on aldebaran

Likun Gao (1):
      drm/amdgpu: update golden setting for sienna_cichlid

Liviu Dudau (1):
      drm/amd/display: Fix 10bit 4K display on CIK GPUs

Mikita Lipski (1):
      drm/amd/display: Remove MALL function from DCN3.1

Nevenko Stupar (1):
      drm/amd/display: Line Buffer changes

Nicholas Kazlauskas (3):
      drm/amd/display: Fix max vstartup calculation for modes with borders
      drm/amd/display: Query VCO frequency from register for DCN3.1
      drm/amd/display: Update bounding box for DCN3.1

Stylon Wang (1):
      drm/amd/display: Fix ASSR regression on embedded panels

Tao Zhou (2):
      drm/amdgpu: update gc golden setting for dimgrey_cavefish
      drm/amd/pm: update DRIVER_IF_VERSION for beige_goby

Veerabadhran Gopalakrishnan (3):
      amdgpu/nv.c - Added video codec support for Yellow Carp
      amdgpu/nv.c - Optimize code for video codec support structure
      drm/amdgpu - Corrected the video codecs array name for yellow carp

Victor Lu (1):
      drm/amd/display: Fix comparison error in dcn21 DML

Xiaojian Du (1):
      drm/amdgpu: update the golden setting for vangogh

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 248 +++++----------------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 176 ++-------------
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   4 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  59 ++++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |  54 -----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  10 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |   7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  50 +++--
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  16 --
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |   3 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |  13 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  18 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   4 +
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |   3 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   1 +
 drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h       |   3 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   3 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  46 +++-
 29 files changed, 288 insertions(+), 483 deletions(-)
