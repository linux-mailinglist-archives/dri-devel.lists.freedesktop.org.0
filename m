Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611ABCFBBB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA7010E355;
	Sat, 11 Oct 2025 19:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/BqGGqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B99410E359;
 Sat, 11 Oct 2025 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211690; x=1791747690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vTPFx43a74TpSyZHXAEsQ5kW6ZfWeIIwghPEeVzmK7w=;
 b=n/BqGGqcd8Bz2r2A5VWEMIuhEtBwvegqAYoRTQrgT12LGFV+KW4M438P
 D3SfrDhrEjgX9Dt9/P0RpiAJwUElSO6s7bAUSKYraNK9v7ucOUh23nXCn
 Kcw/qAETprIXZSoZnaukyZHJ/GXZdNikjUzay9sYuSbXcrf1hcesZbs1e
 56z06svfJhm8P4Tn+Z+jDYpgmptNzDfPtrOm20bRn85ZWmqJots9PuCyk
 zfP7FVz6i2Lkrc1QYWVf1k16aduk57YZ9UuT6ZkpgMMyGJXy8eJBxPNAg
 adiI/MLWegcnfOdJb94GhW9qhiqHFyutTVDFSlxEd7FAyppmiUqmokzVR A==;
X-CSE-ConnectionGUID: QJytSc7rRXCjhrfF5ymAIg==
X-CSE-MsgGUID: 585nSLCxR9m00kecvOdMpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73842077"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="73842077"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:30 -0700
X-CSE-ConnectionGUID: LWwvg/GVSfGyw9zKVYwlPQ==
X-CSE-MsgGUID: X4MFPvcaSLGunRcj2oEobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186344017"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG2m2JmGLg7MwVWa9d/Ir75SGaDuUwvFs8SRYYAaOX3Iep4kczTY3m+5/LtylyyE2t4eibcC+3E4bAjYomKdZkDTo8Cdi4jQuydUvS1mR5gefM+F+4nFqAlSTOq651egSTzaxomAk6b08eHj71IJh8qkwVzjFOf8EXFhqvyfo6dJUoCPNvlCticnXIvOQVAViI3Ne84oM9Pr6U/4hEzy1DyZmTqXSPscJvdwnTRxvlXSJUkHr2vEAiHusqpZ6I6UWd0plFbnabq8Cof035biKmykx5QwulTo/S7aWBTusfGVaPrelyT7VBoKZLFZDIrLHG9kfsh3RAEhmq3qUoFfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2iwj6sLyutDX9N571ez+5W4Jy/E87tX0YDJskSVOMM=;
 b=j1z2chcIocTLHI/5GW7dPlezeOV7UeuNJPSi5SCY2lLT8HBTCKWHuVp08MBAgtlk/115Tu9fWmY4JF+JuzIiDcWXjexoWN9PD5Ada8dFZyTuH1PI6xUl7iJ4lkthUfWP1+wSoTSeXNBGkQZCTm3S70cMhBKwYG9FFQKCVSwhPzn62ZfeHt5eI/EAO5V0TiMCL9uvAHuNzb+8jzyNeTEs8DvAVZwDoHjI7pbgY9FAIcW862iVQ9dv7fj8NwK2V9wAW2OGQU2ibJTMU59XmPe2h3D1hNwjNqb9QqzXPElBw/GU9GvOuAGsX9AfYWmbAj4biH9+TY6nENprxSJ+cfuJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 16/26] drm/xe/pf: Handle GuC migration data as part of PF
 control
