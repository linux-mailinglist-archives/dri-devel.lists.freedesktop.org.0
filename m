Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A4C36405
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1A310E798;
	Wed,  5 Nov 2025 15:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lT1DEgw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0D10E798;
 Wed,  5 Nov 2025 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355548; x=1793891548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DqnXpdHEwp5dxFqH93i5ZOy1oNvUm6s2qGANp5jUP0w=;
 b=lT1DEgw1vMEDuwC59R071RNHtNktFlTEGC79OC7F88662VpXoqPTqOb6
 onOmTgTqBc0mbT6iyNzIWz8Z0c9Njzg+OhvXXM+BFsT1+Sw2Cutw33ZgP
 Sr9qlfd9evev87Sqsyy9fjBAKHVHza99zB05iNv5Yig41ZNEB+F+ZrtMT
 m5yNo2f8hxOWH1Vgnihlwz3XCeZbEfZypQg7M8NZjE7tEtrnyj/YMG8Dh
 77R5IE7gIt0KGCVyND+Ea86d+yWYbcKhzMiKPaBEWAqlq+MrF18g8Hevq
 HcPtK7CrQAMkQzOBcGyMP8I1tvUW5uFHfiYfAmSNNfGVXwOxD8fFbJCad Q==;
X-CSE-ConnectionGUID: cCfA+UILTkadJmxWnJEVdg==
X-CSE-MsgGUID: MZlWfw7QTZi5nr57lipO3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75587254"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75587254"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:28 -0800
X-CSE-ConnectionGUID: 3GQfcCbES421rS/iZ8aCyA==
X-CSE-MsgGUID: Z7QqvWcQQfCC4biVZHEPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187174592"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWe+z2Dapc20KaIQRiWm184j5pJzMKWBLxt2BFziRU4OwRzQEvTVua+MO5jF8haxxAjQdVddKyv4uYtUQXvInDQLLugPnIZq9atuR+Ql4PhTBChaIZBhBk95sTvVWgHK4gH2PCElBXgGaj96gUwT6FaHUStfJyBSoEq+709n69DKBhG/YQGDpRrWIhmsPcOwDTvWP87Z01Y+xHxG5+QaiNpFry3EPmQyc9hHCTpGR4fMsan0N5fGCKjrOBH1uXuVQESw296CTTIJsXgWoG9EYZXWDy14TXmsayvpMlRi8w9Wot3G1uk9c5pdrZe7ov1FHRkH+Yyxfe8EXC20v2qtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szuUGPZjMGhV9t/YNgqtQc4Z6Vl5erMWRyxIFWPZP7U=;
 b=JYxUcwdvZALVQRn/4HEB9QuNJfin0hU29DhmaBpeO2ELo4Rg2QThY0K+D1fmeysCTA5maFFMWZbqFaxWRUdr/K1u4QWyHsjnupnIzF1Py5EJ9bTW7CBAP3QyuSzNubdvOGc62Byo8h0zAI2oidUHkqH0AxqUNkIoUyOKhtpymdwgC0yJIu0M2tBAmMmZPX4D4MZ+em8ct4JmrFH8eSOjpxdsBg4ol8WZI9mqTyZByueGSwZNgTwAvxOCycXG1hfAOLzcxOcEcMkpgaSaQUO8iWrMxiegzMvfSdv/JAWLF3ewgKVKg7+RkkblsUJi+lNK6w2MPh6KeiUvBimcugcYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:23 +0000
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
Subject: [PATCH v4 19/28] drm/xe/pf: Handle MMIO migration data as part of PF
 control
