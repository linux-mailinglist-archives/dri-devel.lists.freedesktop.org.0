Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E898EC8D979
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C979510E7F1;
	Thu, 27 Nov 2025 09:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMQlBu4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF24810E7F5;
 Thu, 27 Nov 2025 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236404; x=1795772404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LFus3hTop1hOPulgeD/0okGxpCK5ilLSL2vlCjfR5dc=;
 b=KMQlBu4tFoohVLeMHi07PtYj4X3XIMoiSMbwwl+zkzYDGd5HtXjvjyUF
 gLgucAipcvNIUsaSeCv4fMbhZ+HzLQELaMfPZJnQ2M3evOQ+ZdTyg1Qz2
 qdYNYZ2ok2DOWTR0c2NJaeTKWC1EdJgn/ogKZVWeg31oueiUC9+RpD4i1
 mwy5UVHr7Z0oIpCMSr6w9i8MbkA37dPReASRwpYUMekv3Mt6649QSscRw
 kZFQwUR3ZqDyor0H8ul6rSrnpdMOFkEYfmGhLS38xCreuymf77MZscHNq
 heRCnsNO2+OECEqtjuE8Os/pJ4DhQRGn19ltW+Is7HTN8ttbA4oOisdLZ g==;
X-CSE-ConnectionGUID: vzv3QkmIRpenuSVgxcMlVA==
X-CSE-MsgGUID: NlIiuPFzSme0u7EsTkjebg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70148432"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70148432"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:40:01 -0800
X-CSE-ConnectionGUID: UmoDixemQPy3aLRPhuMxvg==
X-CSE-MsgGUID: iWX6+SYUSlW4n9u5YKLlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193003609"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:40:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:40:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:40:00 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:40:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQw0UUp3Smw+655g2cjy3+rIt0S8reC3kpMqRbbN1YRvGMkf36MzooBhufSpFQrYxx3+JOZYjNkFfZ6tS1nvesjAothx19Ij/eTe/I61yJ85SUMD1k4NW2LnFZPagmrpYkDK/tHObxQFVN8mO0GEaEmJi71/VQmyhBhj8KN0JVDN1xd928hdHmTJCZ4fhUGawSlu4OlED70r6s+nvhRzu1CNJ17snXWvS92MHzL2GkqgVrij3BGmuHUoK7vhGu5DiMmLhacoae77ddkDrasZ81plNFOGT5+MHaINYD/jrcBhmAO9ibvFXq27aRGZQgSF1eAVu1CMbHjt5JRpIs9K7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUefY8EWAN+6fzo7eyNxcU/dGpaklN6+S+Fo1yl4ZA4=;
 b=L0o1MZQ5Ok26AMQt8ZsEnn1Rp96d6RUI3VlCIjdZ8y3VPQVAlEIdXd0Un0mLVPMEDqIocvEEq6+RN2pIvl/pkDC2uJBYAr1Oz5eraGRGqwIUC0Z0cH2RTT2bvHh1Lgi2DTjBGU+UL7vDJNTLz+djjJLbCDr1K8XT/g0T9ZaDK+dXicASn99RsblIEdO8G50JGAqtlLQOYcFoajsFV9czZoBkbU86t86Lgl0coi06GQPejOKr6S0L0buBgLGAU/O4tUPenSXcsrGVTYHSHwImZeNOCOrkM133mxv0gi/eImqelliM9LJTB3Pf9VpODSdAD0C2UDUIQdcNvBDRbGUI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 09:39:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:39:58 +0000
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
Subject: [PATCH v7 3/4] drm/xe/pf: Export helpers for VFIO
Date: Thu, 27 Nov 2025 10:39:33 +0100
Message-ID: <20251127093934.1462188-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127093934.1462188-1-michal.winiarski@intel.com>
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::30) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f161c9-944a-4e65-706d-08de2d98edc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkMrcFpWcWdIMW5GTlpWeFRLZ29oZGNMalZGL25VakF4eFJpcGlpWWUyekpw?=
 =?utf-8?B?UmdoQWtDWnIvSWlLZm9mYkZhNlB3NzRyYXMxT3JGdmsrbnVYTUhSbVAyOWxk?=
 =?utf-8?B?dllmNC9RWjdscWVlS1JZL2R6WWkzdGlZT2hRQ2VEQXVOOXFMWmdmM0d3dWJo?=
 =?utf-8?B?Qjc1bTZFdXA1MzZGRmVocTMyUUs2bmt5TXFzNDR5bVdHbGJybVYrZ082bzNU?=
 =?utf-8?B?bnRvNU9DWm9UTTVSaGc5d0s0cjZIOStqZmxYWnhVN1BLUjVuOFIyaGlSbVNW?=
 =?utf-8?B?M0tTaE04N1RIKy9GZytNRmVzRzJJVzVPaW4vR2hmMmVndkE2RmFWd2JJQkgv?=
 =?utf-8?B?akZiU09iekVzZmtiQWJ0Tlk4UlNPMFpabUVJRVpQMzdaL0NoMzNvbVBaWGxr?=
 =?utf-8?B?Q1FuSURqVnZmbm12VWVFeHR6UG1XTzdEMWY5TEdRUkkvTHhBTFhQSXQ4QjU0?=
 =?utf-8?B?WkR3VFZmMUQxVVhBbnZ4U285Mk1MUytzMzI5YjhQVklGZ0VpMEpkRlZxMUhZ?=
 =?utf-8?B?RzJTN09idWg1cG9YYVZ4TEErd3p4YWFXaHROdkhTM1VNSUczazltQm9tbHlu?=
 =?utf-8?B?YWRpWWlxRUdhWkozdTdqWXlxUkhCMjdGdHBqK25STFpQNmhyTkZVSTNsR0Q5?=
 =?utf-8?B?QU05a2VZOThqeHlkVzlsSWw4UzRyd3l5U1RTaWtsb2xPN2JDL1RwdXVQUklI?=
 =?utf-8?B?RS9xRnlMSDIzbDhscFExTVY1WGduNFN3VDljY1o0eUxNckN6cG5tRm5hMG5I?=
 =?utf-8?B?Z1VyOE5nWHpmU3JibnQwMnBoTTZYVy9uL3lkNDRvUC8zS2VmMDB1NDhqeFpK?=
 =?utf-8?B?NzZDcnFyNE4wL282NnBsVzJ6b1RLci85WmRrOWtRSHd3WWVad25hcGFhOUlI?=
 =?utf-8?B?d3MyNzFaQ291T3RjSGhKOUhwc0JyMVhsQVFxZFFMbWFHa0t4MFQzbzJqTzJM?=
 =?utf-8?B?YTE1NWxaaGJjUjBuUkF0V2FjM25hKzhsVTZBUWhGQjhhYkFlb0NNaUJzdWY3?=
 =?utf-8?B?UnEyUnZ1cDVFbi9vRVZmMGoxOHhZMVVRenhqaFkzTmpmRHFlZVRuNVA3TmJw?=
 =?utf-8?B?RldBMnUxTXZ6QitEOUdGY1VQZ01wQlU5bS9tb2Q5NTNrVEdIMEs5M3FnUVFw?=
 =?utf-8?B?c1VydTNZVWJ4bm9kQVAwMXFTVm43REtEVzAwdDdkOG5GanZmbkljZWRJWStU?=
 =?utf-8?B?T2VLUEZzUjY1dFhJS2U5amw2NkpSNC8vc1FpdTYxcmkxSFExSWVYejJ4MjRJ?=
 =?utf-8?B?VE9QaU9ZdjJ6VStTV2ZQb25yb05OdUNXM2xEMGROTG1hSG5nM1JTQTFRcVpG?=
 =?utf-8?B?V1VnclpDQ0h0RnRjSTlLMnBuTzg0T1VNSnR2Umc5M056Y3VPRUlxdG1oaW5K?=
 =?utf-8?B?dXdUaE5yQ09jalpVdWFnZXg2bnhyd1RPWVhOcTRxM1FYU2hocTdxWEpvNXhD?=
 =?utf-8?B?Q1lhTlEwOVdMWGY3UktiNFZSTjVEWFY3NGhMTXhya2lMcTB6QzJUYW9sV0Qz?=
 =?utf-8?B?SFFkUG9wb0NuY2ZPWjVlYVVDK0JjLzQ5RjJYdGlEa25MSUlzWFBobUtpZ0Rr?=
 =?utf-8?B?OGxrMXd2SDZKQ1FCRXFjUnBuWnlMeS9nR3ppamFSc0RlL0ExN1MydVFUUERw?=
 =?utf-8?B?R05hajZydnU4U04yK0xTemRtbmZmbmdqeCt0SloxRERPd0NTU21iVEIrMWlj?=
 =?utf-8?B?WmkxNTJZdjdvN05VbkRWTmZLKzdrQXFobjJXYXpZQjVtQytaNVhkclJPaVFk?=
 =?utf-8?B?Z0x0T29KWjRpdSs4QlhCbHlBWTcrcTh1c2FTeE1UZU9lcVQzUFh1aDdjYUt4?=
 =?utf-8?B?cXY3RGZhMy9OMVB2cURJay9VbC9Hamt2K0lkOXVYelNvLzlGemtjcWVVS3E4?=
 =?utf-8?B?QkREeHJqMHNHSEQyY2pXbVZNb29qNTZPRGJBQUV0Ty8zQVY4NVFKVnlkMWdW?=
 =?utf-8?B?NUQ3U3VjRFIyV2pDMmVnNHMwa1lFelc2Z2FXZm5SbHpXMlhXNGZNd1NTQnVN?=
 =?utf-8?Q?j5Q7Sb8A/8aNLyocKxU7o4s2+HZlTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ditXN0g0N0s1bWI3NkIyZUV3TE14dFppTGxpQk4ybUhkMkVZeXJxTEZBM2Zj?=
 =?utf-8?B?S0Z3ZGF5dzJ2SEtzeER6ajhlVXFvamxDRlFYMUYzNEhrZXBXK2NZN21qMmdB?=
 =?utf-8?B?bWlxbnRUZVZIUEFrWjc2ZTl1ek9vYXVlL0RCc0Q5enZpeEZjMjh5RmxrSzNO?=
 =?utf-8?B?OVlGblIvelUzQ3FFb21qK2pMSTcwMWthdzdIT0FzRlV1djhPNDB2Mm5BV25P?=
 =?utf-8?B?NU5pVHI1MWFRTkJUNnVzclF0QkE3MzlXWDkxSlFmQXd1Tjl3T1N1amR2bUFR?=
 =?utf-8?B?dDhEL1VJekFFb3h4L3BGS3o5dEFpMThOVzRnWEQ4a0ZHd3JjeGVXTmdJWHVp?=
 =?utf-8?B?VnVBYVhzaFRZNVdtYVU2LytybjdTVTNnSklzdjdVV2xuTU1XS1psSHBWY3RO?=
 =?utf-8?B?UWc4MDRsQlNGdEdGSEpEb2I5T0tYMSt6UnZBNjRQZ0dZbUFXaFBTUitvc3VE?=
 =?utf-8?B?Qit3ekFZZnR1ZGpLM3BHeHFldDFnM2hpbWxYNUFuVjdsWTlHeUplUDlyV2hF?=
 =?utf-8?B?QU1yT1hRb1RHZjc2VUorWkM4Z1ZMWFZZby9UMjk3UmFuZWExc1R4S1ZtTlpa?=
 =?utf-8?B?Um8vcjhGV3paWkhZbUcxWjdUWDZQMk91bWNDajBsVGRXWmVGSVNqTm5FQXNZ?=
 =?utf-8?B?U0ZhYXpWdHZwc2Y0VlZYU0paYm40Q0NRc2RtRks5RzhiRWFVQ1pRTmVkb0x4?=
 =?utf-8?B?R0drQ0QzdEdCeEhhb2ZHaDhFTGdpYnhGZW41dElFTVZCc2ZpSUVEeVpBNGNz?=
 =?utf-8?B?d2I0b0s5RDZ6bjBmODErZHg2V3NtTGZ2NU02dWRVNkI2b29zcW10b09MVXpC?=
 =?utf-8?B?Y3JSRzJpYUJNUmJYeVAxYnpOT3l3N1E1WmpUWVM5NE1FbzFIRm93K1AwTEEw?=
 =?utf-8?B?ZnRwN2xUeEkzK0NjcFBpeFRKTHFEVjU0OWhNTDVCRkRueXZvMWNTZlBtQUt0?=
 =?utf-8?B?NGFndXV6YmRNdTJFUlNYc1FjV2s2aVltV1pLVlFWRU1rbTBSRWp2VFhyZnAw?=
 =?utf-8?B?ZVNVL1pwRUlDVHg2NzhNRzdGYlhxWkY3endGY2FoVGxXOEhzaTFSN2dEd1FL?=
 =?utf-8?B?V1ZjV0xjRy8yZ2RBbDBLUDhXRDZoU09VUXBpUlV3VkEvOUp6bnlTRGlrM2xr?=
 =?utf-8?B?eGVselFvd0lLd05WNjluK01XMlVZN1E3T0RFdElxOGRaMCt2L0JHeERnUmY0?=
 =?utf-8?B?SkxBbUJaeEhIVXJVelRqVnVwSXB6ejgrZFVSS0lRWm5lWUVwUWxoUXJBL3Nw?=
 =?utf-8?B?UFM0eDhHaUltUDQvTjNkQnc5MkthV2ZWaVdiTUY1aDJjVlZlMXpMVlRnNnVG?=
 =?utf-8?B?dmM2UlJFaHp6T3N4d0RTcXdnemNwc01DRG1ZTmhzRE1RaFZrUWhWU2ZPSnlk?=
 =?utf-8?B?cDNZNmc0UU1ZUXFyaTJLZ0tQZnFwSWRvYTJTZWZsbS9yWWZJM05aYTJlcmJj?=
 =?utf-8?B?WFRLejVZWWliQmdTdDJ0aTZnTFBvbjQzZVhsRWl0NmxsdEt4NXBxWVV6R0xB?=
 =?utf-8?B?TnV0Z3BPejEza2xVdTNBa3pnNVJOZzl5Y0hyUFRDV2hzUzNKbCszWWprZVpV?=
 =?utf-8?B?d1podjRMNkxBR2U2Sm1mbjdBRTFyZjlMY2o3ZzhqQ3hvNVYrbXJXMG9zWFpk?=
 =?utf-8?B?VUdrVDlJVE4yM0xJb2FxTE5ZNnlXNjVzTVpsalNzRVpuc3RiSXM1Rnl4Q1ZL?=
 =?utf-8?B?VFhYdmFZK1VZWDhvZ2dWam1rRVB5ZzVyYnNWaDcvMDZPTG13MmhQVHNNWW5h?=
 =?utf-8?B?K3RQZHhwaGF6YnNoMWMxOFREUHFUcng4K3dRNjlhcEhLR0g0L0Y5Z09abWVY?=
 =?utf-8?B?L1lGZEUzU3JLWVRuSTdQaEdiMWdHNW1hN0E0cHIxdmZkekFiMGdvYnJRZlps?=
 =?utf-8?B?Sk9wcEwrR3BTdGJpeTRHaEY5ZnlwM1VDZ1NpL2YvU0RDSTV3eUYxNEd3dlVM?=
 =?utf-8?B?SnNPbW5EUHpvUmJXcVhrcE14Y214L0pyWXBNMXdFRkNLZnVUeEJ0QXgzYkJR?=
 =?utf-8?B?ZGs5R2QxNTJzOWhJN204REpJQnV3YVd0T0htejlWaDNhU2doUlBzTVRUU3kr?=
 =?utf-8?B?QkZJMVpXc3dlRmNOc2wrOHNiei9rRFJyUENhTGJrUzFMQ0M3bjgwYjdUczVV?=
 =?utf-8?B?elZHaFM2RWZVT0hWQUQ0ZE9jUkgza0pKR0xJV2wxTlFsOWRpUjgxa0NyU1pU?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f161c9-944a-4e65-706d-08de2d98edc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:39:58.4873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmZm/2weZg+7ACyYyUe8D5Vm8VMwA9bu/EHZWWM8rUCfbZT15PP2cpV1lp9jx5O2d7TPxsQhd4oCgBhhZ+JNBPkKUgV/P0gNZsYhJDlkQQs=
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

