Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0153F580ECC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 10:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C2A10E880;
	Tue, 26 Jul 2022 08:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE510E92C;
 Tue, 26 Jul 2022 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658823688; x=1690359688;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ykCKd0jhjV1+SHYcP5alACCTlGgJLaiw61seKr3bN9s=;
 b=GGfC94SwURHsNQckgytQpfW50Nbia208+22cWz/vU1AS9a07EeP5DK6Z
 crJMBGNwzWENdqRVBONHx5outwGKTIOa27Nku/mIqOfAhuezPaYDK04JJ
 b089bJkG8QqEdUvl5LfeFvINWnxCde9qkyDYhEx2Zz5/nkuJzM/FMzLr2
 VJ0EJLpZzh4+fFk4oC1swnUkul8gA4s/rna8z9SJiTiFEPDwaKfZkTaUR
 rrZQTm568qFK7WWA/GJdGmsduWZlXVaUAejLgRwayOfyBcRuTc3NlENwv
 qM2EzhJ2Wavjblwe6ZhbYGjbfxKGeM4KHx0oTDDEfymP1yLYcV8EXIOem w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267662911"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267662911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 01:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="575396915"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2022 01:21:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 01:21:26 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 01:21:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 01:21:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 26 Jul 2022 01:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIMvef8BhIQ88bqp8mWEykXr95HigjgloBGo6tiMtpulwZXuPtE9lpVAEPREsiAHf7TOU58VuGReEZPWB3fRlvfU7KWL0EwgW4NPO9q3Zhpya7PJKxmBaQDZS+x41TQtrNnOfusWUnrM76uQAIB77RWiMesI7DUYJ4jYpa0bOznMQFN+obKDc5cv/2QF4OYib3KR8TwDD5xHAvrtLleJOYKHwKl1f+tPmsz1e7fY4j9QlI4C3IsbB4lt5A77atUVZB0NLvG7qtE/MqM8CfJuUJZcTMhv+ciczXKu0+k6xc7dmQ7i6t9JRnXfRoSX2SbROVnJOvajRdjM/H4E7fHEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN9PNsLYKv0er6XI4QLZsPh6HYNfjdVXPTJAuExtPk8=;
 b=OLovProaUiI4e+Kj6KYvpawE86Yjp8U+RV6OokLSpfJ0SGaQ12Diz6baA8/HRMknqSVlPet+jn/e78UhamkVkVZtCPwtgtB59GEKxoNksKgon1TjbEAdC5laNgPdNcTtkIG+Hb6R3kPY+RJA5AzwxJPO4kN/pSjgkf+hNVF7QR0R16YL3aZ6itao1r57GDqhXMSh9wTRPwegOWiWqTOzQBb6T6awc2ugI3Kegfh7BuhrA1LptcFWG4xyW7A4X9Uv2y3f6srho3lJIdPBVwUyXNtxlrhkwvpxIbdzqqsAMv6J1Sddmi4+7U5zbmQLVC10AhgGPFILSFrBVzIXqCwJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM5PR11MB1962.namprd11.prod.outlook.com (2603:10b6:3:10c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 08:21:24 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 08:21:23 +0000
Message-ID: <0c6c5424-09d7-e4e7-eee1-84b56e31b278@intel.com>
Date: Tue, 26 Jul 2022 11:20:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm: Move and add a few utility macros
 into drm util header
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
 <9c20e45e-1b51-68b9-7a23-a651ac59a2f7@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <9c20e45e-1b51-68b9-7a23-a651ac59a2f7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::16) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e70ad06-706e-42da-f955-08da6edfd3b4
