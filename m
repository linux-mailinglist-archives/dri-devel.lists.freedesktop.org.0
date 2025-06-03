Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD0ACC641
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E2410E8DE;
	Tue,  3 Jun 2025 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9pLHFGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAA410E70C;
 Tue,  3 Jun 2025 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748952959; x=1780488959;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=8Zy/8PpNucBso1LCcrSS18L7Ig3shDJcxs34UMNg+UU=;
 b=P9pLHFGX0uZw327SQdUyHbe75cKSmimse8yvFAj6rcjRghDOE/QlJxEw
 WAbiF4gvzMWbwLhmPiNkwhGKFWXMOwTjw+gkOH5LyzYCwcfPaC67/rE5n
 u+LtlWNU+OMF+uow/i1xkmjWSR6pZUBE4+1WQln+odRPRUI5VnA8x9wBo
 YiawwKSfoCtx81tfT1j/jrRoiHcdTqfEW7brtL7mjHVuSKkx2ur+hW7Qg
 W/uEJuyIYszgmIQORNy5FAUXiBgK2cpFOORH4aXIUpoA5zu1i2vlCAN2q
 A0x7R/zMk57puHGM2UMg6NPWrSELsQ9FxUrlFuRaXOid37gsYrdJqvJ5a w==;
X-CSE-ConnectionGUID: XP26RsBFQcOdS8b1oK5Q/g==
X-CSE-MsgGUID: i2GXvI0kQ8Ovjza/sCR6Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50862436"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50862436"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:15:54 -0700
X-CSE-ConnectionGUID: lgehiAhiTqyEFZE5PI8vzg==
X-CSE-MsgGUID: gZm650rhRJ26rlXgJ9a4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145814666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:15:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 05:15:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 05:15:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 05:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TE28xMCsNtINeP2fm2ESR5l7slOBqa4tY/FvMquy0PLnmqmIggba3QGwf3ACW9gAgHNjORd15vQXlOx35G1BHByG00DiklMLPUekVoO026EqPYkprGqBsxWzv1meDWUfB5i+RNMon8qqcHq4VWtLy42LCHBnlb/q4GdtP9xrjsKwbnMerpgqwkLTAVgXe+TqLI05VpL6nOQ4/DxVbUfpFk5PGPzCoXKyK+oybdFDWKaNTN+H44fQxNCOGEgbEabBfUg+lVSPsagcOE2BUHnzQPs/Zl0NNFvpbUB6/az4NaArzPYzDcc45TzpDX9mkEMBQMTzdzefDXBXjpMhX6OJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+T8Ej1V5+ol9tkA2HKZablscOGwyZLQNmWVlTSs1HY=;
 b=WmAzwR9Cx9FU2O2F/Rplb08MKaeZ96JFfEs4K24mjtSqmnFljEJV1rh10Y76FmXcfgabpNH5jJNaPpav3xtnAFOJjdAnbDRLVJedEd8g18YwAcSOwYNfxiKCGlinJ6FQcnzswtwdliLOOaSSXmOLRMiXoPXJhCu4zAryArCP5E0whPLhxcbjOSH3SZ1cXAUNldWk2GYbkY+2z2zP2+ZX8z6lCgzICWcG2v/GjoM5s1xqUKigjaeFNZB7AVIg/ZMwpAB7wQvIM0LoraZo68HUyOe94fh9LHOIfA8z3Ju2Y4zlorBLptjww/30YwgE3SfOXOI7f2hqLAMVDJh8CgdNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:15:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 12:15:51 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 0/4] drm/dp: Limit the DPCD probe quirk to the affected monitor
