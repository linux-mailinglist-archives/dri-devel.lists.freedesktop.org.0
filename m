Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC0BAB409
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 06:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A69910E271;
	Tue, 30 Sep 2025 04:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpB/BKq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFF710E26C;
 Tue, 30 Sep 2025 04:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759204994; x=1790740994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Z4xaxSVrPBzBX4BBDSsPq8sLGA8lWZI8Hq3lSCo+hY=;
 b=GpB/BKq99NplOzfYbz3RE5seMJd7UiqFeBfFZ5n77VC2+kNVOBgbJb7L
 r5lHo1HtWlJn2+bcPFNZ9tx+Z5nLIgwvBAPmrMhQmsP5C0bdkNLYYTud2
 ofbMXfrAq+qo7RwLYd3QoriauV4Wx/RsjECIsWKkewhSRe83WbQti7/jg
 dJUwYZxqszv4iUPv7OjZ0HalMtyKPxFkQ2+m/+BHhzML6ucE9DzfLkRCS
 /1z+y2Dqmj8InPpyY7ZKrc+OScDA4Hx6RZsPuzLfKWPMdsuaETgLlCEwS
 Kd1gFU2zJBwXCaVaQioQxDND0S52BIkh8yo/BLB83K7SPBzdspkaxFtEl w==;
X-CSE-ConnectionGUID: blPd608jSZeKkq0rew67gQ==
X-CSE-MsgGUID: hFHBTi8sQiq+2SHU98w+Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72070544"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="72070544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 21:03:13 -0700
X-CSE-ConnectionGUID: rmT2kUa7QO+vgebWAsY42A==
X-CSE-MsgGUID: dZ/R73mPR1mlx/eA7S5okg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="209363290"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 21:03:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 21:03:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 21:03:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 21:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8zFig0Xfh6vKvvT63Mh/IPsXjBrKEs2anDzrwDtzGhhMJ8DP4VphG+M45jOQQMDsITBf5kvzzWoldOtQMISyS96TordCwIfdrUcVz5XbzDj8FsfLcs1nqtVf1bBcaqM3MzW9qxT0tejRIulsSzKR/U9FqiQgux4ZRYDn8UPJUYQso/AEhFDP9J15HliOm7Pe0BMVotniI93sI3Y98pDp4fjwqZGut3wU6vzsVZhbt7XcjiyCVistnHN+0/9XI6EcAIwIQlX+IyGGkMVPhUd8sWCXdvVWKOX2xahdwUu42REGMuW+T9NoDSNp/nat8+jYsgV63FO4dZtkr8Yk+z6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z4xaxSVrPBzBX4BBDSsPq8sLGA8lWZI8Hq3lSCo+hY=;
 b=ebMOc0EZsrvgfFlygSI99ywQqbcrJgI/e9CYo6vtINCcCHZIJlDNHj0lqdlBABcul0iPiIXmzygFxBaD90VkNgU6Z40GKzhRoN8omu3r7fl7mgwCE28ywmMNGhK7jOIzBvHsqxjpvUmDBlmqKQIfxMX3CECjw9bVLq3C0EmFB47YcSYgaPcMQb9izvt/PvyyViMzlNM6yqEOSWgT8hXmNcnPOdJRZzsR6sez5Z26gpkzV2yJ1F2ZPOfXyjdYEg7xTNSAWQhs5rLU2fQJsGzE82utTXkHr6ShYAfU3lwjND+hEVSQHQSo/tNe/bF2zDEbuYALwmxewnLdhXKYFxYwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 04:03:01 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 04:03:01 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/5] User readable error codes on atomic_ioctl failure
