Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB49A15671
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 19:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF3A10EB66;
	Fri, 17 Jan 2025 18:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a86ez13N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DB310EB64;
 Fri, 17 Jan 2025 18:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737138132; x=1768674132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A3l2tVR4Nk1mPa+jG5O+36Cir6vofbszfxltC87T8aI=;
 b=a86ez13Nj2eXU4hWbS99+eZk879tY2kwfLkeKoMi5HKWQL9BXxeo9M8o
 DTzuiseYQM03CJ2oT40a9k0eczZisxrrQbGPvVesjYDbm/Y++3+4O1Z6R
 JfmNQ07kVo7T3KeoeQKZjA049HpMN0X11Dd9kd01365aJZtHjymBc4k7a
 v/ZOzSaNzGq3eljdVBYSBEhKmmKyuAymmQyYDm7IVib8iD5w1B97CEvc+
 CU3uJ5n9CzdnR8mjr98+duBhkEmlUGka1DEFfClJtbZMQUbH/lcM/VIof
 mqmIP/ScbE1YPOqxWrxkiN8QxKCG7ERl08oQmgUdosLGl6DXtT46mLjqW w==;
X-CSE-ConnectionGUID: 2wOCEK28RUeGUaX/V7u8oQ==
X-CSE-MsgGUID: oYlcBUNnQLSYoZbMWLx6Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="55128342"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="55128342"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 10:22:12 -0800
X-CSE-ConnectionGUID: nI2jVjLWT42RQRIb2dGnqQ==
X-CSE-MsgGUID: 6hywvh8NS5mng1cm0qAVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136765477"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 10:22:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 10:22:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 10:22:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 10:22:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uw7FihBSZcUTe9g74hMImY0s4YOZ9r+gghiJV/k/yYgwQf2KYNk9r5bkul4HrpA/yhS1l+n3936Bbjqy4Cf3QPBAaweAD11UIO7nW66qxXBEOAcQVxi/7oRV9KROPB3mzi3lK01BtYreGZkHA9FD5JNv8KEZHMW6PjHwMOZzqgvNsBZOq5S/htPItI9yGqbncLhk/IgXikyZ4kn1W/IuGEJeIPY4eqN6vqV7T1dH5drsqaCI0Jab9UnEUI1pRym6/qBQNM0vfeh7yligvyiIP19lzy6Jdl3uCq3hdq8MO3wokF+AHbEzMJFpM46WibfQfdRJZ0idvSD4M4WRLrkVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQAff2Dz3LQvCrGKmh9i6iroo+0Vln5NDE6ggydfULA=;
 b=rTiW9zAeZwfui/zAaS/OVtVAhQ6xELlOJOP1eXZuzvSe82G5AcT96NYEj9oGF+/2yukQVwFer1ymGBaokJZLrQNquc2tJZODlVwRzZN8SCDJ+YqfYNUyLxxH9Kk1EFPOX5eAsxsWtXXoRKrAervdu0e99PQJXx4I+cgcVqSkJeeU4tBRqD22SUg3NSTva2A08oNlUhHlZJNeAcsXyUrqurz5U5HXPxHv2oMrg0Zmr4mj6X3pz5RNiGSgptw6/i72QeCDUpjkJ0AKaG/9ECib45Lrs6L3sJ4yOBZ36K9UuwsxLF38panGE9xWU0yylrhbywSDtdAVlx1qH2BunWopjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 18:21:55 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 18:21:55 +0000
