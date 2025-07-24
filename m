Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1AB10764
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC5810E91C;
	Thu, 24 Jul 2025 10:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lk1kT0MV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601FE10E91A;
 Thu, 24 Jul 2025 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753351570; x=1784887570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/MJVuczLQHveHDXCude/4FM+DmbljKntb8ZtZzryLGI=;
 b=Lk1kT0MVp1ALr+ARJKUVOuZ144k1tLg+vFTdbDxvPuF0Ak8fXka8ic8a
 txNyEvNxyh55vIPIxjOiH31DnP51poKm/Ss/zkWdB2nq8vBu6geyS0SXj
 CK1iBLhAVfVF7v/nOSv85wyttR8iaiW1DZ5VWZYTyolKKZBRT3b/wa/MK
 nxKyYThIPZgjrJbkePf3VnVJC6OzMORL2gbdhfN5ivLBf/9HNS7SdzFgK
 XMEaFQCDVhAp26VzsT6MvCZe7tK0qMe0HXs4xAWTesEbPYv+HoPuQLYp2
 TjuZlm44pMtwZ4YhAba5639ntPlpx4zr668BM7WD4yd6lR7eqHs+1zy46 g==;
X-CSE-ConnectionGUID: 9H46YiKEQb+NgE6INWPqnw==
X-CSE-MsgGUID: gxCwxwASRzesf5ATFMLcbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66221422"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="66221422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 03:06:10 -0700
X-CSE-ConnectionGUID: IzX8xhsEQW+nI/0wCTLVtg==
X-CSE-MsgGUID: /RtvoLB4R5KF3TkzirXP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="164375449"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 03:06:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 03:06:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 03:06:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 03:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEVZTaf7aTlaKFHRhpqQX5HX8RjGp38qHG/FocigH2VFvBx0cBTDkQe4N7u39lIyoIyQUOGJGLRiSFUapdQEDKRk3AWdmBvijTaiCE/JzQwiDtPgj5+363ZMmZ0T/jRiaIDW85QFC07FxZtThSAWo+ZWKdE4PpG1YFW1imzFzSK4mmudrGLVReekKcjEgxJVUyqVccEnPVv7573T9CcQw2dBMrCte5A5uOt1BjIpMp/HFkjb1WNA2m24IXYfieHK9gd1S7psoeG/wImZ1GkSeAVJSPb0YwIu1kelMrc7PCPT+HpH8IZcBh9i6w1OYwCvqpPdD0iUgp3Q2YrZinJwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXUUBMi/OV1flOZfS3UR7sUEfK0qoiBxE1Nsc1Rpax4=;
 b=vhD63lIDxrpaE9MIcL/x9Iwqv3RBO+Az46YSaPnSIAUdYlQcx02zAl4Vnz+axYz7kliq5OGta+bcN6iJg3QxRn3dyo0QrFgq6Ow1j7l9ME9v5WPQ/2xL8Vt3z2/ekEs02TTwFvrTQmwV5TEYTk0f0EsAqpdX8zbBK0mZ86g3KnVMdGRad6NDOqmDuS/unqwXCQYfnAoxYDRFdVVfCvu5i20hJ97nb162zCv86MGk4kg5WCb+xXQy0hVNw1S8SE70x5UloH8e6qCC5GIOexqail8qnRiZWjyCxCsxjrsJsotd1DcJJHnuL0aezuCr+m+E3n0zamU4i1jiyHEht4MKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA1PR11MB7130.namprd11.prod.outlook.com
 (2603:10b6:806:29f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Thu, 24 Jul
 2025 10:05:54 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8943.027; Thu, 24 Jul 2025
 10:05:53 +0000
Message-ID: <6b01b10f-8b0e-4e8d-969a-f4d87fbcf208@intel.com>
Date: Thu, 24 Jul 2025 15:35:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
 <DBIMILMUUV20.YED53M3X50H5@kernel.org>
 <aIGBzCnTAcyb6v1H@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIGBzCnTAcyb6v1H@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: deb3d94b-102b-421f-5bb1-08ddca99acd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlN4TUREcUZJUlpMWGVnVC9BTGhWbWJPVk4xQWROTkJrNWFEWGp6VXR4MjIv?=
 =?utf-8?B?TzA5N0tieGNJMlhMNi9BN2dsVDlsbFZaQVlQTEYrd2JLMlFsNXNPN0V0QUNm?=
 =?utf-8?B?anJISTd5TkcxaGtidW5NajV5Sk9PVlZuZG83SE10N1BmOC9UdzBtT1JObHpG?=
 =?utf-8?B?Z2JlRFJ1dTVPcDM1SEUrcXBEVXhMSTltbWJWRnE2bjh5SFA3SUd0TmpKcFFD?=
 =?utf-8?B?TzhTU3hKU0x2RXlTVk9ueXNzTDhzbktWQ0pPbXhGUDFSQkNLZGZCT09zVGti?=
 =?utf-8?B?TmVTSlNkZWJBMnAwdXNDdEp5dTl0SGZRVTg1ZWhzSUErSVdTbGZnTmswMk1m?=
 =?utf-8?B?NTRUT3dQUk90Y09jYzZlQXF3L2dyVDEzTXowTzhUTDVvYWxWeTNFeGUyODl1?=
 =?utf-8?B?Vm5VMnMrL2VxSnJZZFd3bnVTdUFQdzYvUHhQSDFqb0V0aHQ5K25YUS9zcXgr?=
 =?utf-8?B?Sk8wenlLaVpoQytUWVpLZzQwQ1B5UCtWSkl1aEJuZHdsVTdHSEhYQVJDZ1pH?=
 =?utf-8?B?M0p2blliWkd3dkRpcUlraG9YZUpJM2pEYmNLRWk5eDlBb1lKMkVVRzQydnJV?=
 =?utf-8?B?UDdCZXVLd1hHTWw5VVVXTkxnS2FUUEhSeE1SYlBXZTBSL1htSXRVNE0xdVZl?=
 =?utf-8?B?QnczbDVnT1lxUWRWQWRKYjYwcDY1VFJYK05udE9mNzJobmVIb0syb1VLYndG?=
 =?utf-8?B?M3NFMnBSQ3BGOTJGVGd6eTRxdHkzUko1YnI5TUhRWFNqUzZsZWUvNzRJVmdG?=
 =?utf-8?B?dkJORkJlbW0xejFJeTl3NUhJOUsxd2x2ZGFkUGdxS1JKSG1sV0UxS3hEdzFB?=
 =?utf-8?B?NGNweis1VEU1UVlwRzI5TDZTbWcyeDJERkVEUGFvNEJVRGQ2VE43eUVEV3p6?=
 =?utf-8?B?UUJiNDFKYnZpVWRxZ3hWRk9YMWhtbm11SStTaWovek1IQzQrTVdqWUs2M3JP?=
 =?utf-8?B?SU51ajhUYktDdFZyUEd0RWdKZmhHUlV2OWhSNCttZ0xXUjFQQTVpZWd2M3lE?=
 =?utf-8?B?cklLdTFxSlR0TFlTYzhENEF6TGFLQlhGUUIzWFlkZ01ReThVbEg3Q2J3YkM5?=
 =?utf-8?B?cHQ1aGhLdy8waGg0Znd1bWU5SVR1U1NPODh5V0ltc0RzS0F4WEE4UjVOUkx0?=
 =?utf-8?B?YmkvSS9HOGpUNmxrbERXRmJKMG10Vjk0MnVhK05LV3RVUEZiemdVZDdYZ3lo?=
 =?utf-8?B?d3l4RHlBQmZwcWJsdHFkR1oxdXFuUTVJdkYvMHNabm14RVJxRWtKaGdkMnNK?=
 =?utf-8?B?SDlzUVI1Zit2L2xIMzVsd0kySjRNb0s3Mit2MXVHMHVPaGhoT0VpTVBsOGtj?=
 =?utf-8?B?WEd2aFhlMzRlSmlIOHNXNmp1S2xjZ1habVlEN0xWaWNZNnpUSko3cm1SaGtJ?=
 =?utf-8?B?YkJGVE5ZNVVad2NBeDFHR0FlUDc3UnVEY2JnZnBXSU9tOWJqQlY5ZlFBalFn?=
 =?utf-8?B?amxyQmF3aloyZUsxbUFpZXhWMmpUdHBQOEhUTmlFR2YvUHNGbVdhWHBYYkdq?=
 =?utf-8?B?TEkyaFRJa3U3K3JVOUdmWTg4MXhSYWc1Q2FpV2QzVGRQZW5VcStKRWRlYkda?=
 =?utf-8?B?UVlaa3Z1RDRiaU43ak8vd0phNVh3a3NqNGs5TWJuTU1OajNONkl5OElsd2ZI?=
 =?utf-8?B?cEg4Z2dmTE9XeERRbmFtVFNFaDdRdS9vSmczR2pheGZxYldIa3NvZXRUUkg3?=
 =?utf-8?B?TzExMEJIUnA3Q0JoTXIrS3o1aGVRQW50MkNIRnhyWVVrTUUvQlI5NlRuVjdR?=
 =?utf-8?B?eXc4NmV2Wjg3M3BjK2RlR1ZJS3kwN0hBVFlCY203SUt0WnB2Y3g0bUp2UEpP?=
 =?utf-8?B?eE9IRGpEZWFBUms4dDNPLzY3eUhFbXhiVU5RUXdCWDZ1em5GU0hpSWNKTC9I?=
 =?utf-8?B?MlNLWG50Zk0vNVVoaTFJenl2ZUx6SXlpMjkyRHBTY3JudTkxY05FOEw0WnFh?=
 =?utf-8?Q?EQ3qN/MYg7g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25LTmhPUlJza0tmTmFYNE1VODE3dWYwV0crTGNKSkhBWG1lOThBN0xscVE1?=
 =?utf-8?B?T0hoalY5Y2p2ZTBKOWlzcmNXSjRwVFJFU0tvT3JsVHFCVEovRjlCdmlQbkh0?=
 =?utf-8?B?dnBIbmFUa3BTN1c5S3NkNERpbU9hMzNMbXlod0UwTUJwcHNOVXNWRmI0S096?=
 =?utf-8?B?U1d1OVBJM1U2ZHR4WGNaeTAwazJ0U2NuM0ZLM0dwQnlpVzFkOGNhVTJ1d2h1?=
 =?utf-8?B?S3EwVnhobHJKdzZyTUNVVUdTZXYzVEpyKzRQTkUyalBRZllEWkJPK01xZWxH?=
 =?utf-8?B?VzlNMWtWZkJCbW5kWHFrbllxbllJSEVIV0hKUWlpMUU0NFUxdk9naE04N0ky?=
 =?utf-8?B?blZDWEpiQm9oTGV5WXc0RUdkelV1bHozbW5YRzBUT2tzbmZRZFZ0cS9CSUdK?=
 =?utf-8?B?blhKK01wRlNlSEhVaUpxcDBJTSttMU00aWtjRHBkTGJJLzQ0MU9zS0RXbkhr?=
 =?utf-8?B?R3FwSXNIUHJGSHkzSzY3NmZMUkNncEJTbDVNcE9COXlUVHhReVV0ck96a1Ny?=
 =?utf-8?B?dEV2cWV1VlVDeThyN09wcUdGQ05wNG14UFQyODVWd3kwWit1RlNlb1VYOGJi?=
 =?utf-8?B?UVhkU25mTGpmeGJVSEhSVHVXNm5FZXYxVWcrT1UvYklxdzV3YkVibWpFaXJy?=
 =?utf-8?B?ekFrTkJvMlh4R2RoYitaYTRTNzZaTW56L090U1AzVEhwVXlhc05VdzNqN2tI?=
 =?utf-8?B?SG5lcmNJaHRUdlFyYmJsTjBjOWhGWExETFdQN2k5cXJPQlFoMW93M1NlOHJy?=
 =?utf-8?B?b25jYmN1NlNpLzZmeUxNazArWTZXMEJGUERtOW5DVC9ibWdKWnp0UWN0a3B6?=
 =?utf-8?B?ZHlJSlkreXB0aEVCV0oya0FHU1ZzdkVYWmxKSGlKbjRmRkdoK2tzN2RRMSts?=
 =?utf-8?B?MllGa3Y4K2xjcVdPa3RUWUZKQUoyeUQ5SUdtWlRvSnVCWFJwMU5RWXo0WStx?=
 =?utf-8?B?WFpzeVlzMlhVdi92am5rWlIvM1FpNEtnRWg3UjdBQk9LRnRLRUxpRVRpUkZB?=
 =?utf-8?B?ajhFWkdOQkQ0Y05WVm1lQklGNE8wZmxSRFBKV0xEcUd5VndVZytzWk9acjN3?=
 =?utf-8?B?U21aQXdFVW1VWS9UNFI5bzFWc0FkVDVQSldCbnBaTHVvaWF2di9ZNVhyeUFs?=
 =?utf-8?B?SElZU2VNeWVSOVRiN1lnaVRpdFdUc1F3OUpHWnorQ3Brd2VHRXptdTQ4K29t?=
 =?utf-8?B?WmhaYzU1UG1Nc3VwUjBEUFhiejFrV012UFpDWUdwQTljQTZnT0Z4Wjg5UjM4?=
 =?utf-8?B?eVRnemxBV2ZKUkVNMmVUdkx0cGs5VXJTc0hHZEMrRnA4dHd2V2VWU01mVXA5?=
 =?utf-8?B?aUd0dTl5UmpON1E4dTdQa25Vc2NEMFhFZmhTNFl2S3ExRXFEUzQ1eCtzeFJZ?=
 =?utf-8?B?bWFGRjI3ZytoMUtkL21sS04zdEdTVUtid0NpRVZMdCtuWUFOU1EzSWFYeUhH?=
 =?utf-8?B?TGR6T2p6ZWJ1NXRERWFVa1kzUVhOMkxGVGV6YXdPRlZ3RW5iRzRjZGR4Sk1G?=
 =?utf-8?B?Vzd6aklOQkRaRFgvOHU0ZGhrVEFkNUExdlZzR1cvbFZuM2Z4K0tDdEx6Z2gr?=
 =?utf-8?B?dm9NeGZ0emJucUU2K21wRXl5M0oxZDVZR2VJMUVJeFNrSHZQdHdPTkR0eU5D?=
 =?utf-8?B?OHVhNmJhU3ZDMnV4UWJXQlJDdDUzekxEdjZ0d2czQWFpalBSWXFmMUNBSTFs?=
 =?utf-8?B?MnZ2SVFLL2VMdmFWU1lxLzVCcVIwZk1zRTFwUzE2eWxkV3BUTVJ2aWsyUkFk?=
 =?utf-8?B?NjlIeWtwYWlYMDRRV1NIcWNSa2tMZ3RQeUVxOVNXZk4zcmNWcnhIaWNPNTU0?=
 =?utf-8?B?dFZ4MGc4U05NMXVBamZPTG1XNncya2N2L1ZyZVJESHJxMUVzRWRGRnJQMHJH?=
 =?utf-8?B?c0dQZDBjeFJ3SG4vbjNTODVaMFdQQ1VjSGs1bXNUOW5uRDZabWRZc2xRK2NK?=
 =?utf-8?B?dklBQnhnUW9ncVM0ejUvTzVVRVlEUHBXMmtXOUhUWitabERnNWRFaUt5eDJa?=
 =?utf-8?B?dFJ1ekxpdk4zYkFCM0FkblY2MDlqbXg4cmVEVXVnOG8xaUxDVjFFcHRoeTVU?=
 =?utf-8?B?QmtwcUxlOVZiMzk0cUhWcG1oQjA5MWo1cUxCVlJGeE9xMzlXeldxYk1pOEhp?=
 =?utf-8?B?WGNQWUc5T0twMEpycWxpdmpESGo4RkVMRmY2QlA1b2EvMUtmWHh1cmxxWVVk?=
 =?utf-8?Q?XQa+6z5Nirz72WtNDnYAWb0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deb3d94b-102b-421f-5bb1-08ddca99acd1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 10:05:53.8469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiE+C71vx7bd3796kBTdy/qjNhqdbLVKA5BtZW6TZWOUKHkHm28be4OTO5jZQZD1EdbccfHOORY9Qc/qhMC2KkyK/U+4WhlL+VNQCVXDCwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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



On 24-07-2025 06:13, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 03:38:14PM +0200, Danilo Krummrich wrote:
>> (Cc: Caterina)
>>
>> On Tue Jul 22, 2025 at 3:35 PM CEST, Himal Prasad Ghimiray wrote:
>>> - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
>>>    range.
>>>
>>> - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>>>    drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>>> user-provided range and split the existing non-GEM object VMA if the
>>> start or end of the input range lies within it. The operations can
>>> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
>>> used by the Xe driver to assign attributes to GPUVMA's within the
>>> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
>>> the operation with this flag will never have UNMAPs and
>>> merges, and can be without any final operations.
>>>
>>> v2
>>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>>    ops_create (Danilo)
>>> - Add doc (Danilo)
>>>
>>> v3
>>> - Fix doc
>>> - Fix unmapping check
>>>
>>> v4
>>> - Fix mapping for non madvise ops
>>>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>>> Cc: <dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>>>   drivers/gpu/drm/xe/xe_vm.c             |  1 +
>>
>> What about the other drivers using GPUVM, aren't they affected by the changes?
>>
> 
> Yes, this seemly would break the build or other users. If the baseline
> includes the patch below that I suggest to pull in this is a moot point
> though.
> 
>>>   include/drm/drm_gpuvm.h                | 25 ++++++-
>>>   4 files changed, 98 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>> index e89b932e987c..c7779588ea38 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -2103,10 +2103,13 @@ static int
>>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>>>   		   u64 req_addr, u64 req_range,
>>> +		   enum drm_gpuvm_sm_map_ops_flags flags,
>>
>> Please coordinate with Boris and Caterina here. They're adding a new request
>> structure, struct drm_gpuvm_map_req.
>>
>> I think we can define it as
>>
>> 	struct drm_gpuvm_map_req {
>> 		struct drm_gpuva_op_map map;
>> 		struct drm_gpuvm_sm_map_ops_flags flags;
>> 	}
> 
> +1, I see the patch [2] and the suggested change to drm_gpuva_op_map
> [3]. Both patch and your suggestion look good to me.
> 
> Perhaps we try to accelerate [2] landing ahead of either series as
> overall just looks like a good cleanup which can be merged asap.
> 
> Himal - I'd rebase on top [2], with Danilo suggestion in [3] if this
> hasn't landed by your next rev.
> 
> [2] https://lore.kernel.org/all/20250707170442.1437009-4-caterina.shablia@collabora.com/
> [3] https://lore.kernel.org/all/DB61N61AKIJ3.FG7GUJBG386P@kernel.org/
> 

Sure will take care of this.
  >>
>> eventually.
>>
>> Please also coordinate on the changes in __drm_gpuvm_sm_map() below regarding
>> Caterina's series [1], it looks like they're conflicting.
>>
> 
> It looks pretty minor actually. I'm sure if really matter who this is
> race but yes, always good to coordinate.
> 
>> [1] https://lore.kernel.org/all/20250707170442.1437009-1-caterina.shablia@collabora.com/
>>
>>> +/**
>>> + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
>>> + */
>>> +enum drm_gpuvm_sm_map_ops_flags {
>>> +	/**
>>> +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
>>> +	 */
>>> +	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
>>
>> Why would we name this "NOT_MADVISE"? What if we add more flags for other
>> purposes?
>>
> 
> How about...
> 
> s/DRM_GPUVM_SM_MAP_NOT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_NONE/

I was thinking DRM_GPUVM_SM_MAP_DEFAULT, but 
DRM_GPUVM_SM_MAP_OPS_FLAG_NONE looks better. will update it in next rev.

> 
>>> +	/**
>>> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>>> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>>> +	 * user-provided range and split the existing non-GEM object VMA if the
>>> +	 * start or end of the input range lies within it. The operations can
>>> +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
>>> +	 * in default mode, the operation with this flag will never have UNMAPs and
>>> +	 * merges, and can be without any final operations.
>>> +	 */
>>> +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
> 
> Then normalize this one...
> 
> s/DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE/

Sure

> 
> Matt
> 
>>> +};