Date: Wed, 5 Nov 2025 16:10:17 +0100
Message-ID: <20251105151027.540712-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a00455f-6dfc-462d-42fe-08de1c7db90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnZTVXk2ZVl0SzRYa0Nrd1cyWERhWjhDSXQ2bGNoQzJXR25hUEJUTW56L3lV?=
 =?utf-8?B?SUtvcGZFSFpvZytpS1dSbEs3N2ZiVzZJMW5aRVZPSHByVG42ZnpDSUlLdVdm?=
 =?utf-8?B?UThBVlVmUmU5M05iQmcxRlp4SFRIZURYSU1KeEJFZGZzU0NobzdkZTFjUlNp?=
 =?utf-8?B?YXJ4RzRIS1puVDdqbHNsWklKZEZZaHBDdys1czIydFFjRHZ3SGJSV0V3b3dx?=
 =?utf-8?B?NFJ2YStETkFBSEc4MUlqcFUxcTNJVll2RWp0MXZaTjVya1BIMGEzTGFmZ05C?=
 =?utf-8?B?NkxONWIyMXR3b3BKWUJsZE1ydm00STloUUFkOVhJU1FyVWFYdElDdFBRYUN4?=
 =?utf-8?B?OC9sdkg4aFpZejE3NlExcnhKUnZuS3RJbEovenpEalJWZHdIQ2ZGTWpLTFFJ?=
 =?utf-8?B?Y0YxdU9kczVTYkdVSldkMUo1U1Y3UTZvV1VMTTMwWVA3aHRQcmR6REFjU2ww?=
 =?utf-8?B?Ynh5T0RDWWVObzc0YWJJWHVQS2YwUGp6ZEl0QUlvL3FJbmJ0Z2xRaWVFbmZM?=
 =?utf-8?B?aUlRVTd3L1lYUzExTk1BaHhudXVRZ1BKZEhmU3VVUEZmQk5QRC9PeUV1OVRv?=
 =?utf-8?B?RmZIRWRldjh5bjFBQ2QzY3dsUllKbmJQYmhBVFhzQnFzM0p5ZnE2eEVTRDMx?=
 =?utf-8?B?Vko1WUdsNU4vQXVMQzZSUGxwVG4xRDE5TzlhSmk3a2JxZVpzdmJlL1RLNHBO?=
 =?utf-8?B?OXRPOE51cDY4ZTlYU0RXcjVIS0pMcTkyN3VqL1VSZHYvem9CM05UUi84eG1B?=
 =?utf-8?B?eXQvQ2ZSSE1sQWdyZTNXRUxCRFNySStBWURReDBRdTVvaVo2MllUb0VMM0ta?=
 =?utf-8?B?WGQ2UnhDZmw2UXRmWmpYcmY2WXF3M2RiZUQrdHl3ZXBOdkhjY0QzKzdCaFYv?=
 =?utf-8?B?cXJXRy9LM1pKNDZHTjgzcHFQTkpKdFRMMVhiYTcvRExtekJ6WHFYK1pvUVJh?=
 =?utf-8?B?b1ZFNWozeDBONEcxVER2NmFGQ0MyUXV3c3FrUXRaaDFkVXRDUGE0UmxnK2xH?=
 =?utf-8?B?Sjl1ejBUWU9zTTZ4anpCbnRXS3liSHFVWXhqSkRwUDJBbW4yVmxUZndMTVVa?=
 =?utf-8?B?N2MrVU9ySTd3M014QmRyVFVUMjBpWUxDN0o4MVc0NmhRSFJvT29rV2FZMEx6?=
 =?utf-8?B?MTdmUWdsd3puYlFvY2R6VHVQdVpQTXczdmJ0ZS90WkdSTDhHeUtqNGxHNWdn?=
 =?utf-8?B?Q2dGMVlzWU5sd3YvQ0JaVHpYNFVUdjdRb0U2UThpeVFmMDRjVXM1dE44am1P?=
 =?utf-8?B?SlhFRlVXUmYvdHdydUlOdWE2bVVMN214S3JncFpCcEVuK1Y0ZzVxRHdZOFNC?=
 =?utf-8?B?TXlCSXhBSy9YaVo0dDRQZTZyaHAyTTZLRktkOWoyKzVlMnhySUFoSGlrTmRE?=
 =?utf-8?B?TU9PN1hEUndnZzBkYXpYd1lMZGRnRDV1YVhZWkw0aFNrMVdqek5waVRBMTFu?=
 =?utf-8?B?ZHI5T1J1QS9aTERqRGU5NmdMcm5DcnE0ZTkxb01ueHA2OTlzdnp5cmpnYkUv?=
 =?utf-8?B?Y3RGcWorVmdFRU1wbldkcGFFcnZ0ZHhpcnQ5OFB6Q3NaNnVMV0Nhd2trRmRV?=
 =?utf-8?B?RHBoaGFmbWU5Uml6RVFMa2RtR0UrWjhpSXcrdEZkYzZFN05PekVmSkJ2RDJx?=
 =?utf-8?B?Ny92T3d6ZnRLeHoxZDJ6VGsvWHRzVm5LdGd6ZVVIbFJnMUhHam1YMm1PcGVv?=
 =?utf-8?B?Z2Z4VXdjWDh4UDFsQlRPQzJPSnhyOXFwL012YlpPZThjNFo3SG1acEJRQVA4?=
 =?utf-8?B?M0hZZ1B1SURjK1dnbXhJR1lZQXdLeU0vb2VWclhKZzYzQUx6dnBmeWpWRjdD?=
 =?utf-8?B?Tm1NRjdzUVRkcWNzWlpzNzJiUDNSaWxlQmNqOVROR0lLc3NMWnlyRWRnUEV1?=
 =?utf-8?B?K0Y3Nk1hWG5qK0tQcHZXVkNDbGlRVm51WFBFM0pQNXlLdktiMDVaUEpvbXlT?=
 =?utf-8?B?TzBtR2ZxUUNrdjFMMmJZTXNvQ0l2RWl1SGhmbGRsQjZmWG1OVU9IL0RRaVQy?=
 =?utf-8?Q?OerXeoSoPoA4NuHZICyDietMAERSwE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkJxY2l6bEJzV3JwZzBCdU4wTmtNcjkwei9FdXBQRURrenl6NXpEUWJxYnk2?=
 =?utf-8?B?bWdrZUV1Q3JZb1d0Nkg2RzhuYWIwWTA4YVFTc0pBZmdDdnBKWldRTE5PRDUz?=
 =?utf-8?B?dnhaR2hCQVVsNDc4bGFCNmtMQ0o5ZnRDQjNZUlpyRzduZTJneUtjMS9vYXlJ?=
 =?utf-8?B?MytlU1ZMS1ovUGQrNHNGNWJYYnAxOW5xSkFlektlVGFDb3JkV2p1TUpvWVdh?=
 =?utf-8?B?TjAvQkt4SW9oMDk1YlBaVVQ0c0dWTm9jU3dEWWhta1c2YUV6THprYTdvRDZ6?=
 =?utf-8?B?bzgwbEc3V1RwZ2J1azFZemVWRno3NEorU3pObGtNU0trTzZjSjkxR2g0RDZX?=
 =?utf-8?B?UUM2Z3RHanVVSVk4UG1jUlE2UTltWTRya040dGp6cU1vanNuODR6akFraXRm?=
 =?utf-8?B?dms5V1docHFUeDlPSksvNzYvSmxBTS9DcDZIV0t3Z0srdnlJc3JJZVZVRStT?=
 =?utf-8?B?bFljZTJXZUV4clNhZnlJZWsvZlZBOEJDWklKaDgwQk5LZ0k1ODhudGRBZUFp?=
 =?utf-8?B?cHl4MHR4d1R1aE9TdTlMbDBWczJUeGczUHdGRGxvREtzWG0weUVNc3dWUnlm?=
 =?utf-8?B?SGQ3d0hRWmdRR3lrU3hLZlUzQ1Vzc2VJZ0hqUGwwNkxJMVBYVHRiWk9reHFG?=
 =?utf-8?B?VldyL3hkVStGVHRVQ01qelh0RVF3TitSYktWa3A0VjgvbllCb1MzME9lRDRt?=
 =?utf-8?B?UnlhTTVSK1liQnZFVVBxQktFT0hBU3djVVJWSnVsTlVPMlN0eE8xS1RBVlVv?=
 =?utf-8?B?a0tibmM0STdJLzkzNFJsNStRMVFFeGxUSmw1MGd0U2dvOEw0UmdSTlN4cTgx?=
 =?utf-8?B?cEQwaHh6VUtTUXh4NG1iQTE2Qm5BS05WMis2TjcvNzh1WmdJN1ZOV1VrclJW?=
 =?utf-8?B?VEw0TVArSVBWQitTbkRrdXNsbjN0dGdQdWZiTHZEQ2hrQmEzaDVFTnhDQ3ht?=
 =?utf-8?B?ZUJhZkpDZXBDTnNuM1lJTWt2c1p1QkZFTzJQeXhsU1VVVE5raGJ6dGFGeTgr?=
 =?utf-8?B?R0ZWQ0UxQWNEcERvQ09CSFE3VXBzbG5oYTYvZVUyOWRUVVpUak9CcTY0bC8w?=
 =?utf-8?B?YVBzV25haWFaRTZpSm8rUE1vVndPL1dDQ25ZSmcwOTdFUm9jblIweTFNRFlk?=
 =?utf-8?B?OFNheWV4VmZVYTZjV1JHbTg5WGNqUEZEc3RmSzhJUzh5REVJeEdMYzZsK1pY?=
 =?utf-8?B?VitMREs5YTVSNUhCMGx0aDhYblBnazFzZ2E0azZGVmgxK29pM0prQXo5K2hq?=
 =?utf-8?B?ODhYSEFVdDhzdklXWlE4K2MxeG9nVjJPcVlaekV6bSt2UHBDVVcwOHgvd2RC?=
 =?utf-8?B?ZWV4RlJsNXhwTWltUXlBYlYvNTBCN1A5NDltODVNSzdjaE15WGtQUVpObXRW?=
 =?utf-8?B?WlMyVUlHa3JaUW1FRjZIbEpsbURab1pwZGg5QnA5bGFXaTlja284MVNiNUwz?=
 =?utf-8?B?dTZ4dmNTdnNLSHlGQ2Z2ZkdJcFg4a0o1MTBGUUk3WXNORzcvcG1XZTBMQ3BF?=
 =?utf-8?B?eVdmWkwwcWdYc0J1TGROZWMzRnlYK2NwbGd6VEdtWlo0dmxZY29UTGdRZ05R?=
 =?utf-8?B?R1R1ZUI5TzFRUnlVVllUc0wwYWFBazUrTklFWUtLY3c0TUR6QnRRS0NGS0ZC?=
 =?utf-8?B?NnRDNHZNcWQ4T0lwUVpuL1JFc01iSUpPTElyNHl3YUU4OCtKY1dRdXBaVTlZ?=
 =?utf-8?B?SHFTQ09VNU9wUWlDVitIdENJQ3V1VERuaXZuUmFpaTFUR2tJUGJjUlBVUHA5?=
 =?utf-8?B?Nk9oS1FNU1oxeHJta1hjaDFvWVZHTWw2Nm9Qa016QWM4VUZvUXNPcG56SjdP?=
 =?utf-8?B?UllnUUt2QWFQdyt6OUZtMm1rdVFiSXd4QkxENTF4SEZRU0N1NEc5dWljV214?=
 =?utf-8?B?YXhZZFpwaWlPWms2dGpFZjdEcVFwcHNKWHdkZXUxVHBMUm5HTzJ1WUd1NUF1?=
 =?utf-8?B?cGFLYVBHZ2o3TDJKSkt0TFVCZUpKaE1VMlpGVWVRQ3N4Ri9DZjlzbWxSZWFE?=
 =?utf-8?B?Wkh0QjlCZXdGSXBoZmROV1lxRnJCNy84M2VSeTJsSEZuTHN1UjZyZnpveUV6?=
 =?utf-8?B?NEZocGg5ajZoNGFCUm5FSDZldXRZZit2Z2xVbEhiTUJoKzVSQzIxa01MYWow?=
 =?utf-8?B?VVBDUzAwTG5yaFkyS09ZclpBNEdGZXFKazlCOGZxUFJ1OG5vUDR5bjErbS9x?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a00455f-6dfc-462d-42fe-08de1c7db90c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:23.7231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmyrO78JZPqZ7lncG88Am/ClBtsptgQ09K1baMBVcVY2VqbEnMqWB16G8CGunjJgcEocPvMiHksV+OJ5W4gcVOuaCerB2wBUmE7w0gprmnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

