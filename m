Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5E3D9BF7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 04:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2A86E0BE;
	Thu, 29 Jul 2021 02:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37366E0BE;
 Thu, 29 Jul 2021 02:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypfau9lEI6+N9xKZErnaK9TDfrgmRlJoP34ZdrE6jC8op9zp/fVMWNgHqVvXgl3eyhMB7gnRBJza3ZOHwZW4iZH+5wJgNmUhS3/WYz+Cdl696vSVtJIYvRB6wk8zMnWx9ObxxNBZSm9z2Y1Xdbbrwa5ud34GmCDCepYre+/DhWMyUq92ztMwyEsFBV+a3fA3z9KgsZ5QgScsAv4BRVRom4Wc78rZ89B1yQuFcW6sAWAmH7++EtEBO/PbRkk4/UccMWO0DDOXrNJUkhbZyYSPcj2GLHY3OokqX6r4vFycopib35kBCQ5gED6K6ZjHva4pcNjJAjjGHS2sVrp16/PzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lMX175UX/htiJYxnrJ9ReWljT45L+B9SXhth79qb0c=;
 b=Dk85Qa16viQFokom59t3PkGw2V1TFARvMp27cw930GEm6tJA824Yc+cYLNPPg8M0vBgN8ffQ9HcBGcH2zzKizUJKNUEHmAeR8QlJh2O25RMCNS61hghsJCWDiIFE4jOlbs4ip3dvQL7RQU6heJvA0EjSh+lcrQ/5qaVcuH5TWqHBtwUrvcIGT/Lqutl8vsBXZVZ1lKt3l0XvnNh89aRBBnqI8oUv+lfWxe/ob9KgNwokfs4c3dVVDagM42BxsUXRaA8gmgYD+oeFh2MItmYzh4vqfKOwtXIR7mFc5HoOHs9LB7N8r7iZy97g5VIge66XL/OKY22gGPswzK2XbvpD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lMX175UX/htiJYxnrJ9ReWljT45L+B9SXhth79qb0c=;
 b=ApxB5cfI4dG5LnvvWCf28z1g9x14kLC6yUKSK8NvIuADlzZ4NeGmbfms76GHBazy5Z2FbInUEi97ZoneE8H9Ly6Mg0TINXfw6TAlFptaTvjwEiBQpNvuabikSUUpUpRL9pFuO4345kRyg91z0RazYw826mGJZyd27F5MryZUGAg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 02:58:34 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4373.020; Thu, 29 Jul 2021
 02:58:34 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.14
