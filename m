Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E17A1DC76
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 20:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1096410E5AA;
	Mon, 27 Jan 2025 19:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPKjGi8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118110E363;
 Mon, 27 Jan 2025 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738004982; x=1769540982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f3zOoiUaLYcNY5L7LY9dbZfQDdWV+9F/wlzkcbujQfc=;
 b=gPKjGi8XCR3+OU0qTZQEH0S74MnMCmG3iLNyBz0/PqBXg1OL/KI8vqzh
 ljfyzyTfrXQqPwmqTy69xPmglzwH7ivTUL/Ifol/DFKr4n4xVLrKW0QaD
 ItzS/3CgximQjaynFId6rCO87oIgplH/0A1ETXQg7IFbz0w4BDmxS5iuE
 tGLCJP3eNMVZ1rXXmaV8dMDDVc+6np9LP6uu6LW+IgVmtLdmLx4C8YDWC
 bxaemn6QTx8S3p/6erJDsbpHyh4geCJUFCKWBfR+eF9O88zBk3fi9O1fo
 l+fC4MqF8Q3W2+HnpQ4uFw4oxMYUlV1eoyvtuWgxQinijozcYo62rnxrV w==;
X-CSE-ConnectionGUID: y8jdyz4DRx+XJjwN+n9guQ==
X-CSE-MsgGUID: AtgiX0cGRrm1FDpjVkqunw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49135076"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="49135076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 11:09:42 -0800
X-CSE-ConnectionGUID: nM+EIdlOSHGBwF1kDBBP7A==
X-CSE-MsgGUID: Fw7oi+JMTL28zmNCMfjKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131818607"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 11:09:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 11:09:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 11:09:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 11:09:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wk/70/pr5q3JbLszyv/67T5U4DBUxcxuF8qDptgbfMUQ9q4GuRwPzvKfaGDQUNlZVERjzBEOF28z+pqUnzwZzzqwYgsG1PaU6kVekBQuU/3R5hnefcmIPRhXamzNBeEcqeMLAQsrTrb/H8mWQtQVnScy28GwJvXfvH546tqZatUi4BPvcYzkQx4hvjNqp1uZ48lw4h+Eq2JUxNTNCJii+u8nn/19HZrgZbj9lVo6Kj5ezzWj6e4jfq6sZE3CvvMbp4X9GY3jmB+pTbdSDGkdcNO0FadPXvdC/8SaVbXNRQanUFXFO+c1tGF75+DOATVgffmXAVsOii7E+1D5PTQwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg5O/6SNbPwb/CRm78TMfQVWj0YQ6RAcMmx5sxIiCdw=;
 b=yccfyYRHuCd4rQ0WaN61N2TDcPPqymXdOQdkQe5HzWxSYZtfJ5USilqoCtRho1NR0Qp8t5PGbXNcqVCMKWBMwcfQ9RWLlmmHYJH+1Zpfkb5qqR+KV41Sd9lBdrvBhIsO00I1WIJmUWLPLVNC42WgdfDJcLl+pIP0k3r6GkU/NUJok3DkpqXh6vWPbnAWGplNlR+yxgFrH6JSDISITKcbWpLpVjAf/WHhlPA9TO+a2rCmL7iD6EPRwMr0944P8nuVHRTwVLaWaD1EoPVy32DDmoreTNGRpcMC+54rGMepCHwvV1QyJX4uNa4gAccVbAxAuZ55ZlYqTf9ifYgDOjQ5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 19:09:38 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 19:09:38 +0000
