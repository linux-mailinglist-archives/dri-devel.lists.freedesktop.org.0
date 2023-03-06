Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A16AC7C3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EDD10E2ED;
	Mon,  6 Mar 2023 16:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453D910E2DB;
 Mon,  6 Mar 2023 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678119790; x=1709655790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=55TGNBMZoYSwNdyQ5bXiyKfS1b6ene4rFhaa13XUdpE=;
 b=Y4/B8uGminujFPE4/FPTKJ+V8CRdlT71c2vrDYsYHUNiW+Q14foS8UpM
 VQThvWiy7PCd+0LJYEsrGgQJs6elDnIGwTCVyST4ckpx/chZrY3Zoe7Id
 BCfbdXrI7PkynfeAll6ZOF0ozfuULi6sQJjOMhDd5oYTEREq3gmDrVPOy
 fGFTgDcmuiLW8RqQS+aHThmlWbuZaGAX4Oc6Hbwk+wNkwAhzepsiRKIdJ
 8L86Dic4VLoA/DyCldpY2a+CmHvLXu6RIq0TKo15WMuiIdxZy1blUd8cx
 Nw2vNe7Om0QG8G7UAxaQqntnfe4/d+HxgAzlf1TggmpdejdkEJM9tWOBw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337919261"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="337919261"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800047816"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="800047816"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 08:22:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 08:22:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 08:22:25 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 08:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLH1QwjZjjzzZNz0M8LxBHo6bSoZb26g43pteAWWF19HeojS/NKgMt0Tn1L+EPKVGle/c5crJIlVATIPp0uADUE2qk7iUhP7xo9B8ZReNFJfU54DKxnZAonujvKsC3a7lgrYPw0JaDHeGc71hazFZBZiGFON6apTNrXMhugv7I7PZ7vje5H6Wilr/PFo6YPC0ncelixrG1J90u9qNsholztCDqlybLrCoGH/YCw9sgijK4f24dNwscX8mVV87/VMCynnVYVIaW/al1pxsqS4bbUpcZFj421W8uAfeMhslKsb49+H3eUS4SW7l4Bldbcjj837s5Q2hXp6joVL5Vo65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRYUBMvQTwFf+75N5yRNm4xqX6NfkjFrHnQmwZWX0tY=;
 b=ED8B8xjd1nvyGia8rtW79+tIIqLUY0aoSa00jSl4Bh+K6zw/q+85CSEbH8H4K6iUejyg0SQZZztBRQheq03SwNJ2UJdzQ5j5PZRucU35cORmDiUted3hUt4eGlu4UqcHdQk8ilesjz+VFp8o3JBrEgXxwCgxasFaog4/P2HEblgdn0bB2eteoxA4IaYr4AjVyZXwYxTFVBUWCDNJ6ZwYxTEtkQ2Xs9stUwgRoWlCMFC0dCzyroe0jUdD0zbLmxVajn9MWF4Q1E9zegjsxxAGDhZ1jsrgA3FiYqzbwdbsjKTaF5ZmpmSfc4EN1dNM86qw+Z9216kVaA5y0/F7K6Wf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 16:22:23 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa%7]) with mapi id 15.20.6156.025; Mon, 6 Mar 2023
 16:22:23 +0000
