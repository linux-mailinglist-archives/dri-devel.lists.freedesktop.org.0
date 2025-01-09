Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1419A075D5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8210EDA1;
	Thu,  9 Jan 2025 12:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqSam03g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B75E10EDA1;
 Thu,  9 Jan 2025 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736426196; x=1767962196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RDVlKHdrmozTrdEG0JMZD0xIzKhL2Uhm26XQ27H6LRg=;
 b=UqSam03gBAEkGKIVUYKRNi5nDa0jASj8QwvvtQt20EsqR0609mwcQlXM
 oXmFktaoLP+NqJQt9DteDmuyDhDI3BsyDpX3pRcXsfAW0phTc3O5CzLJO
 YGS4khiN/g1+PM6+V2/XjxOLPsvWMRwaESDRTKSe/wGGx3DE0uqw6w8Tq
 +P+/lbH2J4voa9bG+H3ItBYBQlxIk7f7M9+GSdfOwaBE0DZG16YDfDUE2
 mnuMawcZxdKOnUoUJFQCfHhkHFPWuUfe4fkDLOLcjOS+a6qYAOZOPsuoU
 sM/P7cMVwnedSFNwc5nmp03V2+svtWJHNx5i2jg9xRJXzz0VuDtyRBlOC A==;
X-CSE-ConnectionGUID: zMaEgbeYQk6tPY4TPLxtbg==
X-CSE-MsgGUID: stVx8l0ORUKMSqdEJPpUOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48046776"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="48046776"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 04:36:36 -0800
X-CSE-ConnectionGUID: +ESuQA7TSzO8LP41Rz02/w==
X-CSE-MsgGUID: KC1oyRrNRFmPNzJDhvn2jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140717164"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 04:36:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 04:36:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 04:36:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 04:36:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhS+j9DBSUHbYSr3KO/+IHvUOky96AbsvmZxIMPMj9WyghbqGRL7EAds1Vbj4hV/PVVO+cFJ8MZ+2WzOXFf2GzXasb1JwFREAMaC0RHPLtZEBLjIBwol10696luI+i1T91jg+29fsdrcCseOCQ6hqRz4RDqnj7f2rw4adrZ6PIuOaHDdYiqwcYUOzs28fG1iJto2adEvBLQDjaDfBoOt+to1xaPx4BZzU5vNMCMT+B+wAkTzDKhWZg+HD3jZW8oHGntsIryrjdLcEn3RawU9eYhnxEsOmxIlM57tDPWS6uE0zdBVhdtG7UFJSggW1sQNXtf9Z2nBLOWvfe5Z2Lo3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDVlKHdrmozTrdEG0JMZD0xIzKhL2Uhm26XQ27H6LRg=;
 b=Gw8bx7fukC4KKuuk8nV7x1x6ykdmKBYA8K07uCw77ffHdZRPuHWVMBLiaMIt8Kpzn/fcrm6xrWk1uCawYTtaSV7Gbbt/I5IRBGrlF17biFo8FHKDDFJxkT5LU0kG8z5KmUsq5I9uR8yDE/dyPl73D6+PdgTcXZu6gJbjdia/wYMJy0KXkiVUdVSaNTvOxJpY0mte0eHDz++jXYY5YeTIP3zvoE5C1xpfCpuHBI01qZNReIOgwAR6eZ8iXavlSisvnw9qi6CvG79Tnwi0FbmsHdH7xGhhTHY7CXMStoryJZZlEJMUyc21CJKNQVBtaam1pZqYp9Kovqm7XrME2p8NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 12:35:49 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::5616:a124:479a:5f2a]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::5616:a124:479a:5f2a%6]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 12:35:49 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Morek, Szymon" <szymon.morek@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [RFC PATCH V2] drm/xe/guc: Use exec queue hints for GT frequency