Date: Sat, 11 Oct 2025 21:38:37 +0200
Message-ID: <20251011193847.1836454-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0250.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 81209d6f-2e85-4325-bd82-08de08fe2b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlVWZEltVHVPYlQwMm1mTjlIUGlEbm01VWR1OTFYTE5xZHJMRlJTODVYekRt?=
 =?utf-8?B?ZGQraks3UEtQUjVwVm9YNnlmSXpSR0hxNUtwWjZUM01TTy9pblUvL1ZlS045?=
 =?utf-8?B?Q2xOMEJZN1J0WVRRajhUQmJTSTJJWFBMTDZUbmt3QnNBUzhsajRVWVhFTkND?=
 =?utf-8?B?a1ZwWk1tQUtWTmxLZ3ZkSEgzZzF0Y0NDbXVCN1RKVVZDTExaWW53MGZ2TW5r?=
 =?utf-8?B?RXVXMHJuRldjbldhYk84ZEJ5VUFwa0svTDY4YzVsMlBiV0Uzc0ZQVGxGVlBz?=
 =?utf-8?B?MjE5dlpzUkc2R2VHZGdQb2IwWVdid0h1NGU0TS9tNVFFQ21jb0NkNnQxaHJW?=
 =?utf-8?B?R1A4VnRjcldvODRua2NhUUgwTHZ2VlRWZVRhM0RLMW9MNG5aQU9PT0tPUnpY?=
 =?utf-8?B?NXVZSmFVdXZ6QzZrWEpPUGdPSjRKZzBsWTc2bVQraHFUNHljWnBZQm5WRXFK?=
 =?utf-8?B?MzIyTzg4UDdxNEhKaWdpVEhiLzdUWEIyUS9WNlBaZHl4VnN4NW8vRWZRdUJJ?=
 =?utf-8?B?NEdMMjZNQVNDaGxZeHY0VXRDRmlXVit5SVlIVFljV2VDVzBwNlpWVmZxbW5U?=
 =?utf-8?B?RW1GM0ZuMFc0QXpmOGIyeUZPbmhVclEvRUVYNk52eS9ISEViTUlyeTJCekla?=
 =?utf-8?B?MFVWcGJkV05MLzBDbVE3MjJjU2kxNW1XTmtpcmRHbXJZWDZFRm1mZUVzM1FI?=
 =?utf-8?B?R3VSc1hTNDRYaks1TUpsWUI2UHJMRVB4NVpsMWhmK2NTSkhwRWJTVUVRdXd4?=
 =?utf-8?B?UUdhSm5ZUWNNMDdFOGRjZFNHZlpNbExleTNQUVhqalgzelplMlhjdERnKzJu?=
 =?utf-8?B?WmZKYWFIWUpEeFluNitHVmtQZmdiYWRhZCs5SHcraDV6TVluY3AvKzYvVzJn?=
 =?utf-8?B?U2FKeW5UWjc3dWhaaWpTLzhmUlgyRXZibzN6WXZFbkkzc2VkMXhGVFlyczFU?=
 =?utf-8?B?QWZCUXVCVkNIdmhEeHhTSzJya3Y0STBOZ2V6TkdHR1pYR2tiTklINTVWcnhD?=
 =?utf-8?B?M0FqQ3JWRzZYck1VMUFiYy91Wmc1TWxZNXpOdE0wOHRJWU1WS0hrUTd2MzNV?=
 =?utf-8?B?UEY5S2x4eWIwUmQwRkpIa3h4ZzkvYzdoMCs0NnE2bDhicTl3OGZ1dFR3U3Vx?=
 =?utf-8?B?RWN6MmkvRlRDbXlZZks2QUduS1Z5R3ZPNzVNQkNuaWxyU0xTNVZpQVdJQ1Ar?=
 =?utf-8?B?RVNNY3oySHA3ZVdnY3RadGF0SVEyUENMQkVtTlpJeHRsaHp6ZERtM0poU2Q1?=
 =?utf-8?B?SzZCRnFOd3daMmJPTHpELzk5NTBOOXplZk9uN3BKNktmMUlHaE80amVoUDhh?=
 =?utf-8?B?ZjF6VFI4ei9DaGE3alRiTUFTK3kyeFZZS0w3T0hJOWdxenZRZUIxbHEyYkJD?=
 =?utf-8?B?TEJPM2hyK1l6QlI5T2RtY3FpQ2EwZkdVWUFpVmtMZU1MUUt5NFhzcjd1N1pj?=
 =?utf-8?B?ck5yQ1c4c00rWXNBME5zMlo2SW1yNEJiNXFKRElnRjJVajRRMThmaXFuTTVk?=
 =?utf-8?B?MExPTmVmdTh6enA2eW1QY1FEVFlwVitZSklzRVdWQWRuek8yaDB6dmJ2MGd0?=
 =?utf-8?B?L25qTEN3YUsvb092NnlvMlRTM3ZDZE4rWEt2QVlUSStTYnoxVHJaS0JqcHNR?=
 =?utf-8?B?UFRnTURGQ1NtYXVaS3UzVzJxVXlUUTRnWHBxUEtNdUpkOEI3YXlRR1BEZ1NV?=
 =?utf-8?B?c1RkTDZmTGlIVlVEQmlhSE91aW16elRBaG1QZ0pCQVZIZlhXMVBRQXJPRW5x?=
 =?utf-8?B?Rm1PSkZZWmVWdFlmLzFNaFQ4NHdFWVYwbmM3ZHhYWFpGWll5NnlLVHc0SEpU?=
 =?utf-8?B?K3V0VFU1WXltYld1aG9ITGh1RGVqR2dLa2I3ZHE1R1U3Ymwyck1vdXBSTTNO?=
 =?utf-8?B?cnpObmd2ZUl6a0d6UUYrb0JNRThUZ3Q0dFRDL0ZpRWZrelRndjNjTUVUdUxh?=
 =?utf-8?B?TEpDVU9iMWNIdWJjaEMvRHZpank4QzVVZFhucjNkak5SN1gzNzlMbUprL0U0?=
 =?utf-8?Q?XaaNy3BiLPKaAnf7hI4sY5GecBnwYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhQdkVpc1NvK2wvWXh5Q1Mzd1BtK09CZ2E0bmpDSjZlM3NLWFAweWk0WUJC?=
 =?utf-8?B?djZLRWpSN0prVjZPMHhFaXJHb0xVSUxieldoeEZlOGU1b2d0U0pQV3RYYUwz?=
 =?utf-8?B?WmowelIvSGNFRG8wNWNmNG90RkM5QkF5b3QvalFNc1NIVHBKVzRjc1BRdCti?=
 =?utf-8?B?czJQYzUzK0JTQmVaQ3VEbFdkWWVzbzh5QXVOS0ZqZ3N3ZWwvdVRPVnVxemdT?=
 =?utf-8?B?cHh0L1Y4RTIreVFDdlRxOVpuSzVuU1RlanZlOEJHZUczT0ZzYUZSeUFITkJP?=
 =?utf-8?B?ODJQOFduanA5S24xVDNrQVBsQzRFK0NPb2tPVzNPWU44QkduUEZQRHhVVlR3?=
 =?utf-8?B?M0hJWmtIMzI4bXhNLzJnNkdNOVAxMnB6bXJKTWJSelZ4Qll3SmFrRFdXcUxo?=
 =?utf-8?B?R2J2bDIrSytZMjd5UXdVVHhVV0RYdldsNGxjRVc1bkJUY3F6cGdMaGRrZkc1?=
 =?utf-8?B?RURJQW45ck1pWVFHUWQ5aUZyYm9sZmtINVdaYWdUYTVIMkJJZ0ROMnEwK2xm?=
 =?utf-8?B?OHpCcUhPbnZDRXBDbTlRSlB3NGtRMkRWdy9SZWR0YkpUaFdQdEtLWXdDcXp5?=
 =?utf-8?B?VTI2MmExVWpHeUFzQ2JCMXFaclcxNHcxcU9LR2J4QnJaS3hNTEoyQ1k5bUFm?=
 =?utf-8?B?MjM5Y0VLMlZMbnRzUTVuaFFZekNybEMvNkx5ZkxEOU14SmVlT2NvaEI5SFU0?=
 =?utf-8?B?dHg3OXkrWlhaVmtPcTc1TDlLNU1BNzVqY2FFZjB2ZG9aT2FlemZlcVpYQmxl?=
 =?utf-8?B?aW5td0RaUjlXZlordkZ3N2VkNWtCMDNFNWduZ3RsVkY5d0ZCaUlnOXpTMXBK?=
 =?utf-8?B?ZHZHZ2l5WjAwR0twRUxTSXhQRzQ0WGVHKzBpdnhLbFkxVTM0MkhmWWF6WE5I?=
 =?utf-8?B?dHZLcTNpM2llU0I2MHY3R21kQk1sTCt4d0tHVlFER1VuWTFuR29VVm13bHBy?=
 =?utf-8?B?SG5EamRtbjF6TXZJbldMWFJTak5ROUVOdXQ4eUIvZ1lBcDdIS3VHb2VSY0l5?=
 =?utf-8?B?RGJsWEg0LzZhOFFlSFkxSDAwOE1aT3ovcnhiS0h5T2dUb3BxckFtSkt3S2Q4?=
 =?utf-8?B?UlZjRXV1Y0cwaHlxWWRDekJOYVZhYXdLU1VGVE16WXlJYlpIYUdya1FhNDZR?=
 =?utf-8?B?Q1lsZHplczQ0dm90aHhXRDlZVU5WRHdtMTB6ZCtaSjd4STcyUGU1bDhZMitD?=
 =?utf-8?B?ZVBzT2FVam9pZ0s2ZGxIbUxLcGt0R1JTeUxCMU5NejFJRDRNTytJVzJJY0Zh?=
 =?utf-8?B?eXRycUVkZ0NzUlVJUW1GeXdEcG1HdDJyK1FmM0JneFdVWXBDbVhoak14cDlW?=
 =?utf-8?B?dE9vZkkyRFJkSW84YzU4ckI1T2xVeHJxeS9iSWQrREoyOXJhUXZ5ZVJxTDdY?=
 =?utf-8?B?eElrS0pmME1VZDVjZ0k0V2MwckpWVEFYamlIN2poQ2lUM3UvL0lOdlU4ZGpw?=
 =?utf-8?B?WnQ1cXJoYWMvYWRDVlc5VjRCNG5VbUQ1dTNzMzduMXFscWF0MHRDNFZ4OTVu?=
 =?utf-8?B?YkFpcU9rL2JlS2p5c3hKN0djMXJYNHR5ZE9MYmJnZlhJakFRM2xISWtESkt1?=
 =?utf-8?B?UmJMK05qMHZiZnR2TFExYWpsenh0UHN0d2FFWjF3dUFZNTVrMEhnY0NlUENY?=
 =?utf-8?B?eDFwSnZ6d21ieTY0Y1BDRnJPWlZyQTlpN0I3N3lsWExtUXhtKzdQVGRwcmVx?=
 =?utf-8?B?SG92TGNla2RmM1ZlcUZ1SVlIUlpQampjZFJCclA5SnROQW0wcUVpYm8reFVJ?=
 =?utf-8?B?eGkrM2tjSDN2WWJOUTNnenUyTjdEazVuZFM4ajdIMjRUK3Z3OTVEdGhMU3Vm?=
 =?utf-8?B?eFc3Sm9YV2k2RG5GS1dmeThhbjYyL2dtcnVwZUsrY3d0ZEliQ0xNNDhLRFZr?=
 =?utf-8?B?NzczYjJWVlpLZVRtYkU4N2dRdDRGcFFYcUZrN1VicDRnV2NDcEYyUTRIYjZx?=
 =?utf-8?B?TEo1SEkvaEs3T0lRREI0V3hSUnZJb0pTM0NMcjRVUldFa3dlcjl0WmdzdDM4?=
 =?utf-8?B?bWVYSGFhWVA2Ukx1L0RSNE1HcnNrWitFUXBGTDBPTHpIYy82aTR6NHNtTFls?=
 =?utf-8?B?Rzl3Ull5WUlzNFN0bUI1NjhvWTZCakZESkZQSGhJNzEzTEYzQ21rU0JETk5t?=
 =?utf-8?B?UzdMSTF5ZVFOMlBTNGhPWXRGcThObXRTN3VWVHlDVkVhZ2FlTDBYbXRJMFVY?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81209d6f-2e85-4325-bd82-08de08fe2b26
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:27.3047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sk5iwunbWpdL0Vbunp6O0jYSCjziHDJz5lYzy7URdOOxS75u4DpPb41emV81pS9bth6FEakrs2afM32Eh9Ws+eoAZk4ZjJ4V5/cWULZGDrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

