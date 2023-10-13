Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C37C85CA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151AF10E5F2;
	Fri, 13 Oct 2023 12:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58810E50D;
 Fri, 13 Oct 2023 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697200115; x=1728736115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MNKkPENzI8SK8nc2i5vYoqeUFoGFpcp8NvTA1VtIpTo=;
 b=n293Z/WIj97kARF/QYjfkUNxRe0ZF5iPrpSvPsVWFBzgHgbExdroB2pT
 5gYb201r/Gm2AqFg9iSy8u0RnEVfTdx4InDhyr05IXhDr6Q1h0c/dGbCT
 tdPD/OGeLKZOvGzapgvkvq/y5EfkfO+pF+H/KGnFAM0Z+iuD9a9aCwUmx
 xNzbqHf7bnrqnOTZN49R5H5GdO24dtjKm2ynUbWDv42ek79N3Zymcs2CE
 nOjAOuT+3m9A8dNLGVJi7noN1RBxBS2vggsmtdIdvikWCKcOK9Q8F+q5p
 2OxRDfaDi1vsgaQr35ynHFMVKNMPjq+v4WmxINk+O24d+5lSiuP5GY7pj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382401469"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="382401469"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 05:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704635391"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="704635391"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 05:28:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 05:28:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 05:28:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 05:28:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSG7VRUre2cONV7Nb56t3vI4WiolFztWy0x7gx9dNMqCbPhUFuHPWi2Iwsk2jCBknBZHDJdqQeqaS5Med/QU3li3+Jeea4SCtXMdmQhq7yuVTWpJxNgo/gXYQxusBfAyvuQYFN7Tz2EMu78jAzRIy5G6bUGAwrksniqQfGtpsU2U/+4ZIodazq6v/a2GnUxWeZTnUQVcrQ/msFmf4SmtqXsaVqFu2PBmtdyl77vXTRRHq9UAxfqDl2oCNG0bydTCstKLb02LpAis6DNraA2zJuiBhyGyyko7YlXSAJ7so+SU/MjOt3iokANBaiWX0LNeNhK+TXGUCtslWpV07f9e2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OB0JsITiC5M9Uu2JVod1aBHYUHBCWW9YyXIRcuzbp0=;
 b=jrBFzKawTFgCM611d8vd8QMONzxFMw2BzNS27n3nI4EuXqPvnqBtqzoAswWPpTADSE3yNnWwvdz2aqMrcM1fdAKTweqfryeMBWD77Fh687RpdwO//NSoRd/nQVT0v5OjqHtJtlVC+yowRuhvVZmQJ+JctVZsYeQ1S3jqlu1aBPFG8j+6vsAvtsE2Mf9qHljIzfNTSVyEG+hp5RXUpua7uS70t2dD0H0v9xSwSkZBHVwiaubmIj4CcHEt+iWod2CIZSYSURjFU81PF+eXG3GreFasLybVKTO7ND94PREfrnX6IwKh2cL/jdz3uX7X6IWwxMMK4/thc02+IHZSZYhevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by CH3PR11MB8363.namprd11.prod.outlook.com (2603:10b6:610:177::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 12:28:27 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 12:28:27 +0000
