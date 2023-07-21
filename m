Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A930175D760
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58CB10E70B;
	Fri, 21 Jul 2023 22:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D0F10E709;
 Fri, 21 Jul 2023 22:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689978108; x=1721514108;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z+5IyyCYXahVdjUVClpzVdJL5WEaqB10uJEOv+sNuuM=;
 b=JxqFNm2xPnQxAJijoK7MG0U+ydEL+Bj6Lf3B71nHPN8aoQCQwbWkzvcT
 k4R9+DUXDwJUMirz8gBo1hZNwEQ3gPmrd8ZytVITlc2IDbtmGyJLSpFXQ
 nSVJ2N7PAFHirP6E6WG2GSwxNKz4AHwptTxPafah1Z3hmy2of+tAXTi+/
 P+BweJo1zbyaZOWBF5iOs5ILhIvpYCVJh2Q0cJvAIi6e2ff9RxgMiOMd7
 IRMbfAEEsQMtK1VogGNFh1qJVwxjuVU+pUAVnbSXVL+idaCmer6HnpzPp
 EgTTsNK6+cLybj3aQLtHoYJxUBtux4wb7wQERkA00kVx+pYWR/Bgj1+6m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433362803"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="433362803"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 15:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760092604"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="760092604"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 21 Jul 2023 15:21:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 15:21:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 15:21:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 15:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh2+vQVTkixQMzrPzdLjk6zPIz2/gzCn5n8fbFG3nRNXc7HaJOGAHJ7gOIovpaaCGNjnqYOzon39LJKSeklXROKx9OxLonR27yt/1OPx9M34GgVjlWIlzQPdclAFPXlmV6AE5lpRPom0K9DEGlPN6XdFmiyachTL/4UwIkcqmnAjxsFCw8E1+fY+HvPzKTUNJmEpsZajYGdns4SWVZlxlw/H4A16FvX+qOV23TQO86BPDBpvJfisA4UK6itTB/x/2jr1kk4aJxMmMiH30SRTc4jD95EjTK2Zpkhe/TuCIktwjkOK/Lk2ZruJolJA8pZdlNrhpCLC+hyDpMsVxfx9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS2i1llOEPPUha46dU3p7EwuJ2vtuM7HgggH8zIV8Rg=;
 b=W7A+0EVCctHN6gmAn4Y34YVXtnavmMVlpeVWmnQVywXhOirTSb97MhCJlnJ+iBBzt5tW5P96Z3GmJoCStd/9BJyulTpYwZxGFMnSBaw+fSMIpmfDQ0EMQ+YzwjZShQir7Ie3rMKux//f+k1ARGIA9FH964Jj4QmOhr41jAcCry1IA68LkAVmfZ14IE7YbQuxom5/O27+3GahIKtA0aZ2XycY6prt4pB+OcDsnMEY42k3pKf3XseEp3Zq2O1btB6RAXaEOI7UyX3bsY6EedNl0ei2Xm/RI/AOf5zmV7BhJ+jus6bvXY0kpBucL12Y7klfTcqZw4npqD/3viLiuuwR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 22:21:44 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::8b4:fdfd:4a61:1e14]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::8b4:fdfd:4a61:1e14%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 22:21:44 +0000
Message-ID: <d425e31f-6b86-3bbf-20bb-dece6f749fa1@intel.com>
Date: Fri, 21 Jul 2023 15:21:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Restore efficient freq
 earlier
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
 <ZLrtcwN1TkUk/yxf@intel.com> <3ba54e32-f1b3-8c31-1135-f6d754269afe@intel.com>
 <ZLr3XJNb2JdXcyvp@intel.com> <d3433b3c-bed2-c42f-7ad7-ceb8e7afc79d@intel.com>
