Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60072A19DB9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 05:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3F10E338;
	Thu, 23 Jan 2025 04:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRIFSMNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E5D10E0D0;
 Thu, 23 Jan 2025 04:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737607008; x=1769143008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OU7P3PTModJOacF6/4MJaySOhoz32Ve7E9hB0+SSAh8=;
 b=ZRIFSMNhid64s93KAmdgI+ZwdzXUdl4GaPhMkF9yhspYX/qhjlRNOnec
 7cwi31vNcgBOHt1PGQj80Twn3K0KOhEJILnZLVkFa8grF3rEWquoJP1gW
 4wcXApi56JRBoXh2qD5+OZ1pDHoPBkKH5kJg79wzLhJvxQ3KD7OBrcYrg
 18Of8M2gyrt9+p75diKrZsw7Fs6fnyddi5XAtMbziwRVOd0zvvk/Z7fQ8
 y0a1TrC9vXq67m400+anG0HCt7hRK/jcBwi9YGVL+owQ2MQhyBWIBkHmF
 Rc/spXWEl3AvAQ3Tkz+jiuNEc4Iv+GqQfISBB+xyZaqHRM0TUEuODqgFO g==;
X-CSE-ConnectionGUID: EsIMjmZORbek5HFhel1gog==
X-CSE-MsgGUID: a1m1bXnRSp2Yj2Bnp5/9Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49486955"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="49486955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:36:47 -0800
X-CSE-ConnectionGUID: N/K957vKQM+Rum8HSqFr5w==
X-CSE-MsgGUID: yHa5HCbxTmmp087f34vhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138215734"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 20:36:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 20:36:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 20:36:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 20:36:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDPwlZPTIB5y2aUVUVXmASjCgDgFsTrigh/Cajp3Sq1qp89+kSSzeHx+dKlBQs/G1Jh9sr+YLuN4Eosc2yT5JbSlhN50LqKyAD+LUgZEkL1WdV49Bgjinzzt8AC/Qd5ERPTuoigwZ+MGHDzijuMbHgt5pcsp61EQf5koRx3TuB0K/eNDyRJUIxv7tu57ucdquBP9AG2xMmqqKaWoBSMvH6IVpUQJC146txlFuNSWhuz4Qpcty8jUo27q08kcZV7x9QYXN1m1QNkjOjhZnYJqAUwB8tJBEYcksioNABGVHZXjsoxFWDlSrhOdUk2qhXA8hr2tLjmH40qXUyNapVxMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Lfqlt1MM3/Ts+hjojnYCT4Ml1RcA+mYRAIrO+7uSDI=;
 b=IcmZemJHLF/6gj1zZEwiJWzu31L0yx1HMGk7ZUfy+jymxmuVH6boS3/95t5Si6m/13voKpWIWVgIwPdF22VINfBQyUp2TOIriGdf+yi4xc1MtGVm9i4vMtGNCuwOAoZDJCNR23eCQu11bP8gIvrchUPhMoGG0aZ9cq38L+oJdP04NbsFksdwZa3iLIkJwzo8fguwvHOOz6t3dc8MHmsZ+XTqRpOSUJ+wY+uvt+qZ+93/3B9NsJtlpSvlllBXnEPWV+Bj7tf6JtaZFWxDPLb8+EG/hb9xcZd5L93l1PERpOG3dMNilIsbFMANoMTjKqdo2ch6yFG9sGXE+XOzqyEnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 04:36:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 04:36:41 +0000