Thread-Topic: [RFC PATCH V2] drm/xe/guc: Use exec queue hints for GT frequency
Thread-Index: AQHbYo5QKlNzqY5dFUmXch6NP1BY7bMOX/tg
Date: Thu, 9 Jan 2025 12:35:49 +0000
Message-ID: <BL1PR11MB52711037A252439CC3B310FAE7132@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5271:EE_|PH7PR11MB7551:EE_
x-ms-office365-filtering-correlation-id: 1fca1956-1cf4-4230-75eb-08dd30aa25d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Sng4ejRWUDgzRkQ4OFJtNzJtZFVWc0k5aWh1UWQ4MGNlQzcycmF6SjcxWUJB?=
 =?utf-8?B?YVdUdzJnTG1PdGRBeHpFYTRmWlAvRXV2SnhpaXpiUENOaXpTVXhDTkpsRjJm?=
 =?utf-8?B?d3ZaNDlKS2VVZm1YekQ4MHdaMTF2dXRka1F6Tk1SSGdOZ1MyQzc0OFBiZysv?=
 =?utf-8?B?RTU0ZXJ4YzNVTG85YkxteHBQWjJFdGhLRmxITXVxODdqN0Y3aFhtbFlIZTE4?=
 =?utf-8?B?dEZBSldoR2Z0anJGNVlRSnBYOUd2cE1HSFVSdnc1RXppcjNWUTRkcGt5cjVw?=
 =?utf-8?B?dTYydzJrU21qcXFsVXN0NGFYK0VQMGZrMUJqNitHRkMyTXd2M25iVmJLRjhR?=
 =?utf-8?B?enIzaUNYaHNHN1QxeFVPUVdYMUFFNDNqeWVJV3JqTEwzOEg2YXliNzhyTXNS?=
 =?utf-8?B?OUVpbi9venZQYnZ0alZUL1I4TXJqdkRWVzU2SWRNSUtlWDZGNWNTTzlaNXNK?=
 =?utf-8?B?RXJXRHVLNVZsOTRxbGJVbHVUVDBaNG9UMUJSbjkrbFdCa216bUZtVG1jbWZP?=
 =?utf-8?B?WENjRzE4aDcyOEZ1Tm1FNkZVcVl5SVk3ZmlJMUt3RExDUUk2aStnRVJuU0hH?=
 =?utf-8?B?T3lTdEsra255Vk0ydmNVU2tqczBpVU51YXBnckdoc2Rhei9YL3NQa29wM1BD?=
 =?utf-8?B?Vm9kTmorbUJtdnFPc2ZseXNlNkpvM0EzZit3SFdHamxDSHlpOVpyWGVzMDNI?=
 =?utf-8?B?b05vRnBSbkQrRzZFNllROGtCZmMrYnhkeGJBWmtCWE1CSFkrMkJ3RGdoQmtZ?=
 =?utf-8?B?ZSs4V21yMjJWY2JncHk4cGEwcitnU01WTTBwaTduZ1d1eHAxUDl2clhEZ1Ar?=
 =?utf-8?B?cjZ5T01JcFhsWTIwWUJjOFh3U082bmMvQndlK2h6WFJmTlhxNGpvRnBhVWpG?=
 =?utf-8?B?VU1nSitST3VPMk0vZE9TVCtCb1FtcFR4SDhKSGNjMHVVODZVclArVS9POVli?=
 =?utf-8?B?YzJJNUdST0ZidmxuUzJHRGNvSW5IWXdCU1RiaUVhcTQySnZydVE4aS81cG1W?=
 =?utf-8?B?MVQyV1N6WUY5ZmdQenZ0Wk9WSmpkNmEzQXFzWE5JK2EyeU5MNmF5cjdRVERs?=
 =?utf-8?B?Y1lSZUMyOWRhNmpJOWZuQS9ONXg3MVJtMFJjVlkrUmlCdWpEc0tqNHZLckUr?=
 =?utf-8?B?YStCby8wZjBocDVXVUdCS0NONUgzMHhkd0UxaEVhdkltVUp3Zjlud0tQZ0dG?=
 =?utf-8?B?enJhakxWZ2JDQzlsd0RFUE5ScGZ3NTFoczBaR0N2RUtqY0lROTVEWERPOE02?=
 =?utf-8?B?YkNZeHkvN2Mxc0FpcXRLc1NldXYveXQxN3ZRMTBjckdtd1Rhc1JNY0tYNG05?=
 =?utf-8?B?ako5K2NsSUlzUTl1ZTNoc0lLRklMY3JFNHl6RlhkSllDcVR2RVNUWXQ4c0lX?=
 =?utf-8?B?aWZHNHo1SlhIWDYwdVdQQ0VXRGw0L3hlYUkvVmNTU0VZUDcxZnhuVS9oWG8v?=
 =?utf-8?B?WVBnMjl6SXRlTWRTT0drcnN5N2wwSFBhVWE3dlhrUGJsOUwwNmJaTlR6QXhL?=
 =?utf-8?B?Vjk4cU84M3Z5blRLSCtna01uSFhjbEw0ck5LdnBHT05ZWHJlamdCZUIxampN?=
 =?utf-8?B?K3graHpELzg4bm93RVFtcjBsRTZyK1dYZ2JkbFlyZGc5dTZYYVBOWE5CK0xp?=
 =?utf-8?B?N2JNYmRia2UxU0xaeEFQNExxU2pBUUNIaDhVeUk2WEpWc1pGQUpqb2J6STcz?=
 =?utf-8?B?R2s5dXFoMW5TTWpDS0VqQVlEZGVzYjdMaVhvUytCRFNNaEREYVNnNWRnbEtB?=
 =?utf-8?B?TVlUTTlwdVZxdzIzenJvQS9XdGpudENDRkRac05VYTlTRHY3K3JqT0Zvenpn?=
 =?utf-8?B?blBTeEo4TURyVjVTaVAvbkltZVJza2xGeTJrV2V5ZkJEd3RMdU9iWHZXRnl1?=
 =?utf-8?Q?3bimfFeCz2fFs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay9ZeWRIQWpjLzJScERxbW82UzZWMWc0ZjB2eTNrTHRuWHorMThOVGtJaWN4?=
 =?utf-8?B?QkRmaHF1eG1ZUG45Z2liWnhYMURhamF5cFJlNkMxL0x5OGZtZW5oSEdaRVpZ?=
 =?utf-8?B?K0NnZHFNU3Z2bFc2YkFRc1FqUUlrREE1TFBlN21JVXBSbHB0YndMRkJpVVEx?=
 =?utf-8?B?c2t1QzFxRTFFdUV0K2FKRXJHbXZROGU0RldIdkhuVXVySmhBVkxtTzlEV25u?=
 =?utf-8?B?bSt0d3hteXVxdWFPb2lRZTl0dlNxYkE1QWVqb3RzTWZ6ODFScWNsYjFHUWpL?=
 =?utf-8?B?MURFWDFmMXNteG1uT0hlUGxjdVUwZ1FYaFB5VytzdU5UU3hqMjlxc1lLeVc4?=
 =?utf-8?B?eGh4ZjFQaXFDY3c1YjJ1d3pLZUNhVG9jWnlyQlVIcGtZc0djSHdRNDNzKzNG?=
 =?utf-8?B?eTRqV3FYSjUrd2Z6a1M1eHpmMFVYejhRWXErZ3NGT1JrenMxQ01SR21wdWFx?=
 =?utf-8?B?ODRlSUppZFE3TFlJUnZxdWpGdzhKS0RtWlJkakpCbUFmUWZMWW5WNXBzdkVM?=
 =?utf-8?B?OVN1cnFhVXdGQzVUY2xtaUkxV21IYTArMktTQlgrZUFBQ1JFMnV5Yy80a1U0?=
 =?utf-8?B?MlN1eXppQ1pNTGcwdGRuRjNYTUx5bUIzdDJVdHFYVTRoeUxZUlJSdVBZV3J0?=
 =?utf-8?B?cEF4OVlrSDBHdTlKbGFtVHFMTUNxa3lqR1VoWVlQTnEzVjhSRW51YWQrNnV6?=
 =?utf-8?B?REl1dEc4Y1p3NWxsQlhGSk5uRWE1VWtBd3Z1VkxFY0lDNzlsRk9YRFFRdlVm?=
 =?utf-8?B?VTZDSVJGZS85SEpKQkI4WXdGRVYyMkNZT0ducVdsZ0l5R1BBcDYzdVdEdEIy?=
 =?utf-8?B?NGwxakR4UTBpNVpEMjRuZVZSWFJaNldWY01JQ25XeWtrSlUrb0x1T042RzFU?=
 =?utf-8?B?TnlZUUtTMHJxY1BzUjlsZ2Jtcy9YbC9nREtMTysvOEZGRGpkTndmNVpONUdC?=
 =?utf-8?B?ZTlKS3Y3TktRTDY3NGRGUVI5ZE9lek80TTB4amlobFdZYzhSOWovam1ucS82?=
 =?utf-8?B?UVQyeEpIMTJlNlp0aHJNTGtmVzVQazRtQTFSRGlCeDdlaHVBUm5ySGxLL3oz?=
 =?utf-8?B?MlRVLzFPYktWSUh1Zm5ySk9nUFN3S2pwZ2xWY2swQmNFeHlWNmM5ZnN5VWJK?=
 =?utf-8?B?Q3FzQlpKUTBRbGlXa3dma2x0aWpuQmtEV1dhcVFUNEUzK3FORXJVajdFalJS?=
 =?utf-8?B?VDI2L1hpRUsvUXF3MmtXT1Rwcm9OQmlXVmZzeHpkemxvdFVaN2k2UENTR3JQ?=
 =?utf-8?B?TGc0WGUrM3A2V0xTWHFRVlFnVGEvQWVielV0bU40WEdiSnRmTk5Ga3lqSFFi?=
 =?utf-8?B?ZkxPQ0xmUDdzRTJWZk5CMXRoZEJydHFFWVIxbHRUVGtQbWI4UnpFd0pnM2Np?=
 =?utf-8?B?KzJwKzZwdEVJVm9Cb3htQWhnYTBTS3oydTBLTEsxQVV5VDF1NldBRXkzSnB5?=
 =?utf-8?B?TGxVckpNZTlRTDBEY0pCdEhvd21mbnFza0NiTFRpOXIrSlJ4MkM5dVE4U2hK?=
 =?utf-8?B?eWR6OU1yWXd5aUFhSzBwZ0hUQ3NZZDA0dnFYcUtTZmtCbUZnZk9WTmJxYVBs?=
 =?utf-8?B?UGcxc3lNcG1ZcEdyYzk3NW5ZSTJvUU10aGgrbGoyaXVkNkpLclpJZEY4d3N2?=
 =?utf-8?B?aDhhQjJUTlV5dlJzNkk2TC9VNmdhaTdyYmNoVm1Uc2ZJK0h6OGNSVGgwRW1M?=
 =?utf-8?B?SzRwVlYreExSMDhnR3FldEZMQ09KbWZKNm1rckx6U0ZPVGNTNnM2bEs3NTNV?=
 =?utf-8?B?Q2dxT1FFS2FmSEx3QzRjckhLQzJaamd1Mnh1cERVZWxVYlQrekdLV2UybEZC?=
 =?utf-8?B?YWFPUlcybGU3c2NxeVQ2NE1icVhIRUNuUXNha2Y2T2t1WmpFTDNQbUdRbHVN?=
 =?utf-8?B?c2g1TklySXNrRnRjeXZkWXcvbmdOUWR3NzgwejJpRmpzMnRqYVA0aHRhZGNu?=
 =?utf-8?B?MjdEV1ByRnh6Y3E1RGR3UWgzSklsS2RBOFQ2b3hMZ2ZhOXZaZG1yT0RuODRL?=
 =?utf-8?B?VjUxYnUvN3M1ZVVJOC9VY0c5TVRQaXFRMWNYenFLUEZEdEdhYjI4YmNBczVv?=
 =?utf-8?B?TWNLS1pPZnNwaVZLSWIrRjA0RFBzczdHY01UeEFHakFRbC9VSUlQd0tTeXlN?=
 =?utf-8?Q?QcB0Hsp8WBMsOdLkz2qe3ZHKJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fca1956-1cf4-4230-75eb-08dd30aa25d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 12:35:49.3252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0ZvFGuqvFbVHUE0Y6h2REa2zHjp/HRfF9ZQqv3s7kCJY6IFjK2MaUbodj7v+r/RAlfMuXaO2302ZdoTXVGXTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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

