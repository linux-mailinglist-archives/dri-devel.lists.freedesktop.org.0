Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25543AC7F9E
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 16:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C5310E211;
	Thu, 29 May 2025 14:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9toTYiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3174010E727;
 Thu, 29 May 2025 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528687; x=1780064687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DFSJ8/MtZuM3cT77su6tFHvuUbs1YQFoPvCfRRyEEfM=;
 b=b9toTYiqgdmLWYDSZ8yWfIuSyTQ4Ea+5tBBj0y5+HH1Ha1OKikCA49Mg
 s2THvS/VRYR2XsyYDpcbwgmZFrgt3s7z5ujc0fIAlGTt4xVdS6U26dT5a
 GgZ45nReZFXKx2jPevGXzxPYMSsk4Ic7d/7UyUGwjghzakuUh7b8ZlohG
 sh8ZEicqnR+8DkhcIO6Jk/bu5gw8GuyBafw2+z/Yb62c81oxlPdagpf1a
 yYz4QqoeM7DtTCILCsl3rhxgSHPNO1RoYdisP60IjfbYPMX205aKkp3Kw
 nlUwvfgv3agShLYGn8nmZtLcu+sQnB930UwI5+TJQAQuzs+NT3ajg7lCq w==;
X-CSE-ConnectionGUID: cvFlOh4DTkqjs4ANrEoTCQ==
X-CSE-MsgGUID: Mvf+yvZDQgWW36tRQFeW5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61227851"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="61227851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:24:46 -0700
X-CSE-ConnectionGUID: jCCrgA9sTMmJ5bwMYYL8mQ==
X-CSE-MsgGUID: DMs5YBoASoa+3nE8bnIiyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148734363"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:24:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 07:24:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 07:24:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 07:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1NlxdyeBeWBQGwy/+7uro4KU0n/jvV5jnJ+UlnfVChINZ/aKM74XGVo5qgPS75i7KZkvhuCpbOfn3Z/HY3RuYTjHjUUxitcBoepQON8xzDRKZMgbKhaDNOfGcim8LAr6UsfwKUq92OwyMXCYXFN6vl5s5L9bJm3b6MFfoowNH74kQRBUXZL4qcUgRM1rKfrM+Ra4Hzf348AIFKyXRaLyfcMvd6XYl9oKkFytTAmOArdnTXDMjvPR3AC2eN5HQd55cfiHapXOv3F4IO7EsfHomMKpvoaVPppr2Ed9Wkql5OIGhUhWhAYf4zL71p6Gec4rHrpLmTmL0zLc06IPJGrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2a3IdK2bWAGw3UGB51VIt51VbaMBv7nAps5N0DRBy8=;
 b=XWtQ1LAqWmDNAcMZLWxm2NOsEdi4qx2HaaPIG8Robz5LDiLeK3Qb6EQCdHzh2PMw9TYtRD/Yoopq6Y5Vfi+XguLqgsRPVSt7na33fwtoKv7XjInvxGfJ5hkhS5/Ko3GR0KD1IiyWgF5uh3cRNd1Tzj5Soh8Jkw04lQNX+lt7xDLJ44ryN+tbvnuOP75A9t+m6oPPeP1Z1Z6Ig4Rd0fVvrdAOWa7sAcPlGjW954BYEIYUL8VeZyTGlgelYIggry+E65wzfRlkn82TqqFochYQIn9bOYJPRfdlZfmdFtFZuUzBd1z2pA7HoZfoXNQ0jSyY6O3cxU6mYFoXwEl5/7t1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Thu, 29 May
 2025 14:24:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 14:24:43 +0000
