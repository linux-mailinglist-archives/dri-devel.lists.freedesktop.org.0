Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B7FA603FD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 23:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8707F10E94E;
	Thu, 13 Mar 2025 22:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVFXFw8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C6410E94F;
 Thu, 13 Mar 2025 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741903825; x=1773439825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aDCXe94Eae4GTjqx4sTmD4Ef8qhSnZLOywlCGVE9qFw=;
 b=VVFXFw8znFGajOfbgTjTSA7xl/pSAmBS9sl7qWFXMb3nTGsAi17wQJhf
 td3E+45HyiEmq0Ty/AFIhae3ppK6juwThF3G5NWoU8FlFzytG2+vitu+G
 yEAyKU+drRGUWhZQ7gvZspA0FVOBPfx1zrspiNR0qwZzU0+em3wzPG7Xh
 cYH48oA2AyYzV4YbsS3/DlQiKM+i/Rs0L8PGGruZt8Cpssd4ijA1Ci8qt
 YfG3IX9aTEfIpQ+rXbYudxY9S+sQLZjUV9KsjQrQlMoNZc4kKT3xATO9z
 lPLsPKT1VOmBYK906Tx/yIEeoLOonyLfvpL12vKb2CoVSbWhDwLGNSUF1 w==;
X-CSE-ConnectionGUID: nabuSdcBSVm/qU+MeU3oRg==
X-CSE-MsgGUID: B3BsHvGbQIyu97exzHAt7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="45813890"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="45813890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 15:10:25 -0700
X-CSE-ConnectionGUID: 58xQzEPcTha0Z5W81E+/4w==
X-CSE-MsgGUID: 3YTCbRs4SlGygJkEOedOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121789987"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 15:10:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Mar 2025 15:10:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 15:10:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 15:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOOFfyEEP50by9CLbyr3ssra96iUAK+5zXWDa1UHg4uN2jaUqU9jGjtbJLhhwurPhI0XX3pVWPkCE2R//n3sf+6TybAmZCgNx97lxCHWmuFq7eS833x2kX480+kwvOqn3/M21+HNeVMG5cgO/aGFgGDW/ZV/8MbhpMErlj0zC+Sci1NyXFkvriH0K/1UzvYf2pcv3h/of2PN2JnGISxphnnjQPsvGwkIMCKy8HEz136Wlft6qlx1SqUBS8DYqe7DXOjX3ZvBKuwDGpErbvmhhbUUYBAchTMjHwmAuhMZU/qmp5apTCDr6iDqkwbiuRWHy3PDIsJe7BJKuwBXwFgYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xc62NGdfUufG1sUdRzooOHuKSQ68hNmsYJJZ10fPf40=;
 b=AWLACifMw3BvgPCc2Eih4WN+ntLMKiRuMF6lKPnjNQFV3rZxTQW6x1EjH0ID3u2e96VjaBiPyKXXrtjgeORxY1wTwDwnnVa5EpHz3YUioHL3EDrre0CNMujBRxavNCBtUhrnd/HTGOVWeD4ZpzAFmV25xLFIySnsWcJZmW+vBRQ+fykf1VBUAvraEt/j//17sjJiAfvDgb3CplwCF/Vl3+m2SGivFl6jZAnzR2D3jYysDdCZeSmBIdkS+vprUXbtqwTVikidbVITmD5af7vzudW1FdXMHX0MtJsfg4BwpAdHoUkuSogZoZqkZBY3ZfhUmwnOnRA1XYU+u9pG/+3d9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 22:10:07 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 22:10:07 +0000