In-Reply-To: <d3433b3c-bed2-c42f-7ad7-ceb8e7afc79d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|IA0PR11MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb17e80-073c-4588-7655-08db8a38dd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSgn7pAcK/z4/FqVr/rIvbbNzvxSvia34aVjpUpf3/7euwVEZ9eXZhhBGqwcc9tpPBzvgqdsyWPr8eZMXT38wgheaIUzdctqe6JR9ObWgPnl3RQ7pfmJJ9PX5cw0aJHizVB3YfGVbgZjZRjdX5o289Z2lg4CHGJyUyAvcpSssjLjqm334eY+UiAsTaM/nBnF2/F8RJ80H2SB5PJq3Jg174ZCyirjqOqmxtwpJDfnipcvA69DOS/xLUtR0wMKQIoij87IHy6MwNTWOsevhlGCTLIva4QAsYd/NOf18yq/nhw9oGL0pUP/w8vpPxuadKit+CcF35Vup8+dovY9ByAOMRXnpRiBzxm/MyFg6E96YufkGXx2kAU3UAYsp3bE3on1eW7mRVbm8FROayP/7oQmnSmGg9T+Rnjhyh17e/3a51IUBd8T1JHVAPuLFHR5+eGfoodU3YXw8JNeRH0thiIJ3MH6Msg1bKO2aVJg2TRgb2TJ712TNXzLDAtMBScVTyRP7mAU00NeVl6NqbP2Ac9MwAcRNIbZsaVImEVU03zZUMHYeNO1Bxe/T6X3iV3SH12joflZkOlAx5q8sTxp5jexvrzH1Z6yhuttsJShZUC37KmTHe3v05B4duwCnA/EgPzpGuDJCm2TTXP29YAfpdU3ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(5660300002)(8676002)(6862004)(8936002)(31686004)(41300700001)(316002)(2906002)(6636002)(66556008)(66946007)(66476007)(450100002)(53546011)(2616005)(6506007)(38100700002)(26005)(86362001)(6512007)(31696002)(37006003)(966005)(6486002)(83380400001)(4326008)(6666004)(82960400001)(36756003)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdITlJUVU5lTXRTWk9NNHM5dGxVMjZKdW5EVDZoSnZQblFYNk5pb2owME9s?=
 =?utf-8?B?eGNVOXFVeFhBdmNQbG9pTzNmbXcwOFJKRmdZSmpaS05XTkorWTdqYXV4RXJO?=
 =?utf-8?B?NmN0d1Q1WnFPWVlsZVQwM0g5bWNDYnY3cnpyT2J1czNXc1hqdlVkQlJzTnkr?=
 =?utf-8?B?Z3FrcTlYOGFNRWZwS3B1Rmlya0VGUncwR1VUSnRGdjNrTXFjWjVhQlE1Mktk?=
 =?utf-8?B?WUxyV2JheE9tYXVBNnk3YzFqK20wb0dOaVIzdnA5by9ZVmUxY2pvbHN1VnZJ?=
 =?utf-8?B?blBCemFTQmQxUURQT0pUdUt4OTliWG0zdHhmaWdzekw4UUpHYVM5a1BPcHM1?=
 =?utf-8?B?ZDgxdFdjeGtmRGRhdEdkWTFNQzF4L1lBR3k5dFA5OUxBQXYyMWhtbHlLejZQ?=
 =?utf-8?B?bGNQZ1p0c3M2TVBieHlQN09Gc2NHRHF6MTlFVDhtVDBmV1R0Zkp1aW01eUha?=
 =?utf-8?B?Y1FTQzlPZVA0SFRKbkhXL2J1Z3FZa2xXZ0EveHV3aEoyL0RkVDVtRVliNHQw?=
 =?utf-8?B?eE43ZkRxb2JjUEYzelMxYmhpb3d1WnZZOXl6WUNpZWRhV2E1MXVIVjVKWjBr?=
 =?utf-8?B?ZWZVVEw1NTMxazIwZCtDYkFRUXE5TWJpVDhwd29OVVF6S21LYTZZcjkzRGNH?=
 =?utf-8?B?b0hkOHZ2M1k3S1BvMEpWSTcxRDFTZ0tQVnpRbHQvOW5SaSsxRzFJSmZ4WUh2?=
 =?utf-8?B?eHBxWEtrWVBlQTc1L0w5cjB2amJSc0JiK3lSQ3pTUERHUWJvaWhSQ0ZxTm53?=
 =?utf-8?B?MXN4Y1grSjRKYnErTlJ1cDRaaVhDMGVwb0E2YjRSUDhmKzI0UXluWTgydUow?=
 =?utf-8?B?OThlUnNaV3piNHVpT0lBOGZCbjhRRFhYYVpBMFBTVGpiNWRvUGtFMGgvSjRG?=
 =?utf-8?B?QjVGOG85YlFhWHovejdpWkE1WlQ2TGRmWXA2YTI4bFFLVXJCaW01c3lBRjQw?=
 =?utf-8?B?Vkk2VEdCeEIxZ1Zzcno4ZlR1czdqNEdtZjhIUU10akI5bUQxeWFCcDQ5TXNH?=
 =?utf-8?B?U1dITnNxamNSbTVFS1M3b0hZNEdFZVh0WGc0bktzOUZCYkJ6WC9DR2JNb0l0?=
 =?utf-8?B?eWNjSytOQXZhNG10YmN3ajFLdERXWkY5L2lRbGk2QTVJVEZUMnNzUHovSlBI?=
 =?utf-8?B?WDI1cllEbytaZmtaRGxkUko4RHAwM2VlY1NZQ3lnck96eEY5bU5MR0xPMS9L?=
 =?utf-8?B?dGp1UUdLYkd0WnJGU092Q3dzcnJqdXY5NjdTZUs0TGRlQjk0eFA2b0JYazFq?=
 =?utf-8?B?dGhqWnkrMW9rWWZIbWJGLzJPbUlmcmtQL3kzNVRPdjFCeDZXVTRFb1VPakJj?=
 =?utf-8?B?UUY0WGFoUGN0emd3R1dTa1JYQlB1OHJ6Y0R6ZzdJZEdHNU5GR1FNbGQ4SExT?=
 =?utf-8?B?OVVTTU0xbHZjL0JHdFVrRWVqN3NaZ2J2YnhPV3M0YUhRdXB3RVRiWDd6cm1v?=
 =?utf-8?B?R3ZyclNRYmFQVGpIWURXc0pWOWhoS3VkaTlqY3Jaait1U01XKzMwVlI3K25B?=
 =?utf-8?B?MXlKbnV4NnAzeGNyS0xVYmJ5azlhd1JRdHFMWi9SMWIrdHJaMWthWDVVeFds?=
 =?utf-8?B?emg4TGNJTHV3Yy95ZzdpZlVBcmMyclRDMWQ5L2QvSzVtUUR5VVFmdTVtV1Zs?=
 =?utf-8?B?ZXFGZHJSUk01TXlNbmxsL3pkL3E1dm9NY1NYVUZWNlRQd2grTEZndjFKM2Nj?=
 =?utf-8?B?cWcyemdELzJRTGVEQU9yRW4xUm44djdJRGVFdlFUNk9KN3gzdTVrQ29zeGFZ?=
 =?utf-8?B?ZXcxUnlxVndZWjJmV2Q2R3VZbDhFbzNNelA1bVp3Vm1TN1l4Z1FBL0pTaHdp?=
 =?utf-8?B?S1NmditOYkxvU2ZSNHgwV1pyc1dsSmVES1drMVVxUUhaZUxCZEw1alVpb1Z6?=
 =?utf-8?B?ZC9NYVRITjNzUU5GVzZxOUYrYTRPY2RTWlRoSUFpVDErb3hXbHE2aTlzV2ty?=
 =?utf-8?B?U1ZOV2lCQXkza0psYklpVG00aHBvdTU3T25CSkhoMjRzWk5PT2wwRTZ0WVZF?=
 =?utf-8?B?OFBVZ0U1NnFZYWw3dEg2cERWcFJtRDdsMUNHUGFCOTQ4dStMSWwyTFVYNVJ2?=
 =?utf-8?B?Ny8zUmxoOUJtc1l3VWZ1MDRoMStEcmpjdFNLd2h6VktrQk80MmlYcVdJWm9p?=
 =?utf-8?B?SkRVenplZ20rN0JSTTA4aUFJc1piTlV6RDJLZWR6VnZ4OS9KOEp5QjJEZy9N?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb17e80-073c-4588-7655-08db8a38dd34
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 22:21:43.8985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2k7DIEoG3ZiLVVOXZe7hn3YUp79sURQtLSBxs2AUwBNLPLucVt04pLTz8a6od/5v7Hdi4nZXjoPewmRScHQ0xbHn1F7JQFDszveTkrvZic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/21/2023 3:08 PM, Belgaumkar, Vinay wrote:
>
> On 7/21/2023 2:23 PM, Rodrigo Vivi wrote:
>> On Fri, Jul 21, 2023 at 01:44:34PM -0700, Belgaumkar, Vinay wrote:
>>> On 7/21/2023 1:41 PM, Rodrigo Vivi wrote:
>>>> On Fri, Jul 21, 2023 at 11:03:49AM -0700, Vinay Belgaumkar wrote:
>>>>> This should be done before the soft min/max frequencies are restored.
>>>>> When we disable the "Ignore efficient frequency" flag, GuC does not
>>>>> actually bring the requested freq down to RPn.
>>>>>
>>>>> Specifically, this scenario-
>>>>>
>>>>> - ignore efficient freq set to true
>>>>> - reduce min to RPn (from efficient)
>>>>> - suspend
>>>>> - resume (includes GuC load, restore soft min/max, restore 
>>>>> efficient freq)
>>>>> - validate min freq has been resored to RPn
>>>>>
>>>>> This will fail if we didn't first restore(disable, in this case) 
>>>>> efficient
>>>>> freq flag before setting the soft min frequency.
>>>> that's strange. so guc is returning the rpe when we request the min 
>>>> freq
>>>> during the soft config?
>>>>
>>>> we could alternatively change the soft config to actually get the min
>>>> and not be tricked by this.
>>>>
>>>> But also the patch below doesn't hurt.
>>>>
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> (Although I'm still curious and want to understand exactly why
>>>> the soft min gets messed up when we don't tell guc to ignore the
>>>> efficient freq beforehand. Please help me to understand.)
>>> The soft min does not get messed up, but GuC keeps requesting RPe 
>>> even after
>>> disabling efficient freq. (unless we manually set min freq to RPn AFTER
>>> disabling efficient).
>> so it looks to me that the right solution would be to ensure that 
>> everytime
>> that we disable the efficient freq we make sure to also set the mim 
>> freq to RPn,
>> no?!
>
> Hmm, may not be applicable every time. What if someone disables 
> efficient frequency while running a workload or with frequency fixed 
> to 800, for example?

