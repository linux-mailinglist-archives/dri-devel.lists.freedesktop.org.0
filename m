Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB3B2E0CD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 17:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8810E78D;
	Wed, 20 Aug 2025 15:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3jE5PmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091010E77F;
 Wed, 20 Aug 2025 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755703446; x=1787239446;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SC0FlOq17gsXSAF44pgt5YIHiZSIYL8KCXsQle1nkWM=;
 b=k3jE5PmIYlv6c+ydjBaZzh3gyZY0FSLkEIO8S9R9t2+0olmAMq2pQwqH
 pqghxIJVBqCHsZWsKv2tDLQCJrvWqFuzZycv4H/UQ80KEtueTIC8+KRru
 d2o/VnX2uEuDrQWoSQZ9EJgb7l9tEbiDSCuwoFotHPaSN8495DRSnyTBD
 o1W5VZ7C4C4uVh5ZE7Z4fmaK2bOTCJgWllFPAlcrm5cZltcn1kHTCOwKx
 PAlpOnXmsn5Oq91/Q3yDkSVoIBGzFgj8S4T1+oyq19Uzou/kzumbY2M7M
 GypN2QCEfQIfIrtcg2rP5LkHjTK/Dz6Sid7+yoOgOq4fIlAM2jNSRH8fA A==;
