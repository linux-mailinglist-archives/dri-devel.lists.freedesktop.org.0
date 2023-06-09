Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21469728ED5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 06:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477E210E0D5;
	Fri,  9 Jun 2023 04:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62910E0D5;
 Fri,  9 Jun 2023 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686284191; x=1717820191;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1BMTqvdPBIzSJtIaaMN08WcJAKF9A2DzaZe5TbGJfp4=;
 b=Iod0FBcVpiFWUAt38IcDFsmIWHL6ktuRFq5VtI4FWjQPivX2dvC4K+qU
 xsjWzVtyiqrrr3LNz8zj7yPKmdQgAb8zDCHE1mkXgpK0PznMOAa9tBxEY
 krct4XudzsLgwrQ74jtAnPI1HSapBSXzjKU1lk1IPsQ1CObi8jmPMB3ag
 RUo5kPzzEl3jjqFUqKK4qC/NoLwsicMjFkyMTpWBys7eyfyTmrqCPAaTI
 P+Z1tstt7XOZHujnrlnsyuHozQa4TkON7hn+7h7M2mNfjJeV/t1r1mgeE
 NkmAc64h6brUoLd+TPf17d5oVMjZ/qdD5tl59IR/oMR/96/5d4J7prQ9M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="355000647"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="355000647"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 21:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713365549"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="713365549"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 21:16:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 21:16:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 21:16:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 21:16:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 21:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP02/Y3Tl+8PiH4d9aSZ6UJdSeRGYJOnUdmGUAkYj/J6keTU7z3eZtQtbxYqXWRO56Hk5/1OgZA2fwRlfL9wTQL7yuCx1cMVlAal9ZyfSysAVzQGBMBpVzqGtQkwsdQpogYVLJ5O7pAMxGhfc6zDg/m443w2ZqsC1a2UaIhT79rFQa0ydK99+wJCBUFDFCvo0ZMRZnNb5jc5vK/2RdhO0uqlooCfKTM7I+pZlsPHzqQ1GFsSl48PqyXnLAyBHEPNDACfXZCQ0MIkr5f1CoQRQOvdYSvXr7CYkmKgRBJAoHjzHZJ89oQ/1Z4ua45aikJ+KM4Z0pMzBY9lOHxi1LwtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToCHwqNnr32jXYxE/MGZ3vMl0M+RCZ0M0PoLPpGmdqw=;
 b=OiJuIzcZIjzYr92FFbkiOt3Jnxa0X1Es7S2a8qQwwAl7i9IZzYvGR7XXL2ffr0shbtBNgzqx5mKMiDwrGGm6PK/iVN36e7pabKwAzROtEZVyezblt//5KmBil0UFK/gz0cSct0wYc6glDmZzfLLaq/jKv4HbA9i5+laQ9deDmrfpoiE0ZQEQTkwIAOhQfFhrtPhURVXo0U4c7P60wq+5lFV+udnfEJSLElFg9W5ZLaOsStCYVbyOH+n9nKG14uPqx2aZYflt/hOK8qTpBvuTQ4xAmPKxFy3yjCo/8Lehet5zdBdOKv6xFqYS/MSJ8JCGVMT/8k3rcJ+elBI2myZd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 04:16:22 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 04:16:22 +0000
