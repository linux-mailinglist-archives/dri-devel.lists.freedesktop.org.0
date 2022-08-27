Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16CD5A3354
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A762710EAD2;
	Sat, 27 Aug 2022 01:07:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AF510EACE;
 Sat, 27 Aug 2022 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661562450; x=1693098450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fS6YbMdyYT7Ckhk+V4govyySyMW+t5VtTGaqGFjY1Fk=;
 b=IQcrumdfr3KN9DTmc9hV/uH0DXlM3ZemAbbdkRQfCdYM7ivX/8LRmDZX
 6Ne77BPW3INqk42gjt4PqAwGuh/6TYTDFt3M/lmTQyXp4oZQKSYWpwQ5n
 EDPdUnZb4s5w7tvc3pbn4g3B+fJ7WssKImnE8v3QyEFoSszRgt00d9ll5
 +HkLmqPBoV+9RAgcQrTA5D71cOqIMB5tdV5Td6nmFNORLH8xAcOyjGBcL
 irlcp2fut9UyexTlZP/x2fw4LjQ0lj7h6/gWDGF1MNvPrhNdIukvDzBx4
 9icsqJrHSLm7PKbTk4Gtc9EGof9Q4RFyYqejAlI+DO/hoCahoC3W5A9Mu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320732802"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="320732802"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="753052590"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 18:07:29 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 18:07:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 18:07:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 18:07:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 18:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noQ9mslQe2NIFUC0Ndc5RrD59SgoHHTW6R1SQ4vVn3Q3KTYOIc3G+2caGJUhxAM7ARbbHedV4UiY4bNtvmgkXKQ5TVGrH/mDM//+0qncEoytKoQYL1wwOCeKcIGfT4IIb80lH79n3qSnDgou6q0TR1Monm4ZYvcp/Eva2u/GL1DIs85pJrTd6mVYJt7urLHT8JH+zYBH8T8+9jsfmHb2A7oliqDmDreHIDE3yEFUJWR9Q4hDstiOXBOfR0aiKshfJpXBd7iJUrElxLnbLVTZ5UDAGnKkoUMsBgbogJit1mwwUSAvJqgrp/81ONQ37a3khOp0NYCKh0U5Ow+g4ZFgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeqJ6koX61Bp/QJuYh4JgKma1t94GJLzA/CPdZT6GfQ=;
 b=PdlscBkISIFMn0MEMjkKx0aFIXDBc/omcd6yj2Z/AkOWowHmjFnXH2JDIuLNGlw5vZCmN3zvt+vog40/MmiaBm2mE0FQw1vEJyn0wC38Bqyj4rUjvaVcIvVEe76aCiCaOWTOE4PqB5GCQBLhs+nMVSRXwWEvOwo4h+PZmGq8lkvWb3lUYOoUJ8YCVEXiqI0NXF2qWeOwLq2x/QQ2Jw1FflK/3hcoINSa/YEudABqEbuIAPq5MLJy7e1S7W3n5THpiI4s1Qd0aMpPHIBZ6fK3SUs/RuLH3JbE6s3YtMEJzhcdvSjjBLmYREFLdUBQaWNUkWS31Rz/90EwAPt/ulzdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB2652.namprd11.prod.outlook.com (2603:10b6:5:c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 01:07:26 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d%6]) with mapi id 15.20.5566.015; Sat, 27 Aug 2022
 01:07:26 +0000
Message-ID: <00b7fb83-34a8-190b-3290-4e6f7f25c842@intel.com>
Date: Fri, 26 Aug 2022 18:07:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/3] drm/i915/uc: Add patch level version number support
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220826030553.2611574-1-John.C.Harrison@Intel.com>
 <20220826030553.2611574-3-John.C.Harrison@Intel.com>
 <9445b047-b358-23f4-a9c9-75b3b19dead1@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9445b047-b358-23f4-a9c9-75b3b19dead1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ffa538c-f8b8-4193-8952-08da87c881a9
