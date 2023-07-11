Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D961174EA7D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7F910E34E;
	Tue, 11 Jul 2023 09:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB5210E34E;
 Tue, 11 Jul 2023 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689067774; x=1720603774;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yoEQ2vrHmu8FoeqfgLu2eRZ6DqtquvRZhqmrM8zcVOw=;
 b=CsKz1L4XmdzV4VEzCAfcZgYBCtQ2kKIbE9lQ9dolRa6kP+8ZFjX+el4u
 7TJyk8gund2Gmgc7KpGf1PxyVBnB5gObeEcH6JBDChtArk3Sikw/beUUX
 s+9h2qGtqF0at0i+ic2SstpoLBoEQ3UONr7pxwQnXuVgcKmRTMz3b8gSl
 Be8jjJjwCbji224yEdNQdGeXUuSolA3j/S1GRSiB2mbZUhmBedmxY6Md6
 sCYpnXHAFfH0XFqPFD7Kpyr+LtZLxjC7aQOa6sIcJCDUGoNAGihm/qZVB
 mOJFJ5M4o1UBFcUtKEJKZRkpv3cQgtgjPG8Z5Sm80Vxj8TG0oMFXC8OcS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354433220"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="354433220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="845204269"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="845204269"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 02:29:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 02:29:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 02:29:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 02:29:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb4sXNMXXWAJC05xSGy+KKQaVMAsOmX+v1Fr+WIoRgoNtEirp5vhbcc4YkO0iLOjucHQGBxjQejjrch/P/z8j/ByEMuOQuxkUBrEr0p+XWzTZhLttVZkbSJYjKpkchkJZphFZZq9TijGT7PHo4FnmSDR0Dht5fYtIMw5lZyGwKxyDk/riNrY2QkPjbjThMU0EUyFXOlyh3OtcgCE1/YBDHJZKTU1Zqzkm3iVfxINEpZTkAXSZfSTOecQOqbooWd1oaUS82iu6+OBOJ4dGQ+OBipAGUOKr7caIJAZxryol/zAoq1bBd9s3qXfLSnrV61jLwj7SSVx5vOkhwFxsD8uSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36KiJzLtuDaz0EOTvPx55tQIQ3nKowyVoFet2YJD+fY=;
 b=hTLCvt+KdOH8fvswtw+wxoXGUxf8G5Bro5pKFtNHYE+6BOkC5u4g+E0rwSuomRrKxDbJhnv2C3WygV4FzyHJ+6VmcuErYnTtTLYX4FdFz2OsmKkTe4khMLpIMMjdHIEBq+iGLCHd2loUJ+hRjusKemmSytvhN3FdZ7GbycC+VYG46fFqtkezby04rMrYGrP6RWahn63H6mFpUdmoQOiSllf/jDPj5tZZ+Crlq4cujmUkt5fk9Lmpg1c5lHT0DyjcOk4WPjEbW5jCVEHx8QttKWQsTfL3LtxaYJjN8qrMoONOMf/9SMmLcOaDhwon5jO6YPBzOxXYeQAm48xV3wkx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:29:31 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:29:31 +0000
