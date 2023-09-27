Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961B7B0F22
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4470C10E5C3;
	Wed, 27 Sep 2023 22:52:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6DC10E5C2;
 Wed, 27 Sep 2023 22:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695855152; x=1727391152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hgswi8JuCynqrbgBdT3oy0wghKyV1bBaAvdR9yaP8Y0=;
 b=UkvmYCxk5S2YCyAAmNcCVd0RuGYrPKy2MVpNeowoT6XfMjuO9Ey1LbFN
 qanqBgiqtk6HlPUmQ2RW2llHrN36ssaExq4G42r3kZu1rP1Mhkh8Pu3Nk
 hnSKgqzMgIV8qo43BZ5EPB1/AHIHWJuB7UFT5yrunL5PZPfjtL+G7Xck7
 kbdgXETdiz3wYRAJ5k2s89K71QNEJDtpZx05n8Dez6GQgzjqcPdDMCqrR
 9OHxLWvg5VtBRtOixvblks4aduPUMfoJObDLDLe4CRFy16TOVIRdUoDyB
 PxaWxHSyNFksE0sKkpdlytTbQiGcLBv8D8Wg0ODNPseQNft46zBMch67f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381849764"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="381849764"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 15:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996337547"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="996337547"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 15:52:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:52:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 15:52:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 15:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hF6+dlrZO7Qn2ym9zTTeLUZJJcloPUlHZLYRhZCWspXCPXPXxW/CPuVWNZzbGLHUiqMnjz/95L3AZoMRJXSjuXHR3UG305VU9S/VFiDwNU2jDBfhBTH7+cVS9S6bruDDmzr2GVvNXfBksZXusMMf19mNafRNf2It8m7v/8akPrLslbvqZTzbMGWPDPYb6wkJbH+Ch8ZNp60VnKrNCSDRggioG1QSmbSKidAEnsEY7iYBPe+mM8Ne3QCuCEKcmj3Yj4NmwpXtrdVx0Zvu4KqJDhT7LdESENq0EI4513AeZlMa7m3299lTkJKM/IU+2qHnvUNqwcTV1bVA9wibhOLXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfIl0evQqLpc2D1UBCOouQ8nnQnJfDdXnGSKiuhUqq8=;
 b=JDNMjNqLUUgftDAqIb3ilWjrZrhdwjiTcMwX4j7b2ETQ6JnA6XLybgJOkh0NtK47sWDWwW6FHuf7iydBzvs8cJ8uftM2LA5Z3jEWpvxdR0/Z0F4Ks3cDJtB5hj3Ibowul+1A9Rqft1NBpr8ZdvxBT0kK8pr1fDL4E70iwDGCFUhO5Vch1PeaVxoGLEyuQQg7RpFKNL33CjZxHoW4JPbdIJDjWYC4oNjXEgnIW3eTnIyh2BLBfRjo5eRCWc8u0mBdT8K7BUjKjokIb/EDvPnMzQMMOmGPBh7rBb4sjFC7JQ5YffuEfSinH9Q43D+9lGX13S8uZ+RKycNbe9PrGZbBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22; Wed, 27 Sep 2023 22:52:23 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 22:52:23 +0000
Date: Wed, 27 Sep 2023 15:52:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/mtl: Add a PMU counter for
 total active ticks
