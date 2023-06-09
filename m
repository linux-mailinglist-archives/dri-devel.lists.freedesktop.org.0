Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B825729A3F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F9F10E69A;
	Fri,  9 Jun 2023 12:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C776510E693;
 Fri,  9 Jun 2023 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686314703; x=1717850703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VVIZo6WcJDGDGlRCmgdm7a/F5TiWx9ljDBxlVEvrVC8=;
 b=i7+hBok3rjQIoUgL9kwwupy5aPGv3fUe4V8KU7bDo1Cq9fKV7q51zU+l
 IJRxwMu8Ah9bMbZlKWmTyplAegoO19k+lwJ/c/snQJjNkQ1KV8XABNLC0
 FnC0YGpypJVtccMIw4DvrL8oZ4bGe2xPO+Tz7QQg8VHeAqs9iPa1j6P9A
 5yi/Lv1BX9GvK46686MqmXzXdlkWv2nlCS6D60baBJ315mhVb2dkTrggF
 L48R9u4sbbJB0+O+8IWFm7omkwkQlBQUmP7JHyWAlJ09ywFnj48Ofpbj0
 HatCA58pbysiUn8xcANk5kC4mQBySPdTN6vEEYXgd5zDuBvaiTQ5CM5Oe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443957335"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="443957335"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="743478464"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="743478464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 09 Jun 2023 05:45:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 05:45:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 05:45:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 05:45:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 05:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIm4PxF43MlfnvWv21hK1Qp+Rm8o7fBQLVZQt4gdoKW57/GeMLJ53QiPlngNNiRuosvwp5F7ribuN0TjIYbL7uYlHb+ocfBY76x5995a6UEUbmkYS7N4z66n2TTpimMlVG69QgCVlr+lWK6L17Q4SAmzG2LCOd3B9r5v3j1y5KwU1a2Q3MW4g5IzrV2gXssp09aIjGZcKg+fK7ITst8V4CEDD0tCj4PGeHkI+EBvr56bPuDU8nNMsSH+T4uK40NQlERI8jp0ScoLS1TowLKO8DRWXC4KQKgnlApmPYYvR//2R+qGs1hrXgDfqNwIYxSR3CTh7f4qYKSMqjdpfN7Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnRgpOYq8W/1huwEIc+hblxgb5wxRhuNI2jONmCKMWA=;
 b=jY8+/HJl0N+wKbxynXHAwnN9W1eb2TgzX4T+T8D9a3TQPvu4FyNkB+CXdYpEKd0qzf7GQXLyfJts+Y5msaDvsraf4kDtjYw3QmeGsSCcLyNjRca43taGcoROe5/bVY2ligBCYavyYTJzDo2Zfm4Om/if92yhEUb63Z+U6UNDNYC20IgDeF996lXHwqxamAE/Tnr7xgw52H12ts/qRgakHWaULVVw1JgyUz2qFJ2eTENgrBpujwh6eoFxR2aQlVL9DDiNsVC9TFuuD1SMekd87z0aAIh+NWUe05BWjeEUAi7NmXr8ngTzUD3anRXIKOM9THabYeJ71w7IadxNVeBizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 12:45:01 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 12:45:01 +0000
