Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469AA98C11
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6005E10E6B1;
	Wed, 23 Apr 2025 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T35yabDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3197C10E6B2;
 Wed, 23 Apr 2025 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745416654; x=1776952654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xn4+tZa3kkZsdqc809RZNhnadhd8KRn4q5lm139uhsY=;
 b=T35yabDUi31+7bsPaZJ7MvfhjR4chJCtWf/8rfShRetVNC7TYzFfJEIU
 RyWtTF9F56HcU34CTt2k8owuxeyAZKKJFp0eln70E6oCjMQDrJ12sDmqb
 +2mcCW1xPMy0dBKUZoLg5YLhUY1ozjZtGnLHbHb+Qt+KyE4IQtnAhCqqO
 NdhbHuvguSXsU0xc9J6a3cgZT58TKVeFPafpnzwEyRabierSrIAC29Trp
 gpOTvVbX5wrPbLigtJ6dRP5fMjBUl1PGrvyuUhqUt8f+dAIEGT/mn+R2G
 E47vbquQrABeVOYpirA6EoTKo+XbfsCy/X+D9ZW3nxWIHqAGiLDVBYzPM Q==;
X-CSE-ConnectionGUID: 5XJ3fHbNRpuTTiCLFG/j/w==
X-CSE-MsgGUID: x4nq+2gNTMWk5ogp3TPqTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47192261"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47192261"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:57:34 -0700
X-CSE-ConnectionGUID: JQ2abXNgRNK2tj/AwED2nw==
X-CSE-MsgGUID: cB7CdEEvSt2efO7LQBePSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132240949"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:57:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 06:57:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 06:57:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 06:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEzk+jH3mjBI+5sImp+9PyR/7Imykvl9KcVtpVYC3tgnuv34RJfahMsafzHgK4aMUgZnNSuRrm2on9zhUrQXbmqO3LEF9f6RqNW02KxTWjyI8MjemcEFtT6bXe657GzaRwJL+tiwjSor44O9JCDqtmkNH/lHO36Ye4JYdWQnzSqRL9+RmHBcQ5CNV2NUmAMvIrbvUwNmyXNsySNyBbLehRrmjdFGWjd0i9b28LZ+4oU9pzzYAubUrH/3BTcunvbpzT/kURPDQjwoLFMRuxHQ4J3IUP8OKTR1S0jcTzKk1f5AsaH5UgcPmN/c56R/AaJ7NU14CV5c74BrUJ2AAAHB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqewVY+mcEROFkG09wIHRUOuzU/tWlvLbXHFh8IBH04=;
 b=ohk1Hj1l/LSaS8uSuso232PZ/YDOYSb0DZflk21vQ5tvs/g7OUngEukWdtvKq7HNn3sPmChL5iiBEUN05F7WAsKo9kuGAhZ4NHvfnC2bVR52j6pgjSTKx8BUByMl5qoDYP9hVjwgIvu9QnrDyaNHkQuk08k6yS8f/rEF7AB+AqxMljHXahc2tOtseInpEc2epJ5BYnVMhYB/N8186nlD3DjCInnk17yiEspSXpMiTYLZa/4gzLOoHCEj3zHC03OxtIsBTHQohy1Ll1jM73s8HVLftuJEMRVwH49yXQagXjYTFpCxbGLsYhGsebizK72UxgTPmiS5YKoRpq+GpxVgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 13:57:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 13:57:30 +0000
Date: Wed, 23 Apr 2025 08:57:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Arshad Mehmood <arshad.mehmood@intel.com>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 6/6] drm/i915/gt: Remove unused
 I915_ENGINE_FIRST_RENDER_COMPUTE flag
