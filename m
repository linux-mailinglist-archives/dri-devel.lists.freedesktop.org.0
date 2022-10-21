Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C2A607BEC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9D10E4CA;
	Fri, 21 Oct 2022 16:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3CE10E258;
 Fri, 21 Oct 2022 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666368935; x=1697904935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FLVF7fYnDVmDiNGru3P9MbSVILJpW3moLSIicJ95Oww=;
 b=BLncbUgxw0TVEKQi30WpB8qMjgAIRIJ58zX6TRfCF7pdHvx1iGh3NTzQ
 q06pXwxjtaAmU55hEWIBCURzH54GCMWczXcdKYFlIQMcLXqTBRkv0UmZJ
 w22oOd8BwNQnb41gWvC71d6lDwUwLCYeX6gHiCHTv3JCrRQunAsezWz5O
 TRKumpbVaEcfvO0Mi1tdRVtTvmCljbn/IQxZYTOAHk6aq+NzA/8P+f9fg
 yCNxAEpuZkLqaM6q7Dt3vDrC5Qx2VGzuigmoMh/cpYhTc6IYmNvw2uPrI
 +mHub+n0nxX63R0D26HPlKe2HD161OXMSyCUHATbskcj07RdG/MlWFBDH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="290347523"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="290347523"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="581650316"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="581650316"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 21 Oct 2022 09:15:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:15:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 09:15:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 09:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRQLsRqEDesD6LMsVoUN2iuIueRle2VSwYnLgdWYXE8M0zC3scKcV7T8rleYKX6uViFvPXuIFtvNGAfLyW11OdOFspNuJtTtK7B66nGkdN7k+m914aJlvDM4SA/5wAUHTfD0iSYX3/2nPA47uI1VQMekQDHAcWu7O62kWbjOSU4mpsaTfNLvRtTNx1LvmCMWGZIL0ZFYI4TpU0HMgx0OlwltRx87KLfDivDtb2fiPZtZq1t/vfbkjKGa2qFKX8hM0wAmE1P+b6PQgvNDfx3j1FN0adkRmc9Wx/i5WDF+14yDiLXS6JBYbI2voLzr0/liRHvujubDCnNSg70YVXU6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhEkvQ3S7H/pzvyW78kwEnvwNlB3TB0Wge9Dj5yqBxU=;
 b=n5SIeT0mq0+T8IzrjY7jamzTNGRcFcIBjECHdTKVNg5SnZXEI5q5Gw2cDp1BK8coEczwOogCL2gncJSCvVgcn5qeW21C+HVRBDTZEafxD/wp3MZG9huKaE/tdUcCEzRYcBr2kNHtOlQwcX1JWj6i+52pi7735neGPfSnMRHYOAndcMc4Foioe6npz1tAO+kcJfmd+AErgEIXof9I4jti5HIOiROPAUbm43naZTeMA+HoltynGK/CDHjslL0BrB7nC2vnlWYxtUkg7byLkidd4ARXfYuPhDfyqvvv7j5mOyVHyA/7npT/O5Wurixo+9PTNDP/sh6d3uS1hTGoSKzRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 16:15:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 16:15:29 +0000
Date: Fri, 21 Oct 2022 12:15:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 4/5] drm/i915/gt: Use RC6 residency types as arguments to
 residency functions
