Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4714672821
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E2D10E80A;
	Wed, 18 Jan 2023 19:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E0810E809;
 Wed, 18 Jan 2023 19:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674070052; x=1705606052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=czld7Qm2l7tai/sdRSSZxcSQ1kbYl9ZlpN+IGWLEll4=;
 b=ih4Joaxud/sNRvTdAjYWk60vC0o1LAgyT7fDEODGoTCLdGEW91aTPVKN
 HSbl1BQV7h/x+iVjE/Ll4gwqA3qSTmjMnCQ/9xO0LWLaRAkITAwcs7hdO
 Eym2v+fo87L6/9+tdl+6NLCniGq1umHlg8fpkluXy5nvCKpJeITITNFAO
 Kk1LsGSqtKki88+HoRQf7O1ccRfqljWVWAVqmsm0yAns+28BdYSoGhk3Q
 B2NNOyfQX4mBvPX4wAHFNvbyoYwN8ayg09nSRzqYp8pwbfkGpi5zziMEg
 9oI7ZoAQXQVpMVd5hf5QoM+sx5wKv6mzelmxNP+Fvueqd9FfRBLeyDdAz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327152084"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327152084"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 11:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748582128"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="748582128"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 11:27:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 11:27:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 11:27:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 11:27:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoA2SHikfAfuE4ePFaN5ENDbzOL5yNIyQ0rmB/KdnBZ6z112r0nyT4mxZpOS5eijrwYanWeCOE7BCmGisxTvjvLEJDBgAkQWx3YbwS22I7rHRPLYGleSDRUWOHdECP+XXwa1nC6OE/5dUb8GmviGvoQ5wipU619Ydt4ywuWmhaK7JLQzvobEJeVt6is1T1h9bw9Y6RNl9S8dZD/GujvLKLkh1Wz5foGhvpHEme12qddfZtPaozmkn+U1rLRQ0qtztuRsEJ1cUU5FbwtZSCu4C2BsoTKluSkSaEdUG7YrPxgRdvhYyhedQAH8qPj7myYkOT6hqPlZCh1jCW9cm7tnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keW90N763k3Hyff6P3rDvrYfb7OS2wDI617zARfSxek=;
 b=DsEpYKUbrVo4jM39oCAT4enist0d8T5iyuzscKfqsvmn91eCqj8boknme+72eetK7iLjGb2BfBf6fuhRiM8SmILV9Y8flSL4LzBryUWaf0jj+eeQxnbvAq+CYAbGHzbtqmDNpAcPZwe8mB1xQ4ITbV8O/bkZx6kBXGdUAPpIFpyZtVu9uzDCTZWKs5YZz0kMvDsPFxTvnvaNI+R+jQBASpQSxo/4arviaMfKVcA3pYhNIvasTBz1yAcTQSJSTzlP56bQ61KPAGXzSRybtWXSHqvjGCE0LmO12Mlvv7bxF/vkTXVmw9On57G3bcSiiySoAr44EKo2fkJ6Qm7DcN9GYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 19:27:28 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::993c:13fc:ebc9:7168]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::993c:13fc:ebc9:7168%4]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 19:27:28 +0000
Date: Wed, 18 Jan 2023 16:27:31 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Move/adjust register definitions
 related to Wa_22011450934
