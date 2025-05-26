Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04248AC40AB
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502B10E2EE;
	Mon, 26 May 2025 13:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0KW+XaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA010E2EE;
 Mon, 26 May 2025 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748267319; x=1779803319;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oon+fxr35yl7h0lwofb9xwgamJA1I9P14XWhLidz8dQ=;
 b=I0KW+XaBE+XxKHJkIsXvmKlFGbsH1Ve+f40u4JZzJ9utReQtCTRExpFu
 ITj5eBFeUGdVhTWBNbVdYoPu07whQCklCmH3GnUc/ogNBJ3Hu2NkA3QTD
 QyfgYwRzpihf/DenF5jInOEFkC8jEBr80+z8Divra5wFo0s8rgcZqOuUw
 P6AMkMPj204zEA5ZW6NBgs3wlLJG73PMKfRPpke4eepgLsR11gc0j9Nv3
 ucdsMC+6dXsiJb42FmZmXNRNm3QccGhc1b5lJwhV0sYhXK6BbSFFxvS+A
 +B6jq+/F76EZW9T71HXkgh7fWvzaBmqgHYVyMYsXYcOCmHPm5K5HOOgUI w==;
X-CSE-ConnectionGUID: GstksyZCQ9ScXB050rSSpA==
X-CSE-MsgGUID: 0kAPjTndQmq9cChDRwl0bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50128734"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="50128734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 06:48:38 -0700
X-CSE-ConnectionGUID: 7yvTfMimSxmIolgzqIBC0w==
X-CSE-MsgGUID: fmXkN95vSQeXeO8XaVUANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="173278977"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 06:48:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 06:48:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 06:48:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 06:48:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeaTkrqa1NaPJ1/h8F83OZ3LN6JLAm8IC4ayjPQmoNgXpd+9PmigZNASHpLilGvdscLgIZ6zvdN4GM8TSCrvFtCCcLYxpsBz2ONf6v3FCvUoyGhwe1u0nL4YkFtoOSdteWc4a7ZQ4FLtl4rgtMkpvZkHwuN0mouxkdc6mCFl5ZFKr32iPgISIt2F/6mqbjtVPJYuQ8QNjLtXjDGrB1lBM5cEmwuXrqPkvq9SQdCXSLtKTnLG1haRT3TF+VBZ5Wda//S1l+BmuIBD8Gyobp1PrndX8uPaBFU1hDSgj8WNHl/DoWCbY4Mnp3sN9gHB9E/WUlGQG4BedYcQbzSFud7JDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxdsIWeV5H9v9bZCzXmx+1l2g/G/VW7d0GG2+uO3C8U=;
 b=oJ5Nj4PN5uQnqQtcJXvXglBS4cQ+trB1PF9aXcz1o4cph9WBO8iYMPzJJkWlSGzaegNh4pgpTCmJIUEyNDlRE6WDic9/PJskHW5kAXJuIen6qnLT2X07LpiSbZ2jxUkOin7bnoYgsnGP5BMFJ5d+/rmdf/N+8MIPOWly8DH0qUUx93qoYgQ/j2sJUKkzmxwGivPT9dUw45+1lkChFR7VXnHanUKe31lavlLuXxWk4EZZt0c7FS57iNUMXt3aR0a94PhLgQRTE4Wbsa/iuN/VYCSqqHbKE4GM9PSbW/LCXRzCmTjQR8sJlcfz02Qgllm31V3ZfjhGRLKUoeUo8R4WHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 13:48:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 13:48:21 +0000
