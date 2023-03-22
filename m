Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD56C588B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D9710E3FB;
	Wed, 22 Mar 2023 21:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181710E3ED;
 Wed, 22 Mar 2023 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679519363; x=1711055363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r3exn/A83Dr8YxmgtTseXCQQ5XFIwdX6fMgSLaIEnds=;
 b=EY2Mt7mkNpdalfZVSycFfwCw5uSypehD0m3ahcE9eTESz0zh/YRr8UBs
 xxiq8YamK9x+0pCZFVyKySQtE6FrvFocaI+nJGqSiO8Ijp8TEcNDFuwDA
 NDBqGg82Rs3Uk/IFAUOHkZkReEYq4TtANkjzcSOgI8q63CmGRvsouaXM/
 1E1kgmTvt77L/3pyi3X5TGnzkb21FJ/DimTDl6l91ugt2Ntx3s6hCd/BG
 83SX5cjIbEHPt6OgCiRI9+m0JzOpMbiOGzSTKZ2Lp/Sq71ERkgzCWXLL9
 cJ2ufh0xTX9Us4FDRLxn3vwm7+UvKX87c5udJFJpuNw4m1JlB5JCFYbxo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404221935"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="404221935"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 14:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659321796"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="659321796"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 14:09:23 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 14:09:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 14:09:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 14:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5n/0u0ZSmojiE0Of6QgyVfY9WcIokL4xk69Jj3w4nTpmnSMidBvNErs7IvMFn2fc9HAuS/7fE4yMv//aTFzoq/aKh+0NXFAqtm/KIi9qtvuWSXv1822gMoctp4B5InLNqnXk0OjVDmC5iObwV/Izylfy1jjUfAllj62YTFzv15NC53EJrni0MWXmmjVRI0xAabBTaQ/6Upg4Z/JFsDmYZYnJNbEzNkK36TSPtmwlmIGs6gvCc+tjs9kMlOcL+c3I7W9NJ05dkig8FmeVlBL5piWVOESDdQ+PnLIxxrVtBVX6VsGJf0y6Ol8zPY9+prfYRUptxPIH4FchtL6kB4I+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU623tEqEFFdON4hxPsD18I6BNEqShc9W1rY01nWKaQ=;
 b=oHjxves7pfEEsZ/vAY/D2e0zgaQmlr2efpBE2N3+XETM4m52GtkhCap2y+RNaykDysSTFob0yKbpFa1q6xcZfz8pgk1HTCbbDbKFnu3p1VAa4A+bWjm2wDQ5X+9+b55le1L57GMZeRmZT0FYBEV4SN2svS1BokgKuPpoVyK3mAZ3Jjkgddz3ZJQFfX92L4+E5wtW6eSUgVvsL5wkO3ad6zyl8Eh7k5p3gKnG8KN4p4HumR6FVIQE38mxHX9oJHO31i4dIElYzveRkpW4EVH6GC2OO5gxeegPIUZLyf+C/jGx+hUeNUdyYe1JnUPm9uQKI6IXORGMQ56dAKiS6I+x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:09:20 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:09:20 +0000