Date: Wed, 22 Jan 2025 20:37:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, "Rob
 Clark" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, "Lyude
 Paul" <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Philipp Stanner
 <pstanner@redhat.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, "Yunxiang
 Li" <Yunxiang.Li@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <etnaviv@lists.freedesktop.org>, <lima@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122165104.536c4143@collabora.com>
 <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
 <20250122180353.7ef8fbc1@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250122180353.7ef8fbc1@collabora.com>
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf72efe-e94b-4eaf-eb85-08dd3b6788ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HUXOKzKf1Mr/jo+Ltm5FQHIPEmr5OqAkA7yB93cV9YtVFztlN8Q6bYJfTvnN?=
 =?us-ascii?Q?eUmCmKld5QSWZW40Dwdz6PFESTGw4syQnLgTfz6hR3x9boXuFK8o8ZDNjSJ6?=
 =?us-ascii?Q?vsiWT/UlZBQMp/3LQ1oSROPl65CfDnIOYyQUp0mULKKniJM+jCSIAyc8i0qN?=
 =?us-ascii?Q?gaitANxIyJ6dVw8RxxVhxe9vYzgyTU9o9ViWKrU1lkjXw5xPJ89JWQZ1AH6x?=
 =?us-ascii?Q?3Hwo38HXkGmaaBDoUWMSQ1CgAAJ9ng/FUqtrQcxlDCytzTf6O//AtGDuJKT+?=
 =?us-ascii?Q?dITyetYxJZESSXQveSF91XPs4e4lI10vu4i43gL45qC67v/8uoBPpg3/jx90?=
 =?us-ascii?Q?OrG5oJ49nfMxutUsDgB2A8RuUSm62KlXCHSDb3vDLly37zwoaNrXhiRo7iV7?=
 =?us-ascii?Q?jBjIxoG8bdHiTHdoFb07WdZ6BYp7mwRYhBCnaVbYSHo1SfpnvaNLEsJpFrrV?=
 =?us-ascii?Q?/Be9SoLndgOD8a/ZuifVOcat5e4vClypv0QcddZgDKa09XcUa2awfF8d9ZaA?=
 =?us-ascii?Q?obYePwNAr/v0qMiunYbUUIJVgq5qeLxPZWj4s1IsRES0yW9pAvAogqNwH4bm?=
 =?us-ascii?Q?Di/e6TRAz2jgWezHnBKPSGNYjMOdKU0R6zwG8RSyCapLhEJ6+cvU+6y1660/?=
 =?us-ascii?Q?12pY+QhcHqsxxVpmPd1NROOG4lmFdmWZRJX7RPAveM4tbo6tjCHc/iFFbC1+?=
 =?us-ascii?Q?AIrNFk1ceJenF1VnWPZdLxGkHHMdGCIG3QTCc0CGoqiIJcJCc8u3fFpkqieb?=
 =?us-ascii?Q?zIySLpstPyIgJozb8Dh0TXdrdJUWnPNj7zzbEq15IjwjJDBZYkc6Tk3rlqDz?=
 =?us-ascii?Q?5Qd+r1A7pVSDUx3xiv622EZnRgXRlJvddLgKFRzomBwXqOKTV1qqExpqTUex?=
 =?us-ascii?Q?XSVPriwM+q2NISbRT4pb+VAdflftdmh4K+ZestGqpLi8nVjPr4MQzIfZoAen?=
 =?us-ascii?Q?y+WxKUjukoW2y3eXH0dmZW34zgaPS3uSabuc+Dfas5+4HOPsSJNODwEjrMOh?=
 =?us-ascii?Q?9kXuglqseVxK0Xrikq290Lz87l83GEzmhD40IUHBPvFHAMyxvTGCWn8ZEWAA?=
 =?us-ascii?Q?ip5iJs3NmH2zx6e0G+3S/vxcQGJHOqGs/9pfrKN5zvGJfZqE6U5m3CZ4CElY?=
 =?us-ascii?Q?jJOm7AMpPKXs7KjxOfXpKZZ0qs5LYn1lryo6DQNbusJO4Gy0pbSvy+sN2qnt?=
 =?us-ascii?Q?PJWd7EEMEF5uptOJGBJa0mTzwY8wYEvvlXglMcT+YWA1136Bt+akfYEwh2/e?=
 =?us-ascii?Q?2aSM92TJec/NDo6l6HktFNdxTm5N0ktH2r2SnDRwnJqMOV+CcXkOxMvye2h/?=
 =?us-ascii?Q?xV+KMjdY7fUuqNyCn9URofBwY4rK6g4P7yCMEllhTB4ExfBt7VuyXA+BL+8z?=
 =?us-ascii?Q?YqZrLvPivzqZDR4dth19hl7oMdPP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4bY6wCiuw2/xXCQZURrPYjhetUkeKNJLbTsu8WOiikGPg/SpIAYlOVjKQ5RK?=
 =?us-ascii?Q?9BN7f8W6t4ZdtA5hB7O5P1HETnScQ4sj28hP6ZKwrW9WUT4EIMJxGUQ9BrdV?=
 =?us-ascii?Q?NNma1InUoTe27FXo1dmpuF8+mcftkEnaQyZIj51W4jJLgcjEx5qQrBwEAXfk?=
 =?us-ascii?Q?vA8AcV0uEAgZgQMx0nkb92QvFwxVK7uXx0Z6CDDm1+kkP2PmYJfLyx6dBevP?=
 =?us-ascii?Q?/WPhgxXKDsLDvFIayREmkoLCktq5aMB4CyZihzERuw8tk6MiykrjJQAlge9s?=
 =?us-ascii?Q?yJpA5EcYVZ/N7Wf0DPWtVoypHywkse/hdx4bojJEOFdH/e/cM+dw874qDK8l?=
 =?us-ascii?Q?RrAAlKQYKX1HlLZMee5U4gNVQm3XIoNuO718ACSOdkKj8kGEwDNP7SGaDhNl?=
 =?us-ascii?Q?93IG+V2295UFKvB2cUyLxFwR5kREo46ubP8bHJqLYHksT4w7RjYSOPdInH8I?=
 =?us-ascii?Q?lXVqMnyVdGh+bmzCmwGY2dnOHnBl9wduHvz/FbYzK2D7d9sAtBKNVyilBjjM?=
 =?us-ascii?Q?o0SeJBd5ZjqPhJ7BTIjZIB2UNoVicnXW9XviMMDEKqaSg7smhTuh1C/iBE6Q?=
 =?us-ascii?Q?/5M/+XJYEY2A3nM+pYSDqmyxwJAsylJsgKdraVZzXJuMStRxhrgM8JDqZSZc?=
 =?us-ascii?Q?UtK1zMayy7GCc9V6i4/RkCZBls20lNUhjrg24Eq2k4//yeF1F4uF65cJmAXJ?=
 =?us-ascii?Q?qGD5BUKe7CmaEKpjRfUmivP5agQ4Q9JTw/Uc0uw+46z1zT+XDIyVBK29Cfy1?=
 =?us-ascii?Q?jAD0tNWFoVEN9nlcefupht3NvRK+AU2uOxZn5P9rm9aHyEocTarUtGV0vsOX?=
 =?us-ascii?Q?+H3THN92WH5yOFjZvs0W6cbDXVZcc3RehoM45ajbRxVt04j0iCCyZQg26aXR?=
 =?us-ascii?Q?T1niy2zniv0o6HqJIqVqIdSYGcuWUxbOY8i4tyhBSMaDw7UH38FYF7RAJMN5?=
 =?us-ascii?Q?zqAup2rlFAu2ciQouWlzOMD9z3igxqk3LwaIglRkTtx1oMNwV4ANHYSY7kqX?=
 =?us-ascii?Q?LJET1ivf2lk/kJA5Sk2vFFnu3BUT4Hzqg1A6i83Ist+e1KgRmFLgH5Fri1Fg?=
 =?us-ascii?Q?arn28DsYVAHY//6K/yJwdinDTC59vYGi9LiBdifiLfIpgXc0TLYC4QIaaWt0?=
 =?us-ascii?Q?71KtIG+yEN2KipDs+NJjaPUL9LLea8CxjKS9CWbnnR+8Bhhmv/ZGFcxwxHAF?=
 =?us-ascii?Q?m94SWa2yHkwUgEpUokwYpqDNzDZIf4FSWnLZWqgCd/cu/9pCJ25611hoFUlE?=
 =?us-ascii?Q?H0Dex8XQv4qLdZAJihKm5MrPcU+PEKTvqke9TLgENAk5vi4fddwIc8BWwMya?=
 =?us-ascii?Q?ROqmeHPv8H6YVxUDMiOo1b+ZWtnGQtV57RZFzjgKzPEePdla3X2zbbfX0Bvw?=
 =?us-ascii?Q?KnPnaSKU3J4T+yZ2UzHMLfWY0aqhXlkL0izCH1ubFpKrAHsa8JM/6+EPdM2F?=
 =?us-ascii?Q?S5LVrPB0yBmgFD7hqdGzhGsU+miRf8TfEurs/8l27ypVENbRQVamyXDfIJqX?=
 =?us-ascii?Q?lrxbWnKwb0RjeIvZFgqeAJuad5aXSlfmnGT+8KH9Cc1fYP0fvB3KsE4KVGUs?=
 =?us-ascii?Q?sCFN9/tbGsuKtscqIqcgc7VoK//liEOV9yPy/DqxJXBlbPFjYDrXVWuBmezg?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf72efe-e94b-4eaf-eb85-08dd3b6788ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 04:36:41.8684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwzrbRGL1SKvRz7HEdxSkvukN/fgFf+oKLHI8lpdyDmlsw7kfmAE3ZSSlZW85qRRG0/lTfxTo8UIEG61ZMoCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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

