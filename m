Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AACD755B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 23:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D9610E235;
	Mon, 22 Dec 2025 22:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBIi+bLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09710E04B;
 Mon, 22 Dec 2025 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766443368; x=1797979368;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N8ioxYZ4lS9fpyUXaPgC3RaitVkgFpM7Njr8/sxaSZw=;
 b=WBIi+bLTBxIPx0q3hCnk7oKGTE0FBt5GpWWXDdgs0ZUNXn/68f4FHYnk
 8L9VB6WoRAsL7RZOpJ/0OrhbgV6Btp4ZCIKOjXR8ywaIaqSU0+DvdUXh9
 8OUnV2IXWB0wcuiIn2B00iScqzBgeYkJd4yZ2EMhpzxoO5BJyPzcYN1+t
 +72S4W8fXQcKbe7I8ch2jNS9YtkzKk/BMrQHxtiMeG80uCBWMhHZTe1xl
 r/zmX3uC33/2W+Uxx760VBZI8aCsRp9sXbxPTjJ32qdPbjgSYRxn3UfqT
 GKuHh5uhaBcVz6D/l/ryGLyR7krGJOxxtvQAFPcCDsjiWf5DFQ489VYL1 w==;
X-CSE-ConnectionGUID: Ts9k5GgeRmObk6JOLLfscg==
X-CSE-MsgGUID: 1ynuFZpmR+azx1jzVHwfSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70876994"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="70876994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 14:42:47 -0800
X-CSE-ConnectionGUID: I1yDJ0IJQRGtG3rrzMMdTw==
X-CSE-MsgGUID: Ufc45atKTvS+RPSL+8+5Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="199937735"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 14:42:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 14:42:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 14:42:46 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 14:42:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mbqtj3ai5qB35OqbFXzsqzrLkkcdEzzWcU0CY4Mcx5b2olWq0KexzDgq2J7+78TRxcRj3dzdMXQ7GLaUkQt2ykmmSm3IC93cnoaqwxI7Zn0GCXzplbw/VmNy+OgoHfXFSgfrkffGEzgRf3vrMOcxQTv6eoeKuzgEMe2lwCUg1aIFSrFnCceyf/fFSzhojUR/wnKYoUF5pOs+oCpmgSaAEJgF5iyeJf4rSL/SPnxB5PhuTDH20GONQxpJE3bVxb0pk3FcTwV2d9a2klonDLASZ9YK0OjXVC1wAzs87qXOSSnyYZbxQPiPxW0dxgzwRItBweq3N/CRb9pmeG4p6wXuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK0m2HS8jXSUpEkw9v16fNdKCrw2xXCiTrtlp9/7+xM=;
 b=KrEj9s2dQXkQAyB+ZeqChrLWrGz3YqEKlSMIbzTGEHZDEYcCMoAtboahpA9otdyp0kmfj1qX8NDJv8a7dBzV1jZT1WDbwOps+gLg7fEUg9ssIEK+pxKFCtn7944/KLlok8JEF06X7SAzBzunqE1LnNAYhZ/BFd09owru5XaM53r7SRCV7xDlOEIT2t2V+kQANAQqVD8roA0XLc0w8AQSlOKUzHot+vs1P7IbYn3xT304RXooOIN5BRSj6I9e45zqJDNAzoGWgkw4FqwSVRTkrmenoJHjUelb9RN+0tAEj8HJMBceHzMJaJ3HISMDoWY8pq52+R8JFI6tV8CwmUUrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 22:42:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 22:42:44 +0000
Date: Mon, 22 Dec 2025 14:42:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "kernel
 test robot" <lkp@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/configfs: Fix 'undefined reference to
 xe_configfs_...' errors
