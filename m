Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A15F7B8DA7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 21:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6237F10E1A4;
	Wed,  4 Oct 2023 19:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14010E1A4;
 Wed,  4 Oct 2023 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696449011; x=1727985011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m1j/o5ioEyCL1DeU9Xk0PNRXhzfijpTAvzFhC03zks4=;
 b=QmVGlML3d4J8/kwTfzplnyY/fa3Ok0JXDN7lclvPSTL3As61t47XH8o5
 pp+0UgmmzopvkvPxhTRG0D4Y1NYGV2W1OhKuPfo4Fa3CfeACLd3oWuPkg
 ssdnKk29PEdrONZo5Rq+ZTQmFIUubUqK2cnU72SidFaRwlV/9RFT1cUky
 oXu8vlNoBHZ/0pcqefd98Mtg2tbwoncw0okb1skjcFGQ8NPsapCzjB0QF
 HD6MKT7c9pt4ctcm4QBk/m3jcoKv244XvTAp9Rn8MlR9dnrCikBEbv1mT
 uV88GZmNZSz75TpwVYeJtFMWP5KD1EeePoQuzAC7trusUYSUnb/zNyNsq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449772324"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="449772324"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867544190"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="867544190"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 12:50:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 12:50:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 12:50:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 12:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5cc28WSq8o8+9SY1ARMq4T2FG7ZcL3k9OOVgojbGIX+jNmbq63WuOFpPFmHcWFzS7CCWcDPYadgXt1uGEf7287jh61IgbezruxihJn0IFky33xPHWW5hjjcljka6bN2j6qdv7rypqzq2EPL11sbNXw7QXh2T8UDbU+hS9lu6Q8joyc5Tjy9iPTdsYb3pDGCYeDeoFgmOsN3NUb7GkSJiVIg+0iFZDcdz1wqvEvrDaVIaAUJzhUJ3PLIN0/UvvNbiOuf1e1m9WTvyWLT+Whf8o9Uigi6yXuIEubLGSg7H/ZdZU/EhpYVWFhJCANdzC5ypQvWjVgthLEitQ+QpYO4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpHKh+ln+ZdxdyzdGeoiD7gzC5/4UMlWN7DkN86JjFg=;
 b=IzzABgHcwsMQKOzPxhc7L01w7eTBx8PmaqJK4LmVDc61RIMvpKA5cV5xRmZTbtTLIly0ZHSHhSUJKX7LF1GkyBFb98lXAAUAOamFo0vxhOxdj8I8yznH7JmI6Sy8L56GWgz9L0xrzXU8RzCb3yG9F/Hug9xM4J/fxFi3LiUwIA+/RZVIy/XLSacH9T2o6u3hNevs6yJmyAl+O+4KM1+kvxcApoJJHxj8DSDiHIk8zWuAeVu8fEEHmQSmMfTi5npMTWSillPhbMocU+Rsru73zXcDIT0ZRC4JGPmvBsVMrJbU4Pl2Q0CdnY4rCeRuDt10SjRoQtJgCaReF/VAkbDaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 19:50:07 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5%5]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 19:50:07 +0000
