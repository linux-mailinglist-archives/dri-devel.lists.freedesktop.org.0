Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F192BC37AB7
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 21:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1433310E303;
	Wed,  5 Nov 2025 20:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzaAtI3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745410E08B;
 Wed,  5 Nov 2025 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762373847; x=1793909847;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qSZ1s7kldgCuLo6ODg3aGXW7jRtSFdVhuWfqZXQrnuo=;
 b=AzaAtI3LgCGvbfZmKPkEByFn9fTS8cicBwExsjBXWqeLGkuyRXVXmuI5
 FXTro0/hoOQ6yGux12eyv+Ud7dh4h21d02aci0wKI3wJJicy7CWBZOvbG
 yQlpmSwk8cFuWkZRfZR9eZc+RWHrixLNDdiMghZsekysyOPcVpLr74fVq
 uM4aqSFU1uEbatawMC94yzcokIkBnjp2nc1ixoDz3Isk/ayWiju+MXZMd
 HvFyprOAzVaOd6sJqzQIR2XBe3gLxYYWz/5uI4KHq8iIXurswxEUyw9M6
 lU+nuQQ8DN3VN4U5glGjcChieC0OuwV2HRa7E0ttbmP69rONXt9o3EgrK w==;
X-CSE-ConnectionGUID: +zhL+zB0S8SksvPvzmtixQ==
X-CSE-MsgGUID: PTqwXtP9ST2X2ZVNHSNn6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64599466"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64599466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 12:17:27 -0800
X-CSE-ConnectionGUID: 008RiwVnRFiz3XtpVAsQAg==
X-CSE-MsgGUID: +aEc8Ji+QD6xfvw052x6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="218323442"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 12:17:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 12:17:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 12:17:26 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 12:17:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If2zJsSG0B2ui2Oz5oiO98lLAEXcQtKCUywa3lXufgR1HvEqtJmxotZdHNuYLr8Qa5LLUoIdoslwalM1agS4tQsBpPGcD5kkDF6eWNBBQa2xWDxEf+2g8xIo8CXi7JiB7QD8FjcStgXzv79VMmvuKT+3DfevMKj38YiOiX5h0Z4KpfCfEMJcxkkr34EkJqFl0ehYmJltKRkUc2yddEBbilZVDv3ckuunq9H/1nOo0oku+ELHZfj1eUX79+q3voEZCcIJ80miznr7KJ2uCms+XCnaR7nV9ZUSR/KAARrZiWth5nfCXYnruj7ACwf7G4hgDvJ/WjTekyqC85lp/mMP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR0n0lwdJleSm6OT0hOoCM/jRorH91IQJiG5ssnvYdc=;
 b=Rcg7NVqVJgJuGifxtyuMtDIchwAG1JtWf36/hi1nOGxga19TH56R4qEcyMEvYZLotJ/o/UfLfooy83GGrAK4LfspQ2l+2wXE6V+/BGhlCkvYNjqsxbosusK+gOXbdE8btgImq92zM3DKRfzRuEAia/JIDHzT2nocaEFGAuubejAdhKFMJSbH6dMl0ETdt34RylCDet3BBU9YpUjkfutWDdQ7aSzPDQaZI50sJHeMwFsfmLOEqdVywfW/0kdlmzLQ9/iUAsFThGYXJWxf8H3u1zhyVbDwG+ibLybzSXnQpiRb7gJkKve/1Tysapgd/gJMxP1rfa+pD3j1T2egKKw7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 5 Nov
 2025 20:17:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 20:17:13 +0000