Message-ID: <20251222224241.GR4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251222175006.9706-1-michal.wajdeczko@intel.com>
 <20251222175006.9706-3-michal.wajdeczko@intel.com>
 <aUmWGyJNfbBmFFlt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUmWGyJNfbBmFFlt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c924914-c03a-4dba-d701-08de41ab6b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4W7RclFB8Ag+ti0AHsH3rE03zEf2ARHHnCVlMKc6zvymb5ungqvSwtwSE6vd?=
 =?us-ascii?Q?Y81r1jaPjwHeSLvFwKagtSugdsp5cpDGLzx8ZEips4EMmbGEMEaFUu6CxBmx?=
 =?us-ascii?Q?JiRmBGQ0ncnTdUd9Y4Kzaxe0j6doB2ydWloXodq+KKr8VetxaP44HNPtq/rM?=
 =?us-ascii?Q?IvJCchNpRo75PXjnfQqDQyrUuAm9UWuNles9ykXN0KPl3fKP0zBwynGKbjXI?=
 =?us-ascii?Q?0Myt6A49Td3dTXYIHUtZygCrgQgI6gwJAyX67Ah8jMusah0SOBZFLcDJOEBn?=
 =?us-ascii?Q?D/GdQM1qive+42aWXhy5rKMinQknEoTkJpyv9Pc97tYz8Pvm7cTZJH+nFdwM?=
 =?us-ascii?Q?emSli96NLEOE4D6s0gqqB6xlBB2i4ZAMVVRZWD9SUF3w0iBQClF5rjd3WQtd?=
 =?us-ascii?Q?20IuWp/s80HjBn7A0caZhjm4K1U98fMFVDjLNhSTKrbYfEh0020SbzfdmeCf?=
 =?us-ascii?Q?/A5+i2woHPSsC5HYV5f86vHL4g6NG/q4AbiYsAYGXcjpb2rl1cIdzfJPbgm8?=
 =?us-ascii?Q?IY9geag2dYzRq0ndMJ9X468eEQqcFbH7KED2unCwdfWOitnuD0LBS18D6TWz?=
 =?us-ascii?Q?u/vxdCRdd9M9NvVpTnLblyKs1exi/komOp1Od4JyYL0AgiCXpgPnb13MCy1+?=
 =?us-ascii?Q?BU3s2S1cFog89gEXUgOAVZKfcNUM9GSXrWbXehfL7ivu7Zoir0PtTGMY2p+1?=
 =?us-ascii?Q?/RFRrHKu1JuG/4dSTlZs3KVdojmUl3/RxJNbjWDKZlCItOWDVhSCKdXnaR7L?=
 =?us-ascii?Q?L7Gr33SQDw17jkNRVi13NY+PpbLlHy8MZwACOkshp7DxsEXIas82C/bkzI+u?=
 =?us-ascii?Q?xxSq562aeSqqZxywd0dg6wmb9VHnsZGsG0LDbaFv0PB7MmdudV4wDJoKE8Vv?=
 =?us-ascii?Q?bQUucCgrOhxBUVUS52jJYV2tz/V09xjJHKX7P9xQRU/hb/4eYYET8D+FIMO+?=
 =?us-ascii?Q?odWbpm8x+y+zSv67hlYV2yu4GE9ZQ/9YXDSyqhOopP8nDkfBQdVrMrE+h13n?=
 =?us-ascii?Q?OMPvGNSP6sNW3HRPso6WENf4STPzYbzKCTV8vV1WOhM8OVeL/O2ke2gMQXsP?=
 =?us-ascii?Q?cOsC36OB9nHA7oX/ox2lzx/OMNL6gA23UQi3FxL4KOlUplMlA8X95uxVSb6M?=
 =?us-ascii?Q?FLNrbc+qUN7OlF/P1K2MFGd0aAVAmMFc7Ym+Ht978U7MJikwQV4eqK91wEXr?=
 =?us-ascii?Q?7jEKagFS9ZZW8kdegywcK2NjE44U1EHlGQvVrBcoT3Ht+qX9B7hdeD3Xwikf?=
 =?us-ascii?Q?3vi+/q8YTTuPJqhFzH0be0NYWJ6CPt9bhh+gxaBVM5zazEljT+1OhKe/dF2t?=
 =?us-ascii?Q?Y/uzB1W4FsvYngDpUeDd7b3Ps44Iwg9t9+izWOxtcrxuoPtF8yKiNdLyikVL?=
 =?us-ascii?Q?RIEx7z4IlBSAndEEc53eXq5/WutHipUIBrSugy+PgZmTydCjtYixbOSzCdFI?=
 =?us-ascii?Q?MBeyFoFXDxla+fzC8TK7DtsM1yh3xdyX78k90F89Mq8yBm2AeLOGRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ppMm8lTjIjsXH2oNyuUWPFtDAprQKZOfdlbwVgX+0y/+nu2xAk6/h4p/0wFy?=
 =?us-ascii?Q?PW2zHoWiU5nGOrPrqx1nV935fzcAsnCmAiBWdIcZld+h4PAHFWWUXLKEI7Mx?=
 =?us-ascii?Q?AuaKiutoP0pslKjtyr70xCIp6kweUkI8emsplGUat7WGHGov2za86MGcjgMu?=
 =?us-ascii?Q?Zypek+AdIMvHTaiRhrSAIPXbu7Bx1t+wlZaXYHLdLYx1od8CZTQnMhOPhJMr?=
 =?us-ascii?Q?1NJWtTXcCghRQ2hFcImC0/FR8aOKYN9Oy+qloMfKo5VZyzFpSQCzY1TbXY+1?=
 =?us-ascii?Q?cgN6eJuGFxcbSFBkS0vJt6IkQvEvv4grZRJQprjweTmu0Wh2+QUOmCrS4XqM?=
 =?us-ascii?Q?AqCugNrzICS6JItTofFALY40XeGJap1AsDw3s5WLnXPE9EwVa/0JfQGOgw2C?=
 =?us-ascii?Q?Jhm1456fAgttNeEDnr2g5/rV3zwKJyWwILlBkMb/T84Lg4dzDd/eVBKlLDV3?=
 =?us-ascii?Q?QxiNS5hDokJG+gEOk2aM0mTMYujr7O6IIsSi4hJ9WQFfIWMSsvO4RqOpEL1Q?=
 =?us-ascii?Q?/PxEosXPiiPsVwMImqyngOgdo1tx04JyKByx+dK03qQsM0SpFo8fj5DMBMN7?=
 =?us-ascii?Q?+ard/8tJVq1FEP0q69tkjjZcjyWG6wCNt0wDoWBxuZyo3xGge6KB5MB+pqg2?=
 =?us-ascii?Q?DoCFROlPZWTqaMVIXhQrEZrcg+7rv5/pv+Kl9SzZvrlT47XdZVO9z5Kt8j57?=
 =?us-ascii?Q?+f48lsO9hSXvqgjHSa0uyRuimfrunlGophC2vrK0pZBpNTVAyAaBtWPp0/c7?=
 =?us-ascii?Q?hnFzR6nTUjkPmb0KqwgI5zoiLbkOhDCGpCWhZtriLPe7C097vPtOpAiDGdYN?=
 =?us-ascii?Q?m9sP6+HQrmHfiD9tEgZkuTuPkhaMJKiS61pMelM2lBEQSbtRt3tfyh9fkaK2?=
 =?us-ascii?Q?HfWvoBCqKKDhQelzf6ZsDmK/a/vqXGAv2IBU9HfhpH8dWpBYAx8QHfP5BL9Y?=
 =?us-ascii?Q?Kvxtqp5K2KFaE34X+kA5lPRdKdin4ZAKF9hSkZtqRVBbJ/VsECL/xfnqT6lN?=
 =?us-ascii?Q?AR31M3OHeAHSPb0XvCk/9y9/1KJRKtAePfGHfM7x2AbylPrb/KLzIgX5n+Ft?=
 =?us-ascii?Q?8I1wh994hoztPwcXXZIoq/lQ0F8uTVrfEjzYJAfs+vbNtri4jcbB1n/ZcO0Y?=
 =?us-ascii?Q?JzymLl3ZnFOzVKBGEQO/t/uiORf8eCgFpaKA/Y7gI5zB1RLRqlWqgfo6wNwC?=
 =?us-ascii?Q?i2nEPZhWXb6EFNSbUaDxaCA8s7TNCxdQsTZciE+GcXnv3wDfe1TinW8zEPU4?=
 =?us-ascii?Q?3mToVBWu6jtph/W5wNpyFNmghdoqUpUYWNLPsWV7hm364Fkse5dzOW2t4IJG?=
 =?us-ascii?Q?0fLYi3VD0U2F80dTkyY8knTlxWFA+Fcx6R1Kov8jVEZWLqO1u8EZMngNpf7Y?=
 =?us-ascii?Q?6Ue5whptdhibQdINPlvQfaC4Ew2pjLG98rvX2fy+inpmsDsXcrOp3Q09J2Cf?=
 =?us-ascii?Q?TsHTdNjwFSXSr73szsaWNfoQGw4pCmxrdZZv6PVaZhg15ho2HthpJ8K3PoNZ?=
 =?us-ascii?Q?oluz3yeFOMOH2ucNoNkXX9Nsuv/7GRuycb+kdz1xCm5pgmu7eAd1vgkXtsab?=
 =?us-ascii?Q?PUwj/WvCwGYHQEnmt6BQLcZgcW0h8qCNQBgKU7SIPGJEh4qCFpMRxFonqzPW?=
 =?us-ascii?Q?dAT6yl8X+bfGY8C799L4EpAPM4AaoIajZpoupprB7GTytfXvxY7dkTw6L9qr?=
 =?us-ascii?Q?QMDtnSipY8ec6gzx94wm5noGmRPah3VUKSrjEPywoDQtV8yvzaMjh1zGdU24?=
 =?us-ascii?Q?zyLYL8gQ49y16mxnoTuo3IhxAuWfn7k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c924914-c03a-4dba-d701-08de41ab6b9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 22:42:44.0455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOPfr6l0ozc2kmM4KhmaDVz+yjDzZtkFXD78ryzO2x5XJSI7nLpncaJjKXtdSXWt9ylgbVFDOe6DjBKufVu1mIFLNTCrk6fdeDegNAVpyZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

