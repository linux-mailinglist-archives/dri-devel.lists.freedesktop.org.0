Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC516E4C27
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1CA10E0ED;
	Mon, 17 Apr 2023 14:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415A10E0ED;
 Mon, 17 Apr 2023 14:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKBZPo1I9/9PcaqcQelHv6fUMycQwpoDJwjI4Vb7LiP5hBgp4qlzzju3DuPFVkjnueOI7drHJgxfc3GCYt60jUk9wEmgiAQaM1+STJei1ncTSCQWKw0V3DI88KwmVl/QlMQvFeF3NhiqPiyOw1zdUVYHZnPmBY3zumW63l0ngNfH0oiik6gnQEg+pRxywFa+Nqps83AWtIGC+jOXBBE92tD+nUiMbn3l91Bj3k7sy+W0CQySmS/66uJStmBPYoo1A3HWtQ2Rhvkjl/lgeDOf+k6piJ6XM9nTwH0eD7X6OzwDgaDlptJF5p2L6suK6U7774TGCXUeaHhMyP4G5lh+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx56JjrkzvKFVZKA7rzj+AuaB5D5bzXH2NWOWBk/uGQ=;
 b=FtG4QdqCrgIvHnLgpi7Mik7cZx54xGqVjw/I31+JM9oIFWrKKiaDEcE+Acwrc3Y2WTn9Bq18hjXIvqRiMb3fwzqohuqsTaStOrXkBZ41aQYwt+i42eBDkE4IDx8LRKSIsfk6BdUBM3PQUt5k+mo4zLY7W7nNaP41H6IIU1z5Xxu8m4qX+uu3zy/D82Q4E7TcRSkV7iFDND0deP8GIXCb2WzTlE9/FEShgvInQzNasqJPmAn0jZrGf7P83TNK+Wv+LlsGl9Q6nuewDnZnlFfJiXwmB4eYKs0QuGi5+hlVGfR3HUQtUuzVBc4srlma/eQXckX7odGnCQQ7AGB8zKWJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx56JjrkzvKFVZKA7rzj+AuaB5D5bzXH2NWOWBk/uGQ=;
 b=4H7+dRwAb3fSuXU+WajBJYtl8EUGEc/yiFahiIhdG+EhHwikIE7bBQOopiuWOjhxQCRwTG0RezzX48L15oNI0DpLmD59ESqLaZ4DmLhmohPuL5M9YPJshFNvnVTCiv/7Cz4hhLAvilc+U71pcNarUGQ4EX5/8q1AjITRMAGmIc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA3PR12MB8000.namprd12.prod.outlook.com (2603:10b6:806:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:58:04 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:58:03 +0000
Message-ID: <a4f39966-c3e8-abef-4058-229dd3773df3@amd.com>
Date: Mon, 17 Apr 2023 10:59:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: set variable dccg314_init
 storage-class-specifier to static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nicholas.kazlauskas@amd.com, Syed.Hassan@amd.com,
 jdhillon@amd.com, alex.hung@amd.com, michael.strauss@amd.com,
 aurabindo.pillai@amd.com
References: <20230415151722.3188010-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230415151722.3188010-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0035.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::17) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA3PR12MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: bacc0ed0-e454-498f-652c-08db3f54252f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50A9umONodvgqRgvcF6+fvbm/OiAOY04ZWeY0DnqgV2mAZBvBCHbdOIy7M8d0hNJvObpFYI/wlNBJ4iCPRNFmwOf8wYBLB6gtGjKhxRvVPZxMUWK4a6BUq7WDps7bM1KbUgsrJ7YeQVampSZef/Ozf47ScExSRumRLfWVFH81nup/ITcdGJcQRTpPepjE304VhbCHKrbc6IUok17gCcvaWpWi53rMtEuL8Kt+3mwHoOfZD3vtOLdUA7UAzVvbypL5CyJn1Uksxgj2YMdMmzZj9HUPV8JWX9eIkfBJ2+Jyu9KdNOxusdCbL854qF9vekJmdSxH1PH3BSQtveFkeEdx01G0JjknO3AG5d/Q/iO1zilVn7t8DA18BvWxhfC0u5Eox/iRCT4ITe/wqqFcbTZHRZly1jK9E3Oj7BswrCkpF9Hu6mI2V5WrIQAVvXPLhlanypDwSZqfyeYGKPwa1sm+gL7WVaXYJe0ZlSmbtlfjODMiwH653xVl6mI+7H1hExZzDmr19iXNvSqAIkSz2R6SY0fpuLWTVEcxZvZgE1puKSxFK0qSjM2omi4dBI6hf8IR4tRQB7cUv+90Wlh8TEV3uck09q3p3kKLxJRH0lvlv3Nj7DLRpss/nnriioDRp4m9evC2zLFhub5LHrm/QBpuGJRfhSf3IsLZfqjXd9Lm+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(41300700001)(66476007)(4326008)(6636002)(66946007)(66556008)(921005)(186003)(4744005)(2906002)(36756003)(53546011)(26005)(6512007)(6506007)(86362001)(31696002)(83380400001)(2616005)(31686004)(5660300002)(6486002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3o4K3JVaTRKUWVSUDQ3MkdMVi9RQUJHU0RCVTRWVi9BYVJGc2Rld1ZMTzEz?=
 =?utf-8?B?U1FTR1R2U1JFanUvTnZ1dHlGSmdiNE5CV3NQTEVZbTdrNXJEcXlJNWJEaU16?=
 =?utf-8?B?Tmk3My95R3VsQlV3VXMvT216Tk40N21oTm1EUXBNVzZzT0dpUmxMMmRBTXo2?=
 =?utf-8?B?ckFhZFBGaGpZZUFVNFJZQ2R3cStPMHJNVkdPcE9GZll5Umd6WXpPU1BxaytS?=
 =?utf-8?B?ZzZzZ0tWU01RY3pSMDgxSGJwNXN1d0x3Q2pjTURFUkFwUGtqZmliRjV5YUd2?=
 =?utf-8?B?eUQxZlZrUFhVVWtYeDFXUlFxK3RNdTdmMGY2dlBDYU9qRnBDM1YydVVsaU9q?=
 =?utf-8?B?c28waUJER0NEdEdtMlJNdkQvRmM0YjA5clBGdWVtK3VUdDhUaytuUmNvTFNk?=
 =?utf-8?B?UmN2UkU3TVFtcys5cy9Sbk5zN1hSVENWSGxoYkRZR2Q3K2tIc2hyaVRyTmNk?=
 =?utf-8?B?ZVY2Z3JjbmVVQmVtZ1NWTDVBM1BrcHVYTVpyeFNhZkhPcmdLaVNFWHpLT0Rk?=
 =?utf-8?B?TEptY1FHZ0NZbG9ubndFVDJSQzRZQnh5akR3Yy83Q09sbGR0am9sN0RzdXJF?=
 =?utf-8?B?V1FlMGdBZHpLYkJaT2lLQnBmVHg2OG5GTUk5Qk9Wa0hVWmQ2TnZ2RnUrak1D?=
 =?utf-8?B?M2p6ek1kRmhWcCs2ZnhkMG85a3FRL242cy9CaDRNTmFmWDVndnc5VjlONnpR?=
 =?utf-8?B?SGxyZ0h6ZTJ2K3NacVd6Mi91K2tSOTlYYTkrTGtMbVgwd0crWWptWVZGZEVW?=
 =?utf-8?B?QWpzalVIdGdEYytmUVZ4dnQ4ZnRwMTY5QkxISE5YdU53Q0N2UTMrRVoyK1lj?=
 =?utf-8?B?dUVzM21mN1Q0bUVqMWNFV0cxSTZQSkxDZ3BsS21Da3IvVnJMZVdTRDNsWDIx?=
 =?utf-8?B?elcrYkJZbHg4WlArTWk1MWdzNkc5U0hOSFhIMFBmTUk3dCtQSC93NVhLd0ZY?=
 =?utf-8?B?MHVuTXRYSTBqaFNMdm56SnpPbk9mdFFGclFjeE42N29RSXVSa05CVXRrdnFZ?=
 =?utf-8?B?QTBiOHpVUHgvQlVnZ3FWejVKaVpIWEh5bGRIcmdoK2FZQXNqTGpka0ZOZkRK?=
 =?utf-8?B?QloyRHloT3pHMkhnWWpiZkdCL1E0dGp1RDV0YWtWRFBRa2VacHd2NmY5RVRM?=
 =?utf-8?B?SGYxa1M4MGh4bG5sakNJZURlUEpPRmJXMWtDRGpRM3dsT0tkUlJ0RTYrN0Fm?=
 =?utf-8?B?Wld4WjZKVVpvdDlLcHVWaE92bXA5cHZobTd5RGd3ajhEV1p1bHcybmZCaEFD?=
 =?utf-8?B?SlNCS2lrdWJyd0EzRFBnK0FiaHRJeHhZVnF0Y3BhYU40VC83RkhFNjdiZzJk?=
 =?utf-8?B?alNjaUVlU0dxdWkvK2NCclFnYldVNmxXTDdTZ2tlUDBQb2hWSFhNakMrbjhX?=
 =?utf-8?B?cFVLUlk2UndXWlQrRmhweVl2cFhpRGJuTzdvTUpkT3BnYzVvTi8vWmpybXcw?=
 =?utf-8?B?Y1VaSmRmOXMrRzVueGlyNnY4ZGxXcHlMNG9QdGVTSitSTXljWm1COEFLSHBm?=
 =?utf-8?B?b2pYOWFaVlVrVkFmTWFtNGpQZWRJL3NTU3ppMFVXOWo1TlQyZlpxYzlxRXdm?=
 =?utf-8?B?T1hYWDJXWUFRTVE2NGpFOUFxTEhvcjhyMFNBL09KVVVFUDRKZUQ4T1FPVlN1?=
 =?utf-8?B?dlBrbTBYSklwcTlXV0pPamxPam03cTlSam1VQ1c1WlZhK0wrMnFiKzhLdUJ5?=
 =?utf-8?B?M21WRVJiaTRhTklYQ1J6aEZqa0JOYWw5MnpyZXlnSEg2Vk9MSzgwU3hXRUo5?=
 =?utf-8?B?KzFUYXBrS21xOTI3d0hDZWpKaXk4WCtQbHNPZzBNb3NQVmsrdUZ4YUNwRzB3?=
 =?utf-8?B?d1FROGlmUFVxMmhIUFNVeklBWlBkVGErRXFCcXlRdVFXUGpFSUdZRVRaZmhD?=
 =?utf-8?B?Y0xFS2dLVHh5dmk2K1dTUy92WGg0cFh3VGNYeldkRUg5akE1bXNlS2tMclNB?=
 =?utf-8?B?VVpJcGZvUG5ma3VMYXJZVDd4aFJtYjh2R2tENGxNdC9reHVQblZIckRBVGUx?=
 =?utf-8?B?NTBMeSs4YUtLeGFDWkhBSnBRRU51OXdUWlJrUzFhRjJHYldLWVFIK2NsZUVW?=
 =?utf-8?B?eGw0dERHOHRGV0lNL0toR0FiTjAzdU5PMW5QSnpEYnBtNzhlaWMxODBvc2Ev?=
 =?utf-8?Q?tGYigp8XY4Y3kgS7S7pMiASfH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacc0ed0-e454-498f-652c-08db3f54252f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:58:03.8137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/mba2oXr4GP4NJ9y2gtMh7QH3oOtZXZ8l9A+S5o2hgDRMcO4G/76zuH1pQ7u49q/p8283uH0BjtpA5DeO2okQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8000
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/23 11:17, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6: warning: symbol
>    'dccg314_init' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
> index 6f879265ad9c..de7bfba2c179 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
> @@ -274,7 +274,7 @@ static void dccg314_set_dpstreamclk(
>   	}
>   }
>   
> -void dccg314_init(struct dccg *dccg)
> +static void dccg314_init(struct dccg *dccg)
>   {
>   	int otg_inst;
>   
-- 
Hamza

