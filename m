Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427FD392557
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8886EDF5;
	Thu, 27 May 2021 03:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A96E8B8;
 Thu, 27 May 2021 03:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEWq5D4fm6fGO0SImT9eSUyoQXvKIX7+E1weWiAwxhnZltJSXdRQQHY2TBVjwPzRehIH4OMT2FMYM+w/5ehnVS36STVR7i4Xeg63ze2EHwq/+CqfzjktM4HiSwpZA/8akpD7NOZro7c9P1QJGL+eKV+uUW7dx7DniUP7mXtiCi9E5OSJDQEcuaNaeZnHPXYwy+KnuANtVNnIpGO5qYuLEefBmqVlBJ/6yvow44UYdivP5lGuhYSYWZnKYV3nljrFpUBtzjz93Ncc/U2g1i9fiTGoHM6awYzBsfV7E2kRs9zyUQHhIF7lykVrQlkTLASmEXTmK+SGz794Y5keqNG/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhR6X/OZo4FARsL4bjyAG/bmfdwHvEoyVfgcDLRPggk=;
 b=H4iTCVb/9bzH4LeOXTXVQRaojbqBp9TZ7ZaouBdfO48GPMhKo3nn2lVNKIUyj0g4avTjaoPiJ84pLxEuEB7xsqHn4Xiwv3b4+nJNOpE3YiOtBp3KOBm5Ua6FMbv0zycbP8izkG7MldC9cdl0YdygDtHqzYC12bRMV10DID9U4ppC8hXVMRhHSnNQzFJHA133HW0bAzAWG8P3I/jYJNhkG5vitsFgHfbX9onxvJKHlL7wGOAM1idcrAvIGGADybOYC516BQeYbxYwxcKO+voreuWkPCVXZ+2B7piJg1wLBnNQdwroJTjauv6J2tPTkiL06sBqZK5BEcPaI5/YIPvTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhR6X/OZo4FARsL4bjyAG/bmfdwHvEoyVfgcDLRPggk=;
 b=QwDbcLJYVo8wES4//UzMIey/MrEbs37ety7IRmCH+EJSWeBRhaKPWB9yIsD0NGNhvlmOfVJzf2IJXyQDcJavcFZMk/SETyZZkTJsLXDVfHdlDsOeA9nVC/Lw6mXJhqt3mYEH0vMdtn9g511KWC83r3qmTW9S2P8ldOJMJ+r5SkE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 03:18:52 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::116c:b06f:9a20:ebf5]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::116c:b06f:9a20:ebf5%4]) with mapi id 15.20.4150.027; Thu, 27 May 2021
 03:18:52 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.13
