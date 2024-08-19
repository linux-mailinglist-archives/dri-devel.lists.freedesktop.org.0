Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B1956DBD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE17110E2AC;
	Mon, 19 Aug 2024 14:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXlROEiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184E110E2AC;
 Mon, 19 Aug 2024 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724078735; x=1755614735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G0fuFfhp4HPv2JVVm/NVL8AjtlrqN7nPR8dJWzUZdoI=;
 b=eXlROEiBmxGIUgiHhknzj0xmq+5D4CcxDEdJB/3YZ5EuVSYvSh974E5U
 TsnCpuxZz37QJfSyb8b0BZEJMsYWf6dbb+kT/PECR+TE3eDdz+/ftTop/
 gTvhZAm7z2lskQqX24iLtkBopaQPv+2EZHIH4gUuNXFr881PXCZSKuogE
 VSoWIsfTZb3bB3C4wE1HLNKUEi9ESuCX+/kfy5OwqUTdI06MPsa4YrHvi
 0xSkmDZH6nTE+kLd8/p61o1JhUPhQvaaPmWdwFkjB9ju/Qpo5uXmbGb0r
 09O24KN7ryLKTBcHXo0qPtL+b3Ura2laxb27EmeJ6Girw+D+CgUZtInYB w==;
X-CSE-ConnectionGUID: 7kNV2/7HSTe7S4OT7NvHKg==
X-CSE-MsgGUID: rytHIBFTSjGrjEvlgHpcmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33486218"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="33486218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 07:45:35 -0700
X-CSE-ConnectionGUID: 8Qf3uBxXQ8OmhkMefpb/jw==
X-CSE-MsgGUID: 22hOvIkOTnmDju3tp5JV7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60975077"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 07:45:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 07:45:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 07:45:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 07:45:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5IRyTk63z3Xb2W5ZJ4Ea1Uf4RpT0GWzOAMns1w4XKBggwSvama3GoG3suJxpK4BTpbun+YYuFDDlnytLXoCPPuMIOnN55yGsGzJ+Ug8/BhS8drsD6ts+EWl267GoaqFcytpJEPFpc2Cmxy+OO4dyNvSSGrsXd4dljYLrb4x9XZN7SPHavXiqJQwFYrfv3AQVwrrSLsZdV697pMFBVCUHlNuv8lx9Juh0QpdMS8ec4ImNzON2s/1jHKhAx/KFTqA+lEncCXxNygUknpBvfHMsyrjJS2GuQjNTDjbNmOuWqoCM2G+P7uB9RX76nBqgeDizPLwUQjtnxaSlptzEmAEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK4jhUbvzNdnL80imWUYd4MsJ3ij6Xm3um9s1vZn01s=;
 b=Qsaz4g/NJ2NgQUkGuRTF6Fma8lb6+TdWKncsX7RWR2K8OT2xKn7qldTP8GJjSl3ytN9JRtE2HPVqQHPsNziUk548g7xFzPh2LRRPeRoYtxROW4ZHbzFMhiNXbdJBuc/eqKTZIY6g/lVgUSSK20gJ5UT9S8AD0UT7jamqGBqs/OTexj+wOEpQ2Syf5NsLQoTkPqOgFkpChCKFZffcHHoD1vNhKuhLXasTPnDBWp/zLUhIjMNe+OQjVmLQ+uV6dDpi9s1C7W2OTkQDQvnD9uigqlqjHu4vi1Yt+k1V0BElleUdbW4VKxDp/jVNIOM6iRt5LMNc7EeE+0MFwv9DdOytzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 19 Aug
 2024 14:45:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 14:45:09 +0000
Date: Mon, 19 Aug 2024 10:45:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, <linux-kernel@vger.kernel.org>, 
 <sparclinux@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: Build regressions/improvements in v6.11-rc4
