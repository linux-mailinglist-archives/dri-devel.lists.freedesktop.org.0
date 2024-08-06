Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2940948AEE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 10:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B2310E2FE;
	Tue,  6 Aug 2024 08:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLNrFO7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CFE10E2FE;
 Tue,  6 Aug 2024 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722931844; x=1754467844;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rqqVRAMC/G70+AihVpKbLXM6T8ufgQN3dAr5T02xjZQ=;
 b=gLNrFO7H9ORVigxDEL7Bc9m6ilr8tfyINlMXUb3AtJw7RkxzDjGvlx8G
 euLIZ6NRjv208NmnmyG/djU1nM9Ayoueo/wUk6zGjCFZ3UMZjGYUaeRQO
 5e8152keIIk29tg/lFeJWNs6+ROm8qB4h4RGm4rZpU8bCJtmI/kNRoD/Q
 RkYbh1quL/WGzNQMHFQhSGtRM3aqwQX4zgJnnwFvTgFlD2/K1C58DMrYh
 tVZMMNbMW9qholHtwOcPvxy2lj55XXS00UCQj9yKqvV2Krvrr/fV1KqOH
 nW8WI/oMl5YQ/8evmNGXU0juigAHJWBCLt25f/1dTVFAOeh9hwt64YkYd Q==;
X-CSE-ConnectionGUID: keOuzyiaSBWZPu1sznfAWg==
X-CSE-MsgGUID: eaRle9vsRzCJ6Eo1tAOaMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24796700"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="24796700"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 01:10:44 -0700
X-CSE-ConnectionGUID: ftD8thQNQUOHuLU5MsHYCg==
X-CSE-MsgGUID: mz7oiF6oTbOPfm5PDkVWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="61252946"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 01:10:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 01:10:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 01:10:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 01:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P17414uRWha/D9ic6EiB2lirSPyGZk1NOZxZVi0huc7Tc1jEPh2KRhOZDpvzNPvUc/Sh+KwNpnUGe9mTuU8+iflsaCWUFeBbG1BddRCoXwGax6RfQYioj7DiLj5XzV8Mw580EN2ncYhwOfd4mxdQqPWUpnaGRtwTPShNNQBtTwrr3vPugIsgip0n2ISuKIFnu0AjEjJl8KzkiN91DWrMVDKEyVHn7/mVgcUaswot/3rrIfBEtWzo9t5U3VJ+egIisMs/TONFOYVWBiEheBLJ0Otbhtnoj7WYY9/62IOfz2ptBXLDDtZRKjNoRqwJmAw0pXXRWPr2ARXGp3JQL+Q4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qUqUMag76xOtt51LfAPQqEijKYMXgre+rxoYn2WpY4=;
 b=extn6mXvIFKOmiHn+wm18CYlo3I5jGf2yxJb2yo8ITnRSXANimZphWFw5AS8uLSQnLWQHhVDIJct8sCJCcrrFYrDXvQYbrGld1YcRu4KMxT++nAb5FsG9tY2O9s05F8ZyWJlnmz2JAcTTGInA13FfzK+KzBqdBkYxUpDMiC/HtyFjlXssyUyrloImGss50IEAlTVWgrs1IRBCG2qiTe9v4RuOHyfrT4FL1HeU/LA+GKlaCs8AAu3rJIEeVu3eF1P60Dq3wUMjs1HWpicDOjVbL2x5MeK15Z4Dp83caJAN7hZdJo3ppfOcl++zrXNfgzOtr4QuO2Wlsl7RVuRfbh+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 08:10:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 08:10:41 +0000
