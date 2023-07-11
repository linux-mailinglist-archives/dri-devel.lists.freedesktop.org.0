Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1B74E856
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B0810E32C;
	Tue, 11 Jul 2023 07:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEB310E32C;
 Tue, 11 Jul 2023 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689061701; x=1720597701;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TL46lbfymL/17BBMKPyWXX5e5qXNf0nkmzCJFUEPULI=;
 b=Ugjqh1fE6IG7YmO24cCCUJ5YbAEhLdq3mW23Xg+sizUELDzV+33+VZF4
 qkpSBJdPSM3tn/QEbPuAlMl64bJ79QsFKMGV3kazdRu3h5OTmnCw7qMrC
 nLUOitSwb8OvpgobvL2C07NhB4Emug2Pk5ZEsBHcgLC6qsAzIe2FCtAtD
 gYxO2NvZp0tSNgrHsFtcgJy9Hu7qklXDmRn62V1QZVQk1tSpGemk5baQE
 1eVy+Y5hnTsvy9xkTMm+9tQBlI0QzzXywISTSzwH8jmOLYHelARVG/4VJ
 YyanzJn6uXr6O6xyzbP6d8uzT+oO/Dz9TdHzIcJt5vOlVXd3ZxqdVPt5B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428249846"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="428249846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 00:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="865666778"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="865666778"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2023 00:48:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 00:48:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 00:48:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 00:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5D8oB9K9sMIovsV4TyYblTVMcZLOzpdFXQCD4rip0ESdWnSVOsbOL7R6ZnbExt7gp1uqNIaAgpzy7K/AmRgFZ5tb8NWWfqkkJwfbor3+X4g0sn2N7wBtKRuOEms15/grKqeApN7sMykUNXJT/FY702vWXbw2hNzP6Z00UZ93DrSem4ddNxsZrtJtWPWvqnjK09/vtH0N1mhMaklHbh+n1vDhdamBIemFmL+mun07uRiGK89at12+texjzPqg74w0OUFnrz42RNa1a6jPjLGVnh4gborvCAgYi/1CJuzhRBGiiNEE4mAJ1b7gE7EIz+26O1nJDLHDITSbCBLJy8VMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sq1ZE+rnDCl6m0f7cs05KeOrB1lYBVlW5axAZuTIlo=;
 b=HNdwYudPXl9PPO6q7/jcxUSaIh1idnX3ZbbG6EupMmpgT88K0x3co5EC+jCXxXZcmeqJvpjAd6bH39gLUTKRgLz7WKzv20mirjStlSHCe2t1p+pIiPg8MFxi9Hpi2mIAc9mnzAuU9rwOixZwSL0SNtj4ajgCGIJ1Fj0nVmb+N0MPlYQDx8h3fdjgFVKHewMkjX1gM94Ure9RyctUTtPtt/HMfL2FZZxOROyeHlp5ouJS4zJijXueugEZOHbvZwlA1dCQBnNEIbtYfrdc0qvPxjz+yW/HQnbfRDOat1Xo/iMgXCaU6Qgi0/kzsuNuxbfGTjtW22lDeEtzX0N6T0/F4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 11 Jul
 2023 07:48:11 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 07:48:10 +0000
