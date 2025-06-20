Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C947BAE1C89
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 15:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B9210EB6C;
	Fri, 20 Jun 2025 13:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buDtJ0jU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31F710EB65;
 Fri, 20 Jun 2025 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750427223; x=1781963223;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LOeFnrdmki8t6siazLG7+jdelwuSwl278H2IsbNuwug=;
 b=buDtJ0jU8v8r1mKog2wtT3Llt46J5Vr/4UMjci2qnGVPGwGiaY5pbmZS
 975yaKiJAAygfwUVoU+1tsF99qgYMpFnepk08WifxoKzQ7F0VjKr6u+D+
 z+icgx7ntR7E2vcHa57VQGg8JFzgLOf2qtGnZld++WzJJdYVUnNU7ymLx
 3jIWT3nJ7gwH5hO6u4YCpewhh+SJ6n12nVfwNOhJoctrJuAbOiEcTS+Ws
 wqOByw+oGixrgNT507ZRtcMxH9y1xYt1IEDySeC1SKygC37xml+c9FFEZ
 I4VlPwLMD/SnlIGxT9yMERrY7C0rAvc32d6+LtIelqKXZceLbPiaXqwvs A==;
X-CSE-ConnectionGUID: o2n/2BkfRjiXkshY5SlrnQ==
X-CSE-MsgGUID: pGLScUbWToe+iPihAlKJTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40300650"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="40300650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:47:02 -0700
X-CSE-ConnectionGUID: rCErfpqURq+sf6oHFmt1+w==
X-CSE-MsgGUID: IYWccTBGQHiNG6z50mH9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="156727218"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:47:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 06:47:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 06:47:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 06:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW6n6z3fl5drPq1tzxX1xt/AtAD0B+e2c6vj35SOx+Ba/CyxcOQwxEBmipAqI+QZ6z6hROGtYodZKg1ta1Jm4/BPXPUQkXA88kbmNlfVFF8FgnDxRvDKVXqbDnqQjMXW8IMdDPwZCxkKR8nWqkES+XxaXMNsK5brrO1hQ3XVIio8rJh9Z2NxRN+LMuR6r72rJCmOCS2VEOdkei0tFc+54HjToAblxKcfmt3EDrkdziLM/LZZpxcuGSeFVOjDaGoZjJ3wH2RjRHDDiAOxtd5XlQJ6Qiy7QO/5E2XW9Z7HiXngnW/0KqVXaZITTrLTucz4H2La4DyZE0lkAwi0+JevdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gubKrHJZ7Hdz2GXNItP04uKcfd33l0A5pbFBafdu8CI=;
 b=ZRVfCh1fcZ66ufcrvXkZMT5G0HvSadF0rNgWWcNB5v6sPVF06ilqhqglkjfXcsuhcA+MhYtqLjz1bqlqT44gnO92l5EiPHLUptWSpVGucEXxoMcRqWh3zN/TfNqqxXIwkL/1TvVfNUtMVRjiPxTLbToNQlB3dHjLbtghe8ogy5hfiinrwGlGUfVB6SiLTvgOFzD1kyDfXouP6I5iv7ZEUF9ep7QIxhn27E+ltHO46zI66OcXLFsFEpu4W61hxG9YFP/yYRSgTCkvXZ6upP3dpYGsJGErNnJ3SbxciM4R04SsgWKAW8C6qY3nfQP0FFpYihj/7kZXlKmKXI3U8DLocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 13:47:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 13:47:00 +0000
