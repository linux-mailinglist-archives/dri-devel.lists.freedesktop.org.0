Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE8A5BFDE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 12:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8CC10E571;
	Tue, 11 Mar 2025 11:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZHJ8WwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94E810E579;
 Tue, 11 Mar 2025 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741694330; x=1773230330;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=U7Pvfj45qNENGp8FZ1NTooxXMKkorudRB1tXTNwmJ90=;
 b=EZHJ8WwI/D3Zax1N+15WiF7a5QY+Ps0wceJmImQK7J6QUDe5SFwgDrTQ
 qsp4qHlHN7Bj/Ix7fHEfItWpcliCmj7B7TCzUS4EpVJy3gJoZqHoKXzo8
 AFbNl9P7f/vZ56D3Fi2fvmvsdKopzkME+o26RpCFAWhFQjkJxQC65a437
 mhuOb9LKQmbdX/A/cNzJVNGLGjpmLhlHHk0JwJL6pZYPu6LnSPcSCnNhN
 TI7Rkfb0GB7F/duwXDJEiIm/YkxjKuT3G7g4La1S8MiGTH5PEmI8jiEST
 wtlSh0ud32L4Tbt3GBXPcIf0+3JZLstI8b0w8NmspjbrFg+BqAAtHfhRl A==;
X-CSE-ConnectionGUID: C92KceBvR0yy2hOEWeDOLw==
X-CSE-MsgGUID: eVxrtQzKS5KNxOCkqtfdOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46375894"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46375894"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:58:47 -0700
X-CSE-ConnectionGUID: JfncydlVTZWQCVE+5ayeGw==
X-CSE-MsgGUID: RzaC7dnXTWqmljrd14SM5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151248289"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 04:58:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 04:58:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 04:58:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 04:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfGSWIUhxjq6Zn4zsG2EAfJyhInoiQ3gF/nV1XseTLDsqss4Vqyf9UcFmvJ0vvzB21TsqDev5feMEVRmJv4PU8eoH0WcN/dpDVTQ5CLGbR7rD9jo6af66MMDhXnuqruOn5n7wcwXgGrXZda4N36uZBMVucmxPsk9IuFI+FP/lf457hYMaOiVYwVdf6qON4sYNb4JETnXnK1N9pGNVPWeTMYe8agjaDXeLXoKEesunnvw2IWiQM9FUuFdj4EAabQX8twA0nzoSPUWVE1r1LmP614WrpavYAYN2B7Dbneof3Kob6rbgS670P37NyewzPO7G3cs6bHL9ccuKezlCKUX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLGWFcBDzZHupZGfKg/3PBkqcXi4gBTTyjgnTqu8yAA=;
 b=bas8/ioz+nQBGxtugqaNyhN67b9/oa5LwuLleWqW+xWL8C6tW3nSPnokNUmHfggD0QHFA32Dhv5MtXbH79osDi38OKWmmJJtpEIBWPpEW1j7wSk/yADYYW2MerNV4+6ph0r6JQHfnFqP0eOpNooEsY6oeapqT3ShyO+d+JG/2t9YH6/G9XGWL4D6qYvcK4zBoVLl1XDSdrB3ataySK8R4vITYXxT6+wAzClOI8ravyrtLvi9HCFsMkTJ1x2d4nkdnDkj6ugSJ8RTZGpYeZ5QrI5AGchkenF/W5hHa0AjX4Mkrf5DY7FQBuNgV758jGtWvRwXvMzFMwnWPOYobB30tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 11:58:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 11:58:42 +0000
