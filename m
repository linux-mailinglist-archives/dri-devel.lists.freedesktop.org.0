Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF0A70F52
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 04:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DBB10E640;
	Wed, 26 Mar 2025 03:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvWhDniZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A38910E102;
 Wed, 26 Mar 2025 03:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742959020; x=1774495020;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CWBj6/H84xMwslfcz6EspHENcpx14o1tIbh07L5eFWw=;
 b=dvWhDniZFpmcl+EwrbwJh58SCg+olD7xmMsN6t0UAheY3Qlb5l2WQfoN
 32lvL/LnQIWFirHDBFcmpFdIuw2yNPSKjRqwsfdUtWjV6BUiaZ7zuVnv0
 FVf8DGLGFhgDREDY3qbs7mi/bBUkp4C4GLiGls0GE8BRryX7DDBFLGvTN
 kPJEgTUOVPsPtFSRY4TtxLUxZNSW/nqDTOBaHM3krE99M7RixYUBvYkYY
 RgXgnwD+C6CPxIe56JZaYmBziLW3x8zwyvXx5ySo0UY0WQMbKr9xR53uI
 AQjCO0gqGHlU35pCdzYL6iGj/+551akEeExoFGEVxJWU2XsHJmsWzCDwq w==;
X-CSE-ConnectionGUID: 1mssT5nwRWSxuF45mSL3+Q==
X-CSE-MsgGUID: VbrTez+PRN6F2FOCB2pI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69593618"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="69593618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:16:59 -0700
X-CSE-ConnectionGUID: gPpAUk86SAGcfe/wfe299A==
X-CSE-MsgGUID: eaRpZi3EQxaz1pCydCFEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129453696"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:17:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 20:16:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 20:16:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 20:16:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWrWBNmYc3hCBnGhkW3Y6ieotazJPfnKKlEYTSCLrJLfm1q0kyNbb96Pv36rxNXEbUxiXY8cV0knaVPgSS4eOOVY9WtTf8WjY/MB3g8J9G10LSk88DAfQy72D3g2Zjp2oNDVEk8qJW+yJ9NC81MoB3pk5XASaLor6AH3eroo+nuSwasjHJa4lQthRL4oGX8aA0HlrC0QoAj7gFZ8szhCIDLQFRNh4JFCc9h5Ng2ConqcpYRcP6fqD7Dhrjker8/Zo7SGbA2EilQLwQ0SH4J9u0tjU1yOSEQ+j202CjBAJNRRyBTBYmr4Cf6gHspYS0CPZm8u/GPiDxnGzbuD1coq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL+z0TFY60HCXoHDNU7WBIF9UY9PqGAu1d/3u4XJDag=;
 b=muiJyhxrh/r9Q1YLvT23bjfFDzil/pgjC6caQk+X8iTu+DOzhFkIFvS3Aafy7xhaAVQHQifwU1a0PUAWa1N+9eOkVm5yISAHsB/gaKDlc0jGfc16yLvOIDXnWda/fpoi2qVRaDPRkSzNqb2DA0arpDMa6JQVsMXbnllU4D3mgZDuahf8kZUCEfZojeEZUNehZmNsT2aVbtTdih+CCZ00KcolKXi4iovDOuyIK3h60nJqso1/A9LYo+cfM6ttk3IgSgJZ38XGghUdSoKPdt0sv42Gp+U5vo+qwfYN/HX9chn1qiuF0gJDeRw43y1tfND7iq7f6hvdWEf1DYlGWgI3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 03:16:43 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 03:16:43 +0000
