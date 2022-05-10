Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5A521061
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5690410EE19;
	Tue, 10 May 2022 09:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AD310EDEB;
 Tue, 10 May 2022 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652173916; x=1683709916;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JZf550IPTTa6rkTLXazp1xEt6p8oBqTJqyj4YyyTs/g=;
 b=P13QRnavLwhM3N0ki/mpcJz61Fw1tGpNeSp0Xh4AhMF8SBBf5wMka+WU
 efe9+r01n+/oU7+0PEkVrqkJEVs2mKEPFJJSNdJqTPIOB3LZezhOFeeXr
 Hk1qCSPRBr+Z1rc98NS1s2mfOaaKYwY5Dxc0a/eKLIUNEMxsJEM9Bpa35
 e0HL2adBW6YPDIh6M27eP+03iU0l/hK1gfVoOKvW9IIF5UffsZOcQ68U8
 1nqu+3IDPIFIFQnA9sMUB//wjhV5fxaSt3DJinIg0q966CrYn0V+cSYyK
 DoxbM0OU41EjjBglypSzsVPj5DslIC/ELfo8IwvKBG5aqio0r/d+JkoV5 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256852769"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="256852769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="602373512"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2022 02:11:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:11:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:11:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:11:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMmn0seaWZs681Wwggusc04pZGdk6olCV9Etoa+m/H4WYtF9ZG4ex4O0vOLS6dBY+xCB/IcbQgX2b/lew0F7+Qw8eEtSc9KdyxgtSFEkd0AIAL9/NQHm2SEpU7wD6wB+Q7euNinPzbJ+vW2bYaaKHK6o0Z0mTHlP5/Kw+QjBXTzRczSaTq4g9cjhfSK0Nz409PGvhjFb6LD2W2PlHk4695zRBFoBJDo+vBhoSnDiNWpqsjd+ehMI3CsSXiivWMWMSMP1CwudqGitDjm5AzST9nJ03VFjn2chJjcbTyO9FBsGv0HyWv+HwYzB6JUxM2R51Nhj6ToI3sOdw2aKiiShEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjrhEVoknV+RZUcq51p56n+eVPekdzGz7d3oYOc/ahg=;
 b=YpKFLfzCZ1mt2dDzHA2QMpx+90ozqePXjHBVbn0wlAet/980ELwjdAL/X1wAWzx2RKq/+I5AEloUETqNvxk0juZ82Vmxx0AoXOGJxT1S472tatmLq7q1+6CjUompfpbQrXzXDXEZhtIAA69qrEnpzcZ6yxJaEhx27rVQNo99KLD6vxb+j7bWWjjfoU4qO3iLpc0KokTlbnQhSNbKFA8pPguKw/+g4GNW9ojufAkGovW2MbQ/8etNFhQxaAjdJUyR6pmjusy4HpwoZLNMQ6IwZPDIqDrPTWCuMhCJZhTDUNtrr24wt0TxdF2ejqKcS45V4gm8fbYps7qNk1bavLavcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BYAPR11MB3094.namprd11.prod.outlook.com (2603:10b6:a03:87::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 09:11:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:11:51 +0000
Message-ID: <e97c92f5-8b95-e934-54cf-8f2c2e39d857@intel.com>
Date: Tue, 10 May 2022 14:41:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 12/25] drm/edid: convert
 drm_cvt_modes_for_range() to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <c2c251a504933debacf78e1382ae665ae490ed40.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <c2c251a504933debacf78e1382ae665ae490ed40.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4a140c7-fc07-41c8-e8b2-08da32651e39
