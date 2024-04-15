Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797A08A4C50
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB5F10EA0F;
	Mon, 15 Apr 2024 10:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOfQJRiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18D310EA0A;
 Mon, 15 Apr 2024 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713176016; x=1744712016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gNz6n9xlg2LM2b0PLHibImI7mpCaCwV91HRyuJ7LfB0=;
 b=LOfQJRiwBw/AfYDZP56riDbbaKeX2wVApu9/Hk7ANWuOaaSLspDx6hiF
 x2aoQJwSdwpq2MhFsrOiful48CJyP8ragZSnh+zRkZIBxiZ7pmzQ8VXiW
 M9hsIzPjHfMk+B7e+mwTnV5NM9sjfi9SJXFniqvsGqVZauIGd1093TYuv
 GnFytNUb6R5PGlnR4NMJfq7AMrN4syx9B+/29rhNfHaaH1cTS7cg55OJZ
 gv0aR02OlmBj8WigN5IGntiv3n7z5RqwSG//9NovwQfzR/FotCzl71pcI
 4D+zist45JDiTcD8vdOrOo1EOLkSPJF24RLibnuArqKLbYKKOn/fb09kS w==;
X-CSE-ConnectionGUID: 4lNetArjT0uBu7Dj1eSdyg==
X-CSE-MsgGUID: idjpFgXOTDCF4b21GEHtmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19951652"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19951652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 03:13:35 -0700
X-CSE-ConnectionGUID: we0VCr+oSE2qV+pihBkFOg==
X-CSE-MsgGUID: 8zV9F5aARVeWRZWb1FolIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="21970817"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 03:13:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 03:13:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 03:13:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 03:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdTcVMlcNMSQu+hL7g7QSmF8ullanhrRApvkzERqhqKc6cEjpLOHjf97c4SBwiu7sly8gEzehkbbI99ea17TD2ke3ZKWLMtXVsL0v1muyG7qal4U34X2ppsmvq9e5BgaSEJz0Stb+YeufYjQsC2wjvYG96h4beXQABJO0tV71sYR9NdpRirrNXYBMkYsO9jXLOOkzPsvleBt0ceZDHffNWmvFOZVxbyt+ODSvbOdnQWnKvlBd7sK8L2OVqvHihJsQSWN8CMtZHstJ0KWRLCTj3xQ/1qqzHLqx1tZAxZ6mBctOEv5T6N4CMYX/3vh7vh7xgrCOdSRBGCczVwNLx9f8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKFvaDzqWkLI75GdTAN3QGWfsI4rzxQ2m7AwLPXOX0M=;
 b=ZWql9FRVWYP7hBjzW0xcjNtvYbchX6ySPn/PrJyjpAz+3VNLHCQrwGOY6L1zfJXtO1RnK7jGvP+lEzpnRwlHVmYXDa4m8Ju3mDb590Qya34+8rj8PCSS4mkLpczvp4BmsTmCUXLebu6j03eT1c0buJ0i6SuaQuKm8KMt22L5qd1Y8OMUGwObrAo8iEg/0c/CVYCHahigtQ0sIDfAjCU9tpdKIRJPGTnb4JDs/KbRv/wviRdOagZvlGBfkBZhKWX9APv+BDCC9FAXhDN6c18VKUqOapmF/+k9ld7+B+5n8OSaBHsnbu4oYLOFZVTtCx/HqWXX+TbgBQz3qazBvIThqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 10:13:33 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 10:13:33 +0000
Message-ID: <ef49c728-08c3-4f4e-b233-96d928ac8a03@intel.com>
Date: Mon, 15 Apr 2024 15:43:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/irq: Remove unnecessary semicolon in
 pick_engine_gt()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <lucas.demarchi@intel.com>
