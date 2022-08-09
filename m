Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525F58D6CE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A262114ACEA;
	Tue,  9 Aug 2022 09:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EEFCD9A8;
 Tue,  9 Aug 2022 09:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660038714; x=1691574714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kt6cq13tn3IzGFwp71JWjb3cIJw/uUPieHkxbYEFa5Y=;
 b=KXxYpOJp78d9ITkpCurJ3PLjiKBVqlwNcM6ozVEOMLOMEI0otzlmeJLn
 xKniYuEzY534/9WJ24x7aA9Qsbyo+WVyJXNM+kWSLZ+XFnUzgfDAlOWYU
 kH6NuDy9/o0IjUOmaTwADyOVn7pOz72iJfWG/z9XTOKSxQDPN3y1U3Kb5
 ZI66/D4EwT38N8iMxZwi9kYChNapOeC9lakcU0qpemK5vTcvsePaUIHOP
 s6H41UemlKi4tg58Br1YLpYPfaYVpX4zxSHvb5xeiQCtJmMsRraw9Y3AL
 wC8O1NABljTB9rmkh3y9RL4QuqSGooc7A+8FwciiC5VL7YUlgpYABL0ci g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="277733234"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="277733234"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 02:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="672829572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2022 02:51:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:51:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:51:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 02:51:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 02:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfiU9I9VA+R1IwB7s9fDfrKRVBxAlaR/qCkUCt+pCqBE8JPgDrmYD7uMDBuonRRuikxl/0nMPUzisbjc3vTS+NgyvoRK0PUI5v5u3e5xYtZj4k4QWsp2gulBqb6Y4nyGqgkyZWQYOIZCw/ycOd9r0Kd+yxd1jMzwc+BQVFxTJIGjx1lInW42LdpWOwMw+SvkKI5+6n91Xu81a5zsT3pwHa2dwOvSTm8PhlZSh4IlV1u2BP02UFXcobokbClHwY63LPs1uh5pNfiWMioPzNNb1xD//yk1yOJc/GJYWR9fA64v2/Z5J3M+Yp1k3aZoN/4vpO/1baVb8icPH6Ejt2RBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZuw1VauFFINJw5GAGRhEAL6OV+G/oy1MT3Bh+V3xpY=;
 b=oM/ojxcH2q1gX5b09VLRe6b6a3/WBQHxYsTykXFlf7tzStOggEzcFf309hf+ePckQoUq9p05NIVZPkq5BTtsmCHMvhKDI2yQfkcfJSJwJxRXvQqLsdQei1P3Ky+GnbCmySP8P97YWp933fMn06XfUHCbjyULQWdlq6BJH84S+31sViLqGdTZOTllU3fmruZ57JHbjHs/2ExhQWT2xVI2av1E8S2w6Q2Yhqxm3rV+unpA2KOdAXhGjH+eByTwmSEF0OCvy6/3U2FeI9TQYqTU0yjg3o+dok0LMoHFM1pO2RbABhwRlmPdZcpyNRXJt5+y/ame2ZMOuFQl9HWFv4NPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:51:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 09:51:44 +0000
Date: Tue, 9 Aug 2022 05:51:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 15/39] drm/i915: intel_dp_link_training.c:
 fix kernel-doc markup
