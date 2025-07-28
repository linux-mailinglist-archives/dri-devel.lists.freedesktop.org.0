Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB04B134D2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 08:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2156D10E33B;
	Mon, 28 Jul 2025 06:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuxU/51L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0410E0A4;
 Mon, 28 Jul 2025 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753683432; x=1785219432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2fMSOloaW7XNSrZYoYe+NgwMYsgCrYJ/q0p/KOjtefU=;
 b=GuxU/51LCpSRxJs0x6D4YfA6U+ArNDrFISYnle+P9di90BAjqBObdGQG
 EAnsBrEGaccE9umRJTXYdKdNU7Sv86Qv0IAGo5usnlnfhJ8Fky8b2AAYP
 j1f/fo0kvL5VpmrOgTgZNisw9CVVqq737mFLwuZVXHXTI8VndJLLnD2/e
 RMtcQIZDCOPFh24ub3klNbvGmmZ+FCywpZ2gjjW0RA9TQ16c6jERfhEUR
 u2Mbv7gIV4sb04cCXKlYV76pv2jzIUWmJyQLzj3km5fkU0wE0ts76nYqW
 xaxeRtvli1cb4My5I0sGkzIFgbWy5XRVDMVyyFDaAReYGYJlDns8kGuiL A==;
X-CSE-ConnectionGUID: 2hW1LAQnSjiU2x3oVKMkIw==
X-CSE-MsgGUID: OELyGBImRZiNgEB1OWWBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59741504"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59741504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:16:53 -0700
X-CSE-ConnectionGUID: HXmI5qY2QzOzR8UXjOzFYA==
X-CSE-MsgGUID: pIyWvQh+S4W9DAd0IrpJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161575192"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:16:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 23:16:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 23:16:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 27 Jul 2025 23:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNrKTs56WLEZzJbncg5N1xXo66Y7Ma66AV2UyDw1bK0NB/jPyLUErAC2pgdXlOpCYaTfUHst1eh9d5iHbbnuzIy4VEfSpxYye/9BOKr5bTBAIYwDGC7KcL5BBIS0sfw5/lWQFvwxA2s8z4FzoOZaMRN2YVZSlLKHoW1/qnyN6Z0tFi/VG5RV6DdP6QHJ/AI3QK/xK1X5ukvtu91nQ01OZTaBZa7o1/jQRAMRHiBDv3P9OFkTPavsg6f7O9eEMsPet3fL9ar29YdM0TcxH6SsYVZemx9KdrUToECyQQpOKfAfoFQmCj8yq8e75p+JULUb9f/nBBFl+WAKj9ETfl0oGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=888KPRDzrwYEGefjnG6NyXCkjdMZ0GILnIDx0FdILaY=;
 b=idRi/IsLCeKOWFi6jtH4yIj8gXY/5HzVAxTqjEegNrChcU+Y/Ym3yA+5zY/XeXtKQhRVS2i3KV+KkafxUsjMu7PqY7Xwa/5xQztTQ++F7EDsC9xsvSdN9drXiKHPC1YiZ2G6u1RGrgDmOS/pnHhLPVCG9K/PrlD1ZNALAjBm43KIUMTBjghgWVCsq7kJOeG2oDLa66cPwzHO/bNUc8womYjxj2n3ugHkeKtqIXDL04WMdBriORBMfENskpiNdnuxudAGgy9Vp5vc06EGsqnyc3k/l2jRJ+OF6bob+Im+2g0ASNA3GkQh3siOJF+XQWkVt3AFWnMBEXvpgGr3imGpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7481.namprd11.prod.outlook.com
 (2603:10b6:8:14b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Mon, 28 Jul
 2025 06:16:49 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Mon, 28 Jul 2025
 06:16:49 +0000
Message-ID: <f517c8a3-7855-4d73-aa9d-1cf3ac1fb8e7@intel.com>
Date: Mon, 28 Jul 2025 11:46:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
 <aIaXqs0VeO92RzXO@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIaXqs0VeO92RzXO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a240986-2b9a-47b8-2d07-08ddcd9e55d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RitGb3dIRjdPdDRMeXM5WHIyQVVHSUVudlpFUTVvTHVmS1BiWFRGTjZsdFNJ?=
 =?utf-8?B?RXk2dzFMVEh3cVNOdExxcWxlcjZHRXRGd3ZpcGZha1ZmMHQrOFMrOGNmTFRO?=
 =?utf-8?B?cElKT0MwODJmSWlCaUM4K2F1UVBSSnlJeHBVTVY3d3g3bExyUEFLNTZCRjRa?=
 =?utf-8?B?SVZyWmMxRjhONTVMWFJoR3FWOTFzT2RqczJEZHZaT2ZiRnpOY3hKclNzdjZu?=
 =?utf-8?B?ZXJhdk5kWThBTEFtblJmbDBQYWdPL0hQdStxZm5tNzY1R1VXSHJ1Wk9LNTlh?=
 =?utf-8?B?RncvaDJSOC9hSFI1MEdwMGgyS1FLS2tHVmZIbEphaEY4U1RkdEFmbysrNUY3?=
 =?utf-8?B?VFBaOTJGSThjUnB3RStpeGF2NjBBeVdqeVNhQXE5cmZCTXkrYlIwK0JQNHpi?=
 =?utf-8?B?MXFVZEZjdDhYNVhORkFYOEhBMUl6bWhjd0Y4VVQzcEZOOGZBWDYwMmpMRVVx?=
 =?utf-8?B?anZwVjgzbVR6TCtyMzBhKzFKUEpUbE9IenZVaGp6RFlKTjZQVnozOEsycFY0?=
 =?utf-8?B?eWRtZjNnRzJjR0R3UEUwN2N5RjBUMFpTRVVGeTlIL244RFU5cm1kSlM0VmN0?=
 =?utf-8?B?aUQxU0hmUWFRVDZKWE9YTzI2VTVILzd2SHQ5blgxMDMyOVo2bkJvdWRjRGp6?=
 =?utf-8?B?bWpQbGt0NmU3VTdwenU1Q2ptallEdTdyb2I3aDR6dFhMNUJPN2V5SkkrbWIy?=
 =?utf-8?B?RzRKNGt6MVNQeUV1dm5VSjJZcEdmWW9QU01yODc0azYyNzZUckJDTGlRempx?=
 =?utf-8?B?c2ZNNHp6SXNYbXh2WmZyUG9aTUljaG90Nml6cnRZazNQdUxqZDhjYzRZKzdl?=
 =?utf-8?B?aUJkWHpTRUhELzJ4OURKR0V6ek1zdU5Tb1dsMk4zdDVSdEdoQkFLZzNzN3cw?=
 =?utf-8?B?UlBqK1RjbHJVTzhBY2pNUEE1allGc2VtMHlUcFBpRXdmSWdHWUkvK2tpbE9u?=
 =?utf-8?B?VkFzVFdBYnorbGEvRCtySTFGMTB5c0tOV1lxSU5iOHJET0J5UDE1cEJmb2RZ?=
 =?utf-8?B?Z3dzdlF3NE9ad01rYkkzNEZKRm8ydnd5eXRLZ2w1KytpMU9ZVWJFeW5FTk9t?=
 =?utf-8?B?V2pzbG5sT3d0RkUyMW9MS0RVTU45WWtIS0l4QXhPNWQza2YzR0FEZjZoS3J2?=
 =?utf-8?B?c1dTOHdLZkZDTDM2NEl4QXNaTXhmSEZaZmR1cTlzdFR1bjBubDZKVG04R1Yz?=
 =?utf-8?B?Mm9CRkVCVTBsenpVZjd4TG5iZHZ0RXRueUl5YURGQktadHhJelc1WFZpQktK?=
 =?utf-8?B?czl5R0cxM0hTSldjZXZyMzRMTGpYR0NPQTlWMElVdFJMYlFRaDhEbU5EQ2U4?=
 =?utf-8?B?QjhmYzlLdDNGejlqMm52WUdNa1MvK1JrRHhWeVUzd1d4TGszL0hESUQvbXYx?=
 =?utf-8?B?emQ2WEhtb25aV1ZhYmhFK2Z3NXluOStiTGk3T2swTDFzN2NaUEJFYVFCbEFj?=
 =?utf-8?B?Vml5d1hEelpmWlVKVkI1akpBVFlEUmN3SG16TTlVM1BXQXVQaHhNWGJ0RUJi?=
 =?utf-8?B?aE13VHp1enJ1QXRuWjJjWHlGSWVNS1VYak1tL0pXRUsyTURkVkU3b1NqQ0Zt?=
 =?utf-8?B?b1JYSCt3K0JZc1pWL1VGeGZyV0hIUkJncHkxTkZhOWtHeVBiK0ZESE1pUUYw?=
 =?utf-8?B?QXFwdEc1Q2xheUl6T1BEbU5XbEZBWWFBTWFINmhpUzZ2ZW5oemJ6dk5vallV?=
 =?utf-8?B?Vyt1YkNRdHJRYzQ2UVMwS1dpQ3hvdGlVeW9MWTNyYXNDZUNjYldMQnJUVEpY?=
 =?utf-8?B?RU1ySVlxMXpoQ2QvWDNCdDdSMGN2WkFaVXJvNFhJQXZkMjRpMVlOdTFHenZx?=
 =?utf-8?B?QkVDZnFFbWpRNzdlNTNVRmY1SkU0TXVRSURFb0dzSW5aa1dmQkd3VENvMWRM?=
 =?utf-8?B?YkFsR0dFQlY4TVAzanZ6eDQ0bTVkenVPQjY5bUxyNUZEQ2dZTVlocHNuMUF3?=
 =?utf-8?Q?LsYaHZuq4ro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZjdFFaelFKc1NOSmJsQmxiNGlWQklPbDhzVGcrZWVpeE9hRlJ2K2ZqNmdD?=
 =?utf-8?B?VFJzaXJwUGU2N0JqdzYvVU82K0MwdXQ0ak1IOGdqSURHWWxXN3dKb3NibHVs?=
 =?utf-8?B?VDIrWnA2aUJtdGZNM3pzUW9aL3NuclZDREhFbFhNQVIraEFJeTdCZFVMYWZs?=
 =?utf-8?B?bTdvOVZyWVVJaXNETlM4WXE3eDhaNk5vc2xZSmhCT204Zkk5Z3lVb3JOZVda?=
 =?utf-8?B?c2lFTlYrSXcwSGd2dzdGbGl1N3N4K3BpcUQ3bGtOU1NORkZNbkN6eld5Vnhj?=
 =?utf-8?B?bHZlRklqREFrdTc1anlYV21mSUNDRE5UUUwvbmp3TVJmM29VT1V6TTRnd0NW?=
 =?utf-8?B?MDNYcEgvbE5pUFB3cnhwVElsSDVuRFVFczVKaHRjRUdrTldUTXhXVkdURmNk?=
 =?utf-8?B?c0ZOT21ndE5DZXYwRGNqclFlaEZlR205VjNKKzA1MWs4SFZQcjhNVnpkQ3Fv?=
 =?utf-8?B?ZExrSVVicjRxdG1FZVlvRTBxZTR6cFFmMFludW9NV1F5ZHgxREd4WFdPSDJQ?=
 =?utf-8?B?aWl2MkYzU2hvRHBWNDdrdjRFcjE2bWFzKzQrYjFwYWhPcEp1UHdSTVFvUGtL?=
 =?utf-8?B?YmtBYWRvdS9BdTgxM0YvY1NhYVI2aWU3OUp4ODJ4cWJkODFMdjFCbHY2THRR?=
 =?utf-8?B?OUdaT2dmamQwY2R6bWlFT2E3cWcvVTJ2SjJaR1pac3V6cXFSTlRadmltdS90?=
 =?utf-8?B?VXpHY3F6SlJldGplM1F4M0NPaUpiMWxtRG4yb3A1c3pnRGZjRktqM2l3MlRu?=
 =?utf-8?B?bkVFUGdqemt3QmVBemdPdG56Wm4yWnR0Q0pTMnRPQmwrcnRGQ2hpSXNIekF6?=
 =?utf-8?B?bWFHYTFJYnNNa3VNa1hEVC85clVtOHpZNXYwYW9UbTF6bnN4VlBDZFUrakNO?=
 =?utf-8?B?d21DTFhPRkNuVXFuZUpMMy9BU2dhYStJUTAwRHBuV3BTZmlSQVJacldJaE1p?=
 =?utf-8?B?UGoybXFFUE5lWXhKNm1ZNzE1dGcwM0dSNWhpODlROHFCQVNmeFFpUStsZnFV?=
 =?utf-8?B?MzFHSGg3NVVmcGdiTzh5Y1lpblZVbGRXMkFEazZsK0xaeDZmclRrQWNURWJS?=
 =?utf-8?B?dUFxZ3F6WFZ4dzZtYzRiMDJtanpDSTNvUWZHSFh0ZGJTRlpkc3JxMGcvQVho?=
 =?utf-8?B?QUpJM080WWcwV3IzV0ptb05CaFhNQlZJOWppK2x5Uy9kaUIxclh6WW84dmda?=
 =?utf-8?B?bWdCRSsyUmQ4eDFqMlhjY3AyWVBDbk9OWmo3VDZ3ODdkTUJ2djNXYitab3NJ?=
 =?utf-8?B?aGVuVVRNOW9haGhCSStuOG1ucndzWG41Wll3dGFIUXc0eVdWdWpPejVEeERo?=
 =?utf-8?B?czRwYmhMRnFzdFpvRUdYOGFEbitub3FJYWIraWQ1MFRRTVZZbmpudDlOYWsr?=
 =?utf-8?B?MFJEbzQrMU5BbTgxTnllYnlsKzJpVjJOdXJnZ2pud1A2K0E5K2l2SzBiVUk3?=
 =?utf-8?B?enNlOG9jY0Mvb0lkT1l4eTdUb0t1SGZGU3BPaFZncmgweWxoZzFmOGd6cXd0?=
 =?utf-8?B?T3pwTUFidjhscUZneUdwMkk0YU5FVGtjajhzdzhwOVJsRFZFU09JcVphRTRB?=
 =?utf-8?B?QXVpRUU1Y1dHWDRUT0tWbERQY0lRRGYvRjl0cXpqL1h1cHhHN1RtaEdpbnFM?=
 =?utf-8?B?T09hRDFjZFZaNGdKRWVjbUh5UUxKVGw2UVB5QUhkdWYyaDlnaHo1S1c5K254?=
 =?utf-8?B?ME9DNkd5QkdmbE1qcmNYbklVbnozU1JvWE1waWsrV3k1TENTL0J2RmVlSGFL?=
 =?utf-8?B?Z1RuNndMWGhFMkNOdjR4WDJVeTRLVmhMNEcyVGJRaUo5d2JWK1kzRGUrTG1v?=
 =?utf-8?B?dVVwQ3hJYXF3N2Noc2tmTk5xVlV6V1BKSXdad2k5T2piOFJvcTJGT1RGTERV?=
 =?utf-8?B?WDdOVGgxb0w4MzNCQ3lYK0x0U3BDOCtadWZWSTJiNGxvSzlKSzBSVWZhUzli?=
 =?utf-8?B?TmZ3ZGlVMFZNYmRDcXVIZGxXMUtHcGo4aVBWVXQ3a2ZaSGltMGFQUTNrNW41?=
 =?utf-8?B?ek9hamcxOXByclo1K1ZWM3VMUW9PeXNBY29nTEtXSnhYcVllT0g3QlpGU3RV?=
 =?utf-8?B?S1JYRlhwMHlIU1Q4U3I2L2FHcVVEd29LVFNpRHJ0ZlhOOHgzVWxZeStzeHlz?=
 =?utf-8?B?dWRTckY4TnRZV21qenNjb05UeFJXMDVyYlorYWlobmZoL2FWS2RpVXIrSW1a?=
 =?utf-8?Q?3LFXb4AGFCk3+nURFXlGmU4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a240986-2b9a-47b8-2d07-08ddcd9e55d2
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 06:16:49.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhuMomlNdUvYlApbHJen2fPnkvtt9ccPAABCtPTwZKorM5zbzNZXUpkHLbz4OSQOQpAbB/+mdYWXd8wwQ8d2xcktj0nFZEirLBR66tCT0ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
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



On 28-07-2025 02:48, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:04PM +0530, Himal Prasad Ghimiray wrote:
>> - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
>>    range.
>>
>> - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>>    drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>> user-provided range and split the existing non-GEM object VMA if the
>> start or end of the input range lies within it. The operations can
>> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
>> used by the Xe driver to assign attributes to GPUVMA's within the
>> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
>> the operation with this flag will never have UNMAPs and
>> merges, and can be without any final operations.
>>
>> v2
>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>    ops_create (Danilo)
>> - Add doc (Danilo)
>>
>> v3
>> - Fix doc
>> - Fix unmapping check
>>
>> v4
>> - Fix mapping for non madvise ops
>>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c             |  1 +
>>   include/drm/drm_gpuvm.h                | 25 ++++++-
>>   4 files changed, 98 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index e89b932e987c..c7779588ea38 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -2103,10 +2103,13 @@ static int
>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>>   		   u64 req_addr, u64 req_range,
>> +		   enum drm_gpuvm_sm_map_ops_flags flags,
>>   		   struct drm_gem_object *req_obj, u64 req_offset)
>>   {
>>   	struct drm_gpuva *va, *next;
>>   	u64 req_end = req_addr + req_range;
>> +	bool is_madvise_ops = (flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
>> +	bool needs_map = !is_madvise_ops;
>>   	int ret;
>>   
>>   	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
>> @@ -2119,26 +2122,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		u64 range = va->va.range;
>>   		u64 end = addr + range;
>>   		bool merge = !!va->gem.obj;
>> +		bool skip_madvise_ops = is_madvise_ops && merge;
>>   
>> +		needs_map = !is_madvise_ops;
>>   		if (addr == req_addr) {
>>   			merge &= obj == req_obj &&
>>   				 offset == req_offset;
>>   
>>   			if (end == req_end) {
>> -				ret = op_unmap_cb(ops, priv, va, merge);
>> -				if (ret)
>> -					return ret;
>> +				if (!is_madvise_ops) {
>> +					ret = op_unmap_cb(ops, priv, va, merge);
>> +					if (ret)
>> +						return ret;
>> +				}
>>   				break;
>>   			}
>>   
>>   			if (end < req_end) {
>> -				ret = op_unmap_cb(ops, priv, va, merge);
>> -				if (ret)
>> -					return ret;
>> +				if (!is_madvise_ops) {
>> +					ret = op_unmap_cb(ops, priv, va, merge);
>> +					if (ret)
>> +						return ret;
>> +				}
>>   				continue;
>>   			}
>>   
>>   			if (end > req_end) {
>> +				if (skip_madvise_ops)
>> +					break;
>> +
>>   				struct drm_gpuva_op_map n = {
>>   					.va.addr = req_end,
>>   					.va.range = range - req_range,
>> @@ -2153,6 +2165,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>>   				if (ret)
>>   					return ret;
>> +
>> +				if (is_madvise_ops)
>> +					needs_map = true;
>>   				break;
>>   			}
>>   		} else if (addr < req_addr) {
>> @@ -2170,20 +2185,42 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   			u.keep = merge;
>>   
>>   			if (end == req_end) {
>> +				if (skip_madvise_ops)
>> +					break;
>> +
>>   				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>>   				if (ret)
>>   					return ret;
>> +
>> +				if (is_madvise_ops)
>> +					needs_map = true;
>> +
>>   				break;
>>   			}
>>   
>>   			if (end < req_end) {
>> +				if (skip_madvise_ops)
>> +					continue;
>> +
>>   				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>>   				if (ret)
>>   					return ret;
>> +
>> +				if (is_madvise_ops) {
>> +					ret = op_map_cb(ops, priv, req_addr,
>> +							min(end - req_addr, req_end - end),
> 
> This doesn't look right.
> 
> This creating a new MAP operation to replace what the REMAP operation
> unmapped but didn't remap. In Xe debug speak, this is where we are:
> 
> REMAP:UNMAP
> REMAP:PREV
> MAP <-- This is the calculation we are doing.
> 
> We want to 'MAP' to size here to be:
> 
> 'REMAP:UNMAP.end - REMAP:PREV.end'
> 
> Which is 'end - req_addr'. So delete the min statement here and replace
> with 'end - req_addr'.
> 
> Matt

True, will fix this.

> 
>> +							NULL, req_offset);
>> +					if (ret)
>> +						return ret;
>> +				}
>> +
>>   				continue;
>>   			}
>>   
>>   			if (end > req_end) {
>> +				if (skip_madvise_ops)
>> +					break;
>> +
>>   				struct drm_gpuva_op_map n = {
>>   					.va.addr = req_end,
>>   					.va.range = end - req_end,
>> @@ -2195,6 +2232,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   				ret = op_remap_cb(ops, priv, &p, &n, &u);
>>   				if (ret)
>>   					return ret;
>> +
>> +				if (is_madvise_ops)
>> +					needs_map = true;
>>   				break;
>>   			}
>>   		} else if (addr > req_addr) {
>> @@ -2203,20 +2243,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   					   (addr - req_addr);
>>   
>>   			if (end == req_end) {
>> -				ret = op_unmap_cb(ops, priv, va, merge);
>> -				if (ret)
>> -					return ret;
>> +				if (!is_madvise_ops) {
>> +					ret = op_unmap_cb(ops, priv, va, merge);
>> +					if (ret)
>> +						return ret;
>> +				}
>> +
>>   				break;
>>   			}
>>   
>>   			if (end < req_end) {
>> -				ret = op_unmap_cb(ops, priv, va, merge);
>> -				if (ret)
>> -					return ret;
>> +				if (!is_madvise_ops) {
>> +					ret = op_unmap_cb(ops, priv, va, merge);
>> +					if (ret)
>> +						return ret;
>> +				}
>> +
>>   				continue;
>>   			}
>>   
>>   			if (end > req_end) {
>> +				if (skip_madvise_ops)
>> +					break;
>> +
>>   				struct drm_gpuva_op_map n = {
>>   					.va.addr = req_end,
>>   					.va.range = end - req_end,
>> @@ -2231,14 +2280,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>>   				if (ret)
>>   					return ret;
>> +
>> +				if (is_madvise_ops)
>> +					return op_map_cb(ops, priv, addr,
>> +							(req_end - addr), NULL, req_offset);
>>   				break;
>>   			}
>>   		}
>>   	}
>> -
>> -	return op_map_cb(ops, priv,
>> -			 req_addr, req_range,
>> -			 req_obj, req_offset);
>> +	return needs_map ? op_map_cb(ops, priv, req_addr,
>> +			   req_range, req_obj, req_offset) : 0;
>>   }
>>   
>>   static int
>> @@ -2337,15 +2388,15 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>>   		 struct drm_gem_object *req_obj, u64 req_offset)
>>   {
>>   	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>> +	enum drm_gpuvm_sm_map_ops_flags flags = DRM_GPUVM_SM_MAP_NOT_MADVISE;
>>   
>>   	if (unlikely(!(ops && ops->sm_step_map &&
>>   		       ops->sm_step_remap &&
>>   		       ops->sm_step_unmap)))
>>   		return -EINVAL;
>>   
>> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
>> -				  req_addr, req_range,
>> -				  req_obj, req_offset);
>> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req_addr, req_range,
>> +				  flags, req_obj, req_offset);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>>   
>> @@ -2487,6 +2538,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>>    * @req_addr: the start address of the new mapping
>>    * @req_range: the range of the new mapping
>> + * @drm_gpuvm_sm_map_ops_flag: ops flag determining madvise or not
>>    * @req_obj: the &drm_gem_object to map
>>    * @req_offset: the offset within the &drm_gem_object
>>    *
>> @@ -2517,6 +2569,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>>   			    u64 req_addr, u64 req_range,
>> +			    enum drm_gpuvm_sm_map_ops_flags flags,
>>   			    struct drm_gem_object *req_obj, u64 req_offset)
>>   {
>>   	struct drm_gpuva_ops *ops;
>> @@ -2536,7 +2589,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>>   	args.ops = ops;
>>   
>>   	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
>> -				 req_addr, req_range,
>> +				 req_addr, req_range, flags,
>>   				 req_obj, req_offset);
>>   	if (ret)
>>   		goto err_free_ops;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> index 48f105239f42..26e13fcdbdb8 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> @@ -1303,6 +1303,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>>   			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
>>   							      op->va.addr,
>>   							      op->va.range,
>> +							      DRM_GPUVM_SM_MAP_NOT_MADVISE,
>>   							      op->gem.obj,
>>   							      op->gem.offset);
>>   			if (IS_ERR(op->ops)) {
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 2035604121e6..b2ed99551b6e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2318,6 +2318,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   	case DRM_XE_VM_BIND_OP_MAP:
>>   	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>>   		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
>> +						  DRM_GPUVM_SM_MAP_NOT_MADVISE,
>>   						  obj, bo_offset_or_userptr);
>>   		break;
>>   	case DRM_XE_VM_BIND_OP_UNMAP:
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index 2a9629377633..c589b886a4fd 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -211,6 +211,27 @@ enum drm_gpuvm_flags {
>>   	DRM_GPUVM_USERBITS = BIT(1),
>>   };
>>   
>> +/**
>> + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
>> + */
>> +enum drm_gpuvm_sm_map_ops_flags {
>> +	/**
>> +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
>> +	 */
>> +	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
>> +
>> +	/**
>> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>> +	 * user-provided range and split the existing non-GEM object VMA if the
>> +	 * start or end of the input range lies within it. The operations can
>> +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
>> +	 * in default mode, the operation with this flag will never have UNMAPs and
>> +	 * merges, and can be without any final operations.
>> +	 */
>> +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
>> +};
>> +
>>   /**
>>    * struct drm_gpuvm - DRM GPU VA Manager
>>    *
>> @@ -1059,8 +1080,8 @@ struct drm_gpuva_ops {
>>   #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>>   
>>   struct drm_gpuva_ops *
>> -drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>> -			    u64 addr, u64 range,
>> +drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm, u64 addr, u64 range,
>> +			    enum drm_gpuvm_sm_map_ops_flags flags,
>>   			    struct drm_gem_object *obj, u64 offset);
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>> -- 
>> 2.34.1
>>

