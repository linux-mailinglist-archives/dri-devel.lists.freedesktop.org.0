Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12DC40C7B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5A610EB10;
	Fri,  7 Nov 2025 16:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFulRUGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD96610EB0D;
 Fri,  7 Nov 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762531816; x=1794067816;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LgKMqDJr9vqAgrb/y8qikslfCv1WWkAF3fXx0T2HKAA=;
 b=IFulRUGyrdX1blCoPZBtaHqplYfPrbsaUjm34qDig/OqoyaRlxI/ZA5W
 na5bqisuCyCJYndnWGHNCbUbQDzsSWZV81VSs20iKJc6nYzfSoeAjQzx4
 Zpj0GD8KVcbfCp8oqE6qiPkrSE5h/dWCU/iMi8umj29LGTSX3gtMLEhs/
 029vxp0QWyV7GxA6IJTHah5dzU3qaWKcnT/KSnFWIEuYwNK83AUML40Yd
 1lv/KeN2uXU5+Kr0CeY+SuOuUEQEr8LpfcerqlHiX5ksTMF6csezvhDR8
 9VaumxxFVAjbEaPwxOF3Bdcv8ofznvIeDnK1axYa4amOkFwtUewTarZyD Q==;
X-CSE-ConnectionGUID: wO3Lzu3/SrqQnZSoTulZoQ==
X-CSE-MsgGUID: MskQEk9jQtW1fOQheiclIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82084660"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="82084660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 08:10:16 -0800
X-CSE-ConnectionGUID: yldGog5bQnOQfzKvRan5YA==
X-CSE-MsgGUID: GTrIVSFFTCej8FVCJN10wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="192430862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 08:10:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 08:10:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 08:10:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 08:10:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxVmVlXOUx0YZLIE7UTJypgII/q67P1rWAytYCiPb3Q56pp1UHvYyA7UhGdkGHfrd/r3WjBW2TH7lpFR7iCgrVv8gm/S4HZtrXoIaXdjUAXgXk+sQpIA2duTx0YKYRK6kSZu5VBofXkgmYp4ML8Vo/ZuJow52MyK0MAX+U6Cb1RvDvlTsmWz8ZqixH/TDnapWtkraCBhc6DEVBs/WhjkrhYteednCZqx5ZOwNIK+TodX35QkfQc8ThfpZa+7khBaF0B/mZkmvI65Eh/CGKCCsbw/f7K+X0sbrGrkD8aCe0cK+Co1gyfsyAnwMVGjd5eM80Blhpngc2TW25QazBOlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4ell0BrCzXmfny9O4QUW5jZ/6okq5SkIlS0fYlBYQY=;
 b=lEeYN1z8NmeFQwwak+SeiJ/BadigtWG/p78Is9OUm4D5eTlSWonb/B4L5LKt36wRYS4MDpz/E93EBdQkNzHdKZHnJxGVyWnRLbp2oXl/Z6wcynrL5SZN0TgyxSwW/wFYQZ34W07PsQBz+Vna/Cq5FSzfIeKKW8V/Kej0SvQ8irIaCkyI1Qtw6FHZfsZQolxeIkY4bToFesLTl7myGA14cnhvQKCTCakXuYXrhoZo/uKd9TAeIK8W5dKk7lwEq56WaxWNl0WyatAMD5eaVdG2/g4QXUvj5cn45OaafN5ZmCtbjmYl6xUAK7U+bnicyOgCKU6xf33KU2L33JhDJ8+Hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Fri, 7 Nov 2025 16:10:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 16:10:12 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
