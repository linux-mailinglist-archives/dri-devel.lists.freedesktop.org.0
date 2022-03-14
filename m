Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBF4D82B8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E15510E6DA;
	Mon, 14 Mar 2022 12:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77610E676;
 Mon, 14 Mar 2022 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647259735; x=1678795735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YC+KTRKcvfmakDWF4uqXoDKaiZAdaHvkoJyOzO+J+bI=;
 b=T2niafGb2HlQSrjAZM2ZdO4wjzEE2Shk3vT7wE0O2OXrcCxLVxdV34B1
 n4Wj0F8+4+jd7jndGAJf8OLkQUroqElO/3M7rBlwbK1JBpfhFcgwvwBqD
 /nDOzpIhN/J13XZ9Po6XSb1dLzrG70KrBZyRj7N4uT4zsdaiPp+Iweye6
 J6bmZ+HNZjgXRiPEWFZjmS6ZdWRmG2g7382AswIvZSM+EwXXpw44rWkTF
 rD2/zFpUdpiQxc8sQ9oaBeMc/m/b91ADTP3KWqPH2bbwS/GpwbW+cCur4
 +X1p00rzVBvloea0yH0+K+sJZyWL9+FdnGISqOL+jFyvA0RS4dBc+V1Ai Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="243456025"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="243456025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 05:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="497585630"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 05:08:54 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 05:08:54 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 05:08:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 14 Mar 2022 05:08:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 14 Mar 2022 05:08:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOmZkBDd5CNd0PTWSSKqJdeunNJ4vNPM5gBPVMF+58QaMPVUtgWlJmgXmWG4mP4rNEHuypT4EoeoQ+9i8YHIdkJcqHToIAI5qVQrX3zW+GTDZHwA9NqVc89l24G3jGWqykpi9EUPNn2jZkETMU5Zu5cbtQV+JYeR4PS5y5M02eMqyCc3a7S3BgZcl8YbaEx4ejtmcD2tC3/MVd3X0XNtIIIuqiSVswTH9aY68lyG/zgYHscEAuD1mEbOt8m3FBC8DKwW9EKvyKds5hl6TR7setM0fBU+/NUXdaBZqSf+R2DZJeHBADmEDj93dcgIk9khzoOovQFu7cW1irfIQzkFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d19FYIXSa/IJsxUYNC4jPlI6yhw67jqoYYmntlmHJnA=;
 b=K7wa+L2mmWfxBvfq+pEy4GNuCIDPIPj05+R0dCtxZV1hMac21NLUTtEqwDfr206mEcji6lCwDW9i+g/iS6TajrtuOUIlXUOLmHfdHDO6BdJbjzudeUo4Rf6NV09i3Lk5XvvgMLYyTEutNslVxD7k9Rqnt1q0HsFmYMQ2FleQKfWjv3DE7J9/pxlJfpbU8GSA0XF8eubctDFY8T5RDH4h/6XJsh+Zo1XBKaTU+5EAd1ZSbAOTDLLZmyvfC5eQC4ptoFSqxMfTIPXzbzPhDZQ02Lo8pZ+WpzYqfa97cBZlPthVle06M8w6eDAD0m13rgkNM8YhovX+T8tyUuY9v4EPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22; Mon, 14 Mar 2022 12:08:51 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 12:08:51 +0000