Connect the helpers to allow save and restore of GuC migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 28 ++++++++++++++++++-
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  8 ++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 6ece775b2e80e..f73a3bf40037c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -187,6 +187,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSED);
 	CASE2STR(MIGRATION_DATA_WIP);
 	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_DATA_GUC);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
@@ -338,6 +339,7 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
 }
 
@@ -801,6 +803,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
 }
 
@@ -820,16 +823,35 @@ static void pf_exit_vf_saved(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
 }
 
+static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_wip(gt, vfid);
+}
+
 static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	int ret;
+
 	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
 		return false;
 
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC)) {
+		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
+		if (ret)
+			goto err;
+		return true;
+	}
+
 	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
 	pf_exit_vf_save_wip(gt, vfid);
 	pf_enter_vf_saved(gt, vfid);
 
 	return true;
+
+err:
+	pf_enter_vf_save_failed(gt, vfid);
+	return false;
 }
 
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
@@ -838,6 +860,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
 		pf_exit_vf_restored(gt, vfid);
 		pf_enter_vf_wip(gt, vfid);
+		if (xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0)
+			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -946,6 +970,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
 				     struct xe_sriov_pf_migration_data *data)
 {
 	switch (data->type) {
+	case XE_SRIOV_MIG_DATA_GUC:
+		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
 		pf_enter_vf_restore_failed(gt, vfid);
@@ -996,7 +1022,7 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
 		pf_exit_vf_saved(gt, vfid);
 		pf_enter_vf_wip(gt, vfid);
-		pf_enter_vf_restored(gt, vfid);
+		pf_queue_vf(gt, vfid);
 		return true;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 68ec9d1fc3daf..b9787c425d9f6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -71,6 +71,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP,
 
 	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index e1031465e65c4..0c10284f0b09a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -279,9 +279,17 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t total = 0;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
+	size = xe_gt_sriov_pf_migration_guc_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
-- 
2.50.1