Message-ID: <05b7f08e-c6af-4a4c-beb3-1f90e1ac05f2@intel.com>
Date: Tue, 25 Mar 2025 20:16:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>
References: <20250325222724.93226-1-jonathan.cavitt@intel.com>
 <20250325222724.93226-7-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250325222724.93226-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|MW4PR11MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d25431-ff91-4439-e86f-08dd6c14a218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkwwU2pvRDFlQjlTdmpwUStpK1BjdUh6SDBmN0JPNU1MMWpOVkErbkJ5TDJD?=
 =?utf-8?B?MnRPMkwyYk8xS2Jhd1NRejlXMGNxamVJVVZ1UTNKNUpmT3MzQlNvTGI0Q1ZV?=
 =?utf-8?B?cURpcGlBV2RiYkErb3hDdUg5eStHQ2hhaGM1LzY1U0I3eEx3eTFrbHZLbThZ?=
 =?utf-8?B?UHM5NHE2di9kR214VXRTSkkweTlRNTZ6YXFNT3FYZi96K09YenpBamlUbXBM?=
 =?utf-8?B?Y1lGbWlWUzB6bGZ3NUV1VVJsWTRNS1ZjV0lNRWhJcUdpUzRqL1FySXVaVEZJ?=
 =?utf-8?B?ajlDRWRVbGduMk40V3hpZkNtdlpGTWZuVkNUNUhoR1hRVEJqVDc0SmdkVmJ3?=
 =?utf-8?B?VmpvYWJxYkRlUkZwYlFLdGhiZVVvSG9xemhQZWc0eHBGZytQZGZJeFRpSlBJ?=
 =?utf-8?B?Nis2dCtyQ3NQcDNpU0dRbWJEVjJxK0JFNFN3UzA1VGEvQjRzeHNtc2lRVDZB?=
 =?utf-8?B?SG9HNWVkTlFvL0F4V29oVERpeklPZkdVUU83a3RWMjNrZW9xWW9GdXFlQmNq?=
 =?utf-8?B?Q1ZJZHI1U21WRlhsK0loNW13ZmVxemNvdTQ4azJoVXU2Sk5sdXBUSU9sdHhO?=
 =?utf-8?B?R01UeEtuNkZCa21VTno5a0ZnR0hrcExPOGxad3pic1lBQ0grUjQ5YzU5Uk85?=
 =?utf-8?B?d2c0WWVuUlRrbnNzaWtLaWNuT3Z0Ym50UXRHN084bzFwREYwVEl6Q0tQanlJ?=
 =?utf-8?B?a05VM1ZhbUFGdXAvaTZnNHY4a1VrazZ5YTczRXBpbng2WXhRby9kU0lCMW1M?=
 =?utf-8?B?cjFUNlozQnRlQWhUUmZyQXprS3dLOWhRb3FvNlBaQ2pkRU03SklNYm1YaDVy?=
 =?utf-8?B?eisyQ2V5Mmw1V1R6REl1OFpGSHhMZlQ1SFZMSk9XWVllb1g5ekxML2ROTE9v?=
 =?utf-8?B?QytVeGRWNFpWaWN0R1ZEMkpheXVCY21DMVhUU3pFdzk2b2RnaGF0Q0R1NnVP?=
 =?utf-8?B?MGVhbUVsVjNLb1M4K0U0aW1kdXN3QmN5RDZhZi93a01INklseFI1dVNtMnhr?=
 =?utf-8?B?RFhsVjVvTDJsMjJ4NnBKRWpyZTlUUTVITEdJK0xrTEJIdFNiYkdraWFocVlY?=
 =?utf-8?B?b3dQdTNOZHh6VkpYSjY5d2ZjcFR2RG03MDVpTGcrQkhVYmw0MjlyVm9maVNN?=
 =?utf-8?B?VC9ra24rWXBRZ2xQQkQzVzlJZ1IrVE81c2o5bEdrbE5tSlhCQ244azZUR2Np?=
 =?utf-8?B?WGxPY0YwK3hxRVZaME10T1h4MGUrdlBFU1dkT1R6azM5aDZJQ3JMRDZkYjJY?=
 =?utf-8?B?TFIvU3hvVnFNeUU5Yi81TTZNWG5McG5UM2pKNzZrZThCbjJib0NzdXVCWExE?=
 =?utf-8?B?YllKL2R2ZWNTQ0grV28zc1JuVjFYbXpMWVpuL0tTTU1nVEZGbjZCcGI3TFpX?=
 =?utf-8?B?NktHRStKVDNCWjUxcW92ZWRYdXBQUUwvN3BzYVRWNWZUblRLV1ZYZnZxbG9s?=
 =?utf-8?B?ZFl1ZVBud2pMZjVub081ZHBZeVNtTDNNQXBRZHFrZHR2cjNVT1lHMU5jZitl?=
 =?utf-8?B?MWhtd3JZcjY5aXdlaE5Zb3FVSU16cW8xT3hCcGUwVmsybnJrRGlneXoxSU8y?=
 =?utf-8?B?bXN0aDZlbGhobEdadm9TdVlxZlJRZDhKb2RUaEhpbWRSdVhoUTR5Y2lPOUhs?=
 =?utf-8?B?amE1b2Roam15ZERwdUZVTGgzSm81dll0SldUeUNCby9rcnJOSkQyZjROZUtp?=
 =?utf-8?B?ZVFCWVYwc1ZLTDdBeEhyM0p1ZDlLY3MwQityaGFRWXJ1NklPUnh5V0xKMHRS?=
 =?utf-8?B?S2hVcG1sa092MFA2NFVrdW5zUnpjQ1FzOGx6TmIrdSt5dHBxWG1DV0RXUGZv?=
 =?utf-8?B?NmEyTDlBQU83ODZlU1Z5bDI3dy9TMndVL1VuOVFnZnNvWkJNMitFbnBwYlhl?=
 =?utf-8?Q?0WKdY+1CaPci+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1Q5NUtSUWRDZlZaZWppVXJGczJGYlFaZWgxVVErb0VOc0tTSGJOL0grNDJs?=
 =?utf-8?B?cWtEa3IzYVpQY1ZKbTVGaHpRUDFCV2l1bjF5YlI1Ulh6VVhWaGRXSGpaUkMv?=
 =?utf-8?B?Qmt5UlBOTFpJd3ROaVljdWg3NzRUZXRzN2VoNDhnN1VjaGF4UUh1UjFDdGlj?=
 =?utf-8?B?U3JVQ2gwck9taXlOa2MzZXFvN1F2YW9PTitxckdWV3BVT29VYzlQNkdjektu?=
 =?utf-8?B?STM4L25lL0FXV2N6K1IzRENYaVZOL0NBVEtLb0swWGpUVFpjR3V2K2xHcW1w?=
 =?utf-8?B?NnF4OXFPcDFWZFpZSmJRaVdzdW9CVi9zeVJDcmgyOG1GZUZvSFpJcUt3Skg2?=
 =?utf-8?B?Sm1YbHJ5S3prN2dtM3ZvOWM4T0RianM2YWN0R0JKU1llUXQ2K05lR3lOb2l3?=
 =?utf-8?B?WnBrOExaQy9Gb3NxS2txc1Jlb3o3ME91bkw0bHlGaUlKV2ZjMDVkZGNzd0s0?=
 =?utf-8?B?V3c1Z0FpTzZCUnhaVGpLZ1JMNXpMbWM2SDJLdHdYTFFiOHk2R0xsUmNmQk5B?=
 =?utf-8?B?NEU0V1RmUVE5UzAvMmY4Y0tZL0ZxSjJnWXRQeGx3Ty9aRnArYlFUdmVML3gr?=
 =?utf-8?B?dVZ2cEgrdlM4RjdhQjQ5SklhWi8veStjVk9tWE84SHUzeXRBS2QzV1hSOHBz?=
 =?utf-8?B?SUdBV3E4TWdSeDRCMEF2Ri9BQTF1amJlYjNiY25XUWRHTlc2bWptYXd3ZUsz?=
 =?utf-8?B?bnNHbFVRTWowK1ExNCtZYkVOcnlDNjZYdXhJQU5yMkJqTlZnZ1RRQkc3NG5U?=
 =?utf-8?B?V2RWVHVGY0ovM0c1eDByMHJjTHQ4TVpTSkxvTHczR1lBcWd4SFlwbDQxeFFq?=
 =?utf-8?B?UHdNcURBbnc3dVltUnpMVjVzazZ3ZEFCa3l5RzgxUXZRSHVXKy9RSWVnSGh5?=
 =?utf-8?B?TStNY0VwNE1vdkdVbVhGd3JIYlA2aDgvVlhBNzRjalNBLzdRSGtoV1dtKzlL?=
 =?utf-8?B?YjhRMHNlbFpXUGtZd1VrNlR6TTJLWUkyVVN3Rzd4SzkwNHd5NFYzeW1DYnph?=
 =?utf-8?B?U2FaVmNFTGdJQmRzM3BUL0xiakhZNGJKQXBYVGZUZklLMFMxdnVmSWFHbTF6?=
 =?utf-8?B?STlxU0l2dmE5YWl4dFNJNWZLQ3lYb1NCWms4Y2k2V2NSWDRoZjdSaWVYU2sz?=
 =?utf-8?B?d2grTVRKTTd4NDdRSytjQVIwdGQvMWhFVlRTTHpmaEVGZHc2Mklia3Y3SllK?=
 =?utf-8?B?bktEcDl1TE1hRHhyVmhCd05iS21zdm9WZzFLcVNSYTFRVGFZa2pDN3FIa3Ru?=
 =?utf-8?B?SGtYK2RKaVBuakw4MkNPWC9SSWw0SDQzRDZzMFFHY20yMUFnUTVUVVVCdjhZ?=
 =?utf-8?B?N0NvWjhGNE9hQm5OVG9Ub210cFhoamtnYW5yczh4WGxzMXhicm5NUEphcmZz?=
 =?utf-8?B?WlFWVjUxejIxNGlpZGtVdC9rb2RnOFg0UDRFV0lCV3ZHOFcybWtKS016Y0pl?=
 =?utf-8?B?OVZOa3dpaXYvWEU3U2pBMG4xRWtkVXB5eWZhdkpwaDNNUFVaSnhtMFVsSUpk?=
 =?utf-8?B?TC9aSm5uSEFUU1RDT3JCK080VFBZNUgwaGZRVDA5SlBHRndSWUdvRXBOQURr?=
 =?utf-8?B?OXQyWk1KUDliODNXM3I3bm5hb3UxK3hremxEbnBXUEJKSWtjQWpWeWE1UmRW?=
 =?utf-8?B?ZjM4WEo1MDRJT3NtS2pGRkF2V1VHT3FTc21BWUFHbzBsY0FKZjRVdVY4UlFs?=
 =?utf-8?B?cWJ5cFZMcVhIUmFLNVFWMkxEam9QdTNSMWlqOHRDSnpJc3BhNDZVTXcrQUs2?=
 =?utf-8?B?U0ZMOW16WEZRM25CT1ozODN5eFdBOU1Dby9VeGhMc3NlNjd0ZjBRVnhIQ1py?=
 =?utf-8?B?SXF4REx1bk1KTHRLNG9vb0NTbDVKQ2kydmVMUUFaMm5HVXR3OWtSdUJWOW1P?=
 =?utf-8?B?SzFMMkgyMjQ2ZzBFNlFWL0FRR3lOQUVOeWlNN3plNmxWWTkzRnNEcmtLWkN4?=
 =?utf-8?B?WGNkM081TGJkZzR2N2lCT3Q3MEdRS0RDWWxNZmxobmIzSnUvd01Tc294dW9v?=
 =?utf-8?B?aUxHeVdsTUkwb2x1VHgvcWltZ2lKQWZlWFlPTzRGeUpjc3hrODZyQnBNbXQv?=
 =?utf-8?B?cVBTZ2NmVEY2SVp1Z0E4eVliYmZPOG1hM0FwUVMzTldSQzJhNWxyeDA5YnhG?=
 =?utf-8?B?N3JMQXRCbFVJSXpnYlc0a2ZqblhWSDZQQnlOb3ZNblQwU0JYbURMdklxS2pS?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d25431-ff91-4439-e86f-08dd6c14a218
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 03:16:43.4357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWcmB1MTwqMghfHaHqTzMMdm1VZxpa43dtgTdaqryUq/yKAAsidV8IZpYLgQdlM0WsF/cDtpODqDufhfPoPhcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
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



