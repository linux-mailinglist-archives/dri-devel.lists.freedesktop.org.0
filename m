Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88C72E745
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEAA10E3AC;
	Tue, 13 Jun 2023 15:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D275810E021;
 Tue, 13 Jun 2023 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686670469; x=1718206469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ifU6AkRsnfdWJHeDAY6h3QiCO1sv09jqEv9xqM2vEIs=;
 b=hZKvLeifkN0CcKvx+909Ck8jpm7dN/PcYwCkMKdFCnDQl1G5TrwP2yHH
 YeOS/gPcGuJKm/lHDfw8iJPRim7xnBDZ7uIl1kjH1lP/C+jT+qD3h0T/G
 0ZoxAfaIuoKmeN9GbgSHHC/uXaA/gBMeV8Ck5Dh9kDWUWgVJZaiHBSmjp
 zKETZt+d4KRj+fV2QsbT2Lb0RJUTsX+HACnKz1o90Yyo09t3UJW4ND+xL
 S2N/6TOsZOVfNRxxYDMdB6o8t4kGnCe0highb372MSq3NI+DLxAxk4kkc
 wlp/yJUKwyMcaTZRYK4JlHwRqqkjGNKj+OdRqKvEp0j4sXCo5vf+F+Ep1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361739222"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="361739222"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 08:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="705849083"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="705849083"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 08:34:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 08:34:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 08:34:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 08:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq2z1TSg2VcxQo2Cu+/5CXbSbOIkQHIqLP8Za770nYDMYRyDEanOFozpAQER6UULHg6XW+vZdtaQ2wg/fSIhZOn012DYE6rC3A3ahD6GqDAl5jTd2ay0mMzVP6YjJVn4rqOfbcCGJejkDXvcUEs+sihTVjXZbomhOGnou0ymx96GjMYrtYjyr7bIYQnY054PH8Ga+dMKbcLfbRldaIk/vsOw3nlv/6ZNCiygCnC5NYJAr8s9UDQbASlzmwP4vsy6Kjfkhf+21k6JREHUq7eVFp5P3UTk4HhCQL1jMngHaIiJsIqIuLrNtmN+rGQJ4mRpdRHJrUNLfpRbvun1MVOuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFHujr568w3KrfmsmMFxvtc51l6BwRRE+DQalp+A5Bw=;
 b=Lsw6eByDIQafR6iYSLQe8BEwA2XormfnbWur8AyejM9EFGUIslIdsvCrpYyIiaQcrV/u/RRE0dTir6auFuc4vz0CgtLen+fzG6wwEA5ACnvH4nbBwD6OM8VF+HycMDDkel/lkgfjV3s2B+as5z/x3vDin9KUcrpq0opiq0VSaQzjOoo6V0uxlyFnFWT9pmusroAjlwJhdz3yLB+fdjRucgZUiOeZOugjXEe38dNw6vJJijt/PKxwbltCBCGfWmqCA+rMUJORb4nFA4m7h3C5GB6fpl0KJkb7FZwZaqeAvrSpDaHY6skuNEJbd8AHCK5c3YYMd3r3Hn448/m/JwfD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 15:34:24 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6477.028; Tue, 13 Jun 2023
 15:34:24 +0000
