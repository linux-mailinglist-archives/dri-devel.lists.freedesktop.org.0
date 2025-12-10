Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA89CB38F5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 18:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F85610E781;
	Wed, 10 Dec 2025 17:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeJDRZHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7306110E781;
 Wed, 10 Dec 2025 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765386525; x=1796922525;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sG6km7MgWKOBaF3rnH1M6uqstcqgAVYGJm9cA1uFACE=;
 b=XeJDRZHDKVDbzd3yOTQ4z+zZLtTia9hgCpVkNfcqMcI0cPLycok4k7EQ
 SGwARhj77J5CwCw+HUpLV5x7KB1O7arywZX6Ahh9WbSzWXOerCHu+K2ju
 EQ5yYRCVfXIAkIkXYHl5lCoiqog7TE0Zab3lHNKY2AhzXzADCKeWFYVPR
 K0TON5VoahvDVscXWXf0IsgTSSIRZSINoCARYol4a+ruo3g2iigickkCy
 3g0mUeDkFfLwu1H5XHjzGI3xT42ouYTqn6HTwXsyPMD1i25hq4xQSVptJ
 fOE8Y+Q57/Dg7+gxO1Gj3eEAwPgDDU05hec89IAJAdJ8XL3clEK3GShKZ w==;
X-CSE-ConnectionGUID: Wre1tV76RMKrfjZD5iuX0A==
X-CSE-MsgGUID: +YlFfvcpQ7uOqd80UzI3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78474430"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="78474430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:08:45 -0800
X-CSE-ConnectionGUID: DS6BiSXZSf2ZngKBu+q0og==
X-CSE-MsgGUID: a+AVf7YFQ5K6bG6rkcTvuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="227612164"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:08:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:08:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 09:08:43 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:08:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtQ4/EVKLjKASD0CWkojrl+WkmLmSevEMZmHIem6HUm+XFFSpylQ4y4SUammPkuf7Cf6JSlq0CFFNvXSlblSBHOG6qHSUT7rE3Ig62gLfFvLk8SF+thy70ZHzqOHpX+ryOx2/gVCGQOonh1+cx6Cok8XCM/zeSegdPHmjCQl7GR1xe/2UsJb+SQqNWu7AZp6nct2e76ZlsjtnxCFfqj37MaABbnx/RUky1rLwSpJpbmM3INk7pxNZRi/9H8hkiR5Hz/9ms4dw0kdnJUesLTSZoFjW3GMKmYK0zLZGPN1rYM606C9VR7XeN/ZZmwCdnYU0k3UuOKDa2kO88twKdxrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0DXuSZz7J3hDj8alCfa8UGhoRpJjXHp6M2uGEP/WTo=;
 b=WjCaeCJw7UFvhbX39dAykZOVJw2QUnBAnrZmeiZ7j/Z2laq3jlP/Zz+ulgVjgypxPf7VCiLl38+X/irKZnMCk7eEeDd6KUmt5OjxO8fJpv5veJjwT2EuTpXWSHts6hp/vh5UtmIjvir6t984NRtnAcT4tlSXOMjgz11caC42/dDV/vmWpamgJU91vmCYiRtGf6nSAM2cIagh1rrTSRAjaKxKUq4Ug850gZhw6R76b0/k6HZGf8YfOjILcJ1DIjm9X1VlNt0WandlTnZE/TpSgeV0XL+ahrWAPRIULp7RGmm509RjevP2WoEFGw0EUEz6pCOCCVIJjOJb6tkkMLzW5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:08:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:08:41 +0000
Date: Wed, 10 Dec 2025 09:08:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <vitaly.prosyak@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, "Lucas
 Stach" <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTmpFgeDsyq0a9vK@lstrano-desk.jf.intel.com>
References: <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
 <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
 <8ceb06b4-5f56-471d-91f6-a6ea6733e9a8@amd.com>
 <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
