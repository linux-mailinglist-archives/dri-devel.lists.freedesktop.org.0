Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053C70E04B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D4A10E454;
	Tue, 23 May 2023 15:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9A310E453;
 Tue, 23 May 2023 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684855294; x=1716391294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5oOGrCLzv1qTzSOepf/jdzUjR0n9YZaPPW+R68eo7fM=;
 b=HqAwB7ilA94/2whFMIZgafYztGZ3upxft3NFDSHwZ9xvK++xXrQGhUSm
 08X0lU7KiFb5m/b34neP60jFb98p96hvI+l2hdnFEWYtXAt6Yptkt5zYm
 q1ze2qszK1Tx9qaBOODGae4wwgWhbEClLyrs5OO1e9N2wvjdf4u9Y2/qc
 +YJyWVln8Bg1127lfmwN7L0rmRDFpcL475635PJvxP2Vzpgx2Fg9vbNEv
 OjlsVzNkyyaHtCQF4yNDLc6720c7fbo9STiymaEAs/iNakLtxEuR8/5c3
 gFpDcq9OaUakyGapM7d9qeciYq8jm/07eJP683igETkirEcWOi7xm/z80 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342731604"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="342731604"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 08:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="1034108482"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="1034108482"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 23 May 2023 08:21:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 08:21:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 08:21:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 08:21:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 08:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtgaU7m4piWs+FsJLUH7xn7L8c3MnSeAU/LaYth04/3hknClCV+64Doz1x89hw2ODlIxb4oytVi8hnxIlc0w9N4lJWUYA5MbiApxzPtJg3nVfTlY1K5R9czL7YPC3pHyDWHGjNW7n32+EYnDnBNuSAdJ7qzRsEh6OCiRvKKJnYO7vv37HtA+7WJN5CHgDSIWvbpGN/pdPfI7LwrJveayRqa4oudFXm8USH+9CvH70MpQ6j5m4wAKVUrScinbQ+4vK0gNbdBgdvIodhesejAWQuvGpe5bllhz98HwjUwGuVDG2SAzX7wmPDSdgY0I6lGfoRJA2lb/jDKQafGxzMKAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuMiBI/AsFxQZynAYAvHytajrSctcRWPmYB//vUDbEU=;
 b=V3zvddqn/3TFVozWsFFg0kVtrEa9tzmMIbpZqveL6tgGaoLoB/FZeD/OMZXYL1ieDvaLvMUzo1ZrPyYRzH/Dr4C7SdU/V+WzLRp1kHa0aSt0ReGNWHNzbjLNEJ6NXJsQq2e1qt3sfgyWgzIG8/rHGfvqF3PjVKvrcugqbcVlCQ2PojHx/jiJM7/Zf4UmPSU9W2IbVraVm5S8f5Xj28fMjqs563lmy0cfYLWUAsF1V+regFCWbLsmisdiqZCQDNP/Qs8VErzgQk80WVA90oplK/EngKPYMVYPAjSJBCgr7JQqOjibaPPxF71ydz24FGfJeMRuMyxhA/JS6qCCiE1iDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 15:21:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 15:21:30 +0000