Message-ID: <4dfc48d3-1111-1d3b-c03e-7c5820f2274d@intel.com>
Date: Tue, 11 Jul 2023 13:18:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Add ability for tracking buffer
 objects per client
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-2-tvrtko.ursulin@linux.intel.com>
 <261b6cd8-3978-05ea-1348-c63e4599c518@intel.com>
 <e116c96f-e21c-255f-695a-a98a64fdb00f@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <e116c96f-e21c-255f-695a-a98a64fdb00f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::21) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: a21f4023-802d-45ab-8f01-08db81e32c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTk4eCpCRgcKVqNVuM+deAs8lvAjYnJ8dWMH6oio90p/WibRO26BPvs4NKAlTn+Cj7UjeRnZqyGqQn8qkJWnscCIBOyiP7ZeuVIhYoVUxbOdY+uP7AWR99Y8iH5zDTw9QD2HYI7JRmVE8ZAY60W09eXF55Red+u+7XG9tiMInzgzeaVCuwCbm7+QNpmMKIM88twjRMEvWPC0zkq/SsYE/89YbeSzDyAm/NtSI1QP01kcyycM9VSHcJzwr3LipGAuRa+7wwbsjhN3u5HCX9fS9B7kcZT//TmTVswM/Tc/yEZAubSYHCDLI/1RGSkj2i/8Fq/6bFkjtI40VeDw7qrssx2M2faphUDO2nBVeBMlbfL+ckrrQklW3bU/hTW0rVB+diWYGB7mQG3I/HQIhX+fPwCIb3TBMQCX74Tvh7IxVwUbDr3lBP/OqFOY1kEVfLZ2zYIJk/0AAI88IHTWVMbZhKBzsZE53ylz5atl0me5ezoRciMVRX3UpSJ7xdvdrNUKuVGzL+Q73mdiXURkWSyPnLH8zwYxlvZZ6TI1WePPLo6t3uhyB27oihdEn1xLyYFCxiVgSdz8f9TD6Bm3brKEO7P6KgBtYI2H4XbGDRktstmoF9BAjRZWXdNyxzOhmYKNgCOGtzUaRzXcPJpm2Iv/sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(2906002)(41300700001)(5660300002)(8936002)(8676002)(36756003)(31696002)(86362001)(82960400001)(2616005)(31686004)(6486002)(6666004)(478600001)(53546011)(6506007)(26005)(6512007)(66476007)(186003)(66946007)(66556008)(316002)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVA4MTFta1lBa081UTduQWxzWDVSMmg3UjVDVGM2ZFVxOXBMeW02VXFUL3R5?=
 =?utf-8?B?YWNaNEZRVmlTVW44RGIxMUN6Y0ZFdFRsOUJoODI5MG1BS2lpcWVDdkx3Vkx0?=
 =?utf-8?B?eFBuMURGQU5MeEJNRXAxVVlUd083OXJPQ0hDcGszNEU3MG1vc2ZzMmNSOHFW?=
 =?utf-8?B?YllTNEN2bXhXaU1tK2t4MjVZd3MwYnNISWNVSi83T0JOdHliZ2VneGNjandl?=
 =?utf-8?B?Z2E2a3FpamxlK0xpY2NtUzhyQnhCQU16MGNMNXlWWldFVjFrNjc0YVF3ZjIv?=
 =?utf-8?B?YnZZeUhZZmJnb3dEcHFld1NQc1JndlFUT3VWdHRUcGVidkhpYUVINHNBLzAw?=
 =?utf-8?B?dXh0VGE4ZzhlY2V2Qm9pZks0L2txbWR0ZmlyYjU5NFFyekgvalNPY0YrZGF5?=
 =?utf-8?B?NCtNZnd6anphdjNsa1p6V29YLzhJU3EzekZ4cDVWcTJhcnBMS2krd0ZqNkdQ?=
 =?utf-8?B?UXdiaUt1clNnakNQUklkQmRNQ0tKd2tFTGIzVTYrL3R3anU3TEgyWDd0ZFdw?=
 =?utf-8?B?S2p3L2JYWGoweW90eXoyR2ppcDJpaytzbWdYVkdDdW1FTm43TUtpY2dtTUtI?=
 =?utf-8?B?N0lDdnRENzlqY2N4QlBvdVlscVZxcWZ3K1pCNHFORkJOSUppWkMycmliSElE?=
 =?utf-8?B?NHQyTXA1VW12WmNlOEhIbml4OGxDaGVoVU9kMXBFaDRhdVBjOHJEczJpTlU4?=
 =?utf-8?B?aTNZcDFOMGdNbmtxRkVMRm9jOUs0Rm1IVXN6ekN1TmNzSzR6L3hrSnU3RXE4?=
 =?utf-8?B?dlB4RTBKdVhwMW1vb2lnbHc3UjUyUUJESXJrZHAzaXoyT2EzL0ZlOWp5T0Fw?=
 =?utf-8?B?YWh0MjhnNCtYUmNTR2I0NU9ra2hrbXhWL1dIRWZwRXVMclBLOUdlMFdYUTNZ?=
 =?utf-8?B?NlF4ajBUVjZ4Q3ZTVFR6N3NWU0N1Z1BPak5tSHF2SlR6OGJBeU9xUUFCeWJQ?=
 =?utf-8?B?My9Ta2dxZXdVVVZRbWRhWFoyK24rUE1CR2NxYlpLK3FBT2wyWEJvbCsyaFkr?=
 =?utf-8?B?TTlKMkFhdzJqUTNyRk9RVlVITmJVbFdaSTloZUVXYlhOcHFyQUlRZXFaM3RP?=
 =?utf-8?B?QWxKMmxDWFpQOWsvcDh5VWd3MzJHenMyTU4wN1Z3a1JiK1JsU0VGOVpBaVZr?=
 =?utf-8?B?WVRNVFlvU05kZFBGUmE5aSs0RDNIbG9wT1NuZEl2NndRUk03MW5pWlYzN3Zl?=
 =?utf-8?B?UFNPVEdFb3lZTlJTOXBubFFEYnhWd0lvQ3UyYVJBNUxpdDNlN0oydzhJeVBn?=
 =?utf-8?B?RnY1bjRxenFUYnVYRVd4NWY2YXIwL2QyWUJQMm1iaUlSdHBZaUdWYnRUSGNQ?=
 =?utf-8?B?SzE4OVJ4clBBalB1em8xdVkrMGRvamNZKzl0MFR1dDBORVptR25kQmxKa1k2?=
 =?utf-8?B?c2grTVZINVliUkpweDlPSDFHTXJlQ2xxZjQ5anh3UEtYWmN1Yk93UmFXc1Zt?=
 =?utf-8?B?VTdwUWwyYmk1SUMxbU5CN2xUUTl6SXFTd2tBYnlwdCsxbFAyeEEwRVhGSVU0?=
 =?utf-8?B?ZDFUaGI3eHMvVTQvZnlaQXFFelNvWWZ1SEI3dXZwVVFEc0RIcFdGWE14UzQ4?=
 =?utf-8?B?ZkNJa0xtdTB0VUtyZXBwTkt3UWZWV0FoMjE5UURvYmtBTTlZeTZOTThOdis3?=
 =?utf-8?B?TVAxOVg3aDl1cEwrbWk5YzNsU0FxNlVxV0s4YXFHWjFJV3B1eUpCWkVIeEdN?=
 =?utf-8?B?ME5FeWNnQnJ2THVBYkJNeFpKZ2ZUVmUwSVVJZTNVbXRjM1NUd0gxOVdUVnQw?=
 =?utf-8?B?ZDZDUjczTEkzNDdsL2RVek9NZHJGVWdrMmxBSmU3YlBMakJuL1locDBTbktH?=
 =?utf-8?B?dWVEaFhiUk52dVFlWnZpbzlkcXNCNFBEU1dEaVY2OVYzZDVqVXVWSm1ueFhn?=
 =?utf-8?B?aERIVDJHTG1DOG9OQXNIVklxRWFJVmU3Nmd5T0NSYXV2cjR5Q3JiTnpURTN1?=
 =?utf-8?B?dEdCSk1TaWRpMGwrZU9lc2hZY0lFbHBNMHd6cGNRWkR3M3NWWTVKemg5eU05?=
 =?utf-8?B?SEhFbWk5QlF3eDVBd1JteEdJeDI3WmNEZklURElsd0lKS1dWWS84SStCeG1q?=
 =?utf-8?B?Vm0xVVlQZEFHMW1Eb3U5aER0QjdrdVhBd2NZVVRqa1E4N2xDSS9EUXJWZU5p?=
 =?utf-8?B?ckJuUmlNRVRuc3lvK1RNbVl0aDU2VzhETVZwSDhOZlFmQmNBenZ2b2o2S0Nq?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a21f4023-802d-45ab-8f01-08db81e32c11
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 07:48:10.3768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEAEy1VART/WwjOcnmYC1EI0+VhvK6itCjuJx74fVf/2ZWhuVT58Tmkg6pclody+TAFekEs8SByVM9B8heR11dmJ0VW/OajeRQa/Ei+u47Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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



