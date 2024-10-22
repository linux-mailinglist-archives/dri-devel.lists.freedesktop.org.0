Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F99A9885
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0723110E5DB;
	Tue, 22 Oct 2024 05:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihmi2qI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A3C10E5BA;
 Tue, 22 Oct 2024 05:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729575265; x=1761111265;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0W5d55x2nkQBY7VQf627Cvx2eykeg7xpRlPx+ANQS1E=;
 b=ihmi2qI4rJVXEDInD+cKaZe6oIqMcnd3d+Aq2/pbRBV2v0acuvX1Ocf9
 6y5aSVuJp2H4K6bhm5eFplpUJONVYWbPU2fhdVsRHvnwXPIgXbJXDa4ru
 pzakFx2hCmYcipTffmrfufxkeRAINIaH9w/iiwx42nEnxGme06gAO8k+B
 XDa81zS+rtcrc9vF6u/Kich21Cwec1in6g3Y67ScfJIwLvOfH0tmQv4be
 wC2eotC686Qs4MPgqOcIHcT0jOGp4v6yde6quI5hdQ/MOjhzdNcQMCGG0
 kQr8aftAv02JPHe/xe1ybMhC9ds/CvDM0AcOUyAWZp+FzLiz0reGouYDt Q==;
X-CSE-ConnectionGUID: rkyiVwiZSSujgfjpzpsvbw==
X-CSE-MsgGUID: VhDPAIEVS6S1F9NV94XqUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39698979"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="39698979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 22:34:25 -0700
X-CSE-ConnectionGUID: hcL1SzRZT2SpMIPM9yxusg==
X-CSE-MsgGUID: cacAyKkHTOqcdgC5pnwxcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="117171938"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 22:34:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 22:34:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 22:34:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 22:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eyu9Zf2kIctLYKrvRS/Vj6WayeHdgFgx8WDl0yN0t1xkCI7co+F1KuzwP+pRnZv76d+jfV2heRu1Ba5mZvMTF8syMlsAkWt65hO2uBK5U9lvdcUJakWgqixQpfG6l8+vtkceXcM5xpvXgN92naMJxL+5Eqoyn/QeU3Yx6hwttEtk7MbYtVhe4dx+g41DJvWveqsnHUbkuIepwZS77ZT2mf+MezSnoAo5vOsuEOOS32IwElS4RPCvUJwPgIPdo1Wv/egRDssD1MZTTpK8lQceIoP/cd33J0XxS/+ifu5PYeuJjs96jZ8K4oL/3uhnsuxFDh7pqRVqxT05UB87SiM3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z93phCqck/MqE8BtL14HiWOVPUVVWtQrRzSNtd9WTIU=;
 b=pthwzgByHOItRBVQXnwwslxHmxUvaT1b6RZ/GC+XxWsaZORURuQdwHdfVTYAHdhgT85hV9EosTMIUX5vzhzL2z2CG2n1K594aNyu287yzudylrSF3Mw6KVnF3Btz0GH6x5UPcSDUpVzEz8WP9g9v/D6JQex1jxJOLEvUKBEyfANl7krsjrquFODLbacMlEIb7izbLlgf1NRU9XljTBZOsjRANjZnGIH2w0qAkCnjjBGnY3Oa6/hcrZr7VLViI9E9JWeGsMnuP2qChesGDlQpcMjUHKSccUmidaxY3eHOprWpyeXXPFgXd58S4teIRtt4Hm4qNtucCP73eT5BwSRtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 05:34:20 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 05:34:20 +0000