Message-ID: <e00481d9-c3f3-36fa-8d18-f5b284a14176@intel.com>
Date: Tue, 13 Jun 2023 08:34:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp/mtl: intel_pxp_init_hw needs
 runtime-pm inside pm-complete
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230601155917.2402415-1-alan.previn.teres.alexis@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230601155917.2402415-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: e59fd8e2-b594-4edb-74c4-08db6c23aa69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bQcVenTuXh2vTaWf5A6uWlEOjTo7XiOvaSqk1+O1KVxYFJGr1Cl8LvLYt5JfPSnJwmuHHInb8KOlz8A3Mk4+zZLsyVeQCnY5FU3ojZeRuv6JE18MoN3+aZjrxiaH2ROqOaoxIvo9SICnWwmr5XxyJunLoWeRkaDX8i2+imZAjqVhhGEk0EwP/i7RLSHpgpTGLbX3VA7vpfjJ7PKk8YfZWYh14FbTouO9FW3iDO5QX12YMBmeiMggCpXajVcwjwHzwEvOZK5Yzw2IHIVWX2fF2YBxZU07iVDw4JgAMj+ZR6Xy2wdMYHnCvXVqaZ78dlLqsA22DijFxQNCf77B1Yulov2fG2A+iVueCAso8GAciNEV2i4ql8ZddSrShkde7nmOTqzhPcC5xvGVLonMH/Bsf4NhV4qfGy8bMNWl1ijNCCW8iql1IF7qOwW9Cjye0LzNokC/ZKevTB9IihmPBeEM3e5eFbI4JOPlmU2LyON22LzdEtzm5pZX5dNHH3aTUfvMX7JkkBLYG2dVIlMfGpDL3CQj8M/6gCu/Dr106OV1D9IV+2h5PH8mX8ZxsHAisa8YmidA6HL7BrS6kkUlhv3zsAhNR/4psn9M9rfOxMAyRU9RQj00J5XHIdCNSAknvo3G53Ii8V60WYVjcS+EbSG8hQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(31696002)(86362001)(36756003)(66556008)(4326008)(478600001)(316002)(66946007)(66476007)(450100002)(6486002)(5660300002)(2906002)(8936002)(8676002)(2616005)(82960400001)(41300700001)(38100700002)(53546011)(6512007)(6506007)(186003)(83380400001)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDVncmdUWGtFSGo3YTg4Ym8xaDBZVWhwL2F1d3NuaEtreHJQSFZnUTB1SGhh?=
 =?utf-8?B?dWIrdGZabGJxR29RYmZub1ducVBrQmQrazFid0ZoNVo2RWZlc2FFdHd1elB6?=
 =?utf-8?B?V1FkbklteWxuYVVDNmgvYmMzbHlnMEorRVdCeXFmL2ttRXl2RnJ5bDhmek5j?=
 =?utf-8?B?VkJPR05iaFgzT3J0c09VRXRyZnlsM3JsTGxHRzJKYjFFQmhGaklLQWJiTkRt?=
 =?utf-8?B?NTFURmtZMC9OU3ZYZU9jTXk1ZHZURUZ3SWx3ZVd2MlpVUXEwUzgyUnlEZFVP?=
 =?utf-8?B?bzk3MjZRU0FuL0RtY3R4SjZnVE5JYWtjZUdtR3BCdVlmTDVaSlA3WkFTTGxX?=
 =?utf-8?B?TDlkYWV1dGkyVlVUVTA1VmhScUJDdUl5MGw5Ry9zNmYzVnBBTnpxK2o0cUtU?=
 =?utf-8?B?WFVBamdOMllrQzdBS1FneWo2MGxpbko5UWk5aDZDcG42R2NKQWF3K0NoZEFR?=
 =?utf-8?B?SzRRNWxMWUlVb1BaSEY3ZUkzMTVaVVVXSHZyekp2SlQ0SDlyMTljVW1zelBQ?=
 =?utf-8?B?NmxMU3NWbUMxM29ZdWgxNUsra1N4b3N3cXhubEZDV1owSTlBM2hZNGprRVFr?=
 =?utf-8?B?ZUZFb3IyY0dtVHg2TkNZZndjSHZjcFNXd2ZHREt6c202NG4wY1d6dUJzbUps?=
 =?utf-8?B?Y3dmUVdYNmVGaGxHVTR0QS96d0VTZTgwNkdsSjJOVzNVMjh5dkR6N2sxc1ZH?=
 =?utf-8?B?YkphWk1vbWFCQXdkQ2NOVzF1aEk0b1dWRGtpaGpoeUZVTktiUmk0TDdWbS9K?=
 =?utf-8?B?S1NlR2orbUtmR2dOM1RWbnV6VFpiekpuQjVxRGx3U09wNTNHY0tSWjVScVpY?=
 =?utf-8?B?R3R4Yzd3U25oeTZQM3hDdUlOamc5bWlQaGZINmtEcW9aWkU3RDBvaTVBeGlk?=
 =?utf-8?B?LzBOQlNLTUt3VG5oTUNuVDB4Mk1pUTYxcU5IaldIYmZaYnlHcHIyUHRSWjJY?=
 =?utf-8?B?cU5vVVBRQ1NhcUVyaGl4S1JJUTFPMWFOR0lES2NVNWVqb0lzODVrZ1FKd2du?=
 =?utf-8?B?cHlOeFBhWTBmQWI4Z3pVWS9OVlRzc2NzdHVza2kxbU1DL0JCZklJSDNZQjNM?=
 =?utf-8?B?dWNYOTNtekNYU1Y5V2MrWXk3SEtKWUpvTVFzRHcxajk2cWhlaUlrZ0I5Wmdz?=
 =?utf-8?B?ck1GbTRwcDlzTVdBZ2puUXZVN09JamxqVEVlN3pxeGl5QnN6S3dqdVYyMFRj?=
 =?utf-8?B?aU9UcE1aN3FSZjErRTRPckNCa2dPVnJzaDk5V3JXeFhNb1JwcmhYMWk1YXVu?=
 =?utf-8?B?K2p2Tkt4VkM1L0xhNHlmODIxL2dzYVJWb3RSdUxyTEZOZXFRTG5ZUjFTSmJj?=
 =?utf-8?B?MVp6WVdncVErL3N5OEFnZzJhK1JVTW15VmYrNUtFZ1ZFV3ppRzBtTTU2MkVr?=
 =?utf-8?B?UUxPeTdNQTRoZjFBcmRQZk84STdzb2kzMkhLL0E3SlZrM04rODNVNERSNE1a?=
 =?utf-8?B?TlpVb2l0UExKak5wM3BOYXNtbyt1UGlXQWltSzJ4eUVvVVJTeC9KMDNteVhV?=
 =?utf-8?B?S0FVeHoxSHpnRFYva1UzZENsUWFnTzM5Sml6K0M0UnFSTlM3dktZQjRNeTB3?=
 =?utf-8?B?QzZsWVlzZVJXNGpmL2FURm55MmFhK2hqS1oyM29ESnhFK09nVm4vNjB6T0xV?=
 =?utf-8?B?b3NhQW1idmx1QjBtcFZ2Y0ttTCtvVjFhakVJUXlxTTBOZUV4aWc1S1ZkSEFB?=
 =?utf-8?B?RHhzMnhkd2NNRzBaSUhQVUgxbEp1Z3pnbTZvUklOQ2JuSGQ5QktIT1ZTWjZv?=
 =?utf-8?B?N0dIVkpveHRJd0hRVEhaRytxeFBLenArMlc4aVRjdkRTcTZWWW1SaW1xT29Q?=
 =?utf-8?B?MlZ2VzdBbXV5UWI5bTUyUDA0NGQ2aDVKUU9uYjE4RWtWWERQTFRmRS8wdmRK?=
 =?utf-8?B?V0dIdDhSRlRLZjRkeDR6VHIxeGdyRHVuVy9PSk1LakRzcm05ampMSVNIY1FD?=
 =?utf-8?B?U05pUVNoQzlkc1ZoRHlicWFSVG8wd3I2YUpCdzZhN25EckJuRStFM3lKaTk4?=
 =?utf-8?B?TWN2MEgyOVJDY1BVcHFJa0JEaU10NHVNWmFxQjQwZWl4QXFTS2ZaYUMrRTA1?=
 =?utf-8?B?bDZMVnUyaUt4d1RuZDU0dXJQY2tzOEY3MXVka3czWUZaZnExT3hHYnNxbEVQ?=
 =?utf-8?B?QTJNdU96WWxBVk9rMEVDaUFsQ05Db1NkenNnNlhjQlVvMERheW50d0lGRDBU?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e59fd8e2-b594-4edb-74c4-08db6c23aa69
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 15:34:24.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdynfcFVOokU6IjjXJgOzt/eoGqNi54cflmNi3GkXF3omOLouya7aphXlxkvyHt9LHJQO1XfQTprGhaVEuQuQm135qRQiWwhd+fGJfwlAew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/1/2023 8:59 AM, Alan Previn wrote:
> In the case of failed suspend flow or cases where the kernel does not go
> into full suspend but goes from suspend_prepare back to resume_complete,
> we get called for a pm_complete but without runtime_pm guaranteed.
>
> Thus, ensure we take the runtime_pm when calling intel_pxp_init_hw
> from within intel_pxp_resume_complete.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 1a04067f61fc..1d184dcd63c7 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -36,6 +36,8 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
>   
>   void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   {
> +	intel_wakeref_t wakeref;
> +
>   	if (!intel_pxp_is_enabled(pxp))
>   		return;
>   
> @@ -48,7 +50,8 @@ void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   	if (!HAS_ENGINE(pxp->ctrl_gt, GSC0) && !pxp->pxp_component)
>   		return;
>   
> -	intel_pxp_init_hw(pxp);
> +	with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref)
> +		intel_pxp_init_hw(pxp);
>   }
>   
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
>
> base-commit: a66da4c33d8ede541aea9ba6d0d73b556a072d54