Message-ID: <ae8d62c9-ddfb-8913-6b67-681d9cf70978@intel.com>
Date: Fri, 13 Oct 2023 14:28:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
 <ZSkg47slZ25rSQK4@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZSkg47slZ25rSQK4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|CH3PR11MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cab60f2-2e5d-4f97-2262-08dbcbe7e66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFxw0z7dEksJ2C7osXXGmx5T/dBAN4u+P3Efd5MGSReOiygQmsYBBKb1r/jWK2GnzRFjIcgd+jfixSH4rSWdfZ09rRtm3k3QeLdovVdgMp10gPsty935hLUQ8pidsCUE6EvJqHTG44n6eQ1715hSjfNiLU6XNpakGBL/ghoDif+m4WmPHd6PcwXBHmDq9UQNgYkSHaUt4UF1WCjNECDjs6kJKq09k8jd1Sx5zJ7gfLDV79RLYvxHv/6RjXdByzL7ZnoiLjbB7iLjGPbLZ1ICJcwtInJgDcHKNt4GAL4P5p7L9cOHGFNI1zkJ/VnWtszp3HzMaW3w9Aqt9Q7WbpV2+1LyMXiyGAg+8XvoRoMY+i5LzRQm2L7Pp7YAuc0IMLQ9RzOymoGrSREfhWEJfei0rDNQ5sjVE/Uw17+VjxhYV4/gD+dU/0pmc6oEd2/QbZQenKfSxVgMBRZzv0MxXKu2SHNzpj8PyVa+od6+qxb6xA9kEK0uM0yN3n69zAzJ5GdIj+F5A8BQwWp2jj7P56UbjQQEQUGx7EvKvcWnbXmC1yN1/Q5QyO88PNlrNAmjfF5Zp/zjjfnKScMIev00hSA9vCc0BO2AJbZo5yrncYD7qD6jBNyfEhGqSRn1oKs7TxN0Fxpk69iYQjX3zosY8V5ciQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(36756003)(31686004)(83380400001)(2616005)(66574015)(53546011)(4326008)(8676002)(6506007)(6512007)(478600001)(6486002)(8936002)(6666004)(26005)(41300700001)(2906002)(5660300002)(316002)(82960400001)(31696002)(86362001)(44832011)(66556008)(6916009)(54906003)(66476007)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z29ZSTRacjVFa2EzUjNteVRNak5pWnpDK1NJRTBNOVVEeTdKMjlXdFZJOVpj?=
 =?utf-8?B?ZVRwQVVoMVRxaVFqQ0ZidjlxWlFVWHo4bC92akhVdjdhaXZidTFhejdPU0RX?=
 =?utf-8?B?SzR6NVRmZ3BST1hEYU5IWnZuVWZRSU4vTGVhaVdvbndRMlRHbmZmSHdZamxC?=
 =?utf-8?B?bmllaDVJS2FzNS92Z1JjaEt4d0M3cDMrK3l5cEdBaEo2Ynd2UUJES2NsUnF6?=
 =?utf-8?B?RFphUFlmUGk3bnhvOCtvbFhOWVhhZVdoVjloOXdMdW9hNno5QmJVZ2ZkYlBF?=
 =?utf-8?B?S21mWkFYUEd0Wk14UzRTV3o5dHVkaS9LWjhjd3l5dTZhYzM1SmE1djZXaXBF?=
 =?utf-8?B?akVmZG4ybVhnWGFKSnJSOUE4MXlDNnlPSGNGVDVhMm5JcXpOcTRvZUFQSW9N?=
 =?utf-8?B?WEtEOXI2RDJTcjZ4c0FLS3dIRmJ1RE5XeitKd0pwd1NLYjRJMjdIbW9DRFFH?=
 =?utf-8?B?RUxHUENTQlNDRUVwcUhIWjJmT1l0ZHgwd3JRVEVEUFFvK2dCK2hXejJWWXRq?=
 =?utf-8?B?a1NKd3hhVFlySmxSZENtRnFsbTlNNHVlSFE2TU4yS3FTQVFGYXd6a1dlYVVP?=
 =?utf-8?B?bGxRU0dDdXJxS1drRkVEdncrUEVJSXF1bjdYY1ZxYVhaZEdJeVkrM0d3ZzRN?=
 =?utf-8?B?dFpDRlZpbWxNSi9helhlV1plVjZRV3RjK3V0eGNGczdIdjMrY0JQNk1WSi9i?=
 =?utf-8?B?aENIQklrYjd0cXcvazZNUCtFVnN2L0xNaU9QTmtBb3pkMDZ0QWQ2cXBxcjRm?=
 =?utf-8?B?bDZreS9qNXJ5V1YzZXltbUdKdkdid1pjdzRaWVJ2L2JyOE43dm5udWxLMG1l?=
 =?utf-8?B?ckQwS29VVFdNZUsrQ0Uvd2tLalFuaDVlckxMNE13Tjc1V2graUdHQmJsU1Vw?=
 =?utf-8?B?eGtkYm53UFBrWjQwZTh3eTFEZWVhNHd6Y2QyQWlnRzVaUGhCNUdvTlYxcHJj?=
 =?utf-8?B?WkZFQ3I4SFpncnA1MVgvSkZpd01pRmhPTCtab0RXZjgrdDJOaXpDN0tsbGwy?=
 =?utf-8?B?dFNYdWtzazVLeHlkRWY4V1ZYR0gyMjQrcXBBV3NTZ3V2V3hJL3Z5UXhRRXVh?=
 =?utf-8?B?ZGlpcm0xV0lHNnpjZEp3U0xrckcyRUtscFpwTVJQVjJyMVBYTUZJZXVqUkds?=
 =?utf-8?B?YnVuRitYV2owSkN5TTV2aFE5SjgzMWM1SHltMnN0YVBPZ2wyZExVRkZOUE1S?=
 =?utf-8?B?Z0J0c2JrakpOMFBHamJHeFpmcVczeWVmZnJFdEpjYTZlTldRV3RQSHBBdlJl?=
 =?utf-8?B?b2FuazI0bVlueEhyTHprVVpTdmFKWjAxZW9pdHBKSTdTa0h2Z1pJeEU2NWh4?=
 =?utf-8?B?L3ZEQXlHcWpOSUZteld2WTBvcjdBdlBOU0gxaUxyWVNPQ1BaRTZzLzRzdXNv?=
 =?utf-8?B?bUZua1o5bGx6M2ZqVzNxajQ3RXpOZlNYd1hiM1ZXS1FMcXNhT0N2dURkWi9E?=
 =?utf-8?B?LzBHYitQZnNJWS94Smhkc3Y2VG5MMEpxVmRSeDJqSDQxakVQNW5wSFo3NTc1?=
 =?utf-8?B?RjI3eVFNUUlmL0xQaUp2em4yQ0ZySHRFak02MzJ6WlNGNmUwcVZUczBSdllD?=
 =?utf-8?B?VjZHdm4vVzFnWVA4UldYd21YbUpnWUNpdFBERWlVSVYxY21JTkVqSXVwUnF3?=
 =?utf-8?B?d3Z5cDd4eXpEWVo1VGYzZEVpU0lFcTRYMlJMcWpGYThKWVRRd3ljNEk1Sjg0?=
 =?utf-8?B?VFN4ekEyU0ZlZEJad0R4WTlwSWloZzZBa0dnMGdFRjFkNk0rTldlUHRqcG0w?=
 =?utf-8?B?R0VOUVZkWHlYaGFSUVIxNXZTR3B6OGpOcHN5TGVEOTh4SWF3V2lEaElQTzZs?=
 =?utf-8?B?NEpac1MrMUhySDBKTER5TG1qbUhtOFNOL2VwNWdzMlREV2ZuRHdRcmtGaTh5?=
 =?utf-8?B?dGN3enJpRFhEVWJoSGxqYUNhWlNzdzFxSGM3bmFsZEpPMXRMMml5R3J5SlVH?=
 =?utf-8?B?QU9QaytuNzJSYzdkeW5GRW9BWTRiVDljc2VGQVEwMFlwN0M3WE1MQ2QwKysv?=
 =?utf-8?B?Y3dDSkxNSERWZjQ4V25WR1lXM1NVZ3ZLQjNpRHFLZnZZemVWMThCdEJsRkt5?=
 =?utf-8?B?cmxIeldvZTU4UktvSUNWaDBjQkpZL3Nrbk81L3UzVmNDVjZ5TW11UEhBZTFZ?=
 =?utf-8?Q?qxnwNN19tFwicMy4BYf/irbVn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cab60f2-2e5d-4f97-2262-08dbcbe7e66a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 12:28:27.5248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tHXeEOft8etC/LFtLR3VCCTraRiDgs6UVg99zJ3WUngu+2dWOYN8r2080sfdwo0uQHqZwgds8ZVEPP5umLk2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8363
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, John
 Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On 10/13/2023 12:50 PM, Ville Syrjälä wrote:
> On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
>> gen8_ggtt_invalidate() is only needed for limitted set of platforms
>> where GGTT is mapped as WC
> I know there is supposed to be some kind hw snooping of the ggtt
> pte writes to invalidate the tlb, but are we sure GFX_FLSH_CNTL
> has no other side effects we depend on?

I spent some time searching through the gfxspec. This GFX_FLSH_CNTL 
register only seems to be for

invalidating TLB for GUnit  and (from git log ) we started to do that to 
enable WC based GGTT updates.


So if I am not missing anything obvious then this should be safe.


Regards,

Nirmoy

>
>> otherwise this can cause unwanted
>> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
>> valid.
>>
>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v6.2+
>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 4d7d88b92632..c2858d434bce 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -197,13 +197,17 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>   
>>   static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>   {
>> +	struct drm_i915_private *i915 = ggtt->vm.i915;
>>   	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>   
>>   	/*
>>   	 * Note that as an uncached mmio write, this will flush the
>>   	 * WCB of the writes into the GGTT before it triggers the invalidate.
>> +	 *
>> +	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
>>   	 */
>> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>> +	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
>> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>>   }
>>   
>>   static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>> -- 
>> 2.41.0
