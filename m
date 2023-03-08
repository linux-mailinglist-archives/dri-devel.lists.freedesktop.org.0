Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B495F6AFEC3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 07:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE6410E588;
	Wed,  8 Mar 2023 06:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7B10E588;
 Wed,  8 Mar 2023 06:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678255976; x=1709791976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Jx/KAits8zQQZQBmfOZrzIVDJyKnIQiYoAP9BbZl0Q=;
 b=hvqDzDefAtxs/+FAZOn/YBAkJvTNoBwhgMnoU0Oajh5lcPAjX1oqhUxV
 IEeFkahV9CkzZBG3SuNeRdL7wHAVI1A9idsAlWuiYziY0o78uIDAyLxy0
 SaatHF6w6muqKHTqPN1lBFavwACXo7EXBrUmL2OVKgFG/MPEDbqX2qYcI
 Eltt8l5HbwIKazPPGcCjebmKAS+nnszrNVg5+1U2YQT8YpZ+7znO2YRbd
 0KiC387L3/xzx/vSL552Cfk8qEGMfXqQwL4Cbe3A2qfOOn1oWvn+c+qPS
 JyqBy1HHqk2inqIBbOxkm5BTVTiESz6rjHlPpOEIcUyXR36Qg8dXq38Y8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333544132"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="333544132"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 22:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800643038"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="800643038"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 07 Mar 2023 22:12:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 22:12:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 22:12:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 22:12:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 22:12:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns6j1/slZrsvqTqPYaaN99skJQWbYoW+/dQf+buzLaKFdwuHzFmk2fQ+Z5I338HiBOKgnUOLCurvJxNi2X+HFmv7HmMzl8JZTFnuOlpGQOSqprInoQ1vuCIV+ajwq96uk2QzE8CSYwepM0KhmBz+4CUUt2Li53z7lYrHNHlZZ3uxfASc4AiGyF2grGzUYUmQXT651p+RROLDJA26Ggj6mtaF1Y0tdIz9YNx9aNcWB13AmEPTa3ILilAeuU2cfruXNg/EBv20jGsP6wkuYN8rVVaVxNS//2l16VjIHhzKxsD+KhKp7rXuxz84vZ6LkZoTQ1AMyhhcsuHLcs4BrNNtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DChb2nGcRqw9Ip3KATT1wRuXd3YSzokxpLu3j/zOeC0=;
 b=FARmm6eR13jHMzEoL8MrgpT3D3nnzdOdmzYBv67Z1xEkijzRsYIIGRh0LDt1A+Q9B3UN1U9EZW1q6k46uHxQMyBGoLY22aBgX9dxJ4+5OSKUQg/rdFwpc09nRwem83jvIqnZhS38fD/KYJ3gs1ku8trvJONtJvxLbIDyhmiAnvwEHj8UmtUZkKQDe/iH/s5w5bFv6BmN7kQFJxG8xOA7f5eF/ugT8EFDNB6JscVfv/YhQpJENq3iu+7bpRItwA8oELOZ4NxUxrV1v/lgcOEkzPLLD0+DIiCTpNq05jmlPEZfOrOa+v+sw+tApZIr9SQCsLxo2kgkuAQfA1vEP9sBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 06:12:52 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5%5]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 06:12:51 +0000
