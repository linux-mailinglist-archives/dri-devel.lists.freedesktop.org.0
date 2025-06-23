Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A0AE48D1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FE610E3E1;
	Mon, 23 Jun 2025 15:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHtoejLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9310E3E0;
 Mon, 23 Jun 2025 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750693065; x=1782229065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9i9jVELeG/4koebpBRnX57oPrwJ1QY3xAU57OxldmTY=;
 b=WHtoejLMekvhjuCGZW96RbgwavGxe4HL81K73yHQJg0imtvverGljiu0
 HZk3JhcCzi2At9+3zrhQ8lC++v2LViwbmac0EBAHrxAgSubgMHc5HtYWH
 BbZAMf8qtiaeuBbX+1rCH0wXu7o3VYrwYwhyTImoKuR3357tW1uM3eZJ9
 J4W/rkvXuAn4zQoxcAu8dtF+4MMdFWlTZAKJ0vCPd7/tOGWDvj7PZoqAw
 4V2979O8lyxz4diyK9QcjGpZnXq61MR9w8XjlrN3WfdNcLLfnjad0yfX1
 fnBFIs7KvttrKQro2ZvtL9aBVaExOvOsUjeqdorhJayWNeCDw8K4Ltu9m g==;
X-CSE-ConnectionGUID: TZmdlgyVTlOJCg1kvzC4cA==
X-CSE-MsgGUID: bFM/s4cxQeCnQ3Cfdy4iBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52978250"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52978250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:37:43 -0700
X-CSE-ConnectionGUID: 2DO8LeoeTsWG2VVLa/offA==
X-CSE-MsgGUID: L+O2k/TIS9mcjrKLelH5gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151212911"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:37:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:37:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 08:37:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:37:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkSDqonSSZjWdEAoHpLnwwfvPAEAIi/YSaroiqX03II/LhjgKHaDpHo/5VQpivqyr7DwGDs6IcalxRJlbv2uaVDMulM5/LTIiiuEdcEav1xEaJRSzn5ap6K/2gCukwMcpvLBIUV+k0nj4eaELuzagHnLiyg3ttBhidQO8yebwY3Ut1zBoUTZFGlPs0ZKDi32NZFY5gCZbMwcaRCh81O35vRmvo9VkmG/5N3uwlqqCJjwbb8js9B+q00F1Rv82OtITR5EYQ/FuIXipKs8TXZ58cqRqblH7ECgsx7ee0bpmOVBvOnjJM2sG0ierOebIycxDdNl1lPZQZZOVrCHPttD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH/z/UtmNG5MTYbPtr5GwJTFPfgCGSMMIk8lEjg1VX4=;
 b=AYwHcsjVZB+wYL23tHBBD4yuLrKDByMpGwp2VJn0hHFhGqOt6cQJIz+01SpRIXKQ6xbKBWczGp6GF2bP9RoeqLISohseQyxGCRrL5+u1QDT880pt7iYjclsINnkasmvZZlxvmBPl3XIIlSi/v3Md5KiNWrWMbsDKDqVp1M/yVyG+ZJ4PtUtxhneD6OrFtuQsADb/d3s1w462qRD373Sq7Jl4AieRH8GtuWmaJp7TNLLE57qpbivVRKQTZGi1spGYezmCVj7cPmY/8zYKntcqhak4YALf8PVtHfeomi+kRmAGfLobDbBYqwhtr/5QOeaypqr8JRBjtoYBiMgrgsP+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 15:37:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 15:37:34 +0000