Message-ID: <c77e4d07-4b75-48c9-bcf8-f2ed45813075@intel.com>
Date: Tue, 6 Aug 2024 13:40:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/hwmon: expose fan speed
To: Raag Jadav <raag.jadav@intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <linux@roeck-us.net>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <ashutosh.dixit@intel.com>, <karthik.poosa@intel.com>
References: <20240730060520.577324-1-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240730060520.577324-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: e33910f9-9845-4ea3-5c55-08dcb5ef432d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjE1Z2pUZElOMG9CZkRBVEhMdmlkSllEdjFKSU9tZlVwQjE3MFp5MDhtOWpM?=
 =?utf-8?B?bTEzVjNZeVl0NVFwS2V0dVkwWjVRUWpuRHdFaXF0Y1BDcHcxa1prU1hTR0xi?=
 =?utf-8?B?UXRQdWthTTJrR29rVi9QU1R5TU80a3FJNWNvQjYzUFNmVzRFUG1qTXZ1N3VE?=
 =?utf-8?B?YzF2SDZWREJseW51WXYvU3dzT3dzQ1FEa3pTREpxQjlOZ0Y0dFUyekFzdzN3?=
 =?utf-8?B?aUVYK3dML2JaTTV5ZnhuUkNFUzc2OG9vTkVTUEFzTzBSTXVSa25GTkp0aUVo?=
 =?utf-8?B?K3pyaTI4UFpIVE9ORDRVY1NPeDF1aS9ON1BWT0svYXM4UXo3MEgwZ2NxTytD?=
 =?utf-8?B?a1YwUGdQdVgzRytQQVJybXZ3VEhiQWNJNmtFcVhObVkrdUN5R3VaazdCQnUy?=
 =?utf-8?B?WjV5MGZoR0lZRHAyczh4WSt1eGx6anI4Z2hLMEczTW5SZ1NueER4d0lpcWhP?=
 =?utf-8?B?TVdsR243Zm1oQzZveHNPWXQ3SGV6RGU5cG8xOS9HbzY2dG1QcndMdTZFY0Fx?=
 =?utf-8?B?dDlsYzV3VDcxd2tDQ3p1UDNXMkVuVXFUckJuVWJOSVE4cXpkUFQwWFlzc01o?=
 =?utf-8?B?R1J5RFAyeVVQWFNSQnlJN3RpVXhjaTFRTXFsWDhsL2puc0Q3Wjgzd3YyNk92?=
 =?utf-8?B?VzRHVkwveXU5OW5OUStBME8ydlZjWDZlTk42Y1NzQ0RabnlyamI4dmxNUnJ6?=
 =?utf-8?B?NlFGaW5QK0ZhMEJMNUVRdDBoZUVLRDVWMzVlMWxESjI3NTRxOFdGcU4xaGJI?=
 =?utf-8?B?aUpDS1NlaVE5SHRLbVZ0aFRDelpLYlk2OUhYUTVjaFRkOUZOQlRHelAyK2tr?=
 =?utf-8?B?YzFyOW44WDN5WTIvM2NYRy9CQWd6b3Qzc0sraHlKWEY4SlVHcTVvaXlFWW1q?=
 =?utf-8?B?L2xMdlNPclFRRjl1YXExOUpFK2QrL016MGdISlN0SVBjcFZNaFI0c1FGNk12?=
 =?utf-8?B?aFFheGV0QUluRkltckw4bmp2akVvcmRaUjMvZThZV1hNZjl5WDFxVnZGRzd5?=
 =?utf-8?B?NldUaUxUUStINjJOa3NwNTZNS0VpcVd2S2E3SlJUZ3ptRXFJeGdmV1oyK2o3?=
 =?utf-8?B?aWFDLzUvTjhmcktoNHJETC8xMkMzcWZpMEFTVmtMcmd6OTQzcTAxcDVCWllZ?=
 =?utf-8?B?allBamNMNnZFQ1l2VlR5cTgxenhqQnBaSE85Y2VLQ09xNCtOUlZ0SjZEWkpF?=
 =?utf-8?B?R09pcERBYTcrUGVVTEl6U1ZIS1R0enBjazNsUzROK1hrd3pwaDN3OW40REFL?=
 =?utf-8?B?UzB4bDJaaEdwcE5QdjBrYUphSlJnMmhEWVBBRmVMWlpIeUJlNlNERDU1cWl2?=
 =?utf-8?B?YnpvRHk5bTNmdUowOHluVFRXaDlhcWdySlJzRnJkSkxXUDhaTTAweWdqL2dH?=
 =?utf-8?B?TXVTWTlLUzRxUEhMRWRvRHZpUmhiRGlNUmRzWEI5ckxuSUYrdE11bTFEdDlo?=
 =?utf-8?B?VDU4ZWFDTmZzVlZER21pWHFUWitpT0piQ0x5VXU4UjJvSnFWbXlucEhDVmpr?=
 =?utf-8?B?dWFLcDhneG9vRTFxRUJqekhnQVc0TkRld3JSTzAvTDJJMFhtUUNPbWdKYk0w?=
 =?utf-8?B?RW9LWkE3MGQ2cjAxZXMxMGl3cThXSXFTQnJNQm9sUGpjQ3g2bzF1K2FubTND?=
 =?utf-8?B?bU5OY0YyVlR5em5CakRkN1NyakgyM0JaUWhJckJZKytGY1lmd1JyTUdTMlVN?=
 =?utf-8?B?dDM4ZnF5dERHdjY5Y0dOQXl4djJhSVVTc2FHc0NBb24wajhTdmJiU21xZmUx?=
 =?utf-8?B?YkZadzVJK1JXY2taSEFCSERySmM4b05LcEpYUERoeHFXeHJZbjRhY3ZOT1o2?=
 =?utf-8?B?TWpITUtMN3ZwMG1rbUdldz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzliL0UzQ2ZxWThJWGpsejNWamxHTnQ4WE94NFljbmltanNEMWlKSE1XOWti?=
 =?utf-8?B?Mkt3UCtiMHdpOFl3T1A3dGtDbEl6Q3kwb016Q00rT29seTQwMGJoNDZnMFBL?=
 =?utf-8?B?WGQ5OG85VDZnR1N6VnlINCs3b1A3VFZENllCVVB3Y2tyUmNjNXEzTnB1QklH?=
 =?utf-8?B?V3VhcXk5MVBRdzVkd1E0bTQ3Vis1L1NNWGlxY0ZZQ1ErVnNXaUtXTEszSW01?=
 =?utf-8?B?bHhDVlJ3QnpNNkJZQ2lvcno2Y1ZVeklmNm9BWEpvanpHdld5Y3V2OWh5OWJZ?=
 =?utf-8?B?YWw4TWZvWStOcXIybmpxUW9ZWEdZVWJsVGJmOGY3TUZWS1FxYWRkbWN0V2lN?=
 =?utf-8?B?ekMvaUU0L2FrbldBeEVHRGJ4V2JGN09TVmV5RCtjdjExR2huK01YZHdwN3VB?=
 =?utf-8?B?ZGJObzZhcEhVcGZCMTY4bm1xbTZkTVZnTjdHOHpqb1M3QSt2OThxMWI4OXFT?=
 =?utf-8?B?RG40QzhWSUtpMzhZS0xiTzRxNy9kZEFjSi9qZGptWldEQUE4dDBBcmpWb3VY?=
 =?utf-8?B?c3lRM0loVHB2Q091NU81Z1d0dHdtbHNlRDl6UTRJM0pHeVZCRHBLU1R1cDlw?=
 =?utf-8?B?cHN0WmZwaHdmK09hZU1wbnVzdFdjb3NGSFFNdmJHRGlkb2FVc0NSb2NveEVs?=
 =?utf-8?B?aHNuS0NaMkRjOU01VzVXY2dzWE1xWjNWbm1PaTArRExOQytnZXZac0NocmxD?=
 =?utf-8?B?MTJNNW1oa1VXd1NUN3pQay9LQldXdlhkV202RGQ4TU40RURaTEQzRDlKYkJK?=
 =?utf-8?B?TjJQZUVRbmhUT3lxOVA2OTUwWlU4Yk5iUmNVL3E3d2hXc3NPeEsyN28vWFps?=
 =?utf-8?B?QjBHTmhXTnluVURNQUJLMXdvemZyaEhiQTNWSnE0U3VzRnNXd3lrcTVhMStL?=
 =?utf-8?B?RWVHN3RZakhWOU1TTXlZckZoR2xhTE5ZaDVVd1d2UVA5R1FtZ3ZRVTR0Q2ls?=
 =?utf-8?B?UDFuNnJNV09COUZaNDFxK0VrZHhUa3RHQVc1SHFMNDc0bDFRWng4K2VrTWRh?=
 =?utf-8?B?cE5aYzNSSU4wUXpzYVgvRDdFdjBjQURFMjJ6LzhCNEYvaFhrUmh0UlRCS3Vj?=
 =?utf-8?B?STUvSWZaOXZYUytibThZM3l1TXJXYk9kYWNTUkRSUkFHMld6MHVabUY1bHls?=
 =?utf-8?B?UUFmVXVwU2pwaDJWeEdrT0hidWFBNmtSZVRMUEtlQkxGT1RuWFdQZVEwQi9T?=
 =?utf-8?B?OHNWYU9VdHVUV1dFMTZiM1BackRWRnROVUNGZW0yZTZ6aEMxeTk1M0lVc2RV?=
 =?utf-8?B?TU9YanRkS3YyK3lVaVpQWWN0eXYxQVUyWE95T2lWZ3R2R2YxT1Z5eVpFN0RJ?=
 =?utf-8?B?Uyt2L3VWb1V4V2k5N0xTYUNmMXVPOGI2UE5oUzczb3BTZ3ZQdEdDb1VTd2Vl?=
 =?utf-8?B?WDZJM0lsbHdac0YzazRCYnlZcDNtOE5DRlNwTURXM2NvbkZsZ1EvalkyTFYz?=
 =?utf-8?B?cDhCSklzM2tWajNxTEYrbGJWRHgwZVI1NHJPblB6b2ZzbDBZL2ZpUGFQeFhJ?=
 =?utf-8?B?T1NBMlN3czJPRTFjTlhoa3NGWkI2ZVJGSmVyKytRMVhmWVVPYWRQOWo3U3RY?=
 =?utf-8?B?ellmM2l5bktGVFNHVU01S0JKZXk3R29TQkk0aW5kelBiOTBleUUxdytxNWNH?=
 =?utf-8?B?UzJFKzJnQVBuTGtBRmQzVXpKUkdRUWlLUFZOVDBGL0VZUjdBWk9Pa0Fsb2Fh?=
 =?utf-8?B?aGZGT250aG5jcU03WldORXZHMkxod1I5bksySEQyWWlRaXN3REo3L3QwKzBR?=
 =?utf-8?B?SFRKQXNCYTRhNTgxVGk4dXZrRGVwWmJNZkdEdi9oUDVldUs0d0p1YlpXb0FS?=
 =?utf-8?B?bFZGZ2ltZ2h0R1NEWE9sZ3JxNjVDVCtkaEMwcDNRTE5vZEdkVjh3aUF5aDJw?=
 =?utf-8?B?dnBINDI4SGRNNUt2c0hXY3F2MWdIZjBaejNBYnBac3o4UU5USXE1NlpxSjhl?=
 =?utf-8?B?dHVXczBBaGtJQytrSER0d2J0bTFvaW5rSnAxU0ZocTdIWkUwci9ZQldJV1ho?=
 =?utf-8?B?elRzTmxLb2NCWStGTnM1S00zY0hZTGhOVVh0VlBTeWNCamhpMlFFQjIxb1BO?=
 =?utf-8?B?U1VPY2dVOStRV29zRDgxcEtrODkwdU5yVG1jeUhPSXpjenhqQ011eEZsUC9h?=
 =?utf-8?Q?oTfhuKlwVDAw36XDn89eqna/e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e33910f9-9845-4ea3-5c55-08dcb5ef432d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 08:10:41.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOS+DzompkHV04slX6MRHrHwk9RXAZFapBri6BaqzySDdJcxakuYlN3zHC1q4iE6H2Ik1nEFyM9wT2s+zeUAAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
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

