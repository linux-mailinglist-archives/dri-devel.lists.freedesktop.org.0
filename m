Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF5A8379B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 06:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F1010E0D9;
	Thu, 10 Apr 2025 04:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqbkXt6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B9010E0D9;
 Thu, 10 Apr 2025 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744257728; x=1775793728;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xL2CqN6Vy6ThQ2e+euP2K9178znz8m1WTM2hpGLH/DQ=;
 b=ZqbkXt6H4XczYHDksq+VLyZReeElQNd8JOB7xuAM5bW6+UhVntXwOdwv
 yNgEj1e0nl+U4zddySZ0lZAmAC/okJAyeRgOKoa3ERvL2+irhzwkHehBY
 yJCyP4640Mos02VOJudiHw3VK9pQbSc3msY9RJTvlxmgjjLviFM1xEpfi
 zY1dg/jKjyib17NKd+rT8Ejv4RpO1OVfYyhtFXT052IKgoEBPIsK9P/pe
 98oZZ0zANliP3kjS2G6087b8LkEN2TvG0aRhhbqDnd5MqOHTO7kqzrbaJ
 zRmHI6AF7LGAPLnD3BmIFYN1dw3UqDZDW1itTEN1aYa0Ig9AIgo2wkzO3 w==;
X-CSE-ConnectionGUID: kZw+ZOggTYKhJkav2+SaOA==
X-CSE-MsgGUID: 1fGjOSs8R0STVMVeH1qE7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71134548"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="71134548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:02:07 -0700
X-CSE-ConnectionGUID: AL6FSH5SS26ABilP7HNKaA==
X-CSE-MsgGUID: sfdmlF+GSTito43Wzwm9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="165993716"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:02:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 21:02:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 21:02:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 21:02:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwUCKLTFyv3wuhXFV1LsNHMpEmaMbt8uVdLaOj2voJBQbaie0wtK0JOqlHFAu0Ivp4Do3GSxtDqCOMNrdXwl36C14zgkj82z6E7DwynJSYQ0B7rX9zGWYb7vTk7fPK3nnifHiq4bEL3mA14uOyU+Fy7ziF68VyRDqtSjsNUF1ZYqlTLDipfWv4EnRADxzPe+qvVepZpLMoACQcH+iAoaTi13vak9QPQk5bju6xwwZ/+PA+SRAtjCNUpaX/MlZOyi+nvde9+TP/tI9El4azRzEjVkbCxp2MH+PXgpeDuKFkhhqWCh8MPkSpcC6DCzbbq84oAzUhjqWOnBxDLG9aikMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8gx9DzfYggS1Fbsnmq7yYqJgGRA6ZnjHvRH6goZbt8=;
 b=GL8XAe0m3T/hNZseNGSWKYdQw9AhB1TZ4nRRlK0nD3CCCrSQEwuK/UVYUgHb/HQIjqsH04TDEw7n6fOLilVqUkzvhn5gOtbKhx5NYha5S8ns1pAjLMwztLraFQPXT77jKWiwldKyUPKJI/tatZPsvTrXsSbI7KR78fbDmKEe738OJ6Un3WnI22nxx84J26o1ma+fwvjh7eFgA4wzKXNto1DaySiRTGdmVaBRaEX4xZtrBCphVGUkBLs/5vmFd3PuLAN3uz5gIBzEmC0ap8XhFTYYI0yS8thfAwpys34rhnMTe8kvZdKHxm42CB1DXVm55kZHKFgpYsvrDeuxwncCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Thu, 10 Apr
 2025 04:02:04 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 04:02:04 +0000