Date: Tue, 3 Jun 2025 15:15:39 +0300
Message-ID: <20250603121543.17842-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0233.eurprd07.prod.outlook.com
 (2603:10a6:802:58::36) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: b34af52b-f052-4264-2211-08dda298616e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTNSWGRkOTkxdGkvalUzQzNvbVd2TjRLbXdwWUtvYVhqWXBrWXk3NVY5YWhE?=
 =?utf-8?B?WXlnUC85djdOS1AydysxT09pVXAzM0hVT2IxdjFLVDZ0Z2tJa0JMQW43VkpJ?=
 =?utf-8?B?Z2tSdHJoeVcyVW8wK0NpOEd1ZnkzVjYxOUNpQk9tMmkwczFaSUQrVVE0WXRq?=
 =?utf-8?B?ZzVMSVJRMzd3T1IwNTNKR2dwRlB4RXhZWUhjb0RlNlNDN2k3c0F6MnpIS3Y2?=
 =?utf-8?B?RE9EWFROK2JLQWtiSTlhVlBSMVlwWmYveHk4Q2ZiNlJQZE9VcDU2NHRMQ3pE?=
 =?utf-8?B?eVRNemFLQko1TWp0STgxRk5aS0ZsRHVuNW9GTnIxMlZneDVBREdxT0RpTDVi?=
 =?utf-8?B?eWVpUzBvRHZyVzI5ZHRGZ3ZGQVo1TkpORFFkVVJ1NnhwRmxVdzVYZWxNaXVi?=
 =?utf-8?B?R0dka1pzMi9KVXhtUUNqMFRyZHNqL29sd0JLYkEzbE52NUNNZllZNDdkUjc2?=
 =?utf-8?B?UmIxY2NlUWtUd2hIdFByOHNlK1lPNHkreEZzYUgybDhnNktqMEExelpIVWpy?=
 =?utf-8?B?aXBueEp6b1B2dmViYnRHZU41VGlxYW8xNDhvR3k0QnZ1cmNncE1FNmg2ajJo?=
 =?utf-8?B?MmVSWlloeUxBa0tBcEsvcDU3SjN2TkZIS3ZRZmI3bU5JVmpUNDF4ZmFJSEJZ?=
 =?utf-8?B?THd4TzRabEt1Y3N1eTAvenlyYVcwbzUranZSS1F1ZytxVmZVeVNnZ2E4cnpT?=
 =?utf-8?B?SGxyQ294WWRkTVppbzNpdUNlS2lFbmt5VDVOYVBXdGFFSjNZMFg3NHpnQ2V5?=
 =?utf-8?B?a1Mwd0RXcGdSVm80MEl0bFJxU2UvRXA2WGM1SkJQY3VncnVzMFRwbUR1NWdj?=
 =?utf-8?B?d3ZpRFlhKzZFbnZtVXJ0TzhVRUZCL0JORmxLT003aFFiSGFSRUE3MUcyKzVv?=
 =?utf-8?B?dUFycXU0bS9NdkpOdFhsVS9vV2s2M2V1bWRRTnJrRUIxTGRBKzF5NFN2V3FB?=
 =?utf-8?B?di9lMTRMbjFCeWxHK1FUaXE5Mk5mekxobjhhb1E1VVdCNmtmNmVxbmR3WUN6?=
 =?utf-8?B?Mi90cGo1eEJsY1ZaUlZUcU1tMU05RjBrR3dEdERZSXl3bXN1bENTZEdBOTlv?=
 =?utf-8?B?SUdNT1NILzVCeVZDeW5nR01nZTJyYmxWVnVJeGt3WGdGaDBzQlNtcXpwTk1q?=
 =?utf-8?B?RDUwajZNa1djQlE2bjFNT1FuTUZieUl1OXdCMXEzSmFWeEQzUUhPMWMvTUJ3?=
 =?utf-8?B?N3hVNlU1ajZhMndMRDhmbW4vM3FvZkhUYjVuMVplY3FwN2w0eXJaNGFJclNV?=
 =?utf-8?B?ZlJic3krZ1FrRnJQS1M2MmdLVzM4bGI1VkJCek1KcDBXR0h6d2ZYQ0wrSkxB?=
 =?utf-8?B?UXJMVkx6TDhhOU5CZnlZVzJKZy9aQXJrVG5VdC9RaUtGSjlSUTRycEg1R0ZF?=
 =?utf-8?B?UENpKzByNC9OYW5zcXhNTVFqeXBpZzFJSkRpMElweUE1eC9ady84S3ZnLzdt?=
 =?utf-8?B?eUU1KzczbUlLOGtZYzg2aTFvdHFaeTV5amtadnAwdnF4UGpXbmMwUlVpQUFo?=
 =?utf-8?B?U0JibnpybXlnZTdRMlg5QmxRVXExK0FCUXNtV1A3TWYzS05hVCtoTEVXblRG?=
 =?utf-8?B?OFZiRXdZNHB4eXVJU1dWa1hxN2pONGx4U0N2eDM5UWp5UW5KQW96ZHlVUkFn?=
 =?utf-8?B?Y3Q4YjFDUk44Y0M0WWlENUgwUS93WThFWG1pU244blpwZ2tjZUFJNTlKdmFY?=
 =?utf-8?B?U3Y4V01wV0N6RGVUL21YUSthRi9CSlNUN0tVdmNpRW92dFgxcHBLZk8rSFI3?=
 =?utf-8?B?MjVpTzdJUHhUbFVMMXY5MWUvM09xRndlajYvNlhQZ0RnWWh0dG9YbWNjMkRQ?=
 =?utf-8?B?MUpIVmxyQVlKblBER3ZUU2M2QjhVUkVqdzZQV2dYVmFWaVRORUxadnA3YmxG?=
 =?utf-8?B?UkdtL1htWnMwcEVUdmVHV2lhb1VDb2NvbVNTS1ByOGxqbUQwY3hqb3RIOGtj?=
 =?utf-8?Q?jiItv69BBMk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ancrOFlrTTg0QnYzRFRqZDJuakowcU1KS2JFM2Npck51d1A4ZHNwb0ZINWZM?=
 =?utf-8?B?aWNCcG9DbXlJUmJIM09FMFpiemRlWG9aRll4MXAyckxld3FWc2hIU2JqMUlY?=
 =?utf-8?B?U0RPcngzRkJXenArdXdQbVBJWWNGdE9iWDEwN1J5WnhVSURUS2FqVUxEZDJY?=
 =?utf-8?B?WHEwM0VaQm56T3ZIdFpPUGpBbTJEYXRFR0NiSXQzenhaRDhvZzFoeS9GL0Rp?=
 =?utf-8?B?UWZHQ0lPY1FudFVUZXJicnFWZDM5dUFQQ2VEM3JtNUhhNTZTL1RiOXc4Rmdq?=
 =?utf-8?B?Y1NpNFZYR0ljSjcvUDFVVDJhZHBNaFJEclBsclNJdms2RkNKRjFMSnJ6dlJv?=
 =?utf-8?B?TmJrYUtDVVByNmVlcDBVWWplZjR1TlZiZ3UxbThZejJxTTlkUzdsUitveTNM?=
 =?utf-8?B?MjZZTUNrYWp4ZmJUUGpmWHJtaTczdng4SEQzVHMreXo4djdJTFo4NU1iVVZj?=
 =?utf-8?B?aEJFZ1NjU3MvcmVYNGQ0V2laMFFwNnBmRytFUVlSU3htWmw2UGJKMjdLMk9C?=
 =?utf-8?B?NUFyUlhiR3RqN204UmJwVk96NDBiTGZCWk91eW1IYU00endQZ0dsQ2JBcFov?=
 =?utf-8?B?Q1lETU9tRys2eW9yZlZudkkrYTFDaG9MeEE5UDc3RnpQUjVXcmVVYWpiNkRK?=
 =?utf-8?B?SFVBckhsK2lWWnBFRlVSWktPNlVaQVkwKzVvMVRTU3NNNWVMMHVFZ001dndm?=
 =?utf-8?B?N0ZDa0pLcGduT0tmWldrTVduY2Jtd1VOOStMazVGYVY1RXppOGp6bFNoaU5i?=
 =?utf-8?B?ZWxMMFZpY2tsU29hZnM1b0MyRGcrQnFuZTNPWVJDZzZZZmFuUDE4MzEzNTZp?=
 =?utf-8?B?ZUFma0ZKd3JROStNdml0aW05a2gxS0x3K0YyS2dBcVp4S1JEdzNIbnBxa28r?=
 =?utf-8?B?RHdndG9JSmd0U0c0MUNCemFrWnFhU25oMHJHKzBGVFE3RTQxOFhNNjN1WGtj?=
 =?utf-8?B?TUFJRTBHTVVLNVcwYURNdnoxZndKYXFCNGl1SExpN25ESGhXU2pZT3ZMNXAy?=
 =?utf-8?B?Q1NTdGY4YWJUQTdTY1VCL01OMVhQdDk1dHVlYXNYdXBNcEhPcEpSV0hFUDhs?=
 =?utf-8?B?bGoyUyt0MWlHRDJoMzVYRTEyeEQ3MzNoWlRUdE5WeE9QcVdiN1pXUEZyTmxH?=
 =?utf-8?B?eXFYeFpkVlNMNFBVK0UwdXRpNmgrY216c0dwTGk2b1lPQVJMblc0NCtsUkZI?=
 =?utf-8?B?cWFodGM1ZnEycTN3MFdpWTd0TEM1TE84WklmRHNiYVAzbmR6Zzhka2MyOThQ?=
 =?utf-8?B?NTIzZHliL0xFcC9nRzVRMHovUHZrYnlkVXlQWWt2dlcrblByV1FYbzlXai9X?=
 =?utf-8?B?UVBqK0YrNnZZeTRkRkFnVnRHVGt6aDhHd0JjaEtUS2N4VkFRRlc2NmltZDRy?=
 =?utf-8?B?aXMzT2UvcTd5NVkxTGkxOE9XWGFuSEgyWk5yZit4cmlYL1k2SWhoTVJlRTZ5?=
 =?utf-8?B?dDNzU2U1a2NRMm1JOEx6NkdmaWc3RWl6V3piZzRVcjdGMklYS01YM0JrdCt2?=
 =?utf-8?B?MGI0S0ZMb0FLbnQxdi9Kc1BBTmdpYTVVU3JDTW82NmVwTHdhVEhINzIvMXlL?=
 =?utf-8?B?NGFDdjJKMlZWbGJkVy9oWENOUS9IdUJrZ0srL1laS1hYQkZRTDluM091WXRL?=
 =?utf-8?B?anlQTkYyQVN2MHVCcUt6TWs3OHBLVExjZ3R1NUFRbldGKzM3bUdRRElKaGdv?=
 =?utf-8?B?VzhSS1JHcDdNekJZdzZOREcvWjE1bnhNTWlRN3MxTnp4WGhrbUxDVmh3dHQz?=
 =?utf-8?B?MDcvSk5tVVdkaTE0TCtSY2lWekVWWDJwaHdEN2JFYUUyaWNMU3IwREJCbTR6?=
 =?utf-8?B?YU1ROFZZRXlmckVNb3pDTFVKNTJnRG1mbkJhcHNud1BKanphekYzaUFJa1JS?=
 =?utf-8?B?cUFhUzRxL01tOVVsYUdwczRJaHhlakRNTWJ2OENCWWFRVkV1OWYzMzEyTGVw?=
 =?utf-8?B?c0Ywcm16dXYxNHV3NjY2NkVmQXdPNTk4RkM3VENtZTA1dVNzYS9Ed2F1UkpP?=
 =?utf-8?B?UCtYVndoSXZaVnQ4dE4xL3haQ1JKWFl6bmIzd1F5VXF1UEg2TjlnZ2tTalFp?=
 =?utf-8?B?b3BIYnFzMUg0M1puKzh5ejl5QXNPVllkbEtWZm9yWEljY1JXSXFDQjdlMWJq?=
 =?utf-8?Q?MMuJCZbAglvnbq2PLPnCfdox1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b34af52b-f052-4264-2211-08dda298616e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:15:51.2975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2hFEVthRAfcU1VBq1Ngy2v961X7f8uBQNB6kUBs/k/Zb3nYAunIFnOBwu5/W9O1goNk05hgjrEEtb0Pyhlyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

This patchset fixes a known issue where the DPCD probe quirk leads to
link training failures (patch 1) and limits the quirk to the monitor
which requires it, to avoid similar failures in the future.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>

Imre Deak (4):
  drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
  drm/edid: Add support for quirks visible to DRM core and drivers
  drm/dp: Add an EDID quirk for the DPCD register access probe
  drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required

 drivers/gpu/drm/display/drm_dp_helper.c      | 17 +++++++--
 drivers/gpu/drm/drm_edid.c                   | 36 ++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.c      | 11 ++++--
 drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++
 include/drm/display/drm_dp_helper.h          |  6 ++++
 include/drm/drm_connector.h                  |  5 +++
 include/drm/drm_edid.h                       |  6 ++++
 8 files changed, 82 insertions(+), 11 deletions(-)

-- 
2.44.2