Device specific VFIO driver variant for Xe will implement VF migration.
Export everything that's needed for migration ops.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   4 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c |  80 ++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h  | 143 +++++++++++++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c9b60e19cecc6..a7e13a676f7d9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -185,6 +185,10 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_sysfs.o \
 	xe_tile_sriov_pf_debugfs.o
 
+ifeq ($(CONFIG_PCI_IOV),y)
+	xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+endif
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
new file mode 100644
index 0000000000000..e9a7615bb5c51
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <linux/cleanup.h>
+
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
+{
+	return xe_pci_to_pf_device(pdev);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
+
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+
+	return xe_sriov_pf_migration_supported(xe);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
+
+#define DEFINE_XE_SRIOV_VFIO_FUNCTION(_type, _func, _impl)			\
+_type xe_sriov_vfio_##_func(struct xe_device *xe, unsigned int vfid)		\
+{										\
+	if (!IS_SRIOV_PF(xe))							\
+		return -EPERM;							\
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))			\
+		return -EINVAL;							\
+										\
+	guard(xe_pm_runtime_noresume)(xe);					\
+										\
+	return xe_sriov_pf_##_impl(xe, vfid);					\
+}										\
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_##_func, "xe-vfio-pci")
+
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, wait_flr_done, control_wait_flr);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, suspend_device, control_pause_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, resume_device, control_resume_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, stop_copy_enter, control_trigger_save_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, stop_copy_exit, control_finish_save_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, resume_data_enter, control_trigger_restore_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, resume_data_exit, control_finish_restore_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(int, error, control_stop_vf);
+DEFINE_XE_SRIOV_VFIO_FUNCTION(ssize_t, stop_copy_size, migration_size);
+
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
+
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
new file mode 100644
index 0000000000000..e9814e8149fd5
--- /dev/null
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VFIO_H_
+#define _XE_SRIOV_VFIO_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct xe_device;
+
+/**
+ * xe_sriov_vfio_get_pf() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev);
+
+/**
+ * xe_sriov_vfio_migration_supported() - Check if migration is supported.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ *
+ * Return: true if migration is supported, false otherwise.
+ */
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
+
+/**
+ * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will wait until VF FLR is processed by PF on all tiles (or
+ * until timeout occurs).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_suspend_device() - Suspend VF.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will pause VF on all tiles/GTs.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_resume_device() - Resume VF.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will resume VF on all tiles.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_error() - Move VF device to error state.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Reset is needed to move it out of error state.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid);
+
+/**
+ * xe_sriov_vfio_data_read() - Read migration data from the VF device.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len);
+/**
+ * xe_sriov_vfio_data_write() - Write migration data to the VF device.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len);
+/**
+ * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid);
+
+#endif
-- 
2.51.2

