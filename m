Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C438B643F14
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 09:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A35B10E309;
	Tue,  6 Dec 2022 08:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975D810E302;
 Tue,  6 Dec 2022 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670316758; x=1701852758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+LjC5a1R1CggzJQqtvcgjsZoNj1N838+yLbakdksMo8=;
 b=L/nhuJoNE9udT+8FC1yu+C6EQnyuO0r5p/PD90U175QY4Uf/ypKQOBqU
 stC8pGtC3gDQ9+6MRI+PYUCu46rA5W3b0xZ4c97tXkHBpTR+JSRbGdX1H
 KjwbZmDrMpmTx9yWj5cRAZQIwZc2nkxpEe5mirOd4zrsY9Zyvk3N26Zdm
 5gEw03JNtEzh6rtq8l7tW6K9XGYZWuZyXd8L/Xfk9+dns3XlM0Os17ZCS
 clKrMWm8qeopFcho4pCDpMbIQVYE/Dv2fhNiJg1AHwzIRk8MItRisTr9f
 TCGaFOpiYpEXDvDu3XIUVVVuKSt989vhaUQaqg+uqX++fXIeWUR0legYR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="378735188"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="378735188"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 00:52:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="734917228"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="734917228"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2022 00:52:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 00:52:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 00:52:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 00:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa6CinlLwkCcKBG3ihD0CcYviNNv2xSh5tESI9+5q83txsgwtZXkw9t13h+l3Dcsf/kR7w4Q8x80TCuAQCZkg1I3QeJv29lz8RS8JgLf1s+28e+mhma7cYtGqh/PUSW+FbxhlMKiw3LZq4F3r/Emn0NBN1QYCifyNgCxf+yVY2HbO6MMe3y+60zynzrHM+ZGmuHWlbjtLwCNPX8M6t/vHassiG92G/kAcecFpe5SCb+EBVH3gVk7X79vYS7Blhz8Y5rSdMH4KuzEv3fNW3eiZ+fLYaO5/b8PBJFxbDHbEQCXM2ywjqIRhAqtoRG3YyCl5PyW8yOKT6uY6ANHsQMf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maIV9Jvf7yM7nttoqjssb9+vw31p6sRGblYIExRKF4o=;
 b=TfJi+npwBw7ub5818Khd+DZ/E8Uw71Vv61TFhDFFaS13fm+QWnFbtnUb2ip1U48t5ScDbjZtuGZH/7+itHkMkvetj44eMq5jVNtDq/eSKH22lcxbGH0GEvvOPdLy626x8RbljiyzIFfpiSqjmBF7hpAnZCwM/4cqhf6J+JaI61316Cmt9vQwUBZTwBlJu/FySDhnCu+CwlKH1J9eIFydpyebZUVSK8A0uR3NDxAcPF9NwqxL4wZqrXmjr/zuuBmbcjiZ3RKnQjrMKAxEqKpAkCVfyUtIV0Imaeg1KXdzAvSSFLysN+6yWM1pd6XDIRMXTsdtFPRhfUMReJHXsH7G8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 08:52:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 08:52:12 +0000
Date: Tue, 6 Dec 2022 03:52:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/6] drm/i915/gsc: Do a driver-FLR on
 unload if GSC was loaded
