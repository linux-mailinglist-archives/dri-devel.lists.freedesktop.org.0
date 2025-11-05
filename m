Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29E8C363BA
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796CE10E75C;
	Wed,  5 Nov 2025 15:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoJsCt6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E845410E76A;
 Wed,  5 Nov 2025 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355455; x=1793891455;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dJlU9UyLALFeGAGKpcdC7Em1yDDhKkRR0BdvDURrt1o=;
 b=KoJsCt6+d9HtqEtCIyG8Eip1WV+qPyEjzUFTkbsIa0mg0NhpfFzvjEDm
 5PkZGcFDDd4TmRVdY+WGNsy7YZw+VCmZseIUgauMKuvfUZLGMOHub/V7C
 w/ecqwjCqoqHWTelG4+n9qIsX84sQcJnVbkxtY2Ns2OTU4E8AW6uhSZIU
 LbtCYiClzyagTu+I/sobT43qTsu6+N0eHAQolHufrni9C82J7v25ntoej
 5HYzw95bC50t3EniZNx9vRVpMES0UKQSD7/my18Gqs12gYALH2QGTJWqi
 MXh15YFU1jJ5ZieuoQ/orS2qqGBsdss44EgFZMMSJFSFeSawhwj2UlXLF w==;
X-CSE-ConnectionGUID: 2/mKxZwARAOsXVdmf45CIA==
X-CSE-MsgGUID: KNzf2qMXS4qy9SER37qrKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63482473"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="63482473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:10:54 -0800
X-CSE-ConnectionGUID: pMXcvsNMR3ekNLmcseSxqw==
X-CSE-MsgGUID: XcQSOLUQR8yXQJxaLE+EQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187173841"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:10:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:10:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:10:53 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:10:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVZyDuacO3uds0l4OMBWvJ5MJrpJBl+F5A65PUJHNrk6GC1HRWP4bH0B2vizBw6px2KE6ptk0KT3UbUjRU1dXpQnBWBgd4fynEmnTV542iLHqs6tqwcshr4ybKnNQ3x/gxE+gxoarSpcsrlm0C1tun0IGuKy/PdTErUtbSf2B6oIPh1p5jQ8oP2w8EE/LbsWBZNH/bAEj6O/DmFcZPy9NlGQNGbpe2qT+QIbLGPh0nV7VjbhSA6E7NdyxnhlTE6xfVYdCMTz3Lzr9hOpNJcbN2Tj81k9zqVftr05Mk53Dh2BvRpGomRzAQKA4r8qlHmhThlG9lEBLSt4zfv23JUubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuuKpPT2DYV0a7CHFiWWNrKMEl38Lm+Coz0ZfbF5XfQ=;
 b=eeiTa146Hd8iT0hvzuX47/kh8472qqqQ/liGK7/nsGqAhhw3yt+qEfkZT03lkvB+IW9/W1VbNCq3/GqAcE0Hi1NKFnFCTQUjXCG2krq6PFd8nxTgwfjBI/TXlFsB7eGWSezqmqxeRIp31Zu30LiwujRdmKb1bh6ZB3DvXQ1jxNmibKXFKbNOXB4cttG6GJFvgTIapC1qtgNaWYjiYWAfCg61miSYZqNBbdYUrmmFo07VhULeJKBDh8XNdB7xS0mpVwzEyZ9wU9v8O66OhPSvfX0IXJJNTXizYBYnPwgBI5X3kXht5XaJmRDBaEgGi5ed7AOs16Ilc9wS5vSUOxBDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:10:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:10:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 00/28] vfio/xe: Add driver variant for Xe VF migration
