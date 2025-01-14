Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F14A10292
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787E810E898;
	Tue, 14 Jan 2025 09:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/ZU6Clp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB76910E896;
 Tue, 14 Jan 2025 09:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736845303; x=1768381303;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3WWLMnYZ5EMxmxsR4sVaIJfErSdPSYO4hrhh783niZk=;
 b=k/ZU6Clp3UnjvpUSk/sKmWJO1Q/f01PKBqu4iqg2bNcqDMOqMO1mG8pD
 wD+soL/22VNBApoXtlIqG1LFQ1xAM2zCmhbTaTtarwbC1GMLdARLDehb5
 oWtEBd0fx5Nq0yr643/4zfcEmy2hu5g6ipRW0qIomxFhsao5Tz+xvTOmu
 VJ+DVLKobiFR+dfvKJPFNPCi2p2cSWecyU9ebzn6mqF0qTnWBEFmYYMqy
 C+fXwEgE98D0hSfr8aOX6ZJYChMVbRaH7g5u5sboUggQM/X0vUCY9ZHq2
 E3yF7ET044yQ38JxN4g0CNZH00t7h+2W2+d7rkntgBFGWoWRNQ/LanPBZ g==;
X-CSE-ConnectionGUID: HG+w1PZ2RUSnO9BH/NVZ4w==
X-CSE-MsgGUID: UwUfeBddRN+Ae9UWCIJwuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47798714"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="47798714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 01:01:17 -0800
X-CSE-ConnectionGUID: 50jVHR+XSLmu9Ors1n+vuw==
X-CSE-MsgGUID: TZz2q7l4R9OVX+24K3Sptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="104507021"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 01:01:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 01:01:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 01:01:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 01:01:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrTuR6Lk4CXZCoM4cnZDPgAFfHu74zcn03Qr7dkf5Zm9CNxBP+L6VsmvtNrdZjjSC+PAPPDt0QZN1aKScwrosxOTgqTMUyxWZMcY1sb9Iw0xCTYZyrY9vaEMr1a8+VczytPzTcqI6I7XnPeCJA7cCkyt09yR7VKaQd+t/t/Eq1FVqEQBos2YSVZZSqrPZb16AJdjRSaJQaXPITU0VbOMyv7iDSitWQ3tsC/jMQQGeA9IP/COFKeCgie+5MfHzoOV1C6HeQnMBatXXGA3mzlOAtkIusaqRR/9YYQt7cY+Qe/KTyk0JZzBRyji9+TF2Bo3eBfB/xDdiVTvc46D5kB27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFnfj0wKm8pf75VqRy8z+wuzErWXew5PdsUDQ3hUOwM=;
 b=Vv6Oyydq5dDoeMbcJ0DS3v1aVCgOxPKaJfQ762FSqiyziBkgoOeLem3WC/rwNh8Z0VUHbISxtp66dQ8ej6m9MObgcQ4pJJeJ6WwMO6wV3LY4Jo8vk9+r73p59t+0jyq7e63WOaEe6uqyA8U4SEebKCc2FGuY8IEy7WmQZALmKdD96BCsX2gWDrlae1r2+ur4RgmRCoVAEeYzph49RCrtSe/6R7cAYBC0chLBbFD82lvD1JuFXdqIhDwICtzb9Xbc/jO7cWD177vK2067bLZgPYfcn+EW+nihS2+NjXynFkp3a3fX3wi3n7GS+tbJota35rDcbsL6pw+XIh+mOp43OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 09:00:32 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 09:00:32 +0000
Date: Tue, 14 Jan 2025 09:00:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Maciej Patelczyk <maciej.patelczyk@intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Subject: [PATCH v2] drm/i915/gt: Ensure irqs' status does not change with
 spin_unlock