Message-ID: <hiv6fcejjacloy5fyavka6tu4vkp3vywqjumc7jqrueziyxxke@psbe3mqxf73z>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
 <20250326234005.1574688-7-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250326234005.1574688-7-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:303:dd::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e24ea57-5054-4d16-3d74-08dd826ec9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aWN5VpWlmeMZXMAPoV8nRJBd+8c6jsiIc2LwXhqYuW4gKEOwT8gFsTAAQJpu?=
 =?us-ascii?Q?rZnaQtqXRaDZU1oqKWaGJH8c9dvmozg3OIT0koCiqHtrcfZ/wYqakAwxfSFn?=
 =?us-ascii?Q?Xv9CD4mDZ5SLLlbPRsSeugJr1O/CvsSa5iBOyTUXhzIfmW0rq9XFA324iIsi?=
 =?us-ascii?Q?sgYBnZcbtXnOzblgCWzm6ztkypMyT6O2kuu6ywAABGmMpxXI/+EBDQBKXrRl?=
 =?us-ascii?Q?1gdCYdnLiSZf6tFXkCBeKJiS8nwq/kWXktkRVSog6neu45bsjjblBb/7iBpr?=
 =?us-ascii?Q?89v2CmpaBYk6HvdLoNjMLHi8FBXD1ixHvL8ojAcBaACqGvBrKwjY1YYkvWmC?=
 =?us-ascii?Q?BWNtSbuMQBTwtJ58mwxBuXNI5TuBBInFgH9VjvaggJaA2C02frdNq+NZtYSY?=
 =?us-ascii?Q?QUK/qXdMk6uh+oI1Unf6icL+RLJMWabPCA2AeEevQUin/lNA8/9+DObk8wap?=
 =?us-ascii?Q?KUIb9S3UgGtn/eCpUGXUMRXCeccg7Oj6CfhiApc28inZOjVMtiBadssFGqK2?=
 =?us-ascii?Q?fTH9piPyhxFPg4oXTVppNEUu4Du2At+8WGgiBryQyb2jO1zpovN8UaQ23x7t?=
 =?us-ascii?Q?QG9r+INq1cVi/3Q5skYzlHHq93GAZ4J8uR5DLGpCg8PUMfVwIgjHFB0j3pxH?=
 =?us-ascii?Q?DJTK0UMEu6VfyQvPOQqCXgjqE4a8nRYrid7Hw6ROcKXCWCHyouOIlM7ZNECz?=
 =?us-ascii?Q?fDrx188DY+9gp/j7Ow2cqxGUt+u+oalsG+pY8tyIjv+igX6x70lWR5O8lbPc?=
 =?us-ascii?Q?LazS/vCCy9MOb1k3v8hDs3tDyC7M56M230dIOafN7RuI5f7lLV0JkYlkcYau?=
 =?us-ascii?Q?qj7X1AYV7EyNC7OQFzFGz1POFuMob5u3HVOfiS3J5uDx8Jpw7zr+yhZk2KiX?=
 =?us-ascii?Q?HphmxqtQ4Wxbg0YLqBI7/dWqBV/RbGb0mrlEB27hIWMntU79gmt9uLM3+Z6b?=
 =?us-ascii?Q?DFw5qzbgAIjIHKDdhIzabSgDAktczNykQnfrZcdha4AfQiYXSYMokYuONuea?=
 =?us-ascii?Q?9nPGLUT3jiKi4TM5kjfT6e6csh5+7AZ4+HVCPrVrxIhI7iLXbd2dZM1bD9fI?=
 =?us-ascii?Q?B9EizQinvAu71ROvufuwRtHlxT1fED6DB282qNiuHIFExgrZdh6zryF4AdcJ?=
 =?us-ascii?Q?5z4YEa+jmK9+zmHjjlhzMseJAimr0DDIsQxCb8Veq97rfRGuetNvdkfM2lWY?=
 =?us-ascii?Q?InGtsqneaYd8Iuk3RTSowQ6de0Dq9wSgIq8MwazKpm7OtRd7UhE0t+skejBB?=
 =?us-ascii?Q?OT1U2UqWMGYjm/EVFZrstnM7n1+4hd+/tu85/cFQSa3ot1yd1CZxuAFTV7KY?=
 =?us-ascii?Q?UdJdO0emngDTGCGYUEda72+16DsVA4aWzvT1YbIVPf0i/byrCTOcm/KYE1dY?=
 =?us-ascii?Q?RctJ+FI92Hi/vJ/kVmqKjxTn/Anlv/tFM71VdQkdb4+/0ZzDJHZI0Y2myyT0?=
 =?us-ascii?Q?LVq9rpeolC4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WPngy2CaLzJLcxp/r3aJMzBXh/t41oPxv2qSPzP0XdgfzNGARzyIzjlgvB1?=
 =?us-ascii?Q?BoMRGW/OCyMFEcLjAmfROHvxLK5M7u6iPOtSf5+m5paegslW15klr7LjrJ0a?=
 =?us-ascii?Q?UU8SF3p0D/9cp4F1kDgrDPuLk21jG4MrVy43XJo9Db7F9mbw+WpcGXXCb4sd?=
 =?us-ascii?Q?p1nxrdc+fsi5lo4LJpeeg8ZVmVMk0ilqMtuVkl04W+s4eBRf/IhvW+IXEnVw?=
 =?us-ascii?Q?qypx/+woz8mlLS3gQRukv8vribvmjCvd0g6CeKD9nmTR3he7ElL85uN6oC4C?=
 =?us-ascii?Q?T+3L059f9bsaiXxrT7k1B+2D1UeMMIVFeBQD7ujyykkqJRy4YvQqpvL93+OZ?=
 =?us-ascii?Q?lCw9uYJlu2ZshGjGpj3BIt3QfHzIKK4SXo+Evk5XJ/OUCVdEaiCIB4SSu8nf?=
 =?us-ascii?Q?YRzIA7LrehWzvr4HiWb7yJb3OYbIqRIXvUcJvpUs9ZV+IOqvibPqbQrDib6b?=
 =?us-ascii?Q?Enn4oGXFKBCWUh/ZqQ+/dkh2GNX2DdeAizhSl9FemF/sPXhK18VuI08h+us2?=
 =?us-ascii?Q?+5JjfTPFnlVnzKRsM053rnNeV7CuI36s7W+QWKzSuHVXn2U7YOIbi+mJa0Sr?=
 =?us-ascii?Q?84uQyFSQuGBmbfBOLqe3WIQ+flPwNECcTDzP3flTH4j0beWn2UDy1Coxpkdy?=
 =?us-ascii?Q?lWLfPimhr0tAbQ4qtTMRyIhfgIbMzQJh7PYSpEsIIRGROAcotf7knw3FOOUe?=
 =?us-ascii?Q?9Gk/Cs8yx9kA8mBfnrCQEssafQpzyXymZmSzMmuExyCEYvbdiUqAjO9RY6Ud?=
 =?us-ascii?Q?n245piO5GcHkrkYGLtsZ7Zo9KB6bCuRdYVLRKVWkupF26YA8DQnqPXYJ/ex9?=
 =?us-ascii?Q?WzbwTS9A1HIE8GcwTL1yuGh6X5OH9cGACgjtRbJT9IDQBfgJxIBeZfwHpqjF?=
 =?us-ascii?Q?j7AQdt7Dr7j36Fc9yY9xdbOugrA3KGgeERccIL1E2y2+14kkg/tM/A2si/dt?=
 =?us-ascii?Q?a8irw5kMw/np17eT6tnem0/1Dyf49cntfQzrlhY01M4gw5c02XGnqYqgUHGq?=
 =?us-ascii?Q?6Bi0hcPaZzl81ETihWJNaXvJ6VxO4k1VQCFlHG4oqp/+LV4qrEEgmf5vasSr?=
 =?us-ascii?Q?Zf+5YuLiQZpurEoyhdglkymWeV92NOYs6OnW96h+QNNUQpz681n+LSW28wdX?=
 =?us-ascii?Q?YW8dGpG2ChiwA8Hv0D3aTKr1eaPeAU/GZmu9T+04jjh2BuQilPKVsfU3ALWu?=
 =?us-ascii?Q?SqFQBbvFlzkVXE3gEnz9A4GnHVAmXhTOMvV3iyLO2582//zQdkIuB2zZ4hsl?=
 =?us-ascii?Q?7eFGQDTT8x9qPvlra5V6cKZMbBXyrucXTxTTTbTsqvYGnhGuoWnG0nN/LbRp?=
 =?us-ascii?Q?etR4f21d6C2dZguVKzRyjXlnwqqGzrt+bzpZ82N/sTZzF67iNEIrgVpKT5Sh?=
 =?us-ascii?Q?KMIFkJrSij47McjU6rOK4dzOHFXWA1FtZY5kqTF/hVLWTePTpFF59REyV4c8?=
 =?us-ascii?Q?fDOUfLuYZTbPUtgzdpggRwoNG6TDOgAWsDPT+LVpHox6Twx4S+QwQJyWN+Id?=
 =?us-ascii?Q?/vx7S4QHvxdGEi4u1GSMknsPdK/MmpFFG//PSk6WSeukxkwreQt4NCVKArOz?=
 =?us-ascii?Q?kNr1Nx2pzgnwN4kWtrQmYybvBlwHp0rXqnGkMxzwn5O+6PWYugKgfDAZncaQ?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e24ea57-5054-4d16-3d74-08dd826ec9a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:57:30.3442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b83VI5qB/lUyD7hrz3Cs9rkqHhUa6l2/1HyZO6j45pVOG3pr9O6yjZWhdHRYZlJ3kU70RA2RBxkG4zGUeF2/gb98N8RF9UeOkiT2u6apYtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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