On Mon, Dec 22, 2025 at 02:03:55PM -0500, Rodrigo Vivi wrote:
> On Mon, Dec 22, 2025 at 06:50:06PM +0100, Michal Wajdeczko wrote:
> > On configs where Xe is built-in (DRM_XE=y) but configfs is defined
> > as a module (CONFIGFS=m), we were not enabling our configfs stubs,
> > which might lead to the following build errors:
> > 
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
> >    xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
> >    xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
> >    xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
> >    xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
> >    xe_lrc.c:(.text+0x32fc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
> >    xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
> >    xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
> >    xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
> >    xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
> >    xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
> >    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
> >    xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'
> > 
> > Fix that by using IS_REACHABLE check instead of IS_ENABLED when
> > deciding whether to stub variant or not.
> > 
> > Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > index 9998ec7c9956..ab75485b08b6 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -12,7 +12,7 @@
> >  
> >  struct pci_dev;
> >  
> > -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
> > +#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
> 
> Well, I'm not 100% confident with this. And probably the Jani's suggestion is
> the safest one.
> 
> But perhaps this is acceptable in this case, only because if
> we are built-in (y), we are not able to use configfs at all anyway...
> our configfs usage already depends on us as module...

Is it not possible to make this work?  Even if Xe is built into the
kernel, we're still free to unbind and rebind PCI devices from it.
If possible we'd want configfs to function properly if its module has
been loaded by the time we re-bind a PCI device.


Matt

> 
> >  int xe_configfs_init(void);
> >  void xe_configfs_exit(void);
> >  void xe_configfs_check_device(struct pci_dev *pdev);
> > -- 
> > 2.47.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
