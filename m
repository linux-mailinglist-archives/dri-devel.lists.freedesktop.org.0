Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07E6E860C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A83110EB43;
	Wed, 19 Apr 2023 23:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF1310E247;
 Wed, 19 Apr 2023 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681947941; x=1713483941;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Osdq06kO3k+CboztETY+nwtj/RW69i4VRK/ONJvf0pk=;
 b=BrUklU1fo3soeGCBYHZ0acYDDjWeo9FfcfapUWsFoWogqYn8oX091VlT
 KPms1TIzdxKmzWy3/X23oPSdXNQGCZWatrrokdZoRAp7TTpLb6lcSzWBm
 +fiwqn0adCQI2lOrgvPcTqnsZWtVfKKdez5ykajbILQDBE9StaOB3YVtg
 QW46RbldAcbNvUHhrwjFO5pZReeWzLxGCbng8YKR/42VnSR3OpRMYQjlb
 C38Wx2K77E5Wi8RUJH0lxytp0ZVCHG7UMeAsC0Sakm/gPsRnboISG+M87
 9dhPjlfctkIAJBrv02fpsG279hefYKQVNrXx9phDsg637SSJBCtB6FOiC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344338261"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="344338261"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 16:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815799808"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="815799808"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 19 Apr 2023 16:45:38 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:45:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 16:45:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 16:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ju2tx/AzTmmoYLxzOIyC1ISJs81byAbQlaz61nLfCthPhcI51DiFgD4ve+dksLO3kNaOiw7ZLqldyu0YFxVYPRzA0sVGwpMsAROt6n5nMKUQVwysEdUGYdlnVYeMeevETZ/lC55rB7wHBnpgn5GfB0vIRZZZhYIYFt98lFzWOm3zQMcbQ49OjBlTAdxk2eu7j4UFm8/0/vBM4ibbzSpu0MedTr5WfYZcCWkl+5lZmDzyY19mVF+H5oMsaGGzgB6YKmxuVVE+1HMmv3JtDdAWosp0RTT3QiXbiTut7OxR1zuek33bx9Ryj7hzVhJMuQfLYr6OJRH3X/ODcJhzcST9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChOazGZqDLhUXJOzUx3pR++IMrOE6Xj0gqU+yuHjHhU=;
 b=ZyWQDydVgB8Azx+wUDM1cmtj0p/oCyHqY+1d4Kd8v2OL1/0xCKIskDRqZj7Cee5W8XsOjSyLJ71nmdSg8eQwZ1oFreQHd2ZgHE+jEenjPWZVXtLqv2rU8SNCPyEDg2s3l8S4/wfIB+sHi77yecL/Anzej4ib63ex5VrSHZ6eQUjYeQGyuQUz/LJdB7VRQtt7al+QqkKyXcEuCi/aP+YfTHb69AouDOjW8RmSZtGffXOxaJwxSq2+H+B7FALF4shehLxeBYyeLymm1XDDDZ/mMjjEha7pqH8bm6U1uTK1OlMFXKcXZj7OWUU4xsGvE2aV1ZoNeukEON8yNO73n/XdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 23:45:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 23:45:33 +0000
