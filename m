Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4BA5F1650
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 00:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A8610E082;
	Fri, 30 Sep 2022 22:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5010E082;
 Fri, 30 Sep 2022 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664578157; x=1696114157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q1k0otT8izQ6OC3T+88WbneH48qFOEs8OLMDP3eh0gY=;
 b=nXV+o3+yf8r/2ChZt3IBmOCpwhjJathSx/ZIAIFP9qh5O+bKxdUJuB+J
 1HAytIvim5PZTAgQyDeQLHoL+CT+F1DFxZ8joniCRPLITPe4mwy45Orem
 Y/msyf5QzmafI6UvT4TmFd0tg0v7ImnvSvwqqb4Bgerbn15vOrsAkNhoi
 mmc2LXgZYlu6ovzsk/xJG4Dl/HIxWUJU1fKAtcSGz54GiokONkrcWmbvm
 GewskxgWjodhOZUfT7VIMKqPppvFRW3Ayc605M+yYSp7SxryDpleJaO/m
 l/UpnBwDmv+E3Xr6sI58VOYWzBTK+ZMBCnCvZ8Q0AxXFBLY8DeL3ZLlmq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="301023907"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="301023907"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 15:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="574019506"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="574019506"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 30 Sep 2022 15:49:16 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 15:49:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 15:49:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 15:49:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 15:49:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6PuPCiicy/YgHHU0qc5PBrVq0qbHxjrRMWIUZn+wZVIueD1wSfjPzOa3JSHmM+5V4UBGvkI7D1exNIACdXdjepZ6wV5j2yhjWWbaie8S/FPnXQ+wjJaUnQB4CHuvr87oz+kXOwj9eUPQc6feCqVB4r6a+Z7MCrcrS8CBtWZCM5mA/6rMqx4mpI7pANidgwIVkTSOxqwEZGUjKwrn2HMfva+5t5k2mqxNHo5QY/n3ieNFgUDt7ROtRPCj9tviwIBRGPC30HBsp96wZvhN5m72ETWpV2uHaRhFIGFAW2YWE9O5N28kgoIZ6O1p4WLqQ4ya4PcIiaEJkTZpVfsC4AEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4McVM9BlmqtpWn9BCsqEpfOPZNMtlJfCtwc8ejqeKlU=;
 b=MllGidxU56azO3C8QxLyj30YDbdaBSrB+KmUmQA3KremfmdD+se/3bPr035w6SmpdBCxJgK8B+Kr0ycGATwGgPehkDHeGS6ZsQUj/KZ+MKa6+GqCxg7uXSKFGk1lFP2DOCCIJZaI26CKXlMHD4TKaSMm4MdBUirUTLSJ/0X7N277VnRf/TpnhqPI7Wjfoz0glf9O98V1Y+VnIMa0mmO1CuugNFkAibhbzR4wYaGNhPn/DQ4oEPUl4KtMdN9phNYwWQeaq3KYHlIEydrUbck1gzY8ZoEwS/LZcEa8qG+/M7vR0iMGuUNC8eQDvrezKDu95w913TTh7AWxQRFaYN8h0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 22:49:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 22:49:13 +0000
