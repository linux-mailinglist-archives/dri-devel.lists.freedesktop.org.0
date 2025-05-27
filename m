Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB953AC4E3E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826AC10E44F;
	Tue, 27 May 2025 12:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnDuaYuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665ED10E44F;
 Tue, 27 May 2025 12:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347698; x=1779883698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1l23ILsRYnVP25nDh0vb2b5SBu/0uZ/+PEQRiY7/OC8=;
 b=HnDuaYuUth+w0gssjKfYuubGfOuaaRbYwPPpe3k936BRL7bNBRKyaC2h
 G6YG9fgT0Iz++lJoM8KdNh4IoJDx6LjKxRjriF2AEX2eXd3nQfM2+Jgza
 /9F9MPsu059hM/47P3oKe3otbgpClLRYDJx4fU94RNMB13umXfLCgahq5
 bcMv7TBUmQbTcB3QxizVsztvt9GOXf8fZy9WE7qKbtUknVF4REQckKlNH
 Mqhe1mQUbJnl6Sml0zMpoYwBB/a0UasweslIPHsPQBXJE0oz5482SnZnd
 RdctAAuQKKO26ADv5+2WlgEdIt+YUi2wP3kBoQHSHeUUPnrxW/o2QmHda A==;
X-CSE-ConnectionGUID: SFa9b88pTzatViz3myOAUA==
X-CSE-MsgGUID: /Re1QYdxSPmHm5kKhb0e7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60965444"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60965444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:17 -0700
X-CSE-ConnectionGUID: JRr3ScdVSYi7nUxhpW9j6A==
X-CSE-MsgGUID: hB5pFPtzR7m+WsPvox2rcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147660617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:08:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:08:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPu8gdGiBXweikbHf/zdZotiIWt2ggyJkXtN/2hURBXwUrhGcyAnwJkdXfMpO0JPkHgZWiPeWTPNHxRF4RDv+BDCt9HyoVLtBiklRp8vwlKm4/LtWlr1wVs3C9GoTIvoJE7St8WmWxOqW+LJlKo1AdxEBO+2gf8JvTlS37co7PaMYB7A6UgqAicOf3uaNCyfMIQ1K1cOsGBKGPpGum9XWfhKZvmHEqfuvoYKyk5iesPTlR7nsbN94XIroWCgVdxmhxlZDLhgWKXLsxxRPJZcZsQ+VtDhxQWZpDroD53vWLyTvcAcShAcNEaN7UgZZhx0t4ZlLB4+fm6NkrsOwySFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1G8e/l9sknPqMGEiWkD4k1UpZoC6TfGOb+xUvL89T0=;
 b=Mzwxq0e4NJ+mNZbryLIDRPPeTblWxrUlLn0ulTSW8WS8x7XNT+2Q58LYMGuqdHdFOGAfhkXyDh95HowWgd5msxIdFCHUW91h9gP513GeGnIBxak/DdL+ivDOK+aGMuuO3B+FJEn8bvSYCHBtHxk1LK5wNNAU3eQHiPPG121m1Fg8Xw2InOTmQ53FFmO5yPPiGaTwNIn652aXDv+wpTrUy1+YQXm4VS6PKibJBNuR14EX6oU4n7Jx025Qlz2G7zoB1s/wyc1EX2z9qahTUWjQDkz5z33WzOH2tKSxyKPV5OMYRU4a4BUr194XFsvTy9Jx8bSf1+W7CD78jrsGMCwvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 12:07:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:07:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v9 2/6] PCI: Add a helper to convert between VF BAR number and
 IOV resource
