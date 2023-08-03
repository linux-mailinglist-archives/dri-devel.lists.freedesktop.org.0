Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4376DFC6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 07:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273AD10E597;
	Thu,  3 Aug 2023 05:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D40289EB1;
 Thu,  3 Aug 2023 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691040628; x=1722576628;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SCfFFTbIxrtocw8Gg8gBRsetKuFQGPLy7IbGFafg5oM=;
 b=Fn6B9nrDlYFNu48stsWYe9VV6FeM6eEslkLSQLFbOmhhvWDZfuNBoXEP
 Odg47ytrFneTBA1JNx9KoPOlRBL7MRE5aWNoxLFzKu7/a14UpCU5reulF
 Tr2ThrNtBV3Ztid09qtnAIre9hyMd8W33l6eFX08wWYxMLpHKvL/l82RF
 FOPNu68nm8Rh6VRDVOyFXaDJK+grL3NGf6FII7QAYH4bqSsm1XQqcziGP
 7iktQjWxuHAtze9wus+WFaYkire5QsFE+dIJPpiNxs7YmHTpi44qdfK61
 cANmpCBDFfBgcPQz73Ji4O4aESMR4O8S5TifL0tIIBeEHcO1WKeXKtrB5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349370446"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="349370446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 22:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764475461"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="764475461"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 22:30:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 22:30:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 22:30:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 22:30:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 22:30:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk7ISn3a4huGfng+kpMjTYEB2RXFD1e8xGuGevQUTFBc9dXTSSj+kmqrZOF/Z8GVJgGY8RE/7jj9wTtyIL8O4e+3lN2vtMuprHJOmiISTZOx9FmKmOcPd32htrkRoMyuBTyMZ1AD5F1QbUjnp85iNAlv7nFdkpYPbezWnzp4opv1V7Mci3BOhQHBg8UXTU1owp6K4/GrFhBEU5qvXlAJ5QpHhbjjjLGCA9jKJEvYGRdT2FM+wNoDD3hWWNA1OOn3QTY/XLDSGOAswgdHXDcKJchMGPguaD6YmkEkYRZXQSaSOrBSUs3/izr30Q/fjjHSz86dIfIZKq3C3TLzTV8qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAhfandC6w2Wun5pZ5JRr/5Mpy3sXh+59ICxZhimkFw=;
 b=i0MEC4rCAiOfh6aXTE1ovmLyUgI0cec1q3erhDKJCFXf0q3+DsOpVKAEvRw3I3uArVzIEkuP4Vh9732BDL2oLFWsBnMKA3rVl9sdwN7L88sV9PNf7kcK5IGizE0Gi71HG21U4jWUr9JpyB86QCGK9i9w7kqRvhD/ws9VnOJD6s6OoFf3NIYcVQ8bOc92f3VRtxICdlOpgJeto5whEAfzSueFDZLPcf0ZqidM3/+HlFLi5kiGzBFsVmn7TcWNIhY54sla4vyGDUuE1qau0y9TmCK6k03+rpmvXM0sUhcnaVVfD9lBKuoymzsuLRczVbFCewCVgJcfUxnMU/KhtvMJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Thu, 3 Aug
 2023 05:30:24 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 05:30:24 +0000
