Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9415FDDC1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 17:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC1810E8F7;
	Thu, 13 Oct 2022 15:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E130C10E8F7;
 Thu, 13 Oct 2022 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665676604; x=1697212604;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YxjqnGpuvWbYFkTXjE9OubaGVMS8FoKrLukeCCeOr0s=;
 b=j12B/sAxCBH7CXEHw048Z+b9rzA+k/LRI4QSc/xFRraeGKHu3SgcUuOz
 ILiyV4dGPcWWNFn+lgmOKLvx7CLtjK6l/N9kK68Kpv8kNBLI6/3+LGv2h
 2XJVpgoADx/gOJA9Ix8u2uyZ1WvbWskD5RmhgWVjbg2LjNyiRUh7+JEnz
 J2NDe0wJq5559kN+CHUN78NCGrRZCIhBsRMoQipah5LTvqNDQQS2z9Lah
 TzBw/rrXFCSNybZ0xl/2fJ26rktXEVuopXwvwOJywXWBlAO42MD9TTjZ8
 XKc/QZ5NIe0n51Ri6Z6ph96/G74RYeel0sejkt2XGjH7EvILrzjU87yJi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="288397268"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="288397268"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 08:56:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="622211345"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="622211345"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 13 Oct 2022 08:56:43 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 08:56:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 08:56:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 08:56:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 08:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnRFVN074cyLiYgpteTyBsErH9WedIHTXKj4XncgTwrMn7vurF0EGncePPwGAOHB1GWA0YuGXUWWaDcIPIpg+pSnX3gYeShyiV+Yyu8WmRWhCZhaL6L2stvgc7ccW3bEc5L/3SyQ6jpsFwS+0EBPlrKgyuH2M/Uh5nwLOj3Z21PQGa+pqeRuCMr7MKR9rQVHM1/5UsmNNtUUvw5rYP+k2WUdJX3SnmeNjuYBsQlojZQISr5BR0yo6013v2NPub3sFFwFEHWDinw9Zo1S6SkgWI7QwjRJnyLdy5shFv53ca95zPP7iVKZkvpFFncfdL+e7OFFMc+o0JgS+n0zlV6Abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wTAPdJ+PEJna1c9FZfNz6XQPrnIej81VsKT5Xo5csw=;
 b=SSoWKYpzGgf/ZUiRR0frCCX8ArVOFaY6fnaZ5Ev5streCs0Y2hiyT5lbdruur0qYrqDIk7H3vaZ4fiWJFt2AU5ZNAW2cMdBBSZVPV1LEpmEdJ8nKvsQua8AHKxZu1vEKKovb1laGFJnHm9cI67igZ4+IroU4xTOTcgDi62WvJzbrf4DvBiQTqoNUpUe505/g4iF4MrcG0BFdW74K/lRU5h3wIkU+xi3jIV+QP+RIcPgUIXXDSMgOr/W9QvvIjcOXKU7q6CmBEbEmTOsaiBgicTP5/EueGKFBQFuC5QkSAgRAEnqy1Ud7IXI7ThMeaPlT0VgcVIheRJ7WpQ//OmM5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 15:56:32 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5709.022; Thu, 13 Oct 2022
 15:56:32 +0000
