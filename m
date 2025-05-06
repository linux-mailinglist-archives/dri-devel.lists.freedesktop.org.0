Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD69AAB28B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 06:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8A310E09C;
	Tue,  6 May 2025 04:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EL9XWTyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ED410E09C;
 Tue,  6 May 2025 04:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746505455; x=1778041455;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zmCLlVFye3ZUGoVKpaigPADmu702moIhRYxI7P720Ds=;
 b=EL9XWTyJPpV6ChuGPJNIpAustx8N092XhizXkXYyqTgOhao889rOTsQD
 cUHEnlNwFWl891SRrc96oQeMtyD+7o7Z4+k4FmCX4RihE4Rg2MEMQbcF7
 /ae4ADyJdY7hVLDJX8pNTgOQAnHXNZOMDkhx5q3pLnmUPp5f1vqovhxGF
 BullMRly7u7Y3h1DR9Vr6K61CtxJDMpT/oLIBG5rl79EJgUmcc4gCpVS+
 Jywtn9RXLXEf4+veOFgzen05nKc+BM63VpVMnkw2+1T65UicPL1OZhSvw
 u1ShMHG0XsJPq5AzRHGoPW0OLJbaRuKQlh1+JOiViW4uHWwFXkLsBMhsT Q==;
X-CSE-ConnectionGUID: HRdiZ9wvSrqnMMEjsrLHUQ==
X-CSE-MsgGUID: +SwEKxjBRxifkxrXZRhLpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59504163"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="59504163"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 21:24:07 -0700
X-CSE-ConnectionGUID: 8pAB6CcIQM2IFCZE5j85WQ==
X-CSE-MsgGUID: nFiofjFrTcSO5W24MK983Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136001131"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 21:24:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 21:24:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 21:24:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 21:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zI/sEYQF1VyYD9GCGNaDMKTUuvlpr66ClRA5w9GHTNbjrw75q+zQcqXzuLU9cHem+fW2ScT4/B1bc4qqlGQkjHUye5FK88Ik3k/ix3du9DqcvJ2anW1pzdHk4NdAcxnK8UIiQ00sdTtI65DzuDRRDvtJoune4x+pF4O4Ohw4zVQq7XqiIMySLwQozkT8bLZnjliDBw0tAcMycsUb6byOCOkB7Mf6q0dn9Uh+L5g4pbqSiOht2C3ujf1BibY7T0fjEVsVrgDPrdeWezOitDdmOIP2quQrlSDMCXyGcYqOkcXBfqV3pFm/wQyFcp8hZU1LfFp+iEMgq2lusc3zolufUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUp7LvMqbA/nj0rrfxg6fKhOa/vpfs+w7++atNBTjtE=;
 b=fZPudPskObLs9LJVNuaDczDl8AubfP1CKWovJoCPopsYZ6vhbGqdpNRLRzItPBEpkaFivD5ePi0NiEvevrDSLaGEOBo+yJjBMCeuEz53xsF4Lc3D43oqFEU6C4PQmdq4Y3bqJjUZawHsNwV77kg8TWfBlcmXLE7d9oNRLwU3tz+Y1oTLgP+cgW7JCGpHsGKf2HQ7zbh72D5fp6P55Ysr945B8XRNWCVoXi+hSoCeHQkRHRcIZ9A2lvIbUlZuuuB8Co9iT6qCtHOJRr2tJcpwdzu6woh/VPnf6xKxRJsEHy7QtoKLSXx4ADM3JMtiKOqCquOg4Y5z884y08wpVO2zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7419.namprd11.prod.outlook.com (2603:10b6:806:34d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 04:23:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 04:23:45 +0000
Date: Mon, 5 May 2025 21:25:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona@ffwll.ch>, "Melissa Wen" <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 <kernel-dev@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_RUNNING to skip the
 reset
Message-ID: <aBmPJTwkyaQ0FTQN@lstrano-desk.jf.intel.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-7-ed0d6701a3fe@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-sched-skip-reset-v1-7-ed0d6701a3fe@igalia.com>
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: ed501e9c-62b8-4970-31f3-08dd8c55ca38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FjQjHR7FrWXwjQphPkSwua6VhXvLdPNEZCjVeLUC9SaqyrteBIQ9z8YpXx?=
 =?iso-8859-1?Q?s4+aiv/dhbs/jq31hyzI+I8iB0n5h9THuHTSUcNmY8Gn+DmuScHDM5IIP+?=
 =?iso-8859-1?Q?2YkO63xH4t5bETwCX7bmpzMXNEW4ZvLL3KmjzZS7Dchg4gMBDxSB9I0z89?=
 =?iso-8859-1?Q?RPrGdfQIKuT3sm7WPkOSqhx+oVGyK0V3IBC1lFAKhHV5L4ctipbdJfg+SL?=
 =?iso-8859-1?Q?XYy43fY0c1sDUAlcNeLPP+qboU6bbfC0myZ2DNBvZ9oA7GWFPAsCJe9eCh?=
 =?iso-8859-1?Q?5z0IelU9zzs8zGDXkEbisWkp1u/Aclu8N57qW4JHIxxOqgpK/QwexI6fZn?=
 =?iso-8859-1?Q?iweLa272sN1qoD//eLt53HD8yP4ZVcxI2zS43RVwv5DmpXzAHQ53atFwO2?=
 =?iso-8859-1?Q?nm2CrHU4uoZiuSF+xRTx4A8OQ6lkvRO3fPqdaofONDN1dzGohdHrPnkv2l?=
 =?iso-8859-1?Q?HgEIla/UhJx0FtcePFqQNxWJmLF77M4Uh3ycvP/YRDclioY5Jm+vLNLeK+?=
 =?iso-8859-1?Q?rbxFcf2ZrfWlYM21acxSA6uGVG/Tyf9pFe1d9+/gHaJON5aDcVCkUqFgVn?=
 =?iso-8859-1?Q?7XVxr3FCyDaHkLtkW2tfoGfHw/x30NcGmUHtHv6R7xNCHwK3+EI4nSrsnc?=
 =?iso-8859-1?Q?Na5mpJ58rGIDmPIJ9S4TzTk16AE5t1310j2faBBXW+2VBEnblb6O82X+NZ?=
 =?iso-8859-1?Q?EjUZiMNxAXe/MoeYbyKtvHWIexvvkfR8Jva/7XFsMqfVGosteD1veaPZMK?=
 =?iso-8859-1?Q?JMwKjBZUwWhSPu3/pvqaToh5TMqxszwKQblLXRxELvzvnRXqtbRwV0Zizb?=
 =?iso-8859-1?Q?DAm+ZbXLO8fYCUXKGgs/qcd5xiN0xCoHY6cYaNYl6UklD+VI178ULn6o0z?=
 =?iso-8859-1?Q?tapo2er3fgPdGRQzc8eYVOJsf28DYZwmJHl+/dTjei1Crf5p6k1KwqBMNf?=
 =?iso-8859-1?Q?HuVCLEqXVhLxFNn/6fHFOl1oqXY1c3o/zoMzhUXrZ0j6O2MXnRnIwFrfjI?=
 =?iso-8859-1?Q?rhfo1NBg1N7qUHAiVuBGymq/Gf732c9h6IIWxdSoz82QOlIO5nR4RUxO67?=
 =?iso-8859-1?Q?HElhYrwUs7lV7f4ZD702C4Oe9zoRHjXuvxyh2mGXurDXiC+v3basEurMmo?=
 =?iso-8859-1?Q?8BdHz/8GaNpgvGT/OjMUa4vPqmW9aupF+UC/jfEkOUGBHnrUKtAlzQCiMk?=
 =?iso-8859-1?Q?xjMByWghu/qUzONUFhH98SJ7a7p3HbdGeqHd7CMiPCxfffVv0x+2MeI8Fr?=
 =?iso-8859-1?Q?bTbie9/EjQvuOVVC39E2m3WsUSWGRAWBUWMiOASa+J3C8qA+SKsrOt6pQr?=
 =?iso-8859-1?Q?STif8340uWR438tPRKKBHe60cM5E/bz+uNq23XbhMx/xjkJeqe24QKvJoR?=
 =?iso-8859-1?Q?1Xjon2rgYVEOj5to3OqazCEVK7DI7Tg1kZsubXw5x2FyhtcqanP7gtqkGw?=
 =?iso-8859-1?Q?Uh3ZLqdHa1S+h+Mv7vpmrgwPfrGz3fC/A+rbRGTOBY8iVpC2tVv6Q/xRqQ?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?otMqsKni/XvBI8ev+D2kpXf1xKZF3vDZ+w70eEsSdgN92AcTdwxQx6UAtg?=
 =?iso-8859-1?Q?2EFbRD/KpSErCp3WX3rfur6BcvjTkNwss/u0Ibw0eKY15u+z+M6BQ0Vy2I?=
 =?iso-8859-1?Q?4qVd45MSV19Eg7cg1kuY8hykSSvl85D2w5S6TPpXMb2idc4DSJL4Wdsfz2?=
 =?iso-8859-1?Q?3POI47Q24OQGinGw+X58gYs5XNxLj+jdcO31xNzEhQQS0weZjYSyFb7xzV?=
 =?iso-8859-1?Q?sMZLUdZpBNem7mN2mgCHkElAItnkm/4EZf6Zy/klYFS6G7SV8OLrXh35jA?=
 =?iso-8859-1?Q?Tpm2bKE5Bci/SOpbjx/hduXoKoVY4/hEf9fDwhrrG+7a0pk6Uv778Eks+E?=
 =?iso-8859-1?Q?/LjjWk24x+XO5EaXJ6MwkIyI8Ad3JihjgpZhbEG0YFPf9jWvWKSZOOyFkN?=
 =?iso-8859-1?Q?F7etLMg+KbNEJR6MtYA9vAKGvDkfLuNy6Xs0K4/4e4hQNsbJ1o/WIL0gnK?=
 =?iso-8859-1?Q?9pmbOlJeuVDTLpIfxWLhHFdVNhU4HBP3fcnPPMMcjozSS2XtYK8yeg1L6V?=
 =?iso-8859-1?Q?4BDJJYe9qEQAKOZ/9v947yk66gmFgdWZHBV8yMiQ9QVp2m3BOt2CWoDiS8?=
 =?iso-8859-1?Q?/nPQPuez3U+1shsKkbg9Ekl4M4ToYbXby30TKnuhvEDrJ+cnLZEU8UWR9P?=
 =?iso-8859-1?Q?Op81MBdwsDkdwunEObIKnWKY5bZLU/fwZ6C4x+BhIewj24CsS0MQYRNP/D?=
 =?iso-8859-1?Q?Sx8q6GV+G/NAnIVeP2//r4+16wTOfz4g/DnXWw0/BYbAq5X3P3o1pB0uY3?=
 =?iso-8859-1?Q?U+/PSNDFDsdg7oRL3Zz/6Dr+iYOFaRWO3WDzc7xRfCxwlMqUZoIoJpaJ2F?=
 =?iso-8859-1?Q?5AjLudKb/RiIQk42S3niXtgdQ20f+5KBoAmMf/G83vCwxH69I4Xw+M0vQo?=
 =?iso-8859-1?Q?QQe+ejeqpUj1ZNSvtGVU/WYr5YaPcyDP6urc35iMO1Tf7NIFsCVxOo9/0W?=
 =?iso-8859-1?Q?RENZ8espILqpgb4miecJgivUxQsvRDtVZ20PfP9OHEuIGdvpclaClmysNj?=
 =?iso-8859-1?Q?yqd+RTQOEvcZeJnO5fmhjCKt6DJ8T2qSECg1wdI5g06OFqEYkER36YPp5P?=
 =?iso-8859-1?Q?yCatpw5GqfhLa8tU8CdNHyomqtRDCp/Zx7b2LcZCHCBVoN3PDoegrnoZ+X?=
 =?iso-8859-1?Q?WwIqksbP6lbwp9HpyQqvlJYYHJIatQFkoznO74jGVnQGh/B41rD5nTgxXH?=
 =?iso-8859-1?Q?sR5Wm1qCM/aaxt9kEYhtRUssh65rmA9CzQXuZJd4iROBAaY8VH6yrJLyW3?=
 =?iso-8859-1?Q?Di6ABm1gHW5Y3YdTw2VpjCxBJN/WjmV3fcJoqp98jSCPKi6qltH7Mu3jUA?=
 =?iso-8859-1?Q?Cnp/JFFVTYGnJksDMkZc9ou6D5+cBeSY95aTFt1GTdcWdYvgns5btKgZo3?=
 =?iso-8859-1?Q?g3wHTmYBszN1rNSnoOBlG/MDd9IhaUjjC/Y/jEbTdUgEIa5LjGrsLCa7iz?=
 =?iso-8859-1?Q?5ZDkoh1DEiKWveeadhHHbfg8bv2vKpSjUKPiBC86JdCWZzBNMP+K+yvbI1?=
 =?iso-8859-1?Q?didFn516w//13t/JjlYOf45bCi9oOjAj2jdCilI+OhVOHD9tvQK1Xbo5Em?=
 =?iso-8859-1?Q?wsryu6zTrHxaLEcV6EWawVht+ChX7VwVoUXQrFyEMsszEI0ZXg7a49Rt/J?=
 =?iso-8859-1?Q?hSejaaDh9A1Tdjc4qz/gvpUIiYEhl69Y3PTJev2WCtn+kBAp10nUsWqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed501e9c-62b8-4970-31f3-08dd8c55ca38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 04:23:45.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLwj6Sdnx0YnwthuZEfMT5eTIIP8OubN92oAKmeHGHKHqljWTHNAXB67vYFkppQr/VpNjf1j/QeN4qlFdr0+Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7419
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

On Sat, May 03, 2025 at 05:59:58PM -0300, Maíra Canal wrote:
> Xe can skip the reset if TDR has fired before the free job worker. Instead
> of using the scheduler internals to add the job to the pending list, use
> the DRM_GPU_SCHED_STAT_RUNNING status to skip the reset and rearm the
> timer.
> 
> Note that there is no need to restart submission if it hasn't been
> stopped.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 31bc2022bfc2d80f0ef54726dfeb8d7f8e6b32c8..4c40d3921d4a5e190d3413736a68c6e7295223dd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1058,12 +1058,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * list so job can be freed and kick scheduler ensuring free job is not
>  	 * lost.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		xe_sched_add_pending_job(sched, job);
> -		xe_sched_submission_start(sched);
> -
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> -	}
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +		return DRM_GPU_SCHED_STAT_RUNNING;

There are a couple of other calls to xe_sched_add_pending_job in this
function which I can believe can be dropped in favor of return
DRM_GPU_SCHED_STAT_RUNNING too.

Matt 

>  
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
> 
> -- 
> 2.49.0
> 