On Wed, Jan 22, 2025 at 06:04:58PM +0100, Boris Brezillon wrote:
> On Wed, 22 Jan 2025 16:14:59 +0000
> Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> 
> > On 22/01/2025 15:51, Boris Brezillon wrote:
> > > On Wed, 22 Jan 2025 15:08:20 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > >   
> > >> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > >> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > >> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group *group,
> > >>   		   const struct drm_panthor_queue_create *args)
> > >>   {
> > >>   	struct drm_gpu_scheduler *drm_sched;
> > >> +	struct drm_sched_init_params sched_params;  
> > > 
> > > nit: Could we use a struct initializer instead of a
> > > memset(0)+field-assignment?
> > > 
> > > 	struct drm_sched_init_params sched_params = {
> 
> Actually, you can even make it const if it's not modified after the
> declaration.
> 
> > > 		.ops = &panthor_queue_sched_ops,
> > > 		.submit_wq = group->ptdev->scheduler->wq,
> > > 		.num_rqs = 1,
> > > 		.credit_limit = args->ringbuf_size / sizeof(u64),
> > > 		.hang_limit = 0,
> > > 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > 		.timeout_wq = group->ptdev->reset.wq,
> > > 		.name = "panthor-queue",
> > > 		.dev = group->ptdev->base.dev,
> > >          };  
> > 

+2

Matt

> > +1 on this as a general approach for the whole series. And I'd drop the 
> > explicit zeros and NULLs. Memsets could then go too.
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > 
> > > The same comment applies the panfrost changes BTW.
> > >   
> > >>   	struct panthor_queue *queue;
> > >>   	int ret;
> > >>   
> > >> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group *group,
> > >>   	if (!queue)
> > >>   		return ERR_PTR(-ENOMEM);
> > >>   
> > >> +	memset(&sched_params, 0, sizeof(struct drm_sched_init_params));
> > >> +
> > >>   	queue->fence_ctx.id = dma_fence_context_alloc(1);
> > >>   	spin_lock_init(&queue->fence_ctx.lock);
> > >>   	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > >> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group *group,
> > >>   	if (ret)
> > >>   		goto err_free_queue;
> > >>   
> > >> +	sched_params.ops = &panthor_queue_sched_ops;
> > >> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
> > >> +	sched_params.num_rqs = 1;
> > >>   	/*
> > >> -	 * Credit limit argument tells us the total number of instructions
> > >> +	 * The credit limit argument tells us the total number of instructions
> > >>   	 * across all CS slots in the ringbuffer, with some jobs requiring
> > >>   	 * twice as many as others, depending on their profiling status.
> > >>   	 */
> > >> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
> > >> -			     group->ptdev->scheduler->wq, 1,
> > >> -			     args->ringbuf_size / sizeof(u64),
> > >> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> > >> -			     group->ptdev->reset.wq,
> > >> -			     NULL, "panthor-queue", group->ptdev->base.dev);
> > >> +	sched_params.credit_limit = args->ringbuf_size / sizeof(u64);
> > >> +	sched_params.hang_limit = 0;
> > >> +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
> > >> +	sched_params.timeout_wq = group->ptdev->reset.wq;
> > >> +	sched_params.score = NULL;
> > >> +	sched_params.name = "panthor-queue";
> > >> +	sched_params.dev = group->ptdev->base.dev;
> > >> +
> > >> +	ret = drm_sched_init(&queue->scheduler, &sched_params);
> > >>   	if (ret)
> > >>   		goto err_free_queue;  
> 
