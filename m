Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35EA19257
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 14:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28F10E113;
	Wed, 22 Jan 2025 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cos+8lah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CC910E0EE;
 Wed, 22 Jan 2025 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737552375; x=1769088375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2rRNVtKnYcxoStmJB+or2dZU6d5U1htzgdj5I8/g6Zw=;
 b=Cos+8lahE0qnNW+dQ08rI4m+XZPuxlE5+3OdHwOm6mwry0t+mC60n9Sq
 IMLwUVlr5PqOEQCUYYxmU5H6Qj45k85OZTwpyz1rTW9h0cZqBPWT7MYsK
 680FhqtK73ZqzYq0kBPulRwmPRswtTapvfbbCLXrrlPOFkIKhLacR5WRS
 K/YY39dvLm16Flc42+awOXFdmDZLs+QLhzfkjkLLMVEADuK03Rkr2XHla
 4pK8qkj2NZ6oBmQU0FVggx+2p3xM3CxLVxfGTyDEZJ+NBmI3wwupfBsA/
 Bq1piMo3rapm4J0zu/q09AhdAp8NJhkPrmBDdLuBWzwqHLDdaG94I2MTY w==;
X-CSE-ConnectionGUID: fXD/jQGyTYCmHtG/we4Ixg==
X-CSE-MsgGUID: IIHpDlr7RgaQmfWPV1XtDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38257485"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="38257485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 05:26:14 -0800
X-CSE-ConnectionGUID: 659pJ2ieTyqUWfkYwb4mrA==
X-CSE-MsgGUID: RVDIG8sXQ4Cx45ez2g1YjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107013479"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 05:26:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 05:26:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 05:26:14 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 05:26:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zd2ykIHuOb3vMtqsw+jsWbQBJGI0AFp10ewZW1x0Q35chlhkfLDH/5GS1UPSfZwv0Q7bItAEAEs8p+vp226Y65XJQdWsrPnY07QaCMYrbgzBxrgqg7aR76vNpaStVU8Ubu5rqXQSegxeZ8mgc87+OJP4e9rENRjfwb66zW8rc77N7xDDNul2nc6CidIqrZL5BawhDNVGadH2Jhrgb1N8VcLpNI4u/A8vTGXgR9/XKi/IkpZcfNwnftO04kR0wOij6jpc9bTBO74PNDb+oNjxSeHF524bCfoKoyznqyUDkb2CIQ037oEkm7rKZQLKtB58XjURn1smJOsTQ+YNf1JHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVtkdQySXgffOoHxJKIAwrXgC0C/KiMpGZcqKIW0U7U=;
 b=Hk1RazUlOpRhd6yLNS+FgMnejQTqLoM69gDDG93ugeVUGCew27AhoOAiAs2fUym+0K/jRK60dtU/33M15LQAcHECSKL7djDjgkYsoREC/jpGxUDHJ/VDCm1j6rwRNHoH51NAgIMoasO5hsVktJITK2fMFybSL9wijOFCJNo5/no0q2njP04fzPXyJcBR+Wp0qllQ1Bwj9kRhmvc25v5B9hsuCTCc/1X+QHLa1PxqiWlYCL1d/rRvUgDmyhB0+mxUjoJXvuZ1cIFfi3ZNUcjEg+XIQ7YQYNPuhiKLeMnz2DkeMawE+TuDqquq8q4GOiQ3A4F1JIt9bbfoDUHdZtlmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 13:25:31 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 13:25:31 +0000
Date: Wed, 22 Jan 2025 13:25:21 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Ingyu Jang <ingyujang25@gmail.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gt: Handle INTEL_WAKEREF_DEF return value in
 gen8_ggtt_bind_get_ce