Message-ID: <f6b14fa3-8d4e-4c93-20a7-5acde224bbbe@intel.com>
Date: Mon, 14 Mar 2022 13:08:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v5 4/7] drm/i915/gt: create per-tile sysfs interface
Content-Language: en-US
To: Andi Shyti <andi.shyti@intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-5-andi.shyti@linux.intel.com>
 <e096ed88-ec87-b45c-22ba-80d48f480808@intel.com>
 <YiU9+uRCzJAZlcRh@intel.intel>
 <70f07f08-36d8-0af8-adce-a3a4c780527c@intel.com>
 <Yi5J1HB5uypRUIW+@intel.intel>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Yi5J1HB5uypRUIW+@intel.intel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc4c2b5-bec8-4b53-468c-08da05b36724
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB00080FE9721AA7638D160BE9EB0F9@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frVAKAJpx84vPPg32rlRQl2wHkzh0CPkcJYJ5dI5w7YhtZy99w5vPXzSClM4vH+IPg+4QchGgJDDKyAqcyR6ZwQs2FKzYhpMchAq/oXnwEWCaV0OqWH1pL7zn+p6PfpASxMe+uY3hYVFXhyydK/wGFLCwV3+uKGEjIfPHPGY/elpigcq/E2iVIeoFiZq+P6hh3RP7rkcwIkRSnRidK8zdGjVzgCJVgjI+u5xKy+y+gFXaUaN4amVh0364R4tGyudqpwpvzBYv/a4e95pGcKb7MI26YuxKzele1ZYxwru4bKf/8K+ti8MJtCm8QwOgahqmBek+8jDWyFn89QanBQ0pxEGdEaCTKqCieVF5nT/e86AKQwtV5cGb6UW2AY8zOV1NMRpIQUv4Zc01elAC/wH7+OjlN/wMmrissA6g2AgT5i1jRSoZuaDrqf0gZJhjzVYM0jtm6HElScShkeBxsEgoXZqi0v3fAS0DCQ4H4xH6mE1mS1C4oYkpbNJOIR599V0VtAljQRVbr48XnlFgK4KjoTLeY52CkfVv3zwqlNBCPuDyW5kG7dYyLIb9vowM8MfDBPUzTj0dPB7tkpEf1cxZr9RdPTBLiNUboDcdQj2Vw+rb6M4ZObsJlrDwFdngUoNzfI8ihGInnD7tmQejQ5MI7SpArtefiMP8Ht+wXxltVDcgVNw1QaDIcQNT/nCG2ua1r8GJPdn3ZfhChRQHwanXjS7sIyDLDCjriT3J8UY9ohDYu3lnU2CMHcPIUQAcP7+cYCsInOJjtIfJPBZXFGTbn0khZudziBG1bAQ77IORfi+kHekY8OOugHFUEgUO83a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(316002)(5660300002)(86362001)(6512007)(44832011)(31696002)(83380400001)(66946007)(82960400001)(53546011)(36916002)(6506007)(8676002)(6862004)(186003)(26005)(4326008)(8936002)(2616005)(66556008)(508600001)(38100700002)(36756003)(966005)(66476007)(31686004)(6486002)(54906003)(37006003)(2906002)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHdaWkV4a1pIVm54bTJvb1B1WVptWUV2bWR1d2VjUlRBUDR6LytaSGk0Yk9u?=
 =?utf-8?B?NzFiOUlwL0RlSEpQNW1iVjVLWHFPUXdqRDBLK1pqSkhkOXZObm5mWWJlSmdy?=
 =?utf-8?B?Z2xvM1VPM3VKcEViUncvVkxiZHNaazVZdndEQlc5UWJsYStvTHFudmlUc3Vw?=
 =?utf-8?B?YlhLWk1sNHliL0dHVURmQ0lZNzhST29Bd0tIMmhpWitTSXIrc1MrcXRRZ2lG?=
 =?utf-8?B?VFhheFQwNmxEeG9qejJ5d1JjbUFUb2Q1bzZkc3dWeHZQYXBFbmFGaUx6VmJS?=
 =?utf-8?B?TFZUNWk4RTNDNDZUUGQzV09hUDR6L1R2Y0NraWszSEdDVDltZFR4dGc5eVBo?=
 =?utf-8?B?YkJmamdid2lCbjVscG9FQWVhanp0TS9YL0k2K3Vic0dlditmWTI0MlFGTU9K?=
 =?utf-8?B?NUZLbm5RMkFIcUJOT3p6a0ljTWJUY2J2UjVza01sdjR1V1ZIajIrNm9LZ0NM?=
 =?utf-8?B?STN4YUJGYk8wa0NQbldRMWpIdFN2YnlPaDR4R2xQRCt0WEN6STRkcmQwZGtk?=
 =?utf-8?B?cmZJSEl4T3BZaE5qMlV4d1MvQlNuRlhsWmhJS3RIaVdwYkFlb1c5YlYxWFB4?=
 =?utf-8?B?ZEdNdnlhYy92Zm1UQTZIdXFzc1JKa2NjTlljOTRhU2pPOWhyNzh0RUtMZG5K?=
 =?utf-8?B?T3lMOWE0SDdXcnA0TFVjU05tREV1MlVFclNjQkZBRU5qTkJBV2plQzZxVFFU?=
 =?utf-8?B?ZGFvUTN3QVNHU1ArblhzYkVWTndqQTFzbUVUS1BsNVB2aDZ6MkxRVmVqU2NU?=
 =?utf-8?B?YmVUWDZKcGdHeW92K3g2RU1qZWxLZmxtR3QvNHJsUjBXTkkvQUxidmkyWk53?=
 =?utf-8?B?U3A0enIwVE1mQUhQdm56NW5WTG9OR3NPK1ljVTdEeDNVTGZwMFZxMXVnUFlY?=
 =?utf-8?B?UDFtL2RnVDBtWHBGM1RKTU1CVkNXbTlhYmdXczMwUkJPWm1hWk5Nb0F5WGQ3?=
 =?utf-8?B?a0ZMSnNQdzFsM2xsMGFKNDNkNXA2K0F5djI4SkJLT3Myd2o2VHl1V21aTXBK?=
 =?utf-8?B?SWV1U1ZNVG5LYmpreTVLWmZVOHlmYXgveHg1c3hBTGFBa3huRnpHUU9EaVlX?=
 =?utf-8?B?ZFdoVnlYeUI3Q1RRdEhhT1NmdE5MMTl4bVU5RkN3cDNvMjRrMEFPUXBOTjVU?=
 =?utf-8?B?dTZEOEFXZjMyZWtjY2pJOUd6czlSOFVHV0k0cE13L2o3VEIvNnozb3lucEsw?=
 =?utf-8?B?akkrUHNtOGVCaGR5cWNtdENhZXVTdmE4QlFTWHM0M1M3Z29laURPV1duUFo5?=
 =?utf-8?B?UStvUjNnWkN5SnVXOTRacU03T2VJVEkrMVloOE1KQjliWWFxdXZ1cnVpdTBC?=
 =?utf-8?B?RmhqSDNtei9GU0djQmI3U2s5bEoxRjlDZ0xGQnhJc3EvQmViOWF3MlY5bW8r?=
 =?utf-8?B?b3I0MlBSaFVNVHVackZyNzFDM1hNcGZTdGtMNUtBcnlZTjhHaHJSdVFuZmN5?=
 =?utf-8?B?dHNSUVhydkZEby96aHdUa0N0c3lnTVZSOHVjcW1MM1hTS2tmeVhGZ0FZbUpl?=
 =?utf-8?B?alBLd0g2aEQxRHZIWlF2SGVVUUw0ODM1czZEMkFqZXVtS096dlpkV1IrbGdY?=
 =?utf-8?B?NytUNDFTRTdwb0U2U3JmWXYvVHhvRS91WU02dVo2ZnpDdlQyZFNUNmh5ZnI5?=
 =?utf-8?B?VVJEeGlEZUhXVHJwSWZ3c2gxYTlGTE1ISnJKTzA4eFF4MlAyKytFcFlVZHE4?=
 =?utf-8?B?R2lUOHVlSXNVcnZoZnBxMzk2RHdIOWtzL3NKMjlOS3MxUEQzMWowOHRZZzlQ?=
 =?utf-8?B?U3pvaDRvcEJZN09pSXZXSThET0Uwd2Z1d281ODZiK2VabDN0NzJaWWRKbFBV?=
 =?utf-8?B?aktKbDVtQnRQWDEwQ3RuWkhNbVJCbmR1N2YrVTdWVmJpSkU4RE1MWncwekts?=
 =?utf-8?B?aHRvT3o1NFJna29RYjR5amhMRmxvOU1nSURldkJpZUQ3NTR0akZjY3U3TkZa?=
 =?utf-8?B?K2NnMTdmTmt4dzV4dzA1YU1TZWtOUWVXZGtnU3Izd0FCNUk0SVlON2lHUHBL?=
 =?utf-8?B?Qk9CZVZuSTd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc4c2b5-bec8-4b53-468c-08da05b36724
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 12:08:51.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVGf3ubaNy3wImGu0sw758MlNAQjJEVc+/F65PUFHSJ6s8EnhFvE5T1GzTfkN8+0HSryIMLxhytCjpWRSC1+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13.03.2022 20:45, Andi Shyti wrote:
> Hi Andrzej,
>
> I'm sorry, but I'm not fully understanding,
>
>>>>> +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
>>>>> +					    const char *name)
>>>>> +{
>>>>> +	struct kobject *kobj = &dev->kobj;
>>>>> +
>>>>> +	/*
>>>>> +	 * We are interested at knowing from where the interface
>>>>> +	 * has been called, whether it's called from gt/ or from
>>>>> +	 * the parent directory.
>>>>> +	 * From the interface position it depends also the value of
>>>>> +	 * the private data.
>>>>> +	 * If the interface is called from gt/ then private data is
>>>>> +	 * of the "struct intel_gt *" type, otherwise it's * a
>>>>> +	 * "struct drm_i915_private *" type.
>>>>> +	 */
>>>>> +	if (!is_object_gt(kobj)) {
>>>>> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
>>>>> +
>>>>> +		pr_devel_ratelimited(DEPRECATED
>>>>> +			"%s (pid %d) is accessing deprecated %s "
>>>>> +			"sysfs control, please use gt/gt<n>/%s instead\n",
>>>>> +			current->comm, task_pid_nr(current), name, name);
>>>>> +		return to_gt(i915);
>>>>> +	}
>>>>> +
>>>>> +	return kobj_to_gt(kobj);
>>>> It took some time for me to understand what is going on here.
>>>> We have dev argument which sometimes can point to "struct device", sometimes
>>>> to "struct kobj_gt", but it's type suggests differently, quite ugly.
>>>> I wonder if wouldn't be better to use __ATTR instead of DEVICE_ATTR* as in
>>>> case of intel_engines_add_sysfs. This way abstractions would look better,
>>>> hopefully.
>>> How would it help?
>>>
>>> The difference is that I'm adding twice different interfaces with
>>> the same name and different location (i.e. different object). The
>>> legacy intrefaces inherit the object from drm and I'm preserving
>>> that reference.
>>>
>>> While the new objects would derive from the previous and they are
>>> pretty much like intel_engines_add_sysfs().
>> I was not clear on the issue. Here in case of 'id' attribute it is defined
>> as device_attribute, but in kobj_type.sysfs_ops you assign formally
>> incompatible &kobj_sysfs_ops.
> 'kobj_sysfs_ops' is of the type 'kobj_type'.

Yes, but for example kobj_sysfs_ops.show points to function 
kobj_attr_show, and kobj_attr_show expects that it's attr argument is 
embedded in kobj_attribute[1], but this is not true in case of 'id' 
attribute - it is embedded in device_attribute.
In short kobj_sysfs_ops should be used only with attrs embeded in 
kobj_attribute, unless I missed sth.

[1]: https://elixir.bootlin.com/linux/latest/source/lib/kobject.c#L836

>
>> kobj_sysfs_ops expects kobj_attribute! Fortunately kobj_attribute is 'binary
>> compatible' with device_attribute and kobj is at beginning of struct device
>> as well, so it does not blow up, but I wouldn't say it is clean solution :)
>> If you look at intel_engines_add_sysfs you can see that all attributes are
>> defined as kobj_attribute.
> That's exactly the approach I use in the next patches for the
> power management files, I use "struct kobj_gt" wrapped around
> "struct kobject". But I'm using that only for the GT files.

But attributes are still defined using DEVICE_ATTR* macros, ie they are 
embedded in device_attribute, so the problem is the same - you are using 
kobj_sysfs_ops with device_attribute.

>
> Are you, btw, suggesting to use this same approache also for the
> legacy files that for now have a pointer to the drm kobject? This
> way I would need to add more information, like the pointer to
> i915 and gt_id. This way I wouldn't need the files above that
> look hacky to you. Is this what you mean?

Positive feedback is more difficult :)
I am little bit lost in possible solutions, after grepping other drivers 
I have not good advice about proper handling of such situation, *beside 
splitting the interface*.
For sure attrs used in device/power must be embedded in 
device_attribute. So if you do not want to split interface, then it 
implies GTs attrs must be also in device_attribute. Then maybe creating 
custom sysfs_ops would help??? I am not sure.

Regards
Andrzej



>
> Andi

