Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6BC40CDE7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3916EA21;
	Wed, 15 Sep 2021 20:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B72C6EA21;
 Wed, 15 Sep 2021 20:23:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222476267"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="222476267"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 13:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="700357679"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2021 13:23:25 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 13:23:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 13:23:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 13:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y488tTiCwGdyetSgv97K2GnB8RBSsAJnfF2jtyKbDeV3Kf7s8NwqhrwIkDySHGa3RIyTi3i34fdYA6q/WqfY5Bq0LE7ty3V1lvkAqf16cEZpu21IN3pD5p8cZuH0Q9WdiGaDpeS9b1QJ/fX2TEh6m6mondabI2CoEhoAKiH4350LjE1c0V2jdkMFDl2xmFvryWsmEkrN8FxmHnJ2VqzNTKg2TVo+hss++s0ETpbD3twz1Ht7vhloxgAo524HhWlI86waZ/KLQUcKmidKLwFqorlBsTeVX3YFiOZgbZ8cDHB2nTeFXs+AXeUg34D1QDqRmgOr+izR0lEqROwsgvOpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1ApgzzJQ5EvgW+dgUcRajzvJ88OHIa5gNSW/MoErfEg=;
 b=H6krYWMYm8FfhKii2rfGYmigaASjGp1fuW2vqmiJIo63fg1wNUlt4cPm/L8tWEdvtXkF1fOJnv0cg+kqitCQuKBuvh91diqsWmdmBypUayPbuTE3AZ66VoAQtKrrvF0mpLXVHvFDrjR2+P7gRemZuZoqcA9MFo4N46+p8itgBukD5CaVr3PTu97nwyY+PbprYkJQCp9OAu/vV2yrA2QuEDDCSDy8+oN5Mq24/Kvdhytyzgnu3JE0d/bEOC1GZwO4c8/9rtHsEva/d5OogsFJ4EiNZZznGb77ih4RmiSrIiY5P+Kfdtn9nzabIx7LxBbQiMIWWOd1+n9rOlpY5Tvq9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ApgzzJQ5EvgW+dgUcRajzvJ88OHIa5gNSW/MoErfEg=;
 b=Sp3hpBFNhpR/1XGlyryTT7dFZx2z1asUe16QaufJCPM8i4H8EoG44UqZC/W4eIL3zy6V+RSNjQoRteqUu4oRJM7+UiQyW+BAXD8/dKxv0Y6Z126nC30flZzi7j4B6TU+ySaoThl4fapO8Y8G4G3TbWUvzKQehbWxdEmSg+Luzw4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 20:23:22 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 20:23:22 +0000
Subject: Re: [Intel-gfx] [PATCH 12/27] drm/i915/guc: Add multi-lrc context
 registration
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-13-matthew.brost@intel.com>
 <64a5c154-1a00-820e-2b30-d95af73937d7@intel.com>
 <20210915193115.GA1933@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1a6800f8-24ac-ebbb-03a5-1121e86e893f@intel.com>
