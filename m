Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77056C8D976
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766D310E7F2;
	Thu, 27 Nov 2025 09:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5p6KzoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9228E10E7F1;
 Thu, 27 Nov 2025 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236396; x=1795772396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4dm0voQXDHXUxXSnzWQACcjqUKmlIw+IER96Yxyom74=;
 b=b5p6KzoWyeFrwbNUdVwQYQSZZArbi1SXGgPWii3INCdCZiQzAtFMJlzX
 GeuccB2tYCCCKcEWxr8FdEruu3pjaP8XdazxKofklIGwTJHsHOLozEKvT
 LOwmwe/jqQ1IpG6xwZN4K7lr4T5zdLqCzIpdH1cG+NW36VG/ua1oSInYY
 51yHAdAk0fvJl3nTulD8d9R7sCy4SWwRcY6VKlCo4gkDex5jDuEZK1/CF
 V2Z2WGu63JY0p/0fiSnzKLsv96agBYDzglatYU4BnCAKZLNOTFZz4QZ2g
 VXKAMG43pULKrhnJC2PCTajzEVllNVIW0NWJBcapXuqtXmxuK4dod9vyG g==;
X-CSE-ConnectionGUID: saV2MnhEQXyI3MCIUQxmEQ==
X-CSE-MsgGUID: Iy4pB7kwTaSrc9oUXnu8vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70148402"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70148402"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:39:56 -0800
X-CSE-ConnectionGUID: +iTwwa6SSp6QAnol21C+Zw==
X-CSE-MsgGUID: SiDlZ9rHTse3AHYVHW5DCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193003591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:39:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:39:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:39:55 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i62jBqfN/OyCBxfiq+lA3K+ZJtYIvqozW5MpyGrWJ4UZtYgikohH62CHjEnVeRJgiLrm472JxTaTvV55/dBZwbfkiqoWXI6MDRh+FwxSIHWdCwxx6fLKNPAY+/on3mAtpmMPMTPmrlndCdloPdmw6YyaUxH0hmxostAv49q0n3TmFHsnTsTeIPfVgH7QMjaCkq8epLQzLLRjYkwe7kgNV8pAgBVmAgyfEpyo4OwU64ILFfUYoi08vRLZYak76+LbKVd/EOesSX9EsEPapQj/vl/s5PD6XWbOfC2Ja27OkWCxxYmrLjDRTqecmD4xtsDWj+KLEw7N27e7mnCX7HGFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt72uBvlZ3cuywXec7yRAin4WfSl6Y9KH9BxO8Lmp6w=;
 b=ZeOSqQmCIe9vS+nb+IuFwiG5ztst85TdhI6wZmslDqt8bnfd6r5v5ZT5sX7FTcAtjUXtexylNB80AwQoKaQm6vmW6Iv4vxhsrsNQPewqIQETbNO3c9VAmSHurkjG3bJoER7n6u9QbaW8Q5rYWYe6QzQNmDEwOP+Ln/YF4B1fWi7LTcfxUz1TePAE5ruAGtuRBdkKSJoVnfVD3O2RpiPxzbOjv4VgoYd7VtmRvEezQVWH9oTaqUyp9VK20B8L+GwGB+uff1XXDmOVp3IswXtOraePOa9GwiwcYuXLySYaaU9EcJFLsd4LqSw212MF5Bo0L9cUXbvBE/l/lm9tV1vPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 09:39:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:39:53 +0000
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
Subject: [PATCH v7 2/4] drm/xe/pci: Introduce a helper to allow VF access to
 PF xe_device