X-MS-TrafficTypeDiagnostic: BYAPR11MB3094:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB3094EE661281DD897EFA0881CEC99@BYAPR11MB3094.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqXPXygSl3wadXeliU8fa223RMwbbhzDpbGJqewYdjeQr7wYgHRm5ORaDfY1AvmQeU9E9V0ztQd5TX4M0qLJEvce998BxSz3JgCToKywlNDmTv5xlBKGbo/tQsl+ZT460LC7An/qjtzqoCRoMkn7wS0oSLj/xhGkyt8JeK27wQRvXRvCSNkXpXSlFk0Q+TEvZk9847LsSKALacJYcyaR9ZJDfd7etos6SGgIKPbPAwDBdT20CNCUyUCpeVfMjAQPePlz//UIXeaN8rbXCfihn2FWHAH8CmSsJN5gPnSL8H95OLmZz7PKvJ6Ps+WCo1t/OR+h/VKo8IfeKSv34WT9cwPWEsrh/TU9UZl2YtRpE5crGEuX23uVIrFeV5ABKp/4zvfNtW3oAuVyF364rq2+gak8PGWy9Qrhxm26h2+ZEkqX8KeY77quTnbGg+7QBWfduHT+2acdR/0s6UCMwippMKJQ/xsBgbK3/7MFW7+hNTOo8Fikg1Q5UJt83duQxVx6eG4aXqfDh813E+nGUzhVgujeNq3hnJsKhD3A7P5hxBvD9pJ04JW71WbBpwAgrC/hA+2S5sMDAuMMnS0PPWeqx57q9vveMCvjFEvKkJ0uY0hP1R6czPazTkIM31f/tlzJilbWCI9s++hiLM1POJRjtroRmDo7O4+hzaKeKWkEj8whx0K1bnl/rUEr4+JFJt1wh7pY06tX78a8iJcAuzt5qmZarImw/tF1gBMeUQRb1+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(36756003)(31696002)(82960400001)(8936002)(31686004)(38100700002)(5660300002)(4326008)(450100002)(83380400001)(508600001)(186003)(66556008)(8676002)(2616005)(66946007)(66476007)(316002)(55236004)(53546011)(6506007)(26005)(6486002)(6512007)(6666004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3BKZEQvZGt3RUJuZ3RDT0tXb2pQSHRQN3pMNGJZT1VTL3BpaUU5NXIySmZR?=
 =?utf-8?B?Nms2a1hIVGFib0ViVEV2QlNveFFrcEhJV0JUTXBPU3ZKenVxU1VGdUtIckZz?=
 =?utf-8?B?Sm1kSVI3cTlFeDVRVEVLMUFtU25PdVp0VUNBQXU3WVJaMlNPY0Z5M2FiMVRr?=
 =?utf-8?B?bHJYQkwrMDYwVm8rWHFJNjgzemw1VWxSdjArVWt0QXd1NmZBSTdlQnErT21p?=
 =?utf-8?B?UEFPRElUN2UzMzJ5OERQekFFSkJqVXBNak1ydVZRRGhkYXVxSW43RXJxY0Yv?=
 =?utf-8?B?blIxNTU4UTNHbFdZZHlIcFV5Tk1VOVBlYmFpcWtWTDZDQ3BkbjZUYjV6azY1?=
 =?utf-8?B?aEdTOFpGZ2dXY2NadzJpN1FnWHpVcWZKTVFjaFc1aDNHMGgvTm03MGJsTHdt?=
 =?utf-8?B?RVZOVk1EYTBXZFJHdy9MTDhpZzFHVXFzYVZqa3AyNlJycllmaTFsVloxbVZp?=
 =?utf-8?B?ZjR0aS9sNTFBYU1rQ3FTcVhXeWdBMjhjcGRhWmlyZ3oxOTRXUHBZU1VNUUtG?=
 =?utf-8?B?aUVaT3huSWM1ek80WThNaGFwSVdURjlRN1R3d3MxUjZFdllZR3NHY01DME5v?=
 =?utf-8?B?dVdIUlRqVWQrbEt0ay9PK1RIM2RxTUJZcUFZc0dZYXhjUytreGR2dC9Od1pQ?=
 =?utf-8?B?MSs0OWVDV2FyalRCMHJVRUVneW8zbnFpUGJVZUZMcWVPUktwcEJCb2tGbnBt?=
 =?utf-8?B?djB0dEo1akxpYXUxRzE3U0xqUW1VcVN5cklvelBMWU1xRVNvRFhlMi9OM1kx?=
 =?utf-8?B?RGh0Z25mK1NxRkZFaVVXaGVONU5NVWRMcXY0WlRYZEpURWJSaVlyRHJBMTVj?=
 =?utf-8?B?cTVVSHFVcVlFTjgydHFaQzkyZGxkRmFsYlk4UUt0VllDT1NOL0hINWVYZUV0?=
 =?utf-8?B?ZXRvLzI4OWpKcmlWYUxZbHhDQi8yUllzSzEyV2I0M2grYlhFd05GOFFaMmdF?=
 =?utf-8?B?UXg2ZHFDa0tINDVUaEFrbmFoMUlLT2tpSFhWM3RJbkxWSzhiZ01vbTZ5b2VM?=
 =?utf-8?B?VVFxOVA2Z095d0gyKy84VTFMME92RTJhektEOG1oS3lGMkpFSzF5RDd1eW4r?=
 =?utf-8?B?eml5UVJ3SzV2NEFJQWFSdlQ2bWJHQ1pnSkJSQnU1Yk1kalZsc3hrdFlrZXdQ?=
 =?utf-8?B?b0luMUFjdUd2dWlubU9lV05RcUlXK1FTNkFHd2NvaWpRUUVwOXE2Uyt5OWI3?=
 =?utf-8?B?OFo0NWR6RzJRakhZS2t1VEN6dE16ZWVOVzRYVjhZQ3RYZjk0b0dNOVNlYXR6?=
 =?utf-8?B?R1JJM1ZpZDQ3bEw2U0lieXZKZDNxY0xlWG5YTXIwRm5INmFxbFpzR2JuYTAw?=
 =?utf-8?B?NkkvSXVBWXc1cEpnSVNOMEFOQWYzSzVqOWVYZjE0SUdxeHVSbEl6VjUvQmcw?=
 =?utf-8?B?RmFzd2NERGZGaVVhbTJ1dW5QNjl0NXFOMjczcmJ3L20vYTRFSW0zWjZjVmhV?=
 =?utf-8?B?QllWQmE0VkdPZlh5OFJxMnNMMHp6LzhTYVJlcU1KRGYvZHBTV0JUWm5ZT3Vi?=
 =?utf-8?B?U3RsMWxCL2FEdkV3dFU0aWVLemlKV3RoSno5Vkc1L1Z5VWVGTEhaY0E1Zzda?=
 =?utf-8?B?Tm94UlEzNmZkcm5EcnZvTGthNTZPdEM5VlVvNzVaN3ZlZEkyY1R2VFZMTGht?=
 =?utf-8?B?U1Baa2JkZXNEZys3dEo4N0ZHQTBpRm5WYW1nR04waDZIOFFZVTN6REJUblFv?=
 =?utf-8?B?c2l3c25Gc21IbmhCMzdENXBMSVROQW1aN3pSVlVkMTBhbWRHTnJWaVBkTzM4?=
 =?utf-8?B?Vzc0RkhDWGR0dWZSVlJFMmhXblhBUTh1SUVXK1V2RUg0S2NOcHNFMVZkek9F?=
 =?utf-8?B?S1Z2OExxQkRVNnVHRDkxRHhQM2oyeWJtWng4N1Nmb0pLR29uRHN2dytpZkdr?=
 =?utf-8?B?WUlMT2VQRWlBT2dFbUxEeTZmeU9WbitsclVnU3dwWS9TRmltN3ZNQTJtdUxq?=
 =?utf-8?B?bytpUExjV2dVMHY5UmMyeEsvbEtKa0pka2VSck9yTUxVY1h6QVJ2a0g2Yk9k?=
 =?utf-8?B?azBLVWpwUG51TWhMVVd2aTBkV2VMekdidjB4NXJJYWc3QktIQ09Za09FQVEz?=
 =?utf-8?B?czkxN3hRR3hqNC9JMmJEdFB6eFdQUmhhRVpFejVvc3pQNlBidGM1b25wbVhI?=
 =?utf-8?B?bTFJVFZqMk9EaEpmeTIwZWNZZHJuWlRIWkZOZnA0eHBrOFBrTFhrb2pnYWk2?=
 =?utf-8?B?YVFVLzdnbUVxNzI4THpzZDFXMXpHelNuMUZZUFNqQlE4WlRnb0VuNC9XSUY1?=
 =?utf-8?B?ZG81R3ErOERGRENJT2YzaHlCbGQwK2RESis5dG0rM2dyS3NhdnEvMzBvVEhR?=
 =?utf-8?B?emZub1Vvb29PbnljbHZqbkZ1N3V1allKWGRBNVlXeTRJZ1RYNTdtNngvVzlS?=
 =?utf-8?Q?yn1W0+x1w6bANMeA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a140c7-fc07-41c8-e8b2-08da32651e39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:11:50.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mPHKpHmwILTihSc6ekkJZYOHOHFuS92JFnVAaFz728/+yQpozsZV/NOKkFZ0yXuM4e/qM7fKZqlgXakHmZJ+vkts12oHwispQ58xuGIdhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3094
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 037102a4d0b5..51d918c66a26 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3185,14 +3185,14 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
>   	return modes;
>   }
>   
> -static int
> -drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
> -			const struct detailed_timing *timing)
> +static int drm_cvt_modes_for_range(struct drm_connector *connector,
> +				   const struct drm_edid *drm_edid,
> +				   const struct detailed_timing *timing)
>   {
>   	int i, modes = 0;
>   	struct drm_display_mode *newmode;
>   	struct drm_device *dev = connector->dev;
> -	bool rb = drm_monitor_supports_rb(edid);
> +	bool rb = drm_monitor_supports_rb(drm_edid->edid);
>   
>   	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
>   		const struct minimode *m = &extra_modes[i];
> @@ -3202,7 +3202,7 @@ drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid
>   			return modes;
>   
>   		drm_mode_fixup_1366x768(newmode);
> -		if (!mode_in_range(newmode, edid, timing) ||
> +		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
>   		    !valid_inferred_mode(connector, newmode)) {
>   			drm_mode_destroy(dev, newmode);
>   			continue;
> @@ -3244,7 +3244,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   			break;
>   
>   		closure->modes += drm_cvt_modes_for_range(closure->connector,
> -							  closure->drm_edid->edid,
> +							  closure->drm_edid,
>   							  timing);
>   		break;
>   	case 0x01: /* just the ranges, no formula */