Date: Wed, 19 Apr 2023 23:45:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: switch to using drm_exec
Message-ID: <ZEB9ExzEXViC5UNH@DUT025-TGLU.fm.intel.com>
References: <20230419175650.3259121-1-francois.dugast@intel.com>
 <20230419175650.3259121-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419175650.3259121-4-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c48fea7-5a4b-4b41-eabf-08db41302ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLq7LHl6ziVcy2iAdpOLPHATbB2G4mH31n4uEdYpUA1hRWemADgxg1HSnZtOGyz6n8F5KV6aa0gmVfqpis9+O5pk6R6eQzyRRa+ft83A8ZBTjazP4QBWVPCHuvRI4HAsQeYQF8z5X60zgMEkqpApy9DcpyqH5tCUA7E992ruai0SVtXTkAf2remcwWUUfDOHZ3aDuLkmoTCguibBbAbCrDhZ68PvVH5DllMWn9J0nc7Wm09SHtdpYjYVyqUFp2b8bq0FOSWmvYoBENgUYrcdgbdDolaRbCwIUTrAUPIFk6FcWgdeIB7ccf7y9FYT5wsbZrfAd4d/EAYjV4zaJkRFE3l4H2d2W5h3FmxvhRuLZ+Pe16vTMopHRfFGupATUOJbresLvZ3mZ2bdtS5+LYZxC/RQJsgDU0Waxnc5/k0+EAKsadchO+HMqldxEl8E/AuX3QshALMAtSOmCoyYVa+4oUn7mKYCB8NbXIqn1woyKsDAbSLP+i8VrNwDYHb0v5lZbQtE2JfOlNu2c2AUO4dU4NyW+KMzcYqm3XfjdHqM89M1R+WYt7PXLwelnBstyKVAEOEazDeWDaNK0lB6csSh3MNJ9fWJtlt7X+v+ymBUUYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(86362001)(30864003)(2906002)(6486002)(6666004)(186003)(83380400001)(6512007)(6506007)(26005)(107886003)(4326008)(66476007)(478600001)(66946007)(66556008)(41300700001)(82960400001)(316002)(38100700002)(5660300002)(6636002)(44832011)(8936002)(8676002)(6862004)(579004)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Himrm09YF+SV+AwwiDMH/2auWL3FgGdKTImStZRZiZTHZm8zuKa2SWmKWb?=
 =?iso-8859-1?Q?Y88Lk+kM4sf88jpVMNCWaB49YXoZmgPhF0RRwR7H4tjzC//BACbQUnHEpC?=
 =?iso-8859-1?Q?hSVbs9hzFejux6tfqUoEB05RFCrImuwcQOsZlyEmXuiABsbwism3ebrme4?=
 =?iso-8859-1?Q?+si+e29KsYjCsAwkMegsSi89N8X9CdpH9LnRH4Zqz3OzJ+hyVoGd4SfMmD?=
 =?iso-8859-1?Q?sQ3iFJVyTV0sqhfqJiJH6kTlVHWWxjIHWbkjkbf7u7dAXl+B/+9Fjy6+yb?=
 =?iso-8859-1?Q?Ma5qkjexa5kIVgt7FuxPUsXbILSrKABtHEc+VKF5uUxBXnVlMBV0Cb0bN6?=
 =?iso-8859-1?Q?uYBkQRaQKqTTO06T6OLGZ0/fdiCR06nnGNpjKHx/Hrz6njdlxxn1W93zQ4?=
 =?iso-8859-1?Q?7tlxOcb5doXz7zNDa4w0aqbspfFOOV9gs0tEov/YcKJhecvGp5gFHl0Qlf?=
 =?iso-8859-1?Q?myOu8zp3tHWsIY1jnPE3TnLt0fELcdz7DRgput0UfNcTDS8I4iJu4VkGEc?=
 =?iso-8859-1?Q?xY76gaZwXxG9KfWNakS7K0Oep7HPqbcZBFTXQ0CMsJcEd3E96R24nDJhrg?=
 =?iso-8859-1?Q?y2UD4iwQadUiBBo8kN5a0zboe2N2DuSfqYwkPabigoi66UUxMmjdg0+Xdv?=
 =?iso-8859-1?Q?pnxJBDoEOJnIYuoHQnV3Is99K3qxTgQyqDEOJfkwDZjBHPKRWdT0TGoYc5?=
 =?iso-8859-1?Q?TLOltcLfE4gZ1kxq3hiFkvbkvO3WM+Q5409whtLJphrb8rUx/ykAxVxTQ2?=
 =?iso-8859-1?Q?nf1iGGrDjuSEhP5PONzK4GwsxkJfmKk5cO4c2RyUTvwLcluEFp4wfbw1W5?=
 =?iso-8859-1?Q?ZBANV2+q4DZPaXePW7Dc6bSnko+iRWysDFIGIRgdyiTxCYX+LR2Unidqur?=
 =?iso-8859-1?Q?/Tt8QOq4gOS8dxT3rVQSho1kTuP5/cgseGFZIsSYYPxAZJ+YVZXdVkdffo?=
 =?iso-8859-1?Q?74PCFLj4smwBdr3uICGbn+78eMfQ9aZdLqbGVhLZBiLDZvrgBpfTzX53iw?=
 =?iso-8859-1?Q?gnnpxKWj7+yAnC1UGYuU1U/h6lUsApEIPTPqXuVvy4u3JCdE98/qx5GF2c?=
 =?iso-8859-1?Q?px/JJTcBY4MCsWRKzfhF8oNjoGzGNjzR4uwceCrPxBCdNZp1qRHWFF+0UP?=
 =?iso-8859-1?Q?cIBsArm8GgqXxhiOliuLyd74EIEhKJak2aduTArng1PgnbbsbS912utp36?=
 =?iso-8859-1?Q?T5FoB9jn3YVoX74UiaUiMGKRUbAs+6jY4j3DCfj7HmkbGzzV1DLFaov8fe?=
 =?iso-8859-1?Q?GNC0++HLHsAt6Fn7y7S/gsM+uRRM32IjUsIIYC6vpvnTJ3wQdLGCjMM3CU?=
 =?iso-8859-1?Q?+3sZt5QvIBXUZkMJqG+2Gipet4v2JLDpaAEJ1uYTFPeio2mGAZlstjgeel?=
 =?iso-8859-1?Q?N0PwCfYIHnTtyAZSRVrKtVTovnkGdGS1EdWEXuMDETKSeqn4x1yyAw5pIn?=
 =?iso-8859-1?Q?4WM+hcSZ+JHYWwkJHxoCcnEaZdHExedWomIXO87OGcqPSFBETJELK5LsWi?=
 =?iso-8859-1?Q?0OpuN3PDKKIahf+oDU2ppWvFgQ5F5fjwnXwjo2KoHNrNyYsRBFchSIAzRJ?=
 =?iso-8859-1?Q?H4BTPOTsNdSi2gyRs9Vk1w/6j7/sB7fDmxMxdfTsDJqMpr134b3EFjfi+V?=
 =?iso-8859-1?Q?8k832LMI2+mhcAiCU4+s998awc+IcloBdO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c48fea7-5a4b-4b41-eabf-08db41302ad1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 23:45:33.8107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzxF7AefxJTDb251dvdZdBBLqdTDYw7YbNqvoi9Hjs73gAEAxcZxaFFy6X84i0IKVR0N+LiIpFK+I3dmdwu7oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
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
Cc: lucas.demarchi@intel.com, dakr@redhat.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 07:56:50PM +0200, Francois Dugast wrote:
> Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig           |   1 +
>  drivers/gpu/drm/xe/tests/xe_bo.c     |  17 +-
>  drivers/gpu/drm/xe/xe_bo.c           |  29 +--
>  drivers/gpu/drm/xe/xe_bo.h           |   6 +-
>  drivers/gpu/drm/xe/xe_bo_evict.c     |  24 ++-
>  drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
>  drivers/gpu/drm/xe/xe_exec.c         |  30 +--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  56 +-----
>  drivers/gpu/drm/xe/xe_vm.c           | 287 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_vm.h           |  29 +--
>  drivers/gpu/drm/xe/xe_vm_madvise.c   |  36 ++--
>  11 files changed, 232 insertions(+), 284 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index f6f3b491d162..bbcc9b64b776 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -8,6 +8,7 @@ config DRM_XE
>  	select SHMEM
>  	select TMPFS
>  	select DRM_BUDDY
> +	select DRM_EXEC
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	select DRM_SUBALLOC_HELPER
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 9bd381e5b7a6..78e43fd5c909 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -176,6 +176,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  		XE_BO_CREATE_VRAM_IF_DGFX(gt);
>  	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
>  	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int err, i;
>  
>  	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
> @@ -198,9 +199,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  			goto cleanup_bo;
>  		}
>  
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>  		err = xe_bo_pin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>  		if (err) {
>  			KUNIT_FAIL(test, "external bo pin err=%pe\n",
>  				   ERR_PTR(err));
> @@ -249,9 +250,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  					   ERR_PTR(err));
>  				goto cleanup_all;
>  			}
> -			xe_bo_lock(external, &ww, 0, false);
> +			xe_bo_lock(external, &exec, 0, false);
>  			err = xe_bo_validate(external, NULL, false);
> -			xe_bo_unlock(external, &ww);
> +			xe_bo_unlock(external, &exec);
>  			if (err) {
>  				KUNIT_FAIL(test, "external bo valid err=%pe\n",
>  					   ERR_PTR(err));
> @@ -259,18 +260,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  			}
>  		}
>  
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>  		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>  
>  		xe_bo_put(external);
>  		xe_bo_put(bo);
>  		continue;
>  
>  cleanup_all:
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>  		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>  cleanup_external:
>  		xe_bo_put(external);
>  cleanup_bo:
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3ab404e33fae..bb185093c5e0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>  #include <linux/dma-buf.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -1720,26 +1721,30 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
>  	       int num_resv, bool intr)
>  {
> -	struct ttm_validate_buffer tv_bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	int err;
>  
> -	XE_BUG_ON(!ww);
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> +					   num_resv);
> +		drm_exec_continue_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +	}
>  
> -	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;;
> -	list_add_tail(&tv_bo.head, &objs);
> +	return 0;
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
>  }
>  
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> +void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
>  {
> -	dma_resv_unlock(bo->ttm.base.resv);
> -	ww_acquire_fini(ww);
> +	drm_exec_fini(exec);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index effa9d0cf0f6..553d9270fffb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -74,6 +74,7 @@
>  
>  #define XE_BO_PROPS_INVALID	(-1)
>  
> +struct drm_exec;
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -141,10 +142,9 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
>  		dma_resv_assert_held((bo)->ttm.base.resv);
>  }
>  
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
>  	       int num_resv, bool intr);
> -
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
> +void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec);
>  
>  static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 6642c5f52009..46d9d9eb110c 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> +#include <drm/drm_exec.h>
> +
>  #include "xe_bo_evict.h"
>  
>  #include "xe_bo.h"
> @@ -27,7 +29,7 @@
>  int xe_bo_evict_all(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	struct xe_gt *gt;
>  	struct list_head still_in_list;
> @@ -62,9 +64,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &still_in_list);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		xe_bo_put(bo);
>  		if (ret) {
>  			spin_lock(&xe->pinned.lock);
> @@ -96,9 +98,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		xe_bo_put(bo);
>  		if (ret)
>  			return ret;
> @@ -123,7 +125,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>   */
>  int xe_bo_restore_kernel(struct xe_device *xe)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	int ret;
>  
> @@ -140,9 +142,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		if (ret) {
>  			xe_bo_put(bo);
>  			return ret;
> @@ -182,7 +184,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>   */
>  int xe_bo_restore_user(struct xe_device *xe)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	struct xe_gt *gt;
>  	struct list_head still_in_list;
> @@ -204,9 +206,9 @@ int xe_bo_restore_user(struct xe_device *xe)
>  		xe_bo_get(bo);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		xe_bo_put(bo);
>  		if (ret) {
>  			spin_lock(&xe->pinned.lock);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 06de3330211d..2ba34a8c9b66 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -11,7 +11,6 @@
>  #include <drm/drm_mm.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_device.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
>  struct xe_device;
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ea869f2452ef..b7f0a2f551a6 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -6,6 +6,7 @@
>  #include "xe_exec.h"
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
>  #include <drm/xe_drm.h>
>  
> @@ -91,21 +92,16 @@
>   *	Unlock all
>   */
>  
> -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> -			 struct ttm_validate_buffer tv_onstack[],
> -			 struct ttm_validate_buffer **tv,
> -			 struct list_head *objs)
> +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
>  {
>  	struct xe_vm *vm = e->vm;
>  	struct xe_vma *vma;
> -	LIST_HEAD(dups);
>  	int err;
>  
> -	*tv = NULL;
>  	if (xe_vm_no_dma_fences(e->vm))
>  		return 0;
>  
> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
>  	if (err)
>  		return err;
>  
> @@ -120,8 +116,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  
>  		err = xe_bo_validate(vma->bo, vm, false);
>  		if (err) {
> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> -			*tv = NULL;
> +			xe_vm_unlock_dma_resv(vm, exec);
>  			return err;
>  		}
>  	}
> @@ -129,14 +124,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  	return 0;
>  }
>  
> -static void xe_exec_end(struct xe_engine *e,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer *tv,
> -			struct ww_acquire_ctx *ww,
> -			struct list_head *objs)
> +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
>  {
>  	if (!xe_vm_no_dma_fences(e->vm))
> -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
> +		xe_vm_unlock_dma_resv(e->vm, exec);
>  }
>  
>  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -149,14 +140,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_engine *engine;
>  	struct xe_sync_entry *syncs = NULL;
>  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv = NULL;
>  	u32 i, num_syncs = 0;
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>  	bool write_locked;
>  	int err = 0;
>  
> @@ -267,7 +255,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto err_unlock_list;
>  	}
>  
> -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
> +	err = xe_exec_begin(engine, &exec);
>  	if (err)
>  		goto err_unlock_list;
>  
> @@ -373,7 +361,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		xe_sched_job_put(job);
>  err_engine_end:
> -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
> +	xe_exec_end(engine, &exec);
>  err_unlock_list:
>  	if (write_locked)
>  		up_write(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 1677640e1075..365a675f3663 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -8,8 +8,8 @@
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> @@ -83,11 +83,6 @@ static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
>  	return true;
>  }
>  
> -static bool only_needs_bo_lock(struct xe_bo *bo)
> -{
> -	return bo && bo->vm;
> -}
> -
>  static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>  {
>  	struct xe_vma *vma = NULL, lookup;
> @@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	struct xe_vm *vm;
>  	struct xe_vma *vma = NULL;
>  	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	bool write_locked;
>  	int ret = 0;
> @@ -171,20 +163,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	/* Lock VM and BOs dma-resv */
>  	bo = vma->bo;
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		if (bo) {
> -			tv_bo.bo = &bo->ttm;
> -			tv_bo.num_shared = xe->info.tile_count;
> -			list_add(&tv_bo.head, &objs);
> -		}
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	}
> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
> +
>  	if (ret)
>  		goto unlock_vm;
>  
> @@ -227,10 +207,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	vma->usm.gt_invalidated &= ~BIT(gt->info.id);
>  
>  unlock_dma_resv:
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>  unlock_vm:
>  	if (!ret)
>  		vm->usm.last_fault_vma = vma;
> @@ -501,10 +478,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	struct xe_vm *vm;
>  	struct xe_vma *vma;
>  	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int ret = 0;
>  
>  	/* We only support ACC_TRIGGER at the moment */
> @@ -537,28 +511,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  
>  	/* Lock VM and BOs dma-resv */
>  	bo = vma->bo;
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		tv_bo.bo = &bo->ttm;
> -		tv_bo.num_shared = xe->info.tile_count;
> -		list_add(&tv_bo.head, &objs);
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	}
> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>  	if (ret)
>  		goto unlock_vm;
>  
>  	/* Migrate to VRAM, move should invalidate the VMA first */
>  	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
>  
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>  unlock_vm:
>  	up_read(&vm->lock);
>  	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..ba408ac96be5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,7 +7,7 @@
>  
>  #include <linux/dma-fence-array.h>
>  
> -#include <drm/ttm/ttm_execbuf_util.h>
> +#include <drm/drm_exec.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  #include <linux/kthread.h>
> @@ -261,10 +261,10 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  {
>  	struct xe_engine *e;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int err;
>  
> -	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
> +	err = xe_bo_lock(bo, &exec, vm->preempt.num_engines, true);
>  	if (err)
>  		return err;
>  
> @@ -275,7 +275,7 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  					   DMA_RESV_USAGE_BOOKKEEP);
>  		}
>  
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>  	return 0;
>  }
>  
> @@ -317,11 +317,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  
>  int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  {
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>  	struct dma_fence *pfence;
> +	struct drm_exec exec;
>  	int err;
>  	bool wait;
>  
> @@ -329,7 +326,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  
>  	down_write(&vm->lock);
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -363,7 +360,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm, &exec);
>  out_unlock_outer:
>  	up_write(&vm->lock);
>  
> @@ -389,72 +386,57 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>  		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
>  
> +static struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
> +{
> +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> +
> +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> +	return &vm->pt_root[idx]->bo->ttm.base;
> +}
> +
> +
>  /**
>   * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>   * objects of the vm's external buffer objects.
>   * @vm: The vm.
> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> - * ttm_validate_buffers used for locking.
> - * @tv: Pointer to a pointer that on output contains the actual storage used.
> - * @objs: List head for the buffer objects locked.
> + * @exec: Pointer to a struct drm_exec execution context.
>   * @intr: Whether to lock interruptible.
>   * @num_shared: Number of dma-fence slots to reserve in the locked objects.
>   *
>   * Locks the vm dma-resv objects and all the dma-resv objects of the
> - * buffer objects on the vm external object list. The TTM utilities require
> - * a list of struct ttm_validate_buffers pointing to the actual buffer
> - * objects to lock. Storage for those struct ttm_validate_buffers should
> - * be provided in @tv_onstack, and is typically reserved on the stack
> - * of the caller. If the size of @tv_onstack isn't sufficient, then
> - * storage will be allocated internally using kvmalloc().
> + * buffer objects on the vm external object list using helpers provided
> + * by drm_exec.
>   *
>   * The function performs deadlock handling internally, and after a
>   * successful return the ww locking transaction should be considered
>   * sealed.
>   *
> - * Return: 0 on success, Negative error code on error. In particular if
> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
> - * of error, any locking performed has been reverted.
> + * Return: 0 on success, Negative error code on error.
>   */
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> -			unsigned int num_shared)
> -{
> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> +			bool intr, unsigned int num_shared)
> +{
>  	struct xe_vma *vma, *next;
> -	LIST_HEAD(dups);
> +	struct drm_gem_object *obj;
>  	int err;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	if (vm->extobj.entries < XE_ONSTACK_TV) {
> -		tv_vm = tv_onstack;
> -	} else {
> -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
> -				       GFP_KERNEL);
> -		if (!tv_vm)
> -			return -ENOMEM;
> -	}
> -	tv_bo = tv_vm + 1;
> -
> -	INIT_LIST_HEAD(objs);
> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> -		tv_bo->num_shared = num_shared;
> -		tv_bo->bo = &vma->bo->ttm;
> -
> -		list_add_tail(&tv_bo->head, objs);
> -		tv_bo++;
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);

