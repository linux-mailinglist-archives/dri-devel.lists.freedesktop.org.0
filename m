Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B2B1703B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 13:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5310E779;
	Thu, 31 Jul 2025 11:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjuM5V4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187E10E778;
 Thu, 31 Jul 2025 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753960474; x=1785496474;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VlhhuX2P2rQBfUbtvzpEt2LJH9fZQtvvGuZ29muzmKc=;
 b=gjuM5V4Z3+UuEoe9WX3DWgFTfDRA/CA15Poj8B2ESTjUZGKbIfUWcw9R
 xPMEBBsN5mdstV7P7mnystqOXtmMcGBRCM68aUbI58qXjnZANnFFexrgk
 KE+TGpUyKWIZNP8ZNs2zW8uH2ivdd/FJX1owxW6r2O/RPMxNGr495e45l
 b8lxxvHrn11+/wjbM6u4aLKZhe5rQ25XnvJNwxW+I9+XyaSB8R1628r20
 l1fLbR4LG0uL6HNPMp1hMqukStkuP55ufCpaw6qlzgLFOaVkImaGslDOd
 nAVzefD8Vx6oM9qvOMWiYRWdm+dY/vrltty91Lh4jJgSnvoC3uoPH6mXx w==;
X-CSE-ConnectionGUID: F2nmNXBDS+Olts0+jQPahQ==
X-CSE-MsgGUID: M03HDxVyS5a4xiISSDXMtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60105712"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="60105712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 04:14:34 -0700
X-CSE-ConnectionGUID: b0fEMoVGTHaczIEmXtzT/w==
X-CSE-MsgGUID: FCi4Lk4bTuq5jQgtCajgNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="163128611"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 04:14:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 04:14:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 04:14:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 04:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfUcL8BPjNREnL7Q58nZz0kkmSp+/6Nn6kPi/5Lqd7aiEgq11MWLyzlQEDUPVaR+ZtGYmxjWSn4lveP7I55tcuWVkiL/V4vniaZSu73HyZIORSapSllDOXKPmi019H8aGdywoRsoUtC47yhwdAKYMm7SUy4/pQmhpcwAz1TiY7TwFeGsrAAZOAp0GdNkXMJWdqkdr0Qr6BTz2Meeu7BLmU21UNEErhkYIAycn9pUGUuO64cheMa98dSwPJdfGlQhGwb+E9XTr/jPGIdzh/VAgCFrSAvW8bmItMBN0HEcw+w/yFy5nydMhs+hJdHbEBrWEWBnx59prKqmRfy3ELdRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNE6cywBE0BHW7bc+OfkqfDPiJMKvkBaWlK02pysy6Y=;
 b=lvDBMd2ohs3cl1oDz9oZW76mZmddlbFbXgEuZ5m33KIfB1S5Zp3U52k2LKUJeEhE4Ba7CsQlC6W0B12KSnqLwf4anKEEtDZUWFIgWaCSuSdL+/DCPXR56hLG0YuszxAX+T9VeCHoXzXbHVBLIx6EQY7AgJVjNlor+GsJmhqEuNILhjMlvAxWcdq7hqhT9UGbv2IvdPKN+QIoUocDCBRT5Sszflq2CEwVHx74ViK3NZWJ+DLb8TshTovVKVKUi+taJoiucmWAXXaTBVzmqii0fU/oneoXs8cSg88Cx6y/N/BerCiSRrTTEyH92Mb8zne+ZwFUMok/8wouGy5rPwPkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.25; Thu, 31 Jul 2025 11:13:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 11:13:56 +0000
