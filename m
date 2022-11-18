Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A362F7F8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0C910E20E;
	Fri, 18 Nov 2022 14:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6BD10E754;
 Fri, 18 Nov 2022 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668782646; x=1700318646;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dqPXt8PVp8zkUaQEbz5R9VV7wqOQMFFr75BqCFPErqU=;
 b=dQvKHQsyBr6+5ClbO9wp6gRSzTcXMOGL4y1DbItv/Gg6d9VZL3ud43RX
 iNWo+udGVv1cxUGgAi73gYnEMP+FEEUsBQeUwPgvBX9gUeB+WYbRWbKuu
 GsH1oXp9aD3pyDZTgOvcKLTHDIwplvoac9htltGrXNtM5E/fDuqUUQsyR
 8nIkKnYn1fZRQ/JgflflH5r+9kPyU89GuYHu2/yJ/wLWBBObD893MW0Fp
 7X+Ut16Mg9YXoBppSWTwGgaU0WOdf33WE9zB7SbnEHH65x//WfjhVNkdd
 GRw+77Zt2aUWnqWoZtyBJV7+1fINvPYSGV5ZzFRarazFzlxJcUnM4/P6p g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="296510189"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="296510189"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 06:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="618030725"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="618030725"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2022 06:44:05 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 06:44:05 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 06:44:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 06:44:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 06:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsBz4dJrzJkA55ADKLnDeTFVX7/4A45N5LwerWBgeCKJlteySAYX32JIzqZx6nwYiSlKCGQNP5TspKQSP4XuTEis5xLaWNXuRH4Idh3BM7Pm8rdIjNtZOUJRUQ7lEDuX+OuRCMNot03d50kTLLsQS9NCeBGPTTijKFf9L43+2SAQoYSSKYPlc5wG6LOvewY4ECStpsE7evRaP2Hw0r+2qkzst4xTZoS9ohxMHu7EotOX6MT7vpZ1LwqpomdVHJEW9NlwAjuUsZGmRe5SQP/K05yndvqVCSS+vJBr65re2jPHIcs2XyiEtTBBe/Dooj3ne2dPyqv1riCQsq0Z52H3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYXBUxjCqBtLj7cGO+i/x8EQ9oJKBLTt4n/xZgd/T5M=;
 b=bRdAETsJ3APt5lsJ6TWvM1l42+/4DdMRHlO7zDaavKTZsdYYGoB1zh7tJXtz97eU9Vjf07tjhaH4a94uMsQWmBD2xdhdfLy9JVXe7PdvfKnB4p0KSgu5Lx2Z1w6upOxyBiq5jpCH3spZkLv5FuAUbrqzLxnza+eglEtTOZTmOfbWIxwml13ifCSJQH40c5ZvWbZqD0f7fSl7+YHs1t+NgYYm8Qp5/KKFsWJymlFt2eCxH34v/2jAZWf8N+05U39XDeTfZwateVUF3yLsgl2nsQ3qQXGZ1PuBltSvAqmRRVpnS1TGmeiMROO2RQ78FpuAuOH30UjmjOgB62/Z7ISymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 14:43:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 14:43:58 +0000
Date: Fri, 18 Nov 2022 09:43:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for
 GSC CS