s/xe_vm_ttm_bo/xe_vm_gem

We should be able to delete xe_vm_ttm_bo too.

> +		drm_exec_continue_on_contention(exec);
> +		if (unlikely(err) && err != -EALREADY)
> +			goto out_err;
> +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> +			obj = &vma->bo->ttm.base;
> +			err = drm_exec_prepare_obj(exec, obj, num_shared);
> +			drm_exec_break_on_contention(exec);
> +			if (unlikely(err) && err != -EALREADY)
> +				goto out_err;
> +		}
>  	}
> -	tv_vm->num_shared = num_shared;
> -	tv_vm->bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm->head, objs);
> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> -	if (err)
> -		goto out_err;
>  
>  	spin_lock(&vm->notifier.list_lock);
>  	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> @@ -466,14 +448,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  			list_move_tail(&vma->rebind_link, &vm->rebind_list);
>  	}
>  	spin_unlock(&vm->notifier.list_lock);
> -
> -	*tv = tv_vm;
>  	return 0;
>  
>  out_err:
> -	if (tv_vm != tv_onstack)
> -		kvfree(tv_vm);
> -
> +	drm_exec_fini(exec);
>  	return err;
>  }
>  
> @@ -481,20 +459,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
>   * xe_vm_lock_dma_resv()
>   * @vm: The vm.
> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> - * @ww: The ww_acquire_context used for locking.
> - * @objs: The list returned from xe_vm_lock_dma_resv().
> + * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
>   *
>   * Unlocks the reservation objects and frees any memory allocated by
>   * xe_vm_lock_dma_resv().
>   */
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs)
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
>  {
> +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
> +	unsigned long index;
> +
>  	/*
>  	 * Nothing should've been able to enter the list while we were locked,
>  	 * since we've held the dma-resvs of all the vm's external objects,
> @@ -503,20 +477,22 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  	 */
>  	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
>  
> -	ttm_eu_backoff_reservation(ww, objs);
> -	if (tv && tv != tv_onstack)
> -		kvfree(tv);
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +		if (obj != skip)
> +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	}
> +	drm_exec_fini(exec);
>  }
>  
> +
>  static void preempt_rebind_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>  	struct xe_vma *vma;
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>  	struct dma_fence *rebind_fence;
> +	struct drm_exec exec;
>  	unsigned int fence_count = 0;
>  	LIST_HEAD(preempt_fences);
>  	int err;
> @@ -556,8 +532,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  			goto out_unlock_outer;
>  	}
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_engines);
> +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -631,7 +606,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm, &exec);
>  out_unlock_outer:
>  	if (err == -EAGAIN) {
>  		trace_xe_vm_rebind_worker_retry(vm);
> @@ -979,27 +954,16 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
> -	struct ttm_validate_buffer tv[2];
> -	struct ww_acquire_ctx ww;
> +	struct xe_vm *vm = vma->vm;
>  	struct xe_bo *bo = vma->bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct drm_exec exec;
>  	int err;
>  
> -	memset(tv, 0, sizeof(tv));
> -	tv[0].bo = xe_vm_ttm_bo(vma->vm);
> -	list_add(&tv[0].head, &objs);
> -
> -	if (bo) {
> -		tv[1].bo = &xe_bo_get(bo)->ttm;
> -		list_add(&tv[1].head, &objs);
> -	}
> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
>  	XE_WARN_ON(err);
> -
>  	xe_vma_destroy(vma, NULL);
> +	xe_vm_bo_unlock(vm, bo, &exec, false);
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
>  	if (bo)
>  		xe_bo_put(bo);
>  }
> @@ -2008,12 +1972,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>  	return &vm->pt_root[idx]->bo->ttm;
>  }
>  
> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> -{
> -	tv->num_shared = 1;
> -	tv->bo = xe_vm_ttm_bo(vm);
> -}
> -
>  static bool is_map_op(u32 op)
>  {
>  	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
> @@ -2032,11 +1990,9 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>  			 struct xe_sync_entry *syncs, u32 num_syncs,
>  			 struct async_op_fence *afence)
>  {
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *vbo;
> +	struct drm_exec exec;
> +	struct ttm_buffer_object *obj;

Why do we need ttm_buffer_object? It looks unused to me.

>  	int err, i;
>  
>  	lockdep_assert_held(&vm->lock);
> @@ -2053,8 +2009,6 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>  		return 0;
>  	}
>  
> -	xe_vm_tv_populate(vm, &tv_vm);
> -	list_add_tail(&tv_vm.head, &objs);
>  	vbo = vma->bo;
>  	if (vbo) {
>  		/*
> @@ -2063,29 +2017,30 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>  		 * take a reference here.
>  		 */
>  		xe_bo_get(vbo);
> -
> -		tv_bo.bo = &vbo->ttm;
> -		tv_bo.num_shared = 1;
> -		list_add(&tv_bo.head, &objs);
>  	}
> +	obj = xe_vm_ttm_bo(vm);
>

