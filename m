Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F35B8E2A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 19:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCB410E9A9;
	Wed, 14 Sep 2022 17:29:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17010E99E;
 Wed, 14 Sep 2022 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663176573; x=1694712573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/RehrtwJGpsMQfr3JEdXz4J/3cY0nYLUyerGuqM7dvI=;
 b=Uquy28IxucMrvxPI+bdPphzyAleIGq7jZ+XzPvl28kVDv66ReZbuZ2kW
 DRUqJhZrlRe48XmedegoaUTW/kIZtAxTPOMHhANR62g2Vn1uQ0kfUj0nb
 2NjkSfvYW4WqdRje96bp2ZVVw2160jZbrF63qfCob9M31J/7dyczy453B
 YQBQFKyGOG2nIx1lQXjIYur/CHP/Ja/NkqE0M+VQcyVwGIirOkgUG9PTD
 eACkwj357aAE5WxasbhALvGErVxRUcWUhcCAW1EXGfGHM4SLxmGhir8Al
 FQ3THh77HqlqBqth19HvJ3q7T7rSSvGtQ8Lpws8cQ0N6jUk4T7zkcf0gE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299305388"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="299305388"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 10:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="594470233"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 14 Sep 2022 10:29:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 10:29:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 10:29:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 10:29:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 10:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3BH9vTEELo+ajBoPyDsCfTQn3a7zrcPq0tjSkQKhqVv9NpaSRNbb0Xv7yblZTl3qippcd2r2wCkv21ShUrXlWVWcDoHAmqYyJHZ4sO3s69lWQVWexNnKc1GoVnGNetpZ6VyNTd9SaQaAihEXaZ27PFBE8m/jRFOo3wtUeICh0RtP2KUfgeDewdl6niI7qwmnG/U8ZM5dkn22j3GK2SuwQL82RLlhwuFURMEVRPEBRLUthJo6UuJYcPeq0fy3YF6oUvg+pjXHOscIXfASljzTYivmfsHUHRpfHsEhASGRLotd0sJrgmlDf8sKSbVbF8LCcgD5QyyyLYIyLQ12vBNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F9wCWNx9XVRdcgWKi3wStr+v/iAXP8LXP+LW3Xxa1s=;
 b=DA0vU+OeABXCQIYV+iM94e3IIgjH9nabb76x0LGxwxSSPY14veg8D6KYl3r14e/W7bzxcJ3mpOdGCgZ9jfuc6pxeA4Y+H8x5LX2lTK6K0zArp2QBV8J6CKGTEPkworA+h2c1up7ip7mavj1W+S1TBqkoO3FqGH7x4tjgQKz4WGZGzVy9P4It6p0fBXW/vv115VH5/pHowO3z9rCTGMks8dtaRlskh674mhqeSanCUDjsyRxjy9Tb2gOa8NIjLl90dn3L1pM6YhSg/3F6HO81ZTc1WfMdNGhIUZhZvqoV01duFjgqiboiUF6zrPIHJjg+/rvgXgCv2/B0mqcTi+JGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 17:29:28 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::89c2:6a8d:42da:375]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::89c2:6a8d:42da:375%7]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 17:29:28 +0000