CC: <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
References: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::20) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b44d85-aab2-4803-9ea8-08dc5d34b457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: be44HRhejQeDy/dpdJafDHjPv07zo6YxlxksqSi9RjXsqLCDxT1a16L9uVXEgIw9tRNTVEc4ebgMuIh3pYLDm9MBkRZ5k2G8X89hFHGZnA5IlyTlL2icljZSP/CS+tvfGvEG/mcrHwch+Hb7Qi/d+XY/lr9g/vjd5Y3ZbIwMKmSBQXe6hYvOFrGDSM3d+rgtvw8B10L4Ze3Ez25ds7eMxEFiqf8RyEObACFLhmeRHXCNrFa4TpKHqNxhDcbo8Wr4HVq25aKdHI9jWlNxMlMfXleyD8FQxYUlOz1Xi0iSbFeMMhB1sE05puFUiLtvOgKofjlOkHX46CSE7NHyhgPgaHBi8+m+2DMm9cGVTM63PC+gCJwwoxXVgwydV9lMtgpXGXLwFFX5z9g2hqFSz8R5sgLHbpS+lRISiXmv/eM+yc1mJcqkBQdNSlQsm0R4Saxf8lOWp5oS/3mm0oJYUO6awapJsdRuw0SaZuOeibAPUeoiNrBvQPfVfs6clz4IpTqDLVA3Tge3CJ9vi5VKnK6Rtpo8j2C8odHHLE40Ljprp7/jwzgPBce1F9/CXyEDMyi5P6noHtSIA1TEFACkyaadlsg2LeWR09w1txK8deggtjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXN3S3Y4cUxSMm9tZFU5R25TNy9kMFhvSVhVZjZxN1NabGIyOXdZVmRsRVlQ?=
 =?utf-8?B?NTJnekRYeTVlUnNKSWlWekVJVUgzVjFwbWlRWmc0eWtWb2I1YXduK1g1MG1Y?=
 =?utf-8?B?S29EdXdCRWpXdW1IMFNqbGQ5bWNHQ0lWcXVROGtaL0FvQ0VWVlJmV2dqRnZm?=
 =?utf-8?B?OXJRbFJHcjFuNFZzY21hSnZZZjNzK28zbXhGRjJYdEFkKzh0YTUvK2tVWlJZ?=
 =?utf-8?B?Qzl4RE9sYndyVGUvdzgycE5uQUFQK0lOWmlCNUx2RndGb1UvbnR6OWZUTUw5?=
 =?utf-8?B?amx1MkMvd01Mb2dqaGswdmhjWjB1dFhlT2Z4aEd6RDEwdHQ3QVRUSWhESkxP?=
 =?utf-8?B?T2N5K25WaDRCaEVZc1drQkZWSnc5VnBLZTNnR2RlaCtQb2UzdFdZQzBNWmVw?=
 =?utf-8?B?UEJySndEMktveVR3cUl1dXNJbUVnaEpGNHFBelE1RXpGNmRYK3YreEdOOVZ0?=
 =?utf-8?B?RnRQaURoRDFwVC9WaVdCbC9hUUMwRkNnSlZ5TlZPMkNwWDNlSHA1dG5NMkFR?=
 =?utf-8?B?NXc5RHVxcVEwYjd2WmlBZ0QvN3UxUTRKekdNcUpRc21zNjNrc1laOXRYWjU5?=
 =?utf-8?B?RUNkVUt4d1krUFpjSDhkbFV0dXNzUnJQL1FscXZvOHFURXZrdlNKdENudGNB?=
 =?utf-8?B?S0g3a0J5OEMwUldLZTI1UWZHaUpQU01uaXJjVXVWR3I0akt6WlhDNnNKZzRB?=
 =?utf-8?B?NUduVmFja3FLUFZ5c1NaeGNJeHpDOXVuTXRvRGZTVkwvclh4TXdMR0N0NE5u?=
 =?utf-8?B?TUJ3cXZ3VU95TDZOd2YzU043MVBBVDJOdTRTa0xVc1NFdWFZV295MTc2QlBG?=
 =?utf-8?B?ZkRlYTZrbWZtVWYwTEM4YngzR2lsbmFGdHF5RjZiNCtVc3V6czZuNm5MMS96?=
 =?utf-8?B?QU83ODhHSnQ4dWlFM2xLendPcFdFNHZhZEdYODlLNDZ6cFZ1dmRkTGd5TDhN?=
 =?utf-8?B?d0J6SVdPdUk3b2VOeG5RcWgvV0gwQ1A5blluUEJQaUhmaW1DM0QwbDRYKysy?=
 =?utf-8?B?Ry92bnlMejI5SGlWMCtMTmVRNDhKOERyVFhVY0FBbGdoS2dHMkJJaE9hY3pp?=
 =?utf-8?B?S25NY0xkd1lvcFNiTk1VUStpS1BxS25ZckFlLzd1OUVBaHFaYjJCeU0yMlRR?=
 =?utf-8?B?WXhCQkdwRlhvd0UzVWVVQTBwVFRWY1VPVUY2ZGpTNHQ4MmNnVzRMRUQ2QTA2?=
 =?utf-8?B?WkNjZHJ5OXBESFVxWVJPRTJYUFZjT28rcE5ZUWsxS3VVVHIxMFhWTm1SNTFV?=
 =?utf-8?B?akJFaTEyTVhjcFpRb0w2VzNWSDBjS2VmOXBwSVdXWisxdURuUGttYVdzVXNQ?=
 =?utf-8?B?UXZMVDhCOFpINGdrSWxCejg0TnhGem1xL0hSMHlYcy81SEphR1dBeCtjaE8v?=
 =?utf-8?B?MlhZQ3NKcHVhWmtHdXRLa056YjZkZkl6N0c3OFkrSmhXaWw4a1hOdXUzN2JZ?=
 =?utf-8?B?c0tMVlFYQjU4YXZaLzd6WDBGcDVrbVdDMlB4WDM5WUFkVlZTZzFpM0VhRXZy?=
 =?utf-8?B?b3lKczJGWXY2T253dzlPSzlrb3U3QkNVR25ZUjJLMVAvdmUzUzZublp5amhy?=
 =?utf-8?B?TGQrR29VbXFIbkFqcjduSjBaT3VHeUFUbmxRb3pTMGlGVTRCQk5ZR2lFeU1P?=
 =?utf-8?B?alRydFhEaVFINkpZOEgrZkk3blA5bmJLenByTDJxVmpNRy95S1NQV25IbDFS?=
 =?utf-8?B?ZW83bm8xc3hwekdUMTRDMFZZd2JVWHFvUllOUU85TXpmSjU2dVRPUDczNHJP?=
 =?utf-8?B?TzRvMTdMdkQ5cDNqdVcxZUppMTlDVWUySlhxUTh4dVhvZGxCTDloQUFPbkx1?=
 =?utf-8?B?T0tPWGUvUU95ODRtNk1WU29NYTNQY3VRV2ZWN3lFYnZ5dEJEWjBqbHgxcjda?=
 =?utf-8?B?VjdvTmNPK0pIK2JZNlcycUwzblRVSkRTbXpkK29oRTh0dnhCams2K0U0WGZs?=
 =?utf-8?B?TkZXdVBsN1Vqd2drZ05zR3Nmek5UMWhrOUFpMnBaK1ZGdTdPWjM1U1Q3U0c5?=
 =?utf-8?B?YkIvQ1RSRVhPcENFSHJQUHRNcVdkL1plUjdTYktrU0U3Y291NThMMzBrM2p3?=
 =?utf-8?B?L3JxL0ViNnJWeWwzN0cvLy8xakZObHA3QTFkRGxNSHJqV0twZUlBaE9IOWVj?=
 =?utf-8?B?Mlo2anZCUUNXL1hyMDNrNy91TlBGY2hCOUpUWWZ1ZURBdXVIQ09iU1RYZVhZ?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b44d85-aab2-4803-9ea8-08dc5d34b457
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 10:13:33.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UusW+GuLhHjFZ+eT/qWedQmbuNOYB+bsRn5nOliq6qeZS/7jx5crp7nyhV042p8WAoPOrW03s/7zR7sFZyYbRBSlKC689iZUDufISZepUb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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


On 4/15/2024 12:37, Jiapeng Chong wrote:
> No functional modification involved.
>
> ./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.
What i meant in the first review, was the commit description. The commit 
subject looks better now, but the issue remains the same: Line numbers 
will change after new code is added, so, it's better to just write it as
"Remove unnecessary semicolon in pick_engine_gt()" instead of 
"./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon."

With that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>


>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v2:
>    -Make the commit message more clearer.
>
>   drivers/gpu/drm/xe/xe_irq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 996806353171..5b1a2f46a1b2 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -276,7 +276,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>   			return tile->media_gt;
>   		default:
>   			break;
> -		};
> +		}
>   		fallthrough;
>   	default:
>   		return tile->primary_gt;

-- 
-shekhar

