Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EEBA0A99
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 18:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECCA10E99C;
	Thu, 25 Sep 2025 16:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8+yGwlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9459D10E94E;
 Thu, 25 Sep 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758818454; x=1790354454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GMhlo7FKpMDgebwLzNmn3wZY6cI9g7zS289Utx53XR0=;
 b=l8+yGwlwLfyBUKsFhzFcoiYygYhelJK+1G6LU2F9eWJ3tcAtxaVJlquF
 ZOFayDeLeJKKpf7a+sUJey1JOpjt8BrifFzmQoTTalUgujLOttUaR7kM5
 rTxhJdnPcV5mWjO7agHvDX4I0Nw7cWOU06JDC+xl0rMd3SSx5pF4NnyFA
 1RUh+183bSxI1iMyB81lUDFdaZawn1PRxcDUMmQl4G4OFIJIlNtc8PhLw
 tJS11gVeUFjfPIYK+VTN34XMU+S2ezy08nS79uug8IwzAnXqe3sZToJJh
 5rZLMlMQmN6QeOIdaDKmDL6ktgSV9mAzfOmDxqKXw7OKaoNw1l56qNmwM A==;
X-CSE-ConnectionGUID: XSXZc3juQqidKA+xuIDYNQ==
X-CSE-MsgGUID: 7jbdj1ioSdCk1HiOh8AQkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71766182"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="71766182"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:40:54 -0700
X-CSE-ConnectionGUID: W6VUesOeTDWRfllM2TkEpg==
X-CSE-MsgGUID: /Jpwqi7AQH2vNYs5qjhp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177829120"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:40:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:40:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 09:40:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlqJrfJD8ihPPf4WDGfDzDA8sraZBVa1LHZzV6X3rG2hZZ5koTHkwBxl3sVucnKdB0Aig23HzE1w4diYFPQKAwcaD1H8TBxfYTfJri34iTapxsUpXshB3XWOh86Fo07mHUVQjAxkdI9QXJfrXCxdMyRzApj3j6XV3ypPv4HaiPu4DJWECjETZs1t4rmFSCFd1P8iIeBCqbkNYMHGhVHspc6P6RQxMINV4n8d+tE3MTmcNXFmAUbDCo9uKeIPrlvISN5skK1ccl13Q65/GKstFY9AKYo6tj6zT2I9Rl6xa9yM43cU7avY40vJAdkibS5TsfWeSVwxEPghwNl1qV4jXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yud+eA+UDwQOBpuTN0LJzUxo5upfPRpEGDmrXZmAboI=;
 b=B/6HChEubdy3D8Pa31POjJepY/LPS1bayvWfhkQrtotmYjShEq9OYMzOe949lFhy2NkW2NzgoynKyEi9xtYHcGrN+2H3RvOwXn4PJaxu9yUO4OSjDLC3nLeWb3DhNUozz20yG8Eh/MKBqAyAMSqhovJigTx+0r56RHP162XiqVw7RxV0PRXhmSIRN+IpnFPbowRrFBSBf2yyFhp+4tb3nBHOlgBNqjzgwB86EgCB6mq7yvuZ0yHGjKl9VSOy5hT7z7ysjU/RgqsJLoQcy06tb/jR4qN0EiE23UzgXPm1Iy3Jkc//NRxvwWKs7zXuHpMI1eEC6EX322zGFeTmHELzvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 16:40:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 16:40:45 +0000