Date: Wed, 28 Jul 2021 22:58:17 -0400
Message-Id: <20210729025817.4145-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::29) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 02:58:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbeead78-3df6-40bc-096b-08d9523cc12f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5062EF6BF98496F6A7CA1719F7EB9@BL1PR12MB5062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 993i9hbp6GfmCPQ/2UAZRBgOZ4TT/B+38eeR8iErCqFRstA0enCZQWCQ5j4y7bLuDO60XeFIBCCYYWKuM2KnRskNIF7i+SGlYTvMWohf3ehoFfXimMtTRQV7cKd7pvPiKG3urHiGwgYJrRjEXbad5tp9glhv/gCPGk/nwF0Bw8WnILY4zVAr8uMdtsM+2UW8A3zjVoFPCmkZy71rTc8PnxhmFIsyGsYcvbs7YVZ7InJ6/iF3IDKf6M/xuMsJkWnMiP4dVdUIhqckdHd5WFl/xjJhPrfmSn2yfdcw2vmq4xoiiSzgIvOLkA73rhPGB7ojWn0KRlVdGWaaKaZTCf7vGs42YnMYFMEsCZA4KUkvi+vSe9251iDd2UG+cjDPhtntt5z5f4Tjpjzm+W4YWAitnwXreKz+eNcP9IMhLmujwgQPeRPrlDyR/1khBWD/mJ5r0gxlBje6MxAIEnHuSfzK769aWa7EvItR7zblPTsBvxUjS8bFcs85B+0lSk8M3tlv7/GV2O3nc0tAcqaHocdLC9TXDdcjEBzetHHjwg27F1ftrVeP33mbRWIf1ilXgVmw5cD40NI4JXE3/unyBMLO4aScZ1BgIq5dXb+Em7oISsy6asiNE5MHvh4FW1hLqQGLW/FqI6ZQENyN/Mj6wTx0hKLpxVor/7bMcfLM2fdw9NeNm4KIiNwGEQmDJz0okOaCoFvFKgLu/wbOfbEiWztsig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(956004)(316002)(8676002)(66556008)(2616005)(66476007)(6486002)(66946007)(478600001)(36756003)(26005)(966005)(186003)(38350700002)(2906002)(5660300002)(6666004)(6512007)(52116002)(83380400001)(38100700002)(4326008)(86362001)(6506007)(8936002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDI2M1B6eFpWZHJNNXQ1ck5xajZRdTZtbFBXT2FWbjE4T29Bc0VTUjlYa2Mx?=
 =?utf-8?B?VVg2MjdUTFRVbG1mMTJyaHBueUVzUVpWdmFJdVBvTEhFUHNqMHRWaFI2ZEVz?=
 =?utf-8?B?TkJiZVhVS0pJamcwYnhQSkZrempRTVkyaUhtYzROcXZReldBVisvazhMVkZ6?=
 =?utf-8?B?REtqWktSQ2ZMN2haSTF1UlVaZXduTUZYaGdiSmRxNWVyMGkyTm1ndTQvejI1?=
 =?utf-8?B?U1ZJekljTVdsRHBMZGE0UDdYdko3ZWlIQVQrZU51MlhyUlVzb2dtOTBWRTRG?=
 =?utf-8?B?Tjl1dU1STUhuMEVVQmo1WkFxV3QveVBvWFBKb3BZaW0rbnNBRGFuOS84R3Nr?=
 =?utf-8?B?YzVlVSsyTGFycGUwMFM0SFV1NXRZb1VqZWZaemQ3WFJDT1c0RjNpMkJsbUpk?=
 =?utf-8?B?aFBqaG90UGp5K0N0RUVFa1FCYkgzdmdLNzJrRzZjRGZuOVU1MVdSTCsvVkh1?=
 =?utf-8?B?aDgvRzU1NytHbHd2NWRBaVV5ZXl4UlpQcEZaYmU1VEtOMFhWamp6WElhaHVF?=
 =?utf-8?B?d2xPY09jd0FUNzFJYmtmTkxLTHhPK1BnUEx5ZloyaXpzaG5saG90Ymt2OUhu?=
 =?utf-8?B?bFZnNlUxTlVtTG5VWDBpUWZPbXJXMFdpWWFySEU5cTR4WFdvWjRPVUxyYkhF?=
 =?utf-8?B?WEpDV1Rxa09BOUFyZWRPZXlJcnFkNVE0OGtJR1NGUXJBdTVYdnlJbHk5V2dP?=
 =?utf-8?B?bFVZZVZrNnZrZnNQRC81OFFvNDQxelRuNmlWN0RTTkdicEJWd25XRDk0U0d2?=
 =?utf-8?B?cUpjYlZvclJMM2QzWVM4ZXFMZ1cxRWxqUWpHeTBiK0h6MXQ1RndpRFpCaHQ5?=
 =?utf-8?B?enVGUlA2V1JRWXBXV3VWSTNNcnJhazBlYlNXSzNZOTNYZVY2WFhIdk52NVdn?=
 =?utf-8?B?TG44NWk3anlDOWRlQVNqbnZRdUgrUG5xYW5tYmhHUjgzNUNNUzMwSU96M01F?=
 =?utf-8?B?RmQrQVhSbUNyanMvTEpTaUcxZytXWGpWZHBBZmFlWCtYa0VZbkY0T2hkd0da?=
 =?utf-8?B?Z2RlckV0QmQza2RQSS9SaEIwTTRmWGV0L0pUeU95clF0NERIVzRlT3BmTGJO?=
 =?utf-8?B?L0FnckpWQVhrZXNpZW1uVmdIdGJjR0J5dmJzalpRRlFuby83MUh2WGZ3TGF4?=
 =?utf-8?B?cFA0MHhuMjY3SXBKTnk5dldIMUtwMFVqS05nR05ld0lQL09yVDViejloWFkx?=
 =?utf-8?B?MHRPbjQwckpwem5FS2NsSWh3QnZ6MjFuT1FYdXpEdWFMemJmcStNaGlLYTdV?=
 =?utf-8?B?YkpEUDlLNmx0OENtcDFlUmw1b2k0a2daUnNBOFViZDEzeGpYSzU2RVBlMjVC?=
 =?utf-8?B?ZGdNQ0YwWGg4eUtQbnNKVDFURWFlc1A1NW1TbXhmbzY2Y1grUVB6N01lRUUr?=
 =?utf-8?B?VW1ZRVR3TUtoc1paSmVpZWE1RHlmcEV5dk00UnlWVzluNkJjeTRRRGVhNzh6?=
 =?utf-8?B?VTRzL0t0SFozekkvSWhOTlF5djlNRmNWSk1LUDFlaGJGU2I4OUlMR1RnWEhw?=
 =?utf-8?B?N29UdE5FMGphbm9jMk1GZXRXQ1NWcHpoc3RqM2FhT1lpWlo3aUYwU2FpRThh?=
 =?utf-8?B?OEhjMkZCdm9KTUxwei93aUZwTTFLeHdTaXpqaU5hMlZMdXlwQlhPSldzQ0RS?=
 =?utf-8?B?M0dQdUIrMXVjTWZsTzB4UGFEK1lUMnIrb0lFcEd2YjdoQjhWUzNRcWhiUi9s?=
 =?utf-8?B?NmJzSGpyZUhxbVpmNk5ld0FPSEFQZlc3NlRVZVZOMDlTN1QydndmYkk5WEVZ?=
 =?utf-8?Q?yJawiQQR6AGbv+xBynQA7Cwz71V44Gl5tlwjYyR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeead78-3df6-40bc-096b-08d9523cc12f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 02:58:34.4884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idgpuqVL1suCG0EVLV0gYqWQNQfysO5KrSNTvdxTXfJi0vc8jIAjsmJSb1u48fiePC3AOMgA/y+Ctr9jswuQOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062
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

Fixes for 5.14.

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-07-28

for you to fetch changes up to ec30ce41f03820b6289513344b4281ca3a1151f4:

  maintainers: add bugs and chat URLs for amdgpu (2021-07-27 12:48:59 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-07-28:

amdgpu:
- Fix resource leak in an error path
- Avoid stack contents exposure in error path
- pmops check fix for S0ix vs S3
- DCN 2.1 display fixes
- DCN 2.0 display fix
- Backlight control fix for laptops with HDR panels
- Maintainers updates

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/display: only enable aux backlight control for OLED panels

Dale Zhao (1):
      drm/amd/display: ensure dentist display clock update finished in DCN20

Jiri Kosina (2):
      drm/amdgpu: Fix resource leak on probe error path
      drm/amdgpu: Avoid printing of stack contents on firmware load error

Pratik Vishwakarma (1):
      drm/amdgpu: Check pmops for desired suspend state

Simon Ser (1):
      maintainers: add bugs and chat URLs for amdgpu

Victor Lu (2):
      drm/amd/display: Guard DST_Y_PREFETCH register overflow in DCN21
      drm/amd/display: Add missing DCN21 IP parameter

 MAINTAINERS                                                    | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c                       | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c                     | 8 ++------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c                         | 7 +++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c              | 4 ++--
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c          | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 3 +++
 8 files changed, 16 insertions(+), 14 deletions(-)
