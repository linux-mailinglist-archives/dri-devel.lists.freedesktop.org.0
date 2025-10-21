Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F83BF913B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208310E650;
	Tue, 21 Oct 2025 22:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TueIifjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80A310E656;
 Tue, 21 Oct 2025 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086562; x=1792622562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uhEw0dbce/QVAx2XX5Q0DDMhcUfSct2wYqL3OIDA3KA=;
 b=TueIifjyoejBYJy5tu71S8ojG6j78Sv/UsOp8JXGJvJ3+vJGXLS5OPEn
 8NW+2/+0GYaamdivSvKP+20u0l1fSAa9KmULFpeO7XmCikdvYFLchRuFL
 5YkPPtP/6GoZM8jXalI0WGq8diz33t9rfF2/AvmJQW3DE2+huHUEXtRAg
 dTqsMUj6ZcQr/luP420WitwOKjwYyNANcoyeDwAPc27bXulpZ35hLW88k
 ExOpxeWKK4+Ex+NmmYF5iOCvFS8CndxG1WB/eqjiK9a8ASVI1hH4ZBMOD
 jQ/NicLdtf5JZfOAJsp6Bn+mTaOEW9yDyauQCtXJIzkYZ/MSXxwqMlYdQ Q==;
X-CSE-ConnectionGUID: pWKtlM/IQAuutjrphIf0xw==
X-CSE-MsgGUID: qg6wf8j9SjCVWRpBmr0uRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74567077"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="74567077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:42 -0700
X-CSE-ConnectionGUID: W3UoNGbfTcCvbG8QogdwCw==
X-CSE-MsgGUID: tttsF6N9SWCr9yLxaM170Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183644326"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtobgwqL+rL49EDTMhrz80VgdJ8qmFbxkAAwIe7tAwc+JmRAyJlW8l6TBfU6yi0adD+tdlBGSJzqSBxeQ/Ate5dw6oxDKPZU7UUNWXFzhzvbCGCHSQUIIuQUvwA0P3EBOW/+O5DNeN4OdLpyAt+s4mN+gL6A4now20i5L7oZgZpdZtDJVQkFkNgRzN7f4fPJhzv3QL3O/L4wMv5UaLNJgp2TZUz6MaZdt/BxrGk3UZnh4rEmLAFAbAhdG076VsIgEw/9hMC8hcc59Bsrg/Dwrw3fq65KZVllBmZkWlC0hzmJ4CFffzfSSD6a5DwGtNZw5M45ayLA6U7x0sMBMBaGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfZiJeZ8R+AASyUEHf/iKFyj3c5OTrZqt0kbfic6cK4=;
 b=A5bY8Jrv9r9o63sDyVt5rNMYmmTd/fJ1OwOFBfIbIqytMbco3OfCfH7Azfx5BZWMQ3eYz9MxVWxIXPjTPMMrDobOm4bEX4QGPHkMF9a9BTzvsW+mUAOJkMiYr1MhEZVK19yUbqFnvA1sZQa73IulLQdjM33/xX8zzZfk+TyJqCs+I8LHvUzhykUZ0smBu+eYawDRfozTVBvk3m2MS0iete0QvzZB5ex2knOpe1eaA1L0uEbi1NIvr3dD7fJavjmhlR2bxCRZxWGjdmnA9ZKiaEzlzjiZy+J70gumv622QlWlvFqdXIeG17jUXqfDi19IWOL1osGnRSL7+XEMo5OHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:39 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 06/26] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