Hi Raag

On 7/30/2024 11:35 AM, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ
> 
> v2:
> - Add mutex protection
> - Handle overflow
> - Add ABI documentation
> - Aesthetic adjustments
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Add the name in front of the comments given by reviewer in version history

With that
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  2 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 87 +++++++++++++++++++
>   3 files changed, 97 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 92fe7c5c5ac1..b971f34b9bab 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -75,3 +75,11 @@ Description:	RO. Energy input of device or gt in microjoules.
>   		for the gt.
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/i915/.../hwmon/hwmon<i>/fan1_input
> +Date:		August 2024
> +KernelVersion:	6.11
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Fan speed of device in RPM.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index e42b3a5d4e63..57a3c83d3655 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1553,6 +1553,8 @@
>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>   
> +#define PCU_PWM_FAN_SPEED			_MMIO(0x138140)
> +
>   #define GEN12_RPSTAT1				_MMIO(0x1381b4)
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 49db3e09826c..e3c7c40ca88d 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -36,6 +36,7 @@ struct hwm_reg {
>   	i915_reg_t pkg_rapl_limit;
>   	i915_reg_t energy_status_all;
>   	i915_reg_t energy_status_tile;
> +	i915_reg_t fan_speed;
>   };
>   
>   struct hwm_energy_info {
> @@ -43,11 +44,17 @@ struct hwm_energy_info {
>   	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
> +struct hwm_fan_info {
> +	u32 reg_val_prev;
> +	u32 time_prev;
> +};
> +
>   struct hwm_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
>   	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
> +	struct hwm_fan_info fi;			/*  Fan info for fan1_input */
>   	char name[12];
>   	int gt_n;
>   	bool reset_in_progress;
> @@ -276,6 +283,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>   	NULL
>   };
>   
> @@ -613,6 +621,69 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_fan_info *fi = &ddat->fi;
> +	u32 reg_val, rotations, pulses, time, time_now;
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
> +			mutex_lock(&hwmon->hwmon_lock);
> +
> +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +			time_now = jiffies_to_msecs(jiffies);
> +
> +			/* Handle overflow */
> +			if (reg_val >= fi->reg_val_prev)
> +				pulses = reg_val - fi->reg_val_prev;
> +			else
> +				pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> +
> +			/*
> +			 * HW register value is accumulated count of pulses from
> +			 * PWM fan with the scale of 2 pulses per rotation.
> +			 */
> +			rotations = pulses >> 1;
> +			time = time_now - fi->time_prev;
> +
> +			if (unlikely(!time)) {
> +				ret = -EAGAIN;
> +				mutex_unlock(&hwmon->hwmon_lock);
> +				break;
> +			}
> +
> +			/* Convert to minutes for calculating RPM */
> +			*val = DIV_ROUND_UP((long)rotations * (60 * MSEC_PER_SEC), time);
> +
> +			fi->reg_val_prev = reg_val;
> +			fi->time_prev = time_now;
> +
> +			mutex_unlock(&hwmon->hwmon_lock);
> +		}
> +		return ret;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -628,6 +699,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_energy_is_visible(ddat, attr);
>   	case hwmon_curr:
>   		return hwm_curr_is_visible(ddat, attr);
> +	case hwmon_fan:
> +		return hwm_fan_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -648,6 +721,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_energy_read(ddat, attr, val);
>   	case hwmon_curr:
>   		return hwm_curr_read(ddat, attr, val);
> +	case hwmon_fan:
> +		return hwm_fan_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -739,12 +814,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
>   		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = PCU_PWM_FAN_SPEED;
>   	} else {
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -755,6 +832,16 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit))
>   			val_sku_unit = intel_uncore_read(uncore,
>   							 hwmon->rg.pkg_power_sku_unit);
> +
> +		/*
> +		 * Store the initial fan register value, so that we can use it for
> +		 * initial fan speed calculation.
> +		 */
> +		if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
> +			ddat->fi.reg_val_prev = intel_uncore_read(uncore,
> +								  hwmon->rg.fan_speed);
> +			ddat->fi.time_prev = jiffies_to_msecs(jiffies);
> +		}
>   	}
>   
>   	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