Date: Tue, 27 May 2025 14:06:33 +0200
Message-ID: <20250527120637.665506-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
References: <20250527120637.665506-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 750fecb5-88d9-4e50-66b3-08dd9d171c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG9mOWg4enlWczhxRlJVeXh3RTFIZVBtbGs5Vng5VG83Z3hLUDErRjVPMGpO?=
 =?utf-8?B?Vkp1VFJucmNvcUd3MjdvU1IxK1pwTHh0TGppT3dPL1JOWDlFT0p0VW5lVG5V?=
 =?utf-8?B?M0dWWWZ1amlPMzZvd1dXQU5QK2daMFp6eXFPa3RuUHVRcENNSkJYYjlvbjZl?=
 =?utf-8?B?M2NHQkJ0TkVvN1hCNENmMTEzTFdSZGtORWZxVU9JNTBaRGs4OTk4TmlOK21I?=
 =?utf-8?B?L0hqQnBCNWhTRWRrMkRqUzFlcHlFcnEvSmJ0bjdUeWE4UzV3ak9nb1RaV2JT?=
 =?utf-8?B?WUEzYXZJNVFha0RPQWxmSTBXbjBDaGR6NU9QR28vR1N0eXRtSVRHeCs1cHNy?=
 =?utf-8?B?U2pnVnZzbWhaemNSdWNUbGxaTS83b1lvSnhMWFJHVjNBTHdJQnVQcHZmdzQ3?=
 =?utf-8?B?dExHT3hqT3Q2ZGxoNGRKT2lDcGFHbGNKbmthd3pnMko5dEgyVGg5bnZFRHhC?=
 =?utf-8?B?aEpUUXBVeUtiMnM5RE9kNEVvUkxmNWtLQzEwVlRlL0x2R3Arczd4Rm8yVjBL?=
 =?utf-8?B?NFBGRkpMRk1TOXIvNmJxWk1QeXRHd0tHZDJvNnZmb1lvTWh2a3dDS2NPV2Jr?=
 =?utf-8?B?MFlOMHlwbE5ya0ZSZi9QbW1EYks1ZHRGREgwM2x4NkpGWEgxTW9WbkYyejk4?=
 =?utf-8?B?SXUycWxkK01tUmNENzdiTVpXNkF4TXhBVjloUUwwSzZTYjNsdFR3ME5xOVVS?=
 =?utf-8?B?aEhPVzhBZmFhcmtneUxUeXZucU5EMXZDbDIybjVFK3JtVERpTXFOVWV0YnNj?=
 =?utf-8?B?WlY3UEdjYWs1eW5pdnpGUUM0bmRha2tPcXA4YXBKMk9BM0dYckt6enJsc1dt?=
 =?utf-8?B?QXByNlYyRVFpVHZFYzBlL0h1WENBVUNCSnFwL1BPdDRydzFMa1VScUEwaFZJ?=
 =?utf-8?B?VEdBemRyd0VLOWNhNzZudlUyMUdTWXI2czZWelhUOWgxcUpRdlBNL0JmdnRM?=
 =?utf-8?B?N080TVU3cFR3dUdmKy9OanREMEU0S0pudFBVTnJXNUpLN2cvY3l4bEpVTE9V?=
 =?utf-8?B?VUtsQTVtbXVjdWVCOWhuNGZJWEhjenRSQTdiUkZ0RTg4cGZvam1SUmRCV01K?=
 =?utf-8?B?RDA0ZkMzd0tJMW5UeVJYY3pUNTdlRys5d1NRM2taTXBhUnphYnpyQ2h1SzQx?=
 =?utf-8?B?U0k5eTdlRFkyTFdiSXIvNVMrc21aMXQ5Y1RER25HNllUOTBBZ1FweXFnaUla?=
 =?utf-8?B?a2dUeS95M1I0ajh2bE1xZW45aWo3MFBBU0ZZSlJuSGVxOGhHVUYxTmROdTRT?=
 =?utf-8?B?MnZ2dWIvRmxsakgzckQ2NUJ2Vjd0YTUyVDB0WTR6eFB0Qm5XU0hlKzVTSDZH?=
 =?utf-8?B?cHBlRWhXV3V0dmNoSTRKRkUycDIzZldhd29CZ0JrdCthSEN3TGdkNHJRSWly?=
 =?utf-8?B?QklhVDFlaERwRDVmc21SOGkrUU8zK0VZbi83bzhmRHB0bVYraTBsSEgwVitk?=
 =?utf-8?B?OGhUU3Q5WFhDRFlzTkJOdFJscVFZaGZMeHdQVTNoaUM5WVJtTzMrSDV6TmZH?=
 =?utf-8?B?WkxPTzk4S2hXRVNnMkxhSUVWaWVOTnNqV0NaRzVod3FXWjhGTFB6REFDazhw?=
 =?utf-8?B?ZDljMDA4eC9YUVlWRW9qL2FQT0k4L0FSWStSV2RmUm9LZmZWVnA5bytMdXYw?=
 =?utf-8?B?VERLV3ZxR0xmakR0dFNaTmNKVjhlc2xVN3A2cXZUNGwwRDhyM2ErTkxuaHhM?=
 =?utf-8?B?UGM0SlUvb0ZRV1FPajNEb2JzRE84eHZHOW9rY2ExV2l5dFAxM2l1M2gyM3F2?=
 =?utf-8?B?VWMvRGJTZm0ySDljalc3ZFNHeXNHODhjT3ZzbTRkbkJKQnRPa3lkUDVZNlhZ?=
 =?utf-8?B?OFlVYjMzUkN3M2lMQ29iWVNOWHI3ckQyQ2x0aUN4bEUraDZvRUs4b3FCVndh?=
 =?utf-8?B?TmI5WXlNM3FnSU8rZ1RUMHY3d3ZOR2UzaXF4dm1CWUZGTXIydkFYbUdIeXEw?=
 =?utf-8?Q?I9nspNlL5ZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlkySElJSmVDTXVBV2oxSFpGVC9MRUZhSTBqbTBNTTNUNFhuVU5wMko2ekxD?=
 =?utf-8?B?NGw4S0I0Y2hDOW9iUlBsZXVudlF0MEh5M1hpeFRJWUQyUUF5eVcrOHRXTVY5?=
 =?utf-8?B?SFFnRm9IRjNRdldJUE1wakZvdmloOGdlUU9Ic1BGbUhQaDh5cW9ISXp6WWhi?=
 =?utf-8?B?bUFheVhyUEcxc0ZKNEtYbkw3cW5OUHhTQ2c1ZFhzU2NUWTdKZUdTNDVjcEVO?=
 =?utf-8?B?WVZwSzdwdi90N09PNnhXSmtmK2EremlxVHVNa3JNMGVUMWdLZU93by94ZUxF?=
 =?utf-8?B?NXdyaFd0aWd2ZTVxKzNzRFcwOXl3ems1LyszcGJtc2FRcGpxZGR3eWpxNUhH?=
 =?utf-8?B?c2h3ZXpRRC9MRDBRd01yWkNRVG9hRjhCdUNpSEJKSjkyOTNXeXZOdWMzK21y?=
 =?utf-8?B?MnY4NEV2T2dtcTBhRVFkeGQ0aVBOaXE4RUFTckdBcUhqeEdHVXFrVHBEdzE0?=
 =?utf-8?B?OFU1SHY5cm1HeU9TTlNJbXBFYitCcjM4b3dkVHQ2c0E2cEdSUzliekNLMXE1?=
 =?utf-8?B?R2ZxV0pUN0lyV0ZIWkZnbnVyaUxvRkNKQi81Z3dWNjlvMEpCdzlJVEE1TGQx?=
 =?utf-8?B?enliTDRpMWExamVzeWxJYjEyY3ZqakxxRVoxc3NlSHdJeTlmNWlzQjViWmFE?=
 =?utf-8?B?OHZycHI3WklHbGk3OTVnRU9VWFBnTGljRU90MXlGdkIweWxjV3Z1RXJZM1p3?=
 =?utf-8?B?Ui9DcUQyNjg5cFRzRkIzb0wwdGJLTzc5Nm56RnhIeFRoWmY2VXhjQ29IcWlo?=
 =?utf-8?B?T0lsc3kyQzNqMVAzL0E4L29YVDM0a3ZYbVpIeTMwa0N6bXFkakV4NjhQWUtq?=
 =?utf-8?B?MTU3cHZ4aFNESS9PTFk1dFFDNXo0anp5aGwrS0JCdWxvMDF5YnNPWW1xd3p0?=
 =?utf-8?B?V3d3aXRzWTNHNVY4Q245YmNxRWJTUFJ6TFRKdUdiaWhyNkdXQTV0SVFHVk9x?=
 =?utf-8?B?ZTFXSlhkZ0wyOElvemIwL214WHRsY1djSjU0cDFYeG1PcFo4SE1SOXc0L0FC?=
 =?utf-8?B?aHZ3ZHVHZHVUbDhDVHVmeWlzQStGYzdIa0pPVFo4Y2QwSjhYU2lwQm9Tdkhx?=
 =?utf-8?B?S1VFeVYvT2RYNnVOVStoclpld3NnWEVmMi9VcC8wRVZ5VnFKTit5b1FTUVFy?=
 =?utf-8?B?UzRHYjJMQ2NQZ2s1eGYyamM0UXU3MUZtWWM1QjBrd1QwZVlTZG1acDR0cWYz?=
 =?utf-8?B?MGV1M0xKc015N0lyV0xteWp5ZldhOHBtcUJQMlhRU3padkFveUFvcXZLS3FG?=
 =?utf-8?B?dmcxYTdLcS91VTN1dXhxR0FFK0h0amZ4QWRQQUd0UHZ0YkMwZnhNK1dZVGMv?=
 =?utf-8?B?RE1RRUpwOVI3MUxoL1NmZE1pcWNabzZLR1pnU2VVTlB6SFdYaWxheitaS2NU?=
 =?utf-8?B?bk1IQWkzN2p1WFgreW95YjB3VlpHcUs3OHo2YXNicjBYM0YwYjhsMTBnL0ZR?=
 =?utf-8?B?aXNmamtYRUVmRVlxZGI0NXFJNm1FczNZUnpyVGlya3dqWWR1Skg2L1AzYnlm?=
 =?utf-8?B?cDlqRkRnZ09mclg5MTc1VnN2Qk91ZWExNjdPOTE1ajU5N0FoOW1hUzVHaFpM?=
 =?utf-8?B?QlFTTHNjbnNXOU1TaTFOSjhzL3Zxa1BVUGRvQVN3ZzB1ZDE1TVhuaGtxYy9w?=
 =?utf-8?B?M1JBYUpnYUJrU3NFbGhDQk9mdHd3WWZWRlpIZUVPMXkxNWhCQlM1cmJscWdZ?=
 =?utf-8?B?YWVzTHdFMktMNDd3ZFowOWRrQWxJNFp0MXlkTnpDNFBST0hSNjlsREY4U0d4?=
 =?utf-8?B?cjA2RGcrOTM0M0pJSWowYzdBSlNOWGw0R09pUFlxcWozaCtWK1puRmpER0hI?=
 =?utf-8?B?a1dza09QN3hHSEVFZEpaSC84dGpTVlpybjhiRTVhV3lid0dOQVFKekl1N3Bk?=
 =?utf-8?B?QXRGYkVSOGh1RzJEZ0paeW53aVNnem1HM2U2Sk5VRFNuOEx3TFZKWFlYTlNH?=
 =?utf-8?B?a2NTdC81ZVVuK1hmRE1Gc1REK2xvY0xYTHZpcEFmYVhWZEV4c0g5TTRRMDBs?=
 =?utf-8?B?U29YbEpMczYveWRtZmxsT1MxSjhianBRY2hQcnIvb2UxbmFTcE41Y3Btajhs?=
 =?utf-8?B?cSsxRjBZbWR4bGJKa2hDMGVrOEY1VlNiajJ4dmFYNzZUVkVTMmEvSjhURW0r?=
 =?utf-8?B?TXdEaE1wanMwMlM4SkJzckRtQVhwREtmWElEaFlrYy9IK1lXVGplck5zQzFD?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 750fecb5-88d9-4e50-66b3-08dd9d171c75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:07:54.4784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4gJklYniehz4Ta83yoN1g08VnkqG8CyyQsN58oYzHELE1IcGTBY+WYnK5LsiF3zl+ImmXsUng+j0GvPMnMVqjgE4exmjK9BNoW+3OSAHyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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