Message-ID: <1d5600c3-815b-4947-ad99-833a2733356e@intel.com>
Date: Mon, 26 May 2025 19:18:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
 <20250407123018.77f7aa94@collabora.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250407123018.77f7aa94@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c046d5-2d8b-4294-3291-08dd9c5bfa0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RklJc2hMUzZIWXlRalBkWk90YnV0K3pxZElDczRKMGtHN1JSbGNwcDE2Witz?=
 =?utf-8?B?aHgwUkovQWR4WGlRY25NTTJ4c2lmdFRFSDAyM3hOZThscVZIZWJzTWxiZFpU?=
 =?utf-8?B?bkQyczk1SmdUZ0dkMHJpNG1leVZjanNpSFdiM2Rzam5qeURQRHQxUHNZVlU4?=
 =?utf-8?B?T1NPbkhsU3VBZ3lUQk5DS1pzSTAzMVFWTlA5dXk5N1N6UDRURjZOQXNQZXFR?=
 =?utf-8?B?OWsyYXFlZ1M4dHhPYXFkbVhYN3NucDRvRE8wQ2NSQmgvaDBoZnFITGIwMU5H?=
 =?utf-8?B?R0Q2QmdKSi8rUzE3S0JiMS95QjRQMHdGYi9PcGRhMHN4OVJ1cjZrWWNkTk9v?=
 =?utf-8?B?THBWMUh6VTd4MS9GdzBMRkxGNlloUmVhazduTm85cmdMdUJpbUVZUWdKWFVw?=
 =?utf-8?B?NUVlSFQreUEvSm1oRlRaNlNIYVN2V3dTUUN5RGxXK0VlcU1oUVFJbGw1M0sr?=
 =?utf-8?B?dm8zdEsvRkx4RUVEMkg5elJFMEVPTTkyNlpnWnVBZWNrdU04cjF6b3p1blN0?=
 =?utf-8?B?TmgxOUR1ZnZFYTlyNE1XdG5MU1dhVWhGMVczdEdDWFY0aTQxL1hpb2w1dmp3?=
 =?utf-8?B?c2hXVlVGUkFhb3dvY0VsTFowTFVtclpXSnRpb2Vhdy9zbldKSUVhS0l2RFYy?=
 =?utf-8?B?SzhWdG9udDd2cEttVzBZUU9YNlNNR2syRWxLb3d2VlRtZG1oanZFMHkyRUM1?=
 =?utf-8?B?bEFNZ1FCblhXVXlTbnJMdmJOUSswejFjM2ZtaTRPbGh5a2Fha3U2UGtEUW9i?=
 =?utf-8?B?dUJPaGFQeUlEclRxK1ZMdmlwVDEyRk5uY3l6alNyYzRXcHExU3hOT3ZGZ0th?=
 =?utf-8?B?Umx4cTk1Zm1relpjYTRNUzN6V3A2dStmOVRVeGtOT0dmY25EcUNKSjVkc3Qv?=
 =?utf-8?B?WEU3QzB3TjA0SXBRSU5RQnVMNC9pM1hhamZRN2pQbGMxQVpYU0VNMUxFSFFz?=
 =?utf-8?B?b2pUbEdPTGJ0RW5IcFVad0hzNm54QUVhNE9pWEJrVlJsMkkwSk0zYm9vYS9x?=
 =?utf-8?B?aWR4TlZlUm94aG0vSE43S0huZzdyZUs5b1gyZnBzZWtUZ0VrbmVpUTA3bWo2?=
 =?utf-8?B?ejBtMFAxZm41dVJsWkpDU3hlNWV2QmZNRVI2ZVRJZ2daMlVLQkxoNktSV3BI?=
 =?utf-8?B?SkVTQWJQY3FYSW5NU2xTeTkxMUJVVHg3dHE5UkNoTERUZkZqaFBJU2diNnpN?=
 =?utf-8?B?OS9mMlRJVUExcTlaVmJJZnZSRUlMSUxNNHMySDFFYW4vLzY1dTlmak8wVER1?=
 =?utf-8?B?cGlGLy85VkZrNk9EbkdJVktGN2JMWnlkdGlyb3o3d1EwTjFMMUVWand4dnlJ?=
 =?utf-8?B?ZzdzYWJndWtxT3d1ZmJSMmJBbmlRZ1crNEM1Z3ZkUTUxVno5YVIrV09FVDE2?=
 =?utf-8?B?RGtSMEs0UVdjWWg1eDVlb1RjUmx0OHFxRENTbjJEaEZ5RkwwR0pqY2ZGR3NW?=
 =?utf-8?B?a3VKN2ROakFuK3RTMVROblc1d3NaYlNERmNQK2ZRRElRSUJLQkdnZjJDaXJS?=
 =?utf-8?B?QzRobTlWVHRNcy9WdkV3aVY0UzBiSXFKYllWZWZuQjRrcG5ETHVvT1RoTVdV?=
 =?utf-8?B?dlZSR2hqZmZkYWxBRklpMURhN0UxT0thZFh6NlZIanU4QndwY25UZE1neDNi?=
 =?utf-8?B?WGhBdVVaSjU5VXZLRUNXdHloWHZqYyszd1BTMXAvZFlnU1dvNnRUNlhiQmo1?=
 =?utf-8?B?NXdKdmk5YWdxWnc0Z2pseS9KbUJERFM1VmNQbE90QVJaK2JKZXV1ZzBxbmV6?=
 =?utf-8?B?N3NXemdqc3gyZGxLL2d4Q2hNak1TWHZzTUxTRThQbFJ5RXZ6SlBIeFEwUVc0?=
 =?utf-8?B?VHJiT3ozQ1VRMjV1N2dFNFJKbzM0ckJrMHY4U3QxQk9Kc2lnZVJVelQzc1da?=
 =?utf-8?Q?OeqZCB9WutNat?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cndOQ0tvU3R2N2pQQzdLTTNtMTd1Tyt4M2dTVDd0WDRnS0hsaEhkcGk3WGto?=
 =?utf-8?B?MTd5TmlhTVhlL3hma3JFZUdhTGg5Rll2NHZvM2kxczhWbVNrT21rNnNnbmRT?=
 =?utf-8?B?R2FXMFdsbjRMSEhSSzhodzZnY252M01MSkd4UmZ1TVppdW93MXB4bU5WZ2lY?=
 =?utf-8?B?dUFRUm0zdHdYSDVNK0dBdVo3TVdSOFI2c1RMRk82bXhBRlNINTEwZVZsenpx?=
 =?utf-8?B?elBFYTcvY05KekxaT3Q5THJRNkNrNkRldVJaUXBRKzVjS25idldST3JpQTBS?=
 =?utf-8?B?Wk12VXllQXliMXJhSldnUE5NQXVZcFlvbE1DZDk3WlA2S1lYRlpKRThYTW0v?=
 =?utf-8?B?VVlaYmRCMFhSRTJKaGUvTHhyVzExRXphQjltWmNreTlobjJkVERwOUYzS1VO?=
 =?utf-8?B?d1BOOTJRNGJQUDI0VWJJb2lLd2wyRE96emN6Q3JKQXdvTFFrNjNDUWFXNXpk?=
 =?utf-8?B?L05DakxXK2ROSlhXaVhrN2dNNGFac3l4aFkxenJjTXh3QW1PZ0FnRnRNbnVR?=
 =?utf-8?B?Rll4ajlvNVJ3MDBYMFFKZE15N3dmRzFQbHF0YTBDZFMvS2hOK3BaN1hSUkVr?=
 =?utf-8?B?RkwyUXBKZGdGck9wTXpIVGFtYU81K3lpZWY3OVhRcnhTQUR1dUw2YUZHZk5O?=
 =?utf-8?B?YUtKVzEzYndjS3hWeGVNaTNTU0tTRGs2K2xMOWRNUktKWFF0QTNLZlhJc1VY?=
 =?utf-8?B?cGpaM2VndFpUNWlxcFhwNzlMalVxTVN5b24rcjQ1NUExY25CL2hUeVhCKzRW?=
 =?utf-8?B?VnNlcy9jbHpOMmFVS042bm8vbTlycDhLbjNFRjRub0h3aVFtUlZJQ1hmR3dG?=
 =?utf-8?B?amY0YzlrakNsRXhXRFlEazhWaVdDQ2ovRHU4OUtzdWsrZ1JYc3BZamNiby9V?=
 =?utf-8?B?WlpXbGFBdXNkNC85VzlFYmIyeHpZc3B3VE4zZi9FZUFTUVJOK3ZWVy9DdllF?=
 =?utf-8?B?MnB0UGZpNEtBaGJHQVRHQXEyQk03a2ZvT0psUFEwUVZ3QVlETFE5b3JYaTg3?=
 =?utf-8?B?WVpEaTBEdHNlSDZyTGdyTXRocmlwMlJuTGYyLzk0OE1rOHEvaGdKUW5DaEJ4?=
 =?utf-8?B?QkZray9tRlJTcjZFQ1RlVkg3UTUwY2VxVnVWUGYwaTBnSDFFTFRmQ0lWS2xB?=
 =?utf-8?B?d0lrTC9KQ09EWFM2cCtrTk8xWFNNVnRteUh1WW9JYnBrYTU5UzV2cXZSMk1p?=
 =?utf-8?B?WEljZ2x2aDYwL3l4K3Qzb0UwRXBmSk5MUUFtbnlsWVZmWFNGblhpOEFaV2da?=
 =?utf-8?B?dG1UUHlzMStNMXVqNVN4YndQRW9FSFNBd2hqVnEwdmx5ZGFXblFFMFZZdi9K?=
 =?utf-8?B?K0tiMlZmaEhnQVBuRVFjWitMazZwQ3l6RW9mVGZpVVdaZGgwdm92QXNFNHdV?=
 =?utf-8?B?Q0lnR0R5VkdITWZEYzY5S3JZSVNubW9uc1ZuRGZMOVJiN3QxcFNlRFc2bjNJ?=
 =?utf-8?B?SFYyakdkUi81WjJaSm1Sd2wyak5lNnFWNmxKSk93Mjc1Nys0NHpSWlBwVTFY?=
 =?utf-8?B?VmY3cldjOUszZEFBTW9qUFJBZWt5dWRpNEFnUUpmclg4a0NoU1hPb0owT3NS?=
 =?utf-8?B?UXFLZCszVHhFNEZnRTBpeWlta01rYmw1MTlQRFBCalFURnlNc3lyUVFPMXZM?=
 =?utf-8?B?akEwTmoycXYrMmlZc09oN2h2VWtla2lzdDNncFFmSjNLcWVjOHlrKzREdzA5?=
 =?utf-8?B?dmFuemwrLzlaNCtkcG5mUHY4eC9SNTAwRUNjaW5JWWZETFI4TUdOeTExdG4v?=
 =?utf-8?B?OWc3Y280M1ZsWGFrcnYvNzhWVzhpQ1NEdldQejNQTlptZHZrTS9telFJSW45?=
 =?utf-8?B?SU91ZGlvMnk4Q2pNbXI1dlc3M3I0ZC94NStURllZaHZrNFdHQ2RPcldmcVdM?=
 =?utf-8?B?OHk0U2V2azhNR2p2NnBKZWNvMkptNmVSc1EvK0RlWU04WUdmWmJMS2dIcSsy?=
 =?utf-8?B?bVN2aWZUQ2xoUmxvVGJGdGdtUnFhdFFud3U3TEp0WTZ0dUkvZTUzOWZRWTlv?=
 =?utf-8?B?bFBXV0g2M2pUVTdBYzkzNzlvaTZObGUyZ3FOUnNjdVNtZjJxV0FzUWFuSGQv?=
 =?utf-8?B?QStoU1pEd002T05QV1FzRHFibVV1VEJ4WXdZZzB4RnJVaUZWbVQwMWt0MUtP?=
 =?utf-8?B?WTl0Skx2cEdJa2xKU1B4MnNVa3B0Y29MZVFQNHUxNUlNZTJRYTdVK0xjaWEx?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c046d5-2d8b-4294-3291-08dd9c5bfa0e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 13:48:21.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1TRmJ3GA7l3nA7dHoh2vWUis79fyD1DPny3FsXBj+diCae3iAwus4P0Sxr39rvZUFm8kDgvmOeRBm3EGrzh7234Yuza24NWg7j+RhOK6E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
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



