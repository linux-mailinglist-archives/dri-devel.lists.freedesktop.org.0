Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC6D00E55
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CE210E66D;
	Thu,  8 Jan 2026 03:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kg9T25cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FAF10E216;
 Thu,  8 Jan 2026 03:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767843763; x=1799379763;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nERX5Ay73Z/ayvAcdxrpOU3LCzBFhHeupVvpHsupjL8=;
 b=kg9T25cquwP/Ou+xzBuhotqjL2hX+Tc0tdshkC/ZZgA73HA6H4G97EIQ
 wbq+3kaUN1AIi5En160AHl9EBljlyb9gaezZwgPI18pdZ1x+PlpRdhkQm
 ry35oM1OreBso8R0my9yPBurrlj8UgpHye0UGnaKQfNtjR0QkZKGiTKAE
 IbbUmw7LGQakfl5iEWX7eIVf70W7RHnk69WUlCjKR6Nq7qo+9R+NgMoyJ
 Urn9TLSyDN1IrJm8tjOY9uljEtDnLsI/3XwEBN7rMo1ztC2Eob4AHRJ2V
 6K67u/Nf3Utw5Tjw9sHuqVfWDb2oOoMqre2w43f7clP6cmWVJzYadHtsJ g==;
X-CSE-ConnectionGUID: 9FOuqhPDSkyHrIRDwI71Yg==
X-CSE-MsgGUID: bAZaVNShScuCRskOiksCnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73073982"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="73073982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 19:42:42 -0800
X-CSE-ConnectionGUID: t22mFSMMRV2y1IJ1kynkSQ==
X-CSE-MsgGUID: O1/SiTVASKedWUV5E5DVVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="208160462"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 19:42:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 19:42:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 19:42:41 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 19:42:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGE0MVIH8lMOC7AYMJ0xBIJbK4EnDUzzjkLuhFUe40JDBk5VJuVxT38VpqH7/0zol+3xS6ipdVoqI00gC8tGGWbWAxyO4vy8lFmBeshA+DWirBtqKKjxLpQjwWfKEl4VKrKfXn4ykT3eRYziZqDqMDp7FCWmJ7PAZ4Y6LDXDDD94oCpE7RAvPeZPbbYxZg06Zdxsu4LgysYjCaOdYms78vWIZa+iGwPesNeNf4Z/OSUiznbiozoC4YEKWv6lZoOEgk2UzX0d2w54wndEt4iB+dyzgPXN9SCllfCVmbOFlRLF/wXa542OnTNI8kBeKdrBLuSqHSSWaGEfPaV9dPE5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2c44sXqI1TR3W7a0yWVlKR8HnzmyCAZf1ykE7u95SQ=;
 b=HeXFshXU58CxIiYEzbuWqx5dthB1HTmDNgPr947VdolNh+ZOKKOUK9uMTy2FGQNaO4xjO8j5mSKPTHKyp8+8XuYhrCIg4O3GpPRuHupwh2NmL0HirXPI/ouQZEKjHqg7KBTgwRDRWgLnvEa3hDMPYpggtPr1BTwdCQ81+CwhTvqfC2SYlhPY4G0M/fsRbZ/1k+Sm6EbDgpozWB4tuDYM0DCqrf+i0LIvmfF8g3huN/RD0fPBDl4nyG8F59ezdPTh4meqrHDfcAq9A+prvHeVg84FA80FUxpR4zDbow270NoKdJstHgvyRbAo2X+4MvRGoCd6lKPWt2cFBIjLITLGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 03:42:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 03:42:34 +0000