Date: Fri, 20 Jun 2025 09:46:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
Subject: Re: [PATCH v3 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
Message-ID: <aFVmUN9hVWHWaddi@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-9-badal.nilawar@intel.com>
 <b9a468c0-53ed-4da4-a044-76c5e8461b95@intel.com>
 <3fad6292-cbdb-4724-8e28-5315bb735d78@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fad6292-cbdb-4724-8e28-5315bb735d78@intel.com>
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af11bca-d359-49ba-a96f-08ddb000ee38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?r/Ky/A5wWhZBEBDTv2vCZdzHNmVlPBNicbxUdVN1a4IHyfWIAS1QrvULEs?=
 =?iso-8859-1?Q?DfXo2T0isj1kUcaoSAmW+WtBJqpJDSXpZcSK6GPcDdhV1AFebOlK9cQ9ut?=
 =?iso-8859-1?Q?a1dhzx79Wxmo3TBrH6PiHqN6Rh3C8ssEmT5YKNfEqe7+y22Er7krLmQqHA?=
 =?iso-8859-1?Q?GrJHoqcJDG3f82Cj6ECpzzi0IpXHKcZWtK74x/drlmCuMMlf9SAc32Jruq?=
 =?iso-8859-1?Q?YsA0x5KHm6si9KlA/YU0lbgI/3DBg+aIegxqZDn/8aMdNpNvDJUPuHPYHk?=
 =?iso-8859-1?Q?m8VSy54cMSSyvpNoZ7os+o9XysI9wrO4G1kb8HnVrStIIEOhgg+Rayrowm?=
 =?iso-8859-1?Q?0eDUHIkz721uvAMoYS8T0M7412KXAgokW0x+376hNR1sGxu16RSWBm2e3d?=
 =?iso-8859-1?Q?mBoO63VFMwzV78YnXWkdhvCFroQwXRboWaihaV5PmHiFEZ9X+Uuw6htJ3T?=
 =?iso-8859-1?Q?bxukTwmCEEXZa3A/dTZiUFtZNM9aWsYCVxoa5BFyKqkfn8xA1565mZSC7N?=
 =?iso-8859-1?Q?xzf90kbxHayOvNVF1HlKyZ8CaAak8WOVdnGasnjGHRcgLlWpPrhBqrU53m?=
 =?iso-8859-1?Q?m7wo1obQWuvDMQgERfll5FqJlqjfMKzSzaR4wPT9aXQXxLM2ONld+2rkbz?=
 =?iso-8859-1?Q?MtKq/kd14MrNvsYQ9CRajxaqyEIvDgXMm0E1ABbl3vezVygf8dqKftFTIL?=
 =?iso-8859-1?Q?3H3IkYtLvSApL8PSNp5zGTDNvfWM4APWioy6340BDy94w1p9u+ppZCSLO0?=
 =?iso-8859-1?Q?LcnDtJR9a1T6D3C0p3F9GtsZ4xqlUqtx6r6dcO+aDWBSUIJ1gxomZKs05a?=
 =?iso-8859-1?Q?hOngdOj4NQf0TyYsQ2V1rytYJ3Q9363EgFhx3boOvidSi0b2BtmMbHkaUz?=
 =?iso-8859-1?Q?p2h7IhM4Cw+y0N+oF3K6hwgUBA3wI16L5VMhzh2/j62mYN8fRl3fG+4p+l?=
 =?iso-8859-1?Q?TBgfWP6dBr6amjb16fGxOBV7y6cI+dOCuW/4LAXq4w8zu8rJNK2DoRwlR0?=
 =?iso-8859-1?Q?dK3tIbJUZngTidTNgtJNytSWC9OF1JWR1omTnMgHaHOAllrGwSgiQr8qdM?=
 =?iso-8859-1?Q?r0TOSLgjRHLTY572nC83SEIEp/GR8AxI5l1EKGo1Nx9kibKm29rdX0eTTE?=
 =?iso-8859-1?Q?zJuMX8SH7b5Y46CgVIyEgxjqEqRhUj3wD6dzaHy7B0OZC74P/Sir+UwFj0?=
 =?iso-8859-1?Q?AWZ5zaWqjitV4nKnfCz/tMO1VjmYP5DL+PLk6nF8iw1tZ7zJIEw1ZCftOv?=
 =?iso-8859-1?Q?lXSKX0f8QTBCWb6Vn+TAi1lCe7m7zcUynkcM35eI8Sqd4dF28F6/Nf/R2X?=
 =?iso-8859-1?Q?aG9DnOBkSuZ0GSy1W/huGlKOfy5Zx5rQqqpwnjBprxqCeFHkKAt4kcbrLh?=
 =?iso-8859-1?Q?s/iYS2Iw7eApuT/lYS3SzeHv5SqxGwdK30ateafnFTJ0CI2rp3woBo9CnS?=
 =?iso-8859-1?Q?HKRAZxBzbs3JjbVIIZstTbtX4aLt80dmlHseE0DEi6wEABU+EuYqpYDwbX?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o9UcgRSONGUVm6lWqOzFMmVUOFqui8G9SgPFCLVJ2KxBzSo+asPpt8Wf1d?=
 =?iso-8859-1?Q?HRrUw19ZRez9o0YeHJK7UA8KemqWtPakA9NXtaYhgy3ZLfgv9sJbj8u56X?=
 =?iso-8859-1?Q?acUtyrwZq1A6yxn99S+wHgL4QK2h9BY4OIgA0IAeJKV5SVuRip1JMsdyt0?=
 =?iso-8859-1?Q?RXjn47r+M842jyCvH4o7DBq6Kt/Cs1CMwiYj+cqYzWRr37ccUsfxosPYot?=
 =?iso-8859-1?Q?s6ouFtqdy2U+N8c6FdybzgSGSVSmfMozKil+Xg4h0GnMrmGaZsrOapRE4z?=
 =?iso-8859-1?Q?BeuYT8yZyguGh7XGy+4dDMn581wUi8s9DdIwcA+3c36t/gh5TVaL5SdlNI?=
 =?iso-8859-1?Q?7P5bNPNa65rv83y0+THA7uHqNl+A16eU/NW9bgm9ELgjKuS4iRIPV1pOgx?=
 =?iso-8859-1?Q?9NZjZFSDkhv7zi1YD1Ce9/3c3BCv/8b9s31arHSlvRvQeX5gltaVIuFlLR?=
 =?iso-8859-1?Q?7eSdwiDYgMq9Zf0sEJ5dD7Gm55igBF10LDHszIhyDZ96rLULNRgGmLaunf?=
 =?iso-8859-1?Q?BacUUi/4q5GxI7WhEmSCDCWnfr91k4egW5ZwBthG2V10+nKmvZ4B9vLwvx?=
 =?iso-8859-1?Q?97h2nl49vuqjrKyUzjh5EFlGN+q11goZ2bz3jggbCLuv3wSZJrItFPX7b1?=
 =?iso-8859-1?Q?CEwC1siYQ1hcN4AT7+MST5YKVOyYalsZPsnAqhPX0JegwmC5ap2qacbJcv?=
 =?iso-8859-1?Q?O00l9sNaRviGRb1D08Fis5vCUzVLuQy6DRl8ie591ZSsaQEdsv6009qDAV?=
 =?iso-8859-1?Q?moGVuu//KCFUxWrSmbiUpeX37kwsyUxQRpdiHv78agN24DrfKbFcf7mFI3?=
 =?iso-8859-1?Q?/gJOmG0KCHKxjOjDeugH+HXB1t1k60ix22ZdXu+uSvAM8mHQmQbcssg86o?=
 =?iso-8859-1?Q?gdfeE2+YKZ/32tRstpl8pR+e/w5e4Fg0yAIqV1rBCXNY1mYJ35P+kuVpFg?=
 =?iso-8859-1?Q?SAS8cl1fiFzOVB9oX0HOUJtoijDBU4BZgpZB3T4CuBdfK0wmLFbNk9nIHi?=
 =?iso-8859-1?Q?Syb+13+EZkzAZTjfn0xpv8leNlJCTF+9da84FXr3/fYbEgQS28ndBl6rlM?=
 =?iso-8859-1?Q?eCgyr+6wnq/FRUQXAJ6+Bvz8MvJ5Qn6JQMeQJCp6tJhloGsxj7vnxFLYEs?=
 =?iso-8859-1?Q?gkP9Pum7JfdyGPOcFHIKdBuAP1LH6HpsYrudvyf3l7vH6UPB1lheYkzW2W?=
 =?iso-8859-1?Q?tBoCFzLjSST0w5pVJQE9JPiF9JEFxueHwLsQDX3AQEvzQHoFq3H0lvISzG?=
 =?iso-8859-1?Q?oE61/fNbIsEVFEFovpshwcrl3HRqNmUU/76Pnz5yrRPN22+1FmWIEpr11a?=
 =?iso-8859-1?Q?10bu63NFBTsr8MozcXXkcYx56oqigpIXKcR3idO5B20z2WQJwH5xEIa/PI?=
 =?iso-8859-1?Q?5EgpLEbOylVcMpWlIwTvNqOn7I7YZ8nD8km24fSWMKRapWvhSrw1TdpPWq?=
 =?iso-8859-1?Q?kUgNqx/9FYqtgax25K55RP4nub0JPsEWIH1fdlE7k6+RhpzFOqS4R9zwgd?=
 =?iso-8859-1?Q?c2QN+SILq/7lIkL7HGewDLe79F37V368MukjdI5bWLue7ZVnU43LtX2s0Q?=
 =?iso-8859-1?Q?l4hh/zo/lPBy7AvN7k5IndzCwpeBXrTUQtfYf/plwtd9tN0aoHK1gqFT1J?=
 =?iso-8859-1?Q?HxBFuuSVJlNlbfQOO+OrIBeFrmn6BNlnGD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af11bca-d359-49ba-a96f-08ddb000ee38
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:47:00.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyJEj/fEiiK9I9PfuXFrw4f+yjNyCp4hEsflLvLKFrpivsifzMSOgAUi2Z3jZ5+ey/AKZmdfoGUyjtW9QrGDyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

On Thu, Jun 19, 2025 at 12:21:10PM +0530, Nilawar, Badal wrote:
> 
> On 19-06-2025 02:49, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 6/18/2025 12:00 PM, Badal Nilawar wrote:
> > > Introduce a debug filesystem node to disable late binding fw reload
> > > during the system or runtime resume. This is intended for situations
> > > where the late binding fw needs to be loaded from user mode.
> > 
> > You haven't replied to my question on the previous rev in regards to the
> > expected use-case here.
> > Is this for testing only, or something an actual user might want to do?
> > If we only need this for testing, please specify so.
> 
> Apologies for the oversight. Yes, this is only necessary for testing the
> binary before releasing it for up-streaming. There is internal
> tool which uses IGSC lib to download the binary. To avoid clash between the
> binaries, this debug fs node is provided.
> 
> > 
> > Also, what happens if we suspend with a user-loaded binary? userspace
> > doesn't have visibility to know that they have to re-load their binary.
> 
> If the device enters D3 cold state, the binary needs to be reloaded.
> However, the kernel mode driver (KMD) does not have control over binaries
> downloaded via the IGSC library.
> If needed D3 cold can be disabled from BIOS or by setting up vram_threshold
> = 0.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Regards,
> Badal
> 
> > Daniele
> > 
> > > 
> > > v2:
> > >    -s/(uval == 1) ? true : false/!!uval/ (Daniele)
> > > 
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
> > >   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
> > >   3 files changed, 47 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_debugfs.c
> > > index d83cd6ed3fa8..d1f6f556efa2 100644
> > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > @@ -226,6 +226,44 @@ static const struct file_operations
> > > atomic_svm_timeslice_ms_fops = {
> > >       .write = atomic_svm_timeslice_ms_set,
> > >   };
> > >   +static ssize_t disable_late_binding_show(struct file *f, char
> > > __user *ubuf,
> > > +                     size_t size, loff_t *pos)
> > > +{
> > > +    struct xe_device *xe = file_inode(f)->i_private;
> > > +    struct xe_late_bind *late_bind = &xe->late_bind;
> > > +    char buf[32];
> > > +    int len;
> > > +
> > > +    len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
> > > +
> > > +    return simple_read_from_buffer(ubuf, size, pos, buf, len);
> > > +}
> > > +
> > > +static ssize_t disable_late_binding_set(struct file *f, const char
> > > __user *ubuf,
> > > +                    size_t size, loff_t *pos)
> > > +{
> > > +    struct xe_device *xe = file_inode(f)->i_private;
> > > +    struct xe_late_bind *late_bind = &xe->late_bind;
> > > +    u32 uval;
> > > +    ssize_t ret;
> > > +
> > > +    ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    if (uval > 1)
> > > +        return -EINVAL;
> > > +
> > > +    late_bind->disable = !!uval;
> > > +    return size;
> > > +}
> > > +
> > > +static const struct file_operations disable_late_binding_fops = {
> > > +    .owner = THIS_MODULE,
> > > +    .read = disable_late_binding_show,
> > > +    .write = disable_late_binding_set,
> > > +};
> > > +
> > >   void xe_debugfs_register(struct xe_device *xe)
> > >   {
> > >       struct ttm_device *bdev = &xe->ttm;
> > > @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
> > >       debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
> > >                   &atomic_svm_timeslice_ms_fops);
> > >   +    debugfs_create_file("disable_late_binding", 0600, root, xe,
> > > +                &disable_late_binding_fops);
> > > +
> > >       for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1;
> > > ++mem_type) {
> > >           man = ttm_manager_type(bdev, mem_type);
> > >   diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > index c0be9611c73b..001e526e569a 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > @@ -129,6 +129,9 @@ int xe_late_bind_fw_load(struct xe_late_bind
> > > *late_bind)
> > >       if (!late_bind->component_added)
> > >           return -EINVAL;
> > >   +    if (late_bind->disable)
> > > +        return 0;
> > > +
> > >       for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
> > >           lbfw = &late_bind->late_bind_fw[fw_id];
> > >           if (lbfw->valid)
> > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > index d256f53d59e6..f79f0c0b2c4a 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > @@ -71,6 +71,9 @@ struct xe_late_bind {
> > >       struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
> > >       /** @late_bind.wq: workqueue to submit request to download
> > > late bind blob */
> > >       struct workqueue_struct *wq;
> > > +
> > > +    /** @late_bind.disable to block late binding reload during pm
> > > resume flow*/
> > > +    bool disable;
> > >   };
> > >     #endif
> > 