Message-ID: <2faa3900-6456-136c-0a1a-8629ed6d3784@intel.com>
Date: Fri, 9 Jun 2023 18:14:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH 6/8] drm: Add drm_gem_prime_fd_to_handle_obj
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
 <20230609121143.1232420-7-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230609121143.1232420-7-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::11) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: c1702251-aee3-45b0-4128-08db68e756d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOfT+N2F5PrxoaCfz4PjQY4M9/FeCDpNNu1av6HDg7bacKLcnRB56yjIk9LgMhy2S0WyJam5C2UY5Fe3wkUYslcv8otsqkgVWgGwe81RqvjtwAo0YqaC1RBkYC2dPuSr/Cs5jRax+pXtqeD+pv8qa78gCcHftvg+KtaKXHrEkcBTztmFyZKD2XE5ixxtXp8dx/C8veC8vu6/75FD+xg7C7hYZQ5aAWytpodTH8oY7xObMqL7NyW5EYYZum4GZpB0iCW5iZnmI12ulNFpDoO1dN+FzZ6r1XOAnyDfH1psbZV9xKbE1l9C/1lu45IJwiGjdWUsONKB991SKOft8M1epTwdF0D2YpW/3Gv+6VKsA6q6UidlgpSUVKzMXt5aB0bgUEfComIoUjCxI9zB8bmVO52sjWPJ1xH8nzY9C19fe9+HxmK4VAJI8NRAUdJtQNu7fQPXfaEyl/AJxaD/hyFm4RRxvyYOS3egJdSzfqeKNbQ4WNbyQOs5SPFaCJ9OJSRu7QznSj6IpRT5v+ghKCDtFs7e5ZW7NuZl/zzaqi4X6x+beqCHiQzLkK9zMzpnek78CGYsuAZjELlftrQwBAJCn5oHm6oqKteGvBGNlDE6Al9CwW+k7zOCMNk0WfZB8iqOuC6OyTh5Hli/R9MJpCoJUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(66476007)(478600001)(8676002)(5660300002)(36756003)(86362001)(2906002)(8936002)(31696002)(316002)(4326008)(66556008)(66946007)(82960400001)(38100700002)(31686004)(83380400001)(41300700001)(6512007)(6506007)(26005)(2616005)(53546011)(186003)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZIR2w0a2pqQ1lzeTk1Qk82YmlsakF2Tkg1ZkpsUStwUnZJbTlmZDRCQXAv?=
 =?utf-8?B?MW5DV1ZFL2t0aW5VSXAwbm9qYU1tZEFMVkd5cDl5L2tWQ2hxQzh0QkwwWnlX?=
 =?utf-8?B?R3FodkE3dFgxR1oySEprK3RtQmlrN1dWTm5HdkVpYjltK2JPemZ1SlA2aE5F?=
 =?utf-8?B?MEJBRHN2V0lGYU4xUmdlYWR0NGJuOFl1RFk5b29pLzdYNHFTMDBGNjNQQkl0?=
 =?utf-8?B?L1Q1L1pXOHVDcjkySHVoaGtoZU54ZjBYZkVIRVNGQTdobDZrTll2dk5weFNl?=
 =?utf-8?B?YmwrQUd1Yyt2OW9TV0Q1YU1WY3lqZkpBV0QrcjBJNDJoaGthL2ZSZVY1eWhK?=
 =?utf-8?B?QnhFQ05EWG5nc1U2NVh4K3Q4dHk0bEQ5VWxqVnc1L0hUSW1OeXZGajNDaFUy?=
 =?utf-8?B?dWhtbGI0c24xalEzaFkxRGxGZXM4OXFXcUlSU25RTHNiRGE4N082cEFEUTA4?=
 =?utf-8?B?bHVYMFkzUU5CNGJRa1NNaGJWNm0xZ0hrMCtiaEJUSFJEa0VUODBtNkhnbkh5?=
 =?utf-8?B?eWFDMlFwUGV5V3VGeXFzZEJYajVWbkh4enZYUWNxTE15VWV5S0ZUcndYeXhQ?=
 =?utf-8?B?Y3EvbTgveU15K3NIRWtJWS9FMmZmb2JDeFFic3lEcW1XZUUrRjFSVUdJMmNt?=
 =?utf-8?B?cVBtMXhqTmgrQ0xwbWYyMHh1Y3VWa3RzOVR5SVBQQ3VLTzBSd1lMb0ZUSVpn?=
 =?utf-8?B?eHRzajJLQlNtM09IQXl2eWd1UFJrVHpZTGVjNVlFUXR6MVRCOTR1Wm44YWVm?=
 =?utf-8?B?T3hsZ0txL2lDcjhNeVpacUVmTmtyeVZCWk5DSXV0d2oyenAwZVk4cHNMY3Q0?=
 =?utf-8?B?Z2JVVFlwWmJBQnhkaEFvQUNlT2VGemR0TFZtcnM2Y3NSMGNQbEovK0N5dE9y?=
 =?utf-8?B?SGFMNFpBcWUvOWNtVXltYkpzWC82WCt3MlZzNlYwbmNmUCtxeDZaR082c0E0?=
 =?utf-8?B?b2Z6ZnYxL2k0cmNiUkZEM0xyTXlzc05CUnVNTUhzWG1nTjE4UTEycmkwcnll?=
 =?utf-8?B?TWRMdm5HdXZqMVZkeUtnQ05nWm1OTWg0MGxxVlAwQUVtM0cydnREcm1sbDND?=
 =?utf-8?B?d21mNWJPZ01SRk5COUlEYkhqMWlSNDN1aFNzWkhNNExwbXlRSGxBRXY0cWov?=
 =?utf-8?B?Szl2bWpOVDVhc3hsR29EVlVwRlVhbzRHWW1ISUtMOVhxMzBhbGtwQUVpZktw?=
 =?utf-8?B?QWZVRUtvNnIyMlhVbTQyOG9tZDdFUGtrL0FjQURsSytIay9lc3NQR1gzSlFj?=
 =?utf-8?B?d3JiQVZFQ1BqdEdYVXByNW11Skp3c255WVpFZi9VMlBabkIzUnMxd1BDQ1hL?=
 =?utf-8?B?cG1KUlU2eHZpOVV3U0FhWkwxYmlmczQwQVVsSDZLbHhucnEvcnU3Um96a0gv?=
 =?utf-8?B?T2tGT2RKMHpjM1B0M0RWNDJRcHlsd0htZHVtL3U4N25hbGsrR1QrM2JKU3pD?=
 =?utf-8?B?b1VZZjg1QS8vL0luVkJjaEZyRnJ2ZGpCU094TmtWU2FnK2wxZ2M0aWMyN0VL?=
 =?utf-8?B?NS8zZXQrUWxuNHZGcWsxK1MzOTFnT2pTSmFpUmVhNW16c2FWVmk2ZUJqOEdO?=
 =?utf-8?B?SS9zQlJMOGRsRkdUYkdrK3luT1dzYmc4UEgvMXBzZnFhM1VrZUkranI5NWpB?=
 =?utf-8?B?VmpoZkQ2bDhuS2V1aXZKcHF1bG1kSm5POWJwbUJlanVHVU00T0c3VWFIOXc0?=
 =?utf-8?B?QkNwTmFhRGYreHJZMDQrNUpDK3BHTnhUTkZoMUJ2bHFlbTduNXNzZEhxTXVm?=
 =?utf-8?B?Rk1SRll5ZC9IR0dkQkRMcGcvL2V0YjFDNG1GUkdWOHhVTVVCOVFSV2hFcDVY?=
 =?utf-8?B?VnJXRUtOenRlN2RuWWFUallmUkpSYjAxSWRyNlFWaFVxWkJadEZodTMxMTln?=
 =?utf-8?B?elMrcllzWUN4ME9qNTFBK3AvbHl5SDdrVk04d2N6Ynk3TTU4YjJFWGl3emdY?=
 =?utf-8?B?cUpEMFhRRml4NUR6SklsKzNDM2lORm85azVyZDRQL01LZHJDcktlb2orWXRN?=
 =?utf-8?B?THV5ZTZPcXI4QlFSd2ZVVkFObThjQVU5cTZ1WUFXRjhRb1hKWFE2WXdRd1NI?=
 =?utf-8?B?Y0dOSzV1WmF6VTg4NE85eUhIWk42ajlLVHFMWEtuZjZ3SEl1aUJWbEF4QnZp?=
 =?utf-8?B?ZHh4dnJabEpLeEYzQUw2aGh4NDBadjFBY1JuWXgwSG1waVpVbVJEUXd5ZEdM?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1702251-aee3-45b0-4128-08db68e756d6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 12:45:01.0180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvWnfWD+hUOkwZkeRwc3OGFwufvezqtVlfseYmZQmpWVVgsPkwhYtU5nv7kDWticKpLQEGzi5DZKjanTf4dUZjIy3t/hBCfXmxxB43kSwdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09-06-2023 17:41, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> I need a new flavour of the drm_gem_prime_fd_to_handle helper, one which