Date: Wed, 7 Jan 2026 19:42:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Zi Yan <ziy@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, "Francois
 Dugast" <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Andrew Morton <akpm@linux-foundation.org>, 
 <linux-mm@kvack.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Message-ID: <aV8np0dX/qSzGOdv@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
 <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
 <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
 <b39d13b2-cc10-4803-b6b8-0a0447aa3349@nvidia.com>
 <aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com>
 <0419825F-D627-41E9-887D-51E18A2D54E7@nvidia.com>
 <w22y7ioppcgcqikwko5v6zf4c42pdv345d6vt2kvk3dcmtmi6e@mn6undehc6xb>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w22y7ioppcgcqikwko5v6zf4c42pdv345d6vt2kvk3dcmtmi6e@mn6undehc6xb>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ac93e3-15f7-42ad-fc07-08de4e67f5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ci9wOEF3eDhJQnpoMXZtZ21ZQTJOK2lENEZ0Q3FqRm1qRjdqVlEvV1crRk93?=
 =?utf-8?B?MWpxN1ErakNNZXpveUgreGpCNU9DbmpIZEU1Z3k5K1A1QWF0NWdqQlhSdk9u?=
 =?utf-8?B?QkhUem1oNW43NDNVb1h4Z0pvK0xhMDRqOHpLWDQ5Sy8xZ2FWVC9hSEFDMnZV?=
 =?utf-8?B?LzYrekZhVnpvRDU0L25jb3h6RHp1SDZEcTVDRU9RRUs2bW1EeTJIOG1wbFRL?=
 =?utf-8?B?MGU5cFN2K0V1VGs4ZXJOSURXY3UxMTdwcFVVQTZlSFhJNU5ZV1dGZDNJRk9w?=
 =?utf-8?B?cUZwTG4xQy9JbnlTL1NETkF3aGNnYUVSVHp1Z3Y0bUdMcU9BZEQ0WjA1SkNV?=
 =?utf-8?B?MmNDdzBTV1pKdnhCQ0NDTXJ5YVJRUEExSEU1YiswMzkrYUdWRm5QM05ra0pP?=
 =?utf-8?B?bjZOUWJXcDN3MjVXbHlsOFdHc1kvQllhVjBFSGhuclRBV1ZIQVhEWFQrZnBq?=
 =?utf-8?B?QzJKWGVnSmpvRWdMMGpobWVlK2JlUy8rMW1mbHZ5Q3JwMXE0MjhOMzE4aTRD?=
 =?utf-8?B?Y2dWK1hCTWNKdUlpNE9OR0tEcHhXRGNOSVd6NzR3bjJZRlA5OGpFbUZZTUxV?=
 =?utf-8?B?U204R3pjVWt0Szlmak14UlBLSXJlMzQzUFd1eDFub0NtekYyNmxaRnRQaS93?=
 =?utf-8?B?Tzl3cnZEcDF4bmI2RjZQOXIwOCtNbTRtVGo5dkI4RExES1RBSnlZRDIydnRz?=
 =?utf-8?B?N1FEenVwUTV3c1kwUHB3aTVOb015aGRVeFpjNFlOaTJOdlFLeDlYeTJyMGo4?=
 =?utf-8?B?c1o1ZWxJU0VwNWNkSWFjYTFqMndXRWg5OUhJYmN6a3NiQUV2YWZhM1FhbEtV?=
 =?utf-8?B?K1JKckhoNGVZSllzZnNuU1haU3lWNTBZNEdpcmxRTXZXQko5NjB5ZmFBS0Q1?=
 =?utf-8?B?U2RJNmdaYzZxVmxVRVUrUTRGTmhUQ09iS2h3L2h1d3R5SEx5bWFqdFpRRmc3?=
 =?utf-8?B?RmpWbVpLa0cvUnNveUNTSTlLcEJCNWxJMk1CaVlWQzRYSDFGRy9GdjVzTjRE?=
 =?utf-8?B?OC9nc0JxT2c1WXZteGRmaXJ4NXNaOGZVdXJndmp5M1R5dVZSa1hMRUNoMExs?=
 =?utf-8?B?ZHF4Z1ZlYnJKMFpseGV6cUV4dEJkT3FOSjRRc2tiOWNqVEQ1ZU0wUGhKRk5F?=
 =?utf-8?B?ckFzWjZncEl2aHVqQjQvRkpYaFBaVnBtNUJYb1hkOGJYRVBkVzQxdGJNZm9x?=
 =?utf-8?B?cDh6L3dzZ0tpdGErNjBnaTc1S1FKQmRHYy81TjRnbXJtMkU5dVkzY0RzNDIv?=
 =?utf-8?B?Yk0wNk1hdFlBZDFGeE5vL3FCYk1tQjgxUHdoTmFPZmsrUmhkMGQyaWI2NFB0?=
 =?utf-8?B?ZHUzejRXM2o4b2d1QWlpZTdiTml5Rk5HOUI3Y2hrRkR6NEFkVWxaVElveEtQ?=
 =?utf-8?B?VVZnb21sVDV1azNYV3Roc0QxYnV0Qkd6V0w3M2hTbmx4aGVsYjZMRUFDb2xR?=
 =?utf-8?B?SUNLakQ0NGtFTmZDa3lRMWd4VGlBODA4dmlCMHNEenBQZCtiNlg3ZEgyb1Nu?=
 =?utf-8?B?UmJOQ1Y1b09WN0toaGRYUmZ2Tlg2RHBDTnQwWTN0Y3pKaFVnQ0d1a1ZHM0sy?=
 =?utf-8?B?SzZqMmhodVlyclNLc3VUQXY0SXpFYytDVzV6NW5RSWlTcjJzb0V6MFNoS2g0?=
 =?utf-8?B?VmhiVUphMkc3eWJ6RVVQckZMRHdlYlhCNWEydkRCR0piblV5K0Jpd2ZxbWJ5?=
 =?utf-8?B?aTJKek5hUG9XWHNIcUZpaWlHYm1ibi9tVGtTTFUrN3N2ZDZOS3U4UUVaOGxK?=
 =?utf-8?B?L3hhY1lzR2ZxdDNmMnlMSGNHdTFtaWlzV21yTWFoeVdTSnRYZDQzRlJkWlMw?=
 =?utf-8?B?THJLaDRjU1VCQkR1MTV5YU1WdE93TFhGbFJTTm9MVmlqR2RwVUVLekU5eEFH?=
 =?utf-8?B?RGY5QnJkRktUVWdNTEdKZXlIZ1VpUi9ldUtTcVJnTnFNR2tjVHVHb0s1WVVs?=
 =?utf-8?Q?nUQU6Jql6NEFWXX+/KDHinlOm7LBM8Ge?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVGQm1LSURzemVtSnUzRmVzaFM4WDhkcVgyT0wyK3hvZEZybU9sNUlzZDV3?=
 =?utf-8?B?UEFJWTMvNGRQcVF4dHZZRHR6YytuUW5Bbm5MVndPanF0MExJanY2TEQySEtQ?=
 =?utf-8?B?YVJBRS8rUit4WEdpNGxJelhsYlRjRXNuTWhCWmxNejBCM3BMcThnOExqaElY?=
 =?utf-8?B?d01MRzUzbHdReVJZMmpxUWF4M1p3SmE3d2lyeXQrSDJzTVE3LzZlc1VXSnZZ?=
 =?utf-8?B?M0FIdEJ4cC9laVV1R1BTemNNRzVTRS9Yb2t6amtGVm8vM1U2WTVhRis4WU1r?=
 =?utf-8?B?MGdLb2VOeVN2THVxQ1RHemZsbGdIaSs0ckVqWU9DNFAzeVFxdmlYQ0NlczU0?=
 =?utf-8?B?Y0Z6ci9GOEFJL1M4bTlxeHFjWTE1SDU5RUw4d082M2l3c0E4SXNtS1h5ZEhH?=
 =?utf-8?B?TTkxRkhTakN5V0JCNWtGT0Q0RkpIdGlMKzQxM3dERk1zbjRkR0FRZWpnZXgw?=
 =?utf-8?B?L2xKT05TZFFlWERDbVFxemlyU2tWd0VsWlRBUUw2YWFVNGR5MG81eXpuMVNo?=
 =?utf-8?B?OWJtQW1RbGhlZnA5NnZpWWdaQ0pmTmUwMWZTM3J4cHBienZhSWNiR1RnTk5V?=
 =?utf-8?B?NWNrYWVvYXEyWkZlcGd5aGk1OW02YVZpNkM0ZW9VWkhzNFBBdGNjNW5rdkM2?=
 =?utf-8?B?Zll1Wk5zb09BbVA2R1FtUWpYcnQ5WlF1STJZcGRvbmlVc3B5SzNwVlFWcndV?=
 =?utf-8?B?dkpFMTZqelFoZER0czZ2NjVONFZGNGNWdDE2N0dhY3dSdWNNRmluK3B6bXdV?=
 =?utf-8?B?R0NUREZBRm1sTTJyMUxLZ1p6YjlwOWp1VGR6SnZuajFncVRheXZscEQvK2VF?=
 =?utf-8?B?RjY4VWhPSkZiRzEvY1FkaE01YWFjdlAwemJrME4xZWpnSmM4VTExaElOL3NO?=
 =?utf-8?B?aXg2bGRKVmpSR3lrYS9wRkNMOWpxSUJOVzE5cmdFTVFJSVpkeFpodkY2dTd3?=
 =?utf-8?B?TzR2RzhhalZxMllYRDhvd2grZHJMNWx6VXZWU3lXUFRUaFlmODR2MzVUcytD?=
 =?utf-8?B?azJtRnpjZ3FUUnlsb3owd2JwZTNoY1Q1K2hPNDRTaGhKN2dULzgxZVRQRlhn?=
 =?utf-8?B?VTlHL0pScGNkWmNKdjg2R0c2UjgzcUs3cm00U3oxRTZRYmVYQ211SmNTUTM0?=
 =?utf-8?B?ZUdjdzZtam1KQVo5NlhaV2lwSUxWYjVFQ1lsOHk4UmY5aUdxaVlSWmdLZkJ1?=
 =?utf-8?B?UVg5U3VZWS9PR2FXTUJtZytYSGFWZlRYNWF0eG0yVnByUmlhbWtlUng0N212?=
 =?utf-8?B?b21JSUdXN3hJQmRxMXVLd0FoaDVJeklmc0ZnUFYyRTZaK29nM0ZFSDc5anNk?=
 =?utf-8?B?MWVNWWNtY1Q0NnV6WXRlNlQ3TXZydFcyM09aZHFYb0hvTW11WldGa2JGTkVN?=
 =?utf-8?B?SWdkRS9STGZYN0dicTdpa1NCR3Z2c0p0WEpGUjAxOVRUUjE0RnFTQlJTd3hn?=
 =?utf-8?B?MGxVc3pXTkp2YmQ5V3hHRGgvdzU2L1BXWW5uKzJPMDduT3AwdTNzK2JxdVZF?=
 =?utf-8?B?UFc2MzQ2NjYxYmxOVE1Rb3dDWDhrdlh1M3JUODE2U050MjFDTXR2RUVHTjRS?=
 =?utf-8?B?WkJjUHBqVjVYM0s4SjdJUTh4eVNwYTlzdkJlN1FkWVlQZ0xzVmV0eGVjQ0g5?=
 =?utf-8?B?UWw2bXhOVC8xcjA5MVdUWmlIV2hHeVdWc0FYNGVSUDNpV0MySHBNNEhmT2hi?=
 =?utf-8?B?bS9SUEVoR3lKSnpBQ24vZWdpVFNDb2Y4Q2V3RE0xekkzZGxsaFliRUdMdS9s?=
 =?utf-8?B?dmhTN3haWGVIdkFWVDB3OFdXSjVXN1ZHcUVJK01hTWd4S3lKUkYxTXFSZ0Zt?=
 =?utf-8?B?Wnl1K0RxWHdlNnpwUjl1NWVOZTEzTU54bTFhUHMzTUM3OG90NVJlbkcxYUVP?=
 =?utf-8?B?REpNM1R3Sm9STktoZGVQQm9XUVJCOTd5cEttUEJPcDlxVTVtYUkveXhpRVp1?=
 =?utf-8?B?ZDBpOHBld1ByZ05sU0wzUlliYlpiclJITGloS3IxVnF5cDNJL0NzTU9tb2hx?=
 =?utf-8?B?dzR2czFRN0F6ZkdsaEoyYXhRMXhHV21MWGNGOHloclpINTQ0NEp5dVN1ZE9j?=
 =?utf-8?B?Z21kVHVCM1dXeXJWY3g2T3BIOERmTEhNbU9TTHd2dzVCaTlyV00wTGVlUmk2?=
 =?utf-8?B?OU1iaktwTjV4RkxYQ2dOamVOTUY0NUI2M1IvT2UzclFzWE00aDZuTTN3VUlu?=
 =?utf-8?B?eVhYRDc2UFhYWFltNng3amljOFFtS204R09LUVp1THdHWUQrUDhucFZlSWJ0?=
 =?utf-8?B?K3pPNWNZSVNwaUU3U29vcHBpWU51SzhjdkxOVTgxNzVET3V6Lzl6bFZHSWhZ?=
 =?utf-8?B?d0lmV0VuR2g1VHB2Q2NaSDd1RHVYL3BZZHNNWkl6WUdzeTVDV0R1MHdMclZF?=
 =?utf-8?Q?HhbMYBuX+HyMYuks=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ac93e3-15f7-42ad-fc07-08de4e67f5b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 03:42:34.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/4fRsufQLjUHhIGeXXkdZbJbGjLYOgE+us7BDAIaUqipUg96XgbmVeV1jGvwfT9Vhk1TjI7ldvWeO6eUY1pGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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

