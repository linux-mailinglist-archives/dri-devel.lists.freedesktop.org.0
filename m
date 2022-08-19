Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F959A5CF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD43310E209;
	Fri, 19 Aug 2022 19:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB28F10E74A;
 Fri, 19 Aug 2022 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660935864; x=1692471864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=048mLQJwKWVUXPXg9sW/IQJlk31x+H59lCcYjpedd7A=;
 b=mgJqBJ7zwQarpC5AU+KksU+Pz1c32QsqyD+kT8eoX7FmIFjcyjOfEchM
 /dMA0rfvsVZEpn75pUzn/zt5uTo9+YDnzmGFoYPp5zU/koQuwNgF+2/kz
 FA9H75birZ0YHg0X75dQZczpMNAE32bzehMVt6bYtMUIa/zI05meWh+Nd
 sTYk+gLs09iSoiGhCY9EZdjoKXTWZHvf3LYR75pf6SeMjrHZYeLmpl6L0
 mRThvPLuTFOApJCDF6LDBwtPlF9rSXGyslv3flNL8UjRcjLbMuxtyW++v
 nj4oZ8TkT50mJVMEpK7jidrA2sezV+Rdo2cib4W9xju4mzaNMbrGtegvD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="293078911"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="293078911"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 12:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="641355933"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 19 Aug 2022 12:04:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:04:23 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:04:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 12:04:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 12:04:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmYCzTPJX2j0ClO9VicEAuFfgh+6RaLJfoEp6hWaeI+PIH3w0g1aABkJjwUnUxb4LO8CaFUNl9+wonHn4lBe+LF4HG2nNyUFXftYB/nnMcd0RAjFznC7PM7lnALb7eOXDj9DgbulkSYcKFlRExhdXQq+GacPXHQEtKeQWx8bpxi4SVvsrnfHkHu2a/d8aIdBkMUohY2llGLUU2ddzwhqktO0WZBQ3zEywRkD1e9XvOm+y+XaFTFFA6G8R9vqLaE+Tp64z/KucupbcTRL8phh/zicQWbfu3S0YFL9F42lVOxud+AGfloXgsOLUZbrq5k0BbuC1sY6N616S30Md/HxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgqPAeI3Zx4vGV7Hxmkv9Mx+SXITrYCPMF2nuud+fwM=;
 b=mePbwLmwVaykj2UHdz8DP/wv1Yyw5W+Xbatf7Wlk1ozXdsQOBuDD8dT8K1oenyI0udqKYbvNxc95pHixGq3ZMKS2kuOmXr6xkuei5dIv1A7VurLC0S/LEtw3Q9hzpOp9PxE6pDi1Spq0G2dC8Zjpd5EEe2MTxrAqu0VOtYsIFFuy13G1AKe8sjfVupIK2jn3IeFJ/DWzlJnUp1wUCX/mk/Nm8+ydQj5bXRk1EBRQ09vGzI4oqPxml2xrrhCxDU3h33rSo9bJAh7KXpdfkBrE1bBaWPeVne5nyte5ia5pMpLL2YPueLZWyIwGIiR6ED1EoQ8VaTZzehWbp1TwrqHeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 19:04:20 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5525.019; Fri, 19 Aug
 2022 19:04:20 +0000
Date: Fri, 19 Aug 2022 12:04:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 01/21] drm/i915: Read
 graphics/media/display arch version from hw