On 07-04-2025 16:00, Boris Brezillon wrote:
> On Mon,  7 Apr 2025 15:47:03 +0530
> Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> 
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
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>
>> ---
>> RFC Link:
>> https://lore.kernel.org/intel-xe/20250314080226.2059819-1-himal.prasad.ghimiray@intel.com/T/#mb706bd1c55232110e42dc7d5c05de61946982472
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c             |  1 +
>>   include/drm/drm_gpuvm.h                | 25 ++++++-
>>   4 files changed, 98 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index f9eb56f24bef..9d09d177b9fa 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -2102,10 +2102,13 @@ static int
>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>>   		   u64 req_addr, u64 req_range,
>> +		   enum drm_gpuvm_sm_map_ops_flags flags,
>>   		   struct drm_gem_object *req_obj, u64 req_offset)
> 
> Not exactly related to this series, but I've been playing with Lina's
> series[1] which is hooking up flag propagation from _map() calls to
> drm_gpuva, and I think we should pass all map args through a struct so
> we don't have to change all call-sites anytime we add one a new optional
> argument. Here's a patch [2] doing that.

Thanks Boris, for sharing the info. I went through the patches and they 
look to be providing solid direction to make interface extensible and 
future proof.

> 
> [1]https://lore.kernel.org/lkml/4a431b98-cccc-495e-b72e-02362828c96b@asahilina.net/T/
> [2]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/0587c15b9b81ccae1e37ad0a5d524754d8455558