Message-ID: <13e90893-d0dd-4f25-8541-ecfe875c52be@intel.com>
Date: Thu, 31 Jul 2025 16:43:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
To: Maxime Ripard <mripard@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>, David Airlie
 <airlied@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <tzimmermann@suse.de>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
 <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
 <20250731-jovial-realistic-mastiff-2ef2a7@houat>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250731-jovial-realistic-mastiff-2ef2a7@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: a564e732-d8d2-4853-fa71-08ddd0235716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzVuOXN4MWVPNXcxZElnUlFwbFJIaGtlcG1IS3ZQVmkvOWtoR1haZWR1dUc0?=
 =?utf-8?B?UFBvWUp4RXZRZ0VJaWlHM1Jrd2ExVTd5cnV4cGF1VEk5OVFla3o1NVZoR1BL?=
 =?utf-8?B?ck5vemE4L056cG1YQ0poQmsvRmtLL2gyY2NncHgwV3FXMktRbmt6K1lpZzN0?=
 =?utf-8?B?bnVFYy85eTJLRm4zSVAvbTZXTEViVXFjN2VtaUpwWlR3bEVWQ2h2bitwZjVJ?=
 =?utf-8?B?ZDlEUy9tQTUyNTZ3S1V4MFVyb1lHU05sL2dzeTYvUTVhei9iTGllN2hzOEhN?=
 =?utf-8?B?MXVvVDhySVJCbEI1MmhDblBFY3VvaW40Mm1YWjlkMUFybHhiejhpK3U3dlBv?=
 =?utf-8?B?MmZhb3hieVBocDVJVHZ1MW5FcCsrSWsxWkRqdDBSbmh0MXQzS3FRQllDTFpM?=
 =?utf-8?B?WUk2WTExOHRoZUt1TGt6MGtEOFVVdWVOTWx6eTZFR1RaM3kzbGV5VE5tRHRP?=
 =?utf-8?B?aFlyM3E4eGhYQ242K3Y1VmYrS2h3YVBWd3dwYk8vK3F5T0JZa1RqZUZHZkYy?=
 =?utf-8?B?TG9HdlJOd2dxak9IWnlVb1dEZnlJakh0Tjg0clJJZjZaalZhUkhIdVJBQkIy?=
 =?utf-8?B?Z2YxM0JxL2gxOGZ1WTNYN3Rid1BlTSt6UlBnN2MrSGh3TTdpTmNtQ0JESkUz?=
 =?utf-8?B?NVhBNU9QaWlxVE94RlFEb0kzc2t2a2x6akRyVEFkSDVpNVZmQVlHZVQyVS9t?=
 =?utf-8?B?RElaZ1JHczNFT0wxb3VrRGdUUDFBcy9IVmZ4NzFTQU14UUQ2aFlqUEtjV3BC?=
 =?utf-8?B?R05ZQXl4aHd1dVU1cEIxNEpFVGNaZnl5KzZuRk44YmtJSjlYTUZYaUYzbjZp?=
 =?utf-8?B?UWREbFpwU2VvWjIwbHpkNkc2UFdMNUt0aWlESSsxY0xKZmxKSG5XeVZyb3pW?=
 =?utf-8?B?Y0w3ZVpYdkkrYWJSOXAyL0o3dWdTRG1QUUxGaVkvVHo4RktLQW9xUjdkdVVH?=
 =?utf-8?B?ZVpyZGlBZVBOam5aYTFIYlB0dzRMYndCckgvMktHUlMwa1pNTGtYVkRmL3Q0?=
 =?utf-8?B?T3VHYjY2ZzJKZ3htVnJvUVNsdzBJcVZOL1ZGM2ZRTnJyY3hiekZ4VWw3Nk1J?=
 =?utf-8?B?ZXhjVFBmZjVoUjNNd3JZcTM4bVhsN20wY2k4d2E2ZFBMZlNWZ25FMEFBRlVr?=
 =?utf-8?B?REV1Q3doQVpBbE1LeXpnZmhxeVhZWWtFbDNnNkpGMzBPU2JlYmdjZ3paM01W?=
 =?utf-8?B?b05lNnJud3g0Z1Vpd2Vua0VhRE5TVUZ3UzNjdDBsSDFlU3lJSUwzeWhIZEpy?=
 =?utf-8?B?a3FMT2N4NFFDcHo0R3NYd0pwcVc4YkF2bFR0am9XYW55dlI5WjlSaHdiU0Jr?=
 =?utf-8?B?VS8rVzkvK3lLVFd1dGRFaWozclhoc3FOZWZMOTRxcjNXUGs1Qm1xWW5sbEVi?=
 =?utf-8?B?Rk1DTVhKMEtpK2t1Z0NQSExRL1g4UjJPYW9GQ0x2TUdFSjhkcTVSUTNsR0tQ?=
 =?utf-8?B?YUtiYTJmUjNFaDE0N2ZzcXNsZHc5eUlwaXJJcENWeG8wUHUrb0pOUmhhcXgx?=
 =?utf-8?B?M2d5Nk9nMWlxTCt1TWFTTWNZbHplQzBXYzd5aXBiOVc5TFpaYVpuUTRyaW9Y?=
 =?utf-8?B?WEZBTUpydGp6eXFHRHZwUlYrNTV2N3dGaUY1QVlESlA4NFZkZXVpaFVqLzgz?=
 =?utf-8?B?OERHbkJkRklDdlFwVnJjaGlDWTNqL3dvdGdKMUduWHliUFFZUGFlV0FtdmM0?=
 =?utf-8?B?K3BiemZJMmMvV3pGQlNEM0tIWC9oSmtucDcwY1BSN3JjWEsrNnB2UWVOVS96?=
 =?utf-8?B?SktqMENvZkFhWUxTbVR4UlpUcTBkbG9DTk82UTlrOUtqTld3aTN6QkJYSFVm?=
 =?utf-8?B?NGQrMkVzdkRYbFR5bnMrd3djOWovN0NrTldjSUViMTM0Mkh3NnR2WjlGQmsv?=
 =?utf-8?B?akhNSDJTeFU1Njl0YnV3cUZnVEJ3OE5OOXlOUWd6N1NZY092Vzd6VmpFVXpZ?=
 =?utf-8?Q?nkT9CXcTbPQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Si9EUlJpbm56Q2VITlVkR1g0VGROQXlWdVlyTnM3cUlmOUQ0OHV4cS9GWHll?=
 =?utf-8?B?WWFFakw4bkZ0NnFhK1RlRkorL1lpMEMvTWZIMGlSVTZTS3VvOExjN1lmVWk2?=
 =?utf-8?B?R0tJZ1RQdEl2bXZIZ0Z6YUZyT3RaajJ6eXFLYTJ1QUdaQS9vWERqM3JHZE5S?=
 =?utf-8?B?TmVXRUg0dWJtVnZQclpBdWx1eHdmbDFENXhQS2JxdHVrbk9oS1A2SGFYRElp?=
 =?utf-8?B?TWp2cnlTbnFrY2djM2FUaFpaeEpkdi9tZ3JTT28xUWM5WkZzcTlra0w4bWph?=
 =?utf-8?B?RGZBUVl3SW5YYW1ia3NpbDd4L0tmcjVwenpPWWw2djZWNHFraDIra3hTR05v?=
 =?utf-8?B?ei9yRmw2UCtaY0lzQmkvNGh4QVZWV1hSS3FHVnVuMXhRNHUyNXZmU0FEL1BQ?=
 =?utf-8?B?bm5tK1MxVTA4SWY4ZzJ4NGJ1ZUpBZUJ4NHAwZDZieXN1bmtoNU9QUEdFQkJN?=
 =?utf-8?B?SHdlTWpTcUhaaTZ0U2U1eHI5VDgxb29UdzR0ZVBPRVlBSDgzQzduQ2JkM3hL?=
 =?utf-8?B?Skl0RCttcXQyNU1seFh2aFpIMDFhS2NPcFlyL1dOdWE2cWJmcjdKOHRPUkM1?=
 =?utf-8?B?TiswZmsyMDVSQldScnl1Wmxhazcrb291dEhIWHpmK2htdmZ6cC9zTVZiQzl6?=
 =?utf-8?B?YzVzNFZFV0V4eDBqUTFqelFTSmxRd2s2NXNMUHZvZThCcjg1QkxMMWlYU0Vp?=
 =?utf-8?B?Ym54VzlPRmtLbStJclh1aSt0amRna1lxeGU3SWlQUUlDbS90bG54MXdIL08v?=
 =?utf-8?B?S0tKQ09mWWlCNElBeUJ6Nnc1Q0M0dy9vcjI3YjVpMjBoNkxEcXJtUVdyL1NL?=
 =?utf-8?B?RTNlY3FCZWZibDF2OUowOTF1WnMzeWp1UXBodjVNU0NjdHo3M0hDRE9QbmEx?=
 =?utf-8?B?YjUvL2lTSEZTUWpCVzVjSkZ1L2VXWUw1N010VmlYbm1XbjJhY2E2VmRSUlA0?=
 =?utf-8?B?N2gvTjZKNi84Unpobk11eTNZRlQxK2xwc3Y0Nzh6ZWEvTGtHWmdBVE02dG9S?=
 =?utf-8?B?N0N5RGpSTm84aUxCKzB4YzVvT3lqUzJ6L2JjcmVBeFI5eWN3S2NQYWJBNkIv?=
 =?utf-8?B?cHA4ODJ5eTRBM3YvOWVTUWJhajdsTENSeU1ZNjk5Y3ZGWVVRenpPbTI3azJ0?=
 =?utf-8?B?M0RwZTFYeTRtZVp4UjFCcHBuRDNueGlDL0k1N0N6cm5wMkFtTXZOd2pXVmow?=
 =?utf-8?B?dzA0THFHcmF2azJUVUt1K0JnRUFDbmt1alBLTkFmV3NoNm1SNHVTVUpYZlBm?=
 =?utf-8?B?RWo3WTIrTUFJWEtRb2NzbDk0aE9YbVczWHEyWWNmNUJnVnZzb3VBTDNkd29k?=
 =?utf-8?B?T2liZWdaOGk0UWtuUzFpcUJ5b0dZR3h2V0JoVUtsclNkdEVwVWRidUlTWnlS?=
 =?utf-8?B?cTdEaldJRHhFN3ExaWFuRGQ0aS93UEQ2S3A0SWNmZU54RmM3YUkxdmhYTGg5?=
 =?utf-8?B?TlV0ZUlmeXVEaHF4dHRTOXR6NHQwMWdRcU80b0w1dnZkL2RHd0w0NjdGSThM?=
 =?utf-8?B?elhnY2hobVVCRzZWM2RnRlBCT2lOYjJtQnNmZ1lyR2N1T2V6MjJ1TlVGZHpZ?=
 =?utf-8?B?V1ZxLy8xY2xsQ01ZL2hBVUdkaFpYRlpLdElYSTZsY0VKWVR5RnhrMDNXSEtL?=
 =?utf-8?B?VGs3TEI4bU5PS1RiK0p3RDUyVXZQblJMMloxSHV5RkpPc0NKUklmSnJGUDgr?=
 =?utf-8?B?RWcxb2lXR3M4NXpWb3dNb3BWenh5RUQ0RG5YRi9LU0h1UlJxaTg0a0d5Z1Bj?=
 =?utf-8?B?bCtKcXA0eXRrNHRxZHlQaDZLd1VCZHlnSTdNbWNvb05aR0ppZUZITndzN1I1?=
 =?utf-8?B?VlQvRURQVVZVTCtYbTVxMEV1UGg1LzMyNU5nUTQ4bGtlMW93VTVLYjRubmti?=
 =?utf-8?B?TFMzajFoMW44bDRSSVVLZDQwUlRWVCsvS0FkaTIyK1FzcVgrekhUUjJ1aWpj?=
 =?utf-8?B?YlBNeExxTEJnUWE1UkhZK1hiMnEyU2ZsWVRBSjV5Vk1TdG9OY2xzMFpNRHJK?=
 =?utf-8?B?ZDh3QkpNOWhCVS95dVU0QkdoUkpNMk01aGY1L2dtcitycTcxS3NoUVhqZmw1?=
 =?utf-8?B?dEVmY01qYWJFdWpSQ0pVc2t1MXlTcnlVdmQyWm93aVJ1emVhazlXeTUyN25v?=
 =?utf-8?Q?3SEYBH5XY1FPAk84uR50HHayJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a564e732-d8d2-4853-fa71-08ddd0235716
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 11:13:56.1640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhUxH9WOobtHAaBjI7mhfITtfFzx8esJIVN/wkaIJfu5soU8Y5rTUia3PbvCwfstFV5FybFqpe+zL+FLL5PSnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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