Message-ID: <2dcbd24b-e9cb-4a67-9e9b-3bd38ec8cef5@intel.com>
Date: Thu, 13 Mar 2025 15:10:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mzorek@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-4-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250313183415.133863-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|SN7PR11MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d29378d-e3f2-44e8-6631-08dd627bd051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUpGZFZZOStUeEJZUUltVUZDRWNhekVZOU9aREFRL1hiRzhIY1E4QnVlaDhS?=
 =?utf-8?B?bFdBN1Q2dHZPTnFic2NsOGZlVWZWR0xXeWxrSGd0ZW9XTEt4SlVQeGl2bG0w?=
 =?utf-8?B?ZzQ5aHpLeGZEbDNjZWovaXU4SXVybVJkaEJwcHlrQnZqZXFiQmdMNjJMVk13?=
 =?utf-8?B?TEkzUWdYVmtFbGFiQlJ3cGxOU1Z6amZmU0Vld1BCUW44OGx6T0gyZC9hMldV?=
 =?utf-8?B?TFdUUWF4bFJndEZRNGlnaWRyTWIrVm8rZjR3dFJhbjdvazA2bENpTmZ0T3hi?=
 =?utf-8?B?dXNBMmNHbmFKblFwR2hOR2E1S3MyWjFpS1BvcC9YVlN4RGRXb2t1SWw5bmdq?=
 =?utf-8?B?R0FzZ2FDSkpQejMvdWd5SWMyeHFYdUZ0eStZMFQwWnRDZmxQcGpEVjdsOGtH?=
 =?utf-8?B?c2o4QWdwS0pPSDBwQUhPakFtQkc2dnl2bGNzR0VQTXBDQkRnY1VUdm93akFi?=
 =?utf-8?B?SFh1VE5oWG9nWDRtTFhYNmIzS203N1kvL1A3WmZLcTlhU3F2UXJFWUFzZ3cz?=
 =?utf-8?B?bDc3T05tK3p5cVNaU3ZLTlk2aFpweHVaa2lzcjZaV3BQNzQ2VEM4MDRxWS94?=
 =?utf-8?B?VjBNYmJkTktONWFVRjluMVRiSysrd3dXUE5zdG5nYlIya2plUE9Wd3NRSkRn?=
 =?utf-8?B?eE9HOWFLY2cxVms4SzZTcGtyMzdjS29vQlBuVlREdFFxUjhJNjFpQzZ2aDdX?=
 =?utf-8?B?a2ZnMWhEeWNkd3FzSmlIVXlnVGRtZks0VUFmMVBkYUhwYmRJRm9oQ25ZT1M3?=
 =?utf-8?B?SDV5KzZPRlYxVzVnak9OVjV1ZWJ1U3EreEdRZ2VSWlhOUWJJN0tIT2h6LzJ3?=
 =?utf-8?B?aEdZeWVHSUxldTYrQ1FIRjEzZTZPamZvWW9NTjdJdW53TUJnYlRnMEpONmxq?=
 =?utf-8?B?ckVhSVpPNlgzUGptWjJlUUhSTWU2Um8xcWJ1QUhsL01zS1RBS2wvcGtHc21a?=
 =?utf-8?B?ZEtsNmRLcWMzdkVUTDJweC93Mld2ZlphVE1nMW9qdHBDQnNCbmNJOWZjaDlv?=
 =?utf-8?B?S2NkQ01UbU5EbXh1VjRTVGdPRmNjY3RPNDJ4em4yRUVIeEFWaUc2ZjRuR1pG?=
 =?utf-8?B?U25rNHVpN1V1UzQvRlg2M1dqM3dYTDQ3T3ZvbUVOaFU3c2swMWgzZTBuZ29t?=
 =?utf-8?B?QS91Q1p0Y2wxNGhoS09PbE9HTERNODVqV01TU2RSLzFFMllVTTRlVnJsc3lj?=
 =?utf-8?B?RWdlbDZKTXpDZHNIZm1QRjhNVXJyYkFuaHI1b3k3YVhUaVBHTWh6RHVUT2ow?=
 =?utf-8?B?am4wR0JhTlp5Q1dRMXJQK1RTVlUrS2xvYUhYZWZEQ0pjWElNOWhySHk5UUhJ?=
 =?utf-8?B?TEZ2UkxkMS9RTXUyVmlTTGdZSU93aGNnd0FpOSthYWJwMFBnOUxodG53b0Zp?=
 =?utf-8?B?ZUtQOXFHY21zd1YwU3ExQWJ0S0RWRDV2RGJ3d3QrSGhWZkpLZ2pVL0JOc1d0?=
 =?utf-8?B?NllGMnY5ajNmcm94cnpYbGJ2aHFoclJ5TDRTd1JYV2ZENzlGZ1pyb1pjVmpK?=
 =?utf-8?B?YjZ0MXVxaGVFLzhsemhaZmhESDlSSDdyQmdTTGhINHpxKytMeFpKaVA4UE1F?=
 =?utf-8?B?VWczT092OGZYc2tGaUwrVi9FWktoWWNWWkVJU1UvYnh1RVRHVUhJd3BKb2VH?=
 =?utf-8?B?Zk14eW5hNVFVOFNDb0tGdUxZMFcwenRFL1FJV3lBN2E3NzRqMFJvejg0ajBy?=
 =?utf-8?B?Y0FMMWRLSnM4NDhJWG9zR0dKWUtPdTRTNVFnQlgzM0hxQ1NrRkRLSk1WWGFj?=
 =?utf-8?B?U1U1cVJKbENOMUFCOGM0WXdKVGdzU1VQT0g3Tm4yT3YzcmhvRE9GaElCZHRm?=
 =?utf-8?B?YUYxdWMyNXByOWRvZTZTcVQ5cGpZMWdoQU1VNW9DUWJhQXBNakpYbnowUnE0?=
 =?utf-8?Q?98zIqLYhyssQT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eENhOVJYeDBMWkJUZElCZ0NsYjhXaXp1U252M0IxMUtoZExFMk0xUkdSNmdC?=
 =?utf-8?B?NzlQTHlEdFc0SlBkRkRmMVg1enI1R3BOK0RGV2MyemZBSjFBLy9vMzE5OWJH?=
 =?utf-8?B?cnZXQUozOGQ1UkFnaGl4RGhubUtuWUpEaGN2MHlTOTU3ZHdFL2FscWs0Wndz?=
 =?utf-8?B?TkhVdzlpbUJjckNPMmVoWTJDU2pxSEVoeUkrV0hhemxuRVBtNCt5UFJPd2xR?=
 =?utf-8?B?S2ZDZzlkZUpaWnBJaVhxaTQrOGd5N2FRWDhNT2g3bjBiUnMrSUgvQ1J5QjB3?=
 =?utf-8?B?ajVjTWlxaEFVSTBmNXVCQ2V1UG8xaXFUM055V0Rma0kzOG05OEIyVjRZSStV?=
 =?utf-8?B?OTBhNG9GZFNqZDQzUU5XZXVKSDlQU0I3c0JMMVRWVWRlL2tnWHdlMVUvU0R3?=
 =?utf-8?B?QkxIbDJZdjI0ZEV5elVRVE5rY0lIVGVSTmxQaTVDYk1JM01xQTB2YW9MRmtv?=
 =?utf-8?B?WlkxUkl5K2N2T3hLeWw1bDJiSDJDTDR4VXdkejZxOFJmalg3ZXVWRHptdTFv?=
 =?utf-8?B?cEdpTGRlUUdrT01zb3cvM2c0ejZMcWNsQ1NBamNzSkFEbGZyb29xRlJvNEJr?=
 =?utf-8?B?Vmp1MnM1Y1ViUVZhczQ1cWIxQWduOTlQQitMMXhrdHUrZW9EQWdaTFE0MklQ?=
 =?utf-8?B?SXJxejByNmkxK24rSThuZTRSQlNsZUx3YWVtWkJFS2xEcysvWDEzZnk1bHhp?=
 =?utf-8?B?QmNDMGJNZ1hPUGtOL2NIdi9FRnhqTkFSSjZkb0JocHZkS0V1THBIbTB4WEJJ?=
 =?utf-8?B?RmR1WWNoRTJ4aDRmYS9KRFFoSUdZM3pUZUoyYlNzRk02MVJVVWVadUx1cE1a?=
 =?utf-8?B?cCtiaVdvajVTdjlTaEcxVmlQQ1dCTmtBbFJUMWxNL0p0MjFLOTlWR3JtNlJL?=
 =?utf-8?B?MHBNM3ZDM25qS09UUU8wa0s5QUhyUGxZNGtqUmVQcnBIbzFOR0taR21qKzhD?=
 =?utf-8?B?eTdGTFF0UlpDSXpRdGZnTTVQM0xwVlBKSmNjVEd6MGFWeUFIcGpEa0lxcVBy?=
 =?utf-8?B?MEZrV0M0V1RLMXRrcU05TmVGQmJ0cFBLWngwRkxCNVV2Z3l4WlNvbEUvVEJQ?=
 =?utf-8?B?bWdRY0NTZE1QcHdxSVZ4bmpaK2tvb3UxTWg3eGNLaEZwcDB2QlF6WkxYdlBK?=
 =?utf-8?B?NXRWMVVxSjY2c1pjbEljeTU1M3VoRldybXkxRE42d2hkM3VTSnljRmNUTU1W?=
 =?utf-8?B?MlJtaVAvaG81VW9hMjVFRFN6SkhaUDdsWW41TWVaNFRsT2pCVDlTT3o1Mmd0?=
 =?utf-8?B?WXpVTzYwejlINDdlK3NZdFowWHJlaDlVSU5DOXVwRXpwWG5qanFRSXpvdmpU?=
 =?utf-8?B?YTFRYkxrUk1SV3UyaHhJZEthQVRkeGEyYXhaQW9VQVJDSlVzbXlsVFJ2NUNv?=
 =?utf-8?B?NGJOazUrMGRhRUljVnBjOWFWek52eW1uMGFTcS8xLzE5WFhqUmJWNDdweGdN?=
 =?utf-8?B?VDNlT0gyTWZ5Y1ZBWVRMY05BRnl2dkJJTjJFWWFMSFhLek4weXk0VGk5ZkQ2?=
 =?utf-8?B?TkFNRHBGUEw0SzNxK3hjMXdjWTFER3VTWCs1dVhXakJqQ2NVUFZCa3VFODlC?=
 =?utf-8?B?UTZBWHU4Q0dqTG1pTlhOTkVMb2Y3SXlKUEdWNm5xa0hEUXJtcXh0eXcydU9s?=
 =?utf-8?B?elRaOWcxajhpSERuZHRRWDNtVmIwRndxeW00MkRDVnRzbW44ckhOWWkyK3pC?=
 =?utf-8?B?aW5wMjdHKzZvcGtRMEFhSTNlSzUySTdZby9mQ2Iza1hvM0N1Rkx0Q0hIeHdo?=
 =?utf-8?B?SDdDbWhOSDRPQXNISWE2ZGJWODhpRVg1K29oNHZ0TzZ2U0gxVnVKaDdTUFhP?=
 =?utf-8?B?ZkVsbE5lRTYraFhKRDVLaFVsdVh3RDNRQm1KNmg5bjBUeUpjU1U2cjZ0WURZ?=
 =?utf-8?B?TWVvOWlRSk4vWVUxZUNWTU1rV2diQzhteFkwem5XdDJqZTVQYXYrV2JxQUdQ?=
 =?utf-8?B?MjF5U21MZUFtTGxwSVdFNzdoQXpXVEJmNDZrdnZJTHE1S1k2WXVtZTNVS1hC?=
 =?utf-8?B?eWpYVER1WGFpdEZoWCtHRDFraHNXRFcxaDE4aURvOEw3TUN2R3UzSk9VNDRo?=
 =?utf-8?B?ejBrOGhyU2VqNThDNG1tQjFhMHhlYm9iT3kwdmJES1JoV01FbW1sbDl4dmZo?=
 =?utf-8?B?eG5wUmtPMXZQQkpWYXJpZmh0Qjg4MHlURTZJZFdTSGFPckxuMUhXU1lMWUZj?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d29378d-e3f2-44e8-6631-08dd627bd051
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 22:10:07.4016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol+5y6rH0wqzcg8E8KY5LJ3hWyAAgqgrd6CkLxmHckQekq9GU1jGCvq8Wmj4QuUnEIUxMg5ZCtHZIYsq6QVTKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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



