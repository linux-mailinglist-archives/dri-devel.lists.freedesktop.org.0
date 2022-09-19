Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B25BD87B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 01:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EC110E214;
	Mon, 19 Sep 2022 23:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD2A10E0A1;
 Mon, 19 Sep 2022 23:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663631659; x=1695167659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Smlm2SZB8DEgdyeeN+iXR/GIiFE391flKsN5Vuh52K8=;
 b=ENvXoWBkgqfD7332z/xjomnkMXdYkpOLxt22EHifyxJ3XI1wGrNZ8rn5
 tnqsOi7vz+gXOOQzdMYNjPnzLDe5bNmJ6SIYgKg6VSCwrfsRcdYCfdE4h
 f3EnBW0YA6HxLBQT3+DmwkDa9TbG5IpG7iqU70J31AZWZf8KPDpLn0bVS
 Khdly/pZv3DHJ2cNCIdI4kPAWOvcKkhFTUBrennKqLiHKa5JoppdbKmp+
 /QgW+AShEeorsKTTINkHpjgsRafkMX44ON0j0qM17uCyhi/0ZxjSXfKKd
 trYd6L4b1LRMEZ+lircR22jd5vglRPuY+dPMuQyweU8U4cesmwXjyGV0i Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279933338"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="279933338"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 16:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="687181778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2022 16:54:18 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 16:54:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 16:54:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 16:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny/Ucpinw1WCR93TB78ZBYT+Rlpf0p4JnKOm8i1ZHfiYVSZMSXV063Pf3bQGI6nizu/+Juiv+ZAegOwdnqrsViCRG5U88A5OJS7zGkFFy6u7q15098GU/TXK21oidy+c4wZr1wcPvyn7dgqHd7ll03pYf7iOL2O2o3WMaTzKVRHI/mwAnurOOowyj4RCgqF2aFYE5BmIXyzc2lcjQzQ6BiyBi2iRrLBfN9RNIZYJfmFKEK2BnM4fG6R179cFXMNP6iv+SKxHVDBPv1D28Sbx6zLOtN1m9OdWVIcBaHoLupVT67m/ebKP6Gw7t4r4qrkTy3NHU7fvY47tLZ2SaR8vOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE9iKxpNn5C4r96Gwz9TPA6JSuFqA6LcGmSn9PZ2JWU=;
 b=E7doMzVbHwGVfxAcb85gigFLjr6dGGjxG5FDgT6DXkFm+XhIiOv3kzkcMD7m3LnCCZ3owcG6Xzn7DMp+0ZPVGEcGYsI+iaUZzMHeLcpUT6DmwDhv9U4hR6vUb2oUKze7JD/2QBoiYkjgGvopiA1VsyGC3smzIMP6oz2LG/M8sYYki7NJmP9Ndrj41uiaj0Ig8yzPfNDU93ou1JzsNYmEfLQvDEivSqwk3ljipQyvcqPK7rV1Y7FGqdvgcYuhoEr2kQti4FntCCS0RG8Xp5PVDokCHHdtAWOY/9p7crMR9JJTT6EzRVG46TGqBWYwV7a3GP2TASq9BlCzTkblpfVTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 23:53:39 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5632.021; Mon, 19 Sep
 2022 23:53:38 +0000
Date: Mon, 19 Sep 2022 16:53:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Bump the reset-failure timeout
 to 60s