X-ClientProxiedBy: MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5a2792-7818-4594-4fa5-08de380ec4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0dyUWo4TU44OTNwZWtMNTRxdWNrS2JpYVQ2UC9qK3pnWlRhTDR1OHdsdkdR?=
 =?utf-8?B?MnEyb0lGOGprdkZsWkpLZUhUTWp2YkwvMXQ3UCt2WW50VldZK0cweHpKQlJu?=
 =?utf-8?B?U05sb2UzN1JucC9uRk5aUlRhSXMzb01Bd2ZPMlo4WEl2aXQ1cElwcGEyZDRH?=
 =?utf-8?B?R3lraEZHTXJZdmtlQ1BiQVFRVjZnckpqclRoOTE3QzI2K05NdmRidmFGWjla?=
 =?utf-8?B?MEJlcW80MEd1dnhyUXpuMHdiRElOOENQWE1yanRPR0NNMTh2clJlZklQZ3Ir?=
 =?utf-8?B?T1BpSEhZdjdRWGtkN1RhNXdGYW1LcnVrOHE4OGNvaXBJM0hBR0FvSGdxSnli?=
 =?utf-8?B?TnFpRnZtKytuVVZiWGpSdEs4S2RXb3o0QjhCWWw3dzF2SmpvRnVhZVYzbnl5?=
 =?utf-8?B?V0E2UjhsTW9YNjlnbGYxSTJOS0xuZHM0UEQ5RXl0a1paZm5LY2MrVlh1VkFL?=
 =?utf-8?B?ZU9ibllYZXNTd3VvMUl5UVFzbTY5TFRCc3J6N3M5S0ozRkpxSjh1SVVsRVd2?=
 =?utf-8?B?Z3Rnd2FoQU1LU0haVHNQcnVFSHR5cUFsTkNTNjBpbExZdWFrTzVzeDFHM2x4?=
 =?utf-8?B?bFdRckl4QVFTK0xUSXA3dmhlZXQ2OVVUUE5wRzF4dHQ1aVgxalNuNVhJNXlo?=
 =?utf-8?B?Vk5EaHlaaXBpQ2pvV2RCdFBpZzBWeVJENU5sdTlUNEV2V0cxakdVenZsTWlZ?=
 =?utf-8?B?MjdSV05NaVRsVTA4cHVCbTR0RkxNTURNcUx6bnd3aTd4Y2VUcm14ejM4WEdF?=
 =?utf-8?B?ZXZHQml4MzcwS0NtcmROODF6RjcxRXB3V3ZDRXg1NnlvQ2lLSm1ncTBQZFAv?=
 =?utf-8?B?MmJvK0tnQlludWZXbEVWWXd4eWNLS0NvSDFDN09wNEhKNGtrdExOeWtsMmdn?=
 =?utf-8?B?dEdMU0lpa04xczN4YjVMOGVmRDFGN1ZlamQ0cXhjQndzUkJuYS9XR0dGWk5E?=
 =?utf-8?B?b0Q2Y3htRTNlNkRuZE5WV2pVbUFPNFI0YTJmdlRseUVVQVIxazZBbXBua2h4?=
 =?utf-8?B?WU9TNnlVL2xzeFNQOWR2U0piUHR2ay9vSGsrd3lqTVI4QXBSK3R6UTFBbjVH?=
 =?utf-8?B?NFNsYTVZbUx1NzVQdkt5ZnBMeXNJNlFHUWNobTgvNnFHNDdoai9IQWc3VTJJ?=
 =?utf-8?B?VHVLMkl5SWhNM1J5L2dienFGdzRjQkpnRk5tc1B5eVJrOWdaVFVwWXRSUWVq?=
 =?utf-8?B?Y2c4cldHTHBRUlB3SVdvbmFEbWRlYzBlMmd5M0JaZ00vNnBUTHhFbkRQekhl?=
 =?utf-8?B?d1Bndk8wcDBvZXM2dGNrUDM1cmVzTkpvdjBzK1ZCcW8zaHJZampsdmZDbE5U?=
 =?utf-8?B?bWY5OERsMExnQUtsMUMzR215ejhuMUkxMmxJbWc3bDdFT0FxVDZDV2dsRTRl?=
 =?utf-8?B?TzB2QjJuSHoxM0JkQ0NSTjh4YkNaRWQyRVUrNnB3WHh6bEw1bGdwb3pLb1VE?=
 =?utf-8?B?OEZsQUR5aXJuaEczRnhJdU9NN2VpNXBaRkdtZTFYc3RHcTRlcEw2QTRYODNq?=
 =?utf-8?B?cFBLRjFrWXBrTnZMQi9VUDBmekJFZnNZckZEb2w5RWhCSFNFSy83K2dSSXhy?=
 =?utf-8?B?dzdpbzhVZnRYU1ZwNTFVbndqZUNGV3pRSFRLb3pKZ1BWbGp5UzB0VFIzU0JW?=
 =?utf-8?B?aExFS2RYazNiNnpCb05OVHE2VUhQL3V2b2tqcFpra2pUVzRHQVlXOEQ1YnRW?=
 =?utf-8?B?d3I5ZjRwcUl4bGNsZnViYittbFBqL3ZDdE1OMHp3SGxyYjcvaTlTVS9UYUFG?=
 =?utf-8?B?dmZHNVBnaDh0K2thTGVKVDhRbkVkbmtwbmpTY3k0ZTJTeGpsYlZBcjNVbGRT?=
 =?utf-8?B?QWdkZHU3ZUVhUXBRMU8yQ0orQWdUMHZuWGZhazU5d2RZRFJsUmJJdE0wWTUw?=
 =?utf-8?B?b3ZoMEpNWFluSVozTitMZEpQeWRDTk96eWFSUk5oeDRMNk04ZG5vcDF2NjFs?=
 =?utf-8?Q?ySeS5X8UklDhS31yMqHCxQfcfLU0Ouas?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdFWUJYT3lyWlRQZGI0VlE4NW9PSUxEVW9NdnVXMEh0ekFhNDltcnRtZWFY?=
 =?utf-8?B?aUVxNkFEQXdGWXBtR29PQmZHZ3BvN1FQMStweXZVSE9YMCtYQndxVjQrYUUw?=
 =?utf-8?B?cDBDK2plT0dvOFZIY2dwaEcvUWhPVFMyL3pNNGtNay8yaTJBVG1MM3gwNHVi?=
 =?utf-8?B?djNDSjY0U3I3Qjd2QS85N3d5aTVjVVNJYnh4M25lVHFmblpGOHVVL2VTN0ZU?=
 =?utf-8?B?SzRNSGJzRHN4VEFNWk1YaXhQMlJSQU5NSHljSGpIanh0SG9hK2NnRHdqcm1k?=
 =?utf-8?B?RDBlcVNSZnk4NjZYR2J4aFVjSndzWkNkd3RsSEF4ZkpuM1lUOGVaQTdmY2Nr?=
 =?utf-8?B?OXNZU1NKM09MeGZQN251RStNWnlpOXZsU1p3OUtGNkdNTkNvVUxzMGUzL3lh?=
 =?utf-8?B?aEFCdDRieWlnNnltWDR3VzdDcHQwVFFwem9HSUhxaVNzOWFsaE5KdEUyT0h1?=
 =?utf-8?B?OWk1MmxVMzMxcS9nRzFRQllRVFFYL1hDZ1RBTXFQUlpVeU5QQUF0TWhCNjZx?=
 =?utf-8?B?WDJHT0NmODhONmJ6Uisyc3FEUHU0RTUwbUhCUG9kTS8zNEgyT20wMmZLTy9l?=
 =?utf-8?B?TlhMQmtKWHIvd3BIUTRqb20xK2ZpWk96eitjbDhuVmRBY0tnNFEzNnRqRXk5?=
 =?utf-8?B?c1hqR1JCajhCa1QwUHdUUXkyMDFXazVnc1BTWlVPYUlISkZXbHBUVGNGTFlM?=
 =?utf-8?B?U2hHNjRmbjJVVW5zQThlYkVZZ2ZFUGFmUW03czlaZ1h1MVRjbzFnRERVYnJo?=
 =?utf-8?B?ZnR3MFRLSXZkSVNmTXVyL1ZvR2ZscGprZTlpRnkzNlIyWmJXMS96RTdUTEw3?=
 =?utf-8?B?MmZiREQvRlBrRUdEM2ZqbmpFaEkzVUw2cFI2aTZsWkMrM1ZFMzFIbHk5cHhX?=
 =?utf-8?B?YzZBZWRjWWN6anNrbGJBQnhhMlRrVUZLbzdtU3R5SVZCNWEyL2svdGNBQUZX?=
 =?utf-8?B?SXkwRVlMcGN0bGVEZkUzeGZSWFhFTG5UT29BUTFWWmVmRlRqUXk2T00xWkU5?=
 =?utf-8?B?eVZFTXlRWTJWWEhTUHd5MnVZbzVFZzE5eEtXaHNyM0FEMWR1UEpwSkkvb2JM?=
 =?utf-8?B?MkZCeUxmNWV1V3lPQmYzNFZLYk9QRXJDSWtjeGIrY214dk9xM2UvcDRaRno1?=
 =?utf-8?B?aWhXaFNKdEZDNHh0Skxtd3lEUGhnYVZqVmJGaTZRTnpONU5tUXFabDM1dHNl?=
 =?utf-8?B?L2YwTVFjUGgvRmFwbVE0QmFEbzI2SXNCYU1Sd0kvSE53RVFDNisrMC9aL0JZ?=
 =?utf-8?B?RHgwQ3pzTVczbVlpQ0pucTNCa2pjNStnTlJOeTllVTFEVlVBeEdHOXo5NjJh?=
 =?utf-8?B?N0h5QWp6YU9xQUdWVDg3MXlKVFpvUEtLbURUVjNaZGFqOGNMV2hlclNjcGpY?=
 =?utf-8?B?UG5YalluUVRXaDJ0aWsrbHUxSUNrcGU1N2ZjVTVDbXk2V1JOTFJSbXZQVk52?=
 =?utf-8?B?RUZ2MURpN1YrY1RaTlBOK0FQRlRQVk9mOHNoMXVhNnBiTkhEcWpsTlJBNkhy?=
 =?utf-8?B?aDBZTk5PNlAvOXNucGxYMnp6WGJzY3ZoS1hRRGhjSUJ4YjZpUlBDTU84YmJv?=
 =?utf-8?B?a0VqaWlPd2d4S1J0cllabDdxbWNtYWJvbXFoeHBVdTNqMzZNblhEWE1lWmlo?=
 =?utf-8?B?OGRncUw4Zks3NGhsYnpLcnRPL1JuakFSUHQxdWsxbVQ5Y2hKMWNWZVl6MTBo?=
 =?utf-8?B?YzRiR2xDUTRKN2dGZ1BxNDVFekVNY0VkS1kzKy9DLzVJYURyMGlXeEovVHBr?=
 =?utf-8?B?V0RIUGhkeTFNZXNUVmlYYXZkcE53a0wydHBSbDgzeWJCTWpVbHUxRFVFMXlB?=
 =?utf-8?B?WG5tc04vdjBYS3FiWjZObTMyWVgyRklrMjBvVGxoQXlFSjV4YXIwZnk1Qk9T?=
 =?utf-8?B?QkcwNlFMMXRpcGtSbTFRRk82TmtyLzBSYWFhUnVrOTUvaS9PYXpZQ1UvTWp4?=
 =?utf-8?B?ODRwbTFtUXhlK25kcUo0K0kveENkUXUrUHVOSkZuT05qb1M1Q2xkdFFlS0RG?=
 =?utf-8?B?NjlDODJ5RldXWW45MnFsT3daRVBJS1oyVlB1ZDU0Wk13bUxEdU1kd09uUmZY?=
 =?utf-8?B?MkZtQ3ZRc1FlUlVmblJJdWR5ZlFtQ3F6aXh3NFVoOHppWUorb3paNFp4anVa?=
 =?utf-8?B?VjhIdzFCTnZHTmZ3bTU3R1lMbGlyNFFpZ0FIR2c3cENiQ1BsRS9TYXVyVSt6?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5a2792-7818-4594-4fa5-08de380ec4b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:08:41.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59m7fqP5GCIymXgzTrUn7l6MFJd9rD/GFi4hG5TgcONC2s/XiWWkcjqoTGr7aCRb5XYROuGvQv1J0dPn/ld59g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8410
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