Date: Thu, 25 Sep 2025 09:40:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Kasireddy Vivek <vivek.kasireddy@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: Re: [RFC PATCH 1/2] dma-buf: Add support for private interconnects
Message-ID: <aNVwiiJs0mWXzcS8@lstrano-desk.jf.intel.com>
References: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
 <20250925130849.12021-2-thomas.hellstrom@linux.intel.com>
 <2e518022d743762fc0c5bde8c0918ee47a18b0aa.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e518022d743762fc0c5bde8c0918ee47a18b0aa.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 70623b31-2daa-4957-52cf-08ddfc524666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cUGKm0mWVUvY+bmNg8/UeTQLnhfvtLuT6txA4PpcNDGjyQ8TlxWaxKzDYZ?=
 =?iso-8859-1?Q?+mc5nVri4TXbRlBofUf2SGM2pKeng0A3AsjiJe50qzllN0WU92vFafc7z6?=
 =?iso-8859-1?Q?JZgc8kca21yQZvo0zCS/I1bkP8+p9BztfbnCITCoSUZULksfQQ/XuJ0d2W?=
 =?iso-8859-1?Q?MuMTewg09C/JFimuB1X3cgjiwXRpMfRMgHR42iIoCGJOihn5Lr308tL/JR?=
 =?iso-8859-1?Q?do//JExnqw352ZU6zN9PWHl5haJ0/YVueo/Bd2DcomGUSyBcvgL3VpIoFE?=
 =?iso-8859-1?Q?q6NFXLL1Iqtz8X5oxNB/8ozr0eCBUiJAssDx6il/Lq3f/PUnzHJHEm4UtS?=
 =?iso-8859-1?Q?VUyCyUAUhV18M2Rl+qcMMM/JMjUGQs779R7Wt1EHCQmeUCr7kw99AsT2wv?=
 =?iso-8859-1?Q?YkbIJTbqbWE0dvG4cQqyPK+Sh3lVJSwYzAbUS42XjotEvrAb26n3Cz76lS?=
 =?iso-8859-1?Q?9brd93BWrjDc+LX8OmJb8M8B8xY3V/BisG+COrzYcG3ovSIh/7ifJk9qT7?=
 =?iso-8859-1?Q?/mzfAzS3ePFzRd7Hpv9+BhucLcjsfb2EbexMwpFGc2fyRTq12Ep9JKFVvp?=
 =?iso-8859-1?Q?8PCcmQamU7MPKhOt7DG8GWlG+N6+GE1lJlosgjqeJn14sbzdbjNCFuXxj9?=
 =?iso-8859-1?Q?yUFFW0v0ziJvsJg0cfbIOHjFc7GYckCCgoWgN5yON+etuw4+GGV3KnsPCX?=
 =?iso-8859-1?Q?ugY1OIRHLrsJxlLraBDoEGyIgXbbiGIuk2wAsMrKxLjgaEITGEVikAGuPL?=
 =?iso-8859-1?Q?qUyJoF4p1DhdpedW7k4eA+UAENsAZB1ij1PgZFgrdtAVrfG43ZpXhZPRV9?=
 =?iso-8859-1?Q?44m0UmJu7D0JEHY87hcD2hRLPMnm/MrfwAq+1dvJweUmLqLdmfNSdH6YxD?=
 =?iso-8859-1?Q?BsZmgRCODojCliQ8tqdUlvqDhRe8bFM9odyr21+ba2+0PiAYhh1lpCEXNc?=
 =?iso-8859-1?Q?STlzfYIsoTgn75XgC2ptFPlWBPXpFcA3O7TcS47ich28s15/KI3IZgfl8Z?=
 =?iso-8859-1?Q?cXBMqauSNb2Wa4/UoTPlbd0If1ri+zUOKPYkXfNFimLqQPEkUSEW68Wc6d?=
 =?iso-8859-1?Q?QbiIF8R4PHKAyGfCnznH7RSlCbWMIOHq8ZaYBrXrr6LIH/UTtdBtr6cI80?=
 =?iso-8859-1?Q?g+oP8XTCev4fy826zugKoG+mKg+TgTZgLIUKBpwIgjyZcFDK0/hSWKQwMS?=
 =?iso-8859-1?Q?PmlyXVT9sNc6UgXxQSm+iyLwSjUCHIUq+KZlPRDJ4Jemi+vea7FQcBG9yX?=
 =?iso-8859-1?Q?+iXy67/OT+VImi5IV5yp1mqylSPh4HwbJ3KK34KEf32PfVkZBIK/gvN34Q?=
 =?iso-8859-1?Q?D2DttpwPN8dLTcNkSJ9ptYXuo6UoagUM3Vlrm19XylGTbU0fGP7ylSi9tF?=
 =?iso-8859-1?Q?BEsAinJArSP55Yjxl4KmFcK5NNL/lni0iptL0rYs4wPbqu5Jxh9H1HP+ie?=
 =?iso-8859-1?Q?8E7QfCq9JqLO7hlxJ9pml2CjknNauygXMCi0r0sb3gSHlx4S+/3X/7FhMx?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IOa8YEHFV8Z5TiKpuZlQiWLfWXZsmvuKgQvUvvHzH9BjD9zch3Yn+2NNEt?=
 =?iso-8859-1?Q?IBHLPlsV1qPNyC0lJlZflv6ZLrCmJytLrHya/8FSo1JTUwL/gJoX7lWesL?=
 =?iso-8859-1?Q?D7s2AXKDYsQBpXAA5M3kXSOrR6VivXjFowTnAwfUmlojkgVubdCrE6zkax?=
 =?iso-8859-1?Q?XY8Tg5pHFjXJY/x/ZBYMhFaqpdf8D5zZTvtVBjnWXtl+nwTCR7p0CHwpRO?=
 =?iso-8859-1?Q?jfwK/BXTXjO8YsiZDVEDFlTc93R99d5Zoi0SMl6bbK7Pz3ZLjBBS/aZXDS?=
 =?iso-8859-1?Q?SxEEH1daeYLpX61NaarlEmbeZa0/TuI8UPFW0Sv8F11bslF1hMP2J9EP2a?=
 =?iso-8859-1?Q?ymlG0Q/McR1q+s3Ys2ta/Nmwq2yMuyj8NeDCy2pmlr5Djx9XspjmGrwpk/?=
 =?iso-8859-1?Q?QVwyTXJiHeAo54AAwQGwvQzAEfMQ2z8kh64ebTpXppx02AU3Tc6S6wA94N?=
 =?iso-8859-1?Q?OOeDt8AJylugpUDC12f3foe0stfvmYewVkUFrPR3ClIHQFSjEd9HclCBkH?=
 =?iso-8859-1?Q?MDp1pxCkvdd9T8/cv8fY2gNY1wM57pO2elA64YYFGapdQGbULL53I7MS7j?=
 =?iso-8859-1?Q?5ODdskCfGZqFGNH4gc5zyUOkedQ2CA45n7xSnV9KbZQCnsDPqSlYVhDvf0?=
 =?iso-8859-1?Q?UZHgM0FdCJ+tHxX/4jeVq8bWw72gjWqhklPFPKHEqMnAgBP0QQUCJABIFN?=
 =?iso-8859-1?Q?OJqfgA1gNUJLuvpk/z0qAakFyt1YT9bjIJXFs4oHyGCUqt2NHoFJjU+GKi?=
 =?iso-8859-1?Q?D1YxLeRxxv2yhu6A5svNYIIQaZmOFemTZ/iNeOw/Og8mPemMKaeXdafqW6?=
 =?iso-8859-1?Q?nRvCh71+MwiJBqmPF/DZUHdGQRmbzmdcnuCq3ZErNBhtrIsx1M91KMmWsM?=
 =?iso-8859-1?Q?u2UyiV0I1KTDQKj/uwrzJrGAlukQMtEeMX2DONGFuPUprUzEKf8t8/pGTi?=
 =?iso-8859-1?Q?EWXWptuveXjxkMTfckltleVxiYSGMmf+dLexyppjIwgvQ5eDrJZYy/UTaZ?=
 =?iso-8859-1?Q?INCpKinG9DhjZA/Fwb6XYl/YJ8A59MA+ClGcb7ARgNIzFknDg13AndQmtp?=
 =?iso-8859-1?Q?AgAYMfLCUMz0X2cmiprTSALhXW9nFx7Z39HXSwHaSteOy66u0zA9lYLJsE?=
 =?iso-8859-1?Q?teuvwrH8sIZLfI4toCOm4c4g9ogwOC1svqgRy5v64r8e/n+TMY4Z9RD3mB?=
 =?iso-8859-1?Q?sjyq2KjQix7TgOsx75Py9wtmkSQKGGtvx/ZAh2YHmp/F/sCsRjPAbcVYVU?=
 =?iso-8859-1?Q?KbLWSP44N/a3yVGkrAy5LbH9PxLzgwwf1spsEewMK/OOJgkR9FVLrpPxby?=
 =?iso-8859-1?Q?k5LtbxO8TNzrj9JofCGVMoJH0WgyWwhJyAzDfK9ZAZZgV4INX7Gaa7fZEQ?=
 =?iso-8859-1?Q?7NbYNVfuR18BoAnIHuCg70MCEcFId1tMu+NIaqycRLsBHQG3d9aEuAnua/?=
 =?iso-8859-1?Q?E4yjd6YP24YNUrA11hR2mvl6viaeNkU4OgIE322tiqwFYjsSymwRmyh47N?=
 =?iso-8859-1?Q?UUH5yCDoNyAlNTVeLR1DrFVu0AAeumpj1KbgoSMlnFOTH19OPfdWWd0NQH?=
 =?iso-8859-1?Q?k1Vs8iZzAiiaaMcuRK/9huiC6tqhIn3h3zFGmWEOLK8ct/cySWqBLto4YF?=
 =?iso-8859-1?Q?/GVbFPmIpUgWz+OWoXTk0MVl49QL/0uGjrIDmEb9kgyjaXBeBYX3oI0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70623b31-2daa-4957-52cf-08ddfc524666
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 16:40:45.7359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRE17suMqEJXQnpipw1a7r0H1hQijkLcuu+FOFsBFLOiGAx5fbDtoUEH7C1ZeYoetfqCfH9Nf+oSVfQ4WVxPcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
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