Message-ID: <4b582be9-74e7-4175-8528-59f8e0bd120d@intel.com>
Date: Mon, 23 Jun 2025 08:37:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-9-badal.nilawar@intel.com>
 <b9a468c0-53ed-4da4-a044-76c5e8461b95@intel.com>
 <3fad6292-cbdb-4724-8e28-5315bb735d78@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <3fad6292-cbdb-4724-8e28-5315bb735d78@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: d27f2ab0-471f-4e7e-a0ed-08ddb26bdfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L09ZVTBvNGxscCtac2JGUUxKbHg0RENheXN6TVo3ZHd4dFhMcWF5MkFtdzE1?=
 =?utf-8?B?aUxBeFFSNkUxOE05Zy91OFcrYmozVEM2NXUySFU3dElxaEswK3MzalFkNUN4?=
 =?utf-8?B?b29MS3VEb3k2dG5zaUNrMGRRNHFCZCtYOUJkRWlnODN0UloxME14OFFMakx6?=
 =?utf-8?B?SVFRbFQxeklVM3pFby82Q1U5SCtLaXJNR21VY3lGT0NKU0hkSnFXWXhuanM2?=
 =?utf-8?B?NkJlUElxSVE4Qi9iZnNBdmplWGxRdVE3T09vdm91RU0wZTRNWXNXSEdVRHZZ?=
 =?utf-8?B?dlMrQXlURFVEeFo0cFVyR0N4T0NIenRaR0FKME5nMTJOb3IxampOUTU2dW1N?=
 =?utf-8?B?MkE2LzdzWGlvSUxqMmp3ZkoycGtSSFZiaE8xdEpoQ1BlZnp6a2lhckxhZ2x5?=
 =?utf-8?B?cDlVZ3EramxYU3E2KzZCbFlxTkllZnY5WDVIeWhscUhveW9mSnhQQ0hxN3VI?=
 =?utf-8?B?ejVjT2QvZy9RbENPeFZhbEZqZHJhV1BqTmNKNzFFSng1dXNkZXZNU1BNaDV4?=
 =?utf-8?B?c1hidjZwVDZzQUdlNkJTUTkvZXlrZGJQQ240Vjc2eWd5NldGZXpJdEI0a1BF?=
 =?utf-8?B?YXdQaWhOQzJSMzljZHc4K0RtVkhoRXR6SHphMDZEaC82YnAvaFpYdkxzenVS?=
 =?utf-8?B?eWVKOUU0cjk5NFY5eXQ0NTg1Z1NiUHNyS0VJOUxSQWwzK1gvelNBNXVSVWFh?=
 =?utf-8?B?WFk4NjJDZkFxSFVBUVdmYWpQcDRIUWJUdFVSQUdKNHk1Z2dMa3NaR1RtaWQy?=
 =?utf-8?B?cHB4QVQwdzJoNk8wcWFOMEVObDlxQlhNdml5dWtITytpNUt2ZU5CTzJZNitT?=
 =?utf-8?B?UFdOY2NZbjYzQkJ5dnFGRU5leVFWRlA4V0dQWEg3YlZ6T05pLzRhTFB0TXhy?=
 =?utf-8?B?aGJVMWxhVXQ4ZjgzQlhhWmEwNG1wRWo0Q3RZQm5FcEQ5TnV6ME5qajNjaHRZ?=
 =?utf-8?B?NTZrWDlMdXJwLzY5THNmenZKQW5UN05pVnEzZkRqRVNSY2xkb3FZWkdqQU5i?=
 =?utf-8?B?K1p6ZTZMbTBiY29YWWpyeElRVU02MWJjUFdiSElwYkppR3IyamxZZDJraVQ5?=
 =?utf-8?B?b0lSQ25QTFc5cWNBQmRrQnpCak9nZ0NRSWo0QW83MENEa2VuTnlIQ09GMVlK?=
 =?utf-8?B?NzdlZW9scUJjS1I1U2s0Vm9KbkRtUUtVZVNTUmpVOEpXbVU2UU5nNXdDV0NC?=
 =?utf-8?B?VlY4TEt1blczd0JYcWdCTk9KR09pdE91N0ozVTJYLzR5ZzRTbk1HdXFRdDRC?=
 =?utf-8?B?SzR2bEJleXRHeUNhb044Z0NuWnY1d21mWm9DQUI5aHNXdE5EbEVsWkZKZ291?=
 =?utf-8?B?bUo3R1FHeG9sVVpld0VSMDcxbTNMUWczTU1oR0JoZE80OXdDVDJGUGQ5K3N5?=
 =?utf-8?B?RFVadmpySDVyaFMzSlVIQUFYUXRLVzVickREbko3VTZTK3I0ZDRmbEZLOGZX?=
 =?utf-8?B?eERlU2ZwdHd2disrSVBBa1F2dmZxTUtDVVBKclozWlBLSnkyeGRlaFMxV09i?=
 =?utf-8?B?Y3FSYjRxZkd1Q1ZDeFRmYUpaRzdRMVJoS21ZZStoQTlUVlVYN3lnMzhGQmda?=
 =?utf-8?B?cDdaS1dOcmxSdjkzVmpDQUZMa1MwTkwzck5xNVRQUlVObFNSMHdONUgvWkFD?=
 =?utf-8?B?ZVVYcmE4MllBSXdjQlVHZDN3TE44emV5dWFyVnNnaFZFQjB5V2lSUnRCRWZy?=
 =?utf-8?B?TmVnUGhtOXBMY1ZnUVM5Zk1mcUdjS0NSaTUzdnNLK1NidWt2Rmplb1hLZGNB?=
 =?utf-8?B?S2JaTkZBTnlBNGtMaS8vUytJV3phOEJ3MEF6dTkwZlFXWVAwNStKbGU2UGhU?=
 =?utf-8?B?b1ZyNGlzRU1HeEZXNnpMTTZlVXdEdlRBc2U4TFhkM2ZvcWRKR0Vtb204bkJ1?=
 =?utf-8?B?VmpJbGpyTzkxUWZucC9xS2t3T3pkQ25BMDdzNWpDU3NreFNFL1RrYjRPL056?=
 =?utf-8?Q?XDp3uj51nkM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHlFUHZLMWdNME1Dd2JFVTFCdEdJelh6ZFluWFBrUGRRak43VHNseS82OHVG?=
 =?utf-8?B?UGNnSzl1ay9YbXB2WnNBeTkrbWhtblI4ZCtDTkJNQjF4cUdadUtVaTNsb0Fm?=
 =?utf-8?B?R1BUUm5Sb1NtbjlGZXc5YmhoMUdzcklZTzZOeU4raVF4OWROSjBqcUN1dmxV?=
 =?utf-8?B?aUFTTkRrVndaNHVybE1LK1J4K2M1RGdtc1IyblBZQ0IzaldZUDg4TzVWNzU0?=
 =?utf-8?B?bjd0bHVNV2tqcGF6SXkyb1UzR2UvWllZK01XQlVwL0hMWURDQnFOQnVOQUdF?=
 =?utf-8?B?MVA3REM1RmZidkROZFBOVUpXSi9rcUFIN0Z5azBnUm1UQkVMalliQmwrOFl5?=
 =?utf-8?B?dHg1SUxRMEF5bDNnMkd0YnB0cTBkVmk0RDRHM2ttK1EwRTFaOHc5dkhOUVM0?=
 =?utf-8?B?UlhkSlg2WkxTWlJCZXMwandKS1FIbm82elRHSzljYU51U3ZHQmk1UjFxM3kz?=
 =?utf-8?B?Q3RRNmh4amdpQUhQYW84Tm1WSUcyek5ZOGd6QzI2dGd4OVVyWHRXc1VVNGw1?=
 =?utf-8?B?OEY5a3BIT3I2ek1vVTA4TTJYRUtWOTVCNEJucnBPRE05TXFxMnB0MDhPd1VP?=
 =?utf-8?B?MVV2ZXkxc3NqaUJnc3JNeHc3QnFQdUFRdjl3M2lIcDROQUtLZTM3N2MrbjBZ?=
 =?utf-8?B?ZzY2bmtKUFd5enBBQmE2Z0tUSkhIT3p0b2pWcm82bkl6MzVYRzMvSG03cFdZ?=
 =?utf-8?B?eUdLRm1SNTlyaS95YytYd2Z1U000aW5Gc0VJVE53c1ZvUFhhSWRUcmFQVmk1?=
 =?utf-8?B?bGdHOTVJdGtJN0trOHp2MjVRU2J0dEFqb0UwRHEvYm56S3hHT1Q3V29raXRU?=
 =?utf-8?B?RzRuN0x6VXV5ZXB4Y2laMFg0UFdCQVB6a3Y5SUprVURsUnpkT2dWeUt0Qkdt?=
 =?utf-8?B?VFlQeElOV0tqODN3Qndhb21DUjBqa0FMajRSQ2tzcW84TDdaQU9wNytwRHps?=
 =?utf-8?B?Q1JXazNWY1lIVUF4RWgySWoxZzNsVDRZN2EwWisxNGI0OTJEMkkrM2JHTlZu?=
 =?utf-8?B?dC9GTjdCYTQyWU04azgyNVVFUGF2L3ZheWc4ZVc5WkhiSGZwQ0gyTDRyN1Zo?=
 =?utf-8?B?TUhmZjZyM2lMRUl1a1RrT3pWaWNQTU1MNGtHeGhVTDczMjF5MFFOUjRvM2tE?=
 =?utf-8?B?TGdraW54SzI2MEQrTmlUcklBTG1vNVF0aThGUEJ0K3JLbFE0OVV5ekt3eFRw?=
 =?utf-8?B?SXhOQkFwcG5DWFpKUWZPaUc2ZitKWnQra3R3Q3B3a2JZM1g4aHdYQjgyWXpK?=
 =?utf-8?B?REUwS1p0ZlZTZGZMeXFqZkkzWitkMTZmVmQ0bnNXR3Fkd0QyTEJObkRWcVRj?=
 =?utf-8?B?R1lOMTYrYXZCUFRoNGNzS056alRYRE1SSUF6eGFCZ0x2U0NPd1FKckcyUlg5?=
 =?utf-8?B?bkxJRUszU0ZSNHFQVVNibWo5Q202ejNmcmszaVA2cllvZy9NaTA1Sm5LemlJ?=
 =?utf-8?B?WDI0QmljUEJMNDlrVUl1SjN5QjBlbTFsNE9hUG5IOHN0L2VKbFhvUVg2d3Ax?=
 =?utf-8?B?ME9QUUw5MnIySERJMHdMTElwTHhNZlhlZlYvbUE3VlBJMmxSWForZzdKUWw1?=
 =?utf-8?B?TjZBZ2Uwczh3VXFrZlBWemhwNVpzRWtWdk9uaXdzOXhUQWduMDBBSlVQbXdx?=
 =?utf-8?B?NitvQUdVd2lYV1RqZ2daYmduQmRSTDlZNHAwc3NEN0R2Y0Q0TElPejNEYlVn?=
 =?utf-8?B?UU9zSjJxaTY1YmFzVTFQOER5Y1FlalEwL3NMc0h2dER1aHFXYnRzNGJFWDFw?=
 =?utf-8?B?eUMxVzJQRWRVQm5rUXNUTWxZcWdINUdDeDYwbk15MjlFZW1xWFJPVVUwUFlm?=
 =?utf-8?B?V3pmVWsrOWRMQTV0UXFaSmhsK0tDVk00NkFXbEhPd1lIU0NpK1VqdHU4WWNN?=
 =?utf-8?B?VWZGWWtWaDJSVTNuQ0p1L3czbGk3S2x1VmdYVXFSTUJRcUF6aTJCUkJqRjl0?=
 =?utf-8?B?eUxzMWlnMGozQkIyem1kdDhsd1I5bnRCS0dXVlg3djNBV2NyL3J3M2hCblVh?=
 =?utf-8?B?QXZKVEVEYWlUcUZmckZiZ1hnZlZDYW1xWEt5cENlZEREQnlIUnRsOWEzdlBa?=
 =?utf-8?B?ZzNSby9lWkxJcDd5MDlVSDhMOVBPZjUwS2RYMjI3bDZNcGUyL1ROeHc2OWJU?=
 =?utf-8?B?V2xSaUxnSEpOUDZ6QUVtMmp0L1BYVlVmYmlSaThTSnJxeVozbGtsSGZNb1Mr?=
 =?utf-8?Q?bdbKTWiqaoTWyGmV5jHhAQ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d27f2ab0-471f-4e7e-a0ed-08ddb26bdfcb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:37:34.4429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71t6oDAbUup144oQm9ioLd6XFfoKPYE1PwVDk1EY6DLJhoHSuElFbvs6KudUC6vwi16/e87A3POiMwd7GH8mkyfxUfCsoxSWOIjvy77qAdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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



