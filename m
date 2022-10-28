Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42276119D5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F41710E896;
	Fri, 28 Oct 2022 18:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CCC10E89E;
 Fri, 28 Oct 2022 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666980123; x=1698516123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WtGfzpgLszwz1xasT1syGvGAHwOg/y0j2njD70MkSIY=;
 b=XcqFlsbeswkkHYWMAiJtKgWohOlfC//VQLyCWiTDSQljjyP8uByUqvrA
 J7LOGxaQgIe4m0VVZfSXtgAKaZwKw5y2xl2rQJLgbZPK267ZqAHw8Ossl
 o//cnUMX3dTekP0tO4nlvGOvl+JGEFJLK2B11Za0ruZkKF3wgKGQwYugI
 DtaFMJm9xUVR9ebSa5wqqsta+8JoWRL5IOTZPb7CUgefzolyxA3EEeTBZ
 8J0/CqXoJLmm3SU52rmTWJeAC8wyILGJ0q4Ko1q/gf1JD6qpKTHj4ijo4
 QKIY9H88ZqMglln7fVJigl8ivNQkoih7TUBduwt7K3vtAy0ueg9Qp+ftV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="310252159"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="310252159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 11:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="701820928"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="701820928"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2022 11:02:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 11:02:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 11:02:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 11:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbwdTvCLSKfBxtQ5uzWCgftzAuKkBlcBUesd/7+mCne+MPJCz1XDEXumnP9Ksc69msGdGeoxiDFQBiUVcCk7SFVFgjxGmo4MpoKF9EhjNb723HMl4uVnh+gGGpxC4FtOujh05pw9A/Swgyw95f3nTxKbVlhweG4ugvfCn7sSDqsSAmMLDxUrzlNu8/dWayUFuYiR9RJDHlbKAVK4KAqSyMeODSPcjFckIP7mgCy4l45eyjrcs0AfzAQY37xywpgxVt4u1MXKOYNJ+O7XNzUixTmBmSQ2veEImbVC3UqBrqhRe52iDnuryR2kCnuSSmj962F/y/Mr2mP0kEY0QRipPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1kWAr2Fi4soF+Xy8Kno0rEG7FweG70FEzQu+7m0M2Y=;
 b=e1h6JS9oL2vLB2iqfLT7wIpKnwPBpjWdbncJ5BZOByvESBaO49SbCqEIvNRcxY2o832bMA24QLewxDfwWwQgMpYRCQTGsm0OgsFJp3c4KObGaHpPjz4MQj/XUAKQeRlxR+XyzuOrvO7CE9YG86SaEegtZUFWhsKgf5qWpFLlrtZxvjYvadOI6fLyCJH5D+t2F7TRjW0BHHWdT2g/tUR6PmphtU0xCbVmsq1tkZ3gxQqszMhwFLUDytd2gkLbHnbyByKPtTPWfYGLJPhcFEI1vU/HzmDZEItjdF5XpQEAzIadxIvngQCXizpkO8Bmf4+2Px+B6xIH0kOhA2NFNvQRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 18:01:52 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:01:52 +0000
Date: Fri, 28 Oct 2022 11:01:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/mtl: don't expose GSC command streamer to
 the user