Message-ID: <488e77bf-c5f7-8dba-9f1a-7932b5e601d0@intel.com>
Date: Tue, 11 Jul 2023 14:59:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915: Account ring buffer and context
 state storage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-5-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230707130220.3966836-5-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 052c9a47-e01d-498d-e609-08db81f154ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/V/dBqLNJhEaVx0FzRKrOHKaUCxyKGlQ8NK1j8+PRiFmT3+kID4W/QPkzm6ZyUNP75Wte2QVYy/MLP9BsCcKj2vR71rRY/HM+COeE2kRwkiu+HVLjlTv8kwFFZ6z/QtGl4+cnmS/oGgx3HcXfyMNZ8hd3Zi9MgQZC5LLccf900GlIOmC7GM4jI5SwTXtTl/QsHa/8JRsr3des7Oqea/L9saQmC6gXYrpzxqa7w7YpIim/u/xpJO4scng9wCD7kvjUQYu9tWv3TWcQ6915doMUQ05ABVtc4Nd071f8RiBl+iymigR0vIIgKxdnzFKfJ5GC8lO5XP3UK+duRFsayGnrcJZjJmBlQchIBR++Hco+ekSbYib0ob4uiAM9YsfepaUcny49U88Rvy2eigPBjDn7F/BEPKYxkYjkGvsuq5aGKp8J4EzKtf9rYF2frt6rcR4U6V5qeKiDXASVQOJPb83eKyW7bxqhVaL61qD3zcPFebBf8Kvcwc6GBSRDt72xz+aYaX3TJeF5mKiW+tunx8CLMQNK1HXNl6xguUQ162m86FlVnRDuI7p9UbhPga32vb+uUvL4EQeyAgxY6KgvRZGk+dEsKYcj/ctPo3ePSAVSufIg27RFtJYyZxdQX1e9N9SWBB7xcJAeeAHjDPNr3u1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(36756003)(31696002)(86362001)(38100700002)(82960400001)(478600001)(6666004)(6486002)(6512007)(8676002)(5660300002)(316002)(2906002)(66946007)(66476007)(15650500001)(31686004)(66556008)(8936002)(41300700001)(2616005)(26005)(53546011)(6506007)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTZWVWhLMTltNjZtRmZSUGI4eEJ3R1FaalR6T0x6Sm5maVVRQytVSDZyR01W?=
 =?utf-8?B?Y0VsNWFzTGRleTNBWStOTWljQXM4Nks0NFZTRmJUVkVITnpLekU0aTZQZXA4?=
 =?utf-8?B?U2NwdWZsWE1Uc0VPWURjTGpHczFZMzlLRG9WaE9CalJwYWZPQU02Y0JkTkdj?=
 =?utf-8?B?V1BXSGdhQitaSnNhdlNISmVzcXczcUdFN3Y5bWliY2V1bytqaUtKbFJuaTY5?=
 =?utf-8?B?T2I1NFRIUFkyVUUrWTk2S0xnME5laTdGNFdHTFBTekJ3YVdQMlhPaWFCRkxo?=
 =?utf-8?B?OE03cGRWK0I2RituMVJINWR4QmpqaExhT3h3Sm1Tb3BiMi9rY2JkbUV3OE1r?=
 =?utf-8?B?YWR0YTFzM2FtekxvSWNqU0gvWE0yelN5WGx1ZDd6VGZoWUVDWXB1Umd6bFov?=
 =?utf-8?B?Nm01Rkc1Y05tbWtaem1aOTZaZ2xMMi9nOEJjeWVZL0dxYmpVcGhKZDVRYVcr?=
 =?utf-8?B?MDh2NWI4bUZpRGRIYVNiL1RzVVQ2aGpVYVBJUGd6akdnbEEvN0dUWExNVUx2?=
 =?utf-8?B?WG5mcDE5eEFjUWptVHlPSC81VzE0ODE5d2tXN3F3K3A0NkdhZ0VYQ2gyMlYy?=
 =?utf-8?B?ZU80Zjd6Q3V0OVNHd1ZOdHY5Z1FsbmRuY1NUb1J0eSs1SUNKRk5vcUlZZTJy?=
 =?utf-8?B?emFBOG9RL2dqRHY2V2lzcWJRMUpUM0F6V3hJblo1eTVPTDhMcFRjSG9FS3o0?=
 =?utf-8?B?OC9PWkRCN0s4bkZDbzA0Qm0zN0dwcE1zcVZJSEZHbU45S3QvNnpaWjhWRHVx?=
 =?utf-8?B?M05aQVVvMEl6S3AwZmVyZTUvREVBdmxyWHFKdWQ5L2VZZHNtNWpuQiswZEla?=
 =?utf-8?B?OFBjTCsyQ1NHNXpFR09mV0VBcFNZZ2x2cDRtTkdjUWJTZXZldHZWMUl5QWlM?=
 =?utf-8?B?dHpFZ1ZvRHZ4T1ZLY3FGRy9PV2EyZUlpWUVxTFRqQjZTUUhPUU14TDN3S3Jw?=
 =?utf-8?B?M1NXY0ZjR283cVlmQVllMDZBZWVjZDZmRUpLUTVVM0IzV0tNRnhBU2R2NDFV?=
 =?utf-8?B?Y2xTaEZCK3JmeVVqQWdMVU5jZ0ZDZzlkTGNnK2xQYy9qODhVT1BHMVZtR1o1?=
 =?utf-8?B?RC9jMDJSTnpyRkd4bzJYRGFDd2VIRlR5R3IyL3hFU1I5eGFkc3R3dE1jNjNs?=
 =?utf-8?B?ajFubXJva2NQajFtUEdpeVBDTFVlbmlXb1Q4WngyS09rUFk3Z0RuRVY3TGpD?=
 =?utf-8?B?T0ZmR1Y1VVQrSENNcHBlQXJ2ZmdWNmRiNGdxdktTVDhDZVhOVXhvRzkyTjlS?=
 =?utf-8?B?RllyUC9XUEdWOTB1ZWFGTWtNc2dpWGxoOENoa1FQTGxQdUhpZ3RCS0x2MWJQ?=
 =?utf-8?B?bTRtdHNFenZBV0I5MTd4cVJLajE2aUdtMkNHRGpMRGNhcXdLaE9ZalVobmNG?=
 =?utf-8?B?elBEZEhkZUpuNFRRQlRnaGhVN2psU08yZ29DU2JLL3ZqZjlndUI4dFlJWjNX?=
 =?utf-8?B?UzA2UnN3d1lNUVBEWFo1L20yYk9nOW9mRkgzNk82NGVnc1FRUlBHZTdjaytY?=
 =?utf-8?B?eGZPVjFDdFMrd0V1amtjdmJwNy95aUI2dUdJWnRKMXlEcW5WVG9QN20rNDdV?=
 =?utf-8?B?aEhVTjZmWVFOSDZjaWJWYjNCNFduamxrelR5Zk1zK3llZ1RZbkJ2UzA5czNK?=
 =?utf-8?B?OUpjRXR6aVlJZlBQZ3ZzN0kySVdXL2gxWjF4a2s0WDVxdGtrcktvaTNDRU40?=
 =?utf-8?B?cWdXWlZVUHlsenVOMXJWNHJuTS96SnRBZFg0RnpPRnovcEQ1OFRZd0NtMWts?=
 =?utf-8?B?YUZSek5hY01rRkt6c1VlUlRKR0JVS3ZCWENXUUZWMzQ4Zk5UOVBJYTUyVHNE?=
 =?utf-8?B?cWI4cHRsaUp2azBLalFpYXprNE4zTW5OV1JraEY5cGlpVXpUbHBZRXJ5YUxn?=
 =?utf-8?B?QW9MUyt3eEVWTmxXSitITWtUR3YzclRFM0xZcGxpT1dtdzRFNUx6R0RNaFJM?=
 =?utf-8?B?SVRpWmQ2SWtTcGZmUS9LVTFvR2ZwTnNzNHRWQnkyTmorS2JNbE1uWEc1TVNQ?=
 =?utf-8?B?Rys4c3VleG4zVDN2VUdKZVhHRS81U0QvSHlqb3lFSGpnS0V5L2VKQ2RTRXNQ?=
 =?utf-8?B?akFsdFhFcHdxRUI3eUptUTJvdi82OTdhNjhxK3YxZlQvYVMxQjVCeHlrcWs3?=
 =?utf-8?B?dGNwOU9DL3VRWTlJcW4zTGEvQW8vclJJWlBBaHRzNllQSU5OM1hRNU5PK3dz?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 052c9a47-e01d-498d-e609-08db81f154ae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:29:31.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQlkInlEaWY//iT1EfCf71g5cbm78MHnclg/G+kTaMcD9fPTQu+rjxUWc+2loSDto4gftFDMwAsCNm3VchGfSjWCK5tbpvJniKWKZ7RmIRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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



