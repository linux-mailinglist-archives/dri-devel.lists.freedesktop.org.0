Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375868A267
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E3D10E0B1;
	Fri,  3 Feb 2023 19:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FE610E0B1;
 Fri,  3 Feb 2023 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675450870; x=1706986870;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D53zL1aANm7/wfazGQUExaxeEKmzbFxXIMKUVB+IWuA=;
 b=NhBPMQiYieSpUk+LqQ+fNuaQ5rFSxGgM0l7BpQrU0uYmNpQQri36v9pR
 PUieenb37t3ax8zqK7VP2ReKUol8T7TMmn4TgS7x+jzb02Pk3i+m71pWp
 8hig88a1s1bbyraFqgGAVCk6ZvGzT8R6ay/1i036K95Mu2c3c3w7AHof5
 3hhWVNhoMyqnHTSVHOM8z8ZyyexfKoVT/A41Lp3kS6jmrM/BiNI+86g9E
 UPU1qR6LpJfIU53ksaEYLLW3aOR7hQPRfxUIv3yIpL+Z4p0lTuyKFmStE
 JEgC+T21aI8DDd2TjFpDCD/ufSjbaSr39927ejDgekopja/cHni3wdZuo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393416734"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="393416734"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 11:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659190300"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="659190300"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 03 Feb 2023 11:01:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 11:01:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 11:01:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 11:01:08 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 11:01:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKHV26iSFgtqkBp+QbeWHAI8INgW50Od6dSGEteFh8EoaKg2RdOy9T2m2STIGXsx1XtrOn58zqSrpaA8lcFB4DBQab7NUQovo/Pr6bmlQYieARmKHxV+nOtQu1iAfehGwWmxEwV5CGIEioa5XMov8EFih5iZ8uojfA6LgZU9obL7015fjz6lSlt9rnL7h8IT4SnHrY6o7ZHSa3KSdhwqmVkMKZHGiJVvQptRdjYSfoK7SwVNXI+BYjd7WsaN/jfRjy95OyTJbjkWSl24EngiekwlBW4DzG7DAp+bfZqntuB6gOYHOEfjr+QA27j+b8nG/jXHtZNJy0HUf+jZzjuAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rrFlUn2A8AITIKPir4+gyA5216WBEVtKsKJIwNMqJY=;
 b=g/gbtUDZSBpHS42EKHPd50oEQVCcsIsSc4aPQfOP2uXB1SfZv1SM1rz8+/hRFY2FjgM0eQJmGnft0363r4YwmsaXjtez2sX1d7ksBzkZkE5n/DaawtMByOj2xSdPZ+cpKghrYIkSe5pIk0sUWiAdW1Let0S/hGdEJlj06a3SXmHbX+Jo66RI/72PjedBkJZ/xKhGb0YmKGeh8NJNjfS2sjGuOa4e48Rzs8/RWiVPn5XLcS13uDMy88J5ZVxTxiaeZg09Qg6jFXnAssorwVq3J6fbzbliKSEJer/iwPMOiTMt0vaYx+AfFULLedEzXEDL8RzLxWmE6jEw+Pfar9wiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 19:01:01 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f%6]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 19:01:01 +0000