Date: Wed, 5 Nov 2025 16:09:58 +0100
Message-ID: <20251105151027.540712-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0159.eurprd07.prod.outlook.com
 (2603:10a6:802:16::46) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: f3597201-bb11-4559-023a-08de1c7d7ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmRpSUdyeHNQeXhOUG41c056NFMrSSt4Yk1ZVzJVVSs3VjlPcmxyNnY3Sy8w?=
 =?utf-8?B?KzJRUjA5Z1d5UE93TW00c1I0MWJSWFpGYWc4d3h5eDIvaFdRZ1U2YlJLdncz?=
 =?utf-8?B?akE2QmlkWkZ3TVRsRE9OaStTdG1idnZJd3BxRzR6YnFkU29pQ1hDOEdhcDkv?=
 =?utf-8?B?c1BQeGN4RWIrTE90WVNRTDlhSmFUaklLUW4xeGpaSXovZUgrckVuUVJJZ2pu?=
 =?utf-8?B?ZEtxMC9VeFVqQlJnYkl4MGx1bklXOThDM0JDMTBmd2oxLzBPTWYxd3c2djAy?=
 =?utf-8?B?MmRTU3REYm5xOTdhOWdPWlhicEtXVW80QjNHWEgwWjRBUGlCYUFiZENYZEZF?=
 =?utf-8?B?dW01SnBSV3EyaWRYa1R3c1BvUGVWbWJYTkphbGI1b1FNZTJkSHZKMzNwMlBW?=
 =?utf-8?B?bFoxenpEK2QyUUhQbE9xMXcwYkZXWWpselNxV1VWZVBoZko3QW84dm1IM3Zi?=
 =?utf-8?B?QXhrZUQ5K0lIY1puSjNXSGU2VzlXYlg2Zk1BQ2Y1eEV4ejU1S1R2R0I4SHE5?=
 =?utf-8?B?SnUyalpFZVhRUjVyQm1RTi8zY3BtMzVEV1BOc3kzWk1acHhMUjFGVTRJb0ZO?=
 =?utf-8?B?NTc3QW9KdWdQMzVPVU9WQ0tOVDlpRjMwUnJJcFkxWVh4MUVEL1BBSDR1eWdG?=
 =?utf-8?B?MDVaQ1A3WWZVV1FueW5SL0FKRmtreVVlcUpNcUdreHlhOFJ2MHRaeTZITlJy?=
 =?utf-8?B?TTUxUnovWXZHbzI0UzJZdmRLOU8xVUQ3ZDE4Z29UenB0RFlVNjVnd0pPTmVL?=
 =?utf-8?B?RWNCWnlNY3phaTIwUnBNWW5CcUxaendWWTVqZDBGQTdYeHRKblZ4cVdRZ094?=
 =?utf-8?B?SjhaM2Nuak5MOWluQVBqdVB1aXhpVlBNa3RvSFppZ0xua1VUVHV0aUlEbFZi?=
 =?utf-8?B?QnJpbTNUU2wxTCs4VTYvL1lEMGNqRGlyRkFOcnhmQndNQTloWGdHbHhzUHQw?=
 =?utf-8?B?SlBRVUI1ZkVrd0s4RGoxZGhvZHVGQ1dWUy9NMFRpME1Wb0U2S2crS2hLb1Vi?=
 =?utf-8?B?ekZBVjFJV3NYM3krUU5raXA1VUVibDI5MlYvVWF2WjRVYk9pK0QvUmplZWU2?=
 =?utf-8?B?eUkwSGZpZFpsOGJRczRzbUYxQ0xkaGNDZUxQcldTZ3BXUEpnODY4bXE4RDk2?=
 =?utf-8?B?cTBKLzE3cjNGTkh5ZEVQVnVHQ2JFVy9odjMzQ2tCR3RocThXSnBERHJzbW9m?=
 =?utf-8?B?UWRiMVdXWlFRQzd1SkVwWnlWaElmeUhmRk5RNDRtOUhDVURnakxmWk4wcmNQ?=
 =?utf-8?B?aVJ6Q0M2YWh2T1RUc2dOMWJISHd6aFR3ajlxL1dBR0U1U3RCSkFOUHduTlFD?=
 =?utf-8?B?YkFpWit3eVlkWVNjUnU3QWpZcVIrZVRCWjBOeUVtR1BnVzV5aVlFOVZqTzdY?=
 =?utf-8?B?R3JUeERUUzNMY3ZWTW15M1FlcHljY3VOZnpjRnJuRUZYQkZSK3pNVkZ0TzhT?=
 =?utf-8?B?V3hYU0hob2VZWlZycWJGUXg5NHJjYmRxZlpyN2hNYkgwWTFYa1B2ZkRwaXNa?=
 =?utf-8?B?aVdBZnV0TEQzeWt3U1c1QlBic1dpdVo1K2wzU0RjTHFVS3N0SmFrSngxYzdL?=
 =?utf-8?B?VUppNXpqZi9uL3E1N1FuM09jemZhQ283WXphY3VuL2orSXhkajlWWEtaNEhw?=
 =?utf-8?B?MXF2TStobFNndEZqaVpYNG9YdzR0QzBwc0Y0R0VOZ21SK1lvSzlRZlg3QXI0?=
 =?utf-8?B?cWhsYkg3QW53MjArM1hUb3hlZlJ2ZFJVSDlxRjE4UjhXZllNS29kUDE4dzNm?=
 =?utf-8?B?c2J1NDRMcm8xNHhjam5xeXE1Q1hySm9wU2FHV3FyTjlNN0tVdTFsY1h6TXln?=
 =?utf-8?B?Y2dwUDFQaDAwYnRXSFdFUnNxM2JySXZjdkFaYWhwNEM2dmpFa2JUSmM5N0lE?=
 =?utf-8?B?ODFGb3owd3U2bnh5ZGxEWEQyWnhoNmxaTk1rRGFoa3V2dHU4NGluem05c2tL?=
 =?utf-8?B?bWpvbWRrQ01qMzZBREdSak5wWjFlNDRRczJBc0lnUGdZT3FpOG12OFBBaXlX?=
 =?utf-8?B?MlpHTW1NeWt4OU52TTlUY1BsMGMyYjhPQnJrTm1yY2ZBZ1M3Mk1UdmhudmtB?=
 =?utf-8?Q?hIIfl7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmMrdlJGQjFqcjk0SzRESE5lUmcwTHZONWZSSFdLTCtCWVh4eGZ0ZjFuMncv?=
 =?utf-8?B?dTBGZXF6WkV3a1FwR2RiRlZGYnRDMWlNeFFhb3BCQTIxVXdJN1pVaHZuRlM1?=
 =?utf-8?B?UjBRRU5MaFJYU0dWdU1Gc3hQVDNld1ZIWEtYS1V3TUNoejExMVdQWFRvOHFz?=
 =?utf-8?B?UGxmK0ZwLzJCVnU0dXdaUzl1M3hzeW9WdUM3bkNia1dTYlRGa3d2ZjJMeXg3?=
 =?utf-8?B?cjlyZ2o4aE5ScUNveXdyV2RLclNCeHZwNU13STJ3YjFyTlRiamdSQXQrRFFE?=
 =?utf-8?B?KzFLTk0ydU9jbzd3dGM1RlZLdmFRaE9rZ1NhekorRFVGcXZaM0U3T3VyaWlh?=
 =?utf-8?B?UGRsSng3bXUxQVd2bm9KcmFaanVqMndINTB1ekQ2WkhXOW05SW9ybEg0K3lm?=
 =?utf-8?B?NmM1TS81QytEdnF3Z1JOOVBDMXIyVWtXeS85OGJvYTFZNkF2RTVHWE5xejc2?=
 =?utf-8?B?MCtHcTJ0UlZKWi9jZ3BGK0U4V1R1SHpzVzZSRGI2WkVGOEVvNHZ4UlpVS0N1?=
 =?utf-8?B?YjFMRjQ0TGtpaHlhWkhKdVVsRjdZeUp4UXlnNUhQek54NDFZNC96UGxSU3h1?=
 =?utf-8?B?dGYvdExhSkRrQmRqOTlDd1BPUVRzd0o2eXRRaGxxQ1Y4WEYrZURxNjNBNDB3?=
 =?utf-8?B?bkJPcDJJczgyektRNnU2RHJkakkxVHJVT0NVTUtmQXRmOU1OekcxMWJNRGl5?=
 =?utf-8?B?MWU5MjVXaG5YNC80YSs4MytDVE9TaHJZeWU3N0s2RVdYRjNlQXZKRE5EK0xM?=
 =?utf-8?B?cnlzRmZFV0I3NVFPbWUrb3M2MjZDVXRkVTR2bkhKSjROWURlSU95Y1hxY1dL?=
 =?utf-8?B?aUFmVlhNQjFqcXcvRWtMU1Z6cUtIRkVMSGU3Uk1xZE94SWsxelRjaUlqMWZR?=
 =?utf-8?B?VitTQ2hTVi9wenJVUmN4MXBIS3B5eGZGWWQwQlMzVTRLM3laRUhtdmFDSzJh?=
 =?utf-8?B?bzdIWm9XNERQcm10SWh1eEFzL05ZRWg2MlFQZTNaNHVoeGxmTUJwQ253SU1s?=
 =?utf-8?B?RFJMVXJtWWgxODEyZVl0UjN4bW1JSVpnSE5OTm5BZjBuQTgrNEJvTEdoWWxI?=
 =?utf-8?B?ZzVVaEZlSmdYOUN0RzFNSEZublBTWm5nMUpiY091bUhQQzhudWZnalhiTlQ3?=
 =?utf-8?B?TEI5Rk1lcXlpMVN2c0xWSTk1dkhtdDBhZCtIa2ZLOXlKcDV1bmV4REdPOEFX?=
 =?utf-8?B?Z2ZqMnVTL29vblYzZHpiRzVIZzlJWisybkpISG9UbkhTbmtROXRIK04zb0lX?=
 =?utf-8?B?dmNrTGNmZDB5dWxDeTVzME5OMzUreXJXZ0Vmcy9JMWlXcFFKbnA2Yi8xcDRl?=
 =?utf-8?B?N2w0amxVM3lZWERTQVluWWczRXlOY3prcnFONysyWnNSbWg0bURTcWFmb0dv?=
 =?utf-8?B?aEJhNnpCNzFENFVCeGkxL1VNRzhNY1haZVR0a0s4Q2hlZEx6S0Qwa050ZFVZ?=
 =?utf-8?B?aVhXbXpQV0JpSVJRRXA2TmtVcU5xc213Q05MR0cxYnBWSlg4VVVOWCt6b0FQ?=
 =?utf-8?B?Ui9CQmJOaEIwNVV4R1VjaStlT2k1Ukdub0x3Uk5GM1JkSEcrTE03cDBwZDNI?=
 =?utf-8?B?L0NZcHp1NUNEbnN3Vmlza2hNSXZUbUN5bGNsVXRid2V5Q0VTVzlKcStSNmFV?=
 =?utf-8?B?RENnYUlWUFhQOFMvUlgvQWNzdmswNjJEc2JHYlA2a2JGeithUHlsbTc4R0N5?=
 =?utf-8?B?eXJBT3FoN3ZncGhFYW5ydEtVdmdvbFNZcm5FUUIvUnhPU1A4YnZ6ckFPNCtO?=
 =?utf-8?B?R0M5NVlRRStuYXhqYzFOSmhLamI2YjZac0N1NWo5cVlkK2srdkVJZ1BqOEIz?=
 =?utf-8?B?MUt3YWxPRGQ2Q1QvbDNrallJVVkxV2gwU0puWHUya2h4ZzBzTXdkSjM2ZElY?=
 =?utf-8?B?K3FKbUhrNFdQRk03cFM3WnRuWjR6YkMwcWF1OE4zREpGOU9Bb2ovaDNyWVRa?=
 =?utf-8?B?UjlmQmlSQUJ4Z3R2R0hsM2NqYUl6b29uckcrV3F2UUhwL0c1SlE3NkFxOEpk?=
 =?utf-8?B?aXZ0bkJaSHc3RloxWG5PajU0VFlrNjlyeldHdlQrZ1daVnY0Wk02QnJqcFQ0?=
 =?utf-8?B?cEU2dFM3ME50NW0yUytLRzNjK3BTZ0xuaVZ5WDFnNnQ2VUFmenFGak9jaDZ0?=
 =?utf-8?B?ZXJLUzVpRUhBWEtXZVhEbVh1bUFoUC9RU3NXRElRbWE2QUVqYkZuMEVPZ3Fu?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3597201-bb11-4559-023a-08de1c7d7ca0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:10:42.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lUQYGfLbDzS1ijBMKO6ZQSfQXXTcnaJbwaQLZylRDY8SFU6M5jTwM/tTxx1sxplrU5BcDScelaad3YyzYXPislkS99gFzulFAN8bp7ybzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

