Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E8B065E7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 20:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1D10E637;
	Tue, 15 Jul 2025 18:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfeG7hfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85C010E629;
 Tue, 15 Jul 2025 18:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603672; x=1784139672;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=aJDZp/1uafkYbeMEuUvaF1btpk4qZzGt6aesTJ6Ntg8=;
 b=YfeG7hfOsQ1nKlilELVcVRNZ8jbFp5INdwNQO/TRy5GP0ANQ5C3fJpHq
 pGGoueN+ifxCE5OuuaEbvBSIGiJ5IEwn23XLfJCxiE4g3uN3eySa2bffj
 OriCCNssVMyyttrjoG5IF1RCPh49TKOniFRwbah51VYudw1tfelAvKZfQ
 dj91XyFWNKOdq4l/nelt8V80tuk9ceSeVekSRlEieTqPE8aqg8vQa0hc7
 uT4awfns6huHtdGH9JPtS3c4XbgTojStVhh7RUh3FJD/NpxsSwy1TemGf
 AuOo4wASoLvP3BjW/QgEUbZD8Pz1bvLNpwTZyEEf8LVZHxjvOCmJXPEyD Q==;
X-CSE-ConnectionGUID: wZ+CGE9KRheGyM3AXavimw==
X-CSE-MsgGUID: 4pU3kWJOQHaTjluXe5cwZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54960170"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54960170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:21:11 -0700
X-CSE-ConnectionGUID: 9v/4H7GwTMSBMaG0di4oxg==
X-CSE-MsgGUID: x4RnglMLQ6WoNEW4x/CY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156701165"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:21:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 11:21:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 11:21:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 11:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNskrPYE5wCfSpBsR831GaDcNYkAGZE45AdsqvoUlLPrkNRBggLem3seZNFGefKvq5wYMP0x6tWZYwwzFF76Sc7RK9cnGqnHjsPPuzb89iC0oK01s3jU6d9jORKaktyMoVrPy+16m5YEhz1WPPi6Hp4cj2nj+ifXjK72/LrhHki5iQQj2MMGvlyoXlkbTeJ/fCviQpRZ6Ye1hvzKK+7fitMT14UmRr5VO/A5qpLsQ+bxEhwW9Yg9YP3u1F9gJYzyr5HZGQwoBhC6TDmua1yfQr30Zr3AhD6E3KhXgErgBDrN6yodzZNK2NNTLPEfYiEZnP5nNZI6nPYC1Q1n/ExBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpIlbqP5X61RAh7II5fyuVh8SAGHMv+A6InicbDLyfM=;
 b=tFDER9FwjNwHOGZKfLBbYJNEk4/f1a+lIy+FNFg42Ic+l+R5i7MuftswgBviWF9AkA2gg2DBKd9adENGzS4I/oK6C+dBY8v0/jOiK8kNgAGGdCL8eAAdiJ1GHmpMLJ09BfKGVK+G+p9FfUJ9g1PZkuXh24mri/TK2y/VA7rgdc0D5z7G3n2VHfvvOGpf6P6pSRXt9qQjtJ1wdnVQmicJQfBwF5IrOjuDpG/CHpSWobzeMKl+pth7xdvkaFnXM0fP+Ozyg51cIL8Je4CzVYm+YqEbeztEINCl29n2I2GbHFdcl+TPwpnUNBi5RkJtC19uK54bElRR7kD7OmVO+g6ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 18:21:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 18:21:08 +0000
