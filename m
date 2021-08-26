Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C73F80ED
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A02F6E4B5;
	Thu, 26 Aug 2021 03:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B94D6E4B1;
 Thu, 26 Aug 2021 03:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4HB0X0BC9FISt2JJl59sOqx1TV4OCI49vfNN7ekR930NxVzhk1rUeVGeQv1WL/VoqeTZMC5acLZYqKqVxur8mM2vYPFH2f2nO3TKTIAf5eRqDkS/VwtHPYfP8fhxB4KvlTpkui0/meb3cPwDXhpAdtGHHK5zOMvTxDD3mA8cLLwpJuu7O6VkEWlGt4uYrXjROr4aTiJxQtRWBr52G15J9d38KLiYerpNNDXdWXxw+la5dmXrVt6u8Ov6QHD3RsKLlLhhG/mOVyShq553CFg056dgappyTMwnNHq2lWKN+z1bs4Y+sAcNgXHxxkHKQBSTRhdY7bv2RpT3rP9ShcQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSiw24eFnh8oPV5CBbsIRY1aaUAic+EuBBthRoIDh3o=;
 b=Zof3hhVaHb8R8F9wpLTM8plvoUorVtrORlLpQHsScw66otLUsOGoPiNamUO1UmpbuWhG42GO41j6LzIJvVBdSasb1zyFY0q98WQadbjGyy7sGXkrvROfgetESS4frCYYsNaMt4CQ1k3U3bUt/RvbX5RUgtgJk5f1RuR+7fRgEBm0HCRcOJbapSkObTMU3D10z5trStRfT+HMeNwE2Nwbv2KGmc9ms5zY3eBUwhPTYLX+dMDyomS6cUSEPCkyBzXRC0nGHV8tf1GlvG4vYoiqIRSLVZ+QvYzdRISWVRX0UbgTGqhLCApM4d+YMI1j9xuhrXziMfQinEzFHDIcZJqLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSiw24eFnh8oPV5CBbsIRY1aaUAic+EuBBthRoIDh3o=;
 b=pj3LF34+dko5vqwWE1VgLy7Vt03YbuQq6XxWyyMraDyc82qEOeg1WfJvGOCSRmncUcAaOATrvhUDnECF8310xpTJqoiHwaRuwwCEbyktAKRDzQaKiVmITYGj2L1bqelaRS8MuXqAHz1f4oO1FXvY+ySDiC6YYBDUe8nnv7Pp3+w=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 03:27:14 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 03:27:14 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.14