Message-ID: <Y1wZDeBZ6j0EvJZC@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-6-daniele.ceraolospurio@intel.com>
 <Y1tPRlMIWsachnkQ@mdroper-desk1.amr.corp.intel.com>
 <5d66c135-50b8-6faf-4db0-b975a844c194@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5d66c135-50b8-6faf-4db0-b975a844c194@intel.com>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 2169db2e-5039-4145-6454-08dab90e7e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7tPe8bIJqcKJvoQMVgmVNyChmON6ZxFOelsKEATI56Kyu5uHCUcdQ74ZyVaj+AYYzA0VaVQKcfLhkS0/zjogf+HnnlOW9pHzVSLqTUOtIY7OvCLnWn5Te6ZSUi6G6mM3eJHnTSh7J0zxPIMmRteLHKs4nP0FiqNm3ZEEZ3b7yyNybwUsoElWZ8WhonkQg388uTf0/APRk7HS4Bq8JEu28pjyt95ddQz2JZgiozQLsuidsQnvIVKxtsTRAfwst9rGTmNmkBlgPf0a4PM/G4LousHEhyE4BX/VL3duIsRZAyOBo7T/c9LO9UeELjuwnA8LAL2I8t/KAOTbINeA/V0B8p4DstbmVvoKzvGbxNySTUuhvi723sTO1SIz1WifWiJpE3VQ38AOmp2xTKm2Ojd8CSxpYqo38+l1VlmHXtdFYbXmXweLFYmFne3ut3DcUh5sJJ7qFENJ6GvNSggQFD1F6anyzh4Si79ISz7jCc++I2ihgYwnPctv5ptx/3RmqahEfd4ci7S2gTL6t2cRF1pYJtpHzcxxILHIzjeYOu5Dum0hsdAIg0w8cA7YnbAkBWaFCF1rrVkmdO1Ne6hRpvteLG9LrWJvYn6vcHZ9I3CQVN06VJmX8G2KS8wcDxFjtcjjfRoEyWjMFjmVJROo/vYZpiAWeJmrFlLsxWcQmO91EWNKm/t4BtN285EmajwdOZVZ68+z2hZJvLHQXwSxO5xuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199015)(66946007)(6666004)(4326008)(6506007)(450100002)(66476007)(66556008)(53546011)(6512007)(26005)(316002)(6636002)(186003)(8676002)(82960400001)(2906002)(8936002)(41300700001)(6862004)(38100700002)(5660300002)(86362001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DXvcwRAB4UXYuM3FfhSxQfZpItft7AYhwQ6EK7bIyomt7rzKnwKBbvMgmDXT?=
 =?us-ascii?Q?p+z5L18wk1awuvp6Bf6Td+1d9zdbdGg2AQ/pWPU9BqeV3EFS/YCipH+CWSMT?=
 =?us-ascii?Q?5M4hVkaDwMoxgcrWZ1TLmDVV8X8BlNUtAG0L0OCSguiBm2+EfXoM4E22JfWV?=
 =?us-ascii?Q?rJ6+pBa1C1X2s3D2Hz0arCHM/PPcwDVmxa4RfXitUUEbf720sCG/yZpxECVL?=
 =?us-ascii?Q?GUjhZX92VnHpE5xxT+mnLuuy4nDXRW3l5NTHJ/5/8oNvboRHXJKT7vc9HiO3?=
 =?us-ascii?Q?Gp40C8t/tLdUrbcJvDKH1Ba6XxMQKOGwNDm+Iq3S8M2JarsjHPxR5lfIse70?=
 =?us-ascii?Q?+U18HiH0CtBSrmBjyKh2QU6AzPkOlQeu1iaWXcl+KbIcJnQ6gFGTufkZGjBA?=
 =?us-ascii?Q?w3KkQyEv2UERyPbKsxlZh6dzM2Z1IRMKCsyrn3Rka9/aLGURSUNUv3GxVOhY?=
 =?us-ascii?Q?xFZYJ2Yes9AhrhkBzKwiHQuon1RQ0DEHX3DBv+EXwiqMq3vinSCR2+dO1rSd?=
 =?us-ascii?Q?twhSnOosyBEXn8FKYdns8blgJvNLzWe2pG8x+kXP2F1gcm7iOtFzXG7CaEPx?=
 =?us-ascii?Q?cl4V/X4LlQwd4SRxDMcKDLoWQOerXm08mipGGJQqQV9yUHeNVuApdHnyg9DU?=
 =?us-ascii?Q?L0qE35hR9f/1YoWyFFKT3iXa/ulfSuva0xiLI4YXFxQcjL5CRayyqYTx8p9x?=
 =?us-ascii?Q?Fnx1BeC06tLlJrlhsLLqwmajB4UmDL4T1xY85+QWW24cmHYar1Z9jCg+ABl7?=
 =?us-ascii?Q?7mAJwAti6vUCcUwmwf/NtZ2LIPk25ctUfgTMjegbuwhDY5TmKNYguupw/07c?=
 =?us-ascii?Q?Fe4+GWcO24NIfCCcz8P5nor/7wBqg1bciRAEo69cDBWOLjOqg1Va+bsGN25H?=
 =?us-ascii?Q?Ke3LHrImtfPqtYgfv3og8uYuiDb6aqE8+1jh7E5DcYmYLZgQ9CUpp7c4PKSW?=
 =?us-ascii?Q?PJz739yAuLgaQyRMGG7Ois2cUbFt9GpJ5PxSqrBDIwP2QWDXoksDBXULlFeX?=
 =?us-ascii?Q?KKMPkH6K+EFiMMwSVOOj/wGWK7TJ8fHsZ2iHt1PQlKhT4kRJ1pBOJV8VWTvT?=
 =?us-ascii?Q?cPPX19vZ17h9Wvk0CInyd/vwSlDwug4IHBrBxiI762OKNcRo4RAv7eVZJMoj?=
 =?us-ascii?Q?Xlr9xH1BwJlLhyhmHVg4yUFWg+6+gA4lH55rIPS+hhHlhzDCcr1NLV7pmJYo?=
 =?us-ascii?Q?aGC1YxBbm2DrNiQC4nfl2jyP1gyXyp95JPQ0n6/0H+A75FXMYtooFIfls6oS?=
 =?us-ascii?Q?yjiV0gPTvOPrQUE4b+UTpSf9bjKTBOBOC0XBEkJOkG9lC+MUgdqcfIo5Bmdk?=
 =?us-ascii?Q?vT8ekjy29+bMD1YEzMCqr1G4xNnMgybysI24onB2de0LpeBkqBLLbE2iUxe8?=
 =?us-ascii?Q?bU7txXF6f0Qm2WRQRcAJarO4Z2AW5Lb+RI/SQvqPPQ3zgNg4HYGcJFpt/Pe7?=
 =?us-ascii?Q?TE/Z+xKCk3afpOyPiERHu9rgibtifQ1pMDV7V0Fk6/oNpTfto5lirfpb/vGr?=
 =?us-ascii?Q?BQcbHzkFZP/IQ4/wiIE6bf7ejluMOSu/2OP4hh+cYLLiLKEhk49k4NLMyVCe?=
 =?us-ascii?Q?nNoFVYJtK6QdFMi8jy8GCG612UoknqidjbGaMpHcNYPtDJnlXBGzxBhtcGA0?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2169db2e-5039-4145-6454-08dab90e7e0f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:01:52.5871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eT+6cFLxB/C+i6O74qmv5ig36vQHDMlWbnV4sKQOGUS/zewUwbsOgR214agpk+HBJkK0zRlrSuwT/KP7v0xnkum9u9G0KCZLNbDO9Amsc1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
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

On Fri, Oct 28, 2022 at 10:14:05AM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 10/27/2022 8:40 PM, Matt Roper wrote:
> > On Thu, Oct 27, 2022 at 03:15:54PM -0700, Daniele Ceraolo Spurio wrote:
> > > There is no userspace user for this CS yet, we only need it for internal
> > > kernel ops (e.g. HuC, PXP), so don't expose it.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Since we never expose it to userspace, we also never get to the point of
> > doing an engine rename and removing the apostrophe.  I assume we're okay
> > with this engine continuing to show up as "other'6" in debug logs?
> 
> I don't think it matters a lot in debug logs, but anyway it wouldn't be hard
> to rename it to something different. What do you suggest to rename it to?
> Since OTHER_CLASS doesn't have a uabi_class defined we can't use a count of
> engines of that type like we do for the other classes. Just rename it
> straight to hardcoded gsc0 ?

Yeah, a hardcoded "gsc0" seems fine to me.  I agree it doesn't matter
too much either way, so I'll leave it up to you whether you add that
rename or not.


Matt

> 
> Daniele
> 
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_engine_user.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > index 79312b734690..ca795daca116 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > @@ -211,6 +211,10 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
> > >   		if (intel_gt_has_unrecoverable_error(engine->gt))
> > >   			continue; /* ignore incomplete engines */
> > > +		/* don't expose GSC engine to user */
> > > +		if (engine->class == OTHER_CLASS)
> > > +			continue;
> > > +
> > >   		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
> > >   		engine->uabi_class = uabi_classes[engine->class];
> > > -- 
> > > 2.37.3
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
