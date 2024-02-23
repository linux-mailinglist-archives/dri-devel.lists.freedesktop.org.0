Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F894861C6A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 20:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F88210EC9C;
	Fri, 23 Feb 2024 19:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIsSF369";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7DB10EC9C;
 Fri, 23 Feb 2024 19:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708716351; x=1740252351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t0fxQJQC0le17yzi1yPF//UrVsBYOaxPQi7dfIW5RbY=;
 b=XIsSF369h1tqLGL24zIgONTdKtFZW4EHKmzbsy+7Bu94aM/20+Nedapq
 cahjQ2WNXhgp+oljqA+rXFjKW+F19YBmTt8kLGD1vc/OH13Y1x2NvAXQy
 wLd30mG7QYs13i+k+Iym7CaFqLlRYDgVrCkL9mldQqQ6p4TQ9C9ZVS/D6
 ostz6+rIoDBmwepXvIdI+LA0bLLI7g3US1FLm9iy5otXXRFlRXyLvTOPp
 qod0K/mk0+DfRBQJ32Le8dIL/+HNbqCHhFuKznn2vXJvIbaLV5NVb14MN
 2n0D52nbfiZDaELaz63ecWeeviCqL/GI1/21YnOFzc6aOFJ1FiUKTr5Gk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20593696"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="20593696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10700298"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 11:25:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 11:25:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 11:25:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 11:25:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 11:25:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN1pxJSyzsMgn0ETHRVnomPNVBeKKefq5Oo5VOflwtM1Y0Eqh6PHjfHrbydpr0orNlfkWf9rbIykAyoreX4MFMTF94CoK4I3ov4ycuXLPiY+LSPNKH1ZMqmeTnv0dOZy331DkKDsbX8uo9gEGZCDxfXWNOWCNG8QUl1fA/PjOBVTUyRNQo3RvrqwJ7KbChx8n5hOspMF8e9MfubAgwr91R09FstlnBN9FjLkmMs6+7BopE5skQ2fynDhhLuaB9mdYhPJ+AaUdDDHl+v08b+uSftYGM/aOP2kMQI59sCfv6u48SZk7qLfVZaqiOm1/R1Yi/OaOSCQmvghEUTko4ld5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SncV3HI6vcGFhySj4LVbj+uKKI/5Xni1TG5AOFxfxm8=;
 b=CS6/Fl1173p8yEFhZKgqwfKdxmeJy7+rHk7l2yI22N/1IC7Q6bE4syul63aIhmD/G8vbubIasK5BJ7qTy98P/8nXVevxgu+fKyFibAi2/mELtkVFu+DbBDqBbOsSOHM70CHFqDAt5qmVjVZr78bNTO1YjMKT9rSMGINNXhl6qstNP9xnOT7TDur7ufBav8z0mEaYeKkOE4tWbHsgsx28TUBbywO/Bv3EPVVJEKnMOmkgiBpDCQHC5Qm4fP5k9ZzU2YKjKodPCqMxtQpzWrL45OH+wXSaOOGcRuxNtPBORu0gA7uND+bWBRoR08LQRXOscFrsdE/zj5ab3WVIklHBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 19:25:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 19:25:44 +0000
