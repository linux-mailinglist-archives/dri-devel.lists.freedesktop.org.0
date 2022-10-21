Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D745B607BDE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2B110E218;
	Fri, 21 Oct 2022 16:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADC410E3FD;
 Fri, 21 Oct 2022 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666368742; x=1697904742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J+HhgjuRZks6hIe4qc4rhUNm5NxmnHUeZ595QiShoOE=;
 b=IBh6hN34v6967EsJH6u1lsQXEupreYGl+QZTusdiHynp4ATva/pM9+hq
 ONq7+v9Ya036mIEBTOhoFhahhEa80TK95ilrvfBsVib3i3DuM90qRhcLC
 eBXJf6K8FDQWrm4RhhcPMhYT7fWLgmNv4tt7Ik1LSPmqB2GzNksx2EeOD
 jnjelnevz+Hn6yub+pPk9EkEPGBsLyA99d75JlD229v8OfdI4sR2tAo2t
 vCcymZPEbxrLwguCqJ+X8k/dh+du6FHuM1ZSzv9MJHLW16ohjXn5bHONa
 pRiwV+b0K6ZfkBgUCO1oAa6cbt6OVfmBvNWDGatok6M0U2NaYgSoanIdo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="290346904"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="290346904"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="773105349"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="773105349"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2022 09:12:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:12:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:12:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 09:12:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 09:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuZIa6AnprVHaczWQHeshyZR1NbkOiEER4HYJ8xBdhMJVLjMHgB2qo5rUqiy7hRKK3IxOht5SrDQsoS0rxTJr6ZWTZxlioWCDofPIUYU/VaPdexM/dVyNn96JYa86NdHRDqsabsU16GX+TwnWLzLjh9NSjFiRE8uBClzn7LdXLIsVNbu2CQE/JqQoYAymJn9BsMKGSRyX1zB8ZjmBYIl7LvpOm6R2W1easAKX2ZwYpgdz3/nomcSoQAlIfF0NYwarcAQMrtYIY4DP+4NB72k2Cs2iE/p7UjLScJHeYj2LGovVsW60Ilz7yKEtuU+3HHwPzoX0PrEZlMdHcHcGDCS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIx3qlH1BpTXUAS+uI2blhPaMqykM6rRwlb78sO/gcc=;
 b=j1V9w4w13+03nTjlrE+DvzbT31qWtMwAKf5Vhk7IIm3jWLaCWCVz/EL5eQbmAfM6BYCQnb9X4bo+6yHtaZ37EiMqYRGftIfnOnFAl3i+gIOhzbvbJ3YQ0MpZojQVALy9oQeBGvFmN6x8yiwvuyS750EgMCC23PPDygTtkt4BPr7hCGI+pVCtPyVEj48zMJO37URGWoxvKg5AMM2l5pG2BA2ytIkDRhRoeDzOxWgt6u0Lrc/Fgr5h1YmpyICYadg6ddJUT6znw6Hk0NV0eJGOmX1Hm+Hq0aYxFeqA4epYz/sYl6FDh965dbDDUvtBzDYcvnygFnoJ9XKPJVSEwmCyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 16:12:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 16:12:19 +0000
Date: Fri, 21 Oct 2022 12:12:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915: Use GEN12_RPSTAT register for
 GT freq