Message-ID: <ZsNackWx2hLdqspd@intel.com>
References: <CAHk-=wgP=qzODR60Xxzem5LQi6sH+6EFCDMOApAgBy37SQ59hA@mail.gmail.com>
 <20240819070639.2558629-1-geert@linux-m68k.org>
 <e43d6c-90df-32d2-c7ac-2991e8c5672f@linux-m68k.org>
 <r4lkavdietsete6kwxitnlmh3uvb3zhza3qulqedmvatfeckto@i4qfkfq5vf25>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <r4lkavdietsete6kwxitnlmh3uvb3zhza3qulqedmvatfeckto@i4qfkfq5vf25>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: ba459ce9-cfa3-497d-5bc3-08dcc05d85d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l98ZYPnQT7H2hm3I63ny04FjTksjsbjLNkentVjKAtXhrfhe9NDFoLyGKGqV?=
 =?us-ascii?Q?4UXvcBZMSu5uC5vypUGuS3OsZVTgec4lvQmv/PnafyI1Xc8u/Aot35GpODm6?=
 =?us-ascii?Q?FFiOC/nzMJNct+pLoRJipxaeoRMZxF7VYgrsBV9QFX7xi/K+GPoi3Vex+Q88?=
 =?us-ascii?Q?YAK5Tk6yzWJyMTUT6Tl9wGrxK9kotq9byylf+rtoCaK0rWJxr5FC6rRawcUn?=
 =?us-ascii?Q?AAYahJ4D3XDb0RVrhZWb8nIKER0F99TJTxfrrX9NLq05QdVQDIWpmP0ihxr6?=
 =?us-ascii?Q?9pm+jTnI5cpQHKArOH4PbXBQstPppC+YGh4SfeFuEsSz+vWToWXiH5N71ucr?=
 =?us-ascii?Q?P9N/alVjiJo+m6hmGlaZj55ac+yQdOJ9ditYl0Y30KbYa5SgePcY+unhYorI?=
 =?us-ascii?Q?nI8euoeqJ7taqNZbqfLwCC5Fk7NEj06WZlDggw+IQn0w9RxKijL3Suit2BFT?=
 =?us-ascii?Q?rdhuvQl2nEagcWaBf9OCo/gK3bZ0HaoN2b6C2A1sPZpQ0wyLo0Xrt8BEf6na?=
 =?us-ascii?Q?2Nkcup2hVUWDvv1qGhh+F4ZoHm932oqFqQujdaJUVMkHxR8jUh9sTmX6zNVW?=
 =?us-ascii?Q?5kLr6L8CVKLINcEFIPqWJ5VVDbsJIMf3acr061FCehYrLWcptz/P3acDdcau?=
 =?us-ascii?Q?1Y/pnTCg5+vqwp5S2nDrMONRZXAp4w/tTAnEG0ArGeJx9B9Pfk7Zh0bE2lHL?=
 =?us-ascii?Q?/dFw+8YU34t50AF5uH1+AmDXb8c3VWbnsYyYpZ6kAKdTt6utN4hwKpiOuG0E?=
 =?us-ascii?Q?Tt1Oe/3dbPJb5NaXcZZfqb6y2B5iQyETWiQlIF744F1Bps8Ea/S7Bu2jr+2X?=
 =?us-ascii?Q?GqeA8RAQpNsxeXks7VcgH3xg42cgSZI6HFmeaI9i/k6U0QxdKtdelN8XcKIz?=
 =?us-ascii?Q?l3KPyOzlWsJ5N2Klb79O/dYo+vJhpazdpUfIWBQRXgmlZarGL2vOWOjcn4qm?=
 =?us-ascii?Q?lCwszllyn13iR2O4cDkVNVjDfmypOQ0Xh8Fe8SVcdi4sW0HgGl27XxA+3Q5Y?=
 =?us-ascii?Q?8jxe1sa5zsEyeUJbzokqjR3IVuZD4e4o/0iWldaMeYoZSP+Khs1b89IsGSKr?=
 =?us-ascii?Q?xdYlDJZUajSJLjlECLcbkQHvN1aN0qJCRjk0Itkpjbd8FUAKGM90hhslCO1q?=
 =?us-ascii?Q?/OMUsempDvCcrgr/9SLkG5cJ2qHqWBAhDS8TDEPVkN5ffjhrwlQf4MY0Onmc?=
 =?us-ascii?Q?0oDfOyErvYzxI1P50BnYuOlX/xtaG1XhXzO1TKWW57m6H38tNpR9FuaI+TnP?=
 =?us-ascii?Q?x8oc5rhmSVGlq6z5Zie2/wCv7pp8WRk2FngrYXBDV2r0Ku9fXOu7sAhn7qc6?=
 =?us-ascii?Q?NcfIQTBoknzkPcyAyCkvC4LCcmnicdGmP41zlLgrpYwYQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Or6n/Ui87KEfnrS3Yt9bJZcZx6gXQndJysmcL688ZW/sovM0UBjkRBfzsZEa?=
 =?us-ascii?Q?EqhL2KEk1xO1Yi/36q0EqJ93Jp0Frn9/WpELTPuQRxGjcniKBLY31sQcRFwz?=
 =?us-ascii?Q?OE62i+Px6SnoUn7ECOTAIejukQkcni6XdUh/63d2iRIkmY6SRxp1c003FbHX?=
 =?us-ascii?Q?Ver4rs4oqwRV9SfDsGMLekZCblgnecYQWIHCBDE1nCjhMCcYLDQbU/Kgyjse?=
 =?us-ascii?Q?FZpx0mgjIOu+1Rs86i9/ULlf1k1s8Hf/qawq/hGpyAL0retc6a5cdM6TwtDY?=
 =?us-ascii?Q?fu+8s20SQ4hducPDVDv6+3HiNnh714kp7olIwITH0rlZr5qAccSJW+dhJPBt?=
 =?us-ascii?Q?cUmPEcEcakrLC5de3cok2FxyhOEg/GF6TBXVGRT6i7kkzJj9NXE3+RwR/TnK?=
 =?us-ascii?Q?Z25KS227w3k/s3NK/0m7LM+KWKxUocgC7O132+zuGZ92ePj1G7Yf+46m2G0x?=
 =?us-ascii?Q?ksWQIiAxAKQcybgdViETpstUdfzjQjSxOH4p7OkAP/9WBq3rG2L+zQ7Bn9Xs?=
 =?us-ascii?Q?3FGXdNFLf2mhHxtxApkwtb3UCytrZCMadgo9f7Cx9drDbzYCrEPWiSL9MCAH?=
 =?us-ascii?Q?mFN9de+lVUk6iXMBam1a+kICPl2gg1gl7LpJP/yWOaI98sEtanMPYz+BWlDd?=
 =?us-ascii?Q?tVfXtS8NZH4c8f3Nxovmemje8qbW3m7oplIvasa27x0LdKjmRy8sm/21gozo?=
 =?us-ascii?Q?MXQlCk+ZHc9W3A8k338sc7lCvo+jUytpDxiAlNh8ENjiuM+XiExd8iN1F649?=
 =?us-ascii?Q?aJ4bIBiwxKhCXJN76kVIcTw6PtW1bDxeTBivQ52G/c+egKdL1qTtPz4rRmOX?=
 =?us-ascii?Q?eYQzAx7bs4USa2KdQXJiFKm0zwFayAJzcM0tqt1giuxyTOFqEP4ZEhrefaNP?=
 =?us-ascii?Q?6/AzVZ/qQoPlKZ8t6SKpA3j7pbJJkuF68X9Vo9U1FGTzCXHekuVb4U63vyAL?=
 =?us-ascii?Q?nGvT3samngcV5dq68Edy89/JTi+4XcYr3rLuN7hWSYPgA9M8XnX4UIkyuczf?=
 =?us-ascii?Q?ulCTZvkjO91oEt+hojbVTNFHpyca5qCA1CEEwziu7MwUGN0MjlpyFOPthBmJ?=
 =?us-ascii?Q?CqkoJvJZjcWeTfxPboGmbir7rDWb0kV2SS98dzDjed0vUQpUcwQ2hfOu8Psl?=
 =?us-ascii?Q?IVuj5tPHPzHZeJ4GQn+sJkIcynFdygQfc+XRil3d9EOVrjgbo9sXhadgCAsk?=
 =?us-ascii?Q?8ViVmtgvwNJAB3rm1YYwi8YY5eEecA2LO6EXCqJrU4OyqmR6OKqf6ABBt3OW?=
 =?us-ascii?Q?+BOVnjCcc4JS3wGjMj9wA3FMZNh6ZpaKSnXYkabjwrWBKPjrfn28uLbZvqaL?=
 =?us-ascii?Q?a9kbcI6qpfNo9wp6XacoyujkOTEZ29WsHShvDw4yeWCidSzmf4JCJ6yYJ9Fl?=
 =?us-ascii?Q?awu8tha10QAJttzLu5bJHsyCY1TgP8RG/AEijqkVYxY93bCtPS0ej+U8+wc8?=
 =?us-ascii?Q?3dgsF28hlzVL0/2LQs1LLywCENW0AbSVEfobthoqghzIMBl7PuJMUM3ULHoE?=
 =?us-ascii?Q?lli8+Ep6twmbpnuN4zqyjuiQ5He4VvBM+V5df83Lx3PY2RSHO2GOoyqozugu?=
 =?us-ascii?Q?0keidWcG+2KGXGAuMMy9iKxYEMQZXdpomg0iFr9G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba459ce9-cfa3-497d-5bc3-08dcc05d85d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 14:45:09.3932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d92bz7t+7Z8osFfZaG5r6BQXrWMOXMysZ5Ue2ksxSfA2iTDRJBogtFxqhWN3laOTQvV+tUhUSzKLPWkue6vX2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
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