Message-ID: <fdca0d94-5c5e-4749-8278-42ec14869313@intel.com>
Date: Wed, 5 Nov 2025 21:17:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-6-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251105151027.540712-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0084.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: e18f9426-ff37-4b47-cf0b-08de1ca84e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFV0UU1RdnlLSHl3bFRLRzFKSkpLRDJPK2xNL282aEhoL0EwY1o5N3RVLzEz?=
 =?utf-8?B?TThqaVhKbko1QUVRN0d5dEFwcnRMNTFIOU1PK1BlVC90VU1xOVExOTV5NEtS?=
 =?utf-8?B?RUJObENST09FL081QWx1cGJON3AvbDZZSkFkQVZkWTdmWXA2VnVGMTlYb2NP?=
 =?utf-8?B?YmdNbkg5MVBiU0RnVnJZMTdRZ1lKNUtEWFFSMnZWRExsWW5veGxIaW1SaGR3?=
 =?utf-8?B?akxHU2dyVHNjS1NPWFRwZEJDNkNyaTVUL3BzNVVwZk5VbGdQRFhXNXh4aGd5?=
 =?utf-8?B?YWJ6aExWOC9LbGVVUnBaT3cxem50c1pyRUJwZG9MazBSdTdlaFBxd0ZuanFx?=
 =?utf-8?B?ZWxsUjVaeWxBekdXZjhMY09yYk5GSHJjQ2J5aFMvK2VhOGVoeUFXSmhmdW9Z?=
 =?utf-8?B?TXdBTDBxSWRUVGJVbE0vYmdhNy9VU0dhRWZXRGk4aEVyd1VUZnJQREZ6c0pZ?=
 =?utf-8?B?ckIvbEh5elppMkVJU1UzMyt5aVQxN3hlSEQvMTNhYUVxZGVkUGhGWmY5dGEw?=
 =?utf-8?B?cVF3QllDRkI5eEpJbUxCU2M5TzYwSXU4bTEvRzFqMUNJMmhmTlNYZG54ck1C?=
 =?utf-8?B?U3JtcmhxcDdNb2IxNG5JdXpaaDBRbnJjeVdZMXk1Z0owWE5yMUNHNnd4TVV5?=
 =?utf-8?B?US9HWDd1ZHFqOERCakxnRVVlS0RlR3M4VGY2RUhrbENZbDYwdWZSekUwc21S?=
 =?utf-8?B?OHBxZU9wZjk2SENlVW5scXpmMHR4dTJWRWZTWlg0MG85NFFaM3dtNzEzT3Zq?=
 =?utf-8?B?OWozeFd6ZkNrRkZvbUI1dExFcW03Z0k3ZGNzajJCVjJWc01LdDcyd0laSjVT?=
 =?utf-8?B?N2VHSE5oalhXQ05KVzFxU3l1cnQrQ3hTSzN6T3V3RGZJeDljU0ZZQnVyNHB4?=
 =?utf-8?B?cWFzZm94SDBqRVRqeSsxLzBOekZnSi9KMDRScDJxVXRPQ2d0SDNXWU9GWEF2?=
 =?utf-8?B?SXU5UmhkY3d4aU42cFF4c3gyak5YcGwrTmdmR3pJNFpDWlJVTkZVQjUxcXZ4?=
 =?utf-8?B?a3lPbUk1YlBJVnlXQ3dDbFJvVms0eFg0UDh5VFMwa0NPRFdVdWtFZnk2MjI2?=
 =?utf-8?B?NHp3dmlmQnY1MHNibHBxeGhZUnNseWVHNm5uMXlzRVRyM1dnUDNQQjEzNFRN?=
 =?utf-8?B?blVHdXF3WGZPNHV4UHdCOTJmejFPMmVQTk01bXVudkdBSzNvSWIrT1FuVWxH?=
 =?utf-8?B?Rnd0cVFoQXVqSmxjTUlCOEVpc3B1cUhHeU13U24yZnpHSGNOUnR4bHlTZmM3?=
 =?utf-8?B?aVNmeUFmdmNSejAwWkQzRWlhbjZkNnJ3blB2VkNuaEtzV0lBSXdNdlZqOTZi?=
 =?utf-8?B?a1FZaVJ4bGxpdWRjaGdmTEE4QkkrdXZzYURLRjVybDFlK3hjOXg0TVpDNzcx?=
 =?utf-8?B?RlBIZ1hmUjlkNzR5M3ZRS3htM2FINExCbGNDaDh6THB5NmRUZFRPeUYwcnVo?=
 =?utf-8?B?Sk0zY0lwWTRoOUhuZFNZN0w5cmUxcnhDS2p1a1JGcmp6WXFuQUZWMW1xd0pq?=
 =?utf-8?B?VTA3L2ZXWkVYT1doMUlLMlQ5d212eHRBeXhwSkRnM3JVSS9tVCtIWXo5WlNW?=
 =?utf-8?B?WjlHbklLMjg2SnhhVnpjbHgzNlJqY0NKMXNQZmNYeXlHSjVLRGJYNElHTWRW?=
 =?utf-8?B?bEtLVXE2NXdNbG1WdVh2OTNGMzVCSWErTWlNZnFMNUdRc2dlMDc4WnJXMGVJ?=
 =?utf-8?B?eUh5VEhOanozdlRCTXk1Z1NlMGRneXA3NVZSQVFqdkhiZlVzbmlIVkFXWVk1?=
 =?utf-8?B?WnRyQ29kOWxmTkhmcmliOEJON3pKb0xxTnhVYXZBNWowMG5kNDhSUEdlaFZx?=
 =?utf-8?B?dUJ2TTZGNjFQd3JmcHNXSlVVZVRVelRKQ0lZQWJ0dTI3dkNndzM2QzhZSjdS?=
 =?utf-8?B?Q2YxTXB2TzFhUDhCLzhmRkhNYTgvNmxNU1ZWWUhsdFpGSnNKSDRDMHlvdjBN?=
 =?utf-8?B?VEsvMU9zM2M4czkrdzl6ZWxzenZiV1ZYZGE3dksyR3U2b0dDNlZ1T2lia0g5?=
 =?utf-8?B?cy9XTW5ncUtObXN5bHNMOTlJSHdtVXgySnYwMnRoSThqK1JacW5tK2t2blgy?=
 =?utf-8?Q?Mji3IY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjV4UytaTmdKbi9BY04zaDdGOVMycFdBWkZXdmRGbHU3TktZTVFvT3o4d1ZC?=
 =?utf-8?B?Z0R2WU13ZGsxWTcvTkJtOVZzaU15c1poV1RydFZlTlpWOHhoeGkxYWJha2JY?=
 =?utf-8?B?MTVXYWFZenN0S1A5OGdZOFpMcFNKUmZsQzZ2Y0tQaWg0M09DT1c5VlBkRVdH?=
 =?utf-8?B?dHRndU5lRCtVbkRHZE1YQlZhOWI1T21JcFVmUFRJR0Irck5pL1k3a25LUmFZ?=
 =?utf-8?B?N2Q0L3lTWWtJY0Z3T1QwWnZOcEw3a3hKNzdYZWdHeHphb0IvYmY3d2ZnR0Ev?=
 =?utf-8?B?MGNtTzZ3Y01EbzBwZWZNZkszWkpXZEx5eDJ6SzhCb2UyL1d1SEYwYlZJL3dw?=
 =?utf-8?B?clVMTlB1V1RyM2RldmpZT0hnZWtpdFptckNHRE1KbFErMWo5MnRvYmNpQlFz?=
 =?utf-8?B?M2tOVm9qb2ZpU3VtRlAwYnJXVWoyaEpBcUg4TVpsQ1NpUlhQYUhxb0xRbngr?=
 =?utf-8?B?a0hNU1QxQzd4S0hCcDNBdmxlWGxZUmsrVHRwNWM5UVBtMDYrTHhVaWlsZ0lE?=
 =?utf-8?B?OHFmSjlVOFNpa2ovUDB0ci9WK1lIMXhwc2t3T2NjQktkTHdXZk1TOHVGQXg1?=
 =?utf-8?B?dkpXMUNnZU80UllHS0dnMStzS0hLMmtHanZnU29ZUi9HaVJOM1N1OFF1ZUlk?=
 =?utf-8?B?dlpjb3hDYkNJNWs5ZEVDYW0rVHJKL3orWmJwYURhckU5akdGdGpwcTVYYThk?=
 =?utf-8?B?TWFpenh6RmNHa2Z1eVV2UEVtMUVaZWpRYWtmZ2R0V3lpclN0Q0xFSXRkaURO?=
 =?utf-8?B?VUJYV0NyNlMxWkRkWmNwdGRrRVhKTHJNek5vdEY3d2l4cTVYTWlhUjVqN0ZY?=
 =?utf-8?B?d3ZNZ0pQT0FFeVVlQ2VrYzZRZzFMaitBZHZabWNBSVV5V2pvL0lkN2hHUXV2?=
 =?utf-8?B?REFaajAvM1R6WmRmeHdwQXVKVmo1RHpCeDFGME53YzlraVFVMmR1MFNkWDFR?=
 =?utf-8?B?SkxMWWVzN0RUbjBpeWtFbjhBc2ZrRGJBTENsQXFHeTNVcTVVR2ViYWhBVjRM?=
 =?utf-8?B?ZDBWbmZqRkxYZ1hlUzRFWjlWVFdnWnJVNUd2bFVxLzVrU0I1TTRFTWovVGp2?=
 =?utf-8?B?UHFZOVVJU2pKQzF4QVdGQVlGRVZlV0pMa2J4MTdvZWN4Ull2NitRaVIyLzJD?=
 =?utf-8?B?aWVrb1BxdDJ3UkZMQWZKM2RYSmU1QnY0UitXa3ZiVnNPNnFvOTNvRTVJV09P?=
 =?utf-8?B?azdCY0ZWVlRjM3p5TXNNYXRzeVluS0wwRGtVRTFnWEtXNHpDKzZzc01rNzhs?=
 =?utf-8?B?RVJPS2ZwRzUzd0NQVFFlQ3RwZ2hZKzl3WGxzMURLN1NaVUZURTZ2WURWNS9Q?=
 =?utf-8?B?R2pES1RKckxhRlNjdFdub2xGNGFFS01yRFhwOVlxbjY1MW1yaWhuc1hKWVhl?=
 =?utf-8?B?K1ArUFI2NEFHZVRWa3BpSnBkeW1LaFcvelQ5VkZNcE9IdHowNm4xZHlrMlky?=
 =?utf-8?B?RGdZblFGSlI3NU9ZM2VWMS9SNHk0QVI4ME5RMG9sREZRREF2cFBkWlNnRTNU?=
 =?utf-8?B?cXhwaGF3L2l3Wkg1ZjdlajJ2bUFneDdWMFJJaXNhdzMvNW1yaHdPT1FYeEdu?=
 =?utf-8?B?M3dJQnZjRy9mTG1MemtKWStMeEZCdXMySjlCY1ZYVTNwUnFEYndOeGtlOGdI?=
 =?utf-8?B?NGVOd0xLWi9sMnBlOVpMNytlTStFVjZ1cjhvMGI4dUplUUlGM1cvbXhKY0o1?=
 =?utf-8?B?aW9tS1pBRkZPeTdPY1ZVWnhsMGFaaWgvcnNhS3ZYRHRuODRkNjFCNFk0UVRX?=
 =?utf-8?B?NlJNL0w4UisrdURWakRyWDgzekZ2czliUklGeTk4enlXeG5XNkpLelBJQlBq?=
 =?utf-8?B?d1ZpYUlBbytNNDE2d2VZTGVqRE5OOE03RHRQTmZWMzl1cGxZd1d4UTM2bzVj?=
 =?utf-8?B?K2tqY0dlalNMU25TdWl2S1ZraWV1RmEyMW1xdzBFQkFlMlcwVnFheDhKc1R6?=
 =?utf-8?B?MmsvTXhWTG1sZHV5TzRYaHU1MXN0RDJQbFR4WDlsUEFkT3hkb2xoSFFnR2VP?=
 =?utf-8?B?RG5pQjFnV0tKckowQjhZOVh3KzdiOUNqRG56U0c2YzE1TWNpZDY1TC8wdkZk?=
 =?utf-8?B?RHloMk83NUpLMnF2Wkl4ZHBQOXR5amEyZ3M4RW15U3Rwd3d6WVlZL3BLNGpR?=
 =?utf-8?B?RXE4OUh0QzF1dllnb3R2ZG9WTk9wKy9LaEtlaG1zSFgyc2llSTcwSy9WQkwz?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e18f9426-ff37-4b47-cf0b-08de1ca84e3d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 20:17:12.9485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1Gbhq2ctrk2UZgyx+B0WDzk45jcpn4qvfW/NQBSptGEGfYeHqv1BbgLH7HrmuRNsORiGVSBpAOK/BziaWK2MQ2TqK8ak/92zru1cxYf7xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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