Date: Tue, 15 Jul 2025 14:21:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <aHacDvF9IaVHI61C@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d14cdee-03b7-416f-e41f-08ddc3cc5e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HMuLqDt5M7wVrjAaCljCBj/c3MWEh9QKwsG18ciFkvjTfSUmK3C6ddwcxt32?=
 =?us-ascii?Q?2viN5sC6lSDQkiC9Tsl3iYxUhaA/TCNjJyqO1ZI84kGJ87xMCO8c0Emg18iM?=
 =?us-ascii?Q?yHgSzAvhz12gA6yaSawPKTA9xJQleFI3uP4bNEw7H9p3mbV6a2RXVKd13RWU?=
 =?us-ascii?Q?kUS9WKHoCJC2XPRl8mmkk22EYyh0FoeWJ9DBx2sPDODA9FNCF2TXCAOTL6Sr?=
 =?us-ascii?Q?GOVNTbQLHOsJHJGotC/lfIrhYtp5+z1hwFlN/BeiJZs9xdNSFteBbMF8Vm1u?=
 =?us-ascii?Q?r0DhY5aJQ+72CfGbk9LHi85VWXQmkJ8DMnwrd4Lf+L4INubDJ/BafRfSyypw?=
 =?us-ascii?Q?/hnfyYtvUzdWHFOtytaY2jzhGmqnH8nC8nTQ3KXa/QzlP+fjmmJ2xVoJWQuh?=
 =?us-ascii?Q?HycpyMdGTZAf8/+PAYOLtasJtkVmcomIrh+NObGpRJdSW3s2bLW4OFRLtMmY?=
 =?us-ascii?Q?+QTN6KZEpXOW8eCXcPtnrXDWHoVlPIrj7EfjOBCsXTKRdjGGNUQACEW2xN/G?=
 =?us-ascii?Q?RzPTGKjVQUNZbS/M0w0WnU2BGM+becl5XhMYaPlo/+TKFT9hPT8qz04XAumy?=
 =?us-ascii?Q?RlmzAp/VLpGgHd2ZvevGQxECxDJb0B90adUzFw5A/nfRILmpPQ18i3bm+P8Y?=
 =?us-ascii?Q?93bfIrWRf79Hva9OgUktgWu4Op0k6lEKa4L4eU3+JUC/YJg3tQ28tWVcrWh6?=
 =?us-ascii?Q?Kod+sOHPFHGjDQ7ROxgNELZxGblgagm2ijd9AOCGC/aB0BODhZJ9HZiKujd1?=
 =?us-ascii?Q?OVLu/I2gy9DE4La7dofgZnbyTanilWqPX7xcdQmcXBP69CCRcM9pTAzP52PG?=
 =?us-ascii?Q?5UZw7bSCSlW88tL10ggrZ5cH2gKAH4v2EkY6PrI/flQS9zd48CPv/9uu+I/g?=
 =?us-ascii?Q?JgkHGnXFHCR87yXeQRFtdUeH4QabKEFk0ALqnotFr9JvTw9/tlwZ02nqB+9R?=
 =?us-ascii?Q?gYi/5JciMsObmYeJ93iF8C+ziY2Tk0UO56cR0O7f+27lKaDEqqHc+F+KCY7s?=
 =?us-ascii?Q?B7/6fGaKLiLTRxjUcqF4naVkeggpLTbD6B57byGcvhLRILR0d72AXpMM1O7Y?=
 =?us-ascii?Q?m9dQ8Ia2PZXmButj5pCdVRL8wV+s9k33LwFA3TF92vssBkV2uadCIjLAXJxy?=
 =?us-ascii?Q?2fGMJzxLmV74Ru89x/UogETUb9TlVcjVJj1U1zIcqdOAxOSy2KxJHq5rw0pF?=
 =?us-ascii?Q?RiqdP8MBcrrlFQRN51pS6KpvoWjoGM0q5d5ljtsMZ0OFEyvGgKm53uEZadkf?=
 =?us-ascii?Q?kEodLnagzxhIXj9GG5+nkTs8rIJYQxCmw/UTNFlfDz40UnhkhxIsbTJsFMqK?=
 =?us-ascii?Q?cHendra8c0H0vhszcxAZzxVkZlfrVpgm4eULB3Kf2+AY3hy08uIyei89gmNC?=
 =?us-ascii?Q?W+TPOq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JEopVg+/AmOOJhgeO1ujTZ8cmzaeKOd6dUzDjrcEz3RXEtCdD2xgmqyP/OUu?=
 =?us-ascii?Q?1uZ18WZrUxf+6f3XAxBdq8U6Pv0uGjlRkyB6rxZuy1ZDFWFauD9Gme34/WBR?=
 =?us-ascii?Q?hA/CftSiXnrXqZtZtj67p5NQQU5CarqFmbrO/naBSAwqAmQdMmi3TagXbiPO?=
 =?us-ascii?Q?OIKyVHu7RRQw/fDJ/PMwFscCnsd1q+Wd8YZYJjoFdwH2SEFDJLxAwqrFlseT?=
 =?us-ascii?Q?OBeRb2Mn5abRB+l5w1iiIUYyz6vsf1EqSk7IcHZmDPzeVlhDz+7FpdxM2v/O?=
 =?us-ascii?Q?wlHvP7XJw+IfE8lJobz79iKkwRw2zeOz/nwoKy/pJGEz+M8GXhx6i1UDK7Cl?=
 =?us-ascii?Q?WGdpvY3YYLKV7GMVrluAQ6pgpNGisODOrHTpr0VhOt7NpY4t8JlSQhhrHE5g?=
 =?us-ascii?Q?RUmqGYRctZTuA35+kH4g0t/Qjs6u+NikwddKZZeNGazrWjOSzIdp+p8oZ7/T?=
 =?us-ascii?Q?YHKMRu9NupGSJaAqE1E2vK3li8aoQPQjcCb4+C2vH5z/hYKJLIZnnlJ0nlaC?=
 =?us-ascii?Q?FoDttkKlQloDObuSvz0zBHg0aRsXantlExrPiDfA1XB9oIbgvYdqasOPcXZe?=
 =?us-ascii?Q?YOOvxDAPFo8cxbWc+2OGAPGPIXH4Z1VFyHGkjtZEv/htJF7hOqzRJ08n64Fd?=
 =?us-ascii?Q?X9WoVYNnMKMiFNSCxbVBh9E9eh/Ro3uJZM53ULGVlrzBhrqAZ6R2jqVgaDGp?=
 =?us-ascii?Q?afu2OI0Gmg70clP8EKzRStocRtvwQGJ0QYkYopce5EinRurhdGK3nianNdmE?=
 =?us-ascii?Q?ocBWbZhN3IF+ZLoRyCI0HpujcRXSiugGJqjIZRgd8UkEh7p0UTNcQ3HVxe6g?=
 =?us-ascii?Q?oqC+/+R7uEDrFuxEN6ah2mq+acrJTd3Ys2MPWQ9yD+1VYTtCFWXI7sGGtUcC?=
 =?us-ascii?Q?AkTQ7MhHbUbop4J0gLz7+EZU2C086Gvm1D8iTK7g2e2LYBRapnaPjF5jWN9q?=
 =?us-ascii?Q?jQWKetUZ++wxmJCdgTaVwvICp4akHZBwQ7ULgVMPIeIuSryM6WZ6e5gbNM7Y?=
 =?us-ascii?Q?cFQsUTJ4Cod8SpSzWYg3wBiB8GwRg9Jeu6pHJDGrxw4j8CtAsfnxJNoZx+et?=
 =?us-ascii?Q?ZROclUPN/tV5XHSu1SHiI1K3eyZqDp4KSTpnwkukjluSC95iiWh16ty0dnTZ?=
 =?us-ascii?Q?AYpjnLXE0gmV6LsDTVIoxRBZ3QrAn9yQsoz82QI8f3b0/kltnluq2bJFAHbC?=
 =?us-ascii?Q?eXFESLHEo+r1kI7w2CE/LheiCtOv/77tbj/1YUUb/OFkNx2hR+jftJplo/dz?=
 =?us-ascii?Q?JAgrJ/HNiGxoAfHRr+fgoaw28duyOG+Y1MKLf3QNSkKNUwbS8ioJ1vFnYh3X?=
 =?us-ascii?Q?og8HZMZeJ86oozHOdjNaZgRk8UhV3hfSaNBdSDwrNbVm7HjLOUdInzh5xqVO?=
 =?us-ascii?Q?u/BRMaJ+Jp9bMa8mZcTrsp7LuRbvDaUGxwD9VwuU2KFQ263iPAnVWU79wwC2?=
 =?us-ascii?Q?iq7i9wDDhxBqYNVMXYhMgpb+Tb33YAT8zhDPlKvzlkoAWVrGz6NuyNgj5zjh?=
 =?us-ascii?Q?/Q2XoLMpkwGmY5329SqeBSFH+O7plizsUdT/396PAvelB/ESt6AfSgnOGQD6?=
 =?us-ascii?Q?PHz5CvJFSk8u0o5aJvxyzdXzwfu1vRFhN6l2flJw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d14cdee-03b7-416f-e41f-08ddc3cc5e56
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 18:21:08.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hC1Wqfjc2n5rt60X+jxKHzIJ3/TRWrKxIq3CHDp/PoUTk3cPVb+DYPHtUFekIJ13L87owfwtGHyTljy1vD4JHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
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

