Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15096D89C2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 23:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4908410E29A;
	Wed,  5 Apr 2023 21:46:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DE710E237;
 Wed,  5 Apr 2023 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680731168; x=1712267168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C0j8Do20hurV9jI4i1DSxMQNDG/DQY0GHyfCFiz8K/w=;
 b=ZhNeF/TgZNGDBdrNtpU48pkbQnsqcuHlAmB2if3wE01UHtiWwUmI2Y8Y
 pKr0aDLa/uP8xIyDKpnXGM7uJ0UH2ponpwCiHQKTTM1IG/mfHVAWPHVjr
 knSUrfL3QSVY5MZFIb7T0LOcq9TxjVK7Jgqej05tNuSmfNLCR5iJ4oviZ
 MpKtsL+wCmvreMa/wE4CUXcqWGkd0sWpU6FOZ8PtcFmGUi6+3ZoVtZ2dv
 kVLSMlaBzPQSFmBcXsaFwmhLWeZ+jXK5+oCEZDeflq0QtwIqzCUjwqr9k
 zfNw2o8j5JpIW693LG9Kn0cLhYM02xfxRpSHMUwESZv7X41NsqPoUz7Pg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322953246"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322953246"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 14:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="810763973"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="810763973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 05 Apr 2023 14:46:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:46:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:46:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 14:46:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 14:46:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT1XcSbJbKdDJuXkTqD+5eXk1N/cE5AhLV09JoUGwziNolzfdTuzjXUfOYEwSrDt2mrSPlV9bxY1a2KUbVynUjqjS8VFuI1Ub3gFn6e2/7d6+qAwsWSA/OMADWglvM0oD3iOOzDcatBOVpmxfgsjLmbk5NzywZ0kxk5T5t8wSIpzsN0ZcdyHK8Ldo3R5PqeCSYTh7x7LYQPxoOZUWh0mTH5m21mHVTNmO+iJkQrJfmQQG10dOauLGvl/dhFZWCtd8P8vPukR1TqyoHQ/exTu0m9XdIpdkhmSC2U1l1UJ0xvWXqjkzy3zL76Kwzf2j6B8uCvz39P0fnG2YDEzdmqrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcZtZ+0AWsMiJKaa8HqZGqEIAp1EQH1ENFcRe73N3o8=;
 b=d++bLBEGMgrnJQnwg1ANxpy3uhKnjda1Q2lDwtNsDsAvCG98bd3n+8Gdd6ZgkDHNzx8AfEJvsQ5/meg+MG1BpbrQDAU945qq9/Fs1zYNVe7wht8bAhX2d4zi+LGP8vCdxp1FmCYP4Us+trG5hdkbB1SB6hZrg4/YhKBcBUzwbOPX669B+3Gw4BGIfBZB8KKFysauVnTc6gV3Rmsz9HHogzHW8+F0mCXkTxdEgMLA0G/XC69oxa60Jr3isO+I1tvAvLMoslnb7qfoZ4nYuqZapNGMjcLQ6sCFDXFkl07ZkIoRHic4dbwMnnb6d4C6+/EV8a/8rkejRG8N+fsXlqHwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.29; Wed, 5 Apr
 2023 21:46:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 21:46:02 +0000