Message-ID: <Yv/esUh1nl4jUxSV@mdroper-desk1.amr.corp.intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-2-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-2-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b41f063-f6a6-4eac-eb4a-08da82159ee0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3159:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVHwPhpePTIkKWtsosNM2XPAzo/r1FT0783SpRjiiqPpbTFN+GHRWcoZOuJoeoYEjcMOpzPlRn6rNj9PX+b4d+4gkJpIlz5J+BXqaimU6g+tzWopspBwxzwS9b+avXOZe/OuoYxq+J4tsDthYLgksKEHcPMjbtTsbSePPCFmDMtXRuRW7ui2GxS0DjUu8Wnf8ztZWWGndQTjz/NGqNnxUkukgYkmhvoWZYelohHHosnYHBURBmbNIRPnLcuirsVz+R6qr1ad+ehwUO41uOcYNY9bfGnQgzDAGfbAkZSpScwnJOUlByqGygcso8s8mZD9jwVy4EHpe3+rzI1LYgS45nO9/m0XD5dnGtn5YDng7KeOFBI5nhRpFOuCB1tLqlhIuAEiaU8aaHdL+4ti2yDbNWgysDgChsEqhXTae+N8ptYSVjtos1LuJIfJjG6kJOwZDmQDhmsdzamjkuT0byHGzS27p2QRbiBNJF3Wicm1+7nWYZFc4Jxvxfz8iKCOmFMDmithTRzEsj3hI8yfTxSpSzsPcy22dPvJGzCitit28DiK4hoqFso4cZCkmV2Lu6jG6mttZgXMz5WbUu02TmM5kG7Moqzoo8TkpB7Ils1x1Rq8Q4ymziBKSpf1vOPPuzaBNDsajjq8NU8sEcs6B5dZQtxq1A5DuVzCz9TgcBGdrra2wRIHPNebFvKk3ZSb+PEBbQh8gbEit3mC1nkqVqtl/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(346002)(396003)(39860400002)(2906002)(38100700002)(30864003)(86362001)(450100002)(66946007)(8676002)(4326008)(66476007)(8936002)(6862004)(66556008)(82960400001)(316002)(83380400001)(6636002)(5660300002)(6666004)(186003)(6506007)(478600001)(26005)(6512007)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Mp/p+fqha1jGNYheN0MevHdqLOqeULbddRaGIuUx23wJEWGUoF31N5IO8WZ?=
 =?us-ascii?Q?fpZm/tbmRSqcZRn9/Xs0S0hGvt9hYI+hfw419hj8zkRo/Ri3pTH3dFxKMCeG?=
 =?us-ascii?Q?YCkxZiAcSMsR6hQuz3aTaYtqSAQ1eRbMzsriWqKhVTtMDYXTsOapsPI7l86G?=
 =?us-ascii?Q?29K6+fi5YZW8Zi1aUb3pHLCGlcxRbQ/7XdoY9FmpSwEASZWLM+qkgoOjlZT1?=
 =?us-ascii?Q?AJJG0SoyZskMT7B55o47G9lCiF7akq6Xi0XyAW5V9OJD6W/JJcMTPJwA7s1b?=
 =?us-ascii?Q?idqkqCfGr7W34FxbmyWADBCvvtW+aI89FR99JhOk0cW1EVwIH57JxMqVQ3IO?=
 =?us-ascii?Q?I7zuNllANFj+Lr8VgXUoBV1XCP1eKsGxcYiK5V8+cvaXGmvSdpqNMFpXalqJ?=
 =?us-ascii?Q?Z9e0i45B1fWjq562w+HaZJ/mV55z9/X2J+zJs0lI0Ng0qdfMqjn1sfGSHHFN?=
 =?us-ascii?Q?YR0GkyYLR1Qav5ZCzkUIGTJmV3Z3x1NIld+nFVB3ebHDomLm44x1X671cOkH?=
 =?us-ascii?Q?JmAQj3d4N46EICfpq9QF7eSBdMsD9HqyR+MWSjq87Ly8t8i8oikjjrtjHtGI?=
 =?us-ascii?Q?BB//ns5k6aGPwphCY2dRGlSBO6VwORva4UjI1AJWKB2ldXGNTbJ5cUgGqKJd?=
 =?us-ascii?Q?MriHyVOK6y83rO8NxGZ+nMGhCGKxd3Dgg6+YvjaD1pxXLYatXTkFLN+osgda?=
 =?us-ascii?Q?RGaPSJASC4HtWVBWOXMKNRK4hxkYC9UUXfSRG9BXFnmUPRWfEWXAnR9Pxiy4?=
 =?us-ascii?Q?Q6OTS8RBZBixHCro9dx343j5Yro6xjxxWCkVZ1D/WMDSSrwfFN3q7gQtrj+w?=
 =?us-ascii?Q?S7i5aYmEG6igXJE1M4k2aw6MbBQ03MAmmROZMkWQQebqRmtI+EXmZ1mPyacD?=
 =?us-ascii?Q?MVOgh0k58LNcMpHBg8Bban321g8Ifw8fOWgquAsY6/uv9GZPQOp/mhgrtRqd?=
 =?us-ascii?Q?iuVnVcs8Xu/hm9UJ8DfppD5gaSL2/tTYNzMlsARUWL3dXjsmC05fTNPOh2IU?=
 =?us-ascii?Q?bJWckZYSn8y8Ta4MGIWCrGLrkvcBV62kXmRDfAHFGHWsmygh1gh+neAmogKa?=
 =?us-ascii?Q?1UGImqR/dJIvrWr3vvhyxceTaaLFHxzaX92u0hE3V9Vp3zZqWPCdHSg1skLY?=
 =?us-ascii?Q?KC3uxewYcLIz6bFF/kbH4RL92g0LpQcuWVy47akZm28VksCBAEWTY1ubR3jE?=
 =?us-ascii?Q?ZRRNJrychSQusM4lsAbjggX/Br046B4zH4NK3zsXZ7kKbbCbfS0npdrVUm7G?=
 =?us-ascii?Q?1qcNNHibmHKrSm4oeAZ8LJMMboV2Y50kBcZ+a0T07YbPyHzoGvWrsGdu28hG?=
 =?us-ascii?Q?B9NF9dg0bIUGtxWov0DVCBrRGudwFg3HLhWqH5SU1vrPMH7/2xBwVcOErulK?=
 =?us-ascii?Q?Y7PVsyZ5xdzknpX+tTMtBsW/KnJHmWYjgZHwM2KvA8ebre4tIAWsRMhzDTwc?=
 =?us-ascii?Q?7MqfAasFD/g27JzrNpPYx9Q1sbsw4E/bMk1iF6GX+ToWorsz26zh9p/Lj/lL?=
 =?us-ascii?Q?F6dGAnS6F+pJTnSWshx3WpOrSqpDbUJU9bXNVcFemK30koUPvkYBSskV07j+?=
 =?us-ascii?Q?1014oe7XLz+H3dQ5OKNP5WknAnysF0f2uAbL4o/OZXuY8AGqZVXb2602azHN?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b41f063-f6a6-4eac-eb4a-08da82159ee0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 19:04:20.2810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1zNfuLbU/O4OAcl9TSIbwTg7K6A9hVk5MKkjXFGE5RdZuC609d8t1DPOf2FVR7hKIcxwhCMHnvvSMWmDXfKmFcTsvi9dH06Wq49a9PbLGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3159
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

