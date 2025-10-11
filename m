Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7892FBCFB6C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1410E110;
	Sat, 11 Oct 2025 19:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXb1WHsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810A310E112;
 Sat, 11 Oct 2025 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211602; x=1791747602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1mDyQ4U3qLj4Ithi58w+EiVOp0fRR150GgSSeOrspSc=;
 b=XXb1WHsXXmQxjkcDU3TwvBwNs2WRkZG0UxRgzRvEyGZoN1tcxohx3PW6
 zulA5bzXma+fruFihv+WvUFun2A0fVuW/17tTW18tmpTYjTnVi01D91Bf
 FW76+2P7sdGRkftJEB+Xdbx83iOe8toCb7FQwLTj9+78WcINEqnMUrFO9
 +6YJbBGiX+ZrtmBM7xPMBR1XDgwNrwoR7QqQSRq76F4jUbHH5Qf0TJuT4
 UGzzAmpNoBJ6/7WBou0kjVWBwWXN7EfOMXaaEIiyxiPrA1wJIPugX6Wrg
 NVEs2ug6WuqPzmg4hMxJyzlJxBSV/CISupSUvvLBHQvb7CMjmz1in8qWY A==;
X-CSE-ConnectionGUID: 8A9WknIeSrmnflHAlRQl3A==
X-CSE-MsgGUID: F0pg3dP8RE6n8dQ/anDd2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62294674"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="62294674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:02 -0700
X-CSE-ConnectionGUID: nn73pIuWTeuT3El2Lsk2eQ==
X-CSE-MsgGUID: KDqOmeQlRga88AD4qOl0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181252744"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:01 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oerfvvPXKPhhanBHWzj4Ibhbwz8QSrlO3znThujVkkLgII6/MozCeLHr4sOaxl6aINlReR1DYaK5TQUfi2PRtdYXh7RXnOW5rFqFMU/OrrjHmstNE0O2hjskeG/qoNoLeqnGSos1pA7HsJW0dgrBIP65zD9KI3yF2FzJpe7n0ByPsUZBsMP49oaPS7CiDXoxNfH+aV4Cd9HhYVuD0M8k0NOvXpXsLElrbu95X5dqGORbDPuawQTvtlY7/WC2mWKxY69lPWnjakUJJ7Z4Z06MH1B10+hz9YYfyuy1kIHD7zsIOoPEoCNqTQ5HikcIMPDhiEMrPymmXxvvx01fFmg6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDgTtFmSlLIm35HLWih+oGgPRFpHBnMioEKzu+jI46o=;
 b=rAyCmPJmHzmVFS6nKanEHDUkrxAFyMjN2JGEHDGwQJjCq7e5w3AIavorgiVF2HNaXnh5xsbqcpkWDT3BQlRoUIZajukyBn7HQxpGvtI0lgqIutj/zs9DlHk0lge2VwaN48+WsxKxL3rdMQDDlo1rC2evdNdKBd3Fj7W5e0pD/egXsYTDrKHareQY+0N2ab29GPXONJSiSnP5bItDfTD+WPgnoCPPOEmsK454tscpwW3VCj7NImqA8TBx+i2aZ6bZplxne4YJO4zTB7h7u8qqfwYt+fwzNvm77562twOIIUZAvncMHD3zfGQmEB27kQJEJNVTZcVg2YiaK7v+AV0OCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:39:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:39:59 +0000
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
Subject: [PATCH 01/26] drm/xe/pf: Remove GuC version check for migration
 support
