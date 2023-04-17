Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D16E50B2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 21:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC910E148;
	Mon, 17 Apr 2023 19:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316A110E08C;
 Mon, 17 Apr 2023 19:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681758950; x=1713294950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iorC/86T/6LB9QEOavZ73rghkTMK20MydD0/AyvN5XE=;
 b=TI8nfWqMzbGw3NliTmQSQx5YjjOjdhb7BG3Cv/DqUHQYnVviZ2Xj795H
 Wq7smMR7e8jmKY4psFCxs6kb6fxhrNLHptwhMEL0n+xhA8V8mBY+/h7OE
 zgnH9LIXPoHmnTggBR2qeT7qRChmOtsXfs3vG4OmAyWymNOBjZiFhXj8t
 O0QO4qCcXwG2tTem8XEGEWgwsNHRj2NxFsZ999yd3c9kABTkkMFXP2amP
 ZD8oA1HcWO5xFMLCStHZcCpaJw7rmh4pTSCo5Nm0DRr3FurRBRy+6MN3E
 0OVSJFF6XHvD9w4W+nsBKNuV66edjM/SGVTyvL0xfYKXTN6C+7zziKpAa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407879721"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="407879721"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 12:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684270639"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="684270639"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 12:15:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 12:15:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 12:15:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 12:15:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 12:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1ePyrJuFS9fhdClGFnpFCABqK6TPFGbF11wSg6ANMdlrYnnsyQOYgVXwo9dlXVkyN4MB+EBtPQSvWJwpLn+J3k38mqxvO3xdvXZBXAoHjAHpnd+M1S8vFjiUq3WqTbHAyXQC+Jn8FpHaahBE9ixgtGtNYTBvJXPR2jQAJDKtjxXVVinQIf97iFa+J6pKZMYoXV3B6TJcNzOAymfD6m4Z5W3mQ0pvr7E6pXZ7N+0gGtzyUzABFVep4ER3+JD4EnvHOue1hXoEKywn4G2r+YEXGz48baQwf8hXXCq/Vhs4iyiBbos0tFbaGefzqI8HuXwVw+kLRqDQPnlAM8roKDVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYJug6yuYPqpOrz0mD+s79V5kdmHjCcRcTJYP0JYex4=;
 b=TrUy6x9FUN+FswX/LrlP9i5fv1BZhD7mzAJeXRVhM/Aov8wc8Smqsv6QUjKaR6T0OKic9RCTWUN0FX6a0Kv0I35Wp5UyJNjZFZQmrjbXrg3wrv5j/CH+r4c6vlrVXANgjfzQvArHKYmxWUDa974mfzBDy7fEfuFR7ndLZdScFEvZ9hJTwTTfPlt3qQ8c49PmjcNfStHa0+qY9lhxz3w5ox/h4j03ikyTU5w/7kZtv726tCiQ95wzaHH9X5Se/v9UIyCel6hrrHnBIkHh21/gG6wXTtdBdDxnKBt4SdQlp4xP7TwpOG+bSZRsKQN4I0OZg255pqGFtJgLzq3wUcQIGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 19:15:45 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 19:15:45 +0000