Date: Wed, 26 May 2021 23:18:31 -0400
Message-Id: <20210527031831.4057-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [204.111.139.213]
X-ClientProxiedBy: BL1PR13CA0447.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::32) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.111.139.213) by
 BL1PR13CA0447.namprd13.prod.outlook.com (2603:10b6:208:2c3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend
 Transport; Thu, 27 May 2021 03:18:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d95e2963-e941-4e2e-4b5a-08d920be26f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4189:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4189AD4E338E1787EEEE8CF3F7239@MN2PR12MB4189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //8bIC5N4rgftYRe9mseqtlsG42OJrqxglawN51Z9CVznjycWE/ANBH/o0XRIIwfsrKCgztUZ1UKUkqsVyPoe4dVkT5yoTf/zPaQi0bFbVJ1nPLJxKPkwdjJGrWbOewbw/4e1Eju8adzGfOklkQ0DROxUw3K7jhcTrmOGSvGc7fTd8ZlZgC8itAmg3iDeSFOaGqCZMbMWDcG7Lnpp2Gn2YIMoJwwaR80LttW9eNl3WupIBGc9TkCWLMTtPsWzkJHKJZ7DA4WXd1gEsr+QW/9cqLPCmMFDD6FkASbFVHLJhNZFkbAK322gC9ZsOAFnML6Ilz9yJL6LbUJlHl6ND4cvyfgUEsLJD3LVT28jg3szv58wXFRdwymke+hdYbjjkT6/CSqACNooOBq0QRh2mQ0FDBjZZnzEFfuJs9dgRXD+nwP9nYbcQ3A/BoQmR63ZJrYYdxw9r4n4yTxz6blLQWEg8OYpN95MhUjW9tTZ2rGyX6oumPzHvXEBnqud7mespR5xO2NGOIH0j4CNReuVuLkWAnF6c+jNuuPfBzi9DTPU86LwQ9I9xZtGFggk3spXyQr2uYg4NDr2AFtYEenqpbUU0MXNc6jnATVjZ40yxKc3MNkoGcAYuOmaxnhowvwo2vcdaOMO96G4MZaJsolNidinz2QDeb46+zzeEvRlvuhlW51s7+mXCGDj2D1QVk8fK/S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(6486002)(8676002)(4326008)(2906002)(38350700002)(8936002)(26005)(478600001)(316002)(38100700002)(966005)(36756003)(66476007)(6512007)(83380400001)(186003)(1076003)(2616005)(52116002)(86362001)(956004)(6666004)(66946007)(66556008)(16526019)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUpNRW10d0I3cUtxdzAyWkt4K2tUSTRYNU11N3pJbmJhcURGU1dNa2EvQXdy?=
 =?utf-8?B?ZEplNW9QNHdUS0JReU5HcC9IOCtPbHRySUlQQklFSWFBQ2lyVDJoUmZSMG13?=
 =?utf-8?B?NHVYdHg3ZllBVnVsTDBFZFpoTUJXVEhyMDlHSWVWSFBJbFNFYkhFYU04dFJm?=
 =?utf-8?B?WWN2cVM4VElTWUFFaUJwRERNYnVXOXJyUnZYeDl5V2ptOUd2ZkVxNGpNWFBh?=
 =?utf-8?B?QTV0VUpQVDQvRDUyWFhIMUZ0WUwvRkt6YTB0OS8veHNEMi9LdEJxMU9YWHdl?=
 =?utf-8?B?TG4yOVZsUFl3TFBVYmxYY3RLM3d2ZmViUldwK0tpZlA3VXFsR0xBUFc5anVH?=
 =?utf-8?B?V1g2dG9zTmM0NE1qTFBhUW03eEVXRG92c08vc2puOFZuK0ZXSHhmTGN5VEFt?=
 =?utf-8?B?c1plUmpHV0R2MmprSlpOL3NLdUc5TXBzbk1lSWFVUnU2RjdLY3QxWk4vTXJv?=
 =?utf-8?B?VStmdnM0NU9vUWxiZEdRZnIvSkp2Z2FpQzU3Z2RwSzhuRE1IcVhNMDBIWlpx?=
 =?utf-8?B?R2ZRUDc1UzVoUFRWQ3Q2R1l0VUVXN1ZqMFh2cnhIcGlpNi9DQ1gxWDlxM0hC?=
 =?utf-8?B?cFJ0aUFyaUZsd2FRUE9MY051MmxRWHdUT2RNTFI4aHNmck9hWVlrOGk1QzJB?=
 =?utf-8?B?ODZlbk9sK2dHUWxuUEtkTThYYWlTQStVejM1bjBJZENlZnFBeXdrdGsvYTQ0?=
 =?utf-8?B?amRlY0E1aGljTFRzRHp1TUlQQ2Y0Q2ZVNUlJNjgyYXpGZ3JweTZlYlBDU1VF?=
 =?utf-8?B?N2djNTZLSnBUc3NVeTIvdWVFeUpweW00S3N4NHRUdUVtRm5uSEdjTktHU0N3?=
 =?utf-8?B?ZlRwa3FNaE1pNXB1cDc5Z2ZJK2NpdjFKWXRkdUcvTVhEUlVPdiswYWlBby83?=
 =?utf-8?B?L0N1czJsczQ3am84VkNkTGVMbzEzcnF1WFEzQjh4MXlQSm5TOStUc0t2Q0ky?=
 =?utf-8?B?aGN1Ny9FdE5ONURWd3Y0WjFJaDNjSm5nWW1lT1FjcXFRZkNVKysvazV5UUti?=
 =?utf-8?B?dFREK1R5eWp2dWY2R1kza2ZhS3NKM3lsV2NYTEZ5bk5ndDY4N2tXdUZEek1R?=
 =?utf-8?B?Zm54Zk91R1lvNmdhTjYxeXJvcjR5T240VkxVYmV2Slh6N2Q5T1ZzTTBOTHEr?=
 =?utf-8?B?RzFFUmxGQWhNMTdrY1RWSlRrTzdXLzE5RnhkbUQxbGxmdzJWUGloVG1kckNu?=
 =?utf-8?B?Q3BOckhFNVYrNmJSSjdpMzBPQUU2RURJTmU1ZUpzY2Q1eGJPbWdYSWJpNjln?=
 =?utf-8?B?Z3FJL3RROHFnYVBFdTd5WDZwc0tuSVA0OXhEZFFXMGV2aFh1MDZBcTk4VWxz?=
 =?utf-8?B?YkRUc2ZJc3p2TVcraXVsS1ByVDU1SHloSXR0VUd6d3d1czZUclVDd3VIM3pW?=
 =?utf-8?B?VVlQZDRrdmwwOWxDaVROakNGSjM2cFMyTXk0bVRoaCs4NFJkWjNMM1lIR2Zh?=
 =?utf-8?B?U29NT0tNN2UxcXJvNmdFN0NDb1ZqMThIUlJDUm1BM0xjNHA1WktKYWkwV3ZP?=
 =?utf-8?B?bXBBOUpqRE5kM3Izd0xDYmY0KzlRUVpQdmxPSHZ2NjNlNnhSb0FvbUtmMEpE?=
 =?utf-8?B?bVFPOGUyUUtTRHBDOUxDdTdrSnVPNHd6aHhEZHFITU5XSEFOc0JKNzN2eEI0?=
 =?utf-8?B?cXpYaE5kYTF4bjl5d1hybW1tckVMQTRkVXAwdWtIVDI2eDY2Wkt5VzBTV1I4?=
 =?utf-8?B?L1Y2dlgzUU1tem5Mc3p5SEZzSzNPeVJNS2VQQ0FsM1ljQ3FMeGpDTnhhK2lr?=
 =?utf-8?Q?V1DDb5n0KVzHc8Dljt88JTlhDHXqEjRdB6ekAe4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95e2963-e941-4e2e-4b5a-08d920be26f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 03:18:52.1620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxXUk5ky3tneO+YCJiPUWlBkR524RyiuNBKOmGfhDp9PCNp/3uBoYaHQBhBD9GW/TSDcB7FIv09NXoTE+TyIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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

The following changes since commit a2b4785f01280a4291edb9fda69032fc2e4bfd3f:

  drm/amdgpu: stop touching sched.ready in the backend (2021-05-19 18:07:43 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.13-2021-05-26

for you to fetch changes up to 20ebbfd22f8115a1e4f60d3d289f66be4d47f1ec:

  drm/amdgpu/jpeg3: add cancel_delayed_work_sync before power gate (2021-05-20 17:04:58 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.13-2021-05-26:

amdgpu:
- MultiGPU fan fix
- VCN powergating fixes

amdkfd:
- Fix SDMA register offset error

----------------------------------------------------------------
Evan Quan (1):
      drm/amd/pm: correct MGpuFanBoost setting

James Zhu (7):
      drm/amdgpu/vcn1: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn3: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg3: add cancel_delayed_work_sync before power gate

Kevin Wang (1):
      drm/amdkfd: correct sienna_cichlid SDMA RLC register offset error

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c    | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c                  |  2 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c                  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c                  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c                   |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c                   |  2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c                   |  2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c                   |  5 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         |  9 +++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 10 ++++++++++
 10 files changed, 42 insertions(+), 14 deletions(-)
