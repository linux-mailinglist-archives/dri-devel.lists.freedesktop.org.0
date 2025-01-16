Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2CFA146D1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 00:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73710EA30;
	Thu, 16 Jan 2025 23:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j516+0EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEF910EA2D;
 Thu, 16 Jan 2025 23:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737071484; x=1768607484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/NmSEH0L6i+5uuwS3i9euqOaucfDeeafdBLOyOpLeU4=;
 b=j516+0ELNeFd0jDKLMyZbb/MB5gZvf4yLpLbtEkmyhjszzllHEOaaexJ
 QdiGjcBMItFG8a4ZKECuJwkLSk4Lxg8uqwgUQk9j6zJraQeULU6RJX3Iu
 AGKfiHh5r9FcGWJyr15sMPsmTS/xwPfd5uoNqIXgFXcvBnjJV+aWmBBoD
 pxJUink9JFlBN/4DDajGHCj/XSVCvNX+VLvCrPV6JjG8FLNistH116xLa
 2lDgwLgTyN9o9thXSIuXZKCaPFDir96gVvPiMVYc85mNxsafnmXqjaYer
 jCQBbYb04YAVz/BFfckYfbrHykOBRyJ7C++nP+lt/aKintzvpVbfCXbeY A==;
X-CSE-ConnectionGUID: q2fHU/lmQqeONyF1Kuwoyw==
X-CSE-MsgGUID: 4zEU+FU4SVOyPb/udxMRoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41421515"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="41421515"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:51:23 -0800
X-CSE-ConnectionGUID: OEbdFWpISyCHAfDC9Pfghg==
X-CSE-MsgGUID: b3CjoIX5Sfy74AvywCuS1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136515969"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 15:51:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 15:51:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 15:51:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 15:51:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm3J8IT2aOWZ7SWaieKph6nZcMh0nFFwb4X3UUlEQJpQrxPq1OKL/O4K608v0TJ8BBv0QiTbmjGlT4tqDeeL/+mFyyL6WCeGZL31qiN8U1pJmcoE3izisvOsdSv3vpxDMRwhQnaM9Hv0YD8B/UV+0stZqcZK7OoHtXbSfXPMsSv9buLgenqMhvfsRAIOuJBtYqxP6y+bFs4uspgww7DSe/HyIV6UV4W0Q4gJVi9GQQVoyLTuMyF+r7K8VDsL7l9isJO39veGj+PZ3CvFDx5KrSC/+RIOzfF8aRnJ8Y8uTMNdxRZ5Bvz375Fwc+m4AbnKAPcC4pNidM1zCCUlqwsaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opvl/Ihg2cVDYsIlRpoTLC+/DqLTpH548asqZ02+Po4=;
 b=gqlSmaYA8oObwHc8veJcwG1wVXhPKyVuhr+TFszdePZ/eLeX3EzicM/NonG3LVj0Vw3jSr0iv1Vkm0SMM7Pbpu5GS8FJuL5CgYzjIZ0+bB5XGLeOOZzjfZoAbCTKa0kRL+lFKFyeTxJxRspOi9jy8bpLty68sgIgff3mj8byfrs1kMrGBCrdxY2DtXpwmhPET9/gO1Cvfx5v/fWsds1/wSYxNL6x5PkOHwK4w1jv71cvgBWVouWZmrwghqmDhaTiVOmtnpu7jCAyLhCMRR5zhIfFqp7A9FBBD+wHOigOX/Hsa4p7+wa158WW6ffwOhQruKzgu2593folZiVM3Gbc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:51:06 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 23:51:06 +0000