Date: Wed, 22 Oct 2025 00:41:13 +0200
Message-ID: <20251021224133.577765-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0248.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a36bd38-80e6-4cd0-b50a-08de10f32335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnlMaW5UWnNJNzhPYVduTzhsN1RLWU8vSTJHcEE1cXpQNEdFemZqYVhnT3g3?=
 =?utf-8?B?Y1JtSmFyQWNrWGozZFhZQkJYQ1Q4UUxNZFgyRklCd2dDaUZBM29nVnU3T043?=
 =?utf-8?B?QlNHdHFuVGlyWERrZE9pNCtwRFJHQzEvM3FTZ0htS0ZBVFp3V2JKankzLzFx?=
 =?utf-8?B?UTVTNmZra0FhU2k5T09RN2NXY3p2VFZhbzhNZlR6Zjc0NkdUUGhoakFDbkRZ?=
 =?utf-8?B?Vk9pYjFVZWNGMnh4RWluTVdNUGFWNmtIVDRhcGZVbTlhRXdKQndYbE5seHJy?=
 =?utf-8?B?d0tLTG5nSmQyM0JreEVRYzFTbzhGWWpWWlhzamFmendzUWsvSHBobWIralBp?=
 =?utf-8?B?ZUNqMXBzd3h6c3BNT3k2MnorWllqbC80QUdoRDBJdUpLSS9Ma3ZCQTdLV3B1?=
 =?utf-8?B?ektyWk5XVEgxY3BUY3NPRksyNXZMZUE0aVllcTJTR1p0UnJGamtueG43cFI1?=
 =?utf-8?B?SkZNYjNiNTlYSUsrTG1TUDRCdmd4WGFoNXB0Q2pONzVCTXdTdlJUYWJ0UjBh?=
 =?utf-8?B?N3dvd2tvcFZkTkc1VFh4eDZ5Q09uUFZvUjhyNEpjWXRjalFnN0YxYnVHQVRq?=
 =?utf-8?B?S0VmeEhHWUZtb1BKWUlRb3dHRzh5Zy95NlJ3d0JzMEJ5UksvVjY1Z1NZcnJp?=
 =?utf-8?B?ZjNiaUE5T2dsTS8rWmVpbml4U2xiMFVoY2F5bTl4eWdQTmZDQ3VNSWVncCtv?=
 =?utf-8?B?Wm5Ha2xGTW1HN05mdE5sZEt5WjF5TWtEYWk2WUxaRlFOT2ZqcDZINGZZU2hT?=
 =?utf-8?B?WHgvNGhtUGU5d0hiNGUxb0dWU1B5aDA2RzJGd2NaODNnRmxtTllHT0ovVHIy?=
 =?utf-8?B?S203TmZBdVZ5bnR1eHhHbXVXbG5BZWova3BrRE0yRUNHdVZsRVNKTG5Ea2lm?=
 =?utf-8?B?Z2RWVnhkZDJsd2lGOHFmRGlzTkNCQnM4a2VkbXZiZE1tWDQ5cU55VlNzQWw2?=
 =?utf-8?B?Z0hWN0ZnazFyL1dVZDMwVzcxYmVLaTNBVFhKWkRiWFR2RE1zVjVaRUdFaFlB?=
 =?utf-8?B?TVZRMUI3Q01zYTRpLzRrcUlKTTBjTEYrZnI4NWFlZVdJSHlGUFRMY0tuZUx2?=
 =?utf-8?B?VmJwNjhpeGtDdVZ6S2NycDU0WDZzS1U5a0QrVjlYZmZBZ2ZmTWJGSHl6MDlB?=
 =?utf-8?B?d0lTMmcrblJoWjNERjlsTG9jOWgwNENhSERSdyt6SGljbW9tc2NodmxseVBO?=
 =?utf-8?B?Ym50YkUza25qcnM2UXhqYkZVSmxabWd6M2tUMHFWcElsUE5jSnMreEJ1TXRi?=
 =?utf-8?B?SGtpaVBHbXFrVHVMM2NySVJoNStUdW9KQTFvSllkajBuSWpaL053Wmd3aWh5?=
 =?utf-8?B?UEJFejhmbWR4enBKT2x5VzdleGdEbm8zV1R3S0Q4MzN5Y0JWbDZSdXdzM0Vw?=
 =?utf-8?B?VHdHY2ErODdhWmh2K2dOK1F6NDIrcVV6Z2l1d3dkZVIxREZ2emQ5N3prMlc2?=
 =?utf-8?B?c0FvTThIZ0V0OVZ2RW5ES2oxeXpNdTdvTnNsemxhL0p2RkFSRi9BQzNhbU9q?=
 =?utf-8?B?N3Q3aEFLRVlPWHFBSDN2Y0FpdGM4RDQ5RloyU1RUNHJmMUdnSjFpRy9DMHZF?=
 =?utf-8?B?ZCswalhlNklGam5ISkFzZHdaYzZuajZOQjdGaENJRGZjNDF3SmUvTm5Eam5o?=
 =?utf-8?B?bUJnTEp4NDB0ZHB4NTlQYnRkNGY0VFJqaWFBRzc2Unc2QlRrTWsrell3NXlT?=
 =?utf-8?B?alF2L0RzdzE5VWZuNVBsMWNETUhCa05UczlVeEFKU2h4aWVjcVZGUHJCYkFF?=
 =?utf-8?B?a1FjSFI0N2FDOUtKY0hSdnYwQTFieUJWNTZ0QTlDRE1KM3VzM2NxZXBjYUl0?=
 =?utf-8?B?UUZMb0RnRHlSTzNNeGdPZjZyMEZTMHdaamlMT0x2akpwTXcrVDZ0MTUvaExV?=
 =?utf-8?B?bWJGOXM0VmVqZzNlU3NXNG03WlpZdGtXcDJiby9PQmdvYzRMYWdaS1pleE5F?=
 =?utf-8?B?dzJ5UWxuWUZqSjhpYlNFYW9CVDY1MTVOKzA2UGFxSUhWS2JkZGFOZFVDckhv?=
 =?utf-8?Q?MqJBK4mYz/eEqZOibfi1iajVdwMFO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c244TzlTNkdIREdFajRZSEdGckJVMmJ6QWN6cFViSUY0bjRwSnNVODdXQlJm?=
 =?utf-8?B?bXkyQyt6ZUpETHNmZ05tMXlMNXNqR01xN0cyUWYrRkxGSmc3SVpDbEI0N1J5?=
 =?utf-8?B?N25oZ1RGa08yaEFLSHZxeUl1NEJFNjhmTGkwQ3NTcjdUUzQ1aFdUOVlDOFhV?=
 =?utf-8?B?WmpsYS9VRHFTa3BZL3h5WXQ1VDV2Nm9WSjY3OXlYNStBTm1ZNTJCYXFQYmdi?=
 =?utf-8?B?TjhLSjF5dFBUNVI0elpJUXg3dFdqNE84REN4YnNKc2R5eThoamR0em85bk0x?=
 =?utf-8?B?bmZBc0djWVVIQTlVSjkzZmtzYnNsRExKQjAwUXl3c0JjUjNpM0NzejhKSTdN?=
 =?utf-8?B?M21Tb1FCdXVlbWNuQnljTnZyTDhSZHJtaE9iMFZwaWJ2RTZhSndvVkdqcCtV?=
 =?utf-8?B?MFpZWm0yWG1OOTQvQ2JueXBzaXJkU2YwaC9YcGVJTjFSdk5rYm50L1pnaUtu?=
 =?utf-8?B?d2FUWU9UdmlHRE5MSVFyRUZveXpGL0cvWTZFSzVBVnhHSk9KU01BeFQwNGlP?=
 =?utf-8?B?ekUwcmtVZTRMdytCWkxqZXBkWmVQOEd5SitSUjRoZHFyWVUraHVQVTdjTUtn?=
 =?utf-8?B?TituY0M2RkQ1elJnTkhPQ0FGVWNKaTJWT2d0VFkxa2ZGYmZQMkN4cGFLYWpU?=
 =?utf-8?B?cFFON1RwSVJkZUpBR0V3MlJ6czJyVlVFQmx4RTNidEdORzRuOXR3c25QWjIw?=
 =?utf-8?B?Sm1SaS9VTUVUNjlxVnRuaWF6ZUluWHlqWmVJZnNDcFoxL3lkWlNlTXVuRVpJ?=
 =?utf-8?B?cWQ3b2E2S0RPYjRpYjdYbTlkSkg0bTVRR0NCbk5Jdmk5R1h0VkE3b1R6M0ll?=
 =?utf-8?B?RUZWQktjdmhDZUJYSjlJZmZTdVZ4bEdCSEczWVhxaVBhdHdLaVpnOXlaekl2?=
 =?utf-8?B?c29hUHR3MW1qTTI3VE9hM2ZPV21NT0crdnU3ekR1SjFXcnl3WC8zVzNTZWxR?=
 =?utf-8?B?WkVoVENQckM2eUJUUzZYOENZckZzWnU1NUJyK3UzNnVhOHZrTURQNld5Qi9U?=
 =?utf-8?B?eW9uQmloNGxWSElRei9YUlFzaDZwcmk4aXQwTjZxZWVNT09icmcrOEVNeTh4?=
 =?utf-8?B?RjMxcTFqRHcraXpGaVRpUmpZSWlxaTYwemJjT0QyOUlzWjdKVXNLWWhoaDdF?=
 =?utf-8?B?MzBYcU9vMEdTc2owTThrNXVSS1A2NWpEdTZZUmh6WDV2WUh0UXVpQ3FxbDBV?=
 =?utf-8?B?dUNpUld2QUtRMzduQk1LK0pqb29VbXUxVUlyS2orQ04zMmhMbitRMWRCeFox?=
 =?utf-8?B?dlhMeHhtTmx1dHZkM3MvcVZRS3JJMDB6VGtrc1RDOXArVlVpQVFuaXlPSjJW?=
 =?utf-8?B?R09IZkZiRWlYTFU5U3FKL3ozTU9Hb1NvTEFML1dxOFAzWlFQd1dSMXp0RFR5?=
 =?utf-8?B?NjYwYm8waWZsZll3YUN3Y2gzaVJXWU80dHRhY0ZjZlBtTktudFNHSU00M2V1?=
 =?utf-8?B?OFJUUE5QMU9oSnBPL21oU1liY044dlVqR3lqcDFqOE5JVXJxK1d1dzg2QWlp?=
 =?utf-8?B?ckg5VUdwRmFSU0tuMnlwbzNpU0hHVUovS1hZdDE0K2pQdlAzZnY5OHpNd3Ra?=
 =?utf-8?B?RCtDYjlrT2piUlBWT3Bsdkl1SGwyaVZvUjNHeC9FZXYrSnhXZitOLzJCTnZn?=
 =?utf-8?B?dVBhQ0MzRFkvZFJEZkxFV1lyVEh1Wks0RlRmeTExaDhFcGJOb016ams2R1lN?=
 =?utf-8?B?VElxU1A0VHRaa2ppWE1qREgwQ3ROS0QyTVJFR2tTMEZsVXNyTzI4QlFqR1Av?=
 =?utf-8?B?M2VUcklqR2ZLZ2JPTGo0OG12U0xxZmZIa3YzVVRkTlpPYXUyazduQmRYQThB?=
 =?utf-8?B?TTFkUUdISFdiNTN3YmYwbEJJSnhlam5HNERpNlZtVVBBQzdIZWk4ZG9sS3h1?=
 =?utf-8?B?ckVicUZzMFdMd2VBQzNmRnVJb0hsUndBbHRnUHBmNXhsU2ZXMDZ2dG5keFoy?=
 =?utf-8?B?UGxGQU5TdU9wcmJCUUJkT3F3YWxaSnVESDNPMktEaXo1dTZ3bVFZbUI5S055?=
 =?utf-8?B?QWtZTnVYSG9ocDIzNXpMSXN3SVVnTjYxTTBIZnRkM2lwN0xrL2xrZVd4OUpj?=
 =?utf-8?B?am0yb1l5clNzajIvMHZRT1BLZEphd0tnYWZha1NTdGJiendWSSt4MGgxMDhU?=
 =?utf-8?B?LzVxL01TTDFXTFBvNWppbWRTNC9PQUE0YXViSk1Ed1RHcjdtbk5sRUNUcExT?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a36bd38-80e6-4cd0-b50a-08de10f32335
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:38.9336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnL/Uj82LFi/MGBuKYqgzXcjVzdhx4hdN6gjg9nrboDVO7lOZhyGQ4j4Mya0q3kIGsR2XU9f0qE7SUH3FGfAG6b+71ZtXLHEakwWdB1VsFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