Date: Wed, 25 Aug 2021 23:26:58 -0400
Message-Id: <20210826032658.4068-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::14) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.191) by
 BL1PR13CA0219.namprd13.prod.outlook.com (2603:10b6:208:2bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend
 Transport; Thu, 26 Aug 2021 03:27:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b9af931-841b-47a4-9dc0-08d9684165bf
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52889B4550FF2C95C8C63D17F7C79@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yH4uOVMjxXe+52tTQVx9PR6XWJOpBJ9Xfqy10M0SicqIImJ2cPlBnnAybhzf/2UuX7GhJ1r7CKdrF+XlJ/Jo1NpthHBlmz2Cl79xGEjan0SPpmo8YXwJyVaJnzRsFvJyRcvF1jG6jaYJPsqPI8YF5YgIlBRp04Aimav1IUxbMy0uTpsllol1X4qQ0ebszzSTetfyNZ459Csuh8Mfk7LLJWxexU1YYGIvRTENWHTiodlvdXHh9FMX2kOtK7r6unDh1ATr8SijaPhaimyKTLy+ClaSU1J6T3bL5dfOdLO4KLIo/3k8M++RbrKiBqZYugWTurd/9kr7Ae8m+9zUdQEWH1TX+v9FT1oy0s8IU0z7B4efBP0rp7UDuwbeNGRgALpvqXisQj66v6Q5TnLMifcMU5ohLjPcIjE6f4ATSscpN0tXaQKE/C2JFSZNIQZKQ/MncTaBEDTNYi4DZ5PImNpNPdIaBaMG9mwVvd/V7S9TzGRUr4IbV/AoiKupOm+z2/eY7B07Z9AWz3Y8nAfNf6XVVlw8orbuaQGo9fhqJSsiNL5lDJa0NDT7Yj8X3kRxDXFSWc4OuXu1qgJHi/Q3eeilwi3wqVbS9ZFTb0aJZdwlwBGDQ+MgGcDavdP/ef0i5lUHG+XrOThs89qV1p2P89VHJS+M66eGNMkTVbnXCqIKddmsZ5KScUa/XWz0QWvaMSb5zR1DLwV/GRoc0k1pitjB4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(38100700002)(66556008)(66946007)(38350700002)(478600001)(66476007)(956004)(4326008)(5660300002)(2616005)(86362001)(966005)(6486002)(186003)(52116002)(1076003)(36756003)(66574015)(6666004)(2906002)(26005)(83380400001)(316002)(6512007)(8936002)(8676002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pQTm83TDlObmtwS2JnM0JlZDlwVllQb08vOGJoalh1bEpXMFpqRFpyMnlW?=
 =?utf-8?B?dEFUa3ZRTUpPZ0xsYzJOa21BQ0QzTHE0Y1VuRU9vWEYyeHBXWkVxd1Y4Rk5u?=
 =?utf-8?B?S1hXSWVHOTY4bkI3SEplTXpHZEEwbWdhYWRaVlhrTVVuNll1cW81a2UzZW9C?=
 =?utf-8?B?a0s2aituRWVGdkNFM0RlTHNROVZrYTFqWlpqU2w2dHl2Rm5SSE42UDM5YUR4?=
 =?utf-8?B?Nm9xS2d2ZE1mMm82TE5wS0QxMmZQQjMxa29GeVJGc1lKUEF0ek4vNkdMcFMy?=
 =?utf-8?B?Wmp1WmIvKzZzRm9mYUV3VzJmWHZpSDNJZS8zLy9TOGxZV2tjWDhaYXlTcWJU?=
 =?utf-8?B?RS9weTExMXhYdEQrNTdIZjc0RUwra3J1TkE3TjBKcUxUcGV3VUlMZXpaNjli?=
 =?utf-8?B?YUFVV3o4VUV2cjZ0djVWUHp4QVV0RWllZm9LTEN2cTNGQ0VLbEtNTk9HTS92?=
 =?utf-8?B?MlhaQzZiTXR1WGw2aW9YM1dlVzdDMU9DQkM5bHpPcVErd1llQzhSN2h3cnNY?=
 =?utf-8?B?M2d5bnpqR3B2enR1T3ZPN0xHRzF2WmxvZ3BTV0RMUDgrM0FmaklWVUQxb0NH?=
 =?utf-8?B?aXAyWFZiMG9ud2dIWlZNVk8vb3MvK1d4ZFVwbENVU3gzQWpNK0xxZ2svbWFr?=
 =?utf-8?B?TnE2S1ZIODcxTnRkakxISGJNaVFVTVdIc3o0WXZQV3V6OVV0clpmT1FXdjFJ?=
 =?utf-8?B?YXgvS3AyOHNlNnR2aVRtRHpoZ2llRU9FSFhjSEJtUG5nd2M5UjNhVmt6eHNm?=
 =?utf-8?B?TUgyOVErVVprMEl6dEh5ZVVzL0JLK0JwbXNyWVowRFFQZnZESXJXTml4L3U4?=
 =?utf-8?B?V1VoU2UvRlBvNy8vQ3lYOFM1SWVqMnV6SlExOXUyNkdHN0tBeUszaTRWVEdx?=
 =?utf-8?B?NjdEZGNuSzBtaGVobEs5NFdXaWZ6TVZ0Q0VJZjlzaVVUWmEvb1ovbmxabFRI?=
 =?utf-8?B?eFNBdnpCRTNvT1BCSHlQK1I2LzlCdU9zUVZWUjFqa1F6MFdlR1pGaWFwdkpo?=
 =?utf-8?B?OVhxTnBaQklMVTVkKzNQZDBzaWZ2NW1ONTYvcmVIRU5RQzZkNkJOcWhiblVP?=
 =?utf-8?B?NU1JRDVKVlBHcjB3dVp2M093S3hDOXNpSzcySjV2cC9sbE9qM2JCSmZEUFhx?=
 =?utf-8?B?ME1KeEthRGI4WGZNVXB1VndnT29PcmsxdUQ3NGNyblJWSnBIYkxibHdZUnNN?=
 =?utf-8?B?RVd5bWFGYlU0aTJwb05rQ2VnK0hTTk55b1l6ZGRHK0lqOXE0RTl1VDE5TTVk?=
 =?utf-8?B?cjNxbkFBM0ZPQks1M0JaM1VYaEl2eEJFKzFldFEyR3EyMnYxU0tzOFlYQ3dO?=
 =?utf-8?B?d1V4YTAwMWxMYTdxWkRsVnovNWp4dUdBV0J2d1RBQkI4NWZvdTNxVCtCMEZy?=
 =?utf-8?B?MEVLVFhkcW9DRFI3YWxKVnB2MEtsSzVmQUR5S0t5elZ6a2w2eXM2K1ZrNXNR?=
 =?utf-8?B?a3Rhd1FQeW9mbmhHNkNqdDVBZ1lYSjFLWm8vTnIwNkMyT2gyZGNCYnhDNUxx?=
 =?utf-8?B?MzNEdXZwY2Fzd3B4N0gzMjc3UWUzbHdWTU14ZmVMVnBNQWdBbkNVZEJSMDZ6?=
 =?utf-8?B?RkZsc1RIa1F3d2I5RFpxM1d5MXBkS0NvY0FUa1E0SDd6U0FuWFcyeThVK3Fr?=
 =?utf-8?B?TEltK1NtSmV3SG5ITEZsR1E3aG9SWmswSnlYN1h3Y09vM1FEWUZiOG1FSFZy?=
 =?utf-8?B?RnRGYUxZQXNDeDYvTk9sa1piOTNvZ2Vhakg3TUZUeVR1MVVTTFo0cGNZWkIx?=
 =?utf-8?Q?A4rQ9Pi9bLxYJz19OLq1gIShm8ckF7dqd3FjKWC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9af931-841b-47a4-9dc0-08d9684165bf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 03:27:14.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57574OFrWoub2patJ6nWaE2mTRULu7+GOQk2XkvRv4vFjqZ509tWEnY4dlmQkygfiPWq7zm1wyW8Ano5Fygaqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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

A few last fixes for 5.14.

The following changes since commit daa7772d477ec658dc1fd9127549a7996d8e0c2b:

  Merge tag 'amd-drm-fixes-5.14-2021-08-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-08-20 15:13:56 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-08-25

for you to fetch changes up to c41a4e877a185241d8e83501453326fb98f67354:

  drm/amdgpu: Fix build with missing pm_suspend_target_state module export (2021-08-24 11:57:44 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-08-25:

amdgpu:
- Fix for pinning display buffers multiple times
- Fix delayed work handling for GFXOFF
- Fix build when CONFIG_SUSPEND is not set

----------------------------------------------------------------
Borislav Petkov (1):
      drm/amdgpu: Fix build with missing pm_suspend_target_state module export

Christian König (1):
      drm/amdgpu: use the preferred pin domain after the check

Michel Dänzer (1):
      drm/amdgpu: Cancel delayed work when GFXOFF is disabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 ++++-----
 4 files changed, 36 insertions(+), 23 deletions(-)