On 6/18/2025 11:51 PM, Nilawar, Badal wrote:
>
> On 19-06-2025 02:49, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>>> Introduce a debug filesystem node to disable late binding fw reload
>>> during the system or runtime resume. This is intended for situations
>>> where the late binding fw needs to be loaded from user mode.
>>
>> You haven't replied to my question on the previous rev in regards to 
>> the expected use-case here.
>> Is this for testing only, or something an actual user might want to 
>> do? If we only need this for testing, please specify so.
>
> Apologies for the oversight. Yes, this is only necessary for testing 
> the binary before releasing it for up-streaming. There is internal
> tool which uses IGSC lib to download the binary. To avoid clash 
> between the binaries, this debug fs node is provided.
>
>>
>> Also, what happens if we suspend with a user-loaded binary? userspace 
>> doesn't have visibility to know that they have to re-load their binary.
>
> If the device enters D3 cold state, the binary needs to be reloaded. 
> However, the kernel mode driver (KMD) does not have control over 
> binaries downloaded via the IGSC library.
> If needed D3 cold can be disabled from BIOS or by setting up 
> vram_threshold = 0.

I'm confused. Whatever the tool writes is lost on d3cold entry, does it 
make any difference to the tester if we revert to the default values or 
to the kernel-loaded table? It's still not what they've written. It 
sounds to me more like what you need is to block D3cold (and potentially 
S2/S3) when the UMD tool is used so that the userspace-provided table is 
not lost.

