Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ADDAC7F9C
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 16:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9CD10E214;
	Thu, 29 May 2025 14:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9Gnmzvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542810E211;
 Thu, 29 May 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528618; x=1780064618;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=70YCqmsRNyrAt+OQA5CAIzI2Ts0Z92u2PJXnntp06Gc=;
 b=i9GnmzvdsJ5zvpn7ynLCIuD0lAOgt0HL/LctObMwNLQCvf+Yb8HHwLWY
 7zfI8I5mFyLS8fYVdEQuEb8sx5AkH11/OfKKfhc6NIJ2I6qXE8b5Hz6oA
 54B6CechUyumVLkuDNoNeb49jLSbA9sjkkKw4zwUKXemcZSL1CqNmzMAt
 cyoBl6SS0WZLN24rUeyIr8tLWl3Iaf89pQGSVO6WkN3oMXjzC/C3g6rKt
 /lY3jLHpMOT/YSHvWbWNj5RccXmyW2nKZ+RtO7KFKb0nsTj8qFA17iLhJ
 7BCo/xUi2Du6K5g3ABDUIuPUb+DN3NcNs0wZ4Lu1lVS4MAEo81V8b8aSJ A==;
X-CSE-ConnectionGUID: 61rAeSYpQHGGnSnkWkuX7Q==
X-CSE-MsgGUID: T1ftQ+gsR6irxDLDqQ7L+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50646410"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50646410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:23:38 -0700
X-CSE-ConnectionGUID: Tja1Xt6pSYSues5isdqvgg==
X-CSE-MsgGUID: Ba56Dj3fQNeBIONVomaSvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144211402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:23:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 07:23:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 07:23:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.54)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 07:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feyyca9d/l3E/7qUzGYzkxR5+OMHlDVXtF7UAriFPA6QS6Ifb1ThBEmsEKjsYdwVqpo3U1d8CYoWJ0tMIh6hcc+F76ESOa7dvMNY3KZEUcXWcApCUZTERz6gPAk80u0trDKmEsYsv+tYm0VOnQWwXrZAAZzs0qIwIkamCP3sDplyp09+0puix8B/l9VF8GAJmVsllrCkgoohO7gyB8lTWGzAejFFl8uLiu+CtRJwM5QU0hsGI0+890/BfwiFmhvsQu0B3FqupIH63IIV8SJs816N8vucgLntV5sz5yC7p6Ox/wob+zpcj59cq3YjUSmNJc7FNa/CcA9HianjMmrnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWScvhssWXR2LugNudAJOteu7tRZc5GMN6zVnD/T5N4=;
 b=bELwlaQ8r58jky7azhXUqDpduvqeQxbdwerZIgXO/gBMrQhz3SAVvXc4WZMcCQCFQKDo/IZsZzAbm0J08rJiAJktAwnTqTNCgl71TdeUI7DN1R+z9xR1z86zYQdfygoLJx3pyNQwuUKX4f/Tt6xEZtUV3EKdOlq9RGCaqmup4DZKNQ2PTJ2ZzBLVF4WeDlfH2qM2WNNX00FsTO5+3Z2IDsE/P98V+eCp61l/VY9CsGtb0Ey/Gl1qLB7kcxKrYnUuuIcPrTKkkM2AKf9wYwjcMceiDojij70zAJs140IYb07qzB2cGtsxBDudJEWFndofLjiWDLtzebRHTlh3aX4Xuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 14:23:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 14:23:34 +0000
Date: Thu, 29 May 2025 09:23:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, Philipp Stanner
 <phasta@kernel.org>