Message-ID: <5fnb3l7s5hr3yfehkpvf4jgcunm6qclxagvssdobvfxbwtjiyc@jzko7kb7svud>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de9b839-d069-4ecc-1960-08dd3479e6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEsvdUtxblBoOTJUMkVQNVNsOW1wT2xTZitnUktkUWJmVTFEdG1qV3V2aGpC?=
 =?utf-8?B?bS9ySUt0WVAwajd2UzRTTkhHNExDenlMYkNOTGhzbm9DaDJiS1pmRE93SVAv?=
 =?utf-8?B?VWZxYkRhbTM0NGJ1M0dQcVFpMmVVd1EzN05kWGJmcDBLR21TRWl1YWJwMGlt?=
 =?utf-8?B?TFkyQVBraFJ1UXdGK0JCR1FhL0dLTzduYW52TUljeTBzamovWFRRM3pOM1ZS?=
 =?utf-8?B?NDdyS2lXWENndTRpaDRCcG1hOHBSY3JkY29oNlIzTU03N2QzY241d0VBYkNC?=
 =?utf-8?B?Z0N0SHQ0Qyt3Ui9VMHRoZlRUdHFBTXoweVBhbGlrdDR2SkFHT016MU8wdkxh?=
 =?utf-8?B?RlgvYXNGdDRDa04waWNZNzh3RG5LcmUwVEJJQXl2YjRyMnhwbnRmaWdYR1k5?=
 =?utf-8?B?dTNxZW1oZXh5TENYVGc2TFRBY1BlTEtENUgxSUFqck8zcXFSTElTUFYxUHNp?=
 =?utf-8?B?WlhNMkZlVHYzWDRUSVhyaFZTOXBpR2QyUUVyM0lERW92OUs2d3JiejJBWTZy?=
 =?utf-8?B?OGExWG1kRjNWVUh4Ym15Sk1FRnJIOUZVVkpGUjdzUVYrYy9YZVVwNWtsWWhp?=
 =?utf-8?B?c3lWOGxvaEZha1dZbHMwaHFLdEV0NnFBb2l1ZGt5Tk4yMTNmeTRpbGN2dkxJ?=
 =?utf-8?B?MXg1NzduQkVIU25TN0tiYUJ3bi91V091KzZUTjIxYmNHNGRPRVhZVnVTcWpT?=
 =?utf-8?B?cXR6NW1SSG1vK3hROFhKcjlxaEZqNXl1WWJNU3VRS1gxUEVyUVFzTFBDdmlN?=
 =?utf-8?B?VnIzU1UrZWpjMnpYS29GS1VsbFYrUDkxcFJCcDZ0dlRnN1ZGNzArckJIQXgy?=
 =?utf-8?B?cUNNbHA2TFVIRUdRSmU0Z0x3SlY5T3EwWHkvaytoamJwVWZUZkFvbG1NVkNM?=
 =?utf-8?B?elk1QkVuU1BicHFuQVR5Mlpld1hidXk5Uk9PeERabW1LSEd3eDRhRFlaNjRw?=
 =?utf-8?B?eFpBUTBZK25hOE5MRDVDcjc0a3N2RHNjV3BiOEJQeHpDZWpiUEZCOGpicmhP?=
 =?utf-8?B?bUVzaGhrWkVHR3NrdUVhKzdUUVlpKzdBNi9UNmFCRWR4Zmg5NjZFWDV3aHdN?=
 =?utf-8?B?UlI3Sld6NDBmbXRQbU16c2hEY1R0R1g4VDFKekxIcDdDZlJmdXYyWS9TWVlR?=
 =?utf-8?B?MjM5S3Rza0w2aDdsS1htKzdtSWFSNzBQMHBvUEVIZkxOKzNNdFlTc08wMkx3?=
 =?utf-8?B?dVdpdEE1M2xQRVVrRVUrZGp1YzMxZWtQc1NQbE56SGtjMEQva0JTYVdmellu?=
 =?utf-8?B?YWhUU2tHTkw0anNIdlVBSWZSTlNIRjJhU0VzRHVGNDcvV3BoekxaeEdoTmdo?=
 =?utf-8?B?aDNSd3FIK00vTUpmVi9HZEZiRTIrZUIzdGVEVWUrK3hhZy9BS1preEJHcUZD?=
 =?utf-8?B?VjE3aTdKbTlXQlRDNHZld1FndEVSN1VvZnVFd2FHRWVLL0pteVBENk1Obkc1?=
 =?utf-8?B?MHdyc08yOEcvNlFIVjYrVDlZZHhhbEJHTDdGWEY0VUlvVDF6d3djWC9YVXBX?=
 =?utf-8?B?UndNeWdhOWpvaHV1SmdjQjJnWDFCQ2FnTnZ1dWNiTU9MQ293N0EvVFFwQk5S?=
 =?utf-8?B?TE4xa0k1dzRzRDRqSkpST04wZjJCeUhvNGlpR2svZlkwOHJlaENwLzNXNXh3?=
 =?utf-8?B?T25zUE1FSmZYU01RSXlOdUwyT3Z4b1QzWVQzQW16RGxyUUFrQUFoa2hnUGhO?=
 =?utf-8?B?UVRKTE5kTWVNTzZobXlMZFZyR0JTS2hlazZ5L1RaRTR5eEZXUytVendxQjB1?=
 =?utf-8?B?RGFjaHB5SXdHdTdyMnpQdW03NzhJcEVvK29WRy9rRXBnUnNpTDRZUGU3TzY3?=
 =?utf-8?B?b0tZTXkvTjZHUEdWeEJSTGJ3Skk1ZC9DMjhSeTFiUmtZbGRNYnMrZlhTa1FM?=
 =?utf-8?Q?a5Y/o+RwQjs01?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNNT0tMb0prSlFpcEZBemN2UEtUaGVvWVgxTkViMXExYlNmT3JWcGV1MTRP?=
 =?utf-8?B?d2lOb2V1UGkxNlZSbUo0WmM5Skp2NHp1REhYUmwxeGc1SU56TmwwZVFkMldi?=
 =?utf-8?B?TS9zZzFIdUJlSzBoR0N3UGR1QkdPSExnNW5xTFNteG1wQm5vT1B4UEhFUlNs?=
 =?utf-8?B?dWlsMHp6emExOW1kUXVBUXQwNWY0eVdCbEhtemdkS0JMU0UxTnlJNlM5TUtJ?=
 =?utf-8?B?aXdCR1ppSzVsNmFRc3NORG1wRHhhVlVRZHo1VFhmdnhpaWRETE5EVUFaTnlj?=
 =?utf-8?B?OHRTYnpqVjh3UUlJelJRNG5aUEtHSTV4ZmRGcXBZTzBMbTJhdmdjNitqeGJW?=
 =?utf-8?B?bTltb1FDcVd5RGVLQ2RSb0NZVDlMVVZZSDMxdFFlM1lIdC9tRUplak5GMisy?=
 =?utf-8?B?QS9aaFJ5SXhua2c2czBNTEJaUUlsUXBWTFMrcVM1Rk1aQ1ZrY2NnUFpXSjJv?=
 =?utf-8?B?eUkxQkFVMmQ3aVhZeFM5UXJIZUdQbUNnN1pUMTJadTF1UGNTOUZ5OWtJbzk0?=
 =?utf-8?B?MXllWkt5MjZmYVg3dE5MVzJKSUhIT0VQWk1DUTdhdXJUUkMwWXVyOVZMV09s?=
 =?utf-8?B?MW1FVkFHTkRjcVZSQ0JaK1ZnOGtSR2YwZTJ1eTNFY2ZNbURlUUNiSHRZeVFO?=
 =?utf-8?B?K0xrbEx6VnkwZ2doQTN0NVN5TWZpSGtCYkFvWEZKbTZCdFo4S0JzUjZ0OWRS?=
 =?utf-8?B?c2FRS0xQbWh5M3hISWVlYVN1ZXZpU2VzWEdSNUs3KzA2bW5udS92OE9seXc0?=
 =?utf-8?B?MVhpL05jaVgxQi9JM0hoeU5oclR1N3FKR0VSK3FMbHhramRKQ0tkZk80Rmxr?=
 =?utf-8?B?Yng0T2UrcUkvMlJjU0Y4blo0L2RJWjBVcjVSTjdCeHBoZ1F6MmEzYkhndnl4?=
 =?utf-8?B?em9CQVBZWXhGSXNyR0FtdGJYK0ZETmpqZ3p5K3I5ZUw2NXhBRVVTby80K1c2?=
 =?utf-8?B?YTN5WFYySHV2YWl1VldqMVlUc04wU3lXcVV4d242QWtIbi9abDUxNmlQNngz?=
 =?utf-8?B?NzRaanVka2pKdkE0ako3QXljYmtOaUxlN04xbGFIaEZJRVY1RmduS1ZoeGxO?=
 =?utf-8?B?T1lManZLVlQxZTVBbTgxbHo2R0ZBRWN5OXBuOUErWjNhVUdHMDdGQ0VHMERt?=
 =?utf-8?B?cDNkdW8rbWhDNEJYdTM5VFlhUHBzRm5rbTIxZFEwektyMWFleUZ4THlFNHh3?=
 =?utf-8?B?bG90NDhKYjJtcUxPVHZ5QjRMa2F1TmNoRUl2YzNsem1ocTRhRnpaMmtvL1I2?=
 =?utf-8?B?czQvV1ltM3NxaFIzb3JWSlVGNWcvWnlxeGV5R0QyeXBTb2ZxUjRnRW94Vy9S?=
 =?utf-8?B?dnQyVXVvZ0JsRy9QNXowU3grNW9nWUp0eGU1QUhPZG45Z0FoYjlPekNNcFpk?=
 =?utf-8?B?SmJOd2dwSGEzVlZOOVhsbUdVNlQyWDBKUVVXNW1jbUhhWlVtUGlHK0VnTHFP?=
 =?utf-8?B?TnVyNEd5ZnpjK0p4N0h5Nk9LQyt2YVZyUUxROXlscXB0bVlHSlRDblF3V3dQ?=
 =?utf-8?B?N1lrWVpsOVZvUHZ3YUVUcUtFSDhjU1NkNWxEN0o5bkUwcldOK3RROVVYdDJQ?=
 =?utf-8?B?NEdNU3dNNHpyUk5tWjAvdmJEekZMdExudWpLQ3JLNStlTXppRGFZQlFKazRx?=
 =?utf-8?B?REdCa29ONzdyTEVkUkN6cHp0U0F6QWh3SlBuV25qWnRuelFGUTh0OVVFMEo3?=
 =?utf-8?B?cGI3UmFzc2szT2FxU3ExZ1cySWRVZitxOHVzSGJKRDBVa0VVWmxCaGt6T0Vi?=
 =?utf-8?B?bkJCL2FGRmZ4TkFubzd1RkJzakFoRXBoYVk3V01HMU43cDM3WWYzMDdHVFdw?=
 =?utf-8?B?NktzWXVLYmVhdFc1SW9mM3FCNVJ3b2pkM09TNDFhS3VQYjM2Q0xhWExId2N4?=
 =?utf-8?B?TG9aSmhRTThHMU9lRjQ0ZmI1VkhjNnorYVdJSXY5TXdaZzREdVVTK2p0NzlS?=
 =?utf-8?B?T0RSS1BDVXFqQUZwZXp3WW1VVk8vNzVpbjd1OXRad2dRWEtDWU5ONzYrRDNZ?=
 =?utf-8?B?eExqLzdjSmY4VE9JOWdFaGxKeVh2WnUzdzExS3F0ZFk4R1FnZGd2QVVBb0dJ?=
 =?utf-8?B?Tk1ESmxGeFVWN0dtRjZVVUtDemlPK2dmQjUyYjg1TzZkWWtZWHlnQVhUS04y?=
 =?utf-8?B?TnE5TjJGa3M3Z2NpbEdQQmxvTWZNR2ZZRTVPak9BV01CQk1NbVhUOU1ZZ0FV?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de9b839-d069-4ecc-1960-08dd3479e6d0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 09:00:32.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HXj1fjyQQb0s5JSUWfI1O6Nkh3EDTLFsmTqd1ifUDwd6mxm1E+UYPOq1cA6oM8C5vNhUokqUdtqPFmiDrhtxqwkyakMRKv970/5F0LQ8pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