CC: <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/vf: Enable VF resource fixup unconditionally
Date: Fri, 7 Nov 2025 17:10:00 +0100
Message-ID: <20251107161000.1938186-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffc52e3-1f3d-4fbd-cf88-08de1e1820eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEJOMStPaFdEL2d4KzJuaHJ5QTBYVFlpWXJPc3hrMTRFNVhBMkxhK1BaOEFh?=
 =?utf-8?B?NkIrS0pkd3VxbHFkSzJISWlna1E2ZHdqOGpoek95ZUVYTDFXREVZb2JwcjVh?=
 =?utf-8?B?U1pYRzNQc2dQRjVrdTM0ZmlWWTJZbTZVZzIrZGN2UDVIRG5vMUxWYjFjUnAy?=
 =?utf-8?B?ZU1XNkNpYURkLzhFU3NQcE14TE1RcmlDcVp6bzhodzJBNktsNk95ckh5N1g5?=
 =?utf-8?B?a010YlR1VUphZnltT0JGV3FGS1NaM0pDRFBFZG5vUlNvQTFETjZLMTVHd3lT?=
 =?utf-8?B?aTQwblQvelR3UmRQcmpCTnRkQitPemxzdXRUVUlFRnVZekpYQm5ZUTdVOTJx?=
 =?utf-8?B?Lzk0cmsyQ256bk9jcS9ObHNRUkpKNktDYk5DTUV5c0NXYklaeXZIQ0dCQmI2?=
 =?utf-8?B?czNiaXhmRXl0SmlDR3hFdWZMSCsxTmdjRm0wUjZLUFpZU00wckN5Zi8vUURB?=
 =?utf-8?B?a0dXdzRSSHcrSktVVEhmOGZmRFkzZVhIYmJEQWFmSEFWY1NFTndDQlJmUnky?=
 =?utf-8?B?d3lTN3ptUVVwREtoUFN3YUV3QncxZHJZeEpGVW1MU0JZbEJad3VyRTFuR3p5?=
 =?utf-8?B?TVh5alZVVWpLUFFmRjJtSE1oRVdJRUlNSFlOTnZITlc2eGNvbTE5TnU1cFZL?=
 =?utf-8?B?R3M0bW81N0xKN3B1Y3puRTJGYzZvOTlHVnA4ZXhHd3daSmRtUEllNnRjLzd5?=
 =?utf-8?B?RGpLWktFTVorSlJmQTNWY3EvYU85Z0RwcjI2YlNXMUF4eGpFQ2k3bkFOOXhj?=
 =?utf-8?B?Y2ZKaXVsZHhZaFgxV0xrWFNPaGo2S1VYMTBZWXRpN3NnMDFkMzNzYjNwVGZB?=
 =?utf-8?B?Qm5pSGhvTWtNK0NCeDdORytObXBkeUN1a2E1WUtOTnpjazRlRzNTQnhtWGF3?=
 =?utf-8?B?YmRsMmNTZ2JtZlIvOG0vTXpwSC9nMytpMFB1SFBZTUlVMHVRZ0NENXNGOTcw?=
 =?utf-8?B?ekI5RmZ3dlk2U0dhVGd5MjNaUmNLQkdTSFlpdE9vZTVlV3ZDL0MyWThZKys4?=
 =?utf-8?B?R21XV2x6dzBkMUpIcWVwNVh1STVlSkduT2hIM0hXUjZGNStZQTlYV2hEbWxD?=
 =?utf-8?B?ZVJtTWpnSHZkT2ZmYU1hVXFvS3RGYzNwanZVTEtBNWdhNldpYkVhbk8yVmRh?=
 =?utf-8?B?aUdoOXR5MjlQRFA3b3p2NTVkeENHZ3BoMFR4dkliSmdDWHJqMnh3ZGwrSU5S?=
 =?utf-8?B?ZUJ4b0pGcEhzSTllMGhoWGlUaitxUll5Vi9KWVUzTnE5R2lnZnBJcjFQUWRJ?=
 =?utf-8?B?SlVCUElSR25jQlpkM3JIOFhaSWRSdm1CUkY2dlZTNFB4aTUreW0wNlF5WXN6?=
 =?utf-8?B?UllMMWxRbnY1YXc5VXA4NVlONU5vNU1wMUs2Y1h3WFdWeENIdWdxcVZOdDFR?=
 =?utf-8?B?M1ZPOGU0ZkRwUEcrdkhXWHVxSllCTjRTQmhKb25wK1oyWTVBVFZuY0d6eitt?=
 =?utf-8?B?RHM1R2Z5NzdGZVVlbHlCWmhIMmxmektYU2xrd0lzNS9RWWp1a0UxbUZXYjlm?=
 =?utf-8?B?aGNnVmxuci8ybjdGalhIRHVIazJkU1dpdFYzUTFXVklqZ0x5NFlqenBNM0sw?=
 =?utf-8?B?bmMzKzdJSkVTcnd4VjcwQjdDeVh0SHp4NmlzbzdIMU9VZ08xdFgxWnVVbWU2?=
 =?utf-8?B?U1IySEJnMm1YbWJ3eHNNL3c0MEZDM052a2phOXpHeFU3V1phRlY0VlJRcm9n?=
 =?utf-8?B?K0JQRjJ4KysyT2M2Q0xNbEhNUnZiT2RVcDZSSUdCOW16T1QyRzN0U1FpT2Ew?=
 =?utf-8?B?VHlRREZ3MGVuUzJMcEtiV0d2N3hzNjJQbWNyOGFaRlJvR0pzL2UwM3FIdHJD?=
 =?utf-8?B?ZHRJZEZjTUhHSTZrNk5pamJZZHh2M1NkKzVQRGd2QUIzbXBtMTgxa3FEWnhh?=
 =?utf-8?B?b211YWoxZmw5YVNnL0tlQVNoRytiUHRIOW9lOUpaN01mTzZ5cWQvS2FGaEI3?=
 =?utf-8?Q?vv0nlP3Rnp/8oisBejho0+uFeg8dgkop?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBrWVg2aUMvNExmS3pmUXVQOE84R1ZWR2d6dVllME54MHh5NmJSNXRTV1Vv?=
 =?utf-8?B?UkJTNHE4NEIwMEMwNXNKWGVFUDBMM0NUZDhSZ1UyeTg4bEt5QnlrRFlOeXRv?=
 =?utf-8?B?OUozUk9nWHl0S1AwTVN0Tm9HOFplMTV4bEFWankrcGUrM1l6SDNZcEU1ZDh2?=
 =?utf-8?B?RHZqUWFxdWh4U0NHZlNZUGhlNXVUbzNYVitVTUczSmhmclZFK0RyaElEbnF1?=
 =?utf-8?B?bEp5OVBnall1dnEvbkFHckN1Qmh2b1ZYT0poQWtjazRKRDYxUTU2WXBYUXFt?=
 =?utf-8?B?aVhFcU10QUFORmlxa0lvZFF4bEJZMDhZKytPbm0xWkR6dG81VEx5T09QUnlp?=
 =?utf-8?B?ZStFNGgvSUNtb1BqUXlLWFFidm9VWFZTK1g2MjI2NGVPM2pxRUlSMzJXUXpJ?=
 =?utf-8?B?OEM0RCtjakJTVDNid0JHUjZGSnNLNkQ1bUdBUFNwK0RPQXBTTk5YaXZTL01y?=
 =?utf-8?B?b1R5bmlXRnBFdHVBd0loRm84bXY2aEczWkM4MFVwYStXSDNybEI2a29CN0o0?=
 =?utf-8?B?T2dxckVhMmdXSm8rWFZxdGZPUmhxTmFzdWp4WnZOQXRCdmxqbHgvZ0s3YStY?=
 =?utf-8?B?bkJMOWQ0NzJiYjhPSFlZbU1BQnpSamwzdjM1bjJrT2Rhd3d2cHB3MExnWHhC?=
 =?utf-8?B?Ui9ZVmNobTFURmU2MmVHQ3lOZXE5eXgxNjdlL0dPbE1EdE5HdzZ2Znltbk1J?=
 =?utf-8?B?eWNScWZ1cDlzRk9zVnU5MjZzOU5TV0t0bFhIaEp1YjZVV1lMSFZaZHlvZ2hw?=
 =?utf-8?B?MURHREZKSWtmWkVSZUUzaTNKRXJhY0lON2lrWTdRSnBQWWh2RFF2TjhGTi9u?=
 =?utf-8?B?R0F4ZklxcFNzSWhRbkwxMktCa290UERlR25UMlc4WDhUYmRYU0hkZlNmUlJm?=
 =?utf-8?B?QXVIQnRubERlY085Qk0zWlBZaG5GSGZMQ2NqV0pIQ3hBK0JFa0JHUFRNV2F4?=
 =?utf-8?B?ZUtIbE9XeHZHREcvM2lVa0d3M1ZPNFUvOWZmVWZLOWtpamRlYnQzQVk3TENP?=
 =?utf-8?B?QVNmVGt3U2hxd2JlU3h0Y1JTQUhGekZsV1N4eUhlY0t6VVlSWCtvZ3A1a05W?=
 =?utf-8?B?bFNIVy92ZllPTFMzM2VwMHIyL0tBVWJLZmk4ODNnRHFyVS9ZNlJsNzJtbUVj?=
 =?utf-8?B?S3gxdWRvbm9PL2txUGJrdzdVdG8vSitPQTFZWXQ3Zk9GbWJuU1FMalJuS0FU?=
 =?utf-8?B?YnBvS0hOQWR3QzdicXZRdmNhOXdoRDNJODJ0WEltSHpXSGlhdGpvbkp1dUZQ?=
 =?utf-8?B?bEI2Y1ovWkhjMXNRRG1uSW5jaXpZdFRTYnFsbjJUSzBaMktOaWY0SmRtbjBP?=
 =?utf-8?B?S0krR1o5SXNXY0dsMGFEWTBQZmRucVlxdXhZbTA4OHFNb0ZBTEh0QTBKRy81?=
 =?utf-8?B?akJNeHpybDJuaTFnc0NWdUZoMmRCQ2Q5b1J3cjAzVlhXSkoxTjcwQko5WjVZ?=
 =?utf-8?B?NE81a3ZpdmxZUmplTW53alAzMmErdTk4MzJ5UHdFTEZFaWNBN2k5TmVuRTBk?=
 =?utf-8?B?ckJ6OXQ5RWMvZ2dnTmsrVWQvZGFGRGFBL1Rsc2pJQUtVY1dGKzIwUU9HVmY3?=
 =?utf-8?B?UFROV2QwbzhkSnp0WjkzNjVyNW9XQlZMUDV5MWhpRWJmbzRYb1NJajQ0VDJX?=
 =?utf-8?B?NkhqdUo3NFN0eTV6cVFRcndSR2VwRE83WFhkeHlTeUMwWXk0TXREbjFPUkli?=
 =?utf-8?B?OS80bHRjVDNLeGkxaWcxNUc0K3RTdU9raGRpK2lHZGZrWkVDUkNzUjRJZWdV?=
 =?utf-8?B?ZXdqRElNTS9Od2FUOUtPTWlnZ05YTlFtOEhMcTBVd0RpQkRxUVNCZkx4RVRG?=
 =?utf-8?B?aVNrT1hTUzdKdk5RcGRKMmNlQlg4MzZ1NVU0Szd5bGFCVWJyOWR6VUxaYnlU?=
 =?utf-8?B?RkRLUkdSQ2I3SVFJRmxqVHBhS1NYcTBRemFqQnlQU0d0ekg5QlkySjVkcWQ4?=
 =?utf-8?B?RDZyeWVBRE85ZERPSVJ4b1JnNlF4eWc5YTl5KzBPV25kUHFlaE5MSSt3YmIv?=
 =?utf-8?B?RzZIdTB4VURNN0dEYVhtQ2RqcklmVzUraXhBM1FqTHg4U3k2Q2RhbGpvTjd0?=
 =?utf-8?B?bHhFQmlTUGZpdldjd3VQK2VOa2xwOHFQMzJtUXR4cVFBUHR5WEZUNEJPMnBN?=
 =?utf-8?B?OU5SY0o2WFFuMzZuTkhKRWxqa2V4L2M0MG1GQmFoRHdvSHpTblR5ajk1S2Vu?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffc52e3-1f3d-4fbd-cf88-08de1e1820eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:10:12.0661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVOLT8baySHsJ2DLRHS+MqhiBLm+mFqUnCEaQvcLaI+DXIknm9w5VKpkHNYGfSCBjAp9DHS/YJ6eTyZSKNbf9e8d9Za+6ewJ2747HrsZN70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
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

All the feature enabling code is in place - drop the debug flag
requirement for VF resource fixup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 39c829daa97c7..284ce37ca92d7 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -156,14 +156,6 @@ void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
 
 static void vf_migration_init_early(struct xe_device *xe)
 {
-	/*
-	 * TODO: Add conditions to allow specific platforms, when they're
-	 * supported at production quality.
-	 */
-	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		return xe_sriov_vf_migration_disable(xe,
-				"experimental feature not available on production builds");
-
 	if (!xe_device_has_memirq(xe))
 		return xe_sriov_vf_migration_disable(xe, "requires memory-based IRQ support");
 
-- 
2.51.2