Message-ID: <28a16fac-60e1-bb3a-0fd4-1cc07a5c4dca@intel.com>
Date: Wed, 22 Mar 2023 14:09:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drm/i915/gsc: implement wa 14015076503
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
 <20230320211039.1513368-2-daniele.ceraolospurio@intel.com>
 <6763dca1-5061-f508-0846-8ef51a7acdc8@intel.com>
 <a9cf94f9-784f-ab30-ec5f-5155ef098dd5@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a9cf94f9-784f-ab30-ec5f-5155ef098dd5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: d729a09e-bccd-4081-9b30-08db2b19b424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MyDypSq1/siHxo+UutJYvu/xtqVGGUorNyfeNBfbL5QYgJsdHR3rbbLoFPX5JLT6R3mNYquOEQUq7vZNQpbx8oH/i4IdvUVpvtJFHf3upgtUStTaGUA3z8uDLgqbpoqnZLCP3PItnHCfryHWNxfED3+nOOWJHIpjEHFqS7iBgG5sfpD2ZRDHz0UTdIcCGi3u02wMorHqGQu8IciAwqmMWUYGw1vo75y8eGAs4sq79w6f+stV7JI4W4P8X66prueXkagsADaSmEofq295DsPY9kGKFA7tVq9FDbobyrR3bqdAK+I1OGvPwdSVzeFVDNV8Fzs27NS8EP0q3zEdc50R9tOOmKmbVWCcAgCMHNkNfyaDP7eChw6Yw7KkoexeOoBGMQgLU6PZlo/GSwxOkivOUYqVLJkdn4vDmO5vP8IbVtbK2VeU0ZAQDHeIwj+1Ha0fCwGudZFH1k2h56ApMnjttbgMh270TJelta7aX0WL3SDQcm8YkVLw5r27iWxsuX0crqPkOMcoHfBdBakgSZHW7l6S/mcHQNlT35gqWe6u9DsTrY9I29YlntgfogiQubNUDVy4AdBgOHQzJelHhcyoau5g7gKkPItRCHDAawidun6gb7ySlrEHGV1Qxy+6wOVBn8XocA/3X4e25dS3Cv+n1shKcCVaiDpq7lWdXrBFOXQWE5y4+IcTVYz1af/Alv/Q8YM84VB5HD/sGbLIUYcMrAQH9hbMPT51H2iK70B/pU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(83380400001)(6506007)(53546011)(6512007)(26005)(186003)(38100700002)(82960400001)(2616005)(41300700001)(450100002)(8936002)(66476007)(66556008)(66946007)(478600001)(86362001)(36756003)(2906002)(316002)(6486002)(31696002)(5660300002)(107886003)(6666004)(4326008)(54906003)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXlpZU9scGJDY2VNSWlsQ3JNeXpUWFhLR2lYRUk5RFVXWVpGVVNhSmpNV3E1?=
 =?utf-8?B?bGhMbHM3T1ZFdGZhaXhUdk5UaVhpakkyQTBkc2g1ZjVMWVQ4REoxOXg3SFBL?=
 =?utf-8?B?Q1RYNGRKeEUwRnMyZmZ1Wlc3aWZNU0NhOUIwYWRVTlhleWxrdlFpUnpEcEp1?=
 =?utf-8?B?NFFKR3U1M1R1T3pDMWJ2WlRmazVIVUNLYXdYalJBb3o1TXFHTDVNZ2pSTi9q?=
 =?utf-8?B?R0dya0JRd2VwcDB5MWg4OHppbXBGZEd0SGs1VGw4N2ZaUm1BdHJkYzZ6bi9l?=
 =?utf-8?B?NHBQN0dJUVA3R2FteWRQWm5WS0lKSS9IeEhCWXBORlFsUTEwSmtpWmhoeFVG?=
 =?utf-8?B?TS9rQ2RPVW11V2g2eDZUNGl3Uldib0VyOU9ZYWNTM3c5RzRUeDJKUjBFWHkr?=
 =?utf-8?B?TjdUWFRCcHpoVDdTWUptcW9yTm80WUwyU3MrVEFSeW9YUVYwN2VjTlNocnE4?=
 =?utf-8?B?VHE0VG9rWklSdDZoUkQweFdZdUVYaTUvcXRWUm9wckJWaUUwTUs5aTA0cWJF?=
 =?utf-8?B?RjF1YW9PazY4MTFIN0xLT1ljTjBRaklTR0JpSUlrY2lxVTJXS1pUcGJwYVcz?=
 =?utf-8?B?Z0R3Tzg5ejRuYzg3aTJha21Rc09JOVhtNzVPOERmME8rNFg3bGx2dTdQY2Zz?=
 =?utf-8?B?ZklkSFNaUjhuVWkrS1FnMmgvRDZiYVBIbGxjcnZNRlU2Z1I5UUpmUk03ZUJ4?=
 =?utf-8?B?Znk5Tk1VYjJrcnRXb056ZmhDS296ZW52NUEvSWxXVWJ6UHE0bjVFU2ZYdjJE?=
 =?utf-8?B?NWJlbnpsMXdPeFlKOUFMR2lzU2ZydXkzWWdIb2x4V1o0dDg2S0hNWDNyVGl2?=
 =?utf-8?B?a1gwZlo1L2ZVQlBYTXFOTExIdmc3MUJ3ZnkrVmdWTWhiaE1uLzZLVjhabnNz?=
 =?utf-8?B?THpTUXZJYkI1TFVRQVBseENZSmNBRWludThkT1ZINzJxMkV2Z0NGQXVEUCts?=
 =?utf-8?B?dEdFc0JSQ1Vvbm14V1lhazltMG9GWW44c05rMHc2YlJzbUtaNU5EWEs5V3ds?=
 =?utf-8?B?STFmbmlWU1UxWDNuMHhEYVhDYzFuaW5rYmVHQzR0cXZ4dUJ3d0x3VVR6MzRO?=
 =?utf-8?B?QnVIQ2dSK3Zwb1k1ZzRhWkVXL29RVEJUelUwejc3NFJnK0dzSFBtK1hRV0xw?=
 =?utf-8?B?clhxMHlRWmM4OWkwa2xuRkp4SXBzd0RpWFZTNzV4MmVnUm9BcHpJNWpJTEY0?=
 =?utf-8?B?YnZiNkFkNjNoVGNGaFRINHF5bm1PN2luRTFuOHh5V2JuajlWeE8rUHRrN3li?=
 =?utf-8?B?TmNBTFE4cmt4dUM2ZXoyM1RZakIyWWxEMElud2ZjMi9rdzZPakxFbzBrL3ZY?=
 =?utf-8?B?UEpzVlgxL3M2K1FyQ3dJUjlRdEcrOHJFODllV2U5REtVQkFPZXpDVkxNdTdT?=
 =?utf-8?B?bzFraC92enFhQWFPM05DWWVMeGpVN2k1S1FqVVpLTmdUU2RvWFZyY2U4WXBH?=
 =?utf-8?B?VnhNWXR1Ny9Yc2I2QUdxTXJITFFNcEVac3NtQjU2MFFERm9EQWpBKy9Zckww?=
 =?utf-8?B?V2lnWVZyVk1nZFBPUmRkbGdDWjFGT3hDMGlYYURRYktDSkZhOEdUZDZsNlRl?=
 =?utf-8?B?blprSThaenhwL1NFNHhvek9HTXJhTHh1UFZsMVVQOFZuT0pjbjVpdVY4YWNK?=
 =?utf-8?B?TFBtYWxvUm4rRmF1SzMrTWMvVTBHQmphRm1mNUlkdU9xd3ArbWdhUlN1Wk5o?=
 =?utf-8?B?emZzakxlN1ppVmdNaloxWFplemRVV2tlc0RZUUs3S1k4clZqa004c09FaFV5?=
 =?utf-8?B?UGs5K3RkT3cvMHhBdWZudS80VDhYVmlwQnllamZpUUJwaG1lcXRtT1E0SXJY?=
 =?utf-8?B?U2w0N2tSL0xtSlMyOTlyRVBmdmhENHphZUhVVVU2RWIrWnpOSjFuOG5xVzJz?=
 =?utf-8?B?bk9EbG01amxQQTFKcUE1MHJCSzJWVHNpMkJtL2dremRLYncwelFxZVk2MnJS?=
 =?utf-8?B?czZoUXkyanozOHNTZzVGZEcrd1VRK2wyelhyL0ZXK0NrMG5FS3R2NWhHZWNT?=
 =?utf-8?B?MUdDczMwazg5djFFa3hhcUw2KzBkV3hSREthVzVNMDNzQ1VxNUFJTHlPQzdn?=
 =?utf-8?B?Y0FVVWhyYTF5WXBnZE5NVnZJalZ3VGF2WFNrRE80WmVOdG9PaUNsM2hBUmZv?=
 =?utf-8?B?cVR5WWMzRGtBNUJobDBGSjRnUXE5dDgzMk5yL0dVeUpBNjJzZzFDbk1OZVEx?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d729a09e-bccd-4081-9b30-08db2b19b424
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:09:20.5156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iXOiOe2xnfrv43YCozEeKvSHAWRRb40mT+x+KHZkewcxgk/GKPLqfzZPv9daK9dxE8mv6Wu8pvWlSeyLvS1JnPLHO8gQqnGEF6RQeIa5tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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
Cc: Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/2023 13:59, Ceraolo Spurio, Daniele wrote:
> On 3/22/2023 12:44 PM, John Harrison wrote:
>> On 3/20/2023 14:10, Daniele Ceraolo Spurio wrote:
>>> The WA states that we need to alert the GSC FW before doing a GSC 
>>> engine
>>> reset and then wait for 200ms. The GuC owns engine reset, so on the 
>>> i915
>>> side we only need to apply this for full GT reset.
>>>
>>> Given that we do full GT resets in the resume paths to cleanup the HW
>>> state and that a long wait in those scenarios would not be acceptable,
>>> a faster path has been introduced where, if the GSC is idle, we try 
>>> first
>>> to individually reset the GuC and all engines except the GSC and 
>>> only fall
>>> back to full reset if that fails.
>> I'm confused. If the code path is a resume then surely all engines 
>> are idle. But, there is presumably a reason why we do a full GT reset 
>> on the resume - because the hardware state is not guaranteed to be 
>> sensible at that point. So how is it safe to skip the GSC reset?
>
> Differently from other engines, the GSCCS only role is to forward the 
> commands to the GSC FW, so it doesn't have any HW outside of the CS 
> itself and therefore it has no state that we don't explicitly re-init 
> on resume or on context switch (LRC or power context). The HW for the 
> GSC uC is managed by the GSC FW so we don't need to care about that. I 
> can add this to the commit message if it makes things clearer
Okay. With a suitable extra comment to explain the above and the comment 
fix below:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
> Daniele
>
>>
>>>
>>> Note: according to the WA specs, if the GSC is idle it should be 
>>> possible
>>> to only wait for the uC wakeup time (~15ms) instead of the whole 200ms.
>>> However, the GSC FW team have mentioned that the wakeup time can change
>>> based on other things going on in the HW and pcode, so a good security
>>> margin would be required. Given that when the GSC is idle we already
>>> skip the wait & reset entirely and that this reduced wait would still
>>> likely be too long to use in resume paths, it's not worth adding 
>>> support
>>> for this reduced wait.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_reset.c     | 77 
>>> +++++++++++++++++++++--
>>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h |  2 +
>>>   drivers/gpu/drm/i915/i915_reg.h           | 14 ++++-
>>>   3 files changed, 86 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> index 2c3463f77e5c..5f75f59122cf 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> @@ -14,6 +14,8 @@
>>>     #include "gt/intel_gt_regs.h"
>>>   +#include "gt/uc/intel_gsc_fw.h"
>>> +
>>>   #include "i915_drv.h"
>>>   #include "i915_file_private.h"
>>>   #include "i915_gpu_error.h"
>>> @@ -695,6 +697,67 @@ static reset_func intel_get_gpu_reset(const 
>>> struct intel_gt *gt)
>>>           return NULL;
>>>   }
>>>   +static int __reset_guc(struct intel_gt *gt)
>>> +{
>>> +    u32 guc_domain =
>>> +        GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : 
>>> GEN9_GRDOM_GUC;
>>> +
>>> +    return gen6_hw_domain_reset(gt, guc_domain);
>>> +}
>>> +
>>> +static bool needs_wa_14015076503(struct intel_gt *gt, 
>>> intel_engine_mask_t engine_mask)
>>> +{
>>> +    if (!IS_METEORLAKE(gt->i915) || !HAS_ENGINE(gt, GSC0))
>>> +        return false;
>>> +
>>> +    if (!__HAS_ENGINE(engine_mask, GSC0))
>>> +        return false;
>>> +
>>> +    return intel_gsc_uc_fw_init_done(&gt->uc.gsc);
>>> +}
>>> +
>>> +static intel_engine_mask_t
>>> +wa_14015076503_start(struct intel_gt *gt, intel_engine_mask_t 
>>> engine_mask, bool first)
>>> +{
>>> +    if (!needs_wa_14015076503(gt, engine_mask))
>>> +        return engine_mask;
>>> +
>>> +    /*
>>> +     * wa_14015076503: if the GSC FW is loaded, we need to alert it 
>>> that
>>> +     * we're going to do a GSC engine reset and then wait for 200ms 
>>> for the
>>> +     * FW to get ready for it. However, if this the first 
>>> ALL_ENGINES reset
>> if this is
>>
>> John.
>>
>>> +     * attempt and the GSC is not busy, we can try to instead reset 
>>> the GuC
>>> +     * and all the other engines individually to avoid the 200ms wait.
>>> +     */
>>> +    if (engine_mask == ALL_ENGINES && first && 
>>> intel_engine_is_idle(gt->engine[GSC0])) {
>>> +        __reset_guc(gt);
>>> +        engine_mask = gt->info.engine_mask & ~BIT(GSC0);
>>> +    } else {
>>> +        intel_uncore_rmw(gt->uncore,
>>> +                 HECI_H_GS1(MTL_GSC_HECI2_BASE),
>>> +                 0, HECI_H_GS1_ER_PREP);
>>> +
>>> +        /* make sure the reset bit is clear when writing the CSR 
>>> reg */
>>> +        intel_uncore_rmw(gt->uncore,
>>> +                 HECI_H_CSR(MTL_GSC_HECI2_BASE),
>>> +                 HECI_H_CSR_RST, HECI_H_CSR_IG);
>>> +        msleep(200);
>>> +    }
>>> +
>>> +    return engine_mask;
>>> +}
>>> +
>>> +static void
>>> +wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t 
>>> engine_mask)
>>> +{
>>> +    if (!needs_wa_14015076503(gt, engine_mask))
>>> +        return;
>>> +
>>> +    intel_uncore_rmw(gt->uncore,
>>> +             HECI_H_GS1(MTL_GSC_HECI2_BASE),
>>> +             HECI_H_GS1_ER_PREP, 0);
>>> +}
>>> +
>>>   int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t 
>>> engine_mask)
>>>   {
>>>       const int retries = engine_mask == ALL_ENGINES ? 
>>> RESET_MAX_RETRIES : 1;
>>> @@ -712,10 +775,16 @@ int __intel_gt_reset(struct intel_gt *gt, 
>>> intel_engine_mask_t engine_mask)
>>>        */
>>>       intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
>>>       for (retry = 0; ret == -ETIMEDOUT && retry < retries; retry++) {
>>> -        GT_TRACE(gt, "engine_mask=%x\n", engine_mask);
>>> +        intel_engine_mask_t reset_mask;
>>> +
>>> +        reset_mask = wa_14015076503_start(gt, engine_mask, !retry);
>>> +
>>> +        GT_TRACE(gt, "engine_mask=%x\n", reset_mask);
>>>           preempt_disable();
>>> -        ret = reset(gt, engine_mask, retry);
>>> +        ret = reset(gt, reset_mask, retry);
>>>           preempt_enable();
>>> +
>>> +        wa_14015076503_end(gt, reset_mask);
>>>       }
>>>       intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>>>   @@ -740,14 +809,12 @@ bool intel_has_reset_engine(const struct 
>>> intel_gt *gt)
>>>     int intel_reset_guc(struct intel_gt *gt)
>>>   {
>>> -    u32 guc_domain =
>>> -        GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : 
>>> GEN9_GRDOM_GUC;
>>>       int ret;
>>>         GEM_BUG_ON(!HAS_GT_UC(gt->i915));
>>>         intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
>>> -    ret = gen6_hw_domain_reset(gt, guc_domain);
>>> +    ret = __reset_guc(gt);
>>>       intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>>>         return ret;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>>> index 4b5dbb44afb4..f4c1106bb2a9 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>>> @@ -9,7 +9,9 @@
>>>   #include <linux/types.h>
>>>     struct intel_gsc_uc;
>>> +struct intel_uncore;
>>>     int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>>>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>>> b/drivers/gpu/drm/i915/i915_reg.h
>>> index d22ffd7a32dc..80e33ede7fac 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>>> @@ -928,8 +928,18 @@
>>>   #define DG1_GSC_HECI2_BASE    0x00259000
>>>   #define DG2_GSC_HECI1_BASE    0x00373000
>>>   #define DG2_GSC_HECI2_BASE    0x00374000
>>> -
>>> -
>>> +#define MTL_GSC_HECI1_BASE    0x00116000
>>> +#define MTL_GSC_HECI2_BASE    0x00117000
>>> +
>>> +#define HECI_H_CSR(base)    _MMIO(base + 0x4)
>>> +#define   HECI_H_CSR_IE        REG_BIT(0)
>>> +#define   HECI_H_CSR_IS        REG_BIT(1)
>>> +#define   HECI_H_CSR_IG        REG_BIT(2)
>>> +#define   HECI_H_CSR_RDY    REG_BIT(3)
>>> +#define   HECI_H_CSR_RST    REG_BIT(4)
>>> +
>>> +#define HECI_H_GS1(base)    _MMIO(base + 0xc4c)
>>> +#define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>>>     #define HSW_GTT_CACHE_EN    _MMIO(0x4024)
>>>   #define   GTT_CACHE_EN_ALL    0xF0007FFF
>>
>