Message-ID: <20230118192731.7npcxduwljcwcuji@gjsousa-mobl2>
References: <20230117202627.4134579-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117202627.4134579-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cbcbf3c-0d55-4d5d-bc0f-08daf98a0913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yFrCsT3HtH6MExDnWTbHJttqhvG8E8aCzIbHimptsf2ifl6xiczMTVSjFLnBacpxq/3cpPXQd1n4P1IYArmBZk+jBc/HBftR1ToDB5ycSMCSoiKG83/7hRbRh0kRehQeW9CtgFd8G8hNjCoI1GTa0xbRZUdVUVBpi+eitFA9utjhACtAKem0dDCQmc6hRr3OmYeE1UXOft1TKFJPIEqn/MehAbk9EDqMCeZKWizNQL+aX4a8FWOsi14LvofkpRnOnZUJDR/C9Jkb31RfUExdcpjZgZYUr+Ic9lYRhuvz+iis6GIbtPXzDu9p88SBtVyvkDnZX9MogIFGvV0uXVdBoWcx9RCwmisFxAlllPieKB7PFBVyzuWzmxeuaQnNbfGD8caaWfFAmVFb/ZtXvJf2ebDTj/LL6IM35+/IzkkrycHFG/BghLEQIATzdRDKJsuH+z21N3GNbphw7CMDLDBYaF2PE7ZRQZbfk/2uEnzhXedPPh1+AuT/QFMNHLg+Kv0tb2doHrccnHD/foDjJullSt7jOPRigJdp9/Sx4G8JTym5H0h++cgTI+vxRecCCW4+d2kFNysWztP3ra1e0dnGR08nQ0m2sSSGCbJ7txmPk2XEppyPX4fVbeMiHYagQvUcV+K8WhQ5RYM9khQDxx1eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(41300700001)(4326008)(8676002)(450100002)(66556008)(66946007)(5660300002)(44832011)(66476007)(26005)(83380400001)(8936002)(9686003)(478600001)(6512007)(186003)(6506007)(6486002)(1076003)(316002)(33716001)(6666004)(86362001)(2906002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?862+iEqCBQJhhAKTPCaygFkV2EAGqLF6GytjY4Dj5vhfaBa0FtDBc/qux3FK?=
 =?us-ascii?Q?lu2de8DE+r72Y7MvC9hxojn2Yh7GcGG9oUJ4DYYifihqmExYY5rDBY28R+Kd?=
 =?us-ascii?Q?8CtUMljCPvn8uPWy9CB4BhjNmGJPg3aXeoUQkiyqai6c3mUMR15lg4a747lq?=
 =?us-ascii?Q?TnZvXu3Doz6zggQiQPPqUlKdj0uTJEUgDP1E7BMZhA/GMR3McsamMmItHUTS?=
 =?us-ascii?Q?2xsRDqDgNsL9KEpSXyGr2ajCtG23CGzZex8LDMPl18zdvP0Ll2jw2N28FnA/?=
 =?us-ascii?Q?V8139Fgx59Gn2gVpigdA8TVAVeXckNw7p70UWkJP4abmki692zqTG6BdTFDJ?=
 =?us-ascii?Q?uznXbUbGx4z5gJyc3Z/885+dlkvcrFNsMFPSRKczs66KT1T0C9Odi/O27mL4?=
 =?us-ascii?Q?Z355FstlgpTdqporQZ5RxY5NdeALErlvZxHwmQBtYTn9UVqq37Q5Xy7BE11P?=
 =?us-ascii?Q?Mk3qNGhUti0j2CygTDNKDhcp6NeL6NzOT7TqfN1M01ZvN3bBjOv9snPaCLP4?=
 =?us-ascii?Q?nnCoobpHK1pMN7cRmwnxTz7inyEu9GIu6EjpaI/TuIMXgvHwCHP3m1WQDFth?=
 =?us-ascii?Q?hdbPLyPN108NigffrsvycbpfrovgMQdvrlwoW4MulbzGqEYg4iKEl9KkdsNj?=
 =?us-ascii?Q?opRr0HznoZDqDXSoKLaNyPvJtNgIxWuUAKem4IrtrPpGD1eJwnHkTkQi+gRs?=
 =?us-ascii?Q?2Z/HrO2TXQTlgPUlmR4QlYCmrtBZ8DM6D3KplS/dzqRmsZBPGnShnPWGtsak?=
 =?us-ascii?Q?aammd7HrK4p7ul+DHOtKnSx3prsg4u3jT/BsmaRzx8cC62a5IR4LfHXTwChA?=
 =?us-ascii?Q?4nYPjA6XoJCtMiNWIh2dKesFFmohnvXQuV0lAmTp+aqSpTS5SN+iDJGlxVEc?=
 =?us-ascii?Q?EL80zdVkadDbwGOEdntREB6LPYbBlx+W0HIJsBHagp89cQ9ycehvVfsqlaLp?=
 =?us-ascii?Q?E0qRs6FRT/pWfBaLtqaVxqDC+onuGV9cgoY+8VeyKawRuPNKAqdynjKj1Ery?=
 =?us-ascii?Q?qKAuNsGs66QGBSuzA405sbve5vVpAuvCey61j/uJm3N2I/XTroGtWSkCdKWD?=
 =?us-ascii?Q?fCNtAv1cMjw6o4KcmyHKme480FnlV+M9D9jdEN9aTczQIg60pSCfMtOi5/+y?=
 =?us-ascii?Q?XBplruJ9K6epLAViHmuTowbVVeuMVnKh+wxe4G6FVf3Vh6J0nI8/HdHI4i38?=
 =?us-ascii?Q?mtWEDAy6GUiAPiJC+JvaHmTCMKQ8ycSGmeWvaaOa9EcK3PjXrcq1KeDTvAK4?=
 =?us-ascii?Q?Uhj59SGt/NZ6X3Aouj5B8XXL19A9mpWnm3WDEQNj7OVSXHWw3DYv6QqA/X6J?=
 =?us-ascii?Q?DtfhHazNMeX7D+jmbtk3iVuTy1YkcvDcsv1+6O3DYtmclrn5nbgw+bN9J4D1?=
 =?us-ascii?Q?x5fVNJu4NVXjN81JU3p+oTbhGLu30lVMjiwFc8V4nY2uYO+0ZUvhdSGGP8q4?=
 =?us-ascii?Q?jXQIeHkDepuYlXbKnxZonf6bch/T+uP7YnpJ8RdZ7Gk7qa6DHECUvq5UrFwO?=
 =?us-ascii?Q?rgPcgwclRsr+TL+SEbUJJXdZl1dny1Q/4j+uWjQCyZYpxE79Ev6Lk4OCndQN?=
 =?us-ascii?Q?kwXXsjgOAx0PIOaOYGJgyoLbrj68pedfXc2mfyGhbmd1NJRBP0C4TXk1l6wM?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbcbf3c-0d55-4d5d-bc0f-08daf98a0913
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 19:27:28.2250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhVW26ALXblXJDOcz6uoDY2nArhi36GLi9Ts7tdUDULUMMhApvB+rVAwNgKzQ1eTzr08WmuqqO9MBJu2uNgS4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 12:26:27PM -0800, Matt Roper wrote:
> The implementation of Wa_22011450934 introduced three new register
> definitions in i915_reg.h that didn't get moved to the GT/engine
> register headers when all the other registers moved; let's move them to
> the appropriate headers and tidy up their definitions now for
> consistency:
> 
>  - STATE_ACK_DEBUG is moved to the engine register header and converted
>    to a parameterized definition; the workaround only needs the RCS
>    instance to be programmed, but there are instances on other engines
>    that could be used by other workarounds in the future.
> 
>  - The two CULLBIT registers move to the GT register header.  Since
>    they belong to MMIO ranges that became MCR starting with Xe_HP,
>    their definitions should be defined as MCR_REG() and use an Xe_HP
>    prefix to keep the register semantics clear.
> 
> Note that the MCR definition is just for consistency and to prevent
> accidental misuse if other workarounds related to these registers show
> up in the future.  There's no functional change to today's driver since
> the workaround that references these registers only accesses them via
> MI_LRR engine instructions.  Engine-initiated register accesses do not
> utilize the same same steering controls as CPU-initiated accesses; they
> use a different steering control register (0x20CC) which is initialized
> to a non-terminated DSS target by pre-OS firmware and never changed
> thereafter (i915 does not touch it and userspace does not have
> permission to change that register).
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_regs.h | 1 +
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 4 ++++
>  drivers/gpu/drm/i915/gt/intel_lrc.c         | 6 +++---
>  drivers/gpu/drm/i915/i915_reg.h             | 4 ----
>  4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> index ee3efd06ee54..6b9d9f837669 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> @@ -81,6 +81,7 @@
>  #define RING_EIR(base)				_MMIO((base) + 0xb0)
>  #define RING_EMR(base)				_MMIO((base) + 0xb4)
>  #define RING_ESR(base)				_MMIO((base) + 0xb8)
> +#define GEN12_STATE_ACK_DEBUG(base)		_MMIO((base) + 0xbc)
>  #define RING_INSTPM(base)			_MMIO((base) + 0xc0)
>  #define RING_CMD_CCTL(base)			_MMIO((base) + 0xc4)
>  #define ACTHD(base)				_MMIO((base) + 0xc8)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 4f5c06d60bcd..4a4bab261e66 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -407,6 +407,8 @@
>  #define GEN9_WM_CHICKEN3			_MMIO(0x5588)
>  #define   GEN9_FACTOR_IN_CLR_VAL_HIZ		(1 << 9)
>  
> +#define XEHP_CULLBIT1				MCR_REG(0x6100)
> +
>  #define CHICKEN_RASTER_1			MCR_REG(0x6204)
>  #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
>  
> @@ -457,6 +459,8 @@
>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
>  #define   BDW_HIZ_POWER_COMPILER_CLOCK_GATING_DISABLE	REG_BIT(3)
>  
> +#define XEHP_CULLBIT2				MCR_REG(0x7030)
> +
>  #define GEN8_L3CNTLREG				_MMIO(0x7034)
>  #define   GEN8_ERRDETBCTRL			(1 << 9)
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7771a19008c6..1dffe392b95c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1351,16 +1351,16 @@ static u32 *
>  dg2_emit_rcs_hang_wabb(const struct intel_context *ce, u32 *cs)
>  {
>  	*cs++ = MI_LOAD_REGISTER_IMM(1);
> -	*cs++ = i915_mmio_reg_offset(GEN12_STATE_ACK_DEBUG);
> +	*cs++ = i915_mmio_reg_offset(GEN12_STATE_ACK_DEBUG(ce->engine->mmio_base));
>  	*cs++ = 0x21;
>  
>  	*cs++ = MI_LOAD_REGISTER_REG;
>  	*cs++ = i915_mmio_reg_offset(RING_NOPID(ce->engine->mmio_base));
> -	*cs++ = i915_mmio_reg_offset(GEN12_CULLBIT1);
> +	*cs++ = i915_mmio_reg_offset(XEHP_CULLBIT1);
>  
>  	*cs++ = MI_LOAD_REGISTER_REG;
>  	*cs++ = i915_mmio_reg_offset(RING_NOPID(ce->engine->mmio_base));
> -	*cs++ = i915_mmio_reg_offset(GEN12_CULLBIT2);
> +	*cs++ = i915_mmio_reg_offset(XEHP_CULLBIT2);
>  
>  	return cs;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 8b2cf980f323..d30443f06bdd 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8113,10 +8113,6 @@ enum skl_power_gate {
>  #define CLKGATE_DIS_MISC			_MMIO(0x46534)
>  #define  CLKGATE_DIS_MISC_DMASC_GATING_DIS	REG_BIT(21)
>  
> -#define GEN12_CULLBIT1			_MMIO(0x6100)
> -#define GEN12_CULLBIT2			_MMIO(0x7030)
> -#define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
> -
>  #define _MTL_CLKGATE_DIS_TRANS_A			0x604E8
>  #define _MTL_CLKGATE_DIS_TRANS_B			0x614E8
>  #define MTL_CLKGATE_DIS_TRANS(trans)			_MMIO_TRANS2(trans, _MTL_CLKGATE_DIS_TRANS_A)
> -- 
> 2.39.0
> 
