Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857258D706
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB82CDB61;
	Tue,  9 Aug 2022 10:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4360CDB40;
 Tue,  9 Aug 2022 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039331; x=1691575331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iif03c67MYfvuE7erDhBWJWq4th/c84xKzsA+sWFiw4=;
 b=kcmFfjZglOjwqSGJW4XBXKINpJcOyj07gax82CZFDScZ4b6fferBtnoe
 1Kx31JGncaBDn0/YyZNi+N6qz0l8gh5FLEQRDLLC4YLDFZpRzHGxldVRS
 GETg63T6+5M185yrwgw7xBUclwitEZa6clgF/kWiEQ3Kl3gBBXV6i4Mxp
 lb4/jvuIPqEptTXAIEdJdoIrrKDdYeAg29MX6HE5NC/409siLXhUSqepT
 ildikp06mgokbAuM/UGpGJQBmF4ecJdcBK4bdofj3EBrmxUvgfFxNtPC4
 4SuUe+Fw9v+RvzP2QO2ZxzBpH6cqnw9q8OA0K2V0MQZNu+6TG6Q6l2WpF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="270574811"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="270574811"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="555281176"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2022 03:02:09 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:02:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:02:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:02:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GItfTD09n2AsouaL8Fc6nYV840LvqC1VI9EATUp+MV0ib3KnCy7kQangON22cZ/M4LaYwjYkmj6LjBL9tuX+JGbDqMJMyOpqGlq/Bon0tMUA6ShTapRn2k+bj1lpvQE7qE9ejPRlmikcpZRqHXKRQv8/iMWGlOPps9wyERvN1kvQjF141TgbpluJT/R7fOZM9FyaHfL1NWpUPBRGXbCRCEdylE3DrTiIdZEMqD2iix+a6GIKJ0QyF3pcTUvlotUi9BaYziF+Li/58Azo1OSsqV4+B3COliVhpf/ukSXroCEQiTMAwcWP0GV//os6DV/emBdKcojCxwAIM8FcDI+KGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FRK5FR6XMYGr5tzZ311PYKRulk/kJAxlUKQlE2TyDY=;
 b=bId/UEbpjXwQ5gLjW6JGB9Wf2y2VQp7223pO7VjKyJHy3q+QR7n5VDmd5pal/tBY4vC8mY39i8RodLRjjgeir8HZrhU8yN53e4y/+KptKcHzulp8IpUODUo7TPDSDKspJJ9oka6Rme3TVtcY6FEJdbJA8A95C6vnwaBhR3MgMXDkShFs5xQIuQGcplRcLurK9myRYYRDSWQB932NcaQzH+7ii3i183zjP8RIef3M9Z1iCBkQEHbRaKk1qt1H8joJc871h9lIH4lzrAJqaPBTEFEKNYQ6J++oGKEk7eCi6FEbG3Jznbc8WnHn+KZsU4qu6JrsqeeIDBfyS+OkYNnNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 10:02:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:01:57 +0000
Date: Tue, 9 Aug 2022 06:01:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 30/39] docs: gpu: i915.rst: gt: add more
 kernel-doc markups
