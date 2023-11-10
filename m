Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F041A7E7640
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 02:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D5810E40A;
	Fri, 10 Nov 2023 01:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ABD10E40A;
 Fri, 10 Nov 2023 01:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699578130; x=1731114130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=REThEcvhM5HDC7PuPeFd7EOOrSoNQMgdfXy9dQCj95Q=;
 b=ZgW7gpuNkVopPWMqPB0L+zs3kN8gddFTmeGvucq7fCxLse14+RP/axi8
 ftlxBD6ql+W56ASSjnoMB0ARoHqswevsa9yqyDAZ8/BF2Bi4M6FXLAvDC
 TpuTaoKAfHpYo8a0sxSepxdsr/3gEhF69j/cAOWEzVS/Lqn1Ee33Nb0hF
 QjMAtf0uxNtFly4vBgegISxvdYWnppDWJnDlSSrpuAVkRAeKgk5RkwerZ
 OQvepyF9QpKP2WdXJ2e2IHN5gFPL276hshZYNGnKGghMHLKNDUj+3ZxRp
 trGacwbstfeuTz27pKR6Or5G2RINoWEGI33pwqmeLY2Se+TR+jJ7QHIy4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454410691"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="454410691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 17:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713497824"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="713497824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 17:02:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 17:02:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 17:02:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 17:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2BQ9/yV5gX3Hf2A7fJYnFRTkyQ4ewChVH78afcGVz+RIc4l7KaRG3VSq+oNubSSmhyRpj/uoEgVsDIsnmAt08C4SD65dnD9GjP5L32dljANOcoJOu5a5if2l1S9r8thL6xUKsB+QdIoa6FuvXXgTNWRhH3ez+v/YEo2u4bhVwgBNxn8Mbtv3OHv3F0u92ktBGqD+H7frCpJ+3I2CuN8fMMpYM+tR+QVO/FHisNjZwBlJ6O/1sqIzX1IbEIH6pIwo7WR9shHtYiEqcO/bAdyNAjQRKpZXO37WhJjrfBu+Kfu4EOKl9NXsgGB70mi8iJe7hWYgKvnKFUrVtBTyxaNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa4dTMwLMPfLASQ+25d1fuk4torS/3/cKRNmpAN1vdw=;
 b=HDurd4tx5RXTI2NKwh5mzFNBLJdykjaWeRpLb+3AOsBB01bePCc0EjioDqojBxvFXKX+PicEinxz7jSkB99RK3u9eihqba+C4mglqt1mek/Wo145gBcEu+MN1XrCYD3EP/zyDP8Z8qVmGG+a+41uK75tB2Ydfjq3zp6eq4E8HGSzc6JhFXhKN1/RbHbTpa3Z8JhOEgW2bS95g5/yveLb+QYuzzOBUVTlXWw/TmfqvNqepEMTrLRrOqChobob+4yp+6Wb1Ygzg7DQNtvoOoabwjeyiH45BDonMIgYx/PUJau/z29lJ268TFUQqiDuMhgcgCX0IvAkF6jj6tcwyAe3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CO6PR11MB5618.namprd11.prod.outlook.com (2603:10b6:303:13f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 01:02:02 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%6]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 01:02:02 +0000
Message-ID: <90c346b6-c335-4757-96e1-98eafdf9ef42@intel.com>
Date: Thu, 9 Nov 2023 17:02:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Read a shadowed mmio register for
 ggtt flush
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
 <ZU0zYaFkpZJoUcZE@intel.com> <72f09667-24d5-403a-ba9a-3465c681fec3@intel.com>
 <ZU1CgB5XaO9VsBHJ@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZU1CgB5XaO9VsBHJ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::37) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CO6PR11MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 6687b8c4-3211-48d5-497c-08dbe188a62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L+b1CyyZo2Ts8yl7Pgf9B7PyiEh7NP3xIUiMQK67wj2lsTkKi+oweUAgEFgt2G+thbqEgaYR5qcGdB45Tu3GD9z8z2PcsE/fZ1gdpampuw0EKsZofActo/xB3nBsGNC1uFw5r6vayJLC68XdLSEVMoMKvAcrExpxQrFKtidnfIQBJRXMpOpwzCsjOEA0x8ncyLPhH3F9YN8VCgdgaIEwlnRLmpxNpbPiBhlxnigMMqx2E6RFA12JyOwBjG/cmajyKpafryKGDsQmj5zJJrdyicel6oOi0ZGZc8s4u2dHYiJSISy1Far9TxCfcPVf24JlFkOJDKUD61zq3gCnErzvw2xefCd/yzYH5PCTff4gWnALLd6+QKu1Itpqt/PAteWE8Heo7W9C4CancPnJihcAROEWVhy6N72fDKK5ImT9vzvqvpg9eLmC3M1ZC3TRlWP4Wkb8lfolYCsSDmYSEg5PxEifv46ewRNZKoWAae9W64uJ0h8+YUHRQRHj3uETcN+/qmPFrDJonTtO9J0Pt1w4xB0DgLgGlOvi1sgPSIWbOXjC5CPkH4zqEYAJDyvq15c//9ChmVGp9SK49X5oa7KrvgWZDwu9rMBJMmHCgbg/ZWPFRx2km1jMd0x0QKwnY74b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(36756003)(5660300002)(2906002)(38100700002)(31696002)(6506007)(6512007)(53546011)(41300700001)(31686004)(86362001)(66574015)(8936002)(4326008)(83380400001)(8676002)(66476007)(66946007)(2616005)(66556008)(316002)(6916009)(966005)(82960400001)(26005)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUVFTE5FVGpzdWpETkl1NnRwL3krK1RjOGNEWDVocjcyZ0dIdmRXV25kNzRL?=
 =?utf-8?B?TDd3a2JtekhpcXFWZERaMnNuM05aZmVOQXl5b1ZKYkVwZjc2bUowY1prVVJJ?=
 =?utf-8?B?MFBSL0haTVJLVWw2MTlRNmkxUHplSVdBbTNNT2xSUjUxM2lnRklGd0gwZHRY?=
 =?utf-8?B?Y3R2elFUUThkY3BJVW5YblRYMHBkdnBIZzVMMG83eTFzMUxYd1czQUo4NDFI?=
 =?utf-8?B?Vjg0YklmcEU2UEFsUk1pMGMxU3YxTytvTjUxRzBXaFgxSUJhYnJNdUFKSU5G?=
 =?utf-8?B?TVJaVE5jYy9YZGJxTzJnSUJDcHRnQmJFdk1kU0lWWXNYbjUxTmtaelBEOHFI?=
 =?utf-8?B?ME1yMkl0UjFGazRQVFAwa01GVURjNjg0eTdsRjhDM2gyOHhvVVd2TllvSU5F?=
 =?utf-8?B?VHhNamdWSnhablk2MCs1MSszVmRpUGN4L0FGd3JtTmFxV1FGUzRtd1IyVHZu?=
 =?utf-8?B?K0ZES25DVW01K2pkQ3FLZkhxK2prSU5LdlN1cmdNdHFRb1dGQ013SUYwMUJp?=
 =?utf-8?B?bHpJSjc0TThTbHNzK1VmTHZKdENOL2VqUXpPU1VFTXBsc2hsbWVvckl2T2t5?=
 =?utf-8?B?SHhvNzYrR1R0M01oRnduSndqdkdhb3gzdE5EQmF2VStwMC9TamIvd0Y1c2JM?=
 =?utf-8?B?ejlnU0F1cXYwK0UyNHNZUU1xeFZMTG54MTJFaEJqS2thLzBCSDZVYk1Sb3Bu?=
 =?utf-8?B?bDBRZk5tWTJrZVBEOWdRQ0U0R21rY1F3bk5vUVA1MzFxQkpjZkNtekFENlht?=
 =?utf-8?B?QVdaNlNaQmtvUFdRdS9lUzVkRHVQUkhtQjJHaVpGalkwc1RldE5FbHI4d2xj?=
 =?utf-8?B?R1ZjeTJHT1FTMDEvL2FIMzZ6N3hRUDY5eDdWQWlOaEdNbDlza0hOTWZHQ1Fv?=
 =?utf-8?B?V1VkRlc5VW9FQ29QOGpUcXB6SExyNEt2dXl0aS9zTmp1S3dIa0o5RldibXAx?=
 =?utf-8?B?alorSjhMY21NQ3ZqRnhsQ2NXNDdIUmhIOFN3N2VoeFFqWU5zcWl3aTYrZ0tC?=
 =?utf-8?B?RExrMFFyZFNKdTJhYTJKSEVldzFCNWtpWkpWYmhic3d4Q2ViYU5nTkhNUXpy?=
 =?utf-8?B?d255YmdTbjVHRTRvangzK3FWdUY1RTkwdnhrRWh0bGFBWVpBaFVES2dtNnN2?=
 =?utf-8?B?THUwVUpkcXhPcEo4RzJGS2t0RW9KRDdQU3NRNlNZS2VDeDhnaXpoKzVVNWdM?=
 =?utf-8?B?bTRXMy9zejNVWWRUa2RsNEc3VzIvazIrNWhUTEhvb0xSaTFCN2U0OTRTNzF2?=
 =?utf-8?B?bzR2TG93SWh4RUplZ3RDZGZBRTgralplOUxpR0lSZDVtVElxTkVGaUF0bTY2?=
 =?utf-8?B?VGExSWhxdkhiK0w0UkNkcTcwazliejhuUmhLNEFEMFNiL1gvcGRMaWhsdHRY?=
 =?utf-8?B?emFBVHVMYkVwc2dOTWhKZjUvc042RE5lZXVVbUppMjRlbER4OUxIdmlMVHBQ?=
 =?utf-8?B?REp1SzkxcnJoS05YeWFGT3hvZjVhOUV0MWJqZGdDUEM3a1JZN3BhK1JVMUo4?=
 =?utf-8?B?YVR6VWF2WWdUY2IrYjhZdTRlY3NMWW10WXpKLzIxd3JjSU1CamtrbTMyVENn?=
 =?utf-8?B?K2ZoODNLZ1ZJQ2dGVXZwUzA2bk9ReFI4Y2NQL3o4YzJFQldjc2h6cHYya0Nv?=
 =?utf-8?B?QU11bzBER0ErcCtQL3Vab0NJbDJlQzMyQlkxVUF3Rm81Y1BnTlZqdjNmRVNJ?=
 =?utf-8?B?bFRNTCtMWXQ0VDA1emxBbEFCNFI3aFAyaldXdVJoOEdJZ0FWTHpkbFRLTGph?=
 =?utf-8?B?azdWZzFpU01qQWhDRkxCQSs5S0NQampaTzlqd2ZnVmwybzJZa1hXK1JKd2Z1?=
 =?utf-8?B?NGFsRTJFR3p2a2VUME1KVmU2SkJlTmVucFFYZTFYbUJFY0NKeGp0WVpuREVQ?=
 =?utf-8?B?VDFKT3oyU3MwYStmRkl6b2NjOGlvUGRnNjJqWUc3VVdndWNETEZIYzJXZEZG?=
 =?utf-8?B?TXcwakMrMzAzaWZXVXd6b2RKYjNNWlRSU3BORFpWZk9ibnVnZE5HcktTMlVQ?=
 =?utf-8?B?SkhzYS9ZRmx0VzQyRDRaY3Jrc2FaQ0w3cGswb2FjVWJha1JsMVgyc2RsWU91?=
 =?utf-8?B?anptcDZkSnFmNkg1alJVS1M2NUdUektuenFNTWh1MlNQMkQxQ04zVHJaRnp2?=
 =?utf-8?B?Tm51bERvcWszZEozU25KKzg4eWFMOE1TVlZENEExZndMN1kxN1JmdEs0K1JT?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6687b8c4-3211-48d5-497c-08dbe188a62a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 01:02:02.3720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/pOVUB07dOCg79IRt2qk3DydIvUlAXE9VKxgr/59Dxgg3lIUBK1hOexFB5Jk/Ea8wk4ln5D4pVas+OWxkdHm8gWEgszkMpBXW3yAgqWIpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5618
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