Date: Mon, 27 Jan 2025 14:09:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <linux@treblig.org>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915: Remove unused live_context_for_engine
Message-ID: <Z5fZ7h0lZAoyPUE5@intel.com>
References: <20250125003846.228514-1-linux@treblig.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250125003846.228514-1-linux@treblig.org>
X-ClientProxiedBy: MW4PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:303:b8::33) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3ac65c-9648-48b5-dba6-08dd3f06253e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YuYwnMD2fLj/fXh+tMDHYzW/nDBCWLNrkeNLJ3LrGt5ZHyxHSb/KnIBookWy?=
 =?us-ascii?Q?oow2t1em6l0A1/IkWngJ9CZ45KzfyGcFDDKFONWqIocR8RA5g74sN0JeJNCM?=
 =?us-ascii?Q?nQSIwfXB2qopbc2at3rix2NxenWC+tvpKY9Db+SdCbxx8yHnvzJh71MD8741?=
 =?us-ascii?Q?lrgiglDU9IDl7BV8dSaOf7OHhLvf+gCqeYdGXUYm9tJ6Mp6R85SyO/BVwj/b?=
 =?us-ascii?Q?kLP1aYzm0KaabM47KMoBg4DcHjf59rUulXvq2pFj8xDpTmImzKsJChT4ZB5l?=
 =?us-ascii?Q?jI1ep8dEskoVIguNVJgSg0G657QKR1yRjtR/N61zDJQCb/bjsjRzl0cRTGXi?=
 =?us-ascii?Q?AlEfJoWI0SwIWbkyazgymb3TwQOdFrC9ImZr+su2exiC8HmiscL1ICap5V1v?=
 =?us-ascii?Q?QnmFz9N6bib4v0FOn4nwxfVGGoleQQffySxFEZ5Pjb7+ji+QQ7OPD3V27Awt?=
 =?us-ascii?Q?qUO/GSlSRnmOa9Me7LyT1bHyh8HP7jWSICRfpznAK3Wyhw+nkQJox4dkN13v?=
 =?us-ascii?Q?LFex+yRGJzD2JxfkKIzAdpG5RMVex39sxVClTAXRc8eEXrvoymismuwVNTYc?=
 =?us-ascii?Q?s67Xf9p4ZajCyjYr0gVWikDEh89JdNfNe3dk3UBAjSX0ztf2zUX8jfLtJHeh?=
 =?us-ascii?Q?lDePdTZSbimnsKCbiAAjdawewsLKcvBuS9A57+f7yrSDIEJNN85M28e+9vjJ?=
 =?us-ascii?Q?eivOTaxVz0AgTXmobtDemo+9ivVAsfsrxv0emwlaXcFYfcN1O+aEX4XTOcp+?=
 =?us-ascii?Q?cem+ebmRdnU5nSbsjrlowbBkGZ/eTRa2t/k3EOe6JouBk83bsf6JSjqIwPgg?=
 =?us-ascii?Q?VyzTLpXBZTarCUvQZ8ktPYHZVOia1tZnnT1dKO6DOmMJli9ti47yTf0EjrTp?=
 =?us-ascii?Q?3oW8//l7Ki3Wz0eWXAR7fFfKC70ZsN7VQx8uA+zDo6UMV5j5b+kexnLFMr3a?=
 =?us-ascii?Q?LIDMeKVPVbXJxQDI4JJ/EZCl88BI9N37cDsR6i28Vk8eGQPOFoVdLje52Jh1?=
 =?us-ascii?Q?u912N8eSI9J+AMXV0tfamG9S5QGilP46SYX+naUSegZoJYAVk5N/iJIoMLT0?=
 =?us-ascii?Q?I0jxd+thr8tBHckM+eB+WcuCjsSNM+TfMIzWGuDhLm9M3vwaMOBuEzEVwLgD?=
 =?us-ascii?Q?pzTzoc9rHs4gZAg1lLbokaDxr2qeQteJUskH23q+SIcLKsAOWNyoQ2Z/IGGP?=
 =?us-ascii?Q?/3Lu+bFvdvzDzleIvQ4mV/PUXR9EokTl/MdaUyyEp+SkqRcW7qJQb9cRbCXv?=
 =?us-ascii?Q?QzYOTf4RHjZUSEN7nhfnDQEhtpgYDXt+wngXgY4mX4m4hSd0GTdMjIkDQr7A?=
 =?us-ascii?Q?m7Jy4jfW2qLI+2jDJON5lSZZJVzCoq9JvadZPtqJmqJ1fyffOmFh1cGn6TqU?=
 =?us-ascii?Q?KGLyt0i5QuxuhM7O3a9+/bou7Ueq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GLPg1VluQvnniMSEUTMxp5cGzNqCuPJsEY6jsP1YX7fdy8kWnAUZnffFRTPy?=
 =?us-ascii?Q?RAm0TpW1lL+0izzTWDb+cxt65dL93PzlbipnzTpyjvp9MrLrjsrwHh6lHDO9?=
 =?us-ascii?Q?q3j03WIWS/6HyeUMipYPFSwYuPM2KM/8gy371oT1h7Qo9AEHZoIxGcgAXmRG?=
 =?us-ascii?Q?eSSx9bnozCLPr2H5abrcQ5/PVQwc4BDcV50pWY88wvA9MBynkDEDdSRTCTZF?=
 =?us-ascii?Q?4Q41fC79Ko/8dgzgqQZt7ONY4pwhLk9Npj9XNFaJ3eyjtWJId805ERS7xbIu?=
 =?us-ascii?Q?tKrCmtDDlqfrER0xVpcj4OuKAcDYX6PxrPWZ9BNYAmGD6FKTYt0PbGjTIQlR?=
 =?us-ascii?Q?RDVpFxTymdL0J8AQEmb9Ws4yxpMdaFxRMGyfWN19m9nOa5n/PCfB7dz5STon?=
 =?us-ascii?Q?ul1dGvJ9qjGgeVGuxY8FSF/d+y+Ze6T99acV/MuHD/fkLhfjJWe+XCQ/uVJq?=
 =?us-ascii?Q?jxa99UMqI2KxT1Uw1jFy72ubtfypamah3qegskCFohp6u3wnhyYmgPdbS/ZI?=
 =?us-ascii?Q?wVdIcsPBOh24hQyZ6Grh2o7n6d5YMUvRK7FKTYByqJmVm4XpAREzktNBb+w+?=
 =?us-ascii?Q?l2x+azvkV0fXIRnRkFLsvZHGX1DNhMDDMJytT340TftjFFv1R4A+X3UbFdGb?=
 =?us-ascii?Q?tVT+y9qElT9I+gCVvDtRFUwjFprosFcCivbSh/vIK1xW9J2lqDrsP574myMk?=
 =?us-ascii?Q?B0MwaUpfZGQA9asjcmn4E76UtyQGi2BRDjumUUfyUB8eeVcmDKlbHLdOFPzJ?=
 =?us-ascii?Q?BYoblAthiuH1bLvWNCaFZ3F5KnDWVgMkjAyYmvGywJYfDwZXN4ZB8AsAcpSA?=
 =?us-ascii?Q?gXekMEHY6JgJMNigmrp6rMmG/CRn/ny+/xoh+p+34GffcD0A6qOF4oT5ycnN?=
 =?us-ascii?Q?h0+UKSs9y0C/o1wnqSMGoWhSYONlYkCqtblSBYz+ZkqOamIS34R2z9d7Q0Z1?=
 =?us-ascii?Q?eFjd/n13Ry9gueIulf6zVRXW7HRuWYdDF7+/8XQfji1St60RrZdAgTWyN4qV?=
 =?us-ascii?Q?sW8r0UnWJhwxMzhvc2NTd7SpPG1+de/YuuDxP8z5qb7JZao7xoarkDzQd7ml?=
 =?us-ascii?Q?o9MvcbE41ii+Mzt1Mhp0s5pLyZ+RRKvvK+IgCVE3p1zYXKoOX42V7gV1yFwY?=
 =?us-ascii?Q?pizDVnizqPBnz5wXgUWgbQz76hR96tup8Dfupizw2kH/d7ASHfEQMfwNUM3V?=
 =?us-ascii?Q?T7QlTfPi9w09qOSSMPfLvwmZ6saoY/YQ8KpAxSxDBouFic4bEq//1YGFfB0o?=
 =?us-ascii?Q?I0jL71guppGmkTUVf8siqtkByiS2z83sVD5rIOwV4+nQmSzlvGV1EoGtzYc3?=
 =?us-ascii?Q?h6tombG8dbgyRKDjXOkeEgp1Re1LqRh/V0qKEn9M6rhXuZsau7bB7pNORJs6?=
 =?us-ascii?Q?Q2omPwta0xB029/VUSEaNAKcXbO2BNXYcxBtJJVI6ws9BmMlJ0aB3QHq5HjS?=
 =?us-ascii?Q?SICmvhIyp5xJXtrVwPrfw9tt6ljj9Ml5SLTt2zRo53XquMLapz258FU7l5VF?=
 =?us-ascii?Q?YvttuvdrV70xSrffR3K5jZy5odS+ibBsX2h9dzNbZ+JxaJ6pIUtuheqVooLd?=
 =?us-ascii?Q?5hC+VaiDpQkTLkZF50X3UOHzzHjrLhkXnlt+qU+wQhUTbNRn2Mv015F7TOZv?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3ac65c-9648-48b5-dba6-08dd3f06253e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 19:09:38.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T06uXMlheSAJu74j8JVoS5K+5QAamqpvWpy6liF1RrZSV54n5MozVRSx6eAddPyjVHFeaGsB4SQyXs4/RrJKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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