On Wed, Dec 10, 2025 at 02:06:15PM +0100, Philipp Stanner wrote:
> On Wed, 2025-12-10 at 13:47 +0100, Christian König wrote:
> > On 12/10/25 10:58, Philipp Stanner wrote:
> > > On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
> > > > On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian König wrote:
> > ..
> > > > > > > My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.
> > > > 
> > > > I believe I found your problem, referencing amdgpu/amdgpu_device.c here.
> > > > 
> > > > 6718                 if (job)
> > > > 6719                         ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> > 
> > WTF! There it is! Thanks a lot for pointing that out!

No problem.

> 
> scripts/decode_stacktrace.sh should be able to find the exact location
> of a UAF. Requires manual debugging with the kernel build tree at
> hands, though. So that's difficult in CIs.
> 

I wasn't aware of this. Usually I do below after rebuilding kernel with
debug symbols.

gdb <offending_file.o>
list *(<last stack trace line>)

Here I just saw 'last stack trace line' was at the very end of
amdgpu_device_gpu_recover and happend to spot this.

> > 
> > > > 
> > > > Which is after:
> > > > 
> > > > 6695 skip_hw_reset:
> > > > 6696         r = amdgpu_device_sched_resume(&device_list, reset_context, job_signaled);
> > > > 6697         if (r)
> > > > 6698                 goto reset_unlock;
> > > > 
> > > > The job is likely added back into this free list here:
> > > > 
> > > > 6676         amdgpu_device_halt_activities(adev, job, reset_context, &device_list,
> > > > 6677                                       hive, need_emergency_restart);
> > > > 
> > > > So free_job runs and 'job->pasid' explodes.
> > 
> > I've read over that code like a hundred times and didn't realized that the job is accessed after the scheduler resumes.
> > 
> > > > 
> > > > Save off the pasid on the stack at top of this function and I suspect
> > > > your UAF goes away. This won't untangle this hair ball of code but I
> > > > believe this at least prevent explosions.
> > > > 
> > > > But let’s dig in further—amdgpu_device_halt_activities calls
> > > > drm_sched_stop (Xe just calls drm_sched_wqueue_stop for reference). This
> > > > function stops the work items, then adds the offending job back to the
> > > > pending list, iterates over each job, removes the CB, leaving the job in
> > > > the pending list. If the CB can be removed, it removes the job from
> > > > pending, maybe calls free_job if it’s not a guilty job, and if it is a
> > > > guilty job, defers the free_job to the timed-out job so it doesn’t
> > > > disappear. Like WTF?
> > > > 
> > > > Oh, it gets better—amdgpu_device_sched_resume calls drm_sched_start,
> > > > which iterates over the pending list and reinserts the same CB that
> > > > drm_sched_stop removed, then starts the scheduler. So the guilty job had
> > > > its CB successfully removed, and now it can immediately disappear—also
> > > > like WTF?
> > > > 
> > > > Free_guilty is clearly a hack around the job not being reference
> > > > counted, and it doesn’t even work in some cases. Putting that
> > > > aside, I think calling free_job shouldn’t really ever happen in TDR.
> > > > Imagine if drm_sched_job_timedout just took a reference to the job like
> > > > normal kernel code—free_guilty could be dropped, and immediately this
> > > > all becomes safe. Likewise, if the run_job work item had a reference to
> > > > the job, which it takes before adding to the pending list and drops
> > > > after it’s done touching it in this function, then run_job and free_job
> > > > work items could safely execute in parallel rather than relying on an
> > > > ordered workqueue to keep that part of the code safe.
> > > 
> > > I can tell you how I design it in our Rust jobqueue:
> > > Drivers create jobs, and in submit_job() the pass ownership over the
> > > job to the jobqueue – IOW after pushing a job, a driver can't access it
> > > anymore. In the run_job() callback, the jobqueue either passes the job
> > > back by value (ownership) or borrows the job to the driver so that it
> > > can be copied (this is done so that the JQ can hypothetically do
> > > resubmits).
> > > 
> > > This way there is no need for refcounting (in Rust / jobqueue).
> > > 