X-MS-TrafficTypeDiagnostic: DM5PR11MB1962:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WE1CkmtqK/4ds+GqWJUeBj10T1YwZ3F1czua4lDN3gKq7s2VunU/WlrLCKUwPG/RekXgIEhZf3UGULUNvQSYjGaV8SM980Gt6VllVgbutAsgUJSOLCscDNpyXk3CsDxTDlAZJ+PVd1tOl1geTVJ6pW8FySmScXB4uRXsJz19tBlzk5EN4ZPVx5BefdC6c3RcnWmVRP1hYtGhE1iIcfkeRohwqtOX66e5mcAV7nKRrWqdEsSBkQ0AGnfhSYIb1Cyoz1PVZnbBY23F41PP+fqnEmxHfrFCKvuTcU57v7rLUeS2vJbvMi+1FCPenE5HCRdzK+mmOXscDhgtJMd+lVGgUI5OqbVfRRee9E5UhX4J5UchHgV6pnXfpu9zaz2e40VNEgyQMUCNnHu9KOduVuBvr4RKUlCQUdV1NIb5vys5H2Zt8ZkTYGnEbE99kXZ4BnVdcnAOAaWnP+UUgW7GHkcL0Gqijs5l6/xJxz9wUHEhcimAxsnmz0nkcZ/8j+mwCGw2w2UGvHWc36G4PmaTgDfPk3/Q8nlB1qb2aJaLWxUoOusJWa5C1KDw5vIp6xKT85EABKcG6nknCI2SEZOJGOs+iqHdyJx/r69AL3fOLhJ0d2w0DrxYx9txZUeeFfeJ/ILz6t8ZiStFoOf/yR2Qtle2XDvI4NfVuIjTFP+iKdje7zAHmTls69SK9bqxtjXK9z6Bi2xjl/dSkajQFYK3bq+UjPEgqYYsbq4hgz5pe6//aZK+zqQaq0m2+KQl4I1DGFKa98LrtVdjG0pIEoo6kniaWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39860400002)(966005)(6486002)(38100700002)(478600001)(8676002)(66574015)(66946007)(66476007)(66556008)(5660300002)(8936002)(4326008)(83380400001)(82960400001)(53546011)(6506007)(26005)(6512007)(186003)(31696002)(36756003)(41300700001)(2616005)(31686004)(2906002)(316002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWE3UlJ4OFhoSFluR3d6QldJSDlTcXMvVGZmVTgvOWxYbGxDeUxoa0F3ZEMr?=
 =?utf-8?B?TDl1MlhxUU9oOFU2UDZVZGs0SFYrSHNXQkFDclFYNnVuVXVQdEo5MzRnWHFl?=
 =?utf-8?B?RVJyYm4veldRZWFYR0tHQngyVjFIOGJRdXRaYVB4U3c3ODlOZDQyWlBGOWdM?=
 =?utf-8?B?aDIwZ25sbGE0SW9kR0xUZ3l2Ny96bkZ1OXNpNnV3MFE3SWJsS3R6UW9VQUpt?=
 =?utf-8?B?VC9aL2pnVS9tQVg2bkFiYmJkS0NTdWt6RjhvaGQyandlV0NrT1gxZE9jTks5?=
 =?utf-8?B?OFoyKzViU0hWVWtRL0NuZlNtR29sckNuY2lwUXV3SXNUcStYOE1qU0o5UHVk?=
 =?utf-8?B?LzhMNk9DMmcveTVMZWt6bWhiS2JqNDhiOW14WXdpczVsUks1WVZ3bWxkeDRQ?=
 =?utf-8?B?amlkQUkrVFV0Z01aOGsvanE3MjM3djVkZHoweUh6OTFWa09Cb0pFcTRPSDRx?=
 =?utf-8?B?YVh2L1ZiSDZwOTBtQmFYcFJaZE9nWVJmUXJreFlTd1crcGx0bjdsdkViQmYw?=
 =?utf-8?B?RHhZSk1nRWh5UkorUi9XaXJnaTFXVkZJY3dkMWVleGVzb2VSU3pGK25uMDNR?=
 =?utf-8?B?Nkg0VEVidkZxb3psaW1hTUx4WEEzK3g2TlRVaXRDYkVtRkQ5WCtkZDdNczM4?=
 =?utf-8?B?UXRZdXNTQUg2YWtoNU41RndYVUtCZFFtaXMzTWN3aWd3S2pqR1A3U3hDakN0?=
 =?utf-8?B?SllwOGMyQjNCb1M1Q2RlY2xBQ05UckcyTkVKdzdkekZlTzVkayt5RnBFV1FV?=
 =?utf-8?B?VjBiZFQyVTVhOGd0Vk9mUVIzRGNVdkxGdkZuVW1GS1FHSTdrNHBoKzUzZkhu?=
 =?utf-8?B?bVI4bjNkTGd3MHlRMzlxNlM5OUdFTXh3NldkREJZTlI0dzhyY2VxTmUzTnlj?=
 =?utf-8?B?WmZ2MzgyQkVQZGNPa1RvZGVScURtSlFYVXUvVEtSZ2VQZEg4b2tqcTBTcVIw?=
 =?utf-8?B?SDg0VFNwSW1NVitMSmVTaGJlR0hyOUhsQjJYZGdyWkMvOXFlTWFCczhyWGR0?=
 =?utf-8?B?ZUcvbEY4VnlWWDh3azZkd1FzRnBCUDV6RExjV1YwRm5tbi9jWitPSHplOHFY?=
 =?utf-8?B?ZUoyeVduTGFTRUlEZytMektybVFhWC83ZnRkSVhibEp1eStrQ2VSdURKVVF1?=
 =?utf-8?B?T3BjVnk2Q0Z0WFkreVRtN3V4NVFreUJoalk2bnZqZzgvZEtsR05jY01GZG5R?=
 =?utf-8?B?NmM5VjFoTkpCUmpFR2cwYis5NWdEc3VybWFkcXhoVDFmejRPZEZVeEZXTVNE?=
 =?utf-8?B?cnp6M0JIOWtkWm80bUZZRitrZm5KUHBBRXdPdm40T044eEhYMUpSckp4cFJp?=
 =?utf-8?B?TFp5TnBvSkdialZNMXoyOFBhYSs5QjZDYTN4WUtsYWgxQk9wU2ptNTRka0Rz?=
 =?utf-8?B?cXhaQjRQUnk0L0Jnam50VEVxK3I3aUFvdG5BU2liaHpNenlSZjl1dUlra1lv?=
 =?utf-8?B?dHlJcmhuSWxpakREYmo5Mm9KNkhaQ0xBMlIrQ3drQ2VrZ21nc1dWQXlRRFFo?=
 =?utf-8?B?VVFOa1c3Rll5YVZDbk5OamgzTS9HV0cwcnNkZ2cxOWlrTjlveHhYdFhhTDhI?=
 =?utf-8?B?T2ZVd0JTbGtCOTh4MUhRYXlWYVErL1hlK0xSUE1xaWJaQjN4VXorRDVmaXdQ?=
 =?utf-8?B?TjFKKyt0R1ZRZE5xb0c3R2xXb3dJK1RVSlpxT0pzR1VlLy9XRUZaYTZiUGdW?=
 =?utf-8?B?TW5FbFNzOHBtaVJTUjV4citiL09NQ01ldjhUMmt3ZXdCNnRsakNSeTdQdy9l?=
 =?utf-8?B?aW4wYjJ4ZDhmNlZrVzVBMU9ZdkJndm9OZjI2Smlac1BHcE9PNlYwK3RlSGpJ?=
 =?utf-8?B?K0FGcUVHak1qMnBJem9WZm5ITEc5aS84dkhXNXpMT2ZPelNDZnVTblNyYjQ0?=
 =?utf-8?B?dFFKakJuTlhPMENjSFFDZzBpNGhrWjlwRWxlWEcyc05QbzBmWW5CRk9yRGth?=
 =?utf-8?B?aTVLaStEdHpkNTdOd2tiUitmOEs4MkE0eTJIU2lKTzZjQVBrRTRuZDluZTFO?=
 =?utf-8?B?Y2xFTy82eWNTVjNQd3F6N3J5TC9sZmx3TXB5WTYrMXZrWnVObXIyUFVPQkRU?=
 =?utf-8?B?dko2ZlAxNlR5N1ZaNU9iSDlyMlZqN3dMeE1IRkZBS2t3SmZVR3VCQVlhUEFz?=
 =?utf-8?B?OWZCRGR2U0ZRTEQ0NlJQTWRDVmxGeFdra3ZibEwybGlIY2RlZlhkVzRMRWRL?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e70ad06-706e-42da-f955-08da6edfd3b4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 08:21:23.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1T7zgS52cSIq7PhtubViYmOVLcwGMqC6r8B3cgQxvdec/t0uTo9oRzgw7oQed1SvDOZnapIamlU+86b9hu4+qzjuH5wqHQ0mp2EHKwO0SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1962
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/25/22 2:36 PM, Andrzej Hajda wrote:
> On 25.07.2022 11:25, Gwan-gyeong Mun wrote:
>> It moves overflows_type utility macro into drm util header from 
>> i915_utils
>> header. The overflows_type can be used to catch the truncation between 
>> data
>> types. And it adds safe_conversion() macro which performs a type 
>> conversion
>> (cast) of an source value into a new variable, checking that the
>> destination is large enough to hold the source value.
>> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
>> while compiling.
>>
>> v3: Add is_type_unsigned() macro (Mauro)
>>      Modify overflows_type() macro to consider signed data types (Mauro)
>>      Fix the problem that safe_conversion() macro always returns true
>> v4: Fix kernel-doc markups
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>> ---
>>   drivers/gpu/drm/i915/i915_utils.h |  5 +-
>>   include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
>>   2 files changed, 78 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h 
>> b/drivers/gpu/drm/i915/i915_utils.h
>> index c10d68cdc3ca..345e5b2dc1cd 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -32,6 +32,7 @@
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/sched/clock.h>
>> +#include <drm/drm_util.h>
>>   #ifdef CONFIG_X86
>>   #include <asm/hypervisor.h>
>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>   #define range_overflows_end_t(type, start, size, max) \
>>       range_overflows_end((type)(start), (type)(size), (type)(max))
>> -/* Note we don't consider signbits :| */
>> -#define overflows_type(x, T) \
>> -    (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> -
>>   #define ptr_mask_bits(ptr, n) ({                    \
>>       unsigned long __v = (unsigned long)(ptr);            \
>>       (typeof(ptr))(__v & -BIT(n));                    \
>> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
>> index 79952d8c4bba..1de9ee5704fa 100644
>> --- a/include/drm/drm_util.h
>> +++ b/include/drm/drm_util.h
>> @@ -62,6 +62,83 @@
>>    */
>>   #define for_each_if(condition) if (!(condition)) {} else
>> +/**
>> + * is_type_unsigned - helper for checking data type which is an 
>> unsigned data
>> + * type or not
>> + * @x: The data type to check
>> + *
>> + * Returns:
>> + * True if the data type is an unsigned data type, false otherwise.
>> + */
>> +#define is_type_unsigned(x) ((typeof(x))-1 >= (typeof(x))0)
>> +
>> +/**
>> + * overflows_type - helper for checking the truncation between data 
>> types
>> + * @x: Source for overflow type comparison
>> + * @T: Destination for overflow type comparison
>> + *
>> + * It compares the values and size of each data type between the 
>> first and
>> + * second argument to check whether truncation can occur when 
>> assigning the
>> + * first argument to the variable of the second argument.
>> + * Source and Destination can be used with or without sign bit.
>> + * Composite data structures such as union and structure are not 
>> considered.
>> + * Enum data types are not considered.
>> + * Floating point data types are not considered.
>> + *
>> + * Returns:
>> + * True if truncation can occur, false otherwise.
>> + */
>> +
>> +#define overflows_type(x, T) \
>> +    (is_type_unsigned(x) ? \
>> +        is_type_unsigned(T) ? \
>> +            (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +            : (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 
>> 1)) ? 1 : 0 \
>> +    : is_type_unsigned(T) ? \
>> +        ((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> 
>> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +        : (sizeof(x) > sizeof(T)) ? \
>> +            ((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +                : ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +            : 0)
> 
> 
> It became quite big and hard to read. I wonder if we could not just 
> check the effects of the conversion, sth like:
> #define overflows_type(x, T) ((T)(x) != (x))
> 
Yes, this macro is a bit difficult to read because it takes into account 
multiple situations. I left a comment with the relevant details in reply 
to the previous patch so that you could check the details of the macro.

And the macro you commented is not satisfactory in all use cases where 
the overflows_type() macro is used.
If you refer to the bottom part of the link below, you can check the 
pseudo code of this macro and test scenarios of the use cases covered by 
this macro. (It also includes the test code.)
https://patchwork.freedesktop.org/patch/492374/?series=104704&rev=3

Br,
G.G.

> Regards
> Andrzej
> 
> 
>> +
>> +/**
>> + * exact_type - break compile if source type and destination value's 
>> type are
>> + * not the same
>> + * @T: Source type
>> + * @n: Destination value
>> + *
>> + * It is a helper macro for a poor man's -Wconversion: only allow 
>> variables of
>> + * an exact type. It determines whether the source type and 
>> destination value's
>> + * type are the same while compiling, and it breaks compile if two 
>> types are
>> + * not the same
>> + */
>> +#define exact_type(T, n) \
>> +    BUILD_BUG_ON(!__builtin_constant_p(n) && 
>> !__builtin_types_compatible_p(T, typeof(n)))
>> +
>> +/**
>> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
>> + * @n: value to compare pgoff_t type
>> + *
>> + * It breaks compile if the argument value's type is not pgoff_t type.
>> + */
>> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
>> +
>> +/**
>> + * safe_conversion - perform a type conversion (cast) of an source 
>> value into
>> + * a new variable, checking that the destination is large enough to 
>> hold the
>> + * source value.
>> + * @ptr: Destination pointer address
>> + * @value: Source value
>> + *
>> + * Returns:
>> + * If the value would overflow the destination, it returns false.
>> + */
>> +#define safe_conversion(ptr, value) ({ \
>> +    typeof(value) __v = (value); \
>> +    typeof(ptr) __ptr = (ptr); \
>> +    overflows_type(__v, *__ptr) ? 0 : ((*__ptr = 
>> (typeof(*__ptr))__v), 1); \
>> +})
>> +
>>   /**
>>    * drm_can_sleep - returns true if currently okay to sleep
>>    *
> 
