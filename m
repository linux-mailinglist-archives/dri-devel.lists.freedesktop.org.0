Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC575AD0EB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822EF10E2F2;
	Mon,  5 Sep 2022 11:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AECB10E2F2;
 Mon,  5 Sep 2022 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662375802; x=1693911802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mr26dIYOa8DLCPuputEjP5yHAh5jpVT1A2Er1RCXYUs=;
 b=Cv6i17U2rAzDIgFnOm0jwBxDZkBpGY2wFb8+EwBdW404gKp2sk3gf09Q
 oPU+hReUqf93tWH7SyAg8kPKlC9FGe+69ubrQQzwCNop05GZedRRd/3Yw
 ulC2haVEI7MgehnZEl+JLFBXOF+CJ3meOe2AgP6yKocLq9xWlXzu3Vl81
 e4OgkoD52nx8PVXz+2baXjUTiUPCnzw4oSQPrB4FI/BDRyk/vtZLYqlsk
 Cw33QO8SE4Xr2vkSOxNERy93TOq3NNOUDQidQYH2yX3a+D+HKcHGc/TdM
 +5lQhVvJWgcliTBqT/dtQB9VZM8ARQ1vBsJuLfGZlyC/C92J67ZOqgmVT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="358081034"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="358081034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 04:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="755999535"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2022 04:03:20 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 04:03:20 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 04:03:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 5 Sep 2022 04:03:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 5 Sep 2022 04:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T95EMUgqBoCO1ranzRr11k3vE2MQ9aV1Ue/mAnAh9piovnSdwS+Zz6kC5CsZ+Tb8n0OyLvq8LHwvS3HF7bx5HU6jLelq13EiJHrJTG4zTb4o1DI7Umj0/SJBpw3R+R/KtnABRDWVGJ02oOZkpCH6ZYiyIAr9AG4LUHplEocm4HSjQX7sr+mZEepnfb7BSSp8kPa2pd8A4imDw9SXUkxqArLc3lk9XD2pehZk0HqarO3pY5MH3eGX/EZlbcNQNXipwD2XCEARoxf8389YOWnNKXsCqlJbheU1h8Eb9JbMdU+5sOweDGGAxgmppcf3mwVvXYzKAk0Xwrl1Bv9hXhN/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR0KhCesDR9ZdhXvnc4Jx32pVTn0CThryjOivE7DdVA=;
 b=KAN3e7bMwPEm8AcYwoDTcPDSHgSUh2v8oSc8R4OD9tLnEGvye25FqkOZMV3hDbm8iNK6Z41FTNIKKl6bCbHascC5I3Dzx+BP3G42HNkMLFA1j04aoFwqU4OkrMqbvsiq2vvxyBVuwnynQu8JSg1dEV055kkMXk93JLtucpW8+ztwRki5JonJ62I7gWCOaOnmT/guMeB6DKb9OT8iQYQ5bTU9uc045U8BR9NKcAIdEExSJrB5QvLvHcqVV5JmkZKRWZET1WDemc2TPdmAsJbD2YYCOxUnjBynLP1kmyyP1/OJ7K8hfw9bAWOyhymbWlQazPRj4sZYbrcPNtFKr4ZBRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by DM8PR11MB5749.namprd11.prod.outlook.com (2603:10b6:8:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 11:03:17 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::50bb:664e:981:3cdd]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::50bb:664e:981:3cdd%7]) with mapi id 15.20.5588.010; Mon, 5 Sep 2022
 11:03:17 +0000
Message-ID: <51aff7f0-4e00-7ced-b1df-11962ade4276@intel.com>
Date: Mon, 5 Sep 2022 13:03:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220905105329.41455-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20220905105329.41455-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0053.eurprd07.prod.outlook.com
 (2603:10a6:203:2::15) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f302fb0-22f4-42a8-483e-08da8f2e3c6d
