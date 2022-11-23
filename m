Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B054634EDD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 05:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD24510E4DF;
	Wed, 23 Nov 2022 04:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7062A10E4DE;
 Wed, 23 Nov 2022 04:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669177036; x=1700713036;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sAGvXeuVkZAP8tvhd0OifqLHPT6ovLksEUq/pIHPm8U=;
 b=mzb8Sn2qHkm+caJL/lYzoQ07+9YMQDj/WJdLIYKJQLZFCBNIdegvV4uT
 RQAntOicNVNljzO7ejr8R/MO4WsCn8qi0nG3/x+28tbsZfGSlnubDqoun
 gVEet0+seZEoGlDpI/HglW74R6XwkalLLTK/IspVKSA1UpfQiDNq1pnuk
 4H00FEbg/oDc1B8hQU0n1Lkvde+gOAB5ZV4ZIeJAqjWhFFsjPaJO7IfPx
 unU/8ENjw1xxbzJpl6H4oQlf1ko1zp55ZBcxwKZcCPgBoG975Nu7EYkB4
 YLMwgsFNTR8wtPh+oDmZNIh5sVo+4WJ7IdiI2cscNSRdOhWtNLM8I9fEq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="340852462"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; d="scan'208";a="340852462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 20:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641651109"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; d="scan'208";a="641651109"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 22 Nov 2022 20:17:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 20:17:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 20:17:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 20:17:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lffoUirrB0gWfPY1vJCQfuveMesxYJJEMbnlZrwc6s5zqL6DbQP7tLrvF54gfUWwh1fcoh1xYyrPsvoziGEdzlspNEFtmGj7Icj7ItmrV09DJA9VZDkVWWFxGWHRKiMhqhFOwrDhLDVnLVZvxBdLz/PhxO2UZDzX0ErWUCFFjyWarR1aIwvA0fnhNXthD4oeg2+85+9hcqq1OECTMxTFaCz5JCA16iSLj9eBvRdMX8k7iXOFzI8ac7UN2MuVCDmJskelM3BZGlCKdecoDT+9U2IMssHBZu+d+mxweWAQ23v8sWwhmFzztS06PvBDIBfMICUSxohwTINE1zlKy46vXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHftE/U2R3gvXwFv1SosmZf197YEf1/dqutk+DWdlek=;
 b=hbWA7qyOlZw2jWuH1bXJU8f31eAup9u/M36oJ95NQvHVE9/GJOUJ1xJ/kbp3pXqFnlsoYQwQc18zzdFdD+dKVsw6+ruZHzQ6MUxFq5QO2ejgQnbA6hiHlzHmhHFiIAFe36yiZCpytRNOtUe5Arpu15X1JxnKCR+LBjgGcANLXMSaT+O+OCfOSRm8J7BDKR2OaMYTmXoQONU5tDUKFUnNJf7wdUF85urkkmh04impYD7UGzhmyIN//frOhH7Us9+YESlJPpu3ahoXLwSFrOEvuxi1N4E2AsDmwN9knqwRO1+nMkJNHdGiWZ3Q3G5i/VE1YItBvSR4cT9kv5fIhbhqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Wed, 23 Nov
 2022 04:17:12 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd%9]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 04:17:12 +0000