On 07-07-2023 18:32, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Account ring buffers and logical context space against the owning client
> memory usage stats.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_context.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.c  | 10 ++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.h  |  8 ++++++++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index a53b26178f0a..8a395b9201e9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -6,6 +6,7 @@
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_pm.h"
>  
> +#include "i915_drm_client.h"
>  #include "i915_drv.h"
>  #include "i915_trace.h"
>  
> @@ -50,6 +51,7 @@ intel_context_create(struct intel_engine_cs *engine)
>  
>  int intel_context_alloc_state(struct intel_context *ce)
>  {
> +	struct i915_gem_context *ctx;
>  	int err = 0;
>  
>  	if (mutex_lock_interruptible(&ce->pin_mutex))
> @@ -66,6 +68,17 @@ int intel_context_alloc_state(struct intel_context *ce)
>  			goto unlock;
>  
>  		set_bit(CONTEXT_ALLOC_BIT, &ce->flags);
> +
> +		rcu_read_lock();
> +		ctx = rcu_dereference(ce->gem_context);
> +		if (ctx && !kref_get_unless_zero(&ctx->ref))
> +			ctx = NULL;
> +		rcu_read_unlock();
> +		if (ctx) {
> +			if (ctx->client)
> +				i915_drm_client_add_context(ctx->client, ce);
> +			i915_gem_context_put(ctx);
> +		}
>  	}
>  
>  unlock:
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index 2e5e69edc0f9..ffccb6239789 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -144,4 +144,14 @@ bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>  
>  	return true;
>  }
> +
> +void i915_drm_client_add_context(struct i915_drm_client *client,
> +				 struct intel_context *ce)

do you think we can rename to i915_drm_client_add_context_objects?

> +{
> +	if (ce->state)
> +		i915_drm_client_add_object(client, ce->state->obj);
> +
> +	if (ce->ring != ce->engine->legacy.ring && ce->ring->vma)
> +		i915_drm_client_add_object(client, ce->ring->vma->obj);
> +}
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 5f58fdf7dcb8..39616b10a51f 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -14,6 +14,7 @@
>  
>  #include "i915_file_private.h"
>  #include "gem/i915_gem_object_types.h"
> +#include "gt/intel_context_types.h"
>  
>  #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>  
> @@ -70,6 +71,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>  void i915_drm_client_add_object(struct i915_drm_client *client,
>  				struct drm_i915_gem_object *obj);
>  bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
> +void i915_drm_client_add_context(struct i915_drm_client *client,
> +				 struct intel_context *ce);
>  #else
>  static inline void i915_drm_client_add_object(struct i915_drm_client *client,
>  					      struct drm_i915_gem_object *obj)
> @@ -79,6 +82,11 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
>  static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>  {
>  }
> +
> +static inline void i915_drm_client_add_context(struct i915_drm_client *client,
> +					       struct intel_context *ce)
> +{
> +}
>  #endif
>  
>  #endif /* !__I915_DRM_CLIENT_H__ */

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