On Mon, Aug 19, 2024 at 08:22:13AM -0500, Lucas De Marchi wrote:
> On Mon, Aug 19, 2024 at 09:30:32AM GMT, Geert Uytterhoeven wrote:
> > On Mon, 19 Aug 2024, Geert Uytterhoeven wrote:
> > > JFYI, when comparing v6.11-rc4[1] to v6.11-rc3[3], the summaries are:
> > > - build errors: +6/-4
> > 
> >  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]:  => 254:1
> >  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]:  => 282:1
> >  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]:  => 307:1
> >  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]:  => 343:1
> > 
> > sparc64-gcc13/sparc64-allmodconfig
> > (pre-existing, but now emitted twice in this config only?)
> > 
> >  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_952' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
> >  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_953' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
> > 
> > powerpc-gcc5/powerpc-all{mod,yes}config
> > 
> > In function 'decode_oa_format.isra.26',
> >    inlined from 'xe_oa_set_prop_oa_format' at drivers/gpu/drm/xe/xe_oa.c:1664:6:
> > drivers/gpu/drm/xe/xe_oa.c:1573:18: note: in expansion of macro 'FIELD_GET'
> >  u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
> >                  ^
> > Seen before, patch available.
> 
> +Rodrigo
> 
> This patch needs to propagate to drm-xe-fixes:
> f2881dfdaaa9 ("drm/xe/oa/uapi: Make bit masks unsigned")

queued for 6.11-rc5, thanks

> 
> Lucas De Marchi
> 
> > 
> > Gr{oetje,eeting}s,
> > 
> > 						Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> > 							    - Linus Torvalds