On Sat, Jan 25, 2025 at 12:38:46AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The last use of live_context_for_engine() was removed in 2021 by
> commit 99919be74aa3 ("drm/i915/gem: Zap the i915_gem_object_blt code")
> 
> Remove it.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  .../gpu/drm/i915/gem/selftests/mock_context.c | 38 -------------------
>  .../gpu/drm/i915/gem/selftests/mock_context.h |  3 --
>  2 files changed, 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 2b0327cc47c2..fd8babb513e5 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -107,44 +107,6 @@ live_context(struct drm_i915_private *i915, struct file *file)
>  	return ERR_PTR(err);
>  }
>  
> -struct i915_gem_context *
> -live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
> -{
> -	struct i915_gem_engines *engines;
> -	struct i915_gem_context *ctx;
> -	struct intel_sseu null_sseu = {};
> -	struct intel_context *ce;
> -
> -	engines = alloc_engines(1);
> -	if (!engines)
> -		return ERR_PTR(-ENOMEM);
> -
> -	ctx = live_context(engine->i915, file);
> -	if (IS_ERR(ctx)) {
> -		__free_engines(engines, 0);
> -		return ctx;
> -	}
> -
> -	ce = intel_context_create(engine);
> -	if (IS_ERR(ce)) {
> -		__free_engines(engines, 0);
> -		return ERR_CAST(ce);
> -	}
> -
> -	intel_context_set_gem(ce, ctx, null_sseu);
> -	engines->engines[0] = ce;
> -	engines->num_engines = 1;
> -
> -	mutex_lock(&ctx->engines_mutex);
> -	i915_gem_context_set_user_engines(ctx);
> -	engines = rcu_replace_pointer(ctx->engines, engines, 1);
> -	mutex_unlock(&ctx->engines_mutex);
> -
> -	engines_idle_release(ctx, engines);
> -
> -	return ctx;
> -}
> -
>  struct i915_gem_context *
>  kernel_context(struct drm_i915_private *i915,
>  	       struct i915_address_space *vm)
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.h b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
> index 7a02fd9b5866..bc8fb37d2d24 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.h
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
> @@ -23,9 +23,6 @@ void mock_context_close(struct i915_gem_context *ctx);
>  struct i915_gem_context *
>  live_context(struct drm_i915_private *i915, struct file *file);
>  
> -struct i915_gem_context *
> -live_context_for_engine(struct intel_engine_cs *engine, struct file *file);
> -
>  struct i915_gem_context *kernel_context(struct drm_i915_private *i915,
>  					struct i915_address_space *vm);
>  void kernel_context_close(struct i915_gem_context *ctx);
> -- 
> 2.48.1
> 