Message-ID: <a6f3f20a-3d03-acce-965a-604a43639d0d@intel.com>
Date: Wed, 23 Nov 2022 09:47:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v4] drm/i915/mtl: Media GT and Render GT share common GGTT
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
 <Y31iW0lCuUcx4pNg@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <Y31iW0lCuUcx4pNg@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6df435-1dfd-4d65-e4a2-08dacd099840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tz6J9dsxLOcYzKDg1DrCVkQbNLMbjSK7v7JDjGijPNXnNl33uu3KY0GwWcWzdDzcMxklQUyGq8n1JdHLsUvbryC219Y/zEj8fm/uVJ+PReqzcRJWbnt51a8Y9wl/3A+Wgs1m48D7rsXGV20WoI92imUdbNV9DAQq9nsvikL6Lkm+XJfa4vG6iUw10Y88vV2TQ/4o7jTJj5aOg8bW9PZC7/idsOshICy0clAmKLllTx2fSAdSgEH1OiiqRUP3TDd3aFw1HgfpwQ/GWTpWCCY0/NCjvAkXr/RbTQYwzO3FYYGXtwKcBc7eNZ+Zj95Mriq7U5yhYX67o6TH64ByczoLFElM081FFvWZpSICb8bCRo8EFFROlMJPzJjnE7ksVO21p7gfHrVPS2ZvrfZIOz1Kzxx9AWpYrhSXC4WFObH+whuwi0Wb7dRKUjPxHcWm4c9y9YSTnk/vX5XARhO6N/alCmbrlhmBamv5Ng7l5kJ2jM/Tu+/46XySPGsin6hFTSO87+/IB54QUMMiYGpsVybN3auATDL4Flz/vQ+8csDL+YbU4/usjznaPF+B05rKLcxMGmxVZdon9v/W0bQnesclOKCj15pqlbobdGa2FL/mCeyfOIyUksWTiKbOb7e6obU56rwO7YkxwseMKOPFSJHY/4ssFcnDre/A+fc//+n9K7s1VGG/tCMvpCQOwFMGnrceJMj9awx6w4Ew72dSDf/ajDaqf4WCj4gGJ2HVDf9QbFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199015)(30864003)(450100002)(83380400001)(36756003)(6636002)(478600001)(5660300002)(66476007)(37006003)(6512007)(53546011)(4326008)(8676002)(66946007)(2616005)(6506007)(316002)(26005)(66556008)(8936002)(6862004)(186003)(41300700001)(38100700002)(82960400001)(2906002)(6666004)(31696002)(86362001)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnNSZFRwb3F0NmtNYytiZEVFbmRqYmh1d29KQ0cyNk50KytYMy95d0IvYkFo?=
 =?utf-8?B?NkMwNmt5cUZnSWxSb0gxZEV5ZVBpOUVFZXFxQ0VGcVVOd1FrZ0pseWs0SEx2?=
 =?utf-8?B?dEtWcG5vUHZKTmdTNVltdlAwbzZQdUlKM3JmZ0dpMjllekNpbTlmeW1wNklY?=
 =?utf-8?B?SE13REI1dytNWVp0OVBZU3AvRWx4K2JGeDhmbE96OEpLazFCNmlESGNZN3ph?=
 =?utf-8?B?bEtqZTR5MFpLWGdrWUphWXdlQVI4cDAwZW4xTUZFa0Y4WW5YNEZrMDRva2lI?=
 =?utf-8?B?eGJCQWMwL0MydVpqY3hza2w5UlpCRWpxNHd6aEo0eGVHNE5kTk5TUXVJNTIv?=
 =?utf-8?B?anFSOXVLamVxRE5nRUNLWjF0MDN4VFFZdTc3ZzFXakIySFA3NjVFZUJQdXNH?=
 =?utf-8?B?bnVRRjJJMFFGbFRVZFdvVWY2UGpzWGxCd3p5NWFDZ3FDdUErSlZvUmFHYWRp?=
 =?utf-8?B?N1ZOWnVaYTZzekZ1UmlSNkNnN0dpOCtkQnVhbXFnOFFCTmZQT2JZbUFLVElT?=
 =?utf-8?B?VnFuckRQT2pGVVNyTmVZOXd0Sk0yS3ZKenhlOFphYWxOc3pWeHBoYzU5N0JD?=
 =?utf-8?B?T05XcHJJWkNTK3V5YmRQcjRBQjh3ZXhYWU80VEJLSEJzVDdid0pLb1drMW5r?=
 =?utf-8?B?cWlrSWhZMTJFUW1VdTlpdXM3ektqZFJCRXpIOTZ1UkZCTXJUWlE1c3h3OFY5?=
 =?utf-8?B?aUk1MTR5VmJTMFFTL25PNFBZL1BNVHA4bnljakl3QkJKdktXMFo5Y0J1bnF4?=
 =?utf-8?B?Q0xBQzV5VmFLQ09sNTFEc3o2WU1TOUlEU2NPQkdoWUcwT0x2VWRNRE9MT1RT?=
 =?utf-8?B?eDBFczlVcHVNRHpPak9reWUzTTZ3ZjlxNFdkWlBEcVpnNlF4eEVZVndIYURv?=
 =?utf-8?B?eXg0cXFaRWtRTWNTRUpjclJZNXhvbWZhOUJ6Wld4REZFcXlxNThVWU1kQ2ZJ?=
 =?utf-8?B?SDBuZ3dwL3BUUnVpYmwybUE3L2JzMGs0NGY4R2JPRE53azZnUUp6UWpmNldS?=
 =?utf-8?B?MEtOdUs1aEo3SXVhZWJjamxzN09mNXN5dHpqSlFyTnAvdS9DUnc5Sm90UzRP?=
 =?utf-8?B?amFabTRIQkNjZDhpYm9KUzlBWWRMNVhiUzRBTG1sc1F5TjNUMVFucm1VVSs2?=
 =?utf-8?B?b2dNWTFOUzdoUzB6UUYwbVRkdUJUVnpmV3Z2TzNkYUR6cERkL09zOFN5RCsr?=
 =?utf-8?B?RDBjKyt3SStJQmhPb3VBcldFWm5ZTXhxQUdyZWJnczdBT3F1dGppaXh0cW1P?=
 =?utf-8?B?cUNocHpSdnFabjBxRFdWd2U4RURUUzlkb2R3OW5XOVlNSFo3Y25lT0hoaXZY?=
 =?utf-8?B?TU9QejQ5bVBiMkhYaWR0S09kUUJVTmJrN0NhR1NOdVNjbzVGUFlBQkRHVHdY?=
 =?utf-8?B?ZUUzRWxKeFVWbXpRdWtYV2R6ZU03bGdheFNhU1NoVkowSUEvUThPN3RyUEMw?=
 =?utf-8?B?aWhBM0IrL3FOcmhmN1N3V1gyV1lzZ0E5MDgzTWZPcDJSY21uVXN1TUUrVlp4?=
 =?utf-8?B?enFScUk5dHFrSmpYSFRPT3hUMll5YVBicElLMWZCODRXTUNGSDRvSWtUYTg4?=
 =?utf-8?B?bzlWMTVWek1GeGx0YmQvcTlDM0RQaTRlU1Nib2tidUdmcEl0MkRsMkxvR1lP?=
 =?utf-8?B?TERGVis2THdJcjZ1U2JRaWYwbTVCVWNIUUhLQ0c4L3NObndnU0hreUxHL25G?=
 =?utf-8?B?QzZ3MGNwaVdvT2U1T0VyKy8wbS93RUg3T0hTSHVaYVJydjNlY1VGYUtpVS9D?=
 =?utf-8?B?YzZJVDZsOExscWdBOGpUWldwQ2dvRml3NzV6cjQxR05aU2RZclVRVWM4MzAw?=
 =?utf-8?B?M1NTSFd0T1d5RllBVDBaWE1hcXJoSVQrWWJNVjZyUlN5RTUxb3JlSTRYYkFP?=
 =?utf-8?B?R01OS014WHlVb1ZBNUFvZlk2YnM5L1g4T1VyaW1tK0E5WUw3aXpwa3k4NUQ3?=
 =?utf-8?B?WUtEQnhsVFBsVlpCditlZzlBOTE4R0o0U0VHNjA3SUIrazEzWVVMQllOdldJ?=
 =?utf-8?B?OUlzOU5oYVJPV0hXcW5oTkV4RTVSSWl1R0VRRmVBK2ZHWmwzRmorV1didmtM?=
 =?utf-8?B?cTRoV3dNUUE0aGZKZ2lHN0hwQkVDaXhlN0xscGdmK1hnR3cvYVRtK01KT1FG?=
 =?utf-8?B?RW9DR0ZlQUcvVGRyOTRTUDJ1WEJBTmhkUEJ4QmVUQnJ1MVBhUmw2YzNaTmRl?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6df435-1dfd-4d65-e4a2-08dacd099840
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 04:17:12.2583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeJAtbdIWeucNgp+roDDKOInzN1nMKbHfUeJgNPR5QsELf12MZTCYYVce8Ec542k/fcOQrJEVx0jzzQWsZGvQkIq3MgwId0YeQ4AoT3ceVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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