Hi Maxim

On 7/31/2025 3:02 PM, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Jul 30, 2025 at 07:33:01PM +0530, Riana Tauro wrote:
>> On 7/28/2025 3:57 PM, Riana Tauro wrote:
>>> Address the need for a recovery method (firmware flash on Firmware errors)
>>> introduced in the later patches of Xe KMD.
>>> Whenever XE KMD detects a firmware error, a firmware flash is required to
>>> recover the device to normal operation.
>>>
>>> The initial proposal to use 'firmware-flash' as a recovery method was
>>> not applicable to other drivers and could cause multiple recovery
>>> methods specific to vendors to be added.
>>> To address this a more generic 'vendor-specific' method is introduced,
>>> guiding users to refer to vendor specific documentation and system logs
>>> for detailed vendor specific recovery procedure.
>>>
>>> Add a recovery method 'WEDGED=vendor-specific' for such errors.
>>> Vendors must provide additional recovery documentation if this method
>>> is used.
>>>
>>> It is the responsibility of the consumer to refer to the correct vendor
>>> specific documentation and usecase before attempting a recovery.
>>>
>>> For example: If driver is XE KMD, the consumer must refer
>>> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
>>>
>>> Recovery script contributed by Raag.
>>>
>>> v2: fix documentation (Raag)
>>> v3: add more details to commit message (Sima, Rodrigo, Raag)
>>>       add an example script to the documentation (Raag)
>>> v4: use consistent naming (Raag)
>>> v5: fix commit message
>>>
>>> Cc: André Almeida <andrealmeid@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>>> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> This patch needs an ack from drm to be merged.
>> The rest of the series have RB's. Can someone please provide an ack ?
>>
>> Cc: drm-misc maintainers
>>
>> Thanks
>> Riana
>>
>>> ---
>>>    Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>>>    drivers/gpu/drm/drm_drv.c      |  2 ++
>>>    include/drm/drm_device.h       |  4 ++++
>>>    3 files changed, 41 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>> index 843facf01b2d..5691b29acde3 100644
>>> --- a/Documentation/gpu/drm-uapi.rst
>>> +++ b/Documentation/gpu/drm-uapi.rst
>>> @@ -418,13 +418,15 @@ needed.
>>>    Recovery
>>>    --------
>>> -Current implementation defines three recovery methods, out of which, drivers
>>> +Current implementation defines four recovery methods, out of which, drivers
>>>    can use any one, multiple or none. Method(s) of choice will be sent in the
>>>    uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>> -more side-effects. If driver is unsure about recovery or method is unknown
>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>>> -will be sent instead.
>>> +more side-effects. If recovery method is specific to vendor
>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>>> +specific documentation for the recovery procedure. As an example if the driver
>>> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
>>> +referred for the recovery procedure. If driver is unsure about recovery or
>>> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>>>    Userspace consumers can parse this event and attempt recovery as per the
>>>    following expectations.
>>> @@ -435,6 +437,7 @@ following expectations.
>>>        none            optional telemetry collection
>>>        rebind          unbind + bind driver
>>>        bus-reset       unbind + bus reset/re-enumeration + bind
>>> +    vendor-specific vendor specific recovery method
>>>        unknown         consumer policy
>>>        =============== ========================================
>>> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>>>    be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>>>    device of all user context beforehand and set the stage for a clean recovery.
>>> -Example
>>> --------
>>> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
>>> +consumer to check the driver documentation and the usecase before attempting
>>> +a recovery.
>>> +
>>> +Example - rebind
>>> +----------------
>>>    Udev rule::
>>> @@ -491,6 +498,27 @@ Recovery script::
>>>        echo -n $DEVICE > $DRIVER/unbind
>>>        echo -n $DEVICE > $DRIVER/bind
>>> +Example - vendor-specific
>>> +-------------------------
>>> +
>>> +Udev rule::
>>> +
>>> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
>>> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
>>> +
>>> +Recovery script::
>>> +
>>> +    #!/bin/sh
>>> +
>>> +    DEVPATH=$(readlink -f /sys/$1/device)
>>> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
>>> +    DRIVER=$(basename $DRIVERPATH)
>>> +
>>> +    if [ "$DRIVER" = "xe" ]; then
>>> +        # Refer XE documentation and check usecase and recovery procedure
>>> +    fi
>>> +
>>> +
> 
> So I guess I'm not opposed to it on principle, but the documentation
> really needs some work.
> 
> You should at least list the valid vendor specific options, and what
> each mean exactly. Ideally, it should be a link to the datasheet/manual
> detailing the recovery procedure, 