On Thu, Aug 18, 2022 at 04:41:42PM -0700, Radhakrishna Sripada wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Going forward, the hardware teams no longer consider new platforms to
> have a "generation" in the way we've defined it for past platforms.
> Instead, each IP block (graphics, media, display) will have their own
> architecture major.minor versions and stepping ID's which should be read
> directly from a register in the MMIO space.  New hardware programming
> styles, features, and workarounds should be conditional solely on the
> architecture version, and should no longer be derived from the PCI
> device ID, revision ID, or platform-specific feature flags.
> 
> v1.1: Fix build error

As Jani noted on the previous version, this patch needs to be split into
three patches (and/or be based on top of the other series that Jani has
in flight).  Also the giant macro is no longer necessary on current
drm-tip now that we the version values stored consistently in
structures; we can just use a regular function and pass pointers to the
structures.

Bala also had feedback on the previous version that hasn't been
incorporated here yet either.


Matt

> 
> Bspec: 63361, 64111
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  2 +
>  drivers/gpu/drm/i915/i915_driver.c            | 80 ++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_drv.h               | 16 ++--
>  drivers/gpu/drm/i915/i915_pci.c               |  1 +
>  drivers/gpu/drm/i915/i915_reg.h               |  6 ++
>  drivers/gpu/drm/i915/intel_device_info.c      | 32 ++++----
>  drivers/gpu/drm/i915/intel_device_info.h      | 14 ++++
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
>  8 files changed, 128 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 94f9ddcfb3a5..a053493dae24 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -39,6 +39,8 @@
>  #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>  #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
>  
> +#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
> +
>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
>  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index deb8a8b76965..33566f6e9546 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -70,6 +70,7 @@
>  #include "gem/i915_gem_pm.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_pm.h"
> +#include "gt/intel_gt_regs.h"
>  #include "gt/intel_rc6.h"
>  
>  #include "pxp/intel_pxp_pm.h"
> @@ -306,15 +307,83 @@ static void sanitize_gpu(struct drm_i915_private *i915)
>  		__intel_gt_reset(to_gt(i915), ALL_ENGINES);
>  }
>  
> +#define IP_VER_READ(offset, ri_prefix) \
> +	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32)); \
> +	if (drm_WARN_ON(&i915->drm, !addr)) { \
> +		/* Fall back to whatever was in the device info */ \
> +		RUNTIME_INFO(i915)->ri_prefix.ver = INTEL_INFO(i915)->ri_prefix.ver; \
> +		RUNTIME_INFO(i915)->ri_prefix.rel = INTEL_INFO(i915)->ri_prefix.rel; \
> +		goto ri_prefix##done; \
> +	} \
> +	\
> +	ver = ioread32(addr); \
> +	pci_iounmap(pdev, addr); \
> +	\
> +	RUNTIME_INFO(i915)->ri_prefix.ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, ver); \
> +	RUNTIME_INFO(i915)->ri_prefix.rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver); \
> +	RUNTIME_INFO(i915)->ri_prefix.step = REG_FIELD_GET(GMD_ID_STEP, ver); \
> +	\
> +	/* Sanity check against expected versions from device info */ \
> +	if (RUNTIME_INFO(i915)->ri_prefix.ver != INTEL_INFO(i915)->ri_prefix.ver || \
> +	    RUNTIME_INFO(i915)->ri_prefix.rel > INTEL_INFO(i915)->ri_prefix.rel) \
> +		drm_dbg(&i915->drm, \
> +			"Hardware reports " #ri_prefix " IP version %u.%u but minimum expected is %u.%u\n", \
> +			RUNTIME_INFO(i915)->ri_prefix.ver, \
> +			RUNTIME_INFO(i915)->ri_prefix.rel, \
> +			INTEL_INFO(i915)->ri_prefix.ver, \
> +			INTEL_INFO(i915)->ri_prefix.rel); \
> +ri_prefix##done:
> +
> +/**
> + * intel_ipver_early_init - setup IP version values
> + * @dev_priv: device private
> + *
> + * Setup the graphics version for the current device.  This must be done before
> + * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so this
> + * function should be called very early in the driver initialization sequence.
> + *
> + * Regular MMIO access is not yet setup at the point this function is called so
> + * we peek at the appropriate MMIO offset directly.  The GMD_ID register is
> + * part of an 'always on' power well by design, so we don't need to worry about
> + * forcewake while reading it.
> + */
> +static void intel_ipver_early_init(struct drm_i915_private *i915)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	void __iomem *addr;
> +	u32 ver;
> +
> +	if (!HAS_GMD_ID(i915)) {
> +		drm_WARN_ON(&i915->drm, INTEL_INFO(i915)->graphics.ver > 12);
> +
> +		RUNTIME_INFO(i915)->graphics.ver = INTEL_INFO(i915)->graphics.ver;
> +		RUNTIME_INFO(i915)->graphics.rel = INTEL_INFO(i915)->graphics.rel;
> +		/* media ver = graphics ver for older platforms */
> +		RUNTIME_INFO(i915)->media.ver = INTEL_INFO(i915)->graphics.ver;
> +		RUNTIME_INFO(i915)->media.rel = INTEL_INFO(i915)->graphics.rel;
> +		RUNTIME_INFO(i915)->display.ver = INTEL_INFO(i915)->display.ver;
> +		RUNTIME_INFO(i915)->display.rel = INTEL_INFO(i915)->display.rel;
> +		return;
> +	}
> +
> +	IP_VER_READ(i915_mmio_reg_offset(GMD_ID_GRAPHICS), graphics);
> +	IP_VER_READ(i915_mmio_reg_offset(GMD_ID_DISPLAY), display);
> +	IP_VER_READ(MTL_MEDIA_GSI_BASE + i915_mmio_reg_offset(GMD_ID_GRAPHICS),
> +		    media);
> +}
> +
>  /**
>   * i915_driver_early_probe - setup state not requiring device access
>   * @dev_priv: device private
> + * @ent: PCI device info entry matched
>   *
>   * Initialize everything that is a "SW-only" state, that is state not
>   * requiring accessing the device or exposing the driver via kernel internal
>   * or userspace interfaces. Example steps belonging here: lock initialization,
>   * system memory allocation, setting up device specific attributes and
>   * function hooks not requiring accessing the device.
> + *
> + * GRAPHICS_VER, DISPLAY_VER, etc. are not yet usable at this point.  For
>   */
>  static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  {
> @@ -855,13 +924,22 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return PTR_ERR(i915);
>  
>  	/* Disable nuclear pageflip by default on pre-ILK */
> -	if (!i915->params.nuclear_pageflip && DISPLAY_VER(i915) < 5)
> +	if (!i915->params.nuclear_pageflip &&
> +	    !HAS_GMD_ID(i915) && DISPLAY_VER(i915) < 5)
>  		i915->drm.driver_features &= ~DRIVER_ATOMIC;
>  
>  	ret = pci_enable_device(pdev);
>  	if (ret)
>  		goto out_fini;
>  
> +	/*
> +	 * GRAPHICS_VER() and DISPLAY_VER() will return 0 before this is
> +	 * called, so we want to take care of this very early in the
> +	 * initialization process (as soon as we can peek into the MMIO BAR),
> +	 * even before we setup regular MMIO access.
> +	 */
> +	intel_ipver_early_init(i915);
> +
>  	ret = i915_driver_early_probe(i915);
>  	if (ret < 0)
>  		goto out_pci_disable;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 086bbe8945d6..7ebddde200bc 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -856,19 +856,19 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>  
>  #define IP_VER(ver, rel)		((ver) << 8 | (rel))
>  
> -#define GRAPHICS_VER(i915)		(INTEL_INFO(i915)->graphics.ver)
> -#define GRAPHICS_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->graphics.ver, \
> -					       INTEL_INFO(i915)->graphics.rel)
> +#define GRAPHICS_VER(i915)		(RUNTIME_INFO(i915)->graphics.ver)
> +#define GRAPHICS_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->graphics.ver, \
> +					       RUNTIME_INFO(i915)->graphics.rel)
>  #define IS_GRAPHICS_VER(i915, from, until) \
>  	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
>  
> -#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
> -#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
> -					       INTEL_INFO(i915)->media.rel)
> +#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.ver)
> +#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.ver, \
> +					       RUNTIME_INFO(i915)->media.rel)
>  #define IS_MEDIA_VER(i915, from, until) \
>  	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
>  
> -#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
> +#define DISPLAY_VER(i915)		(RUNTIME_INFO(i915)->display.ver)
>  #define IS_DISPLAY_VER(i915, from, until) \
>  	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
>  
> @@ -1300,6 +1300,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   */
>  #define NEEDS_COMPACT_PT(dev_priv) (INTEL_INFO(dev_priv)->needs_compact_pt)
>  
> +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
> +
>  #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
>  
>  #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 9fd788e147a3..b60f01d072a7 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1127,6 +1127,7 @@ static const struct intel_device_info mtl_info = {
>  	PLATFORM(INTEL_METEORLAKE),
>  	.display.has_modular_fia = 1,
>  	.has_flat_ccs = 0,
> +	.has_gmd_id = 1,
>  	.has_snoop = 1,
>  	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 50d7bfd541ad..15a53cb5e1ee 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -5860,6 +5860,11 @@
>  #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
>  #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
>  
> +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> +
>  /*GEN11 chicken */
>  #define _PIPEA_CHICKEN				0x70038
>  #define _PIPEB_CHICKEN				0x71038
> @@ -8353,4 +8358,5 @@ enum skl_power_gate {
>  #define GEN12_CULLBIT2			_MMIO(0x7030)
>  #define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
>  
> +#define MTL_MEDIA_GSI_BASE		0x380000
>  #endif /* _I915_REG_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index d98fbbd589aa..4ca8f78bfbd7 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -91,22 +91,6 @@ const char *intel_platform_name(enum intel_platform platform)
>  void intel_device_info_print_static(const struct intel_device_info *info,
>  				    struct drm_printer *p)
>  {
> -	if (info->graphics.rel)
> -		drm_printf(p, "graphics version: %u.%02u\n", info->graphics.ver,
> -			   info->graphics.rel);
> -	else
> -		drm_printf(p, "graphics version: %u\n", info->graphics.ver);
> -
> -	if (info->media.rel)
> -		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
> -	else
> -		drm_printf(p, "media version: %u\n", info->media.ver);
> -
> -	if (info->display.rel)
> -		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
> -	else
> -		drm_printf(p, "display version: %u\n", info->display.ver);
> -
>  	drm_printf(p, "gt: %d\n", info->gt);
>  	drm_printf(p, "memory-regions: %x\n", info->memory_regions);
>  	drm_printf(p, "page-sizes: %x\n", info->page_sizes);
> @@ -127,6 +111,22 @@ void intel_device_info_print_static(const struct intel_device_info *info,
>  void intel_device_info_print_runtime(const struct intel_runtime_info *info,
>  				     struct drm_printer *p)
>  {
> +	if (info->graphics.rel)
> +		drm_printf(p, "graphics version: %u.%02u\n", info->graphics.ver,
> +			   info->graphics.rel);
> +	else
> +		drm_printf(p, "graphics version: %u\n", info->graphics.ver);
> +
> +	if (info->media.rel)
> +		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
> +	else
> +		drm_printf(p, "media version: %u\n", info->media.ver);
> +
> +	if (info->display.rel)
> +		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
> +	else
> +		drm_printf(p, "display version: %u\n", info->display.ver);
> +
>  	drm_printf(p, "rawclk rate: %u kHz\n", info->rawclk_freq);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 23bf230aa104..327e62875871 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -146,6 +146,7 @@ enum intel_ppgtt_type {
>  	func(has_64bit_reloc); \
>  	func(has_64k_pages); \
>  	func(needs_compact_pt); \
> +	func(has_gmd_id); \
>  	func(gpu_reset_clobbers_display); \
>  	func(has_reset_engine); \
>  	func(has_3d_pipeline); \
> @@ -200,6 +201,7 @@ enum intel_ppgtt_type {
>  struct ip_version {
>  	u8 ver;
>  	u8 rel;
> +	u8 step;
>  };
>  
>  struct intel_device_info {
> @@ -271,6 +273,18 @@ struct intel_runtime_info {
>  	 */
>  	u32 platform_mask[2];
>  
> +	/*
> +	 * On modern platforms, the architecture major.minor version numbers
> +	 * and stepping are read directly from the hardware rather than derived
> +	 * from the PCI device and revision ID's.
> +	 *
> +	 * Note that the hardware gives us a single "graphics" number that
> +	 * should represent render, compute, and copy behavior.
> +	 */
> +	struct ip_version graphics;
> +	struct ip_version media;
> +	struct ip_version display;
> +
>  	u16 device_id;
>  
>  	u8 num_sprites[I915_MAX_PIPES];
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 9c31a16f8380..91ad444cd532 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -173,6 +173,7 @@ struct drm_i915_private *mock_gem_device(void)
>  	drm_mode_config_init(&i915->drm);
>  
>  	mkwrite_device_info(i915)->graphics.ver = -1;
> +	RUNTIME_INFO(i915)->graphics.ver = ~0;
>  
>  	mkwrite_device_info(i915)->page_sizes =
>  		I915_GTT_PAGE_SIZE_4K |
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