Message-ID: <2ed2e69a-b42d-4a40-a89a-74ce2791d8e0@intel.com>
Date: Tue, 11 Mar 2025 17:28:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/i915/display: Add sharpness strength and winsize
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-4-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a1aafa-2652-49a6-93af-08dd6094117d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3EyQVpDODlodTdBQzh6ekRJYUJJVXcxUWZnK04vUENuekphM1RmL1ZWQVF4?=
 =?utf-8?B?bnphNW15M1RHSHRTTm9rSjVwMElJUXI0YlBTU0NUYStZc3Fyd0pxamkrN0NS?=
 =?utf-8?B?cHZlVXYrbFJ6ZjBsVUVZQ3M5NTk2MUpub1BEWjQyTmluZ2RMbkNUUTRYcW5l?=
 =?utf-8?B?NDBHVGxpRWd1Y1NoZGwwaGNXSVFCYXJDRVdJS1YvdW84MWFpaUZtK2dKNmRh?=
 =?utf-8?B?MnYxRytzYzYzdjMxTGtsclh4WWdPakpRQjErMWR3aVplUStDZjR5SW85Qmx5?=
 =?utf-8?B?WGhRQU1TK2NmV2QyeUF0MzMxZFJ4NWg2VmNTYlowTlk5Y0wyTEd6WTg3UWVL?=
 =?utf-8?B?SEtSWmNSWVBFWUpJRFVVRS9ZbE5Tdm9YcisrdTRSZTJQeENya1ZtQndrTU9h?=
 =?utf-8?B?QVdpQVBuc3U1emFwL1VDNGt3elovSlVPL0hGcEhjZHRZanc5MGZyV1JPYW03?=
 =?utf-8?B?M3hqUTNPdmE2bEdnbmc4eWQvdERxVVF0OEEzdUR6QUxXdkVKdXpNNzhPV002?=
 =?utf-8?B?RWdwYXpMWEFvQUQrOU1STUZ1cTRyZ3FxcDlxTEY4Vml1YkZsT0lnR2t5YkVL?=
 =?utf-8?B?S3N3UmNGL09nYzhManVyVWhxVjRmWmVIU2pNK3g3aVZ6TGl6N1FOR3Y1a0hU?=
 =?utf-8?B?a0g0Y1AxeXhqcGE4WlV2US8vZDQvMXpMM3E2OFZjZWdydXMyMXpZaXc1cnNV?=
 =?utf-8?B?RVhjU01UUXVRY0hrcUJ3b1h2WFc1dW8wR0JyVDFhTzY2dlhEbXdsNXRvNHUz?=
 =?utf-8?B?OWRCK09jNDV0b0tYeVJobElkZXhzeW5kWG5lMlZNbnRxN3h5dXZpYS8wVFla?=
 =?utf-8?B?TXRtRVp1Znp4c1dnRUhvaXA2ZzN4OGlEemR5TlZkNm5OU21oWFQrcklUV2NW?=
 =?utf-8?B?KzZvc05OL3FHM3RnSlBFNTdlYUNLVVFvdlpXRS9oa3hNSDVsYStTK05jNXJR?=
 =?utf-8?B?aTMyV3YyWjlEaVNqY0JWeW5TZ3VzRkdrWitteHA2STJiV2poMGdBT0pXTzJq?=
 =?utf-8?B?bTRmMVM5ek1mSUdpTElIc0wvNGJpZ3A0a2UvNDJXY2xrWms1cW9iWHRiTW9H?=
 =?utf-8?B?dDFWZHRDVXNQSVRMUDdJcUt4by9WWU1rN3NiZDJ4TVJWRkVyTUsvYzJ3QTdk?=
 =?utf-8?B?Q2tLcnErZkFnQlM0Lyt4QVJPSGw1UTNNTXVza3NIMHAxY2l6SDFJcnlIY2Ni?=
 =?utf-8?B?T1B4azJnRFV3eUVxaS9PZTAxM0hxOTZheWloZ09aUHlOdXpkMHJ1ZFBHR1lM?=
 =?utf-8?B?c0k3UThMVmVxa0FYRlpnSEJDYkJRVitrWDkvbUxQUE5nMzN0UjEzaGx3ejZI?=
 =?utf-8?B?YzdSc3YzSnVCd21meXVodkRJNkdVaHNQTmd4bHJsUHcvdERCalk1Y2FIeWha?=
 =?utf-8?B?MkxlOXY3OHZNQ0FSQ2ZkNzV6a25udzZTcWQvTUFEZEFYRldhR20reHF6cW9U?=
 =?utf-8?B?Ky9iVXFValdocDhpWHJuQjRXdFNXakIwQUVTUkJVRWFnWlAyWW5XRjl0dG9Y?=
 =?utf-8?B?bWlyUU5hMHoxazNqRURPaTlQYXRrWlYvUEdEWFVqVTkyOWNuY0Q2VzV5ZUdq?=
 =?utf-8?B?aHpwZjV5STRBWW1zSCtxbkM1NmwxRmpvblo3QXlLWjZoMlZrbDE0b1BJRTBT?=
 =?utf-8?B?VDQ3WkozWDBYa3VVWVFsSFE2YzZzUHlkdmFuem5xY1gwQ3kwQ1pjeDQxRnBV?=
 =?utf-8?B?d1FWOE5xUWc4d1gySkxPMkRYVzlFSGNHcW16Q2tJTWlMOCtpVnJRd3hya2xt?=
 =?utf-8?B?L3I0dzJxSmpFNXE4aDBveVNvK296NEU1K1NhNEk3YmpJcE5Vamw4ZGxPSHBD?=
 =?utf-8?B?NCtrMUR0WjM4d1phZThYWjlYZUZ1RThsbm1WY3F5bmtaRks1YkcrbFVKQSsw?=
 =?utf-8?Q?9fdo4oK9Wkne8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2FzeDE4dzlnYytJbGVSd09qQmRuMW4ySlZCeW1RVndZVGFZMkw0bFRINERk?=
 =?utf-8?B?S0gvM1pZZ0F6WkhXYTlBaE5VY2dCRHFsOXU1U0FQQ0pYbUJMSk9Nck5mOGtK?=
 =?utf-8?B?M2picklQelVRMkcydUROUTRtQWhxTnFIWW1mc01uRkNYOGpjM1lVYWg3eUhD?=
 =?utf-8?B?NXV4TFZLSFZ1Q3cxazZOS2RpK2l5a2lLblVlSG1IcXhkMWE5VERkV0U2aElJ?=
 =?utf-8?B?U3VCaEF0U2hkMlE3WFR6RGh3NnBpM1pTd0RzTjl4anVrVG1SUjZLNitKOXVk?=
 =?utf-8?B?UWd4bk5pYXdFa0hwYXdKYkE5WXFXMnB6NEZYSWF1S1RXTGRjOE0ydHZ4VWhM?=
 =?utf-8?B?WTJ2SnY5QmlId2hvd28wY0pQMWVHU1Z3cVo2YitIRWNjSS94eU5LNWphTWJ4?=
 =?utf-8?B?VFBoNEt5dW56N3ZrY1YyM3hScC9qOXlLNW9hL01aQ0w0SEdLYlJuNjhlcWdW?=
 =?utf-8?B?anVtd1Y5UjZaVzVUSXM2NnZCdlFzTUhwZnN0bkRuTVpmTDAzczVjM1Q2a01t?=
 =?utf-8?B?RzNhRjZqM2U3TVdHNTJkQnJ2ZGU4MnVQL1NqOE5ZbEo4blRVL3N1QVBwRmhE?=
 =?utf-8?B?SmVONjV5WldudlhXb2xPTDdDbHp0VmNPRks3SUExS05wMVVGYm1WM1hhU3p1?=
 =?utf-8?B?a1RkK3VPK1R6U3NGUGQ0VVBzbXFscVhzTFhBckJEQkFzODNPdlQ2bUY0NFls?=
 =?utf-8?B?cDFLV0llKzBNODZCblhOU2lic1JqOEs4a2ZFdFZvcFBPcHdLcVFSdmw5YStV?=
 =?utf-8?B?MW5kUGs3WkJ5MVNObEtzL3dNNlZXajE1ZUQvbmlMaWlXUm5Pekc3c3g2R1pQ?=
 =?utf-8?B?ZTNjR25YT2ordGJNbHBPQ21nVnFoY0RRc24zbWpXYllMVlBlKzVnZHZKaXdC?=
 =?utf-8?B?elRKd09ZeENySGxHZ05Xd3ZOK0s2MTlaVm9CeU10RTRyRUROb1BHNzFmY3RY?=
 =?utf-8?B?VWl6NlIvbG1QcytaaWlOVGw0cnNJanpKbEsvMTlEU2tDYUplUW8rK2dXZHZP?=
 =?utf-8?B?cGQwSTV5QUdYK0dBRk93YzZoaEdDY3RkbjVuZXlYNkJsdHpxU012SWxkZW1n?=
 =?utf-8?B?NFhWSlMxWng4TExSUitZNmtjTGYyOVRzTEdld242dHdyYnREMWg1YmtjazhR?=
 =?utf-8?B?TlJIMjByUGhnZU9MVDZjeDFkQWJrSDJOdzRZK3Uwbk05U3Uzc3BqcVpXYnM3?=
 =?utf-8?B?TnJGNTJHQ0U1UnNQVjVqNi9uM3Zva0Y4VldxK1JYVFZRejE2Q3cxRXowbDNF?=
 =?utf-8?B?dlM3SHRUL2wvb2lLRCtpUVpKU3gxNm5JQmZhei91QTlLUVBvc1FkNm1wQ1BJ?=
 =?utf-8?B?a2swa3lIMHZKejhKaGtZd2ZCdk5hVTl5dUpBY3RueEVXbi9tMTJjU1JpdEt1?=
 =?utf-8?B?dkNxQjdlTjBqeGwyM3BwcTlpb1V6UFVaRkIya244R2x2UDczL3d1bkcveXBp?=
 =?utf-8?B?NHA3WHI0cGxwZndZR2FMRkF3Y08zOFB1KzhFTXZSNW02RWRCTXF0czJ1cGww?=
 =?utf-8?B?NEdDVHpMMnI0M0ZvRlM4YXhucUlpTW5pM1A2b0kxNTFjdkk3WlkycmY1TzVk?=
 =?utf-8?B?cHJXdUtqOWFKcVliZy9qcm9sbnFMODFpUGljSTNJN3crb1lTRitqUTZpYXFF?=
 =?utf-8?B?ajV2WUJ6Vjc0M1Y2SGxEcVhxa0tRaVQ5SDJxYU1CV0M1TDBYWGlyRWd2dk5Q?=
 =?utf-8?B?RERMdGdXbXM3NHdZWVJtdnhYRU5wbkY5SG5tYU0zejFVYVdxQ2c1WnplU0dH?=
 =?utf-8?B?OWVGUEtXbC9PSzhvQUxKUjUyK0ZiMTNZbWdxbVJrK21rV1VuVVhadGJ2bm9n?=
 =?utf-8?B?ZWFLMU9FL3pNUlUxVThqdVVNQWI1MlhHZ1JiTiswRTlUcnRic2hCYTJZeGZK?=
 =?utf-8?B?N0J0K3NsTlZpTDUyZlVhMzdudEtwVU5HdFdmdlRFT3pkekxxZFBNSjMrcDk2?=
 =?utf-8?B?ZUt4aGsyajdIcGROcTIyUFhiZXBiRWhlODlGbnlZYXNHNFhOaXg2WWNRMmpG?=
 =?utf-8?B?ZkxiU2tIU1JBbG1hNHhUVWU5c25RZnVNaUZHeVA5S3kzR0VTRFBHUnV0Zyt6?=
 =?utf-8?B?c3JOZkxTZjJrUzlsaDRZMUgzb2RKcjEvZGcxVWRDanhXaWFqVFhPUXdqdW1i?=
 =?utf-8?B?MUM1MjhWQ2hzMnpTVlpzSlBBZHFPWW1tVnZCR2lzRkpJaVNYNkw2TWVUQXBy?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a1aafa-2652-49a6-93af-08dd6094117d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 11:58:42.4745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2F1xh4hz3swlskmmPkUItM4iJr/3a9ELl0nptjRP65P0WT/+d0haqHb0Qrtr3uIN1rSmT/puvpPmQO0dWu3+ydHjY8iuuppq5WOi1c10xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Add new registers and related bits. Compute the strength
