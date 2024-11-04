Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4939BBFED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C936210E4D1;
	Mon,  4 Nov 2024 21:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE/Hv1vO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513E410E4E8;
 Mon,  4 Nov 2024 21:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730755353; x=1762291353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LsX3pcpAKU+IJo9+reqpD45ZhXoMjSq72Ur4xSQJ1wQ=;
 b=RE/Hv1vOrxZo56Js0vEifm/GDcbU+noQDbxBhrwIgO1F8XgbJ98wHk32
 xCjjXCtDamG/vGqZqpw5P4CT70NBpPCc0uMnPRUHbPr3DHFcqOxkpZqrq
 Y81tizzcopEetD9LrskRPmmeyeydPf6vy6asyziECMV6LgJ7H5Z4UMumb
 kl3jlNxUOV5iyKStYJofPYZal/Hkq5C3e9iviZfILsla7veesOo26B27/
 lfwSLI0W+ZB0nC1iVLehrcqoFruDCoW0lqxsjt0W3ozOCVNF0Sps7g2z6
 tJjeUxiXBXvaKt2zf4zfthxwBxs6BY2yYtcC5yQgo1ocVLAMCFb+p6S3W Q==;
X-CSE-ConnectionGUID: HkurY9nVQByaOmmMizUwdg==
X-CSE-MsgGUID: 0O1SKmKaQeCJZjNHnGV6Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34260259"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="34260259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:22:33 -0800
X-CSE-ConnectionGUID: uPzpZF4ISM+Yw70bZTAc3w==
X-CSE-MsgGUID: 7xVOV/cKQdaMko9TaGnOFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83867819"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:22:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:22:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:22:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+w8rQksuSHfkNMKdS9Irj/jcr2yKS1uPfD6snLHi+6y1c6VjD8rnpKnBiyiFwqLMJVmGe2QD4N+aOci070enJoJ2Z7Q1vDSmPxB3o/t8RoUaLKkGtPDLFdaxAgW4ssnjj7+yfirI7ru4H1w+beW2bWkqRx47pnE7wGTcGonF+haPqTQMk8HHGPVPAo5C43PEbDp+N7SDU0cuvzwmFuuV+0YN4CKQyikT68feojdHcLmZGK5E4WDpQjU9ZC3OYrhte5J7aiWqAZfXZ/NBjqBqzg0V2FRCYEsqTqSkFogelNUaNduPfcwVUSsc1PZEMt8kOFNT8qt9+J3RqVmDqJBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOwo0brVllK1fULWnmAGsd7YRnixMybsjk7QKmNKwV4=;
 b=fvSxJWD/eCRUeaf86CMx6aSRHXDypdHiASgLG/X4WZvR+smgb2dEe0vK2Mc7O/kwuoeq2nS+ZEok7ri/9gJNAQLqTQGjXNJlqB28Q8vlXNrJB9ATuRf+qBE36nYE3Q6mnhjUeqMzhKJUYt8y9UU/UmNKf00kgbeFeJaa2yOFx9s0nlnVj5WC6p6WkvxbahkknK2Zj76Ax6mN1jOxXjOFP61ek8ZEN7M+qzycJhj91X/EOtcH7Eun3SliEuIvp5Zz2hnA/CaFQKUq6c3P0Z2D7QNi0RDyxMMQSC+Z/4v03IIiYB/FCmhOjy8e/nXxsIuTgtywVNeQAExYsqakcm/n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:22:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 21:22:27 +0000
Date: Mon, 4 Nov 2024 16:22:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/10] drm/xe/nvm: add on-die non-volatile memory device
Message-ID: <Zyk7DOdTiYpeWb-7@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-10-alexander.usyskin@intel.com>
 <Zx-kUAlr0CVVtJXT@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zx-kUAlr0CVVtJXT@intel.com>