Message-ID: <1e9f6ec7-afbb-1708-fbc1-8ce4c2ec511d@intel.com>
Date: Thu, 3 Aug 2023 11:00:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Add ability for tracking buffer
 objects per client
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230727101352.1899466-1-tvrtko.ursulin@linux.intel.com>
 <20230727101352.1899466-2-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230727101352.1899466-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::17) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA1PR11MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bcdbfb-3be9-4244-1ccd-08db93e2bc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdZc7P6uipkXDOdGLa0mbDP+AGEAcz0vdzEtMx+kyKW1EYYoE540fItzaB9S8h5Mnknhgr76iW1g7+8tS1idtc03ePBTwFJwZAYjV+wp4pcDSgJy1A/Hwb+U3585hTGjpXIkXrGfOCjPUZUeYSq2qQXntiS8htCifU8L+BywE5K/IgKKe7Ufq1npAVCnqMuNqutVsVTR8Igq8pXtT3ugMQMdK1p5/iluwUbAnX6luEP/9Q6GCOfb0/CgP9qODPaUMTNx0dFlLMNeOqC8ygTwfD+wAWxdtKkcPBV+wRaR2t30Fpd8Lu9nLBZu/9D8qZeaPUy10mOo7Tc7wNK5KcRgkkMcgoMi2NVfbk80qGW+FgE3Dol4+kFq6s1cRYeQlOZDeO4kmfPB56nsbz/iZD++PRDrChwj6l3/D9PhV7nBR9dhUhsz0e45YjPSf5VsiG6B4hegxcDUbvrpukQ/T8b8wthhGhVEcMz8LzQiuiVpnDMjSE4FvJmmUYsUvdKfuVa44nm3dEt9DXzYRHKVEzm1pmC73sbhYk/bZY2hgxgcvpyaCjU6xCwGuy2Lh+umNjpVoGix57owYyBWgLZbrOwGAyfl3RlqfJZuOKG1LuVabrm64s8Tl8VGufhI1x5yR2j/YbCFiONoB0z7L44rpxAu+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(2616005)(186003)(6512007)(316002)(86362001)(478600001)(38100700002)(66556008)(66476007)(6666004)(66946007)(6486002)(31696002)(82960400001)(53546011)(6506007)(36756003)(41300700001)(26005)(5660300002)(8676002)(8936002)(2906002)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1pnZE1oemJVWlJCbjJ6S20yY3VXZVRTOTF5em9HVDZYb3djT2dPcENnNkRK?=
 =?utf-8?B?Z0Q0ZGlWR0tLbWFxUmg0ckgxakJ2WUx6V2JRU3pQL21hTHdBRXFwZ1VabUkv?=
 =?utf-8?B?djI3UWxUaGxUQXR1NkttRU1WdGdaU09CK05kV044OGhLVTU5d0pGNk4xcWh1?=
 =?utf-8?B?ZFI3aURjQlRvblMzZjVabVBDYTNvV04xRzlDVG1zWmJrdGtWeE4yRkJWYVQv?=
 =?utf-8?B?SFZKOUhsdjJKaVpwMTNHcU5UbDhjaGwwWGhGa21KWjQzdXRiaFJpV29kL09F?=
 =?utf-8?B?bGVxNFVnMjMwbjQ2T0J1bHVnMHVGeU8wOGN4QW5OV3BmcnFDVDMvMi9Ic1pE?=
 =?utf-8?B?c0pkcHJmUjhra0w2aTc0cVptb2ZkbE90dmpIV1JmMnhuQUxML0N5ZmE0cWhZ?=
 =?utf-8?B?cm4vVlFSMVovNjExNGFqdVZqelpWNlJ6a3RxNTlRVldSczlTeHFGMVJSMVFx?=
 =?utf-8?B?TmlRQm12ZnFOanVoMS94bkQ4T3cxU0pxbGpva2p1MXFzWVIwR202TTVmMkdO?=
 =?utf-8?B?RjBncGN4ODl2ZHZmUS9NK0xtUUhsRXhrVXNaOGlZWVZMbWQ1NHlZeVJld1FM?=
 =?utf-8?B?cFpCUFVVd2hoM25ONlQxMEZ6Rnl1dmkxMjErVkhNNkZYL3ZvUG05VElhSnZR?=
 =?utf-8?B?MjdJcS9WNm5LV3FveHMzdGc5MHZkbkxtSTZ3bUJxYXJZOVhiR1MybWZCMG5N?=
 =?utf-8?B?Qy96MEhzOHhHSlYvUm1FTUovcUIyUGZmeGh1bnMyVjlaaC9tNUVIM2dRcW9N?=
 =?utf-8?B?NUI0V2NRL3Z4WmMyTVJSZ09sT0hDZjlsdEpxelY2NjZaSmMwdXZTbjduRUwy?=
 =?utf-8?B?RmloaGszMlIvc0tWY2psSlhQQXY5ZnZUa3ZMcVB6T21wTUdnbFZZM2tBZWVE?=
 =?utf-8?B?S2FzME9lU3VYNHFTNU5UZFR1cWF2MU1CRXlTejVoWjJEbFQybmFCbC9PSzFB?=
 =?utf-8?B?bjZIYVZiLzJMaGt0bVR3eU50T3BWTXF1MnNFeDNLYnMySDNUS2ZqcEFnNllj?=
 =?utf-8?B?TkU0bi9kU2dHYUU2RkxRN3JFa1JiT0xiUi85L0xmaTJhcjdvWFRHRGtXZG5s?=
 =?utf-8?B?TVdZcU9IOTVmNUF4M1JLNnlpLyt1VVd5YjNQVWxyVUhyUGdYRHRuc2JuK004?=
 =?utf-8?B?TFRkdzRXbGJCeTBLSndheGVaazI4eHJSL3dZQi9UT1Q4Zjd2c0VrRS9qeGNT?=
 =?utf-8?B?amdnamFzbEw5MmNZYytheE9TVUQwOHZ0Snd5c0VVS21tQk1LZDJVckQ4MGlQ?=
 =?utf-8?B?aXBtM0JyVFpYbHYwOFVyN2QwMzk3RmhHc0FOcSsvb2lGUXZDbG1nR0NYVmVx?=
 =?utf-8?B?Z2xUb3ozNjVleUk3T2FHNzFmUHZ3a2g2NlRxMHNYNXBneW9KbDJ5TDFnbE5I?=
 =?utf-8?B?R2hWa0dna0dYWHRqZnUyOGNTcnl5TnJydnE0RWVGcXZCR0RIM3lyeWd4K2Rz?=
 =?utf-8?B?UURTbk1NMWViTXkxUk9SRFRGZEUzaHZrWVBVc0txRjBjWGdiQWZZUVJEUVdq?=
 =?utf-8?B?cmNuWmNERjh5L0VxMm8vOWZvK2d1aGpkUHZ1aWFMWFgwTXBqLzdqWFlFYW9T?=
 =?utf-8?B?ekJyc1RIcjZ5YjJ6ajZVUVBiamlmQjVnbmlYYjl5d0VrSkU4Y3pHdzV1cytX?=
 =?utf-8?B?QklGMTAzRkFZU2xCbnBMYzNZcEVTN1V5NjhJVnFDczNqQ3Y3VUcwbzl4RU9v?=
 =?utf-8?B?cUdiTm1LOVBZK0tvRFBWaVRjcmwxREJpZ3ZnbFFsSXB2T0wwTTdNaWdoalps?=
 =?utf-8?B?Vlc3ang1QWpjTVd1MmFQRXRHL1pEY21IbnJ1ZE5FT0c3cmlrVG5jZ0l5NCtI?=
 =?utf-8?B?bjN3NDg2Y0ZoVkVab2VxYWVFbmZ6M0lPOVhsV09OVWxabDRtMlFUaGQ3dzdk?=
 =?utf-8?B?dlZYOG1EZjMwYjd6eGJ4dlc3bG40eVp3alovMGdveWsxdjlIb1BPY21vdVlV?=
 =?utf-8?B?VFMxTUZRcTBma3d3TWxpMVZJV2FxZ0hONlBuNFRFVzBjdk5aQldJM3pTOE0v?=
 =?utf-8?B?MGt5SGtKZGVkaU5aWkdzc2ZnOVQ1U3ozQVU3SkNUM21BdTZDNVJXeGtveEha?=
 =?utf-8?B?eEZQTC9WOWdPRmFWRFRBZHlVUHRxd2ZBZURuTDRRMlA0R0hFeWJiNWhTRXVt?=
 =?utf-8?B?YzgxT1c4cUxYc0wzbHREL01qT2E4MWZVZ2VkK1J5enA1bHZJZG1nQ29IcWRS?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bcdbfb-3be9-4244-1ccd-08db93e2bc8a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 05:30:24.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKCkymzQdticnrWANsgBlPYhXpSJCfBw6DM1XpFxiRpTrmCfW0LnllX4Sm5keJR9M+jFApO5KCYmIa8CqOF8kGYahwy/cxTRBZ9JFYwrDok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
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



On 27-07-2023 15:43, Tvrtko Ursulin wrote:
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

This is same as the earlier series, which I had reviewed but forgot to
give r-b. sorry for the delay.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
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