Message-ID: <e8747e83-a78b-058b-e76b-06bb63e85c7d@intel.com>
Date: Wed, 4 Oct 2023 12:50:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0183.namprd04.prod.outlook.com
 (2603:10b6:303:86::8) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|PH0PR11MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d2115c-b6a0-4638-b49b-08dbc5131c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0r5oux8dI+Oq1kdSVuDOENPsBeXhu/npCLFb1zuibWyCOYzNnIStAThGCqZMUqJO+ml+S4j/A/WlOPcsJ0c+Zbd+5NOLGS/dgptaTX8LtdrYDsGLIWzdgnmS1dbYFfye3B7Wi8ZUir2ZnY0ADopX+q8LX6/ezadLZPt20hccFUEuU9T4tul/Ell59NfQzXwu3Q+R6evxgnoqs6+v5QhM2mkML/sWu6sb7SkKLZshcdLxzGxmVedP+GgunrHlnWwvjl5Yc3brIUrbGSVkNcst/O3v6A0WTD/ryZtlNbL3mVGL85E2ld3+X/nSIh1L5Y9KWg/Drb67VY+iqGuGiq23hxrLq0Sw1dPkUoDrog1kI2x7KDTfEwP4GALsf3UoeyZJ1uSvHmBSCrDxhkwat2F8rqFmJicYEiiamjCtjkCS2y11uPm0Key5laAFddJVtdMeGZplaOgs0DB2ieofWxPkI62CpdSmSWWWgRDNuvoiEleq6nEm4C35cR8WCi5ARmOzsUpdsYnm+eO6vf2T++UqEXwLPZp2oPftHSCIuruI8/nOQNrkY7nnCWpWlaOfVB69WDS5Pa9pOLrCgL1KrICVA28crjp2+GKPk4lahkmp4k/OGHU0ZuKPj9POOwxG+c5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6916009)(2616005)(316002)(966005)(6666004)(478600001)(38100700002)(66946007)(66556008)(66476007)(54906003)(26005)(5660300002)(83380400001)(31686004)(6512007)(6486002)(53546011)(6506007)(8936002)(4326008)(8676002)(41300700001)(2906002)(31696002)(86362001)(36756003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aldkbi8wUzlzMWdCM09Kd2dnM25JQUttZGhqVHdIVzE0UDUvK2ZEbVJUaUQ0?=
 =?utf-8?B?bHAzcDlHNlVYVmVtelREeFRaM0cxMjNqVGRlZXpPSWtwQlc5SVlKeTFlZkM2?=
 =?utf-8?B?Vk1oOU9VeWM0Zzd2MS9iaVlMampUSWswS2IySDRvK25QV0xBYmQ3WDZPZHJ1?=
 =?utf-8?B?WEI4T0NqSzFPVVM4aWJzRWx4Nk1VdW1CSnpRcUJmWUJuYkhZQjJ6SUlpRDF4?=
 =?utf-8?B?dnNxWTBEZkxlVmwybTVKSTF1UTdjaWRIQzYyamF0anF6Zk5WekUrTEpRY1JX?=
 =?utf-8?B?UithR0pHdzNFQk8rSGZSZCtPd2VUNlRxR0NYWW5vWHhzbjVFVHhZNDZnUm5Q?=
 =?utf-8?B?NzRJNXFXamhBaCtjSE9IRmQ3eXQxRHNPTnVQM3hOTVp5QVd0VkZ4L2UvSHo4?=
 =?utf-8?B?akptM1EyUml3QU1BbHpWSk5KLzg5L042RGRZeDFLaVcxYjh1SithbUdEb0ts?=
 =?utf-8?B?ZHk2RS92T1MxL1pyR2JPd1FidVBsVm9TOE5hR0pMUFBCelhqaUdmYVFhZlNI?=
 =?utf-8?B?YmE2aThDOWxXclpoaDZnNHlLOHhTK1pyWWpyWWF3QmMzeGk5bjBsdHkzdjlY?=
 =?utf-8?B?ZzAxT2JHOGRzUDRyR0NlSy80d2wxaHZmenBVZXZncU9ndTdXM3U1NkhDYUEx?=
 =?utf-8?B?M0lzN0kzTHlDdmdQQ2pvRnV3dnNxMThVbUkzVERHRGZTRnczQ1M3TTNuNDQ4?=
 =?utf-8?B?R0RpV1J0WmNyQ3pqNFZBT2tOajBVeldsNkhucHlQOE1oRllmS2VVazNZS096?=
 =?utf-8?B?N0s5U3IxSFlSekpZTWRUY3N6dmx0bm5lTStnT1FFZTRLYTUrK3N2Q2lCSnRP?=
 =?utf-8?B?ME9LMnVJU3NiUTJkOWlnc2Z2UnJ0QmhvQXRuY3oxb1BmWGdTbTRxSllPa2Fl?=
 =?utf-8?B?SWtwL2YrdE1rM0dHbC9oNmJISklUQWJ1bWJ1Qk5HZ05IQkJaZEUxV3J3WHpQ?=
 =?utf-8?B?YU42ZGZPeEZnN3dKM1EycHAzK1BhV2IvSEdOaTJlNlR5RU93eDdhSGhJdkxN?=
 =?utf-8?B?Vnk4eTMxMGV3NXhWZ1YwVnU2VjV0Y3JOU21iVE9TNUZtbU1tZnVpUTYwUXRH?=
 =?utf-8?B?YWlLYUVqc045UTVuWkh2VThCblZtQlFjeEtyRVkvTDdEM1VIMGpEd1FvUFEv?=
 =?utf-8?B?bWxra1FhWGRMUEI0ZlN6TTQvejJmQ2JoTUpneUpYa2w2S0I4S1JxNTRrMEZx?=
 =?utf-8?B?b3pWeDgzOG5mc1k2U2FZV3liK3dpaFFSbmE5SEZJTDJMTE0rWlJ0cHgzV240?=
 =?utf-8?B?T3FFUnpBSTA5aCtuVzk2SFNYWkoxRlgvcmhscDgvc3ZNd1RHSXd2N3dGOWRG?=
 =?utf-8?B?ZVZQK1JmdGRBZ004bS9QT25tNFhxTkN0UFpTc28wNnZPbnRreU5aNy9LcEN6?=
 =?utf-8?B?QmlBWWZGZlpQa1VwMHBDQjRiNE5iZm5LdnZOdUpzZXM2WUQwQ2pxK2RVSm9O?=
 =?utf-8?B?blB5RDFQVFBxYmhNRDJWR0xYMmcxbmdHcXBHbUIyTTZnSmpXMTRpU2pVUnNV?=
 =?utf-8?B?T1JMNkZKL2RtNUNNSXR4NkhxV05Bc0luRDFwMFRWbmhkQUx5S0JLcmc2UDlO?=
 =?utf-8?B?cjFPSEtiZDdmSzdhRDJzRldFV1RiMVVYLzdsSzk1V29FaEhWOTN6ZVFYRHBz?=
 =?utf-8?B?aSsvVHdBSUdocEtuMGYwVUpHdXZBcFlGa0x6VHgzVU5kYUxKSFFQY3FxbkJ0?=
 =?utf-8?B?clV5dDVRb3VqQ2J1dzhSVis1Z3Z2NmU3bFI4Y1laSG5ZNWNYVnhLZExhNGdj?=
 =?utf-8?B?dG9KQS9YVHVKdmxoTjdIbWpyQU9NWkk1SlZFTnd3M0VWaFQ1a1ZxNnV0bmRy?=
 =?utf-8?B?bVVNdnk5N2FtUUQyOUZtc1dLOW9NTlE5U0s0TW5SVHRRd3htZjNhSFprcEtM?=
 =?utf-8?B?S3VHOWRZbndUczlZM1BEY1ZTNTZtam9UdW53VHhvcTJPSUVTMk5uT0dvMXVG?=
 =?utf-8?B?THJ0eXU5cjBrVU56N0sybWxHRnVlQlFaWVFYUzlJUkZPajJxRFZnMG9pNWh6?=
 =?utf-8?B?U01ZRHZpM1ZvY1JZMGw5WmNwOW9ZRFliYjBlK0QxZGRZQURnZDBpVGh5cVVu?=
 =?utf-8?B?VkU5Q2Zob2J2cngzNHpsWS9qcEdlS0d3OHVOSmtwalhUMXlUbXkvUDM3Qjhh?=
 =?utf-8?B?R0lpeE9iaW1FZnJPdVNmSi9TdlFkZDVSQ3daODNpc2VFVlVkaUMzTldZQ01S?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d2115c-b6a0-4638-b49b-08dbc5131c6a
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 19:50:07.6567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odEgMWqVNogn7NM3yCV4m4MJIWKxjTpa1oaNDVAdwtZARFXfJ/3824mU+jxzSs7zmu28Aq3un9GtXl08LZKMkcR1yY9fYtXRp+Eb2ByDbeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7711
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, gregory.f.germano@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/4/2023 12:35, Andi Shyti wrote:
> Hi John,
>
>>>>> The MCR steering semaphore is a shared lock entry between i915
>>>>> and various firmware components.
>>>>>
>>>>> Getting the lock might sinchronize on some shared resources.
>>>>> Sometimes though, it might happen that the firmware forgets to
>>>>> unlock causing unnecessary noise in the driver which keeps doing
>>>>> what was supposed to do, ignoring the problem.
>>>>>
>>>>> Do not consider this failure as an error, but just print a debug
>>>>> message stating that the MCR locking has been skipped.
>>>>>
>>>>> On the driver side we still have spinlocks that make sure that
>>>>> the access to the resources is serialized.
>>>>>
>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
>>>>>     1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>> index 326c2ed1d99b..51eb693df39b 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>> @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>>>>>     	 * would indicate some hardware/firmware is misbehaving and not
>>>>>     	 * releasing it properly.
>>>>>     	 */
>>>>> -	if (err == -ETIMEDOUT) {
>>>>> -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
>>>>> -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
>>>>> -	}
>>>>> +	if (err == -ETIMEDOUT)
>>>>> +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
>>>>>     }
>>>>>     /**
>>>> Are we sure this does not warrant a level higher than dbg, such as
>>>> notice/warn?
>>> We might make it a warn, but this doesn't change much the economy
>>> of the driver as we will keep doing what we were supposed to do.
>>>
>>>> Because how can we be sure the two entities will not stomp on
>>>> each other toes if we failed to obtain lock?
>>> So far, in all the research I've done, no one looks like using
>>> MCR lock, but yet someone is stuck in it.
>> If someone has the lock then that someone thinks they are using it. Just
>> because you can't see what someone piece of IFWI is doing doesn't mean it
>> isn't doing it. And if it is a genuinely missing unlock then it needs to be
>> tracked down and fixed with an IFWI update otherwise the system is going to
>> be unstable from that point on.
> But I'm not changing here the behavior of the driver. The driver
> will keep doing what was doing before.
And what it is doing is dangerous and can lead to unpredictable results 
because a critical section resource access is no longer wrapped with a 
critical section lock. Hence there is an error message to say Here Be 
Dragons.


>
> Because this most probably won't be noticed by the user, then I
> don't see why it should shout out loud that the system is
> unusable when most probably it is.
Just because a race condition is hard to hit doesn't mean it won't be hit.

The point of shouting out loud is that we know for a fact a problem has 
occurred. That problem might lead to nothing or it might lead to subtle 
data corruption, gross crashes or anything in between.

>
> BTW, at my understanding this is not an IFWI problem. We checked
> with different version of IFWI and the issue is the same.
Which implies it is a driver bug after all? In which case you absolutely 
should not be papering over it in the driver.

>
> Besides we received reports also from systems that are not using
> IFWI at all.
There is no system that does not use IFWI. Integrated or discrete, all 
systems have an IFWI. It's just part of the main BIOS on an integrated 
platform.

John.

>
>>>> (How can we be sure about
>>>> "forgot to unlock" vs "in prolonged active use"?
>>> There is a patch from Jonathan that is testing a different
>>> timeout.
>>>
>>>> Or if we can be sure, can
>>>> we force unlock and take the lock for the driver explicitly?)
>>> I sent a patch with this solution and Matt turned it down.
>> Presumably because both forcing a lock and ignoring a failed lock are Bad
>> Things to be doing!
>> Just because some entity out of our control isn't playing friendly doesn't
>> mean we can ignore the problem. The lock is there for a reason. If someone
>> else owns the lock then any steered access by i915 is potentially going to
>> be routed to the wrong register as the other entity re-directs the steering
>> behind out back. That is why there is an error message being printed.
>> Because things are quite possibly going to fail in some unknown manner.
> Yes, agree. This has been already discussed here[*] where I sent
> such RFC for the sole purpose of receiving some opinions and
> check how CI would behave.
>
> BTW, we are already doing this during the GT resume[**]... it's a
> bit of a different context, but it still forces the release of
> the lock.
>
> This patch, anyway, is not doing this.
>
> Thanks a lot,
> Andi
>
> [*] https://patchwork.freedesktop.org/series/124402/
> [**] 37280ef5c1c4 ("drm/i915: Clean steer semaphore on resume")

