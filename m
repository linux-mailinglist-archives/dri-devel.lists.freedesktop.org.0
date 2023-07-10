Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A92274D3D2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F2689A16;
	Mon, 10 Jul 2023 10:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A601410E140;
 Mon, 10 Jul 2023 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688985902; x=1720521902;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8icpLw0CR3Vt4sje4Tolul9u+Pv9NUD+T9QQIGqddtA=;
 b=SpDHbu+lWYEcWPA/XP2rMlV6b57kucvKfxIjXOjDRYnmYUW3y+eNg+XP
 qokqIuNjwR6ZDpt4svO6QdsIPrTvDhquPLxwnnajdRKLQs6lj3pLmJK33
 VrPfGlDsfbobPm1kCQxF/seJbtu/Wcevmcj0FyE0NEZBgEtk4qcpPI1y2
 OZphh3XEOahCHd08IpTpggacQyzddPJzZH30a0t1T6ib+AZquz/hg6LhX
 CzxH292K8NzIaS6vczhL+u3bs6Gj56qQJZAjW3w5qvHa5/OSVComJnWT1
 KjCijNBhYvMhifA2IwcF3s/e0gEeuJ5H+1Tp4NbxTDDcP3mmpI+Tqifmt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="354169204"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="354169204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865300450"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="865300450"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:45:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 03:45:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 03:45:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 03:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTeiVpIbaqG8ZCnWJcSesGOTfwBYs58ZH+tgskzsZY8mwixnbjnLm7j8q/390ZO2C2kp8/wkZ+UKNSaSr1q93YroniGoClLp5E85EvsZIjaImNnST8O2SIYv7o5TR1vHzTIFhkAon3kupK56BkCxXgoMiWrpgbTmWlZBCfHMNnVyaRYi2qDaefvxoq0CQBXtBlOxKvSqsW6rJdV+CWIxANuamY9Fkkga/7+H5o5ocMVGTBE2zRQrJVVvMvJYKjbbNYLBd1EcEQs9jVKhcc+BhYkw+ltolvDL30Ay6ogQ10b5cxiZIHZbv6A0KjvWzLV8aQVCHsgMpQAMJiNLuDgZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzc683aKqZ/vlorQ3h5HF37G0z5oE1bM1WKx7hyp54s=;
 b=NPlejQJVUQMGrxGf5Fv1ydtT5S65h1rarMYcYfY7ZGgZ4w2JKLMwxt5h3LUlFBre8iFmYGZ2DEOFjdr21CgD8bKJEPvM8IJFDeSvkSq4z2iDCllwJs5TMz9zbGWY4wuS+O8faSci+1hhAXz4OdIA1/Y0SqbH7t4I3W5D1iP4uh421Ik2fSqTJOYKBXeice5FwfoiL0xfzhBOSD2xrKVGG4przVcHg+n2APdlxN1RVfkK1yzTcXmvDO5+Rr93XX6nFezIUcQI6CVlM+DrhgG3ADLmtV0lgYur/0HS5twD9ZiQ3CCgenpNAB6exD6qea5vQ12x7Q4ytMU9e1s9Hftc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by BL1PR11MB6051.namprd11.prod.outlook.com (2603:10b6:208:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 10:44:58 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 10:44:58 +0000
Message-ID: <261b6cd8-3978-05ea-1348-c63e4599c518@intel.com>
Date: Mon, 10 Jul 2023 16:14:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Add ability for tracking buffer
 objects per client
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-2-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230707130220.3966836-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::18) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|BL1PR11MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: d9955f62-e2ac-4bfc-7c75-08db8132b4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dcTBed5/ZN3zy5NYPZIUJPWKgcWxa1wuCS/Ed+Vo4BP3WCRmZa0Hlv2iWUS/MbZCgIQhbkKIPy8qvV3DyL/wfVVhx8lZWYP7wjo9ctXlhuzL5VioLs2ha+VUpzj7kHlGtEsaTYvV+amZegCrrT81SqIz/OxfaG1H+IXom/Jc9DIIloDtg/EyFp4A11sfmB9dZB8L0x0bnPgR88eMgw+Qwp7+h40TxE6K1sAUon+iE1bo4CixWX9xwJWZMOeKCoVPk6fM0OPTrti5C0pzAZOR8LfL43FEdGAZW9EYqVqNq18dQWLSNEkFm+gsT6mQap1tY9jjknlfsXhADhqTRjLI2wxgc7jmIIo0eGeyXzpdy6mq6mjAoxCEst0534+RsviJHjwPlWZcSzMLDzlS2HNrP/fFG9g5uVrIFfIYp+mJaKGQsdinccRMKg/B3SOBpD/6MlUHVmnrzmgq/k0MTrfYXPCDRCeOophSbjKYeZct0bGKNP3rIGBkPg2IJ+sCf4ihFcdiRpVA7rq+OacI5Hj0ZMehod4kTLjvA91AzFv8dROV1RWfqhvsywKcxzqWbI2a7rJgofkFcUzfsSsOD74ljTosZTxqMAgO5m8Z/CKNOd5i7zS3LDcMvxOlN6RBUiAWsmZSiehrYAg2i/0SirOuiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(31696002)(38100700002)(86362001)(31686004)(36756003)(6666004)(6486002)(82960400001)(6506007)(53546011)(26005)(186003)(6512007)(2616005)(5660300002)(2906002)(316002)(66556008)(66946007)(66476007)(478600001)(8676002)(8936002)(83380400001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJubHhBd1ZQQUl6bktDZ3BDNGFBdnI1RWYvNkppRkNCQU53dG52dnJOMzZt?=
 =?utf-8?B?MEJBWDIxNlBtcUNpelVyZ3YvaWUvQkEwYWVkZmtOR0xoMlJ4djQreklRNW0r?=
 =?utf-8?B?RTNnU2dSOGs0amYzLzRBcVJSckpaUFFsV2RJQmY3LzE5cmQrOERydGJJQnNw?=
 =?utf-8?B?cSswaHdnT2dDalVUZ0I4dGdMUEE2OWpwRm1BOGxOZ1RHR3pOU2VxVFNrQlNq?=
 =?utf-8?B?bk4ySHYxdHJLUFlBbEhYOHArV1V0ei9MRmFqR2pKNWd0WlRzRTlWRjV5Qnlq?=
 =?utf-8?B?VG13N1pRWlJmV2F2WG9UdEJGL3NKSm9IKzNSSWxaWnU0YTQ0U3E1TXZ2TzVN?=
 =?utf-8?B?Y2NmSGtUVVFxS3VQRmgvY1ZTYXhFaHpLUFk1NGYvaGlVUmVCcjBsbzlhdVpZ?=
 =?utf-8?B?bklyMUJaTE1ydEgvcEUvNVhMVDRBeG50a2lhRmdmOTVBeHdmVDh5QU9GUmo1?=
 =?utf-8?B?VW8wQnR0bDJreUNYdkRuUUl3cXRLL0ZCbzJIR2trMjJweTdkTlRQTzFXTFZi?=
 =?utf-8?B?d0pNK2xjcHQvMDNlNHRUTEphZTU3aUxOeHJJNWFmNHloalVRTGhabTdWUVJG?=
 =?utf-8?B?d3dDbFdSbHVtdVFhWldwb0VXNEpZZGFnOVZkZkpibi9JNzBsRnFnZDkyaEpN?=
 =?utf-8?B?S0NVNEtrN3FrSk1NTlh1VG1xMG9mNFc1NmxKSjR6L01pdzZ3MVNRZEVSYVZu?=
 =?utf-8?B?Z2hWT0J4cVFEd0VhQmRIcHR0UXVzYkNKcUZDRUpkc1Q4OUg3K2Y2VkRLNzRC?=
 =?utf-8?B?TXFFVFhqaUlSbURNcy9UdmNBeityQVEzbnJnbWFzTFBRTVpGSmhaWk1ZdUZY?=
 =?utf-8?B?QWNUVWl5VjlYZ0VZR01oN3pYTzdsZi9FZnhrZnVwakh3WmtFU1R6N0JxQ0t5?=
 =?utf-8?B?MmtmTFo2VzBpVWpzMlErbHNuUDltSlJoVkN2bmhmTzY5TDd0K3hlRjNwOXk5?=
 =?utf-8?B?UlllbU45WW5TR2RmTXplRm1qUEJtNWk2Q0dpbzdTOGlhN2tVNU5EZDdaWU1S?=
 =?utf-8?B?R2FUOVZNQjJ5SlZqREdJUlJodGttSkw4anlCNFFRWEFDdDJ1MlBldnp0Z2pT?=
 =?utf-8?B?Q0l5Mk5MTm9WMkdLT3RrRmNKN1V2amxMMmtmeEgrRExFR3ZpYWtqUnJaZXVx?=
 =?utf-8?B?SFYrOW0zbXVZaTliU2VvSG9QSUhrVmNjTVgzZHJsNXVtMUNnY0c5bkRGRTRW?=
 =?utf-8?B?UEhCRkxGdzBwWjBGRUNUYTdXUktpNzR5ZURKSzFBbWg4d1huTGpNekEyUjd2?=
 =?utf-8?B?YzVucyszd0hxQktCWU5wZkNRYS9peTNjb2QwNS9RQTgreDZabTJOTU41Q3Fy?=
 =?utf-8?B?UUNScXJiY0xsWldoWUVOMnRuNzQ3RDQ4NHpNTGNIcjdCYkFGdVYvZTNMelhx?=
 =?utf-8?B?aCs0VjJGSTB4L25ud21uaWliY0d6UnZMVENRdmZJMlFpeUZXcERVdWJXZzdp?=
 =?utf-8?B?THJDL1M3UTNtY1FLa3czR2RsSWpmRXUrV2t6czZtV256aWpIdTg1aExaOW5Q?=
 =?utf-8?B?OUFwQmxtL2lDcVVQZGowTmhhUUhlMjluamRFNm5UQWNvSFVyVDRFQ3MvQ1VR?=
 =?utf-8?B?d0JpRS83SC85dkZvVVpDSklZZWVIWDZwT0FRNVZ0Vkt2TGM5d3dnMzc1am1k?=
 =?utf-8?B?VnUxQThNWHVTa2dmN0UvYlZPelp3cW84UVVtbFJpeHBsdnEwTS8xeldzQXAr?=
 =?utf-8?B?OEdndHpBekovR3pQNDlJU3ZhYVdNR2lNbjJhNEhqemFNWlZQQkRQSm94S1cy?=
 =?utf-8?B?aXpGS3JlUjFPTDhuWXJ2S1JQWWQ2Y1MyNjQ0ajFrTW1pUWN2WEpiSVBrQzlN?=
 =?utf-8?B?UC82dmxwTE1iNzRHUDFZVVlnaTVTQktzN0VQSnNQZjRRUjlTclovQ0x0NVND?=
 =?utf-8?B?cHNNZTZ1SnFRdkY3SDk3cVZyQnEvcU5Ta0VYWi9pZ05KQWhKejBGWEU1M2Z4?=
 =?utf-8?B?UWlwQytWWC9XV2ppaWtKcnlwRTdwZkJoRzVnSVhIWkJmOHdMZDdRTkJPUkpt?=
 =?utf-8?B?S1BIK3ViTmpoSkdYVDBqUndMcnI5bGlCc0dCaEdDbjdiaTMvWHhleGRoY1NX?=
 =?utf-8?B?Yi9QeUZLNjdabnRKei9Yb1RYc3AvOVdLTEFBOEVuTi8xRmVva1Y3b05HaFVP?=
 =?utf-8?B?WWpPSDVqN1YxbXA1d1FFaDlwNlFBTzNiODdEcnFUeHcyWENQTFI1STg3a0VR?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9955f62-e2ac-4bfc-7c75-08db8132b4aa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:44:58.5847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZ5IyiOzCvj4c2tsdmGH4cIQH/qbd6Nm9LD60K0rQaj8YJSqo+sAxN5VMwrDRtueERbdUKjf2tAcgcc4i0Vs8IzlJV3HqUpc4F7sGgPVR0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6051
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



On 07-07-2023 18:32, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In order to show per client memory usage lets add some infrastructure
> which enables tracking buffer objects owned by clients.
> 
> We add a per client list protected by a new per client lock and to support
> delayed destruction (post client exit) we make tracked objects hold
> references to the owning client.
> 
> Also, object memory region teardown is moved to the existing RCU free
> callback to allow safe dereference from the fdinfo RCU read section.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 13 +++++--
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 +++++++
>  drivers/gpu/drm/i915/i915_drm_client.c        | 36 +++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.h        | 32 +++++++++++++++++
>  4 files changed, 90 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 97ac6fb37958..3dc4fbb67d2b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -105,6 +105,10 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>  
>  	INIT_LIST_HEAD(&obj->mm.link);
>  
> +#ifdef CONFIG_PROC_FS
> +	INIT_LIST_HEAD(&obj->client_link);
> +#endif
> +
>  	INIT_LIST_HEAD(&obj->lut_list);
>  	spin_lock_init(&obj->lut_lock);
>  
> @@ -292,6 +296,10 @@ void __i915_gem_free_object_rcu(struct rcu_head *head)
>  		container_of(head, typeof(*obj), rcu);
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  
> +	/* We need to keep this alive for RCU read access from fdinfo. */
> +	if (obj->mm.n_placements > 1)
> +		kfree(obj->mm.placements);
> +
>  	i915_gem_object_free(obj);
>  
>  	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
> @@ -388,9 +396,6 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>  	if (obj->ops->release)
>  		obj->ops->release(obj);
>  
> -	if (obj->mm.n_placements > 1)
> -		kfree(obj->mm.placements);
> -
>  	if (obj->shares_resv_from)
>  		i915_vm_resv_put(obj->shares_resv_from);
>  
> @@ -441,6 +446,8 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>  
>  	GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
>  
> +	i915_drm_client_remove_object(obj);
> +
>  	/*
>  	 * Before we free the object, make sure any pure RCU-only
>  	 * read-side critical sections are complete, e.g.
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index e72c57716bee..8de2b91b3edf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -300,6 +300,18 @@ struct drm_i915_gem_object {
>  	 */
>  	struct i915_address_space *shares_resv_from;
>  
> +#ifdef CONFIG_PROC_FS
> +	/**
> +	 * @client: @i915_drm_client which created the object
> +	 */
> +	struct i915_drm_client *client;
> +
> +	/**
> +	 * @client_link: Link into @i915_drm_client.objects_list
> +	 */
> +	struct list_head client_link;
> +#endif
> +
>  	union {
>  		struct rcu_head rcu;
>  		struct llist_node freed;
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index 2a44b3876cb5..2e5e69edc0f9 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -28,6 +28,10 @@ struct i915_drm_client *i915_drm_client_alloc(void)
>  	kref_init(&client->kref);
>  	spin_lock_init(&client->ctx_lock);
>  	INIT_LIST_HEAD(&client->ctx_list);
> +#ifdef CONFIG_PROC_FS
> +	spin_lock_init(&client->objects_lock);
> +	INIT_LIST_HEAD(&client->objects_list);
> +#endif
>  
>  	return client;
>  }
> @@ -108,4 +112,36 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
>  		show_client_class(p, i915, file_priv->client, i);
>  }
> +
> +void i915_drm_client_add_object(struct i915_drm_client *client,
> +				struct drm_i915_gem_object *obj)
> +{
> +	unsigned long flags;
> +
> +	GEM_WARN_ON(obj->client);
> +	GEM_WARN_ON(!list_empty(&obj->client_link));
> +
> +	spin_lock_irqsave(&client->objects_lock, flags);
> +	obj->client = i915_drm_client_get(client);
> +	list_add_tail_rcu(&obj->client_link, &client->objects_list);
> +	spin_unlock_irqrestore(&client->objects_lock, flags);
> +}

