Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3345B5B32F4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3282010EC34;
	Fri,  9 Sep 2022 09:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7510EC34;
 Fri,  9 Sep 2022 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662714653; x=1694250653;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CK7lxHgBXbASGx5hV8j//aKK75B+1V6K33Vc0X3FDyg=;
 b=gip1itTbSkONIo6UNp+SwuQ8lEV8uLrGP0B1wfAGgcmKgC8m9mYtDzFY
 iqEFRUCtXc/7qA2cbTXqsAD0nR8vF1OvV7+MZKFTNAF7SHodIvydopGzn
 9JR5XKO/JTSpn1C8/lYd0v9YTLEiQJUmojWpHa/pIWIE1lLZIJljDck3I
 gP/fP1oq9MNgoSUApvwQXGDNNkrJIXUX3lS53oi0iGJArGILdpeD+rWU/
 2Rr5UL0AEEfgKkayWA+UVDoxMdCJIncR6TLV6ZhQL+lFQeMGponbrWdMv
 T+4g0v1EE0au1hcAebsFo5xl5oK+J29o2JrR7jWH5JTJA9gMN9kQRF0rl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277166617"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="277166617"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 02:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="610999403"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 09 Sep 2022 02:10:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:10:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 02:10:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 02:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLEmjNoazgooz49hIP4emammHS2XBcYrSEljErj/5oQETyTsGQD8FdCBe9aVv9aND6LwhjStvEyTRE6t0pXSdXkjnjOjQd+Wv9MIFQm55ctkY3PeoBU/cS6bA4rjljOAMXYFLeKDW+cNiWJXT2OWSJDA3tXlxcDzC0a6lGmIgZ3I1FiueBlsFNyAUUfNpip43dPosNPKL29ttVwIjigC6D6KUT4LV98oKZ19X+1g7sEPDkd4BK3cZzLwxL3nrWXjV3eXrgorMzA8cBX8F932TlyAlYQ+vcU/CJ76t+mGwgqhOnVtjr/I6l1PqYfEF2FknOZaM84e3o5kxm8GghVQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJ4TFmEwg8YMiV/SR+h6jtyORhLz0Fwo05VTtBpqgaI=;
 b=FGGsqtOnLImrnn5QJciqgJRctbo5jgSIKSsWtmjcBxUNZzXwR4KITOXedHeH1j+LBbJxDlYA3Tp8ajRTdJzzQMHw2VOd5HBpnQduegZdHTcE0p6jpeVd7w1My3fwsfK0QYlg9FsJFG7dXwEKeIZUwm8I6Sjt5L9/Fo7L93uncUS9Zy34YUGrPvEbi9S7I0fUC/udrVQamUnAzre5qTPFZmPmDO2fcPPS4aCQu/ssQXF1GH4gghYUu7mbTZ1t1dOnqfw8JBqKYD74BUkj3AzcxDjsEVKLGA0bafAaEJntNe2RFQ6HutaDrgqU6fh7k0HSXHTXLmSAXOjNoxi92KCKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 09:10:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 09:10:45 +0000
Date: Fri, 9 Sep 2022 05:10:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v3 32/37] docs: gpu: i915.rst: add the
 remaining kernel-doc markup files