Message-ID: <Y48CuM1ZEPljZx4j@intel.com>
References: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
 <20221206011908.2745508-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221206011908.2745508-5-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:a03:167::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: fe83eb00-9260-4f22-685a-08dad7672ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKTasP5pgF0JVHdlKi0PbZWzduI1OFlmxY7DSjDiHJDQ1ccdnF7EN2MR1oRBYJ6R/uik+dBYwVvassYuKYK23qeNAZ5m/EHA+L9sUL7lxN10/6YqexQ7CBMUL0gg/Zz5CeYDAIVsXRH/to8Uc3KhYJoW3QiHevB08d+azb5XkkGO2X8qVX3szgzPHpK+O31EbYxUV7ZlJWY3KdncxvfKnKoQMd152uScraCYSvJGHjHZQYas1dui7WxhEV4TCN6NADQIqIuuiIFufAZdP4nDAhcyDKwaWEEHXwKZH0YwgrDX73jkgszFSB/6ycthpJfDuJJEGEijlcH/UU2NV0ka2tM6WbbkA5nXfh2JCasLOorPokaNI4QA8Qamg+u1ng53RAxBznpXvZ8/M91E8LshU43Sggd95a3MQ1s1q3AbDCrhP6063Dhq0NmSTcOz0IcEUO+qhqqL5M9TYJSMdWnS4Q3BXGoYn+9BOo3GpyDtnzaLPsN+bXVdsuk8gcUFl5Dqk7xNEHQpxa2tTS9hOaZza4nHtU4u4PMzUyiT/+6gc93+eOin6FakNufl8cKmmyKiYGfS1VnnZU3SNDVIJZjx8wN9uJKor+puWz1mdgs1L5F0uGYnaPIKikwoohkJRHET2v8Qrpn69pMNSrzvhNb9sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(37006003)(2616005)(6636002)(186003)(26005)(6506007)(38100700002)(316002)(83380400001)(6666004)(4326008)(8676002)(41300700001)(6486002)(44832011)(2906002)(478600001)(82960400001)(66476007)(450100002)(36756003)(66946007)(6512007)(66556008)(5660300002)(8936002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7u7rIE+iPlbhSA9R58znp2fdR+y/Acnf8cEhEh6ZA5L4OmotFXPqUS/X3JH?=
 =?us-ascii?Q?mROnpiJZ4TbDWtnvCAhcXlw38+0mtg4urg+I2yZdguPQTdbsNiFmFbp62fRS?=
 =?us-ascii?Q?s2gLRCm+NsDPANwbfTElQk4mMrlJYWeH0eiL9LL9d3xPePCAVUXSvj6vSD6Y?=
 =?us-ascii?Q?2S1NWUb47oPSLHiF3roChv94P7ietszdvAHwHAohys0LU5MAGFM5L92JcSXI?=
 =?us-ascii?Q?mqqN/qMo/knK6bYp96Jq7GA9mpgNqTm2A7wkUD+DizI9/H3CAIPxqM5u2TUG?=
 =?us-ascii?Q?5SdEqzop7Bos5rr84T3w/mHS2HIQwiKt2rtGrGDySef8FLRBemezRdD2LuPa?=
 =?us-ascii?Q?MAojKF/+zRCylerqq+Vs5lavFHvuBpQ8Ooszb7fULmHpSK73yiaEP7C4vBE8?=
 =?us-ascii?Q?PzRyUx+e4v5Ko/GWLHF6bTfbVGCAnAJ5fcWkNOdjros0QlNwUnQjYhwFkqot?=
 =?us-ascii?Q?7xAvBItXmbSIbAN+ib79S/RwylAHdw88RpPtasZ9tfGIqH1zLK/BEpL7IGtO?=
 =?us-ascii?Q?f2OA7MeVPhZNLfWmNOrDhjz3Udw5uwZzALhy6IPP1S1n7K2c/8/OLFPWoOF+?=
 =?us-ascii?Q?7u2NytyHxKWjWfEUHacbdac0YFKyjySvqqIiLSCXsvCiW0nRdT/KKiFPyRHN?=
 =?us-ascii?Q?Xu2aJY1NSNnQYY2tdcuY3UIO9KDyYXf85Er8ZWKw4BVhkguPVDkH4/8wVJdf?=
 =?us-ascii?Q?uS4MvpKv91PdKm1NWh7gnMQd92Kd/a60rFPmsPHQBpr2OoGJtQozVt+mvday?=
 =?us-ascii?Q?JvyEvOQxpjxqGaDx6NaRp7X3p+Elvsn0F8ife7xTl3f5wsZ0m7DurKIDF3R3?=
 =?us-ascii?Q?m/RVfFwYwDy0qZB3JIPv3X2sbrKH18H/kw5kAuLZ9ivIJoiQB0vBF/Grm9X/?=
 =?us-ascii?Q?1ptvutskjfcsIK1EeMeLUTT085WcWKOoEd633mbhWqf7Mye0h+lo5kAeTN+7?=
 =?us-ascii?Q?aXrBz4Yck+HDTSgn8rAHGdrQ9xILZr++fnagBqto5Pw1NuTl8DK30I//Y+Rr?=
 =?us-ascii?Q?3pl1XAdyt3wHBWx1ySCthC9d0rfZVISpY7sVnqq/k2TUj/FeqsY/v3cK1W9b?=
 =?us-ascii?Q?2zIjRJt3uwnfQaWAp8Myl39rTnJD6w4bq5klSvpMiyvTV2rqubiMCFGIwxN5?=
 =?us-ascii?Q?24A/OP9Q+wzQFPnxukLwfN+1PtU/GkYXg18IMcW/rnbtpog+3IZEVb2nbEeV?=
 =?us-ascii?Q?3bA7fNAOqXFyvR9b8vUeEB1BTRt/sfTO1rLEPt9uZw5eaEpB7GowyzLVHVPu?=
 =?us-ascii?Q?E4sn/76C+NkU+G9XZ+fzuNYIiMOaHFrIWEn5sove86q4A964rxdmhZcG4F0z?=
 =?us-ascii?Q?Vu4I9pMWQpAAxAK0v2RBAcnSGHzVqB18uLpvqnRHB1gFpRACQeAoTUPyak7w?=
 =?us-ascii?Q?kIIztTVZ/CAyb0wLodmZPvLAVI9uzwkT0h5Rpcz4daVmLyObWkZXVmhKsJbu?=
 =?us-ascii?Q?UqxCD4BCJDBLIN2DKNpoM9zRf9rFjJ83ZlBr3JOkWnO110zEUJS5rPHkfGz+?=
 =?us-ascii?Q?3eHZDP0so0d2jfSTJgnTfSoqJuc2T9PR3yam+nsGjnrXTvQa8qGCwUXf34tm?=
 =?us-ascii?Q?mjTZYYv3yUnBgUOE3VqeyCgaUp8ghmmTusYBHsF3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe83eb00-9260-4f22-685a-08dad7672ab1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 08:52:12.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh+9dRkgAu8RnS66lIzfii+OAgcwcP2RDNp+hZDGWpa+Pz91MWsBJWsDDWKbz5LYqs/Pnp3TCFt3i0oZ2LhGxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 05:19:06PM -0800, Daniele Ceraolo Spurio wrote:
> If the GSC was loaded, the only way to stop it during the driver unload
> flow is to do a driver-FLR.
> The driver-initiated FLR is not the same as PCI config space FLR in
> that it doesn't reset the SGUnit and doesn't modify the PCI config
> space. Thus, it doesn't require a re-enumeration of the PCI BARs.
> However, the driver-FLR does cause a memory wipe of graphics memory
> on all discrete GPU platforms or a wipe limited to stolen memory
> on the integrated GPU platforms.
> 
> We perform the FLR as the last action before releasing the MMIO bar, so
> that we don't have to care about the consequences of the reset on the
> unload flow.
> 
> v2: rename FLR function, add comment to explain FLR impact (Rodrigo),
>     better explain why GSC needs FLR (Alan)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 23 +++++++++
>  drivers/gpu/drm/i915/i915_reg.h           |  3 ++
>  drivers/gpu/drm/i915/intel_uncore.c       | 58 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_uncore.h       | 13 +++++
>  4 files changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index f88069ab71ab..e73d4440c5e8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -166,6 +166,29 @@ int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
>  	if (err)
>  		goto fail;
>  
> +	/*
> +	 * GSC is only killed by an FLR, so we need to trigger one on unload to
> +	 * make sure we stop it. This is because we assign a chunk of memory to
> +	 * the GSC as part of the FW load , so we need to make sure it stops
> +	 * using it when we release it to the system on driver unload. Note that
> +	 * this is not a problem of the unload per-se, because the GSC will not
> +	 * touch that memory unless there are requests for it coming from the
> +	 * driver; therefore, no accesses will happen while i915 is not loaded,
> +	 * but if we re-load the driver then the GSC might wake up and try to
> +	 * access that old memory location again.
> +	 * Given that an FLR is a very disruptive action (see the FLR function
> +	 * for details), we want to do it as the last action before releasing
> +	 * the access to the MMIO bar, which means we need to do it as part of
> +	 * the primary uncore cleanup.
> +	 * An alternative approach to the FLR would be to use a memory location
> +	 * that survives driver unload, like e.g. stolen memory, and keep the
> +	 * GSC loaded across reloads. However, this requires us to make sure we
> +	 * preserve that memory location on unload and then determine and
> +	 * reserve its offset on each subsequent load, which is not trivial, so
> +	 * it is easier to just kill everything and start fresh.
> +	 */
> +	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
> +
>  	err = gsc_fw_load(gsc);
>  	if (err)
>  		goto fail;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0b90fe6a28f7..b95d533652a4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -118,6 +118,9 @@
>  
>  #define GU_CNTL				_MMIO(0x101010)
>  #define   LMEM_INIT			REG_BIT(7)
> +#define   DRIVERFLR			REG_BIT(31)
> +#define GU_DEBUG			_MMIO(0x101018)
> +#define   DRIVERFLR_STATUS		REG_BIT(31)
>  
>  #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
>  #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8006a6c61466..3bfb4af0df78 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2703,6 +2703,61 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>  	}
>  }
>  
> +/*
> + * The driver-initiated FLR is the highest level of reset that we can trigger
> + * from within the driver. It is different from the PCI FLR in that it doesn't
> + * fully reset the SGUnit and doesn't modify the PCI config space and therefore
> + * it doesn't require a re-enumeration of the PCI BARs. However, the
> + * driver-initiated FLR does still cause a reset of both GT and display and a
> + * memory wipe of local and stolen memory, so recovery would require a full HW
> + * re-init and saving/restoring (or re-populating) the wiped memory. Since we
> + * perform the FLR as the very last action before releasing access to the HW
> + * during the driver release flow, we don't attempt recovery at all, because
> + * if/when a new instance of i915 is bound to the device it will do a full
> + * re-init anyway.
> + */
> +static void driver_initiated_flr(struct intel_uncore *uncore)
> +{
> +	struct drm_i915_private *i915 = uncore->i915;
> +	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> +	int ret;
> +
> +	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
> +
> +	/*
> +	 * Make sure any pending FLR requests have cleared by waiting for the
> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> +	 * to make sure it's not still set from a prior attempt (it's a write to
> +	 * clear bit).
> +	 * Note that we should never be in a situation where a previous attempt
> +	 * is still pending (unless the HW is totally dead), but better to be
> +	 * safe in case something unexpected happens
> +	 */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm,
> +			"Failed to wait for Driver-FLR bit to clear! %d\n",
> +			ret);
> +		return;
> +	}
> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	/* Trigger the actual Driver-FLR */
> +	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
> +
> +	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
> +					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +					 flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	return;
> +}
> +
>  /* Called via drm-managed action */
>  void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>  {
> @@ -2716,6 +2771,9 @@ void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>  		intel_uncore_fw_domains_fini(uncore);
>  		iosf_mbi_punit_release();
>  	}
> +
> +	if (intel_uncore_needs_flr_on_fini(uncore))
> +		driver_initiated_flr(uncore);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index e9e38490815d..9ea1f4864a3a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -153,6 +153,7 @@ struct intel_uncore {
>  #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
>  #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
>  #define UNCORE_HAS_FIFO			BIT(3)
> +#define UNCORE_NEEDS_FLR_ON_FINI	BIT(4)
>  
>  	const struct intel_forcewake_range *fw_domains_table;
>  	unsigned int fw_domains_table_entries;
> @@ -223,6 +224,18 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
>  	return uncore->flags & UNCORE_HAS_FIFO;
>  }
>  
> +static inline bool
> +intel_uncore_needs_flr_on_fini(const struct intel_uncore *uncore)
> +{
> +	return uncore->flags & UNCORE_NEEDS_FLR_ON_FINI;
> +}
> +
> +static inline bool
> +intel_uncore_set_flr_on_fini(struct intel_uncore *uncore)
> +{
> +	return uncore->flags |= UNCORE_NEEDS_FLR_ON_FINI;
> +}
> +
>  void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
>  void intel_uncore_init_early(struct intel_uncore *uncore,
>  			     struct intel_gt *gt);
> -- 
> 2.37.3
> 