There are multiple places where conversions between IOV resources and
corresponding VF BAR numbers are done.

Extract the logic to pci_resource_num_from_vf_bar() and
pci_resource_num_to_vf_bar() helpers.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 26 ++++++++++++++++----------
 drivers/pci/pci.h       | 18 ++++++++++++++++++
 drivers/pci/setup-bus.c |  3 ++-
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 10ccef8afe145..bdac078045525 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	if (!dev->is_physfn)
 		return 0;
 
-	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
+	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
@@ -342,12 +342,14 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	virtfn->multifunction = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
 		if (!res->parent)
 			continue;
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		size = pci_iov_resource_size(dev, idx);
 		resource_set_range(&virtfn->resource[i],
 				   res->start + size * id, size);
 		rc = request_resource(res, &virtfn->resource[i]);
@@ -644,8 +646,10 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		bars |= (1 << (i + PCI_IOV_RESOURCES));
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		bars |= (1 << idx);
+		res = &dev->resource[idx];
 		if (res->parent)
 			nres++;
 	}
@@ -811,8 +815,10 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
+		res_name = pci_resource_name(dev, idx);
 
 		/*
 		 * If it is already FIXED, don't change it, something
@@ -871,7 +877,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		res->flags = 0;
 	}
 
@@ -933,7 +939,7 @@ static void sriov_restore_state(struct pci_dev *dev)
 	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+		pci_update_resource(dev, pci_resource_num_from_vf_bar(i));
 
 	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
 	pci_iov_set_numvfs(dev, iov->num_VFs);
@@ -999,7 +1005,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
 	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
 	struct resource *res = pci_resource_n(dev, resno);
-	int vf_bar = resno - PCI_IOV_RESOURCES;
+	int vf_bar = pci_resource_num_to_vf_bar(resno);
 	struct pci_bus_region region;
 	u16 cmd;
 	u32 new;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 5eb9a7558998b..9218f9037546e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -722,6 +722,14 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	return resno + PCI_IOV_RESOURCES;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	return resno - PCI_IOV_RESOURCES;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -750,6 +758,16 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_TPH
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index cc37cdb5e3522..a7d85b0f3a6cb 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1884,7 +1884,8 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
 	bool *unassigned = data;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+		struct resource *r = &dev->resource[idx];
 		struct pci_bus_region region;
 
 		/* Not assigned or rejected by kernel? */
-- 
2.49.0

