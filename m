Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD85B0E80
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D0C10E881;
	Wed,  7 Sep 2022 20:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F50A10E881;
 Wed,  7 Sep 2022 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662583786; x=1694119786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H2Pn958faMMQlgXtw4kxJqTnj0AEQHLi6BagOhOr/rM=;
 b=PpTLzYFdHRgeFwcCq0sw69niAZyUUbBGgZYSOS0xuemMZCWK2oVbEEw/
 xWVqCLshgbNVNlvt4xCDFKK8G8GcHJ4dQcYPPy5EHEMPSUFjByvU3tivK
 01oBfHDahkvvDHlE7LfS9HXa6O3QVDDQgtoyWu1Zj5aFwLwTDGuvPjGYK
 geAYIP3pYIcDlRUy11CZRc6NNnafWPJrmWlU98oaekDgtA95PYeho3Dhz
 YRrzjfCaN55p25veprF5zkJ17TZTcUYI/B9PwfUR6FcmQLgVpbjxHfHW1
 6Jo472WnmWXR94Z3HF26eEVyesc01DE8QRe3XoD0+oISSZOPmEFpH0ewL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="295728165"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="295728165"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="859782057"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2022 13:49:45 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 13:49:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 13:49:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 13:49:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 13:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EktWzNs6Whv4HNZTHq8edDhr/mW5u4Ke3+YxwzS2FRUYwJYVvIxZzS0BgMjOVycitXc916p96N3KJDvTHXPATZ5In7Kz/DBvHowkzQBknDFGG8K50c0l46NicKfubxqigyIMcoXRR9Fnx3K5gu5BnzjPwVbAND/q6JWPulDlgkwBbkauTGlfiCubBwsybndiJWCpAhQ3hGRP/UPsNLovzBoxNNt4143aVCxgx1CnUPYn2GQZgGHv8mXGsPp5XlNXngGdWVtTDNa0OQpkFFoFKfia5I+fk5RxRLXbHKX14uA5bTbmpr084XYclufQ9FmBr1w4O4kB9nKqS1M58oi9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M0M/hYqOLUJX3WyVqHHvQ3DFjXtMbGkyLIBUu9MLaM=;
 b=ElMswaQGgLO++5zymYW/L3ZBRvgdAV/YGsM3C3vlMGsjvrdyq/I/hpYlW8s1e0dP5AsKKUBn983MHA6kOvqbhIOpVE7N4VBRmOQ8JMFK21zE0hIdQowKLU9Hl4ysBPefnrDuA090Bod/nK8l1PhHzlyY3Fc7osmk2uW639IXm0nYUToL+r3NQMkZmczorlXXf5q8NwwJ6ZyEIBRQmam3lcnyblAyn457qmTPD4D7S8N4oevnzTsdc2LJ0Z7X9VM2iri7xvvfBoafavCoyIoahFxj56YjTUAUxrCXrPTtEWi+unXxXTIRWl2pxCnvQkbWLhkr2mI26y0Qg6E/bn3iHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4059.namprd11.prod.outlook.com (2603:10b6:5:4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.18; Wed, 7 Sep 2022 20:49:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 20:49:27 +0000
Date: Wed, 7 Sep 2022 13:49:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Message-ID: <20220907204925.52jz35ufbxvvm3yv@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-3-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-3-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e792864-43e9-44a6-0784-08da91127459
X-MS-TrafficTypeDiagnostic: DM6PR11MB4059:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAdapGVPC32Bd0boLWGzKb5WgztRRfDdvgQLlrAs7vt2wfkkYGPdysJthT8YQ+bi7NVzoMLVe441aNSUoamr6bHqaJHUZ+aBUAOVb/QtsIIvZtjj2ax5OfnaDs82UvRLmekcAsU7sWdtyprgz+66DVbeX3XEB03DIz5gq2IC37SYmmZTv5nnVzVHl6f6+t4uGyrbLVYM5I/eXmv9V2gbjAjQJTJB4V7BOhD6FK2aqkv67gJbZitg04EDdM2AxWQQBdGA6WA55HbBThHwW/kqAbbAOJSrnBiN+KK5QPKpRX1XkOvfEetEPM+dbpZ4eqAF2LeRuTZ/J/o0lSGEIAhsD9TCC+vaZDOP5o4GjnZoCG1/l9BFa+EP7jpM+1NZypRDrdzoDiRuoHzWgf6rxCQ/aghGx16GDsUEAF7BKyNHNZxxy+vEqGmPcUsRstm8ZWq9FK+hi0RTtquhEe4KXNbW+b39RVccr/99ehbPTzunHoh2LaGTXo2KZQ+vGDiWPuzlHx6kdEOAwD9JPXoNyRDOUfUUmwtUkOHwo8DYOiX0L3Rv4wxUnWr6btO+ooNiWb5qyYHq2zL0Xs6NQxyQ3B9zKAA/DNl563EmukzH+SublhgzFq0NBa8LMfMu7HipRcUi7TvHzkqbezJ5gC3DZ+P1zGU0lxOMWe4R3KKjnAJ6KzwpydOnO0lJ6w6fHwQfSaH+ETGBFwToHjJYWAdeVZ/ZBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(136003)(376002)(39860400002)(4326008)(450100002)(66946007)(66556008)(8676002)(478600001)(86362001)(66476007)(6486002)(54906003)(82960400001)(316002)(38100700002)(6636002)(41300700001)(6506007)(83380400001)(6862004)(2906002)(8936002)(1076003)(5660300002)(6512007)(26005)(186003)(107886003)(9686003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bHqeyBiOQKysCANiC7v4gShIJ0vGwN9xsBcocA7rdr97DnRjRK15t5nvdvPg?=
 =?us-ascii?Q?c/x9VuMV2n5Z6jwg8DVMAtSBpXJXL9n3HW0ii48LEOwV9/Vs29b58r77GVLk?=
 =?us-ascii?Q?60WWgS8I/y2mQoH08JoXfcehVW6BaiReYKBDGKC4kT+1dKeJh9G3wy5BZqGw?=
 =?us-ascii?Q?oSlBYLkgoT2bfscIIfbWvChokM4GzEJ8eudTWaC2w/KpwZ3kyqLu7RSFowxe?=
 =?us-ascii?Q?1QHAiC7EOaJwJ5/9r22/CTGyIm6i8P+nucf9UeuSGQSCWF7rEjgzMuQ4bksy?=
 =?us-ascii?Q?1K7VssREvCAMlnyDOqw6NLa9q6XLTGeRgD4HA35hBHplLBTAcpdS1/OtKWFG?=
 =?us-ascii?Q?VSfdaWQMC+caa54DRBhg1YS29BCTcMfUf0ADv81LLm7xy0NSF/ACsOkdNJQP?=
 =?us-ascii?Q?to2s3Jv+O38HZaYMQoX4j8UF3U6LkTXkvLGheRR6hCAUXw/uKaCIr5MQiAzu?=
 =?us-ascii?Q?QQ0+vZatM2xzludIk0ODIEtuQo11UkVt824j0NBSq5M8OnZlsd9wOWwiRD/5?=
 =?us-ascii?Q?MUkvpkVibapdSXzwasloWgD+MZL/hdLy79xvZS1OLmRPl+QEr1C1LsGZyfAx?=
 =?us-ascii?Q?IP19GLS0J1otY739E7OSjhhhwggPt1SWc1+5NxYdhALHmVKXdcQWYbOungUk?=
 =?us-ascii?Q?0LndvicNe5/lXSNpDzZKNQd5QBz1n1Y6G0nY6iwRXQ/Fa8qrO70vhFRaUVYq?=
 =?us-ascii?Q?RSUYOkBtmNcyPHCBAu1XoDWyvvDZ78gyVA2YFAMdsAGsmlQKEymcfvTPvi2R?=
 =?us-ascii?Q?P3lzhvKLaAUYSAUu6DN+CC3P1xid7egKNq66cAgBkI4HzkdG4gPu8LxY03pg?=
 =?us-ascii?Q?Ebx8y/WK/VGxky1hazKRAfe/oaQgYx8lnTrKC7JRrp3PCaotSoMXtUWhA+Lk?=
 =?us-ascii?Q?TlZay898R25U6tVPkuF6jheIW9BvYiKUJ6rNKsUYW4S/KTSp0eqkfX04ykXd?=
 =?us-ascii?Q?d5q0jmJbC/DRed5Ecm4R6lVAg53kEiNUmjg7W+19Q6WiISvg9kqALzC0tdEA?=
 =?us-ascii?Q?6xme6vLq6SwSHOMXxt7WpldvhaAv7l9D4ICaqVl5Tt9P+Jn+yPb8+7kZRgkS?=
 =?us-ascii?Q?kPHRjeKY7ErE8PaLpxleKeLPV6AZhFhf1o0COSRO0bhme0bEvw+5b5N8fbj6?=
 =?us-ascii?Q?Lk3+aL/03KCBN9DKhFKQXkmTLeVAClVCjqtGpze7al2yvTh0sIpfp428bkDU?=
 =?us-ascii?Q?a1vv//5EM9LztrXRBO0jnFKm9iNZv34RwGtNaL7uAu4PJArjuHvooepWTTjH?=
 =?us-ascii?Q?yF1PldSprnqBNS30eWaUYD4Ay3IzoQXP+XeGc0S9YWkN4C9ugAueiOoIi8rp?=
 =?us-ascii?Q?KHogiLJqcGTwLlrEoOXRMauzvxv3Azs6VIibAtLhYswbbzSmeiY3GEmdWd1t?=
 =?us-ascii?Q?ZhUTfMmxucD5ICaItrUlY1GOe4y6AwnoWRLbXbz1FrhYc+a20reEYhSiV6lj?=
 =?us-ascii?Q?E3Xd8HimlgklfgXFtY9+lcdCGadjUfk5j6dPAIsQiNW1uhzsmsS7pr9u7VYj?=
 =?us-ascii?Q?4YVOeSwx1zT720mxTKFFpnev1bttsZ3X1xDnV9Z9c+WlxhrjtgS53uHzWYnq?=
 =?us-ascii?Q?GkP2ZlmzKGKGWyr0avPpcIygHTuo5sxqol9Gy3/NV7P9zzSvgMEkNWlaKgCX?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e792864-43e9-44a6-0784-08da91127459
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 20:49:27.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KidXf6gVSxavb9LI6kb0jry93GH+tS58FN8TzWEKrtjTbfFDSHmna5A6+gNWS51/DdvSoGmBR9FvSar3J0iO0yPCABLGEeaoCCEWbWmv2ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4059
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 11:03:33PM -0700, Radhakrishna Sripada wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Going forward, the hardware teams no longer consider new platforms to
>have a "generation" in the way we've defined it for past platforms.
>Instead, each IP block (graphics, media, display) will have their own
>architecture major.minor versions and stepping ID's which should be read
>directly from a register in the MMIO space.  New hardware programming
>styles, features, and workarounds should be conditional solely on the
>architecture version, and should no longer be derived from the PCI
>device ID, revision ID, or platform-specific feature flags.
>
>Bspec: 63361, 64111
>
>v2:
>  - Move the IP version readout to intel_device_info.c
>  - Convert the macro into a function
>
>v3:
>  - Move subplatform init to runtime early init
>  - Cache runtime ver, release info to compare with hardware values.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
> drivers/gpu/drm/i915/i915_driver.c       |  3 +-
> drivers/gpu/drm/i915/i915_drv.h          |  2 +
> drivers/gpu/drm/i915/i915_pci.c          |  1 +
> drivers/gpu/drm/i915/i915_reg.h          |  7 +++
> drivers/gpu/drm/i915/intel_device_info.c | 74 +++++++++++++++++++++++-
> drivers/gpu/drm/i915/intel_device_info.h | 12 +++-
> 7 files changed, 98 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>index d414785003cc..579da62158c4 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>@@ -39,6 +39,8 @@
> #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
>
>+#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
>+
> #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
>diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>index 56a2bcddb2af..a1ab49521d19 100644
>--- a/drivers/gpu/drm/i915/i915_driver.c
>+++ b/drivers/gpu/drm/i915/i915_driver.c
>@@ -323,7 +323,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> 	if (i915_inject_probe_failure(dev_priv))
> 		return -ENODEV;
>
>-	intel_device_info_subplatform_init(dev_priv);
>+	intel_device_info_runtime_init_early(dev_priv);
>+
> 	intel_step_init(dev_priv);
>
> 	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index f85a470397a5..405b59b8c05c 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -936,6 +936,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>
> #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
>
>+#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
>+
> #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
>
> #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
>diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>index f6aaf938c53c..4672894f4bc1 100644
>--- a/drivers/gpu/drm/i915/i915_pci.c
>+++ b/drivers/gpu/drm/i915/i915_pci.c
>@@ -1129,6 +1129,7 @@ static const struct intel_device_info mtl_info = {
> 	PLATFORM(INTEL_METEORLAKE),
> 	.display.has_modular_fia = 1,
> 	.has_flat_ccs = 0,
>+	.has_gmd_id = 1,
> 	.has_snoop = 1,
> 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index 5e6239864c35..e02e461a4b5d 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -5798,6 +5798,11 @@
> #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
>
>+#define GMD_ID_DISPLAY				_MMIO(0x510a0)
>+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>+
> /*GEN11 chicken */
> #define _PIPEA_CHICKEN				0x70038
> #define _PIPEB_CHICKEN				0x71038
>@@ -8298,4 +8303,6 @@ enum skl_power_gate {
> #define  MTL_LATENCY_LEVEL_EVEN_MASK	REG_GENMASK(12, 0)
> #define  MTL_LATENCY_LEVEL_ODD_MASK	REG_GENMASK(28, 16)
>
>+#define MTL_MEDIA_GSI_BASE		0x380000
>+
> #endif /* _I915_REG_H_ */
>diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>index 56f19683dd55..a5bafc9be1fa 100644
>--- a/drivers/gpu/drm/i915/intel_device_info.c
>+++ b/drivers/gpu/drm/i915/intel_device_info.c
>@@ -29,6 +29,7 @@
>
> #include "display/intel_cdclk.h"
> #include "display/intel_de.h"
>+#include "gt/intel_gt_regs.h"
> #include "intel_device_info.h"
> #include "i915_drv.h"
> #include "i915_utils.h"
>@@ -231,7 +232,7 @@ static bool find_devid(u16 id, const u16 *p, unsigned int num)
> 	return false;
> }
>
>-void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>+static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> {
> 	const struct intel_device_info *info = INTEL_INFO(i915);
> 	const struct intel_runtime_info *rinfo = RUNTIME_INFO(i915);
>@@ -288,6 +289,77 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> 	RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
> }
>
>+static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip)
>+{
>+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>+	void __iomem *addr;
>+	u32 val;
>+	u8 ver = ip->ver;
>+	u8 rel = ip->rel;
>+
>+	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32));
>+	if (drm_WARN_ON(&i915->drm, !addr))
>+		return;
>+
>+	val = ioread32(addr);
>+	pci_iounmap(pdev, addr);
>+
>+	ip->ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
>+	ip->rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>+	ip->step = REG_FIELD_GET(GMD_ID_STEP, val);
>+
>+	/* Sanity check against expected versions from device info */
>+	if (ip->ver != ver || ip->rel > rel)

this doesn't seem correct.. if we have

	ip->ver == 12, 	ip->rel == 1
	ver == 12, rel == 0

we will print

	Hardware reports GMD IP version 12.1 but minimum expected is 12.0"

should it be `|| ip->rel < rel`? Once we land the static number in
device info, we can only expect new .rel versions greater than that.

Lucas De Marchi