Date: Wed, 5 Apr 2023 14:45:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Don't capture Gen8 regs on Gen12 devices
Message-ID: <20230405214558.GZ1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230403213334.1655239-1-John.C.Harrison@Intel.com>
 <20230404003415.GE4085390@mdroper-desk1.amr.corp.intel.com>
 <380b0f81-2049-3e1a-87bf-eca4f027dba4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <380b0f81-2049-3e1a-87bf-eca4f027dba4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: f4142f3b-bc5b-47e5-c128-08db361f26ab
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKNPwVHn0twWjzMTHf6K5mK8WhYP+R46u+veCbJ4c3LIe1vHpHjLC/tUrGCRLW+o1C4fqFWdZpSfWAT4yTaosNqaYf7LIoxjdVqF0RNckI5YPcVvYDbtsjgmHpsH7ye/usx4assLb8iqcD76ak/pnXdkJmMrwyK4IVPa+yj8T0o6Z3t6SiD4wNCiV6ejhPHnVckQ/INS+jSGdbOm1sP9cofgpsXgYCAVh525aio5qT6A40smJOJOvbfEIbrUNEjofBvIQQseihuyC5zc8OVh9rti7+lvDku23jN0nYqjnrZWACGwpp6Q6SLFmsqR26IwHRcXE0YgQ8wgntWsLQ3B2bLgM13neCJNjtf4k7zVuEjx/YtK3hBV/XDni3Aj1kPnx8IA9yArAxcq/fXrjYKpgY9BYlRRZJ5Y6N6xlaIo0xdPqtWPvaGjA7tynvXd3eyfvIMIkE8EsHsqNxhcQMMwHuHO3w1cmYKgm/TEsxDgKgUe4Eo8lPFPJ2jZ6z5goAUv9MEp+4KJXhBCHVzQpKUjZc8qMbt4qfpaDUgIaZzQVVQy88vzqUdV7/zEaVEGOirf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(2906002)(6486002)(186003)(6506007)(26005)(1076003)(107886003)(6636002)(316002)(83380400001)(6512007)(53546011)(6666004)(66946007)(66476007)(66556008)(82960400001)(5660300002)(41300700001)(8676002)(54906003)(38100700002)(4326008)(6862004)(8936002)(450100002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+6RpfhYwNAewFLYYw0UsPDSxQ6C4DLh/pKQKXrRb/xuVBq+c99EuXZjB48s?=
 =?us-ascii?Q?oV2MtdhjfKrA5Z1UWRRRzbT6sZv7fY6aWQKy2x5aiAgfc8sdEpUZ7iqiPfig?=
 =?us-ascii?Q?vLY10sTCzuJB7i7uF4i7Q6k2ggszyUvoiVlgIOD4zD9MU7nSZSNw86hHL991?=
 =?us-ascii?Q?gQZHij9A6Z6AjGuBmXMtiTDa3IlNu6pIkLFLlVj36yrujoAznd2lOGPEGnZm?=
 =?us-ascii?Q?3wvb49ODgQJBaC+vEQpoGfxGM7poPFw12QKyhhXls4pzQ/LiZCPwbRzNErWX?=
 =?us-ascii?Q?c8QbqqK8aGnm+excYyDtUybSyZuKDKymLPQlww1ilbL+9d98xCoo1Yoi9ppO?=
 =?us-ascii?Q?q5Kdfqw+8RX+0dL41orfmV+9HaA39XGsYTfUTebrcNf5uxqHxDp2JdexNvOf?=
 =?us-ascii?Q?Nn4bBCb/FcE0qr76/eBETKDbMROJvZ7MDC7PdX4CDL7UexySiC6sHD7l7H1t?=
 =?us-ascii?Q?/M1leBGPDRpsWpx3ZqZbNpeHoGYVmT3w+ewqXwUlDvJMLJ1i+bAW4mwyn0t/?=
 =?us-ascii?Q?tGpBri220H7SrT6cNlsEaYH9ansPDZBFl6/1CIUo9rWzxuNYAbYKHdeeUt23?=
 =?us-ascii?Q?GA62AgFxKFXILtqG+iyymVFoa82s4mx54jQOz+h2MR8hTHxTzSXNhZ9Jv4Hz?=
 =?us-ascii?Q?yP298YCEHdL7MCp1uuuHc3rAHMhlLsQmAPQlmJDF+/9E5+GQWDUqK6qTnfmP?=
 =?us-ascii?Q?f9q1bT5pxaoC71mLy9j1/ljkImGKV/3CVmT7nTEe8cBNdYaqTNd+cAjN7RUc?=
 =?us-ascii?Q?IplofnvzCKWuVUC2rtpX6ql/ffhA3WND1Jh8P5ZrgY/vUrryLApJmuwb8n+i?=
 =?us-ascii?Q?fPJrA7haBmSNxWeKEknqNGeMyU/Z2DISmZdtBlRTf1CB+BIhggopiC+zmZzC?=
 =?us-ascii?Q?Yj/y4vLKeKbncgX5//pktrsjGnSqYs9CJ3Y8+R1Wgzpe5+4LZMKMluDszlDh?=
 =?us-ascii?Q?FRnR5HDUk5fsElJgRwl6zaCXcCqzLI4lEJGA5RqIixIG5vVwticRo6WL5gu0?=
 =?us-ascii?Q?bJO0Nnkj1A7rrC+0aRZM+YGcXOmqy4jTJOKHWmaiMO6nlchdJospD/YaQb87?=
 =?us-ascii?Q?P6bh0lqNuR7SJ75tnSlNrXxHDenj4bS+E7lNpDwPQETgwGX2n5hoANOGTHRv?=
 =?us-ascii?Q?N9x2l6OEIeB+95Y21u0a+keZYnU4J/z49cIfoUwDZMiUE5ED/wTlc5K51yi+?=
 =?us-ascii?Q?0rGuuIE4RdQTWw2tRzQxSNdKCgygG0TkU7FrAxb0Db8s14LstEVsmXVT+phi?=
 =?us-ascii?Q?d2DxpQ/FIU6u3Q1LbOdaClALyOT5fUx1PoVSlpeyxcdnVZwWsD6YoF6rELpi?=
 =?us-ascii?Q?sWIX78u/XfZ2QS4GXgPvtbgc6pNWFapSoGCZIycxZC+tI/b3uEdWlilzipYF?=
 =?us-ascii?Q?R7sE5RgMLOtbYm6jR7raf0qKxSImzyQ68J2z1kMA66Ei/Q6r+6OjPr4rt4+5?=
 =?us-ascii?Q?mate6Mgfmc3FrAGqVZKtZ1wLrole3Z3CjkLpEwMqk1+0UMUuSOoDE/dN7Mv2?=
 =?us-ascii?Q?RblIKXL7xD63HO7cWTK77hyRFbTwZqV3sky96t6tuzbRFM+I1osai8+gohVQ?=
 =?us-ascii?Q?1rnzIVmf1CCCEqvALU+St4KoDQJ8tzbmskPFsVBr9SRd7tBtjQs9b7B7VgFn?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4142f3b-bc5b-47e5-c128-08db361f26ab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:46:02.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33HjnxvRPdvNeauixBLypHCZrXZ8TLSfSbmfRN3CYBQPDmd8zAYx/ocSv0lHsW4ZQIe7F75d/vzDOWbsaHp8OVDjiNpnApjF5WIW3KWDLgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-GFX@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 02:13:31PM -0700, John Harrison wrote:
> On 4/3/2023 17:34, Matt Roper wrote:
> > On Mon, Apr 03, 2023 at 02:33:34PM -0700, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > A pair of pre-Gen12 registers were being included in the Gen12 capture
> > > list. GuC was rejecting those as being invalid and logging errors
> > > about them. So, stop doing it.
> > Looks like these registers existed from gen8-gen11.  With this change,
> > it looks like they also won't be included in the GuC error capture for
> > gen11 (ICL and EHL/JSL) since those platforms return xe_lpd_lists [1]
> > rather than default_lists; do we care about that?  I assume not (since
> > those platforms don't use GuC submission unless you force it with the
> > enable_guc modparam and taint your kernel), but I figured I should point
> > it out.
> Yeah, I think the code is treating Gen11 as Gen12 rather than Gen9 or it's
> own thing. I hadn't spotted that before. It certainly seems incorrect.
> 
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > 
> > 
> > [1] Why is the main list we use called xe_lpd (i.e., the name of ADL-P's
> >      display IP)?  It doesn't seem like we're doing anything with display
> >      registers here so using display IP naming seems really confusing.
> I think because no-one has a clue what name refers to what hardware any more
> :(.
> 
> What are the official names for IP_VER 9, 11, 12.00, 12.50 and 12.55?

Yeah, the naming is a real mess.  :-(  For graphics IP, the official
terms are supposed to be:

12.00 = Xe_LP
12.10 = Xe_LP+ (basically the same as Xe_LP except for interrupts)
12.50 = Xe_HP
12.55 = Xe_HPG (it's nearly identical to Xe_HP)
12.7x = Xe_LPG

There are separate names for media, although we didn't really start
using them anywhere in the i915 until the separation of IPs started
becoming more important with MTL:

12.00 = Xe_M (or Xe_M+ for DG1, but we treat it the same in the KMD)
12.50 = Xe_XPM
12.55 = Xe_HPM
12.60 = Xe_XPM+
13.00 = Xe_LPM+

and display:

12.00 = Xe_D
13.00 = Xe_LPD (ADL-P) or Xe_HPD (DG2)
14.00 = Xe_LPD+


The pre-12 stuff predates the fancy new marketing-mandated names.  Even
though we're not using "gen" terminology going forward, those old ones
are grandfathered in, so it's still okay to refer to them as gen9,
gen11, etc.


Matt

> 
> John.
> 
> > 
> > 
> > Matt
> > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > Fixes: dce2bd542337 ("drm/i915/guc: Add Gen9 registers for GuC error state capture.")
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> > > index cf49188db6a6e..e0e793167d61b 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> > > @@ -31,12 +31,14 @@
> > >   	{ FORCEWAKE_MT,             0,      0, "FORCEWAKE" }
> > >   #define COMMON_GEN9BASE_GLOBAL \
> > > -	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
> > > -	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }, \
> > >   	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
> > >   	{ DONE_REG,                 0,      0, "DONE_REG" }, \
> > >   	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
> > > +#define GEN9_GLOBAL \
> > > +	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
> > > +	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
> > > +
> > >   #define COMMON_GEN12BASE_GLOBAL \
> > >   	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
> > >   	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
> > > @@ -142,6 +144,7 @@ static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
> > >   static const struct __guc_mmio_reg_descr default_global_regs[] = {
> > >   	COMMON_BASE_GLOBAL,
> > >   	COMMON_GEN9BASE_GLOBAL,
> > > +	GEN9_GLOBAL,
> > >   };
> > >   static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
> > > -- 
> > > 2.39.1
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