spin_unlock() function enables irqs regardless of their state
before spin_lock() was called. This might result in an interrupt
while holding a lock further down in the execution, as seen in
GitLab issue #13399.

Try to remedy the problem by saving irq state before spin lock
acquisition.

v2: add irqs' state save/restore calls to all locks/unlocks in
 signal_irq_work() execution (Maciej)

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
This issue is hit rarely on CI and I was not able to reproduce
it locally. There might be more places where we should save and
restore irq state, so I am not adding "Closes" label for the
issue yet.

 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   | 21 ++++++++++++-------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  5 +++--
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index cc866773ba6f..dd5542726b41 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -53,13 +53,15 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 
 static void intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 {
+	unsigned long flags;
+
 	if (!b->irq_engine)
 		return;
 
-	spin_lock(&b->irq_lock);
+	spin_lock_irqsave(&b->irq_lock, flags);
 	if (!b->irq_armed)
 		__intel_breadcrumbs_arm_irq(b);
-	spin_unlock(&b->irq_lock);
+	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
 
 static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
@@ -76,10 +78,12 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 
 static void intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 {
-	spin_lock(&b->irq_lock);
+	unsigned long flags;
+
+	spin_lock_irqsave(&b->irq_lock, flags);
 	if (b->irq_armed)
 		__intel_breadcrumbs_disarm_irq(b);
-	spin_unlock(&b->irq_lock);
+	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
 
 static void add_signaling_context(struct intel_breadcrumbs *b,
@@ -173,6 +177,7 @@ static void signal_irq_work(struct irq_work *work)
 	const ktime_t timestamp = ktime_get();
 	struct llist_node *signal, *sn;
 	struct intel_context *ce;
+	unsigned long flags;
 
 	signal = NULL;
 	if (unlikely(!llist_empty(&b->signaled_requests)))
@@ -226,10 +231,10 @@ static void signal_irq_work(struct irq_work *work)
 			 * spinlock as the callback chain may end up adding
 			 * more signalers to the same context or engine.
 			 */
-			spin_lock(&ce->signal_lock);
+			spin_lock_irqsave(&ce->signal_lock, flags);
 			list_del_rcu(&rq->signal_link);
 			release = remove_signaling_context(b, ce);
-			spin_unlock(&ce->signal_lock);
+			spin_unlock_irqrestore(&ce->signal_lock, flags);
 			if (release) {
 				if (intel_timeline_is_last(ce->timeline, rq))
 					add_retire(b, ce->timeline);
@@ -254,11 +259,11 @@ static void signal_irq_work(struct irq_work *work)
 		if (rq->engine->sched_engine->retire_inflight_request_prio)
 			rq->engine->sched_engine->retire_inflight_request_prio(rq);
 
-		spin_lock(&rq->lock);
+		spin_lock_irqsave(&rq->lock, flags);
 		list_replace(&rq->fence.cb_list, &cb_list);
 		__dma_fence_signal__timestamp(&rq->fence, timestamp);
 		__dma_fence_signal__notify(&rq->fence, &cb_list);
-		spin_unlock(&rq->lock);
+		spin_unlock_irqrestore(&rq->lock, flags);
 
 		i915_request_put(rq);
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 12f1ba7ca9c1..e9102f7246f5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4338,10 +4338,11 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 static void guc_retire_inflight_request_prio(struct i915_request *rq)
 {
 	struct intel_context *ce = request_to_scheduling_context(rq);
+	unsigned long flags;
 
-	spin_lock(&ce->guc_state.lock);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	guc_prio_fini(rq, ce);
-	spin_unlock(&ce->guc_state.lock);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 }
 
 static void sanitize_hwsp(struct intel_engine_cs *engine)
-- 
2.34.1

