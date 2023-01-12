Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF4667C65
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9ED10E30A;
	Thu, 12 Jan 2023 17:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D3910E307;
 Thu, 12 Jan 2023 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673543819; x=1705079819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gS9ANg/MtfFZ1yXbj2tAJVSOHGXOvw0za+A4lJR5bwg=;
 b=S6ouZHfWtQojtmn2NFvCcPqCweN9QOFRw8QU8Anh5uVQ7WZAFSZPZXDL
 MJfm6jRqHId+jfNEcw4aK00Pz99CHD98f/g/vqtad+43lmtK7MN4N5JyZ
 HCwHVK7Zo85A7mueBm9JpnpulZTLVZwALOjssJ3ICsOeuNlMz/n5aXJbQ
 cGIu32H5NgrNBVnG86IRSmHA1u0bR3IHC1K+OMlq5GwrZ73nxiVIOxOgI
 Od2WqpD0h11KBouV+60W5w41w0Of/2nZ2n6K8e5l3Ak4LycphegM9cBbn
 SUVwNpe2G0p7mcOxp1ZRCVs/EqBD1NylmbMAjgF8KGxjgZV+VWG967fff A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325812391"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="325812391"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 09:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="688415085"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="688415085"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 12 Jan 2023 09:10:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 09:10:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 09:10:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 09:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfSNvnpj5pZcRv/UmZp4AmVPrhWwDjnXS6NFHAgskPKAoFHaytLxtI7B+fo7qjSVI06FAiZWpEzdqgOnyNcQxnEQhGsvHURjflGlTvL48HH92CVWXApUu0GUabAPNzD1536tUICobmrIoDinK35LKCDygsINqR6UWM7JztddwRYT4e+nIHZe7laJWLVsn5wzdhbJh7XcMcqGfRiCNjuqrGACUb5+eq9juGco74Ykeg8t4+r2FOTLqayXefG0QkbG7JvkDJj/Amkh23iFn2G2w7Kk8by3Xyf2WwoQ0RuESKWRrikh+EefO+1rv7Vk1aEvmzWydAxM0TBVQ8nFl09nIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DuVf95sirdobXbsDsZuhfRFb028YQhIaffxLt+HtvA=;
 b=G3OyeRlgWTkrURZcXESJ3JPa3OSJLe8huePpOkW31/qp/Ie3srE/cOQk2LR9hmHagwb+6qO4Y6JwWPF2T9RlxiN/UQ7l7JqoERh/qOydxTqkB7iSLFVJsHNiBxLsinoYjo96I6IB8eIzwc3e+PNvxgdjBz3/t32ug+itNks8YknUxr1bODwbWICs5UjZzfhWJ4r9Umgt1Gki0BCO1uVQhIDdnl9tpTSXb1rUYLA9XlG1YvgxT73radu7FgGuEsisFPR1u/NZsyeWw/LQ7Tt/dcEs6BIl5MEL6+OC2Y4BfHorCEC2lF+gCUB3TN/G0JH9DcsMjU0sRwSLUY4/Lc3Ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 17:10:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 17:10:55 +0000