Date: Sat, 11 Oct 2025 21:38:22 +0200
Message-ID: <20251011193847.1836454-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0ee0c8-5124-4011-d122-08de08fdf6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHpNUVdTRmFhcGJ0dTN0SkZBTTJqc0h0L1hFdmxiMXRmV05seGttLzlKU1dV?=
 =?utf-8?B?TkhSRFJxaXJ1SGFNYVUvY3laWUtHU3REYXFGTGdkYlFXaHFUa2VhUVY3TmU2?=
 =?utf-8?B?YjlxS3J3Nm95dFNVbHNFbmV0WCtqTFg4UVlEcVM4SXlEUm1IQlVLZnVLTldu?=
 =?utf-8?B?SmpVeUtQcXlpQXo4djFXWGVvSlFqaGhYeFBBTk9kaVFWbVZKQUtDR2ZtM1dJ?=
 =?utf-8?B?Smt5ZTkzSnhoMFlKNXpnMy93Si9LNWczcTl6KzZpR3VCSmF1ajlvcXU2b0Iy?=
 =?utf-8?B?QmJCTStLRG15NngybUhrdkQycXl4eHRpcHlNMlpLMmJvazNVQ2l4Zm56NjVz?=
 =?utf-8?B?NkoxVGZVVEhRaUZqSzdKZG1oSzJBUnVCdWgxbXZhM1NVMzNGZGZnYkZLTk1y?=
 =?utf-8?B?UTk0eTMyUEJOdmU4UXlaaGp2cU1SM056TVBHQWdtbWxURFVLZ0N1U2JyeitH?=
 =?utf-8?B?Q25Rd2kyOHZ0enN0S3J0VkVpMlVjZTRaNm15NmNkNVlRMDZnRHFUUWxZdzZQ?=
 =?utf-8?B?NjF1QVZKaUtWbUdwUlQvOWV3c2MyL1pqd0VaK3dLQmVSclZpb3liK0JnN0ZG?=
 =?utf-8?B?QW03Nk9tM0U0eGEwUVFwWk5ReWdobXpWeTZSRXRGRnZKaTg1NzNNZWhlQzkr?=
 =?utf-8?B?UHNuQ3AxU25UendCeEhxUUZDYjZKZWFlWEY2V1VPVmszNlFnbmYyV3pKMDdx?=
 =?utf-8?B?OGthbnNBWmc2NTBOS2pMZmtLTFdTM1Z3UFo5c0FBbnQvL0xndUdWQXlLRlBq?=
 =?utf-8?B?dXl6dThNRVo1dnUwZW1nK2h2bGJVN3o3R0RqYVM4MmN6ei9OQ2luWHBqNGl4?=
 =?utf-8?B?SUZZRWdoS0xPTlYyaU5oQmsvclJwZ1puYnNpa3pOVy9BOTJKUnk3U25PTDYx?=
 =?utf-8?B?SGRxVDM1RkwzNWxpUTQ4TTF2c1dtK1pTTy9XMFM5Mm5pdU9ucE5rOFBjbjli?=
 =?utf-8?B?U1RSZnRybzJNbWg3blg1MWoxWVI2bE1YYW5SdDR6UEJMUWVnRWpkUGkwVDNk?=
 =?utf-8?B?UDBpcTlueHorUkNpL1lKZHpsd3BDVkY1aC91anRHZk9GVElsNmxLMEpPNE8y?=
 =?utf-8?B?UVlRSjJhS1p0dG11bFZYaE8xOHd2VnFhQUZsUzJndjlQR0g2SjdIbStyeXky?=
 =?utf-8?B?VVNIRnpNK1IwMFZrVE8vVnNycGdESlZEanBIWWs4SUhGaGNZS21CZGNhSGlk?=
 =?utf-8?B?bjFSYXMxMTRmTWZXRHd5ckRrUTVtTVJlRUNvMnpHTXRDdC9jMm9RVnFjR2Qy?=
 =?utf-8?B?d2NyR2lMUExOdzVubmRlMlFtUFJPSiswY054bndvaCtGeS9qcVlhcFpUNDZJ?=
 =?utf-8?B?WVlybEg5WWFpZ2IrRmoyWkgxUXZWTXZ0emdOR1ZHMUpXRXJ2VEQwTis4bTFk?=
 =?utf-8?B?K0o5Zi9qanZiUWJKS24yT1BWT00xQWt0eWdVbXpkZ1htb3A2N0FteVZSTmxX?=
 =?utf-8?B?WEQ1cmtoWk1PcTlCYW5YM2Jqam9EL2lpOUFnYjM5VnRTTmtWNmpoOFhTeWQx?=
 =?utf-8?B?K1piYkx4dEhuSEdmYnBUYmtJdmxGQXVlZ1k0b0xLR0RkbU0vRXBCdzhUTXZo?=
 =?utf-8?B?dS9LVVNBL0NiS1ZmeVRuZVc4bkUrbTN6L2RmeTEwVEo1Uk1IZytKRW1GQmlY?=
 =?utf-8?B?ZnM5aHkrNmgvcmJjajZ1WTRZOEpJUEtaYUkyTUFsYWhVclNOTVNObnJueXpz?=
 =?utf-8?B?ZWlsdzlLMUYvM1RCTTFDU1lFZGduUFZyaDFzRHFkWjM3T1dGYkNmWjQxWjIx?=
 =?utf-8?B?RldYdGVXTVc0bkVRcnFYRkFydGZqSGh5QVdzL1ZGYktkdUIvNzcrK2JEWFFq?=
 =?utf-8?B?bDNycUs3blBXUldmelMwVkwzTW1DSDkxSFJQcUlCUS9UV0RramJKOFNPTVZz?=
 =?utf-8?B?c1FKeUhlYVIrRnZpZElvd1hCbVhtRWVJdnA4bXhvdU5XKzN2bU84VTlPd1Nr?=
 =?utf-8?B?TExONVd4S2JsUTB1cXFEakppS2pZSG8xWCs5czJCTDZkK3llc0dsZWNKUmhi?=
 =?utf-8?Q?Ni1RST4BXFPbI2ooZs1+0O2dWUV4jo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE5HdVVkbjdoUXB0UFlVRXFOT3Nta0xmRkRWb2o3TTgrSFJaV3ZoUmxaUFd0?=
 =?utf-8?B?ZDJ3UGwwVnRkUzBWeVpSRmlMeUlyZTczWUpSVEF1ViszQW5ZVDVReUpXVTds?=
 =?utf-8?B?LzA0MStwTUFYVHhHYkk4eFpDTTM3VEUwdXdNa1VaRWtSelVSSkpjaWtZRDMr?=
 =?utf-8?B?N1ZnZjdYVnBNc1JSK3pGcWs4SG52TE1hMUJnd3BZYzc0cVVwT1RBOFF3b244?=
 =?utf-8?B?NE1VZDVhbFVtTWEzSW5NY2FNMXJkVndLVklWK2FoMGJYNDJ6SDZDSTBHQXl5?=
 =?utf-8?B?bVRYcE0wUnBaRUNWWlQ0RXZKU2Exa21KMHhid2NHR2JlS2l4a2doZWRoUFZs?=
 =?utf-8?B?ekZ6VERQYkE3U2poVC9MYjJnZzZCSTRVbVFiMnlvbzQ1d1pTRlFYY2NERXdE?=
 =?utf-8?B?ZTJ6eVhBUU14WWIzN3pMR0FTenE5WTBZN2dyNmptL3djalFtTlgxZVJZbE9y?=
 =?utf-8?B?NTl5THlzQlVDZXdvU1FJUEZmSWdtOEFJV21PeEhzVWk5ZHZtV2s1MlFRV3ZD?=
 =?utf-8?B?aUw2R3RJYkdVVjdBTDNNTU9OS3duNTdMOFVqMHhHZnY2ZEdHR3RTYUhzUGgr?=
 =?utf-8?B?K21pZmkrQVAyamY0NUU0a2N5THVHNnhqRWN4aUYzRmE5eVpmQjBZVm42RTQ2?=
 =?utf-8?B?YVpFTEJJRGt3WGMvUkhWSWJhUWtBdFR2ZXVFUlZCWFhmejJlZEhycU9Rdlpq?=
 =?utf-8?B?MkFYUmlWUmJmR2E0VDVJb1dqVTg5c0lMZjNUSHY4SWl5UjI2TDZvRVVsT3lj?=
 =?utf-8?B?enpzeGxja1FPdWlEL3htQWN6SitMcDVOaDI2dTh6YWhoanlPQjFkZkVDNFN4?=
 =?utf-8?B?eHBVSld2SUxRR1Y3OWVsVVdaNWRubXBha0lPOWxtdDNzQktqUGgyUlZ3d2hE?=
 =?utf-8?B?WS81T09ScUpNZWdHaUJsRHF1eG1xbDRJTDJYejVMSFpTRE55RGhReXdDOUgw?=
 =?utf-8?B?TXl4bmR3L2M2TlFpNER6cWoxelRXVThUSTNqbFlvR21aYkNibExOT2hBQ3JV?=
 =?utf-8?B?TlRJanZVdXhxampid29ZazdkTzFqVnExd3JZdWtzSnRmWk5WcUx2NktKUTRv?=
 =?utf-8?B?WUFNVmVQOGdXQnZKZmxHY2ovcHowSWg4NFNtREZKaTlleHd6TmhlQTB1MUp0?=
 =?utf-8?B?RjA5T05uN3Q5dkV0R3VLc284NjM0d20rZldyK3RqOFh1K3dzblBsMmNUVkE2?=
 =?utf-8?B?U2F0SDlaeG8wNGdmOUFVK0h4MUdwNGY4YlF4YWVnNzMzdDFYdW82NUVaN213?=
 =?utf-8?B?T0lGNEZCL05lUXJUOHhPTnVkYmpGN2E5UEw0ZmpMejg5MTJZMzY5SGF6RStQ?=
 =?utf-8?B?SlAwdTNxeUJVTGxsZzRpL1BEZGh4OEdhVU9lTm9UL3Ftd2NoNVVsY254bXRN?=
 =?utf-8?B?ektoa3dpRG9TcWw0WGowOThWTmU3aXJmVFdCZmNpUHhTbzhpSkVManlNeW40?=
 =?utf-8?B?V0RxaWhPYk1HZEpucmd4UkZpVUsrWEdGVlVLWnZuOG5pbE41NWJyYjZSaDVz?=
 =?utf-8?B?U2F3VFFOUlpRNWMxSzhHLysrQTRhVTYyVnRwSm85SkN5bGw3S3dQYVNLbm1D?=
 =?utf-8?B?RENCSkpMejYzYUx3a3NzWmJURncrV2xXdHk0SGVQUFdFb1FSdm1sM1graGs3?=
 =?utf-8?B?cnAvZWcwRU03VVIyRzE2Qk9oMEYxR3dTZElGRU1XcWx6RjN1VzcxQVZTN291?=
 =?utf-8?B?QjRpcFMwL3RRYTBWUHFZN1l3YVlhb28wM1l6Vk9RUFNXVHVmaStwTTNycEJW?=
 =?utf-8?B?MFVackRCMUpKdllVZUw1dzhqUXRGUGt1ZTBjU1lYVUxsM1JEb0RoUThhYmpV?=
 =?utf-8?B?MUJCNHlVcXJNdU1Vc3NOZ29PeW1odDQzbHp6TEJDSFZOQzFPNEg5Y2l4TEVt?=
 =?utf-8?B?Qk5PTEZaU29wVGgybGdGbzFIN0xIendBMU4vMWw4V3FkNFpOTWdaT3gvU1M2?=
 =?utf-8?B?ZGdUVGQrVjF1VG9LUE1ra1RzZ3BYVmZOc2trWWQ5cnBmRnkwTEUwS20vbWJz?=
 =?utf-8?B?MGg1R1lEUnM2eU9qcThGczdTMDBQVytzeDA4eFR3dk4yS2Z0MEVPRHgzQ3lC?=
 =?utf-8?B?RHZ0VFlDdW9tSS9FWGVHTVhFS3A0S1Z2ayt2K003SUV5ZFlMZXZ2VUIrWUNT?=
 =?utf-8?B?WGFUOHdTOXh4MERKZHpFSWJiWGJsS09wRmRYZTJuN0w2cjhMTUdGZjZnNW1y?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0ee0c8-5124-4011-d122-08de08fdf6a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:39:59.2255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZzOWEAx9ulvThyrZlQTThFfBi6M3jYJF8nOH578evy/z0q/0bfE//YpTjJZoQ0mXhJgGz/ZDVXpMcs5OboE/CNyhe6BsXv7ZBSDOQ5M2ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
version to v70.29.2"), the minimum GuC version required by the driver
is v70.29.2, which should already include everything that we need for
migration.
Remove the version check.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 44cc612b0a752..a5bf327ef8889 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
-	/* GuC 70.25 with save/restore v2 is required */
-	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
-
 	/* XXX: for now this is for feature enabling only */
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
-- 
2.50.1