X-ClientProxiedBy: MW2PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:302:1::43) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a23b82-ba45-47fe-6ed3-08dcfd16c81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zr3QwsKkWWb/cWzrvcHiBCs3/CvNakwKmLVWHBl3lfuMe5DhNOkw+sJE8Sq?=
 =?us-ascii?Q?88Ns17z21jO1KqpPkmXgqWgcbfuVL8zZF8W6XlqRQSWAPQtzYm51hUFADTfN?=
 =?us-ascii?Q?3EnCRklcPtlDoMan1tDDyLMS0uyMWw3GZzrL0dz1BeJoZbW3oA3lknZS3aLH?=
 =?us-ascii?Q?UinUN+kYi/HXYzkmSd7uEh+dWfI3HeJSelK2gRlPSDaroGeTZ2lyCdgzH+FA?=
 =?us-ascii?Q?caMoMO2bntzAIf/FG+gG6jM6tfeR2UV4TLgMM4BLRvbwxi8Lv7Xxnlp+584N?=
 =?us-ascii?Q?d0ZWdvdJCQSpNg1UeRv7tr6arQyNnwIOod5lzIlzgi2DppgIRLsBR3sCsT1G?=
 =?us-ascii?Q?Iolu/eWkU5egX7+MoNBuSAZ1/Re5UwEDKfHj6OilGQTe4YSInvUUwk/hUbpX?=
 =?us-ascii?Q?U2wb44Shaon2jIT/vsyjREz15uus+nY6PDYr/RA7ZfBpq6kccRlw6jIghAvo?=
 =?us-ascii?Q?dDiXlipQIvf4wcTbsrEL5DSP8wvhp/bzi2oVVyWBobx9nFA3f76aQqNT/m2b?=
 =?us-ascii?Q?4QKdOhiJqDdisX481isD5qKjlli79Bkcwd+bYXr0sB607Uxr8xRm8X6Z9Rb9?=
 =?us-ascii?Q?3EGu/riQYPoOSkvcxNhh0raGY6p7V+BKLCPVVoR3KlVZWZ8kZdKgXIijoGAZ?=
 =?us-ascii?Q?561Emuq3W8vpy2LjTACpZOshl+yzTSBurZ9+Tb91FdtPwOlCyfw3geo2w6le?=
 =?us-ascii?Q?1rhZ47lcfQ+tR0QoysIgyptIhqkzKaT9awZ1+LSGScJ5lRyoKErfYkc5AVY2?=
 =?us-ascii?Q?4SE9rbywT6QDxHY8PAGoh4Uk9cLTvq9FgDng3Yg0yOcx+5WBKsJbio0FUmWb?=
 =?us-ascii?Q?X0zr7cSjQlE3Vr9B6zxQc7xkneljAiwRwBaBYlFXiuuYQNktpgRlN0c8it+b?=
 =?us-ascii?Q?c1BjVxjpc/DgHgAQPc3UXyKXA3DdQc9Jxe3vczb7p/oyuHHDhoGXWHDc8T6Q?=
 =?us-ascii?Q?NI3JpkcuE2kdKmgRnEKpwhD/25gCnTqWTgyPsXecicoPRO8aInvRKHgoiaFQ?=
 =?us-ascii?Q?G2WCkD00/O/CKb7nGwr+dhSIwg8wXEjqYmFDx/MXwz9EIgVQlimjcKNzh/jb?=
 =?us-ascii?Q?gmWf+8+WhqlXwf1vK/dIAuZGwVkdfFmFDp65k99pBM5VpUT+sPOQOPT6Sh0F?=
 =?us-ascii?Q?Z01r0SaGu/H7bOGzBFz5F3RKRVZKOTZxVnRWDWtGWDSQtHITDrChUGwVKmUP?=
 =?us-ascii?Q?AVzU2soKlhy3hekctvsW/npqY2qsYX4DqHivoypUAodYVbBS9Nnj3KnIvjZo?=
 =?us-ascii?Q?X/IoWj9ohqJEbqrRAcZc5nM8j3kS+8Nsd+BMOY6b4lyiz4iEGFmy+RLtr+ij?=
 =?us-ascii?Q?9dw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NvNuPKFGbLRjAerlrYVSsq2dYbCgi3kjkcPjSdkRv504b3R9iH3CBgTvfn0a?=
 =?us-ascii?Q?mxWdOFapsH7Jab8p5hu8VeZnnstypYyddTmuEWhqPzEQhUBdvLZ8t3pvKN5w?=
 =?us-ascii?Q?bHrx64eSC3yEaCp8VTU4kFbOoWuusr3eHbRFZoP2zCWizP8gDIopZsIu8u7f?=
 =?us-ascii?Q?nGCH13ap0NiqUNbODboIYihvm641hD2smOMz9UVyi01pe1OYMXVVK2xxTSH6?=
 =?us-ascii?Q?L9yGRr8U5OU0SUiGuOyp473/a8WgVzWklxqI1UVZUhxsHqJKMjilSllkOJXE?=
 =?us-ascii?Q?kKwsSxF7vfi22LtO1OZ8YR/PPNFU4eJ7aCrcxv4GhIqqWkMgLQn9yT3Wq+GY?=
 =?us-ascii?Q?oiCeO506U5/SsXW7egFHamCJWFf/8J8dYMGRR9YVvrYwdvi95YFrh9DUa8sb?=
 =?us-ascii?Q?VsdrQqDut4wWXb8WOxEk/8vqsXzTdnsObH5zlq1B4EWndsUjs8dqOCAzJ/V8?=
 =?us-ascii?Q?8YMgyNcoUNkSc+btqqSz8ke6Ta/RNYUhpiAPgiQSFY99C9IUpYcWTqzJbejv?=
 =?us-ascii?Q?0Ln/weBb9hBVnntSoLb1GKyq02EmJLUZFv/FDfv4Yhjj3R31lpVvcumuEuDx?=
 =?us-ascii?Q?K96i7A3NpxQ3MJ0ncGsuZldzZlXGyC/+UVumNwjAegoiJLAAji1MRUwrbJ4i?=
 =?us-ascii?Q?8r/ZkLo+a+0K1cot5gtJhwEyj6PANJez0D/IhEBOl2EXwiVWsQDavPU/D9Jm?=
 =?us-ascii?Q?LmVXy1/Am1xo3XNR+4wOa5yOgdUk420Cgp2Xq9E12Dk8vHlQ96ChuoNJEXWv?=
 =?us-ascii?Q?P29z/DgyxI2jZ3wo5PFgpYOJHqTL+zFTB/IXBGfwkzTTLoXcipG/nSmyEgSm?=
 =?us-ascii?Q?QnIc2aeKPifDfbWrvwXfSlxWq+b8DmrJiWA08MYP1bNRO86/7SHuuKjk9Mxg?=
 =?us-ascii?Q?zIWpbVRl38uKsl6x7HCBjvisUqBUbtZAAfeqGD10HeXfGQmabrYoi3zNPSqO?=
 =?us-ascii?Q?F5Ry7YdbzwsNp+OsbN7SE5S6/qdlGPUCX3ByPIByEg+5+o+jFflbwnJ8dFtc?=
 =?us-ascii?Q?lO40aMYCpd+T8cQ327iLWhKd046FbLGYLaAltZW6c6t5rSRQf5E/ddkW9WXi?=
 =?us-ascii?Q?TvQ6TQeihlcWJN+pzl8KSVhsmA807VbBccXpuoqrEwI1lXpxWji3oxleKTLg?=
 =?us-ascii?Q?IFxZsdk+Gk/aPKq0CfbQDTM7KidngXfolbaBUf92FghKrKx/Mkhb/qgcIum+?=
 =?us-ascii?Q?htTSPnrnVYcwO846s/pA4T7FOkv7nv5zcVWQnswWjxHiGAppNLQAVeXZHXOH?=
 =?us-ascii?Q?lvahUkGk4iPl5/8TMlVnvHFnga+pw1ghHJX8vfywMQ+4l5yPxaF118dhidBl?=
 =?us-ascii?Q?7jz/ZGfcPb6mVJpa9ST4nQgFM8ij17dJ5pJAXJGUvO/C4EEbGb6Ziv4pA8bF?=
 =?us-ascii?Q?Bzfky2An6hMelgLD/oYvhyyNK8JE+kqiRCnQgDK4AMEYnZwOJwKmGX6AB8Oi?=
 =?us-ascii?Q?C2UH0kpG3m2tMVcq5MIXLQfi7Q2DiM9JgAGi0997f/bO0CKyKQ3mlSz2RnlN?=
 =?us-ascii?Q?I+Crnfs4FU0R86KvHGNKlk+Ek23BZJbdsjAER0iXW4FrerzGcrOo6mjbgJYL?=
 =?us-ascii?Q?3FB9+mfYfRMRbqelBs6nRDwEShpnxQJnWMlTqr7JXx7t+N9eMY5h/3D9WGZw?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a23b82-ba45-47fe-6ed3-08dcfd16c81f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:22:27.1955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiWJpbYhFKq6zTaO8UINDC0HuQbbjlZsATGwJu9vev8+IG+lUyQzUk5Rev2Ao3hPV2ivK1cWPGJtEbp02Z/PqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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