Message-ID: <0a192f39-0361-4c2c-82c1-1bdc45edaf06@intel.com>
Date: Thu, 16 Jan 2025 15:51:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/slpc: Add sysfs for SLPC power profiles
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
References: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
 <Z4mOwZz1tJCxLeP0@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z4mOwZz1tJCxLeP0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 83feafa4-ddf2-49b0-f494-08dd3688a4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTk1TTZUL0czS1F5eTJUZU9EMitPc29kSTIzYnFxQ1JUTE5zWDJhb1o2eERI?=
 =?utf-8?B?VjIxZzZPWVMxZFREQTdXRGJldXJvb29VbFlzVGZITi96Rm9pbkVuUDBaN2Yx?=
 =?utf-8?B?YVU2TTFFOG01MWo1R3lqcVRGTnRGTUNKemZqcDlIcXhoaS8rZjZqV0dvZWdv?=
 =?utf-8?B?bjhHMGZJbTFoWU1waUZqU01mT2g0Z0VKcFZOV2J6NDhDMGFnVG1JQ0FZNmky?=
 =?utf-8?B?WEdKZHlEbFFRTCsvMURwVzA3SlVUQy90Z2RmV01aQkRJYTFDVlB6ZittYS9P?=
 =?utf-8?B?aWVQTzYvbUd4NGYwbVQ3cWd3TDc4SFZFUFJGMEdVbUFNZng2Z2RtWTlGWXN6?=
 =?utf-8?B?a1gwdE05cXJrazRGMWVRMlNzRk1ZSTY0UXF5ZjZBSDZoSmFjR3ZKRUZGV3FJ?=
 =?utf-8?B?blpDYnRnTnY5cVpMalI3RUhKT3VqTHRaeTZmNjhoMEFoRGg2RWMveXpNbEtr?=
 =?utf-8?B?Y2NVSU92NjZINytIS3RqZmg4MHB4S2tOVTRFWVNicVI2TjRJdW52VFA1VHFO?=
 =?utf-8?B?VjZML21xVktPbnhybjFPa1dGc3ROS2N4VFFqNzU5bXg4ZkVHNG4xdkcwOFZX?=
 =?utf-8?B?Vmo0NTFOdXdVOEpEUU94c21LeC9YWEQyUXF4MnZBVUU4b3liQlYxd1hZYlda?=
 =?utf-8?B?V3RRcmY1OUxsd25sMEJyWU9uVENSdDNycGRNUTI3VUx2aVU3S05SY0orQm5y?=
 =?utf-8?B?MDkvVnFUcUxXbUpWdGQvek14WllZd0FFd2xaWFRBM1o3OVRVT1JURm1yQ25K?=
 =?utf-8?B?Ym96NEFUOVZGUy9FTWNtYm1JSmNNenZiM3ZZaVZBUXBTQzBwM0tCcWhNNjdR?=
 =?utf-8?B?a3dNMHFlYTZTbXBSOWgzU0VNWVVrKzI4WFRJNmtkUWY3REkwbHdlZkdEaEZr?=
 =?utf-8?B?SXNYRHdCRmZTR2QybmlJS0hyeW1reXk4Q2tWY2tMTk5TS0pUbEFSNitIL0V6?=
 =?utf-8?B?UkZuTmVGU3JtTEpZVFVjYkNCNjcwRHpwM25JMEJ0dmZiN1ZPWGx4Z21kVWt6?=
 =?utf-8?B?RnQwaExFYXp3aDh0UWxQZUtFUEIrd1dUeGQrbGpVNUc4aG0vRkRyUGFzWDNQ?=
 =?utf-8?B?dzhpcSt4M2FwdUtuZmpDWHd0bEFxQkxnN0VIS2ErYmZwSE5MOFFEQlBhR2dY?=
 =?utf-8?B?RHhJdFIvbHBNSzg4YktEWGcyOHFWbHY0OCtBRGxMeXZKZno0YTVML3lwZGF5?=
 =?utf-8?B?b3EzdlFVQ1N0VkcyUHorS1UyaGxYWWV0Qjc2N0lkdkp0SzFXSG1WRTJ0QWxO?=
 =?utf-8?B?bDhjM2JwMExCdVRGQ1NpZE9DdHF3TURZUmpkeGVaTlJhRjJjeFNJeHlJTTN3?=
 =?utf-8?B?SWZRSTdIQ1YrQ0FuQk9uV3NSN0pLVEgyMjh5eDQweW5hL1Z6MlhqNGtiRVBv?=
 =?utf-8?B?aURLQWVmR2N4V1ZaVlV6dDhhdWNyVitSS0QyQWpBT3R0K1RSeklmd0ZLcnBC?=
 =?utf-8?B?OVNKeEIzMWNLU2xPNXZjV0VqRmxOTzhQOEo1bnFSdTJ1UnpaTStXd2JLWHVG?=
 =?utf-8?B?MFFZWkNXR3pUMHBIa2NYbmNWMmpnVk5xVG1HbVQ2QU14SnNpNGlsUlgvWTVI?=
 =?utf-8?B?dVhVdFVGV2FsTlhpT1pGenN4WlNMdDE1THJaL2xTNFdMbHNpZVZvanJKWVVG?=
 =?utf-8?B?WE5tV09FVVMraDBGank5bjZQOFRVTUl3OFB4MC9JeGRlTlNxbnJxUzZ2M0tX?=
 =?utf-8?B?QjNoL3RoVmg2cDNndUdqdWphQ2xXcnArbmJhMERZKzZUY2NYMlpnS2VjVWlI?=
 =?utf-8?B?WjBSeGhqbS9VdUEvYk04QWh1Zy84ZW9SVFpiMDNBWHZLOWdONkZGbVJKN0Ny?=
 =?utf-8?B?UmlHeW5mRlpieVo3c0NQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzdPMW1SbHZyUVJla2hwTDNGZkpQOVExM1lZcCtZWjlDd3NmWE8xNUdoSFVY?=
 =?utf-8?B?Nm5tZkoyU1d1STkxbXRmVTN6SmpaVzNsZC9UR0xtVTlWejJNa0NZeEF5MmNK?=
 =?utf-8?B?TTBFYVZQRHNPdWZ3R1pTOXQwQmlIejdoVWtyN3krRSsxRjBINUhyWERCN3dx?=
 =?utf-8?B?VUQyamlEeGdOSTFYSDdxV2dNWFRWSzNCWkRWRVFQLzF3S1gzM0swOWpKVTFs?=
 =?utf-8?B?NmRPQmVYSC9yQngvajJqUHlnR3pxY3ZMb2ZHdS81N0JveHpFMzgyOUR1S0Q3?=
 =?utf-8?B?SGRTQXlwQW0xS01ubXk3bFNQLzhyRkcwSzNvb0dOWlg5empNMzlCZkxSNU8r?=
 =?utf-8?B?cHRBdDk3M0VlM3U1TEorT0pSWXZSQ3Q3cXZQSFhlSkwvcmRlekFPN1ZDeCty?=
 =?utf-8?B?OU1DdmZ6Nk1PNVdBQy91dmxLV01DMXkxcCtpM1J4OFZqRk00QjRaQUUxN0VT?=
 =?utf-8?B?eWNnWTJvRWNocjVmd1ZNQmIyRlhZa09YMndwMXNxelorQlluc2tKaDJzUFIx?=
 =?utf-8?B?aUcyeHBBUm0xcjhsazRVMk4rWVNYaTh5eXh6a1BLcE5hNDVoaXp2MGE0cE1h?=
 =?utf-8?B?K2tGTEZPNitPck9RUFh0TDRKUHFKaFg4ZElUaTJ1WXJJL0dhWjNNbWc1dXFp?=
 =?utf-8?B?bzMvTUpNdGFmMkhuTVJkTzFiL2ozWndvZVo1OGZhT3JmWE1rRlJPNk1kUjU2?=
 =?utf-8?B?VFZ4TGNBUEdrQUxselZJOTBjOFNZaFA2a1Q3dVdDczZ5OGVqaFhhVndrZkZo?=
 =?utf-8?B?UkpsT1NCdE9UdmswVWtlMC8rSGlBeFkwSnI3RHBEOEk3em12eUIzdHBNamxU?=
 =?utf-8?B?NG9LRXBUQ3RRcXl0T3VjQjI0VEFxWDYxMCs0Q0NMZTJ0aHZmUzRCd2pYUmgw?=
 =?utf-8?B?YlVSaXhwbkRpTnp4cG93bkc5RXhuYmVFenlFQzF5aklMYUtneWZHYXNNZi8r?=
 =?utf-8?B?YVZMVmlZZHRDUy9yS2ZDd2dzMnhPS0J4VHQycitKandwSlpQT3FGcUllanJF?=
 =?utf-8?B?TWx5R3VvNzJwcGxrdGsyQTNGY0ZISklERnphRUk0ODc3a1R2akpCZlo1NWVw?=
 =?utf-8?B?am5ic3R1eE05Q28rSFZxYStXbnVRUFcxRUYvaUtpaHE2TjlCRSs3V3kyZjlr?=
 =?utf-8?B?elZ1dm5UcXVyK3pMd051VGZjZjRycFRUVVB4NG16a0NMVUlHd3RYMjBRYjQz?=
 =?utf-8?B?dlN2OTArNjRxTE9tZy9ZVlJ4YklGaHpHUmM4ZjhHN3I1LzhTM1NRY3l4amto?=
 =?utf-8?B?Lys2L0o5eTdPYzJXdkVIOGIxN0VqeVRINUxRNFBhKzNHbVh6TDZVdlpzcUlT?=
 =?utf-8?B?YmJqeXJGTVZhTzlFQW1LaFFIeHFQRk5mNE9PMmdGVnV4czRMSXNWaHJKYUpo?=
 =?utf-8?B?QUNSdHRBUFRtN25IUHpXNG5MRE8xUkxnZnVEWk9EMk1wYlZyR29IV2c1Y294?=
 =?utf-8?B?am9HZStsZi9BR2pzRGJCWjJ2NFVsT3AvQUlsNGx5VXg5ZlgxMFN0OXBuWXht?=
 =?utf-8?B?bzJ3NW1tUjJCaFhFRmVvRDB3SGxRcjlrUlRiZ3QyZFlkTE0zSW96N1d3YlBu?=
 =?utf-8?B?Uk91QmZmZnJKWEpNYldtK1dEVlJoZTFCQVFaY3ZCTVdROVZoVWxWVy82MEpR?=
 =?utf-8?B?OC9OWG93SWRVc295cXBIQTdkL09FREQ2SUcxVkUraVFtdHJRZE14RVd6WXNj?=
 =?utf-8?B?bUM1V2M0M3ZrenFRVE1JYkFyQWlTTVdlM1hpRTVaR3JhNE9TQWFmWmtzUzNK?=
 =?utf-8?B?WTc2eWJRQndUUURWcmx3V0tRUTY4V0lzSi90bC9CSVk0akpVdW9nbXdLZ1pz?=
 =?utf-8?B?TThaby9pT21rTmFhNG1xdUZWd1dUQTY3V210REVLejBuWlhoK2pDa2M1cTc4?=
 =?utf-8?B?UnZFNXpTTjlCNjIyS3RwNkJWWGZUUWFHekhkd0FOWGdoK1ZhWUpwMlZsUzZD?=
 =?utf-8?B?ZHM0bk5tcU45WFBTL3lVcEFTQlFXZWZyUHh5aGR2bDFCcDl1QVRCZUtEZ01C?=
 =?utf-8?B?VGk5RjRXRndKY3MrNnFkSXd1QmZBQnR6b2d5R0ZzMVlGZ3ZZV3JORWJMRm4v?=
 =?utf-8?B?eWlrTml1Qk5TWWR1cWw5NnVPeCsySFV3dWt5M0hxZlNFZDZiV3p2K1pORWln?=
 =?utf-8?B?QWs1dnJFWXRoQzBVM0lnT1VhVjExdlpoMHVFbTVjbkhtVGZ5bStKYzJMZzUy?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83feafa4-ddf2-49b0-f494-08dd3688a4c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 23:51:06.5999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oe+L9jni3OJH6jI+4PZUNF/D6ODGUDDNRrELbD5mewb5mAqtX6AcKMb+b1u/AaxFDyULds6goCD0TVSSRFpoS3IzcpVJ+rNaueyZGSgm5ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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