On Thu, Jan 08, 2026 at 02:14:28PM +1100, Alistair Popple wrote:
> On 2026-01-08 at 13:53 +1100, Zi Yan <ziy@nvidia.com> wrote...
> > On 7 Jan 2026, at 21:17, Matthew Brost wrote:
> > 
> > > On Thu, Jan 08, 2026 at 11:56:03AM +1100, Balbir Singh wrote:
> > >> On 1/8/26 08:03, Zi Yan wrote:
> > >>> On 7 Jan 2026, at 16:15, Matthew Brost wrote:
> > >>>
> > >>>> On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
> > >>>>> On 7 Jan 2026, at 15:20, Zi Yan wrote:
> > >>>>>
> > >>>>>> +THP folks
> > >>>>>
> > >>>>> +willy, since he commented in another thread.
> > >>>>>
> > >>>>>>
> > >>>>>> On 16 Dec 2025, at 15:10, Francois Dugast wrote:
> > >>>>>>
> > >>>>>>> From: Matthew Brost <matthew.brost@intel.com>
> > >>>>>>>
> > >>>>>>> Introduce migrate_device_split_page() to split a device page into
> > >>>>>>> lower-order pages. Used when a folio allocated as higher-order is freed
> > >>>>>>> and later reallocated at a smaller order by the driver memory manager.
> > >>>>>>>
> > >>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> > >>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
> > >>>>>>> Cc: dri-devel@lists.freedesktop.org
> > >>>>>>> Cc: linux-mm@kvack.org
> > >>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > >>>>>>> ---
> > >>>>>>>  include/linux/huge_mm.h |  3 +++
> > >>>>>>>  include/linux/migrate.h |  1 +
> > >>>>>>>  mm/huge_memory.c        |  6 ++---
> > >>>>>>>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
> > >>>>>>>  4 files changed, 56 insertions(+), 3 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > >>>>>>> index a4d9f964dfde..6ad8f359bc0d 100644
> > >>>>>>> --- a/include/linux/huge_mm.h
> > >>>>>>> +++ b/include/linux/huge_mm.h
> > >>>>>>> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
> > >>>>>>>  int folio_split_unmapped(struct folio *folio, unsigned int new_order);
> > >>>>>>>  unsigned int min_order_for_split(struct folio *folio);
> > >>>>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
> > >>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
> > >>>>>>> +			   struct page *split_at, struct xa_state *xas,
> > >>>>>>> +			   struct address_space *mapping, enum split_type split_type);
> > >>>>>>>  int folio_check_splittable(struct folio *folio, unsigned int new_order,
> > >>>>>>>  			   enum split_type split_type);
> > >>>>>>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
> > >>>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > >>>>>>> index 26ca00c325d9..ec65e4fd5f88 100644
> > >>>>>>> --- a/include/linux/migrate.h
> > >>>>>>> +++ b/include/linux/migrate.h
> > >>>>>>> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> > >>>>>>>  			unsigned long npages);
> > >>>>>>>  void migrate_device_finalize(unsigned long *src_pfns,
> > >>>>>>>  			unsigned long *dst_pfns, unsigned long npages);
> > >>>>>>> +int migrate_device_split_page(struct page *page);
> > >>>>>>>
> > >>>>>>>  #endif /* CONFIG_MIGRATION */
> > >>>>>>>
> > >>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > >>>>>>> index 40cf59301c21..7ded35a3ecec 100644
> > >>>>>>> --- a/mm/huge_memory.c
> > >>>>>>> +++ b/mm/huge_memory.c
> > >>>>>>> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
> > >>>>>>>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
> > >>>>>>>   * split but not to @new_order, the caller needs to check)
> > >>>>>>>   */
> > >>>>>>> -static int __split_unmapped_folio(struct folio *folio, int new_order,
> > >>>>>>> -		struct page *split_at, struct xa_state *xas,
> > >>>>>>> -		struct address_space *mapping, enum split_type split_type)
> > >>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
> > >>>>>>> +			   struct page *split_at, struct xa_state *xas,
> > >>>>>>> +			   struct address_space *mapping, enum split_type split_type)
> > >>>>>>>  {
> > >>>>>>>  	const bool is_anon = folio_test_anon(folio);
> > >>>>>>>  	int old_order = folio_order(folio);
> > >>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > >>>>>>> index 23379663b1e1..eb0f0e938947 100644
> > >>>>>>> --- a/mm/migrate_device.c
> > >>>>>>> +++ b/mm/migrate_device.c
> > >>>>>>> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
> > >>>>>>>  EXPORT_SYMBOL(migrate_vma_setup);
> > >>>>>>>
> > >>>>>>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> > >>>>>>> +/**
> > >>>>>>> + * migrate_device_split_page() - Split device page
> > >>>>>>> + * @page: Device page to split
> > >>>>>>> + *
> > >>>>>>> + * Splits a device page into smaller pages. Typically called when reallocating a
> > >>>>>>> + * folio to a smaller size. Inherently racy—only safe if the caller ensures
> > >>>>>>> + * mutual exclusion within the page's folio (i.e., no other threads are using
> > >>>>>>> + * pages within the folio). Expected to be called a free device page and
> > >>>>>>> + * restores all split out pages to a free state.
> > >>>>>>> + */
> > >>>>>
> > >>>>> Do you mind explaining why __split_unmapped_folio() is needed for a free device
> > >>>>> page? A free page is not supposed to be a large folio, at least from a core
> > >>>>> MM point of view. __split_unmapped_folio() is intended to work on large folios
> > >>>>> (or compound pages), even if the input folio has refcount == 0 (because it is
> > >>>>> frozen).
> > >>>>>
> > >>>>
> > >>>> Well, then maybe this is a bug in core MM where the freed page is still
> > >>>> a THP. Let me explain the scenario and why this is needed from my POV.
> > >>>>
> > >>>> Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
> > >>>> This is a shared pool between traditional DRM GEMs (buffer objects) and
> > >>>> SVM allocations (pages). It doesn’t have any view of the page backing—it
> > >>>> basically just hands back a pointer to VRAM space that we allocate from.
> > >>>> From that, if it’s an SVM allocation, we can derive the device pages.
> > >>>>
> > >>>> What I see happening is: a 2M buddy allocation occurs, we make the
> > >>>> backing device pages a large folio, and sometime later the folio
> > >>>> refcount goes to zero and we free the buddy allocation. Later, the buddy
> > >>>> allocation is reused for a smaller allocation (e.g., 4K or 64K), but the
> > >>>> backing pages are still a large folio. Here is where we need to split
> > >>>
> > >>> I agree with you that it might be a bug in free_zone_device_folio() based
> > >>> on my understanding. Since zone_device_page_init() calls prep_compound_page()
> > >>> for >0 orders, but free_zone_device_folio() never reverse the process.
> > >>>
> > >>> Balbir and Alistair might be able to help here.
> 
> Just catching up after the Christmas break.
> 

I think everyone is and scrambling for the release PR. :)