On Thu, Sep 25, 2025 at 05:48:36PM +0200, Thomas Hellström wrote:
> On Thu, 2025-09-25 at 15:08 +0200, Thomas Hellström wrote:
> > Add a function to the dma_buf_attach_ops to indicate whether the
> > connection is a private interconnect. If so the function returns
> > the address to an interconnect-defined structure that can be
> > used for further negotiating.
> > 
> > Also add a field to the dma_buf_attachment that indicates whether
> > a private interconnect is used by the attachment.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  include/linux/dma-buf.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index d58e329ac0e7..e7191edb2125 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -475,6 +475,19 @@ struct dma_buf_attach_ops {
> >  	 * point to the new location of the DMA-buf.
> >  	 */
> >  	void (*move_notify)(struct dma_buf_attachment *attach);
> > +
> > +	/**
> > +	 * @supports_interconnect: [optional] - Does the driver
> > support a local interconnect?
> > +	 *
> > +	 * Does the importer support a private interconnect? The
> > interconnect is
> > +	 * identified using a unique address defined by the exporter
> > and declared
> > +	 * in a protocol header.
> 
> Actually we'd probably want to use something like a
> 
> struct dma_buf_interconnect {
> 	const char *name;

Maybe a field for private protocol type too?

> };
> 
> Here, and for globally known interconnects have them
> instantiated somewhere common since there could be multiple exporters.
> 
> >  (RFC: Should this be a struct instead).
> > +	 *
> > +	 * Return: A pointer to the interconnect-private attach_ops
> > structure if supported,
> > +	 * %NULL otherwise.
> > +	 */
> > +	const void *(*supports_interconnect)(struct
> > dma_buf_attachment *attach,
> > +					     const void
> > *interconnect);
> 
> And similarly for stricter type-checking the return value could be a
> struct dma_buf_interconnect_attach_ops {
> };
> 
> which is subclassed for each interconnect-private attach ops.
> 
> >  };
> >  
> >  /**
> > @@ -484,6 +497,7 @@ struct dma_buf_attach_ops {
> >   * @node: list of dma_buf_attachment, protected by dma_resv lock of
> > the dmabuf.
> >   * @peer2peer: true if the importer can handle peer resources
> > without pages.
> >   * @priv: exporter specific attachment data.
> > + * @interconnect: Private interconnect to use if any, NULL
> > otherwise.
> >   * @importer_ops: importer operations for this attachment, if
> > provided
> >   * dma_buf_map/unmap_attachment() must be called with the dma_resv
> > lock held.
> >   * @importer_priv: importer specific attachment data.
> > @@ -503,6 +517,7 @@ struct dma_buf_attachment {
> >  	struct list_head node;
> >  	bool peer2peer;
> >  	const struct dma_buf_attach_ops *importer_ops;
> > +	const void *interconnect;
> 
> const struct dma_buf_interconnect *interconnect;
> 

In general I think not using void * would be a good idea rather base
classes that can be subclassed. Since you have thought about this
already and there aren't comments on this patch maybe best to respin
with the subclasssing concepts?

Matt

> >  	void *importer_priv;
> >  	void *priv;
> >  };
> 
> /Thomas
> 