Date: Wed, 15 Sep 2021 13:23:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210915193115.GA1933@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR01CA0037.prod.exchangelabs.com (2603:10b6:300:101::23)
 To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR01CA0037.prod.exchangelabs.com (2603:10b6:300:101::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 20:23:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5df2ced6-6986-49e7-4abc-08d97886a9f8
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56112A7CE9CEED26C482957BBDDB9@PH0PR11MB5611.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhXuaruxlgdqOw5sMHlX7zOLLH7m8CVVT0if+fkfJevv9YrocEe9eDHlRw8y4gVNaBKFldxCwlA9yE3yNTvq+Ll8cXJPK4OvJzKXTRxUzK3EZGHjryJVKzFFlqlE0Q87Yhew2goLJ1bDGNrwZAtqdiAaenjRANKT6p+DyYHuoVQPliL+Sz/MP0GtAwoEo4mVrRSVSgum/EvH37NtSzFaqxqdMWgnnLNaHJYXyWSTnV2ycXJe0moP/na3df/oQUDnPrQGFVeP79L+WpZtMKm+wqtfdD3vSz/c2vtKM5ZUXm4BiSxbtr4U++sCe4525tIN59HY0oqvZQTBhnTGeVU3m/PjKh13s00+j6vXXZ3K4iJ+/KJlDzGR1yVtum4hSxR+nE8WqGgDlPVT3QsUuapdaGVds7GaEk81PARBKDni+Sg5ww9BZmc8TfcZrQf5CKGVVlhhmBR1xyIlYD7nNmS9RbUFhNrCcP0lorFpMyuouqRVkMhX4rjICiBf5NSdN6L43y8V+3jj3nwkRZHDefFKV7bXCWIPK6aM4ulp8RnAcB4DZiwVcpImd+om1zDU8Dnw2McnsaUYnzOswgw4PykPiJHJHGtL3MHd6V+U5oh+ockPdu0FwnOuFApTeAx1SfK/L9TFVcd3fSwPNNToUiA0Olz28QaWZoGlo+p3Wy0CDN9qWnCw3q0smMhEJTaPY5or+3AsSn6fApze7rO5PU1GYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(2906002)(16576012)(31686004)(86362001)(37006003)(107886003)(186003)(36756003)(316002)(30864003)(478600001)(26005)(8936002)(83380400001)(6636002)(6486002)(8676002)(31696002)(6862004)(956004)(2616005)(66556008)(66476007)(66946007)(5660300002)(4326008)(38100700002)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjRjcHFKaHVsYndxcWZuN1FGOThYQ2NuQzJtVHNnaFdWaWdtZm44NkZEVkFx?=
 =?utf-8?B?aEM3MzF2Q2h5ejVLSEF4b1dCcWtvWFdGcE80ZjFPUkRpV0lJSVJ2YjZKS3dK?=
 =?utf-8?B?UFdDQzNkSjFXWk5ZY1VXTk1HdkN2QXJCWkZ6V3RiNWt0WGhFVTJlQXpxY3Bz?=
 =?utf-8?B?UDM2Sno5c1h4VXp3YnlESlNyVkFwcXQya3VjdGZDL0pxZzFvTmo5TjRXaUFT?=
 =?utf-8?B?a2VQWnZ6eTArQTRxdUhKdXdqRU9vVDAzd2FxcjdVYVExdkovdTlPbTRBL3FI?=
 =?utf-8?B?WG5qWmMzQUUwUE0raHFGUG9CVTZnbTQwOW5iVjBkenVKQnp4RDJsblZxRDha?=
 =?utf-8?B?MXl5RGxYbG01OFVHQ3lIdzBETE1VZHg5ZHlwblZDWGVXRmlyQjZwL2NWeUFp?=
 =?utf-8?B?N3RHUURTZkhUVlBnYzZiMTgyWlEvS05sc1I3T1RMcjdhaEdRdXBWeVNLMU5W?=
 =?utf-8?B?cVoydzkyamhUVHgyVWtQN2RyWkVJZkZ0a3o0SFM4T2VzWTZiWmJJTWRQM0RX?=
 =?utf-8?B?WnV3R1BpZTRDd2gzRWFRdStxVDQ1WVVxYzFCVGExenRiVlExeE5RcFBTa1Nu?=
 =?utf-8?B?V0ZjWUx5RW8rS0JWWHFwd3p1SzBkQ2NxTXlXbURHM2VFYU5KU0FXRTl5NVFs?=
 =?utf-8?B?SXQ4WWVyOTVpYjY2MHM3VllSWnBZTFk2Z0RDenRoaENqdURSdC95NlVhZlBx?=
 =?utf-8?B?MzhDeVJXcHVpSDRPZU1LT1hCOFdDRVB4YW9KOHlySXJhWGJNVmd5UytlT3dP?=
 =?utf-8?B?N1FzRWNKbGZ0V1ljTGxMV2J5YmRXTVhKU0xDM2ZMdnE4STlDbnNxOXNhY1Vk?=
 =?utf-8?B?b2dLTjlQR1dhZEdFNmVaRzU4c3hQRkRuVzlFcVhmTVNEYnJNVjNra1BSWFFO?=
 =?utf-8?B?NGJWbzN1UkhEdjBvTW9lVWJvMkY5bFg0WGhqS0VNYUd0NTFZSDRyR3NjQ1BP?=
 =?utf-8?B?Z01FVDJHTWFhQWlveExyckUwbzhUa1dBZHF5bFhUQnF5MjVzeGt3TWNoSUEy?=
 =?utf-8?B?SCtwNWJLN21NYllhZU5vdUlINlVzZkhSYUVxT3VXTjJGbHZyOVpFNW53S1Fw?=
 =?utf-8?B?S0pCdVFSd0dWMGtJWFczMWt4YmdNR0VoTDNiUjhUVUc4VnoyQ0ZEaEpBSjR6?=
 =?utf-8?B?TmhrcHdxWjhWWlhwUGxydzRXU2hOLzBjUC9aQkMzRTdSNWV3b3VKaVFGbGRZ?=
 =?utf-8?B?cWxoZk15MENSVHNNMVhwaE1lNXhPQlZpRGJzTEVDME9mZ0gxczJGNmVoTHpH?=
 =?utf-8?B?L09idEZuSDNUUXFtMzNvTFR6bEUzRmoxMkYxaHcrZmlBSDduS3VseDJSUEMy?=
 =?utf-8?B?Mmw5eEZZWXBUTG9ITVJCeXhRaFlndHI3TVcwVW5vSnJDRkxZUEVYVWxxeU92?=
 =?utf-8?B?N1VXeE01ODl4NUhGNk1uMHROeU1kQWF5N1NUUHh5bjNweitJYkRiSm1LMGdB?=
 =?utf-8?B?RUhHWHR5M3REMWhoMXJ5K0plZnd4R0VsbURYekl0SzZGTVFLSWZRK29IdCth?=
 =?utf-8?B?T3U5andFM3M4R0VDSVp2S0doSEJyL3hmYzNpN0dzeUZibEtrcEIvYzl5Ujlu?=
 =?utf-8?B?TTg5WDAvMGl3K2JRSDVZSDNnbkJmU0lrVEFCV2FGam1tUFBBYzRTRDRHaFlm?=
 =?utf-8?B?U1hoTXp6OGtOclJKNko2T3A1Um9YMnZEWUgvQURETXEvNEkxUWZWdHcyTDcv?=
 =?utf-8?B?clpCWC9VUDRzTGUzaHFkdGFoZEdsRmN5SklWUThLaWhDNzBmWWJxb0UzNVlB?=
 =?utf-8?Q?LmkuOf8JOqVQmiks1YnR2R0EjYuIPPeLxKJJVdQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df2ced6-6986-49e7-4abc-08d97886a9f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 20:23:22.3631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwUWVTKz6gUsk70wj7Z8PJdyz7VfTUM9dJmMdJnKXUv5/YqXNumemXACrD1xe59EuGa6rI/PCNTLVpicxIA4Nvos+bqwiUHcFHHwWQ3n2fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
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

On 9/15/2021 12:31, Matthew Brost wrote:
> On Wed, Sep 15, 2021 at 12:21:35PM -0700, John Harrison wrote:
>> On 8/20/2021 15:44, Matthew Brost wrote:
>>> Add multi-lrc context registration H2G. In addition a workqueue and
>>> process descriptor are setup during multi-lrc context registration as
>>> these data structures are needed for multi-lrc submission.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
>>>    drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 109 +++++++++++++++++-
>>>    4 files changed, 126 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> index 0fafc178cf2c..6f567ebeb039 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> @@ -232,8 +232,20 @@ struct intel_context {
>>>    		/** @parent: pointer to parent if child */
>>>    		struct intel_context *parent;
>>> +
>>> +		/** @guc_wqi_head: head pointer in work queue */
>>> +		u16 guc_wqi_head;
>>> +		/** @guc_wqi_tail: tail pointer in work queue */
>>> +		u16 guc_wqi_tail;
>>> +
>> These should be in the 'guc_state' sub-struct? Would be good to keep all GuC
>> specific content in one self-contained struct. Especially given the other
>> child/parent fields are no going to be guc_ prefixed any more.
>>
> Right now I have everything in guc_state protected by guc_state.lock,
> these fields are not protected by this lock. IMO it is better to use a
> different sub-structure for the parallel fields (even if anonymous).
Hmm, I still think it is bad to be scattering back-end specific fields 
amongst regular fields. The GuC patches include a whole bunch of 
complaints about execlist back-end specific stuff leaking through to the 
higher levels, we really shouldn't be guilty of doing the same with GuC 
if at all possible. At the very least, the GuC specific fields should be 
grouped together at the end of the struct rather than inter-mingled.

>
>>>    		/** @guc_number_children: number of children if parent */
>>>    		u8 guc_number_children;
>>> +
>>> +		/**
>>> +		 * @parent_page: page in context used by parent for work queue,
>> Maybe 'page in context record'? Otherwise, exactly what 'context' is meant
>> here? It isn't the 'struct intel_context'. The contetx record is saved as
>> 'ce->state' / 'ce->lrc_reg_state', yes? Is it possible to link to either of
> It is the page in ce->state / page minus LRC reg offset in
> ce->lrg_reg_state. Will update the commit to make that clear.
>
>> those field? Probably not given that they don't appear to have any kerneldoc
>> description :(. Maybe add that in too :).
>>
>>> +		 * work queue descriptor
>> Later on, it is described as 'process descriptor and work queue'. It would
>> be good to be consistent.
>>
> Yep. Will fix.
>
>>> +		 */
>>> +		u8 parent_page;
>>>    	};
>>>    #ifdef CONFIG_DRM_I915_SELFTEST
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> index bb4af4977920..0ddbad4e062a 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> @@ -861,6 +861,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>>>    		context_size += PAGE_SIZE;
>>>    	}
>>> +	if (intel_context_is_parent(ce)) {
>>> +		ce->parent_page = context_size / PAGE_SIZE;
>>> +		context_size += PAGE_SIZE;
>>> +	}
>>> +
>>>    	obj = i915_gem_object_create_lmem(engine->i915, context_size, 0);
>>>    	if (IS_ERR(obj))
>>>    		obj = i915_gem_object_create_shmem(engine->i915, context_size);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> index fa4be13c8854..0e600a3b8f1e 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> @@ -52,7 +52,7 @@
>>>    #define GUC_DOORBELL_INVALID		256
>>> -#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
>>> +#define GUC_WQ_SIZE			(PAGE_SIZE / 2)
>> Is this size actually dictated by the GuC API? Or is it just a driver level
>> decision? If the latter, shouldn't this be below instead?
>>
> Driver level decision. What exactly do you mean by below?
The next chunk of the patch - where WQ_OFFSET is defined and the whole 
caboodle is described.