Date: Thu, 29 May 2025 09:24:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/xe: Fix NPD when saving default context
Message-ID: <2iv6a4xcjy2gxrjzsevvvn6qa5eabmzs75zesk2cazm4vqy4am@3hm7vn4xintk>
References: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
 <SJ1PR11MB6204E74753DAFAC2B34C8DCF8166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204E74753DAFAC2B34C8DCF8166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: d61bc2ad-a3dc-45ae-04ef-08dd9ebc8dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJ8DCY5+fv4603pMz+FZ4eMO2vumwws3Lgv/+llFeY+sT3qwa7Ce/0TCzFyA?=
 =?us-ascii?Q?ZQ/2W31eZpERhJz+rzTS5fSjB7ZfxRLd4pzvqocJiVYk4UKX0B3IT95u9isV?=
 =?us-ascii?Q?1MWC1wz+l3uS1+ujlxLPjAkSeZsBJ5Do8bCNF8j/AwGzNQCXpVrVvJzr5o5r?=
 =?us-ascii?Q?kNHSm7ehKIQdgQhn2h5ye4eFnyU/6PiKRfUXOe9igm6QaE7ry8TdhKeoMgF4?=
 =?us-ascii?Q?08/FdPqmbTTl7bjdO3HCRilkELlbiZdz3ZXJR9kLKWNDAjBl18R5qRY94XF3?=
 =?us-ascii?Q?582Qd5ijOLed7UjCB8VQw/B7SB0LR4k7KO9ToeNGtEQAwukJnNjkjSbuE447?=
 =?us-ascii?Q?K87IzqVfGytN5mcuGeO3bbjncSawUHjq/DKcRZEwXFpi4ykqqxp+vRAnKkaU?=
 =?us-ascii?Q?N/R1Cd8LnwX+CCbecHmSyeu6Ymk9BEkvllK/Clb5WOzCsl8cr9F1NI3TUKPs?=
 =?us-ascii?Q?9mDsFq9gCzxvzZ3afE0BrAE+MoSBusAZJ9SQAoskXfGROV4x37FfHqqjRAEJ?=
 =?us-ascii?Q?jA9KAdHewmqC37j1PEhOrS4TobvajQ8REvhGP4RrJxgu97yS2vl9+UW3ibYT?=
 =?us-ascii?Q?H7gJ4Os8r62vqbS8EObxcih6SLGgE35NxBRUykBucb7LOueALILRpHyu9ZMD?=
 =?us-ascii?Q?cKi5/Z9muTSaOhksOgzmjIJCRenb+2fafQMRWk4VwYhUQ/wx0GGBRYTwib6G?=
 =?us-ascii?Q?y7w25i5vumdBQJGHGVm7id1ktWeQDcbVXqZSsjNSGceuC9FcdGUyNJW/ZSf3?=
 =?us-ascii?Q?PiTg05SP4v5CbfRY5ONkve6XuIy9dJy+a5eSlzd3J83dweRGa15dXOR1cOUu?=
 =?us-ascii?Q?+A2vnlvNkMM1tnigLHmyleWRMa3Vich7OvbNtghdgTdyDjUcfYjA43HfGo9v?=
 =?us-ascii?Q?V5O1ecqs99r4/Mg0MKs5uqmnL62MuSCSX1lXR1JPvbBNK5WNsEIfEiSQfxeV?=
 =?us-ascii?Q?Vp1vdxfT4gEHpbamDv7VoF6RxNg1O+XEK8G/vQjT3U6ODLuNF3jvIeyKLN90?=
 =?us-ascii?Q?yCx6uovfWHb7QS+hKYBh/23Xoph0KT2LtZPpHgl5dxFrbadTMHrw79rEbYiB?=
 =?us-ascii?Q?OKQRu9KntFHCg+oZwwjJxnRyNYQ//eD+NinozvDEsYNcGvG2tBsOxjMrkwTu?=
 =?us-ascii?Q?8vVSR2shBy5x1gBEHT+rnuO0I2f/LNTofIyyXm0kjqeHXsZpx6Thdk9pIbja?=
 =?us-ascii?Q?ekH8J8X2B9MF3V2fnaBDu4Xkr6XBUBkQvZ+tF+IiPN/gMwp1YoCG/zFo3d17?=
 =?us-ascii?Q?H1AyoIMRwcjQ6hv34ceJ8zsDhNSYNZBRMykNxPbbjn/gLRfhCIfm1sLOL12V?=
 =?us-ascii?Q?lLUJz58wYpjBqwgxFMnp89bT+F+37vILVmiEnxks3aAa+/PTnrA+ckBDFCjB?=
 =?us-ascii?Q?Jiw1uhsijrv3Y5E2xq8ta8YmYeju6zRtwvImcXMyeZm9EY+B5mC2Y6jDVZnK?=
 =?us-ascii?Q?HcpPq/4mPzI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOW8HNLqdjvSuB/AYNgo18rOu4f/lmFB21djsWSwZhDfbFKTwDnoxl91spDL?=
 =?us-ascii?Q?aPARkolkKwgzafpuXnKE71d6rlpRU64o5UC+KNXkoHIH5u3ib/m3PCr7yeh6?=
 =?us-ascii?Q?GG1BTvJcA5lJjFEbmUABJzBwBqseeX/ldfoXX86r0btUsvmtrSjppNHzje5e?=
 =?us-ascii?Q?Tw7OXjxB0XkcYTDlgr/IGUN5LKYO3K0h0gSIFfBaXHHcUWRTGcZO7xjetqmk?=
 =?us-ascii?Q?pbNsrGznlL7L2p9jEw86gr+knohhORjMawmvxnDJJa1C6yutHekOEXITXx/j?=
 =?us-ascii?Q?qWXPWZZcli/omThwXcLE28e3ojUJ/doZ3ZJIPVbXNXLRUvQe3FFNsXUq+Fvy?=
 =?us-ascii?Q?WlS2EE5jB+CxnyycBzrPFRLMYvttVYmMQ6BBiS6qhMr1LGA0kEcIvePkkBYK?=
 =?us-ascii?Q?jw1vYgwP20f2rEdqTHA3caw3A+Yc81LErL6IFqh595uhM3ivoV3tQ0ZICqM/?=
 =?us-ascii?Q?/EFDv7mIM3hrVy8ffjQ65lzexRFa9zX4DXp+5g7NUL7MyHFHDbe8UW2nCNNt?=
 =?us-ascii?Q?27lmqt4EgcflLwluRxRW8AJjkx85op59ioW36XE/pbQZnpKL8luREzGRC+57?=
 =?us-ascii?Q?DtjS+CgHY+Iyz3T3x+BRLjytIE9qlRf8LmjEaRqGyzkQ1r0QSiqAAjzlp727?=
 =?us-ascii?Q?OODZ6I4qajX4EI7Q0qXSX+K0kwwdeLQAxK4qEsIoh9I2SN/RjFUwM7tSp9KY?=
 =?us-ascii?Q?VFhUXDVT/7aV/jPKy0NK8IMRa1qCS/ulouHs/I6CqqI8Opdbo5U1Fzqu2VT9?=
 =?us-ascii?Q?aIkrB9Deq36FunlmpCm20AhxwA8i5EirlP3TcylNMj8/uqHRhQagxA6cKxSn?=
 =?us-ascii?Q?ARMeeSRvNmdM7HbyoTcWjmtj//Dsz2gRrFIhHSXvoZY3UoEvL3OTs5zviMJN?=
 =?us-ascii?Q?FlOb+UI9kVucp0fLArf+rY3rasdnR+PCZb/9/EYCKiAVShtwsSR7dfgaCWPn?=
 =?us-ascii?Q?MpBIJlloy3CaIfZpT15y1s9prcx959okz+dzXDIy4y4vXPrxobxd0K9iqEiC?=
 =?us-ascii?Q?UULmFavya42LmvA6zpcNneh35VNmGoJg2/8tk/82nUUnJCc5X/RZs55iTGEQ?=
 =?us-ascii?Q?loMJoELYpAOTko6j8Xs1eZNZfDag93AdlD+WRplqN8mWcPqJuE999z6Dkfzm?=
 =?us-ascii?Q?60UMOBeEN+HAleIYckClsvqFqLjdETd1PG3Rl1xPDgq0xxe5ia96i4jYM8Qx?=
 =?us-ascii?Q?mipONNi+NJjeyzdqc6AbWrjxkUh+aIs4E8DgWF/7fuhQAruB+XuXKy8COOPM?=
 =?us-ascii?Q?YIbOrLAaj9we1qTS5V38g+A09mwNfyr8ndNQFUpL6UUlxoAvmF+z3Dzy08ko?=
 =?us-ascii?Q?Z0RXGaJfhuaCp3dw1sXqSHKGGfctfebBnJjcApwZuhN6XhaEdX9lnElodl0I?=
 =?us-ascii?Q?H6XS2cvE9u+XS3/tma/Cf2NeKrA+35EiWIW0xpVOlkhMVhz5fp3474yZ9+iA?=
 =?us-ascii?Q?w+oFGM1X7y232DqpBoqwuBnGPqC0tusjgF4Box5shT91pr98XTzWU28alOsu?=
 =?us-ascii?Q?/sSvDc7KQMGpmCuCJOI4TEoM8LPeNdpiTOVKZiUuQmDT1ru961spzp8Ioh1S?=
 =?us-ascii?Q?FDhllaOsmF7fXQs1Hgqxc4MTsrNaQMkfaqyRlb7KMdOP3SdnsQEcqjSgNOxM?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d61bc2ad-a3dc-45ae-04ef-08dd9ebc8dc6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 14:24:43.0194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3u3oheouc+ibJKK3WaruYzLfMQEkN6U4ICyC3SmkH40esWYCyx/KaEVm0DZ4MeIiEqxzescZNPfmcSMVAV9yRgfGcRddWyYqS8jlvCPJr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
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

On Wed, May 28, 2025 at 11:55:03PM -0500, Upadhyay, Tejas wrote:
>> @@ -114,7 +114,7 @@ struct xe_sched_job *xe_sched_job_create(struct
>> xe_exec_queue *q,
>>  	xe_exec_queue_get(job->q);
>>
>>  	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
>> -				 q->xef->drm->client_id);
>> +				 q->xef ? q->xef->drm->client_id : 0);
>
>drm_sched_job_init() has only 4 args!

and the line above uses only 4.

Lucas De Marchi
