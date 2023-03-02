Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55B6A7BA6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 08:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C6410E0F3;
	Thu,  2 Mar 2023 07:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4A510E0F3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 07:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmVyXTs9utXWY6WuhYaKK2bk6ZvhJshiA/h2cmWPIdUXqufPS2yURoR2DgSf8VFdRnxogGswuQLTsfaqVuOQt57bN6GtsG3HH+tDdNCMu+xlg58JRMTpCCUcieTz0EGrMnSxCEpTeM7ckxF38lz1mMGfu9UnDDxOJnZJo80BDgShu133uTXqeo60jD1HFmrtkCD0StOoRvuic23iGJzbLcoPIsa/TEdXxFh1GiHfg28VmwiZAH8sEmDiVPLDt4IQvMwAZSyrTce8x8bb7OGi6fa9IRKSX5IBZDiIrfbkQwcHElRVZk6d9j/Wj4cEM9egRhFbYXCH7fYeWzVhNFrBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKs8KnUD8JJjVR7xc9SFkTba/hZ1+kdO+2WmL221jfY=;
 b=nFXwYnDcdJixsr6ICJuIoDz0oWzZ22gATca/5aNioY78tgUH9ncy17/FuKuLfgQHhTgBsw7eEirYthgSDvziJr8SudM0i/npu8iegKZY6Iie9Vtw2J5tg/2I0szVVKvqw+/pXP+yNHdZ7VRPuY4jhre+8WT0v6gWCkYOFle2+0xNcZ60Z5JxCXk1U4JMX6E9+wHRm7MikvKo5JpI85jrG+LxpvC5YH4LxybFO6zlhIog9gjssUIoAxaylyoKjPflPLaJgnU4wC932O3kTvZLlZlf3BpxQNh44xfKZjFEEWV+MtP44oLlZgtX/xbeqPmGAPR7lvQuYDJwQWYCoZpdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKs8KnUD8JJjVR7xc9SFkTba/hZ1+kdO+2WmL221jfY=;
 b=KFn2nLIWQMa1qt7c+IEXLFPEJxndNenBLYaWYJ7yXLPrBfRjZMeq2oTYg/atuFG2W+2Hkf35hTdKHuN19hdPo9FFoGzUb+EhfdpobzMMYc4D7dNxtlUwPc0yNEWz2M2CBeEKKpmtqUKe+OjMxA8ApDZC5RHsV0zWHKYj0Wz55aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 07:12:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 07:12:03 +0000