Message-ID: <Y3eaKmrChYhBPLGU@intel.com>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
 <Y3ayWbqIZGIX8b5R@intel.com>
 <b20afaa3-9ea2-28f5-b83d-bed0a0fcd394@intel.com>
 <Y3eXheyJqbAuK2Iy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y3eXheyJqbAuK2Iy@intel.com>
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: b2071e34-f849-4f8c-3ccd-08dac97352fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCYadT47PJQgzrHAHyP/ME3p+DZtDL6gLpU3IjUs5vnmHyuwMc1ZbnYPu7gvNgRuFAoFSMOmkhXVDJHkcJFNutWqPQAFFdoUnNjmO9/ZMDzf2hNqIxvKW4N8zmDkHKiDPFHhE0l8lWjRe2sCy5Zvs2YRzOKmTbF1My8jUMYrQpDi1b4QFCKYd528niEq5b6lMyzYHq1IiHnPC+FnWI5VGhklURNGZBbDFBVY5TfoihtedYR1K3Yvg/bFy8ekJ3N6CDR4eQ+LN++fuJt4q9CwWpwBBrp2la8Zq3aX2zfARsg3Ihvj63A067hw9c/T03Rl2Iu6Lja1Ytkmg0BcB23RWrdeOP6s89zRjBFzLXXiRwY23lAe0IE9o6EtU0WiSK3V8xBJ3//R4v/9zzrrD5L+07GMcgucMaSWW9kja2WBnsBBqHL85bnezULkm0HmGh/S1x0wa9N3ZzlnZ7tfVkMx+xZjZ/eK63IW/5QBErv4GNTCsoMPAwABKyRS9oD8RU9Axi7fpgBX9oR/AUW+y7IMz3fPd7wbJit7eDDoYPq6S2OPpEz33E0KrQ0tJyQsIu3ogOVngRQtT/tTFK+Sm9LtSgQV7ebRnsp0hxHbRAo8k/3/3I8d+0SUlM6PWIFr+gNV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199015)(478600001)(6666004)(6486002)(4326008)(26005)(36756003)(186003)(66946007)(316002)(66556008)(66476007)(8936002)(6506007)(6862004)(5660300002)(41300700001)(44832011)(2616005)(53546011)(8676002)(2906002)(37006003)(6636002)(38100700002)(82960400001)(86362001)(83380400001)(450100002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rzcy5msyfNwPHN6EjIoB5EUDlCdiBn3co4SVe+jlybP14rae7b9XGxu7txqt?=
 =?us-ascii?Q?fxRc55iCOtd7RGN09Axv8yAQbXX0L0P+ol2yMG5xruXPNeU8TOdSxJYevmEU?=
 =?us-ascii?Q?CQ9PBXqvIW5HGkwF+ZyIGNY704QFUQkzk4eSMtfRwC4pXFdLSXRJ9eL9ZLL8?=
 =?us-ascii?Q?Zmuu6JIj/5vWeF7tM4OhtN/+UJEnZvt2gozhXDXAylaYaOHuWNjMs40Fk+qY?=
 =?us-ascii?Q?rvaVUBlMpU/i5wN8g8NBwvbg0wbNzdYDRY5+dqQAh7au0N9ziJpd1Ffj4fEM?=
 =?us-ascii?Q?qcD7U0365w98GvkW/1zEItXyvZI6EorTvvET7RA8ZEf+jdg/qX+AsD3VKClL?=
 =?us-ascii?Q?hT1M40t8PaUdeMHZQKLHBxVKhLGakKW4AY3Jgc7Gk0PSf91EFRPLCzbZW3MK?=
 =?us-ascii?Q?Ks3zinm/QJF4J6o7V8ULsb0/T8CBt9GzyaX9tDUGGlLPGR45hmIfR6FX4l06?=
 =?us-ascii?Q?5cZts5uwhawGuLGqvcVtCGAXxVdhonveXk9eHSgyz5qrpbIFjHcQbC4AiM2I?=
 =?us-ascii?Q?M3ZP2uRnyxP0zLTCh8ejn++v6i12Az7xnK/660YdU4L12XfMnf+2jSvAXf8C?=
 =?us-ascii?Q?/WlfsBo8bNP2ONSkw2+tpRZht/N47s7+EaurRwhtMV9nlW//aDVRpQHnXFAt?=
 =?us-ascii?Q?KKwYjDigEtQD6tzi15+36/bVROOmjUZLJWtItKhRMHxZII6t+MHvYE6tk8y+?=
 =?us-ascii?Q?HyiexnmKX5ZOnwdcUqeIVcN0xQECm5LrM8sguykFouHes6Lr705c22n+vxyC?=
 =?us-ascii?Q?QjxVERmqBwxcvkAaHLG/nNmtqQnrbrogPQ+TEmsUcm9jUSi0cEoMkhrVwDwC?=
 =?us-ascii?Q?a2QoSvmbAgy8QoV1lX/UHwk1n6bCZztyJal41GAf3a7IlA7fmKSYZkLXsF3F?=
 =?us-ascii?Q?D98wW42EuJYCW23GaCuX3QILcjTWdxkzsOYinP9EVOTsjXvesoOxAMwarT++?=
 =?us-ascii?Q?wQ9ZttCJpjorCndTqWQLhOTgBqIy6dTCZBT5LaOfLIIMVXkiFlihTGNGq3od?=
 =?us-ascii?Q?RrzH7zOolFKOW3H0r187j9pahmxv2fhxXcVVwIzDknEX9TloGEjkn5vCKhba?=
 =?us-ascii?Q?1IZSOc5vOjMocXxjulvrUuGgMaUBL0BqvR9mLO9tdgZN5033vdqTor3SidbB?=
 =?us-ascii?Q?Q91nvKeCSr2EQ2+NYU/g8ZNt7MtplijpUSIHQER7Dl7z9mIuYna7uitclq2L?=
 =?us-ascii?Q?KXQjY4H+BcsC9c8PNDb0CAylqYJ4fG3ZkiCCTOTt7cqZb20Xk5uxZCcqJeOi?=
 =?us-ascii?Q?ZRW04qZPbdeABpydrTZuulqaoYXBn20uVmJ2yWKm4k4kMhuYeBaew88LovCm?=
 =?us-ascii?Q?FTtv5eyt616REsA33kQUXIt8jDKtTkw0ifelx2iDy12JDHkYKc15tEHLQOqp?=
 =?us-ascii?Q?EMas8kxpzEP7fiOvl7Am2WRQbjIRRXQy+dUBCydEHv3ZwfWuoKCvib3cBVQr?=
 =?us-ascii?Q?oKiflhE1MfRCODoQxLD2hFAosx10I2vFau0zbjjjHaZprOTiGHkwXDeiqZSy?=
 =?us-ascii?Q?eB/AGbWj9IHsepnG7uFwvCU/IyUV8k+MnL0JLx5PZ1I4fjsnxyRKeOioPpZB?=
 =?us-ascii?Q?Tt5qkYJfMPKnADs5JwYkZ6W/iRZhcGF6J5vhQI5i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2071e34-f849-4f8c-3ccd-08dac97352fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:43:58.1705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MakQSPFifx49yLQpSjsufA7IJbHD+mt5UO0hUJ9KR5l43hfDlPeziyThM31R1OHzB6Wv4GIwjP8uixQ3LLtI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
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