Hi,

This is a fourth round of patches introducing support for Xe SR-IOV VF
migration.
Thanks for all the review feedback.
The most impactful functional change in this revision is a small fix in
GGTT save/restore code, which fixes a regression introduced in v2.
Additionally, error handling is improved on data read/data write path.
On VFIO side, we're now using PCI_DRIVER_OVERRIDE_DEVICE_VFIO as a match
(not using PCI VGA class).
From lines-of-code changed perspective, renaming xe_sriov_migration_data
to xe_sriov_packet caused a bit of churn across multiple patches.

Full changelog can be found below.

Cover letter from the previous revision:

Xe is a DRM driver supporting Intel GPUs and for SR-IOV capable
devices, it enables the creation of SR-IOV VFs.
This series adds xe-vfio-pci driver variant that interacts with Xe
driver to control VF device state and read/write migration data,
allowing it to extend regular vfio-pci functionality with VFIO migration
capability.
The driver doesn't expose PRE_COPY support, as currently supported
hardware lacks the capability to track dirty pages.

While Xe driver already had the capability to manage VF device state,
management of migration data was something that needed to be implemented
and constitutes the majority of the series.

The migration data is processed asynchronously by the Xe driver, and is
organized into multiple migration data packet types representing the
hardware interfaces of the device (GGTT / MMIO / GuC FW / VRAM).
Since the VRAM can potentially be larger than available system memory,
it is copied in multiple chunks. The metadata needed for migration
compatibility decisions is added as part of descriptor packet (currently
limited to PCI device ID / revision).
Xe driver abstracts away the internals of packet processing and takes
care of tracking the position within individual packets.
The API exported to VFIO is similar to API exported by VFIO to
userspace, a simple .read()/.write().