would it be nice to mention that we use this client infra only to track
internal objects. While the user created through file->object_idr added
during handle creation time.

Thanks,
Aravind.
> +
> +bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
> +{
> +	struct i915_drm_client *client = fetch_and_zero(&obj->client);
> +	unsigned long flags;
> +
> +	/* Object may not be associated with a client. */
> +	if (!client)
> +		return false;
> +
> +	spin_lock_irqsave(&client->objects_lock, flags);
> +	list_del_rcu(&obj->client_link);
> +	spin_unlock_irqrestore(&client->objects_lock, flags);
> +
> +	i915_drm_client_put(client);
> +
> +	return true;
> +}
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 67816c912bca..5f58fdf7dcb8 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -12,6 +12,9 @@
>  
>  #include <uapi/drm/i915_drm.h>
>  
> +#include "i915_file_private.h"
> +#include "gem/i915_gem_object_types.h"
> +
>  #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>  
>  struct drm_file;
> @@ -25,6 +28,20 @@ struct i915_drm_client {
>  	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
>  	struct list_head ctx_list; /* List of contexts belonging to client. */
>  
> +#ifdef CONFIG_PROC_FS
> +	/**
> +	 * @objects_lock: lock protecting @objects_list
> +	 */
> +	spinlock_t objects_lock;
> +
> +	/**
> +	 * @objects_list: list of objects created by this client
> +	 *
> +	 * Protected by @objects_lock.
> +	 */
> +	struct list_head objects_list;
> +#endif
> +
>  	/**
>  	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
>  	 */
> @@ -49,4 +66,19 @@ struct i915_drm_client *i915_drm_client_alloc(void);
>  
>  void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>  
> +#ifdef CONFIG_PROC_FS
> +void i915_drm_client_add_object(struct i915_drm_client *client,
> +				struct drm_i915_gem_object *obj);
> +bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
> +#else
> +static inline void i915_drm_client_add_object(struct i915_drm_client *client,
> +					      struct drm_i915_gem_object *obj)
> +{
> +}
> +
> +static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
> +{
> +}
> +#endif
> +
>  #endif /* !__I915_DRM_CLIENT_H__ */
