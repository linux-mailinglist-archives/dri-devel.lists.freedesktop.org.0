Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C662158A341
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 00:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12BFA8FA3;
	Thu,  4 Aug 2022 22:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2C2A8F7E;
 Thu,  4 Aug 2022 22:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxZSD3Gxubs4zdKU6iphPzlif5AflgEERA2GAUOPANb3svITq0QbxQmcJu0EIwhh2J25YPkiQwNpaBBoqkWJQczpV+ufn0b7KS1gFoMSvCWY4VzEOnu11o1xHuirBJ4zxykDoMS6G8oe1j++n8d2b7y4FLF+82Nd4f3xq4Dwl3SegrPkvmkQeG+YTyW0l1oCI9AIJ8tdaxpXK67i4QPpJE8Qy+6JsPlu+hn68UVYOZkJh302TiZRa/hwzmbRrIcEK0d9nxxvvbhwYzda3G/iFtLIKA981h8BmLMdruWk3j4kBZwKAQUQfRvTjVwV1VSFH4JyAIfT4/e15gK8r3oR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ6ZASmbp/Ut6gz1wrxAxSxupTe2NM6VyRAAhpBanH4=;
 b=Yo14ZVQ5P2444LTsDfmAQ0Qof2mLU+CCIB/yCPgpB3X5b6Z03zac9vDVm6nprc6VSbkD64fSVyDrvJiLeLr5ovmrlhdEP38S03EWx2EVQtJ7xTvtK6ZvgFi6y0uUxx4NZ8l3gnSAsU0ESLganj9qaZLIKxbQzTLO6mtS3kVfWAo4lh5nUZcTxfTsrntEzOOhNaJiDTuYXkux+RHCRlfWBAGjrhvGHzc7KiFe5GZASOL+6sY6cWG0mNNTHgnMVqc6ew4U6HlfzJMVLqGC4NncRbE6K+OaRTob2GSdU2lfLs5wZ5uJEhrmhYOB2tkO/ZOFOwi3+BmJwuCvVQMpadoXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ6ZASmbp/Ut6gz1wrxAxSxupTe2NM6VyRAAhpBanH4=;
 b=kEqAELO6Lfobt4PTOxOFEYp8ESujCZ9dvEqnqk9+8aEkfC3j0eRbOAg47YUP2Q1Debtzurowl2mXjggwuTKFkx5RnXM+HG7lHxY0xrjwtLAYmt2K4u6v4wx1RYbvgAnLaHQKSezMaSpK+g9qf4XtAjYJwFKzxc6zXj2nmPJbODg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BN7PR12MB2722.namprd12.prod.outlook.com (2603:10b6:408:2e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 22:23:39 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 22:23:39 +0000
Message-ID: <560215be-b798-8800-c5ab-86ef1cd6ae8e@amd.com>
Date: Thu, 4 Aug 2022 18:23:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/4] Documentation/amdgpu_dm: Add DM color correction
 documentation
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, sungjoon.kim@amd.com,
 nicholas.kazlauskas@amd.com
References: <20220804150107.3435964-1-mwen@igalia.com>
 <20220804150107.3435964-2-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220804150107.3435964-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:610:11a::6) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2185660e-22c8-4198-671a-08da7667fb12