Message-ID: <Y1LFnWB5Ot0IQJjw@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
 <20221019233721.3270601-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019233721.3270601-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: ce94712d-53cc-497f-e468-08dab37f78a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKktp8Qc4TAMa4rmnLmmO7bZ+G+jxfbO9hK3cVL4SDz30run7k8phAOddJAd6p7zJwIG5N9reiUgRIor/HAJH671GU6bQZYZCAEfjoBJsj1OUwUCOXNCnPSogWZjKy84oKft8Zvp2YvnlHsGpZXKtI9PcOI/W1y8do5J3yoofwPZ5tTpLa5m5l444ScFhlOkC9xfudW5CulJFUzk+QkIn228C/8xgc3R4zMxeljFpjiQf90mqXNi1Ybjc2yA5/yEBlAdiY7DGZFXhxGjt3rnjvT+ZL8GcS9JV701Xv9C61c8wnOgo/9nyoWotFa/cdtK8Euco0NL8v/p+ycjbQfqvnU8Ic7SBYeoPC+qG6c2/pev0VeWuJiU47wYd0GaABum+YHcuuuHOgf28yUvZDMBfEfXkMHcxdgjd7Ciy/iHPgglrU+qHVgJ/7hNE5fi1aKL0PHQ9jB4OE6JSWYxMGGTedDW7xHWuIz3mvtxqbDjlv6+C1QTIFyYIgKxiLMWrcyJUPKOqLdPaaGeidICAQfGI3s/mWsSz6UFVXDJuMmj2OP6MP6mEQ1Zp1e8Yof5O0wyPBewke5hjqe6MZ13nz448M5yTzlOq1rSIfTQpSKX7pQ+bpzTRnpJtN2ngxMT2mWmTOTD3rXJAhmmpV9TPBCGdQO2t34LsGoKpDbbrPs/oV+KequOUeopbvqpOdeQMNS8d+p1YrucWIQ0DwYlpaoq0R9zFmP09BXEHYna/yd4GzlauSrorztGkS5E6qgye+Tw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(8676002)(38100700002)(86362001)(36756003)(6512007)(26005)(2906002)(30864003)(44832011)(41300700001)(8936002)(5660300002)(6862004)(83380400001)(82960400001)(6636002)(6486002)(66946007)(4326008)(450100002)(66476007)(66556008)(186003)(2616005)(316002)(6506007)(37006003)(478600001)(6666004)(54906003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JFsh6/bJYYdsqkHT+zilKWOVHSGDzU0iYp10e8WfN64jwSfEisrimH5rxvM?=
 =?us-ascii?Q?ma3+J0XcnIKOVME8sPRDRQ38IPB8he/Urol0U+N+g38C5R+hCHefe7K5Lo4W?=
 =?us-ascii?Q?yBAvEELKBUTBRJFEGjvopy119IYE3FABrtiLPad2y3sveYleBFnPJRX6X/HE?=
 =?us-ascii?Q?da+mc3sUsfFOypLcRkE7iXmi39Y7gpIK128+yjBnqMM5XQ9LJoqztotUqxaf?=
 =?us-ascii?Q?fP3eb67HYsoVqd9Y9Ys1Q9jMoQRon1ccQyGD8RG1ZBsxmDZsZ/h6rdiL/jnK?=
 =?us-ascii?Q?t9GbN9XWHt6dzvDdCAlwUEHQqB6QcEXZEnSRc2l0mYBEWoXYqC1685esTOvt?=
 =?us-ascii?Q?dYQSgym2dJpxq6PMPiO2VAqJ458ogV5aL6asEV3HZOKU7Pr+LGHacQz5rA1F?=
 =?us-ascii?Q?X+AtL6juv+VzJgbq7N4b0gtrvNKmAS9MI4Ee53sP4Ri/eaXErvYp2+ne8/Du?=
 =?us-ascii?Q?jODHSBKYaI4SOxg5Fu0rb14aPDe3gArPNkFRP3NFyubX1DnE2DlHw+BsauWp?=
 =?us-ascii?Q?lTfM9qQ2IWYOp/i1K490OOE2e7rZqO9i1iGrOxHMVx6nlrMUFBibC2/oQqOy?=
 =?us-ascii?Q?e5S4aeUOV1+bbMV9m7QcvyGlK1dy/H8hhI4ztSLvSjfIkB9chR5qudaMFQ3e?=
 =?us-ascii?Q?tSpBzXPAYsuOPKdRC+jy5n3dga9V8aaIgIQcfzGIyFfz8lEGSk0RJ1CNLs5Q?=
 =?us-ascii?Q?QT//jCTiLvkMgpAy3aCeIVFnsh2wyywt+QSp0W3RD/e6vlWeoj+BthN5SwJx?=
 =?us-ascii?Q?bvzzzxcxxLjWViKXSX+NPd91b4elos/QsJChI+DCoa2950JT10SULTPfdgZd?=
 =?us-ascii?Q?REg2uJRGPMBct2PG3rjG/7HjsuraK8l8J4e1S1q15/6ntYK9rWI79WhdCcOB?=
 =?us-ascii?Q?3ZtUrEWDagcc9sEYf3rJ2MxSPR7Ly7L2Ru3Dy74deD3wCTCtoJwl49iiDFAn?=
 =?us-ascii?Q?V+0uSHX5XCigWVWOPmLr/GNwmkEloXpFVA/m8O1NqLWl9sCocTqF4QD7XHvf?=
 =?us-ascii?Q?xIqjPjqExLrmRScYtTg+1slQVem1O/hGaPNUb7hplo4erftCto8AtRktb+ye?=
 =?us-ascii?Q?RGxRhHtSkpiDNVYqRVWiJfaZDzC+ZRO8iSdjjvIXbwPJ1iLdwI2MFjjXuGQ2?=
 =?us-ascii?Q?bkUDPcUHZLFPuaauaNmVqFhZb10571PVxe0FwvE564V+vTRxo4OkISoXDrNs?=
 =?us-ascii?Q?Az2RKQ5alPuNZ66Rwo+q+t+UijEoq1kY0wr9/ND/q3AGwJGFUiFpZq7+JurO?=
 =?us-ascii?Q?KYgdnzSgTni9MildopEoc81wl3QLhOkBgehaWVqBdM4jJ2TXQyvAUZfi+fyC?=
 =?us-ascii?Q?U5MlMfyF837DesqU9hrGKuQwjK4MzSbQZqJv/+uhLAxw8gsk3ad6QV5rBRtu?=
 =?us-ascii?Q?Eso8SLd8TErlXBVSivHdZjVCppc9ETaBFLEnu5pgkvkG633DyJFixpT91Aij?=
 =?us-ascii?Q?ASMnTa1bIVrooZFW1bDX0V/r6X5vQZqUkaL7c9iQYqF4i//sVq42fFHSNlqq?=
 =?us-ascii?Q?24ZZdtt6RyHyBDQd3b6D6i6XB1OcQf9Zcwr3uoxRhC3NIpZm6BPH1iSpcb59?=
 =?us-ascii?Q?j9y35OrX7Fp0GRrmAWOiXX5bwGS3HlEmlBN7PC0VVIsSix6r22CUiiZIGKvy?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce94712d-53cc-497f-e468-08dab37f78a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:15:29.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTVjT+5xKgsKLlUmM6S/Jg1VPics9A+gSmeF6RLhXfej/7bqYsUl4e8X4sOFBDA7C4aJ2MBHrF7N7IVjPC639g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 04:37:20PM -0700, Ashutosh Dixit wrote:
> Previously RC6 residency functions directly accepted RC6 residency register
> MMIO offsets (there are four RC6 residency registers). This worked but
> required an assumption on the residency register layout so was not future
> proof.
> 
> Therefore change RC6 residency functions to accept RC6 residency types
> instead of register MMIO offsets. The knowledge of register offsets as well
> as ID to offset mapping is now maintained solely in intel_rc6 and can be
> tailored for different platforms and different register layouts as need
> arises.
> 
> v2: Address review comments by Jani N
>     - Change residency functions to accept RC6 residency types instead of
>       register ID's
>     - s/intel_rc6_print_rc5_res/intel_rc6_print_residency/
>     - Remove "const enum" in function arguments
>     - Naming: intel_rc6_* for enum
>     - Use INTEL_RC6_RES_MAX and other minor changes
> v3: Don't include intel_rc6_types.h in intel_rc6.h (Jani)
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 27 +++------
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 ++--
>  drivers/gpu/drm/i915/gt/intel_rc6.c           | 55 +++++++++++--------
>  drivers/gpu/drm/i915/gt/intel_rc6.h           | 11 ++--
>  drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 15 ++++-
>  drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
>  drivers/gpu/drm/i915/i915_pmu.c               |  6 +-
>  7 files changed, 72 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 979e602946549..5d6b346831393 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -83,19 +83,6 @@ static int fw_domains_show(struct seq_file *m, void *data)
>  }
>  DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
>  
> -static void print_rc6_res(struct seq_file *m,
> -			  const char *title,
> -			  const i915_reg_t reg)
> -{
> -	struct intel_gt *gt = m->private;
> -	intel_wakeref_t wakeref;
> -
> -	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		seq_printf(m, "%s %u (%llu us)\n", title,
> -			   intel_uncore_read(gt->uncore, reg),
> -			   intel_rc6_residency_us(&gt->rc6, reg));
> -}
> -
>  static int vlv_drpc(struct seq_file *m)
>  {
>  	struct intel_gt *gt = m->private;
> @@ -115,8 +102,8 @@ static int vlv_drpc(struct seq_file *m)
>  	seq_printf(m, "Media Power Well: %s\n",
>  		   (pw_status & VLV_GTLC_PW_MEDIA_STATUS_MASK) ? "Up" : "Down");
>  
> -	print_rc6_res(m, "Render RC6 residency since boot:", GEN6_GT_GFX_RC6);
> -	print_rc6_res(m, "Media RC6 residency since boot:", VLV_GT_MEDIA_RC6);
> +	intel_rc6_print_residency(m, "Render RC6 residency since boot:", INTEL_RC6_RES_RC6);
> +	intel_rc6_print_residency(m, "Media RC6 residency since boot:", INTEL_RC6_RES_VLV_MEDIA);
>  
>  	return fw_domains_show(m, NULL);
>  }
> @@ -192,11 +179,11 @@ static int gen6_drpc(struct seq_file *m)
>  	}
>  
>  	/* Not exactly sure what this is */
> -	print_rc6_res(m, "RC6 \"Locked to RPn\" residency since boot:",
> -		      GEN6_GT_GFX_RC6_LOCKED);
> -	print_rc6_res(m, "RC6 residency since boot:", GEN6_GT_GFX_RC6);
> -	print_rc6_res(m, "RC6+ residency since boot:", GEN6_GT_GFX_RC6p);
> -	print_rc6_res(m, "RC6++ residency since boot:", GEN6_GT_GFX_RC6pp);
> +	intel_rc6_print_residency(m, "RC6 \"Locked to RPn\" residency since boot:",
> +				  INTEL_RC6_RES_RC6_LOCKED);
> +	intel_rc6_print_residency(m, "RC6 residency since boot:", INTEL_RC6_RES_RC6);
> +	intel_rc6_print_residency(m, "RC6+ residency since boot:", INTEL_RC6_RES_RC6p);
> +	intel_rc6_print_residency(m, "RC6++ residency since boot:", INTEL_RC6_RES_RC6pp);
>  
>  	if (GRAPHICS_VER(i915) <= 7) {
>  		seq_printf(m, "RC6   voltage: %dmV\n",
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 9041609523697..19a60000e052c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -93,13 +93,13 @@ sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
>  		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MAX)
>  
>  #ifdef CONFIG_PM
> -static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
> +static u32 get_residency(struct intel_gt *gt, enum intel_rc6_res_type id)
>  {
>  	intel_wakeref_t wakeref;
>  	u64 res = 0;
>  
>  	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		res = intel_rc6_residency_us(&gt->rc6, reg);
> +		res = intel_rc6_residency_us(&gt->rc6, id);
>  
>  	return DIV_ROUND_CLOSEST_ULL(res, 1000);
>  }
> @@ -123,7 +123,7 @@ static ssize_t rc6_enable_show(struct device *dev,
>  
>  static u32 __rc6_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6);
> +	return get_residency(gt, INTEL_RC6_RES_RC6);
>  }
>  
>  static ssize_t rc6_residency_ms_show(struct device *dev,
> @@ -138,7 +138,7 @@ static ssize_t rc6_residency_ms_show(struct device *dev,
>  
>  static u32 __rc6p_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6p);
> +	return get_residency(gt, INTEL_RC6_RES_RC6p);
>  }
>  
>  static ssize_t rc6p_residency_ms_show(struct device *dev,
> @@ -153,7 +153,7 @@ static ssize_t rc6p_residency_ms_show(struct device *dev,
>  
>  static u32 __rc6pp_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, GEN6_GT_GFX_RC6pp);
> +	return get_residency(gt, INTEL_RC6_RES_RC6pp);
>  }
>  
>  static ssize_t rc6pp_residency_ms_show(struct device *dev,
> @@ -168,7 +168,7 @@ static ssize_t rc6pp_residency_ms_show(struct device *dev,
>  
>  static u32 __media_rc6_residency_ms_show(struct intel_gt *gt)
>  {
> -	return get_residency(gt, VLV_GT_MEDIA_RC6);
> +	return get_residency(gt, INTEL_RC6_RES_VLV_MEDIA);
>  }
>  
>  static ssize_t media_rc6_residency_ms_show(struct device *dev,
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index f8d0523f4c18e..6db4e60d5fba5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -551,6 +551,14 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>  	intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
>  }
>  
> +static void rc6_res_reg_init(struct intel_rc6 *rc6)
> +{
> +	rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> +	rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> +	rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> +	rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> +}
> +
>  void intel_rc6_init(struct intel_rc6 *rc6)
>  {
>  	struct drm_i915_private *i915 = rc6_to_i915(rc6);
> @@ -562,6 +570,8 @@ void intel_rc6_init(struct intel_rc6 *rc6)
>  	if (!rc6_supported(rc6))
>  		return;
>  
> +	rc6_res_reg_init(rc6);
> +
>  	if (IS_CHERRYVIEW(i915))
>  		err = chv_rc6_init(rc6);
>  	else if (IS_VALLEYVIEW(i915))
> @@ -736,31 +746,19 @@ static u64 vlv_residency_raw(struct intel_uncore *uncore, const i915_reg_t reg)
>  	return lower | (u64)upper << 8;
>  }
>  
> -u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
> +u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, enum intel_rc6_res_type id)
>  {
>  	struct drm_i915_private *i915 = rc6_to_i915(rc6);
>  	struct intel_uncore *uncore = rc6_to_uncore(rc6);
>  	u64 time_hw, prev_hw, overflow_hw;
> +	i915_reg_t reg = rc6->res_reg[id];
>  	unsigned int fw_domains;
>  	unsigned long flags;
> -	unsigned int i;
>  	u32 mul, div;
>  
>  	if (!rc6->supported)
>  		return 0;
>  
> -	/*
> -	 * Store previous hw counter values for counter wrap-around handling.
> -	 *
> -	 * There are only four interesting registers and they live next to each
> -	 * other so we can use the relative address, compared to the smallest
> -	 * one as the index into driver storage.
> -	 */
> -	i = (i915_mmio_reg_offset(reg) -
> -	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
> -	if (drm_WARN_ON_ONCE(&i915->drm, i >= ARRAY_SIZE(rc6->cur_residency)))
> -		return 0;
> -
>  	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
>  
>  	spin_lock_irqsave(&uncore->lock, flags);
> @@ -789,11 +787,11 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  	/*
>  	 * Counter wrap handling.
>  	 *
> -	 * But relying on a sufficient frequency of queries otherwise counters
> -	 * can still wrap.
> +	 * Store previous hw counter values for counter wrap-around handling. But
> +	 * relying on a sufficient frequency of queries otherwise counters can still wrap.
>  	 */
> -	prev_hw = rc6->prev_hw_residency[i];
> -	rc6->prev_hw_residency[i] = time_hw;
> +	prev_hw = rc6->prev_hw_residency[id];
> +	rc6->prev_hw_residency[id] = time_hw;
>  
>  	/* RC6 delta from last sample. */
>  	if (time_hw >= prev_hw)
> @@ -802,8 +800,8 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  		time_hw += overflow_hw - prev_hw;
>  
>  	/* Add delta to RC6 extended raw driver copy. */
> -	time_hw += rc6->cur_residency[i];
> -	rc6->cur_residency[i] = time_hw;
> +	time_hw += rc6->cur_residency[id];
> +	rc6->cur_residency[id] = time_hw;
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw_domains);
>  	spin_unlock_irqrestore(&uncore->lock, flags);
> @@ -811,9 +809,22 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
>  	return mul_u64_u32_div(time_hw, mul, div);
>  }
>  
> -u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg)
> +u64 intel_rc6_residency_us(struct intel_rc6 *rc6, enum intel_rc6_res_type id)
> +{
> +	return DIV_ROUND_UP_ULL(intel_rc6_residency_ns(rc6, id), 1000);
> +}
> +
> +void intel_rc6_print_residency(struct seq_file *m, const char *title,
> +			       enum intel_rc6_res_type id)
>  {
> -	return DIV_ROUND_UP_ULL(intel_rc6_residency_ns(rc6, reg), 1000);
> +	struct intel_gt *gt = m->private;
> +	i915_reg_t reg = gt->rc6.res_reg[id];
> +	intel_wakeref_t wakeref;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		seq_printf(m, "%s %u (%llu us)\n", title,
> +			   intel_uncore_read(gt->uncore, reg),
> +			   intel_rc6_residency_us(&gt->rc6, id));
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.h b/drivers/gpu/drm/i915/gt/intel_rc6.h
> index b6fea71afc223..456fa668a2769 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.h
> @@ -6,10 +6,11 @@
>  #ifndef INTEL_RC6_H
>  #define INTEL_RC6_H
>  
> -#include "i915_reg_defs.h"
> +#include <linux/types.h>
>  
> -struct intel_engine_cs;
> +enum intel_rc6_res_type;
>  struct intel_rc6;
> +struct seq_file;
>  
>  void intel_rc6_init(struct intel_rc6 *rc6);
>  void intel_rc6_fini(struct intel_rc6 *rc6);
> @@ -21,7 +22,9 @@ void intel_rc6_sanitize(struct intel_rc6 *rc6);
>  void intel_rc6_enable(struct intel_rc6 *rc6);
>  void intel_rc6_disable(struct intel_rc6 *rc6);
>  
> -u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, i915_reg_t reg);
> -u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg);
> +u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, enum intel_rc6_res_type id);
> +u64 intel_rc6_residency_us(struct intel_rc6 *rc6, enum intel_rc6_res_type id);
> +void intel_rc6_print_residency(struct seq_file *m, const char *title,
> +			       enum intel_rc6_res_type id);
>  
>  #endif /* INTEL_RC6_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6_types.h b/drivers/gpu/drm/i915/gt/intel_rc6_types.h
> index e747492b2f46e..fa23c4dce00b4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6_types.h
> @@ -13,9 +13,20 @@
>  
>  struct drm_i915_gem_object;
>  
> +/* RC6 residency types */
> +enum intel_rc6_res_type {
> +	INTEL_RC6_RES_RC6_LOCKED,
> +	INTEL_RC6_RES_RC6,
> +	INTEL_RC6_RES_RC6p,
> +	INTEL_RC6_RES_RC6pp,
> +	INTEL_RC6_RES_MAX,
> +	INTEL_RC6_RES_VLV_MEDIA = INTEL_RC6_RES_RC6p,
> +};
> +
>  struct intel_rc6 {
> -	u64 prev_hw_residency[4];
> -	u64 cur_residency[4];
> +	i915_reg_t res_reg[INTEL_RC6_RES_MAX];
> +	u64 prev_hw_residency[INTEL_RC6_RES_MAX];
> +	u64 cur_residency[INTEL_RC6_RES_MAX];
>  
>  	u32 ctl_enable;
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> index 8c70b7e120749..2ceeadecc639c 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> @@ -19,11 +19,11 @@ static u64 rc6_residency(struct intel_rc6 *rc6)
>  
>  	/* XXX VLV_GT_MEDIA_RC6? */
>  
> -	result = intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6);
> +	result = intel_rc6_residency_ns(rc6, INTEL_RC6_RES_RC6);
>  	if (HAS_RC6p(rc6_to_i915(rc6)))
> -		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6p);
> +		result += intel_rc6_residency_ns(rc6, INTEL_RC6_RES_RC6p);
>  	if (HAS_RC6pp(rc6_to_i915(rc6)))
> -		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6pp);
> +		result += intel_rc6_residency_ns(rc6, INTEL_RC6_RES_RC6pp);
>  
>  	return result;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 67140a87182f8..52531ab28c5f5 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -148,13 +148,13 @@ static u64 __get_rc6(struct intel_gt *gt)
>  	struct drm_i915_private *i915 = gt->i915;
>  	u64 val;
>  
> -	val = intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6);
> +	val = intel_rc6_residency_ns(&gt->rc6, INTEL_RC6_RES_RC6);
>  
>  	if (HAS_RC6p(i915))
> -		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6p);
> +		val += intel_rc6_residency_ns(&gt->rc6, INTEL_RC6_RES_RC6p);
>  
>  	if (HAS_RC6pp(i915))
> -		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6pp);
> +		val += intel_rc6_residency_ns(&gt->rc6, INTEL_RC6_RES_RC6pp);
>  
>  	return val;
>  }
> -- 
> 2.38.0
> 