> value and tap value based on display mode.

Lets have some more details about what is strength and win size and why 
is this required for sharpness.
In this what is missing is the readback part which is called from 
skl_scaler.c in Patch#8.

Lets have a function to read the sharpness here 
intel_casf_sharpness_get_config(), which will eventually be called from  
skl_scaler_get_config().

This will ensure all reading/writing of sharpness related stuff will 
take place in the casf file only.

Comparison for winsize and strength is also missing in 
intel_pipe_config_compare().


>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 68 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     | 16 +++++
>   .../gpu/drm/i915/display/intel_casf_regs.h    | 23 +++++++
>   .../drm/i915/display/intel_crtc_state_dump.c  |  7 ++
>   .../drm/i915/display/intel_display_types.h    |  7 ++
>   drivers/gpu/drm/i915/display/skl_scaler.c     |  1 +
>   drivers/gpu/drm/xe/Makefile                   |  1 +
>   8 files changed, 124 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ed05b131ed3a..d7550b26cdfb 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -230,6 +230,7 @@ i915-y += \
>   	display/intel_bios.o \
>   	display/intel_bo.o \
>   	display/intel_bw.o \
> +	display/intel_casf.o \
>   	display/intel_cdclk.o \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> new file mode 100644
> index 000000000000..2c406e7c5fb6
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + */
> +#include "i915_reg.h"
> +#include "intel_casf.h"
> +#include "intel_casf_regs.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +
> +#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> +
> +/**
> + * DOC: Content Adaptive Sharpness Filter (CASF)
> + *
> + * From LNL onwards the display engine based adaptive
> + * sharpening filter is supported. This helps in
> + * improving the image quality. The display hardware
> + * uses one of the pipe scaler for implementing casf.
> + * It works on a region of pixels depending on the
> + * tap size. The coefficients are used to generate an
> + * alpha value which is used to blend the sharpened image
> + * to original image.
> + */
> +
> +void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), 0,
> +		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));
> +}
> +
> +static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	u16 total_pixels = mode->hdisplay * mode->vdisplay;
> +
> +	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
> +	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
> +	else
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
> +}
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	crtc_state->hw.casf_params.casf_enable = true;
> +
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
> +	 * Also 85 + 16 = 101.
> +	 */
> +	crtc_state->hw.casf_params.strength =
> +		min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	intel_casf_compute_win_size(crtc_state);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> new file mode 100644
> index 000000000000..6e308c367c17
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_H__
> +#define __INTEL_CASF_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_crtc_state;
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +
> +#endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> new file mode 100644
> index 000000000000..e5fa4d9bb309
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_REGS_H__
> +#define __INTEL_CASF_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +#define _SHARPNESS_CTL_A               0x682B0
> +#define _SHARPNESS_CTL_B               0x68AB0
> +#define SHARPNESS_CTL(pipe)            _MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
> +#define   FILTER_EN                    REG_BIT(31)
> +#define   FILTER_STRENGTH_MASK         REG_GENMASK(15, 8)
> +#define   FILTER_STRENGTH(x)           REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define   FILTER_SIZE_MASK             REG_GENMASK(1, 0)
> +#define   SHARPNESS_FILTER_SIZE_3X3    REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
> +#define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> +#define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> +
> +#endif /* __INTEL_CASF_REGS__ */
> +