Message-ID: <ZRSyJBG+A47mVfe5@unerlige-ril>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
 <20230922222510.2235213-3-John.C.Harrison@Intel.com>
 <f407b0f0-830e-3696-8661-c7dddf0128d6@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <f407b0f0-830e-3696-8661-c7dddf0128d6@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: db734882-14be-49cd-eaa9-08dbbfac69a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ZRf9pMv1t6qyqZRV5ooHftbCcTXxLOLv/gGwHCl01haBuxsIJrAkd4B2d8FI30ZHMHayfpb6SJDqCBW+n4YgewaEGdKaBC/bf3OeytDhGLMPKZUtWJVQ0MMpvdJf1lnFWsGkmvW7zydbhlxUmWubiBeAaaL+bT7RDBCmzzyMZ1R4WjYLzWJ2tdH7YuzpM3ELK2cf1aDVovEqmwz8QO2cFdEHKcpliRHETSJBar3PsDnMNq5KkxtBZZ4h3KGCWOmW2zIK9kFiIpJigV5qXkHupGRITGVQE540eoCvyD54/Ropuep1cTKINDyuYMMafiu48OE9ynUCcLe84UbJj8c2BesAqgOvFRiqE5io8PUrx06/2IXfj1nN/bJy9sFYmpiVDVaacm9sxkrdwBS7Gj7dd/3l9Ctr95AqaDI5OQej3YZo6QvsOU8hKdvkUud98P7YBASb1dpcVwXmwpyrF4xJ+ybxVnIjdtQo4xGCD6Al/dju66lbhpq/8/zM1VSQIBd6624MK8nnHBNeaAfRbZ9ZuJfhyokvS1UF5YtK+eT+XUlSMqM0ZHlcsmB8EimRUwATA1VmF7OQx6gJJp1b+yNMJiIY5/0LzHhTgzj0gOxaB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(33716001)(82960400001)(86362001)(6506007)(6486002)(478600001)(6512007)(9686003)(41300700001)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(2906002)(8936002)(5660300002)(8676002)(26005)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHc0b1Vvd1FFWDRzbktudWF5QVZLaTYvNmdjM3V0c3JIUkZXRHFtYWh6MW5P?=
 =?utf-8?B?bVU2cFIvTnBiMFVQV1B5aUNyRnQ4ZUVzVEdleEhoRzVjcjFuakhnc1pzLzJa?=
 =?utf-8?B?U0Z0WEdIL1c2OW5zVmlta2RMaVZwRng3bW1OaHBiT3JBQ0tXQzVXRFkwcHhD?=
 =?utf-8?B?MEsrSS9HcVFpV1B6NHhEYXpZY3czNWpnNXJ6ZTRiaTY2Rnc3UFU0QVRjbnQr?=
 =?utf-8?B?eGFuWVFHZUxENk1JcWYya1YvOU9aR1JwTW0yYXNYZTBFdTZCbHBqaGQ1bzgr?=
 =?utf-8?B?UmxuU1lIUnVDWEJySjVKc2h5RmlCWnR6dS9iVDBLODRJV3pDYnd1cFlkdlZB?=
 =?utf-8?B?S3BuZU55OWhpYXR2bWIvR2Z0Zk9XTmJYOGJVQ3JPS3pFOHpIdHpodk1FUGR6?=
 =?utf-8?B?c0FRa0pOWDA0OEFxZml2MlR0WUpkNlhnSEN3WDFCRGVKWFV4QXhkNmY3MHVK?=
 =?utf-8?B?amJnY0tLS0llS013S2lzRGpSbFI5eFNERjRnL3NLbWlrY2NrOW5zR1pjREFy?=
 =?utf-8?B?SHp1THorOVB4YWRIY0JkbnFqMDZNUlFKVnBuZjBlR3loblV5UHRlNjRHQUd1?=
 =?utf-8?B?UUFRbkxqUE9UWTJ1bTJxeWE4WE1kTHowMFo4T0dwQmg1R1BBUlFOelZvSU5V?=
 =?utf-8?B?VmZzaUwxZ0VVdis0SWdwVTNieDRya3ZIWkJ3eWMvamZVa29Pd1NmRFQyUndU?=
 =?utf-8?B?YW82MjFzRkRaeDE2cGdpODNuTGg0OWhmOVQzNE1meGRraGZWVlRsT01FeHlk?=
 =?utf-8?B?dHl0SG45Z2J6TzdSTnVjMmlRZG9pK1AxajI3M0E3Ykt4RHNKQmhqT3lDUUs3?=
 =?utf-8?B?c3FDQk1Kdi8yTXhZdVlPMHhFaEVyNm1TbDl2cFl0TXNIUUtYSzFQZUFIeExj?=
 =?utf-8?B?ZE05aURuKzJuSHA5andYTmtQZUgxSklqdVpURXo5bmlFN3gvcmVBYjYrOFly?=
 =?utf-8?B?UGc0a0cwUlNINnUzaFA4ZW1wM1Q5bngrWVBUYVVIVlZhNldoUXZzc3p4djQr?=
 =?utf-8?B?bk1yMkRibllnNnRqYnZjcnJuK3BYbmVRVW8xS3JYYmJsb09idDVVSGdESEQ0?=
 =?utf-8?B?dG5kalJ4bTVaSzRocUNDMGhIc29rUjhtSm1YQjloSDBRVHlFdmJQUE0vdzFN?=
 =?utf-8?B?dGFoazI1U2JHSWJmVmFUMWV0U3NqdjBoOXlTcWxKM1RtUVI5TVhXNVk3ZzVn?=
 =?utf-8?B?SzhtZ2N4dmNZMVVyWllzRWJ4dmZEa0NJWHNUMytxbUZHRkJnSUYxVHZvNGRN?=
 =?utf-8?B?RGxrNG00U3MzUkgveGVWbTkxc3g5QzA2RmpxTEVnRUs2SnJ6MitlU3lLaUtV?=
 =?utf-8?B?WjhBTlcyNUtZeHdPZFZRZmUrSjV2QTZodURmcDFyNklGTm9pc3pLYUh3WGZE?=
 =?utf-8?B?b0pMejJtRE9EbldHZnJWbkJHYzJJZC9RUjRWNHpTWldKNUFUdXQ3TGUvUTlv?=
 =?utf-8?B?MnUxY0Rydld4b3hOYWp0RVBobWN5U3lhM2pZdXpFOFc5RHI2Uis0Q2VyS082?=
 =?utf-8?B?QWo5a2Q1MDRtWlZiOTdiT0szYWNmT1I5RnRXZUM1ZXNGQ09WY3FEa21aOVBj?=
 =?utf-8?B?ejZpN3ByZCt6eWU3eS8xdVliQ2hFcVlUd2RlekpDb0sxdzJxYW5DaFFNRHR4?=
 =?utf-8?B?QW9zbjVpUDROVVUvM0ljK0lvZWs5eUg0RXlDTkY4cThNTVgxdkdiM0U2QjhE?=
 =?utf-8?B?eCtSL0syMkFNRkRzb25TTnBGSEIxR2JBWW1WOGxya0NhUVdIOXFrYUxqOUhm?=
 =?utf-8?B?RmxKZDJDUThTdGNydFRIR090TDlDSENCMVhrckNqUXJVeWFsMGdLU05XdVJr?=
 =?utf-8?B?bXpZVWp4dUFJT2laeFo5LzM4RHFHMEtYcWR3VVdhVlZNUU5XMFFHdmdEei9q?=
 =?utf-8?B?RmkrT3Y4bDR0VFY0bk8vOVpCN0NESW1HSldoUDdXY2xrNXlXZzE0eXJWc0xB?=
 =?utf-8?B?WVBVMVVXZDJ1ajIwRFR2ZGx5TERIRUtNUXlnWis5ZE9zS0xxdTBJS1FXNjhx?=
 =?utf-8?B?QUJBaDJJMHVyMktRdy9ja3BuT1pvYU56U0UxOGhYSE1UZDlxbTZMTlVoVEtv?=
 =?utf-8?B?U2U3eHkxSGVzRW9KNkRJRlRXUkw2NXRUK2ZmbmFaUEYrdXFsQnZsWFZnUXNz?=
 =?utf-8?B?a2ZPNzJYNE9WZWg2V0dvWm5RczA0c2xqQXBqc3RvV3ovQnVrMUVaTlRTSlUz?=
 =?utf-8?Q?hou2ysNmmtv9X2COBNXqASE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db734882-14be-49cd-eaa9-08dbbfac69a5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 22:52:23.4059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQJFxN0slvnULyDmkysFlQXsQxBKVwPr+FFKxlzVM+9FLgfqjFqjuruDztXxhdDwz6UErdtpsWv3KhhMn1CxY2OugddIOg0utfXppO5QKKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7958
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 09:40:46AM +0100, Tvrtko Ursulin wrote:
>
>On 22/09/2023 23:25, John.C.Harrison@Intel.com wrote:
>>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>Current engine busyness interface exposed by GuC has a few issues:
>>
>>- The busyness of active engine is calculated using 2 values provided by
>>   GuC and is prone to race between CPU reading those values and GuC
>>   updating them. Any sort of HW synchronization would be at the cost of
>>   scheduling latencies.
>>
>>- GuC provides only 32 bit values for busyness and KMD has to run a
>>   worker to extend the values to 64 bit. In addition KMD also needs to
>>   extend the GT timestamp to 64 bits so that it can be used to calculate
>>   active busyness for an engine.
>>
>>To address these issues, GuC provides a new interface to calculate
>>engine busyness. GuC accumulates the busyness ticks in a 64 bit value
>>and also internally updates the busyness for an active context using a
>>periodic timer. This simplifies the KMD implementation such that KMD
>>only needs to relay the busyness value to the user.
>>
>>In addition to fixing the interface, GuC also provides a periodically
>>total active ticks that the GT has been running for. This counter is
>>exposed to the user so that the % busyness can be calculated as follows:
>>
>>busyness % = (engine active ticks/total active ticks) * 100.
>
>AFAIU I915_PMU_TOTAL_ACTIVE_TICKS only runs when GT is awake, right?
>
>So if GT is awake 10% of the time, and engine is busy that 100% of 
>that time, which is 10% of the real/wall time, the busyness by this 
>formula comes up as 100%. Which wouldn't be useful for intel_gpu_top 
>and alike.
>
>How to scale it back to wall time? Again AFAIU there is no info about 
>tick frequency, so how does one know what a delta in total active 
>ticks means?

