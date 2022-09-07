Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458D5B0FB2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 00:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2810E8CF;
	Wed,  7 Sep 2022 22:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7521810E8CF;
 Wed,  7 Sep 2022 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662588818; x=1694124818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ve45lAWRH67AhYr3WGXYX9y9aqAvYEwS4NfakWhBWVo=;
 b=MoRFqyHzI93+597c96FPL4GJkfg9rLg1Rt1Iqr6m3+dLWwXfYPAxmyUr
 gDyxeiiNmf1hu+v0xkHDWinNHTvVkrEIVKyX7SQ29n0bsnHhgE8LV+BMq
 mQLNDyBtpCFk0G8rtq13TmTk7dOEh1IXODD/TfxMqwbHjlyh+5sX6Vw6b
 8oID1NGV/DQ+eXNEGjmhjg8JwzfhFN7ISlUioTOdwmst5avngBg/XLQRe
 cq0WdQMBDhTL7qfaTXIhg78SJlEIORgPO/HzN4cVLkRRwnRv4bpxQ5jta
 JIx2VrBi7/thjx2vWDB5UIy+vL5hIu3n4eZf33PGoB3hoXf9nZjTgzHP5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="284028123"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="284028123"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 15:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="591899775"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 07 Sep 2022 15:13:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:13:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:13:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 15:13:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 15:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q74UKuff8ZYWNhRyUmQ21P7MJdv8ZDwNLHff+geAkz7aY13pt6flN7+kYfJ2E5kSwlPkjGrSvGozzZn9Q5vgGXZvP/+rK+lccaZZZVn0XYQfibMVZxgB6Zgy4bE7+HlN62QvA07Uwy2DFYTXZXeUZXC3zopZae35tkr2g8BR7j/nW9tlBHE0zWcJzgaaEfYi+XEFM1rhf8RPDF5nemh3gqaC0S6qk9c2OSQcHH71VKrA2/MqBqUngSZ1MeI+f5ldLV40z680LFW3Vbkh+UzYN52I/cuhGrhq3YldVbUl2lXJCEyRHkLXVCMl1RPjUKO8iZdIv7ngtSmHui1BsHnVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCXkeBkjzo+TqUVCB5hpPJHTm2HzF4+TjKrsUKQjC/s=;
 b=bPAuEN5PlDm83KI/Qth05teHwW0S98vr+kSQwqdgNibVMeDMPOTsQ9zB7MMJVveVdjSWc0sU+ssC/GZADa2pZ9fRYZE7R+WXV92GRVKrF07QDwou/SD2/AqPg1ZPKvtBYpOtcQWJnIIJtlfEui9vcfEfqcmNfWgmDumnw6DVQQJ6utbr8lB2YugCFgd2CoASGOJ13z0DzhAV16b8wgznqwb5xr8jiap/mv1Ajt0lmuvGlE0kJXjVrensuCOGr9QMQ6PlbhARGpBCB5tbvLvRhutUnDSmiXxQeK42QzlkTvumCSY2SkIOkOXjiEgbpp2mgaPLgQ+mfXey+xI7QZb6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM6PR11MB3467.namprd11.prod.outlook.com (2603:10b6:5:8::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Wed, 7 Sep 2022 22:13:34 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 22:13:34 +0000
Date: Wed, 7 Sep 2022 15:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Message-ID: <YxkXi5b2heLYZaRS@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-3-radhakrishna.sripada@intel.com>
 <20220907204925.52jz35ufbxvvm3yv@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220907204925.52jz35ufbxvvm3yv@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec58af19-3c72-42d7-18df-08da911e3495
X-MS-TrafficTypeDiagnostic: DM6PR11MB3467:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iL7G7PFVEbwnarCyv8PQo+ZvKjD9wrWjdqcD2AHNvk9/V/n/FknWJ9XE7OGZxwpteqNXJHtbJPC3iTFeoOXaOTMHESAkcmuBPx1OM9elqaEu4YeukM90/1TK04MoNDm3S1nRRU2VDBEsZ30w/mMLoD2S/iYLNTu1I/F6cmxVTUqERk+JKOh/VyLyC5puHl9IGIZ05b6Fssi+4S/lTu3xJDE5yXyQrL67+W9c6Tpz/zG61jJRusHje8oxSiNchLS1FcEON7U+MQAYF5srsogHmncAAQlamK42p7RWJLYFi+Uqxig97nKqwJMvMPp3BPm89WHLbnmcNDwNecMv/u4FYc3F2I+UGHZK+1dJzIZyDIQI8LhMqdgT+lY13O/EcyFFH6vxbe11XWzuNimdVQteqox2n/r6Yon54MUE+/IffxQIu6ppG8gYNcw1e+zxdArDZbmGqJX4pnmoifON1ltk/9UkK8ElyVg5zxkzGc5GdL+aKDp06aTxXUiW09TeTF0dSkI6SgLbBUj4USd55GRBDyPpWetemjbPo5XHTUnoWWABIvVnrKSPoEqP4RbcoKvuhQYHNWaudbwDl1vE7zmvdqBzQTYsBYSlFJyBnWX6Fu6hrv3JrpJiU1R8y+EGMIjYBn3KJQ3tbAR+YY3Ss2YwdB3cyEo+yWMCVKS2lXJWTlL2b3mAT36Y5fUgpzUUVW+c3PqYPzgjYE5wjzeCUwaW/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(39860400002)(346002)(396003)(136003)(6506007)(6666004)(4326008)(450100002)(2906002)(54906003)(66946007)(6636002)(66556008)(66476007)(8676002)(26005)(6486002)(478600001)(41300700001)(8936002)(107886003)(316002)(6862004)(5660300002)(38100700002)(86362001)(186003)(6512007)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3sNL1XHGujmxskh+dORvk2imwigg7dDVZvbTG9fts1PKFEv/j+gIj7QwK+Nn?=
 =?us-ascii?Q?aeRYZZRTzjE31iyl+miq3mmzw7RXEXRkql+54tgGy0cjdsL6V7DCGWoG8hRQ?=
 =?us-ascii?Q?EA+rQiTkfFf+NiauS7jXs5q6FaLIw/ez7HW3kR2FEbInLmx+D0bYEDqBvnPH?=
 =?us-ascii?Q?Z5Rpjlddg61mmKCufnA/sxNLGcYjNY791hSL2mlesSM4FZUYsYs5d4NpJC+r?=
 =?us-ascii?Q?GoR0g2YPJaVCQNHC09IPR0I6TQZwdAo6OY9v6kVr0AJdU9c9hcQmiJt2UnGv?=
 =?us-ascii?Q?wLEW6rrlxdG7K1+MaQq9oP/ulgEl1tdLWUEPK6Z0t6kVEs1drFIYt2oB0viZ?=
 =?us-ascii?Q?FRS43Q9j1rXqUr+3cvKY3+SZdym+opYo8h52Yai4F5G76DoGwW8pIvS8jVeg?=
 =?us-ascii?Q?USKvK6J/pey6aSGOg5JRPwWlI2vHwJnsD2ToAR1AgmxVZo/1F20LTCawGkRF?=
 =?us-ascii?Q?nf+67uKY7dcyrJPZZcsTx8kexm3X2kE9Dw19PY+c+hTb4QoQJ6/QK7uqre22?=
 =?us-ascii?Q?KrdC5EJUnc4sc28JCPkdaX8F3y+SXDVN885/NIDmtMUtpxEIvsw0wA0Ntao6?=
 =?us-ascii?Q?Ao+AdFW0QBXPHcXJt45qAcSs6ClviO8FeVY2pRp7ck7wGigJZSorahjjIaCO?=
 =?us-ascii?Q?/B9Ae1MgXgVvi53XGpkTApxY65mRKq1pVjEQxfATjXxQoCgt1+UPTarqPjyW?=
 =?us-ascii?Q?B/Y3XzXOXFvFmF4eQELi6mV08+H9gwfYh9BqylmRH5ciQdFVBAM7dVJFoIEl?=
 =?us-ascii?Q?PLIb42Nnea2Vjj1CbQVoHbuUAedeUaVmghsOuG3yk7r9nlZgpYE39p6L2bNz?=
 =?us-ascii?Q?3QKlRaNlSVrH+nqpsdIc60KhH3A/SOE/4s4ckm07hy5jiVEVaC6loMZsBywM?=
 =?us-ascii?Q?fruJ4F3pbCOUFaJUh/ijAyhAQMov/6dTSXT94H4Itid8FGFUPmXQ1J5uMscH?=
 =?us-ascii?Q?ruWfUkOWk9mnE9SWLxveOP1M+A0B0+y+0/Cny2jvogmUALXFJAixNbacBbo8?=
 =?us-ascii?Q?N4kVmPtoaq9GtSqVjepzd/cIUnWiTsFbf1knL7732DH8aSQ3QKPyl1liAWuh?=
 =?us-ascii?Q?uLrQmlCFqgnP6h+OyYEwL+3EgZNVMzUMi5L3Ox8MbvDW8unhHHZXHgmNTGmD?=
 =?us-ascii?Q?VkuGYp3qYtFoOh78Sp2dOf9YJ21bbETPMPWYEDB8EobQZNtTe44Vqo8zuNxV?=
 =?us-ascii?Q?Tm8ADbmT/DXBEWiJ32/WJIpmIJOfU3SBq0me7B7l2cj7e6tYaVNDKfIV0Mh3?=
 =?us-ascii?Q?f9Ol1HFz0vG2/ZANo1vY2Kpwbnn+ix9EH7gU9gU4msQuQvQ0dAipxJa7k5BN?=
 =?us-ascii?Q?eSO1JFfRaYmqov8FjDt04ZPJp7U92vnTEzMD60Xz43mHd4x+A3d/vDlaJHLQ?=
 =?us-ascii?Q?8W/SmnI89LwBqX3i65kb2wl5d9MbiBIXlWlwli5c1vl7KjmQEDQJDGffmH8h?=
 =?us-ascii?Q?Ix3+drnGkmkTYm9QcQm1dlizWWrRLIJe8tnPDRSQdlBzZkC2TGU3v07zcfrp?=
 =?us-ascii?Q?0kK8jaUYAsMPP68gI0i6I9HY2SaYNCO60+tP/o8JJIDgMLVGbKG7jHDLiww7?=
 =?us-ascii?Q?GjjeysYAeLAzhQqq+gDpOgVcTAzeETXM9lc0oOQBCYe/TXrK0ZQHa4sPvela?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec58af19-3c72-42d7-18df-08da911e3495
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 22:13:34.5454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DA2PNgMkbvpDI4OUrAVrI+5pEKSlLGXTeldktoc4vjjTmCQkbV1Xp3gu1LjtFUTOQu9SikalFZ1vyVHKTCJlCPUvv3WplC6HFNDLbu+MyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3467
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 01:49:25PM -0700, Lucas De Marchi wrote:
> On Thu, Sep 01, 2022 at 11:03:33PM -0700, Radhakrishna Sripada wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > Going forward, the hardware teams no longer consider new platforms to
> > have a "generation" in the way we've defined it for past platforms.
> > Instead, each IP block (graphics, media, display) will have their own
> > architecture major.minor versions and stepping ID's which should be read
> > directly from a register in the MMIO space.  New hardware programming
> > styles, features, and workarounds should be conditional solely on the
> > architecture version, and should no longer be derived from the PCI
> > device ID, revision ID, or platform-specific feature flags.
> > 
> > Bspec: 63361, 64111
> > 
> > v2:
> >  - Move the IP version readout to intel_device_info.c
> >  - Convert the macro into a function
> > 
> > v3:
> >  - Move subplatform init to runtime early init
> >  - Cache runtime ver, release info to compare with hardware values.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > ---
> > drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
> > drivers/gpu/drm/i915/i915_driver.c       |  3 +-
> > drivers/gpu/drm/i915/i915_drv.h          |  2 +
> > drivers/gpu/drm/i915/i915_pci.c          |  1 +
> > drivers/gpu/drm/i915/i915_reg.h          |  7 +++
> > drivers/gpu/drm/i915/intel_device_info.c | 74 +++++++++++++++++++++++-
> > drivers/gpu/drm/i915/intel_device_info.h | 12 +++-
> > 7 files changed, 98 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index d414785003cc..579da62158c4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -39,6 +39,8 @@
> > #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> > #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
> > 
> > +#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
> > +
> > #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> > #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> > #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index 56a2bcddb2af..a1ab49521d19 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -323,7 +323,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> > 	if (i915_inject_probe_failure(dev_priv))
> > 		return -ENODEV;
> > 
> > -	intel_device_info_subplatform_init(dev_priv);
> > +	intel_device_info_runtime_init_early(dev_priv);
> > +
> > 	intel_step_init(dev_priv);
> > 
> > 	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index f85a470397a5..405b59b8c05c 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -936,6 +936,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> > 
> > #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
> > 
> > +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
> > +
> > #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
> > 
> > #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index f6aaf938c53c..4672894f4bc1 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1129,6 +1129,7 @@ static const struct intel_device_info mtl_info = {
> > 	PLATFORM(INTEL_METEORLAKE),
> > 	.display.has_modular_fia = 1,
> > 	.has_flat_ccs = 0,
> > +	.has_gmd_id = 1,
> > 	.has_snoop = 1,
> > 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> > 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > index 5e6239864c35..e02e461a4b5d 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -5798,6 +5798,11 @@
> > #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> > #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
> > 
> > +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> > +
> > /*GEN11 chicken */
> > #define _PIPEA_CHICKEN				0x70038
> > #define _PIPEB_CHICKEN				0x71038
> > @@ -8298,4 +8303,6 @@ enum skl_power_gate {
> > #define  MTL_LATENCY_LEVEL_EVEN_MASK	REG_GENMASK(12, 0)
> > #define  MTL_LATENCY_LEVEL_ODD_MASK	REG_GENMASK(28, 16)
> > 
> > +#define MTL_MEDIA_GSI_BASE		0x380000
> > +
> > #endif /* _I915_REG_H_ */
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> > index 56f19683dd55..a5bafc9be1fa 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > @@ -29,6 +29,7 @@
> > 
> > #include "display/intel_cdclk.h"
> > #include "display/intel_de.h"
> > +#include "gt/intel_gt_regs.h"
> > #include "intel_device_info.h"
> > #include "i915_drv.h"
> > #include "i915_utils.h"
> > @@ -231,7 +232,7 @@ static bool find_devid(u16 id, const u16 *p, unsigned int num)
> > 	return false;
> > }
> > 
> > -void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> > +static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> > {
> > 	const struct intel_device_info *info = INTEL_INFO(i915);
> > 	const struct intel_runtime_info *rinfo = RUNTIME_INFO(i915);
> > @@ -288,6 +289,77 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> > 	RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
> > }
> > 
> > +static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > +	void __iomem *addr;
> > +	u32 val;
> > +	u8 ver = ip->ver;
> > +	u8 rel = ip->rel;
> > +
> > +	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32));
> > +	if (drm_WARN_ON(&i915->drm, !addr))
> > +		return;
> > +
> > +	val = ioread32(addr);
> > +	pci_iounmap(pdev, addr);
> > +
> > +	ip->ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
> > +	ip->rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> > +	ip->step = REG_FIELD_GET(GMD_ID_STEP, val);
> > +
> > +	/* Sanity check against expected versions from device info */
> > +	if (ip->ver != ver || ip->rel > rel)
> 
> this doesn't seem correct.. if we have
> 
> 	ip->ver == 12, 	ip->rel == 1
> 	ver == 12, rel == 0
> 
> we will print
> 
> 	Hardware reports GMD IP version 12.1 but minimum expected is 12.0"
> 
> should it be `|| ip->rel < rel`? Once we land the static number in
> device info, we can only expect new .rel versions greater than that.

I'm not sure how much value there is in keeping this sanity check at all
given that we plan to remove the device info versions completely for
platforms with GMD_ID.  But if you want to test this in an easy-to-read
manner in the short term,

        if (IP_VER(ip->ver, ip->rel) < IP_VER(ver, rel))

would probably be best.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