Message-ID: <YxsDEP30aZmyBvIo@intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <7ed6d74b75061fb2800e5a59f5282b224bd0621a.1662708705.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7ed6d74b75061fb2800e5a59f5282b224bd0621a.1662708705.git.mchehab@kernel.org>
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfa57bc6-5c35-44cb-4d76-08da92432dc4
X-MS-TrafficTypeDiagnostic: DM6PR11MB4739:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DaVK+yh9u3F8lugZo2QrLu+VlNiufa5xCeC3y3bU9fM+mJW6fXgthGJyBMn1ZJVDd+7+VtcFw2ldkSJKBYhqgrvbkApLXg6UhxJJLsH671PKTyPZc+n/RG5lwT0xlGZci/AWUik2v1VhbwK8WlWtlLrKF0kTZCReLUYfvzbJM3/S7Yv58+FK5vE4Y0p/XHG49u23fJ0mEKLm9vrC0e7HgXtmzcjxwgVKQ+LFXoMXe9vT5W4EdujDbaA8pk8G1LKl9AYagMPqA67XkEMFxTkIbQn5EjBkQg1J3A0UKAIAwgXOx8rQXRRzX5IO9/h4KZQLw51kkTlN4azyRaCSa9jEKc5t7XFNKnytkNpGRymiNLSRW20GmmKnjQQKHBVfVtCjozoaIT8mXq35XJTDGVfJyCmcilShfpQOxgdlqK7m/s+smkfH2ycS++i99sywZBcGcoPBpbPz3v/2kEE+8/pEbIfUj8V3pl91nNGsSUdfacrK3h2KDsmlSXTr2xMfHT/dSaqKwtgNo2E/TS+CO9khb4t5XJOjpA9OdRPg7lMVnx/suUKEMu041uL4jUws5EI0FNeMzGDY4PP0IyUzrJCJfdiTTY6HUwhqKLU+vPApsIKf7PyscugEcliM+mGEgnFKOpNaq3YkNT6x7Omi0XqRm0p932REyp9kc2wqu5MDRJe0uuiDOK/Te764aJk0DM6YsdHdTarYkE3mXW0+g2i/UOlQFzDx1lD9+EIse0Ja4bQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(44832011)(7416002)(2906002)(8936002)(6506007)(6512007)(5660300002)(83380400001)(26005)(86362001)(2616005)(186003)(38100700002)(82960400001)(8676002)(41300700001)(36756003)(66476007)(478600001)(66946007)(966005)(4326008)(66556008)(54906003)(316002)(6916009)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+1xBlUvVSOVXybxMti3uD42QjagQOisw0fmox6oS4ocwrwwKTn5vkH4XqlqN?=
 =?us-ascii?Q?hZRxj6vjPLf7UzfQ8VdylPVN3zPr5PkdREtSYLmSJsB7dNUtcgXBqMIDTvtY?=
 =?us-ascii?Q?auMacT+XG+DiXxkLR2kXmnB29nybUvbo27S/fnqK8dSv21SzengMMt6zRk0b?=
 =?us-ascii?Q?v7b6AhCdgucVd6uulGSmIAw9fpN7aTIQyClwjVYj6AvH00XqdslqwKCrkBCN?=
 =?us-ascii?Q?qqYp5Yli2DnJwfH0Fa41rUjrsyzp7NuHL6x/X65k85CqK0UWgg32g+B3Uaj3?=
 =?us-ascii?Q?idekwnMeHIThHLxnftJlToUNjuqAQpHEFrvvvM8Tc7b0bjS/1pbA065RZIjj?=
 =?us-ascii?Q?Wiy8wh4j0J8sv0WNOw6CRQVqt/lKAHzBeFlKi7TZEMD9WTWyEgf35Q+y2d1Q?=
 =?us-ascii?Q?pVV7+uhJJYJ34A6mE+5rdByifcNmMM6H/W1RAd+Brpa5xioFMp9NgRztKXd8?=
 =?us-ascii?Q?hJGxw7uCeMP6ypdh65CA7msC1EgzwTsqJIKRBq8LtvL7sHYA1Crao6SBd14l?=
 =?us-ascii?Q?VFaYtK8YmRIxhf8L593v/p8NHyNmqN15LR7aVZaLq9eDDQe/mcrYoiq4L/07?=
 =?us-ascii?Q?eLf5Kb4sCPn7G1WniqUuqNQWC7TIVxssrmId900SVDeEC5h321jk0RwEho9k?=
 =?us-ascii?Q?xCsIIEZBVdBpP7dTGM0aHOooRD+PoRDsqZa/wxaFnIIK7E0Vo2gwlZvWSr4k?=
 =?us-ascii?Q?1lDB3DYQ+UVm50vGcgixq4mCql+xZpfL9tw4ZNAKKAnltdpSZSfB4SeWRocN?=
 =?us-ascii?Q?2ZDlO0NCS8H4ymlLpZq5tHoOF2fxgZnCmaO/cN6dMtGW6TJVv8QNMlMiRfng?=
 =?us-ascii?Q?4NFj8J9b1bGlVbxxgbODSNct5iOVPbIIijYpxbW8lxKmrV19p6bI00talMC0?=
 =?us-ascii?Q?ZAQcVAHMGWRrhhRAixC+QR5WuF5VRJ6IdUbSSUvi34sJkDfQrDTHOqzr6pUF?=
 =?us-ascii?Q?4ndWinOvR5mFg8LpDg0/+cDwZv86tBADLSLxIRxcGHs0xj17L+okTfeyWx0e?=
 =?us-ascii?Q?YZrlWTM1nyNwPq7TUloluLDokZGLE+EALQhAWyfuKvLm5Y1SifUWbejUJ4E+?=
 =?us-ascii?Q?HrCdXXxObWx9otmscmRVEp2pF6AdEpr2vvPYXmBWBs64p+MA7IXbMIkwf14L?=
 =?us-ascii?Q?jnYVTDJpWtzsbAODysakXhzqA59EuJZYiVLGVB9Z5Yi4f94sP0KrDeOCi6ok?=
 =?us-ascii?Q?NAmqvmRLgyN0W6Q56MDQmLCbu0gZxjbCz0Uy0rZImZqpqdCujBHNaZrkQ0+s?=
 =?us-ascii?Q?bQ7qLnVTieTu/fTgjJJGxJ+vT+8rgsBDboLuGTGe2jv0yzO7UUQYuoE0AQ2T?=
 =?us-ascii?Q?3hPxu7W9oHVDf8wQ/EM4MzOP4f3iMFpoDYxPdGi9FZw03wgeOWkJgxybVsKN?=
 =?us-ascii?Q?dVh7Iq0GZ/EGcvdFka34lN7zOvh7i8uOzR+Bc0oJv29uFLbBVsRr+PK+Nkfh?=
 =?us-ascii?Q?2OgUUqReCx49+EgHguxtldiBvky6Xw/vwxD3hHrP8yYrH7Fjxctny/d9VzLs?=
 =?us-ascii?Q?89uQO2aGZznMBY31yjqrlm0oT4IqDCZemssybyLalBQGlz8xYP1aigVNf8oN?=
 =?us-ascii?Q?edNxgBQ36FI2Gw+tDLdBnY0E7yYDTsYKfqqp0WVo708rLMnJFqeZ2OPnAw8G?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa57bc6-5c35-44cb-4d76-08da92432dc4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:10:45.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3N54i9w/fe1TK563ILU/41bAIxPdvrRPw6c6kTMW14fHd2k7yffy2dEXY24RTr2P1it8ehThDoj5jo09GxZwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 09:34:39AM +0200, Mauro Carvalho Chehab wrote:
> There are other files with kernel-doc markups:
> 
> 	$ git grep -l "/\*\*" $(git ls-files|grep drivers/gpu/drm/i915/) >kernel-doc-files
> 	$ for i in $(cat kernel-doc-files); do if [ "$(git grep $i Documentation/)" == "" ]; then echo "$i"; fi; done >aaa
> 
> Add them to i915.rst as well.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 85 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 545fe630557a..7f5cd01ed398 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -13,6 +13,11 @@ Core Driver Infrastructure
>  This section covers core driver infrastructure used by both the display
>  and the GEM parts of the driver.
>  
> +Core driver
> +-----------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_driver.c
> +
>  Runtime Power Management
>  ------------------------
>  
> @@ -29,6 +34,8 @@ Runtime Power Management
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/intel_pm.c
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_wakeref.h
> +
>  Interrupt Handling
>  ------------------
>  
> @@ -44,8 +51,25 @@ Interrupt Handling
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
>     :functions: intel_runtime_pm_enable_interrupts
>  
> -Intel GVT-g Guest Support(vGPU)
> --------------------------------
> +Memory Handling
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma_resource.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma_resource.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_mm.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_memory_region.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_memcpy.c
> +
> +Intel GVT-g Guest Support (vGPU)
> +--------------------------------
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
>     :doc: Intel GVT-g guest support
> @@ -109,6 +133,55 @@ Workarounds
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_workarounds.c
>     :doc: Hardware workarounds
>  
> +Scatterlist handling
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_scatterlist.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_scatterlist.c
> +
> +i915 request
> +------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_request.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_request.c
> +
> +Others
> +------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_ioc32.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_gpu_error.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_active.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_deps.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_deps.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_device_info.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_params.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_sw_fence_work.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_syncmap.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_pcode.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_reg_defs.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.h
> +
> +
> +Protected Xe Path (PXP)
> +-----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +
>  Display Hardware Handling
>  =========================
>  
> @@ -615,6 +688,12 @@ Protected Objects
>  Table Manager (TTM)
>  -------------------
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_region_ttm.c
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> @@ -624,6 +703,8 @@ Table Manager (TTM)
>  Graphics Execution Manager (GEM)
>  --------------------------------
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_gem.c
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c
> -- 
> 2.37.3
> 