>   
>>>    /* Work queue item header definitions */
>>>    #define WQ_STATUS_ACTIVE		1
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 14b24298cdd7..dbcb9ab28a9a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -340,6 +340,39 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
>>>    	return rb_entry(rb, struct i915_priolist, node);
>>>    }
>>> +/*
>>> + * When using multi-lrc submission an extra page in the context state is
>>> + * reserved for the process descriptor and work queue.
>>> + *
>>> + * The layout of this page is below:
>>> + * 0						guc_process_desc
>>> + * ...						unused
>>> + * PAGE_SIZE / 2				work queue start
>>> + * ...						work queue
>>> + * PAGE_SIZE - 1				work queue end
>>> + */
>>> +#define WQ_OFFSET	(PAGE_SIZE / 2)
>> Can this not be derived from GUC_WQ_SIZE given that the two are
>> fundamentally linked? E.g. '#define WQ_OFFSET (PAGE_SIZE - GUC_WQ_SIZE)'?
> Yes. I like 'define WQ_OFFSET (PAGE_SIZE - GUC_WQ_SIZE)'. Will change.
>
>> And maybe have a '#define WQ_TOTAL_SIZE PAGE_SIZE' and use that in all of
>> WQ_OFFSET, GUC_WQ_SIZE and the allocation itself in intel_lrc.c?
>>
>> Also, the process descriptor is actually an array of descriptors sized by
>> the number of children? Or am I misunderstanding the code below? In so,
> No, it is fixed size descriptor.
Yeah, I think I was getting confused between pdesc and desc in the code 
below.