Message-ID: <Y1LE3/048DxtE6pr@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
 <20221019233721.3270601-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019233721.3270601-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a5b3ee-1a5a-44ef-b202-08dab37f0766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b82tE2uonnlzSVY1cW0H1Raah96IpW3DZpl1rtVNqxSS4duu84kE02R9v9mmVhtvom8ffPwV7LuHS+0ZOvyd0pqtZ9Rv7WEq+W56hB3pmEXFFqxg0O3D5UFfMbDIIeg4zr6K24EQ0GSP/iBknpLJD9T2xVhvsbak71X3Q34+0+FCdX5oauv3WPwPPxGvrWp2PHvn3MBB9y6vFzbQN4E2023EuNhuMxLUjgX1C4ZaVAHLLGb+DmpErIRuXUzP2WJiQsaA/pOwhsoYMSqRnxX1o57IcOq1VOVLD2gXT4K+1VfRNOk4yDbsmH3DqOPfKsUZ7wfVgk9mfNCZs9Lbyh2SzI+Gr1+sZJJ6Knyg/8SvPr1unIjku1rafrhGl5IMNvhfvPFeh1oU0epgSPWnnquNHVjjv3eqzwPL42T1hYYYXDmJdUh6s8Su8hQNbH6Vtia1kat9GJ1FOD2EZJoHvl5hXEf8s7mNx+svkekvmwmBBkVxkfHVQTpkOkmLp/ciFphGqE/HCZRESRCjkTl2Wu7HDYovVNEz7WbdJY9gOA3ZRChwtWshE01JfoB/P6sJdSeJ6QjihX6J/SQsqzwSOTAw7yy48L39fsHtYrF0kGLjzjM5GykV1gh1VXNsshVe0eFJpB6C7lN4h1H39rlfyTI1ViWlEMV4EzJQHdF7BSvy4rTeWo3AgVKwxWJgjhdeSwhip+3D5m7xEaE42U2tTnviHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199015)(36756003)(6486002)(83380400001)(478600001)(6666004)(86362001)(38100700002)(82960400001)(6636002)(37006003)(6506007)(2906002)(44832011)(2616005)(6512007)(8936002)(8676002)(41300700001)(66476007)(316002)(5660300002)(6862004)(186003)(4326008)(450100002)(26005)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4CW8QDlyAyNjcCOdCukKJ5OZmyiDguHsgBzzFyZeK8V2h0P+ITVS72WVykqo?=
 =?us-ascii?Q?MAEvbTv+gJWtUMbmncxtvAvxU9BQrFDB0DrgmLpaALfxE2UIwGX+DfPguskV?=
 =?us-ascii?Q?qs4PpJZCa95fJx4RXGJibW+n81iqq7WdvlTbLrjGj7FnPkHd3XW5cby73ZDs?=
 =?us-ascii?Q?19dTuazdvqmQziV4qAtCHskhL99oisbIkXSZPpyBGNDSdxkw00ektQqTVsi1?=
 =?us-ascii?Q?7KW33QlOgpNVMzfVAyPWAQYLHIKgOsBxX+15puxzrZOk4VkWd8xFR362tIZF?=
 =?us-ascii?Q?5S1fVkb5jIe0Ut7EgCKq1m4QNN+hDhobw7IxqrpUS8GqM7x5THqCO9m+I2Jx?=
 =?us-ascii?Q?qjSpwo0wCAByD8DVlY3y1Djh7KETqAtEz07koP2UGOsxpALFZXbee6KAsrim?=
 =?us-ascii?Q?vosh4WGhG2r4sN/3zWygoQM/EbyqgdUAf8zYL7lc3Z00TnOWWWfdlVS0Bw63?=
 =?us-ascii?Q?f+EaKA0LxVw0X61bbKP2feaA2TtDZNfQiZJtMVW5+yZZCtJu55fWO2RW5zyH?=
 =?us-ascii?Q?ue/R19ok233sDy8oBjm2vvnLfiTT+CIxx0uBe+lIaRMh3VMQB96KPsKlK6af?=
 =?us-ascii?Q?qANE25g/N2tPca1ptaGrFthMfjNBomBiy871dphSNQKNpf1rsH7GtCGBFbpX?=
 =?us-ascii?Q?Qgg2yF7VhrfWsLn7LdjMlmT+6hzJ34SBMzE3nLi2Y9r069Q1laPluVgF95gH?=
 =?us-ascii?Q?TuEmDtMjEhhjszURb/FV1Zqxjz6XI9sZ13GJbLclAkH8upJTnrumWXIDmmwB?=
 =?us-ascii?Q?U2eUAZAJ0BsnRDvBIk9kCkspJIizBoayNyZuwU8x1LT8I3MmLNmC7jDW4ufx?=
 =?us-ascii?Q?JcOrBnMBZbGQEEDpE+KqOSlMU7JOLmr//UDCe6flk1gHdWtK7R1LeZCQauec?=
 =?us-ascii?Q?63o/vVxa5FcRMbhyOujO7KDktPt0foG6MW6BXVlvwV9ZvQSCOGXOvHCc5UZ5?=
 =?us-ascii?Q?peaeC/jd3GPSZ7PEIv4wgdEQJc4hc9X52PjEz6pZ8alGssiM4QC0mqKZUN6I?=
 =?us-ascii?Q?k33IfiqaTJz/NbEEEvhHKRG14WjTVuMMZGi6dq3+E07CqhQap5/GL3E9It6f?=
 =?us-ascii?Q?Jg6w+s9YqPGn5H7ZQ+I2exwgt5cuEJRs6reboo6/RsA2/3HG2Fky5s38ljiD?=
 =?us-ascii?Q?lS/YQ1Nr3JOhI5DWhy+sQer9pS/HV/GnDmU/dCEQYz3E+yCqprCEqe6Qjo8G?=
 =?us-ascii?Q?n8uujspRKi+9bjHT6iz7PxMyRAUckAIRdj4KdQ4pkSBbWVyKoByrwebgrQUM?=
 =?us-ascii?Q?rObL5APCqzrxvkgJ1OCmt3j9a2noiDLYpfZnNjiDWAr7G/C+M18XnKmu0jA8?=
 =?us-ascii?Q?GtEHrQT60WVREnqTFvTdY1qFXQPwlbkyuozYw10ALCzB7aSDjVXwjSdEk9Ds?=
 =?us-ascii?Q?4wcw4DfI/UmbjbjlL3PX/DEEqz+aedX+Q+HMNy/bhWSpKu3sLSSiMEwEJMQN?=
 =?us-ascii?Q?TJMr+o8LxlSmmn7AzwDC0TFcGXLxYajznoZ+BTmxnGUUQkZoRH2IiJZPWP9z?=
 =?us-ascii?Q?T4+n2DTD/uT+iUDZq7uoTBOtYcb4YJEATa95IW/hgyr7/fWg8U1ljBjRsGBV?=
 =?us-ascii?Q?Pytod65ysTBtjwQPBq33IRgIWcdOB9bYt28iU8xKIj7l95+E3N0D0+vmbQGo?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a5b3ee-1a5a-44ef-b202-08dab37f0766
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:12:19.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWwY3f3QkxwEdZ75g9UZCcbd8Tzqhb3bKPCOa8Hg1Q82/4PaAOBhMOCqd3BpUlc+M0vr9kI4wpM8Ng1biQkuxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 04:37:18PM -0700, Ashutosh Dixit wrote:
> From: Don Hiatt <don.hiatt@intel.com>
> 
> On GEN12+ use GEN12_RPSTAT register to get actual resolved GT
> freq. GEN12_RPSTAT does not require a forcewake and will return 0 freq if
> GT is in RC6.
> 
> v2:
>   - Fixed review comments(Ashutosh)
>   - Added function intel_rps_read_rpstat_fw to read RPSTAT without
>     forcewake, required especially for GEN6_RPSTAT1 (Ashutosh, Tvrtko)
> v3:
>   - Updated commit title and message for more clarity (Ashutosh)
>   - Replaced intel_rps_read_rpstat with direct read to GEN12_RPSTAT1 in
>     read_cagf (Ashutosh)
> v4: Remove GEN12_CAGF_SHIFT and use REG_FIELD_GET (Rodrigo)
> 
> Cc: Don Hiatt <donhiatt@gmail.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Don Hiatt <don.hiatt@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_rps.c     | 32 +++++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_rps.h     |  2 ++
>  drivers/gpu/drm/i915/i915_pmu.c         |  3 +--
>  4 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 35c039573294c..f8c4f758ac0b1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1539,6 +1539,7 @@
>  
>  #define GEN12_RPSTAT1				_MMIO(0x1381b4)
>  #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> +#define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>  
>  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>  #define   GEN11_CSME				(31)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 5bd6671554a6e..da6b969f554b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2068,12 +2068,34 @@ void intel_rps_sanitize(struct intel_rps *rps)
>  		rps_disable_interrupts(rps);
>  }
>  
> +u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
> +{
> +	struct drm_i915_private *i915 = rps_to_i915(rps);
> +	i915_reg_t rpstat;
> +
> +	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
> +
> +	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
> +}
> +
> +u32 intel_rps_read_rpstat(struct intel_rps *rps)
> +{
> +	struct drm_i915_private *i915 = rps_to_i915(rps);
> +	i915_reg_t rpstat;
> +
> +	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
> +
> +	return intel_uncore_read(rps_to_gt(rps)->uncore, rpstat);
> +}
> +
>  u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>  {
>  	struct drm_i915_private *i915 = rps_to_i915(rps);
>  	u32 cagf;
>  
> -	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> +	if (GRAPHICS_VER(i915) >= 12)
> +		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
> +	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
>  	else if (GRAPHICS_VER(i915) >= 9)
>  		cagf = REG_FIELD_GET(GEN9_CAGF_MASK, rpstat);
> @@ -2093,7 +2115,9 @@ static u32 read_cagf(struct intel_rps *rps)
>  	struct intel_uncore *uncore = rps_to_uncore(rps);
>  	u32 freq;
>  
> -	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
> +	if (GRAPHICS_VER(i915) >= 12) {
> +		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
> +	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>  		vlv_punit_get(i915);
>  		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
>  		vlv_punit_put(i915);
> @@ -2259,7 +2283,7 @@ static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>  	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>  
> -	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
> +	rpstat = intel_rps_read_rpstat(rps);
>  	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
>  	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
>  	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
> @@ -2394,7 +2418,7 @@ static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
>  	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
>  		   rps->pm_intrmsk_mbz);
> -	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
> +	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_rps_read_rpstat(rps));
>  	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
>  	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
>  		   intel_gpu_freq(rps, caps.min_freq));
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index 110300dfd4383..9e1cad9ba0e9c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -48,6 +48,8 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
>  u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>  u32 intel_rps_read_punit_req(struct intel_rps *rps);
>  u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
> +u32 intel_rps_read_rpstat(struct intel_rps *rps);
> +u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
>  void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
>  void intel_rps_raise_unslice(struct intel_rps *rps);
>  void intel_rps_lower_unslice(struct intel_rps *rps);
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 958b37123bf12..67140a87182f8 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -371,7 +371,6 @@ static void
>  frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> -	struct intel_uncore *uncore = gt->uncore;
>  	struct i915_pmu *pmu = &i915->pmu;
>  	struct intel_rps *rps = &gt->rps;
>  
> @@ -394,7 +393,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>  		 * case we assume the system is running at the intended
>  		 * frequency. Fortunately, the read should rarely fail!
>  		 */
> -		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
> +		val = intel_rps_read_rpstat_fw(rps);
>  		if (val)
>  			val = intel_rps_get_cagf(rps, val);
>  		else
> -- 
> 2.38.0
> 