Implement the helpers and use them for save and restore of MMIO
migration data in stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 156 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 174 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index ee4717f9a8260..abc2bd09288ea 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -879,6 +879,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_MMIO)) {
+		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_MMIO);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1111,6 +1123,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_PACKET_TYPE_GGTT:
 		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_PACKET_TYPE_MMIO:
+		ret = xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index e7879c0e55615..22f471f269cfa 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -5,10 +5,13 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -16,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_pf_migration.h"
@@ -355,6 +359,148 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_guc_state(gt, vfid, data);
 }
 
+static ssize_t pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_is_media_type(gt))
+		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
+	else
+		return VF_SW_FLAG_COUNT * sizeof(u32);
+}
+
+static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	struct xe_mmio mmio;
+	u32 *regs = buf;
+	int n;
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
+
+	return 0;
+}
+
+static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+				     const void *buf, size_t size)
+{
+	const u32 *regs = buf;
+	struct xe_mmio mmio;
+	int n;
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
+
+	return 0;
+}
+
+static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_mmio_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_MMIO, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = pf_migration_mmio_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data, "MMIO data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u MMIO data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data, "MMIO data restore");
+
+	ret = pf_migration_mmio_restore(gt, vfid, data->vaddr, data->size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u MMIO data (%pe)\n",
+				vfid, ERR_PTR(ret));
+
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_mmio_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_restore() - Restore VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -387,6 +533,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = pf_migration_mmio_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -455,6 +608,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	if (pf_migration_ggtt_size(gt, vfid) > 0)
 		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GGTT);
+
+	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
+	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_MMIO);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 2d221b6409b33..04b3ed0d2aa23 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -22,6 +22,9 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.51.2