On Fri, Nov 18, 2022 at 09:32:37AM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 18, 2022 at 09:35:41AM +0530, Nilawar, Badal wrote:
> > 
> > 
> > On 18-11-2022 03:44, Rodrigo Vivi wrote:
> > > On Tue, Nov 15, 2022 at 07:14:40PM +0530, Badal Nilawar wrote:
> > > > From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > 
> > > > By defaut idle mesaging is disabled for GSC CS so to unblock RC6
> > > > entry on media tile idle messaging need to be enabled.
> > > > 
> > > > v2:
> > > >   - Fix review comments (Vinay)
> > > >   - Set GSC idle hysterisis to 5 us (Badal)
> > > > 
> > > > Bspec: 71496
> > > > 
> > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
> > > >   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
> > > >   2 files changed, 22 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > > index b0a4a2dbe3ee..5522885b2db0 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > > @@ -15,6 +15,22 @@
> > > >   #include "intel_rc6.h"
> > > >   #include "intel_ring.h"
> > > >   #include "shmem_utils.h"
> > > > +#include "intel_gt_regs.h"
> > > > +
> > > > +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
> > > > +{
> > > > +	struct drm_i915_private *i915 = engine->i915;
> > > > +
> > > > +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
> > > > +		intel_uncore_write(engine->gt->uncore,
> > > > +				   RC_PSMI_CTRL_GSCCS,
> > > > +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> > > 
> > > disable the disable? shouldn't be enable the disable?
> > > 1 = disable, no?
> 
> doh! the function here is enable so the disable of disable is the
> right thing for this bit... Sorry for that.
> 
> 
> > > 
> > > > +		/* 5 us hysterisis */
> > > 
> > > could you please mention here in the comment that 0xA = 5 us per spec?
> > > I got confused again even though you had explained already...
> > Sure I will add the comment "0xA=5 us as per spec"
> 
> Thank you
> 
> > > 
> > > BTW, how reliable that spec is? Because according to that same line
> > > we should be setting the bit 16, not the bit 0 in the previous reg!
> > Bit 16 is mask bit.
> 
> Okay, and we need to clear the bit 0. It makes sense. However the spec
> seems to ask us to set the mask, but we are not. Should we?
> 
> Also from the register page:
> "Must be set to modify corresponding bit in Bits 15:0. (All implemented bits)"
> 
> So it looks to me that we do need to set the bit16 to ensure that the
> clear of the bit 0 is valid, otherwise this is a bogus call.

oh, I hate these macros hiding things up... bit 16 is there on that
_MASKED_BIT_DISABLED as you showed me offline...

So, with the comment to the 5usec added, feel free to use:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > Bit 0 need to be cleared to enable Idle messaging.
> > Bit[0] = 1 Disable Idle Messaging / 0 Enable Idle Messaging.
> > 
> > Regards,
> > Badal
> > > 
> > > > +		intel_uncore_write(engine->gt->uncore,
> > > > +				   PWRCTX_MAXCNT_GSCCS,
> > > > +				   0xA);
> > > > +	}
> > > > +}
> > > >   static void dbg_poison_ce(struct intel_context *ce)
> > > >   {
> > > > @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
> > > >   	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
> > > >   	intel_engine_init_heartbeat(engine);
> > > > +
> > > > +	intel_gsc_idle_msg_enable(engine);
> > > >   }
> > > >   /**
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > index 07031e03f80c..20472eb15364 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > @@ -913,6 +913,10 @@
> > > >   #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
> > > >   #define  MSG_IDLE_FW_SHIFT	9
> > > > +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
> > > > +#define	  IDLE_MSG_DISABLE	BIT(0)
> > > > +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
> > > > +
> > > >   #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
> > > >   #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
> > > > -- 
> > > > 2.25.1
> > > > 