Message-ID: <a4715edb-ad88-4c68-81ab-78bc1d779de8@intel.com>
Date: Tue, 22 Oct 2024 11:04:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241021175705.1584521-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: de52bfc8-3dac-464e-c9f5-08dcf25b2dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1JabE5VbGR3aDl6Ti8vVitJUDh1WUZwcXBSelFwd2lVZUY1cmZSNUcyZ3Y1?=
 =?utf-8?B?Q053bzBBU2hzZXJnaHdZenhVVzEyeVN0bkVNNEpPVE5UNjRDUDh0eHh4Wm9i?=
 =?utf-8?B?Y3hqS0RzekJhcFVRc3BoQlQwUmJqUkhhTTJRU0FQTWlNRW5Kcy9uSUY1bUhU?=
 =?utf-8?B?Y1JHU1JEN0FqcGxkOHhHSGJyTkg4SU4yMkkzcnZNUTVuYlRuQjYyN09NUzNt?=
 =?utf-8?B?U2ZWYmxQbklaOXIwZzFVblVFdkFWWFRQYjZMdmg5bzRrVFYrOGZxVjlEU1Jx?=
 =?utf-8?B?SWN2UDlVTi9OTG1ZdnZmeTM2SHU2UVNlc3Z3MlJBVGQxV01zT1czN1BQUUpS?=
 =?utf-8?B?cWM0SWw5UjBka2F1S2p2YVFBVkhEMFdUak9VSFdiSkFSQ2JXbVVaaCtMUk5w?=
 =?utf-8?B?TVZtZTNYZWJOS2RnRWtjZFdSRzZiOFBPMW5nb0xISk1EVjBibmMvTWxPbC9R?=
 =?utf-8?B?alErcUhmNko2cGZZMXVSOTB3OGJPRWdGWVZuT09BczBtdDM0bmV1U3l1WW11?=
 =?utf-8?B?MlZKRGRmL2daWHkxbmtHRmlPNUovdjdncDJYVEFoMXZOTnRENlFaTEV5UEVU?=
 =?utf-8?B?eVI4MGlhbzVKVHd5S3FXOG81bWdYUkpvNXRwY3doSlhRekI4U0RDUVh5MTdJ?=
 =?utf-8?B?M0tPdHUzeDFLTDBBc2hTOVVZN0dwdVloZ3JBR0YrYWJKN2JZR05peXlGRmxR?=
 =?utf-8?B?cWhhMDhjQkhNUmZaL1A1THM5akx5aUw1U3BXWld3ekhqTjhqQUUyR09DaFlv?=
 =?utf-8?B?VjJMdm9wOUJiYjFoVGx0aVZ6S3AvN0c5WDZKZFBDQmNTRjM4d3ZPMitoZjBK?=
 =?utf-8?B?dXZQME5IM1hJM2toVndqVjducG1TV29YaGxWenphbm5tSWRhQWJFNzNKK2Vp?=
 =?utf-8?B?VFFiZEhqZ20xVFZPNEZzWjlFZ2t5a2RvNFAyMFlBcGgxQzMyQ1plZVI5RjJl?=
 =?utf-8?B?anZJKzF5TlVocmRtNkJOOHRFUk5jVG5TVStCejdQSk9FSXNXZktXLzJtcGVD?=
 =?utf-8?B?LzZoa3h4bS9iR25EOStUOXZoWGNDRDVSWWhSc2Yvbm9teXVCNXEvZlJmMVJS?=
 =?utf-8?B?bDBldnFUR0FIcXgrYkdoUEkyV1F5S1Q1L3lnR1I2eTd5OUcvdTFBOWkxWXI5?=
 =?utf-8?B?NzY1R2NnSWRvWkVlenJudVM5S0ZaNENxdmMzTGJna0NCVFhHaG4rTEFPT0dM?=
 =?utf-8?B?N2NJTTZPcG5iM0MvOFVFUE82WjlPeGVvREVFZWJMWWMxamh0a1hJdit2RGVB?=
 =?utf-8?B?WmtGaDIybkJ3R0EvSm9vdjl4Znp6Z005dkdueXZ5cDVJRU9lUDFodUFLUFdJ?=
 =?utf-8?B?d2Y2Rm1pWm1uMnhhZUJOV2h3Ukt4Vzd0RGd1cGNzcE92dy8rcWJoSEV0bU1t?=
 =?utf-8?B?dHQ5aEh3SDk1VENDS2lDNmQvTmVBckVZdFdidnZaZzJSMVZuY1lOS0F2RTJ5?=
 =?utf-8?B?N3dtR2lEaWJXeHVjTFI4MHEvMWxCV1NEK1lxTWg1OGhGR01ueG5FUUhoNnpL?=
 =?utf-8?B?Ym5xeTkrQ3hqVnBwbWdJUlVxYURVTm5MVmhuZFZWVkpKeE1pMTFDKzI5dnR5?=
 =?utf-8?B?UjFqUGR1YmxxMVZBWFNBamxHRE1Qa2lCeTZXZGtDbmlRbGVndkZDR0NWMkU5?=
 =?utf-8?B?MmMvaDA4QTZpYUlkZzl0Q3lGMFVwL3FtdllISkczUzdhVkE5eVZaV1ZvNS9p?=
 =?utf-8?B?KzdhbFVpdEZFWjBXUWlFMGd6UGNQeksxSlgyNHJjWldZKzFwVnI4RThjSWZu?=
 =?utf-8?Q?rPdKzdUT3y/a0CZBjY/1eSo4gr6j2qnAGwT34Iw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpvTG1rVHNHa0pOdE95b0c2WFhua0NsTDh4cml4cS9xdWpGaEdjN1RyalFr?=
 =?utf-8?B?R3haU280VDcxbTlSZ2JVQzM4eWFDdkZ6Z3FsZ3VSMTBmQk9WWU5DSWdaK2Zn?=
 =?utf-8?B?NGVteDRkZDhSQk5wcllmMjl2QTZtZksxcC9TNHdtQjlaZFFBVE5ETUZMbHNR?=
 =?utf-8?B?bm41L1ErdndtT2Jybi9QL3BZbHAvZmY2KzJ2VjhkVEl4dURFNDUyMlIxaFJl?=
 =?utf-8?B?WDJFQm9WTGQ5ZkNUSlBmU3Z5dXZRZ2VNODFSTE5iV0pEazVEd1plUGhjWDF6?=
 =?utf-8?B?c3NYV2JZVVlDMmtWVGVkaHgrVjEzQlZyb282OGFYQk5iNTNSL205VnVha2or?=
 =?utf-8?B?dzVPQlN3SlhxOTU0cTFFN2ZEWTZ3bmpKcWJOcHl4dSt6SEMwNW90SDdHejR1?=
 =?utf-8?B?V3NXRGxFK3cvWHoxQmNDYlFOcUNxTmRoMlQ3OTJuMmVZT1VsMStaYjdzVGhj?=
 =?utf-8?B?NTE3d2NnR21IM2tKTjZhQjBqRVdUWjBvKzFyOUdFNHFRWG9XTUFNbVpCTW9D?=
 =?utf-8?B?U0x4Rmw2MHJ2cGU3RnN2U2ppc1dRQ0Z4SWxRREswakhYK29oUy9Rb0VnSVVz?=
 =?utf-8?B?aEw2UitpQXNvN3lYaytSNmhUcE1ndFlzTzVxSTFWQ2RHZGdKU2VscEdvSW5s?=
 =?utf-8?B?YVB5ZnpnZnZxK1FpcVd6Vjk5RzErSExxTXdTQjFJNFRWZ0UxYUtlWnA2YWVZ?=
 =?utf-8?B?di9BRThVR2JtZ0Z4SnIxQ01DK3Z5S2s4QVcvZW44dGZpNXltK1h3ZVpPNFRF?=
 =?utf-8?B?RVVJMVVIenJZK3d5KzlpTXFwTFoxdHVjTVRvMjE2Qm9ybzVZRGhEajVERDd2?=
 =?utf-8?B?emtJYXdHSHNuRWZYVzJaTWZCNkhocExaaFZMT0loN0hQMUc5RWkzYUY2UXBZ?=
 =?utf-8?B?ellFNkFEZFpZdm8rdkJRZ3hSTlZRTWVWampwTGE0d0l4WW1iN1AyQ3NEeE1i?=
 =?utf-8?B?Yzc4T1IyWDBPU0xTT09uNlh1cnZZcjF4Qzl4SkVFWCtkaTNPbUVOVWZOV0wx?=
 =?utf-8?B?U1VQSlFWRkpRZE5hVWY2bk1TUlArM3VPdEc5dit3Vk1mZDdPKzBuL1pZdFZC?=
 =?utf-8?B?UkpLck5aZkphTWhxZnE3MHExSUlWcUxNcFRMWEJPSzI2UG5renJkdE1nVStx?=
 =?utf-8?B?NS9XbW5oVDZYbjBTUU1NZzVReFVSbjZLa3E3RjN6U3M2QWMwNjJhKzhzZ2xs?=
 =?utf-8?B?Q293V0lRQTFkenM2cGdENnF6TWVKdmNIdEkreU9hRWpNTk1pdmtiaVpDcEFx?=
 =?utf-8?B?SG90dzBlcXQ0SDZNUisxV3E3QkgrTDMyQjBweDU3WEtNVkZCT3R1R0tLaWYv?=
 =?utf-8?B?UDlNS1RTcEhPYnhINUc0by9OL1J3UEtsS0syTDVZRDhOZk0yTWN2SzFHLzFx?=
 =?utf-8?B?Rmt3WGFseFk1dTNzZnNHWUlyR0ozUDFaWWkyalg3cm1UVUV2cEZwWmdSN0JH?=
 =?utf-8?B?WERQZzdBYzNCdHNmeGZNd09CbmdKV3EySVltdXNRNWtjaXFuaDNWUjVTdUR5?=
 =?utf-8?B?aHRtRldKZVd6OG5NQkxZcFBUVWtxVy9qTXhYZkErVW8yU3I5QmJtZjRVOU8z?=
 =?utf-8?B?MGhHZWJQOUtRVUhLVTV5K0ZSTHlueWVWMXJydEJnR2Q3Qm9lSVZ4dkRNUHdH?=
 =?utf-8?B?S2pmeTRTWExHNk8zUUhwZDcxQVhJeDhITUZWZjRUeVYxamJDclJ5cmt3WmlE?=
 =?utf-8?B?ZG52YWRTbThrclorMTh2bVNZMjlqYWdQQ29VNkEzQlBGVEluU0lNeHVnbk52?=
 =?utf-8?B?c2kzajNLMlQ5ZnZlZFNzVzRYdVV6R3ZwY2hTNnFDWUZjYndlVHVxSVRJRkNW?=
 =?utf-8?B?ZHBMOElTalNpRWxTSHVONjYwNFB2NlpYcFBwbTZlcDZWc2tCRFpuQUtEZ3pv?=
 =?utf-8?B?cTdMeDRSWjk5eG5MV0Y3MENYK1ZKdnE4aHJ1Q0pQckhKQjRrWDYrbVYvakpS?=
 =?utf-8?B?MmltblNHR3RJM1pOUGV4OE5MSmxjK3d0ZkV2TUxIWUhvS29zTkJieFpHdnlJ?=
 =?utf-8?B?M3NCTmc0T2N3QWFsSW5QU1pyb09HZklxc05MQmpGVHFRQkgyQkZvUGZMRmJO?=
 =?utf-8?B?VUlGRFl2cURtaXFPaTUwQld3bVZwQ3dpQnBrYWQ3bmVYV1BhSWhxKzc5a0JZ?=
 =?utf-8?B?WjY2d2tYZUM5c1NKc2s1cHZSMEdFWEtzNGlLNEVmN1h5L2ZkUG4zU2hxRDQ0?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de52bfc8-3dac-464e-c9f5-08dcf25b2dc9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:34:20.6737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXkDp/R/+6kkEw2B2tdeCmyTwrHOZ43uJkgmYxTLTR3uk8Q4izkCgjselxSSeitexAJZnu7yQ2d1JeXaPS7ySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
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



On 21-10-2024 23:27, Matthew Brost wrote:
> GGTT work queue is used to free memory thus we should allow this work
> queue to run during reclaim. Mark with GGTT work queue with
> WQ_MEM_RECLAIM appropriately.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 1b3178226987..0124ad120c04 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -246,7 +246,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   	else
>   		ggtt->pt_ops = &xelp_pt_ops;
>   
> -	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
> +	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   
>   	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>   		    ggtt->size - xe_wopcm_size(xe));