Note that some of the VF resources are not virtualized (e.g. GGTT - the
GFX device global virtual address space). This means that the VF driver
needs to be aware that migration has occurred in order to properly
relocate (patching or reemiting data that contains references to GGTT
addresses) before resuming operation.
The code to handle that is already present in upstream Linux and in
production VF drivers for other OSes.

Links to previous revisions for reference.
v1:
https://lore.kernel.org/lkml/20251011193847.1836454-1-michal.winiarski@intel.com/
v2:
https://lore.kernel.org/lkml/20251021224133.577765-1-michal.winiarski@intel.com/
v3:
https://lore.kernel.org/lkml/20251030203135.337696-1-michal.winiarski@intel.com/

v3 -> v4:
* Add error handling on data_read / data_write path
* Don't match on PCI class, use PCI_DRIVER_OVERRIDE_DEVICE_VFIO helper
  instead (Lucas De Marchi)
* Use proper node VMA size inside GGTT save / restore helper (Michał)
* Improve data tracking set_bit / clear_bit wrapper names (Michał)
* Improve packet dump helper (Michał)
* Use drmm for migration mutex init (Michał)
* Rename the pf_device access helper (Michał)
* Use non-interruptible sleep in VRAM copy (Matt)
* Rename xe_sriov_migration_data to xe_sriov_packet along with relevant
  functions (Michał)