Subject: Re: [PATCH] drm/xe: Fix NPD when saving default context
Message-ID: <3e3zy2vvazwweajzivf3qkfi25d42t2ilxdligjgc3et5sm7pz@y2gqgexrk6qn>
References: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
 <aDeFZevB+TRjiMjC@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDeFZevB+TRjiMjC@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf930cf-be67-4c6f-04b0-08dd9ebc6510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Fiy+mkgQi36Xga7xYJF7gzwMUKAvyRsnIaNjcqTfJYgOwzCYFuOsV/snIV?=
 =?iso-8859-1?Q?zL3tSJ7GBXD3PEV4g6Bj7noYFf26tlVYa0p6weF2rt1/0gtqhh7uW2GDOB?=
 =?iso-8859-1?Q?G31Wvo5NcR79oS8+kIHjc+cddjwLeezKu43UX3OraQetKZLJUQvcq3Apee?=
 =?iso-8859-1?Q?Sn9NjRRIE3l6pcm9+aKh5DToIaZTIsui9FfIbfyVNM86KcMUxvgpCLMl9k?=
 =?iso-8859-1?Q?H5r4D8d4PjDCagO7RHEuToIdJI9bF9VjGknB1cmc9K5L8vuefZF2cmIMlM?=
 =?iso-8859-1?Q?tvb8gOjcztK9idBpMw94Q9PluzXCBIugh0+6yjlqLflFyVnVG4Spa6rsrI?=
 =?iso-8859-1?Q?cm5+netKFOwrVqPwMUbQKtkvvl8RQsrDwMeBiKU6QAOH0IAz4GDkt5Ki6R?=
 =?iso-8859-1?Q?tfOkBNvR5oKuVJXf1yazBo6h5dYhyUb1McLY1YB+Jf9zYzYQwytFaXibaG?=
 =?iso-8859-1?Q?ibTNwSpRPQBPkiYZ2cLg4E1vQ+J/C7LqolDmJ8v4dVMbSs0hrSIJDhS4Ok?=
 =?iso-8859-1?Q?M9gpOIsYUpdPWhPKoXbY6btaVZ7tPLt1xkMC6PQzv6hej0CBqGb7omy7Br?=
 =?iso-8859-1?Q?cB2wCox19xgAadvoUagM31YR0zhrQsmgFNSFPk9RFHvb5K3P0xaB+sOziq?=
 =?iso-8859-1?Q?1NfUtr78gztYO/F8uOzSuQGgl9qEChmGCrzHPk3aTFGKMPYJgj/xuMt70e?=
 =?iso-8859-1?Q?jm5Vo3bu/j3G4qg5kN41oLXA/P8ngjlk/LQdL/faIuECssFMnLlZ8OiSjd?=
 =?iso-8859-1?Q?FazK8eN1RzHdqyyp7TUyQRiS0+NqHCdVkHvcuJa2Y+FaHMqtQyUQocQ5wS?=
 =?iso-8859-1?Q?hvwhD4mc0neBlq1oFUOCT2Dp0XikpfWAmZ7B1o0LK1pIT+mRaQMUCg4Lkq?=
 =?iso-8859-1?Q?GBhY2n3F4tS1TQ7dRjMvIFQKWO4wWc091BuiizEvID2qC7paTqaV2s/BBk?=
 =?iso-8859-1?Q?Lne6nhKU/Rsre2aIuP5aBezECZ3b5pbLsEzJH5e+8qg1oHXtXxESaVHLg3?=
 =?iso-8859-1?Q?azS+eLpOzi2ALnLh3oBygbIvy/xzPLbRt5LNPDaNQdmG68F+WHbVx2TpPb?=
 =?iso-8859-1?Q?62fDaCY7OprCXP8i1dtT+ERa2GFXS4kVlDg4zLLFh7womzccLppJPKgFlr?=
 =?iso-8859-1?Q?l//OBixAl4R4jOPKNgUVmDLidci/n+PeBOm8830GjNirzm5STJq7mEdq7C?=
 =?iso-8859-1?Q?mov0FCJjTMVJUsT724TrO/oKX4gkcvVQQSV8kUb5Tfb874bv3EQz5KQijx?=
 =?iso-8859-1?Q?o9ELvXcBbt8qp7Gr51l92goEtZo1TWniD2B/xGKHLk30FhsNTd0AI+m2N3?=
 =?iso-8859-1?Q?NFJa3YsoSC76Bu1/I2Rs6emQyES7bypVYaEuuTNiJOlwUiLFP4nsPp95tY?=
 =?iso-8859-1?Q?RWnfbrLgtoTsHQIHRAlNqsx05JoZbzrn71nTDyqTu85C5x4vKhhFNOen5n?=
 =?iso-8859-1?Q?X32XqpXuLu3suIPiL+xSbuSp4eXjQ6mOGUMjIb5vRm8Da7FfvxwP34kWqJ?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dCs2+kYoxshNUla6S15DaC6b5KvclPZlDHEyQCUOVvom7QRH/qKpPTHdHp?=
 =?iso-8859-1?Q?18Ccy6WVgbVgmhrgI8tPKq0cyb5UlPj7g+6LmtVyGXrqIoYKCG9zyWouO5?=
 =?iso-8859-1?Q?/q/i3mBS8G4ZuL+0gPPrBqaNJZQ3L9UkJsOgzgVBAU/aZ/yj+VIiYfa4GQ?=
 =?iso-8859-1?Q?M+tjVqL0kGTpPExoO2UVmHpO1gLyJt+r+PSeUnEy7AOhE6r4iD3QaMejPR?=
 =?iso-8859-1?Q?zdVfkffaeVMwtCPnXqN/a9d4nkx5zaUJDi+ManIe3btW6mygqxXZh+oeDS?=
 =?iso-8859-1?Q?rwlE6SVk1mXsCb/e570pxKnRszpewMaRIP7bqNW57IMbJLxPa1Z4MuPYnW?=
 =?iso-8859-1?Q?PDrgbDXOL5Z82C3sIXKBnlwo9LaxVbGxzU0m6cJ//kB1PEgrRsBF7dQ2mA?=
 =?iso-8859-1?Q?do+kw4Muo97ISmlOkP1hDTpHOJ9AQkkcz9zTNlPybK16Z9z9kWt//oWFyy?=
 =?iso-8859-1?Q?7GqJ99wQArJqjKRLOEL5mELVhrGE2nCqAv0G5X25XwdJpznihU5ezm5JHn?=
 =?iso-8859-1?Q?QUfHTXeApE7Tzlsxkj0jPYf5obG+/vKpGzImhkZBTGML5k7VXNW0VYv0+F?=
 =?iso-8859-1?Q?U28qjGkTjC98ZShL9KRbRTkuQck8NVIOQDQm/+sx+TxEeIFH6mwKgtzzil?=
 =?iso-8859-1?Q?J26nUid4ZhFLDYIjnnZmNthqZayIUDAmFw0OHfGLwimYfr6Q68MT4NVxyk?=
 =?iso-8859-1?Q?ECdHDIGeeY5yZTyM+FMz4f1PYOKgTYeeUsvdDROzicoah0msRs7Cu7kaxv?=
 =?iso-8859-1?Q?hOjdP57bKm7RRgKk0kblcMm5bGJyOwDOxQV7D7n+yxb7wGVRDiczNRU73Z?=
 =?iso-8859-1?Q?J16VQnKYPXXJvThR1AmmF4hrQSIS0ZFhrL+JMxDVEgm+mDAJBLQdWZlHhu?=
 =?iso-8859-1?Q?zRqj2bcC7Svp0In27sPbXUN5lIT+IVKuWhg0p5Y4RuJq7CthTfLzsUJ8RT?=
 =?iso-8859-1?Q?eLcnvzewrc9bSY4a1zSMEmXcJtLZWgtnQo9VAHsNTTx+bm9N3Cs2pKTLpZ?=
 =?iso-8859-1?Q?OPIqRlUQHUvP76am4yaIT2rzogfd7evxWrpMRRx4cIvQwoLdJdOCJdMng1?=
 =?iso-8859-1?Q?S4ew4YpiAB8kjcLbC9wh9hCemlDXaFTddaNCrs6MQu7giFMFfiUfZCKTTk?=
 =?iso-8859-1?Q?uRVOS9lfPNrcOIQlU3oJzllzLgtimelKYHLcx/JlDC8o6uHXY1E1Ez4mnf?=
 =?iso-8859-1?Q?d80mAICHD2+pj6Z09DLuHykeyIa0Wq71fxtSLHhgA0/tDbZtAJBW//aZ2q?=
 =?iso-8859-1?Q?xuzJqydx6bTATqVSeO1oM1HCitgV2jifct11mTYC/FvZx0tHX8fogw3Dnb?=
 =?iso-8859-1?Q?bjzi/RuF8xuoVMnVx0SvekgxkL5wNcpARWK24UIuPSUfU75LGNFRdMXcfQ?=
 =?iso-8859-1?Q?wS3WzOLlhfc1Y50Q4NeMVCdjlA1MCwn/BzNewNM1YSpqyyWR7pI8JKJaKa?=
 =?iso-8859-1?Q?J3wYVwmo+cNpi0HSpGxQAnzCg8+AuAuzlvujN8J61G6xxmOfnireT0C8Cl?=
 =?iso-8859-1?Q?+EY0KPMtWv7N5M7gWZYcvhl3KFjeXJJyXp5Gz6r2tP1dBnS9ogD+IaXKNT?=
 =?iso-8859-1?Q?CQjTN+yxpIpf+jRVckb3+93s2T/Mv2jbxI0h9DAqlivTHwg75jzDB0aroL?=
 =?iso-8859-1?Q?rC1LHCY31LypJ42dfslb/P8trbx3yJReiiLKDPrZRwUg06DDilYiYkgg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf930cf-be67-4c6f-04b0-08dd9ebc6510
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 14:23:34.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6H5T47mYg+fzJ0vrmItbpbiro/A6pel04auTaNDTIxSpeTVPE+GHAYPOGkY2vSexI5eq9dcQjxw0StySloRcvz8Lh+qgrOKwFtw8ey0PWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

On Wed, May 28, 2025 at 02:51:33PM -0700, Matthew Brost wrote:
>On Wed, May 28, 2025 at 02:42:22PM -0700, Lucas De Marchi wrote:
>> xef is only valid if it's a job from userspace.  For in-kernel jobs it
>> causes a NPD like below:
>>
>>         <4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
>> 	...
>>         <4> [] Call Trace:
>>         <4> []  <TASK>
>>         <4> []  __xe_bb_create_job+0xa2/0x240 [xe]
>>         <4> []  ? find_held_lock+0x31/0x90
>>         <4> []  ? xa_find_after+0x12c/0x250
>>         <4> []  xe_bb_create_job+0x6e/0x380 [xe]
>>         <4> []  ? xa_find_after+0x136/0x250
>>         <4> []  ? __drm_dev_dbg+0x7d/0xb0
>>         <4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]
>>
>> Since drm_file starts with 1 for the unique id, just use 0 for the
>> in-kernel jobs.
>>
>> Fixes: 2956554823ce ("drm/sched: Store the drm client_id in drm_sched_fence")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

thanks, pushed to drm-misc-next.

Lucas De Marchi