Looks like I got this wrong. The implementation is actually updating the 
total active ticks even when idle and that addresses the concern above.

>
>Going back on the higher level, I am not convinced we need to add a 
>new uapi just for MTL. If the tick period is known internally we could 
>just use v2 internally and expose the current uapi using it.

We did plan to support the total active ticks in future platforms for 
other use cases and thought this would be a good place to initiate the 
support. At the same time, I agree that existing interface can still 
work with the v2 GuC interface. I will post that.

>
>Any timebase conversion error is unlikely to be relevant because 
>userspace only looks at deltas over relatively short periods 
>(seconds). Ie. I don't think that the clock drift error would 
>accumulate so it would need to be really huge to be relevant over 
>short sampling periods.

At some point we may need to think about long running workloads, but 
that may require a different counter anyways, so I would not address it 
here.

Thanks,
Umesh

>
>Regards,
>
>Tvrtko
>
>>
>>Implement the new interface and start by adding a new counter for total
>>active ticks.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>---
>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 +++++++++++++++++++
>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  1 +
>>  drivers/gpu/drm/i915/i915_pmu.c               |  6 +++++
>>  include/uapi/drm/i915_drm.h                   |  2 ++
>>  4 files changed, 33 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>index 88465d701c278..0c1fee5360777 100644
>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>@@ -1607,6 +1607,30 @@ static ktime_t busy_v2_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>>  	return ns_to_ktime(total);
>>  }
>>+static u64 busy_v1_intel_guc_total_active_ticks(struct intel_guc *guc)
>>+{
>>+	return guc->busy.v1.gt_stamp;
>>+}
>>+
>>+static u64 busy_v2_intel_guc_total_active_ticks(struct intel_guc *guc)
>>+{
>>+	u64 ticks_gt;
>>+
>>+	__busy_v2_get_engine_usage_record(guc, NULL, NULL, NULL, &ticks_gt);
>>+
>>+	return ticks_gt;
>>+}
>>+
>>+u64 intel_guc_total_active_ticks(struct intel_gt *gt)
>>+{
>>+	struct intel_guc *guc = &gt->uc.guc;
>>+
>>+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1))
>>+		return busy_v1_intel_guc_total_active_ticks(guc);
>>+	else
>>+		return busy_v2_intel_guc_total_active_ticks(guc);
>>+}
>>+
>>  static int busy_v2_guc_action_enable_usage_stats_device(struct intel_guc *guc)
>>  {
>>  	u32 offset = guc_engine_usage_offset_v2_device(guc);
>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>index c57b29cdb1a64..f6d42838825f2 100644
>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>@@ -30,6 +30,7 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>>  				    struct drm_printer *m);
>>  void intel_guc_busyness_park(struct intel_gt *gt);
>>  void intel_guc_busyness_unpark(struct intel_gt *gt);
>>+u64 intel_guc_total_active_ticks(struct intel_gt *gt);
>>  bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
>>diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>index d35973b411863..4f52636eb4a80 100644
>>--- a/drivers/gpu/drm/i915/i915_pmu.c
>>+++ b/drivers/gpu/drm/i915/i915_pmu.c
>>@@ -563,6 +563,8 @@ config_status(struct drm_i915_private *i915, u64 config)
>>  		break;
>>  	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
>>  		break;
>>+	case I915_PMU_TOTAL_ACTIVE_TICKS:
>>+		break;
>>  	default:
>>  		return -ENOENT;
>>  	}
>>@@ -678,6 +680,9 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
>>  		case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
>>  			val = ktime_to_ns(intel_gt_get_awake_time(to_gt(i915)));
>>  			break;
>>+		case I915_PMU_TOTAL_ACTIVE_TICKS:
>>+			val = intel_guc_total_active_ticks(i915->gt[gt_id]);
>>+			break;
>>  		}
>>  	}
>>@@ -986,6 +991,7 @@ create_event_attributes(struct i915_pmu *pmu)
>>  		__global_event(2, "interrupts", NULL),
>>  		__event(3, "rc6-residency", "ns"),
>>  		__event(4, "software-gt-awake-time", "ns"),
>>+		__event(5, "total-active-ticks", NULL),
>>  	};
>>  	static const struct {
>>  		enum drm_i915_pmu_engine_sample sample;
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index 7000e5910a1d7..e26dd27ff4a5f 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -296,6 +296,7 @@ enum drm_i915_pmu_engine_sample {
>>  #define I915_PMU_INTERRUPTS		__I915_PMU_OTHER(2)
>>  #define I915_PMU_RC6_RESIDENCY		__I915_PMU_OTHER(3)
>>  #define I915_PMU_SOFTWARE_GT_AWAKE_TIME	__I915_PMU_OTHER(4)
>>+#define I915_PMU_TOTAL_ACTIVE_TICKS	__I915_PMU_OTHER(5)
>>  #define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
>>@@ -304,6 +305,7 @@ enum drm_i915_pmu_engine_sample {
>>  #define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
>>  #define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
>>  #define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
>>+#define __I915_PMU_TOTAL_ACTIVE_TICKS(gt)	___I915_PMU_OTHER(gt, 5)
>>  /* Each region is a minimum of 16k, and there are at most 255 of them.
>>   */
