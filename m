Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8965DB67
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 18:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7410E461;
	Wed,  4 Jan 2023 17:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C28C10E465;
 Wed,  4 Jan 2023 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672854123; x=1704390123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mVoE3mAdeUpv+TO1swem7F91pJuUTJK3qXjpeHaWnn8=;
 b=KaD6XqgAscExefIgvaYMJ7jqZdOV0sS5VdfCEkun9S0B6T7Mb6QQJUc/
 s2cP81IE74IUa005PTOO4s5YCZyzfYHjTcW2uoTs2evX7KAsN6KrbDJ1j
 ndXfDsTlr1O/T6UuVAxJYNA7DB8mmmxe2gi1+lGQxAxPacJxylZNYHRk0
 GDOotnIPeVoLh/X+ZGdl99YWdoAIRRa9L/46dHKAujK8jd6iV9h6wRT8N
 /NFkn68v2yuKNsecUgZhExo1wDPHKKbE+Fcyknmz6AUddabG6wSlcb+Jn
 8u6nbaWLdJCBigiFN0Qic5cmkOVhvWzf+odERI8kZwFkzZ2VSQ0D0r+1F A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="323231647"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="323231647"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 09:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="657194991"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="657194991"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2023 09:42:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 09:42:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 09:42:01 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 4 Jan 2023 09:42:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi31f9zGA0yYaQYhNFlqa3hjdqUQ5alxk0dW6ZC1kWufyWvTrQKzI201Q29Rpi18ocAkLWk0T8QTFs3BMq9OBOWeJ0CyaMaaZcc7B/naPCDoO2mxXa+vyADtf3IORfTaBLaz+f2UufBMftkade1vlPCUc+ZOEdcX3Qg0wL24fHAWcXgTzjiQfZWpChkX8Ll0YMByS2tnFUnLXXjEh76/422iRQPmlpLLxiR2Fy5Sk2f0XXnHXcKK0DhsPpRcirRB13pOXJef/0f6V5jGSZQZI2bXuaKCF/sQHOlk4XPet92Jn0ipvrUSntNeKIoYJvcIFOoyyP8xPOKjcSzD27KV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdF9yX4T0yyiEXdHuVPlQWpKX6iQmtxYNobirUWw63w=;
 b=cLRKCJtflTZq7v2pa86gD0UzSLiFvlem6U75aT3uNchzG7bpDyjHdbkMd6vaShOF1DVRA6gSonx/dEvEfVJE8hgsPnF3vTRTfhcHXBVB4tRJQlrIjRk5ozBHsBCQz/MXMnKzMu1/8h2MSY6D1sDj33Trl5Q9iWBDtXvljUrfkJvYohrBvZXK2iGNzLxuZDhpQb37A4Iizb0NaSMCxv8PxIJ+IuPjtlbHH5tI+koA4j5l3K0bTYbt7y9KPY6fqSN6XL21+d/IQZm+95j8XRNwaL0Z7xeG9H0/0QD6V0OM26yj6eoZqXibJ1IeucVDC2buz6mnlPqT7WWD+zgJ1O/wJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5267.namprd11.prod.outlook.com (2603:10b6:610:e2::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 17:41:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 17:41:59 +0000
Date: Wed, 4 Jan 2023 09:41:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Consolidate TLB invalidation
 flow
Message-ID: <Y7W6Y6S9xg37wc42@mdroper-desk1.amr.corp.intel.com>
References: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
 <20221219101316.168129-3-tvrtko.ursulin@linux.intel.com>
 <083b4424-d984-a2d2-1f58-035e4c1c82bd@intel.com>
 <Y7SIwogJwS2teOgy@mdroper-desk1.amr.corp.intel.com>
 <210966b7-d736-48cd-15f4-3451d96914b6@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <210966b7-d736-48cd-15f4-3451d96914b6@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 2582b051-0013-4d0a-8fa3-08daee7afae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FDGdffz5VyWWggiunjMBhlJi+jfy1fSlgsN1m4K6vyM1+jwRfwLUXgADjzCfMGV1C/GFG3Kbb6IR3MLpN+eQWHQ5LAZtqRXKwdEURmeAVie4r8roqyc90ixH2ZFgk6/mr0kx/YB6XAxEOvWTAsQrRMolRrML60fYtr08fhPDDo5lAIE/YgLcZ0VkeABSWC0C9Egg5ULKzK3kxeCzrG3lKcO6b5/bfugYSP9mBRHz7jNgaUY5ySoY3/bRgnhHB6xaDNZGSD04cvj+9yWTGFBKkl1ibb34AIIyPa5Mj9jfhXQnY8XB2Tjgm2VZIdz7ealm9m9huoUENSxhZjdJr5VmeCTT1cyeCC13yunPDxHXrdj3K4yFEodKH1JJzNSkk2IlMJ2Yf+lcRAWGKGImabSrTfL5h5tkvQD5Zy82vvOdy+iX0RXbLQpGBm+9a9iDqkkulYrKEmm8NzmAzFGDjssJ6+uB3HBsyQ7l9TvGxO+7oMjmfC4DhBx9TAgZ5k10hycsL2ctA4xLrp4ZL2B2oKkutmtJaiAiRyjwKECTgdDHMzZpCrlfD4aQe3trwVfU1I+qtrr20Mxq4j1vdPCa+u/ab99SeQ8Acpm7UFVwsjAEpFv/Eb16k9XZsqgXUPfriyx/kQJg1MqX50aDqYhFWjbr3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(41300700001)(4326008)(66946007)(5660300002)(66556008)(8936002)(8676002)(2906002)(6916009)(316002)(6486002)(6506007)(53546011)(6666004)(478600001)(66476007)(86362001)(186003)(26005)(6512007)(83380400001)(30864003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vFKlQ971YAUAaMtKnQMupEtGgcUenJC/nUeB3WrLbOPBZYjtldXjpQI5UwE?=
 =?us-ascii?Q?BjnQkreHAVJS6xisD32bZMd9eXdmed+Z0Y4ZgIseeaKoGIksWlIm+HcdjYyn?=
 =?us-ascii?Q?fHcBSDJrhmVewSucNA2QE9HpKtAwtU9ooQ93OqlbkAiY8zORJamYR3000FfJ?=
 =?us-ascii?Q?mnz8GbSC7g0i9vnvDk2shHeqyRIrqA9EtAwPWaAck2homPcau1JYkHH9/DKB?=
 =?us-ascii?Q?ve/9SsfeOPRaFsyDiy7+0nPqL6hdt/YMU6rOoSGWu6JqNx0isQB76+NeFI5E?=
 =?us-ascii?Q?/tdlyB3JRDN/Dr33a96D8OSMuZSzY36mdhEi3EaKSYnhCkfOOequjvaeKlo0?=
 =?us-ascii?Q?SB0y00zH/RomHK8mw/rHhbtRQKyBrej+3RZGlLxU28RlNfOBMCdJ418dMxi2?=
 =?us-ascii?Q?No/awJxauHJ3oAU1SUuVSttL8HOILWRJtVd+4gxGCDNAKU7liWsoFWim7J6K?=
 =?us-ascii?Q?vkbsoV3LQ8ITkTOLUplwOq2XhGUzZ2N2axNePQHIzT56Surlr8itdbe9BVHN?=
 =?us-ascii?Q?MiXWQDNjwcfO6WtchMSXiua+hRLQxoT58P3FG6er4mwoRl4iuaXNYpT01ygK?=
 =?us-ascii?Q?CRKID8pQocW0n+qh6Umdozhu2jrtXpPItX4b5C+k81hb5GMzMa7TU8JD5jLP?=
 =?us-ascii?Q?eDHC4RQ1g/7UIz7wVWfHCpI1DdvRFwixfTpNKICF+4hBkhOHfw6BohrSV6Zn?=
 =?us-ascii?Q?pyIWFgeLIPP4976KX+5rhfToeUnwP1PRVt94S186S6E/6pYuJtwDQeh2Hkc5?=
 =?us-ascii?Q?tg5B1LAVKGahdaXlHFRP/gfGzL/Q+FiCxehkcFgPavyJBKEOweqfmxMDAfH4?=
 =?us-ascii?Q?AupWGWpseWzuwNhIhTYMiCf8+z1+fmWCaibJ0lfg5UlQM4OIo6kZ0iaabolh?=
 =?us-ascii?Q?IXvgwcYDSRpSE4ddQjLkjNCjM8rTrtekXPrcPMX3JbWS6vfW9gm/qigL5b3H?=
 =?us-ascii?Q?JRfxLRIrx0C+jpnR42XdZOmB7/EopTl18RAaT5sTCf/lGbeYFeTZv/az2VgS?=
 =?us-ascii?Q?/xeZDWcbjRVCRQgTvaSPMmdzLgsB4PvUCHjswTLgLQiMqBlNPOhgFDaAlgK2?=
 =?us-ascii?Q?Rh4Dx1RPjDwVRN/e9ixGyN1SpRNweOcLBlf1keYjybOkr21jBzGO4mVLl8my?=
 =?us-ascii?Q?EoFoLk0TmRlhCGkv7iHFVss0EfFTHcwIgrYodHD+HNPB724NMmOt8N2aRryp?=
 =?us-ascii?Q?3pYKLy1qTw14SVb2UuQyx3s+NSfn7M25ysXZggGkGfr3nm88cJMssgMP9E51?=
 =?us-ascii?Q?v78/LClcCUcWw5tIelJfoNwQtfP5hXvaHPs+wbMQP54bQa5wSFw8APyX6HCY?=
 =?us-ascii?Q?sINSBWA9is4L8kDH26OZfeLESvc0TA8mQ3UGFVslJ5F2E5q40PYYbuMhmMfW?=
 =?us-ascii?Q?eBiiXOjBXzyJ6jW5VR39MXHhXJdy/G0w9YW30NsW+m6mj3WETfsbx1gxnPEh?=
 =?us-ascii?Q?KoSvptjTgQ1M5lTqKPOeuEWXZCyqtHKVYUbUEcfGOBX3NmNhUMVmArpBrV9I?=
 =?us-ascii?Q?UvaJgv6nxmZ8g9q6pRKIu17x+wLmoTvK/SDVK7R30ZdqNdJG/btpIvfZ550A?=
 =?us-ascii?Q?jYsTMBQa7pws5mP5RAJenU8mMST8fcnhRMitQRPvYIqnkjlBHjC205PCyy40?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2582b051-0013-4d0a-8fa3-08daee7afae8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 17:41:59.1187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82FQ99ukG7LewUbCLTmiRy2Ydv7ri8HSdyXIHUp5FyFNOK4DUeFiglXP+AQNAq8rMp2dnw+m4B3DpuNqPRN6BZuHqRLR7yHAdoYGzuSVlf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5267
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 10:08:29AM +0000, Tvrtko Ursulin wrote:
> 
> On 03/01/2023 19:57, Matt Roper wrote:
> > On Mon, Dec 19, 2022 at 05:10:02PM +0100, Andrzej Hajda wrote:
> > > On 19.12.2022 11:13, Tvrtko Ursulin wrote:
> > > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > 
> > > > As the logic for selecting the register and corresponsing values grew, the
> > > 
> > > corresponding
> > > 
> > > > code become a bit unsightly. Consolidate by storing the required values at
> > > > engine init time in the engine itself, and by doing so minimise the amount
> > > > of invariant platform and engine checks during each and every TLB
> > > > invalidation.
> > > > 
> > > > v2:
> > > >    * Fail engine probe if TLB invlidations registers are unknown.
> > > > 
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  93 +++++++++++++
> > > >    drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 +++
> > > >    drivers/gpu/drm/i915/gt/intel_gt.c           | 135 +++----------------
> > > >    3 files changed, 128 insertions(+), 115 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > index 99c4b866addd..d47dadfc25c8 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > @@ -1143,12 +1143,105 @@ static int init_status_page(struct intel_engine_cs *engine)
> > > >    	return ret;
> > > >    }
> > > > +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> > > > +{
> > > > +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
> > > > +		[RENDER_CLASS].reg		= GEN8_RTCR,
> > > > +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
> > > > +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
> > > > +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
> > > > +	};
> > > > +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
> > > > +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
> > > > +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
> > > > +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
> > > > +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
> > > > +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
> > > > +	};
> > > > +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
> > > > +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
> > > > +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
> > > > +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
> > > > +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> > > > +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> > > > +	};
> > > > +	struct drm_i915_private *i915 = engine->i915;
> > > > +	const union intel_engine_tlb_inv_reg *regs;
> > > > +	union intel_engine_tlb_inv_reg reg;
> > > > +	unsigned int class = engine->class;
> > > > +	unsigned int num = 0;
> > > > +	u32 val;
> > > > +
> > > > +	/*
> > > > +	 * New platforms should not be added with catch-all-newer (>=)
> > > > +	 * condition so that any later platform added triggers the below warning
> > > > +	 * and in turn mandates a human cross-check of whether the invalidation
> > > > +	 * flows have compatible semantics.
> > > > +	 *
> > > > +	 * For instance with the 11.00 -> 12.00 transition three out of five
> > > > +	 * respective engine registers were moved to masked type. Then after the
> > > > +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> > > > +	 */
> > > > +
> > > > +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
> > 
> > This is bad...it only captures XEHPSDV and breaks the handling of DG2
> > (12.55), PVC (12.60), and MTL (12.70, 12.71, and 12.72).  You're not
> > hitting the warning as expected since those are all now being captured
> > by the next case of the if/else ladder.  With the way GMD_ID works, we
> > may also get new version numbers that silently show up in hardware too
> > at some point (e.g., 12.73, 12.74, etc.)
> 
> Great (on multiple counts) ...
> 
> > 
> > > > +		regs = xehp_regs;
> > > > +		num = ARRAY_SIZE(xehp_regs);
> > > > +	} else if (GRAPHICS_VER(i915) == 12) {
> > 
> > You'd want to change this to
> > 
> >          GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)
> > 
> > to get the behavior you expected.
> 
> Okay, that, and then to be as safe as I intended, ie. warn on every new
> platforms so developers *must* check registers are still compatible during
> platform enablement, we would need a full ver range check something like:
> 
> 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> 	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
> 		regs = xehp_regs;
> 		num = ARRAY_SIZE(xehp_regs);
> 	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)) {
> 		regs = gen12_regs;
> 		num = ARRAY_SIZE(gen12_regs);
> 
> What do you think about that?

What about just keeping the code the way it is now, but adding a new
error condition at the *top* of the ladder?

        if (GRAPHICS_VER_FULL(i915) > IP_VER(12, 72)) {
                /* Error, something new we haven't considered */
        } else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
                ...

I guess that won't catch cases where they go back and insert a new
version or IP refresh that's older than the latest version number, but
usually refresh platforms aren't going to be adding the kind of
architectural changes that require a new if/else arm anyway.

Also, as Andrzej pointed out on a different reply, we classified DG1 as
12.10 (because of the interrupt handling changes), so I guess we'd need
a further adjustment to the "gen12" branch to cover that one too.

Honestly, I'm not super wild about the general plan of intentionally
breaking inheritance here; that runs counter to how we usually try to do
things in i915.  In most places we always try to assume that future
platforms will behave the same way as the latest one, and then we update
those assumptions as part of the initial bringup when a future platform
comes along that breaks them.  Most of the places where we do specific
checks and a MISSING_CASE warning are where we have a strong reason to
believe that each platform will always need a new implementation (e.g.,
stuff like workaround lists).  I don't see a reason to expect major
changes in MMIO-based invalidation for a platform n+1, n+2, etc.  The
change that I _do_ expect to show up (even for some of these current
platforms) is that a GuC-based TLB invalidation path will be added since
that's mandatory for a lot of modern features, but that will be a
parallel codepath, not part of the if/else ladder we're editing here.

> 
> Or you are saying new GMD IDs may appear in the field without first having
> passed the new platform enablemend process? That would be horrible so I hope
> not.

They won't just show up in the wild, we'll know they're coming.  But
they'll be used for stuff like how DG2-G12 showed up after we'd already
enabled DG2-G10 and DG2-G11.  Or how we picked up a couple more ADL
variants that our driver treats as "ADL-P," even though there are
technically other SKU letters associated with them.  So they're things
that we wouldn't consider to be a whole new platform, just a new
subplatform at best.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > > > +		regs = gen12_regs;
> > > > +		num = ARRAY_SIZE(gen12_regs);
> > > > +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > > > +		regs = gen8_regs;
> > > > +		num = ARRAY_SIZE(gen8_regs);
> > > > +	} else if (GRAPHICS_VER(i915) < 8) {
> > > > +		return 0;
> > > > +	} > +
> > > > +	if (drm_WARN_ONCE(&i915->drm, !num,
> > > > +			  "Platform does not implement TLB invalidation!"))
> > > > +		return -ENODEV;
> > > > +
> > > > +	if (drm_WARN_ON_ONCE(&i915->drm,
> > > > +			     class >= num ||
> > > > +			     (!regs[class].reg.reg &&
> > > > +			      !regs[class].mcr_reg.reg)))
> > > > +		return -ERANGE;
> > > 
> > > I hope the propagation of -ERANGE to device probe is OK.
> > > 
> > > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
> > > Regards
> > > Andrzej
> > > 
> > > > +
> > > > +	reg = regs[class];
> > > > +
> > > > +	if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {
> > > > +		reg.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> > > > +		val = 0;
> > > > +	} else {
> > > > +		val = engine->instance;
> > > > +	}
> > > > +
> > > > +	val = BIT(val);
> > > > +
> > > > +	engine->tlb_inv.mcr = regs == xehp_regs;
> > > > +	engine->tlb_inv.reg = reg;
> > > > +	engine->tlb_inv.done = val;
> > > > +
> > > > +	if (GRAPHICS_VER(i915) >= 12 &&
> > > > +	    (engine->class == VIDEO_DECODE_CLASS ||
> > > > +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > > > +	     engine->class == COMPUTE_CLASS))
> > > > +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> > > > +	else
> > > > +		engine->tlb_inv.request = val;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >    static int engine_setup_common(struct intel_engine_cs *engine)
> > > >    {
> > > >    	int err;
> > > >    	init_llist_head(&engine->barrier_tasks);
> > > > +	err = intel_engine_init_tlb_invalidation(engine);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >    	err = init_status_page(engine);
> > > >    	if (err)
> > > >    		return err;
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > index 4fd54fb8810f..8c661fe89314 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > @@ -341,6 +341,19 @@ struct intel_engine_guc_stats {
> > > >    	u64 start_gt_clk;
> > > >    };
> > > > +union intel_engine_tlb_inv_reg {
> > > > +	i915_reg_t	reg;
> > > > +	i915_mcr_reg_t	mcr_reg;
> > > > +};
> > > > +
> > > > +struct intel_engine_tlb_inv
> > > > +{
> > > > +	bool mcr;
> > > > +	union intel_engine_tlb_inv_reg reg;
> > > > +	u32 request;
> > > > +	u32 done;
> > > > +};
> > > > +
> > > >    struct intel_engine_cs {
> > > >    	struct drm_i915_private *i915;
> > > >    	struct intel_gt *gt;
> > > > @@ -372,6 +385,8 @@ struct intel_engine_cs {
> > > >    	u32 context_size;
> > > >    	u32 mmio_base;
> > > > +	struct intel_engine_tlb_inv tlb_inv;
> > > > +
> > > >    	/*
> > > >    	 * Some w/a require forcewake to be held (which prevents RC6) while
> > > >    	 * a particular engine is active. If so, we set fw_domain to which
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > index 854841a731cb..9fb0ac03f51a 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > @@ -983,36 +983,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
> > > >    	intel_sseu_dump(&info->sseu, p);
> > > >    }
> > > > -struct reg_and_bit {
> > > > -	union {
> > > > -		i915_reg_t reg;
> > > > -		i915_mcr_reg_t mcr_reg;
> > > > -	};
> > > > -	u32 bit;
> > > > -};
> > > > -
> > > > -static struct reg_and_bit
> > > > -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> > > > -		const i915_reg_t *regs, const unsigned int num)
> > > > -{
> > > > -	const unsigned int class = engine->class;
> > > > -	struct reg_and_bit rb = { };
> > > > -
> > > > -	if (drm_WARN_ON_ONCE(&engine->i915->drm,
> > > > -			     class >= num || !regs[class].reg))
> > > > -		return rb;
> > > > -
> > > > -	rb.reg = regs[class];
> > > > -	if (gen8 && class == VIDEO_DECODE_CLASS)
> > > > -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> > > > -	else
> > > > -		rb.bit = engine->instance;
> > > > -
> > > > -	rb.bit = BIT(rb.bit);
> > > > -
> > > > -	return rb;
> > > > -}
> > > > -
> > > >    /*
> > > >     * HW architecture suggest typical invalidation time at 40us,
> > > >     * with pessimistic cases up to 100us and a recommendation to
> > > > @@ -1026,14 +996,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> > > >     * but are now considered MCR registers.  Since they exist within a GAM range,
> > > >     * the primary instance of the register rolls up the status from each unit.
> > > >     */
> > > > -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> > > > +static int wait_for_invalidate(struct intel_engine_cs *engine)
> > > >    {
> > > > -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> > > > -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
> > > > +	if (engine->tlb_inv.mcr)
> > > > +		return intel_gt_mcr_wait_for_reg(engine->gt,
> > > > +						 engine->tlb_inv.reg.mcr_reg,
> > > > +						 engine->tlb_inv.done,
> > > > +						 0,
> > > >    						 TLB_INVAL_TIMEOUT_US,
> > > >    						 TLB_INVAL_TIMEOUT_MS);
> > > >    	else
> > > > -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> > > > +		return __intel_wait_for_register_fw(engine->gt->uncore,
> > > > +						    engine->tlb_inv.reg.reg,
> > > > +						    engine->tlb_inv.done,
> > > > +						    0,
> > > >    						    TLB_INVAL_TIMEOUT_US,
> > > >    						    TLB_INVAL_TIMEOUT_MS,
> > > >    						    NULL);
> > > > @@ -1041,61 +1017,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> > > >    static void mmio_invalidate_full(struct intel_gt *gt)
> > > >    {
> > > > -	static const i915_reg_t gen8_regs[] = {
> > > > -		[RENDER_CLASS]			= GEN8_RTCR,
> > > > -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
> > > > -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
> > > > -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
> > > > -	};
> > > > -	static const i915_reg_t gen12_regs[] = {
> > > > -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
> > > > -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> > > > -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> > > > -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> > > > -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
> > > > -	};
> > > > -	static const i915_mcr_reg_t xehp_regs[] = {
> > > > -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
> > > > -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
> > > > -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> > > > -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
> > > > -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
> > > > -	};
> > > >    	struct drm_i915_private *i915 = gt->i915;
> > > >    	struct intel_uncore *uncore = gt->uncore;
> > > >    	struct intel_engine_cs *engine;
> > > >    	intel_engine_mask_t awake, tmp;
> > > >    	enum intel_engine_id id;
> > > > -	const i915_reg_t *regs;
> > > > -	unsigned int num = 0;
> > > >    	unsigned long flags;
> > > > -	/*
> > > > -	 * New platforms should not be added with catch-all-newer (>=)
> > > > -	 * condition so that any later platform added triggers the below warning
> > > > -	 * and in turn mandates a human cross-check of whether the invalidation
> > > > -	 * flows have compatible semantics.
> > > > -	 *
> > > > -	 * For instance with the 11.00 -> 12.00 transition three out of five
> > > > -	 * respective engine registers were moved to masked type. Then after the
> > > > -	 * 12.00 -> 12.50 transition multi cast handling is required too.
> > > > -	 */
> > > > -
> > > > -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
> > > > -		regs = NULL;
> > > > -		num = ARRAY_SIZE(xehp_regs);
> > > > -	} else if (GRAPHICS_VER(i915) == 12) {
> > > > -		regs = gen12_regs;
> > > > -		num = ARRAY_SIZE(gen12_regs);
> > > > -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > > > -		regs = gen8_regs;
> > > > -		num = ARRAY_SIZE(gen8_regs);
> > > > -	} else if (GRAPHICS_VER(i915) < 8) {
> > > > -		return;
> > > > -	}
> > > > -
> > > > -	if (drm_WARN_ONCE(&i915->drm, !num,
> > > > -			  "Platform does not implement TLB invalidation!"))
> > > > +	if (GRAPHICS_VER(i915) < 8)
> > > >    		return;
> > > >    	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> > > > @@ -1105,33 +1034,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > > >    	awake = 0;
> > > >    	for_each_engine(engine, gt, id) {
> > > > -		struct reg_and_bit rb;
> > > > -
> > > >    		if (!intel_engine_pm_is_awake(engine))
> > > >    			continue;
> > > > -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> > > > -			u32 val = BIT(engine->instance);
> > > > -
> > > > -			if (engine->class == VIDEO_DECODE_CLASS ||
> > > > -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > > > -			    engine->class == COMPUTE_CLASS)
> > > > -				val = _MASKED_BIT_ENABLE(val);
> > > > +		if (engine->tlb_inv.mcr)
> > > >    			intel_gt_mcr_multicast_write_fw(gt,
> > > > -							xehp_regs[engine->class],
> > > > -							val);
> > > > -		} else {
> > > > -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> > > > -			if (!i915_mmio_reg_offset(rb.reg))
> > > > -				continue;
> > > > -
> > > > -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
> > > > -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > > > -			    engine->class == COMPUTE_CLASS))
> > > > -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
> > > > -
> > > > -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> > > > -		}
> > > > +							engine->tlb_inv.reg.mcr_reg,
> > > > +							engine->tlb_inv.request);
> > > > +		else
> > > > +			intel_uncore_write_fw(uncore,
> > > > +					      engine->tlb_inv.reg.reg,
> > > > +					      engine->tlb_inv.request);
> > > > +
> > > >    		awake |= engine->mask;
> > > >    	}
> > > > @@ -1150,16 +1064,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > > >    	intel_gt_mcr_unlock(gt, flags);
> > > >    	for_each_engine_masked(engine, gt, awake, tmp) {
> > > > -		struct reg_and_bit rb;
> > > > -
> > > > -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> > > > -			rb.mcr_reg = xehp_regs[engine->class];
> > > > -			rb.bit = BIT(engine->instance);
> > > > -		} else {
> > > > -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> > > > -		}
> > > > -
> > > > -		if (wait_for_invalidate(gt, rb))
> > > > +		if (wait_for_invalidate(engine))
> > > >    			drm_err_ratelimited(&gt->i915->drm,
> > > >    					    "%s TLB invalidation did not complete in %ums!\n",
> > > >    					    engine->name, TLB_INVAL_TIMEOUT_MS);
> > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