On 10-07-2023 18:50, Tvrtko Ursulin wrote:
> 
> On 10/07/2023 11:44, Iddamsetty, Aravind wrote:
>> On 07-07-2023 18:32, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> In order to show per client memory usage lets add some infrastructure
>>> which enables tracking buffer objects owned by clients.
>>>
>>> We add a per client list protected by a new per client lock and to
>>> support
>>> delayed destruction (post client exit) we make tracked objects hold
>>> references to the owning client.
>>>
>>> Also, object memory region teardown is moved to the existing RCU free
>>> callback to allow safe dereference from the fdinfo RCU read section.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 13 +++++--
>>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 +++++++
>>>   drivers/gpu/drm/i915/i915_drm_client.c        | 36 +++++++++++++++++++
>>>   drivers/gpu/drm/i915/i915_drm_client.h        | 32 +++++++++++++++++
>>>   4 files changed, 90 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> index 97ac6fb37958..3dc4fbb67d2b 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -105,6 +105,10 @@ void i915_gem_object_init(struct
>>> drm_i915_gem_object *obj,
>>>         INIT_LIST_HEAD(&obj->mm.link);
>>>   +#ifdef CONFIG_PROC_FS
>>> +    INIT_LIST_HEAD(&obj->client_link);
>>> +#endif
>>> +
>>>       INIT_LIST_HEAD(&obj->lut_list);
>>>       spin_lock_init(&obj->lut_lock);
>>>   @@ -292,6 +296,10 @@ void __i915_gem_free_object_rcu(struct
>>> rcu_head *head)
>>>           container_of(head, typeof(*obj), rcu);
>>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>   +    /* We need to keep this alive for RCU read access from fdinfo. */
>>> +    if (obj->mm.n_placements > 1)
>>> +        kfree(obj->mm.placements);
>>> +
>>>       i915_gem_object_free(obj);
>>>         GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
>>> @@ -388,9 +396,6 @@ void __i915_gem_free_object(struct
>>> drm_i915_gem_object *obj)
>>>       if (obj->ops->release)
>>>           obj->ops->release(obj);
>>>   -    if (obj->mm.n_placements > 1)
>>> -        kfree(obj->mm.placements);
>>> -
>>>       if (obj->shares_resv_from)
>>>           i915_vm_resv_put(obj->shares_resv_from);
>>>   @@ -441,6 +446,8 @@ static void i915_gem_free_object(struct
>>> drm_gem_object *gem_obj)
>>>         GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
>>>   +    i915_drm_client_remove_object(obj);
>>> +
>>>       /*
>>>        * Before we free the object, make sure any pure RCU-only
>>>        * read-side critical sections are complete, e.g.
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> index e72c57716bee..8de2b91b3edf 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> @@ -300,6 +300,18 @@ struct drm_i915_gem_object {
>>>        */
>>>       struct i915_address_space *shares_resv_from;
>>>   +#ifdef CONFIG_PROC_FS
>>> +    /**
>>> +     * @client: @i915_drm_client which created the object
>>> +     */
>>> +    struct i915_drm_client *client;
>>> +
>>> +    /**
>>> +     * @client_link: Link into @i915_drm_client.objects_list
>>> +     */
>>> +    struct list_head client_link;
>>> +#endif
>>> +
>>>       union {
>>>           struct rcu_head rcu;
>>>           struct llist_node freed;
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
>>> b/drivers/gpu/drm/i915/i915_drm_client.c
>>> index 2a44b3876cb5..2e5e69edc0f9 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>> @@ -28,6 +28,10 @@ struct i915_drm_client *i915_drm_client_alloc(void)
>>>       kref_init(&client->kref);
>>>       spin_lock_init(&client->ctx_lock);
>>>       INIT_LIST_HEAD(&client->ctx_list);
>>> +#ifdef CONFIG_PROC_FS
>>> +    spin_lock_init(&client->objects_lock);
>>> +    INIT_LIST_HEAD(&client->objects_list);
>>> +#endif
>>>         return client;
>>>   }
>>> @@ -108,4 +112,36 @@ void i915_drm_client_fdinfo(struct drm_printer
>>> *p, struct drm_file *file)
>>>       for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
>>>           show_client_class(p, i915, file_priv->client, i);
>>>   }
>>> +
>>> +void i915_drm_client_add_object(struct i915_drm_client *client,
>>> +                struct drm_i915_gem_object *obj)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    GEM_WARN_ON(obj->client);
>>> +    GEM_WARN_ON(!list_empty(&obj->client_link));
>>> +
>>> +    spin_lock_irqsave(&client->objects_lock, flags);
>>> +    obj->client = i915_drm_client_get(client);
>>> +    list_add_tail_rcu(&obj->client_link, &client->objects_list);
>>> +    spin_unlock_irqrestore(&client->objects_lock, flags);
>>> +}
>>
>> would it be nice to mention that we use this client infra only to track
>> internal objects. While the user created through file->object_idr added
>> during handle creation time.
> 
> In this series it is indeed only used for that.
> 
> But it would be nicer to use it to track everything, so fdinfo readers
> would not be hitting the idr lock, which would avoid injecting latency
> to real DRM clients.
> 
> The only fly in the ointment IMO is that I needed that drm core helper
> to be able to track dmabuf imports. Possibly something for flink too,
> did not look into that yet.

