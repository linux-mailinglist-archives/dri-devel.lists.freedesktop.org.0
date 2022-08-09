Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC758D738
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE93FCE209;
	Tue,  9 Aug 2022 10:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C778CE1B6;
 Tue,  9 Aug 2022 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039962; x=1691575962;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=20Lt6MBZdMVoCuShqPcu0KbwSvjfkuYb4u6jAwa0LBc=;
 b=UMvQaUtkc/B0S8rwvnN8tbKdzyitvlQWgkvYicyVT8bH7JKb4yFnyQwl
 gV9IIGDt+wm45MOcO/kHAuqmmhRrGgOaQGi5YDTmYhknc8zfU/1jnHSOk
 x0cAplLrpjd9ZErr+/WGT8HqaPpxWH3dPfhe8B+rOT5A6PWwcV2OkayER
 pwoB4sC5oD3cNMlMm+66Ga2Iom8loFlHZpYG0HKnRf8eLv0fkujAeGP55
 jQHRYn3zqrGm85H2QscVo/3gcvIVZP5Fr6ThMi+EetmSJyXlOGlbZQEZ4
 4JOBI2/yTdylkT22iv///Qkg6Ih2osfu+DtJ+YZeFyp8t4TFxcwruIHFM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="289556499"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="289556499"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="580740768"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 03:12:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:12:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:12:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHvGUOEiys+wedammmvm2KZ/eal1AscHaDeVhAcWsdf3kQuqe7Q5IJbLDsE0LiRl9nUxoIh2idnZhhy9nwpqEP8qVST3ozeEfDnsLe6314723pMIEFxZR0zxMpse/pL+HA+uAPvt2HHI8MuXBu7nv0kJCL7m3RhPAHmMZloeCk2QLKd80W4Us3aL1Erble6ru5GvvFTqNC29mytySIm+p0DtVudENRBOvijhEI9mpOdh1P7cp5wnN2gZqSNcdfckU762a8+MJbdLwERoO0bmcHtHPQcNQALBXhlxMihcxzTbEKaEOsmfFAm5bP12P0CENgXnUv9k/oIGmya/ALYzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raWR9XMQKRoIqhjvx3C21nVVa7XAcz+CHQAf1d8BFhs=;
 b=SRGIIvsX0jJlZyF8bW87JpBibl5MmhnWR58dsWQXCx38uI6LykW7flJeWatQ17JslkmKUpNRnSMTirLjAxVRXJum5SyieHS7PZEAMlb351wTQxl/0sCIf3d4r/3/vGly8V2rHssSXXSjj8fGle1XfrbrjU6XqAr7t0Txo2zCt4LcOLfDESKkrKBdV59xBaEuxDD954OvJAWiQzR5Z0CRoXSZfP0BtA8w9VWxS6txf1hYymFZ0EYK3SnYQLv6v9/B71O5lABv6T8N9ROKMXLTIYUlronJMOAfE+AlrLE4XLBOjP5fSLHrhtE1v8rcGsJHJTPFgiHKRzd5KtYDJQJ1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR1101MB2199.namprd11.prod.outlook.com (2603:10b6:910:1a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:12:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:12:33 +0000
Date: Tue, 9 Aug 2022 06:12:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 31/39] docs: gpu: i915.rst: GuC: add more kernel-doc
 markups