Message-ID: <0302a082-57b9-4335-819c-eb366b0be063@intel.com>
Date: Fri, 17 Jan 2025 10:21:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/slpc: Add sysfs for SLPC power profiles
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
References: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
 <Z4mOwZz1tJCxLeP0@intel.com> <0a192f39-0361-4c2c-82c1-1bdc45edaf06@intel.com>
 <Z4ppRx_hr713Ik1S@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z4ppRx_hr713Ik1S@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 03487847-5d9e-405e-fc50-08dd3723d25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekFJQzdNNG5MRm9yU1UzM2x4MzdvZC9BY2pFWndQeDRGV3RLemFwTUJTK1M5?=
 =?utf-8?B?aDhFZGJCSklWcXlFVGZYTFlSUFRlSmNEMDNtZHlnNWRjRlloQlVZS2poTGlz?=
 =?utf-8?B?K0R0eDdBZmJEeXhVZmdmcTVHNTcvSDM0anMwOVI0NFNsYW1OcUdvMVEvVm5j?=
 =?utf-8?B?WG5WNVJuTGxOOUFKMkJsNTZLZThKQnVyRDFyTklwaWFBMFBDTGhpb0tSQTIy?=
 =?utf-8?B?QjZqY0xvZ2E0USttQ0NYcVpRbXFEWVUybHV1RlhKRUJNbm5yVmVnRDJodDhs?=
 =?utf-8?B?U1FwcVBCSzhiQnJMZVdsMzgxeXZFL2h0M0JDeGZ0YXI5SkgzN1BIRFlyUmpk?=
 =?utf-8?B?dGUzaHVCZGttSWlEbFdVdTJKVHp1L2dsL1JxbXFyMDVITjBJamNrb0JMOEFH?=
 =?utf-8?B?YSs5MWpvRjdUUlBxbjdaTnlkV1drRW5BYVpPbXlwUHNubURYU2JzRVc2bHpH?=
 =?utf-8?B?YjlxcHZmVDBsUnUvT3dLYXFSWlk3K1ZMVzdhTnBRNm9jUEVGYjF1MkNyVHVZ?=
 =?utf-8?B?UU5ZWUF1WXowZVR6UmFDNVBGVktORXppNm1iQjlXRXJCWWxtWHlHWnJtTmZD?=
 =?utf-8?B?WldFR1BkdVFPSWVacEVpZ2tLaGJ6djZvOGJmNlNwWXhXTFJJY1lQSk5IdkMv?=
 =?utf-8?B?bHVjRmZLbkFFQjlyVzNrMW9veWFwMG9CdHpVSTh1RjJqdUw4NHFJOFVjOERC?=
 =?utf-8?B?T0tWRDdON3dheUZFcnEwaEY4RlNrbnRCaWhGc3d5dFdKb1dIay9nTC9pdUV1?=
 =?utf-8?B?UmgzLytrWlpUUXVYd2RvS1hHVkpFVUQ3UStRSmZVWHl1enVDbWZDN2dSSnFv?=
 =?utf-8?B?WmN2bzNIQmhueW0rSHVya0toLzZJbzFVM1BEZnNldlZjMjl1TGg3aW1WWm9t?=
 =?utf-8?B?ejdxZjExdFhxSDg2MTdoQ1d2WWdaa0pLNXJTdHdTTEV6RjBuZWZWaXJGWXFh?=
 =?utf-8?B?MFh4T3VacU5JQzNma2JtcTQ1cVQya1BoeXA4VVZSUjlVUHpXaDVUTmJFcUR6?=
 =?utf-8?B?SnBtQ1o1dkd5dE1OZ2p4dzZzV3duUE9uYVRFekFNemczcUlHdGNWWFF4WHZS?=
 =?utf-8?B?ZHRYYkdvQWJQVGhvS29lYlBpazhxR21CUllxdkFrMDZkaFUwMXYzSnZma013?=
 =?utf-8?B?anZTT3BpZ0svblNuMytwdGV0UTJYT3dyUGVDamIrSnVzOFBWVDBXcEZZeC90?=
 =?utf-8?B?VmI0MGdCaTRjd05VYjBKcUFxWkpZeU9lWC95SytxRkpSaHpVU0RXUmpPUWJX?=
 =?utf-8?B?M3cxUUQ4NHFlbUNtb2doeVV6aEJ5Sk5wVDVPN09LVFFnby9sT09wRTZsaU9u?=
 =?utf-8?B?c1hpSnVyYkpkV0h5eVN3VWhLaHRFcUd5N09POTh1a1hDV2srWTR1blBEak03?=
 =?utf-8?B?M0YvYXBTa28zK3pqenNJTTU4cWRyT2FRM1QvRWQ2Q0YyemliWVc4YjRlUFFa?=
 =?utf-8?B?QWoxR0VmaXorYlBBMlBEM1FjTmpTZDhGa2JJQUduWmJqT2VFdWJWbG9tL1dE?=
 =?utf-8?B?V3hwN3I0aDdpa2gyY2F2eXd4N0hsTk9QN0w5aE8xbEdjVlIzUk9CK2RmYUJG?=
 =?utf-8?B?R2c5cXpkeit4QWhmWWx5aXovN29LUXIrSXZOa2Q5VmcxZTVyNHlBa1VrZUNB?=
 =?utf-8?B?NDBlbHdtSWtvc3VlcHNUZzJwMkFFcmg1c3JreHpKNzlFdXMzemdzdHI5aU9y?=
 =?utf-8?B?ZDgycTBpTVlEMU5RTkU0cW9EelI4S3FhSkE1TjZXQmQ2K0ZtSmpseEtIWmI4?=
 =?utf-8?B?K1IyZzFHRThVTEZWck9EeUNSRkd5WGpSVHMrQm9QLzNyNWhCc2hHZTJBK0NW?=
 =?utf-8?B?VktScW9Db0JzOTNzQnMzRzRzNExnRTJoRE9JRWZoZDVBWVErV21HQWdRVVpi?=
 =?utf-8?Q?DJYReieT1Uvn8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aENJalBmaUNXZkl0MDV1SDhGRnJTNFViRmVKbXdwRUZJMm90K1ZtekdPUVdo?=
 =?utf-8?B?czh6UnZBUjdFNDVBejRLZEhMQ0hQcjl3MkRjSjIzci9CZE5CTmdaMFFnSnVT?=
 =?utf-8?B?cFNXR25GZ21OUHR1TFNkaXk5SG91V2VxWVBVQ2FZa1IzMWRxQ0VvYnZTTHEr?=
 =?utf-8?B?NHlxQmlVZ2lHQzNSSzlGRFlsVHpYYktHNC9CM0lDM3l5U0RFY04rOFczQnVr?=
 =?utf-8?B?MlZrbU9IQU9vSnVpTGQyYnI3QjR5b0lzR2pENVk0aHdqTGxRbDFjczFEL2ZZ?=
 =?utf-8?B?anhMWC9OeEhObU8vY0U4dlpWTkZNcTQ0QXdPZWluQW5OZ1M2OXlldFF0bzNr?=
 =?utf-8?B?Smx2WnU1SndsMUdsYkdKakwrMFE4WWJMMXFVTkJKSHlEMUthMUJiOWd4TzN6?=
 =?utf-8?B?QXErWFdJOFpRa29ZVUJEWFVJbzRVTUtzRUJEMUtVOE1pTS9xQlZmQmllRUFZ?=
 =?utf-8?B?WFF3a3c0K1ZZeHpkRGhoVjRPbFdGWW51SWZvNGpBZVdvTjFHcVUzQUdXRlVT?=
 =?utf-8?B?RzFFQmpvRlRJc1F1ZlZBVzRCQzVCNno3a0UrV2IzbVBJeXB2KzBJMU9lNlE3?=
 =?utf-8?B?K2ZjejZtOHduUmptSldxSG9od3RuclRaNFRGOU1qY1B3d0ZEUDFSSnAyL1pS?=
 =?utf-8?B?eFJVWlp5Mk9Gc3QvRUIxSVduYWxKYlorY2hid2E4cmhvbkxPVHp6WFBTQjVy?=
 =?utf-8?B?ck8vajJpYldxSUpvYWZycGNzQWxrMEg2dTl6NmtvYW9MU3BjV1cwVWxWTHlU?=
 =?utf-8?B?SStwemt6RHRxd1FWYTZJSDA0bE1XdDNMVW9QaXNwZ3p6WUVVNGh5VHBkTnJa?=
 =?utf-8?B?NFlKeEJ2Ti9ZZUFCNitmSXVMbHpRTDRRY0M4ZUpzeFR3WFBvazZFbnAybjJu?=
 =?utf-8?B?cGc2TE1UL0VZYUZua0dVNmorZ2dIUHRWaTRsSC94TXphNnlIMm8zMlh6WDJx?=
 =?utf-8?B?WmQyZFc4Sm5JSGc4ck1lQ1lJam56d2Fna3hTSzVPQTNGeTFhRkJsUjQyYUNm?=
 =?utf-8?B?QUorTWRhMmRFUHg3MWIyemN1bzV5L24wbGUxdWkxb1F0cjROdTJveXZxQUdk?=
 =?utf-8?B?MlVvekZrU0RNUi8xT3djcDczTkg1UUNhckZJUUQ3WHNYWmdPSTE4TnpLeGZk?=
 =?utf-8?B?Y0Fjb25iWnpzUVdoT3FCMmpFblpPOENsYXhXV1BWdERNQk1rYmlUTEY4ZVBW?=
 =?utf-8?B?S21TdlRidVRFUE9PRFAwS1hNaVh3L0ppZGd4ekdPZDBaTTUvUUF2ZjFUTzY0?=
 =?utf-8?B?a1hXcTZONUxrb0p6dGRYRGlEaFg2TWdmblJZSmYrMUN0U3R0enoyNmcxZ2I2?=
 =?utf-8?B?Wlp5bkFXSWc0dHlGdUo0cnkrZnNYdzZQR2ZrRExrRUZWU2tRVmpxTUplNklx?=
 =?utf-8?B?K2MyZHJQT0IreHdCaVlvRkdYa0FLZ2YzK2ZGd2RGVEc0bHJTWXdUNW0rRXRp?=
 =?utf-8?B?WHNleW5NeTFjZk1oRk1raVRKN3JZK2paVU5GVFZFWk9lTDlpR0ZsUDhUZ2Rp?=
 =?utf-8?B?UnBOc1kwNXlzSnlIN1FoSTd5T1UzRjBWejZ0ZjZabmduRW5zZ1BCemg1OWJx?=
 =?utf-8?B?OThQSzl5ZkRJSHhtWlU5MEhTMllKUUR6aWVsekJoYmtnREgvcVZJRlF0UGpM?=
 =?utf-8?B?bFlGUFoxTWk4M1Y4KzBPU1RaVzl3YStVck01dWlEUVhnTnRGeU9oeWVLc3RH?=
 =?utf-8?B?a1RLVzZMUFhGdGZnbE5WRW50V29LN1Y5ZGxDWk85dXlrRTNaYkVKeWZkYnZN?=
 =?utf-8?B?cjE2ancwUFUrY0dhVTVFNU9XVjdiOFFaS3ZYQkhGVURGWjdFSWZrenp5TGtM?=
 =?utf-8?B?SHNDNjkzUVpydFZkTkc2TXlmWWw2akRBZGlpNUZRMmpqcHdSUHA2em1PcTVU?=
 =?utf-8?B?cXI1ZDExSmFDc3JkcndlekZwbUZjTzQvcjF5U1NEblFXNXU3NzhRZXJKRHR4?=
 =?utf-8?B?T0ZEU0J3bXUwckpzTDBIR3A4eFJjNkhzR3pVenVUcElLK0xqVktmOGplWlpH?=
 =?utf-8?B?TFFMYnRuNm4vNDJIOTM5aTRYekhwM3JEK2hYQTdXdE1lQ01QUC9iOCsxV1NL?=
 =?utf-8?B?dVUyUkpxZlVRT25Sc0JOU0tiOXhFWElzV0oxMzlFMVhBRGwxUlJLaisrRmRY?=
 =?utf-8?B?eFppQStjdy96U0ZhUVNKTjlVTzk0ZmZ3eDU3ZFdtcUtpaVIyclJwdDNFTEtz?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03487847-5d9e-405e-fc50-08dd3723d25d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 18:21:55.1431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIYOBnwLHhbjQvuj3T/UWt7vSW6eeIjeKd+nQ1fEu7TkPKo1FSqfCZzjOGz4omfWcTEE/lNp3qEF9Ur7H9ZZEJ4ieFGhwo5v0KwMpbAM8Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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