Message-ID: <YykBAI4OWn6fuxD3@mdroper-desk1.amr.corp.intel.com>
References: <20220916204823.1897089-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220916204823.1897089-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: e01651c4-2f5e-4583-ead5-08da9a9a2c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YgExHT/pAGdO679dVA87dHD/8e5S9DZ6ylrVpYov9NUcIML9ddUW91tc/d514G/i+TbLLKR8PojYkMmvvTNkHXY3y3vz6SJNgs6SBBwGS5Fjl826SbH5wlLDRBPEpWCNgZw6YSwq/8c7xR2bxhJfqp71Xa6hwJsIbt/FFUAFJSdLKFYxAlItuc5wAyBNtuMyBS17z/OkyMCQcZqLqLnsECnqYWHDU5De2TIXSRz9PeeraAfE1HytPTCQVH3RelmBHB6OTppTLiC94gAdAkvuIv5rRGAfx1WprXB+xxd4zxmpGtK+CDTuYq8gp9WIBgGHP++6RsqW+VfHmnghTZgf5BfxlSSNIWinHUQAhoC6U2aHTYouUZtd98SAEoA09QnyR1sHijlOvSVxqRKJn50s/z+ccpAJhErqw/gEtLrgztPW6b14BlzwBYUGU9YMxQ0QuxPTSPmVU+1T4BXfvVRcvv4Zcw2srdPSwxtWRjxdsiN7p5kCzyVPpYo5fsSQGiVdPDcoCv6Z4HYUVjQ2AD7YTbq7cjt5XmmjZ2AXC1iXOUbJkOngp6Su2dIvc56Miu4PbycWTAouXOMvAWVOwhm0q19KIraeBczdx8n43fASeJW3dU+HwWx4BQmWtz10aFueGCNO8pvOYRjwIFGOX91CGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(38100700002)(2906002)(6636002)(82960400001)(107886003)(316002)(86362001)(26005)(6512007)(6506007)(4326008)(66476007)(66556008)(8676002)(66946007)(478600001)(41300700001)(186003)(83380400001)(450100002)(966005)(8936002)(6862004)(6486002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gtJ5fhrH3rmQePK4VG8qqOw1CncIyaEGztwnhMx6fp0Sc2/JhKjO9fsuPMQr?=
 =?us-ascii?Q?MzTu4kcDvXY7LtanPba/52ZRTV7XlOwP8qAKFNxB0lzzU+mPtMULTLkk1OTI?=
 =?us-ascii?Q?3TybRD2SPEYsyGZrFWJJt7C7EwN0G/L/jUFuC97qijQN0r5VsPGQvxTuo1Ak?=
 =?us-ascii?Q?s3BMVSmJ8j/C9PHRFl+jwpZ3IkAZ0LfkQSwlCX7EmkHeOyPsDZRrDY7p3C5M?=
 =?us-ascii?Q?NXCg9W50SkWtd124FGtQuOJCeGRjX0CDWb37VA6Lu+wQfHeFfgVcQCtyBHDY?=
 =?us-ascii?Q?ZzfBqA9IPXVtLRjiuX7YEAQ4zqeJECJD3c4jhGFrMLYR43nEF7rqaCdUN4YK?=
 =?us-ascii?Q?AMYWS0BtYsmbiVcGKBOJa/m8MQEYlItZHWK7K0iZisqDXRcCpf8YP17titfa?=
 =?us-ascii?Q?obQwxkFzGxncyrCWCnBCEHiSWSqIHY8VXumqfuvCbutO3KipawfZxBZe+V4p?=
 =?us-ascii?Q?m4pcmYQ+Mv4qFkao5hNexcDX54x+q0ZtjYQPWvYWOAOrH6sIl1SGc73VXZ1Y?=
 =?us-ascii?Q?C8Rd2EX7o7nTnkVb9eZz/6dAJddEx8qEwIwtwZEsny9/p5/VO7PLNkAKx4z9?=
 =?us-ascii?Q?TlDmmpJc4OQqRPk8zmycBgC2IaR7MAfrV913q9nnylH7/34Uyi7xGXs6KM4e?=
 =?us-ascii?Q?eOoZBZSd0CWthuBFk3oKK7zcug5jWhbfHVOCT4qVjWWf9CqgqHq16ujhBIws?=
 =?us-ascii?Q?AJDiWrjdbDPr3+tmE9GIA8ZEi93nDDwanv77KFz8PV0MUBh57/1QyPytNTdQ?=
 =?us-ascii?Q?f6QOmDqDqh917iWI2fqym4Vgqz1XCKZ7Yvci+L6Q0rHrfuQL5DOYM7+NBwHn?=
 =?us-ascii?Q?+qL3YMm4oqacwz3VQRMiYNQ66wOf0B8vFISDXQmLULHHzwPFuSYx2/0ygfev?=
 =?us-ascii?Q?ghXQmJzVtBuz4UqMVyZgAv0ntpB2HiEy1Jogx8L5BmHT2NQP2GP8PRR/J3b4?=
 =?us-ascii?Q?wEa8XAub30KG13Broe9Fs7a10kf3rLKd2a2lSTP/r+TF3tbb3GxnBoSi+cjQ?=
 =?us-ascii?Q?iMGNkpgsYpbKlT5pvC7SP0obgEQ64KAPFkOE2J8VmtPk6sPHFAriPiYUBfRL?=
 =?us-ascii?Q?gUmAb8zj3Jid+/Ko4BrR5aKRyPLgrpgZoHdna/YOB4LZnTqBrqyhrjoLbk17?=
 =?us-ascii?Q?rxgrt1gyHSqX1p+rX3AZF8Ew3fVBKGLuJ4J0vm6TUMOyw5FUi+tnLSPLSksl?=
 =?us-ascii?Q?sxjPVobnLE48TepKJsq48ugqgS/3gZIuK30c8JuUozBwsavbll0Y3eTNaxLX?=
 =?us-ascii?Q?5wupr75Y5BaOmhNCEGoIx4TK15Q/Yhx0bQwqVWBWoe+nUT4yTxIajb3NhZdp?=
 =?us-ascii?Q?RpvDWh0zv4uizXZQ/3EZ+kwBfahznOgOeooXz91whHOPYHNvaQQw6v716bup?=
 =?us-ascii?Q?xij18qu5x0VHEJCpjxcKe6oNGbBVKFnxNOjfN5BqjQRPim9/MP40UNRSpErx?=
 =?us-ascii?Q?QFBHeVvkR8YlUPzqD2S7zGhVEtSRJr3VVBkHahSTq0NF2ZvYbBHfAAmoD8lU?=
 =?us-ascii?Q?x4U47ceZyH6kBxroDM1ILA18xpRIvM2dTfTm6rTqx6H0i8YqZQbwelegIGZU?=
 =?us-ascii?Q?6HgF/Q8/i2WOFF3IFhu7hvqtq35oDF46c3IejzG7nzpOoFnE22mazv/OHvpe?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e01651c4-2f5e-4583-ead5-08da9a9a2c56
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 23:53:38.7599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdGEZJYog221qX0FVWJ8crXXGcwycGUfnrRvtVuv/D+H4pnPUbMuNz8ABbFM2/IpjJgXzLWdMLa+d7JxGScNKdJfHe6QnhfYjluzwDtU+qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 01:48:23PM -0700, Ashutosh Dixit wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If attempting to perform a GT reset takes long than 5 seconds (including
> resetting the display for gen3/4), then we declare all hope lost and
> discard all user work and wedge the device to prevent further
> misbehaviour. 5 seconds is too short a time for such drastic action, as
> we may be stuck on other timeouts and watchdogs. If we allow a little
> bit longer before hitting the big red button, we should at the very
> least capture other hung task indicators pointing towards the reason why
> the reset was hanging; and allow more marginal cases the extra headroom
> to complete the reset without further collateral damage.
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6448
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Seems reasonable.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index b36674356986..3159df6cdd49 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1278,7 +1278,7 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  	kobject_uevent_env(kobj, KOBJ_CHANGE, reset_event);
>  
>  	/* Use a watchdog to ensure that our reset completes */
> -	intel_wedge_on_timeout(&w, gt, 5 * HZ) {
> +	intel_wedge_on_timeout(&w, gt, 60 * HZ) {
>  		intel_display_prepare_reset(gt->i915);
>  
>  		intel_gt_reset(gt, engine_mask, reason);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
