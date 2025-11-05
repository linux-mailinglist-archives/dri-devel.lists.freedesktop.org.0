Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AFAC363C3
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF28010E765;
	Wed,  5 Nov 2025 15:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC6ZkMyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DBD10E06F;
 Wed,  5 Nov 2025 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355464; x=1793891464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zErL3GnVD94eZOnii4wcvnlntZUYz8gisQlkrFDmHDI=;
 b=JC6ZkMyAsH2VzNRRzGd+6rLY6BtsitMYwXwt0GC+0NY6eiLsgqrkUFgt
 sDwmjouprAsIrCC5E5cKCIc+zhBJtxLtgXG1AGSYMgLoYYzxQh3k9cohc
 mpxHQCF7XMtCEkL50I7pmBH9m1yozOi8CFhCvFd1AtB8ZN9XpStbQxIhA
 wRolJyjDKBOk11t+RjVaZ7NDKCtuK4vLBa/i4495KvJYkyjNUEQ0P96Zv
 ez/gMQHm333FddKb48FY8OT86KoNU+hN96KTQN5kLodYRy5QORR70RnK9
 xHAH7Lthenean8P3ZF5c3UBXxEBmUVw8mG09N9+rJcyhCzuH3mW/FXAc1 g==;
X-CSE-ConnectionGUID: YrpMyEAVTnqaKc12LzjKbQ==
X-CSE-MsgGUID: uTcibGz2QRmTe9RIiEMvMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82101066"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="82101066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:04 -0800
X-CSE-ConnectionGUID: NtYEALKpQL6lfuqyqF/YgA==
X-CSE-MsgGUID: CFN5/d6iTv6/1FuTJOs6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187928872"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:03 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKDWRNoLPK00kdt3mi0BL3QPWNg90QEf5yQz3v7RAibFjWZCGeaq4sCm2BEO930p9lvzRtSJ2Z3H3Xzo/P/zUR81Zd5u/MSGDPxPBuYKjdqKIg/yCKWw4wwa9/xPmSm4wDk1Pgec458xCJrACyiK9Sa/3zJE8f42u75YQSLhUZLuKEqAF0WTaa+bEXOzwvxmVk33mhNwJSpmynqYbxLwWMh/C0FGpNcu010QlUKY9uBXaq24yOTh210JfvulOC/bUL8V1XILDoW7QMzAQa0j2gGx8qlnneKGBu+mFW4fG92GJQE1HrjO0oMK8b6WYp33Hup+avA6sqsx4RilGtsCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIxhayoW+jc4Px1hjlj3r2IhdUR+X+7S9qezWs85BNs=;
 b=lvr8cPZII3+xvrGYNk00Qn7jrmzNt3h9AqXob0Cb9vY2bEjmLAyhTmF5bpOkI6J7hD6Mk+gjeZY3hv6egQ0E62i+bdD5w92dnee7Wk0Wvuu4jKSfTeNsNrrKcoKaG6+cSVpdjlMB+V6t8mK8eUDT8UY0RfQt+9q8zMIangKUNdzkTzsTqhCuYr3jaNf4VZ4hNd+uQedBv/SC6qyM8v05+DdfGoZDk/B8waF1kCap1IgpHv5GlaWGBD5pc33+z5U5OTKGtWSUBlFikRWPbf7edlfqWedTb1g6gjh1WX1GSx0WlK7lVfFukHPjwZ7Km6swENxmcEYiY3R/rH1xCMEBRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:10:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:10:59 +0000
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH v4 03/28] drm/xe/pf: Convert control state to bitmap
Date: Wed, 5 Nov 2025 16:10:01 +0100
Message-ID: <20251105151027.540712-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: b4dda3f5-2a8c-4d66-e072-08de1c7d86c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a01yNUZzNVE0cEtRMEp5akwwWVpzelNJS3FuUy9WRk15Mk9ubWdWNFkvaU45?=
 =?utf-8?B?eG1GeHBWbE9XajNrZmlibytPdm10Z2U3YmIxV0t3dnZkemw2TzBWUklKVkdY?=
 =?utf-8?B?KzBEYVhvazBJa3lMamp1cXdUNlI0TnVmZjVMb1hiY1l0SGZlYVVkSld1ZTY1?=
 =?utf-8?B?aWNWcjhLRTB2QjR4YVZTa0N5WllFaElueWxCWFZsd0xaMFZHRVNyUzlTdVRO?=
 =?utf-8?B?U2QzYlk3MHFUcjdYZWVWNGN2ZzBTd3hGUWlRdjJZaG5TMHA4RHJwN2FXWGls?=
 =?utf-8?B?Z09LR0laNi9ENUFrOUNMeFlHZlQ4Z2VMWExHUDdkamVaR2NRdFg2cEZCQ0s5?=
 =?utf-8?B?a1pqVGYrRGg3bjNYSi83NGszRzRmTVp0b0t3RGE3cU1XSFpGNnFVeFMydVVn?=
 =?utf-8?B?VENvdmp2UXhwK1dBZys1bVRsVHNRK2tXR1lBNERqUnppRzdpNEh2aDJKc2Vv?=
 =?utf-8?B?ajdYazg4VkQ2Y1FzSXN3L05ZS0FUOXRzU0R3M0Roa3VCMGhnVWxMdkFrZWtQ?=
 =?utf-8?B?QTU1bEVLUUszV3NkMkM5aUJIYXRKOXBmUGY0MU1ySVc2RU9INzRzT3RxMno5?=
 =?utf-8?B?QWxpbWhNNXRDZXhzU1JRMUVxN3hWQXE1UjJlTmtwUzJZS3NHdmFGSTVtWFla?=
 =?utf-8?B?WjBLOUV3N2o3NjFBUzFVaklHTWx6QjNLaFR6eFhGclRHdmxWcXpZQVkxZEtq?=
 =?utf-8?B?OHgyZm4rSFZFNHcra1p6cTJmUFg0ckRQUTNyenlyV1pHOTJYVWV6WmQ5SjVW?=
 =?utf-8?B?ZWx5cnJIZTI1Y1h1ODB4eDAxZ2xtSm42UGVYZEl0WkdZT1BTNFc0RExCT3Er?=
 =?utf-8?B?dmllQnhOYkN5YU9jVnVkejVJMld4UVFVc09Qc0ZkaC9kTzZkY3JzYVVEZ21w?=
 =?utf-8?B?NU1Ec09ucUd0dG5odVpzclZaYnF6YUo4Q0JRSzJqRlcrVGwrTlgxTnVhZnR4?=
 =?utf-8?B?SU9ybzlDV09VYXpvN2NlUnZGbFo3Ym44a1M2SmNLb05NQU5Kc1hycnZpN3Y0?=
 =?utf-8?B?NFU0aHUyMmdiNUdQeUNUM2pIRU5tTmNJSXYyM0U3aGF2bTlrd2F6eUh5bnZi?=
 =?utf-8?B?NVEzQ050c3h1c1ZFMmJWUFJqSDNQRXp5allJdjdWQTBCTTVwdWJ6bjlveFhB?=
 =?utf-8?B?dDNwTEoxWjVLV2FEazJHS1BVKzB3cVJhUGhpcEFjRmc0VFVmUTI3aEE0M1hE?=
 =?utf-8?B?VlV3TW1yZHdraEgrancybmxJLzlUSDkzd0hwTVlDcXBZYUhaS05kVUhtaWZv?=
 =?utf-8?B?UEIxMzhibFNxZk5zWTRXQVRIZG52WmhUSDNJLzBFWW9tTy9kaytKdytjNUEw?=
 =?utf-8?B?ZWRSVEJEQnJHVFU3dHVJMGViZG9wMExSVTRMelZpdElqNUNPSnc5RlN1M0x0?=
 =?utf-8?B?NWpqcWNSR3VPd1hFQ0tiV2NsOGkyWm1aZDZsY3B2amd6b0NyZ3Z4a2JmNUZn?=
 =?utf-8?B?WUt5dTViUFdkZjZJMm4zald3YzU4ckxsYkdvVXZNNDdIMThhR0FLc2VQS3B1?=
 =?utf-8?B?ZEJVNlVrTUVFaGxYaDl0K3NaV21uTnk0RHJMcTNlUTRaeE5GY3hGRXg0WnZQ?=
 =?utf-8?B?LzM2bjhSMWJrL1NCNDRqSDdTWk41b0lOZXRRT1dad0tQUTY2Vk0yZWtGRnR6?=
 =?utf-8?B?NDJGVCtLVVpkU3EvMVhQeE5tczgyRkRrMk1xLzUvMDhkSlk1YXB5aVhnQ3dL?=
 =?utf-8?B?YWhDdEtlRDdCOU9Fdk5naTBXN1JlOURqekZWUy9oOGliR2JvZ2U4NVN5Zkc0?=
 =?utf-8?B?eWh3L0tubnBWem0yQityVDV0QzI1ZkxrYmFQOTJCYTdXY1kzQmNJbFNFOHZ3?=
 =?utf-8?B?QmVBbHEwdDBZenBWclpVNlkzMlQ5MGJjYUorRkR1Wmk3RExSMXJWcUJMbjEx?=
 =?utf-8?B?K0F4K3VzYjNlUC9BdUlac2tuUGwzS1l6OXNLL2FDNy9uYVVhUmJwN1pOd1Av?=
 =?utf-8?B?dXNZYStUYjF3RVRXWVlQMjZiSDhpVkNTSi83cE1yVmhtYmJhUUFqWG9yL1Zj?=
 =?utf-8?B?N2tSVlI2V2lnemZmaDcvbW5yeE9nelp6alEzdk8xQXpycFJBUDRrUjJoNFVU?=
 =?utf-8?Q?m6UyBF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Lzl6VkEwcklQalBmNUNsUHdjRU5RVzVSWDh0U2pncVhVTk96Wnp1eW51K0ZH?=
 =?utf-8?B?LzZpL0xSb0Ivb29UUzM5SjdUM0Zpb2RJamdKeWpHeFphVllXVFJSSXJ6eGlX?=
 =?utf-8?B?bm8vQk5HUFpsVkxXeGQzbkNuRTJseDl6OXRwZU5ab3dTd0pjc21zZTkyNVJE?=
 =?utf-8?B?ZTZsblVLTnNRU1FTRG8yS1FjTDBDZVFoZWl6ZGUrcDJtTDZCVHNYbkVoWTNF?=
 =?utf-8?B?b3REdzI0a242ZEJMQ2UxbFdkOFd5RnBFWkp6UG1mUkdINzlVeDFwOGx1YnhV?=
 =?utf-8?B?NFVKRURJYTFzZ0hwWW5VN2h5VVhVZU5tYzQvTEl6bmtNMnc5NEtWYjdwdmNT?=
 =?utf-8?B?K1ZYRWFaQ2x2Z1BJcGVPYndQSkoza29XRU04RVQwdytkd0VsN2p0MEZreVBD?=
 =?utf-8?B?ZGNYZjRkMUN4SlAzbGpJaTcrUTA4R2lZOUdidlYvbm9HMnhKSEthdHgzSHZX?=
 =?utf-8?B?bHlRZ0ZLTktEYXJVUjRKMElYc3FRbDFHK2Z5WjlTWWJnVU1Oa1VZQVBEMHpu?=
 =?utf-8?B?UDVuVTVnVzZnajhJM2VIbnlDcjgvZTZKeTk1UWNlODR1dlA1SXQxZXlaOTBr?=
 =?utf-8?B?QmJTVk8wc0VWV1U2eXpHblJ4QnFOcnpYbC9vc3BBbTl6dXpuRjNZUWJsV0RT?=
 =?utf-8?B?ZjhJeWNUTUg1cVdneVRqakZHKzRzcmUyazI1RFR5cUhNbmJ6TVQyUzU5VEpI?=
 =?utf-8?B?SHEraktRcWdWYmt6TzlpVXJqNlk3Zm1XV0xvcEdwVFp4QWtzcXIxK29QTWVq?=
 =?utf-8?B?Y0d4cTJVcVFlZm5taXlTTTVGTjkxNUdxa2dHdnE1RUVhRjBOVlVkZzA2TFpi?=
 =?utf-8?B?cXZJa3Z0elp4YVlYcFJwU1h4K2Jqd1Y5SjZtYU8zdHF2bUlBNTBZVi9iTUZO?=
 =?utf-8?B?bkdXZWpzQVhQWTJtM0I0OE1lVmFOZWRmMGtsVjlQSGJ5U3F4bEVreUQvMllq?=
 =?utf-8?B?SG9ySUZjbkFkeUR6dkFnR1lMRGRISW5wUU55RE5kLzEyN1ZnVEZ6OFhBRktW?=
 =?utf-8?B?dlVFZjhKTk5kNWN6WFZ5RUFZanJlKzNxU1o4K01hRGVOTXloR1IvTnNycGUr?=
 =?utf-8?B?SE9NWnlXSExNUHp0UlVEQ1JYQmhIaGdjZnA0WUJSam8wcUdkYXVVc1JpWFlZ?=
 =?utf-8?B?UHd3b3B1RmVqRGlyU0NaOVEwZUNLTzRIcjl0WWJNVWhjOEoxZ1oyRUtsZnpS?=
 =?utf-8?B?dVJXbW5JMUlBbUFBdjdnU0xESEtkMDEvRGlEOC82elF0M2Vzb3RteWxaTlZF?=
 =?utf-8?B?cUtYaXd4Y0xnR280Z2hlbDdqSHFjT1Uza3MrMXdveEhyT1RyZDdpQW5QdC9j?=
 =?utf-8?B?VXJ2S1djZG1XbDdRNHdRN3Jibk5aQlh5V2dCMXNPWUZHL0ZqdjcvZVE5YnZX?=
 =?utf-8?B?SFJqRElPbDZwVmpIYktFUTlkWXQ5K1JxcDFERzRBcjlqNWdsQ1F1eG51aHQ5?=
 =?utf-8?B?d3p3eEVvZ3RNYkFFdUYzSkllTFIzMFkvbDVEK2lwcks0b2ROQm5qSUZPZzJy?=
 =?utf-8?B?Q01TTFpDcDhwbTl0ZzRFbVVuM29rUS9Xb2VETVRUQTBpQzcxUVo1QXJZSzdi?=
 =?utf-8?B?MFA2YnJCMnZYajBucDV6aEhIdWdxNnE0Ui9aaVpKNEpmL09EdGR1MldwYlZL?=
 =?utf-8?B?THk2WXBLbHBjTEpNdmNLOEREU1dvNmVuQ0d4bVlRTlNQTVlkODE4Wk5kdFg1?=
 =?utf-8?B?RWlHTERjNEpXWitVWGJKMFZxdDNRVU1oVGs2U0dhd1V6bmxyOUN1Q21tYy9k?=
 =?utf-8?B?UGRCM0NhdGxQbzdzNlprN0RBcXFTbThBbVpZWHQyNmQyVmVRbUtsTi9YV29n?=
 =?utf-8?B?aWV5bTNPNjB2bnpLTWQwYWpHM3pvTktCVTVpMzNCMUFCU2NHYWVqekxKYzN4?=
 =?utf-8?B?S29MNGVBZEQ5QmNyWFNObm5CRStuYmJsWS9NT1Q0NllSVE9Felo5ODR1VHBE?=
 =?utf-8?B?TVlacGZmMTNjU0tZdTBXV0MrQU84SHM5N2tMVjRLZUpTdS9VZzNTcUxzRy9S?=
 =?utf-8?B?VWZJUG9rQTF6aHNYeWRMZEpMeVNEZVBHdFhCU1d2dnE3anlYNHpyQjQ2UHJk?=
 =?utf-8?B?QUQ2VzNnRjJ5R1ZiRkhVMmxMb0xBUUg1b1Vpc0hkdzlpQVZ4Y2JUb2dXMkdT?=
 =?utf-8?B?Zmw2a1NQOTZaemE3Vkp6cWRRWjNQVWFvWmVNRGZMWU5OZ0lweExkVFFpMkhF?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dda3f5-2a8c-4d66-e072-08de1c7d86c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:10:59.1864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAbUYFIPdX2PLSzUXewQHr5SFlVRqDf1sE/i3LkzJ8DPorp6LKlmD0kBD1K5KbgbvinzPT+MYNpiPJtdPomTwfe6vHYZpKOiXIiknUdKPmg=
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

In upcoming changes, the number of states will increase as a result of
introducing SAVE and RESTORE states.
This means that using unsigned long as underlying storage won't work on
32-bit architectures, as we'll run out of bits.
Use bitmap instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 9de05db1f0905..8a2577fda4198 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -225,7 +225,7 @@ static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
 
-	return &cs->state;
+	return cs->state;
 }
 
 static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c80b7e77f1ad2..d9282eb259727 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -73,9 +73,11 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_STOP_FAILED,
 	XE_GT_SRIOV_STATE_STOPPED,
 
-	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
+	XE_GT_SRIOV_STATE_MISMATCH, /* always keep as last */
 };
 
+#define XE_GT_SRIOV_NUM_STATES (XE_GT_SRIOV_STATE_MISMATCH + 1)
+
 /**
  * struct xe_gt_sriov_control_state - GT-level per-VF control state.
  *
@@ -83,7 +85,7 @@ enum xe_gt_sriov_control_bits {
  */
 struct xe_gt_sriov_control_state {
 	/** @state: VF state bits */
-	unsigned long state;
+	DECLARE_BITMAP(state, XE_GT_SRIOV_NUM_STATES);
 
 	/** @done: completion of async operations */
 	struct completion done;
-- 
2.51.2