See below. If you need to resubmit for any reason, where will the
information for resubmission be stored? Likewise, if you want to drop
additional references on fence signaling, how are you going to retrieve
that?

> > > Maybe the core of the problem is not so much the lack of refcounting,
> > > but the lack of ownership rules. Why even would the driver need the job
> > > still after it got pushed? It should be fire-and-forget.
> > 
> > Yeah, that sounds sane to me as well and is exactly how it was initially designed in the drm_scheduler as well.
> > 
> > The job is basically just the information the driver needs for the submission which it gives to the scheduler on push, and the scheduler gives back to the driver on pop.
> > 
> > The full execution time is represented by the scheduler fence and not the job. And the scheduler fence is reference counted exactly because of the reasons Mathew brought up here.
> 
> Would be interesting to hear where Xe would still need the job. If only
> the backend_ops give a driver access to a job again after it got
> pushed, then it should be safe.
> 

Xe needs a subset of the job after submission to handle tasks like
resubmission after a device reset. It’s questionable whether we need
this, as it shouldn’t happen in practice—only individual queues should
fail with a working KMD and hardware. It likely doesn’t work anyway if
queues have interdependencies. This is really an opportunistic approach.

However, we absolutely need this for VF migration resubmission. Again,
this requires only a very small subset of driver job information. I
believe it’s just the starting point in the ring, batch address(es), and
a pointer to the driver-side queue object.