Remove extra line.


Regards,

Ankit

> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 599ddce96371..66b6fbae8294 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -372,6 +372,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   
>   	intel_vdsc_state_dump(&p, 0, pipe_config);
>   
> +	if (HAS_CASF(i915)) {
> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size :%d\n sharpness enable :%d\n",
> +			   pipe_config->hw.casf_params.strength,
> +			   pipe_config->hw.casf_params.win_size,
> +			   pipe_config->hw.casf_params.casf_enable);
> +	}
> +
>   dump_planes:
>   	if (!state)
>   		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 99a6fd2900b9..ccaf9dd4f6a8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -931,6 +931,12 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct intel_casf {
> +	u8 strength;
> +	u8 win_size;
> +	bool casf_enable;
> +};
> +
>   void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
>   
>   typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
> @@ -971,6 +977,7 @@ struct intel_crtc_state {
>   		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>   		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>   		enum drm_scaling_filter scaling_filter;
> +		struct intel_casf casf_params;
>   	} hw;
>   
>   	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index ee81220a7c88..f0cf966211c9 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
>   #include "intel_display_types.h"
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 856b14fe1c4d..a6156f59c039 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -207,6 +207,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_backlight.o \
>   	i915-display/intel_bios.o \
>   	i915-display/intel_bw.o \
> +	i915-display/intel_casf.o \
>   	i915-display/intel_cdclk.o \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