On 3/25/25 15:27, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>    is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>    purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>    (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>    single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>   drivers/gpu/drm/xe/xe_vm.c     | 88 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h     |  2 +
>   3 files changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1ffb7d1f6be6..02f84a855502 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -195,6 +195,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>   };
>   
>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2c89af125a90..d57aa24a5de8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3553,6 +3553,94 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address = entry->address;
> +		store.address_precision = entry->address_precision;
> +		store.access_type = entry->access_type;
> +		store.fault_type = entry->fault_type;
> +		store.fault_level = entry->fault_level;
> +		store.engine_class = xe_to_user_engine_class[entry->engine_class];
> +		store.engine_instance = entry->engine_instance;
> +
> +		ret = copy_to_user(usr_ptr, &store, entry_size);
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	int size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> +
> +		args->size = size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
I place the test result here just because this function is shown in a 
lock bug in dmesg. So the good news is saving fault starts running. The 
issue occurs in the last rev (patchwork rev 13) too, but I don't see 
obvious mis-matched lock premetives there.

watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [deqp-vk:4031]
...
Backtrace:

[  227.950361]  _raw_spin_lock+0x3f/0x60
[  227.950364]  xe_vm_get_property_ioctl+0x11f/0x2e0 [xe]
[  227.950530]  ? __pfx_xe_vm_get_property_ioctl+0x10/0x10 [xe]
[  227.950664]  drm_ioctl_kernel+0xaf/0x110

> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +	if (XE_IOCTL_DBG(xe, args->size < 0))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>   /**
>    * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>    * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>   		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>   
>   void xe_vm_close_and_put(struct xe_vm *vm);
>   