X-MS-TrafficTypeDiagnostic: DM8PR11MB5749:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5AZlfQ9iNS+bRDSzbzmNazNVvwC6epqhfTBYRMDhBpN+cCvuy7U+3ksBtnmCBOLZ7oTG4mpvYj4lciz7tyjCvHb+cCOrDsgHs3QWcv9Vzd+3iBHidRwbli/mJ9OaqD+ZYncdpNJdmBXELtRNztoaNJWSK2e+7o1zkN3tTnd78e/8Ng646XP4mJ7y1QacGoNZ2oNn4d9qkUV9t5uiMja3RqSMBXAGGqGXcbA52Q6JtI8XkUWCXLDYEFVodJRKGaQpZqUuZtcdcJh2ra6LRLVBjFIbvduPGMRdqqxCzH9HekKDJ6eeuGk6+racCv/3v1QJur5gJj+yft0zaYo26xnXOfAkA7SEQY/yNvgXOsdCiYPZC4JbPHkBI4WzX5RPwpiTHtas3/T0Ki6HSust2wnul0XRwruXyGP5DISqfMm+zQGpwZracqnCMA7aBj+GIhIppmOz1p/4+gVxs5w+8H7KFFfMUYU8oVLMapV8RAm61YZDQkIO6bcJX3sInOcu3UEKH9oOkPZTn/ABWhp+mPHN3Zb20imuDu/LKLQGH9MjGw2GOYW3VyW/rw0OPX/VKPj+yMFmIKp87Z1MRCRvc/VxKW0+zMpZraTKl1cNO4ZYXq4WETKBltfxSA5Hj9z1QeL0j2XV/m1CxL8vRZhzKiplyLqS0691xBQmpvHWO6TQjHoR2eJSpR+7uwb30SWejuDCs07exKFrx6vHCeb2gaASLDQKoQlPzFVsW3GIpV8CyMt+gcuDAUJn/LQbXnWRYLy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(136003)(396003)(346002)(376002)(6512007)(26005)(53546011)(83380400001)(316002)(6506007)(82960400001)(36756003)(31696002)(38100700002)(2906002)(31686004)(966005)(66946007)(86362001)(66556008)(66476007)(8936002)(4326008)(450100002)(8676002)(478600001)(6486002)(186003)(2616005)(5660300002)(6666004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9Jck9uSWZ2YW50NTFoMklhS1V5cUNsdDhxV25sU3JUZ1JUNGQ1eU5wdnBi?=
 =?utf-8?B?TFJsS0pPNkwxSXZWQ24vODF3R2RFS2RMaFVhVzV6aHZCenpReEZFcy8xdmVJ?=
 =?utf-8?B?WWo3cFFkOG83c3NLMThZQnNPdnpkQ1pkUE5lWWRDeFpBMnRpamJzZDNISVpZ?=
 =?utf-8?B?RjhCSHczYVYvZHN1OHgwM2wvL2NmTDRoazNxUGRpamV6YjB5NVl2SHcxeHMr?=
 =?utf-8?B?V1l0R1dwbWVYWkJLaGpYVHBCcVNFS29LRGpHQlpZUGdmR1dIODc2Wld3ZzBR?=
 =?utf-8?B?SUMzY2ExRFE2VzNDMnhpYUxvZlF2ak52MWtCQUVOMUg2a2VTdFhSU3BmKzlI?=
 =?utf-8?B?enlqQzFxL1J0ZUhlM0I0azZXcEEvbUEyTnRsejJyeDlFcGlGd25LZHdaeW54?=
 =?utf-8?B?d1JYTndHb3l6SjN0NTFiaFMySS9BODdpQ0RteVIwcnJMSjh1bUFvWUFjbmtX?=
 =?utf-8?B?bVRlVFFNSWJENjZGYlJYekpUdDViVHkySmtuSUoxNjBuenBnK3BXMFZNOGtK?=
 =?utf-8?B?Qml6MG4vR3RIVE5MTmRBYUhiR0MvZHpEbmtZcGxDVGUrV3FvQkQzMmtjcFln?=
 =?utf-8?B?amtMRjY4QUdObW9RNmJOMTBVRkJKUDBhRDFCNjNEaTk5NTJIZmlvT2N3VXF0?=
 =?utf-8?B?eitLZXJCWVowdThkRGY0azZ0bkhKdGdPZStBK21kNUV1V3VtUzBYQkFVTmcw?=
 =?utf-8?B?NXBBODhpRGpSak4yNEM0NVAwaytkVDBOZEpGYzdwWmE3V1BGMjFJaTBHdzFt?=
 =?utf-8?B?MVpVenZ2c2w5QnVjdEh0VnhBTEdJc1RiWW0yazJOTFdBV2gwK0Vvd0JEcjAv?=
 =?utf-8?B?Rk9KaDBVWVNwRnRuN2xVb0J1QkFmSHY5RnBUSUw1blRCUjM3UDlaMlNwU0ZS?=
 =?utf-8?B?RURVbUNxa24xNHQrVDFOeUtWTzA0VDF6aXFSWTBwVTdvWkRxdUNjT3JKVEg0?=
 =?utf-8?B?VU5BcWNLS3RUOGF5UVFjdUhBOUJwMnZZNHA5TkFVZi85SkxpOVAvUmsrY1p4?=
 =?utf-8?B?Q0RLZDRCQ3ozSTYreFpsRHpqU3lsZzNzWkdEUlJhTVkrYUU5NFJFYm1yR1ln?=
 =?utf-8?B?M3NNQUszbUNYaGpicnhTNWptbnU0OW15MTNSZk9GUStKRWMrUnd0eUx3Y1RN?=
 =?utf-8?B?MWJUZnpKdTU0bldGdWJPWTcydkVuZ3JqQkNCemlkVDNZUjE1VGtlUXJ3WEVV?=
 =?utf-8?B?S1NQNGR6aFMrSVExTU5FcWFiTXA2Y1FNTXdpTmkzcytrNWd3OWR6UjdzbFA2?=
 =?utf-8?B?S1lqTDFOVk1nU0VQQ1dmVCtwUDlzRlU1TjA3YTFHTTNkNWg1YVI1aElzWWxO?=
 =?utf-8?B?YnIxdko4VkwxalhyNUFVbzdsZmVlYjZVSHZETCtZN1V1UFlCQ2xtUDYrYmJw?=
 =?utf-8?B?cmhlYlN3MlZKVFRLZFFxNjQ2MkNlNS9ManhEeE41Sk9qN05WSDZkSGUzMlJ6?=
 =?utf-8?B?TVA5eTVhV1dsWXA3MGNVYlMvVGM2YkNndGppMGZuaERwTHlhQVFzOU1YMW0x?=
 =?utf-8?B?b2lTamtLUHBtaTRyc0Y0NVBqYkZlOHN6TkJqSVVzdU56MFNxRG5JVGNpblNu?=
 =?utf-8?B?ZkNXY0N0eFd1ZkMxWHdPRDc3SEcxdUR1M0hNNHJiWXRCS3dLT21nTGFUemlC?=
 =?utf-8?B?ZVFxbGRJcGd1d0F0T2NPYjZUelFobUg2K2NtQ3V4OTE2WENmTUg5RkJZaExr?=
 =?utf-8?B?WkF1M2loVzZuZzE1aDQ1a1A1cWRuQVNvQnpxdWZqUGhVK09qcjBqM3JKbEo3?=
 =?utf-8?B?b0hBSjdRSytRbmZjVEU1djVyWjlJMEZmNlg0a1ZhYkc5MkkyVGZIRTVqZ1N0?=
 =?utf-8?B?MmcrNzF1WDFtQkJuRStRUDBMWERMRm5QT0lzS0htSTVuZUVGVmJTcU1jRTNl?=
 =?utf-8?B?Uy9iR2Z1QStnNFpraTdWdjlWcWlCNFhPWFpuOThmQ0Nhb0pYb0hpVllHeG9a?=
 =?utf-8?B?ZVR3dGlWYmdUc0JJS3ZGTHRJdDFSZXlCR2gyNW52MGdFK00rWUljMit3cXRv?=
 =?utf-8?B?cmVoVDBDT1RGdk5ndi9XOFJXVGRHMTBsVFlDdllrdTRvckxKbVZNVm1TY1Fk?=
 =?utf-8?B?V2FaTXJFN2lKSXhLM2hTK01tRzhaL0xXZGg1dXZOdWIwaGlrZmUzdlByYStr?=
 =?utf-8?Q?Mq6V2pkQ1sAlNJskFFetI5oL3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f302fb0-22f4-42a8-483e-08da8f2e3c6d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 11:03:17.3908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1JuOSA2LZh8Pfbw/fCa47fg6eduFrXhS8stu21LBPWDS32cECOlSkNIIpg1ucm3C/KaWwWtECLYK6z/GfDoaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5749
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

LGTM Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 9/5/2022 12:53 PM, Matthew Auld wrote:
> Just move the HAS_FLAT_CCS() check into needs_ccs_pages. This also then
> fixes i915_ttm_memcpy_allowed() which was incorrectly reporting true on
> DG1, even though it doesn't have small-BAR or flat-CCS.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6605
> Fixes: efeb3caf4341 ("drm/i915/ttm: disallow CPU fallback mode for ccs pages")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 3 +++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 389e9f157ca5..85482a04d158 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -723,6 +723,9 @@ bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
>   	bool lmem_placement = false;
>   	int i;
>   
> +	if (!HAS_FLAT_CCS(to_i915(obj->base.dev)))
> +		return false;
> +
>   	for (i = 0; i < obj->mm.n_placements; i++) {
>   		/* Compression is not allowed for the objects with smem placement */
>   		if (obj->mm.placements[i]->type == INTEL_MEMORY_SYSTEM)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index bc9c432edffe..f64a3deb12fc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -297,7 +297,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   		i915_tt->is_shmem = true;
>   	}
>   
> -	if (HAS_FLAT_CCS(i915) && i915_gem_object_needs_ccs_pages(obj))
> +	if (i915_gem_object_needs_ccs_pages(obj))
>   		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
>   						      NUM_BYTES_PER_CCS_BYTE),
>   					 PAGE_SIZE);