Message-ID: <e7dbbf01-fe52-a89a-7eba-3f4e3aee7044@intel.com>
Date: Wed, 14 Sep 2022 10:29:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/1] drm/i915/uc: Fix issues with overriding firmware
 files
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220914005821.3702446-1-John.C.Harrison@Intel.com>
 <20220914005821.3702446-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220914005821.3702446-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b47784-b813-4bde-85b9-08da9676ad1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9K58BK7tCtLF5Gv8oqUmE0WqvxaigEx4DujlROFPFPZqDKwDkcd33HN057TzlII5gZiPZvw3aqo0rsBCj31yw0voD5yWy9AV0FyJtHpskBcIxPD3p6vT+6pfaC0x4oTRxKdi1k7SoRin12bRrFcjRl3AHOyPWI7/mxbKH7XX9RMXBcW47GUVcwgOc3Z+GMMVhBsePCDXjF0GnJcp8PL17lWB6P1FRb7U0Jw7s2abs/SGkzieOBZg4n2AMsKYW3j3+qhrHkp2TrcJ3LcVU1+yWobS101pGRlWwEX+adicl8LI50WRQv2x1NO8IJ1vQSXxcNY+QErJ961gdgDFim4nw9LO/tjLfAER0p7EF39mxjwUK6JUlcmH2+z8lyyAcJUKCG30QOOfbNKtn+tOpYQ6+9vhQIEPCv9aAn/8WWytldKS0CrL3hRJBolV7OnE8NNsK2zf2coH+teJl8c50GhegUqwbk+H0u+hLdbry9HhNEihYbiUolmR5/o48dROYNdSoWNHRp89mcxB2UpIlpTmFEOXEyzR/5RadSYG4VQMD1NNgrk8Ls46xjcZ94IEwg0VeTX214xK6tpsZisQk2XxH6Yf1GyfmFUn+uX4tENEvP8rOiReZt7SBRqFk6kr05Szo+SUPsm/wmgQtBJtxPIcaUMNcwn/kmcvsRqmPHtLtSymQN91aM92HDsIuTM8krqecrAzMYUF7VMzVjBmHRJKvVcydp7mXkDqR9m/0HEyf24wO8b3Ci502Sha9fpgkToIwO8LaqLI4JvtaQE7PrFVOwZf2fzbqmgmfTh5LFcVcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(82960400001)(6486002)(5660300002)(31696002)(66556008)(6666004)(66476007)(83380400001)(4326008)(66574015)(86362001)(478600001)(38100700002)(66946007)(36756003)(6506007)(2616005)(8676002)(54906003)(316002)(8936002)(41300700001)(53546011)(31686004)(186003)(26005)(6512007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEl0L0tuRGg4ZXlDbnRadVcvZDRnVXV6S3BHcW0xczdoK1RPeWNqSmlzNnBL?=
 =?utf-8?B?ZXZSMTBJNjZQc0NiNCtoM3RocmJMUktLR0pqMEVNTDE4UW9LOVhpbHlkQU9w?=
 =?utf-8?B?a3NHQXpaeDZUNm5QZFVONVEyMFlIR3p6WTY0bm0rMk5nVE0yaG1yeUVwWldC?=
 =?utf-8?B?czdpL0RpbTJYWitrY3pJNGVxM0dOQ3BJWStTU09RVWNQUG1vWTM0MnU1UlUv?=
 =?utf-8?B?KzVBRGYrN0xSTVJ2ZjRORHlvM3ptanltdEU2WVNFUzE2MUUrc2tqQjFqUHhE?=
 =?utf-8?B?YjNqL256ZU41UjdQb2IrNzc1SkUrbkV3S0VwbGUvUHQ3MnBHTlVFSWJIcHdJ?=
 =?utf-8?B?Vlk2b0pxTUlGWnFoQWV3N29obllucHJ3SFc1WWIwUFRxZmVaYzNxMS92TGtq?=
 =?utf-8?B?aTkyb3NrT2MrTmlsaEFsbGJ5bjlhcENjQXExME51WUcvNDM0T0IwbVBrb3Ba?=
 =?utf-8?B?ZmNPdmxBQkpCUmJMN0hrQi90cy9INFllMXdCVlFaeWVUcnRqcllnbFEvdGdO?=
 =?utf-8?B?N0VQZVVFTTFvV1NjTzVZRHJ5b3hHK3F1ZVQrb2Y1VmZBL2ZXQUVKWmZzL0tC?=
 =?utf-8?B?L1Byb3lDQzdBUTJrSmFXODltS3gzT2xqVzdOVllGL3ovNGZYdnBjK2lzSUVB?=
 =?utf-8?B?aXFWWGdzbVVoaWExNE5xK3pRMSswZEVxZnJXOXMxV2JSc2U5Z0NiYXdyOVhE?=
 =?utf-8?B?SFVyeVE1SkFoUWpRVWRNNEN5V2c4ZTQ3Y3RUOHpXNGN5dE9LamRLUEVwM3A4?=
 =?utf-8?B?dU5sRHF6b01pSGplZnhiOCtzUWFtMVdrNVlVei92OG1VQS9hT0lqREVMSnFV?=
 =?utf-8?B?cmNLdUwwaEc4SjhzMTk2M0RBUXNxUjdjMjdNVE9tMW56bk96ZkdmcmwwZFlp?=
 =?utf-8?B?TGJUeklGQ1ZuYnd6bXcrOXYwcVA0TDdrbGx4MVpYTGtIY1plQ0wvaVZLSWt3?=
 =?utf-8?B?L21SYVExVDE4YURBQTQ4alNTSjkrejB3RW0vUlBMdmZYV00wZXFQUWMrcWsr?=
 =?utf-8?B?SmpLOGFvV01vY2c2TEk3RDREdDV3SnNLKzFoSFIyNmZxWlE5Q01VVERHT3BG?=
 =?utf-8?B?aHBrNE9xdjhjVkZmRXcxbm1Cdk1rT2Z6S2hFMTdoYnRsZlRBQ2ZRQ0tmend1?=
 =?utf-8?B?S2twY1U1bjc2cGJqMVpSQ2FEV000bE1EY1JqaGcrdzlKM1FubHJIUGthMHhu?=
 =?utf-8?B?QVBZY0FVUnF6czUydWJITzh2VVF6cWFURjRXU3hWcytBT3hNemxwTURXVGpR?=
 =?utf-8?B?V2U0dHp6S1dQSXhLdzB5WERtVnB5Z0E3bnNMQVJrVnBJMTRoSTNJaHN0RTlZ?=
 =?utf-8?B?My9QK0l3UFVTTUpLNENQWFAzL2kySU1oekIwNW9qSmtIZy81aHZ5QTdxNi9t?=
 =?utf-8?B?WnVZSFpXNXZyNHd5Q0x4RzBaL0ZGRXQ1UUsydDF4N1N1L3dwSFBWZkNvMWxM?=
 =?utf-8?B?THBMSUFFdG9nWm91VTExWnl5ZlJaOTAwRWQybVAyUTBsSGZtcVNsV1JocWdl?=
 =?utf-8?B?clFWUGp1L2RxMmRUS1QwOXZta3RTRFlDMVdKcW5BSkVVRjZLdE5OMUN0OGVX?=
 =?utf-8?B?R0doUmhhdGY3SEwwenZJMzhYOUVsenVKNklZMWlvcWhwa2h6bkhwVHVPOHlS?=
 =?utf-8?B?NHkxWmFsOEZqdEJZbG04MWtjWlFUcG91YTlWWDhDK01UdE5TS2tuRTBuQUJk?=
 =?utf-8?B?dVplTzVWajdlZEdqZlZ5VTJ5NVE4OUVvMVp0YnJwV3ZSbGdrT0VTR2l2V3p5?=
 =?utf-8?B?RVFzMkxvaTlOMVh1N0d6ZEJkdVg1aFdrckpJUW1DR2o3dWphQlNzekxUbVlo?=
 =?utf-8?B?enZJSzNZSi82c2hoUnpTYWQ2STI5SUFMZGJhOHpVR2pqa1JzOWFrc2Z6QThL?=
 =?utf-8?B?RFlWdzdJcVlsVEtEZUxnN3dRYnEyTUZ1S3A4bUlMNkphTFBidWk5RFZFSnlB?=
 =?utf-8?B?TmdNS3NLb2R0STcxbzJoSXZlM3k4NVNVTzJ4WkxkbG1iMFNENG04b0pkeXVj?=
 =?utf-8?B?VlRZRUg5YW9qbTViOXlLMFFWTERUYkxjbzZRNHFRNnRuVmZhWEVwMTE4aEx3?=
 =?utf-8?B?aDM4cnNTbUlwK1VzQTBzMEtTRUh6WFJiYW9sMElBM00rODVSQkFvaVlPeUM2?=
 =?utf-8?B?NlF0MnB1eWNwbW5NSDhFRmpQejVkZ0hWTkIvakhqTmppWDlhVjV5TUNibDJH?=
 =?utf-8?Q?Gip6Ym7ZYCMGNFDdRIohW7M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b47784-b813-4bde-85b9-08da9676ad1a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 17:29:28.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uTOyHUjqPrJ8reeQB0Fn6uc/QnAs9aFtRZYJw8Ac6SP5QaYWXL6FIKZGVW31dAm7qaQXLhd299jEOkElZ3siuGgpEiwI9ZlaPeMlFeRjlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/2022 5:58 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The earlier update to support reduced versioning of firmware files
> introduced an issue with the firmware override module parameter. If an
> invalid file was specified then an infinite loop could occur trying to
> find a backup firmware.
>
> The fix is that if an explicit override has been set, then don't scan
> for backup options because there is no point anyway. The user wanted X
> and if X is not available, that's their problem.
>
> This patch also fixes up the scanning loop code so that if an invalid
> file is passed in, it will exit rather than loop forever. So if the
> impossible situation did somehow occur in the future, it wouldn't be
> such a big problem.
>
> v2: Also remove ANSI colour codes that accidentally got left in an
> error message in the original patch.

With the commit message updated to include what you mentioned in your 
reply, this is:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Fixes: 665ae9c9ca79 ("drm/i915/uc: Support for version reduced and multiple
> firmware files")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index af425916cdf64..1169e2a09da24 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -232,6 +232,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	u32 fw_count;
>   	u8 rev = INTEL_REVID(i915);
>   	int i;
> +	bool found;
>   
>   	/*
>   	 * The only difference between the ADL GuC FWs is the HWConfig support.
> @@ -246,6 +247,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	fw_blobs = blobs_all[uc_fw->type].blobs;
>   	fw_count = blobs_all[uc_fw->type].count;
>   
> +	found = false;
>   	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
>   		const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>   
> @@ -266,9 +268,15 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.path = blob->path;
>   		uc_fw->file_wanted.major_ver = blob->major;
>   		uc_fw->file_wanted.minor_ver = blob->minor;
> +		found = true;
>   		break;
>   	}
>   
> +	if (!found && uc_fw->file_selected.path) {
> +		/* Failed to find a match for the last attempt?! */
> +		uc_fw->file_selected.path = NULL;
> +	}
> +
>   	/* make sure the list is ordered as expected */
>   	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified) {
>   		verified = true;
> @@ -322,7 +330,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   				continue;
>   
>   bad:
> -			drm_err(&i915->drm, "\x1B[35;1mInvalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +			drm_err(&i915->drm, "Invalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>   				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
>   				fw_blobs[i - 1].blob.legacy ? "L" : "v",
>   				fw_blobs[i - 1].blob.major,
> @@ -553,10 +561,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   
>   	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
>   	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
> -	if (!err || intel_uc_fw_is_overridden(uc_fw))
> -		goto done;
> +
> +	/* Any error is terminal if overriding. Don't bother searching for older versions */
> +	if (err && intel_uc_fw_is_overridden(uc_fw))
> +		goto fail;
>   
>   	while (err == -ENOENT) {
> +		old_ver = true;
> +
>   		__uc_fw_auto_select(i915, uc_fw);
>   		if (!uc_fw->file_selected.path) {
>   			/*
> @@ -576,8 +588,6 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> -	old_ver = true;
> -done:
>   	if (uc_fw->loaded_via_gsc)
>   		err = check_gsc_manifest(fw, uc_fw);
>   	else