Message-ID: <ee363784-39b1-4898-a332-b540e8ab9254@intel.com>
Date: Thu, 10 Apr 2025 09:31:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/dp: Add smooth brightness register bit definition
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
 <20250408050138.2382452-2-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250408050138.2382452-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: b3128484-d31d-4b1e-9b62-08dd77e47416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXNBTVdlNEVRcVNYNFJmK2xYQURrRDREUjlzdnc1VlQ2QkVjRDFOMmZDWS9v?=
 =?utf-8?B?TVZNcWNlU0lYdW1QWEZZT0pkRnY1VUtuMitNMTQxRnJCSnNsTWtZTkd1ZFMy?=
 =?utf-8?B?M2hXajZMcDFCOWZQUy9ycTc0VVlXd08rcWxhcTM2T01WemlVOUpiYkt2N0Vk?=
 =?utf-8?B?eDBkZCtOYkZ0WHduaThpc3lERWFKZCtxcGhiTzZ5Tk1uNXgrUktkeE81VWh4?=
 =?utf-8?B?dHV6ZjNubGFTNE4yeVUvSWk3S3BYYXJoR3o4dWR4a1R2YUo2eXNvWitTcmtO?=
 =?utf-8?B?UCt1Y3VUYWU2NitDMktQNDVqQ1k2bVJrenRxVWRoNXJ1TW9FelNhOWt3ekpj?=
 =?utf-8?B?dFNrZlE2NWNUS0p1TFZucGdmalBQTUNtZWFoTTY0MTRLTWd0V3NtaXFNZGdY?=
 =?utf-8?B?SUlmSm5GK3pyaDBvNFFzVnIybG1TWnhyMlprY2MxWmxDTHh3STQvSHBZc1A2?=
 =?utf-8?B?eGYwQWVpeTAxMkd0MnBFWGpqREptSmw1dDR0QWJRZEpGcndBM2t4cTFJVmg4?=
 =?utf-8?B?U3FrdEVEbFNYTnBncmFEKy9GdkNqeklUeG1XRXRuZ2dNdG1NQXZGMVp3SXAy?=
 =?utf-8?B?cWR5VktNNmZFMlpoMW1xZVE0SXA1WlpIeStjeWVNZUtwMHoyemNxU2JBeFQy?=
 =?utf-8?B?aVBqTWp3YXdJczV6Nk1Hb0RPaDBjVGdmemhOZUZDZmlnZG55b1UrMk0rSVNC?=
 =?utf-8?B?YVZ3NTdDaDRFK0l6SkhCT3dLcnJVQm5DUDM2clhyMXFEaTJqWmY2ZDN5Z293?=
 =?utf-8?B?V1dGZ2VQaGw1Y3FGSGRhS2M0ZHRRUVNGZFBKNXJWbkhlNEYvMGxTYU9QV0po?=
 =?utf-8?B?SVNQOC9NR3dON0RyUnRuQWNpZmsyYjI5NVltQ0kzZHpXNTJlRm9sV0JzR29k?=
 =?utf-8?B?TkY4eU83R1NIbEhjNzR6QkVzRS93VzVFVWdNbmZWL0NURVVMQmhjWC9Hb1NF?=
 =?utf-8?B?Mk14R1Q0ZlZZMFZISW8wVmdiTG1NU1ltZEJkdWVDd05XL2J2THRLMUFtU3Jz?=
 =?utf-8?B?aHllcUdOaU1iZGlGY3JoT0k2bGw1bjhFOUxka2tzRmp6Z2hzK0RTZXUrT2pP?=
 =?utf-8?B?VlpJSXFxRGhNSFYvWG9lSjBka2Y3Ym9ucFM1OU90b3ROMG9LendKVUg1dURF?=
 =?utf-8?B?OUZiUGlaMWVkZWEwVVhQRmI5OEtSOGc3K1prMVluVHNpZ3hnU2oxZzM0S2J4?=
 =?utf-8?B?RU1kQnpNREZzeVZ5NVF0OGZSY3UzM2cySWlqK1J5Vlg4Z1BlamQzUzFrczg1?=
 =?utf-8?B?Qk5STWxISm0vWDZiMDdNZkpEUTFqdFFxVDBGNjF1dmhPRGNpUStXa0Zveml2?=
 =?utf-8?B?ZlNSakNMeStPNGNDcFcyQy94NnR6cVpMSnRUeDE3ZDJBOGU0RjJNSE1ZQXls?=
 =?utf-8?B?OGpkaGNBajI5TjAyQ1NUaElqZnovVTlsOWhvYkhvSUxjazJaNGJGZHV3N2FT?=
 =?utf-8?B?alFlWm9QWEYycUFLSnlhb0xJWXVKeVM2dWFmK1QvenRBS2JZOVBTU2JKeWcy?=
 =?utf-8?B?Q0M2REJsQ3FzaitjNEd6QktmL04rT2tKM0g1cjFpaXNjbUhYOEUvNHV2aGpq?=
 =?utf-8?B?WG8rZlUrZVlHalhXY2w0dWxyQW50bnFyUllFZ0Z3NXZ0V01EVXVlVktIbnFB?=
 =?utf-8?B?a0wvYWc0eC9UckpmZW52UURMK00wUTlIVFdyTmUrUnJhcC9JSDk0eGROSHho?=
 =?utf-8?B?UFdJWlRkWUprSU5veTVpRVJEeXZxSFl5cENxK2NUblNUbnNyR3lZY2tsN1E2?=
 =?utf-8?B?Nm54YmhwMmtFM3ZkT3g1R2ZmRkJHV2hJcVUxaEtEQUJIV3ZOdWJSdTBUbENx?=
 =?utf-8?B?N0UxUThmUCt4aVg0QVZGUTI2WFRScjNXbVBSUlF6MmlHSkhnUkxka3FsenE5?=
 =?utf-8?Q?egETfMjwcxgCf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxIYTNncmtVdWx6YmlKdEJ1a3h3WmdodlNUSWdFcllWbldUbTdxL1hCQzdu?=
 =?utf-8?B?L3I3dDV6aFVrT3lQUnVoMVJJcm1DQzFGM2RjRGh1UGhyZ1hKbnRxcENOTmlS?=
 =?utf-8?B?a0NuQk1sejhQMW9ZbG9rcVI2ejVxYlRNWkxmNWdUc1kyK1NzZEZzM2QvdThD?=
 =?utf-8?B?d3ZBdmF6ZVFBbHE1R2N5VEROZUs4Q1NDNWRUNE9NdFpsK2pOL05LK2tpNW96?=
 =?utf-8?B?Q01HN0w2S0JvM0h2aW5XL0graC9LbWJaYWVoc2VMNHZkamxuNWRBWmNTTDkw?=
 =?utf-8?B?M1JSNkVndDFyM1IrdE1BQVM2aTlPWkdFN2VheG5SVXo2SlZ0eDN4Yy94dzJO?=
 =?utf-8?B?eTRtUFZnMS9XczVZYlVoNnVxdEdJdUxmRWlmRmUwOUxIdGF6MVhMNFpzcGp0?=
 =?utf-8?B?dERqd2YxVmg1MjZQMDlHRHFaNm9NLzNQbWphektoSU1XZzBuaGtrcUQrMUtz?=
 =?utf-8?B?NlRGcE9MTGN6YmQvZ0x5WHRTcEV4ZDBQYXRTdStocnBNQW9LUGFuWjhVOGNP?=
 =?utf-8?B?Rm9Oa09XS2VSTGpaZGMrcFlXTmw2b1RlSjcxWEZkM2R3dnk4U29xUXMrQlRk?=
 =?utf-8?B?WGZoZXQ4Z2ZiNmM2RittRG8ybCtGVCtZSkQyU3FxbCs2bHNldVl3V3g2eWp4?=
 =?utf-8?B?eUlsWXprK25QUGM3V1RaTllzeUh2WkQvYnNZT0gwT1d2ZmRFN1NyT2czT0Jm?=
 =?utf-8?B?dWlURW1xMXAvQ05Jd2kvenRuSnAzVkU4N014dUZyRkpSWnNPSTAybHdvWXhY?=
 =?utf-8?B?Z1ZzaEFUbzd0Z2FTVWlHalVBbm9WeERDUStFbGlDUVB4UlBQMGtaRlJwaGxG?=
 =?utf-8?B?QkdFNGQvcU04WHI3dlV6S0tGeWw2eDk4UHlMb2xuWldnd1YvWHpHYUR6M2dZ?=
 =?utf-8?B?aGZyS1RCMXRuYVFCazlYN2hXaE1OeWpzNkhpMzNVUjREYnNLVVBpN0tac1Ez?=
 =?utf-8?B?M0tEUVF5MkdmaHI2cVByZ011THNkVzlVOVE4VlVhS2djTkltbmV6NnBWZlVv?=
 =?utf-8?B?Z3lsTW9COEhMSi9JbGIyWGdXdDhPOEJvamhCdFVFclZsYXlkRWY2TWZjZEly?=
 =?utf-8?B?U3RPbnNsZUdZOHRyamJwSC9nZWFia3psdzRIUTdlK3ZBS3l4bjBMYWFLeHAz?=
 =?utf-8?B?NFcvcnRUVzlsUTBMc1o3bkI0TEE0cXRGbm1RZCtzRGM2UEpQN3BUYldrQkdh?=
 =?utf-8?B?Si9DUzloWWpzcStndCttVklKYWljR3hzZHRwQkp5Q1F2STRYWmdUTU53R3M0?=
 =?utf-8?B?MWNoT01yZnE4Qklkanc2bXFpOTlwNkV3UGRma1lqNXJLeVRvZWhkaThqTVBY?=
 =?utf-8?B?Smo0eFBkZG9XSmt3YWZTUWtYNmN6Y2dYSnBkcjc5cld0YlFVQ3BDRUZyTzFG?=
 =?utf-8?B?dDFTOHBIc1NNUktYdXlldWZNdmp2NHZGUm4vUCsramFLNWc4ZlhyR1YrRGRY?=
 =?utf-8?B?U3pUNzFtUTh1ZVN1WVNmRTk0VFNkWmlIMkZUeHozM09wK2w1RXVwVmpQYVRG?=
 =?utf-8?B?UUpjcXd3bWd4c3dFU08yM2hmdzhJLzEvTTNGd3dJZWpHTTczUVhJZUJ4WHJE?=
 =?utf-8?B?SXlFSnpYWStIYWMvYVVSRnlhN1BpdDBhZDZIcXo5aUlBVTUwdmwvUEUrMkp2?=
 =?utf-8?B?ZFQzNGtXTGtGNUFOU0hXME9jcjQrQkJtRVNITlRwOWJMS2RRTzR6OGtrcUtH?=
 =?utf-8?B?SE9qUlRjNUZNR2NkRyttcGh1TUxGY0UvMUZTcWdiVnNOa2tCQmJJdG05TjZI?=
 =?utf-8?B?Y3RETUg4cWJGdjlJOFUzWDlkNGo5OEkrL3h3SjBPTnlQNStEemxyRDd3VnBp?=
 =?utf-8?B?czIxMGIvNUI3QWE5b1BkZXNuR3NQOWJDZkhuZ29HdjFxSHY5cWg4U3c5RnZn?=
 =?utf-8?B?ZXZIKzdqR0ROZ0RzT0duWERKbm80dkd2RlN2WFp5Y0RsbVFuNjR1YlFpNVVG?=
 =?utf-8?B?Y3BsWmRTWmtSTzNpRS9yOFYrbE9rcmlVZ0ZaWnlPcFU3U283ZDlRUXAvQVRD?=
 =?utf-8?B?NzdqTkZMNFFiUGwvbVo1OFdDSFdSaVZocGtDMU1ZT1I3OXEraGhYOTdFWC9J?=
 =?utf-8?B?QXg1VzJXT3c0bW5zVHlwNWJkYXVmdVlacDVBRWdHeStSVEpSMnFSUGk2cFNS?=
 =?utf-8?Q?QqqNGMLDhCh75KCB44zgNj2hz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3128484-d31d-4b1e-9b62-08dd77e47416
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:02:04.5244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biQRgX41fWhHqKYxgScRVDvqHRWM8So3XRKiGXCoVSmWCd0RX8g67y0F+X5bBlX4DnicCcGG/lcKW4VbSjAyPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

On 08-04-2025 10:31, Suraj Kandpal wrote:
> Add DP_EDP_SMOOTH_BRIGHTNESS register bit definition for
> EDP_GENERAL_CAPABILITY 2 register.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>   include/drm/display/drm_dp.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index c413ef68f9a3..ecf8b8d7b1f5 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1025,6 +1025,7 @@
>   #define DP_EDP_GENERAL_CAP_2		    0x703
>   # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
>   # define DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE		(1 << 4)
> +# define DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE		(1 << 6)
>   
>   #define DP_EDP_GENERAL_CAP_3		    0x704    /* eDP 1.4 */
>   # define DP_EDP_X_REGION_CAP_MASK			(0xf << 0)