Date: Thu, 12 Jan 2023 17:10:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <Y8A/EI/23Ng+MCaC@DUT025-TGLU.fm.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <cd0e2491-92d4-58df-628b-985768472157@linux.intel.com>
 <Y7dA3cfSfKDuGkXZ@DUT025-TGLU.fm.intel.com>
 <20230112095425.77a3jhyoipvqtc3o@ldmartin-desk2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230112095425.77a3jhyoipvqtc3o@ldmartin-desk2>
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 741b10f9-463f-404d-a41c-08daf4bff774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbZf+vIz6zeAijue+sV8JbUkn9KWFIHj+EmmyqF51NT4CGTy5IY+UdbYlD4hcPUh5s1ZHAeDpzyuSIObtuuV/g423+hO3a+UI2PJfwijqynJZ261r612eeG2LiBEHY8oHRHBtt8oKRLr/noPdI1qXEOB8OmJabdbWu81NcOkTFK0LQSZzKJS6KPkHTsPMY+mmKl0e5JtEMOx8vZFy0MgLcjEWBeU3GF5VHWUXkO+WyT7xifoAilRwu1yOOlee53E9g1sjucC0yKuCmYs3SAT6HR9558aiRrPfMKpRC1mBa9dh1iuU1Nsig9MEd+ioDZn2ZGPWh9Wit8E8sS2wP66fTTUZnDtGB6dvFfBIWoiLgyJv1HekBasBj0yyqcd2faZQzbsWdalWKqWKRehebFeSPfcUh8P+VL9pSYYBF/9frgfbEdzgBoqPtWKcxUNQGe3zY5+15jP1e+RPsiENijhRauzm/4/1fTqgvCQXe0k11f8u1Q3pOb2Rh1I1BYZX6qkQDYAccL/TKdo2EVA2uWWd0RdcPVnGlVScEHWyH0uJmDyN0wRRIomtLOheJewiVAozCrkkz62yWxd7O9e5nIGmGujw4F08N4YJMWtHK83bGYPuGPMBnvKHjws8lqFoX9IMCevyKuN2WBsMuPuQI+acg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(83380400001)(44832011)(53546011)(66476007)(5660300002)(6506007)(26005)(6862004)(186003)(8936002)(6636002)(6666004)(6512007)(478600001)(66556008)(2906002)(4326008)(82960400001)(66946007)(6486002)(38100700002)(8676002)(316002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7EDElVl9OPFurYGnqY66vES3SlsywrXKMIJM+znTizuKvYYXcLW7vgASU7be?=
 =?us-ascii?Q?yM962iAADr/1wdoNa+KLuu7GnnahgtSUarYyrGj10nWW0pky5sw3Yca13MNK?=
 =?us-ascii?Q?bHJIHAJN8LS6bA0zrMXBCJ/VQH9b//LQqseJ0YMSjb3GZwbIDNiEnj0PYgj7?=
 =?us-ascii?Q?uN2NPL6JI1CpWX6XbBMAMoyWoSB+pXQDl9rbaYt9VK/QehweCuqeeDM6HmJB?=
 =?us-ascii?Q?iI19gexozHr6mFIho/pSpJk4XalxXEn57czsX36fyUhAHRanWgxJWEN1kJxU?=
 =?us-ascii?Q?86/14KWDxJ2DvpqNp9L2SoR7YO6BISgqaStDsP3NhDY2jvPGB0ZW359+9LeY?=
 =?us-ascii?Q?NIXXAX9zXNXvOPoLxtkJOYkJITFr+2nvc3Ytlr7dvGBvD05IJgv9p/sNjSQh?=
 =?us-ascii?Q?WIj0aHERZXeoKKkZeVN/4YVUgSoEH3UObE6r5s5Qwe+R1z4ijuT0afaC9/e4?=
 =?us-ascii?Q?bEukrXDuUIC6tSWRSSGJHWElEaK5MiUWyVYm3fJg0quwn0BX0XfvKtWUvunG?=
 =?us-ascii?Q?hVyiw6FonmxaAP30j8rmcQ7Gm8vx7zcjzmJTTQ11KEW3l0Js12/aCPeo7jVC?=
 =?us-ascii?Q?60mXt5UMOBy3Gg21f4VH07wMGcXMlMP8jx4A6/2LLGwiDAepQIMT7N//GQhp?=
 =?us-ascii?Q?VrRbjrddC+LLMByxtIHMP8tMVgqnLteAyC/XdDWQ+zzyAdtdsk73j4upAACl?=
 =?us-ascii?Q?QAMMYCOpHiR+bQfpHZcoGYa+1u+sKQd+Sxk0xlVx3866+lEeqykqtFQCvvi7?=
 =?us-ascii?Q?7uLA25sUp/ktcT5Y816kbDQHM4vIGY1ejd9+waDROkmqlJpoN96e3INIGnwW?=
 =?us-ascii?Q?HSRrJJeQFfjxL2IScEnoHyYjEjhgSMzBIAKnWU4oXAwRPRF31fD89nSNUY4W?=
 =?us-ascii?Q?2NGREOjboQwm5ZYz11Qeg4naiemGzdH4KMOmAx63Ug4NI0xC2jo0rOq+RU6j?=
 =?us-ascii?Q?Z2AwsCdLwq9WI0iWXlT6XEQ28mDyyMfFvHyVv1gcfmvIt/AkYVDycxwZLntV?=
 =?us-ascii?Q?MCnCul5vvyRFV9yo0dZBRcyrKF74BxRWFIumhgG97NCzvvGRPbxbEEENNeJx?=
 =?us-ascii?Q?MstVDYybdAB9CH+hdeNIZKPMEOGFhnF6gumexHegvdOdUaKH9X8mcEqZ7S6V?=
 =?us-ascii?Q?Ni0zTwi1NP8E+JgFU8FQTuSgQvbTg5uxqbU+40ZOBj+VPaz43u/IIkKfIXvo?=
 =?us-ascii?Q?mSv6MtkTX9esLoVoWc6QjpHgX9NK3u16cVgnBYDIChvj5+/55J7Q9z8PldF9?=
 =?us-ascii?Q?Jeaslq6ivjXSV2q8eZ7opxh2Ggr+bG7ryCtCDwlQG5P68XV4wX5oTMAs0kel?=
 =?us-ascii?Q?/wBHjzLJKFH0wuh7nol+AGGqMViXDrqap369zRabPVnofRRaKPyi11xnk/VF?=
 =?us-ascii?Q?TuutojQzAl7mvUbs+MKftrgqOvTWlN8emAcbiSP9py7Hs4fygkZoN4cP5ng2?=
 =?us-ascii?Q?GeBd22whkdSgpg9KBDKkOmSejytErAweqnzUGBTrqyjNaLTIXFdUTG0PNocs?=
 =?us-ascii?Q?x9CO0mIwKsvJBDs19fYgVIoX33qUC7/09URdmxjA9ym4adhwcRho91E91k89?=
 =?us-ascii?Q?S51qXbryoff4mD+kZejY2oSIrDKbJOBYuQ4HAWPaPktMCKBaEajR05Lx0dWX?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 741b10f9-463f-404d-a41c-08daf4bff774
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 17:10:55.6308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH7GgfVwu50uDhtDw5Z1rTQmkO/d77V1jG7FmhdBIbTm3t7Jgj2uSLOLSoQR8ga6umGF+rhWjuDPdpOJnQY/zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 10:54:25AM +0100, Lucas De Marchi wrote:
> On Thu, Jan 05, 2023 at 09:27:57PM +0000, Matthew Brost wrote:
> > On Tue, Jan 03, 2023 at 12:21:08PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 22/12/2022 22:21, Matthew Brost wrote:
> > > > Hello,
> > > >
> > > > This is a submission for Xe, a new driver for Intel GPUs that supports both
> > > > integrated and discrete platforms starting with Tiger Lake (first platform with
> > > > Intel Xe Architecture). The intention of this new driver is to have a fresh base
> > > > to work from that is unencumbered by older platforms, whilst also taking the
> > > > opportunity to rearchitect our driver to increase sharing across the drm
> > > > subsystem, both leveraging and allowing us to contribute more towards other
> > > > shared components like TTM and drm/scheduler. The memory model is based on VM
> > > > bind which is similar to the i915 implementation. Likewise the execbuf
> > > > implementation for Xe is very similar to execbuf3 in the i915 [1].
> > > >
> > > > The code is at a stage where it is already functional and has experimental
> > > > support for multiple platforms starting from Tiger Lake, with initial support
> > > > implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
> > > > as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> > > > implementation will be released publicly early next year. We also have a suite
> > > > of IGTs for XE that will appear on the IGT list shortly.
> > > >
> > > > It has been built with the assumption of supporting multiple architectures from
> > > > the get-go, right now with tests running both on X86 and ARM hosts. And we
> > > > intend to continue working on it and improving on it as part of the kernel
> > > > community upstream.
> > > >
> > > > The new Xe driver leverages a lot from i915 and work on i915 continues as we
> > > > ready Xe for production throughout 2023.
> > > >
> > > > As for display, the intent is to share the display code with the i915 driver so
> > > > that there is maximum reuse there. Currently this is being done by compiling the
> > > > display code twice, but alternatives to that are under consideration and we want
> > > > to have more discussion on what the best final solution will look like over the
> > > > next few months. Right now, work is ongoing in refactoring the display codebase
> > > > to remove as much as possible any unnecessary dependencies on i915 specific data
> > > > structures there..
> > > >
> > > > We currently have 2 submission backends, execlists and GuC. The execlist is
> > > > meant mostly for testing and is not fully functional while GuC backend is fully
> > > > functional. As with the i915 and GuC submission, in Xe the GuC firmware is
> > > > required and should be placed in /lib/firmware/xe.
> > > 
> > > What is the plan going forward for the execlists backend? I think it would
> > > be preferable to not upstream something semi-functional and so to carry
> > > technical debt in the brand new code base, from the very start. If it is for
> > > Tigerlake, which is the starting platform for Xe, could it be made GuC only
> > > Tigerlake for instance?
> > > 
> > 
> > A little background here. In the original PoC written by Jason and Dave,
> > the execlist backend was the only one present and it was in semi-working
> > state. As soon as myself and a few others started working on Xe we went
> > full in a on the GuC backend. We left the execlist backend basically in
> > the state it was in. We left it in place for 2 reasons.
> > 
> > 1. Having 2 backends from the start ensured we layered our code
> > correctly. The layer was a complete disaster in the i915 so we really
> > wanted to avoid that.
> > 2. The thought was it might be needed for early product bring up one
> > day.
> > 
> > As I think about this a bit more, we likely just delete execlist backend
> > before merging this upstream and perhaps just carry 1 large patch
> > internally with this implementation that we can use as needed. Final
> > decession TDB though.
> 
> but that might regress after some time on "let's keep 2 backends so we
> layer the code correctly". Leaving the additional backend behind
> CONFIG_BROKEN or XE_EXPERIMENTAL, or something like that, not
> enabled by distros, but enabled in CI would be a good idea IMO.
> 
> Carrying a large patch out of tree would make things harder for new
> platforms. A perfect backend split would make it possible, but like I
> said, we are likely not to have it if we delete the second backend.
> 

Good points here Lucas. One thing that we absolutely have wrong is
falling back to execlists if GuC firmware is missing. We def should not
be doing that as it creates confusion.

I kinda like the idea hiding it behind a config option + module
parameter to use the backend so you really, really need to try to be
able to use it + with this in the code it make us disciplined in our
layering. At some point we will likely another supported backend and at
that point we may decide to delete this backend.

Matt

> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > > Regards,
> > > 
> > > Tvrtko