Otherwise, we could add a modparam to override the binary like we have 
for the other firmwares and test anything new that way.

Daniele

>
> Regards,
> Badal
>
>> Daniele
>>
>>>
>>> v2:
>>>    -s/(uval == 1) ? true : false/!!uval/ (Daniele)
>>>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_debugfs.c            | 41 
>>> ++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
>>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
>>>   3 files changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index d83cd6ed3fa8..d1f6f556efa2 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -226,6 +226,44 @@ static const struct file_operations 
>>> atomic_svm_timeslice_ms_fops = {
>>>       .write = atomic_svm_timeslice_ms_set,
>>>   };
>>>   +static ssize_t disable_late_binding_show(struct file *f, char 
>>> __user *ubuf,
>>> +                     size_t size, loff_t *pos)
>>> +{
>>> +    struct xe_device *xe = file_inode(f)->i_private;
>>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>>> +    char buf[32];
>>> +    int len;
>>> +
>>> +    len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
>>> +
>>> +    return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>> +}
>>> +
>>> +static ssize_t disable_late_binding_set(struct file *f, const char 
>>> __user *ubuf,
>>> +                    size_t size, loff_t *pos)
>>> +{
>>> +    struct xe_device *xe = file_inode(f)->i_private;
>>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>>> +    u32 uval;
>>> +    ssize_t ret;
>>> +
>>> +    ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    if (uval > 1)
>>> +        return -EINVAL;
>>> +
>>> +    late_bind->disable = !!uval;
>>> +    return size;
>>> +}
>>> +
>>> +static const struct file_operations disable_late_binding_fops = {
>>> +    .owner = THIS_MODULE,
>>> +    .read = disable_late_binding_show,
>>> +    .write = disable_late_binding_set,
>>> +};
>>> +
>>>   void xe_debugfs_register(struct xe_device *xe)
>>>   {
>>>       struct ttm_device *bdev = &xe->ttm;
>>> @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>>       debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>>>                   &atomic_svm_timeslice_ms_fops);
>>>   +    debugfs_create_file("disable_late_binding", 0600, root, xe,
>>> +                &disable_late_binding_fops);
>>> +
>>>       for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; 
>>> ++mem_type) {
>>>           man = ttm_manager_type(bdev, mem_type);
>>>   diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> index c0be9611c73b..001e526e569a 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> @@ -129,6 +129,9 @@ int xe_late_bind_fw_load(struct xe_late_bind 
>>> *late_bind)
>>>       if (!late_bind->component_added)
>>>           return -EINVAL;
>>>   +    if (late_bind->disable)
>>> +        return 0;
>>> +
>>>       for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>>>           lbfw = &late_bind->late_bind_fw[fw_id];
>>>           if (lbfw->valid)
>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> index d256f53d59e6..f79f0c0b2c4a 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> @@ -71,6 +71,9 @@ struct xe_late_bind {
>>>       struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>>>       /** @late_bind.wq: workqueue to submit request to download 
>>> late bind blob */
>>>       struct workqueue_struct *wq;
>>> +
>>> +    /** @late_bind.disable to block late binding reload during pm 
>>> resume flow*/
>>> +    bool disable;
>>>   };
>>>     #endif
>>