Message-ID: <c7e9521a-cf7b-fd7d-630b-a6bac4784b2d@intel.com>
Date: Mon, 6 Mar 2023 17:22:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Set I915_BO_ALLOC_USER for
 framebuffer
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <ZAX20lg5ieMrQIr/@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <ZAX20lg5ieMrQIr/@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: c471eb92-42c8-4ed1-74a0-08db1e5ef778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMR6Wsi4gDXpyDq4mGYgLzvrkqtW0U+T3laCghI6lFBWeBt9ovKwwhV2V+3I793kPsI+81viVETPjbW3H6eTdgBNgh64tquuFX7JQ2LXD1HG0beoqzH7iPHexA313izeSSbTh/w1oJ5W90tF6hZ4Gu/qmEedl8FcJU8bGNcKRz/bVGQkS6Jgv8klCfKhAyAxw9MxKwfAQdxaiAHe3qSG1zkIQ8Gu53ZzTSATiamjBMQqwakK3U/kjtLDkDQJu6W0/lbc4giNzhNZGnW+0H+jFkWJDjdKP3SscDD8zk46s5PI7moVwHgmc85MALQRfpGMw4zgb0a+GMdgbrzwhRVyLRWQxgQ7ieO2Ex8wU1eSokAuaHGpPLpjqS172Zqu15Dn4LT+5RlZYQoMY4R3LQknxp9nBDWAFbdg/GeEtckhtdVYpmOAIQGBopSwNQzaLDpnVrV+sUdSQyNWPOtkhblZf0dRA25ZDeSS9P1SauvG0DH0lFx4Dr/3dFYAygHOfDMx0qMHY8/2AuqU5HBOlg31VJfAux9NewGTjC2hnGYn1MaYfOSwEPP5HdNUxEwXR/MAt0e2XMv5z3jWbW8UJrpXiBKbtdQyZdhI7hSEXXg7wAPRL/uPCVCbGMK8+k/KL/smxJJ2YzcaU0DDph31B2C2v8KVW9SQ1slrN4zWF8kRW0nVPUQWZBceyDmvNHWPdwNd9onz5EAo/eLOb49L6tvmd0g+7xD84FwIHqZpvOai+Kk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(31686004)(5660300002)(8936002)(66946007)(66556008)(66476007)(2906002)(8676002)(4326008)(6916009)(316002)(478600001)(36756003)(6666004)(6506007)(6512007)(6486002)(53546011)(26005)(2616005)(41300700001)(31696002)(82960400001)(86362001)(83380400001)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTg0b3FOcDQzV2FKTndhU3IrK1dJTVVZM3g2NlIwZEdjV2Y5a1RweS9RWTN3?=
 =?utf-8?B?bzRNcFgva1dpeXhiL1hCMklyMEEwRGpVZnMrL0NHaXlyeDFGREtzMFN2MEdY?=
 =?utf-8?B?STRSOGthQ21pSDBVeEo0NmpSK0had2JrZlZvamgzMC9EZC96dFRYeTNVVC9D?=
 =?utf-8?B?MUlxRE9CQjRSWnM2U1lJMXFaZ05hbDd5aXg2TjUrOEs4TWZock9aeGVjNUJY?=
 =?utf-8?B?ZXdFbGlJMWx0OEJ3cnBUZFRpTUJWc0NLTkd0bUJyZWFWYXphSWFVblk5Tkg1?=
 =?utf-8?B?YzBGWkZsVDBLaHI2K1BXUEFDT2RTWE92aWZVYm5hTjRHclY2WTVaS01iWHBj?=
 =?utf-8?B?QjlKMDNrbWZmaFJkWFJjK2Q2bCtockQ0dmFQQWxtUFBiQWRuQmJDOGV5c3Bq?=
 =?utf-8?B?MFM5cjBteXBoRzZxTnJheXoxcEg4K0Y1dlVSS1ZQeWFWZTJ1Z0FGKytLSnRj?=
 =?utf-8?B?bHBkdWJ6TS9GTUlJOGZ2eGF5dy9zOVRpL1pQaTBLeHQ4bThmTjZMWjZXTGFu?=
 =?utf-8?B?aXlHZHpvdEFTckg2cloyWXg0NUJUTlZobGtGaXRyTnlXaHhiS2N1NnFqRFlZ?=
 =?utf-8?B?ZXF3UlZxN2twQzd6YUtZWGQrdHpIUGdQdzFUdEZnUHBpdGZPRFNidStEVDhB?=
 =?utf-8?B?ZWg0M3pkdURmeHM5eDVEVTdjbnZESmxFeDJOUzNGclo0Qk54OHgwYXdFZEJU?=
 =?utf-8?B?TW1pdVhmY0hBVVFWVmRta0MxOVJKVFpUd1JPeGpPZ09JbjFCOXM4eVVBcUdj?=
 =?utf-8?B?aWlUQTErYjRLUFBUQ0pjU2hJekZPaGV1cHQ0djFjZDk1ckhiaG9VLzhJK3RE?=
 =?utf-8?B?R2JDdCtOa0llSmVqUlRtRS9PWnJKNUZ0YVlIZ1V6T0xNSzM5Sm5GdW9KOC8x?=
 =?utf-8?B?TXZ2eG4xeVVHVyt3UEhxbXJtNkFwMmllTzJ2SE5DanBDN2tvb1NHR0ovalV2?=
 =?utf-8?B?WHVvWklRcjZReGMydHI4Tk5UekgweUY5ZXlHc2FjSGlJT1BTZllpWFRKYnU2?=
 =?utf-8?B?U2tlcEFlZmxPNWg2OHRJdnNCejhvQVJZVXRqQWRsaHl2M2Nyb3RrZGtMSFo0?=
 =?utf-8?B?RVVVaWF6blJGK3lLK2JINkNaQXpUQmlaZjhBNWJ6TC9RSVlXU2FVcHhjV2h2?=
 =?utf-8?B?QW1Xck40NEdoVzdwUjd3Zk5Jd0gzM0hIR2pRb01seWhseGtmb1FpaHRKVmxI?=
 =?utf-8?B?cVFTVHNDRW1wdVUwT0lCOHNRS3NId0JFUGxySHVHVEx3eXF1WXBibWlYVEhk?=
 =?utf-8?B?bW0xQ2c2WUVxSkk3ZjBRdDlRdzBqeUlBQkQ3QmJwaEZkZ2pQYXJIYXRjZU9h?=
 =?utf-8?B?OCtmQzZQYlBZRUNkbVFUQWxvc2JPVUJKNkl6czZ3dGxKczJPeU9RNDBsQ3Fm?=
 =?utf-8?B?STJxZVFNazJ5aXI4d2RLaUJ2MS9Xa0hDVEdGN1h1Kzc5a2F6SFp0VGhwczFP?=
 =?utf-8?B?RG4vanZ1a0RybHpyNldqbFJlek9DNFhCQ1c5d2dCL09oSkI5Sy9OTlNaSUNj?=
 =?utf-8?B?YzVMMFl3RkhkT0tlNVhmR1FRNC80SGtoT1MydTB6b29XMjh3OTllaHZQMmla?=
 =?utf-8?B?YktOanRBL3BCZmxmNmFwNkRsbVZuaUpMS1k2ZHA2V1FDNHcxNWVFTkoyWlo2?=
 =?utf-8?B?VnhTbXJVdU9qQkJHRDVIS3dFeDVkTWdwNCtyeE5iM29DRmFZNHJjRE8yME5l?=
 =?utf-8?B?ZnZneVUzZUxsY1cvZG9JaExrdVJTbVVCQi90TE8wSlZEcXUvSmxLR2JiaVFK?=
 =?utf-8?B?N3FJYW5HSk1BRWpjc3FJWGs3VWpJNTJmVU5LUWdMWCtxblpEWnd1bjJqbk1n?=
 =?utf-8?B?amtRM2JsdUt1VnNIdVdCekI5VVBsaXdXMFl5MmRQa01ObGZSVmNoWUYvZUtH?=
 =?utf-8?B?MEJrNlJ6MExIV1FXdDgxMGxUZVUyZ1lVU1pvckJnWWE1a0JsZjlSclZFTWJO?=
 =?utf-8?B?QWI5MTJGUi8vNjkrRkhMbC8yUEdXTFB5OUdQUDJ2S3Y1enkvY2NxMEZjQ2cx?=
 =?utf-8?B?THM4WFFIMmIzRHNWTjR2dUh5OE1JOE04Z1V1NDRFVHlncUk4SlkwaFBXSmFm?=
 =?utf-8?B?RzFjalJPa3VEYXk4dlkxMGYyUHZ2TEYyS0tUNHhYdlQwSXVHdzBWRXpyZk04?=
 =?utf-8?Q?T/wveTSLIAC5UcZQpVKJhGSI6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c471eb92-42c8-4ed1-74a0-08db1e5ef778
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 16:22:23.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfWJeo/fG2UZktPwyCzTWzTbPXbrBtlHKY+DBfaJh8TjpH//K3GPIo6Ds1uiqK4N5zO/fYcF5BN7ELF9oPLHLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/6/2023 3:21 PM, Ville Syrjälä wrote:
> On Mon, Mar 06, 2023 at 11:28:48AM +0100, Nirmoy Das wrote:
>> Framebuffer is exposed to userspace so set I915_BO_ALLOC_USER
>> flag for it. This also make sure that ttm allocates offset
>> for lmem objects.
> I have no idea what that means.