Message-ID: <55584390-8086-df81-5649-76e45039e306@intel.com>
Date: Mon, 17 Apr 2023 12:15:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-6-alan.previn.teres.alexis@intel.com>
 <fc68c7f6-4306-b208-7b4a-d04b83969311@intel.com>
 <9bb67b2ed9ae681388c0f39dba29532083b323ba.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <9bb67b2ed9ae681388c0f39dba29532083b323ba.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: b4732603-ea8e-423e-7800-08db3f782503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKDL5LxBrF2Kik9r+kPYKW+9daagcBe/LcqGW1Xwc9oCQRbx8aT6J7lkkak5nAJTyxfBQXsMU5jblnpmcov9ps4aomMwX8WTi1CPmgzi57aEURLXKs/ztRFoKIwoetiAk5W+JaGDv9ee8IzcyJn32JFJT+avuDYAqxkKhjR/NWMAi+I3dvKTl+U+d7KzKWAMymUL++O2Hw9vjkU3yP6ctNWeywrSQ4spsdCK8brvaOf8gm0wyNKAUBIM9jP5sWLk3BDrMjqotitlDeny52Pm6NkpzrgLkgY1306qWBZhxs3i9PLvsqPTn8D8hNZgS6xpn5zF2NaKMNijMcuBDusEvpUchomcsRHjUvr9gBhMrQr7LSte1SX2TKTQoNRMvmnZ54ZshldPAotuoXR3cNlH0khgi5zQLkWaVQaVYqdyxX3hnNiozmGr9R2JUrmBRMPeLaz6Hs35zWZXguDig2/HodZzFxehnYSVxWcm6OQT/zMsor/oCxy/EFDLuk40Jl+UZfZMiJA/po57zMtTdlcHOzy2GTLpJ403fAbHMDKAzP+rD+hJYwH4ApjYPNt02tmCw2dYV8rMj+mbcz5IZc1U4YVnJyEiRmjUDRCApoMbKAYwO80h4aq1oWjgTZldH+ZRjdfcQVEw/MAACO/MIhYvJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(53546011)(26005)(186003)(107886003)(6506007)(6512007)(41300700001)(110136005)(54906003)(86362001)(2616005)(83380400001)(4326008)(31696002)(316002)(66476007)(66556008)(2906002)(8676002)(8936002)(6486002)(6666004)(66946007)(82960400001)(31686004)(38100700002)(36756003)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJRUlFDaXlIcUEvamhLYTh1UUlxQWwwVHFPK0xmYVRyaTNKNUZBNFJTK0o3?=
 =?utf-8?B?YmVFb0ExMlc5Slp3WVRNbE5hbStVTXZFanpJdWlkMWJhSlJrV3ozNUl1MTRQ?=
 =?utf-8?B?M3VCSWRsNUlmdS9kT2l6UUkwY1VmNnhITXhVaUxHMDdIZ2xmK2E4eEZrTm5L?=
 =?utf-8?B?aWZvNVJTWnIrZDUyNEJTVTVmSnJxVkVTejg3eE9UdlBWb2VqVzdlZjR2TUIz?=
 =?utf-8?B?YldoSVNCVjUycEVlaHJ5Zys4a25pY2VSWUZkbjdIbzVxZmQzY3gvY1djOUhH?=
 =?utf-8?B?ZEJoTkI1TFdYWTNPc2loRGlETUhDRFlFU05oYS8yTWxROU9Vd3dTSjY1b0k0?=
 =?utf-8?B?a0gvK1hOb09yTTMrVzdIR3NFZkE5UXd4K2RKclhGbVNoY3VwNGJ0RnVvZmNh?=
 =?utf-8?B?MXJCOUI4cGV0c3JJeTMvVnJyZmZlcjJlTVMxUEVSV0QvV2VHSnBXM1h0Z2Zl?=
 =?utf-8?B?cURQODNiUTlPWFRuRlNLSkUrakFRaWNNazg5Y0YzZ3hLYVUyVVhTSkU4YmM2?=
 =?utf-8?B?YTZyMWtINjgrS29QZThtM01kaTcxazIwbTBiUHY2ZmVGMGVnMm1IcnJCdmNT?=
 =?utf-8?B?aCt6V0lhenBablRHZFF0b3Z4R0lkQldmQXFMQTZoZDF2N0dXZnNwY056QmlS?=
 =?utf-8?B?UkN3aW9KY2tNRHZaUzRONzhxMVRocGxVaXo2ajFIeC9hN3FUbXRINGU3MFBL?=
 =?utf-8?B?K3F2Z0I0MkkySXVTY3ROenBRNjhGeWFKWVlFU3dISStFQml6eHdjUk93cUZU?=
 =?utf-8?B?OTloKzlLQThxVnVLN0FyMERzRnpOS0JwU0x0K3RGZ2x5cUpmYXJqUzFrSWlJ?=
 =?utf-8?B?WVJFY0hKUFdjUWFTQmtCSHZNem05YmxKRTBxWTNyQ1cwM1phMkNGRk1NSk80?=
 =?utf-8?B?T2VPYkNLL0RjV2g0eUk2aE9YbU9wU2M4b1pTMWhNMUdQWXNUeWZURW5IR2l4?=
 =?utf-8?B?ckJoOXVYUXFMU2IxQzVoVFlsemhJTnFDK1NwQ0x1WW9XRmt6dkxXbE51UFU0?=
 =?utf-8?B?d1FLNnlUTmFlbXVOMDFEMEdKMW50S3BlWTR1TWtFcVJqbkJieWxVTE8vQmxB?=
 =?utf-8?B?cnBMRTNJWWtvYk16cm01d0pLNEcxa0Frbi9DK0xjbjdyNGY5M01Lc3N1ZXNN?=
 =?utf-8?B?NjJ2Q2V1N3FydlJjTWhaMFJod2E5K2piQnUvTGJMa0VoYXdhWXUwSDVGdExs?=
 =?utf-8?B?ME4ybWZLT2s2c3hMYjBGNlRDV1Nnc3lMSTVyYUJ5OXZxU3ZVZWwvbnFES3Ix?=
 =?utf-8?B?bkZaeDE3UXFoMUt1N2tKOGRKeDVJM1ZZWE5yUlJlVjdxNDAwYjZZeHJPKzM3?=
 =?utf-8?B?ZXp5aTVqT0FXRlhYV3pEY2tPWUtOT2V5OW5nU3hkU3FlR09Wd1NReDJ5TWl4?=
 =?utf-8?B?Rzg4Z1R4Z2l2VFA4MzJsNVN3dGZEbXIybVlyNFJzTlRqZyt0VUpmUkZqUUsz?=
 =?utf-8?B?VGNJUFZsYU9SSEFhdEhBTE9KWjZZeTdWT0JHaVIweVVYeWdNSnlwQWwyMGV2?=
 =?utf-8?B?L28rVWNFSStpeGZOWkxackdDOGU5Y3ROclBOblV5ODYwYVphTjd1dGxGT00r?=
 =?utf-8?B?azdvK21qWHZqczJiZSt5MjJOeFJuMjdUV3BHZFpuOFVKYmZDR1M4bVp5QlBB?=
 =?utf-8?B?aTBPNDBLUkcyRDlaZ1MrZ0pDUVp0TnpMSEpOaDlmR0VudmFQMXZ6TmI1dTBs?=
 =?utf-8?B?bTFEL24yU1Q1K2dqbkNxTkdxZ1dReWNKang5MlNOVngzTVNrNnFrQ1NZN1M1?=
 =?utf-8?B?Mnc4VmxlVjlXc1g1ZTJ4NlNNUWUweXBveVB6eTVUK01hWi9qYXkxU0FYdnUz?=
 =?utf-8?B?dGNIMExtRjRkd3NKcUdmbHl5enhMT0wwMXNkRVBTcU5Ndk5PRktSTlhxZXZl?=
 =?utf-8?B?aDZVN2tYZ2I0eGVCeFE4TlU2c2FDTzlqWHVhTEU3TkJHaDVaS2llYU9Ub2Zj?=
 =?utf-8?B?N0NZSDJ2UXFJUzltR3d5WmFxd2FkOW5UNFNCdVQ0QktWVlVoN2FzUndSbTVG?=
 =?utf-8?B?UUJKK1NMRVRLUFR3NHFTTjI1ODlXODdwd1EzQXgxSjcybWRPSjFLZ1FqUCtl?=
 =?utf-8?B?L0VBbk11dGxDZExCNXJJdjlJVDczQkFSbndYT1Fhb0hHMHY4Tmx1VExTYW9T?=
 =?utf-8?B?eXVJVTY3ZytqUlBjNWp5U0F6SlpTb3laWWxGRmg1dWlNbkFJOEYrYnd4OHUx?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4732603-ea8e-423e-7800-08db3f782503
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 19:15:45.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vO27BrBSOkCypSBYM+pbW5swce7nboEhphfZWHzYoBGtQO6gjocgQpzv/8XN4W6kdZi8QheXO5cIgJbkLnvTrVjzBv+c+F/VjTBaCVLST4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/2023 11:21 AM, Teres Alexis, Alan Previn wrote:
> On Mon, 2023-04-10 at 10:14 -0700, Ceraolo Spurio, Daniele wrote:
>>
>>
> alan:snip
>
>>> @@ -354,8 +368,14 @@ int intel_pxp_start(struct intel_pxp *pxp)
>>>    	if (!intel_pxp_is_enabled(pxp))
>>>    		return -ENODEV;
>>>    
>>> -	if (wait_for(pxp_component_bound(pxp), 250))
>>> -		return -ENXIO;
>>> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
>>> +		/* Use a larger 1 second timeout considering all the dependencies. */
>>> +		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 1000))
>>> +			return -ENXIO;
>> This needs a comment to explain that we expect userspace to retry later
>> if we return -ENXIO and therefore the timeout is smaller that what would
>> be required to guarantee that the init can complete. It also needs an
>> ack from the userspace drivers for this behavior.
>>
> alan: I agree with a requirement to comment this down. However, i believe its better
> to put this int the UAPI header file comment-documentation since it applies to both
> current MTL as well as previous ADL cases (this is not new behavior being introduced
> in MTL but it is fixing of the spec of existing behavior).
> That said, your feedback is already being addressed by patch #6 but i will ammend
> patch #6 to add the detail you highlighted WRT ~"timeout is not larger than the completion-guarantee...".