Message-ID: <2430657b-8f4d-4260-71dd-505d85023fe1@intel.com>
Date: Fri, 30 Sep 2022 15:49:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/7] drm/i915/uc: fetch uc firmwares for each GT
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-3-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220922221117.458087-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b88752-f4f9-4935-cdb9-08daa335ff11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ANb/gPM8WLIk/aNevzAo51mc0y5QitkN7SdZaITK+3LJAjRsc/Up4JwL16T60/w5HsFXGiKWK7om7GcbynN7DECrUL/pyuS/3/d+kD+5KIKRWb7g+fhu0vRqDLnhY5urZkWGtWxSgHsWMqzv2Rg99LkOqoY1GeP6B8L2YYjLQK9VjYGkqfx8GQdBa8a+5lUo9Z3i4Env5uuvq9RfurMUd6hs42ELs5sXlL1+sgvHnlGyrGsZ20bfrSWVQ6gq1HfgICFGDcJxQ8ZSsnNXyDZEEH6Q37Pr8nCE+Xixh2dljYl2EwAeeGKRQtEB1EOJx8ZbDzn7OZDy2VNsywn8pg/eYV3AHCznusrl5c3YIy6aUv08f6xDsvY4D/1P5S/DP5NAxqWqa1ldO0DEaMeCS+/QvbuD0uN6nMsBKFbHx/zQ24odHDNKTNkQu+8tTwfUrao2DMF/Ue7uEFKXFG433jOR3HJtjOinhRfU6ICFi4Sxf6Yshi5JC/eQXE83o/7rNQglXxWZIQ2fXBoJ1jHJOksz9blSJ7AizLe4TSuO+Jso3eivzc/KwcmyPh3ao6wObw6zOFpDt8nOL426FhVWd9CvzTEdI1UM2QjoBmtKbTQT4bXVjkbnEvwnya9pc3WWGPKdgNKuUkY16++6vkw1AN1z/067CHHeDjuCChEQInplu8YUxJ57avB0re5+1b5HpYkAEQ4q/heZOWhr9/So4tINFIqxqMVAwlDuU5/Mn65F14ue52txUhqt2jZG8faoCmeLaWAdRRpahR4QljCTyeZt4V1xaXakDE5KKLrPurNSI6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199015)(66946007)(66556008)(66476007)(4326008)(8676002)(450100002)(86362001)(5660300002)(8936002)(31696002)(41300700001)(2616005)(186003)(82960400001)(6486002)(478600001)(36756003)(107886003)(6512007)(26005)(316002)(83380400001)(6506007)(53546011)(38100700002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZERnFwNHlsWTlreTdKb1J3aW5IdG9YWEQ4VWJ3SFRpUGdiYnUrdGZUejVH?=
 =?utf-8?B?WDdHL0lXbE9LZDk3L3dHMkZpc2VWUS9XSkRRRzNUZTRTUkR4U3hCeHowR3c2?=
 =?utf-8?B?ZEptRjZWZnI5S1g1SmM3bTc0Qm85UFE2dWdxWEduN3hiV0VzOThYME12ZnFM?=
 =?utf-8?B?aXI1TVA3aDJ0Z0tJMWd6MEFneVA3R3NmaGI5TWV3VUZRdFF5SWhIYXY4Vitk?=
 =?utf-8?B?RlNoQVFwY1F3OEtiTFc3enozZ0NwaXhsV2RnbjVDQ3Z4M09JVm5UcC9YWFUz?=
 =?utf-8?B?WC9lMDN2WjhuNElpZC9QZ1hXcitUdUdXRDZlZHROL3VRMXV1RHk3UXdmVXdJ?=
 =?utf-8?B?NlFQR29ETEFUMERmTitNYmRFSXBDWnI4cW05N1VWUnAva3BWeFZabTFIZGZv?=
 =?utf-8?B?QWJDTllaOUhXREpsK1ZNM0plR3FHbklwL1ltV3Q4OXBndjRYcFR2SWNmSE01?=
 =?utf-8?B?RzN3di9FMUdnMU13NmlJaHRrY0d4Wkd0akdzM2JPNXh0NHk2ak9oYTFHZkRj?=
 =?utf-8?B?cFJNUklnV3ZQOEUxYmlkQVVHV1MxeEJDUGRJWEJycUpKNXpsVjBxeVdLTVBu?=
 =?utf-8?B?aDF2bU5LSUdlWlNEOXpmT1lYOGdwTU9TeDFkeld5SjNDeFRKQlU5WFB1OWd3?=
 =?utf-8?B?clhuWStSMlNYck1nNXZHYytZd2lqT1dHZTIzSVhuMm14NUI3Rld1NU1hQ3ZH?=
 =?utf-8?B?b3ltaWcwcGZpMWZQMVZmYVFHUDg2UGZwYUR1MFR5OEhtclRvSmtaWG9Wamt1?=
 =?utf-8?B?eDdnOXhJWmcxSnJKT29LVUdnOFQ5S3U1TVBpVHdMY285TDh5L1JtYjY1L2hF?=
 =?utf-8?B?RVNDMWRKaSt3blZ2WDBFTmp0QnFmaE9wNTByYVZvR3F2NVJyWDRJTnF4RUVI?=
 =?utf-8?B?RVk1WS9jVlNrclNGYnhWcTd3UW4vZlFZaXYzQXpKd0lQQmZ3UWEvUVF1VVFq?=
 =?utf-8?B?TVBWMUtxejM5dUxObkNWS3JXVHBCSTVRcFZZbXg5bm5GZ0ZXa3F2NWNPMUpa?=
 =?utf-8?B?VE0zdTlBcXR4elZ0TnhLYVd3eFhhdWdmK0d4RnFYNVU4WUJMaVhIRngyc01T?=
 =?utf-8?B?SytYMVppcTNLSUczVXVKV2RjRTNXaTNIbE1tN2ZHeGw5QzRVYnFqckNxSjhZ?=
 =?utf-8?B?VDJlSzRDYW9oNHVOZGNYTVpXSTdOT3FWVkloVVZPdUozZnd5VHlDcnBkeC9S?=
 =?utf-8?B?NzlnUG0wc3g0dFdGWjNsVkhVU3ZlbG9xYk1scytnQWZac3ZMdVdrS2JJUVBm?=
 =?utf-8?B?WWgvTWFlQllEWE53RXg0T2h0NWh2ZEhpVTArczhkZWt0a2VFUHZGZ25uQUZl?=
 =?utf-8?B?ZWNkM1pYS1UzR0luK3N4QlQ5RG1XT3hiVzd6VDRHUXl2TW5TdzFnbE1FTE5B?=
 =?utf-8?B?RXFrOTlnUnhjSS9MekhBdThUN3E4WFNLbHprVk5FYUlVVmxBY2xEV2E5Vzg4?=
 =?utf-8?B?QWdxMTQ1QjM2Z3pSMHlRSU1scXNHcW1INEVZamhSeVlmUmIzZk1HRW1CbDE1?=
 =?utf-8?B?ZStRYitEeWl2Z0wvTTkzQUJIRmNhRE43MDdtc1o3YlUwVDlIKy9PNi9DTCti?=
 =?utf-8?B?VkF5NWJyUXRra3dDbzJpa3VMangzbWRYbVltc2lDWWNnS0lXbjMxV0FWb2hC?=
 =?utf-8?B?Q05jTVBnT2hHZXVqVkJubmdYOGRRN09YMFpNcmxsOW04VWp3MGdLa3RJNmYr?=
 =?utf-8?B?VEx3eG1iSnM0Q0dwcUw5THc2aFVkU2o5ZjI5QXVaMFphYlVpbk0rTit2V0FE?=
 =?utf-8?B?SE14LzFxNUh6UXdpdjRNaUpYeFB6RGIxZjRINXNGbElGZ2hzSGdhc2QvVk1x?=
 =?utf-8?B?c2tHOXZnUGVDd0dwVzJ2NVZhbTEwazVwaW9YMTM5Szg0NlUzeStRaFA3bkZN?=
 =?utf-8?B?TWxlU3MrTzV5SEhoRkZzYldhWUc3MHBUUWUzS1dYRDUzNWhiS2ZDNUlVR2Jl?=
 =?utf-8?B?YzRDN3hHNXlwK2RocGgxajM0UFk0ZS9PN3E3cGUzWFhTbU1Gb2NmQTFkS0xj?=
 =?utf-8?B?dkdTeGVybkJrZG1PUVFtNCtNN29neHBuek01Q0JsN1ZVUGVjTXUrbW93Q0Vt?=
 =?utf-8?B?Wm52ekcyRkw3cjdqcXJNOTNQNG16Q2pQWTVGYmNHS3FJbjJWWHJITTZvL3VB?=
 =?utf-8?B?VkNxbUVJOUdiZzVqa1hZeE5lVk1nMGovcjVVZWVPR0tWQkkrcGhpRGVSa1M5?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b88752-f4f9-4935-cdb9-08daa335ff11
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 22:49:13.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VIDUuopEiLzqHWWAmul4eLdZxK3rrXoPaSkE1RtzTycO8K1y7zBSmHfYq06KHVY5msAg7XKctbH+v3HC8iycP+gth3HNkcDOM3GMpLOmW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/2022 15:11, Daniele Ceraolo Spurio wrote:
> The FW binaries are independently loaded on each GT. On MTL, the memory
> is shared so we could potentially re-use a single allocation, but on
> discrete multi-gt platforms we are going to need independent copies,
> so it is easier to do the same on MTL as well, given that the amount
> of duplicated memory is relatively small (~500K).
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/i915_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 88df9a35e0fe..a5b192ac885c 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1140,7 +1140,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		return ret;
>   
> -	intel_uc_fetch_firmwares(&to_gt(dev_priv)->uc);
> +	for_each_gt(gt, dev_priv, i)
> +		intel_uc_fetch_firmwares(&gt->uc);
>   	intel_wopcm_init(&dev_priv->wopcm);
>   
>   	ret = i915_init_ggtt(dev_priv);