On 11/5/2025 4:10 PM, Michał Winiarski wrote:
> Migration data is queued in a per-GT ptr_ring to decouple the worker
> responsible for handling the data transfer from the .read() and .write()
> syscalls.
> Add the data structures and handlers that will be used in future
> commits.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 310 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 199 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 143 ++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  47 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   2 +
>  11 files changed, 741 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index a571e1c02a3b4..db57f9d9b491f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -19,6 +19,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSE_FAILED);
>  	CASE2STR(PAUSED);
>  	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_PROCESS_DATA);
> +	CASE2STR(SAVE_WAIT_DATA);
> +	CASE2STR(SAVE_DATA_DONE);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
>  	CASE2STR(RESTORE_WIP);
> +	CASE2STR(RESTORE_PROCESS_DATA);
> +	CASE2STR(RESTORE_WAIT_DATA);
> +	CASE2STR(RESTORE_DATA_DONE);
>  	CASE2STR(RESTORE_FAILED);
>  	CASE2STR(RESTORED);
>  	CASE2STR(RESUME_WIP);
> @@ -804,9 +811,51 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  	return -ECANCELED;
>  }
>  
> +/**
> + * DOC: The VF SAVE state machine
> + *
> + * SAVE extends the PAUSED state.
> + *
> + * The VF SAVE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    save          (SAVED)    (SAVE_FAILED)                  :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......SAVE_WIP.........  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |            no_data       /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----consume               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_full----->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> @@ -821,20 +870,58 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_wip(gt, vfid);
>  }
>  
> +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_saved(gt, vfid);
> +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		return true;
> +	}
> +
> +	ret = pf_handle_vf_save_data(gt, vfid);
> +	if (ret == -EAGAIN)
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	else if (ret)
> +		pf_enter_vf_save_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
>  
>  	return true;
>  }
>  
> +static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> +		return;
> +
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	pf_queue_vf(gt, vfid);
> +}
> +
>  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
>  		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
> @@ -842,6 +929,53 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true if all migration data was produced, false otherwise.
> + */
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_check_save_failed() - Check if save processing has failed.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true if save processing failed, false otherwise.
> + */
> +bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> +		return -EIO;
> +
> +	pf_exit_vf_save_wait_data(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
>   * @gt: the &xe_gt
> @@ -887,19 +1021,63 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> -		pf_enter_vf_mismatch(gt, vfid);
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
>  		return -EIO;
>  	}
>  
>  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	pf_enter_vf_saved(gt, vfid);
>  
>  	return 0;
>  }
>  
> +/**
> + * DOC: The VF RESTORE state machine
> + *
> + * RESTORE extends the PAUSED state.
> + *
> + * The VF RESTORE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......RESTORE_WIP......  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |           trailer        /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_empty---->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
>  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> @@ -914,20 +1092,64 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_wip(gt, vfid);
>  }
>  
> +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> +
> +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_restored(gt, vfid);
> +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
> +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
> +			pf_enter_vf_restored(gt, vfid);
> +		else
> +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +
> +		return true;
> +	}
> +
> +	ret = pf_handle_vf_restore_data(gt, vfid);
> +	if (ret)
> +		pf_enter_vf_restore_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  
>  	return true;
>  }
>  
> +static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> +		return;
> +
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +	pf_queue_vf(gt, vfid);
> +}
> +
>  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
>  		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
> @@ -935,6 +1157,58 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_restore_failed() - Check if restore processing has failed.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true if restore processing failed, false otherwise.
> + */
> +bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +		return -EIO;
> +
> +	pf_exit_vf_restore_wait_data(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
>   * @gt: the &xe_gt
> @@ -1000,11 +1274,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
>  {
>  	int ret;
>  
> -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> -		ret = pf_wait_vf_restore_done(gt, vfid);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = pf_wait_vf_restore_done(gt, vfid);
> +	if (ret)
> +		return ret;
>  
>  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
>  		pf_enter_vf_mismatch(gt, vfid);
> @@ -1705,9 +1977,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
>  	if (pf_exit_vf_pause_save_guc(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_save(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_restore(gt, vfid))
>  		return true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 0286536375d17..c36c8767f3adc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -16,8 +16,14 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index c0ce05818e24f..0bee910bdf07e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -32,9 +32,15 @@
>   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
>   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
>   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
>   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
>   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
>   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
>   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
>   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
>   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_PAUSED,
>  
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
>  
>  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
>  	XE_GT_SRIOV_STATE_RESTORED,
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index ca28f45aaf481..d9ca9ea737dcc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,6 +7,7 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> @@ -15,6 +16,17 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
>  
> +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> +
> +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return &gt->sriov.pf.vfs[vfid].migration;
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -382,6 +394,178 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is empty, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is full, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: the &xe_sriov_packet
> + *
> + * Called by the save migration data producer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the save migration data consumer (userspace), that is potentially
> + * waiting for data when the ring was empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_packet *data)
> +{
> +	int ret;
> +
> +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> +	if (ret)
> +		return ret;
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the restore migration data producer (userspace), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *	   NULL if ring is empty.
> + */
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_sriov_packet *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data)
> +		wake_up_all(wq);
> +
> +	return data;
> +}
> +
> +static bool pf_restore_data_ready(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid) ||
> +	    !ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring))
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: the &xe_sriov_packet
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the ring is full, waits until there is space.
> + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> + * is potentially waiting for data when the ring was empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_packet *data)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, data->tile == gt->tile->id);
> +	xe_gt_assert(gt, data->gt == gt->info.id);
> +
> +	for (;;) {
> +		if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid))
> +			return -EIO;
> +
> +		ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> +		if (!ret)
> +			break;
> +
> +		ret = wait_event_interruptible(*xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid),
> +					       pf_restore_data_ready(gt, vfid));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *	   NULL if ring is empty and there's no more data available,
> + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> + */
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct xe_sriov_packet *data;
> +	int ret;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data) {
> +		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		return data;
> +	}
> +
> +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +		return NULL;
> +
> +	if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid))
> +		return ERR_PTR(-EIO);
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +static void action_ring_cleanup(void *arg)
> +{
> +	struct ptr_ring *r = arg;
> +
> +	ptr_ring_cleanup(r, NULL);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -393,6 +577,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> @@ -404,5 +589,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> +
> +		err = ptr_ring_init(&migration->ring,
> +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> +		if (err)
> +			return err;
> +
> +		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
> +		if (err)
> +			return err;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddbb..b29d34a835b71 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -9,11 +9,25 @@
>  #include <linux/types.h>
>  
>  struct xe_gt;
> +struct xe_sriov_packet;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_packet *data);
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_packet *data);
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
>  						char __user *buf, size_t count, loff_t *pos);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 9d672feac5f04..84be6fac16c8b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/mutex.h>
> +#include <linux/ptr_ring.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
>  	} guc;
>  };
>  
> +/**
> + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> + *
> + * Used by the PF driver to maintain per-VF migration data.
> + */
> +struct xe_gt_sriov_migration_data {
> +	/** @ring: queue containing VF save / restore migration data */
> +	struct ptr_ring ring;
> +};
> +
>  /**
>   * struct xe_gt_sriov_pf_migration - GT-level data.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index a64a6835ad656..812e74d3f8f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
>  
>  	/** @snapshot: snapshot of the VF state data */
>  	struct xe_gt_sriov_state_snapshot snapshot;
> +
> +	/** @migration: per-VF migration data. */
> +	struct xe_gt_sriov_migration_data migration;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 8c523c392f98b..ed44eda9418cc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -3,8 +3,36 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct xe_sriov_migration_state *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.