On 3/13/25 11:34, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 69 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 616916985e3f..0ed52666b4e9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>    *  - &DRM_IOCTL_XE_EXEC
>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>    *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>    */
>   
>   /*
> @@ -102,6 +103,7 @@ extern "C" {
>   #define DRM_XE_EXEC			0x09
>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>   #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_PROPERTY		0x0c
>   
>   /* Must be kept compact -- no holes */
>   
> @@ -117,6 +119,7 @@ extern "C" {
>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1189,6 +1192,72 @@ struct drm_xe_vm_bind {
>   	__u64 reserved[2];
>   };
>   
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT		0
> +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT	1
> +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT	2
> +	/** @address_type: Type of address access that resulted in fault */
> +	__u32 address_type;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @fault_level: fault level of the fault */
> +	__u8 fault_level;
> +	/** @engine_class: class of engine fault was reported on */
> +	__u8 engine_class;
> +	/** @engine_instance: instance of engine fault was reported on */
> +	__u8 engine_instance;
> +	/** @pad: MBZ */
> +	__u8 pad[5];
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM ID and a property to query for.  The ioctl will return
> + * the size of the data expected to be returned in @size.  Performing the query
> + * again with memory allocated to @data of size @size will return the requested
> + * data to the allocated memory.
> + *
> + * Some get property requests may be scalar values and require no memory allocation.
> + * In such cases, the first call to this ioctl will not set @size and will return
> + * the requested value to @value instead.
A kernel driver cannot assume user space always plays nicely (two calls 
in the expected order). Instead, the design should be able to deal with 
all possibilities.

I suggest rewording this comment from another angle for two different 
behaviors. Something like "caller passes size with zero, ioctl returns 
actual size of a property only; caller passes a non-zero size, ioctl returns
error if size < prop's size, otherwise the size of prop and fills the 
data in memory"

In this way, the usage doesn't rely on the order of calls from user space.
> + *
> + * The @property can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *

