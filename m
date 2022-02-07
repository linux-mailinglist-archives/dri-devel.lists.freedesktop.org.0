Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966174AC8D5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 19:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8869D10F9F2;
	Mon,  7 Feb 2022 18:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F5210F9E7;
 Mon,  7 Feb 2022 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644259675; x=1675795675;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rTHkTlarC8T6j7KcQqeRk2+fuOvYL35ni67Hg/3ylj8=;
 b=bJD/9J+LcHU8A2hbzf1HR+G76Nminu3Nx1Ya7ySxvNncw54IlqiXP7Zm
 eLHjHFcVJcW0Wlv5Ey7sePNQsoNXD1l3wpwcIXTAey+/jjDUq2GqGfnxl
 yonel2VJGRvnT/V+Lm3/y1UhII8QxihtBSL0Zx9+cRv+w7d1I8MPXFz/J
 slTm48UJH9u55jst7LUDCdVNvg9OC00n3SXoOt3IXjAOrLrUQmEf4K5jT
 2EidN7cLgvGdx7FRwz1QnNQ5rve16XheFDhd4LkvoAfNVPQ7BKJrGrvub
 0O9SFXjnVX+Trl/AmQiPxLs70O04Wpj+LuLFoiBlPHShe30nmwne/Q45W g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="247619534"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="247619534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 10:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="632568914"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 07 Feb 2022 10:47:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 10:47:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 10:47:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 10:47:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 10:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL2iEHTxYMrH6acc5aC4UZJn1rM/wfUxDN860/yTaahln/RKrMeLjCM4Kpm+QZiwMyuc7wI+IxDcYTMTQMwCQ8tZBjuelCUDq9QXfzzKs6jny9wzgppeF5OhDZoB1LsZOS6PM6ws4cb/rl/0OOkAZz6ylHBaVkvs/0i2IzW4iyX1rrpG/erLTxh9gvAQBaPBnPTrCNUCyZQI06gRdv9gQ55iv5Txy0f17/RwPgpJPRS1D/K1X7sHQ3ZaBST2i6nTwVgierwA8qSKvidXrDGFpLZ8Ro7gZyyGWkgbRudjpKyhdU3nnWHHj+8vpTL7Qy0UJ2RFqwqA7K4/5K3L2ybUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucpSBaCO/EaGzzEjUaU9gPd40vEkTK9G8BdV7HPFFig=;
 b=j9qSeDdMBveNi6PGBjRXM3kc69V+/gQdXoqZGOsuNGHX+s1IvCg+mh0tnSV/LIRE3ht+s+38gX7/JkHLEN8b7FSzin5MltKXIG9ikEFDvNgv9SeO2Swk3aYbtCND9yfnS+wMANzHOsC4Y4bRWcueBFIOoO3gkDNRQqFz39XTjasFVmev4h1Dn/FNBu9Cm2VmzlVKxakxh1TSeqm7W3JzvbgdzlNPR7fK01yjGbv0XS7moiHTfQWLsEcyPR/exh8zdZ4IGtSXToNxvuvI1krPU0VU2EOc1yeFHopZ4xH2DRx3QurxAKcnnoNRXxwLtUDBTYTZqAODjfYi6dxNgaCAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 18:47:46 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 18:47:46 +0000
Message-ID: <951853e8-2595-5304-0147-580e0401afea@intel.com>
Date: Mon, 7 Feb 2022 10:47:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/5] drm/i915/gt: Drop invalidate_csb_entries
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220204163711.439403-1-michael.cheng@intel.com>
 <20220204163711.439403-3-michael.cheng@intel.com>
 <9db989f9-5d56-5b17-0075-9bdb0af5d25c@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <9db989f9-5d56-5b17-0075-9bdb0af5d25c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:303:8f::14) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 011fbb73-7a7f-4a9e-3c9c-08d9ea6a54c6
X-MS-TrafficTypeDiagnostic: SA2PR11MB4937:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR11MB49370455BC367A1F8EA5EAAEE12C9@SA2PR11MB4937.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AlzDvs5eWFqe06pTi0sNW413MQXF8ftsBhLfq03BRzj94ylVGRaG6HZyXCKKO3RKomT+eHBnQHNM8gGA1ca1SGgijIvqjzti8z3eteKiqVatlvbNr8Z8H8Y5DR1fntvs8S7NlSGWqqXxesrQ7Qz2xQeU1BXPTw3bLOz1vRzcAGvHNi0RAaYjUas7L1GdBLYm9hkTaDTJrn1lNytoq6NVLwThpR7Ln2jS3BAYWdBgJhhD+lFHJAitWhY9MA6+rtSoe7XI3tVGCjshHIHPc/k/kpPjRAcevaulYwS5OEuvvhNUXLcrWsCGOKlqFdddndpCD5UPK7Ia6DqCZNQ2eXbhVwiMrgZkY0ahRk68lZPSJWW61aWP4y3jrWEVaqxl9k2DjMA4jzP7VBHSl7vWUpAfaUhsDLzbKGiNSmxnqQRG0mfxKbR6S7c144oBq92w+MjQQ2PStEdYP86d0qgc5b0suwhhBMyWes3erWlYAPdPXO8xh8JjW08Mm96zDFFIaYPEijSswe/1gtmYVGL6yMgVbHdyvxeHUKW8qc2QCXumTBZUll/BzoHFVvwOZrVvUU4btk+VK4C8dczdum01/3kwmXR8w5C662fSnM21SEknqhFNmePowuQ4rfTS7cp3L0bb62T+BlR2nuq4bUIlWwaR6JXHj+0PeXQ3PuzzpC7kYbDK0cOgI66Jzyv/p1oopbWNBBPgOXsI9pvHQJNxq9DEajGsFmTv32ZvxOCt5Vmeipk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(4326008)(6512007)(66556008)(66476007)(8936002)(38100700002)(8676002)(316002)(86362001)(31696002)(2906002)(53546011)(6506007)(2616005)(83380400001)(508600001)(6666004)(36756003)(186003)(31686004)(5660300002)(82960400001)(44832011)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFGTnFHZi8xL0JhUW9QWXlJT3czeXF3ZEFWbTBCSUkrY2t6TC9uY1I2OHJz?=
 =?utf-8?B?TXpzSWFTd2p4Z1ljUC94NGsxMkdtMjVzTWgvdndXeEZiNnRJd0ZBdi95QjRj?=
 =?utf-8?B?UEcrMjB6Qzh1S3F0cjJibTFBUzB5cmN4Z2tqNEQ1UzM4V0FjZ1VlV2JiVW82?=
 =?utf-8?B?NitEV0FiaHdRcGFBaTV0dWpnaXBIZFFjNzlaMkFlN1ZsZ0dpSFdLa2ttanpi?=
 =?utf-8?B?VVlDeVR2ZUFsQjVFMllWNk10Zy9YYm00YWR4M0loVlVISGNXakd4ckMzV2Mw?=
 =?utf-8?B?TlhMTC8xQ1FNQkRsSXJITE9JcXZUZmRCWDFiMkdIb3drbUZxWGFUdFdJSFht?=
 =?utf-8?B?STZNNTRENE04eHZaTkViOElGQk5MYWNPaDFlL3FDSFh4Q05PS3hSNkZ1Y3po?=
 =?utf-8?B?TTNPMkx5RkJnb2t5R3U5RXFBN2xaSUhXSUJHbEYzYll4aUpZQlcwOUJYMis4?=
 =?utf-8?B?dGV5WGFuajJsSFlYOFVEbVZxcHNLOGhIRTR4UG1pSFRtWG9NMlZZbkpWKzBt?=
 =?utf-8?B?L3JvVWhwNUpWTWZZUTVvWDUvRldRTjhtN3M1NWJSbTJBNUlSUXZFNXMvTkdJ?=
 =?utf-8?B?MmVraG5hQnc4OHYvcmhGckRiMW8vRy8yaGFoTWIyMUh2a2lmdTlzMEhEM2Y2?=
 =?utf-8?B?WldiOUE1MFUxYkcxazl0SFA3SitWUW5aTnVJcXlPNzlUWTRVRjJReFh1amNW?=
 =?utf-8?B?L1dOdXFiOXRiK2M2WGRaeFRLTTBaVHJPd1U3c3lMUkw4YjRmb0tOWjVQN0Z0?=
 =?utf-8?B?SWUxVUFGNzZhRldpcDVNRDN2L3ZxQTB0bzR0eFdoS1A0cDVzdC96RkFZSUxo?=
 =?utf-8?B?eFlxRm1pWTdNOFJtUXNRZEdBQThiTGFrR1REc21vWkI4VWNPNjJYZlplREcy?=
 =?utf-8?B?RFlucjJTbTkvSkswSGdsdmhIdXpBMW9reGlNUHo0aGNIeTN0YzBJYXVLUWZw?=
 =?utf-8?B?Zm12ZUV3b0hKWXFDTUp2VFFTTURtWmlaK0lBRTFQdWJGaEFaeUFCS2RXbjdZ?=
 =?utf-8?B?YXhMYy8ybzJ2dVNESnNDczZYUWh4eTlxcmRPdDdEaUpsVHoyRnpxKzhQa0lx?=
 =?utf-8?B?QzVFK1J2SDBGSEZhbWVReFNFR21DajhVL2NJdy9xQ1F0VVJYN1lEY3BoQVpy?=
 =?utf-8?B?VEFZY3hPNTFyVitKNE15UGxUekEwcEtFbUVtRFhuMFg2NEVTUzJncHc5cDBC?=
 =?utf-8?B?UnVyT1pVT1FTdndEd0wzd3J2YlZId1VhbThkRk83OU9wclZydnd4RkxqdS9J?=
 =?utf-8?B?OUZlNVpQZFA3a3dGbERMdElxYWRaYWQzeTBla2VRK1QxZmE5OVp3amRob2Mw?=
 =?utf-8?B?UTN6TW82a2lNaGZtdXFiczZwQUFVZVRyK00vbm94NjNjUDhhdGtGUGY1K1lW?=
 =?utf-8?B?MkpjaGhkNzcrUVZRT3JsK04rQ2N6cW9mdVVEVjBkbm85cVF4MTFpVnM3UjNV?=
 =?utf-8?B?SmVURGk1WnFycGhRZmxzTTdCK3hxaHJnQ2hvOHBNZ3NnZWxkY0FrYUJoZ1JZ?=
 =?utf-8?B?dEZkci9mTE1sYXY0UFFjNC9uTEdpVU5DUVo2azkxRVZTUmoxSWhKL0M4WGd6?=
 =?utf-8?B?V1ludG01RlJsWjRPTkRaL2IrOWpoL0JjZXJ2SXJFUzFTRlUxSnp2cUtGRXF5?=
 =?utf-8?B?Slo4YVlxcnlWcWM2SzJ1eGI4SUJIU000anQ5WmU3QjViY0NROS9ubkhVd1R4?=
 =?utf-8?B?cHdqYlVSc2JnRngzYjZac1M1eXhNR2xLeHZUdllwalI5Z0ZQZnlBOTZVamR0?=
 =?utf-8?B?NEd5NnpqWmkxeDR2a0oyQnZhOHdOdjJjQ2dPWmRMdlRETDkydnVyelBFV2Vs?=
 =?utf-8?B?SWtKdDBLYnV4N2FteWUrV0RvcFRxL2Z2ZVBxUUVKb0o1L0hCdUczNmxzS3E5?=
 =?utf-8?B?cXMxdXlqV1JwdFJkYVhRSzNRL1RSSWR1TFZUeVZMa0I2bm0ycUszbjgwN0FS?=
 =?utf-8?B?UEMwcHNLRXhQcWQ3dHA3aERmdzA5VjYyUGxyVmdRRzNNOC92dzFnZ0xMSjZD?=
 =?utf-8?B?T2ZtQ0JoTDhzbC9qK3BuRjlkOU1FYnhyTG1VOHltRDk4TGhxL2lEUGIrTGor?=
 =?utf-8?B?a1d4ZGJTdmVnMHpWWURTNDdtUGI0V3g1amFOb1prWG9abzErUC9FL0xrSW15?=
 =?utf-8?B?Z3pEb3FBV2FwdmFjWVg4WGdHNVFlUTU1NU16L1lEZFZRZzdQSTVTZ1daSXhH?=
 =?utf-8?B?aGZVT2JZc3JDdzNZNGxHeEo4aEdpcmswRWVEdjNUSW9XalFKcXpwVC9zZ1Ir?=
 =?utf-8?Q?3xGL0+PoC9MgpQmRohE8TNr/KINt413BMkOBdrerGU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 011fbb73-7a7f-4a9e-3c9c-08d9ea6a54c6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 18:47:46.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ52JVi9DPeXAXmk6QG+Dl1i5thRuITM4s3lTUNHgmt8B9jtYzsqu3/EbI41LAP/nTJuSFMji+F3PeFMilsFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
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
Cc: casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, wayne.boyer@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, sorry thanks for pointing that out. We did discuss previously. I 
will go ahead and change it.

On 2022-02-07 3:57 a.m., Tvrtko Ursulin wrote:
>
> On 04/02/2022 16:37, Michael Cheng wrote:
>> Drop invalidate_csb_entries and directly call drm_clflush_virt_range.
>> This allows for one less function call, and prevent complier errors when
>> building for non-x86 architectures.
>>
>> v2(Michael Cheng): Drop invalidate_csb_entries function and directly
>>            invoke drm_clflush_virt_range. Thanks to Tvrtko for the
>>            sugguestion.
>>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 9bb7c863172f..7500c06562da 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -1646,12 +1646,6 @@ cancel_port_requests(struct 
>> intel_engine_execlists * const execlists,
>>       return inactive;
>>   }
>>   -static void invalidate_csb_entries(const u64 *first, const u64 *last)
>> -{
>> -    clflush((void *)first);
>> -    clflush((void *)last);
>> -}
>> -
>>   /*
>>    * Starting with Gen12, the status has a new format:
>>    *
>> @@ -1999,7 +1993,7 @@ process_csb(struct intel_engine_cs *engine, 
>> struct i915_request **inactive)
>>        * the wash as hardware, working or not, will need to do the
>>        * invalidation before.
>>        */
>> -    invalidate_csb_entries(&buf[0], &buf[num_entries - 1]);
>> +    drm_clflush_virt_range(&buf[0], num_entries * sizeof(buf[0]));
>>         /*
>>        * We assume that any event reflects a change in context flow
>> @@ -2783,8 +2777,8 @@ static void reset_csb_pointers(struct 
>> intel_engine_cs *engine)
>>         /* Check that the GPU does indeed update the CSB entries! */
>>       memset(execlists->csb_status, -1, (reset_value + 1) * 
>> sizeof(u64));
>> -    invalidate_csb_entries(&execlists->csb_status[0],
>> -                   &execlists->csb_status[reset_value]);
>> +    drm_clflush_virt_range(&execlists->csb_status[0],
>> + sizeof(&execlists->csb_status[reset_value]));
>
> Hm I thought we covered this already, should be:
>
> drm_clflush_virt_range(&execlists->csb_status[0],
>                execlists->csb_size * sizeof(execlists->csb_status[0]));
>
> Regards,
>
> Tvrtko
>
>>         /* Once more for luck and our trusty paranoia */
>>       ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