Message-ID: <eogzndjymansgavkt5wz66ibfbym2hw7codylizd5ldnqr2zue@hqnsstimqgto>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250116193528.2297487-1-ingyujang25@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250116193528.2297487-1-ingyujang25@gmail.com>
X-ClientProxiedBy: ZR2P278CA0041.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: c41a8f11-ceee-437f-5d0c-08dd3ae83e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXhPZTJxNEFRc0loTStIeXZBOHlMMlR5RW5XdVZlYW5iSG54OFFVVzlmQWpQ?=
 =?utf-8?B?dGZDQzhzUCt1aStLMFNjK3FkUFNEMnRzRGxwdUlmUGtRWEM4eWRLcnYxU0tQ?=
 =?utf-8?B?VGZ1OGVCZkN1UGl5RnlOd1ZLcUtCV2o3UnZML3JMbkY4OGtmeXY4ZVNabWph?=
 =?utf-8?B?VVBnN0tSb1JReUU0Zk1KcnFaMVkzby9IWjJOTGlnWnlvanZqdENLLzJBQXRk?=
 =?utf-8?B?WFdsQUdJRTdhb1lYazdQUjA1bEhWaGdBd3p4eEpMYmNDMTVZa2RjRGJkMkNE?=
 =?utf-8?B?dUk0cE02bm5pcERtZ0JqbXEyNEdGaVpQbXRya0p4WDRZdzlGOTBEeVlTNXlF?=
 =?utf-8?B?SnBwMTlPSFJIZHN3WWNhcWdyQkpXUVgxdnlDejd2aGVlVCtBa3MwbHFTNSsz?=
 =?utf-8?B?SVV1RDUxR3ZKZHJ1djRNZHpHcGYwZDRtam8rc01Udkp6dDJoQ25tWmxqeFp5?=
 =?utf-8?B?cGcxdFU5Sks2OVNjTjVuQTBmTTlTU25uZjJ1SS9aaHhpZWY1Rm1GM0lwTnB2?=
 =?utf-8?B?VERTMnpKeitkbmlyNFJKMjNLNXZMRkNBeGRzTVdSNHMvNzhFY0pOYlR1Skw5?=
 =?utf-8?B?YjlRKyt1U1NpYTA1VUhDa0JWZFNRd0ZMYU5kTVRoaGhNd0VjeVVGU2RQWjlv?=
 =?utf-8?B?WGNkUEN1RHYvejRmNG9RNzV5dTJaYmFDQVI0RzljVzlHdVVIWTJvSHNVK0RS?=
 =?utf-8?B?aTV0MVJoSVprOVowdTFJMFYxenZXdExFRFNTNEJuL25obWhQdjNWM2VmVVl3?=
 =?utf-8?B?bHJuWVZ0b0dJOHRVaG5uL05SeTRHclZtSlhlRk5SNHJzNEpxMGlvdVZSR2I1?=
 =?utf-8?B?aGFjcSszUEV6UCsvejZRRzhWaTlkV1diU3p2NU5CeDR5SEQ1RFFzRjVHUmph?=
 =?utf-8?B?UkFGYkE0Z0d3QnF0VDZYanNvaTVnam5iblAxUzA5c0V4WFF5bVZyVVNyZlQ0?=
 =?utf-8?B?eHhkTGw4eXpPRlhHb1RZU28vQ1h3RmZVL21yWUIyRnkweVJZZFZIeXJkZW9X?=
 =?utf-8?B?RDRIcFA1ZTBkUkhVaVNvYTB0R2hxaExRNUZnZ1pYUzF4NzdFZkNQMDAxSkRU?=
 =?utf-8?B?ZWRMNUFPK3FTMFpaQ2dSS2p6ZWFjQ0FKUk14N2h1anVSNGs2Sjc0Lyt5QnJw?=
 =?utf-8?B?OS9DMklLUXlwQmo5UHMwOXZ0SENLKzcvNHZ5U1BXbFRydmpnVlgxMDZGQUph?=
 =?utf-8?B?R2tWbFdodmNIRnJUNFkwVUh4VmRUclF3Yy9MNDIzRVNvTnVnWk1veXc0ZWQx?=
 =?utf-8?B?SCsxWit2eXVTTnROZVd5cU5ZL05xVjBHUXQ3bTFDREFTUWVwT0JURm9rRWxx?=
 =?utf-8?B?ZTR6ZzVBVVlONVZHamFYSkVieFNwdStFdXM2Sko0V1dYaWtLTlVsTUxPUmhT?=
 =?utf-8?B?RmpPK1V1K1l3WDhLTGF4N0xiTUVyR1dMdU1GWHZZT0FKU2RVQzVCRUt5cFdY?=
 =?utf-8?B?RS8rS29ZVTZ6ZnRURDhPQmtHdnVYaisxaWRtSFhKVzJKb09FSkMvZ1ZpdER5?=
 =?utf-8?B?Z2VPUGt4aG9FMzRIejRpWFlGS1RUYVQ2MmRpWXRxNGNUK1FSK1NRZWpKYTFJ?=
 =?utf-8?B?KzZYUmNhVm9ncG1EN3ZTaWR0OGJxclhiYzJjbnkxWlJOeTNtdjhyUENkcmdS?=
 =?utf-8?B?REJPMDRhbVdmdVB2TVJhRTlxdE56cERsc1Evbm94VlJRYm1DQXF4NWZlUS9x?=
 =?utf-8?B?SElvMHFIVStEaUhsTDA1eHIvTWw3UWc3ZC9EYlpMSUt2WXljOWV0U084Q2NI?=
 =?utf-8?B?bXYrSFEvZE10dzA0eElUSzVyMkZzdTBmbUtxNnNkYTUzN0s3YVd0cXZEK01R?=
 =?utf-8?B?MllxYk1ySzRiK3BNdjR0TzRwVEZWQXNVTGtYNU5PbXBvRGl2UTc4U20raGdJ?=
 =?utf-8?B?WS9XbTl6d3RoWE9TbUYxRmE3RmdEK1VCNzJkVEpuUEExMHRCSUc4K2dxekpV?=
 =?utf-8?Q?4AUL/Eaa8u9Sc6RiW0b+8rSENR9MJai+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjBsVHlkVFVFQVE2NWp6bUovcEZNM0VwdzlNdlM4MThzcEFId001RlRFbmhh?=
 =?utf-8?B?SDhIUjlzQWRqdzRDQWJNZno1aGt4eUhRc24zK0RwZVB4ejhDenk3U0l6MWtQ?=
 =?utf-8?B?ZFRId0ZHaFcvUkNsTTBZdkdNVUF6dVdJNWMwYmJiQVB5RWQ3SHAxNndYbHMx?=
 =?utf-8?B?NEhpTitkbmFkc0FFSTY3dFNYQmhrOHh6NmhSRFByRXpScUtzZ0V5V1N4dmtL?=
 =?utf-8?B?aWtKK241d0YyVEJnQVdFVktTSkJrWHdycGJaV3ZwRnRuYTZuWDhjcGVLdXJ6?=
 =?utf-8?B?UHlHQlJ5QWtxTmlaTjRDc0s4aUVkeXhJcmRmQTNLR1V6eXFHS01BcW5PdTc2?=
 =?utf-8?B?aU02TVArYnBZNmxwRWsycHlzTUw3cmxNNGFNRG5Ma0NaTmI1KzkyeWZXNnF5?=
 =?utf-8?B?ZUVnaFpycGdLRGEwNlBlTTVXYVF5ckJ6U3BEN2FLb2NEQnRtcVVMUVN0MnN0?=
 =?utf-8?B?MGVCekhadHQrUVlEa2Jpb0NIN1RkU3NqckFXdkovR2JGYkxvTlUwVzFxekEz?=
 =?utf-8?B?WC82OVc3K25nQnpUelNwTGJaeDltdk8xWnZYRmxQQzhWM09QVFYrMVhNVkZp?=
 =?utf-8?B?TnRpOW9iNWRJeENrS2JwTkQ3MjlQVnBWYUFaOU9ROXFacVVQa01EMjdKeHFu?=
 =?utf-8?B?VFdaSWVsMHRXVXlnTjNOcjJ0ampIVC9YeEQvS05USnFQTXYxTWg4UzdxSnBT?=
 =?utf-8?B?OVZKUTlQUTFQOVVZUkU3NlFvMGt0VjV4WUlzOW9CYzNnaUlBMXVuOGRoNnhr?=
 =?utf-8?B?WDhLSFdJVHBnVTZSUEFsOWluR0xobnk0ZmVQTFgzMVBMWFR5Z0ZxYlZVQ2xO?=
 =?utf-8?B?SEc2a25ualEvS0RFNHR5NDg2RGh4SjVUV2RZaW9XcGVacVJtazZTTTFWWUNP?=
 =?utf-8?B?b01YZzhsOWRRQXdjQlNLTG1CeWV5WndCQVVvTHU3MnVNUldqQnhicFVkQmZK?=
 =?utf-8?B?SXpsSmkwaXRCNHFUbEh6dzAzYUl1cldsOWptUWhnR3cwcHBGWFBpbnpUd1My?=
 =?utf-8?B?REN0Nlo5SmVlamdFVkFvcncyWDdsVk1pK0NSWXloK2ZpYWw3RVZ0dDRNSXdu?=
 =?utf-8?B?ZUUyanJIK1ZGQy9IcmFBRTczMmowYWQ4eFJEaktCaDlJSUtmODZwSThCNGIx?=
 =?utf-8?B?cC9GbENTVWZaSWt2VzFnUWc0NDVScFpzTlRzMDNwZ1NRUDB0Wk9wSFd5b21R?=
 =?utf-8?B?Q0RzczN6aGtXSVVNbEZxY2ozVFFzZmFZU29iTUZkQWFzbFhUT2RRL2ErV0hS?=
 =?utf-8?B?cWlHZ3FwK1oyWCtJYXRhb2hUUU5qR29rcFFWcFF3bzl2dXpLZjhDd0NwVlJC?=
 =?utf-8?B?OGZMWUxSVzF5ZkIyU1NaYlBvbXVFTGlrYU9rdThZSXU3RVBKN2JXZnBjZmFH?=
 =?utf-8?B?dUZnVnp2NG5ScW5KYlNBMkliK2c3VGEzWEhrVERNa3dyZ0VHWG9CWWRTM1BM?=
 =?utf-8?B?dzdHa2lYYUFyOGM3TnhhalpMVXBKaTd6SmFiUGRiVmQwR2RwSzFtYzk2ZmVP?=
 =?utf-8?B?aU9Xc3hka01mL1lZOWZxZ3pNcWZxcytQWUlSbDd3RWdmMHpEcVF1eTlNNWs3?=
 =?utf-8?B?djRZZGtwa3lPZ2ZjMzZNQS9QczhkWXAzSlpsN1dVV2ZHR1BFMnAzc0VRQWQy?=
 =?utf-8?B?NFdOOU9obllsME9vRHhXdHNwK0ZUVndpSGM0bkNzejN6YWFmdjRDN3JrQXQ0?=
 =?utf-8?B?Y1MzOGE2V0tkWVNBSXhUTVE4WGFheWRuY1M3ZGJHdzRLZnVqbkx5NnhNenFi?=
 =?utf-8?B?NkxQa2c2S3RScWtUWlZXakxoSXZHblRKaHBzdTBxQTBGeGJuTTZVcnFSa1lm?=
 =?utf-8?B?V2lpcTBvcGd4SHFPN0dCNzhHZzJNN0xNNlRaM3kyd1Qvdk84a0xoSlBGWU5S?=
 =?utf-8?B?TXVMUEhwQXlDL2h0U0NoQ0dlWlRRS0w1MFJVOGRjdmhocEt6eVdjS3E2T1Rl?=
 =?utf-8?B?QWFBeVMzWVFIUzd4bGVhZ1h0T1k5VnVyb0RWMEpSS05pRW5hRTh1SU1zTjV5?=
 =?utf-8?B?QmRocVFQRDViWWZvTS9sSEFLcitaU2tOMzl3eHlJeEJsNytkaHdmNHUrK094?=
 =?utf-8?B?YjFydzZENDE3U3ErTzlwSjkxb1l1WmVpQURhUlRaMFJaN1oySmRndHgyNSta?=
 =?utf-8?B?bzk5TERRblBxa09QSmVPOTRpVHhrSUdheUxGeTMrUXl1alphVHZiaHhtRGNX?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c41a8f11-ceee-437f-5d0c-08dd3ae83e68
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:25:31.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bi8xoMTcOK75NyQmATO6Hv0LJSpA127ZJqu+rgN/IUncWKtOzLr5pVnIv3R9cQTb82ZLkxORSnOYu8yb8LLYv0U5/b+pmm9Od6ROTsdVnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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

Hi Ingyu,

> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index d60a6ca0cae5..8d22d8f2243d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -311,7 +311,7 @@ static struct intel_context *gen8_ggtt_bind_get_ce(struct i915_ggtt *ggtt, intel
>  	 * doing rpm_resume().
>  	 */
>  	*wakeref = intel_gt_pm_get_if_awake(gt);
> -	if (!*wakeref)
> +	if (!*wakeref || *wakeref == INTEL_WAKEREF_DEF)
INTEL_WAKEREF_DEF is a wrapper for an error pointer - how about
IS_ERR_OR_NULL() macro? Without going a bit deeper into the code
it is not apparent that INTEL_WAKEREF_DEF is indicating an error.

Nice catch nevertheless.

Krzysztof

>  		return NULL;
>  
>  	intel_engine_pm_get(ce->engine);
> -- 
> 2.34.1
> 
