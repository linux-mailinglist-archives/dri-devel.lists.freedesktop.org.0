Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F803A22A8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 05:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4A06E43D;
	Thu, 10 Jun 2021 03:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA706E43B;
 Thu, 10 Jun 2021 03:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oV8rlTh6li9tmOW4ifk+wqXDc8PY2DI86/7jU//iB8h5+2dZbwDXQHyg93L/1S2YQs/g7hzahclquP32R/a1Rq6YGklcgvwrhUyqz5WakRcLYSgviveevKJ08jSLp/QHmosDry89ESU/By4fOGYiBtJCoMpXNBpY4L+JRF9cq2IwUgnF/3uLpByViF6SpPt5KvpYD6Yw5tELgbb2TxkYOo66xmaaz6HzE8NEmQXaRwJ/2ijY1A01N13Fz/te3eRejzfSf4A8/L5ELOKjkvdD6TpYRmqxT3ZWMkvCPxsadkZiCu0vDW/3JtxppoHJ0Av5fBZH+ebYLvB4socgyX77Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFS2mfnN5u74lEi5DfvoJ9lv2+l0h6QJ2YeEC4ZHX6s=;
 b=BV0e30W+pnAN6bKAKLK5VczQCrqKu2u0WCu2w/g4uUyh6NKk+EY13W4eHGpDK9mF510wGZOOvj5SnJ1nqVou2aH+FYj1JtFiesBx4zzJz9WNP7LRaNs2CBc1DCLEMAUp7kMEyCwyuM3esqUEj66fXNNUqnwyF/sWWgwY4an4MhwxgtfhSrOSOlKmWnPuegAAjzNViL+j4OK5SUMvxPzLdF1wwYUqnGSmcWbO+KKtfE/3k6InHmawV9WIEwLqYx5+aC0mhei+9zYNiqwdl65R8mCcwAUWuj/npOS4toyvhAceL0a6MMyhw06QNP3ODhc19MmfC7royxMRcj09QqJENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFS2mfnN5u74lEi5DfvoJ9lv2+l0h6QJ2YeEC4ZHX6s=;
 b=llf6B75qXQEllfGIXUws4Y2mCvUTV0cQftZcwHkTTfhlYP6lNgHQlUDZwL4UgHQCuv2Z2tr4xhYxGwb34YRlAYRKHwS8WyaKCEC5VR0KPcrtzFz9dPOOE2C6Yfk3rFg9elsjhRbAjVcmPv4KBjkKE2hLofBDuHkcboWKEH0QndY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 03:17:07 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 03:17:07 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.14