Date: Fri, 23 Feb 2024 14:25:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Add Compute context hint
Message-ID: <ZdjxNECvZr9tDulB@intel.com>
References: <20240221001416.696780-1-vinay.belgaumkar@intel.com>
 <8e03bde7-fba2-4b8b-ae33-b502cf1a8e4f@linux.intel.com>
 <ZdZq9NH0VYbL-QV8@intel.com>
 <50e4ed39-bc70-471c-be44-f61920405f67@linux.intel.com>
 <166befb6-a667-4c24-85ed-efb18bd3b7d7@intel.com>
 <9702f85a-17f2-4c45-bd17-fc0a07beb635@linux.intel.com>
 <a3b55547-06cc-4b94-aaa9-9560bfced0db@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3b55547-06cc-4b94-aaa9-9560bfced0db@intel.com>
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: 46282220-3cec-42d3-cf80-08dc34a53af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cukqdGwxKob4Yy5CtybKpOcmnqMelkQtN110wGFD86HxWm44BclkYipesjbY3j9gmWh1PSkWPMd24UlUmG17JPNCRJP94aVlTkohjBVYUy7qDi9ZbBBb8r/zyTpIS3DK/TC/1N7zUkstJVS2h35v1b+EE8/AFmRtxich08GL998ZSH/o7MzeiBK6JUWPx1oCIeORfdBopT8HNtg3dnhDL4C3SkwCslAOop1j1K6j4BqLRbxoeBsDI9mFS1lUc2HQk7o1DCQUzdF26EMVXQHp3McO7Aa+g1hzy8L6LVtSj7A77Jzq2jhKI9DzzYYjAmGo+EDdylKUzaUMi6RwKlQDq2n4nAs/5/174TbJuANFL8pqcpstY9AjgIISGSsrzKQmccyews+CqXc2BvMUhwULEghOhd26G9hVPsi03cKHyYi19wntbmx42yqJjXz/CMgX/dwkdch8M5CnsbBmwQi9gbe2pNwcGz+OJe5NIG+84SYqlLKOCleEvLj6Jc60CQEbiJTGgRhzrdGx0M6uYlG/xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?THeh8fkCEuoS/yHEfw3NEEB/M6McUw0aANCuvNfWHoONy+bdv2WSSuV7sM?=
 =?iso-8859-1?Q?guyj1F+ZtLVr92/kTI/UVX64+Gl1hCrPmVO06ab3zEdfllkvAkxDwbCQx2?=
 =?iso-8859-1?Q?/GwhU2X7H0+lB16dp767Ayftb/2Wh1xFPuBwWI88aw5kdjrJ2b+dU4aRPP?=
 =?iso-8859-1?Q?Gtlgi2ujog7YgX7aRsuVvFZZGoc41XPNKu4BsMZU/j9rexkohD15afwzNZ?=
 =?iso-8859-1?Q?4pNGP5MJM4BoK5k5Bzj/imfxRn79HjJJOGDX7WaY9S1kkfTAzgCCP3IiKT?=
 =?iso-8859-1?Q?RHKF1m9m2vBLIouF5tkABVul8yIGpgBJsKFBQHMFL6FOji/Td4dGoUTsXN?=
 =?iso-8859-1?Q?f1c+BGB4qSFXfGeyjBaEAoX4Q0GBOKGoKdOGie6tzoy9iChwp4cgRP4SXU?=
 =?iso-8859-1?Q?bvuMZfaiEmGJE57mJKPq/rNZyniS1qC39JXPEIcRhWIt1816cianovlOKr?=
 =?iso-8859-1?Q?JSXD0KyV4CPm7SMs+4/le0zneoTxc2+4HxsnCm3GRN6lz0hiHOvR2m6DsW?=
 =?iso-8859-1?Q?SoCPCMD/JGJFen8aIq51z/mcUVmpZvs5XTpCrnULY52YP0yJJWicmMVtO0?=
 =?iso-8859-1?Q?+XidY0HiPKip0sMBne9xeo+KDVCRsZqOu32U4RVU8VOZ4pTsbqaENRvgPc?=
 =?iso-8859-1?Q?SjHhUbxa2TH4K/6y5dtUy2SQSRStMAn6vACeN2aAhs/Uf8ZiQcr1741s6I?=
 =?iso-8859-1?Q?I40COSPwk+6ICk+AETEQkDNU48ODBXL9bV/D9YyqVEyt9e1M81LluE5p5g?=
 =?iso-8859-1?Q?EpSCqIGwA58o1QbspD96sGD5ODLAt2Nn8hyDBwQtjGScqDpB5/uHIApkFH?=
 =?iso-8859-1?Q?fV5YAxCY7DtNb5B8QGwy4cvhQtXEvr4T7VsXVhmCua3YJuFiqKhJSXQ8ry?=
 =?iso-8859-1?Q?UufJ5d1JAFvg5af+pJl8HV1oTkWWjsAtmT+G4wIxH6viZjSOpoSAPacsAu?=
 =?iso-8859-1?Q?6wfJg+JlLS4ZKB1vVpzIIcBPml4iGMCRkIydIOuS9wOWHG0zu/119vuSzy?=
 =?iso-8859-1?Q?CIg5Plq2CZlNgVW58uh+9ydrt2bZIZpGECk/Q8q7EfUMkHwffF4SF/3gRw?=
 =?iso-8859-1?Q?gMSKiI/bPzE20YxygiBSDRk/FnlASV9TcR5/GxHMokPGYjH388wQjnAP+y?=
 =?iso-8859-1?Q?I6ShDKMoJXlByGR9ex+YRbpbvizyqsY+cGu9D95CZyK3fFnMWQFSyTHv1A?=
 =?iso-8859-1?Q?ItQMFJavgkZESOMgblUYcOnzEYdqEUgVc+61EPtmZtIiqqT00q3kxFx5HM?=
 =?iso-8859-1?Q?OaWLsoZJoOgxxy0KSWeFl+RNTeb9fbHO+bdp5skRecTybV7ifdiV7kvRbd?=
 =?iso-8859-1?Q?Z/2ZFkDVbNrx9C28wtaAcIAnoMpr7awCGKvAj/gOHlVASJka0/CCmrNdfC?=
 =?iso-8859-1?Q?kssfyApd7/m541m2w9lW/YpqgWmKKmSzJ1I8QngVGOFfl6as8pQww1r2gD?=
 =?iso-8859-1?Q?eZVaBDRyardq30aV4ZT6vZitVOxJTq6hPj/yfOhKAv1mFdmtu83y5SyhE8?=
 =?iso-8859-1?Q?BmQgfDM0MPfYSDkvK4D7F68zDmQVRUY/vgN/81MX2cIhghSqllio8EQusA?=
 =?iso-8859-1?Q?tuS7JvJ7O8Pvtrx40lR/EX0Eh93OQw7aKdeTetnJsNkPviDvoip4K5Ssg1?=
 =?iso-8859-1?Q?5WjwMJIlcbD7SMbcmTcfLcl02rX28hEGztW8Eq043NGYlSSt51pEBQ9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46282220-3cec-42d3-cf80-08dc34a53af2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 19:25:44.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdJK7v0yVwWoQlDb8Lg6O90NuFd6NZdgpzSMMcZILficffNHnxaGcHVqKjw+0mZ7gGIOpcMLQAf8JNuS3YmJaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 23, 2024 at 10:31:41AM -0800, Belgaumkar, Vinay wrote:
> 
> On 2/23/2024 12:51 AM, Tvrtko Ursulin wrote:
> > 
> > On 22/02/2024 23:31, Belgaumkar, Vinay wrote:
> > > 
> > > On 2/22/2024 7:32 AM, Tvrtko Ursulin wrote:
> > > > 
> > > > On 21/02/2024 21:28, Rodrigo Vivi wrote:
> > > > > On Wed, Feb 21, 2024 at 09:42:34AM +0000, Tvrtko Ursulin wrote:
> > > > > > 
> > > > > > On 21/02/2024 00:14, Vinay Belgaumkar wrote:
> > > > > > > Allow user to provide a context hint. When this is set, KMD will
> > > > > > > send a hint to GuC which results in special handling for this
> > > > > > > context. SLPC will ramp the GT frequency aggressively every time
> > > > > > > it switches to this context. The down freq threshold will also be
> > > > > > > lower so GuC will ramp down the GT freq for this
> > > > > > > context more slowly.
> > > > > > > We also disable waitboost for this context as that
> > > > > > > will interfere with
> > > > > > > the strategy.
> > > > > > > 
> > > > > > > We need to enable the use of Compute strategy during SLPC init, but
> > > > > > > it will apply only to contexts that set this bit during context
> > > > > > > creation.
> > > > > > > 
> > > > > > > Userland can check whether this feature is supported
> > > > > > > using a new param-
> > > > > > > I915_PARAM_HAS_COMPUTE_CONTEXT. This flag is true
> > > > > > > for all guc submission
> > > > > > > enabled platforms since they use SLPC for freq management.
> > > > > > > 
> > > > > > > The Mesa usage model for this flag is here -
> > > > > > > https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
> > > > > > 
> > > > > > This allows for setting it for the whole application,
> > > > > > correct? Upsides,
> > > > > > downsides? Are there any plans for per context?
> > > > > 
> > > > > Currently there's no extension on a high level API
> > > > > (Vulkan/OpenGL/OpenCL/etc)
> > > > > that would allow the application to hint for
> > > > > power/freq/latency. So Mesa cannot
> > > > > decide when to hint. So their solution was to use .drirc and
> > > > > make per-application
> > > > > decision.
> > > > > 
> > > > > I would prefer a high level extension for a more granular
> > > > > and informative
> > > > > decision. We need to work with that goal, but for now I don't see any
> > > > > cons on this approach.
> > > > 
> > > > In principle yeah I doesn't harm to have the option. I am just
> > > > not sure how useful this intermediate step this is with its lack
> > > > of intra-process granularity.
> > > > 
> > > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +++++++
> > > > > > >    .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
> > > > > > >    drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +++++++
> > > > > > >    .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |
> > > > > > > 21 +++++++++++++++++++
> > > > > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |
> > > > > > > 17 +++++++++++++++
> > > > > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
> > > > > > >    .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++++
> > > > > > >    drivers/gpu/drm/i915/i915_getparam.c          | 11 ++++++++++
> > > > > > >    include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
> > > > > > >    9 files changed, 89 insertions(+)
> > > > > > > 
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > index dcbfe32fd30c..ceab7dbe9b47 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > @@ -879,6 +879,7 @@ static int
> > > > > > > set_proto_ctx_param(struct drm_i915_file_private
> > > > > > > *fpriv,
> > > > > > >                       struct i915_gem_proto_context *pc,
> > > > > > >                       struct drm_i915_gem_context_param *args)
> > > > > > >    {
> > > > > > > +    struct drm_i915_private *i915 = fpriv->i915;
> > > > > > >        int ret = 0;
> > > > > > >        switch (args->param) {
> > > > > > > @@ -904,6 +905,13 @@ static int
> > > > > > > set_proto_ctx_param(struct drm_i915_file_private
> > > > > > > *fpriv,
> > > > > > >                pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
> > > > > > >            break;
> > > > > > > +    case I915_CONTEXT_PARAM_IS_COMPUTE:
> > > > > > > +        if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> > > > > > > +            ret = -EINVAL;
> > > > > > > +        else
> > > > > > > +            pc->user_flags |= BIT(UCONTEXT_COMPUTE);
> > > > > > > +        break;
> > > > > > > +
> > > > > > >        case I915_CONTEXT_PARAM_RECOVERABLE:
> > > > > > >            if (args->size)
> > > > > > >                ret = -EINVAL;
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > > > index 03bc7f9d191b..db86d6f6245f 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > > > @@ -338,6 +338,7 @@ struct i915_gem_context {
> > > > > > >    #define UCONTEXT_BANNABLE        2
> > > > > > >    #define UCONTEXT_RECOVERABLE        3
> > > > > > >    #define UCONTEXT_PERSISTENCE        4
> > > > > > > +#define UCONTEXT_COMPUTE        5
> > > > > > 
> > > > > > What is the GuC behaviour when
> > > > > > SLPC_CTX_FREQ_REQ_IS_COMPUTE is set for
> > > > > > non-compute engines? Wondering if per intel_context is
> > > > > > what we want instead.
> > > > > > (Which could then be the i915_context_param_engines extension to mark
> > > > > > individual contexts as compute strategy.)
> > > > > 
> > > > > Perhaps we should rename this? This is a freq-decision-strategy inside
> > > > > GuC that is there mostly targeting compute workloads that needs lower
> > > > > latency with short burst execution. But the engine itself
> > > > > doesn't matter.
> > > > > It can be applied to any engine.
> > > > 
> > > > I have no idea if it makes sense for other engines, such as
> > > > video, and what would be pros and cons in terms of PnP. But in
> > > > the case we end up allowing it on any engine, then at least
> > > > userspace name shouldn't be compute. :)
> > > Yes, one of the suggestions from Daniele was to have something along
> > > the lines of UCONTEXT_HIFREQ or something along those lines so we
> > > don't confuse it with the Compute Engine.

hmm... I'm not fan of this name. GuC's compute strategy is not just about
high gt frequency, but also some hysteresis to keep the freq high for a
while and cover burst cases where the latency up and down on the frequency
transactions would be damaging the performance.

also, one might say that waitboost is already 'hifreq'.

But I honestly believe that no one has a real good name for this thing
and this is why it ended up calling 'compute' strategy in GuC, because
it was created with compute use cases in mind.

Maybe UCONTEXT_HIFREQ_LOWLATENCY?
maybe UCONTEXT_HIFREQ_AND_BURSTY?
maybe UCONTEXT_BURSTY?

> > 
> > Okay, but additional question is would anyone ever want to set it for
> > video or blitter. Would it harm, benefir, or be neutral.
> It would depend on the use case. SLPC will not distinguish either ways. It
> will aggressively ramp the GT freq when this context is active. User is
> making a decision to choose perf over power.

I agree with Vinay here. It depends on the use case and I don't see
any issue with that.

On some cases like heavy transcoder it would be neutral when compared
to waitboost since both are hifreq and transcoder woudn't alternate
fast on dropping and getting the wait boost.

In one of the cases that we have in the pipeline we need an opposite
flag to only disable waitboost without enabling the 'compute' strategy
so a video conference wouldn't waste power.

> > 
> > > > Or if we decide to call it compute and only apply to compute
> > > > engines, then I would strongly suggest making the uapi per
> > > > intel_context i.e. the set engines extension instead of the GEM
> > > > context param. Otherwise it would be odd that some engines get
> > > > it and some don't. With explicit configuration userspace gets to
> > > > see the clear picture of what is what.
> > > 
> > > It will not be per engine, so may be better to keep it at the
> > 
> > Why? Just because..
> Feels strange that we are giving a coarse control(per gem context) to UMD
> but mapping it to a finer control(per engine) on the KMD side. Anyways,
> hopefully we can find a way to extend this to UMD eventually as well.
> > 
> > > gem_context level. Trying to percolate it to the intel_context level
> > > seems to be more complicated. We process the gem_context_param flags
> > > first and then create the intel_context per engine. Not sure if we
> > > want to keep 2 copies of the same flag in gem_context and
> > > intel_context as well.
> > 
> > .. it is complicated? It is not complicated at all. There is
> > intel_context_set_gem which is just for uses like that.
> > 
> > Once you have this, then the only difference is whether you go from GEM
> > context setparam to intel_context, or flag goes directly to
> > intel_context as they are created via custom engine maps.
> 
> Yes, though intel_context_set_gem is called before we copy over the flags
> from the user AFAICS. Will need to somehow access the user flags in that
> function.
> 
> Thanks,
> 
> Vinay.
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > > 
> > > > Regards,
> > > > 
> > > > Tvrtko
> > > > 
> > > > > > >        /**
> > > > > > >         * @flags: small set of booleans
> > > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > > > b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > > > index 4feef874e6d6..1ed40cd61b70 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > > > @@ -24,6 +24,7 @@
> > > > > > >    #include "intel_pcode.h"
> > > > > > >    #include "intel_rps.h"
> > > > > > >    #include "vlv_sideband.h"
> > > > > > > +#include "../gem/i915_gem_context.h"
> > > > > > >    #include "../../../platform/x86/intel_ips.h"
> > > > > > >    #define BUSY_MAX_EI    20u /* ms */
> > > > > > > @@ -1018,6 +1019,13 @@ void intel_rps_boost(struct i915_request *rq)
> > > > > > >            struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
> > > > > > >            if (rps_uses_slpc(rps)) {
> > > > > > > +            const struct i915_gem_context *ctx;
> > > > > > > +
> > > > > > > +            ctx = i915_request_gem_context(rq);
> > > > > > > +            if (ctx &&
> > > > > > > +                test_bit(UCONTEXT_COMPUTE, &ctx->user_flags))
> > > > > > > +                return;
> > > > > > > +
> > > > > > 
> > > > > > I think request and intel_context do not own a strong
> > > > > > reference to GEM
> > > > > > context. So at minimum you need a local one obtained
> > > > > > under a RCU lock with
> > > > > > kref_get_unless_zero, as do some other places do.
> > > > > > 
> > > > > > However.. it may be simpler to just store the flag in
> > > > > > intel_context->flags.
> > > > > > If you carry it over at the time GEM context is assigned
> > > > > > to intel_context,
> > > > > > not only you simplify runtime rules, but you get the
> > > > > > ability to not set the
> > > > > > compute flags for video etc.
> > > > > 
> > > > > +1 on the intel_context->flags
> > > > > 
> > > > > > 
> > > > > > It may even make sense to add a "don't waitboost" flag
> > > > > > on top of the "is
> > > > > > compute" so this call site becomes self-documenting
> > > > > > (otherwise I ask to add
> > > > > > a comment here please). Then you could even move it out from the SLPC
> > > > > > special case.
> > > > > 
> > > > > +1 on the dont_waitboost flag as well. might be worth for other cases
> > > > > like display metrics for instance.
> > > 
> > > We could define another disable_waitboost flag in intel_context, but
> > > seems redundant if we already have this info in the gem_context. We
> > > don't need to check for SLPC special case, just need to check this
> > > flag as we won't enable it for the non-slpc case anyways.
> > > 
> > > Thanks,
> > > 
> > > Vinay.
> > > 
> > > > > 
> > > > > > 
> > > > > > >                slpc = rps_to_slpc(rps);
> > > > > > >                if (slpc->min_freq_softlimit >= slpc->boost_freq)
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > > > b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > > > index 811add10c30d..c34674e797c6 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > > > @@ -207,6 +207,27 @@ struct slpc_shared_data {
> > > > > > >        u8 reserved_mode_definition[4096];
> > > > > > >    } __packed;
> > > > > > > +struct slpc_context_frequency_request {
> > > > > > > +    u32 frequency_request:16;
> > > > > > > +    u32 reserved:12;
> > > > > > > +    u32 is_compute:1;
> > > > > > > +    u32 ignore_busyness:1;
> > > > > > > +    u32 is_minimum:1;
> > > > > > > +    u32 is_predefined:1;
> > > > > > > +} __packed;
> > > > > > > +
> > > > > > > +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE        REG_BIT(28)
> > > > > > > +
> > > > > > > +struct slpc_optimized_strategies {
> > > > > > > +    u32 compute:1;
> > > > > > > +    u32 async_flip:1;
> > > > > > > +    u32 media:1;
> > > > > > > +    u32 vsync_flip:1;
> > > > > > > +    u32 reserved:28;
> > > > > > > +} __packed;
> > > > > > > +
> > > > > > > +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE REG_BIT(0)
> > > > > > > +
> > > > > > >    /**
> > > > > > >     * DOC: SLPC H2G MESSAGE FORMAT
> > > > > > >     *
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > > > index 3e681ab6fbf9..706fffca698b 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > > > @@ -537,6 +537,20 @@ int
> > > > > > > intel_guc_slpc_get_min_freq(struct intel_guc_slpc
> > > > > > > *slpc, u32 *val)
> > > > > > >        return ret;
> > > > > > >    }
> > > > > > > +int intel_guc_slpc_set_strategy(struct
> > > > > > > intel_guc_slpc *slpc, u32 val)
> > > > > > > +{
> > > > > > > +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > > > > > > +    intel_wakeref_t wakeref;
> > > > > > > +    int ret = 0;
> > > > > > > +
> > > > > > > +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > > > > > > +        ret = slpc_set_param(slpc,
> > > > > > > +                     SLPC_PARAM_STRATEGIES,
> > > > > > > +                     val);
> > > > > > > +
> > > > > > > +    return ret;
> > > > > > > +}
> > > > > > > +
> > > > > > >    int intel_guc_slpc_set_media_ratio_mode(struct
> > > > > > > intel_guc_slpc *slpc, u32 val)
> > > > > > >    {
> > > > > > >        struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > > > > > > @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct
> > > > > > > intel_guc_slpc *slpc)
> > > > > > >        /* Set cached media freq ratio mode */
> > > > > > >        intel_guc_slpc_set_media_ratio_mode(slpc,
> > > > > > > slpc->media_ratio_mode);
> > > > > > > +    /* Enable SLPC Optimized Strategy for compute */
> > > > > > > +    intel_guc_slpc_set_strategy(slpc,
> > > > > > > SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> > > > > > > +
> > > > > > >        return 0;
> > > > > > >    }
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > > > index 6ac6503c39d4..1cb5fd44f05c 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > > > @@ -45,5 +45,6 @@ void
> > > > > > > intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
> > > > > > >    void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
> > > > > > >    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
> > > > > > >    int intel_guc_slpc_set_ignore_eff_freq(struct
> > > > > > > intel_guc_slpc *slpc, bool val);
> > > > > > > +int intel_guc_slpc_set_strategy(struct
> > > > > > > intel_guc_slpc *slpc, u32 val);
> > > > > > >    #endif
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > > > index f3dcae4b9d45..bbabfa5532e5 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > > > @@ -2645,6 +2645,7 @@
> > > > > > > MAKE_CONTEXT_POLICY_ADD(execution_quantum,
> > > > > > > EXECUTION_QUANTUM)
> > > > > > >    MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
> > > > > > >    MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> > > > > > >    MAKE_CONTEXT_POLICY_ADD(preempt_to_idle,
> > > > > > > PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
> > > > > > > +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
> > > > > > >    #undef MAKE_CONTEXT_POLICY_ADD
> > > > > > > @@ -2662,8 +2663,10 @@ static int
> > > > > > > guc_context_policy_init_v70(struct intel_context
> > > > > > > *ce, bool loop)
> > > > > > >        struct intel_engine_cs *engine = ce->engine;
> > > > > > >        struct intel_guc *guc = &engine->gt->uc.guc;
> > > > > > >        struct context_policy policy;
> > > > > > > +    struct i915_gem_context *ctx =
> > > > > > > rcu_dereference(ce->gem_context);
> > > > > > >        u32 execution_quantum;
> > > > > > >        u32 preemption_timeout;
> > > > > > > +    u32 slpc_ctx_freq_req = 0;
> > > > > > >        unsigned long flags;
> > > > > > >        int ret;
> > > > > > > @@ -2675,11 +2678,15 @@ static int
> > > > > > > guc_context_policy_init_v70(struct intel_context
> > > > > > > *ce, bool loop)
> > > > > > >        execution_quantum =
> > > > > > > engine->props.timeslice_duration_ms * 1000;
> > > > > > >        preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> > > > > > > +    if (ctx && (ctx->user_flags & BIT(UCONTEXT_COMPUTE)))
> > > > > > > +        slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > > > > > > +
> > > > > > >        __guc_context_policy_start_klv(&policy, ce->guc_id.id);
> > > > > > >        __guc_context_policy_add_priority(&policy,
> > > > > > > ce->guc_state.prio);
> > > > > > > __guc_context_policy_add_execution_quantum(&policy,
> > > > > > > execution_quantum);
> > > > > > > __guc_context_policy_add_preemption_timeout(&policy,
> > > > > > > preemption_timeout);
> > > > > > > +
> > > > > > > __guc_context_policy_add_slpc_ctx_freq_req(&policy,
> > > > > > > slpc_ctx_freq_req);
> > > > > > >        if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> > > > > > > __guc_context_policy_add_preempt_to_idle(&policy, 1);
> > > > > > > diff --git a/drivers/gpu/drm/i915/i915_getparam.c
> > > > > > > b/drivers/gpu/drm/i915/i915_getparam.c
> > > > > > > index 5c3fec63cb4c..0f12e36b2a12 100644
> > > > > > > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > > > > > > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > > > > > > @@ -155,6 +155,17 @@ int i915_getparam_ioctl(struct
> > > > > > > drm_device *dev, void *data,
> > > > > > >             */
> > > > > > >            value = 1;
> > > > > > >            break;
> > > > > > > +    case I915_PARAM_HAS_COMPUTE_CONTEXT:
> > > > > > > +        /* This feature has been available in GuC for a while but
> > > > > > > +         * a use case now required the use of this feature. We
> > > > > > > +         * return true now since this is now being supported from
> > > > > > > +         * the kernel side as well.
> > > > > > > +         */
> > > > > > 
> > > > > > Nit - stick to the multi-line comment style i915 uses please.
> > > > > > 
> > > > > > Regards,
> > > > > > 
> > > > > > Tvrtko
> > > > > > 
> > > > > > > +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> > > > > > > +            value = 1;
> > > > > > > +        else
> > > > > > > +            value = -EINVAL;
> > > > > > > +        break;
> > > > > > >        case I915_PARAM_HAS_CONTEXT_ISOLATION:
> > > > > > >            value = intel_engines_has_context_isolation(i915);
> > > > > > >            break;
> > > > > > > diff --git a/include/uapi/drm/i915_drm.h
> > > > > > > b/include/uapi/drm/i915_drm.h
> > > > > > > index 2ee338860b7e..1bd12f536108 100644
> > > > > > > --- a/include/uapi/drm/i915_drm.h
> > > > > > > +++ b/include/uapi/drm/i915_drm.h
> > > > > > > @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
> > > > > > >     */
> > > > > > >    #define I915_PARAM_PXP_STATUS         58
> > > > > > > +/*
> > > > > > > + * Query if kernel allows marking a context as a
> > > > > > > Compute context. This will
> > > > > > > + * result in more aggressive GT frequency ramping for this context.
> > > > > > > + */
> > > > > > > +#define I915_PARAM_HAS_COMPUTE_CONTEXT 59
> > > > > > > +
> > > > > > >    /* Must be kept compact -- no holes and well documented */
> > > > > > >    /**
> > > > > > > @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
> > > > > > >     * -EIO: The firmware did not succeed in creating
> > > > > > > the protected context.
> > > > > > >     */
> > > > > > >    #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> > > > > > > +
> > > > > > > +/*
> > > > > > > + * I915_CONTEXT_PARAM_IS_COMPUTE:
> > > > > > > + *
> > > > > > > + * Mark this context as a Compute related workload
> > > > > > > which requires aggressive GT
> > > > > > > + * frequency scaling. Query
> > > > > > > I915_PARAM_HAS_CONTEXT_COMPUTE to check if the
> > > > > > > kernel
> > > > > > > + * supports this functionality.
> > > > > > > + */
> > > > > > > +#define I915_CONTEXT_PARAM_IS_COMPUTE        0xe
> > > > > > >    /* Must be kept compact -- no holes and well documented */
> > > > > > >        /** @value: Context parameter value to be set or queried */