We assign this but again looks unused.
 
>  again:
> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> -	if (!err) {
> -		err = __vm_bind_ioctl(vm, vma, e, bo,
> -				      bind_op->op, bind_op->region, syncs,
> -				      num_syncs, afence);
> -		ttm_eu_backoff_reservation(&ww, &objs);
> -		if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> -			lockdep_assert_held_write(&vm->lock);
> -			err = xe_vma_userptr_pin_pages(vma);
> -			if (!err)
> -				goto again;
> -		}
> +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
> +	if (err)
> +		goto error;
> +	err = __vm_bind_ioctl(vm, vma, e, bo,
> +			      bind_op->op, bind_op->region, syncs,
> +			      num_syncs, afence);
> +	xe_vm_bo_unlock(vm, vbo, &exec, false);
> +	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> +		lockdep_assert_held_write(&vm->lock);
> +		err = xe_vma_userptr_pin_pages(vma);
> +		if (!err)
> +			goto again;
>  	}
>  	xe_bo_put(vbo);
>  
>  	return err;
> +
> +error:
> +	xe_bo_put(vbo);
> +	return err;
>  }
>  
>  struct async_op {
> @@ -2450,18 +2405,18 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
>  static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
>  				 struct xe_vma *ignore)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_vma *vma;
>  	bool ret = false;
>  
> -	xe_bo_lock(bo, &ww, 0, false);
> +	xe_bo_lock(bo, &exec, 0, false);
>  	list_for_each_entry(vma, &bo->vmas, bo_link) {
>  		if (vma != ignore && vma->vm == vm && !vma->destroyed) {
>  			ret = true;
>  			break;
>  		}
>  	}
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>  
>  	return ret;
>  }
> @@ -2582,10 +2537,10 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  	}
>  
>  	if (first->start != lookup->start) {
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		if (first->bo)
> -			err = xe_bo_lock(first->bo, &ww, 0, true);
> +			err = xe_bo_lock(first->bo, &exec, 0, true);
>  		if (err)
>  			goto unwind;
>  		new_first = xe_vma_create(first->vm, first->bo,
> @@ -2596,7 +2551,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  					  (first->pte_flags & PTE_READ_ONLY),
>  					  first->gt_mask);
>  		if (first->bo)
> -			xe_bo_unlock(first->bo, &ww);
> +			xe_bo_unlock(first->bo, &exec);
>  		if (!new_first) {
>  			err = -ENOMEM;
>  			goto unwind;
> @@ -2612,11 +2567,11 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  	}
>  
>  	if (last->end != lookup->end) {
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  		u64 chunk = lookup->end + 1 - last->start;
>  
>  		if (last->bo)
> -			err = xe_bo_lock(last->bo, &ww, 0, true);
> +			err = xe_bo_lock(last->bo, &exec, 0, true);
>  		if (err)
>  			goto unwind;
>  		new_last = xe_vma_create(last->vm, last->bo,
> @@ -2627,7 +2582,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  					 (last->pte_flags & PTE_READ_ONLY),
>  					 last->gt_mask);
>  		if (last->bo)
> -			xe_bo_unlock(last->bo, &ww);
> +			xe_bo_unlock(last->bo, &exec);
>  		if (!new_last) {
>  			err = -ENOMEM;
>  			goto unwind;
> @@ -2763,7 +2718,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
>  					       u64 addr, u64 range, u32 op,
>  					       u64 gt_mask, u32 region)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_vma *vma, lookup;
>  	int err;
>  
> @@ -2776,14 +2731,14 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
>  	case XE_VM_BIND_OP_MAP:
>  		XE_BUG_ON(!bo);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return ERR_PTR(err);
>  		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
>  				    addr + range - 1,
>  				    op & XE_VM_BIND_FLAG_READONLY,
>  				    gt_mask);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		if (!vma)
>  			return ERR_PTR(-ENOMEM);
>  
> @@ -2808,13 +2763,13 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
>  	case XE_VM_BIND_OP_UNMAP_ALL:
>  		XE_BUG_ON(!bo);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return ERR_PTR(err);
>  		vma = vm_unbind_all_lookup_vmas(vm, bo);
>  		if (!vma)
>  			vma = ERR_PTR(-EINVAL);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		break;
>  	case XE_VM_BIND_OP_MAP_USERPTR:
>  		XE_BUG_ON(bo);
> @@ -3291,17 +3246,24 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  	       int num_resv, bool intr)