I still think it would be a good idea to have everything explicitly 
named and the only mention of PAGE_SIZE is in the 'total size' definition.

John.


>
> A later patch in the series uses the space of above the process
> descriptor for insertation of preeemption points handshake. That does
> depend on the number of children. I will add a COMPILE_BUG_ON for that
> to ensure everything fits in the memory layout.
>
>> shouldn't there be a 'COMPILE_BUG_ON((MAX_ENGINE_INSTANCE *
>> sizeof(descriptor)) < (WQ_DESC_SIZE)' where WQ_DESC_SIZE is WQ_TOTAL_SIZE -
>> WQ_SIZE?
>>
>>> +static u32 __get_process_desc_offset(struct intel_context *ce)
>>> +{
>>> +	GEM_BUG_ON(!ce->parent_page);
>>> +
>>> +	return ce->parent_page * PAGE_SIZE;
>>> +}
>>> +
>>> +static u32 __get_wq_offset(struct intel_context *ce)
>>> +{
>>> +	return __get_process_desc_offset(ce) + WQ_OFFSET;
>>> +}
>>> +
>>> +static struct guc_process_desc *
>>> +__get_process_desc(struct intel_context *ce)
>>> +{
>>> +	return (struct guc_process_desc *)
>>> +		(ce->lrc_reg_state +
>>> +		 ((__get_process_desc_offset(ce) -
>>> +		   LRC_STATE_OFFSET) / sizeof(u32)));
>> Where did the LRC_STATE_OFFSET come from? Is that built in to the
>> lrg_reg_state pointer itself? That needs to be documented somewhere.
>>
> In gt/intel_lrc.c (lrc_pin) ce->lrc_reg_state is assigned to
> mmap(ce->state) + LRC_STATE_OFFSET. I can update the kerneldoc for that
> field in this patch.
>
>>> +}
>>> +
>>>    static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>>>    {
>>>    	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>>> @@ -1342,6 +1375,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    }
>>> +static int __guc_action_register_multi_lrc(struct intel_guc *guc,
>>> +					   struct intel_context *ce,
>>> +					   u32 guc_id,
>>> +					   u32 offset,
>>> +					   bool loop)
>>> +{
>>> +	struct intel_context *child;
>>> +	u32 action[4 + MAX_ENGINE_INSTANCE];
>>> +	int len = 0;
>>> +
>>> +	GEM_BUG_ON(ce->guc_number_children > MAX_ENGINE_INSTANCE);
>>> +
>>> +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
>>> +	action[len++] = guc_id;
>>> +	action[len++] = ce->guc_number_children + 1;
>>> +	action[len++] = offset;
>>> +	for_each_child(ce, child) {
>>> +		offset += sizeof(struct guc_lrc_desc);
>>> +		action[len++] = offset;
>>> +	}
>>> +
>>> +	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
>>> +}
>>> +
>>>    static int __guc_action_register_context(struct intel_guc *guc,
>>>    					 u32 guc_id,
>>>    					 u32 offset,
>>> @@ -1364,9 +1421,15 @@ static int register_context(struct intel_context *ce, bool loop)
>>>    		ce->guc_id.id * sizeof(struct guc_lrc_desc);
>>>    	int ret;
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>    	trace_intel_context_register(ce);
>>> -	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
>>> +	if (intel_context_is_parent(ce))
>>> +		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
>>> +						      offset, loop);
>>> +	else
>>> +		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
>>> +						    loop);
>>>    	if (likely(!ret)) {
>>>    		unsigned long flags;
>>> @@ -1396,6 +1459,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
>>>    {
>>>    	struct intel_guc *guc = ce_to_guc(ce);
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>    	trace_intel_context_deregister(ce);
>>>    	return __guc_action_deregister_context(guc, guc_id, loop);
>>> @@ -1423,6 +1487,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    	struct guc_lrc_desc *desc;
>>>    	bool context_registered;
>>>    	intel_wakeref_t wakeref;
>>> +	struct intel_context *child;
>>>    	int ret = 0;
>>>    	GEM_BUG_ON(!engine->mask);
>>> @@ -1448,6 +1513,42 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>>    	guc_context_policy_init(engine, desc);
>>> +	/*
>>> +	 * Context is a parent, we need to register a process descriptor
>>> +	 * describing a work queue and register all child contexts.
>> Technically, this should say 'If the context is a parent'. Or just move it
>> to be inside the if block.
>>
> I will add the "If the".
>
>>> +	 */
>>> +	if (intel_context_is_parent(ce)) {
>>> +		struct guc_process_desc *pdesc;
>>> +
>>> +		ce->guc_wqi_tail = 0;
>>> +		ce->guc_wqi_head = 0;
>>> +
>>> +		desc->process_desc = i915_ggtt_offset(ce->state) +
>>> +			__get_process_desc_offset(ce);
>>> +		desc->wq_addr = i915_ggtt_offset(ce->state) +
>>> +			__get_wq_offset(ce);
>>> +		desc->wq_size = GUC_WQ_SIZE;
>>> +
>>> +		pdesc = __get_process_desc(ce);
>>> +		memset(pdesc, 0, sizeof(*(pdesc)));
>>> +		pdesc->stage_id = ce->guc_id.id;
>>> +		pdesc->wq_base_addr = desc->wq_addr;
>>> +		pdesc->wq_size_bytes = desc->wq_size;
>>> +		pdesc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
>> Should this not be inherited from the ce? And same below. Or are we not
>> using this priority in that way?
>>
> Honestly I don't think this field is used or maybe doesn't even exist
> anymore. I'll check the GuC code and likely delete this or if it is
> still present I'll inherited this from the ce.
>
> Matt
>
>> John.
>>
>>> +		pdesc->wq_status = WQ_STATUS_ACTIVE;
>>> +
>>> +		for_each_child(ce, child) {
>>> +			desc = __get_lrc_desc(guc, child->guc_id.id);
>>> +
>>> +			desc->engine_class =
>>> +				engine_class_to_guc_class(engine->class);
>>> +			desc->hw_context_desc = child->lrc.lrca;
>>> +			desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
>>> +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>> +			guc_context_policy_init(engine, desc);
>>> +		}
>>> +	}
>>> +
>>>    	/*
>>>    	 * The context_lookup xarray is used to determine if the hardware
>>>    	 * context is currently registered. There are two cases in which it
>>> @@ -2858,6 +2959,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>>>    		return NULL;
>>>    	}
>>> +	if (unlikely(intel_context_is_child(ce))) {
>>> +		drm_err(&guc_to_gt(guc)->i915->drm,
>>> +			"Context is child, desc_idx %u", desc_idx);
>>> +		return NULL;
>>> +	}
>>> +
>>>    	return ce;
>>>    }