I'll take that back, it should not matter. GuC will not change it's 
request just because we switched min lower. I will resend the patch with 
the min setting as well.

Thanks,

Vinay.

>
> Thanks,
>
> Vinay.
>
>>
>>> Thanks,
>>>
>>> Vinay.
>>>
>>>>
>>>>> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
>>>>> Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for 
>>>>> efficient freq")
>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 6 +++---
>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> index ee9f83af7cf6..f16dff7c3185 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> @@ -743,6 +743,9 @@ int intel_guc_slpc_enable(struct 
>>>>> intel_guc_slpc *slpc)
>>>>>        intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
>>>>> +    /* Set cached value of ignore efficient freq */
>>>>> +    intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
>>>>> +
>>>>>        slpc_get_rp_values(slpc);
>>>>>        /* Handle the case where min=max=RPmax */
>>>>> @@ -765,9 +768,6 @@ int intel_guc_slpc_enable(struct 
>>>>> intel_guc_slpc *slpc)
>>>>>        /* Set cached media freq ratio mode */
>>>>>        intel_guc_slpc_set_media_ratio_mode(slpc, 
>>>>> slpc->media_ratio_mode);
>>>>> -    /* Set cached value of ignore efficient freq */
>>>>> -    intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
>>>>> -
>>>>>        return 0;
>>>>>    }
>>>>> -- 
>>>>> 2.38.1
>>>>>