Thread-Topic: [PATCH v5 0/5] User readable error codes on atomic_ioctl failure
Thread-Index: AQHcJtoPCTnGIgEtNk2/F3697u1bq7SrMF4w
Date: Tue, 30 Sep 2025 04:03:00 +0000
Message-ID: <IA0PR11MB73077AADBD3CCD0AC1CE3EBABA1AA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250916-atomic-v5-0-821525cfbf25@intel.com>
In-Reply-To: <20250916-atomic-v5-0-821525cfbf25@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA1PR11MB7062:EE_
x-ms-office365-filtering-correlation-id: c1e71987-f3d3-459e-d577-08ddffd63f86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TStrTzZiUnZNNTFFQ0Jod3dGMks2akV5NUp6SmtnbXZyUEF1em9xaXVDbWg3?=
 =?utf-8?B?S29PRk9TeGxUMXRoVUx2WVg4RzFHakwzMjR6MUFDYmxZM3Y1MUFFZXV4YXVM?=
 =?utf-8?B?TTk5STFRZXFVUmxBNHF4TlBPdDg0S0c3c0lZZGhsRnRzcEF3cW12RTZ1ZkpZ?=
 =?utf-8?B?TVpiMEZlcWJQWVBtcW1sTTR5N05SZEhpNE9BdkVZc1NwdFRUckIvWFNRR3Yz?=
 =?utf-8?B?T2VJWDU3dlZPVGF6QnFKKzlCUVJJc1pSKytVZGlsREdtMU9mU1dodDVZWjFu?=
 =?utf-8?B?TWh5NFZsNkZMU1o2ZnBHUkszeTkvdFFZdXBKVGdpNElzQXB4OWQ3cW96NTlY?=
 =?utf-8?B?aGc0d2pkZ1FZbmZCR1dHUXY4VlU1WS9OdTliYklyQlRtLzhHMVVXdzRucS9j?=
 =?utf-8?B?UFpNS3YreFpMTGc4T25NUEFTMk1KSlY1WllhSlZ0RmRXM29yVGFtNnNWR0Q3?=
 =?utf-8?B?b2M5Skp1SmN6VzNzMVdmT2syK0VacWQrK2VkK0txUU9lUVlRMFpIYTBESHZu?=
 =?utf-8?B?c1JXN0tFUmRsNDA1eEhmZUVHb056ZjFraWRSbVo1RWYvWkl1Vi82bUtNYThZ?=
 =?utf-8?B?VGtRVGhkY2FoZ3o1TEd2TExMM2dRcEVlVEtaN2ZyeEhqVVQxZXp1eDF6aWhH?=
 =?utf-8?B?S2wrRThMMGdkNmJCeUdtS0lyVm51R2dYL2lwak5UVHF0dmNZWmJHL3FTQ2FW?=
 =?utf-8?B?RXNiOVJuQ3J5bnpMTHM2azJoaVAvd2dmRmNMUlFKR3lGSzhNLzJjOU1Zazly?=
 =?utf-8?B?MUdMTkQ4WC9sdldDcHlyNTBXaDBDalFmN0c1a0p5MzdWUmZ4Q3RsRDlXK0FQ?=
 =?utf-8?B?RCtsdjN3MzlleStaa3M2bnNMeFo1L3NYT2gzNmdHWjdWTFREeEEwamtqekcv?=
 =?utf-8?B?RlhJL09lMDFuM2FtOHo4K29lb0JCay94ZitqT0JybHAzbERIam1MdnczUWx0?=
 =?utf-8?B?MWJqR2FPQVM2bU4wSVBqS1o0aEFBdHU5ZzhuNnBQamd5Y21oV0FzRGhkckpt?=
 =?utf-8?B?TWZaRUNkdGZPcEFEenFLMFNCNzhZL3FwQnF5SEc0S2NUTW9sQThleGZUZlY0?=
 =?utf-8?B?SlZKMmp4YjFYRmFwLzZTYU1WY2lGTmlLa2o4OVBkRlJaUjhRbHhiNVMyWGtu?=
 =?utf-8?B?b1d1MjNPU3kyMGFVUzVtZmRxV0p1S2ZYVkF3OWJMSXhJRDlGbU50WUJMa0ll?=
 =?utf-8?B?NG1ud0tJMVdtWU9MWmptT2ZXeURiWkhvZ2lRM0lSR2t0TjhmQ1J3bm9sTkRP?=
 =?utf-8?B?ZzhLOTlLK3dESFJSajFYeis4a3VLM0V3ZktTSHpkMVVGQUhhUUhhek93OEJW?=
 =?utf-8?B?c2ZpM0dUQ0pJeXdiUU5kV202UXR4cyt6NTh3TUhRV0lhRk04Y2lLSGVVOWtM?=
 =?utf-8?B?Mno0ZGU4eTVlRzh0VXhmYVpVVWdGamkxUjFWS2lKMkZLejQ5R0svR2R0b1BN?=
 =?utf-8?B?dnFUMnBpZHMxVzlPN2lZaWVwMnhXcUVZZ1NrQmpmMEJKbXFzRVpkdlFEVTlv?=
 =?utf-8?B?L21MUDNjYVRTVmIzVVVUdHFIYkMyaW1PWENGU012dUJTdW1mZVFxbmQ4TU5X?=
 =?utf-8?B?NVRrSzhDK2EvdHNEMVYrdTZkL3FjUllHNkpqa05DdS9UN3k2RVVhY0cvM1p2?=
 =?utf-8?B?N09SSy94d24xRmlmUDVNemxObk5SZVdkd0lIT3U1ZzFuOVlEVytFRzJxaE5s?=
 =?utf-8?B?OHhUSTVodURoSkVjR1VpOUxFMUZqcWUzWHp2Nnh2enZvVU9PYU9wK2tLMWJn?=
 =?utf-8?B?bG50VFNlVGlxaGFiWkRseWZvMkUvUEFsS0h0WHJva005dHZaVFJWa1JzMStD?=
 =?utf-8?B?dXY1Q3RPSHRDYkZ1RjFja2VFcUowT2JuZDhXWTJuYS9WMTBaT1FrMkh5c2do?=
 =?utf-8?B?Q1BmQ1luclQrQlh0eHI4M3p3cmxYQ29nOVB3ZGNvNnB4OGk1UlFsaWJoSEEz?=
 =?utf-8?B?UU8rMktSRGNXdkp3bkJReERFNUF1ZUhxdnY5V2g3RWd2WDBGKzF6eDNPZTVm?=
 =?utf-8?Q?kDYPCNOFVI3G2F6LgwxTFYCfDc+gF8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eks0aUt3aWI0YjlJTDNOMm9CMXVKL3d6RHRxTENKY2h0OVc2RU5hK1VIWUVU?=
 =?utf-8?B?VDNMRDV3dEdheUMyUXNWakNRb3EzcW9ieFVqcXFiYUp0RmRYZlcyK1VOVXZm?=
 =?utf-8?B?Rk4vb0NEQmVlUXI1YnpTME5mYmJFUDRUU3JDS2JUSk5zN25zNmxVbkhMdkF2?=
 =?utf-8?B?SDU3ZWxlaWQrdDR3b2ZiNk5kWTN3czFMa2hRdk44VEhtTEZXeDEvQlBjVysv?=
 =?utf-8?B?MUV5b0srUUExUEIwcjBSd0tuSVhNVTA4QWc2ZzNLM2s4QWc4TUlHNmNRVWxi?=
 =?utf-8?B?TDR5M0ZsYUZ4YVM4ay8xREZMbXVEM0ttWmQvMC80bytrN0FIdWlKTCtvMnJR?=
 =?utf-8?B?dFhHODd5MVJ2RjBlSDgxSmM0N3hWU0FSOUprNThZbTJGK3B4M3lsZVVKQjNY?=
 =?utf-8?B?UjhDYTNMYUU4b2d0ek1ZZGFQVkZrNzBlTXVlcUV5TG9sTTRrNzNaTEQrWHF2?=
 =?utf-8?B?S3diTm56cDZrYWIxSXBNeXBrMVRYcFlXejQ4K3h2WDJKajdxNlQ3Wk5kYjRZ?=
 =?utf-8?B?UldNbGl3U3VHbGNVVGk0MGJrbTVUUXRwbFZ0SVJzTGZCeDN6RWpqcXhBd0Z3?=
 =?utf-8?B?bmZXVFNWVGdsTitUclF6NUQyQ25DbnIwSnFpN2ZkR0lrYlJEU2p6cGd5RUty?=
 =?utf-8?B?SDhxbmV6eU82Z2lVR1ZPeTVTUWE0YytGMXJscnJGdTRKWHZXckdzZkUwVE54?=
 =?utf-8?B?UXljUFNkVGtRMEdtc0gwY2xuK09CaGFTRnl2UjljN0gvUURYaWZkQlZObWxk?=
 =?utf-8?B?L0NNTUVRQlZ6VWgzUTZhbHpVYW9ReWFrbnpxSTJEL3poSlc1MVlQTUhpYlRa?=
 =?utf-8?B?T2IrOWRtVFcyYkdaU29xeUJTbHZCeVZlL2s5T1dERFlrSC9UVEdLQk1EbGJw?=
 =?utf-8?B?aFBNOHlia3RYRkVobVVvY3p1b1JwMlBQUHR6cjhnejUvdWdzOHFxaFdyUXJj?=
 =?utf-8?B?NHV3VWw1elcxcDNyc1ZlMnJrYkphMjdyRG5BNzRCRDVRRWRJdnVqUWVQTVp2?=
 =?utf-8?B?bWJ5SjlkOHk2U0M5a0N6OTBva3FJSkl4VlpGOVZWaDVwQk85Zk5LRmtUaHFO?=
 =?utf-8?B?WVFQdVlDeCtsUVdTbVI1eFlZaWxRSlBxNG1Wc2ZCZmlnVDVxeldQenV4RmJy?=
 =?utf-8?B?U0s5dEF5UlFkd3JwYUJJancyMzVjUGZJanp1Z1prNGdFWkFJMU14cXN0QnAw?=
 =?utf-8?B?V1A5SzFFMTB6N1NIYVpwWm5mZHB3U1diYThxMklSbkZCUm56RlEza0xPeHRw?=
 =?utf-8?B?cUlDbkM4RE5oMmo0OEtERUpCVTFTckdGYm96YXFqUEh4K2tFL1I5ZHlSY213?=
 =?utf-8?B?anpnNEM1UFh4N1VlZEw2aHN6aDd6eFZZR0FSZktJSk9RalpKUkNQeENjczR6?=
 =?utf-8?B?Q0RrV0xscFowQmcrMGVVSUlZSUUwazdnVmU5QmRoRHY2V01yQm1hMHRXWVpv?=
 =?utf-8?B?QjJxTTUvcGJxRkp2UzExVDViQWlCYWRVdGUyaVdha3RrTGNWUXNMUktOTmJE?=
 =?utf-8?B?MVJ5Q0FIaUo2N0pYVzhKdERncTFGMnJvTkhxTWJQeUZRV1JUK3N2VWRhbFha?=
 =?utf-8?B?TXlSRFVaSTlmZXk1dUVydVlIemd6ZkI2eXZLTlJKcWhNT3hRbWV2VFdpMlp2?=
 =?utf-8?B?aDRITmJOWEpOcGVmcG92QTVpOTZPWHFrWWVUSkNNS0c4akJTNzBxdk1ycUUz?=
 =?utf-8?B?LzlTZmNrenVmZWpXL0ptQ1BBd1dENW55K2daRHdYZWRUbnJ2ajhpSmZ4a0Q2?=
 =?utf-8?B?cWhrMFoyY1hNRmJVVm4wME50NDZLY0xoMDdTYkpNaHV2T3J4cURSdTgrcXdZ?=
 =?utf-8?B?L3NnVGJST291UElWeXordVpYQzBMeDg0Yi8xVm9ibVNTamVrdHlSU3U1Q01w?=
 =?utf-8?B?cGNsRE1hVityalRPNnFEc0xhbmdNVWR0TURjcjlyN0dwUFAzVkE3ZUVDYmFt?=
 =?utf-8?B?R2JVMnJTdVB2Z00rOEdMaTRCZkdPL3BMM2NiUnAzeGVsZUhjTWZvblVnQ1FL?=
 =?utf-8?B?MHlwbjJzTk1jZE52R09HbysyZktLTUV1eUcydElkcU9pZXdqdUttOGNZT3Y0?=
 =?utf-8?B?c0o0cHFhYm5rNno4ejQ1MjFVbStTbEFlQWxadVZkUHA3b2lMOEJ4L1FjM0o0?=
 =?utf-8?Q?P4H7WkdJ3Nitfx8uwjADzN8Hk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e71987-f3d3-459e-d577-08ddffd63f86
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 04:03:01.0209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3XGTxGVTnQW9A/WMLVmT3RDk9itm48/4h4kyWn0KCRATnb/3OCBbSpO/YunzCXGOM8jKuluDHRDb8t6wGV93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