This is added above

"If recovery method is specific to vendor ``WEDGED=vendor-specific`` 
will be sent and userspace should refer to vendor specific documentation 
for the recovery procedure. As an example if the driver is 'Xe' then the 
documentation for 'Device Wedging' of Xe driver needs to be referred for 
the recovery procedure."

The documentation of Xe is in Patch 6

https://lore.kernel.org/intel-xe/20250728102809.502324-7-riana.tauro@intel.com/

I'll add the link instead of just the chapter name
> but if that's under NDA, at least a
> reference to the document and section you need to look at to implement
> it properly.
> 
> Or if that's still not doable, anything that tells you what to do
> instead of "run a shell script we don't provide".
> 
> Also, we just discussed it with Sima on IRC, and she mentioned that we
> probably want to have a vendor specific prefix for each vendor-specific
> method.

This was discussed as part of Rev4

https://lore.kernel.org/intel-xe/aG-U9JTXDah_tu1U@black.fi.intel.com/

DEVPATH from uevent and driver should be able to identify the driver. 
Shouldn't that be enough?

The initial method that was proposed was 'firmware-flash'. Since there
were concerns about every vendor adding their own methods increasing the 
number of macros for vendor specific methods. A more generic method was 
proposed.

Discussion: 
https://lore.kernel.org/intel-xe/a820d534-42ef-4391-ab81-36316af4411b@igalia.com/


Thanks
Riana

> 
> Maxime