Sorry for poor explanation.

Without I915_BO_ALLOC_USER, ttm will assume the obj as kernel buffer and 
will not allocate fake offset which I needed for fb_mmap callback to work.

Regards,
Nirmoy

>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dpt.c           | 4 +++-
>>   drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
>>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
>>   3 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
>> index ad1a37b515fb..2e6238881860 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -254,7 +254,9 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>   
>>   	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
>>   
>> -	dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
>> +	dpt_obj = i915_gem_object_create_lmem(i915, size,
>> +					      I915_BO_ALLOC_CONTIGUOUS |
>> +					      I915_BO_ALLOC_USER);
>>   	if (IS_ERR(dpt_obj) && i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>>   		dpt_obj = i915_gem_object_create_stolen(i915, size);
>>   	if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index 3659350061a7..98ae3a3a986a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>>   	obj = ERR_PTR(-ENODEV);
>>   	if (HAS_LMEM(dev_priv)) {
>>   		obj = i915_gem_object_create_lmem(dev_priv, size,
>> -						  I915_BO_ALLOC_CONTIGUOUS);
>> +						  I915_BO_ALLOC_CONTIGUOUS |
>> +						  I915_BO_ALLOC_USER);
>>   	} else {
>>   		/*
>>   		 * If the FB is too big, just don't use it since fbdev is not very
>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>> index bb6ea7de5c61..4a3680f6a3f5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>> @@ -110,7 +110,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>>   	    size * 2 > i915->dsm.usable_size)
>>   		return NULL;
>>   
>> -	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
>> +	obj = i915_gem_object_create_region_at(mem, phys_base, size,
>> +					       I915_BO_ALLOC_USER);
>>   	if (IS_ERR(obj))
>>   		return NULL;
>>   
>> -- 
>> 2.39.0
