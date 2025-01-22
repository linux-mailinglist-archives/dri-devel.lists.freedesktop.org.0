Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14427A19487
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 16:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08A710E707;
	Wed, 22 Jan 2025 15:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZIx8qod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F99710E706;
 Wed, 22 Jan 2025 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737558149; x=1769094149;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sjgtfijs+xRbd3q5sUfVAVNwmzsCwlqUJs/idaYWwZM=;
 b=MZIx8qodUuExJVD2+l4ZSQy0XFXjdyT9RQWgo2Lf823XMX1GeXbhmA0m
 4WUq+o3rNQsSvL+Kul0qIgK6iYSk7xOHhVGCqIRaCa+EtUKS8CEzXJl07
 IOPhpTSN5oxTb5AStckf0IsSJyVqZKJ0VKRDxrLpwHtB+EsgRyQn8wI3o
 H/Qv6830B0R3Av5OIuv9UvoKjmhFTBFAWPD6iR4fiSy0gjosECXUVqEtG
 rm6gXONQYUySubAdWUbEWusQQe4IG8yPxYiUhOvfTTJXLg3U4R7eRbDBv
 WlTYb3ie27FZ772x6eIzYmIZtJXcj8YXYmCJsev1rd4At4zLNm/Zw+Iac A==;
X-CSE-ConnectionGUID: v1EErvOwQIKybwhV6pfyLA==
X-CSE-MsgGUID: SH4bC1HVQP2oTPt/NnDb3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41949444"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="41949444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 07:02:27 -0800
X-CSE-ConnectionGUID: aadOmE0eTDW7BblBSPJAKw==
X-CSE-MsgGUID: X90MwLNfSS+jnLsL3cxXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111189232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 07:02:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 07:02:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 07:02:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 07:02:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5ZtslIcP8zhDt/4LpevbUWRQQ53PBlLwLPd2hal2CfQDySAgSBuIzvjeO3KEnudhn+bFQKdPaH/kObZ3xZd9x6KZ764k4kCeXOCxnjTdLAOZ2+fzC5HLuTdo8OPHmCdQmYoTnyhqgE1ZPdina3o5vsPOm0w+ZPH2ky5jHesBTsNKtERI8DPJhHw5QQZfPnFNuNf/VKrKOa74WgNDhzjo7V695xsl9mLiJgTDzoOjFVC78DCEkYc6ouXtr1D1ORL5w0JQi12orHVzb7BSjV01g1qpKl47rovSjRiOx0CCxofGZLlSDXqSknCHWO/i3loLWecYWaf4btsvSHRbB/Iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHjo7gaTY6adBiebVtcLT7oHFity3dzTPS4/Ue2iBn4=;
 b=NwipwOtgKGrThIa/gNt8nqh6B8M17Chrez6dO3ABDOVvENVYGAl+7J+D3S0Ms/5RsGIvtls4QiCyKrUu/Esw6YzimNUbhJDMXJ72LlAWF04nTjTMEfVpFgdr9b/os/DobLtcUVzT2EgoaIw2INT0TcJhXSwpAbs3BTztpnApwxRbbQPGF8qZuJ+D+Da1HaCECQ1WebeuZUsJfqIWzK9HMts3CofiGxSnerl1d70MAr7MoODhuz67D1U2vnTJEnF/1jCPg3+usgnWSAVWl/PBuDJywzxPp7ntlH9VF1hNdzN+7MULwMf9a0ZvaMp3HXRU/rJXiZs/3ThTX9rg+EtOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 15:01:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 15:01:51 +0000
Date: Wed, 22 Jan 2025 07:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Philipp
 Stanner" <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 "Xinhui Pan" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, "Rob
 Clark" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, "Lyude
 Paul" <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Melissa Wen <mwen@igalia.com>,
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
Message-ID: <Z5EIki5hPZMbaV+B@lstrano-desk.jf.intel.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
 <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