Message-ID: <d1808d5c-dd89-4395-e038-de93fa96cf2e@intel.com>
Date: Fri, 3 Feb 2023 20:00:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915: Make sure dsm_size has correct granularity
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230202180243.23637-1-nirmoy.das@intel.com>
 <20230203185625.zdihasbypgb2jb76@ldmartin-desk2>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20230203185625.zdihasbypgb2jb76@ldmartin-desk2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 725015b9-fd53-4fa5-0532-08db0618fded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbM0TDoS18DejFY1TUvKYFoknYb6Jf1CgAceWFVDgPVUneiKg+5iw3wBzh05MnRr3tzYz3HE9pnKsfXdYisnWKSEEmiCybNd5wALFcIBZDi/zkXEtWZyDtgY673nTEDL7u5abVMzaUzdoq+FYUpKHr6Txm8MG4qHImA4X3bPswsQLSSZJD6LHXAAh6kRPBxte8ZQg0Cmw363eVOW7r9L8dvU433X9EPtQpPgOPvEMsjqDXRm5o7zz+Iuj8D9cadb7irLlw5WpVYLq4GOV/VbhrwXV826+8kAEcCzZSwdJ/0xYQ9X7av3niqlA70LxYqQE2zdPQqWJ9kBQvBCh7T18vo3ZBsJFhtNpIYXX+z4nZZmoSAoORTkx90WoTKLZRVu98Ra6zjzTeDVLpfIQwOXKOQRaPjEkLEp7Hf3/R+FFQnkIJswFkT1eABmRWiWDm4pCY28xOalT5ApMjWZ4dOUIjbYfZA9JaytsJzpRK9qzWQhDawnTNL/W7UImWE1SuxUtSoydOrn/bhrIgf1m27HyCAUcpRAZDXRgDVs1Nc+kBzQ1rKV7wjQOWBO/xrBy7EurrsCSZ8hEtDTHiPDO3sEOVctKPzgxdCmVU+H01GqkUZ28SefRZunf8D0UGqz8/iHIn7mecPS3rTES248DcLlAdaKSksSJO3dXdQWjN4FchALhKMy43iR6AxBkb0BwtjkJuI9aBfmnp5cFT83Qie2P60/ABCp8InSnAszBzvhL9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199018)(2906002)(186003)(31686004)(6512007)(26005)(8936002)(5660300002)(6862004)(36756003)(41300700001)(4326008)(66946007)(8676002)(66476007)(2616005)(83380400001)(66556008)(450100002)(53546011)(86362001)(31696002)(6506007)(6636002)(54906003)(37006003)(316002)(6666004)(82960400001)(38100700002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ZTdGw1dzZCQmxKeFJ2MXRZK21STXU4b0FkQ3BHWVVucEh6VmtaODE4dEpo?=
 =?utf-8?B?OGFGRXcwcFgxL1Y1SGFma2N4aGFIRzhTb0dUWUFONDVONEN6MHlGR2JsOVZE?=
 =?utf-8?B?MjE5ZG1ob3l4eTh4Ri9Jd1ZZYXZnaVB2a1BCZkRLRWlhalluYkJ1cGhCVzBD?=
 =?utf-8?B?OEVYeXNaVHZsd2wwM3l5eG1FcmpYd1BoYmJBY3lhL1V5MWV3eWJTa0J0Y0gy?=
 =?utf-8?B?aE03ZWtObGVYbjYzVG1EWCtMTjdSWnhqN1E2Q0FqRXVrTTNRNEljUzM2Z3Q4?=
 =?utf-8?B?blppYVRBKzBESUhKU3BoWVhUQ3RDc0FWeWhIRnNleUU4SkRBU2tOTWZJK3I2?=
 =?utf-8?B?RHlCVFZTdHFmOXNiM2pqY05Fa25XakxWWG9qODcxM2p2bnNjK1pheWhJcWgw?=
 =?utf-8?B?Njlzd2pTSU81djQ5VXJGZUVTSFo4ams3ekozZlZ6WkhSZHVkQUREV2FBK3Mv?=
 =?utf-8?B?TVFXV0lERGYvTFN2ZUpiQ2s1TXFVMmozN3VPNllNT2wrQXozbGhQOHI2cGlQ?=
 =?utf-8?B?cXczN2VrSnRlWTZVRWFBUFQ4MzRGZ0t6ZDdqNGgxVGw4TEJ4NlBEU0JlZm5w?=
 =?utf-8?B?THhrQVlZWlBGZEpId0tta09oOFh2R0xmNktheTZYMjlVN24xTTBXeFpmVmhh?=
 =?utf-8?B?ZWdKVzNwL3B4L2w3eDJMaXNWeGFTckhLQko5c051TW5OZ0JPVW5zNXpVblpr?=
 =?utf-8?B?RXRWMDIxOXNwQyt0b3RSWUlxTXlGY1RsSTBlamxXRDV5YWFmSVk1ZGVSeXFi?=
 =?utf-8?B?MHh3dmltVVJYSk1HazJId05pU3hBRFVPSUI4Rk9LR1BtNTlab29hQTRROUw0?=
 =?utf-8?B?OU1uSUZGVmRkQzBMZ3NCSmlYU1U0NXhXUXROVmFhWVN0Y0VaNGEyc1p3V0Za?=
 =?utf-8?B?MTRBTWU2eUFCMjdqcTFSeXppbDR2K2x0V3RGQ3U3bE1wSUFvZkNQT2VtTzZZ?=
 =?utf-8?B?NnluVFBaNzlUNlNHVjQwL293cWdhdlhnVXVhUytSeitmSzNzWHlmbVRBTUp2?=
 =?utf-8?B?Tk5wRmFoV0RqVk1oQXhlQTNxM2hvRDN0WWxEMXR0MHpRSUoxQ2Z1WGRxVTVS?=
 =?utf-8?B?Wk5NRVc3RE41WEJBdXpva2xPSEJYMDhkSnZJV0p0eHdRNGtrQm5qaklIbWFw?=
 =?utf-8?B?Nk1JaUd4ZUhzYVhLUmFncldNRWVRU0pXdlp5UjFGVGgzT1hwYWIyV3ZJc1ZB?=
 =?utf-8?B?czF2SUtXOW9KbXJzektyVVJLTk5TUzdkTzBMVU9BeVA3eEJ3aFVnTzYvdWxR?=
 =?utf-8?B?amhUcFdDTm9rckdTUU1rOTRKMGJQL3FvdHdHLys4aGV2VzE2b0x2dGlML1Zi?=
 =?utf-8?B?VlVJcUVvdWExM3NRYno4UWJnU2JIRnFRY2JjeEoyTUlDMW0vNGc0SG9IeG1m?=
 =?utf-8?B?cCtaV01VMmFzNUc3U2pIVkZhcGcvUm5rQ3U4MEpIcHdBTlo0Q2NwMnBQUXpj?=
 =?utf-8?B?WWdYbjMrZmpaQUFkQzhQZTUyb0MyRzNtMkNFZE9QTzg0bC80bVEvWlhDNmd1?=
 =?utf-8?B?bWU4NjY1TEcwblNWTlIzZ1RnNmpXbUdiV1puYm5tMEtjbUN4VUtDaXVnRmVp?=
 =?utf-8?B?blVGM01hUzFlZ3ErZjJiamdyc1BlaXB6WWtsZnZLa3lMbVk2MWZhcENvTFB2?=
 =?utf-8?B?ZUZWT0ErMGFwY3h5RmRzam94a0JuVmJwR3FTL2RML1FKbHJGWGNHMmVsVG5E?=
 =?utf-8?B?ZEJJSjMvcnl5S29HRUFLUWM4Q1FITitLYlZ2eVFiRXBIYTNrNzRhV2UvUW1G?=
 =?utf-8?B?UjNwZkVTcDJXUzRuQWRERlU0T2hpcFEzV0lSOUx4VkwzVFNTQ1d3VHMzOVl2?=
 =?utf-8?B?dEVTeGRBbkxBK0hqY1RNdTExSDV3WHRDekt6SE1sZjdoTUhkeFFHWEtrekJi?=
 =?utf-8?B?eE80NGI2MWZXdDA5MGJHUVJkNFo5NDVGY3puNnYrS0xpL0VjUWJtZHkzMjBr?=
 =?utf-8?B?eC9PZkxhd0FVU083dzhpLzVZNWd6K0NsKzJ5R3FtdElCMzNpT295WHdPQzlB?=
 =?utf-8?B?MHdnZE5nWWxtRWJXNjViR1llMUlXRUxxbmZZc2VBc2JKK1BaV2p0UGpKeXUw?=
 =?utf-8?B?S2l4WktMd1pPWEp0UFJEQkpLakRiV0RwaXlGcTNKbUhwYmxNRUY5bmZTUldR?=
 =?utf-8?Q?MVltWLsY3c4eIT2CgxHglJ9yX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 725015b9-fd53-4fa5-0532-08db0618fded
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 19:01:01.4707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+2yls3Ba8gvslZ0KiGTqWCIBGRElArXwhwd2qYwpftBYsmjdx87imS7BXirORzmuvA4hw8+xdPys1xZJd0gZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
X-OriginatorOrg: intel.com
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On 2/3/2023 7:56 PM, Lucas De Marchi wrote:
> On Thu, Feb 02, 2023 at 07:02:43PM +0100, Nirmoy Das wrote:
>> DSM granularity is 1MB so make sure we stick to that.
>
> I think we need to be a bit more verbose here, because in future we may
> need to refer to this commit if/when things change (e.g. the granularity
> or the additional size needed on top of DSM).
>
> The issue this is fixing is that the address set by firmware in 
> GEN12_DSMBASE
> and read here doesn't mean "anything above it until the of lmem is 
> part of DSM".
> There may be a few KB that is not part of DSM. How large is that space
> is platform-dependent, but since it's always less than the DSM
> granularity, it can be simplified by simply aligning the size like
> is done here.
>
>>
>> v2: replace "1 * SZ_1M" with SZ_1M (Andrzej).
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Are you ok with me amending the commit message and applying?


Yes, I fine that, thanks for doing that. I agree this is very short 
description that I have wrote.


>
> After this patch I think you can follow the process to request committer
> access.


Looking for to doing that :)


Nirmoy

>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index 90a967374b1a..d8e06e783e30 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -909,7 +909,7 @@ i915_gem_stolen_lmem_setup(struct 
>> drm_i915_private *i915, u16 type,
>>         dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & 
>> GEN12_BDSM_MASK;
>>         if (WARN_ON(lmem_size < dsm_base))
>>             return ERR_PTR(-ENODEV);
>> -        dsm_size = lmem_size - dsm_base;
>> +        dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
>>     }
>>
>>     io_size = dsm_size;
>> -- 
>> 2.39.0
>>