On 11/9/2023 12:35 PM, Ville Syrjälä wrote:
> On Thu, Nov 09, 2023 at 12:01:26PM -0800, Belgaumkar, Vinay wrote:
>> On 11/9/2023 11:30 AM, Ville Syrjälä wrote:
>>> On Thu, Nov 09, 2023 at 11:21:48AM -0800, Vinay Belgaumkar wrote:
>>>> We read RENDER_HEAD as a part of the flush. If GT is in
>>>> deeper sleep states, this could lead to read errors since we are
>>>> not using a forcewake. Safer to read a shadowed register instead.
>>> IIRC shadowing is only thing for writes, not reads.
>> Sure, but reading from a shadowed register does return the cached value
> Does it? I suppose that would make some sense, but I don't recall that
> ever being stated anywhere. At least before the shadow registers
> existed reads would just give you zeroes when not awake.
>
>> (even though we don't care about the vakue here). When GT is in deeper
>> sleep states, it is better to read a shadowed (cached) value instead of
>> trying to attempt an mmio register read without a force wake anyways.
> So you're saying reads from non-shadowed registers fails somehow
> when not awake? How exactly do they fail? And when reading from
> a shadowed register that failure never happens?

We could hit problems like the one being addressed here - 
https://patchwork.freedesktop.org/series/125356/.  Reading from a 
shadowed register will avoid any needless references(without a wake) to 
the MMIO space. Shouldn't hurt to make this change for all gens IMO.

Thanks,

Vinay.

>
>> Thanks,
>>
>> Vinay.
>>
>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> index ed32bf5b1546..ea814ea5f700 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> @@ -451,7 +451,7 @@ void intel_gt_flush_ggtt_writes(struct intel_gt *gt)
>>>>    
>>>>    		spin_lock_irqsave(&uncore->lock, flags);
>>>>    		intel_uncore_posting_read_fw(uncore,
>>>> -					     RING_HEAD(RENDER_RING_BASE));
>>>> +					     RING_TAIL(RENDER_RING_BASE));
>>>>    		spin_unlock_irqrestore(&uncore->lock, flags);
>>>>    	}
>>>>    }
>>>> -- 
>>>> 2.38.1