> > >>
> > >> I agree it's an API limitation
> > 
> > I am not sure. If free_zone_device_folio() does not get rid of large folio
> > metadata, there is no guarantee that a freed large device private folio will
> > be reallocated as a large device private folio. And when mTHP support is
> > added, the folio order might change too. That can cause issues when
> > compound_head() is called on a tail page of a previously large folio, since
> > compound_head() will return the old head page instead of the tail page itself.
> 
> I agree that freeing the device folio should get rid of the large folio. That
> would also keep it consistent with what we do for FS DAX for example.
> 

+1

> > >>
> > >>>
> > >>> I cherry picked the code from __free_frozen_pages() to reverse the process.
> > >>> Can you give it a try to see if it solve the above issue? Thanks.
> 
> It would be nice if this could be a common helper for freeing compound
> ZONE_DEVICE pages. FS DAX already has this for example:
> 
> static inline unsigned long dax_folio_put(struct folio *folio)
> {
> 	unsigned long ref;
> 	int order, i;
> 
> 	if (!dax_folio_is_shared(folio))
> 		ref = 0;
> 	else
> 		ref = --folio->share;
> 
> 	if (ref)
> 		return ref;
> 
> 	folio->mapping = NULL;
> 	order = folio_order(folio);
> 	if (!order)
> 		return 0;
> 	folio_reset_order(folio);
> 
> 	for (i = 0; i < (1UL << order); i++) {
> 		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> 		struct page *page = folio_page(folio, i);
> 		struct folio *new_folio = (struct folio *)page;
> 
> 		ClearPageHead(page);
> 		clear_compound_head(page);
> 
> 		new_folio->mapping = NULL;
> 		/*
> 		 * Reset pgmap which was over-written by
> 		 * prep_compound_page().
> 		 */
> 		new_folio->pgmap = pgmap;
> 		new_folio->share = 0;
> 		WARN_ON_ONCE(folio_ref_count(new_folio));
> 	}
> 
> 	return ref;
> }
> 
> Aside from the weird refcount checks that FS DAX needs to at the start of this
> function I don't think there is anything specific to DEVICE_PRIVATE pages there.
> 