We also build a reference-counting model around jobs, where the final
put releases other objects and runtime power management references. This
assumes that the job’s final put means the scheduler fence is signaled.
Again, this is really just a small subset of information we need here.

So if we add hooks to store the subset of information Xe needs for
everything above in the scheduler fence and a non-IRQ, pausable callback
(i.e., won’t execute when the scheduler is stopped, like free_job), this
could be made to work. We really don’t need about 90% of the information
in the job and certainly nothing in the base object.

This would be major surgery, though. I suspect most drivers have a
subset of information in the job that needs to stick around until it
signals, so this means surgery across 11 drivers.

> > 
> > I'm absolutely not against reference counting, what I'm pushing back is abusing the job object as something it was never designed for while we already have an object which implements exactly the needed functionality.

Well, oops. Having free_job called after the fence is signaled is how I
arrived at the implementation in Xe. I agree that if we can move driver
info into the scheduler fence, this could work for likely everyone.

> > > > > > And my uneducated guess is that it's happening in amdgpu. It seems a
> > > > > > sched_job lives inside an amdgpu_job. Can the latter be freed at other
> > > > > > places than free_job()?
> > > > > 
> > > > > > > 
> > > 
> > > […]
> > > 
> > > > > > > It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.
> > > > > > > 
> > > > > > 
> > > > > > My POV still mostly is that (with the current design) the driver must
> > > > > > not use jobs after free_job() was invoked. And when that happens is
> > > > > > unpredictable.
> > > > > > 
> > > > 
> > > > This is somewhat of an absurd statement from my point of view. I have a
> > > > valid job pointer, then I call another function (see above for an
> > > > example of how drm_sched_start/stop is unsafe) and it disappears behind
> > > > my back.
> > > > 
> > > 
> > > The statement is absurd because reality (the code) is absurd. We all
> > > are basically Alice in Wonderland, running as fast as we can just to
> > > remain on the same spot ^_^
> > > 
> > > What I am stating is not that this is *good*, but this is what it
> > > currently is like. Whether we like it or not.
> > > 
> > > The misunderstanding you and I might have is that for me jobs having to
> > > be refcounted is not a reality until it's reflected in code,
> > > documentation and, ideally, drivers.
> > > 