On 1/17/2025 6:29 AM, Rodrigo Vivi wrote:
> On Thu, Jan 16, 2025 at 03:51:03PM -0800, Belgaumkar, Vinay wrote:
>> On 1/16/2025 2:57 PM, Rodrigo Vivi wrote:
>>> On Fri, Jan 10, 2025 at 03:21:51PM -0800, Vinay Belgaumkar wrote:
>>>> Default SLPC power profile is Base(0). Power Saving mode(1)
>>>> has conservative up/down thresholds and is suitable for use with
>>>> apps that typically need to be power efficient.
>>>>
>>>> Selected power profile will be displayed in this format-
>>>>
>>>> $ cat slpc_power_profile
>>>>
>>>>     [base]    power_saving
>>>>
>>>> $ echo power_saving > slpc_power_profile
>>>> $ cat slpc_power_profile
>>>>
>>>>     base    [power_saving]
>>>>
>>>> v2: Disable waitboost in power saving profile and updated sysfs
>>>> format and add some kernel doc for SLPC (Rodrigo)
>>>>
>>>> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++++
>>>>    drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
>>>>    .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 60 +++++++++++++++++++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>>>    .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
>>>>    6 files changed, 120 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>>>> index d7784650e4d9..83a7cc7dfbc8 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>>>> @@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>>>>    	return err ?: count;
>>>>    }
>>>> +static ssize_t slpc_power_profile_show(struct kobject *kobj,
>>>> +				       struct kobj_attribute *attr,
>>>> +				       char *buff)
>>>> +{
>>>> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
>>>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>>>> +
>>>> +	switch (slpc->power_profile) {
>>>> +	case SLPC_POWER_PROFILES_BASE:
>>>> +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
>>>> +	case SLPC_POWER_PROFILES_POWER_SAVING:
>>>> +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
>>> I had thought about something generic like kernel/power/main.c, but that is
>>> indeed not needed since we do only have 2 options. This came out cleaner
>>> than I though, although not generic...
>>>
>>>> +	}
>>>> +
>>>> +	return sysfs_emit(buff, "%u\n", slpc->power_profile);
>>>> +}
>>>> +
>>>> +static ssize_t slpc_power_profile_store(struct kobject *kobj,
>>>> +					struct kobj_attribute *attr,
>>>> +					const char *buff, size_t count)
>>>> +{
>>>> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
>>>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>>>> +	char power_saving[] = "power_saving";
>>>> +	char base[] = "base";
>>>> +	int err;
>>>> +	u32 val;
>>>> +
>>>> +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
>>>> +		val = SLPC_POWER_PROFILES_POWER_SAVING;
>>>> +	else if (!strncmp(buff, base, sizeof(base) - 1))
>>>> +		val = SLPC_POWER_PROFILES_BASE;
>>>> +	else
>>>> +		return -EINVAL;
>>>> +
>>>> +	err = intel_guc_slpc_set_power_profile(slpc, val);
>>>> +	return err ?: count;
>>>> +}
>>>> +
>>>>    struct intel_gt_bool_throttle_attr {
>>>>    	struct attribute attr;
>>>>    	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
>>>> @@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
>>>>    INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
>>>>    INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
>>>> +INTEL_GT_ATTR_RW(slpc_power_profile);
>>>>    static const struct attribute *media_perf_power_attrs[] = {
>>>>    	&attr_media_freq_factor.attr,
>>>> @@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>>>>    			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
>>>>    	}
>>>> +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
>>>> +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
>>>> +		if (ret)
>>>> +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
>>>> +				    ERR_PTR(ret));
>>>> +	}
>>>> +
>>>>    	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
>>>>    		ret = sysfs_create_files(kobj, throttle_reason_attrs);
>>>>    		if (ret)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> index fa304ea088e4..2cfaedb04876 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> @@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
>>>>    		if (rps_uses_slpc(rps)) {
>>>>    			slpc = rps_to_slpc(rps);
>>>> +			/* Waitboost should not be done with power saving profile */
>>>> +			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
>>>> +				return;
>>> hmmm... I'm afraid this is not enough... Although I just noticed that we
>>> still have a problem for the low context strategy.
>>>
>>> Please notice the intel_display_rps_boost_after_vblank...
>> boost_after_vblank() also ends up calling intel_rps_boost(), so it will skip
>> correctly whenever the power saving profile is being used. The only extra
>> thing is an additional work queue addition, I guess. We could avoid that.
> hmm, that is better than I thought then... although it is probably good to
> ensure we don't add an extra queue...
> But also, shouldn't we ensure that the boost counter goes immediatelly to zero
> and that we really immediatelly stop request the boost freq when we set this
> mode? or that is too fast that we shouldn't bother?

There are 2 workqueues at play here - one from intel_display_rps_boost() 
and one where we place boost requests in a queue on the rps side. We 
check for slpc level criteria(power profile, current min etc.) as well 
as context level ones (low-latency), we could split the slpc level ones 
out into another function. It is better to keep all the context related 
ones in the same intel_rps_boost() function, I think.

I don't think we should set the boost counter to 0. That is per context, 
so could be needed for something that is in-flight.

Thanks,

Vinay.

>
>>> So we probably need something like these:
>>> https://github.com/rodrigovivi/linux/commit/42e24a146239a1b950ed047f619f334f5205ae8a
>>>
>>> other than that I believe this is good, thanks for adding this
>>>
>>>> +
>>>>    			if (slpc->min_freq_softlimit >= slpc->boost_freq)
>>>>    				return;
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>> index c34674e797c6..6de87ae5669e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>> @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
>>>>    #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>>>> +enum slpc_power_profiles {
>>>> +	SLPC_POWER_PROFILES_BASE = 0x0,
>>>> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
>>>> +};
>>>> +
>>>>    /**
>>>>     * DOC: SLPC H2G MESSAGE FORMAT
>>>>     *
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index 706fffca698b..bee78467d4a3 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -15,6 +15,29 @@
>>>>    #include "gt/intel_gt_regs.h"
>>>>    #include "gt/intel_rps.h"
>>>> +/**
>>>> + * DOC: SLPC - Dynamic Frequency management
>>>> + *
>>>> + * Single Loop Power Control is a GuC based algorithm which manages
>>>> + * GT frequency based on how KMD initializes its parameters. SLPC is
>>>> + * almost completely in control after initialization except for the
>>>> + * waitboost scenario.
>>>> + *
>>>> + * KMD uses concept of waitboost to ramp frequency up to RP0 when
>>>> + * there are pending submissions. The addition of power profiles adds
>>>> + * another level of control to these mechanisms. When we choose the power
>>>> + * saving profile, SLPC will use conservative thresholds to ramp frequency,
>>>> + * thus saving power. KMD will disable waitboosts when this happens to aid
>>>> + * further power savings. The user has some level of control through sysfs
>>>> + * where min/max frequencies can be altered and the use of efficient freq
>>>> + * can be modified as well.
>>>> + *
>>>> + * Another form of frequency control happens through per context hints.
>>>> + * A context can be marked as low latency during creation. That will ensure
>>>> + * that SLPC uses an aggressive frequency ramp when that context is active.
>>>> + *
>>> Thanks for adding the doc!
>>> but now I'm missing the documentation of these new profile strategies in here...
>> ok, will call it out specifically.
>>
>> Thanks,
>>
>> Vinay.
>>
>>>> + */
>>>> +
>>>>    static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>>>>    {
>>>>    	return container_of(slpc, struct intel_guc, slpc);
>>>> @@ -265,6 +288,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>>    	slpc->num_boosts = 0;
>>>>    	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
>>>> +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
>>>> +
>>>>    	mutex_init(&slpc->lock);
>>>>    	INIT_WORK(&slpc->boost_work, slpc_boost_work);
>>>> @@ -567,6 +592,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>>>>    	return ret;
>>>>    }
>>>> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
>>>> +{
>>>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>> +	intel_wakeref_t wakeref;
>>>> +	int ret = 0;
>>>> +
>>>> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
>>>> +		return -EINVAL;
>>>> +
>>>> +	mutex_lock(&slpc->lock);
>>>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>>>> +
>>>> +	ret = slpc_set_param(slpc,
>>>> +			     SLPC_PARAM_POWER_PROFILE,
>>>> +			     val);
>>>> +	if (ret)
>>>> +		guc_err(slpc_to_guc(slpc),
>>>> +			"Failed to set power profile to %d: %pe\n",
>>>> +			 val, ERR_PTR(ret));
>>>> +	else
>>>> +		slpc->power_profile = val;
>>>> +
>>>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>>>> +	mutex_unlock(&slpc->lock);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>>>>    {
>>>>    	u32 pm_intrmsk_mbz = 0;
>>>> @@ -728,6 +781,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>>    	/* Enable SLPC Optimized Strategy for compute */
>>>>    	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>>> +	/* Set cached value of power_profile */
>>>> +	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
>>>> +	if (unlikely(ret)) {
>>>> +		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
>>>> +		return ret;
>>>> +	}
>>>> +
>>>>    	return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> index 1cb5fd44f05c..fc9f761b4372 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>>>>    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>>>>    int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
>>>>    int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
>>>> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> index a88651331497..83673b10ac4e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> @@ -33,6 +33,9 @@ struct intel_guc_slpc {
>>>>    	u32 max_freq_softlimit;
>>>>    	bool ignore_eff_freq;
>>>> +	/* Base or power saving */
>>>> +	u32 power_profile;
>>>> +
>>>>    	/* cached media ratio mode */
>>>>    	u32 media_ratio_mode;
>>>> -- 
>>>> 2.38.1
>>>>