> will return a reference to a newly created GEM objects (if created), in
> order to enable tracking of imported i915 GEM objects in the following
> patch.

instead of this what if we implement the open call back in i915

struct drm_gem_object_funcs {

        /**
         * @open:
         *
         * Called upon GEM handle creation.
         *
         * This callback is optional.
         */
        int (*open)(struct drm_gem_object *obj, struct drm_file *file);

which gets called whenever a handle(drm_gem_handle_create_tail) is
created and in the open we can check if to_intel_bo(obj)->base.dma_buf
then it is imported if not it is owned or created by it.

Thanks,
Aravind.

> 
> Minor code reshuffule and only trivial additions on top of
> drm_gem_prime_fd_to_handle.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 41 ++++++++++++++++++++++++++++++++-----
>  include/drm/drm_prime.h     |  4 ++++
>  2 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d29dafce9bb0..ef75f67e3057 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -284,11 +284,12 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
>  EXPORT_SYMBOL(drm_gem_dmabuf_release);
>  
>  /**
> - * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
> + * drm_gem_prime_fd_to_handle_obj - PRIME import function for GEM drivers
>   * @dev: drm_device to import into
>   * @file_priv: drm file-private structure
>   * @prime_fd: fd id of the dma-buf which should be imported
>   * @handle: pointer to storage for the handle of the imported buffer object
> + * @objp: optional pointer in which reference to created GEM object can be returned
>   *
>   * This is the PRIME import function which must be used mandatorily by GEM
>   * drivers to ensure correct lifetime management of the underlying GEM object.
> @@ -297,9 +298,10 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
> -int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> -			       struct drm_file *file_priv, int prime_fd,
> -			       uint32_t *handle)
> +int drm_gem_prime_fd_to_handle_obj(struct drm_device *dev,
> +				   struct drm_file *file_priv, int prime_fd,
> +				   uint32_t *handle,
> +				   struct drm_gem_object **objp)
>  {
>  	struct dma_buf *dma_buf;
>  	struct drm_gem_object *obj;
> @@ -336,7 +338,8 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>  
>  	/* _handle_create_tail unconditionally unlocks dev->object_name_lock. */
>  	ret = drm_gem_handle_create_tail(file_priv, obj, handle);
> -	drm_gem_object_put(obj);
> +	if (!objp)
> +		drm_gem_object_put(obj);
>  	if (ret)
>  		goto out_put;
>  
> @@ -348,6 +351,9 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>  
>  	dma_buf_put(dma_buf);
>  
> +	if (objp)
> +		*objp = obj;
> +
>  	return 0;
>  
>  fail:
> @@ -356,6 +362,8 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>  	 */
>  	drm_gem_handle_delete(file_priv, *handle);
>  	dma_buf_put(dma_buf);
> +	if (objp)
> +		drm_gem_object_put(obj);
>  	return ret;
>  
>  out_unlock:
> @@ -365,6 +373,29 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>  	dma_buf_put(dma_buf);
>  	return ret;
>  }
> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle_obj);
> +
> +/**
> + * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
> + * @dev: drm_device to import into
> + * @file_priv: drm file-private structure
> + * @prime_fd: fd id of the dma-buf which should be imported
> + * @handle: pointer to storage for the handle of the imported buffer object
> + *
> + * This is the PRIME import function which must be used mandatorily by GEM
> + * drivers to ensure correct lifetime management of the underlying GEM object.
> + * The actual importing of GEM object from the dma-buf is done through the
> + * &drm_driver.gem_prime_import driver callback.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> +			       struct drm_file *file_priv, int prime_fd,
> +			       uint32_t *handle)
> +{
> +	return drm_gem_prime_fd_to_handle_obj(dev, file_priv, prime_fd, handle,
> +					      NULL);
> +}
>  EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>  
>  int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 2a1d01e5b56b..10d145ce6586 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -69,6 +69,10 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>  
>  int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>  			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
> +int drm_gem_prime_fd_to_handle_obj(struct drm_device *dev,
> +				   struct drm_file *file_priv, int prime_fd,
> +				   uint32_t *handle,
> +				   struct drm_gem_object **obj);
>  int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>  			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
>  			       int *prime_fd);