On Thu, Mar 27, 2025 at 12:40:05AM +0100, Andi Shyti wrote:
>From: Andi Shyti <andi.shyti@intel.com>
>
>The I915_ENGINE_FIRST_RENDER_COMPUTE flag is no longer used.
>Its purpose has been replaced by the FIRST_CCS() helper, which
>determines the first render or compute engine as needed.

which is not true since you implemented the macro exclusively using
CCS_MASK, so it only means compute and will skip applying the
workarounds on platforms that don't have compute but have render.

Lucas De Marchi

>
>Remove the flag definition and its assignment from
>intel_engine_setup().
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 4 ----
> drivers/gpu/drm/i915/gt/intel_engine_types.h | 3 +--
> 2 files changed, 1 insertion(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>index b721bbd23356..1b60be057192 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>@@ -497,10 +497,6 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
> 	engine->logical_mask = BIT(logical_instance);
> 	__sprint_engine_name(engine);
>
>-	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
>-	    __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)
>-		engine->flags |= I915_ENGINE_FIRST_RENDER_COMPUTE;
>-
> 	/* features common between engines sharing EUs */
> 	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
> 		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>index 155b6255a63e..c5529b966b7a 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>@@ -590,8 +590,7 @@ struct intel_engine_cs {
> #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
> #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
> #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
>-#define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
>-#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
>+#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(11)
> 	unsigned int flags;
>
> 	/*
>-- 
>2.47.2
>