This was different args than xe_bo_lock, these functions should have the
same arguments. Probably this function is better as drm_exec_init does a
kmalloc which isn't needed by xe_vm_lock/xe_bo_lock as we know are
locking just 1 dma-resv.

>  {
> -	struct ttm_validate_buffer tv_vm;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct dma_resv *obj;
> +	int ret;
>  
>  	XE_BUG_ON(!ww);
>  
> -	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> -	list_add_tail(&tv_vm.head, &objs);
> +	obj = xe_vm_ttm_bo(vm)->base.resv;
> +	ww_acquire_init(ww, &reservation_ww_class);
> +
> +	if (intr)
> +		ret = dma_resv_lock_interruptible(obj, ww);
> +	else
> +		ret = dma_resv_lock(obj, ww);
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	num_resv = max(num_resv, 1);
> +	return dma_resv_reserve_fences(obj, num_resv);

You need to check for failure here and unlock if this fails.

Matt

>  }
>  
>  void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> @@ -3310,6 +3272,43 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
>  	ww_acquire_fini(ww);
>  }
>  
> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		  int num_resv, bool intr)
> +{
> +	int err;
> +
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
> +					   num_resv);
> +		drm_exec_continue_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +
> +		if (bo && !bo->vm) {
> +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> +						   num_resv);
> +			drm_exec_continue_on_contention(exec);
> +			if (err && err != -EALREADY)
> +				goto out_err;
> +		}
> +	}
> +
> +	return 0;
> +
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
> +}
> +
> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		     bool lru_update)
> +{
> +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	drm_exec_fini(exec);
> +}
> +
>  /**
>   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>   * @vma: VMA to invalidate
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 748dc16ebed9..8f7ba4fcea6a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_VM_H_
>  #define _XE_VM_H_
>  
> +#include <drm/drm_exec.h>
> +
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
> @@ -40,9 +42,13 @@ static inline void xe_vm_put(struct xe_vm *vm)
>  
>  int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  	       int num_resv, bool intr);
> -
>  void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
>  
> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		  int num_resv, bool intr);
> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		     bool lru_update);
> +
>  static inline bool xe_vm_is_closed(struct xe_vm *vm)
>  {
>  	/* Only guaranteed not to change when vm->resv is held */
> @@ -124,23 +130,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>  
>  int xe_vma_userptr_check_repin(struct xe_vma *vma);
>  
> -/*
> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> - */
> -#define XE_ONSTACK_TV 20
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> -			unsigned int num_shared);
> -
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs);
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> +			bool intr, unsigned int num_shared);
> +
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
>  
>  void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>  			     enum dma_resv_usage usage);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 29815852985a..6fe1316ea229 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -28,16 +28,16 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = vmas[i]->bo;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_mem_class = value;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -53,16 +53,16 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = vmas[i]->bo;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_gt = value;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -89,17 +89,17 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = vmas[i]->bo;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_mem_class = mem_class;
>  		bo->props.preferred_gt = gt_id;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -112,13 +112,13 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = vmas[i]->bo;
>  		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
>  			return -EINVAL;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.cpu_atomic = !!value;
> @@ -130,7 +130,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>  		 */
>  		if (bo->props.cpu_atomic)
>  			ttm_bo_unmap_virtual(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -143,18 +143,18 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = vmas[i]->bo;
>  		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
>  				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
>  			return -EINVAL;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.device_atomic = !!value;
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -174,16 +174,16 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = vmas[i]->bo;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->ttm.priority = value;
>  		ttm_bo_move_to_lru_tail(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> -- 
> 2.25.1
> 