Pj5BbGxvdyB1c2VyIHRvIHByb3ZpZGUgYSBsb3cgbGF0ZW5jeSBoaW50IHBlciBleGVjIHF1ZXVl
LiBXaGVuIHNldCwgS01EIHNlbmRzIGEgaGludCB0byBHdUMgd2hpY2ggcmVzdWx0cyBpbiBzcGVj
aWFsIGhhbmRsaW5nIGZvciB0aGlzIGV4ZWMgcXVldWUuIFNMUEMgd2lsbCByYW1wIHRoZSBHVCBm
cmVxdWVuY3kgYWdncmVzc2l2ZWx5IGV2ZXJ5IHRpbWUgaXQgc3dpdGNoZXMgdG8gdGhpcyBleGVj
IHF1ZXVlLg0KPj4NCj4+V2UgbmVlZCB0byBlbmFibGUgdGhlIHVzZSBvZiBTTFBDIENvbXB1dGUg
c3RyYXRlZ3kgZHVyaW5nIGluaXQsIGJ1dCBpdCB3aWxsIGFwcGx5IG9ubHkgdG8gZXhlYyBxdWV1
ZXMgdGhhdCBzZXQgdGhpcyBiaXQgZHVyaW5nIGV4ZWMgcXVldWUgY3JlYXRpb24uDQo+Pg0KPj5J
bXByb3ZlbWVudCB3aXRoIHRoaXMgYXBwcm9hY2ggYXMgYmVsb3c6DQo+Pg0KPj5CZWZvcmUsDQo+
Pg0KPj46fiQgTkVPUmVhZERlYnVnS2V5cz0xIEVuYWJsZURpcmVjdFN1Ym1pc3Npb249MCBjbHBl
YWsgLS1rZXJuZWwtbGF0ZW5jeQ0KPj5QbGF0Zm9ybTogSW50ZWwoUikgT3BlbkNMIEdyYXBoaWNz
DQo+PiAgRGV2aWNlOiBJbnRlbChSKSBHcmFwaGljcyBbMHhlMjBiXQ0KPj4gICAgRHJpdmVyIHZl
cnNpb24gIDogMjQuNTIuMCAoTGludXggeDY0KQ0KPj4gICAgQ29tcHV0ZSB1bml0cyAgIDogMTYw
DQo+PiAgICBDbG9jayBmcmVxdWVuY3kgOiAyODUwIE1Ieg0KPj4gICAgS2VybmVsIGxhdW5jaCBs
YXRlbmN5IDogMjgzLjE2IHVzDQo+Pg0KPj5BZnRlciwNCj4+DQo+Pjp+JCBORU9SZWFkRGVidWdL
ZXlzPTEgRW5hYmxlRGlyZWN0U3VibWlzc2lvbj0wIGNscGVhayAtLWtlcm5lbC1sYXRlbmN5DQo+
PlBsYXRmb3JtOiBJbnRlbChSKSBPcGVuQ0wgR3JhcGhpY3MNCj4+ICBEZXZpY2U6IEludGVsKFIp
IEdyYXBoaWNzIFsweGUyMGJdDQo+PiAgICBEcml2ZXIgdmVyc2lvbiAgOiAyNC41Mi4wIChMaW51
eCB4NjQpDQo+PiAgICBDb21wdXRlIHVuaXRzICAgOiAxNjANCj4+ICAgIENsb2NrIGZyZXF1ZW5j
eSA6IDI4NTAgTUh6DQo+Pg0KPj4gICAgS2VybmVsIGxhdW5jaCBsYXRlbmN5IDogNjMuMzggdXMN
Cj4+DQo+PlVNRCB3aWxsIGluZGljYXRlIGxvdyBsYXRlbmN5IGhpbnQgd2l0aCBmbGFnIGFzIG1l
bnRpb25lZCBiZWxvdywNCj4+DQo+PiogICAgIHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9jcmVh
dGUgZXhlY19xdWV1ZV9jcmVhdGUgPSB7DQo+PiogICAgICAgICAgLmZsYWdzID0gRFJNX1hFX0VY
RUNfUVVFVUVfTE9XX0xBVEVOQ1lfSElOVCBvciAwDQo+PiogICAgICAgICAgLmV4dGVuc2lvbnMg
PSAwLA0KPj4qICAgICAgICAgIC52bV9pZCA9IHZtLA0KPj4qICAgICAgICAgIC5udW1fYmJfcGVy
X2V4ZWMgPSAxLA0KPj4qICAgICAgICAgIC5udW1fZW5nX3Blcl9iYiA9IDEsDQo+PiogICAgICAg
ICAgLmluc3RhbmNlcyA9IHRvX3VzZXJfcG9pbnRlcigmaW5zdGFuY2UpLA0KPj4qICAgICB9Ow0K
Pj4qICAgICBpb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0VYRUNfUVVFVUVfQ1JFQVRFLCAmZXhlY19x
dWV1ZV9jcmVhdGUpOw0KPj4NCj4+TGluayB0byBVTUQgUFIgOiBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwvY29tcHV0ZS1ydW50aW1lL3B1bGwvNzk0DQo+Pg0KPj5Ob3RlOiBUaGVyZSBpcyBvdXRz
dGFuZGluZyBpc3N1ZSBvbiBndWMgc2lkZSB0byBiZSBub3QgYWJsZSB0byBzd2l0Y2ggdG8gbWF4
IGZyZXF1ZW5jeSBhcyBwZXIgc3RyYXRlZ3kgaW5kaWNhdGVkIGJ5IEtNRCwgc28gZm9yIGV4cGVy
bWluZXQvdGVzdCByZXN1bHQgaGFyZGNvZGluZyBhcHBvcmNoIHdhcyB0YWtlbiBhbmQgcGFzc2Vk
IHRvIGd1YyBhcyBwb2xpY3kuIEVmZm9ydCBvbiBkZWJ1Z2dpbmcgZnJvbSBndWMgc2lkZSBpcyBn
b2luZyBvbiBpbiBwYXJhbGxlbC4NCj4+DQo+PlYyOg0KPj4gIC0gRFJNX1hFX0VYRUNfUVVFVUVf
TE9XX0xBVEVOQ1lfSElOVCAxIGlzIGFscmVhZHkgcGxhbm5lZCBmb3Igb3RoZXIgaGludChTenlt
b24pDQo+PiAgLSBBZGQgbW90aXZhdGlvbiB0byBkZXNjcmlwdGlvbiAoTHVjYXMpDQo+Pg0KPj5D
YzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PkNjOnZpbmF5LmJlbGdhdW1rYXJA
aW50ZWwuY29tDQo+PkNjOk1pY2hhbCBNcm96ZWsgPG1pY2hhbC5tcm96ZWtAaW50ZWwuY29tPiBD
YzpTenltb24gTW9yZWsgPHN6eW1vbi5tb3Jla0BpbnRlbC5jb20+IENjOkpvc8OpIFJvYmVydG8g
ZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPj5TaWduZWQtb2ZmLWJ5OiBUZWphcyBV
cGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPj4tLS0NCj4+IGRyaXZlcnMvZ3B1
L2RybS94ZS9hYmkvZ3VjX2FjdGlvbnNfc2xwY19hYmkuaCB8ICAzICsrKw0KPj4gZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYyAgICAgICAgICAgIHwgIDcgKysrKy0tLQ0KPj4gZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysr
KysrKysrKw0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyAgICAgICAgICAg
IHwgIDcgKysrKysrKw0KPj4gaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKystDQo+PiA1IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+Pg0KPj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9n
dWNfYWN0aW9uc19zbHBjX2FiaS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNfYWN0aW9u
c19zbHBjX2FiaS5oDQo+PmluZGV4IDg1YWJlNGYwOWFlMi4uYzUwMDc1YjgyNzBmIDEwMDY0NA0K
Pj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19hY3Rpb25zX3NscGNfYWJpLmgNCj4+
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNfYWN0aW9uc19zbHBjX2FiaS5oDQo+PkBA
IC0xNzQsNiArMTc0LDkgQEAgc3RydWN0IHNscGNfdGFza19zdGF0ZV9kYXRhIHsNCj4+IAl9Ow0K
Pj4gfSBfX3BhY2tlZDsNCj4+IA0KPj4rI2RlZmluZSBTTFBDX0VYRUNfUVVFVUVfRlJFUV9SRVFf
SVNfQ09NUFVURQlSRUdfQklUKDI4KQ0KPj4rI2RlZmluZSBTTFBDX09QVElNSVpFRF9TVFJBVEVH
WV9DT01QVVRFCQlSRUdfQklUKDApDQo+PisNCj4+IHN0cnVjdCBzbHBjX3NoYXJlZF9kYXRhX2hl
YWRlciB7DQo+PiAJLyogVG90YWwgc2l6ZSBpbiBieXRlcyBvZiB0aGlzIHNoYXJlZCBidWZmZXIu
ICovDQo+PiAJdTMyIHNpemU7DQo+PmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlY19xdWV1ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPj5pbmRl
eCA4OTQ4ZjUwZWU1OGYuLjc3NDdiYTZjNGJiOCAxMDA2NDQNCj4+LS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPj4rKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhl
Y19xdWV1ZS5jDQo+PkBAIC01NTMsNyArNTUzLDggQEAgaW50IHhlX2V4ZWNfcXVldWVfY3JlYXRl
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+PiAJdTMyIGxlbjsN
Cj4+IAlpbnQgZXJyOw0KPj4gDQo+Pi0JaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZmxhZ3Mp
IHx8DQo+PisJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZmxhZ3MgJiYNCj4+KwkJCSAhKGFy
Z3MtPmZsYWdzICYgRFJNX1hFX0VYRUNfUVVFVUVfTE9XX0xBVEVOQ1lfSElOVCkpIHx8DQo+PiAJ
ICAgIFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+cmVzZXJ2ZWRbMF0gfHwgYXJncy0+cmVzZXJ2ZWRb
MV0pKQ0KPj4gCQlyZXR1cm4gLUVJTlZBTDsNCj4+IA0KPj5AQCAtNTc4LDcgKzU3OSw3IEBAIGlu
dCB4ZV9leGVjX3F1ZXVlX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLA0KPj4gDQo+PiAJCWZvcl9lYWNoX3RpbGUodGlsZSwgeGUsIGlkKSB7DQo+PiAJCQlz
dHJ1Y3QgeGVfZXhlY19xdWV1ZSAqbmV3Ow0KPj4tCQkJdTMyIGZsYWdzID0gRVhFQ19RVUVVRV9G
TEFHX1ZNOw0KPj4rCQkJdTMyIGZsYWdzID0gYXJncy0+ZmxhZ3MgfCBFWEVDX1FVRVVFX0ZMQUdf
Vk07DQo+PiANCj4+IAkJCWlmIChpZCkNCj4+IAkJCQlmbGFncyB8PSBFWEVDX1FVRVVFX0ZMQUdf
QklORF9FTkdJTkVfQ0hJTEQ7DQo+PkBAIC02MjYsNyArNjI3LDcgQEAgaW50IHhlX2V4ZWNfcXVl
dWVfY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+PiAJ
CX0NCj4+IA0KPj4gCQlxID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoeGUsIHZtLCBsb2dpY2FsX21h
c2ssDQo+Pi0JCQkJCSBhcmdzLT53aWR0aCwgaHdlLCAwLA0KPj4rCQkJCQkgYXJncy0+d2lkdGgs
IGh3ZSwgYXJncy0+ZmxhZ3MsDQo+PiAJCQkJCSBhcmdzLT5leHRlbnNpb25zKTsNCj4+IAkJdXBf
cmVhZCgmdm0tPmxvY2spOw0KPj4gCQl4ZV92bV9wdXQodm0pOw0KPj5kaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19w
Yy5jIGluZGV4IGRmN2YxMzBmYjY2My4uZmYwYjk4Y2NmMWE3IDEwMDY0NA0KPj4tLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4+KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19wYy5jDQo+PkBAIC05OTIsNiArOTkyLDE5IEBAIHN0YXRpYyBpbnQgcGNfaW5pdF9mcmVx
cyhzdHJ1Y3QgeGVfZ3VjX3BjICpwYykNCj4+IAlyZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gDQo+Pitz
dGF0aWMgaW50IHhlX2d1Y19wY19zZXRfc3RyYXRlZ3koc3RydWN0IHhlX2d1Y19wYyAqcGMsIHUz
MiB2YWwpIHsNCj4+KwlpbnQgcmV0ID0gMDsNCj4+Kw0KPj4rCXhlX3BtX3J1bnRpbWVfZ2V0KHBj
X3RvX3hlKHBjKSk7DQo+PisJcmV0ID0gcGNfYWN0aW9uX3NldF9wYXJhbShwYywNCj4+KwkJCQkg
IFNMUENfUEFSQU1fU1RSQVRFR0lFUywNCj4+KwkJCQkgIHZhbCk7DQo+PisJeGVfcG1fcnVudGlt
ZV9wdXQocGNfdG9feGUocGMpKTsNCj4+Kw0KPj4rCXJldHVybiByZXQ7DQo+Pit9DQo+PisNCj4+
IC8qKg0KPj4gICogeGVfZ3VjX3BjX3N0YXJ0IC0gU3RhcnQgR3VDJ3MgUG93ZXIgQ29uc2VydmF0
aW9uIGNvbXBvbmVudA0KPj4gICogQHBjOiBYZV9HdUNfUEMgaW5zdGFuY2UNCj4+QEAgLTEwNTIs
NiArMTA2NSw5IEBAIGludCB4ZV9ndWNfcGNfc3RhcnQoc3RydWN0IHhlX2d1Y19wYyAqcGMpDQo+
PiANCj4+IAlyZXQgPSBwY19hY3Rpb25fc2V0dXBfZ3VjcmMocGMsIEdVQ1JDX0ZJUk1XQVJFX0NP
TlRST0wpOw0KPj4gDQo+PisJLyogRW5hYmxlIFNMUEMgT3B0aW1pemVkIFN0cmF0ZWd5IGZvciBj
b21wdXRlICovDQo+PisJeGVfZ3VjX3BjX3NldF9zdHJhdGVneShwYywgU0xQQ19PUFRJTUlaRURf
U1RSQVRFR1lfQ09NUFVURSk7DQo+PisNCj4+IG91dDoNCj4+IAl4ZV9mb3JjZV93YWtlX3B1dChn
dF90b19mdyhndCksIGZ3X3JlZik7DQo+PiAJcmV0dXJuIHJldDsNCj4+ZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3N1Ym1pdC5jDQo+PmluZGV4IDljMzYzMjlmZTg1Ny4uODhhMTk4N2FjMzYwIDEwMDY0NA0K
Pj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+PisrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4+QEAgLTE1LDYgKzE1LDcgQEANCj4+ICNp
bmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4+IA0KPj4gI2luY2x1ZGUgImFiaS9ndWNfYWN0
aW9uc19hYmkuaCINCj4+KyNpbmNsdWRlICJhYmkvZ3VjX2FjdGlvbnNfc2xwY19hYmkuaCINCj4+
ICNpbmNsdWRlICJhYmkvZ3VjX2tsdnNfYWJpLmgiDQo+PiAjaW5jbHVkZSAicmVncy94ZV9scmNf
bGF5b3V0LmgiDQo+PiAjaW5jbHVkZSAieGVfYXNzZXJ0LmgiDQo+PkBAIC00MDAsNiArNDAxLDcg
QEAgc3RhdGljIHZvaWQgX19ndWNfZXhlY19xdWV1ZV9wb2xpY3lfYWRkXyMjZnVuYyhzdHJ1Y3Qg
ZXhlY19xdWV1ZV9wb2xpY3kgKnBvbGljeSwgIE1BS0VfRVhFQ19RVUVVRV9QT0xJQ1lfQUREKGV4
ZWN1dGlvbl9xdWFudHVtLCBFWEVDVVRJT05fUVVBTlRVTSkgIE1BS0VfRVhFQ19RVUVVRV9QT0xJ
Q1lfQUREKHByZWVtcHRpb25fdGltZW91dCwgUFJFRU1QVElPTl9USU1FT1VUKSAgTUFLRV9FWEVD
X1FVRVVFX1BPTElDWV9BREQocHJpb3JpdHksIFNDSEVEVUxJTkdfUFJJT1JJVFkpDQo+PitNQUtF
X0VYRUNfUVVFVUVfUE9MSUNZX0FERChzbHBjX2N0eF9mcmVxX3JlcSwgU0xQTV9HVF9GUkVRVUVO
Q1kpDQo+PiAjdW5kZWYgTUFLRV9FWEVDX1FVRVVFX1BPTElDWV9BREQNCj4+IA0KPj4gc3RhdGlj
IGNvbnN0IGludCB4ZV9leGVjX3F1ZXVlX3ByaW9fdG9fZ3VjW10gPSB7IEBAIC00MTQsMTQgKzQx
NiwxOSBAQCBzdGF0aWMgdm9pZCBpbml0X3BvbGljaWVzKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3Ry
dWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+PiAJc3RydWN0IGV4ZWNfcXVldWVfcG9saWN5IHBvbGlj
eTsNCj4+IAllbnVtIHhlX2V4ZWNfcXVldWVfcHJpb3JpdHkgcHJpbyA9IHEtPnNjaGVkX3Byb3Bz
LnByaW9yaXR5Ow0KPj4gCXUzMiB0aW1lc2xpY2VfdXMgPSBxLT5zY2hlZF9wcm9wcy50aW1lc2xp
Y2VfdXM7DQo+PisJdTMyIHNscGNfY3R4X2ZyZXFfcmVxID0gMDsNCj4+IAl1MzIgcHJlZW1wdF90
aW1lb3V0X3VzID0gcS0+c2NoZWRfcHJvcHMucHJlZW1wdF90aW1lb3V0X3VzOw0KPj4gDQo+PiAJ
eGVfZ3RfYXNzZXJ0KGd1Y190b19ndChndWMpLCBleGVjX3F1ZXVlX3JlZ2lzdGVyZWQocSkpOw0K
Pj4gDQo+PisJaWYgKHEtPmZsYWdzICYgRFJNX1hFX0VYRUNfUVVFVUVfTE9XX0xBVEVOQ1lfSElO
VCkNCj4+KwkJc2xwY19jdHhfZnJlcV9yZXEgfD0gU0xQQ19FWEVDX1FVRVVFX0ZSRVFfUkVRX0lT
X0NPTVBVVEU7DQo+PisNCj4+IAlfX2d1Y19leGVjX3F1ZXVlX3BvbGljeV9zdGFydF9rbHYoJnBv
bGljeSwgcS0+Z3VjLT5pZCk7DQo+PiAJX19ndWNfZXhlY19xdWV1ZV9wb2xpY3lfYWRkX3ByaW9y
aXR5KCZwb2xpY3ksIHhlX2V4ZWNfcXVldWVfcHJpb190b19ndWNbcHJpb10pOw0KPj4gCV9fZ3Vj
X2V4ZWNfcXVldWVfcG9saWN5X2FkZF9leGVjdXRpb25fcXVhbnR1bSgmcG9saWN5LCB0aW1lc2xp
Y2VfdXMpOw0KPj4gCV9fZ3VjX2V4ZWNfcXVldWVfcG9saWN5X2FkZF9wcmVlbXB0aW9uX3RpbWVv
dXQoJnBvbGljeSwgcHJlZW1wdF90aW1lb3V0X3VzKTsNCj4+KwlfX2d1Y19leGVjX3F1ZXVlX3Bv
bGljeV9hZGRfc2xwY19jdHhfZnJlcV9yZXEoJnBvbGljeSwgDQo+PitzbHBjX2N0eF9mcmVxX3Jl
cSk7DQo+PiANCj4+IAl4ZV9ndWNfY3Rfc2VuZCgmZ3VjLT5jdCwgKHUzMiAqKSZwb2xpY3kuaDJn
LA0KPj4gCQkgICAgICAgX19ndWNfZXhlY19xdWV1ZV9wb2xpY3lfYWN0aW9uX3NpemUoJnBvbGlj
eSksIDAsIDApOyBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggaW5kZXggZjYyNjg5Y2E4NjFhLi5iZDAxNTBkMjIwMGMgMTAw
NjQ0DQo+Pi0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4+KysrIGIvaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaA0KPj5AQCAtMTA5Nyw2ICsxMDk3LDcgQEAgc3RydWN0IGRybV94ZV92
bV9iaW5kIHsNCj4+ICAqICAgICAgICAgLmVuZ2luZV9jbGFzcyA9IERSTV9YRV9FTkdJTkVfQ0xB
U1NfUkVOREVSLA0KPj4gICogICAgIH07DQo+PiAgKiAgICAgc3RydWN0IGRybV94ZV9leGVjX3F1
ZXVlX2NyZWF0ZSBleGVjX3F1ZXVlX2NyZWF0ZSA9IHsNCj4+KyAqICAgICAgICAgIC5mbGFncyA9
IERSTV9YRV9FWEVDX1FVRVVFX0xPV19MQVRFTkNZX0hJTlQgb3IgMA0KPj4gICogICAgICAgICAg
LmV4dGVuc2lvbnMgPSAwLA0KPj4gICogICAgICAgICAgLnZtX2lkID0gdm0sDQo+PiAgKiAgICAg
ICAgICAubnVtX2JiX3Blcl9leGVjID0gMSwNCj4+QEAgLTExMTAsNyArMTExMSw2IEBAIHN0cnVj
dCBkcm1feGVfZXhlY19xdWV1ZV9jcmVhdGUgew0KPj4gI2RlZmluZSBEUk1fWEVfRVhFQ19RVUVV
RV9FWFRFTlNJT05fU0VUX1BST1BFUlRZCQkwDQo+PiAjZGVmaW5lICAgRFJNX1hFX0VYRUNfUVVF
VUVfU0VUX1BST1BFUlRZX1BSSU9SSVRZCQkwDQo+PiAjZGVmaW5lICAgRFJNX1hFX0VYRUNfUVVF
VUVfU0VUX1BST1BFUlRZX1RJTUVTTElDRQkJMQ0KPj4tDQo+PiAJLyoqIEBleHRlbnNpb25zOiBQ
b2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBpZiBhbnkgKi8NCj4+IAlfX3U2
NCBleHRlbnNpb25zOw0KPj4gDQo+PkBAIC0xMTIzLDYgKzExMjMsNyBAQCBzdHJ1Y3QgZHJtX3hl
X2V4ZWNfcXVldWVfY3JlYXRlIHsNCj4+IAkvKiogQHZtX2lkOiBWTSB0byB1c2UgZm9yIHRoaXMg
ZXhlYyBxdWV1ZSAqLw0KPj4gCV9fdTMyIHZtX2lkOw0KPj4gDQo+PisjZGVmaW5lIERSTV9YRV9F
WEVDX1FVRVVFX0xPV19MQVRFTkNZX0hJTlQJKDB4MSA8PCAxKQ0KPj4gCS8qKiBAZmxhZ3M6IE1C
WiAqLw0KPj4gCV9fdTMyIGZsYWdzOw0KPj4gDQo+Pi0tDQo+PjIuMzQuMQ0KPj4iDQoNCkFja2Vk
LWJ5OiBNaWNoYWwgTXJvemVrIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NCg0KDQo=