Message-ID: <35b5ccc9-95a5-ce54-7db3-e1f78cb96e28@intel.com>
Date: Tue, 23 May 2023 08:21:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/6] drm/i915/uc/gsc: fixes and updates for GSC memory
 allocation
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-3-daniele.ceraolospurio@intel.com>
 <dc45dc7e07ebbbf5a0e40831ba44c206d86cc93a.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <dc45dc7e07ebbbf5a0e40831ba44c206d86cc93a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1d79f9-211d-4fb7-cc0d-08db5ba16218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yAZgqHFjM3+QeBEyJ313RzUQRaAEPcVOD7UilOGUtZ+VC60GiHo4T935wjghD2cebRLRcp1ZA9sHYJXSMk2plmy4ZTyzeg0rsvI3+7iioybCT2B3BklCgeWoxYOUQbJtyhL0SREEbcNkMghaFRdN1qLNGcb8X7XJkRJUgPtJ6R4O9SdAB5z2M1mzT+MQ+Ym8Zsxgib+LC16J3bGzSI0VPzyXKcgdGXDeDZtpdAJl9rd/rOyI0+x2GXeEIUr8Zml1upvAWzrdsCfdVXmy0vstrD5b3vlF4aowHwTLBri/ehN47yt30LbuO3zGrWh3PhSUQp9gE8Ot/5C/oE4FcAJB0+c87G77yJ392m9+qaSykMQMMgW4hiHdobIJwmdhvYsGzq/KLWn6TPXQma6Oi6hjNGH6ndlcfEbP5qI5boVa1YT73xgy1TmOM+6GO1sTkhWSmztQvr2j3Tg/dYsPnpJDfxdgFmEoOY8HKCZWF52QzZquRq9btDbPcDyggFuD4CbEH74N9FFi0HW6rXaI6obOyukX6zYGb/V0XhoBPxpdY/TmmDG3E5LJnhB98EmMvSXtIFpW27GN6qLU4SC9+uAV78WIZgNMCFrSX59rX3DoW/3Gfzft58rgwkO5vB/dkEM1gpoQGq7W+Yyu4L1Q/zTDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(15650500001)(26005)(186003)(53546011)(6512007)(6506007)(82960400001)(38100700002)(107886003)(2616005)(36756003)(83380400001)(2906002)(6486002)(316002)(54906003)(6666004)(110136005)(41300700001)(31686004)(478600001)(31696002)(66946007)(66556008)(66476007)(4326008)(86362001)(450100002)(8936002)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpxRVJXOExzb2NZb2VSc09CZEI2bUdLOWIvUWJVaFVuSjZIVEZteENSeDlN?=
 =?utf-8?B?QUd4RGFqMURCWEljN2dpV2QwT3o0Zi9RdjVUT3FLdDNVTWZiVkppU3V3a01H?=
 =?utf-8?B?RWhVL2tPSisvS25QZW01S0Z3WXFmVjBNc2piMGRERCt6bjhVeWptTFdCUkEr?=
 =?utf-8?B?eVVZUVBuVTV3RDJGSXpnWTVLdEs1QkRYU0IrR2ZrSXJITFVIMWF1bXlFbUpM?=
 =?utf-8?B?MkpWWmU1dDVaWWo4YWpibjc2a0FRMGxieHljQ3dReHdtUWE0dDErcmNQZDVl?=
 =?utf-8?B?OE85aEliQ3IzcGdPL3habXo4RUdzZDlrOFUzVG9rUDc3aVFoRDNPMVpHR1Zl?=
 =?utf-8?B?YkowMCtoVVd3aU8rbEJiTHFBKys0ZEl6VWNvMmlPNDBxclFhSm91c1FpVTNG?=
 =?utf-8?B?UVc0dzhRU1NBc3JIMHcvUDAwRkY3R0NRVFBJckR4b0RyMWRNZGhzejN0SENC?=
 =?utf-8?B?TWVoV28yK25LQ0JoWDNaUWU0SkQreHA0a3NZazUwaU1SRWd2V2pLNmMydmJD?=
 =?utf-8?B?bFQ5UVlmWVpLZzFONFdBVUpjeU5rVkI1bjZ2cUdURDFDWDFkTUtQOHBkME9J?=
 =?utf-8?B?TXZNMll3T3lkOWRrTVJjQkVjZFZnc21NRlpNOUNoRmd2eHN6VElIL0lMRDBo?=
 =?utf-8?B?cWFxRWk5MklNOEcxYlk0aWZRMjN3ODl5bUNkVkVGN3NPTmplanEwaHNjZ3By?=
 =?utf-8?B?WndmOUNXT2FCakM0NHVuZDNFTVJnTWRjZWxFUThISXZmcXRSMU9taStBRmNi?=
 =?utf-8?B?QTNncGVka3JGSEdBN2p0TDB3OUYwdGZwV3ZFN3FOU0hEZXRFekNzUTlKK1dE?=
 =?utf-8?B?a21iN2RqWENLZ0wxMTJERWRMSmhTOVZqYUxqSi9FYlE0ZG5MN0RDSDloRWZJ?=
 =?utf-8?B?M1VJekxIL1J3Rk5oUVBwTGtLZ0s3UmtaNC80UWlDb3dHSElOL3pCS0EvR2R6?=
 =?utf-8?B?RXl2eXIxSDNCT1ZEZzhycERFRUw2VHZYNnJ5NUM3cWJ0Ym1lWWJ6WTVDNWhY?=
 =?utf-8?B?ZTNDa1hTRkRiOUVnaEQ4YjBiSGtFbjFTV0JkZFNJTzR2YmMreFVKQnZMMnc0?=
 =?utf-8?B?SEQ0c1pFODkvTUNDMjIrK2YveG92c1VBYmFvWUZId29vZ3hueHpMV0x5U1Bu?=
 =?utf-8?B?dFRFTDZwVUhNV0ExNUFLZU1tUmJiazI5MzhiR29rVTFvbzNWenRDZjlnamNt?=
 =?utf-8?B?eWhESDFjRUlhckh2dGVvWDFFT0ZTRmVvSTV0NzY2K1ZkZkRIRU0ybFNGWVdh?=
 =?utf-8?B?bHIyR2Znemd2QmtOeVp3R0hpTktWTHQ5d0YvRnI0dU9kbVI5aUhIQys2L0ZT?=
 =?utf-8?B?OEJaeUc5cy9pc2tYU3lQTjF2NnNaYlR3dng4cEpmdVFwUmkvRFQ2TTdDeXlQ?=
 =?utf-8?B?MmpialJZaXFRT1NjOWlnbWlZVEZ5ais3TVVHSG1CdTlHVUE2bm40TzB5UEZl?=
 =?utf-8?B?VE52d2hmZ21FbGI4bFNqU0VSTXZ2QXh2eGpBZ3pCWVFsOXJJcThoVzhLa0Z3?=
 =?utf-8?B?dzdheWQxaFZGSFRUYkNzc1NWYytGQVBCL256VVpzRk10eHN1eUtqeUNiZXV2?=
 =?utf-8?B?RCt2cWc2aWhKR3R6U25KblpEQXNEUEl3Z1F1d1VRTnlSak5vbUtObTM2WWx5?=
 =?utf-8?B?UnorSW5EdXU2TmdKTlE3U1RsMWZBblI0RG5memw2bFBhUnM3cEZGYndNRkQy?=
 =?utf-8?B?UzJtN0VodUtDOEVtVWlSSmNRSzJVRmExSFlDbHdnK2dWTnhYVnNUQjUrcDk5?=
 =?utf-8?B?enU5Z0wxNEx4WEhKSkw1blB4NmpWSGdMTU11VThaZCtIaXdpbGJHeGhtNk1z?=
 =?utf-8?B?aDk4OEkwWWZSSG9EMklnRTlGSjFKZkYzL2p2dDY4VTgyQ3hrdGRIMEZZbU9R?=
 =?utf-8?B?eUJkZDdUN0NXbHdOSnBsZFNHSlJrM3dJcTVrL016Ym1hN3VwMEFzeEYyaDlK?=
 =?utf-8?B?b2E3N1QrcGE1ZjRaUVordnIzRlVwTUZvWDNRLytTd0NCSmtaQTBaL0ZwcGpE?=
 =?utf-8?B?SVl1TGlFdHJSS1JLa3VoNXEySnZEbHdGeVdMbjc2Qmk0VDMyR2hFaUYwb1Fk?=
 =?utf-8?B?YW56ZDRST0VrMERNSEJNbXVtRzJKaVhYSG5ITXB0UE1TL2pUMzQwVktUZkty?=
 =?utf-8?B?Y08yOC9WSHh5c3I2cFdtSlY1U2M4NEtTMjlzTVBhQURNcThEV3ovdFlHZHBw?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1d79f9-211d-4fb7-cc0d-08db5ba16218
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 15:21:29.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5yVMVnU39AtLb9+vqIPn1TAuXEd5nSeRvCpaqt6aB7VEdzR9ffP1YBAJZYGhJxo7/vx7G91aVsvCQE5OdB82cNKcoB5DgxEdrosk6Jfe54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/22/2023 5:13 PM, Teres Alexis, Alan Previn wrote:
> On Fri, 2023-05-05 at 09:04 -0700, Ceraolo Spurio, Daniele wrote:
>> A few fixes/updates are required around the GSC memory allocation and it
>> is easier to do them all at the same time. The changes are as follows:
>
> alan:snip
>
>> @@ -109,38 +110,21 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>>   {
>>   	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>>   	struct drm_i915_private *i915 = gt->i915;
>> -	struct drm_i915_gem_object *obj;
>> -	void *src, *dst;
>> +	void *src;
>
> alan:snip
>
>>   
>> -	memset(dst, 0, obj->base.size);
>> -	memcpy(dst, src, gsc->fw.size);
>> +	memset_io(gsc->local_vaddr, 0, gsc->local->size);
>> +	memcpy_toio(gsc->local_vaddr, src, gsc->fw.size);
> alan: i wonder if it there is benefit to do the memcpy_toio first
> and then do the memset_io but only for the balance of area from
> offset 'gsc->fw.size' for (gsc->local->size - gsc->fw.size) bytes.

I usually always memset first to start from a clean slate, but you're 
right I could flip this.

>
> alan:snip
>
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -130,26 +130,85 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
>>   	}
>>   }
>>   
>> +static int gsc_allocate_and_map_vma(struct intel_gsc_uc *gsc, u32 size)
> alan:snip
>
>> +	obj = i915_gem_object_create_stolen(gt->i915, size);
>> +	if (IS_ERR(obj))
>> +		return PTR_ERR(obj);
>> +
>> +	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0, 0);
> alan: should we be passing in the PIN_MAPPABLE flag into the last param?

No, PIN_MAPPABLE is only for legacy platform that used the aperture BAR 
for stolen mem access via GGTT. MTL doesn't have it and stolen is 
directly accessible via the LMEM BAR (which is actually the same BAR 2, 
but now behaves differently).

>
>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> index a2a0813b8a76..c01286dddbdb 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> @@ -18,6 +18,7 @@ struct intel_gsc_uc {
>>   
>>   	/* GSC-specific additions */
>>   	struct i915_vma *local; /* private memory for GSC usage */
>> +	void __iomem *local_vaddr; /* pointer to access the private memory */
> alan:nit: relooking at the these variable names that originate from
> last year's patch you worked on introducing gsc_uc, i am wondering now
> if we should rename "local" to "privmem" and local_vaddr becomes privmem_vaddr.
> (no significant reason other than improving readibility of the code)

IIRC I used local because one of the GSC docs referred to it that way. I 
don't mind the renaming, but I don't think it should be done as part of 
this patch.

Daniele

>

