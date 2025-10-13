Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F0BD3348
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 15:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E681910E38F;
	Mon, 13 Oct 2025 13:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESd1jzjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8122510E38F;
 Mon, 13 Oct 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362110; x=1791898110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JriwlsW9JqCHw+i7gqvyjJJn5QaFtf/2sp7tZXwXyUs=;
 b=ESd1jzjU6ImTUJoQjAUGAqnIjhTYGt5m0iiSDAZO+T+pFZf57CH6dcCZ
 oI1YqzxQWMKnAE4ribPiNUcJ1Bqk2OFlj2Qt+5Fv/WRKGpksjeFWsOsgz
 2nsOaXIFuSN0nofDn8vUDSczaWtwHoJRZGhqbxtGoiClBlJa0uJX3oHAX
 +HirvfsQ2VljYZ9sc93qAmvqoxHFmUughGr2AWavIRusSoMGXyPbcFAbU
 5wlI6PcDIxWwMuwgjaMme6llAt5+VEzlTv7p9PRMD2ltgZZSQRkRX9bEE
 Pfopd2dXBLOzjo7rSDSl70FLXtFXUOYPzSJ8BmZ8SGFvgdUOB3gif61iS g==;
X-CSE-ConnectionGUID: TxMaaYEbSXuNsnjbmvmbtw==
X-CSE-MsgGUID: hlsi4RJiS9u62sDwqFxo2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73105542"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73105542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:28:30 -0700
X-CSE-ConnectionGUID: FcLOYe7vSmC1ZmWbR5/BkA==
X-CSE-MsgGUID: vntrOGXhSaa1GG9y1jXupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182360052"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:28:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 06:28:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 06:28:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 06:28:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9DX40mxTPW85grwLqD6QKUxOax/wujQtl2AgDRQ91U27PqG5KYoFaUHwWsvBFiROEAUJAP7AsLRmPM2qspPZ+iaPACbEHRAeaV6zQEYFdN3IMUiY7/TTbBBohUuXmueFcgbCkRjQUZt6tYOMxl694AbPKB2Ei3QaTUNLcDQb1edk2qZmu192GL/vq1/wNd6q0cATeeurNY6vjXhspWE+QfCIY32YWLhhclvTprpTu5+/ERprwSOD6uNeTRQN9SxQ7DHygiIWYVlBnGP/NWi92nnYIrTTdE/+2U+jTbEVwxE78u9jYmWYxgqmBX98PRQtIN6QyD/fipkbqKAu4DBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEkI+vX9//6IKwuYUyWs+p6c5J9VvRROempxDRWM4Q0=;
 b=C3qLtSET298n2tQewksGHNf7sLkwGqKnw1iP6gdopm483qCqi+Kt7ovSRJ2wc5lZU+H+Lu5thfNkdxXra1TpJwRl9jpjW4+wjnit0XpemGseToytudozFENJLi8PmiPfLtRZxqx9KRUHjjuK8Q2kIafTZ0xB04PImnwqA+u7VYEW4MWP/QdBAsd0So7WstR3QmnwLNW8xV/8dfbD0eZsHjoy+o8LLEuYAzZE8fLakJt9KBZIVyew4CbU08UjtcobmH36c4XZyYtWSRlGkCH5CHNEIQrqhl1HjH7cKjtvaVk4qP48hFS6r6u0rGsYnSOvSH7tR0UyiY55Dbrb61/Iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPFA69606334.namprd11.prod.outlook.com (2603:10b6:f:fc00::f42)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 13:28:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:28:27 +0000