* Rename per-vf device-level data to xe_sriov_migration_state (Michał)
* Use struct name that matches component name instead of anonymous
  struct (Michał)
* Don't add XE_GT_SRIOV_STATE_MAX to state enum, use a helper macro
  instead (Michał)
* Kernel-doc fixes (Michał)

v2 -> v3:
* Bind xe-vfio-pci to specific devices instead of using vendor and
  class (Christoph Hellwig / Jason Gunthorpe)
* Don't refer to the driver as "vendor specific" (Christoph)
* Use pci_iov_get_pf_drvdata and change the interface to take xe_device
  (Jason)
* Update the RUNNING_P2P comment (Jason / Kevin Tian)
* Add state_mutex to protect device state transitions (Kevin)
* Implement .error_detected (Kevin)
* Drop redundant comments (Kevin)
* Explain 1-based indexing and wait_flr_done (Kevin)
* Add a missing get_file() (Kevin)
* Drop redundant state transitions when p2p is supported (Kevin)
* Update run/stop naming to match other drivers (Kevin)
* Fix error state handling (Kevin)
* Fix SAVE state diagram rendering (Michał Wajdeczko)
* Control state machine flipping PROCESS / WAIT logic (Michał Wajdeczko)
* Drop GUC / GGTT / MMIO / VRAM from SAVE control state machine
* Use devm instead of drmm for migration-related allocations (Michał)
* Use GGTT node for size calculations (Michał)
* Use mutex guards consistently (Michał)
* Fix build break on 32-bit (lkp)
* Kernel-doc updates (Michał)
* And other, more minor changes