I agree this part is badly misdesigned. In the timedout job callback,
you’re handed a job, and if you perform certain actions, it can just
disappear— even all the way back to the caller of timedout_job. That’s
not great. Then we have this free_guilty mechanism to avoid it
disappearing, but sometimes it still does, which is horrible.

> > > >  The safe way to handle this is to take a local reference before
> > > > doing anything that could make it disappear. That is much more
> > > > reasonable than saying, “we have five things you can do in the
> > > > scheduler, and if you do any of them it isn’t safe to touch the job
> > > > afterward.”
> > > 
> > > Yeah, but that's drm_sched being drm_scheddy. Before I documented it
> > > there were also these implicit refcounting rules in run_job(), where
> > > the driver needs to take the reference for the scheduler for it to be
> > > non-racy.
> > > 

Yes, agreed. This is my fault for not being more responsible in fixing
issues rather than just backing away from these really scary parts of
the code (e.g., drm_sched_stop, drm_sched_start,
drm_sched_resubmit_jobs, etc.) and doing something sane in Xe by using
only a subset of the scheduler.

> > > It also wasn't documented for a long time that drm_sched (through
> > > spsc_queue) will explode if you don't use entities with a single
> > > producer thread.
> > 
> > That is actually documented, but not on the scheduler but rather the dma_fence.
> > 

spsc - "Single producer, Single consumer". So it is in the name.