wouldn't dmabuf be tracked via object_idr as a new handle is created for it.

Thanks,
Aravind.
> 
> In the light of all that I can mention in the cover letter next time
> round. It is a bit stale anyway (the cover letter).
> 
> Regards,
> 
> Tvrtko
> 
>>> +bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>>> +{
>>> +    struct i915_drm_client *client = fetch_and_zero(&obj->client);
>>> +    unsigned long flags;
>>> +
>>> +    /* Object may not be associated with a client. */
>>> +    if (!client)
>>> +        return false;
>>> +
>>> +    spin_lock_irqsave(&client->objects_lock, flags);
>>> +    list_del_rcu(&obj->client_link);
>>> +    spin_unlock_irqrestore(&client->objects_lock, flags);
>>> +
>>> +    i915_drm_client_put(client);
>>> +
>>> +    return true;
>>> +}
>>>   #endif
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h
>>> b/drivers/gpu/drm/i915/i915_drm_client.h
>>> index 67816c912bca..5f58fdf7dcb8 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>>> @@ -12,6 +12,9 @@
>>>     #include <uapi/drm/i915_drm.h>
>>>   +#include "i915_file_private.h"
>>> +#include "gem/i915_gem_object_types.h"
>>> +
>>>   #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>>>     struct drm_file;
>>> @@ -25,6 +28,20 @@ struct i915_drm_client {
>>>       spinlock_t ctx_lock; /* For add/remove from ctx_list. */
>>>       struct list_head ctx_list; /* List of contexts belonging to
>>> client. */
>>>   +#ifdef CONFIG_PROC_FS
>>> +    /**
>>> +     * @objects_lock: lock protecting @objects_list
>>> +     */
>>> +    spinlock_t objects_lock;
>>> +
>>> +    /**
>>> +     * @objects_list: list of objects created by this client
>>> +     *
>>> +     * Protected by @objects_lock.
>>> +     */
>>> +    struct list_head objects_list;
>>> +#endif
>>> +
>>>       /**
>>>        * @past_runtime: Accumulation of pphwsp runtimes from closed
>>> contexts.
>>>        */
>>> @@ -49,4 +66,19 @@ struct i915_drm_client *i915_drm_client_alloc(void);
>>>     void i915_drm_client_fdinfo(struct drm_printer *p, struct
>>> drm_file *file);
>>>   +#ifdef CONFIG_PROC_FS
>>> +void i915_drm_client_add_object(struct i915_drm_client *client,
>>> +                struct drm_i915_gem_object *obj);
>>> +bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
>>> +#else
>>> +static inline void i915_drm_client_add_object(struct i915_drm_client
>>> *client,
>>> +                          struct drm_i915_gem_object *obj)
>>> +{
>>> +}
>>> +
>>> +static inline bool i915_drm_client_remove_object(struct
>>> drm_i915_gem_object *obj)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>   #endif /* !__I915_DRM_CLIENT_H__ */