On 23-11-2022 05:29, Matt Roper wrote:
> On Tue, Nov 22, 2022 at 12:31:26PM +0530, Aravind Iddamsetty wrote:
>> On XE_LPM+ platforms the media engines are carved out into a separate
>> GT but have a common GGTMMADR address range which essentially makes
>> the GGTT address space to be shared between media and render GT. As a
>> result any updates in GGTT shall invalidate TLB of GTs sharing it and
>> similarly any operation on GGTT requiring an action on a GT will have to
>> involve all GTs sharing it. setup_private_pat was being done on a per
>> GGTT based as that doesn't touch any GGTT structures moved it to per GT
>> based.
>>
>> BSPEC: 63834
>>
>> v2:
>> 1. Add details to commit msg
>> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
>> by Lucas
>> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
>> it.
>> 4. setup_private_pat moved out of intel_gt_tiles_init
>>
>> v3:
>> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
>>
>> v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
>> (Matt Roper)
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks Matt, could you also help with merging the change.

Regards,
Aravind.
> 
>> ---
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>  9 files changed, 111 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 8145851ad23d..7644738b9cdb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/types.h>
>>  #include <linux/stop_machine.h>
>>  
>> +#include <drm/drm_managed.h>
>>  #include <drm/i915_drm.h>
>>  #include <drm/intel-gtt.h>
>>  
>> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>>  
>>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>  {
>> +	struct intel_gt *gt;
>> +
>>  	i915_ggtt_suspend_vm(&ggtt->vm);
>>  	ggtt->invalidate(ggtt);
>>  
>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +		intel_gt_check_and_clear_faults(gt);
>>  }
>>  
>>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  
>>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  {
>> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>>  
>>  	gen8_ggtt_invalidate(ggtt);
>>  
>> -	if (GRAPHICS_VER(i915) >= 12)
>> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> -	else
>> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +	if (GRAPHICS_VER(i915) >= 12) {
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_uncore_write_fw(gt->uncore,
>> +					      GEN12_GUC_TLB_INV_CR,
>> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> +	} else {
>> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
>> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +	}
>>  }
>>  
>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>  
>>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>  
>> -	setup_private_pat(ggtt->vm.gt);
>> -
>>  	return ggtt_probe_common(ggtt, size);
>>  }
>>  
>> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>>   */
>>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>  {
>> -	int ret;
>> +	struct intel_gt *gt;
>> +	int ret, i;
>> +
>> +	for_each_gt(gt, i915, i) {
>> +		ret = intel_gt_assign_ggtt(gt);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>>  	if (ret)
>> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>  	return 0;
>>  }
>>  
>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
>> +{
>> +	struct i915_ggtt *ggtt;
>> +
>> +	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
>> +	if (!ggtt)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&ggtt->gt_list);
>> +
>> +	return ggtt;
>> +}
>> +
>>  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>>  {
>>  	if (GRAPHICS_VER(i915) < 6)
>> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>>  
>>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>  {
>> +	struct intel_gt *gt;
>>  	bool flush;
>>  
>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +		intel_gt_check_and_clear_faults(gt);
>>  
>>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>>  
>> @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>  	if (flush)
>>  		wbinvd_on_all_cpus();
>>  
>> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>> -		setup_private_pat(ggtt->vm.gt);
>> -
>>  	intel_ggtt_restore_fences(ggtt);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index b5ad9caa5537..b03788d7674e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>>  
>>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>>  {
>> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>> +	/* Media GT shares primary GT's GGTT */
>> +	if (gt->type == GT_MEDIA) {
>> +		gt->ggtt = to_gt(gt->i915)->ggtt;
>> +	} else {
>> +		gt->ggtt = i915_ggtt_create(gt->i915);
>> +		if (IS_ERR(gt->ggtt))
>> +			return PTR_ERR(gt->ggtt);
>> +	}
>>  
>> -	return gt->ggtt ? 0 : -ENOMEM;
>> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>> +
>> +	return 0;
>>  }
>>  
>>  int intel_gt_init_mmio(struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index c1d9cd255e06..8d915640914b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -277,6 +277,9 @@ struct intel_gt {
>>  	struct kobject *sysfs_defaults;
>>  
>>  	struct i915_perf_gt perf;
>> +
>> +	/** link: &ggtt.gt_list */
>> +	struct list_head ggtt_link;
>>  };
>>  
>>  struct intel_gt_definition {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 4d75ba4bb41d..d1900fec6cd1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -390,6 +390,9 @@ struct i915_ggtt {
>>  	struct mutex error_mutex;
>>  	struct drm_mm_node error_capture;
>>  	struct drm_mm_node uc_fw;
>> +
>> +	/** List of GTs mapping this GGTT */
>> +	struct list_head gt_list;
>>  };
>>  
>>  struct i915_ppgtt {
>> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>>  int i915_init_ggtt(struct drm_i915_private *i915);
>>  void i915_ggtt_driver_release(struct drm_i915_private *i915);
>>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>>  
>>  static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
>>  {
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 69103ae37779..4e1bb3c23c63 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>  
>>  	i915_perf_init(dev_priv);
>>  
>> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
>> -	if (ret)
>> -		goto err_perf;
>> -
>>  	ret = i915_ggtt_probe_hw(dev_priv);
>>  	if (ret)
>>  		goto err_perf;
>> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>>  static int i915_drm_resume(struct drm_device *dev)
>>  {
>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>> -	int ret;
>> +	struct intel_gt *gt;
>> +	int ret, i;
>>  
>>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>  
>> @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device *dev)
>>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>>  
>>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
>> +
>> +	for_each_gt(gt, dev_priv, i)
>> +		if (GRAPHICS_VER(gt->i915) >= 8)
>> +			setup_private_pat(gt);
>> +
>>  	/* Must be called after GGTT is resumed. */
>>  	intel_dpt_resume(dev_priv);
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>> index 8468ca9885fd..086c4702e1bf 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>>  	for_each_gt(gt, dev_priv, i) {
>>  		intel_uc_fetch_firmwares(&gt->uc);
>>  		intel_wopcm_init(&gt->wopcm);
>> +		if (GRAPHICS_VER(dev_priv) >= 8)
>> +			setup_private_pat(gt);
>>  	}
>>  
>>  	ret = i915_init_ggtt(dev_priv);
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index f025ee4fa526..4cfe36b0366b 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>>  	return !kref_read(&vma->obj->base.refcount);
>>  }
>>  
>> -static int ggtt_flush(struct intel_gt *gt)
>> +static int ggtt_flush(struct i915_address_space *vm)
>>  {
>> -	/*
>> -	 * Not everything in the GGTT is tracked via vma (otherwise we
>> -	 * could evict as required with minimal stalling) so we are forced
>> -	 * to idle the GPU and explicitly retire outstanding requests in
>> -	 * the hopes that we can then remove contexts and the like only
>> -	 * bound by their active reference.
>> -	 */
>> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +	struct intel_gt *gt;
>> +	int ret = 0;
>> +
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>> +		/*
>> +		 * Not everything in the GGTT is tracked via vma (otherwise we
>> +		 * could evict as required with minimal stalling) so we are forced
>> +		 * to idle the GPU and explicitly retire outstanding requests in
>> +		 * the hopes that we can then remove contexts and the like only
>> +		 * bound by their active reference.
>> +		 */
>> +		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return ret;
>>  }
>>  
>>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
>> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  	struct drm_mm_node *node;
>>  	enum drm_mm_insert_mode mode;
>>  	struct i915_vma *active;
>> +	struct intel_gt *gt;
>>  	int ret;
>>  
>>  	lockdep_assert_held(&vm->mutex);
>> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  				    min_size, alignment, color,
>>  				    start, end, mode);
>>  
>> -	intel_gt_retire_requests(vm->gt);
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_gt_retire_requests(gt);
>> +	} else {
>> +		intel_gt_retire_requests(vm->gt);
>> +	}
>>  
>>  search_again:
>>  	active = NULL;
>> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>>  		return -EBUSY;
>>  
>> -	ret = ggtt_flush(vm->gt);
>> +	ret = ggtt_flush(vm);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>  	 * a stray pin (preventing eviction) that can only be resolved by
>>  	 * retiring.
>>  	 */
>> -	intel_gt_retire_requests(vm->gt);
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_gt_retire_requests(gt);
>> +	} else {
>> +		intel_gt_retire_requests(vm->gt);
>> +	}
>>  
>>  	if (i915_vm_has_cache_coloring(vm)) {
>>  		/* Expand search to cover neighbouring guard pages (or lack!) */
>> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>>  	 * switch otherwise is ineffective.
>>  	 */
>>  	if (i915_is_ggtt(vm)) {
>> -		ret = ggtt_flush(vm->gt);
>> +		ret = ggtt_flush(vm);
>>  		if (ret)
>>  			return ret;
>>  	}
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 703fee6b5f75..726705b10637 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  			   u32 align, unsigned int flags)
>>  {
>>  	struct i915_address_space *vm = vma->vm;
>> +	struct intel_gt *gt;
>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>  	int err;
>>  
>>  	do {
>> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  		}
>>  
>>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
>> -		flush_idle_contexts(vm->gt);
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			flush_idle_contexts(gt);
>>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>>  			/*
>>  			 * We pass NULL ww here, as we don't want to unbind
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> index e5dd82e7e480..2535b9684bd1 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>>  	 */
>>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>  		i915_ggtt_resume(to_gt(i915)->ggtt);
>> +		if (GRAPHICS_VER(i915) >= 8)
>> +			setup_private_pat(to_gt(i915));
>>  		i915_gem_resume(i915);
>>  	}
>>  }
>> -- 
>> 2.25.1
>>
> 