X-MS-TrafficTypeDiagnostic: DM6PR11MB2652:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vZJ+YbwcBjcdsZghh6/6Zq48vKO4mBIijJfLrXXX1uWqM7XJA9m5tyCbKIoupd5gPze3yHRx4EeaqcU9dAne7pfyDyXlA6ilV366+nUYooDykaSfa0KA4s8/bJ+K2jsc6oxXxwZgdGV7Vs6DFQo3RW3QKay+zncMrVnQ9v2fbpOYjA00LTvsDJphYVNP/cA4KNOBcNG6myyOm9FHdvkpT54jaKdD9JRUBAwW8Vdmv05Vpwy0DFJj11+x9p6eYgC7ToeCtNfsSpWlwU8MCP2N/X2+B7UdTiFgfE1lSoSvMJKt0OntRfQKyPHN1al+lxV4liUUm32mcyDiemmtSxedmGY3q+kp+oNGHnNHyoo5qfG0J2UKjesTX0cFUlQTa0qQBm8FPlnZJDHBglDDQXzfbcVcswo5AwFe9XoajnJuq4rhkjyZuVzkPpXbcIY2SQpfP+dyMo4ldJZvKYcAkjKAwSXUk0FsCIE5D3Sy5ZUUc3jC+eVte1Q6ip9Oih2k7k2E2vONTYHTCyuOG6nMvTD0yLw7yUXYfcNxT+c52ts+5UJqc11bogXBiLFg7oR81o3LbOLnUMqnNNzRlK+8axrJhfX9yHcLZA8E1rLYYzCnVInFF7W4mT0DYKaQ2X9FKANiORhHFNhAhbyWRl+9iJFik2q7lyEH4Sh+DUjaD0qcsRkMg8fdqMcI7+XxUdiokZrZGDP2kCkRv8N7Ri7Y3RsqUXsxsSLZUwJq0Bp71IbfJG9j/RpETQwrrjPRP2i9dbqbkvGwIBluvoH5DbB6h5eaHQMx7/QPisRI/BGTbmV+3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(39860400002)(346002)(376002)(41300700001)(66946007)(6506007)(478600001)(4326008)(6486002)(8676002)(5660300002)(450100002)(66476007)(8936002)(53546011)(66556008)(31696002)(186003)(83380400001)(86362001)(26005)(82960400001)(2906002)(38100700002)(6512007)(36756003)(316002)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFN1aUIyanZIck02S21maEg2S3o1S3VnaHVYYnVXZHJrN3NUUVZuRzMvZVVq?=
 =?utf-8?B?bkNNN2tzVmp1WGdqSUVHeUY1S1BMaHpsVUxXbks3RWFpUDNrQmhtaVJZQUFl?=
 =?utf-8?B?MWZFbDFBWS9NVnJmRmw0MXQrREw3WFhGQmh5ajhjT1dCSDJqRnMwMmxKREFB?=
 =?utf-8?B?TVY3eFZBVC95WDVEVXErTVAyMFJ2am8yWXlMeWVrZzFlRUl2eVNSMU1SbGtG?=
 =?utf-8?B?SzNJbUExL0FhT3pPVWY3TE5YRmVFT1RjUWtrd2dnRk5QU1hQaThGYlZ4d1U3?=
 =?utf-8?B?WEM4c3pubnVzY096bVR4eXNwN1QwZDVRR2tyZXV4aUtpejFtUktkaFZES2kv?=
 =?utf-8?B?QytJOGM3Z3RFRDg5RzcrelJmSTZBYXdZaGw1c3RLKzZKV0s1Ti82UTVVREhs?=
 =?utf-8?B?Q3Y2eFR5WDk5alViRkh3QnJRZVhZVTBmWGtPdFI3S2grcG9CMjdIK25uV2tP?=
 =?utf-8?B?ZWdmSGdVcVp3L2NZbWJXVmFMVjRzbUMrbk5SUHRBcDZ1NkF1VUtQTWp5Ykkw?=
 =?utf-8?B?Y0VKWXF1NmUzUXBEVUJ6dmx6RExWaWhkNFROWXlrS0dhTG9reHF2OTBLNlZQ?=
 =?utf-8?B?THhqaFdiQThHQ0xkM0FCQjgyN0hZeVpTd01DWWRyZ1RUeG9IdE5oZVlqMEFv?=
 =?utf-8?B?VWpUYzVXV2tMNkpoVE9QVk1HeG1oQi8zUE1JMzQrYTBVYlZJNHQ4bnJRbzlk?=
 =?utf-8?B?QWFraVViTXNyaFVmSmtLK0lJbnhBYnorVkhOVWEzdVRPbW0xVzFZOXdHdk1y?=
 =?utf-8?B?ZWd2bkJBK3lvY3BTVW83QTl3Mkc1aGRISzN3L2tYdnBELzkraHFpeHdRVWxX?=
 =?utf-8?B?NDFodjNibmtvWVBuUDNQOWg0K3hHOUhZVUx1VDdiYTAxQlNYTVZKM0ppaVdR?=
 =?utf-8?B?TERHWk9jMmMyVjhjUTJBYTZpY2ZYWG9wREU1RTFmbDJ1ajNCWmtUcE5mZFoy?=
 =?utf-8?B?b09pTVZvb3Z5MHZyNHlXOFBOc2Q2NUdqL0Voakc3WWh6aktyUkpEdkFSQWhC?=
 =?utf-8?B?b016NDRURFNxOGxreTk2VTJ0OGZsc1lSeVkzSUFjTUdrSG1FZWpDNjVzU01x?=
 =?utf-8?B?NVFSbjN6S1RtQzZiNmdSU2VuQ0RFZWgzbElrd0w4RVlQR1lxZ280Mm1lYStD?=
 =?utf-8?B?V2ZENk96OUR3b0JucWVOWjJSOCt5MXB2cW5ndHBVU3gvSnBPSWJ3alJPMnRw?=
 =?utf-8?B?aytPa3VUazhHd095N3ZPS3VaS0p1TjR2Zjc3ekJJdlo4bmV1YzBPeG0wWm9i?=
 =?utf-8?B?MklTOEpuTERZWFhQWmxWUXIvSGhrb2gxT3ZTbDFsSkRxUjlKa09oaGRiTFR0?=
 =?utf-8?B?UWpjMGY4MlRtYUNnR3NOc3lscUtkb0tPVTBRajB6T3JUUm4zcnZYcll1R2VM?=
 =?utf-8?B?T1lTNGJ1MWcrSkY0TzRKRUwxY1hEbjM0UXYwQmNjU3N6UktjeXMzVHloSVpR?=
 =?utf-8?B?TVBMN1hXSHY2SUdiaUZ4TU5xKzdVQWkyVXYxTmYyQlh0RzZ6WE51aTZCdEl1?=
 =?utf-8?B?Y05oZ3FZSG9zdDhtVUNVLzNmdkh4ZENnM0RSL3EzQVcwNmlBK01YczhKOUF0?=
 =?utf-8?B?b0xMMkFQcGFCUmRla2IrWXJ6WEZNanY4Z1padDl5U21WMVJhd044ZWQvZy9C?=
 =?utf-8?B?VHZRYU1RWHJpay9RK0pIT21uZE9BN1l1aUFXVHdZVktjQ29qRmREK2Z0c2R4?=
 =?utf-8?B?ZFFuelYzcVRtMmJmUUUyazFOb0wxUUIyc002SG9Wa0tnanFXUExhOGR1Rm5m?=
 =?utf-8?B?QTU5ZExMSDRSZFBqbUVFeCtKTXpjbmR1cnJzczZoNVFzeGRzbEpjY0hlcnJW?=
 =?utf-8?B?V3J6MkdiSlE2NFdYK29QZWRlWE1CZG1RRktFWmpha0hDT05nTDU4NENnM2VH?=
 =?utf-8?B?M0oyLytyajczU2tFMFgzZndvdFBGTEJ1ZGdqdDRVcG9SV1lIK2NzL1poR09n?=
 =?utf-8?B?MzQ0ODc5eVdqaTNEdm8yeDk0UjQvcXpYeFlpWUloam5JSUVoaUt4aEpoeG1J?=
 =?utf-8?B?K0dIYTJ2RGUzSGkxTHV4UW1UcThMYUhoM0NzekRQQXl6em9wQUUzT04yMkhZ?=
 =?utf-8?B?dVlkTHh4d21Edm5oNkFEVVBTL2x3U3VvbTQzcHhuVU81eDJjaFdGaUJXOWgw?=
 =?utf-8?B?cUJTUWkzNGd2RXJHVnVucktHaFUrSmlRWHJJYS92VVJuT01QUFozUXhDT1lq?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffa538c-f8b8-4193-8952-08da87c881a9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 01:07:26.6489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6DbaPK+AtEotcjPWLMJ1nKlCKQt0AAzwa2+4JMmPy92+8fLSdPneQzWcJRdK9u9XKs/deuxnstAiEfkGMBqF6G/qpSEfpd45XpCB0DHhPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2652
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/26/2022 16:54, Ceraolo Spurio, Daniele wrote:
> On 8/25/2022 8:05 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> With the move to un-versioned filenames, it becomes more difficult to
>> know exactly what version of a given firmware is being used. So add
>> the patch level version number to the debugfs output.
>>
>> Also, support matching by patch level when selecting code paths for
>> firmware compatibility. While a patch level change cannot be backwards
>> breaking, it is potentially possible that a new feature only works
>> from a given patch level onwards (even though it was theoretically
>> added in an earlier version that bumped the major or minor version).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++--
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 36 ++++++++++++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  6 ++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |  8 +++--
>>   5 files changed, 47 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 04393932623c7..64c4e83153f47 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc 
>> *guc)
>>       if (guc->submission_initialized)
>>           return 0;
>>   -    if (guc->fw.file_selected.major_ver < 70) {
>> +    if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
>>           ret = guc_lrc_desc_pool_create_v69(guc);
>>           if (ret)
>>               return ret;
>> @@ -2303,7 +2303,7 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>       GEM_BUG_ON(intel_context_is_child(ce));
>>       trace_intel_context_register(ce);
>>   -    if (guc->fw.file_selected.major_ver >= 70)
>> +    if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
>>           ret = register_context_v70(guc, ce, loop);
>>       else
>>           ret = register_context_v69(guc, ce, loop);
>> @@ -2315,7 +2315,7 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>           set_context_registered(ce);
>>           spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>   -        if (guc->fw.file_selected.major_ver >= 70)
>> +        if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
>>               guc_context_policy_init_v70(ce, loop);
>>       }
>>   @@ -2921,7 +2921,7 @@ static void 
>> __guc_context_set_preemption_timeout(struct intel_guc *guc,
>>                            u16 guc_id,
>>                            u32 preemption_timeout)
>>   {
>> -    if (guc->fw.file_selected.major_ver >= 70) {
>> +    if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
>>           struct context_policy policy;
>>             __guc_context_policy_start_klv(&policy, guc_id);
>> @@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct 
>> intel_context *ce)
>>   static void __guc_context_set_prio(struct intel_guc *guc,
>>                      struct intel_context *ce)
>>   {
>> -    if (guc->fw.file_selected.major_ver >= 70) {
>> +    if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
>>           struct context_policy policy;
>>             __guc_context_policy_start_klv(&policy, ce->guc_id.id);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index d965ac4832d60..abf4e142596d0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -435,9 +435,11 @@ static void print_fw_ver(struct intel_uc *uc, 
>> struct intel_uc_fw *fw)
>>   {
>>       struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>   -    drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
>> +    drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
>>            intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
>> -         fw->file_selected.major_ver, fw->file_selected.minor_ver);
>> +         fw->file_selected.major_ver,
>> +         fw->file_selected.minor_ver,
>> +         fw->file_selected.patch_ver);
>>   }
>>     static int __uc_init_hw(struct intel_uc *uc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 94cf2d4a46e6f..7c45c097d6845 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -447,10 +447,12 @@ static int check_gsc_manifest(const struct 
>> firmware *fw,
>>                     struct intel_uc_fw *uc_fw)
>>   {
>>       u32 *dw = (u32 *)fw->data;
>> -    u32 version = dw[HUC_GSC_VERSION_DW];
>> +    u32 version_hi = dw[HUC_GSC_VERSION_HI_DW];
>> +    u32 version_lo = dw[HUC_GSC_VERSION_LO_DW];
>>   -    uc_fw->file_selected.major_ver = 
>> FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
>> -    uc_fw->file_selected.minor_ver = 
>> FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
>> +    uc_fw->file_selected.major_ver = 
>> FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
>> +    uc_fw->file_selected.minor_ver = 
>> FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
>> +    uc_fw->file_selected.patch_ver = 
>> FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>>         return 0;
>>   }
>> @@ -512,6 +514,8 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>                              css->sw_version);
>>       uc_fw->file_selected.minor_ver = 
>> FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>                              css->sw_version);
>> +    uc_fw->file_selected.patch_ver = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>> +                           css->sw_version);
>>         if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>>           uc_fw->private_data_size = css->private_data_size;
>> @@ -1000,6 +1004,8 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw 
>> *uc_fw, void *dst, u32 max_len)
>>    */
>>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct 
>> drm_printer *p)
>>   {
>> +    u32 ver_sel, ver_want;
>> +
>>       drm_printf(p, "%s firmware: %s\n",
>>              intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path);
>>       if (uc_fw->file_selected.path != uc_fw->file_wanted.path)
>> @@ -1007,13 +1013,25 @@ void intel_uc_fw_dump(const struct 
>> intel_uc_fw *uc_fw, struct drm_printer *p)
>>                  intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_wanted.path);
>>       drm_printf(p, "\tstatus: %s\n",
>>              intel_uc_fw_status_repr(uc_fw->status));
>> -    if (uc_fw->file_wanted.major_ver)
>> -        drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
>> -               uc_fw->file_wanted.major_ver, 
>> uc_fw->file_wanted.minor_ver,
>> -               uc_fw->file_selected.major_ver, 
>> uc_fw->file_selected.minor_ver);
>> +    ver_sel = MAKE_UC_VER(uc_fw->file_selected.major_ver,
>> +                  uc_fw->file_selected.minor_ver,
>> +                  uc_fw->file_selected.patch_ver);
>> +    ver_want = MAKE_UC_VER(uc_fw->file_wanted.major_ver,
>> +                   uc_fw->file_wanted.minor_ver,
>> +                   uc_fw->file_wanted.patch_ver);
>> +    if (ver_sel < ver_want)
>> +        drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
>> +               uc_fw->file_wanted.major_ver,
>> +               uc_fw->file_wanted.minor_ver,
>> +               uc_fw->file_wanted.patch_ver,
>> +               uc_fw->file_selected.major_ver,
>> +               uc_fw->file_selected.minor_ver,
>> +               uc_fw->file_selected.patch_ver);
>>       else
>> -        drm_printf(p, "\tversion: found %u.%u\n",
>> -               uc_fw->file_selected.major_ver, 
>> uc_fw->file_selected.minor_ver);
>> +        drm_printf(p, "\tversion: found %u.%u.%u\n",
>> +               uc_fw->file_selected.major_ver,
>> +               uc_fw->file_selected.minor_ver,
>> +               uc_fw->file_selected.patch_ver);
>>       drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>>       drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 344763c942e37..cb586f7df270b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -73,6 +73,7 @@ struct intel_uc_fw_file {
>>       const char *path;
>>       u16 major_ver;
>>       u16 minor_ver;
>> +    u16 patch_ver;
>>   };
>>     /*
>> @@ -108,6 +109,11 @@ struct intel_uc_fw {
>>       bool loaded_via_gsc;
>>   };
>>   +#define MAKE_UC_VER(maj, min, pat)    ((pat) | ((min) << 8) | 
>> ((maj) << 16))
>> +#define GET_UC_VER(uc) (MAKE_UC_VER((uc)->fw.file_selected.major_ver, \
>> + (uc)->fw.file_selected.minor_ver, \
>> + (uc)->fw.file_selected.patch_ver))
>
> Might be worth saving this in a variable to not have to recalculate it 
> each time. not a blocker.
>
>> +
>>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>>   void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>>                      enum intel_uc_fw_status status);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> index b05e0e35b734c..f214d24fbcf0d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> @@ -83,8 +83,10 @@ struct uc_css_header {
>>   } __packed;
>>   static_assert(sizeof(struct uc_css_header) == 128);
>>   -#define HUC_GSC_VERSION_DW        44
>> -#define   HUC_GSC_MAJOR_VER_MASK    (0xFF << 0)
>> -#define   HUC_GSC_MINOR_VER_MASK    (0xFF << 16)
>> +#define HUC_GSC_VERSION_HI_DW        44
>> +#define   HUC_GSC_MAJOR_VER_HI_MASK    (0xFF << 0)
>> +#define   HUC_GSC_MINOR_VER_HI_MASK    (0xFF << 16)
>> +#define HUC_GSC_VERSION_LO_DW        45
>> +#define   HUC_GSC_PATCH_VER_LO_MASK    (0xFF << 16)
>
> AFAICS the patch version is in the lower 16 bits here, while the 
> higher 16 are the build number. e.g for dg2_7.10.0_gsc.bin (available 
> in drm-firmware) I see:
>
> [00000b0] 0007 000a 0000 0574
>
> Daniele
Hmm. You would indeed be correct. I swear I tested it. But probably I 
tested on a non-GSC version or something!

John.

>
>>     #endif /* _INTEL_UC_FW_ABI_H */
>