Can you move that comment update for the context getparam from the next 
patch to this one? that way it's all nicely self-contained in this patch.

> alan:snip
>>> +fw_err_to_string(u32 type)
>>> +{
>>> +	switch (type) {
>>> +	case PXP_STATUS_ERROR_API_VERSION:
>>> +		return "ERR_API_VERSION";
>>> +	case PXP_STATUS_NOT_READY:
>>> +		return "ERR_NOT_READY";
>>> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>>> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>>> +		return "ERR_PLATFORM_CONFIG";
>>> +	default:
>>> +		break;
>>> +	}
>>> +	return NULL;
>>> +}
>>> +
>> There is a lot of replication for this error handling, I'm wondering if
>> it's worth adding a common function to handle this. Something like:
>>
>> intel_pxp_header_error(u32 header, const char *op, u32 id)
>> {
>> 	if (is_fw_err_platform_config(header.status)) {
>> 		drm_info_once(&i915->drm,
>> 			      "PXP %s-%d failed due to BIOS/SOC:0x%08x:%s\n",
>> 			      op, id, header.status,
>> 			      fw_err_to_string(header.status));
>> 	} else {
>> 		drm_dbg(&i915->drm, "PXP %s-%d failed 0x%08x:%st:\n",
>> 			op, id, header.status,
>> 			fw_err_to_string(header.status));
>> 		drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
>> 			header.command_id, header.api_version);
>> 	}
>> }
>>
>>
>> Not a blocker.
> alan: Thanks - i will have to address as a stand alone patch since i have to
> think about moving this to a comment helper layer (common to both ADL-mei-comp and MTL-gsccs)
> while potentially have different set of error codes that can mean different reporting levels
> (i.e. notice once coz its a platform limit vs always err out if its runtime related).
> Once this series gets merged it will be easier to work on that patch (which would require both
> backends to be present in the baseline).
> alan:snip
>>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>>> @@ -10,14 +10,18 @@
>>>    
>>>    struct intel_pxp;
>>>    
>>> -#define GSC_REPLY_LATENCY_MS 200
>>> +#define GSC_REPLY_LATENCY_MS 210
>> why move from 200 to 210? not a problem, I just want to understand why
>> this is required.
>>
>> Daniele
> alan: so 200 is based on the fw spec - and from real testing i observed the occasional highs touching ~185ms.
> However, the spec gives this number as the expected max time the firmware is going to take to process the request
> and post a reply. Therefore it doesn't include the additional overhead for the request creation, emision,
> submission via guc and the completion pipeline completion indication. All of these contribute additional layers
> of possible delay. Since arb-session creation and invalidation are not common events,
> I believe a slightly wider overhead of 10 milisec will not hurt.

Agreed. Can you add a comment? something like "Max FW response time is 
200ms, to which we add 10ms to account for overhead".
With those 2 nits addressed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>