Message-ID: <YvIuKw8KY6xMi0Fj@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <0fac471eb7f6d365e9a7544071114292e08aa5ad.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0fac471eb7f6d365e9a7544071114292e08aa5ad.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 927c4fc6-c943-40c3-72a4-08da79ecc43b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4P3cuLI1EHZp76K5d9gTqiIGHgp75ez2GfpuSyAv9r9hNRaU8YMgTnbjt7djTyXDP+7PrM68qyCbOSM6jIXSYBS9F/ed3ljQbkeI7H3wfO+by1RqRLLLEq6hvBJQ8X0CubSlXdGWgT8obBk3KWadIdbV8M+E8Kl9ogEu+jfVguTWQbho8iKXPDVHNP6ny0Pa60PiKbWLacAWDLL9z3DEclMU6FZlFyKqS3gTVc3xsQjgnXSsn9M+F+QEGbgA4UQqTjybZC1WV8w+6nLfavfoW5SMbU/W+dd3QXYcbss6Z18q4Gf0ticSkvMBaeBE/M+d9kkuo6HthKHgRSJFDxTrpoVU1mG9TA2iv7/8/B8Z1uLWbPCoXrUoeXuCsGFUE26P5CHwai6hDvmQFlXfAJV+M6m/4XcZvtopDrBTMudWQLyByijUr5p4h8w6Ywg1Zxm6y1T21If75vFjkNEn4/uHY88XHLl30PXpmOSSmEsCoSKDrxSY8b41Ga/YZpjk1mTKlW0uemQt2H/mHN/7SNTrl+owoAIIHVjVzMNb+XeS3R7EcOXAZPRDLCebrqpAdmtrFUI+Xqphs2vLXkeF/+BVLxjbbOpZrpG02Cs/Nv4BWW11dlyYGv9F9sjtCnKEPYSig/bn/DksZ0NhlbLYBh9IOAsKPLxuffDX4SwrBhxFo/mAGAPM0JJfmHnXZf8+LilqGtOKmoqsWT5/SChV9iDXbIsW1qHgi4oWQz8FxV4NNbLu1k7KMMVIdS7EMMEp2foTmjZhdVoGVmJULMFy9BH7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(36756003)(26005)(6512007)(6506007)(41300700001)(38100700002)(6666004)(966005)(6486002)(478600001)(83380400001)(86362001)(186003)(2616005)(82960400001)(8936002)(8676002)(2906002)(4326008)(66476007)(44832011)(66946007)(316002)(5660300002)(66556008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6g3y7KgYCU5+ibuFneTgwJHlHf8wJsTEO94kaxQqWr9uMR7cN/uMq/0c5Xkr?=
 =?us-ascii?Q?Df0eEvo3DglG98pgMr/5R+RlzWFGAEs9rURBzqr0zBxNG3Yhk7I1sU8eukrV?=
 =?us-ascii?Q?ad/VVzWh2bZKZSMDNH58aJVohK9kaOvQRxCFDqVJe/CtxkzETZ2C1rWniz51?=
 =?us-ascii?Q?/BOwriwsv5fPePfZHYxFgI8Msz6SEqXGvo4liB8bsnwQw3jUzWtmIauRIw+t?=
 =?us-ascii?Q?RccuiXYbMKyG3WnJC8xK607kn7tIfj96HWShicM1v2vNCZuef81S7ijDT7Aj?=
 =?us-ascii?Q?mO/CeUoQwYSZQRmG/J+sZpHqNgMGGLsM1fAhpLirnqeafmr33dqB2e3Z0yTf?=
 =?us-ascii?Q?tBIfx3KsBneCv4v6dbwBgiW2RMniW8lE8FgXaaXSmCMboXZbqNUJwWblw+aj?=
 =?us-ascii?Q?xHIILKxojSr257tmgMRW1yRTYGG7LblixJFPAzhv4+pz+3Rlj6NdAAqtPRy/?=
 =?us-ascii?Q?XZfN1AH3d1j1W22M/E9fJ3PGDNSjEFArsiC9vccwDAFNnONqMA7DOybLFvHb?=
 =?us-ascii?Q?xjnU3I4Dl3Gzwt0oxUL3NFlsjYYE+iuJgexWp0VtvCtHyTORR+jzBLt0pUz4?=
 =?us-ascii?Q?0lAhb49i4HbtICK/AzbdvLyvW4H00YurMW62Uosu9rW6EKd9N6iC6wWxElz0?=
 =?us-ascii?Q?XPm7M/B9mNpnbRLuk3Bz/IpLc+4EWv4eYBycC6Qu6l6kzUIuLMlndb9TZK9F?=
 =?us-ascii?Q?ySPJkgChi0p2gam26SJmreTNicHWmnHjPGvtPgZb1o/OVwkrcREepJYn4VMB?=
 =?us-ascii?Q?54Pr7Ls86xcna0rw7C4tJ1nXII8Urzli0CW70QGVzovlJ2gFmClh9nlzDZOU?=
 =?us-ascii?Q?Jnr9actryTDplV3sSIKoFpALR1R6Vk1oM7VH3YNTSWtuAjDrMLxC1CJkJJMd?=
 =?us-ascii?Q?fMxRyXfjazCjJdX+Id510R4jal5sXKUX3ruH3UatMqZHwabPlVXkZ0sPQc/u?=
 =?us-ascii?Q?GIPF8Vs4q9AdiumFCYS5VyKvllQLN33Uu1RtP9Zsuy2DXk0PhVQdRBp1wUaM?=
 =?us-ascii?Q?D9F4Glp0mgXxLzAypTAgoyWEXKDdh70BaoxD9JT7e8Zo8YwMv/X/AEsMJFuJ?=
 =?us-ascii?Q?j7Ya6gTOImKVCxfA6m9T1RGwkl9IEw5UPXvZ4S9eq5QN4oPOstB39WvPNOtZ?=
 =?us-ascii?Q?dl4fw2RGYvsMCb4hcBi8XPxhZBa/pKDq2DF0qxf91/5kYRwEF7f8dfOHeTI6?=
 =?us-ascii?Q?QmXHV8ACtaP1yWlQzpBMXJkGjElIBXi1HiuqUaHoZQSV1ik/cxIqq1qluwpz?=
 =?us-ascii?Q?whRHyYjis9MGIBMYkctjMtMNABAmGUAzdLJnAoRsYn/IgnnIG6meWo43HCRp?=
 =?us-ascii?Q?wyrb8xXfGRPCJJSMN1jsSdU42ocPf239HFLyugEodtrArhK32JXuNh0L3JXz?=
 =?us-ascii?Q?JIngGkCp6qATzndlWxcWac3wURuUyhacu7ZXAPWZYc61+FsoP6X2xPVr7rKr?=
 =?us-ascii?Q?8II3gJUWV5l597QtEYkqs1p8RUIUKvGwkzTw5G5CYrzlNEI70XmAkxozIvHo?=
 =?us-ascii?Q?bP5Dw80GtioWHAfJmlneANum1cMwxlC9/QKeomXQidYgwqu/Q8IfE6LTwTrZ?=
 =?us-ascii?Q?N1GZdUEZgoHo8OMvGlog0Zb95gx+bsDjMdP2Aie+NfWpIqyYwxCMB0PYgiSy?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 927c4fc6-c943-40c3-72a4-08da79ecc43b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:51:44.3286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lxk7t9k5L5TKtX4gxNyHvBNpwdjkNF/6Xqee/9TXXcCrO9g6NLaZ4ODOoLszLcNiEJY7Ui6S9Lv/5liloqekBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:03AM +0100, Mauro Carvalho Chehab wrote:
> The return code table is not properly marked, causing warnings
> and being badly parsed by Sphinx:
> 
>     Documentation/gpu/i915:130: ./drivers/gpu/drm/i915/display/intel_dp_link_training.c:183: WARNING: Block quote ends without a blank line; unexpected unindent.
>     Documentation/gpu/i915:130: ./drivers/gpu/drm/i915/display/intel_dp_link_training.c:186: WARNING: Definition list ends without a blank line; unexpected unindent.
> 
> Use table markups to fix it.

cool, I didn't know that

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 9feaf1a589f3..23a269fcf6ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -177,12 +177,14 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
>   * transparent mode link training mode.
>   *
>   * Returns:
> + * ====  =====================================================================
>   *   >0  if LTTPRs were detected and the non-transparent LT mode was set. The
>   *       DPRX capabilities are read out.
>   *    0  if no LTTPRs or more than 8 LTTPRs were detected or in case of a
>   *       detection failure and the transparent LT mode was set. The DPRX
>   *       capabilities are read out.
>   *   <0  Reading out the DPRX capabilities failed.
> + * ====  =====================================================================
>   */
>  int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
>  {
> -- 
> 2.36.1
> 