Hi Dave and Sima,

Here goes our last drm-xe-next PR towards 6.17.

It brings a lot of workarounds infra and additions and
the enabling of SRIOV capability in BMG, as long as
underneath hardware SKU and Firmware supports it as well.

Thanks,
Rodrigo.

drm-xe-next-2025-07-15:
Driver Changes:
 - Create and use XE_DEVICE_WA infrastructure (Atwood)
 - SRIOV: Mark BMG as SR-IOV capable (Michal)
 - Dont skip TLB invalidations on VF (Tejas)
 - Fix migration copy direction in access_memory (Auld)
 - General code clean-up (Lucas, Brost, Dr. David, Xin)
 - More missing XeLP workarounds (Tvrtko)
 - SRIOV: Relax VF/PF version negotiation (Michal)
 - SRIOV: LMTT invalidation (Michal)
The following changes since commit 94de94d24ea8cf567ec7254a723c3192c72c2ca6:

  drm/xe/guc: Cancel ongoing H2G requests when stopping CT (2025-07-10 21:46:29 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-07-15

for you to fetch changes up to a81648768178f6adf171d98db486b4b2613f645a:

  drm/xe/pf: Invalidate LMTT after completing changes (2025-07-15 13:05:22 +0200)

----------------------------------------------------------------
Driver Changes:
 - Create and use XE_DEVICE_WA infrastructure (Atwood)
 - SRIOV: Mark BMG as SR-IOV capable (Michal)
 - Dont skip TLB invalidations on VF (Tejas)
 - Fix migration copy direction in access_memory (Auld)
 - General code clean-up (Lucas, Brost, Dr. David, Xin)
 - More missing XeLP workarounds (Tvrtko)
 - SRIOV: Relax VF/PF version negotiation (Michal)
 - SRIOV: LMTT invalidation (Michal)

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      drm/xe: Remove unused functions

Lucas De Marchi (9):
      drm/xe/migrate: Fix alignment check
      drm/xe: Normalize default param values
      drm/xe: Fix missing kernel-doc
      drm/xe/lrc: Reduce scope of empty lrc data
      drm/xe: Count dwords before allocating
      drm/xe/gt: Extract emit_job_sync()
      drm/xe/lrc: Remove leftover TODO/FIXME
      drm/xe/gt: Drop third submission for default context
      drm/xe/lrc: Add table with LRC layout

Matt Atwood (6):
      drm/xe: prepare xe_gen_wa_oob to be multi-use
      drm/xe: add xe_device_wa infrastructure
      drm/xe: add new type to RTP context
      drm/xe: Add infrastructure for Device OOB workarounds
      drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro
      drm/xe: extend Wa_15015404425 to apply to PTL

Matthew Auld (1):
      drm/xe/migrate: fix copy direction in access_memory

Matthew Brost (2):
      drm/xe: Move page fault init after topology init
      drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR

Michal Wajdeczko (14):
      drm/xe/sriov: Mark BMG as SR-IOV capable
      drm/xe: Combine PF and VF device data into union
      drm/xe: Move PF and VF device types to separate headers
      drm/xe: Introduce xe_tile_is_root helper
      drm/xe: Introduce xe_gt_is_main_type helper
      drm/xe/pf: Expose basic info about VFs in debugfs
      drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
      drm/xe/vf: Store negotiated VF/PF ABI version at device level
      drm/xe/pf: Prepare to stop SR-IOV support prior GT reset
      drm/xe/pf: Resend PF provisioning after GT reset
      drm/xe/pf: Move GGTT config KLVs encoding to helper
      drm/xe/pf: Force GuC virtualization mode
      drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
      drm/xe/pf: Invalidate LMTT after completing changes

Tejas Upadhyay (1):
      drm/xe: Dont skip TLB invalidations on VF

Tvrtko Ursulin (7):
      drm/xe: Generalize wa bb emission code
      drm/xe: Pass wa bb setup arguments in a struct
      drm/xe: Rename utilization workaround emission function
      drm/xe: Track number of written dwords from workaround batch buffer emission
      drm/xe: Allow specifying number of extra dwords at the end of wa bb emission
      drm/xe: Add plumbing for indirect context workarounds
      drm/xe: Waste fewer instructions in emit_wa_job()

Xin Wang (1):
      drm/xe: Update register definitions in LRC layout header

 drivers/gpu/drm/xe/Makefile                        |  12 +-
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   7 +
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c | 232 ------------------
 .../gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c   | 227 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.c                         |   2 +-
 drivers/gpu/drm/xe/xe_bb.h                         |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  15 --
 drivers/gpu/drm/xe/xe_bo.h                         |   3 -
 drivers/gpu/drm/xe/xe_debugfs.c                    |  24 ++
 drivers/gpu/drm/xe/xe_device.c                     |   8 +
 drivers/gpu/drm/xe/xe_device.h                     |   4 +
 drivers/gpu/drm/xe/xe_device_types.h               |  25 +-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules          |   2 +
 drivers/gpu/drm/xe/xe_force_wake.c                 |   2 +-
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |  45 +++-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   3 +-
 drivers/gpu/drm/xe/xe_gt.c                         | 191 +++++++--------
 drivers/gpu/drm/xe/xe_gt.h                         |   5 +
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |  19 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 126 +++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        | 166 +------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h        |   2 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |  34 +--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |  12 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  34 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |   1 +
 drivers/gpu/drm/xe/xe_gt_topology.c                |   5 -
 drivers/gpu/drm/xe/xe_gt_topology.h                |   2 -
 drivers/gpu/drm/xe/xe_irq.c                        |   7 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |  54 +++++
 drivers/gpu/drm/xe/xe_lmtt.h                       |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                        | 269 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h                        |   2 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   8 +-
 drivers/gpu/drm/xe/xe_module.c                     |  35 ++-
 drivers/gpu/drm/xe/xe_oa.c                         |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  22 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |  47 ++--
 drivers/gpu/drm/xe/xe_rtp.h                        |  14 +-
 drivers/gpu/drm/xe/xe_rtp_types.h                  |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |  61 ++++-
 drivers/gpu/drm/xe/xe_sriov_pf.h                   |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_service.c           | 216 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_service.h           |  23 ++
 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h     |  36 +++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h             |  45 ++++
 drivers/gpu/drm/xe/xe_sriov_types.h                |  36 ---
 drivers/gpu/drm/xe/xe_sriov_vf_types.h             |  41 ++++
 drivers/gpu/drm/xe/xe_tile.h                       |   6 +
 drivers/gpu/drm/xe/xe_vm.c                         |   4 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  58 +++++
 drivers/gpu/drm/xe/xe_wa.h                         |  22 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   2 +
 60 files changed, 1501 insertions(+), 765 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h