Date: Thu, 27 Nov 2025 10:39:32 +0100
Message-ID: <20251127093934.1462188-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127093934.1462188-1-michal.winiarski@intel.com>
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 97426f6e-2897-4ac4-0148-08de2d98eab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG1BdHVQVFBzUGN1eGl0VWhTR291Nm9icitldVhhYlYzQ240QllDUEM0Mnlv?=
 =?utf-8?B?VjBEbG5pVmFRckNSdW10Vi9RT0FjeG9jVFhyNmV5cTlpU2ZvWUN2OXJyREpW?=
 =?utf-8?B?R2pueXZScHppVlIrRmp5NnpMYlBEMjVXTjNQQk13MklXbzIvVlZudGlUUDV1?=
 =?utf-8?B?aDNPNlBIaWQyVjhOeTlIM0ZoSGF1N2phSUx1dVVVRXhMWXloYXZKY29CTity?=
 =?utf-8?B?NmozNk8zMXVvWFFnMUpvV21kaGxkRG12TGlYR1VWaUFFSHM0Nzl0YXhQNVVx?=
 =?utf-8?B?WGR5WVlXdW1VcUFQMVZLTmovK1BzbGRET21qVWFSMXIxaStTR3lwaFBHbjhC?=
 =?utf-8?B?U0w0bm9rNmRkemVXWE1abEZvTmlZRjB3Qzc2eEpzWEZ4KzU2ZXFVeHhxUUIw?=
 =?utf-8?B?KzhZZzUwSGNjVG8wQk9kc01iL1FORFB1K0JEVk1GcmJyeWZxekJNVmJGd2d6?=
 =?utf-8?B?V0tOeVlpZUVRUWZxcW9mckZKNUJqelJIL08vbjlnYVJuQ2NNTThrNW9yQVNO?=
 =?utf-8?B?Q1RMdEJCRlQ0UXNwYmJ4SGNYTmRab0FtY3FJQ3hKRTNDVk9ZdXFGSG1JWitT?=
 =?utf-8?B?a1lZS0lvck1RaFRwWW1raDRpVUpTTStoQUJ0SEphUG9QU1BYRlhYTjAvY1BV?=
 =?utf-8?B?MmpDcVBXbmVxWFJXVGRDdmFhYXVRNEFLMkhVc3RNWEpWbG9ORE1BbjNETFFP?=
 =?utf-8?B?U2lGN3NiR0YweDhjcFNObUd1RkZDeWV4dW5RZUVwanNTUnV0dlJxaStCejRF?=
 =?utf-8?B?dHllVFVXRDVRZWJ4eEtFNzczbktZZVhoTVdpdE5PRXB4cjBlbU5MMGJpeWM5?=
 =?utf-8?B?WVhTdVlpdGlLV3ZMRjN3SEVtTjRFWlEvOTQ3SXBVQksxaVNkNnh2cjVQcDBk?=
 =?utf-8?B?TFo5TWRQd0FkVU8veTB1VUdTVU5paXhLc2JhbUdwWGlEaTFhUmRIcGpyTVdq?=
 =?utf-8?B?aUJpdGtiYUNiNTQxQVoxcTlWVWlLckc5bHo5VkQ3MHg4bHowU1A1UUhmWkFQ?=
 =?utf-8?B?SUJxL3p2QmZabDlNajFNZDhudGhoN2sxS3JBVHh4ZlZMUzdNajdQMVJpRW5v?=
 =?utf-8?B?aWNIVFFmVnNETmJhYnFxMWlOaDNPdUxMRzVkT0FtTVVxRTJFNXRJTVdNUHpB?=
 =?utf-8?B?NC96NVpJUWdWOXJFVXgzd0ZZSnRUcHhnWG5GWjh5eVN3U3gvV1pieXlPVGZm?=
 =?utf-8?B?MkhQZ0d2L1podTNIMUdoUEZGcDRqWkRQa05QK1N0SlMrUjJycG5meU9STDVo?=
 =?utf-8?B?T0lKNDBqZjJBR1BZNi83S1ZPN29UVEk3Z3pYa21hUk80NFZZLzdjWEtSd1Z0?=
 =?utf-8?B?UzdUZzJ2TUdRV1FFVFhvK3RZc2xQVXFBdkRneFR6dHljSmRQLythbDdwaFA5?=
 =?utf-8?B?T3B3Vzh5UEdNaXJBWTlYSHBLTzNoVEFQS3dLc29NQlpkcUpDQmR4QXZUdzRl?=
 =?utf-8?B?WkdWVDF4OFk5VFR5b2xIa0xDNm1tcS83ZXN4bGd3OVNVSHgza0dpdEdzWitw?=
 =?utf-8?B?WkUzV3lVdXp3WTZGYXVJTEdaajdJUXBCTGZtR2VUOTdWY0hwTnJSdTUzZ09s?=
 =?utf-8?B?aVhzRDl0Z1YvcXZpc2ZsUkM5cGVXWE9rN2tsRjlrR2d0Um41bUFZL2VwU0ZD?=
 =?utf-8?B?N2FXaytiR3VvcnUyV3c3cW1xSTZKM1JoZHlmeTFjaEhDUmVZcUs4N0NvYXB4?=
 =?utf-8?B?aW1vcEVvc1F3RmYyaGRqUnRrdnlFMW51bWRBY1JxUE1NcXNrOVZmcmFmQkZT?=
 =?utf-8?B?RjhNZEFtTFZYbFJ2bnFyUURPRDJoM0lXMGcrRFhDZFBHTG5qc0Z6MVZNVTIv?=
 =?utf-8?B?anBubEZnU1hjc0ZDVVRxOFpWMmJzNVhhNmdNa1F0cXhTY3R0TUpxOFkyVFQx?=
 =?utf-8?B?a3VWaVU0RTlFRjBwekFLSDBUc2xZbnRsQW5DZTBSK3pFMW10ZHE2V1ZCWXBD?=
 =?utf-8?B?a0M4aENYckZhS3BYeSszMlE1dENjSkpZdmkxQWJNV2pNd3ppRUUyai9xdmV5?=
 =?utf-8?Q?UzRqOD+lN9OyTe5VRpy2ENwWiwrm2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU1WL3F0ZDNMNHpIT1VmRll0L3ZMQXNOcy94Q0pMMlh0TzdFc20ycitIYlI3?=
 =?utf-8?B?Y1VXVm5NMzBMTEtGQUhvaWZYN216MTlXWGFwQjZLcEhqaFRTUFFGRVdITkRV?=
 =?utf-8?B?UmRyc2VJbmp2WkJDNnNOaytwOFZWemNYb21uYk9qS2UzMndvZ2dxTkhoMU44?=
 =?utf-8?B?QURqUzZRRVlNaU1jTjA4NnBrZnhDYWdtUFo3YVU2aDRqNDlIM0VBd1pLYmlN?=
 =?utf-8?B?RWNEWUU5YUJWdkEvLys1OXlQWDVYcjQzbmhmaStmaEM4emVBWllqVW5aa0Ny?=
 =?utf-8?B?OHNaNWtVNGRzRCswUHVNaFNHRHRvZnNHeko0SjE3eGx1RHNGVk5ic3lnc25h?=
 =?utf-8?B?M29JRlZTVEluZGlsNW83RkorWEJuSVBWVFVWeGhJV0dpQ3RCaThaU3B2T01r?=
 =?utf-8?B?cEZSV3l6N2o5b1YzL28yc0J2RDRoUVVud2tFbmVJNWpKcnNGY1JBeis5V1Fs?=
 =?utf-8?B?UTh6UnAzVVluV3JUM1I3aU44MWorOHp4V2NGWHFDQ1h4ODdlQVpaMWNnQzB5?=
 =?utf-8?B?VzR1d210U2ozK3JOOUFNc1d5cnpJQjR1L1p2YjZZampTZEI4V2M0dXA3amNJ?=
 =?utf-8?B?eFlENDA1Qy9ZamkxQ2F5SWlOS1dFQ1Nrb2tPMEgvbkZtREpmcFJBVUQ5ZDhx?=
 =?utf-8?B?UmRpamdZMHl3VUhVM09wbUJWdnBnZDdES1pBRnNnZUN5Ry9iQy85cjJCalpO?=
 =?utf-8?B?ZFRqZmFxWCsvMkFaZ0U4VW43c000cDhKUTJ2YytzV0dKQkd3WWpYMlQ4YUVG?=
 =?utf-8?B?ZGtiUzlnazYybHpEOEdydjdJNEhNVHprbk5oL05sV2kyTmJpcnhqS0dMQXFj?=
 =?utf-8?B?NUREMEQvZTdmajdWMmZYYkJDSXM4TTFDWXZNMThxcE1ZeUc2d25LMnU4Wlov?=
 =?utf-8?B?Zms4dWhWQzB6dWl1TTZUb1pITEZKbUVhYzJlWllTZXpJb2ZJRFM0b0ZSdFlS?=
 =?utf-8?B?SndZQ014ODNZUzg5WE5rYlZodTJOZ1cvQVhPU0V2S2tyK1U1bzZVV1BCSUtY?=
 =?utf-8?B?NWVTb0VWWUQ4TTZ0L056OHM4OFFQd254cStEcm9JeUliY2E2N3labVpRd3Zq?=
 =?utf-8?B?U3ZjcmNsaUtrTWpFa0RFR2VzVmNRVzIxdjlnM0dqK2xoZnBkRXVCOER1cmFs?=
 =?utf-8?B?ZUYrK0tReEdMR3o5Q2xQb2RqT2UwWDBXSm1KZmpCcGI3MmtMeCs5RDg2SEQv?=
 =?utf-8?B?RlM4ZCttdCtkSG1JYTh3QWVpYzI2ejVFS0w3YXZQY2VPQ3lDY0k0SEdPOW41?=
 =?utf-8?B?cnFES1VuRDFad1NpU0dvTnpCOGxiNEVvcXdRMmM0VVdmd2ZYZnloMWovcGNZ?=
 =?utf-8?B?dzFoU3NwZmx4bkZZTjd4NFRWUFlzc2hIcHJPMzg3K3VpUHMrN1h4VkNuK3JD?=
 =?utf-8?B?b3NwZGhubkNGbEtzZnYxRHBGd2JKL1lFSjRqM21UWkt3QTR0UXdQa1BqaUl6?=
 =?utf-8?B?Z3dsM1A3b1A0dUpWN3VENVRXd1JQa0Q1S2JoMW1hMU5zcTkzam5NRnpqY3A4?=
 =?utf-8?B?M29YaWwzZEk1aU8xMDdVcXVLdlVJNkJ2RldlWkFLWm53eCs4dWZwa2RxYW5h?=
 =?utf-8?B?Q0JoV01MVVNodisrNWwyZmNUckF3REs3SmdCdVNUSlFJaUE2R2JIdC9pKytm?=
 =?utf-8?B?ckhlenFPWVgrTEJYT3NsdU1NU1F0eE1UbkJuUXpUWFMrN0JoaTVpNVMxbDND?=
 =?utf-8?B?akh4N1ZvY21yTG9YTXZjLzM5ZXdkUU0xYlVCNVVqRTFyWG5pWkJNT1BTWkpQ?=
 =?utf-8?B?TnZ2NWVCMkltdS9aUUFLakR5K3YwdHZOaDJhdTFQanVVS0NXYlViRHJQNVlp?=
 =?utf-8?B?SFY5ZlRBZXNVWFgzS2NkVklQdEJhUFBSOEhZNlUzRG82TU9jSVlIbDNtaGxE?=
 =?utf-8?B?OVRyOGI1WkVBWVJNMFFHeDQybjN6NG5iSmRqK0xDNXZVZlhNNFlPbHcyNFlK?=
 =?utf-8?B?aW4vZ3NzV0htMVc5Y0RNWUpIM1RQQ2NCdG85anpheCtoRlZyOURxUzA4dUZl?=
 =?utf-8?B?UWNFOTVZYzVkSk5yUlFpZHBDejFyOHhCR1JmS2VWTm5ZLyt2RlJ4WXNLTHJm?=
 =?utf-8?B?TXQzTEFTTUQra2J2eEtOS1labllRZGl0SFJ2TEJsUVdBOFNVc0wydmVJWk5j?=
 =?utf-8?B?MWZvZkVKM0RFTnpTQTAvek42bjliMmxiZlN0djIvOXFQSTdzcUY0c3Z6UTll?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97426f6e-2897-4ac4-0148-08de2d98eab7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:39:53.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25UoscQn4GbQv1SXQkMs6AFRZhlZJVc9Xumt8ktOUi6a9BXPCUHvQUZbY8K5xJaAWWPbzmSrXnnjPnWXLyOq5T5D3yu80n0DYRxWKyjc3HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

In certain scenarios (such as VF migration), VF driver needs to interact
with PF driver.
Add a helper to allow VF driver access to PF xe_device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1cb30efe27ef1..9859e85c4f3a6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1232,6 +1232,23 @@ static struct pci_driver xe_pci_driver = {
 #endif
 };
 
+/**
+ * xe_pci_to_pf_device() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
+{
+	struct drm_device *drm;
+
+	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
+	if (IS_ERR(drm))
+		return NULL;
+
+	return to_xe_device(drm);
+}
+
 int xe_register_pci_driver(void)
 {
 	return pci_register_driver(&xe_pci_driver);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14cc..11bcc5fe2c5b9 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,7 +6,10 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
+struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
 
 #endif
-- 
2.51.2