R2VudGxlIFJlbWluZGVyIQ0KQW55IHJldmlld2Vycz8NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0K
QXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5j
b20+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxNiwgMjAyNSAxMjo0OCBQTQ0KPiBUbzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBm
ZndsbC5jaD47DQo+IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IEphbmkNCj4gTmlrdWxhIDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPjsNCj4gSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
PjsgVHZydGtvIFVyc3VsaW4NCj4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsgeGF2ZXIuaHVnbEBr
ZGUub3JnOyBoYXJyeS53ZW50bGFuZEBhbWQuY29tOw0KPiBTaGFua2FyLCBVbWEgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIHY1IDAvNV0gVXNlciByZWFkYWJsZSBlcnJvciBjb2RlcyBvbiBhdG9taWNf
aW9jdGwgZmFpbHVyZQ0KPiANCj4gVGhlIHNlcmllcyBmb2N1c2VzIG9uIHByb3ZpZGluZyBhIHVz
ZXIgcmVhZGFibGUgZXJyb3IgdmFsdWUgb24gYSBmYWlsdXJlIGluDQo+IGRybV9hdG9taWNfaW9j
dGwoKS4gVXN1YWxseSAtRUlOVkFMIGlzIHJldHVybmVkIGluIG1vc3Qgb2YgdGhlIGVycm9yIGNh
c2VzIGFuZA0KPiBpdCBpcyBkaWZmaWN1bHQgZm9yIHRoZSB1c2VyIHRvIGRlY29kZSB0aGUgZXJy
b3IgYW5kIGdldCB0byBrbm93IHRoZSByZWFsIGNhdXNlIGZvcg0KPiB0aGUgZXJyb3IuIElmIHVz
ZXIgZ2V0cyB0byBrbm93IHRoZSByZWFzb24gZm9yIHRoZSBlcnJvciB0aGVuIGNvcnJlY3RpdmUN
Cj4gbWVhc3VyZW1lbnRzIGNhbiBiZSB0YWtlbiB1cC4NCj4gDQo+IFRPRE86IGRyaXZlciBzcGVj
aWZpYyBlcnJvciBjb2RlcyBhcmUgdG8gYmUgYWRkZWQgYW5kIHdpbGwgYmUgZG9uZSBpbiB0aGUN
Cj4gZm9sbG93LXVwIHBhdGNoZXMuDQo+IA0KPiBUaGUgSUdUIHJlbGF0ZWQgY2hhbmdlcyBhcmUg
cHVzaGVkIGZvciByZXZpZXcgQA0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzE1MzMzMC8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4u
ci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gQXJ1biBSIE11cnRoeSAoNSk6DQo+ICAgICAg
IGRybTogRGVmaW5lIHVzZXIgcmVhZGFibGUgZXJyb3IgY29kZXMgZm9yIGF0b21pYyBpb2N0bA0K
PiAgICAgICBkcm0vYXRvbWljOiBBZGQgZXJyb3JfY29kZSBlbGVtZW50IGluIGF0b21pY19zdGF0
ZQ0KPiAgICAgICBkcm0vYXRvbWljOiBBbGxvY2F0ZSBhdG9taWNfc3RhdGUgYXQgdGhlIGJlZ2lu
bmluZyBvZiBhdG9taWNfaW9jdGwNCj4gICAgICAgZHJtL2F0b21pYzogUmV0dXJuIHVzZXIgcmVh
ZGFibGUgZXJyb3IgaW4gYXRvbWljX2lvY3RsDQo+ICAgICAgIGRybS9pOTE1L2Rpc3BsYXk6IEVy
cm9yIGNvZGVzIGZvciBhc3luYyBmbGlwIGZhaWx1cmVzDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWMuYyAgICAgICAgICAgICAgICAgfCAzNCArKysrKysrKystDQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgICAgICAgICAgICB8IDkyICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLQ0KPiAtDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXkuYyB8IDI1ICsrKystLS0tDQo+ICBpbmNsdWRlL2RybS9kcm1fYXRvbWljLmggICAg
ICAgICAgICAgICAgICAgICB8IDEwICsrKw0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5o
ICAgICAgICAgICAgICAgICAgfCA0MSArKysrKysrKysrKysrDQo+ICA1IGZpbGVzIGNoYW5nZWQs
IDE2MCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0
OiAyMTE0N2ZhYzMxM2U1NjFkY2NlOGUxODM2M2M4ZGU5OTVmM2FkNGNkDQo+IGNoYW5nZS1pZDog
MjAyNTA3MjgtYXRvbWljLWM5NzEzZmQzNTdlNA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0K
PiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCg0K