X-CSE-ConnectionGUID: qwIUWP0lTL+3vdu1FYmsZw==
X-CSE-MsgGUID: cXdwqxLjQ6etxavlpx7f6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60599836"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="60599836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 08:24:05 -0700
X-CSE-ConnectionGUID: jqFcjG0BRfmte4yVYJpc0g==
X-CSE-MsgGUID: fvlbsXnwSmKxImNCy5j/KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168102333"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 08:24:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 08:24:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 08:24:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 08:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avoJQn49sG0ghAlPEMlGGwyKoIaymTvnw98L2aiB0TeXRVFNP9p3F3mC3M9JXB16riIyEu4MhrcmqURN9Oay35IdrILeQYA5Hiy3vttnTgtpGi4qRiWe4pnMsSdpw7V5eIVs8sjrYIt8YObI2Afg/NqibB8kqfjfDS9bJygjtkBn9FSuztVLdMaTZhpqZBQOcpRAHGUEUPC4cfXQ2+gN7+nY54+IGDPKe8fSA/1SMa3CkqQAKVlgN7mNAy5mxg+DUqwFJ991lODBzOtZypnC4Ccd0BY6XORX9Z++xUu0SGcf1Rd8l03bbRugd0oAAO7tClj07htRFfy7NZAryZTa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ8p+roeMvvB/RVYzz2QNGePxcbUQKJIRVLG7lAGjEE=;
 b=Th8qTq07nhm+VNNsUcc0dfPhJVCx0R6bj+DbK6lalV9DCFhxzJhrQxmnjq5J+Y7voBOCExjMCTYCRAQlaWo6zWZL8Cd/YLFABNZNyYwuDcMUpbknbtfh4cXuCD28JerOEG72+wYg7w5zcbNOqae/Y2FS7RHxsl+yyDEPHZPLqfJu0QdNegy9O/pYVWeGV57djwkOwZsH+3kCyrZ3KAAZNj8F2245FNWzeLAEehV0m4CNgOIx/OFi5s4+rC/yBPzL0devLFwqqi/i0zM8XDvzJliT+1XxG3RrSfBzIIqaR4otLqq0ETxGjCCWdQkeZ8UXrXLQDaXgKGsP6IiuMsrFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV8PR11MB8605.namprd11.prod.outlook.com
 (2603:10b6:408:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 15:24:02 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 15:24:02 +0000
Message-ID: <b5a948c9-9ba3-48a3-bd17-2e9ef650133d@intel.com>
Date: Wed, 20 Aug 2025 20:53:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Brendan King <Brendan.King@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
 <20250820135657.19a6bcbc@fedora> <DC78OWRRDWEB.2Y6NDT6UGEJ9H@kernel.org>
 <c1e58abf-fe9e-4a80-b742-aa35f0683db7@intel.com>
Content-Language: en-US
In-Reply-To: <c1e58abf-fe9e-4a80-b742-aa35f0683db7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 254e01d9-3822-4403-6b97-08dddffd978b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R09VUW9jOUx4T28vbDhJMVFTRkpLUXBTVFlLYm1tazBHOGVhajg3TGg1dnAx?=
 =?utf-8?B?VzBvOWN2RnhZZ3ZWK3NJR1NzU0tMNElLQkt1N1NEekFVYSs0M1RiODd4ZnEy?=
 =?utf-8?B?Y2FFdmZ2RXh4MzFzd1N1bUh3amEvOXROWG1YU2M5STdFdE4xdXZGWGtEZHl1?=
 =?utf-8?B?VzE1UHd1UnYycVBMWnJBaEZ6T0FVR0ltbU1mOEpQbGJxdVhpN2JZNFJMUi9G?=
 =?utf-8?B?WGUrU2wwNnBZaDRmMDJlSGlMZlJwYXJFOG9mcXVKU1ZPUG90eTlBV2lZcE5v?=
 =?utf-8?B?ekt3Ty9ad2p4STVyRU9STkJ2VmhROFgveDlyQndsdC9Ka0JIUmpJcWV4d3Zz?=
 =?utf-8?B?dXhqTStVWHE3ZEdBWUFkaVloa0FIT25FSjFtR1ZDZ1JDV0llOUhBeS9MSTBS?=
 =?utf-8?B?a2xuZzlmRC96bnFvYmpTNENWZGwwUWROWnorZHdMY1R6b2toYzB4VE9NOUZh?=
 =?utf-8?B?OC9rLzZFd2xDZ3NNT3ZoRFRPTEFxajc2RHdVd1dQRVEweHlPSUVvOE5TTFVu?=
 =?utf-8?B?TlhzUDFpQlFXd3RjcWZpbTZneEkvbCtaWjlFTm52NEtLNXJCSUR2cHFkRmov?=
 =?utf-8?B?Zm1FS3Z4cDNCT21sQVQrUW1SU0p3Q3U0K1ZIeHVGRFFtb1o4K0o2cHQ4NGIr?=
 =?utf-8?B?U2RuMGJzbGZHL2R3MFh3anZuTGFMcDJ2c3R0YkVnbmhRZHdTMERUUHc1N3pK?=
 =?utf-8?B?UGlOMitlbHJOTkRtcTVCNzhzMDNrUWVqT1dxSlc2aUVKb09neEs1MmxEWkk4?=
 =?utf-8?B?TWlyU2E4VW1ab1hpemJvOUs1RjVKSitGR2U3anRpRWMrVnVQZEo2TGM4MzdR?=
 =?utf-8?B?ZEgvSk96dUdCdVZUUHQvRnpwenpmM1hUU0swNThnWnhuYnlkeGZ6aFNBdjNP?=
 =?utf-8?B?Vk1ZWjFOYVFzcklrT1pNZWFVOE50T0krN05laDVnL1V1Z0wwVWFFRkpvelVr?=
 =?utf-8?B?NXhzd1pSL05saVZqdnVyTlN3OE5lQkIwM01zVEhsdmFQbW8wclpsKzZucGgx?=
 =?utf-8?B?VDhjejY5U1JiN1dyamhzR3hZT3Z5R0JaTXR2dFd6Q1JVaXdGVEpTT2VyT25h?=
 =?utf-8?B?MXV5SHV5Z0RVa0c5RUUrR0VDZHp0UThjV0h3cWdoN0piSmZIdU9RNWFmTWRP?=
 =?utf-8?B?NlZYbzlWWnFHTEZXT2dMN1FZcUpEV3c2ejN5S2NjbGtRT3FWLzE5QnZNTGc0?=
 =?utf-8?B?WEFuSy90bHR1QkZCNzBDQzIxekN3V2NYUEFYQXZzbndJWXVpV3RnLy84Q0dU?=
 =?utf-8?B?THJodWxKWXFuWU12RW96eWNWdFFYZVFGYWk5cy9qQllGY1JSRnUxWkExZHUw?=
 =?utf-8?B?MGg2NzBGa2tBV2xER2dLRzJoc3huSzhYQ2ZCNC9SbllLYkZmdE13NHpyZTlq?=
 =?utf-8?B?SmUzd20zWHBnbklKMEpONzhUWk5kZ3NPaWYrSE80MFZSdEVnM1ZVcWw1M25r?=
 =?utf-8?B?ZXNUN0p5eEFpWTVBTk5vaTBPZlcreDdyb0dSdnh1SGlGd1BnNERFdVMyb1VR?=
 =?utf-8?B?RTA4VTV1dEVNWmZFcHpZaXM3UTd5VVhYY0NNSVpUb1M0ZDRzdDViTEIzQ0tw?=
 =?utf-8?B?VTdlUHZocllSQ25BZElDbkZpMjYydjhXL21vL2ZHckhJMXBtOEdGNGJzcVl3?=
 =?utf-8?B?dFpHaTdTSllEc08vbkI2MVk3bGh0amxUUXdyc1BxRUJYUUNrWDRDSjFsOWww?=
 =?utf-8?B?S1B4WVV4dkJWbkE3WkZYY3RLcVYzL0VsL2dDQ0xDSndEZlZKOU95LzVlNkFD?=
 =?utf-8?B?TUZMUGFjSHlRcC9Pb0xoYkp4K3QvM1FnK2VDR1FyRTFnYjFiUE5mK2ZHZU9s?=
 =?utf-8?B?MnJoczVDSXFUaFhuYmhEZENjZ2FFVlY2VDhzN3dhdlYvTmlpYlFaYVVDQlBX?=
 =?utf-8?B?b0dRVUg5eGpVRWs1cys0R2U3UDkzNVpQL2tyNFFnWisybHMrS1ROelVkaWgw?=
 =?utf-8?Q?iC09yxQATsw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlNEWUFrcndlWkJKTit0RWhkOFlnUUtNS21UU1AvdjZlamdOeXhHMERLWUtM?=
 =?utf-8?B?QndjNDM3Yjk4NmpwTFU3WkdpYWFoVGxPc0syaEZEK3FzZjRJL1lTSXgvMWlB?=
 =?utf-8?B?M2lhQjhXSVIwQlNkem5Wb21DSmZSNU5NellNdTBrc2JRNW5sV1orSFpJcGda?=
 =?utf-8?B?TEVFZUJsMmF3K201NGljTG9vNldVY0JsQllrd1gwcEFZaExaSjJsZjNJOTBx?=
 =?utf-8?B?UWcycFJIeXBiQ29yVG0wMVpDTEtrcVNsNU0vMVRZY1Fzd2lXVXREMjhnd3hY?=
 =?utf-8?B?eHFKa2dBQmNNTUxOSXEvTklYRERGV2k0Wkp4aUNsSzY3eXM3OS9BVC9VbXg3?=
 =?utf-8?B?VkxLODk3TUJ3end5Q1lKTUxMckNrU2FwQkNmaGlqL2cvdmprUjRNWWEwdldG?=
 =?utf-8?B?eXlwUXVXOXdhSUFxL0hFQ1llMUtXaTFzN0lDcitsS1NMWkdUZC9HYnRpVkFP?=
 =?utf-8?B?MEJsV0JqWXNnbFRmRUpManNjckdlTTBrSVU1KzJhKzkxRFBxZ0ZaZjlLbjdy?=
 =?utf-8?B?bThKeXpoS0ZhTlVrcThwTk9OVzdXVzA3cVF4bGg0L2ZGT0E4R0tveVpHN2Q1?=
 =?utf-8?B?a1o3dGhrWWtBVXVTckR4NUxCWGMvaHo1TFZELzRTMDVyQlV1TVBmb2xzYWdy?=
 =?utf-8?B?QnhUZ3lHZjhRbUgrWnVDNmp4dk03bUQ4NkJJaFU2Q0NsdGlIQ0ZvUi9nQ0R5?=
 =?utf-8?B?dVVtT2l0a2N4VnNvY2JHeGRBYm1OOTZVREdPSmhEeWxDbTVDM2ViMHJKekhC?=
 =?utf-8?B?WnBDT1d0WUVTYStSdkNDNWJpZ1E3NUVTOHhoeFJxc3E3OE1lVHZhSWF2MkNo?=
 =?utf-8?B?MEpDSis5YlB6a1RjMlJVald1WG9OUWVCcXc4M1AwK3psd0s3S294Z2hiMEVq?=
 =?utf-8?B?ekxVOENVWURBQ3NUYTN0SnVlejhXdFlLVldxTE5yV29veWdZU2VQWXZLc3M3?=
 =?utf-8?B?R0p0S3NiRVI4SnAzcVE5U0V5OGp0RkRPalhjNjhKdWxpS2tOS0NEUHR4U3F4?=
 =?utf-8?B?VWVScVZvek1nTys4WUU2S1BNNjAwWlFaZFU4WXJ3cHVpV01JL1ZIV3BOSDls?=
 =?utf-8?B?a1RPT0Q1SnE2TTh2NTNDVVBmZVFjQk4rb2k5ZGFKNTZpVi8raEV0RGpTT1R5?=
 =?utf-8?B?alhobzc5QW1KYzhpeFR2NEhwVlBSMFpiYldMbkRHNWRKRlUvU3M1ZzFsYVBt?=
 =?utf-8?B?OEkrbXRGKzZPNi81T0lmUzB4dyt1cXBJczlZWEZvc25EeDJDZTlnKzVaemZJ?=
 =?utf-8?B?VjQvZ0oxbjR4bnQ4QUdSM0dESkc5ZHpRK2wwdzIzVDU3U09GSzVwQ2k3Qk5F?=
 =?utf-8?B?SG1wNDNPWGlnNGpuKzhSeWxiYlFZNG5GYzREbDZiVFVuMWhuVGc0YUx6OWF5?=
 =?utf-8?B?ZTVIOTEwZmhyQ2xhT2ZMQXArVW1vakEwaXFOT0VTM3JuUklHSzZSMXBWQzRZ?=
 =?utf-8?B?UlFzaVlyaHFEVEt3L2tRWmE3a3FBcmdhcC9tMlpnNGkyYmJOc2NkODVTVjVq?=
 =?utf-8?B?SnhaSmMzaGc2VjM1MERzZUdEVjBhK1A5c0JUa214NldHYVV5U0VJS0FzRGVD?=
 =?utf-8?B?VTBaUWhLN09FUk5RTVh5eUtUSHpXOUJaMDUzOUdpakJaMEVaQW9oRE9sZE5J?=
 =?utf-8?B?YkYwanJBQlRZVXlyMzFQRjEyMmoyTXNRQ0tFck1IcE8vdWo0S2dRMUlKcllI?=
 =?utf-8?B?Nzg2OUgrYU9nS0FzRU9RRyt5OFNlY3p6SDFRTG9GeEJZcmFHdkNHaUNQWTA3?=
 =?utf-8?B?YSswWlRHeU5yeTQyaHMveXBzSkZKUlNWakhDOGVIL1pDQ0hCMzZnd3JQbkU3?=
 =?utf-8?B?bVlrMTZ0cmZXQ3gzYUxrTmM4c3FpS2RIcGd5SXkzeWl3Z0QxN1E3czdtN2x3?=
 =?utf-8?B?cjloMU1ua3lWZGlUZ2FiUXpZU2FmZFhtYmR2cnJjT3FuOTUvdFJwMzRpQndI?=
 =?utf-8?B?dmJDcnduaUZoY3NybUpaaWF4UCtRdm1PbDRvS3FvQUpXdTIrMkVROXpzejNY?=
 =?utf-8?B?T0tYWWxhdkpxWlF4TG5Xc1F3RlUwRnQza1lEbkgzdVVZMnNLMS9lRUovNzlo?=
 =?utf-8?B?OWxKS0ZSVmszbFJPSjVBT2tjVkwrZ3JvWWxtVDRPSDBYYW9KczI0MjhNcU5v?=
 =?utf-8?B?ZTdzbUphYjJNZXBQYVlZcW1QWnFySllobzhpVUtzaUtOL0xBOTkyLythL0dH?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 254e01d9-3822-4403-6b97-08dddffd978b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 15:24:02.2480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbX+kHbyBnfCd79NYA9yOOtdwYmGN0Ex9CIXc8CXPGtK+nCbpcLpl4S3JlCQAGQbc0TZyoXIjKePeNot8Tikul4X7TAxW+7DqxZOCMn89SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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



On 20-08-2025 18:34, Ghimiray, Himal Prasad wrote:
> 
> 
> On 20-08-2025 17:34, Danilo Krummrich wrote:
>> On Wed Aug 20, 2025 at 1:56 PM CEST, Boris Brezillon wrote:
>>> On Tue, 19 Aug 2025 03:27:30 +0530
>>> Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
>>>> +/**
>>>> + * struct drm_gpuvm_map_req - arguments passed to 
>>>> drm_gpuvm_sm_map[_ops_create]()
>>>> + */
>>>> +struct drm_gpuvm_map_req {
>>>> +    /**
>>>> +     * @op_map: struct drm_gpuva_op_map
>>>
>>> Doc name doesn't match the field name.
>>>
>>>> +     */
>>>> +    struct drm_gpuva_op_map map;
>>>
>>> Nit: not convinced map is a good name for that field, given this is a
>>> map_req, so we now those are map-related arguments. I would probably
>>> go for 'op'.
>>
>> Indeed, thanks for catching this! I thought I was suggesting this name 
>> in a
>> previous version too.
> 
> True, somehow I misread your comment and changed it from op_map to map 
> instead of op. Will fix it.

Patch is already in drm-tip. Sent a new patch with fixes tags to make 
these changes.

https://lore.kernel.org/intel-xe/20250820152335.2899501-1-himal.prasad.ghimiray@intel.com/T/#u

Requesting for reviews.

> 
> Thanks
> 
> 