Message-ID: <YvIwkaYRbrd5+vtj@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <d7d1f6d6516eb3a82041af1d5f40c2f550de40db.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d7d1f6d6516eb3a82041af1d5f40c2f550de40db.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c756bad-71bf-4918-ffd7-08da79ee31fe
X-MS-TrafficTypeDiagnostic: DM6PR11MB3514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtoPAtBsI5r/+dSi0psZm6WsrOmK74lGQvxihRw9k+tPQ2Te3nLsV/xTg9FCIhIaiZ/qbU0rI79AJIBVJb7aoLuiRABPrWJcvvoUUevfxlwG/B3NyU9qsLuK7IShDE9oCfPXSHFeIwu76dMIHT5avQJD+GQBR5QNWh5HXVFpVpdUtlA4URZHONJbX/QvruLlmCH8SG3HCO26c6Q2xHjrB9MsI8hUH6wuNPZasKW6SIeTBYb7uS1pVoA4NsmzLpDw3ajuXrKOn232YCtvsyyi4P1GtWdt8cSjU+ZQoa8NacIdYhRj6qjYc0ib6/HEPb1I1AAJDRzoKSpho+HzYIWEyrMLCMubUQjfE9K9BrmZM7DZc/jSI/ookpb9jWT6SFlKUsxhLx3QAMRHJ3wTTwIAmLyU2ZC7CSc/ErhqMl0Zmu9MQX7hyJOqROacTGs/wiRqP0wflXp7YmIoBIrOSKZ/glYTrBz8Oj6WRkRlKmANrowwL/61QxeP+Nsa6mIjYmj7ulRKbcFOHmy3y37+jDtE3+lsJa/WXggJXZxOd+ueMAKbuMOdlCrmPlKvRyRX2XhF89i6p6MPNQ24+tM6IpIkqm0o7B2blcwMtLfhHVvtGE9WDIk97LCnVhCu1SAgRPGVvTbacqEavP8C5weX3U/QSv12MwBnrROJBWYVXGyVfr8fbJc7XR1599UaqWkWy6GpT7RsPBR7psvvH2Kok1XLBjqZwVo4285vGqWdmt+bfwoY5W+DeKkBlyvrSQ2zdPezgSIXY5YnI+V1D7NmrWMZ99jEiqou7BRwv9VqO+E/SKJmJDxdV/xB93oELijcfRiaMcLYffHO9G6iqohOiYJpEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(186003)(2616005)(54906003)(316002)(6916009)(41300700001)(26005)(6666004)(6506007)(6512007)(86362001)(6486002)(966005)(478600001)(38100700002)(83380400001)(82960400001)(8676002)(4326008)(5660300002)(66476007)(66556008)(66946007)(2906002)(8936002)(44832011)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQIxFqe1lvu/S5Qk7AYIWYpeoSMZzl7aF8ykaWqQZZfITLVAgoWMHA1cdR4+?=
 =?us-ascii?Q?3k7whFd75L+8+tnaFewOokp1qSTXB32TPn/KoXBbpSxM/4gDEgEjg9jiJf1a?=
 =?us-ascii?Q?Z1H0U3LEMMmiVrDHj2HMyktxxJybe9zdMGKib54lCYKdGog+FOXGmgZWkzTf?=
 =?us-ascii?Q?vFJLYff6K9283rBiiwcN4y0n9cTdZrOASMnNDDqjs4dmtfkkcL+0jSFyuWro?=
 =?us-ascii?Q?LIX7lloTLI5yZluvpajoYwalwUjTaNrvsYKVsMBoi7w/NUj6/KQlaOTuVRaE?=
 =?us-ascii?Q?+iMnLSmjxWRbLQMZRcZvQwJPs9TQuYR+xfluf1c1Z4qa38qMnpdpGjfUev3h?=
 =?us-ascii?Q?HFMC+b2XaM1emm/tK7gDGzz2SovT2LZyusuJg244hN4I4qerpHaE+jsh5mkI?=
 =?us-ascii?Q?rguM8Ku7vtq7a6DlOioSmpQ35xAWoGFUcaTDGFV9gOcRWjbAPfDC26fPbNst?=
 =?us-ascii?Q?YN5Nc4WVTkOnulXYC1fsY6YIaQmiIGjhQMM1H/pNyoowhqPmvv/E2pFw5KzK?=
 =?us-ascii?Q?ARHm3Dwd2zXo0WvOQx/PToz+Aleo4ZEv++78LOmlsbFXtBGH6VsODBWqCkrQ?=
 =?us-ascii?Q?vrQFuU2VyhlwIF7hIZz4bzfUjOWQ2os6OV1BIbc8uFmz47g0QKSChKZ3+/xU?=
 =?us-ascii?Q?jPNM1fS7FwJGK4Opdt6TCvB9q8fhA6V52XfmjbpybJL2yUflazYF5opDbCgC?=
 =?us-ascii?Q?MtCsUgq/YzyHrQU/FSZa/viP+qPVi16u4aNIAn+UYbzMuT8pVPaZW35UxdHB?=
 =?us-ascii?Q?oOoRZzdle9vA6g0wE+cHSSvzLafMCeQh7IWc2lbjpPIEY9Y+j7XNd7WZ1/p9?=
 =?us-ascii?Q?pxvMm1jmLgAc4kvxVosxQU0K0EftAo+z+z5LFMsPiTFiVjSHNgN6SoxXi8tX?=
 =?us-ascii?Q?2sLT04TqqbnwqHHL2ANiUgzBtix4SPyZpGbHTXgVV6GQ9JA+hyfF+xytycTl?=
 =?us-ascii?Q?YP3v3XRXQ074KLFnf/WaUIwxwXp2NAydydYGHDO1mCkhHvDzzu3w6M16GJHw?=
 =?us-ascii?Q?A3WtjrfyBfwpRPH+m1+OcVb767HKmpJ1i0jsJsVMNOKg3uLJKuf8KPoW0EmO?=
 =?us-ascii?Q?PHpZVCuZpSXXemoqUKhy22qOE82MndO6+vauS25E987BvTFj0oSQy4BZyGcW?=
 =?us-ascii?Q?TbIhBYzYPvLZreER5/C7HSJUyXvTW8QSSRvZpXDQuksf1dPeatNBhHLcYLW6?=
 =?us-ascii?Q?/TUM5/6huA3ggSaTYk/sUbY/se7O8oSUzNzSIKOrq5FhP6cLJLujLr77aFiK?=
 =?us-ascii?Q?GougYGBf1IxP8rFRgzQEhXH28f9HYMdD433K5cC3dR6YqsRe9dvWpeShQ/Tf?=
 =?us-ascii?Q?iEGW+kKn1eKKwgbAQ/tRk7Pimr4MT/uqjYl/RgSdkHBrjRxBIRN9f7YtlkWZ?=
 =?us-ascii?Q?5DxYyISbBeLzKfXLELt/TM9nh5/kxCA3qvq8jVKZa4rD2Eby3Q2E0GPdy9+H?=
 =?us-ascii?Q?5577QNIpVSzoQJg+WBtVNS4HOSht36Q5z/EReQBDgyvZSpGOM6yfSAmcuJIy?=
 =?us-ascii?Q?5N5WulZNH2kiqtH/qeDMTh8bUC16m5Msy21HOw7u1GlfIgRFX/LVOMlzr1lv?=
 =?us-ascii?Q?ar80j1zZH3k3Gnxg/+euQ5dYVtmXLcZGqKoD6UeOzAeuTuF6ewcKjx51sUhH?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c756bad-71bf-4918-ffd7-08da79ee31fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:01:57.7612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLK57UhZZt75wtSldnT4Acu+hD34pcBoWTyMboeCHhZxAMYcZ1SxnFKucNzVF+E9ublVYpJHETbteymEdh2v6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3514
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

On Wed, Jul 13, 2022 at 09:12:18AM +0100, Mauro Carvalho Chehab wrote:
> There are several documented GT kAPI that aren't currently part
> of the docs. Add them, as this allows identifying issues with
> badly-formatted tags.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 43 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 2ad7941a79f2..afd8c0e3c689 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -149,7 +149,6 @@ Misc display functions
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
>  
> -
>  Plane Configuration
>  -------------------
>  
> @@ -308,6 +307,48 @@ Multicast/Replicated (MCR) Registers
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>     :internal:
>  
> +GT engine
> +---------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_types.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +
> +GT context
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_context.h

why does the context deserves a separated section and the
many others below no?

> +
> +Graphics Translation Tables
> +---------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_ggtt.c
> +
> +Other GT functionality
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gsc.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.h

Why aren't these gtt ones in the above block? why only
having the global gtt there?

> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_mocs.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rc6.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_reset.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps_types.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_sseu.c
> +
>  Memory Management and Command Submission
>  ========================================
>  
> -- 
> 2.36.1
> 