Message-ID: <8b4e02e6-35a0-5262-5f85-5671f4d287b4@intel.com>
Date: Tue, 7 Mar 2023 22:12:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] drm/i915/pmu: Use common freq functions with sysfs
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230308053321.939906-1-ashutosh.dixit@intel.com>
 <20230308053321.939906-4-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230308053321.939906-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: dca00262-3264-43e2-0c12-08db1f9c25a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nlk9J1RK+iFC6xwJ/xaUQaaiSfdgfZSxlSk34+QlpACJK6QOgNfcs1fgUqjLbMXv4loK7Cfrmjou+CkT2TvIN28ZCoDFVQJMiq6ysrZyHp29GAouT8Kdtex6ZJLof/3CFTgJ6nSuhHcFd4sCR750W5Mw0NHo65kGg2Zn8EOZuth4MTsPzQ53XCJiRGdmkT0IabOrxJVnIyDIoUUh6+j3AO/6RHp9mC8qK5LTxzkezv+OefYNHHL9RApcq6LG1DohE/eNFrzwq1KQ+SjGCkd1SYuBF4mgXa1ylCK0c/qtsd/g5BJCXUxZ+HKRYqRpaYdHZwbBsjuP+yK0o/pYKa1UYKFCEVD27XPJbeCDe+bPoExw6PCl+/DJAdaSY4DSqd9BqU7grB9NfOUKJKv6e0QFOR/uWiQmXs9txH0hYCm+dEtr8oDQ1e6XU94dUxCIc8YC+x4j3HtGbdo9wWhNqVKzNMjM5TukZN0/DaWgfcVyDk1YdHSK7Mbd96JkmBiWn1QbgaLCvLkJRf90yHgUAbbLcK1ZeqEV1x5/gu3iGsup+ukA4cxlqkVb12v76vgeMOT4N9bXQ3wNzz6NWtKYwUtiwPcETJ0OMcvxQZxhhNEHAo0/IgNBHcMKR6irBbP/2wmW7+yO4kvkbWHkTgt7g2LoqQmZxXBTx6IidRfGkly+If98O1WTO5LXCT99ig5yq79UArzz9aquUz+us4gVJk6YFC+Dnq5Hv3tEhBrdVwS3Vxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199018)(66946007)(4326008)(8676002)(66556008)(66476007)(83380400001)(86362001)(31696002)(2616005)(186003)(38100700002)(36756003)(82960400001)(53546011)(54906003)(478600001)(316002)(6506007)(6512007)(26005)(6486002)(2906002)(8936002)(5660300002)(31686004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEhwalhnTk9WOVlzaUYrN1I0bmd4L3ZJcTBocmxpd2duajdjVVh2QXFYUEdw?=
 =?utf-8?B?UHUya3RUMUJ6MEZaSExHa2hxSGd3RUdYSnJ0WkhEVjJsRzZlR0Y3N3J3VGRz?=
 =?utf-8?B?bnlxTVF1WkV5Ty9lQUwvV2t1WGVZYUhsQm9XSGd3WllrZUVDQmZ2dmJlcXI3?=
 =?utf-8?B?em9veVkwelJDb2FtUnQ0VkgraUE1NkU3a2ozM2dmWm42cDIvVGM2cGl3MkRI?=
 =?utf-8?B?cHlHNnluUDZhc0RDcmVZVkN5YXdCcDhDUHRBZlRueitwUjVmdGFjeHk2Z284?=
 =?utf-8?B?WXJYMjFZSkNsazJLcXZqcGkvYXpleis4elZQRC9sRlVhT0ZWQkY4Y3FJVkdi?=
 =?utf-8?B?OHZIb3BWYnkvMGlCbTRJUjV0dEIvSkZXYmZpelgrbCtyUFBHYlE4VGRoVHVT?=
 =?utf-8?B?V1FTbll5MUsxd2lxay8wSkpSTS81dE1mN0RGN0Y2RVZqbGJtdHhtSzMvdUd4?=
 =?utf-8?B?eHFuSnlPODVmZXN0MS9WSSt3cTVpZmVFdm5ucmo0Zk4zbVpFdVlHSjNBRk5C?=
 =?utf-8?B?NXArRmRhbG14K05zczgrNk1xZk5waWRCVGYwTkdNdnllazlHUzAxT2VKQWdt?=
 =?utf-8?B?dWlCKy9RcFRlSVcxVmJOem9zWHFVdkpoaGNZNnhLMnlMV0VGcFVXTlFhdWIw?=
 =?utf-8?B?eFNPb2ZmMmtCZzlzNkdPajZQVVNaMklPcmR3d0M5V0dCb01MSmE3QU5zLy9T?=
 =?utf-8?B?MHA5NGs4Z0k0UzJ6b2k1enQvUlovYUZRQWNDZVZBa0pBWk9YK1l4bkkwbmhB?=
 =?utf-8?B?RzlOcFlMOVFZaVVrUlZVV1hCYkpRNGZZNVMrakZLOVBNTFhxUHdHMzVBSXgx?=
 =?utf-8?B?TUZpQ0lqQTZqUDEyRGh1Y2F1QUxIc0dWekVsNmRncmFSOGVwZlFhOGEwRGFq?=
 =?utf-8?B?TGN4KzZOQkN2OFlDVzVjeWpjTzFUa2NZNFhQUlR4QTdkN1N4T1VxNFU0azFH?=
 =?utf-8?B?SktCT09MNDJOTTNrVGFacnN0UitsbjVIS1paMWs1UTdVQ25mTCtCcFVVNFNo?=
 =?utf-8?B?UnVpTlgwdjZhSUM0Rkkyc1p1TzF5T0xmOTREMjhpSFVKSHpCcGhCZmdDUDM3?=
 =?utf-8?B?VjdkNXpLRjdKQXh6TFRPN1hjN0hxR28xdGFIMjhIUTdBQnMxcjZUQmtlSFN0?=
 =?utf-8?B?alJITEVGYlZER0l2SElZakVWWkFJVUdPVUYzRXY3eXZxTEZOQi9oTkJNWDRP?=
 =?utf-8?B?dE5zbi9pNTZNNGV1NGNRa0kzVzhUYmhDYmhyaE5Xd3pjL0tGRG1KM3ZybVNR?=
 =?utf-8?B?STJwWEhHUGFSVEZaSXRYd3VwaXU1OVdwN0hVUFc4WW9BRSsxTnlJSVA2ME02?=
 =?utf-8?B?QU5ZQ1Z1YktzdFVDVzJRRjRCU3JLaU44SktxU1FmRHA1VEFhTVBXUVcyRy9R?=
 =?utf-8?B?SkY0YnpRQ3IyRXMyOEVSV3JJV09VdTd5UTRQTVhDRWx6U2xrVXlzQkVhRno2?=
 =?utf-8?B?ZkdHMmdLVkc3NlY5NFQ5bGcwU2hPTFRjYnMwNG10d1JWaVZYZWdiSTA0Y01W?=
 =?utf-8?B?ODNMQVI1dUpjZThEcDBQa1dteW9CV0pzcGVNTktXanJsb2dKOEJBOXlvaXBY?=
 =?utf-8?B?VzRSSzE5UVNnY2RpZFpoUC92UjN0aC9scmlFWDloVGtIVWJOM1NKNmxEQndK?=
 =?utf-8?B?OE1ZZms3V1lWYitSTGYyM0h5OFQxdGpCb1ltRDd6Rm4ydVJHaWJRVjhsRGx6?=
 =?utf-8?B?S2RBNTJ4SDVPQ1BCTUFDemlIWm43TklpZmxQb01iY29ZVGs5Z05Mb3V1bUpv?=
 =?utf-8?B?MC95WVJock9NWTdldXg5OVFKRlgrVU9lTGFpRkRrMi9uUHJ4dzc5UytnamIv?=
 =?utf-8?B?LzdUT3paMzgwUXdkWmF1VFZUNm14eHltYVk5Q0RsRTJDRGJ1b09WeXFycW8y?=
 =?utf-8?B?UXpCQUpTdTZ6OC9SOGVnWGpjUFI5UWU4NTNiUzI2WGZRTzdOYk5tMmZuZDlw?=
 =?utf-8?B?TjNNYTgxMnYyVS9tUktxSUJnVDl0czRkWkpoRFpmTGpDUlFZM29SVUJMeGI3?=
 =?utf-8?B?V0pLVlZzUXlqQU9OSUZ0bm5aeXJEMTl5WmV4ZE9PTVZuK0hrQlJ0bnNqZ1o2?=
 =?utf-8?B?ZzBtWGtzVFB1ZWtMcGFQLzNqQ1A1a0ZqQTZzcCtiR01jdXFXNmpEdWNOU1RH?=
 =?utf-8?B?SVVIdURpZVY0dHNDSTNNUGp5ZE9MTHNDak1QTTArellUc3k1Y0R6NGtqT0Zr?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dca00262-3264-43e2-0c12-08db1f9c25a1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 06:12:51.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+gwORKM+s+UFJ5EeCcILIVbvsaKnJBSkvQ3AF8TRfcAQUq+Rz1Vw5ndIYcBXhoCHFGpobraC4TntJQDIzX/SmETsd68hNewGigRsujZtm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/7/2023 9:33 PM, Ashutosh Dixit wrote:
> Using common freq functions with sysfs in PMU (but without taking
> forcewake) solves the following issues (a) missing support for MTL (b)

For the requested_freq, we read it only if actual_freq is zero below 
(meaning, GT is in C6). So then what is the point of reading it without 
a force wake? It will also be zero, correct?

Thanks,

Vinay.

> missing support for older generation (prior to Gen6) (c) missing support
> for slpc when freq sampling has to fall back to requested freq. It also
> makes the PMU code future proof where sometimes code has been updated for
> sysfs and PMU has been missed.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 10 ----------
>   drivers/gpu/drm/i915/gt/intel_rps.h |  1 -
>   drivers/gpu/drm/i915/i915_pmu.c     | 10 ++++------
>   3 files changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 49df31927c0e..b03bfbe7ee23 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2046,16 +2046,6 @@ void intel_rps_sanitize(struct intel_rps *rps)
>   		rps_disable_interrupts(rps);
>   }
>   
> -u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
> -{
> -	struct drm_i915_private *i915 = rps_to_i915(rps);
> -	i915_reg_t rpstat;
> -
> -	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
> -
> -	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
> -}
> -
>   u32 intel_rps_read_rpstat(struct intel_rps *rps)
>   {
>   	struct drm_i915_private *i915 = rps_to_i915(rps);
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index a990f985ab23..60ae27679011 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -53,7 +53,6 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
>   u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_rpstat(struct intel_rps *rps);
> -u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
>   void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
>   void intel_rps_raise_unslice(struct intel_rps *rps);
>   void intel_rps_lower_unslice(struct intel_rps *rps);
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index a76c5ce9513d..1a4c9fed257c 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -392,14 +392,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   		 * case we assume the system is running at the intended
>   		 * frequency. Fortunately, the read should rarely fail!
>   		 */
> -		val = intel_rps_read_rpstat_fw(rps);
> -		if (val)
> -			val = intel_rps_get_cagf(rps, val);
> -		else
> -			val = rps->cur_freq;
> +		val = intel_rps_read_actual_frequency_fw(rps);
> +		if (!val)
> +			val = intel_rps_get_requested_frequency_fw(rps),
>   
>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
> -				intel_gpu_freq(rps, val), period_ns / 1000);
> +				val, period_ns / 1000);
>   	}
>   
>   	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