> > And that you can only have a single producer is a requirement inherited from the dma_fence and not scheduler specific at all.
> 
> What does dma_fence have to do with it? It's about the spsc_queue being
> racy like mad. You can access and modify dma_fence's in parallel
> however you want – they are refcounted and locked.
> 
> 
> P.
> 
> > 
> > > drm_sched got here because of gross design mistakes, lots of hacks for
> > > few drivers, and, particularly, a strange aversion¹ against writing
> > > documentation. If Xe came, back in the day, to the conclusion that job
> > > lifetimes are fundamentally broken and that the objectively correct way
> > > to solve this is refcounting, then why wasn't that pushed into
> > > drm_sched back then?
> > > 
> > > > 
> > > > > > To be unfair, we already have strange refcount expectations already.
> > > > > > But I sort of agree that there is no objectively good solution in
> > > > > > sight.
> > > > > > 
> > > > > > > > 
> > > > > > > > Let me respin to my documentation series and upstream that soonish,
> > > > > > > > than we can build on top of that.
> > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > P.
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 2. Move reference counting to the base DRM scheduler job object, provide a
> > > > > > > > >    vfunc for the final job put, and document usage. Medium invasive.
> > > > > > > 
> > > > > > > I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.
> > > > > > > 
> > > > > > > With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.
> > > > > > > 
> > > > 
> > > > See above—I can’t say I agree with this assessment. I think the lack of
> > > > reference counting is exactly the problem. I don’t really understand the
> > > > pushback on a very well-understood concept (reference counting) in
> > > > Linux. I would sign up to fix the entire subsystem if we go this route.
> > > > 
> > > > > > > If a driver like XE needs that for some reason than that is perfectly fine.
> > > > > > 
> > > > > > Nouveau doesn't need it either.
> > > > > > 
> > > > > > > 
> > > > > > > > > 3. Move job (driver) side tracking to the scheduler fence and let it
> > > > > > > > >    control the lifetime. Very invasive.
> > > > > > > 
> > > > > > > Thinking about it more that is actually not so much of a problem.
> > > > > > > 
> > > > > > > Let me try to code something together by the end of next week or so.
> > > > > > 
> > > > > > The hero Gotham needs :)
> > > > > > 
> > > > 
> > > > Are you sure about this one? I think unless the problems around
> > > > drm_sched_start/stop and free_guilty are fixed, my feeling is this
> > > > entire thing is still badly broken for anyone who wants to use those.
> > > > 
> > > > To sum up this whole email: I strongly disagree with option #3, but if
> > > > that is the consensus, I will, of course, support the effort.
> > > 
> > > 
> > > I would like to discuss those topics with Danilo, too, who returns from
> > > LPC soonish. Also to get some more insights into Nouveau and our use-
> > > cases.
> > > 
> > > My suggestion is that we pick the conversation up again soonish.
> > > Christmas is around the corner, and I suppose we can't fix this all up
> > > in 2025 anyways, so we might want to give it a fresh re-spin in '26.
> > 
> > Since we finally found the root cause I'm all in postponing that till next year.
> > 

Ok, glad we found the root cause. I’m not as opposed to option #3 as
stated—this was a bit of angry typing—but if we go in that direction, we
really need clear rules, for example:

- A job cannot be referenced driver-side after the initial
  drm_sched_entity_push_job call, aside from a single run_job callback.
  Maybe run_job is actually replaced by a scheduler fence input?
- Drivers can attach information to the scheduler fence and control its
  lifetime.
- Drivers can iterate over pending scheduler fences when the scheduler
  is stopped.
- Drivers receive a pausable callback in a non-IRQ context when the
  scheduler fence signals.

etc...

Again, this is a pretty major change. I personally wouldn’t feel
comfortable hacking 11 drivers—10 of which aren’t mine—to do something
like this. Refcounting the job would be less invasive and would make the
existing hairball of code safe.

Matt

> > Christian.
> > 
> > > 
> > > 
> > > Greetings,
> > > P.
> > > 
> > > 
> > > 
> > > [¹] The strangest aversion in drm_sched, however, is the one against
> > > locking. Locks were only taken when *absolutely* necessary. It's as if
> > > the entire code was designed by some gamers who want to show their
> > > youtube subscribers that they can get 1fps more by changing RAM timings
> > > in the bios.
> > > drm_sched might be the component in the kernel using the most
> > > synchronization mechanisms: Spinlocks, RCU, atomic integers, atomic
> > > instructions, refcounting, READ_ONCE(), just accessing locklessly… even
> > > Paul McKenney would get wide eyes here. The only thing we're still
> > > missing is seqlocks and rw_locks, but maybe we can add those /s
> > > 
> > > That's likely sth we can't get repaired at all anymore.
> > 
> 