Message-ID: <fded9abd-0e42-443f-b397-082a82a6733b@intel.com>
Date: Mon, 13 Oct 2025 15:28:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] drm/xe/pf: Add helpers for VF MMIO migration data
 handling
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-20-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-20-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPFA69606334:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d7b2e0-3ec9-4b08-7e7c-08de0a5c6462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlFoRjk2TDlyaitZZ3l2b3VueEpVd2toY3d0Si9JWVVjeDlRTEd2b2VwdW14?=
 =?utf-8?B?cWowQmJFVThBcFFhTmt6RWUrY0xjL2lOSTJyRnZvYXEvazdZSzZzVDYvaFQ5?=
 =?utf-8?B?cTZqNEl3UGRjYzFVZ2JTQ254b2l0UWNRamhLbVVMcVhWS1ZDcmVOZGYvVUVF?=
 =?utf-8?B?WGVqZU5hNmFzMCtEUUw4U1I4T3ZhRnlHVi9XSkZWd2x2ZmQ0WXBWK0J3ekc2?=
 =?utf-8?B?NUFBaDVwVUlWYzE1anBjU1FMd1pnblZ2enB1OEptS0R4YVFxMS9rNVFvb2JK?=
 =?utf-8?B?eEJrWksxYnp1Q0o5c3pJeC8rbVB3d2MzamhaYXNSRHhGb1NTRGM0TTZmVUQv?=
 =?utf-8?B?VXdsMERycTBvcWZDemJ1dWVadTBEOWw2S09DVHBXMXpFRy9Vc2ppMWM2TDFq?=
 =?utf-8?B?UFdxSGcrYWlVYTFpMlhISmVkTHhwZzlOY2hUY09OR0JCN1ZLSys5azZwNHZz?=
 =?utf-8?B?S2FCeVZGYkc0bGNPakVBdUorYWFBb2tJaGVVM0dPQXhIQmFpNDZ0WTNBMTV4?=
 =?utf-8?B?enFwZXBqV1dxekxuTDV6N1p4SzRjMm0xVWV1T3RkbkM4dzhkeGt1d29STFNO?=
 =?utf-8?B?aUlhWEYxVzZDbVBMdFZrSmtGWGpmNzY2ZXpLcWh6QUY5Vm4rYVViU2tNTUt4?=
 =?utf-8?B?ejZab1ZWbnN1SklRSVY5Z2E3S21ndVpHZmorcEFydWUvSVFyaFdza0dDdUEz?=
 =?utf-8?B?VzBOWnRteEREeUZGRHdvSVFaVldJcXhrYTVTQWx0cDlvbmphcTlZY0JCSGUy?=
 =?utf-8?B?S0EySUg3TXE5UWVTU3gzazZsMDkreVpxT055SXJCanZuMEwzVSt5N09HMWhS?=
 =?utf-8?B?S2RVRUNpMEczMWs4cUtpOUNMelArTEZKVzlSQ3lyeXN5Y2diMnAxcXZ1S0c1?=
 =?utf-8?B?b0Z6eWZFYnJjWWRtVVRqOG9ybk9JY2xSNzdCZGxXNWhRZWJ2M2RnSGZQSXZR?=
 =?utf-8?B?RW02UUVKaWoyQzBSenc2cGoyMFRKM25XT0pBQXUxaXRWOTFoK29KQmtWZDIy?=
 =?utf-8?B?dlNnSVZQREJyT2MzNmxxaHptckFkcm4xcTdyYkdqNTNzSDhHNVJ4dTZ3RG5z?=
 =?utf-8?B?R3l4NUtrSmpyNzNqd0lpWVV5L0lRTVlnaERvckRkYjJuNlovRXdLM1Rmd0RF?=
 =?utf-8?B?aXFqL2FDSzlBaWJoZlVWVFJ4QzRXZEdNUzlMWVg5elVtbUVkalMxUG4vaVY4?=
 =?utf-8?B?c0M3OU45RG42Z2o3MmF1Q01Zc0Z6UnMweDEzMFhoeE1xR1MxNWRiTEJiSStC?=
 =?utf-8?B?TlpaMXd3S1dyQjhDRjJnZVZNalRlbFBxb0x6SThCdU1rRVhnb216ZzIxclpo?=
 =?utf-8?B?eDRqc2ZsSWF6QVBVN1E4aVRzMXJTVytjbTZGMkR5TDZNeWs5bWJQM2JnUHp3?=
 =?utf-8?B?L2JSUFlEcm51clI5dkpRajNETk80UHo3R1BGcjV2KzNSZHlMWjFuR2dHeVgx?=
 =?utf-8?B?NU9VaFNwQUl6VTlOZXQ0SDJwaXBhNXZVZFBUYXlORUY5RTlSZzNwM3pOQWsr?=
 =?utf-8?B?clFROU9KRDVCaHlkdnppeVk4OFY3dFkvQzNKUjVacDJzUWFSRngvOUY5VFBR?=
 =?utf-8?B?NUlDamV4ZEtzUnFvcTlOalBCbkp1MHRYWUFCMW5vUkRhSzZZWGxVYmdoUFpD?=
 =?utf-8?B?R29DdFlQU3hRVURZTHVNUEM5clFNdUw5ckg2RHpnM1dtbUpzb2ZtRzdOSVNK?=
 =?utf-8?B?bXZIbTJGR0k2MmR1S1pIQlBCbzQybE52eWR2aHlHUW1hYTdoNkMvb2pVQkJO?=
 =?utf-8?B?eUFHK0d2MmQxMWtNeVpycTBkTzRjM1dHZVdVRmdGaSsxbjVQUzV3NXNlcW5C?=
 =?utf-8?B?Rml2UEo3bU5JUTlXMVpxSjhoWmhtZkE0T0lxS0NzUGFXeElMRGtkdU8ycGhF?=
 =?utf-8?B?ME8yOXlsRU0rbmpYU2xkQkw2R3pTOXJNNllNRkd4VXMxc0R4ZkxzT3hnSitj?=
 =?utf-8?B?ZktrbStSN1JueDFjNlJVYzNQZnA5MjA0OGFvd1k2RFdKMXVxMHo2WU9icFZq?=
 =?utf-8?Q?NYby9c/Vqsh/DtjxLIRKdlOSIfGa0k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xhMVJqYThBSDgrMnZNNzRQeEMzTWlHdzN3eE1vNEUwZlJlTkZkdGZTN09O?=
 =?utf-8?B?M2ZpM2YrUzh5dlJRZEhndXFnMFBtS01jY01OVi85b3p5STQ1dHo1UGtrSTVI?=
 =?utf-8?B?THA5ajlYSVZHUk5UNXppdlhNM2JWY0Z5OTVDaUNWbkpyOSs2TitMNmpkbnEr?=
 =?utf-8?B?UTFIL2hjTWpXbkhoVzFPbkt2bEFLUHFYOTZOeFJoTUxVWjJReWNpRVRhMGtJ?=
 =?utf-8?B?dUk1bFpoUjFMZlY3dkZST3p0WWVWYlZqa0VzdkczNHpDVy9EaWFUOEhhY3dM?=
 =?utf-8?B?Vkx5dnFRb2pISktkRWs4QW1aZFVBdXlacjEvbEx2bEpjS0d6Q213dGp4RWtx?=
 =?utf-8?B?WDNWcnZXUlNJdTdjNm1mb29HRU9CdTlSQVgwbWJPNU5ReTF1bCthUVFMZ0p0?=
 =?utf-8?B?Uy9mV2JZOGtaRkwvYUN6cm44TmNHUllkRXZNRzkwdDFqdTBzL3JnUHN5bUVl?=
 =?utf-8?B?OFJNN0VVN05CQWxVVmE0RklnWGx4eDQ4Tnl1UTFVWEdiWDF2MXBaUEt1Z0Nr?=
 =?utf-8?B?cllnR3VPRjM0bmpuL0E3S3lQZ21GWTk3S2FpaWVlVnZMVG1ueEppeVhnb0pJ?=
 =?utf-8?B?SU1kNlQ0QTZmTk80N1ZpeVBmaGtsK2tDK1k5TWdmVjNKczlUKzduTG8rczg2?=
 =?utf-8?B?bzg2dzN4THUyRzJPWHA3dldTWjN4QmxZc2tCeXYrS3pFMjZEVER6dDJBenFp?=
 =?utf-8?B?RnRnSHRzWUhQeFMwbjZYLzU3Y2RTNUNaRnlvSFZ0K1BZL1NVdHZNMDRjQWNT?=
 =?utf-8?B?NjRJZmNoNzVtSGlyUHRpc1BJOGljTTNRNElyRENwd2RETHMrUDVJYVNpT0JF?=
 =?utf-8?B?RG40cCs0Rm1LZGxvTlV4L0hGUVIvaS9kWG5ZeE9WdmZ2TnRPelJWWHo1ZUNJ?=
 =?utf-8?B?bGoxV2pJcmtqMWtVQjdFRW90Z1kwL0k4U0wrNkdGemNnZmhGcGtNZ1AzZTNo?=
 =?utf-8?B?K3JwYWRTcWNZYlVudlMvdWo5VElTcUxxVENyMytuUENxUzVIcnpXWXNta3Jj?=
 =?utf-8?B?TUtPQTFEbjVPQ3lDK0dqVGNKZU42NlI2YVJvZWd1cjl2VlFJYWozcWRaZnc2?=
 =?utf-8?B?Tm1UaUxhUXZLWTFUZ2ZjTlRDMDM5eUMvMDAweFRZcXRQa2ZwZWk1OGkzMC9z?=
 =?utf-8?B?MjFJYlNYc0dqRU02emNmdW01MUpDMTNMeU9EUi9Zd3RYb2Y0eDk0L1ZpV1pl?=
 =?utf-8?B?UTJNRVBvVGhpcmZQV1k5TzJLd3NVYXJjQVpmSGRxTVdielpjdVhyNFV4WlhO?=
 =?utf-8?B?M2ZXWlZYaWcxWnlmVWV2UkNkb0lSbG1LZVQ5Mm5YK1pmd21aM0tzWHpvWGpD?=
 =?utf-8?B?L2ZQT0RCd2s5R2gvcmV5ZXVuSUM5L1ROaWRKR0krMEZvWVZCNE1YbEtDcVl3?=
 =?utf-8?B?NEtPZ0FUdU1HT0tTTjNnRDlHbkYrWUtBYlp0eGpPM1M2cGNOSzB2eDBEc0p0?=
 =?utf-8?B?ZzI5SEM5WUwwS2hwbU9vVllHVWN0QU8zZHlBckRucFV4dDJwN2J0WmFiaWJw?=
 =?utf-8?B?Ny9IN3NpTHdFbnUxUDVrZmdiOThTRTVNNmNMQ3laN3NXcWxtaEtmM2hXNDNk?=
 =?utf-8?B?Uy91S3gzTUtnZkJnR3pKbStwTUwyYk9UNU1BUVFkNzdXb3dEN0xZVGlUNXdZ?=
 =?utf-8?B?Uyt6UmI3cmZRZ00rOHBBeGhMdDF2TmpuSzlnYXFXajhuWGswdFRydEt1bFJq?=
 =?utf-8?B?VGdpQVZ5UnkrMmZsblRKY2twSnUvc1MrNzllZ0VjTEhTVFU3VEFvMVJUYnM1?=
 =?utf-8?B?czJnZDdGcGxKZ2llUFZ0TGlyZEF1Q0ZDcEZrSkZWbENOQ2YwTVF3VkJwd2VG?=
 =?utf-8?B?TE9JNnNGK2RFZlUydG10bzhrazhsSXllMC9uKzdqa20wTTIySTFkWHk2dkhZ?=
 =?utf-8?B?Q2VCdUNWb1VvNkE2SngrUVV1cDJMK1BtSWVJZXMwRGtrbUwyaEpuNVMzdXZw?=
 =?utf-8?B?SUpLK1R0S1Irc09OMzRVdFl3QVhBNDB4L2JxMVYxQWRaT2pWc2MvaDY2Q3ow?=
 =?utf-8?B?QllrK3BHcDBvMFNOQ2NmdVpia0RjYTJXZDk5dXFrQjFmVkNQZ0tFZ0FZNGdC?=
 =?utf-8?B?SXE2VkdzdnFOSlAyaTU1RDliN1c1M21FMlpHSkpiVTBlajB0QnF3U0Q3L1dD?=
 =?utf-8?B?Nlg0Z3MxYjB2bGVmMm4wdFhxdjlwTHNzVzJMWFh5NjVBbGxVQnhCNVFHd3o3?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d7b2e0-3ec9-4b08-7e7c-08de0a5c6462
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:28:27.3753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnIzI4JH8/3P8+fxe+9/Qx53PpU6HnYW2fQoblkVtZ6c2GLsDVdJQBTXueI8/Zq1X3v86FOYbHKYQ+f7Y2mM1D+PdaQALjnhhp9L71Es2hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA69606334
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> In an upcoming change, the VF MMIO migration data will be handled as
> part of VF control state machine. Add the necessary helpers to allow the
> migration data transfer to/from the VF MMIO registers.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 88 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h | 19 +++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index c4dda87b47cc8..6ceb9e024e41e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -194,6 +194,94 @@ static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
>  	}
>  }
>  
> +/**
> + * xe_gt_sriov_pf_mmio_vf_size - Get the size of VF MMIO register data.
> + * @gt: the &struct xe_gt
> + * @vfid: VF identifier
> + *
> + * Return: size in bytes.
> + */
> +size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (xe_gt_is_media_type(gt))
> +		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
> +	else
> +		return VF_SW_FLAG_COUNT * sizeof(u32);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_mmio_vf_save - Save VF MMIO register values to a buffer.
> + * @gt: the &struct xe_gt
> + * @vfid: VF identifier
> + * @buf: destination buffer
> + * @size: destination buffer size in bytes
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
> +{
> +	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
> +	struct xe_reg scratch;
> +	u32 *regs = buf;
> +	int n, count;
> +
> +	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
> +		return -EINVAL;
> +
> +	if (xe_gt_is_media_type(gt)) {
> +		count = MED_VF_SW_FLAG_COUNT;
> +		for (n = 0; n < count; n++) {
> +			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> +			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
> +		}
> +	} else {
> +		count = VF_SW_FLAG_COUNT;
> +		for (n = 0; n < count; n++) {
> +			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> +			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_mmio_vf_restore - Restore VF MMIO register values from a buffer.
> + * @gt: the &struct xe_gt
> + * @vfid: VF identifier
> + * @buf: source buffer
> + * @size: source buffer size in bytes
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
> +				   const void *buf, size_t size)
> +{
> +	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
> +	const u32 *regs = buf;
> +	struct xe_reg scratch;
> +	int n, count;
> +
> +	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
> +		return -EINVAL;
> +
> +	if (xe_gt_is_media_type(gt)) {
> +		count = MED_VF_SW_FLAG_COUNT;
> +		for (n = 0; n < count; n++) {
> +			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> +			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
> +		}
> +	} else {
> +		count = VF_SW_FLAG_COUNT;
> +		for (n = 0; n < count; n++) {
> +			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> +			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_sanitize_hw() - Reset hardware state related to a VF.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index e7fde3f9937af..5e5f31d943d89 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GT_SRIOV_PF_H_
>  #define _XE_GT_SRIOV_PF_H_
>  
> +#include <linux/types.h>

likely also <linux/errno.h> if you want to keep stubs (but double check if those are really needed)

> +
>  struct xe_gt;
>  
>  #ifdef CONFIG_PCI_IOV
> @@ -16,6 +18,10 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
> +size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size);
> +int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
> +				   const void *buf, size_t size);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  {
> @@ -38,6 +44,19 @@ static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
>  static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  }
> +size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return 0;
> +}
> +int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
> +{
> +	return -ENODEV;
> +}
> +int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
> +				   const void *buf, size_t size)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  #endif