On 1/16/2025 2:57 PM, Rodrigo Vivi wrote:
> On Fri, Jan 10, 2025 at 03:21:51PM -0800, Vinay Belgaumkar wrote:
>> Default SLPC power profile is Base(0). Power Saving mode(1)
>> has conservative up/down thresholds and is suitable for use with
>> apps that typically need to be power efficient.
>>
>> Selected power profile will be displayed in this format-
>>
>> $ cat slpc_power_profile
>>
>>    [base]    power_saving
>>
>> $ echo power_saving > slpc_power_profile
>> $ cat slpc_power_profile
>>
>>    base    [power_saving]
>>
>> v2: Disable waitboost in power saving profile and updated sysfs
>> format and add some kernel doc for SLPC (Rodrigo)
>>
>> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
>>   .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 60 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
>>   6 files changed, 120 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>> index d7784650e4d9..83a7cc7dfbc8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>> @@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>>   	return err ?: count;
>>   }
>>   
>> +static ssize_t slpc_power_profile_show(struct kobject *kobj,
>> +				       struct kobj_attribute *attr,
>> +				       char *buff)
>> +{
>> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>> +
>> +	switch (slpc->power_profile) {
>> +	case SLPC_POWER_PROFILES_BASE:
>> +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
>> +	case SLPC_POWER_PROFILES_POWER_SAVING:
>> +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
> I had thought about something generic like kernel/power/main.c, but that is
> indeed not needed since we do only have 2 options. This came out cleaner
> than I though, although not generic...
>
>> +	}
>> +
>> +	return sysfs_emit(buff, "%u\n", slpc->power_profile);
>> +}
>> +
>> +static ssize_t slpc_power_profile_store(struct kobject *kobj,
>> +					struct kobj_attribute *attr,
>> +					const char *buff, size_t count)
>> +{
>> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>> +	char power_saving[] = "power_saving";
>> +	char base[] = "base";
>> +	int err;
>> +	u32 val;
>> +
>> +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
>> +		val = SLPC_POWER_PROFILES_POWER_SAVING;
>> +	else if (!strncmp(buff, base, sizeof(base) - 1))
>> +		val = SLPC_POWER_PROFILES_BASE;
>> +	else
>> +		return -EINVAL;
>> +
>> +	err = intel_guc_slpc_set_power_profile(slpc, val);
>> +	return err ?: count;
>> +}
>> +
>>   struct intel_gt_bool_throttle_attr {
>>   	struct attribute attr;
>>   	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
>> @@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
>>   INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
>>   
>>   INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
>> +INTEL_GT_ATTR_RW(slpc_power_profile);
>>   
>>   static const struct attribute *media_perf_power_attrs[] = {
>>   	&attr_media_freq_factor.attr,
>> @@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>>   			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
>>   	}
>>   
>> +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
>> +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
>> +		if (ret)
>> +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
>> +				    ERR_PTR(ret));
>> +	}
>> +
>>   	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
>>   		ret = sysfs_create_files(kobj, throttle_reason_attrs);
>>   		if (ret)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index fa304ea088e4..2cfaedb04876 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
>>   		if (rps_uses_slpc(rps)) {
>>   			slpc = rps_to_slpc(rps);
>>   
>> +			/* Waitboost should not be done with power saving profile */
>> +			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
>> +				return;
> hmmm... I'm afraid this is not enough... Although I just noticed that we
> still have a problem for the low context strategy.
>
> Please notice the intel_display_rps_boost_after_vblank...
boost_after_vblank() also ends up calling intel_rps_boost(), so it will 
skip correctly whenever the power saving profile is being used. The only 
extra thing is an additional work queue addition, I guess. We could 
avoid that.
>
> So we probably need something like these:
> https://github.com/rodrigovivi/linux/commit/42e24a146239a1b950ed047f619f334f5205ae8a
>
> other than that I believe this is good, thanks for adding this
>
>> +
>>   			if (slpc->min_freq_softlimit >= slpc->boost_freq)
>>   				return;
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> index c34674e797c6..6de87ae5669e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
>>   
>>   #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>>   
>> +enum slpc_power_profiles {
>> +	SLPC_POWER_PROFILES_BASE = 0x0,
>> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
>> +};
>> +
>>   /**
>>    * DOC: SLPC H2G MESSAGE FORMAT
>>    *
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 706fffca698b..bee78467d4a3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -15,6 +15,29 @@
>>   #include "gt/intel_gt_regs.h"
>>   #include "gt/intel_rps.h"
>>   
>> +/**
>> + * DOC: SLPC - Dynamic Frequency management
>> + *
>> + * Single Loop Power Control is a GuC based algorithm which manages
>> + * GT frequency based on how KMD initializes its parameters. SLPC is
>> + * almost completely in control after initialization except for the
>> + * waitboost scenario.
>> + *
>> + * KMD uses concept of waitboost to ramp frequency up to RP0 when
>> + * there are pending submissions. The addition of power profiles adds
>> + * another level of control to these mechanisms. When we choose the power
>> + * saving profile, SLPC will use conservative thresholds to ramp frequency,
>> + * thus saving power. KMD will disable waitboosts when this happens to aid
>> + * further power savings. The user has some level of control through sysfs
>> + * where min/max frequencies can be altered and the use of efficient freq
>> + * can be modified as well.
>> + *
>> + * Another form of frequency control happens through per context hints.
>> + * A context can be marked as low latency during creation. That will ensure
>> + * that SLPC uses an aggressive frequency ramp when that context is active.
>> + *
> Thanks for adding the doc!
> but now I'm missing the documentation of these new profile strategies in here...

ok, will call it out specifically.

Thanks,

Vinay.

>
>> + */
>> +
>>   static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>>   {
>>   	return container_of(slpc, struct intel_guc, slpc);
>> @@ -265,6 +288,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   	slpc->num_boosts = 0;
>>   	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
>>   
>> +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
>> +
>>   	mutex_init(&slpc->lock);
>>   	INIT_WORK(&slpc->boost_work, slpc_boost_work);
>>   
>> @@ -567,6 +592,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&slpc->lock);
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	ret = slpc_set_param(slpc,
>> +			     SLPC_PARAM_POWER_PROFILE,
>> +			     val);
>> +	if (ret)
>> +		guc_err(slpc_to_guc(slpc),
>> +			"Failed to set power profile to %d: %pe\n",
>> +			 val, ERR_PTR(ret));
>> +	else
>> +		slpc->power_profile = val;
>> +
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +	mutex_unlock(&slpc->lock);
>> +
>> +	return ret;
>> +}
>> +
>>   void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>>   {
>>   	u32 pm_intrmsk_mbz = 0;
>> @@ -728,6 +781,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	/* Enable SLPC Optimized Strategy for compute */
>>   	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   
>> +	/* Set cached value of power_profile */
>> +	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
>> +	if (unlikely(ret)) {
>> +		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
>> +		return ret;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 1cb5fd44f05c..fc9f761b4372 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
>>   int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index a88651331497..83673b10ac4e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -33,6 +33,9 @@ struct intel_guc_slpc {
>>   	u32 max_freq_softlimit;
>>   	bool ignore_eff_freq;
>>   
>> +	/* Base or power saving */
>> +	u32 power_profile;
>> +
>>   	/* cached media ratio mode */
>>   	u32 media_ratio_mode;
>>   
>> -- 
>> 2.38.1
>>