X-MS-TrafficTypeDiagnostic: BN7PR12MB2722:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkuKa1AkAhoeBQHHpzA918Wdn/xIr/MdznqWq8MskQ0p5FrapcY3vEH3gB8ycNOjSp2mVlJzf+VbnELxG0jdhg9rWijhnFMUm7s8D2Bow07HPd+qr9eSUYmjwit+cC5c07lqluIP1SAcmk57j8LRmrHuTfieAEKeyyv436biWlVUCicpKtXDuUw9rFxtPi5au/dpDFVB2MOSV+/U32NFl8hB3SNhDVBwjKlNKNk1HtHIlBLyJLw3Q49ZkNiiUZxScrS6dz+43KhEljhydEgOuOtoPXQYIiHakeq70u/9BPgqbx45J2cNWx2Bf31KRlTUVrS7HJi/1t+pkmIyf9HZPOt1WIMD7Gw3GXM+Mzg7sw3NJaD8kV9vhSgnNhKNbjH92rZ8GleES0WipHTRnKTAQXEgwNHrEHB0sX0plpEzKcfv00kFZw95WZWkU5adPBd2vuDp3YyhavTj5Uxdk4uaQYwfWSY0CwASpvw5ahaCCrogAOqqwJS+UYTNcXa+EstkmGVF/a0Vn1gNHhV54Rp1WLqv3W8HXRDWXIiO8hT3/mlAMQrrEyrw7ko+L/N/zHodckx7+XvpKyv2e6zB81bbRlmADUasJbUsYD2BSNdbuxjG5t1PxRogHC7M6S76orX7NxIbAFDXdYTZ5L+k+us76SxklYgOD8eTU0ynOVLG0AImNdNBUCrdZlLghhejptBdbx29zE/8GZutDwGMPWgI/VBfbZ2HahenCLqaE7tuYy7A0c3qk/d5G9eDZ1WgVpFkXGtJdw5Av/+Q5+McHLi9uZgotvE76KIK3YMY/oc6IbpLjjVHrtmIePthBpx+SbbaMblDz9UCyCvc5nS+Qzja9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(2906002)(26005)(6506007)(53546011)(186003)(41300700001)(38100700002)(83380400001)(2616005)(6512007)(36756003)(4326008)(8676002)(31696002)(86362001)(66476007)(31686004)(66556008)(66946007)(6636002)(8936002)(6486002)(110136005)(478600001)(5660300002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXE0VVphTm1EZG8zeElNa0FBbE1vcXgwRUpjRS93TDRPTFJRS1k4T3Jrc01H?=
 =?utf-8?B?dTNtNUUrcDA2S3dxN1NVVTVRY1VLSC9scGJiRFNlUnRiTlA5TTU5eUFHdWJo?=
 =?utf-8?B?cE9XSGlsWGhYR1ZLVk40d3FTQk96M0RiaDl5c05zZ243bVkxWUZZS2EwLzVM?=
 =?utf-8?B?aEJzNmNicC9qcHBxMjFzb2VnTDdydjNHTDBUeG4yRFRrSjNhMGJzWkxmQ2M5?=
 =?utf-8?B?MHNUSlZTNVp0QzNVdHA1Ym1NV2lzNWpPVDd5SUFvVzlyaUVxQ2RDWURKYWdO?=
 =?utf-8?B?ZEV4QnNDRW04VDQ4OTJkR0FhRFVLekU1Ujk5VGNDL0pwY0JWODUzWnpIZE9V?=
 =?utf-8?B?SWpncEhEdjZJL1RTQ3pPZkozVDc3MmN5ZGdxbUYyTjY4ZVNQY1NBcHZ1VTly?=
 =?utf-8?B?Q2lXclp2b2x3UzVLb0NjNm1MVnZPMzdscUlYZEdOMHF1ZkRTUGE4R0NNeGs1?=
 =?utf-8?B?L1JHbHFZS3JjNEwvZkhsVXlYL21OZ1RrdHoxT3JxaGtoMXNqNDhwd1FxUmJD?=
 =?utf-8?B?SXdob0VSZXF2dmh5NVRJOW9NSmtZMm1rT1VQRk4wUUEwcVNTRVgxYW1EWG04?=
 =?utf-8?B?OTg4cDZKVSt2aEdNdXc2amJveUhtMzFQd3MxMVNiRGtmSE53cFpjMkpaSVBG?=
 =?utf-8?B?YmJzVDRNbVRCaSt2MlJwZ25sc082cVVPYlRGd3kxRGRhc3RIZXRHYkpDeDdn?=
 =?utf-8?B?Wi81UFZRTUVBN3F3ZHVmd3lVOUNsSk1qRDFKUkJvVmJHS1M5VU43bXdGNFQ2?=
 =?utf-8?B?dmx4TndDWlNxVWJId1NpcVdaaEVFZGEyK0hLYnZKdHlGME9wMWdSVFV0akRL?=
 =?utf-8?B?VDlJTnZ4M1l1YnFMRm5oWS95cjZaSUxQUzJPZ2VSUTIxZ0F1UER4anVhb0Fs?=
 =?utf-8?B?MGh6SW9OY1NJOHhIRS8xUGhRUDJYYkJEMlV0elZFSWRQOHF0YVJBU3ExNnZo?=
 =?utf-8?B?NmU1L3ZDc3JYdjBiT1lwTGJZSHFCRGtzVHE4RG4reWgzODNKblpsZVNpcWxx?=
 =?utf-8?B?clFpdS9ENHU3emYxOEdmalV0YmRPc0pIRmF0OWpQVGp5b2JLM0F1djZFSWJU?=
 =?utf-8?B?a1lvYVNqZnB0NEFscms4Z1F2N0lSVm1LWDNuMms4WjlON0UxMVJSenBUTFA5?=
 =?utf-8?B?amQ1UGFlTHJZWGpqdzNuckN3Z0NCOEp4UXJsRjhjb2RMQTBWR0RZNDFIOG1V?=
 =?utf-8?B?Qi9LUGNBc0h6OU1jUnA2Q1BTZXp6S21Cakw2SUpHdjUrbGg5WVlxaU12RVFh?=
 =?utf-8?B?RU5SalUxeW1sNVlMQThrYmxkUWN2bVZxaENrUTE0U3ZFbkRSd0lCN244N29u?=
 =?utf-8?B?ZGJ2bzlLdkx5VThPWllrU2lqV0ZMNk5lOXBCcGZ5NThEcjVmdTBGSFAvTUJZ?=
 =?utf-8?B?eWVUa1BQcDh0bkVWTzEzZTgxcVpKY1FzQnpVZXRFWVc0V0NpWk5IWHZRRU83?=
 =?utf-8?B?cnkvTWVlT0tWWG9heEE0MVc4endJa080dEhCYWp4WlVOcjJhV1ZjVmNaMU1H?=
 =?utf-8?B?SjlxRWx5bm9aWmhRSitSWnlwbHcvVkxrTy8rN1p6Mm9ZY1BUTEdGQ3pvTFB4?=
 =?utf-8?B?SytGMXNCenRHMCsraVFjY21iVlkwSWdnR00veU5ESmtHWTRGOEcwY2ZVNjZY?=
 =?utf-8?B?bzRqb3FReklqZFA0c0JOUzROa3Z0SzhRVkRWalFoa2FoZ0V4dUdVUHc1L21v?=
 =?utf-8?B?UzRuWTVBUDlSUER2ZlZobnUwVHgzZXJ3L2JYOExjWGJDYkpGdVlXcFpkWHpt?=
 =?utf-8?B?S1ZxcHNRd3ZlV25QbjJMekUxUEQ5MTVod1FZdERZakJMeWdqbTI2OEpJenAv?=
 =?utf-8?B?Y1NMdDhjZS9ZOWhqZEpCUVRNQ2xUSWdPejVNeXpteEhkRkJac1BwekFSSWJW?=
 =?utf-8?B?K1ZXc253cnRXQ2hUWlhXOHpEOHNlKzNXTXZsT0NEWEVPY0RoSkUyOG8vNEtN?=
 =?utf-8?B?bWhsZEwwTThKWWlQQ09jN2ZNN2I4NlJpNnU0aWhqS2NlekdYYlZxbXJyTGp4?=
 =?utf-8?B?TDdpSU9hRzN6RGlmOEEyQmNBaUt3SmRCcW1XS2FraGdITENzYXpSd21SQURC?=
 =?utf-8?B?NnNmaDI4YlQ1cGtEbWFzcDVPVk1rMVphaStiYnltZU1WZUsyL3Erd1BzRmZh?=
 =?utf-8?Q?UxTTtDi9udfzyJERm/3+ZgQKt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2185660e-22c8-4198-671a-08da7667fb12
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:23:39.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3gSCuqH7kuxUv7RgbeQ/W1X76kM+dMlqDA52Qo2i6lH0VxlM8tMKPbOLy7HVMm1PSjW4owZH8DYzCdiofiZ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2722
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-04 11:01, Melissa Wen wrote:
> AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
> to DC color correction entities. Part of this mapping is already
> documented as code comments and can be converted as kernel docs.
> 
> v2:
> - rebase to amd-staging-drm-next
> - fix typos (Tales)
> - undo kernel-docs inside functions (Tales)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>   .../gpu/amdgpu/display/display-manager.rst    |   9 ++
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 109 +++++++++++++-----
>   2 files changed, 90 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
> index 7ce31f89d9a0..b1b0f11aed83 100644
> --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> @@ -40,3 +40,12 @@ Atomic Implementation
>   
>   .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>      :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> +
> +Color Management Properties
> +===========================
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +   :internal:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index a71177305bcd..a4cb23d059bd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -29,7 +29,9 @@
>   #include "modules/color/color_gamma.h"
>   #include "basics/conversion.h"
>   
> -/*
> +/**
> + * DOC: overview
> + *
>    * The DC interface to HW gives us the following color management blocks
>    * per pipe (surface):
>    *
> @@ -71,8 +73,8 @@
>   
>   #define MAX_DRM_LUT_VALUE 0xFFFF
>   
> -/*
> - * Initialize the color module.
> +/**
> + * amdgpu_dm_init_color_mod - Initialize the color module.
>    *
>    * We're not using the full color module, only certain components.
>    * Only call setup functions for components that we need.
> @@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
>   	setup_x_points_distribution();
>   }
>   
> -/* Extracts the DRM lut and lut size from a blob. */
> +/**
> + * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
> + * @blob: DRM color mgmt property blob
> + * @size: lut size
> + *
> + * Returns:
> + * DRM LUT or NULL
> + */
>   static const struct drm_color_lut *
>   __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>   {
> @@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>   	return blob ? (struct drm_color_lut *)blob->data : NULL;
>   }
>   
> -/*
> - * Return true if the given lut is a linear mapping of values, i.e. it acts
> - * like a bypass LUT.
> +/**
> + * __is_lut_linear - check if the given lut is a linear mapping of values
> + * @lut: given lut to check values
> + * @size: lut size
>    *
>    * It is considered linear if the lut represents:
> - * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
> - *                                           [0, MAX_COLOR_LUT_ENTRIES)
> + * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
> + * MAX_COLOR_LUT_ENTRIES)
> + *
> + * Returns:
> + * True if the given lut is a linear mapping of values, i.e. it acts like a
> + * bypass LUT. Otherwise, false.
>    */
>   static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>   {
> @@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>   	return true;
>   }
>   
> -/*
> - * Convert the drm_color_lut to dc_gamma. The conversion depends on the size
> - * of the lut - whether or not it's legacy.
> +/**
> + * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
> + * @lut: DRM lookup table for color conversion
> + * @gamma: DC gamma to set entries
> + * @is_legacy: legacy or atomic gamma
> + *
> + * The conversion depends on the size of the lut - whether or not it's legacy.
>    */
>   static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>   				  struct dc_gamma *gamma, bool is_legacy)
> @@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>   	}
>   }
>   
> -/*
> - * Converts a DRM CTM to a DC CSC float matrix.
> +/**
> + * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
> + * @ctm: DRM color transformation matrix
> + * @matrix: DC CSC float matrix
> + *
>    * The matrix needs to be a 3x4 (12 entry) matrix.
>    */
>   static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
> @@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>   	}
>   }
>   
> -/* Calculates the legacy transfer function - only for sRGB input space. */
> +/**
> + * __set_legacy_tf - Calculates the legacy transfer function
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut
> + * @has_rom: if ROM can be used for hardcoded curve
> + *
> + * Only for sRGB input space
> + *
> + * Returns:
> + * 0 in case of success, -ENOMEM if fails
> + */
>   static int __set_legacy_tf(struct dc_transfer_func *func,
>   			   const struct drm_color_lut *lut, uint32_t lut_size,
>   			   bool has_rom)
> @@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
>   	return res ? 0 : -ENOMEM;
>   }
>   
> -/* Calculates the output transfer function based on expected input space. */
> +/**
> + * __set_output_tf - calculates the output transfer function based on expected input space.
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut
> + * @has_rom: if ROM can be used for hardcoded curve
> + *
> + * Returns:
> + * 0 in case of success. -ENOMEM if fails.
> + */
>   static int __set_output_tf(struct dc_transfer_func *func,
>   			   const struct drm_color_lut *lut, uint32_t lut_size,
>   			   bool has_rom)
> @@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func *func,
>   	return res ? 0 : -ENOMEM;
>   }
>   
> -/* Caculates the input transfer function based on expected input space. */
> +/**
> + * __set_input_tf - calculates the input transfer function based on expected
> + * input space.
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut.
> + *
> + * Returns:
> + * 0 in case of success. -ENOMEM if fails.
> + */
>   static int __set_input_tf(struct dc_transfer_func *func,
>   			  const struct drm_color_lut *lut, uint32_t lut_size)
>   {
> @@ -285,13 +335,14 @@ static int __set_input_tf(struct dc_transfer_func *func,
>   }
>   
>   /**
> - * amdgpu_dm_verify_lut_sizes
> + * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
>    * @crtc_state: the DRM CRTC state
>    *
> - * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
> - * the expected size.
> + * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
> + * are of the expected size.
>    *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success. -EINVAL if any lut sizes are invalid.
>    */
>   int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>   {
> @@ -327,9 +378,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>    * of the HW blocks as long as the CRTC CTM always comes before the
>    * CRTC RGM and after the CRTC DGM.
>    *
> - * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> - * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> - * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
> + * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> + * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> + * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>    *
>    * The RGM block is typically more fully featured and accurate across
>    * all ASICs - DCE can't support a custom non-linear CRTC DGM.
> @@ -338,7 +389,8 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>    * management at once we have to either restrict the usage of CRTC properties
>    * or blend adjustments together.
>    *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success. Error code if setup fails.
>    */
>   int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   {
> @@ -393,7 +445,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   		if (r)
>   			return r;
>   	} else if (has_regamma) {
> -		/* CRTC RGM goes into RGM LUT. */
> +		/* If atomic regamma, CRTC RGM goes into RGM LUT. */
>   		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>   		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>   
> @@ -450,9 +502,10 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>    *
>    * Update the underlying dc_stream_state's input transfer function (ITF) in
>    * preparation for hardware commit. The transfer function used depends on
> - * the prepartion done on the stream for color management.
> + * the preparation done on the stream for color management.
>    *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success. -ENOMEM if mem allocation fails.
>    */
>   int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>   				      struct dc_plane_state *dc_plane_state)

lgtm,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