Date: Wed,  9 Jun 2021 23:16:49 -0400
Message-Id: <20210610031649.4006-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR19CA0068.namprd19.prod.outlook.com
 (2603:10b6:208:19b::45) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR19CA0068.namprd19.prod.outlook.com (2603:10b6:208:19b::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 03:17:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc3d5fe-488a-492a-1b2f-08d92bbe3a18
X-MS-TrafficTypeDiagnostic: MN2PR12MB4238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4238CF18381A96316FC174FDF7359@MN2PR12MB4238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k53ay4mDIpQJj2DFaHu10DDSVaH/k/otVX1PEDxWaPUoivXkjfQ1vdybRTLkKw/exnipvd5UTwE6I3b91urUgCa7lzv6Ra36vtkTXkq2XWd+743HGBoCXrOnRaP5NB4/IplP349ijvy4FEJgOCQd0xxblMh0QjmlAPuGo5rcFM9PjiKPnZLDfKP8baw0qYnkfplO1tMsZGnNkga/1wlzM/h9RgaLVL4T6WmS527fBMhuooYPe6a2r17o+tmN7vIuQbu3BwRZ0yb0jVOdOi2KUISpBVikqDkdVxJGV+xjH9HP/phMKtwFnSr4cZEGBIdh7of6CGouTi6qxSaiuDmJTbxCL9VKm6Xwt5nk1yz/V6UMWS9bz/ht1PncZSot3xvSz1lDK7dKezMck91ZV5eXsTGxl+IHWmAwabPBsRTqh5VAvHt083Eh8bXn96WA82VLEhcw+3S2Q6g75qT5ZzSfHw8mYUnNsqW34AirbWU3KMzmTUdpXIO2UPk1YkAapA1W1b6UTixxyyL+E9deyzYv3ioFsznv6O4NyfVF5cApMYaNsGA4ZwZDEpNzsUAuIvvrHoT4/NLeSvexEBwGZ1/GYcSqarOQkLEf7JxZhG0DdJOH+6+5Y4dkvS9nv1cpGA9X6XmYSdlIdj2T4Wyw/iSS6eS3y3km4tmmCiDSpHxUyrarSNn2OEjYKRpV2ORzePxV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(8676002)(16526019)(186003)(8936002)(26005)(36756003)(66946007)(4326008)(66574015)(66476007)(83380400001)(6512007)(66556008)(956004)(30864003)(2616005)(5660300002)(38350700002)(966005)(19627235002)(38100700002)(86362001)(6666004)(316002)(2906002)(52116002)(6486002)(1076003)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGpXSHJrMU5QM213NHZtL2tZWGxySEI5OHk3eWwzYlZiODQwdnNiQzZnZEZ0?=
 =?utf-8?B?YlVvU2RLMnFRYk5TRG9oSTBoekFSQ1JnYWlhMlQ0ajRYNythdjlQVGxIZkxk?=
 =?utf-8?B?UnpaV1JnNEY2OUVrakowaTF6SVVRNjhXY0h2b2ZkQ3kzaXJVdDNOZkdsWXdu?=
 =?utf-8?B?aWpzd2JlUVJEdHh3QllqZDBoNnFER3pIK2JJYkR5OHhUYnF2QXp5V1hUck9M?=
 =?utf-8?B?ZGtEczZSdXo4SSsyVWU4M0lzUERIQTFJWTFJSmRyQkhycklrVkNLd2dxRGF3?=
 =?utf-8?B?eHNJUDYzUU1zelJibWJnSTgzb1p2VmJxYzBBdDdYbE5DZjR2MWZzeWx6by9C?=
 =?utf-8?B?UUJKR0F3N3NZSjMxcjRWcUllLzNFMHNGelAxOFdWWlJuVXVVRXY1UTRCMUVj?=
 =?utf-8?B?ZTJaWmt3SGZkcUY5bXlOVGx3RFV3bk92QlVFUDZ4MnRSTVB1QWh3ZUJRQ2hj?=
 =?utf-8?B?L1VXUTZoeGJVbFN3SWV3UU52bnVmVGdpR1BUNzJBc0NPS3AzLzFtdHNOeDVO?=
 =?utf-8?B?ZDdsM2RPLzlBQ00zQkNUM2daeGtqVUhuTmV3NFBoOGF4V0E4bTU5cW9SZ05Y?=
 =?utf-8?B?WHBBR2o3eWRJOFpEMGZVOGVwZWttMVZoUFczS2FSUklZRVdMdG5EbTUyNWUv?=
 =?utf-8?B?ZTArSWxtK25OZ0kydEtlVEVCKzE2WEMxL0NVT3JXRGg5amh3OUg1eld0NkQ4?=
 =?utf-8?B?Skk5TWF4MEdyN0wvVWRZZUg3NkFFNms1Y0MrM25MZzYwakNERDVIcVRJUTNs?=
 =?utf-8?B?RTNpVE1VVktYeEE5S2V2OUpMSXJTQVBaL0dNM3hBcVg2SVhUanVlWGhJeEl1?=
 =?utf-8?B?QTNNM2MyMWVkZHF2Z2RSanhEVFB0TUQ1eVI0UTVzbjdLa0hJZ0g0b293c3o4?=
 =?utf-8?B?U0JWRWhQZjVSeDNWSWFZTVJiNTRlcXZqLzU3RUpzQ1lpR082WkdGRkJXRWRl?=
 =?utf-8?B?aW0vMUM1Slg3YzFBRGIxNXBnYW04aXVoWUNVTVgyMzJmdGMveWUwNXNtOHdn?=
 =?utf-8?B?MzM0VjBqWkZoZkFXd1RaU08yeUlSQWt2am1kaHhjeXhCVzBIUmxscWozNkVE?=
 =?utf-8?B?Q2R3VEg1UEpuTmFvV1JuTGZVYUJCSnJkbzlCcDdiRmZFM3U3aTEzR2o5Z0Jh?=
 =?utf-8?B?QndFYlNKY083OXRtbkJlaU9JL2tiSmRBV2plWmRJamEvRE9RU2tqRkJVNFgw?=
 =?utf-8?B?Y2JRWlZxaUFiZFBUUmxOWEtSdjJrdldUdktKOWE4NnZHV1JNRjkvZDQ0QXMx?=
 =?utf-8?B?WFpCOTdoMzViZjNxOUp4R05pM2w0R2ptWHJmK01IbDdVcElmeFVYMndQWTdN?=
 =?utf-8?B?ZFFmUVZzU3R3ckFnRDJhVVNCQVJtci9vNTVHNStsZ1ZidkU3VitTOXlaNWlY?=
 =?utf-8?B?dXhRR00rcHAxaUcrNnM5WnEwZUF5V3NpUmg3Yys2R283WUxXWm1sQWlKWWJR?=
 =?utf-8?B?V1JBa3FWN2lKWGU1a2laWDI5ZVRadWI0aElRelpYdStwVFhuY0tOSXlpS0JT?=
 =?utf-8?B?VkpsR1lkeUg4OHJsZ2V6Y0VoZzk5d0RycmJ0STN2VnNUanRzK1ltSDFHQ2NV?=
 =?utf-8?B?T3F6b2hYUExQUTF5OTdEekkyeE5KQmI2VDNia1c2djcxajloZ05FR3VTbHBq?=
 =?utf-8?B?ODJWY1E0d21QaGlhdzZRZy9jeVdtYko0WTBaU1NhWnorc0NTN0Jac0NSc3Uv?=
 =?utf-8?B?YzhQUGR2bk9KaFI4UEwvN3A2cUJZZ2FRR3JjbkZyUlhuR1hORVlYNjFHbkR6?=
 =?utf-8?Q?xKHoIs2eHg6+5WjXWLynksiHXV6siNCcGFq8rM/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc3d5fe-488a-492a-1b2f-08d92bbe3a18
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 03:17:07.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+wxxNcbMVpKByaOBXTlfG61d37bq02WFZfPXgAyQhS9fqpaqRXEnDNyUAMjuwrM8ShlYEBUGpvxqbXHuIr77Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238
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

More new stuff for 5.14.

The following changes since commit 5745d647d5563d3e9d32013ad4e5c629acff04d7:

  Merge tag 'amd-drm-next-5.14-2021-06-02' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-04 06:13:57 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-06-09

for you to fetch changes up to 2c1b1ac7084edf477309d27c02d9da7f79b33cec:

  drm/amdgpu/vcn: drop gfxoff control for VCN2+ (2021-06-09 22:15:02 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-06-09:

amdgpu:
- SR-IOV fixes
- Smartshift updates
- GPUVM TLB flush updates
- 16bpc fixed point display fix for DCE11
- BACO cleanups and core refactoring
- Aldebaran updates
- Initial Yellow Carp support
- RAS fixes
- PM API cleanup
- DC visual confirm updates
- DC DP MST fixes
- DC DML fixes
- Misc code cleanups and bug fixes

amdkfd:
- Initial Yellow Carp support

radeon:
- memcpy_to/from_io fixes

UAPI:
- Add Yellow Carp chip family id
  Used internally in the kernel driver and by mesa

----------------------------------------------------------------
Aaron Liu (42):
      drm/amdgpu: add yellow carp asic header files (v3)
      drm/amdgpu: add yellow carp asic_type enum
      drm/amdgpu: add uapi to define yellow carp series
      drm/amdgpu: add yellow carp support for gpu_info and ip block setting
      drm/amdgpu: add nv common ip block support for yellow carp
      drm/amdgpu: add yellow carp support for ih block
      drm/amdgpu: add gmc v10 supports for yellow carp
      drm/amdgpu: support fw load type for yellow carp
      drm/amdgpu: add gfx support for yellow carp
      drm/amdgpu: add sdma support for yellow carp
      drm/amdgpu: set ip blocks for yellow carp
      drm/amdkfd: add yellow carp KFD support
      drm/amdgpu: support nbio_7_2_1 for yellow carp
      drm/admgpu/pm: add smu v13 driver interface header for yellow carp (v3)
      drm/amdgpu/pm: add smu v13.0.1 firmware header for yellow carp (V4)
      drm/amdgpu/pm: add smu v13.0.1 smc header for yellow carp (v2)
      drm/amd/pm: add smu13 ip support for moment(V3)
      drm/amd/pm: add yellow_carp_ppt implementation(V3)
      drm/amd/pm: partially enable swsmu for yellow carp(V2)
      drm/amdgpu: add smu ip block for yellow carp(V3)
      drm/amdgpu: add gfx golden settings for yellow carp (v3)
      drm/amdgpu: reserved buffer is not needed with ip discovery enabled
      drm/amdgpu: add psp_v13 support for yellow carp
      drm/amdgpu: enable psp_v13 for yellow carp
      drm/amdgpu/pm: set_pp_feature is unsupport for yellow carp
      drm/amdgpu/pm: add set_driver_table_location implementation for yellow carp
      drm/amdgpu: add GFX Clock Gating support for yellow carp
      drm/amdgpu: add MMHUB Clock Gating support for yellow carp
      drm/amdgpu: add GFX Power Gating support for yellow carp
      drm/amdgpu/pm: enable smu_hw_init for yellow carp
      drm/amdgpu/pm: add gfx_off_control for yellow carp
      drm/amdgpu/pm: enable gfx_off in yellow carp smu post init
      drm/amdgpu: add SDMA Clock Gating support for yellow carp
      drm/amdgpu: add HDP Clock Gating support for yellow carp
      drm/amdgpu: add ATHUB Clock Gating support for yellow carp
      drm/amdgpu: add IH Clock Gating support for yellow carp
      drm/amdgpu: enable VCN PG and CG for yellow carp
      drm/amdgpu/pm: support smu_post_init for yellow carp
      drm/amdgpu: add RLC_PG_DELAY_3 for yellow carp
      drm/amdgpu: add timestamp counter query support for yellow carp
      drm/amd/pm: add PrepareMp1ForUnload support for yellow carp
      drm/amdgpu: add mode2 reset support for yellow carp

Alex Deucher (5):
      drm/amdgpu: add yellow_carp_reg_base_init function for yellow carp (v2)
      drm/amdgpu: add mmhub client support for yellow carp
      drm/amdgpu/dc: fix DCN3.1 Makefile for PPC64
      drm/amdgpu/dc: fix DCN3.1 FP handling
      drm/amdgpu/vcn: drop gfxoff control for VCN2+

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.68

Aric Cyr (4):
      drm/amd/display: Change default policy for MPO with multidisplay
      drm/amd/display: 3.2.138
      drm/amd/display: Fix crash during MPO + ODM combine mode recalculation
      drm/amd/display: 3.2.139

Bernard Zhao (1):
      drm/amd/display: remove no need variable

Changfeng (1):
      drm/amdgpu: switch kzalloc to kvzalloc in amdgpu_bo_create

Chen Li (2):
      radeon: fix coding issues reported from sparse
      radeon: use memcpy_to/fromio for UVD fw upload

Christian König (1):
      drm/amdgpu: fix VM handling for GART allocations

Christophe JAILLET (1):
      drm/amdgpu: Fix a a typo in a comment

Colin Ian King (3):
      drm/amdgpu: remove redundant assignment of variable k
      drm/amd/display: remove variable active_disp
      drm/amd/display: Fix two spelling mistakes, clean wide lines

Darren Powell (6):
      amdgpu/pm: reorder definition of swsmu_pm_funcs for readability
      amdgpu/pm: clean up smu_get_power_limit function signature
      amdgpu/pm: modify Powerplay API get_power_limit to use new pp_power enums
      amdgpu/pm: modify and add smu_get_power_limit to Powerplay API
      amdgpu/pm: handle return value for get_power_limit
      amdgpu/pm: add kernel documentation for smu_get_power_limit

Dingchen (David) Zhang (1):
      drm/amd/display: force CP to DESIRED when removing display

Eric Bernstein (1):
      drm/amd/display: Updates for ODM Transition Test

Eric Huang (6):
      drm/amdkfd: Add flush-type parameter to kfd_flush_tlb
      drm/amdkfd: Add heavy-weight TLB flush after unmapping
      drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update
      drm/amdkfd: Make TLB flush conditional on mapping
      drm/amdgpu: Don't flush/invalidate HDP for APUs and A+A
      drm/amdgpu: Fix warning of Function parameter or member not described

Evgenii Krasnikov (1):
      drm/amd/display: add visual confirm colors to differentiate layer_index > 0

Fangzhi Zuo (1):
      drm/amd/display: Add debugfs entry for dsc passthrough

Gustavo A. R. Silva (1):
      drm/amd/pm: Fix fall-through warning for Clang

Hawking Zhang (1):
      drm/amdkfd: add sdma poison consumption handling

Huang Rui (2):
      drm/amdgpu: introduce a stolen reserved buffer to protect specific buffer region (v2)
      drm/amd/pm: add vcn/jepg enable functions for yellow carp

Ilya Bakoulin (1):
      drm/amd/display: Revert "Fix clock table filling logic"

Jake Wang (1):
      drm/amd/display: Trigger full update after DCC on/off

James Zhu (5):
      drm/amdgpu/jpeg: Remove harvest checking on CHIP_YELLOW_CARP
      drm/amdgpu/vcn: add vcn support for yellow carp
      drm/amdgpu: enable vcn/jpeg on yellow carp
      drm/amdgpu: enable vcn dpg mode on yellow carp
      drm/amdgpu: add video_codecs query support for yellow carp

Jayendran Ramani (1):
      drm/amd/display: Return last used DRR VTOTAL from DC

Jiapeng Chong (1):
      drm/amd/display: Fix duplicate included dce110_hw_sequencer.h

Jimmy Kizito (2):
      drm/amd/display: Expand DP module equalization API.
      drm/amd/display: Support mappable encoders when transmitting training patterns.

JinZe.Xu (1):
      drm/amd/display: Control power gating by driver.

John Clements (1):
      drm/amdgpu: Update psp fw attestation support list

Leslie Shi (1):
      drm/amd/display: Fix uninitialized field when expanding macro MI_DCE12_MASK_SH_LIST

Lijo Lazar (4):
      drm/amd/pm: Remove BACO check for aldebaran
      drm/amd/pm: Read BIF STRAP also for BACO check
      drm/amd/pm: Add VF check to BACO support check
      drm/amd/pm: Use generic BACO function for smu11 ASICs

Mario Kleiner (1):
      drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.

Meenakshikumar Somasundaram (1):
      drm/amd/display: Remove unused definition of DMUB SET_CONFIG

Michel Dänzer (1):
      drm/amdgpu: Use drm_dbg_kms for reporting failure to get a GEM FB

Mikita Lipski (2):
      drm/amd/display: Enabling PSR support for multiple panels
      drm/amd/display: Enable PSR Residency for multiple panels

Nicholas Kazlauskas (22):
      drm/amdgpu: Load TA firmware for yellow carp
      drm/amdgpu: Update atomfirmware for DCN3.1 phy tuning and eDP caps
      drm/amd/display: Add DCN3.1 yellow carp asic family IDs
      drm/amd/display: Add DCN3.1 clock manager support
      drm/amd/display: Add DCN3.1 DCCG
      drm/amd/display: Add DCN3.1 DIO
      drm/amd/display: Add DCN3.1 OPTC
      drm/amd/display: Add DCN3.1 DCHHUB
      drm/amd/display: Add DCN3.1 DML calculation support
      drm/amd/display: Add DCN3.1 IRQ manager
      drm/amd/display: Add DCN3.1 GPIO support
      drm/amd/display: Add DCN3.1 DMCUB
      drm/amd/display: Add DCN3.1 PANEL
      drm/amd/display: Add DCN3.1 HDCP support
      drm/amd/display: Add DCN3.1 BIOS parser support
      drm/amd/display: Add DCN3.1 HWSEQ
      drm/amd/display: Add z10 restore checks for DC interfaces
      drm/amd/display: Add DCN3.1 Resource
      drm/amd/display: Add DCN3.1 blocks to the DC Makefile
      drm/amd/display: Add DCN3.1 Yellow Carp support to DM
      drm/amd/display: Add DC DCN3.1 support to Kconfig
      drm/amdgpu: Add DC support and display block for Yellow Carp

Nikola Cornij (1):
      drm/amd/display: Fix DCN 3.01 DSCCLK validation

Nirmoy Das (1):
      drm/amdgpu: fix shadow bo skip condition

Peng Ju Zhou (1):
      drm/amdgpu: Fixing "Indirect register access for Navi12 sriov" for vega10

Philip Yang (1):
      drm/amdkfd: pages_addr offset must be 0 for system range

Po-Ting Chen (1):
      drm/amd/display: Add swizzle visual confirm mode

Rohit Khaire (5):
      drm/amdgpu: Fix incorrect register offsets for Sienna Cichlid
      drm/amdgpu: Enable RLCG read/write interface for Sienna Cichlid
      drm/amdgpu: Modify GC register access to use _SOC15 macros
      drm/amdgpu: Modify register access in sdma_v5_2 to use _SOC15 macros
      drm/amdgpu: Use PSP to program IH_RB_CNTL_RING1/2 on SRIOV

Roman Li (1):
      drm/amd/display: Update scaling settings on modeset

Roy Chan (1):
      drm/amd/display: Revert "Disconnect non-DP with no EDID"

Sathishkumar S (2):
      drm/amd/pm: sysfs attrs to read ss powershare (v6)
      drm/amdgpu: attr to control SS2.0 bias level (v2)

Vladimir Stempen (1):
      drm/amd/display: Release MST resources on switch from MST to SST

Wan Jiabing (2):
      drm: amdgpu: Remove unneeded semicolon in amdgpu_vm.c
      drm/amdkfd: remove duplicate include of kfd_svm.h

Wenjing Liu (1):
      drm/amd/display: delay 100ms before restart after failing to read CP_IRQ

Wesley Chalmers (4):
      drm/amd/display: Add Interface to set FIFO ERRDET SW Override
      drm/amd/display: Add interface for ADD & DROP PIXEL Registers
      drm/amd/display: Set DISPCLK_MAX_ERRDET_CYCLES to 7
      drm/amd/display: Fix off-by-one error in DML

Wyatt Wood (2):
      drm/amd/display: Refactor visual confirm
      drm/amd/display: [FW Promotion] Release 0.0.69

Xiaomeng Hou (17):
      drm/amd/pm: add read_sensor function for yellow carp
      drm/amd/pm: add set_watermarks_table function for yellow carp
      drm/amd/pm: add the fine grain tuning function for yellow carp
      drm/amd/pm: add support to get dpm clock value for yellow carp
      drm/amd/pm: add feature map for yellow carp
      drm/amd/pm: implement is_dpm_running() callback for yellow carp
      drm/amd/pm: initialize feature_enabled/feature_support bitmap for yellow carp
      drm/amd/pm: add callback force_clk_levels for yellow carp
      drm/amd/pm: add callback to get bootup values for yellow carp
      drm/amd/pm: add callback get_dpm_ultimate_freq for yellow carp
      drm/amd/pm: add callbacks to read/write sysfs file pp_power_profile_mode
      drm/amd/pm: add the interface to dump smu metrics table for yellow carp
      drm/amdgpu: add gpu harvest support for yellow carp (v2)
      drm/amdgpu: correct the cu and rb info for yellow carp
      drm/amd/pm: add set_performance_level function for yellow carp
      drm/amd/pm: disable manually setting MCLK power level on yellow carp
      drm/amd/pm: fix warning reported by kernel test robot

Yu Kuai (1):
      drm: fix doc warnings in drm_atomic.h

Zhigang Luo (5):
      drm/amdgpu: remove sriov vf checking from getting fb location
      drm/amdgpu: remove sriov vf gfxhub fb location programming
      drm/amdgpu: remove sriov vf mmhub system aperture and fb location programming
      drm/amdgpu: add psp ta microcode init for aldebaran sriov vf
      drm/amdgpu: allocate psp fw private buffer from VRAM for sriov vf

shaoyunl (1):
      drm/amdgpu: soc15 register access through RLC should only apply to sriov runtime

 Documentation/gpu/amdgpu.rst                       |     21 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |      2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |     42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |      3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |     37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |      2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    111 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |      3 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |     12 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     40 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     17 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |      5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |     17 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     21 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    142 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     51 +
 drivers/gpu/drm/amd/amdgpu/nv.h                    |      2 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     37 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     77 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |      4 +-
 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c  |     51 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     52 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     19 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |      7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |      1 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |      7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |      1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |      1 +
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |      1 +
 drivers/gpu/drm/amd/display/Kconfig                |      7 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |     47 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |      1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     50 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     28 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |      6 +
 drivers/gpu/drm/amd/display/dc/Makefile            |      3 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    113 +
 .../drm/amd/display/dc/bios/bios_parser_helper.c   |      5 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      5 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     11 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     52 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |      4 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     78 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    673 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |    103 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |    333 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h   |    271 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     77 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    133 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |     65 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |     24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |     11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     42 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |      6 +
 drivers/gpu/drm/amd/display/dc/dc.h                |     31 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |     23 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |      3 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |      4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |     21 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h |      1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     41 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |     17 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |     59 +-
 .../display/dc/dce110/dce110_timing_generator.c    |      1 +
 .../display/dc/dce120/dce120_timing_generator.c    |      1 +
 .../amd/display/dc/dce80/dce80_timing_generator.c  |      1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |     48 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    110 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |     12 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |      3 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |     20 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |     12 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |      6 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.c  |     36 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    129 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |      9 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |     16 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |     84 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |      5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |     10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.h  |      9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |     42 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.c  |      3 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |      3 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |     37 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.c  |      3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h  |     17 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |      5 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |      6 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |      2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_dccg.c    |      3 +
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |      3 +-
 .../gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.c   |     34 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |      2 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     42 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    279 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    147 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    406 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |    246 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |    956 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |    122 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |    103 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h  |    246 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    598 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |     56 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    150 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h  |     33 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |    287 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    259 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |    157 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.h    |     40 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2196 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |     42 +
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |      5 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |      6 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     11 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |     78 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   7508 ++
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.h |     43 +
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   1727 +
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.h  |     69 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     18 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |      4 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |     42 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |     52 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      3 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      3 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     10 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |      8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     62 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |      5 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |      4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |      3 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      5 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     22 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |      5 -
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     11 +
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |    432 +
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.h   |     37 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     12 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    214 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      3 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    354 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |    230 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     37 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     13 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |      3 +
 .../amd/display/modules/hdcp/hdcp2_transition.c    |      2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |      4 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |    135 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |     38 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |     23 +-
 .../amd/include/asic_reg/dcn/dcn_3_1_2_offset.h    |  15083 +++
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |  60747 ++++++++++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  |  11936 ++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h | 103385 ++++++++++++++++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h |    355 +
 .../amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h    |    531 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |     56 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     49 +-
 drivers/gpu/drm/amd/include/yellow_carp_offset.h   |   1366 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    254 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |      7 +-
 .../drm/amd/pm/inc/smu13_driver_if_yellow_carp.h   |    222 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h           |     57 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h      |    139 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_ppsmc.h     |     97 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     33 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |      1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    103 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     35 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     37 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     37 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |      7 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c   |    311 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   1210 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |     28 +
 drivers/gpu/drm/radeon/radeon_uvd.c                |     28 +-
 include/drm/amd_asic_type.h                        |      1 +
 include/drm/drm_atomic.h                           |      4 +
 include/uapi/drm/amdgpu_drm.h                      |      1 +
 220 files changed, 216987 insertions(+), 823 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/yellow_carp_offset.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu13_driver_if_yellow_carp.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h