Thanks for the reference, Alistair. This looks roughly like what I
hacked together in an effort to just get something working. I believe a
common helper can be made to work. Let me churn on this tomorrow and put
together a proper patch.

> > >>>
> > >>> From 3aa03baa39b7e62ea079e826de6ed5aab3061e46 Mon Sep 17 00:00:00 2001
> > >>> From: Zi Yan <ziy@nvidia.com>
> > >>> Date: Wed, 7 Jan 2026 16:49:52 -0500
> > >>> Subject: [PATCH] mm/memremap: free device private folio fix
> > >>> Content-Type: text/plain; charset="utf-8"
> > >>>
> > >>> Signed-off-by: Zi Yan <ziy@nvidia.com>
> > >>> ---
> > >>>  mm/memremap.c | 15 +++++++++++++++
> > >>>  1 file changed, 15 insertions(+)
> > >>>
> > >>> diff --git a/mm/memremap.c b/mm/memremap.c
> > >>> index 63c6ab4fdf08..483666ff7271 100644
> > >>> --- a/mm/memremap.c
> > >>> +++ b/mm/memremap.c
> > >>> @@ -475,6 +475,21 @@ void free_zone_device_folio(struct folio *folio)
> > >>>  		pgmap->ops->folio_free(folio);
> > >>>  		break;
> > >>>  	}
> > >>> +
> > >>> +	if (nr > 1) {
> > >>> +		struct page *head = folio_page(folio, 0);
> > >>> +
> > >>> +		head[1].flags.f &= ~PAGE_FLAGS_SECOND;
> > >>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > >>> +		folio->_nr_pages = 0;
> > >>> +#endif
> > >>> +		for (i = 1; i < nr; i++) {
> > >>> +			(head + i)->mapping = NULL;
> > >>> +			clear_compound_head(head + i);
> > >>
> > >> I see that your skipping the checks in free_page_tail_prepare()? IIUC, we should be able
> > >> to invoke it even for zone device private pages
> > 
> > I am not sure about what part of compound page is also used in device private folio.
> > Yes, it is better to add right checks.
> > 
> > >>
> > >>> +		}
> > >>> +		folio->mapping = NULL;
> > >>
> > >> This is already done in free_zone_device_folio()
> > >>
> > >>> +		head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> > >>
> > >> I don't think this is required for zone device private folios, but I suppose it
> > >> keeps the code generic
> > >>
> > >
> > > Well, the above code doesn’t work, but I think it’s the right idea.
> > > clear_compound_head aliases to pgmap, which we don’t want to be NULL. I
> > 
> > Thank you for pointing it out. I am not familiar with device private page code.
> > 
> > > believe the individual pages likely need their flags cleared (?), and
> > 
> > Yes, I missed the tail page flag clearing part.
> > 

I think the page head is the only thing that really needs to be cleared,
though I could be wrong.

> > > this step must be done before calling folio_free and include a barrier,
> > > as the page can be immediately reallocated.
> > >
> > > So here’s what I came up with, and it seems to work (for Xe, GPU SVM):
> > >
> > >  mm/memremap.c | 21 +++++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > >
> > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > index 63c6ab4fdf08..ac20abb6a441 100644
> > > --- a/mm/memremap.c
> > > +++ b/mm/memremap.c
> > > @@ -448,6 +448,27 @@ void free_zone_device_folio(struct folio *folio)
> > >             pgmap->type != MEMORY_DEVICE_GENERIC)
> > >                 folio->mapping = NULL;
> > >
> > > +       if (nr > 1) {
> > > +               struct page *head = folio_page(folio, 0);
> > > +
> > > +               head[1].flags.f &= ~PAGE_FLAGS_SECOND;
> > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > +               folio->_nr_pages = 0;
> > > +#endif
> > > +               for (i = 1; i < nr; i++) {
> > > +                       struct folio *new_folio = (struct folio *)(head + i);
> > > +
> > > +                       (head + i)->mapping = NULL;
> > > +                       (head + i)->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> > > +
> > > +                       /* Overwrite compound_head with pgmap */
> > > +                       new_folio->pgmap = pgmap;
> > > +               }
> > > +
> > > +               head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> > > +               smp_wmb();	/* Changes but be visable before freeing folio */
> > > +       }
> > > +
> > >         switch (pgmap->type) {
> > >         case MEMORY_DEVICE_PRIVATE:
> > >         case MEMORY_DEVICE_COHERENT:
> > >
> > 
> > It looks good to me, but I am very likely missing the detail on device private
> > pages. Like Balbir pointed out above, for tail pages, calling
> > free_tail_page_prepare() might be better to get sanity checks like normal
> > large folio, although you will need to set ->pgmap after it.
> > 
> > It is better to send it as a proper patch and get reviews from other
> > MM folks.
> > 

Yes, agreed. See above—I’ll work on a proper patch tomorrow and CC all
the correct MM folks. Aiming to have something ready for the next
release PR.

Matt

> > >>> +	}
> > >>>  }
> > >>>
> > >>>  void zone_device_page_init(struct page *page, unsigned int order)
> > >>
> > >>
> > >> Otherwise, it seems like the right way to solve the issue.
> > >>
> > >
> > > My question is: why isn’t Nouveau hitting this issue, or your Nvidia
> > > out-of-tree driver (lack of testing, Xe's test suite coverage is quite
> > > good at finding corners).
> > >
> > > Also, will this change in behavior break either ofthose drivers?
> > >
> > > Matt
> > >
> > >> Balbir
> > 
> > 
> > Best Regards,
> > Yan, Zi