v1 -> v2:
* Do not require debug flag to support migration on PTL/BMG
* Fix PCI class match on VFIO side
* Reorganized PF Control state machine (Michał Wajdeczko)
* Kerneldoc tidying (Michał Wajdeczko)
* Return NULL instead of -ENODATA for produce/consume (Michał Wajdeczko)
* guc_buf s/sync/sync_read (Matt Brost)
* Squash patch 03 (Matt Brost)
* Assert on PM ref instead of taking it (Matt Brost)
* Remove CCS completely (Matt Brost)
* Return ptr on guc_buf_sync_read (Michał Wajdeczko)
* Define default guc_buf size (Michał Wajdeczko)
* Drop CONFIG_PCI_IOV=n stubs where not needed (Michał Wajdeczko)
* And other, more minor changes

Lukasz Laguna (2):
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/migrate: Add function to copy of VRAM data in chunks

Michał Winiarski (26):
  drm/xe/pf: Remove GuC version check for migration support
  drm/xe: Move migration support to device-level struct
  drm/xe/pf: Convert control state to bitmap
  drm/xe/pf: Add save/restore control state stubs and connect to debugfs
  drm/xe/pf: Add data structures and handlers for migration rings
  drm/xe/pf: Add helpers for migration data packet allocation / free
  drm/xe/pf: Add support for encap/decap of bitstream to/from packet
  drm/xe/pf: Add minimalistic migration descriptor
  drm/xe/pf: Expose VF migration data size over debugfs
  drm/xe: Add sa/guc_buf_cache sync interface
  drm/xe: Allow the caller to pass guc_buf_cache size
  drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF
    migration
  drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
  drm/xe/pf: Don't save GuC VF migration data on pause
  drm/xe/pf: Switch VF migration GuC save/restore to struct migration
    data
  drm/xe/pf: Handle GuC migration data as part of PF control
  drm/xe/pf: Add helpers for VF GGTT migration data handling
  drm/xe/pf: Handle GGTT migration data as part of PF control
  drm/xe/pf: Handle MMIO migration data as part of PF control
  drm/xe/pf: Handle VRAM migration data as part of PF control
  drm/xe/pf: Add wait helper for VF FLR
  drm/xe/pf: Enable SR-IOV VF migration
  drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
  drm/xe/pf: Export helpers for VFIO
  drm/intel/bmg: Allow device ID usage with single-argument macros
  vfio/xe: Add device specific vfio_pci driver variant for Intel
    graphics

 MAINTAINERS                                   |    7 +
 drivers/gpu/drm/xe/Makefile                   |    4 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  104 ++
 drivers/gpu/drm/xe/xe_ggtt.h                  |    4 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |    2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   78 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  648 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   10 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   47 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 1001 +++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   48 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    5 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   13 +-
 drivers/gpu/drm/xe/xe_guc_buf.c               |   57 +-
 drivers/gpu/drm/xe/xe_guc_buf.h               |    2 +
 drivers/gpu/drm/xe/xe_migrate.c               |  128 ++-
 drivers/gpu/drm/xe/xe_migrate.h               |    8 +
 drivers/gpu/drm/xe/xe_pci.c                   |   17 +
 drivers/gpu/drm/xe/xe_pci.h                   |    3 +
 drivers/gpu/drm/xe/xe_sa.c                    |   21 +
 drivers/gpu/drm/xe/xe_sa.h                    |    1 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          |  510 +++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |   38 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |    5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  128 +++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |    5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  101 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  343 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   29 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   75 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |    6 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            |  247 ++++
 drivers/vfio/pci/Kconfig                      |    2 +
 drivers/vfio/pci/Makefile                     |    2 +
 drivers/vfio/pci/xe/Kconfig                   |   12 +
 drivers/vfio/pci/xe/Makefile                  |    3 +
 drivers/vfio/pci/xe/main.c                    |  556 +++++++++
 include/drm/intel/pciids.h                    |    2 +-
 include/drm/intel/xe_sriov_vfio.h             |   30 +
 42 files changed, 4048 insertions(+), 328 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.51.2