Message-ID: <64a2a88c-6674-4676-162c-d19b8b7755b9@intel.com>
Date: Thu, 13 Oct 2022 08:56:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] drm/i915/slpc: Use platform limits for min/max frequency
Content-Language: en-US
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20221012182625.10219-1-vinay.belgaumkar@intel.com>
 <e038f976-c8bc-5059-ef5b-558492d175d1@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <e038f976-c8bc-5059-ef5b-558492d175d1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ece13a1-0bce-4622-e046-08daad337feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sw2u2PxqBRzGpefHvqhMowQGzp/ZEUqBJLXtoCDbhZ7BKBILhEawIk8FxtSMy19HyJ1oOOml4434TAB3lpuxyf5JrQc7C9oo5WsZzpK1LBAIJ701rkU+pVGTb/6sUT4lb/inEuyWPaGThQbpPrq+5m+vxZ15D63RMb5YiEQmzC763Nw1IQZqwmB2ZkcWI6sUBL1YjkSVKbfDSLrOky+Jwwd4oW8tOAFRsbm9Qz3Ghx32ggZmajA3xGTDqdmDbFIepubOqnHe3HeNniOuqJCxg+lphyMP56vX33lrW/Gs27rwVXfY1VxIuNzTHdXopMh5ZuYG/b3bXGjFthF7jWYvPUu3+G6ahem+pT3H5soCaByvPRXK29CXx5ssmBghdm6JsxdeZ9k5cF6XXZaa4jXdA+FhBIjKraF1thvaWmPuV28+vulMdQrtWedOXpFOYZQaJsIe+qC1+xTYdEcXlLVRo5NUIopCrG0tURUhst6pWS8xrzWY/YeSYWRuEiCm9ddLw8IzkIh522tcuPWe3skif3zyBr2hhBOm3rMhgqokAZcuqLiPbJLWV6+U/1q7H+4qA5KBJn6M2JfsulPqwNLk40HeQ+J5mQ9ljzQ/n3O4BQ/sVBrT3Xbw39XfY5YkAEL3Yix20sr+oqrvUt37PRVn+vDmW62Y6v0G+7RWySFfvp6RbpJAu7oj1Lxeywt+j1f5BAMSFIUP8E7VmKBEvM7oyFrdrSExhfnkU2cmDAwyvToyy3ZrhPTE+FkVH1vbb/QTJLuH1vQDlZfkQK9Qn9aLnRzOj9WeebGjstjimjG08Uc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(82960400001)(83380400001)(38100700002)(2616005)(186003)(31696002)(8936002)(5660300002)(8676002)(66476007)(41300700001)(66556008)(6486002)(86362001)(478600001)(66946007)(6506007)(53546011)(6512007)(26005)(316002)(2906002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykg1eVlzb2NiWEtxeG1lOFh5aFlqTE13MWxzR1d2bmd1UWRERDc2c2FQdVVo?=
 =?utf-8?B?MWNURVpNdU80WUJpSEhiRHZVaW9GV3R1aVRGcWkwbHJvM25ZNkVqWXhJNXU1?=
 =?utf-8?B?YWw0TjlNZmJDazdKVHpadzE5MWZ1c2FxMS80S3pzT2plZk03UkJTOVJ2UUhw?=
 =?utf-8?B?NHNDaUo2bWpOUlhBVkd1eW0zN3FmUXpiWmJtbVJVdlJzT1lwMU5zWHMrNTVr?=
 =?utf-8?B?YWZGNndEaTJzRnZPQ3doWDZIaHhmcHBMWHNzU2FFdXpwbWdvWUhvRmQ2RGZJ?=
 =?utf-8?B?N3k0S2ZoZXZwTno0VHIwbEdtcnIzZlVxUGZDa2RCWm5uV1ZCb0ljdFEvU0ZJ?=
 =?utf-8?B?U0l3UmVpT2kxMkpSMmsyVC9zZ0R1dEVFamFZTVNoUVIrb0ZpYXJEa1BVZGdw?=
 =?utf-8?B?QlMvUGRuN2hvTUR5M0M5Y1JPWEgwS1VUaExlb1A0Y1ZpQTVNeVN6SytFaW9L?=
 =?utf-8?B?aDJYdjlrYkFvN3puYm50MlJ2eHNqbXhNT2ZyVjN0b0VSNWxVVDk2cFZaSzM5?=
 =?utf-8?B?YlBuZU1YT1FmeDlOWTQ4ZVMzcDB3N1NRaFdJOVE5emZuZ05qWjFEUUVaZ1ZX?=
 =?utf-8?B?dW56eFp1OG13Y2FGWlZZL3NyUVBmYzJjZGZ5OHRVV1owYU8xWUQ0TStwRmx3?=
 =?utf-8?B?SElMYW53K2UxSnhxOVRKYk1hRDhsMzZuUXRIN1o1ZEFBdHhhMGQvbWhIRllH?=
 =?utf-8?B?Qk5PbUZZclFMdkthVTlSckhNUzZ0TSs4Q2J5Y1p5RkNIdnZkNDV4ejI1NXI0?=
 =?utf-8?B?WHdYWlFYRWhiVWZ5VjNxRU01Z1UrME1Ha1drSXFRNzBXcjBQYzMzdThKRk1l?=
 =?utf-8?B?QktVcjNyL0NhdmVPL3c5U3Z0aHhrYTVoU2dXTWJVYkczbHRXYUcvMzlKeUhS?=
 =?utf-8?B?WHRMUHVDVkd1LzRLUGNOZzh2RXZuMWJGZ01VWmpUTXBQRk84QXhmM0d4M25N?=
 =?utf-8?B?V29BeXR5MXhjcm1Gd0tncnR1K2RVNzVYUE9wbVFXUk1vNVJuOURQQkZkTE84?=
 =?utf-8?B?TWhOMDNscVFtcm1MbVJVZmMzRU5IY1ExaDA4bEI0akdhQnltakh0VW1lVWdv?=
 =?utf-8?B?U0J4dUlHNlZXQUxqZytpcFJyM3daOTgzSTRyUC9aR2dZdHZhV0s3UjFjNHhD?=
 =?utf-8?B?QWxISGl3bnd2ekdYOGVZRUtISGpyY2hNZHNrRll2TU85bmNTU1M0NVJtMWpL?=
 =?utf-8?B?TTdqMjNRTDNCK0xLaWEwRDJvZTU1SEErV284RHpFb3A3SlpEQTJXcWFmbjgx?=
 =?utf-8?B?OG9kRGpLNVprQnA5S0dQakNpVWV6S2g2eGlSN1BvWW51dVdJNUMzZ1pjWnZP?=
 =?utf-8?B?aEcrSEdnbjhZUU5ZVlFhYnh5bnNQRVI5OWJzaDFvbG5tQjJ1aEdhNFlhZldM?=
 =?utf-8?B?V3locStaTGM0UjB2d1N1OVN6c08vUmNEdEF2bjZsK2xMeDY1bWo0RXJ2ajFX?=
 =?utf-8?B?NXlPUithUWsyOG5BTkU4NlNVb3NmUDFhenR5azYvVkQ0Lzg1NGRwdFFnODRm?=
 =?utf-8?B?UUc3OHh3a3cvSG9YOThvcDI0U2VGMFNkQitPWlRBZmo2cnhIUzRFS3JzMW9k?=
 =?utf-8?B?WC9HUTErREE5Y29mQ21wcXlTbVEwOHNodmpTL2dXc2ZiYm1GSGpQU2pCdVJr?=
 =?utf-8?B?OGgrMFNlUldHbXpmMlhtc0k4VXpXZ3F2Z2o5SjNVQkdia2hzWXYxMXpGVnA0?=
 =?utf-8?B?ZmNuRm1kdnhOWStiV29ZdTVjMjB4VDFnY2ZuNmVTenZEY2tOZnhNQWJ3MGNn?=
 =?utf-8?B?N1NRa1RUY3EvSXZlVUJRNzZnaG1KRmwrZVBnQWE5V0VldDlOSDFIMnN0TlBk?=
 =?utf-8?B?K01ISUY0TzVuaFNlODNXWXJJQUxtTmhFZlRkNEJ0QmxqNjFleVovQVE3a3kr?=
 =?utf-8?B?WmNrRVNHV0UwTEhxRmU5cHovRE1KeG5ScEV6VHBhNDc4MlNyMlZ2Vk85cXRz?=
 =?utf-8?B?SGJINGs2NFBBYnI0YmhZekRMWjk0NDE4OWRzOG1leHdJWGRxTHpRODFUdW9h?=
 =?utf-8?B?VDE0WGkyRzJ1MlkraFN6MlMwNlBtWEYzYVBzd051YkJFMWRZVHRXT0U0cWwz?=
 =?utf-8?B?MWtEbk10TWFLeVJJb3R2VXRGbitPVGRCK1JVNnkxMHM3SnF6eTJJUStsR2xR?=
 =?utf-8?B?UzF1NnRNYXV6RFl4VzZjVUtqNXovcE5lRHBPeEFVdGRaSjhPeGlJSktXRUd5?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ece13a1-0bce-4622-e046-08daad337feb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 15:56:32.8698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47osiv09LESd7po2WoRX3CFykSZJ3rszQow7vXGoEnDmoLKPkYJJQ0bpwPnKG5EfwgMut3I2T39lrTJ0ZITlrNCpjWUeUsBKm4IwwZ80znM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/2022 8:14 AM, Das, Nirmoy wrote:
>
> On 10/12/2022 8:26 PM, Vinay Belgaumkar wrote:
>> GuC will set the min/max frequencies to theoretical max on
>> ATS-M. This will break kernel ABI, so limit min/max frequency
>> to RP0(platform max) instead.
>>
>> Also modify the SLPC selftest to update the min frequency
>> when we have a server part so that we can iterate between
>> platform min and max.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 40 +++++++++++++------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 ++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
>>   3 files changed, 60 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c 
>> b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> index 4c6e9257e593..1f84362af737 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int 
>> test_type)
>>       enum intel_engine_id id;
>>       struct igt_spinner spin;
>>       u32 slpc_min_freq, slpc_max_freq;
>> +    u32 saved_min_freq;
>>       int err = 0;
>>         if (!intel_uc_uses_guc_slpc(&gt->uc))
>> @@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int 
>> test_type)
>>           return -EIO;
>>       }
>>   -    /*
>> -     * FIXME: With efficient frequency enabled, GuC can request
>> -     * frequencies higher than the SLPC max. While this is fixed
>> -     * in GuC, we level set these tests with RPn as min.
>> -     */
>> -    err = slpc_set_min_freq(slpc, slpc->min_freq);
>> -    if (err)
>> -        return err;
>> -
>>       if (slpc->min_freq == slpc->rp0_freq) {
>> -        pr_err("Min/Max are fused to the same value\n");
>> -        return -EINVAL;
>> +        /* Servers will have min/max clamped to RP0 */
>
>
> This should be "server parts". Tested the patch with Riana's suggested 
> changes.
>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com> with above changes.

Thanks, v2 sent with corrections.

Vinay.

>
>
> Nirmoy
>
>> +        if (slpc->min_is_rpmax) {
>> +            err = slpc_set_min_freq(slpc, slpc->min_freq);
>> +            if (err) {
>> +                pr_err("Unable to update min freq on server part");
>> +                return err;
>> +            }
>> +
>> +        } else {
>> +            pr_err("Min/Max are fused to the same value\n");
>> +            return -EINVAL;
>> +        }
>> +    } else {
>> +        /*
>> +         * FIXME: With efficient frequency enabled, GuC can request
>> +         * frequencies higher than the SLPC max. While this is fixed
>> +         * in GuC, we level set these tests with RPn as min.
>> +         */
>> +        err = slpc_set_min_freq(slpc, slpc->min_freq);
>> +        if (err)
>> +            return err;
>>       }
>>   +    saved_min_freq = slpc_min_freq;
>> +
>> +    /* New temp min freq = RPn */
>> +    slpc_min_freq = slpc->min_freq;
>> +
>>       intel_gt_pm_wait_for_idle(gt);
>>       intel_gt_pm_get(gt);
>>       for_each_engine(engine, gt, id) {
>> @@ -347,7 +363,7 @@ static int run_test(struct intel_gt *gt, int 
>> test_type)
>>         /* Restore min/max frequencies */
>>       slpc_set_max_freq(slpc, slpc_max_freq);
>> -    slpc_set_min_freq(slpc, slpc_min_freq);
>> +    slpc_set_min_freq(slpc, saved_min_freq);
>>         if (igt_flush_test(gt->i915))
>>           err = -EIO;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index fdd895f73f9f..11613d373a49 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>         slpc->max_freq_softlimit = 0;
>>       slpc->min_freq_softlimit = 0;
>> +    slpc->min_is_rpmax = false;
>>         slpc->boost_freq = 0;
>>       atomic_set(&slpc->num_waiters, 0);
>> @@ -588,6 +589,31 @@ static int slpc_set_softlimits(struct 
>> intel_guc_slpc *slpc)
>>       return 0;
>>   }
>>   +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>> +{
>> +    int slpc_min_freq;
>> +
>> +    if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
>> +        return false;
>> +
>> +    if (slpc_min_freq > slpc->rp0_freq)
>> +        return true;
>> +    else
>> +        return false;
>> +}
>> +
>> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
>> +{
>> +    /* For server parts, SLPC min will be at RPMax.
>> +     * Use min softlimit to clamp it to RP0 instead.
>> +     */
>> +    if (is_slpc_min_freq_rpmax(slpc) &&
>> +        !slpc->min_freq_softlimit) {
>> +        slpc->min_is_rpmax = true;
>> +        slpc->min_freq_softlimit = slpc->rp0_freq;
>> +    }
>> +}
>> +
>>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>   {
>>       /* Force SLPC to used platform rp0 */
>> @@ -647,6 +673,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc 
>> *slpc)
>>         slpc_get_rp_values(slpc);
>>   +    /* Handle the case where min=max=RPmax */
>> +    update_server_min_softlimit(slpc);
>> +
>>       /* Set SLPC max limit to RP0 */
>>       ret = slpc_use_fused_rp0(slpc);
>>       if (unlikely(ret)) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index 73d208123528..a6ef53b04e04 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -19,6 +19,9 @@ struct intel_guc_slpc {
>>       bool supported;
>>       bool selected;
>>   +    /* Indicates this is a server part */
>> +    bool min_is_rpmax;
>> +
>>       /* platform frequency limits */
>>       u32 min_freq;
>>       u32 rp0_freq;