Message-ID: <b0990625-1d73-8b6d-d094-5e58be5ad6b0@intel.com>
Date: Fri, 9 Jun 2023 09:46:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Track buffer objects belonging
 to clients
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
 <20230608145133.1059554-2-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230608145133.1059554-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::12) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH0PR11MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cc6d0c-6eed-41d8-3636-08db68a0480f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5LH0o9W+WRspShmDXK8qOmwR89Qjr52LsoUR548AWyVZ8IzHoqXSSt0XF++BowpU9JbOkHpTRa69odnhDhC2T1L2deHtXR1TCeINOoFkvy88whdMlxyccwLjW2qb0/E7yJgp3DqX3U/sZLl6dx3x9VCf13WMUSaraRkHKvfqTzCaftggt4Yrmfd1sN32tnJxkfWyIfR8Hh4OYAMnCi7B25s/acOkjGVoISTG74c5fNSxZwPL1OrMA4gdFXP9jRhCYbnm+Q6N2ka3KZxKyWjcfWkq8HNRf9o96yC4Vf3iTliOBt77bS9F30shDwngIvNJVvPcNUsqhTeGiQVfXnTXhs9QCFXCkvLlMbSy2PMKRnf0m2McF5pep0HOWLHGKcnzr5GQpic9CgvfOXG3Rp5Yk3vUirJehxKRVO9SAHmlHKva4TSxK5mjOKOvcqiAW9r+ii3U09XLznE910kRBcbtO/u/zDjn9zRPNvreyv6cwyiwlVi6bQ++cehKxKV7eTmNKVbpy4iFguwrVD6ocopOUeId1PQCLl1NxldYJwWgldbgCwlMTfJmFOAeKmCiSGxBLcsokvWv8BaoJN/qspMKEZh5eIAbCLN7rHkLlIGy0UK2iBbAypi1fFiE0YlGbmax8A0NwetKsq8azhWngx/jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(26005)(6506007)(186003)(53546011)(2616005)(31686004)(6512007)(83380400001)(6486002)(6666004)(2906002)(8676002)(8936002)(82960400001)(36756003)(478600001)(38100700002)(5660300002)(31696002)(86362001)(41300700001)(66476007)(316002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZBdVZLOElEa0J4QUQ4Nm9iRVZ6YzFOWVR5RXdqcmpIRGFUVzI3eHN2Sklh?=
 =?utf-8?B?SGpGMVVGZ1R2eFpTMm5DaXR1d3M4ZGhrVmZQYllkeUJXOVN1SitJNUoweFhU?=
 =?utf-8?B?bzI0UFBBSUhEVVJ3SnZUdlV3SXZySS9MRVpleEx5N0dVQ2VqVTc4YlBaK2tU?=
 =?utf-8?B?aEMzKzdpd1NrMHdEaXR6TE1QSXR2RmJEV2R1cm9jMlVLbFVJZjRoRGZMS3Mz?=
 =?utf-8?B?aUJyU0h5WjlYcWxrdGpwQm8xRDZjaWdTYWVnNUhvSUN4ang3NllVTlMzZXUy?=
 =?utf-8?B?L292dVZtcVdaRnR2KzlZOHhjQTJpSHBxUlh6UzNOSjlvRkphcmxzOU9VOFNs?=
 =?utf-8?B?bmJLNzAwd3JRZW9JM2pYVVE3RktEOERaU3RKaE1PSldwb1hCV2czTWMrQ1V2?=
 =?utf-8?B?bE80eWF2cDkxUzdqemRHWEMzQkg5Zi9IaFlIRW02YnZ4WjVHUEVITWlNRVNI?=
 =?utf-8?B?UTZ3b2FOUXdWOVVRU09MWE54ZFJBNnRkVVF4TnZzdUd5eHNLVlE0WGJvUFlZ?=
 =?utf-8?B?cXlIWmtyUXB2OW8zaDh3eXNaSm8zWmFRQTg0VDJCLzRVVXEyVlBpbmNiT3p1?=
 =?utf-8?B?a0wrWURFRkJmbzVqWDVyUjBzZ3drT0xsN0xpdlpjN1JLTVQzNDVmUXFQMm4w?=
 =?utf-8?B?Ri9lb1J1KzMwR2QydXlKZXhraXNuMmhqdDZ2SHZXNVlzWVBsOGJaQTRsRm9q?=
 =?utf-8?B?c2FuWXZ5OEpldE5IdG1jUG1URlFxWjFoRGt6UUNGOWZaeksrUHpIcThJQkxB?=
 =?utf-8?B?aDZmbktqNElWaTlKd2RpcW5wbUVvR0lJWXJrZmZFbE1WMDJ0WjJDRFBsaHBh?=
 =?utf-8?B?NWEyMnU3Y1dpTjFlcm1LL1NVZ09xZmcza2ppaG0wN1VLc3A1SHBjeCtNbzdG?=
 =?utf-8?B?SE9hZU1sZ0t5VkU4M3hQVXBjL3AwMzlUdEJYM2t2Y3RIalptMEd4N0hwS2Nh?=
 =?utf-8?B?anI4aGZZRnBiMmFpUVY0Tnp4VWF5SFhSZitUNWtaYTQ3U3JwQ1ZrNDF3V1lw?=
 =?utf-8?B?NlBHQkdvWDdXVmljSzZld1dBY05GRDZUNzJXYXNYWUwzTXdGT0NySE9McVQv?=
 =?utf-8?B?c0NjeFVIdTBvTkM1aEplZzRhR0czc2U3TXBraUw1dmNHRjNDWUMvMDI2b0kz?=
 =?utf-8?B?bytMbHJhR1I2enl6aUNlQ2pXQnZVeGpqa0h5S1VMaldPaUF6VjI2UitOMnV4?=
 =?utf-8?B?QTJYS1VuR1NmbndVQ1kzbmNHTTFURFJObEc1ZnRaTWlXb052NjVpVUdyRHFI?=
 =?utf-8?B?Z2ZRa3FyRmpvTEp2QnE3SlU3ZG5sazZiZmVDelVLNWtJUDMwTTdLSmdjVUZO?=
 =?utf-8?B?Y3h0VkJvQWtDODFiemFRU040azVDN2t4ZWVmU3ZXK0twamh4bU5leVdEajYz?=
 =?utf-8?B?eE1PTXFHMUhDNTg5Y0x1VStaOTU0UmxzaFhSVGhZa0RCQktxSm83TnoyYmlm?=
 =?utf-8?B?RkpJQlRFR0U5b0xYV3I0TCtqWE5kYkdWamF1U05xRGlVQkpUa01VSEsxdGhW?=
 =?utf-8?B?QVY4bGpXempjZXdtSFVtM0h5TnVrMHFzRTBRK1M1U0N4b2RYZHViejFVZm5L?=
 =?utf-8?B?enN3dzhOc0theEN1WUJoM0ZLSjNSR2ZGOWkzR1hVaTU5Z1BLRmpZREtUZngy?=
 =?utf-8?B?ME1pd0pjWjl1aHU4UVpyV2lXWGU5ODBxUkJDa0hzVFNVQWZ5VGZQeEswWTdG?=
 =?utf-8?B?cWwrbS9YckRWRmY0QSsyd3RmemFWQm1GLzJjckpDeWd2Vk9jVm1MSVY1VjZZ?=
 =?utf-8?B?OWRjSXJWU3lZdXRXMnVxeElSQlJydWRqaDNsb2k3SFduelE5dmJlVVh5OVBI?=
 =?utf-8?B?V20vRlIxdGF1U1J3aVMwS0VuNHhCTVNSM2U5cEk0bTZtdmFMK2NvazFzdkdT?=
 =?utf-8?B?bUphajNnb2pTSEloSUFEQkNBaDhzK2hVT1l2OUNvdWIxeXpKSkZoS1lkYjhh?=
 =?utf-8?B?a2tqRXlsQkM2QnhXOUZEOXZJV1MwTGZacldGb0RDUUJxdWhTM01pNlNXRE9t?=
 =?utf-8?B?ZXNjWFNrVFJ6VUlXa0l5YWo0aHA5WStqak1IQjRsY09lV0UxaWpieUkwVGYx?=
 =?utf-8?B?U2ViSTBBT0U0d2lhSDM2MUVJS2doK25XcStOVXhFWVBrckJZMEk1RGVWQWpQ?=
 =?utf-8?B?OE04ZjM0ZS9LT2N2REp3S1VaZWJZS0FGQ21zVDZsbjloa0VMcURMQkh2RXBo?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cc6d0c-6eed-41d8-3636-08db68a0480f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 04:16:21.9981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4s4df4QNBxuNgF93v74n3SJlnWjyOP1OTknJsQvXPe5l0rCqXCdcmPlpU86UwAyC4B1Y+pnyBcSvtOxQw6kqTH8cww9bGK79WK+QR/Y4pps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
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



On 08-06-2023 20:21, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In order to show per client memory usage lets start tracking which
> objects belong to which clients.
> 
> We start with objects explicitly created by object creation UAPI and
> track it on a new per client lists, protected by a new per client lock.
> In order for delayed destruction (post client exit), we make tracked
> objects hold references to the owning client.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 32 ++++++++++++++--
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +++
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 ++++++
>  drivers/gpu/drm/i915/i915_drm_client.c        | 36 +++++++++++++++++-
>  drivers/gpu/drm/i915/i915_drm_client.h        | 37 ++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>  6 files changed, 119 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index d24c0ce8805c..4f1957638207 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -11,6 +11,7 @@
>  #include "gem/i915_gem_region.h"
>  #include "pxp/intel_pxp.h"
>  
> +#include "i915_drm_client.h"
>  #include "i915_drv.h"
>  #include "i915_gem_create.h"
>  #include "i915_trace.h"
> @@ -164,6 +165,14 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>  						 n_placements, 0);
>  }
>  
> +static void add_file_obj(struct drm_file *file,
> +			 struct drm_i915_gem_object *obj)
> +{
> +	struct drm_i915_file_private *fpriv = file->driver_priv;
> +
> +	i915_drm_client_add_object(fpriv->client, obj);
> +}
> +
>  int
>  i915_gem_dumb_create(struct drm_file *file,
>  		     struct drm_device *dev,
> @@ -174,6 +183,7 @@ i915_gem_dumb_create(struct drm_file *file,
>  	enum intel_memory_type mem_type;
>  	int cpp = DIV_ROUND_UP(args->bpp, 8);
>  	u32 format;
> +	int ret;
>  
>  	switch (cpp) {
>  	case 1:
> @@ -212,7 +222,12 @@ i915_gem_dumb_create(struct drm_file *file,
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> -	return i915_gem_publish(obj, file, &args->size, &args->handle);
> +	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
> +
> +	if (!ret)
> +		add_file_obj(file, obj);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -229,6 +244,7 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct drm_i915_gem_create *args = data;
>  	struct drm_i915_gem_object *obj;
>  	struct intel_memory_region *mr;
> +	int ret;
>  
>  	mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
>  
> @@ -236,7 +252,12 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);

Do we intend to track only client created objects and not imported ?
or is that taken care by this "obj->base.handle_count > 1"

Thanks,
Aravind.
>  
> -	return i915_gem_publish(obj, file, &args->size, &args->handle);
> +	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
> +
> +	if (!ret)
> +		add_file_obj(file, obj);
> +
> +	return ret;
>  }
>  
>  struct create_ext {
> @@ -494,5 +515,10 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  		obj->pat_set_by_user = true;
>  	}
>  
> -	return i915_gem_publish(obj, file, &args->size, &args->handle);
> +	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
> +
> +	if (!ret)
> +		add_file_obj(file, obj);
> +
> +	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 97ac6fb37958..46de9b1b3f1d 100644
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
> @@ -441,6 +445,8 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
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
> index 2a44b3876cb5..4cacca568375 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -17,7 +17,8 @@
>  #include "i915_gem.h"
>  #include "i915_utils.h"
>  
> -struct i915_drm_client *i915_drm_client_alloc(void)
> +struct i915_drm_client *
> +i915_drm_client_alloc(struct drm_i915_file_private *fpriv)
>  {
>  	struct i915_drm_client *client;
>  
> @@ -28,6 +29,12 @@ struct i915_drm_client *i915_drm_client_alloc(void)
>  	kref_init(&client->kref);
>  	spin_lock_init(&client->ctx_lock);
>  	INIT_LIST_HEAD(&client->ctx_list);
> +#ifdef CONFIG_PROC_FS
> +	mutex_init(&client->objects_lock);
> +	INIT_LIST_HEAD(&client->objects_list);
> +
> +	client->fpriv = fpriv;
> +#endif
>  
>  	return client;
>  }
> @@ -108,4 +115,31 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
>  		show_client_class(p, i915, file_priv->client, i);
>  }
> +
> +void i915_drm_client_add_object(struct i915_drm_client *client,
> +				struct drm_i915_gem_object *obj)
> +{
> +	GEM_WARN_ON(obj->client);
> +	GEM_WARN_ON(!list_empty(&obj->client_link));
> +
> +	mutex_lock(&client->objects_lock);
> +	obj->client = i915_drm_client_get(client);
> +	list_add_tail(&obj->client_link, &client->objects_list);
> +	mutex_unlock(&client->objects_lock);
> +}
> +
> +void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
> +{
> +	struct i915_drm_client *client = fetch_and_zero(&obj->client);
> +
> +	/* Object may not be associated with a client. */
> +	if (!client || list_empty(&obj->client_link))
> +		return;
> +
> +	mutex_lock(&client->objects_lock);
> +	list_del(&obj->client_link);
> +	mutex_unlock(&client->objects_lock);
> +
> +	i915_drm_client_put(client);
> +}
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 4c18b99e10a4..0db68b4d7a4f 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -8,10 +8,14 @@
>  
>  #include <linux/kref.h>
>  #include <linux/list.h>
> +#include <linux/mutex.h>
>  #include <linux/spinlock.h>
>  
>  #include <uapi/drm/i915_drm.h>
>  
> +#include "i915_file_private.h"
> +#include "gem/i915_gem_object_types.h"
> +
>  #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>  
>  struct drm_file;
> @@ -25,6 +29,22 @@ struct i915_drm_client {
>  	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
>  	struct list_head ctx_list; /* List of contexts belonging to client. */
>  
> +#ifdef CONFIG_PROC_FS
> +	struct drm_i915_file_private *fpriv;
> +
> +	/**
> +	 * @objects_lock: lock protecting @objects_list
> +	 */
> +	struct mutex objects_lock;
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
> @@ -45,10 +65,25 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
>  	kref_put(&client->kref, __i915_drm_client_free);
>  }
>  
> -struct i915_drm_client *i915_drm_client_alloc(void);
> +struct i915_drm_client *i915_drm_client_alloc(struct drm_i915_file_private *fpriv);
>  
>  #ifdef CONFIG_PROC_FS
>  void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> +
> +void i915_drm_client_add_object(struct i915_drm_client *client,
> +				struct drm_i915_gem_object *obj);
> +void i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
> +#else
> +static inline void i915_drm_client_add_object(struct i915_drm_client *client,
> +					      struct drm_i915_gem_object *obj)
> +{
> +
> +}
> +
> +static inline void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
> +{
> +
> +}
>  #endif
>  
>  #endif /* !__I915_DRM_CLIENT_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 1f65bb33dd21..7ae42f746cc2 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1325,7 +1325,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
>  	if (!file_priv)
>  		goto err_alloc;
>  
> -	client = i915_drm_client_alloc();
> +	client = i915_drm_client_alloc(file_priv);
>  	if (!client)
>  		goto err_client;
>  