nit:

    * xe_sriov_pf_migration_waitqueue() - ...

> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: pointer to the migration waitqueue.
> + */
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> +{
> +	return &pf_pick_migration(xe, vfid)->wq;
> +}
>  
>  /**
>   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> @@ -33,9 +61,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
>   */
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
> +	unsigned int n, totalvfs;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
>  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	if (!xe_sriov_pf_migration_supported(xe))
> +		return 0;
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
> +
> +		init_waitqueue_head(&migration->wq);
> +	}
>  
>  	return 0;
>  }
> +
> +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid) ||
> +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid) ||
> +		    !xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct xe_sriov_packet *
> +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_packet *data;
> +	bool more_data = false;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> +		if (data && PTR_ERR(data) != EAGAIN)
> +			return data;
> +		if (PTR_ERR(data) == -EAGAIN)
> +			more_data = true;
> +	}
> +
> +	if (!more_data)
> +		return NULL;
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * If there is no migration data to process, wait until more data is available.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *	   NULL if ring is empty and no more migration data is expected,
> + *	   ERR_PTR value in case of error.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +struct xe_sriov_packet *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
> +	struct xe_sriov_packet *data;
> +	int ret;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for (;;) {
> +		data = pf_migration_consume(xe, vfid);
> +		if (PTR_ERR(data) != -EAGAIN)
> +			break;
> +
> +		ret = wait_event_interruptible(migration->wq,
> +					       pf_migration_data_ready(xe, vfid));
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @data: Pointer to &xe_sriov_packet
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the underlying data structure is full, wait until there is space.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_packet *data)
> +{
> +	struct xe_gt *gt;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	gt = xe_device_get_gt(xe, data->gt);
> +	if (!gt || data->tile != gt->tile->id) {
> +		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> +					 vfid, data->tile, data->gt);
> +		return -EINVAL;
> +	}
> +
> +	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index d2b4a24165438..d48ff2ecc2308 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -7,10 +7,17 @@
>  #define _XE_SRIOV_PF_MIGRATION_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  struct xe_device;
> +struct xe_sriov_packet;
>  
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_packet *data);
> +struct xe_sriov_packet *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 43ca60b8982c7..3177ca24215cb 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  /**
>   * struct xe_sriov_pf_migration - Xe device level VF migration data
> @@ -16,4 +17,50 @@ struct xe_sriov_pf_migration {
>  	bool supported;
>  };
>  
> +/**
> + * struct xe_sriov_migration_state - Per VF device-level migration related data
> + */
> +struct xe_sriov_migration_state {
> +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> +	wait_queue_head_t wq;
> +};
> +
> +/**
> + * struct xe_sriov_packet - Xe SR-IOV VF migration data packet
> + */
> +struct xe_sriov_packet {

hmm, shouldn't this be defined in xe_sriov_packet_types.h ?

in the very next patch we will have:
	xe_sriov_packet.c
	xe_sriov_packet.h

> +	/** @xe: Xe device */

nit:

	/** @xe: the PF Xe device this data packet belongs to */

> +	struct xe_device *xe;
> +	/** @vaddr: CPU pointer to payload data */
> +	void *vaddr;
> +	/** @remaining: payload data remaining */
> +	size_t remaining;
> +	/** @hdr_remaining: header data remaining */
> +	size_t hdr_remaining;
> +	union {
> +		/** @bo: Buffer object with migration data */
> +		struct xe_bo *bo;
> +		/** @buff: Buffer with migration data */
> +		void *buff;
> +	};
> +	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
> +		/** @hdr.version: migration data protocol version */
> +		u8 version;
> +		/** @hdr.type: migration data type */
> +		u8 type;
> +		/** @hdr.tile: migration data tile id */
> +		u8 tile;

as in this struct we already have "xe" which represents pointer to the xe_device, as used/named elsewhere in the driver,
maybe this "tile" (and below "gt") should have "_id" suffix to avoid confusion with "tile" (and "gt") members used elsewhere in the driver where they are pointer to tile/gt?

> +		/** @hdr.gt: migration data gt id */
> +		u8 gt;
> +		/** @hdr.flags: migration data flags */
> +		u32 flags;
> +		/** @hdr.offset: offset into the resource;
> +		 * used when multiple packets of given type are used for migration
> +		 */
> +		u64 offset;
> +		/** @hdr.size: migration data size  */
> +		u64 size;

btw, it looks that this __struct_group() confuses kernel-doc:

Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'version' not described in 'xe_sriov_packet'
Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'type' not described in 'xe_sriov_packet'
Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'tile' not described in 'xe_sriov_packet'
Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'gt' not described in 'xe_sriov_packet'
Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'flags' not described in 'xe_sriov_packet'
Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'offset' not described in 'xe_sriov_packet'
Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:72 struct member 'size' not described in 'xe_sriov_packet'


> +	);
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index b15d8ca2894c2..d1af2c0aef866 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -24,6 +24,8 @@ struct xe_sriov_metadata {
>  
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_sriov_pf_service_version version;
> +	/** @migration: migration state */
> +	struct xe_sriov_migration_state migration;
>  };
>  
>  /**

otherwise LGTM