On Mon, Oct 28, 2024 at 10:48:48AM -0400, Rodrigo Vivi wrote:
> On Tue, Oct 22, 2024 at 01:41:18PM +0300, Alexander Usyskin wrote:
> > Enable access to internal non-volatile memory on DGFX
> > with GSC/CSC devices via a child device.
> > The nvm child device is exposed via auxiliary bus.
> 
> I looked at all of the i915 and xe patches here and everything looks right.
> Just a few common doubts before I put my rv-b here below...
> 
> 
> Starting with the one from the other patch. Could you please share some doc
> where I could confirm
> HECI_FW_STATUS_2_NVM_ACCESS_MODE bit?
> 
> more below...
> 
> > 
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile          |   1 +
> >  drivers/gpu/drm/xe/xe_device.c       |   3 +
> >  drivers/gpu/drm/xe/xe_device_types.h |   8 +++
> >  drivers/gpu/drm/xe/xe_nvm.c          | 100 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
> >  drivers/gpu/drm/xe/xe_pci.c          |   5 ++
> >  6 files changed, 132 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index cb6c625bdef0..4225a654a937 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -94,6 +94,7 @@ xe-y += xe_bb.o \
> >  	xe_ring_ops.o \
> >  	xe_sa.o \
> >  	xe_sched_job.o \
> > +	xe_nvm.o \
> >  	xe_step.o \
> >  	xe_sync.o \
> >  	xe_tile.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 962751c966d1..844697f79eee 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -49,6 +49,7 @@
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> >  #include "xe_query.h"
> > +#include "xe_nvm.h"
> >  #include "xe_sriov.h"
> >  #include "xe_tile.h"
> >  #include "xe_ttm_stolen_mgr.h"
> > @@ -743,6 +744,7 @@ int xe_device_probe(struct xe_device *xe)
> >  			goto err_fini_gt;
> >  	}
> >  
> > +	xe_nvm_init(xe);
> >  	xe_heci_gsc_init(xe);
> >  
> >  	err = xe_oa_init(xe);
> > @@ -811,6 +813,7 @@ void xe_device_remove(struct xe_device *xe)
> >  	xe_oa_fini(xe);
> >  
> >  	xe_heci_gsc_fini(xe);
> > +	xe_nvm_fini(xe);
> >  
> >  	for_each_gt(gt, xe, id)
> >  		xe_gt_remove(gt);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 85bede4dd646..ec3d82f05519 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -35,6 +35,8 @@
> >  struct xe_ggtt;
> >  struct xe_pat_ops;
> >  
> > +struct intel_dg_nvm_dev;
> > +
> >  #define XE_BO_INVALID_OFFSET	LONG_MAX
> >  
> >  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> > @@ -44,6 +46,7 @@ struct xe_pat_ops;
> >  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
> >  #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
> >  #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
> > +#define HAS_GSC_NVM(xe) ((xe)->info.has_gsc_nvm)
> >  
> >  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
> >  
> > @@ -331,6 +334,8 @@ struct xe_device {
> >  		u8 has_heci_gscfi:1;
> >  		/** @info.has_heci_cscfi: device has heci cscfi */
> >  		u8 has_heci_cscfi:1;
> > +		/** @info.has_gsc_nvm: device has gsc non-volatile memory */
> > +		u8 has_gsc_nvm:1;
> >  		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> >  		u8 skip_guc_pc:1;
> >  		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> > @@ -502,6 +507,9 @@ struct xe_device {
> >  	/** @heci_gsc: graphics security controller */
> >  	struct xe_heci_gsc heci_gsc;
> >  
> > +	/** @nvm: discrete graphics non-volatile memory */
> > +	struct intel_dg_nvm_dev *nvm;
> > +
> >  	/** @oa: oa observation subsystem */
> >  	struct xe_oa oa;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> > new file mode 100644
> > index 000000000000..ce56bff1268b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_nvm.c
> > @@ -0,0 +1,100 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> > + */
> > +
> > +#include <linux/intel_dg_nvm_aux.h>
> > +#include <linux/pci.h>
> > +#include "xe_device_types.h"
> > +#include "xe_nvm.h"
> > +#include "xe_sriov.h"
> > +
> > +#define GEN12_GUNIT_NVM_BASE 0x00102040
> > +#define GEN12_GUNIT_NVM_SIZE 0x80
> > +#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
> > +
> > +static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
> > +	[0] = { .name = "DESCRIPTOR", },
> > +	[2] = { .name = "GSC", },
> > +	[11] = { .name = "OptionROM", },
> > +	[12] = { .name = "DAM", },
> 
> Could you please give some pointers to confirm this base and these regions?
> 
> > +};
> > +
> > +static void xe_nvm_release_dev(struct device *dev)
> > +{
> > +}
> > +
> > +void xe_nvm_init(struct xe_device *xe)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct intel_dg_nvm_dev *nvm;
> > +	struct auxiliary_device *aux_dev;
> > +	int ret;
> > +
> > +	if (!HAS_GSC_NVM(xe))
> > +		return;
> > +
> > +	/* No access to internal NVM from VFs */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> > +	/* Nvm pointer should be NULL here */
> > +	if (WARN_ON(xe->nvm))
> > +		return;
> > +
> > +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> > +	if (!xe->nvm)
> > +		return;
> > +
> > +	nvm = xe->nvm;
> > +
> > +	nvm->writeable_override = false;
> > +	nvm->bar.parent = &pdev->resource[0];
> > +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> > +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> > +	nvm->bar.flags = IORESOURCE_MEM;
> > +	nvm->bar.desc = IORES_DESC_NONE;
> > +	nvm->regions = regions;
> > +
> > +	aux_dev = &nvm->aux_dev;
> > +
> > +	aux_dev->name = "nvm";
> > +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> > +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> > +	aux_dev->dev.parent = &pdev->dev;
> > +	aux_dev->dev.release = xe_nvm_release_dev;
> > +
> > +	ret = auxiliary_device_init(aux_dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "xe-nvm aux init failed %d\n", ret);
> 
> Since these are inside the i915 and xe and you have our drm private device,
> I believe it would be better if we would use the drm_err and other drm debug
> variants here, below and also in the i915 patch.

Thanks for the confirmation of the offsets and regions.
With these dev_err changed towards the drm_err, feel free to use

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thank you so much,
> Rodrigo.
> 
> > +		return;
> > +	}
> > +
> > +	ret = auxiliary_device_add(aux_dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "xe-nvm aux add failed %d\n", ret);
> > +		auxiliary_device_uninit(aux_dev);
> > +		return;
> > +	}
> > +}
> > +
> > +void xe_nvm_fini(struct xe_device *xe)
> > +{
> > +	struct intel_dg_nvm_dev *nvm = xe->nvm;
> > +
> > +	if (!HAS_GSC_NVM(xe))
> > +		return;
> > +
> > +	/* No access to internal NVM from VFs */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> > +	/* Nvm pointer should not be NULL here */
> > +	if (WARN_ON(!nvm))
> > +		return;
> > +
> > +	auxiliary_device_delete(&nvm->aux_dev);
> > +	auxiliary_device_uninit(&nvm->aux_dev);
> > +	kfree(nvm);
> > +	xe->nvm = NULL;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> > new file mode 100644
> > index 000000000000..068695447913
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_nvm.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#ifndef __XE_NVM_H__
> > +#define __XE_NVM_H__
> > +
> > +struct xe_device;
> > +
> > +void xe_nvm_init(struct xe_device *xe);
> > +
> > +void xe_nvm_fini(struct xe_device *xe);
> > +
> > +#endif /* __XE_NVM_H__ */
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 64a8336ca437..85c419eea710 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -60,6 +60,7 @@ struct xe_device_desc {
> >  	u8 has_display:1;
> >  	u8 has_heci_gscfi:1;
> >  	u8 has_heci_cscfi:1;
> > +	u8 has_gsc_nvm:1;
> >  	u8 has_llc:1;
> >  	u8 has_mmio_ext:1;
> >  	u8 has_sriov:1;
> > @@ -282,6 +283,7 @@ static const struct xe_device_desc dg1_desc = {
> >  	PLATFORM(DG1),
> >  	.has_display = true,
> >  	.has_heci_gscfi = 1,
> > +	.has_gsc_nvm = 1,
> >  	.require_force_probe = true,
> >  };
> >  
> > @@ -293,6 +295,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
> >  	DGFX_FEATURES, \
> >  	PLATFORM(DG2), \
> >  	.has_heci_gscfi = 1, \
> > +	.has_gsc_nvm = 1, \
> >  	.subplatforms = (const struct xe_subplatform_desc[]) { \
> >  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
> >  		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> > @@ -324,6 +327,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
> >  	PLATFORM(PVC),
> >  	.has_display = false,
> >  	.has_heci_gscfi = 1,
> > +	.has_gsc_nvm = 1,
> >  	.require_force_probe = true,
> >  };
> >  
> > @@ -623,6 +627,7 @@ static int xe_info_init_early(struct xe_device *xe,
> >  	xe->info.is_dgfx = desc->is_dgfx;
> >  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> >  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> > +	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
> >  	xe->info.has_llc = desc->has_llc;
> >  	xe->info.has_mmio_ext = desc->has_mmio_ext;
> >  	xe->info.has_sriov = desc->has_sriov;
> > -- 
> > 2.43.0
> > 