Message-ID: <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
Date: Thu, 2 Mar 2023 08:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230301222903.458692-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230301222903.458692-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 2449f2a0-e0ce-4691-79d6-08db1aed6c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VM4QIJzmimVrze5edSNMidAxQQ/T2ovKUF5cMB2rvr/uhbh0/SrcgCvsvImkxIyyOcnT9aSVyl3BSx3yEoAVWr4hhErMsAZwisK4wyTcxHAlucG3presSPnp7EuSm4DlPgZbMc4+BktvFF+iL9jlaUvDXc2/bF0oxiXQtVDXB32wWfMdXseIUJwN8xwawXkVzo9ihtJsVECMXrIyNgISMqOtJfjyfpoI76CN2xk3oaHrEu64isvi1KeNPgrmdVDWX/ggI/r19uFnHfuJTpd+tUzP++GP0lYdVGFpqhnpfDpARFp4ZzsGFFLmBoz97NyK5Kv9iYTyRlrzDEQwdCPPhDjshJD+b/5cdjvOcOiqnEOXbbRvHgc2yDZIIxxJMpZYJqxT9r+DleU4TzBHw4+cdYojlLAiyirqXRgPWaxHLdgN5n9R1ZzHsVw3IgF3NDVTkSkVDG/KFGQMbtKW8DeLaEVseaoTaAMDYXEgZ3PjU8RgZxn5pw5YAH6ot0xGU0d+tPSXrWlbc+rdSiIGcFMxOckFz0t/IiuVCpt9YiMIkcEn4qt9K7L8dcmU3V2SKbpxmoPUEqJylAP7vI+OLIfUBurIxAF5et15s8dRrQKchHvSU9Ed0lX7f4QjRDXtPmBSyYjy1Ng/soMM8uzsNfuVrcfRiDj39wfBc+78ASCTUaVQZpWc3IVGX7bsDDADo6Q0uFxOjexwqO1HQA34q1Zgv0k9rxlpiZ9kSz4+XjsXOeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199018)(66476007)(36756003)(8936002)(5660300002)(66556008)(26005)(38100700002)(6512007)(6666004)(66574015)(6506007)(83380400001)(186003)(86362001)(31696002)(316002)(41300700001)(2616005)(66946007)(54906003)(8676002)(4326008)(478600001)(6486002)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjFsVk5QaWRWMVRwUGJEYjkzbGxlVXMvNVFQT2p0bW1kNVhjWUJQNDI1L2d0?=
 =?utf-8?B?NUF1T3JUUzRLR1JTV0hrenRGbzN3TGtVZFZ1dWx6ZGlnOXpiZU5NS2hZcmVo?=
 =?utf-8?B?VjVoWlBCU1BONnZMVWtocjJhNWU2QU82aUdUaHpTWmtVQkhHUGF3MW9ZbVZs?=
 =?utf-8?B?aEJKOVpjdDErVEl3MlBRUmNmaGtQdHFhdllYR1lEaXNLS2FLWHUwaENUVVhV?=
 =?utf-8?B?SUY4d1l6VlR0VHlZdmpwOWptYnhlcDJhazhZbXlsZC95WUQvUVU0anNCMDNY?=
 =?utf-8?B?VG9rbE1jeWxhdlBuZ0FPNlVRdlNCK213OC9RejNkbW4rSU9HS1VubUlMdDN6?=
 =?utf-8?B?QjBmQ1ZOdjFDTmRucEg5MWE3UnI2bTJOVmlaZWVsMFJhWU9FYU9IS3BWNzV5?=
 =?utf-8?B?V3NPNUF2WDRNR2Q1NURxNVRKY0ZhM0ZDb0F2Vi9OeDY1ZDhiYTJoNkZ3bE5o?=
 =?utf-8?B?VC96RWl3dVVHS1Uvbkx2c0M4bElhZkVoVFpLaG9kYXE4UzZEQUovNDFEN1Fj?=
 =?utf-8?B?RlRhbG1Wb0lXWlRjdUZmNzkwOGZ6STlIaEtod2VKdWU0bXViZW5BYThhc3Qz?=
 =?utf-8?B?WnBFVVlpenVERmlxZmpoKy9EOFA3MElDRUhGZHpuRCtzazB5OXNvcFB1b0xp?=
 =?utf-8?B?OUJUbkc3K2pqSEJ5YldvRDY1SzljK3VCQjZldmQ1QUREL0dxM1Y3RmFhTzhv?=
 =?utf-8?B?Z1RmVnlNQ1BuM2VaaFVwYTlXempoV0lWU2FZZGovWE92eVNQd003OFlYb0ZC?=
 =?utf-8?B?bXpPVVk1YkF0UTdkemlxUDg3MGdJVUFtSFpqemlnejNvalU4VFpsd0JTb1hI?=
 =?utf-8?B?R3l5WEx2QURxQjd6MFVNbEl2bzlmMlNWWERrQWFNMnk1OC9DekV2bSs4b2d2?=
 =?utf-8?B?WkFkSkRmcFNVME55R0RQc3VpU2N4bXkzN3Y0V2NadGZwaVgyTFk2enRxNGZq?=
 =?utf-8?B?OGhwWVQzYnB5REdjU2dVUFFiTW83TUhyK0IxNS82bVVZWjBVdVR0UTZ3cnBR?=
 =?utf-8?B?cVlJMW9FeTlnT2RCV3MvMUI0MXlnTXpCbG5XeG04a1Z3M0Q4YndVZ2RCNWFS?=
 =?utf-8?B?Y1ljVnNzQlkxMmxqTTY4VWhzNGs3YkNHMXVYenRad2ZWdG9VSXptZUw1cFhh?=
 =?utf-8?B?R2llYjBycnRWWGQ2OXM4aVVNdnloTXFSRmR5eG9aTVJEMldqWUVraDYwaWxk?=
 =?utf-8?B?VndSQWVMT2RTUWtwN1FpT09SbXZDakpEODU2R2VvZGNwNzFZa2R3d0RpNWxP?=
 =?utf-8?B?MzIyWjBoVXMxV2xvZE4wL0N1RElZWjR6YTdHU1JMd09BcXA1TnN1cmFiNHFv?=
 =?utf-8?B?cWFHaUZzUzUyM3JsNXdaeFFocjE3MGNlZExnTEZGdjIxRWZTbXBMcjBiTEcy?=
 =?utf-8?B?TWQ5U2hSb2RUV2J6UjhtRXRxQWthYjdRTXl4RU13Mm5xS3gxUVBRRlEwL0kz?=
 =?utf-8?B?WXVRckc4TXE1Vnk2WGhKT3d2d1ZidFRUdHYrQVBWaG8rUXB3bUhXSGV2d2pa?=
 =?utf-8?B?aWhhZFVpQmtxZUVzMjlMcjRuSk9BZUVQSzdib2Q1K1FzdWtKUG5XYkZ2VzBt?=
 =?utf-8?B?NWdGMzRUYXUyNXVvM09NTitvMnB3L2RPWnN0OWJuZ3F1eWdUS3ppTlZESy8r?=
 =?utf-8?B?RjExVzJuVGVyb0k5SDdzNXJLVG5PV0wrU2VCcEk5TG95b2pEc0ZOSW5jd1FU?=
 =?utf-8?B?d0R5Wm1BVnpuemVhY21TNllYQXpMMXlvZ3BGR01HNXJoRENNL3phU0pyMzM1?=
 =?utf-8?B?dVdYaURHWDNnUzB3M05BdENHWEExRC81WGl4L1lMMGVJR2I3b2ZkWUhsdENl?=
 =?utf-8?B?T050VWt1cDVvSkV4V2VnNjVpbmFOdDdFdjN3aGc5OVJ4aVdVcDNGZVc2TW1E?=
 =?utf-8?B?QTgxM0RBSTBUa1NIU0d1Q0QwY3FUaFAyRDA2eGc5NDRXVFNxY291YytKR3Zi?=
 =?utf-8?B?K3BvaURlZjFjSklSWWFSVWIrM1ROaHNOOU9YR3hVL0xaQWF4b0J6UTF6VEVW?=
 =?utf-8?B?UHdaU25wTzU3R2VyMjFFS1FFcHp5dkN1N1lGK0ZDdUZlYjhnb29qZHZST0hV?=
 =?utf-8?B?STFxcFdzTjdhZkdHT0hvcUN3OWVVR1hQYVhjODZIcm40VGxoK3ZWQThFd2dh?=
 =?utf-8?Q?yIToCpa0AItYbzWDzbvLwDdd7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2449f2a0-e0ce-4691-79d6-08db1aed6c2b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 07:12:02.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTSF5Yxr2WUKxs75jVdQvVIRKGGgjYGrrE3b8t53nGcnlfyLy/WftOoJQZufycTt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.03.23 um 23:29 schrieb Simon Ser:
> We don't populate gem_prime_import_sg_table so only DMA-BUFs
> exported from our own device can be imported. Still, this is useful
> to user-space.

But what happens if one of your BOs is imported into another device?

Regards,
Christian.

>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>   include/drm/drm_gem_vram_helper.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index d3e8920c0b64..f4aab64411d8 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -160,7 +160,9 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
>   	.debugfs_init             = drm_vram_mm_debugfs_init, \
>   	.dumb_create		  = drm_gem_vram_driver_dumb_create, \
>   	.dumb_map_offset	  = drm_gem_ttm_dumb_map_offset, \
> -	.gem_prime_mmap		  = drm_gem_prime_mmap
> +	.gem_prime_mmap		  = drm_gem_prime_mmap, \
> +	.prime_handle_to_fd	  = drm_gem_prime_handle_to_fd, \
> +	.prime_fd_to_handle	  = drm_gem_prime_fd_to_handle
>   
>   /*
>    *  VRAM memory manager

