Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61BA1D598
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 12:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A4C10E3A7;
	Mon, 27 Jan 2025 11:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRSt+d+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9DE10E301;
 Mon, 27 Jan 2025 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737978415; x=1769514415;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=P4IbZKEwvS9U7usecCH0G7WCMMVS8u0l+jivh8tayks=;
 b=cRSt+d+BztJDVlWYv0A23tUOcuDBwP/zeXS5eDxy+M18N/5Lqya7OFAJ
 RUTsQ1565lzZ5lraBeCMoAip/PJo7V7kkmhkmuFlZ0z8PLbG7TDS5wF0P
 j+TKSqoJw6zEUZA8PFWjj/rHLqwCLT3xkiK5I3mnYhSO5K+Vi1dvoZiPp
 Rz3LE+rI7yyeMP3qrCo56OaYjNch6UuyGqCnL0OG5PKnMCJun3R8sIvNY
 C7ZDncsVU01cLE/gnJYf4g4pJCxMiIOOMoHvN4cWazv6GFIitJIuUl+Cg
 d0CIGFxHUznI8XvjFBd3hpDVTmRwpyOZ0pgmpGxUcAZigG/At7D9Eu0Fe w==;
X-CSE-ConnectionGUID: wI5d5ZToRMitkA2epYiYcA==
X-CSE-MsgGUID: dIZMCeD4RVWhKFe6vHdOVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63790475"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="63790475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:46:55 -0800
X-CSE-ConnectionGUID: aa2z+BeBQdS1LOAYNgnF0A==
X-CSE-MsgGUID: 0JHocvGlT7a4tXe2faby6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113558218"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 03:46:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 03:46:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 03:46:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 03:46:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7gb2RTen7jl6eNQEOGkBXxbvn3mAdWZsc/nScU5kOejLzHFoTON7MPXISQNlKBzrV8jcksAZ/AT17oZxFiFIEnStGbHoPnnXwp0bW7Tuc65wotJM7+1QV4LdGgdtDxjQzrjQJjRHKKeryfc323Iln6pHVyEaZ4LQEXFbH+OslUZbTFzswkwxGhtYd0zGAKjyOuGH6J/dFPM9xSH+rkbiX8XLHImFX4mhoej+BH2RS66ZtPQd/el8iD1pjevMn3Q+tvv4VL/JCZ2aG9UX3WlBEhkGY4NNWmdNhmcuX/SmWFdibChvdxRezyvkU0thY+m2htsMnHGrvJHh4K9lU8kcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX/1QWQ1Rfxqiw0tutgxBaM2apigeeZ6ps54wGOydPY=;
 b=IFpPkILjEfiBd95+x3ZdrVZho/9yAOP+E9vbrwrrwAu3nNVcL/YFDBGf/6SIEd/s185CGomwthpGJg0utbYbjWyXnSBci3Co6dzEF8yTJezYQJ/5DssuExSk3cHJ+wnmwX90qzVdwMrhiuDubuAws2JUDLTVGwSMMcR6YVgsZSE1MeyRYafWb/q1vykzWfIQGlrBIglzB6lfsJEvabGwnOc4uMAQ4+SxfIm39xTcCK9ohFcHPuyeVtWobBrbk2R13xtPwwe5sL4q+0QKf6IwmkLXj+97XrGjs4I9TVUGsl1+lwLN2AhYiqjmhit3z6WAFhn/YwJERYjXW+0owpRsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB5887.namprd11.prod.outlook.com (2603:10b6:510:136::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Mon, 27 Jan
 2025 11:46:10 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 11:46:10 +0000
Date: Mon, 27 Jan 2025 11:46:01 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/i915/selftests: avoid using uninitialized context
Message-ID: <57xcbkebno22cops66u2uknknrhalp52jqmswj3daihkpwrd3h@h77t4o7kgkki>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: VI1PR02CA0059.eurprd02.prod.outlook.com
 (2603:10a6:802:14::30) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c08fa6-4d0d-4a01-f371-08dd3ec83174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm5RbXFObGpNQTlWeFZDWWI2VGNuNXUxV0J6d1pzOTlwdzR1dDByNWkvSjRH?=
 =?utf-8?B?alBDc1AyWHkya2YzUGtrbHRBd2lYa3NSaGpnL2FENEthY3lWT2piSnovRlFh?=
 =?utf-8?B?L25Zd1dJb1N5dzc1SUxwaEFrak1KbTN1ZDJZVmdYSHU2ZjZyUkhNR083cXl4?=
 =?utf-8?B?dExBN1ltVnV4aTlLZWhvNDk0clZYYW9mbW5HMlBmQTdGYkt0Y2J2R0diOXZu?=
 =?utf-8?B?aDBnVFhrbldneVp0QUw1SkFJYzlyd09LUVdjVWZoMlpzK0RBcFNFUDZUdmNB?=
 =?utf-8?B?WjFIU2R6Z0hHZVRMVnczQThJYVVUL0VVMER5V2dtclNKMXBOK3c3N1l3VnU3?=
 =?utf-8?B?a3VqRVVZOU9PaXcwMFBWdmhwY2lwNjJrcm16S2l6ZE9lSXJFcTdKWGNzQi9h?=
 =?utf-8?B?YnB2N05rUFo0QkdqUzd6VHJ5UEF6R0tDcVZQVURqSXllSVhlTzZ4bFQ0UFYx?=
 =?utf-8?B?RXZsQ0NzYzc1MkxRYVlISmxJNTFDQ0djYTdpM0hnU2xwS3g2K2JIY3FrS2xC?=
 =?utf-8?B?STU2UU01TzBWTTF5bmV1RUxzWnJ3OTkvTFl4WGY3TDlPTEk1YzR0ZXFlSGlE?=
 =?utf-8?B?LzhHWUhmdE94SDl0UXBxQk1iUytxTUgvY2dURFZiTkFCNmorS0RMN1hjOGtP?=
 =?utf-8?B?VlFNOTlYaFBwUzVHMWJwYlAyM0NnVUdjNU9UUlkycHFKVWhjamwzSEQzektv?=
 =?utf-8?B?SVBkaHc2bmQwTHlPb3lqcjREL24rblpZTld3ZGNFcVprQ1RxczN0bGtDSGVV?=
 =?utf-8?B?Yk5xL0hTdktHc0QrSmhBakJKS3FYZUtiVUpGOHArTTlsRVhoOE45T3BLTDhI?=
 =?utf-8?B?THpRU3kxRkRjZUFtRHVCMEtRS3JoQ0RWazJXVEtjNThrUXVtZWdwY0NKR3Na?=
 =?utf-8?B?MkpTZzZmWUR5bDFQNkNnVzR3bVRuNlRPRnZIdzJjOHM2anNQTWxUMW1wZFFo?=
 =?utf-8?B?cFVCVEI2b1d1ajd1dnFobjF0aTdXa2lFcDAyV2xnT0IyY1JPQzYrRW9wbStO?=
 =?utf-8?B?b29RdU84UjU0TndueGRURkZiclgrRFpWa05XeW82SzJMcDBZZFNQSFo2ODNO?=
 =?utf-8?B?eDR5UDJ5M2lUTFZjQnlMdFlmRW5xaTY4Y3paektGTllTNUE0L2l2VXVnWEZ2?=
 =?utf-8?B?TGw1SzcyMlFzMzBOeVV1YmFEeUN5Vi91aHpjMC8xVG1xaktBaEZKbGVlRFFW?=
 =?utf-8?B?YSs2R01XYmFwQUhIeHZ2azkvTFZYS3Fydk1iTFp2TTlXR2tEdHdma0NWaFNY?=
 =?utf-8?B?ZUJVeUFKZXJVaU95cDRQamhoYlZWS2NrZ3VYVWhqUHh4TWFjT2VXeDlqaUo1?=
 =?utf-8?B?VW1GUHpwcXY2Z0xORzBvRGhpdllrbHErWEhNSFdKUEliZ0p3SkpIZ21zWkJP?=
 =?utf-8?B?U0lJZkl4Q1lyUm54SlhtZ1lxVEttNStLNkRwV1huWGoxS2EweTNvd3k2RGpZ?=
 =?utf-8?B?R2xpVEVHVW1nZnN1bHJGZFRhcXdObDQwaFlvdDljVXl4NTBUUU4rNUgvYlU4?=
 =?utf-8?B?Z1hIK1lDZi96VVMvWVFBWmNvQnVQUG5IZzBTZnhERDVacmRkakZxR1M1RUdz?=
 =?utf-8?B?Rjh0bnRxV1ZWSE8zcWpNRTJLSXFGbUgycVhZMTNTRmJwdkZPVEhTb1lUWVJ2?=
 =?utf-8?B?WngwWEMvVTZqaEtvaUhpR21aOGVIS2VkaWF1WTM2TURNZzA4R3Y0Y3M0Mm9a?=
 =?utf-8?B?OU5IZ0hydGRjc1V5UlB6WVZtSlB6cHZac3g0cFpXbjNpaEg4K0FBNGd1Q1Uy?=
 =?utf-8?B?TXRZWEsrUXZFS0l6aFN2emV4K0hUdDk3WjBvU212VzBiZXErcG1ZQTNUdmZ3?=
 =?utf-8?B?dS84Z0NXUFJBZFl4NGU4elIxRlhTUklVMEVoZnZwcnRyMjI3N1Byek52Mlhs?=
 =?utf-8?Q?stnr4nUrWNlbF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZWVHlLcEs4c1NBR0xsS2lvaEU0V1Q2VFNvcFZEbER5TkxTSVJoUkg3NmJP?=
 =?utf-8?B?YnpLTWJwMWt5bG9BZEpUZE1UQURXTnlkdEUvY3VtMHlJcXVmTG9jNWYzS1VT?=
 =?utf-8?B?T1p5WlhDRXhSZlRKYzNXYlNldFBDbkJoMkEreU04bjhDdk5ISWpESVQxclgv?=
 =?utf-8?B?UVBkN0FtL2YveDdnNldDQ1ZXYUxYeVgwTFFvUUxUaVU5OXl0MkVSQ3diU3JP?=
 =?utf-8?B?Rlg0MzlrcWdWdUpUa1JRMHNhd04wY1Z1bGgrVGE1T3A1Qk5qem8wRTM3MXZH?=
 =?utf-8?B?T1FaVnNNYXZoNW84Z3ZEdGlENUZyNERRQkx2MkRBby9MbW1mTTFBRjdIWVdw?=
 =?utf-8?B?Tk1vUEUzLzlsZ2ZpYmJQMDRBV0IwVnlJU3dhMm1Vcmp4aHFZRzB4V3E4QytJ?=
 =?utf-8?B?c3pDTTlPeWJIcG5wbU14enZBdkY4WFJxbEpLU1FrQm9MUDRNeXRMWldkZE9h?=
 =?utf-8?B?ZW5ObU40VTVNTnZ0S0ZQMG9SaXBtRGwxOExvZWozNFIvM0toU092MitpaGJO?=
 =?utf-8?B?M09RblpDMWpUcWYxNENja1p3NnVzc1RHeFp6SjhiaXlOR3BlMVZ1V3lkUERx?=
 =?utf-8?B?cXptY3A3Ui9IS1pSZGZBVDZoamE1N3F6bGhPSUNTVEhlZ01uUVZaeDVzM1pp?=
 =?utf-8?B?dFNOWmQwTzZaVFFPOGtYMkhGTXVJazhjY29sdGRwQkhpckg3VkN0eEZGV1Np?=
 =?utf-8?B?UVUzOHpyQnNqdXFzZTl1bk96YnFXbHNYbkRCWFNucGV0UTNRQk9jWFp0bDVN?=
 =?utf-8?B?NEpSY1d2Yy9pTmVUdmJ1RHhaRXZrM3NMakNmWm1COWE3L0hGNnVZc2NwaFJN?=
 =?utf-8?B?b0ZpT3A3b1IvY0NlVkNYWkxOS2NTdXYxa3AzKzBmeHFSWEFnYm1JK1VKUCta?=
 =?utf-8?B?OGZHNlhGa1dsZjFaSUtDSlo4SmRveVI1dW82aWszMkVscCtUNWY4UjNCd1RT?=
 =?utf-8?B?dEMyT3pKUFRHRjlmeUUxS2I1MEN2THFEZWR2M21CaHJFVmhGSWpKcmNGUG9F?=
 =?utf-8?B?L01UYjhwWlhRbmt2QTNOZVFZajE2a040OEVmVUNvN3Nxd0xwZjBwV0FYbEFn?=
 =?utf-8?B?eUhFbTVvOFNLaExyeCtLMWdhYlRlMUFnbVNTd2k0b3Q2bG5oQmhHNkprcUMy?=
 =?utf-8?B?RmlGQTY4OG5XbzRxemtrT2g4dHZIWlphMnQwcmt3VmZZQjl3VjFFazQ1YUxn?=
 =?utf-8?B?OEtMRkxIQ1laREl6bitsUTFxbU5PbHJKRHJpUS9WakwycXZHWXUxbVBJd3JZ?=
 =?utf-8?B?Ui9HQitVWVVxV3pLeTBneFdHM05jYzM5WHIvNW5SMGRyb2pBcFFUVXpla3pk?=
 =?utf-8?B?R2cxWWFxdi91bElmTzNiNjA2RHZDT1pwQTZIenMySXEyRnJnY0VLUndqL2M4?=
 =?utf-8?B?Wnd4ZDEzTlJ0dFFVMXlwZW01dERmL0hDTFFxR0lIbVlaVEdGblRZRDlKOC9S?=
 =?utf-8?B?L0VwanVFd1BNWERMaC9lcVk0dUkyc01Iam5ybVZhdy8vaTRWa3gwOVJZSDE3?=
 =?utf-8?B?VCtXWFpoNGtTWVJWMFdPRytQOFpvT3RnMGpsSG5CV0pBd1cwTlViV085TzJh?=
 =?utf-8?B?RldrMnlLaFBJMGNvSm9FdGJHdWU5YjdnK044WEIxaUpCUzNaV1E5dG8ydkJz?=
 =?utf-8?B?ckplSzAxOVV3dXRPdFRWK3dBYmFJL3RLZTgxZldzT05GZXFMQ2sycGZ1RVF5?=
 =?utf-8?B?ZEsxKzRrQmQ2THBwM0JqNkQwRm94anBLY3dxdHFidUhneklNTTVCa0RsaUpD?=
 =?utf-8?B?MmVkRnd4VUF0ZW5UbE5yUjgrc3g2QWphUDhhcDRvZVhSRFA2MFVQMmdLclg2?=
 =?utf-8?B?NDBYRm1nT1BXZldGdmR4UFZlV2VqVnRpOG1kaXd2QlFXYXZKbG1GczUwckhn?=
 =?utf-8?B?WVJESmM1MFI1M2J5alhCSlI0OGdYVXVsVkR6NGordVJmekc4RmlLcGd6d0JB?=
 =?utf-8?B?aVd0eVZiSGxBbWY4aDI1elkyYjhBWVBhRC9COHl1WEQ3OCtPaSswZjVYR3Yx?=
 =?utf-8?B?WWhTaEJXYnhHM0M1cFgwNWtkRmRuSHM2M2JXNTU2dWcxdWErQzlMRGE0aU1z?=
 =?utf-8?B?Y01wVHR4VG5wY1ZmT1YzN0R4Z0wrZ2ZxajRuQkVsaUViOTJtaHpTL3dJTEhZ?=
 =?utf-8?B?WWFLVzg4dlNOOGR1T0MxOUJ4UmJGZnRqVUhTU25GZ3htcnk5ZEZKakFIZzVh?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c08fa6-4d0d-4a01-f371-08dd3ec83174
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 11:46:10.2047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQQq+QIbRvuuFzdTAxVHxXiiF3IcbMiA3/WcF8QuZM/l6iG7JJu1U2C9D+sLPgfn1+MvtN46s5BnSEfje8EGBDM5+SQ8Kj3/JiiyrJvaixQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5887
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

There is an error path in igt_ppgtt_alloc(), which leads to ww
object being passed down to i915_gem_ww_ctx_fini() without
initialization. Correct that by zeroing the struct.

Fixes: 480ae79537b2 ("drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal")
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5816d515203a..29b9c75557da 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -154,7 +154,7 @@ static int igt_ppgtt_alloc(void *arg)
 {
 	struct drm_i915_private *dev_priv = arg;
 	struct i915_ppgtt *ppgtt;
-	struct i915_gem_ww_ctx ww;
+	struct i915_gem_ww_ctx ww = {};
 	u64 size, last, limit;
 	int err = 0;
 
-- 
2.43.0