Add debugfs handlers for migration state and handle bitstream
.read()/.write() to convert from bitstream to/from migration data
packets.
As descriptor/trailer are handled at this layer - add handling for both
save and restore side.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 336 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_migration_data.h  |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  54 +++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 6 files changed, 444 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
index b04f9be3b7fed..4cd6c6fc9ba18 100644
--- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
@@ -6,6 +6,44 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_sriov_migration_data.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	return &xe->sriov.pf.vfs[vfid].migration.lock;
+}
+
+static struct xe_sriov_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.pending;
+}
+
+static struct xe_sriov_migration_data **
+pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
+}
+
+static struct xe_sriov_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.trailer;
+}
 
 static bool data_needs_bo(struct xe_sriov_migration_data *data)
 {
@@ -43,6 +81,9 @@ xe_sriov_migration_data_alloc(struct xe_device *xe)
  */
 void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
 {
+	if (IS_ERR_OR_NULL(data))
+		return;
+
 	if (data_needs_bo(data))
 		xe_bo_unpin_map_no_vm(data->bo);
 	else
@@ -125,3 +166,298 @@ int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
 
 	return mig_data_init(data);
 }
+
+static ssize_t vf_mig_data_hdr_read(struct xe_sriov_migration_data *data,
+				    char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+
+	if (!data->hdr_remaining)
+		return -EINVAL;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	return len;
+}
+
+static ssize_t vf_mig_data_read(struct xe_sriov_migration_data *data,
+				char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t __vf_mig_data_read_single(struct xe_sriov_migration_data **data,
+					 unsigned int vfid, char __user *buf, size_t len)
+{
+	ssize_t copied = 0;
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_data_hdr_read(*data, buf, len);
+	else
+		copied = vf_mig_data_read(*data, buf, len);
+
+	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
+		xe_sriov_migration_data_free(*data);
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+static struct xe_sriov_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **data;
+
+	data = pf_pick_descriptor(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_pending(xe, vfid);
+	if (!*data)
+		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_trailer(xe, vfid);
+	if (*data)
+		return data;
+
+	return ERR_PTR(-ENODATA);
+}
+
+static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
+				       char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_data **data = vf_mig_pick_data(xe, vfid);
+
+	if (IS_ERR_OR_NULL(data))
+		return PTR_ERR(data);
+
+	return __vf_mig_data_read_single(data, vfid, buf, len);
+}
+
+/**
+ * xe_sriov_migration_data_read() - Read migration data from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
+				     char __user *buf, size_t len)
+{
+	ssize_t ret, consumed = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		while (consumed < len) {
+			ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
+			if (ret == -ENODATA)
+				break;
+			if (ret < 0)
+				return ret;
+
+			consumed += ret;
+			buf += ret;
+		}
+	}
+
+	return consumed;
+}
+
+static ssize_t vf_mig_hdr_write(struct xe_sriov_migration_data *data,
+				const char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+	int ret;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_from_user((void *)&data->hdr + offset, buf, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	if (!data->hdr_remaining) {
+		ret = xe_sriov_migration_data_init_from_hdr(data);
+		if (ret)
+			return ret;
+	}
+
+	return len;
+}
+
+static ssize_t vf_mig_data_write(struct xe_sriov_migration_data *data,
+				 const char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
+					const char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
+	int ret;
+	ssize_t copied;
+
+	if (IS_ERR_OR_NULL(*data)) {
+		*data = xe_sriov_migration_data_alloc(xe);
+		if (!*data)
+			return -ENOMEM;
+	}
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_hdr_write(*data, buf, len);
+	else
+		copied = vf_mig_data_write(*data, buf, len);
+
+	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
+		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
+		if (ret) {
+			xe_sriov_migration_data_free(*data);
+			return ret;
+		}
+
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+/**
+ * xe_sriov_migration_data_write() - Write migration data to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
+				      const char __user *buf, size_t len)
+{
+	ssize_t ret, produced = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		while (produced < len) {
+			ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
+			if (ret < 0)
+				return ret;
+
+			produced += ret;
+			buf += ret;
+		}
+	}
+
+	return produced;
+}
+
+#define MIGRATION_DESCRIPTOR_DWORDS 0
+static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
+	struct xe_sriov_migration_data *data;
+	int ret;
+
+	data = xe_sriov_migration_data_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR,
+					   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
+	if (ret) {
+		xe_sriov_migration_data_free(data);
+		return ret;
+	}
+
+	*desc = data;
+
+	return 0;
+}
+
+static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
+
+	*data = NULL;
+}
+
+#define MIGRATION_TRAILER_SIZE 0
+static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **trailer = pf_pick_trailer(xe, vfid);
+	struct xe_sriov_migration_data *data;
+	int ret;
+
+	data = xe_sriov_migration_data_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
+					   0, MIGRATION_TRAILER_SIZE);
+	if (ret) {
+		xe_sriov_migration_data_free(data);
+		return ret;
+	}
+
+	*trailer = data;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_migration_data_save_init() - Initialize the pending save migration data.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
+{
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		ret = pf_descriptor_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		ret = pf_trailer_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		pf_pending_init(xe, vfid);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
index ef65dccddc035..5cde6e9439677 100644
--- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
@@ -27,5 +27,10 @@ void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
 int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
 				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
 int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
+ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
+				     char __user *buf, size_t len);
+ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
+				      const char __user *buf, size_t len);
+int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 8d8a01faf5291..c2768848daba1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
 
@@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 	unsigned int id;
 	int ret;
 
+	ret = xe_sriov_migration_data_save_init(xe, vfid);
+	if (ret)
+		return ret;
+
 	for_each_gt(gt, xe, id) {
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e0e6340c49106..a9a28aec22421 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_pm.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
@@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
  *      │   ├── vf1
+ *      │   │   ├── migration_data
  *      │   │   ├── pause
  *      │   │   ├── reset
  *      │   │   ├── resume
@@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
+static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*pos)
+		return -ESPIPE;
+
+	return xe_sriov_migration_data_write(xe, vfid, buf, count);
+}
+
+static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*ppos)
+		return -ESPIPE;
+
+	return xe_sriov_migration_data_read(xe, vfid, buf, count);
+}
+
+static const struct file_operations data_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.write		= data_write,
+	.read		= data_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
+	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index eaf581317bdef..029e14f1ffa74 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -10,6 +10,7 @@
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_printk.h"
@@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
+static void pf_migration_cleanup(struct drm_device *dev, void *arg)
+{
+	struct xe_sriov_pf_migration *migration = arg;
+
+	xe_sriov_migration_data_free(migration->pending);
+	xe_sriov_migration_data_free(migration->trailer);
+	xe_sriov_migration_data_free(migration->descriptor);
+}
+
 /**
  * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
  * @xe: the &xe_device
@@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
 	unsigned int n, totalvfs;
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
@@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
 
+		err = drmm_mutex_init(&xe->drm, &migration->lock);
+		if (err)
+			return err;
+
 		init_waitqueue_head(&migration->wq);
+
+		err = drmm_add_action_or_reset(&xe->drm, pf_migration_cleanup, migration);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -154,6 +173,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 	return data;
 }
 
+static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
+				struct xe_sriov_migration_data *data)
+{
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+
+	xe_sriov_migration_data_free(data);
+
+	return 0;
+}
+
+static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
+			     struct xe_sriov_migration_data *data)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
+		return -EINVAL;
+
+	xe_sriov_migration_data_free(data);
+
+	for_each_gt(gt, xe, gt_id)
+		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
  * @xe: the &xe_device
@@ -173,6 +222,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR)
+		return pf_handle_descriptor(xe, vfid, data);
+	else if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER)
+		return pf_handle_trailer(xe, vfid, data);
+
 	gt = xe_device_get_gt(xe, data->gt);
 	if (!gt || data->tile != gt->tile->id) {
 		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 2a45ee4e3ece8..8468e5eeb6d66 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex_types.h>
 #include <linux/wait.h>
 
 /**
@@ -53,6 +54,14 @@ struct xe_sriov_migration_data {
 struct xe_sriov_pf_migration {
 	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
 	wait_queue_head_t wq;
+	/** @lock: Mutex protecting the migration data */
+	struct mutex lock;
+	/** @pending: currently processed data packet of VF resource */
+	struct xe_sriov_migration_data *pending;
+	/** @trailer: data packet used to indicate the end of stream */
+	struct xe_sriov_migration_data *trailer;
+	/** @descriptor: data packet containing the metadata describing the device */
+	struct xe_sriov_migration_data *descriptor;
 };
 
 #endif
-- 
2.50.1