Message-ID: <YvIzDBmsGyr9YqTd@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <f8f1475a468bd4c426df62decb45eb8c22a53642.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f8f1475a468bd4c426df62decb45eb8c22a53642.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 431fcb10-c39f-4b7a-a872-08da79efaca7
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkXy38+D+GR71A3RbzhZlkqjfGMw644g3YoJ1s/pRAGqaPvGvSPNb26E8u25EPGtZMfSKQjvp5vxk0X6i5OLGhW0SSO1iXuDvZVRGUauZUwJ5x/0rIE0lSDQ/0tweQpiCKiR8uvfMpGYvJM+FPXaD2GzuwFtZ6M1rUnfPpcmKNzFPBMXSEuY38oDheFceH8XazRyu173itkLqi+lm4EhLn066SCzBmUdTbzmjovhsUKoGg8u1p+Z2glJOCxJzM8b4zsvdAj07Ar6oNMadSe7dnAS0t4ShHwBD43j1q5QsyjKFgrqoLSmWd+SglzOE6wUzkeJ/0i4/ZWkBzDK3B2/1BwVMkC9Rj1Tw65K+UTZGktTzGQze6M8SFElSSVfmhYIWcoDF4VTN0gThOzh50pmuQsMxFoidu8Dt/siC0xX2X/3pQ4NNEYyXSWDNPtFEsRzL2W9SoIiZ0cQaRVzRaoTY4Wt1eWC1zzO+uHubHpurY7lummzTK+Kg+0WdfAcDovzAl4quVY2LQJZI5PjDDT6VetErP2HMwJkanbpst+K53WCuE+k/jBBRaoX2+mNQreg+PtHcMcEXTMNTT0tsTEoWMKii+sX4slKVtnUsDFZ2c7kjWJm1Y71kP0w/flQ1BbPUXVWdQl9ypY7XJLSc5vvyWzMjs3FCLNkR4pBVEppWLpLB+eApC09h56ae95W6vgtINNoKIiiixHwINOJYtqjNEQ7EfHs5tMkpHB3iA4Ha9d44jznVQOgfeQse3TLp9s2njXa7TRQcViUJd1W8447eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(39860400002)(376002)(136003)(38100700002)(966005)(4326008)(6916009)(54906003)(6486002)(8676002)(66476007)(5660300002)(66946007)(66556008)(186003)(44832011)(316002)(36756003)(8936002)(478600001)(86362001)(2906002)(26005)(6512007)(41300700001)(6506007)(6666004)(2616005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2UU3M5I3S40f9qXnVbRb36JHyfCrhT15179LRL0lPsvqrvF/bO2ULW8hR606?=
 =?us-ascii?Q?OZ5BIuq/CJb2psz3xfKNhL6+97pIaiz28YkIQPIjGphmKFbPNgT3mMM2XPDf?=
 =?us-ascii?Q?qGqW2ta2qF44xiRcu5txkDpRffePPgbIYZ5olWNzdBpeGb9aME3Wc+XlaMrC?=
 =?us-ascii?Q?DY9CaHOAqXgVbzUyi9PhxbWoLD3rLQF4y0MTuUoDAjmF9o1HRJCpmSaS29TL?=
 =?us-ascii?Q?5KhBDQMXsb7XNGeXz7JTRaJ3QJkEYO1Tdu2ccyiuiVtctMCuhuzcZ4Lk8vgX?=
 =?us-ascii?Q?R6QJA5hlMBN1H8HiA5WykORVIvq9cUpDelWW+SGbdS08eVnkWxsBKequOBir?=
 =?us-ascii?Q?u7XzEE6spFXkFtpKke9zdqpWT2h+mnG0gn674B2NJ6XWTiGIEETYlebwJtIq?=
 =?us-ascii?Q?krZitiGjwJ7TOClY/vbk+xRW6KOwK3kgcrdrcYExU9PdChEL8cqvS8MGdmOD?=
 =?us-ascii?Q?hAJ7M8k8Nq8oddgBp3K4b3P+0s1ZAsHNC+yMXmN+2B710VGFolt15/5/jF3J?=
 =?us-ascii?Q?6683MU+tFO/LNlXtI+CKsI6l5hdnLgewVrBUWJ9IE4iBu/Kll2hp5CFQdaP9?=
 =?us-ascii?Q?wjine7WqNAidkTMqONVMLzaWvHKZO6W10TnYbjphLUi4K0ksc0erADVBpdx/?=
 =?us-ascii?Q?zJR0Ur3exm9bVEz38AxkIVv8WmgHmN4sFeeIExbuGJ4eZJtprh5yN3HhdyV1?=
 =?us-ascii?Q?KCcNCoItUTbpxdWgq2H+5j7wjIuaQKtg2M/EWzS97kYMikzOecAAGpd+g9UX?=
 =?us-ascii?Q?qTJFtikObgDSUKtdND5lk6FEjcgYduq6OR7dduZoqiZ+qaZElVnSpg3KRP4w?=
 =?us-ascii?Q?ALLj24/T84A2MXgHTR3DPbaWN16oyVfxYYmWgy4Z0GOKvtImsSPZ2m6o9nRm?=
 =?us-ascii?Q?du6lbMhPxy3wT0FWjZeHfTyo/2/ORG68e2s3cu+mhOW60mnfgoEB+9qoma3R?=
 =?us-ascii?Q?YzZOG+HNZNVFDJDtcoTmBZY8IMlAzw94E6oPzhQkAVrWRnROSFdx/Y+K4H+c?=
 =?us-ascii?Q?QyHpMVpa6Sa9oQn9DBRLSZqMk18HOF9NJnrFMpcACpwi+46wrkwM03c40Cvj?=
 =?us-ascii?Q?uH9K3kQCQOEpt1H9ynn2tKBskLtJvkonFDqMSrTeSyIP+Q/6hVm/NwWRC1cx?=
 =?us-ascii?Q?0/KBtpUWph7YNpvKTSRM3KDQ8bdTT7+PA5BbkrVKVq0QdYBhrotK0VZchiep?=
 =?us-ascii?Q?/dI4kKCQOagJme+56d4WVQjIiwcg37qRLzbpZ80sihZoMbxrgLAgoHU8Xwkt?=
 =?us-ascii?Q?gGUnrMr9p+Q/B2f7sq2Ul+mCylA3WDk1skAT8tS8FZTTl4U5eZxNcLo9HOi2?=
 =?us-ascii?Q?8vbjswiUX9+4U6IAkyXV60O4wXT7HSUGnZSYvwoi7bpp2KQ3BaFjBfw6CTXh?=
 =?us-ascii?Q?p1rnnlf72ujR1V+CuLh4myQDqfoQIy6ZAfeXOtcQSP78ua1NChpVpfhcJZAm?=
 =?us-ascii?Q?cuEfZWWiXZ4jr3mZ+n7yEOrqTDOl2hJeGXgK84C5GeW+HZBAQy3Ge+66dj9q?=
 =?us-ascii?Q?D/tiCT2aY2Xt7x62YiV01e9FtdUREucco+BN9RdyQhtdbsZwFkWTkYk2sKbC?=
 =?us-ascii?Q?0CbfrjA/DmaKATMn8T2x2+3SZoNyAhw+PCVeWCzdhIft/+mBPhARcvRk69Rs?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 431fcb10-c39f-4b7a-a872-08da79efaca7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:12:32.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHJa4AGu3uLiwFcIYwj3MiDj+2R3+k0F/eHm9qhrRhh/Xl5u84xk6OZXWLQf/iLrtTnMjfAEVwbJqYENOeAoHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2199
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:19AM +0100, Mauro Carvalho Chehab wrote:
> There are several documented GuC kAPI that aren't currently part
> of the docs. Add them, as this allows identifying issues with
> badly-formatted tags.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index afd8c0e3c689..70f2f4826eba 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -596,6 +596,28 @@ GuC
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.h
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +
>  GuC Firmware Layout
>  ~~~~~~~~~~~~~~~~~~~
>  
> -- 
> 2.36.1
> 