X-ClientProxiedBy: MW4PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:303:b5::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e55642-9388-478e-570e-08dd3af5b374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CVjqZOm2NqynIDNAUSYvc3QAmDI4d8D1ceu7C1bSii3g48FUNFEFJQE8N3?=
 =?iso-8859-1?Q?vDOZuynjMQagiSy644mjK1Z/GQLmKjZeEUqFV2ThEXY8fFdxxxL/9b/Yx6?=
 =?iso-8859-1?Q?LE96pnpPI+T5seD0a798eOtunvby4nHj2mJEa9FLUNbztxS6EcS9Oxqxqh?=
 =?iso-8859-1?Q?YKoRqgdtcDHRwAEL9i4m2/iSFfSG+81okH3+mWkTJSGZGxHmxQxkBBMMIR?=
 =?iso-8859-1?Q?UlS78uHALvtSAGCkCOUYUlNnt1pJAhY1ViM85uFhRDVuUoMxIpZKhz4nUe?=
 =?iso-8859-1?Q?MDEcEDx3oYmBp0wpl3LI9W3VkvjpRsd3T0UbJrjWBm2scv6U9ephq+Hzjc?=
 =?iso-8859-1?Q?SGPAZ96Rg/RNKj6aLXQaEdkTA1EzCo9y91o1WEVvUbX9QRxvOFTcuJ47Iy?=
 =?iso-8859-1?Q?yn93Wj/NmldqPBFRdyw+tRl+16FPKtJ32gfmRESIs5jQWAr5AJ9DwzNXv+?=
 =?iso-8859-1?Q?gASv4fFMJkdectvT+t7BfQil1b+FwUSQjb4LLYpz91yMjtu7DRZ4sYltOu?=
 =?iso-8859-1?Q?7e10ZsMTeDT7xivgztTzokgHXKrjx2tSpC5pllUWDcylEOsOXppl77iFu5?=
 =?iso-8859-1?Q?I5X6WyRQf7kRHByZM8dwBTqtSTjGROHU7I17f6C0VXJDIqJlz7FFZS96ct?=
 =?iso-8859-1?Q?FH713AeVKNJR/Nd4fbtT7OpGo4/zyvxmZrDBfjijtrScZtIg9CqqzQLAA9?=
 =?iso-8859-1?Q?na6pPXctJftbNmWURT1zP9td7bZMrFPG7LTG7YX4R9v5mvo4aqqr2sAlec?=
 =?iso-8859-1?Q?Oj1y37rJjtf01IOBvp7uOvx4aYxdMLj92U2y0rktFu1clD7UMBQQt1q24e?=
 =?iso-8859-1?Q?hFSVoETPcZVzONcIy4uVrB/9ItyzMWkhzkmSARp1wxl9Sd49dY47AS7Oo2?=
 =?iso-8859-1?Q?gZXUPISZkjGYJJbe46McgMaykHeNRCW5QcokZ/W/d0aoUeQ8QMlxuf6TAD?=
 =?iso-8859-1?Q?6kkdnMQzQg+We0AiXBqf8lRVMyWODDyrhqjn9e4RXKqtXlrvZnuykZOwQC?=
 =?iso-8859-1?Q?KKqAcMgx/1UmPCQeNHyQb7Vlpfv87FD7MpB7h3g4YzMjbtHejbp2d8M2Vb?=
 =?iso-8859-1?Q?SWx0bdvf/Ofgugk6zhI0Z0hG1CA/z845ipFowXx8vQaKuMwZugBs+RHYyy?=
 =?iso-8859-1?Q?N//LwA+coFqPy6aouW8Bpab74fh/RcyZg9AeTwiLcW6uAHV5uPrLewwfhY?=
 =?iso-8859-1?Q?/GsZV8mjD2GIfs7LXIPAFWizCCN/Yr2KEL1XdlsOnzqEZ4JW7yo931sc4r?=
 =?iso-8859-1?Q?V0F5HaIEsKOj/UI41K5D9XU2RXiOvZChGi1vEZJrIjFGu+odfrlPAvyI+1?=
 =?iso-8859-1?Q?vj6kL8oj9LwHxWJjnhrpp1o9ds+4EQ+OUJYHoZE8kiwKTLltgT7KIdvpyB?=
 =?iso-8859-1?Q?+pGNfUIv3eKu3+8BRsYbILwyLR+s0LnzzEuGAJz4j1YwkoJyJdAcEujQ0l?=
 =?iso-8859-1?Q?CS/LqcuQEoz43kKf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8oerolJPUuWcdrDzKR70qERmUnVybbZrC6Yqae9IIkxvTNV1+fBetn6KPF?=
 =?iso-8859-1?Q?b4dOyb8wwgCqnrPx1vKmy42ElxPZWj2xNIZTBvWxgZo4OyG7eQBcR1fmr5?=
 =?iso-8859-1?Q?ZCSYSr2DlvV4hQgUNg8FzKdJg9J3hf5lq0CplO9Yx7eJUlZpOMlYZdJVET?=
 =?iso-8859-1?Q?bxS+HYQz92Mf+9rJLOQW2aZSDH0nowGmu9jw1BsJGGU8PBSe9die3t6ClV?=
 =?iso-8859-1?Q?Oi5swe5gYIBxzABGtH6LQBH69zv4RHo8eBIfqx6SK274H63ZK8wc4HXX0r?=
 =?iso-8859-1?Q?VByBGv5BM9moD9XGYjUH+9hZpaYJtYCXsyHC+vhKqX2sB0/kPl9dI0TTIr?=
 =?iso-8859-1?Q?jXh8pcydrY+r2NiKmuPMkPoY6XNFVzjt1L0zUpH2cHUD20oeLujIGAnymc?=
 =?iso-8859-1?Q?D0RenBs0ZW4ZkwarxbwB3OLYW8xBzyLdXQURCuNmj+NI+J5MPrv+cnikoR?=
 =?iso-8859-1?Q?Dg8nQs/0/69Rz5BGIEKoKbeO9k1H/QyYUwKkC8aWKwVzDYnOIJYfucM+es?=
 =?iso-8859-1?Q?sxvd4MHlCPuVIzpd+tKFw+DADuP0vcNlWGkrIIjWiQH4hzh1Q0vmi7jl89?=
 =?iso-8859-1?Q?LXDrypELML70tgT+U03hh5yaFYh9eN9Om6BMtJqblFbm1pHTvqgLkXtxBH?=
 =?iso-8859-1?Q?rFWscar4VRbALKC17EQkAXEJPFlrTai6MfFBIJ6ect0Na14pJ1XOrNF/6I?=
 =?iso-8859-1?Q?cP59yHSGqA9tSotCCEr38I9cjeRjP4r35VIWfc2bTm/7QQGHU3nI1eIbB0?=
 =?iso-8859-1?Q?G6WWsKvNmPHCa2yhts7J0+A/fgCuYxDLVkY2gXi38WJaHVIlWbHozrfs4e?=
 =?iso-8859-1?Q?Z7ElF68BPqHjDRbNpljpQcQM87g/8INoqX2VrDGuIdWzUK5USLBXKETtE6?=
 =?iso-8859-1?Q?ANXKSZLsTmwP0V9v02bO/wylcySdY+eN5IK/A+i96ZFUvI4/DU1IJl2Jdm?=
 =?iso-8859-1?Q?4G8lhue9T+XqVgEjBbQxp4COoeO6ANEmUDdq20dLFI09tzExWnG6qNsSik?=
 =?iso-8859-1?Q?z+swmnUo4dsWlnfiU3KZfkDNm2DyQkzvzA7bmV9NUBHKE0pgQVQ16LA/o9?=
 =?iso-8859-1?Q?oWIrJNcLqTVV9XM+/BBXp3kQkASOt/52TCevyl97cmXx8i41kAHoAzoxn5?=
 =?iso-8859-1?Q?+JHRBtzJlIS+K+apGcvJLCyQrYxlt1HrPadAri1Zd2QaIC7dJqW65VHxrG?=
 =?iso-8859-1?Q?uVlKI8ZEfeENaEYR2qBZM7szCvokDFMkemSHcOqsQLwb+pbqpOOjlAVDmS?=
 =?iso-8859-1?Q?UYkqdLVkepi1VSLu7ejQC5FLRxq6uDbOd6rIHnnrQPIJ39ufulwjaFROF7?=
 =?iso-8859-1?Q?ni/6nnEdc8UfWCQU+vIPgj2pWJVJ4h91EHJT5SosFDz2sNisClSZcN0Fcx?=
 =?iso-8859-1?Q?dsTovHFHDPF3bGzftYilttRrU8YG3TF5dm//f3Malfqr2zxI95FGeoh2n0?=
 =?iso-8859-1?Q?e59vSNZfL5lqJFdefWEZSPjyRq10es44N1Fi7+q6d0kETKQAbPfamFL71W?=
 =?iso-8859-1?Q?m6ckUAvuEOXMRPK4EjjZfxMtX0NyCrgQoO9cu4LAoqXfHjtd+34OMfDpwl?=
 =?iso-8859-1?Q?1JU5CFSLwK7jfqzu9bSSdCtdx1Gg0rmqFngGJkTK7477kRSREQ6DmEa7ch?=
 =?iso-8859-1?Q?61yh37yi+u4vWrL2FIWC4n/gXRwwkW0/niIizu4DLUVnOO4P1uUyfVpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e55642-9388-478e-570e-08dd3af5b374
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 15:01:51.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohF+7nnFwNbalz+jGdTgt/7q3RDpb9zMtdMGXiFSweb8+mdcghSlZAP5JlqFXbNQGorixhThRgl2w+4THVZXgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Wed, Jan 22, 2025 at 03:48:54PM +0100, Philipp Stanner wrote:
> On Wed, 2025-01-22 at 15:34 +0100, Christian König wrote:
> > Am 22.01.25 um 15:08 schrieb Philipp Stanner:
> > > drm_sched_init() has a great many parameters and upcoming new
> > > functionality for the scheduler might add even more. Generally, the
> > > great number of parameters reduces readability and has already
> > > caused
> > > one missnaming in:
> > > 
> > > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > > nouveau_sched_init()").
> > > 
> > > Introduce a new struct for the scheduler init parameters and port
> > > all
> > > users.
> > > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > Howdy,
> > > 
> > > I have a patch-series in the pipe that will add a `flags` argument
> > > to
> > > drm_sched_init(). I thought it would be wise to first rework the
> > > API as
> > > detailed in this patch. It's really a lot of parameters by now, and
> > > I
> > > would expect that it might get more and more over the years for
> > > special
> > > use cases etc.
> > > 
> > > Regards,
> > > P.
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  21 +++-
> > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  20 ++-
> > >   drivers/gpu/drm/imagination/pvr_queue.c    |  21 +++-
> > >   drivers/gpu/drm/lima/lima_sched.c          |  21 +++-
> > >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  22 ++--
> > >   drivers/gpu/drm/nouveau/nouveau_sched.c    |  20 ++-
> > >   drivers/gpu/drm/panfrost/panfrost_job.c    |  22 ++--
> > >   drivers/gpu/drm/panthor/panthor_mmu.c      |  18 ++-
> > >   drivers/gpu/drm/panthor/panthor_sched.c    |  23 ++--
> > >   drivers/gpu/drm/scheduler/sched_main.c     |  53 +++-----
> > >   drivers/gpu/drm/v3d/v3d_sched.c            | 135 +++++++++++++++-
> > > -----
> > >   drivers/gpu/drm/xe/xe_execlist.c           |  20 ++-
> > >   drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  19 ++-
> > >   include/drm/gpu_scheduler.h                |  35 +++++-
> > >   14 files changed, 311 insertions(+), 139 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index cd4fac120834..c1f03eb5f5ea 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -2821,6 +2821,9 @@ static int
> > > amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > >   {
> > >   	long timeout;
> > >   	int r, i;
> > > +	struct drm_sched_init_params params;
> > 
> > Please keep the reverse xmas tree ordering for variable declaration. 
> > E.g. long lines first and variables like "i" and "r" last.
> 
> Okay dokay
> 
> > 
> > Apart from that looks like a good idea to me.
> > 

+1. Looks like a good idea to me. Quite sure I have transposed
arguments in the past and broken thing, this would be a way to avoid
this.

One bikeshed. s/drm_sched_init_params/drm_sched_init_args? No strong
preference though.

Matt 

> > 
> > > +
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > >   
> > >   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> > >   		struct amdgpu_ring *ring = adev->rings[i];
> > > @@ -2844,12 +2847,18 @@ static int
> > > amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > >   			break;
> > >   		}
> > >   
> > > -		r = drm_sched_init(&ring->sched,
> > > &amdgpu_sched_ops, NULL,
> > > -				   DRM_SCHED_PRIORITY_COUNT,
> > > -				   ring->num_hw_submission, 0,
> > > -				   timeout, adev->reset_domain-
> > > >wq,
> > > -				   ring->sched_score, ring->name,
> > > -				   adev->dev);
> > > +		params.ops = &amdgpu_sched_ops;
> > > +		params.submit_wq = NULL; /* Use the system_wq. */
> > > +		params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +		params.credit_limit = ring->num_hw_submission;
> > > +		params.hang_limit = 0;
> > 
> > Could we please remove the hang limit as first step to get this awful
> > feature deprecated?
> 
> Remove it? From the struct you mean?
> 
> We can mark it as deprecated in the docstring of the new struct. That's
> what you mean, don't you?
> 
> P.
> 
> > 
> > Thanks,
> > Christian.
> > 
> > > +		params.timeout = timeout;
> > > +		params.timeout_wq = adev->reset_domain->wq;
> > > +		params.score = ring->sched_score;
> > > +		params.name = ring->name;
> > > +		params.dev = adev->dev;
> > > +
> > > +		r = drm_sched_init(&ring->sched, &params);
> > >   		if (r) {
> > >   			DRM_ERROR("Failed to create scheduler on
> > > ring %s.\n",
> > >   				  ring->name);
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > index 5b67eda122db..7d8517f1963e 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > @@ -145,12 +145,22 @@ int etnaviv_sched_push_job(struct
> > > etnaviv_gem_submit *submit)
> > >   int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > >   {
> > >   	int ret;
> > > +	struct drm_sched_init_params params;
> > >   
> > > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > > NULL,
> > > -			     DRM_SCHED_PRIORITY_COUNT,
> > > -			     etnaviv_hw_jobs_limit,
> > > etnaviv_job_hang_limit,
> > > -			     msecs_to_jiffies(500), NULL, NULL,
> > > -			     dev_name(gpu->dev), gpu->dev);
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > > +	params.ops = &etnaviv_sched_ops;
> > > +	params.submit_wq = NULL; /* Use the system_wq. */
> > > +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +	params.credit_limit = etnaviv_hw_jobs_limit;
> > > +	params.hang_limit = etnaviv_job_hang_limit;
> > > +	params.timeout = msecs_to_jiffies(500);
> > > +	params.timeout_wq = NULL; /* Use the system_wq. */
> > > +	params.score = NULL;
> > > +	params.name = dev_name(gpu->dev);
> > > +	params.dev = gpu->dev;
> > > +
> > > +	ret = drm_sched_init(&gpu->sched, &params);
> > >   	if (ret)
> > >   		return ret;
> > >   
> > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> > > b/drivers/gpu/drm/imagination/pvr_queue.c
> > > index c4f08432882b..03a2ce1a88e7 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > > @@ -1211,10 +1211,13 @@ struct pvr_queue *pvr_queue_create(struct
> > > pvr_context *ctx,
> > >   	};
> > >   	struct pvr_device *pvr_dev = ctx->pvr_dev;
> > >   	struct drm_gpu_scheduler *sched;
> > > +	struct drm_sched_init_params sched_params;
> > >   	struct pvr_queue *queue;
> > >   	int ctx_state_size, err;
> > >   	void *cpu_map;
> > >   
> > > +	memset(&sched_params, 0, sizeof(struct
> > > drm_sched_init_params));
> > > +
> > >   	if (WARN_ON(type >= sizeof(props)))
> > >   		return ERR_PTR(-EINVAL);
> > >   
> > > @@ -1282,12 +1285,18 @@ struct pvr_queue *pvr_queue_create(struct
> > > pvr_context *ctx,
> > >   
> > >   	queue->timeline_ufo.value = cpu_map;
> > >   
> > > -	err = drm_sched_init(&queue->scheduler,
> > > -			     &pvr_queue_sched_ops,
> > > -			     pvr_dev->sched_wq, 1, 64 * 1024, 1,
> > > -			     msecs_to_jiffies(500),
> > > -			     pvr_dev->sched_wq, NULL, "pvr-queue",
> > > -			     pvr_dev->base.dev);
> > > +	sched_params.ops = &pvr_queue_sched_ops;
> > > +	sched_params.submit_wq = pvr_dev->sched_wq;
> > > +	sched_params.num_rqs = 1;
> > > +	sched_params.credit_limit = 64 * 1024;
> > > +	sched_params.hang_limit = 1;
> > > +	sched_params.timeout = msecs_to_jiffies(500);
> > > +	sched_params.timeout_wq = pvr_dev->sched_wq;
> > > +	sched_params.score = NULL;
> > > +	sched_params.name = "pvr-queue";
> > > +	sched_params.dev = pvr_dev->base.dev;
> > > +
> > > +	err = drm_sched_init(&queue->scheduler, &sched_params);
> > >   	if (err)
> > >   		goto err_release_ufo;
> > >   
> > > diff --git a/drivers/gpu/drm/lima/lima_sched.c
> > > b/drivers/gpu/drm/lima/lima_sched.c
> > > index b40c90e97d7e..a64c50fb6d1e 100644
> > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > @@ -513,20 +513,29 @@ static void lima_sched_recover_work(struct
> > > work_struct *work)
> > >   
> > >   int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char
> > > *name)
> > >   {
> > > +	struct drm_sched_init_params params;
> > >   	unsigned int timeout = lima_sched_timeout_ms > 0 ?
> > >   			       lima_sched_timeout_ms : 10000;
> > >   
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > >   	pipe->fence_context = dma_fence_context_alloc(1);
> > >   	spin_lock_init(&pipe->fence_lock);
> > >   
> > >   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > >   
> > > -	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
> > > -			      DRM_SCHED_PRIORITY_COUNT,
> > > -			      1,
> > > -			      lima_job_hang_limit,
> > > -			      msecs_to_jiffies(timeout), NULL,
> > > -			      NULL, name, pipe->ldev->dev);
> > > +	params.ops = &lima_sched_ops;
> > > +	params.submit_wq = NULL; /* Use the system_wq. */
> > > +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +	params.credit_limit = 1;
> > > +	params.hang_limit = lima_job_hang_limit;
> > > +	params.timeout = msecs_to_jiffies(timeout);
> > > +	params.timeout_wq = NULL; /* Use the system_wq. */
> > > +	params.score = NULL;
> > > +	params.name = name;
> > > +	params.dev = pipe->ldev->dev;
> > > +
> > > +	return drm_sched_init(&pipe->base, &params);
> > >   }
> > >   
> > >   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > index c803556a8f64..49a2c7422dc6 100644
> > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > @@ -59,11 +59,13 @@ static const struct drm_sched_backend_ops
> > > msm_sched_ops = {
> > >   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu,
> > > int id,
> > >   		void *memptrs, uint64_t memptrs_iova)
> > >   {
> > > +	struct drm_sched_init_params params;
> > >   	struct msm_ringbuffer *ring;
> > > -	long sched_timeout;
> > >   	char name[32];
> > >   	int ret;
> > >   
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > >   	/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is a
> > > power of 2 */
> > >   	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
> > >   
> > > @@ -95,13 +97,19 @@ struct msm_ringbuffer
> > > *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> > >   	ring->memptrs = memptrs;
> > >   	ring->memptrs_iova = memptrs_iova;
> > >   
> > > -	 /* currently managing hangcheck ourselves: */
> > > -	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > > +	params.ops = &msm_sched_ops;
> > > +	params.submit_wq = NULL; /* Use the system_wq. */
> > > +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +	params.credit_limit = num_hw_submissions;
> > > +	params.hang_limit = 0;
> > > +	/* currently managing hangcheck ourselves: */
> > > +	params.timeout = MAX_SCHEDULE_TIMEOUT;
> > > +	params.timeout_wq = NULL; /* Use the system_wq. */
> > > +	params.score = NULL;
> > > +	params.name = to_msm_bo(ring->bo)->name;
> > > +	params.dev = gpu->dev->dev;
> > >   
> > > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > > -			     DRM_SCHED_PRIORITY_COUNT,
> > > -			     num_hw_submissions, 0, sched_timeout,
> > > -			     NULL, NULL, to_msm_bo(ring->bo)-
> > > >name, gpu->dev->dev);
> > > +	ret = drm_sched_init(&ring->sched, &params);
> > >   	if (ret) {
> > >   		goto fail;
> > >   	}
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index 4412f2711fb5..f20c2e612750 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -404,9 +404,11 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >   {
> > >   	struct drm_gpu_scheduler *drm_sched = &sched->base;
> > >   	struct drm_sched_entity *entity = &sched->entity;
> > > -	const long timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > +	struct drm_sched_init_params params;
> > >   	int ret;
> > >   
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > >   	if (!wq) {
> > >   		wq = alloc_workqueue("nouveau_sched_wq_%d", 0,
> > > WQ_MAX_ACTIVE,
> > >   				     current->pid);
> > > @@ -416,10 +418,18 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >   		sched->wq = wq;
> > >   	}
> > >   
> > > -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > > -			     NOUVEAU_SCHED_PRIORITY_COUNT,
> > > -			     credit_limit, 0, timeout,
> > > -			     NULL, NULL, "nouveau_sched", drm-
> > > >dev->dev);
> > > +	params.ops = &nouveau_sched_ops;
> > > +	params.submit_wq = wq;
> > > +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +	params.credit_limit = credit_limit;
> > > +	params.hang_limit = 0;
> > > +	params.timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > +	params.timeout_wq = NULL; /* Use the system_wq. */
> > > +	params.score = NULL;
> > > +	params.name = "nouveau_sched";
> > > +	params.dev = drm->dev->dev;
> > > +
> > > +	ret = drm_sched_init(drm_sched, &params);
> > >   	if (ret)
> > >   		goto fail_wq;
> > >   
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > index 9b8e82fb8bc4..6b509ff446b5 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > @@ -836,10 +836,13 @@ static irqreturn_t
> > > panfrost_job_irq_handler(int irq, void *data)
> > >   
> > >   int panfrost_job_init(struct panfrost_device *pfdev)
> > >   {
> > > +	struct drm_sched_init_params params;
> > >   	struct panfrost_job_slot *js;
> > >   	unsigned int nentries = 2;
> > >   	int ret, j;
> > >   
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > >   	/* All GPUs have two entries per queue, but without
> > > jobchain
> > >   	 * disambiguation stopping the right job in the close path
> > > is tricky,
> > >   	 * so let's just advertise one entry in that case.
> > > @@ -872,16 +875,21 @@ int panfrost_job_init(struct panfrost_device
> > > *pfdev)
> > >   	if (!pfdev->reset.wq)
> > >   		return -ENOMEM;
> > >   
> > > +	params.ops = &panfrost_sched_ops;
> > > +	params.submit_wq = NULL; /* Use the system_wq. */
> > > +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +	params.credit_limit = nentries;
> > > +	params.hang_limit = 0;
> > > +	params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
> > > +	params.timeout_wq = pfdev->reset.wq;
> > > +	params.score = NULL;
> > > +	params.name = "pan_js";
> > > +	params.dev = pfdev->dev;
> > > +
> > >   	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> > >   		js->queue[j].fence_context =
> > > dma_fence_context_alloc(1);
> > >   
> > > -		ret = drm_sched_init(&js->queue[j].sched,
> > > -				     &panfrost_sched_ops, NULL,
> > > -				     DRM_SCHED_PRIORITY_COUNT,
> > > -				     nentries, 0,
> > > -				    
> > > msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > -				     pfdev->reset.wq,
> > > -				     NULL, "pan_js", pfdev->dev);
> > > +		ret = drm_sched_init(&js->queue[j].sched,
> > > &params);
> > >   		if (ret) {
> > >   			dev_err(pfdev->dev, "Failed to create
> > > scheduler: %d.", ret);
> > >   			goto err_sched;
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > index a49132f3778b..4362442cbfd8 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -2268,6 +2268,7 @@ panthor_vm_create(struct panthor_device
> > > *ptdev, bool for_mcu,
> > >   	u64 full_va_range = 1ull << va_bits;
> > >   	struct drm_gem_object *dummy_gem;
> > >   	struct drm_gpu_scheduler *sched;
> > > +	struct drm_sched_init_params sched_params;
> > >   	struct io_pgtable_cfg pgtbl_cfg;
> > >   	u64 mair, min_va, va_range;
> > >   	struct panthor_vm *vm;
> > > @@ -2284,6 +2285,8 @@ panthor_vm_create(struct panthor_device
> > > *ptdev, bool for_mcu,
> > >   		goto err_free_vm;
> > >   	}
> > >   
> > > +	memset(&sched_params, 0, sizeof(struct
> > > drm_sched_init_params));
> > > +
> > >   	mutex_init(&vm->heaps.lock);
> > >   	vm->for_mcu = for_mcu;
> > >   	vm->ptdev = ptdev;
> > > @@ -2325,11 +2328,18 @@ panthor_vm_create(struct panthor_device
> > > *ptdev, bool for_mcu,
> > >   		goto err_mm_takedown;
> > >   	}
> > >   
> > > +	sched_params.ops = &panthor_vm_bind_ops;
> > > +	sched_params.submit_wq = ptdev->mmu->vm.wq;
> > > +	sched_params.num_rqs = 1;
> > > +	sched_params.credit_limit = 1;
> > > +	sched_params.hang_limit = 0;
> > >   	/* Bind operations are synchronous for now, no timeout
> > > needed. */
> > > -	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops,
> > > ptdev->mmu->vm.wq,
> > > -			     1, 1, 0,
> > > -			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> > > -			     "panthor-vm-bind", ptdev->base.dev);
> > > +	sched_params.timeout = MAX_SCHEDULE_TIMEOUT;
> > > +	sched_params.timeout_wq = NULL; /* Use the system_wq. */
> > > +	sched_params.score = NULL;
> > > +	sched_params.name = "panthor-vm-bind";
> > > +	sched_params.dev = ptdev->base.dev;
> > > +	ret = drm_sched_init(&vm->sched, &sched_params);
> > >   	if (ret)
> > >   		goto err_free_io_pgtable;
> > >   
> > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> > > b/drivers/gpu/drm/panthor/panthor_sched.c
> > > index ef4bec7ff9c7..a324346d302f 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
> > > *group,
> > >   		   const struct drm_panthor_queue_create *args)
> > >   {
> > >   	struct drm_gpu_scheduler *drm_sched;
> > > +	struct drm_sched_init_params sched_params;
> > >   	struct panthor_queue *queue;
> > >   	int ret;
> > >   
> > > @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
> > > *group,
> > >   	if (!queue)
> > >   		return ERR_PTR(-ENOMEM);
> > >   
> > > +	memset(&sched_params, 0, sizeof(struct
> > > drm_sched_init_params));
> > > +
> > >   	queue->fence_ctx.id = dma_fence_context_alloc(1);
> > >   	spin_lock_init(&queue->fence_ctx.lock);
> > >   	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > > @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group
> > > *group,
> > >   	if (ret)
> > >   		goto err_free_queue;
> > >   
> > > +	sched_params.ops = &panthor_queue_sched_ops;
> > > +	sched_params.submit_wq = group->ptdev->scheduler->wq;
> > > +	sched_params.num_rqs = 1;
> > >   	/*
> > > -	 * Credit limit argument tells us the total number of
> > > instructions
> > > +	 * The credit limit argument tells us the total number of
> > > instructions
> > >   	 * across all CS slots in the ringbuffer, with some jobs
> > > requiring
> > >   	 * twice as many as others, depending on their profiling
> > > status.
> > >   	 */
> > > -	ret = drm_sched_init(&queue->scheduler,
> > > &panthor_queue_sched_ops,
> > > -			     group->ptdev->scheduler->wq, 1,
> > > -			     args->ringbuf_size / sizeof(u64),
> > > -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > -			     group->ptdev->reset.wq,
> > > -			     NULL, "panthor-queue", group->ptdev-
> > > >base.dev);
> > > +	sched_params.credit_limit = args->ringbuf_size /
> > > sizeof(u64);
> > > +	sched_params.hang_limit = 0;
> > > +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
> > > +	sched_params.timeout_wq = group->ptdev->reset.wq;
> > > +	sched_params.score = NULL;
> > > +	sched_params.name = "panthor-queue";
> > > +	sched_params.dev = group->ptdev->base.dev;
> > > +
> > > +	ret = drm_sched_init(&queue->scheduler, &sched_params);
> > >   	if (ret)
> > >   		goto err_free_queue;
> > >   
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 57da84908752..27db748a5269 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1240,40 +1240,25 @@ static void drm_sched_run_job_work(struct
> > > work_struct *w)
> > >    * drm_sched_init - Init a gpu scheduler instance
> > >    *
> > >    * @sched: scheduler instance
> > > - * @ops: backend operations for this scheduler
> > > - * @submit_wq: workqueue to use for submission. If NULL, an
> > > ordered wq is
> > > - *	       allocated and used
> > > - * @num_rqs: number of runqueues, one for each priority, up to
> > > DRM_SCHED_PRIORITY_COUNT
> > > - * @credit_limit: the number of credits this scheduler can hold
> > > from all jobs
> > > - * @hang_limit: number of times to allow a job to hang before
> > > dropping it
> > > - * @timeout: timeout value in jiffies for the scheduler
> > > - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > > system_wq is
> > > - *		used
> > > - * @score: optional score atomic shared with other schedulers
> > > - * @name: name used for debugging
> > > - * @dev: target &struct device
> > > + * @params: scheduler initialization parameters
> > >    *
> > >    * Return 0 on success, otherwise error code.
> > >    */
> > >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > -		   const struct drm_sched_backend_ops *ops,
> > > -		   struct workqueue_struct *submit_wq,
> > > -		   u32 num_rqs, u32 credit_limit, unsigned int
> > > hang_limit,
> > > -		   long timeout, struct workqueue_struct
> > > *timeout_wq,
> > > -		   atomic_t *score, const char *name, struct
> > > device *dev)
> > > +		const struct drm_sched_init_params *params)
> > >   {
> > >   	int i;
> > >   
> > > -	sched->ops = ops;
> > > -	sched->credit_limit = credit_limit;
> > > -	sched->name = name;
> > > -	sched->timeout = timeout;
> > > -	sched->timeout_wq = timeout_wq ? : system_wq;
> > > -	sched->hang_limit = hang_limit;
> > > -	sched->score = score ? score : &sched->_score;
> > > -	sched->dev = dev;
> > > +	sched->ops = params->ops;
> > > +	sched->credit_limit = params->credit_limit;
> > > +	sched->name = params->name;
> > > +	sched->timeout = params->timeout;
> > > +	sched->timeout_wq = params->timeout_wq ? : system_wq;
> > > +	sched->hang_limit = params->hang_limit;
> > > +	sched->score = params->score ? params->score : &sched-
> > > >_score;
> > > +	sched->dev = params->dev;
> > >   
> > > -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > > +	if (params->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > >   		/* This is a gross violation--tell drivers what
> > > the  problem is.
> > >   		 */
> > >   		drm_err(sched, "%s: num_rqs cannot be greater than
> > > DRM_SCHED_PRIORITY_COUNT\n",
> > > @@ -1288,16 +1273,16 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched,
> > >   		return 0;
> > >   	}
> > >   
> > > -	if (submit_wq) {
> > > -		sched->submit_wq = submit_wq;
> > > +	if (params->submit_wq) {
> > > +		sched->submit_wq = params->submit_wq;
> > >   		sched->own_submit_wq = false;
> > >   	} else {
> > >   #ifdef CONFIG_LOCKDEP
> > > -		sched->submit_wq =
> > > alloc_ordered_workqueue_lockdep_map(name,
> > > -
> > > 								       WQ_MEM_RECLAIM,
> > > -
> > > 								       &drm_sched_lockdep_map);
> > > +		sched->submit_wq =
> > > alloc_ordered_workqueue_lockdep_map(
> > > +					params->name,
> > > WQ_MEM_RECLAIM,
> > > +					&drm_sched_lockdep_map);
> > >   #else
> > > -		sched->submit_wq = alloc_ordered_workqueue(name,
> > > WQ_MEM_RECLAIM);
> > > +		sched->submit_wq = alloc_ordered_workqueue(params-
> > > >name, WQ_MEM_RECLAIM);
> > >   #endif
> > >   		if (!sched->submit_wq)
> > >   			return -ENOMEM;
> > > @@ -1305,11 +1290,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched,
> > >   		sched->own_submit_wq = true;
> > >   	}
> > >   
> > > -	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched-
> > > >sched_rq),
> > > +	sched->sched_rq = kmalloc_array(params->num_rqs,
> > > sizeof(*sched->sched_rq),
> > >   					GFP_KERNEL | __GFP_ZERO);
> > >   	if (!sched->sched_rq)
> > >   		goto Out_check_own;
> > > -	sched->num_rqs = num_rqs;
> > > +	sched->num_rqs = params->num_rqs;
> > >   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > > i++) {
> > >   		sched->sched_rq[i] = kzalloc(sizeof(*sched-
> > > >sched_rq[i]), GFP_KERNEL);
> > >   		if (!sched->sched_rq[i])
> > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > > b/drivers/gpu/drm/v3d/v3d_sched.c
> > > index 99ac4995b5a1..716e6d074d87 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
> > > v3d_cpu_sched_ops = {
> > >   	.free_job = v3d_cpu_job_free
> > >   };
> > >   
> > > +/*
> > > + * v3d's scheduler instances are all identical, except for ops and
> > > name.
> > > + */
> > > +static void
> > > +v3d_common_sched_init(struct drm_sched_init_params *params, struct
> > > device *dev)
> > > +{
> > > +	memset(params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > > +	params->submit_wq = NULL; /* Use the system_wq. */
> > > +	params->num_rqs = DRM_SCHED_PRIORITY_COUNT;
> > > +	params->credit_limit = 1;
> > > +	params->hang_limit = 0;
> > > +	params->timeout = msecs_to_jiffies(500);
> > > +	params->timeout_wq = NULL; /* Use the system_wq. */
> > > +	params->score = NULL;
> > > +	params->dev = dev;
> > > +}
> > > +
> > > +static int
> > > +v3d_bin_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops = &v3d_bin_sched_ops;
> > > +	params.name = "v3d_bin";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_render_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops = &v3d_render_sched_ops;
> > > +	params.name = "v3d_render";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_tfu_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops = &v3d_tfu_sched_ops;
> > > +	params.name = "v3d_tfu";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_csd_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops = &v3d_csd_sched_ops;
> > > +	params.name = "v3d_csd";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_cache_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops = &v3d_cache_clean_sched_ops;
> > > +	params.name = "v3d_cache_clean";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_cpu_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +	struct drm_sched_init_params params;
> > > +
> > > +	v3d_common_sched_init(&params, v3d->drm.dev);
> > > +	params.ops = &v3d_cpu_sched_ops;
> > > +	params.name = "v3d_cpu";
> > > +
> > > +	return drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > > &params);
> > > +}
> > > +
> > >   int
> > >   v3d_sched_init(struct v3d_dev *v3d)
> > >   {
> > > -	int hw_jobs_limit = 1;
> > > -	int job_hang_limit = 0;
> > > -	int hang_limit_ms = 500;
> > >   	int ret;
> > >   
> > > -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > -			     &v3d_bin_sched_ops, NULL,
> > > -			     DRM_SCHED_PRIORITY_COUNT,
> > > -			     hw_jobs_limit, job_hang_limit,
> > > -			     msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			     NULL, "v3d_bin", v3d->drm.dev);
> > > +	ret = v3d_bin_sched_init(v3d);
> > >   	if (ret)
> > >   		return ret;
> > >   
> > > -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > -			     &v3d_render_sched_ops, NULL,
> > > -			     DRM_SCHED_PRIORITY_COUNT,
> > > -			     hw_jobs_limit, job_hang_limit,
> > > -			     msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			     NULL, "v3d_render", v3d->drm.dev);
> > > +	ret = v3d_render_sched_init(v3d);
> > >   	if (ret)
> > >   		goto fail;
> > >   
> > > -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > -			     &v3d_tfu_sched_ops, NULL,
> > > -			     DRM_SCHED_PRIORITY_COUNT,
> > > -			     hw_jobs_limit, job_hang_limit,
> > > -			     msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > > +	ret = v3d_tfu_sched_init(v3d);
> > >   	if (ret)
> > >   		goto fail;
> > >   
> > >   	if (v3d_has_csd(v3d)) {
> > > -		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > -				     &v3d_csd_sched_ops, NULL,
> > > -				     DRM_SCHED_PRIORITY_COUNT,
> > > -				     hw_jobs_limit,
> > > job_hang_limit,
> > > -				    
> > > msecs_to_jiffies(hang_limit_ms), NULL,
> > > -				     NULL, "v3d_csd", v3d-
> > > >drm.dev);
> > > +		ret = v3d_csd_sched_init(v3d);
> > >   		if (ret)
> > >   			goto fail;
> > >   
> > > -		ret = drm_sched_init(&v3d-
> > > >queue[V3D_CACHE_CLEAN].sched,
> > > -				     &v3d_cache_clean_sched_ops,
> > > NULL,
> > > -				     DRM_SCHED_PRIORITY_COUNT,
> > > -				     hw_jobs_limit,
> > > job_hang_limit,
> > > -				    
> > > msecs_to_jiffies(hang_limit_ms), NULL,
> > > -				     NULL, "v3d_cache_clean", v3d-
> > > >drm.dev);
> > > +		ret = v3d_cache_sched_init(v3d);
> > >   		if (ret)
> > >   			goto fail;
> > >   	}
> > >   
> > > -	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > > -			     &v3d_cpu_sched_ops, NULL,
> > > -			     DRM_SCHED_PRIORITY_COUNT,
> > > -			     1, job_hang_limit,
> > > -			     msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -			     NULL, "v3d_cpu", v3d->drm.dev);
> > > +	ret = v3d_cpu_sched_init(v3d);
> > >   	if (ret)
> > >   		goto fail;
> > >   
> > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > > b/drivers/gpu/drm/xe/xe_execlist.c
> > > index a8c416a48812..7f29b7f04af4 100644
> > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > @@ -332,10 +332,13 @@ static const struct drm_sched_backend_ops
> > > drm_sched_ops = {
> > >   static int execlist_exec_queue_init(struct xe_exec_queue *q)
> > >   {
> > >   	struct drm_gpu_scheduler *sched;
> > > +	struct drm_sched_init_params params;
> > >   	struct xe_execlist_exec_queue *exl;
> > >   	struct xe_device *xe = gt_to_xe(q->gt);
> > >   	int err;
> > >   
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > >   	xe_assert(xe, !xe_device_uc_enabled(xe));
> > >   
> > >   	drm_info(&xe->drm, "Enabling execlist submission (GuC
> > > submission disabled)\n");
> > > @@ -346,11 +349,18 @@ static int execlist_exec_queue_init(struct
> > > xe_exec_queue *q)
> > >   
> > >   	exl->q = q;
> > >   
> > > -	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> > > -			     q->lrc[0]->ring.size /
> > > MAX_JOB_SIZE_BYTES,
> > > -			     XE_SCHED_HANG_LIMIT,
> > > XE_SCHED_JOB_TIMEOUT,
> > > -			     NULL, NULL, q->hwe->name,
> > > -			     gt_to_xe(q->gt)->drm.dev);
> > > +	params.ops = &drm_sched_ops;
> > > +	params.submit_wq = NULL; /* Use the system_wq. */
> > > +	params.num_rqs = 1;
> > > +	params.credit_limit = q->lrc[0]->ring.size /
> > > MAX_JOB_SIZE_BYTES;
> > > +	params.hang_limit = XE_SCHED_HANG_LIMIT;
> > > +	params.timeout = XE_SCHED_JOB_TIMEOUT;
> > > +	params.timeout_wq = NULL; /* Use the system_wq. */
> > > +	params.score = NULL;
> > > +	params.name = q->hwe->name;
> > > +	params.dev = gt_to_xe(q->gt)->drm.dev;
> > > +
> > > +	err = drm_sched_init(&exl->sched, &params);
> > >   	if (err)
> > >   		goto err_free;
> > >   
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > index 50361b4638f9..2129fee83f25 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > @@ -63,13 +63,26 @@ int xe_sched_init(struct xe_gpu_scheduler
> > > *sched,
> > >   		  atomic_t *score, const char *name,
> > >   		  struct device *dev)
> > >   {
> > > +	struct drm_sched_init_params params;
> > > +
> > >   	sched->ops = xe_ops;
> > >   	INIT_LIST_HEAD(&sched->msgs);
> > >   	INIT_WORK(&sched->work_process_msg,
> > > xe_sched_process_msg_work);
> > >   
> > > -	return drm_sched_init(&sched->base, ops, submit_wq, 1,
> > > hw_submission,
> > > -			      hang_limit, timeout, timeout_wq,
> > > score, name,
> > > -			      dev);
> > > +	memset(&params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > > +	params.ops = ops;
> > > +	params.submit_wq = submit_wq;
> > > +	params.num_rqs = 1;
> > > +	params.credit_limit = hw_submission;
> > > +	params.hang_limit = hang_limit;
> > > +	params.timeout = timeout;
> > > +	params.timeout_wq = timeout_wq;
> > > +	params.score = score;
> > > +	params.name = name;
> > > +	params.dev = dev;
> > > +
> > > +	return drm_sched_init(&sched->base, &params);
> > >   }
> > >   
> > >   void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index 95e17504e46a..1a834ef43862 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -553,12 +553,37 @@ struct drm_gpu_scheduler {
> > >   	struct device			*dev;
> > >   };
> > >   
> > > +/**
> > > + * struct drm_sched_init_params - parameters for initializing a
> > > DRM GPU scheduler
> > > + *
> > > + * @ops: backend operations provided by the driver
> > > + * @submit_wq: workqueue to use for submission. If NULL, an
> > > ordered wq is
> > > + *	       allocated and used
> > > + * @num_rqs: Number of run-queues. This is at most
> > > DRM_SCHED_PRIORITY_COUNT,
> > > + *           as there's usually one run-queue per priority, but
> > > could be less.
> > > + * @credit_limit: the number of credits this scheduler can hold
> > > from all jobs
> > > + * @hang_limit: number of times to allow a job to hang before
> > > dropping it
> > > + * @timeout: timeout value in jiffies for the scheduler
> > > + * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > > system_wq is
> > > + *		used
> > > + * @score: optional score atomic shared with other schedulers
> > > + * @name: name used for debugging
> > > + * @dev: associated device. Used for debugging
> > > + */
> > > +struct drm_sched_init_params {
> > > +	const struct drm_sched_backend_ops *ops;
> > > +	struct workqueue_struct *submit_wq;
> > > +	struct workqueue_struct *timeout_wq;
> > > +	u32 num_rqs, credit_limit;
> > > +	unsigned int hang_limit;
> > > +	long timeout;
> > > +	atomic_t *score;
> > > +	const char *name;
> > > +	struct device *dev;
> > > +};
> > > +
> > >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > -		   const struct drm_sched_backend_ops *ops,
> > > -		   struct workqueue_struct *submit_wq,
> > > -		   u32 num_rqs, u32 credit_limit, unsigned int
> > > hang_limit,
> > > -		   long timeout, struct workqueue_struct
> > > *timeout_wq,
> > > -		   atomic_t *score, const char *name, struct
> > > device *dev);
> > > +		const struct drm_sched_init_params *params);
> > >   
> > >   void drm_sched_fini(struct drm_gpu_scheduler *sched);
> > >   int drm_sched_job_init(struct drm_sched_job *job,
> > 
> 
