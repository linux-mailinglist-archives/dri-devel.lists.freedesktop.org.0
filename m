Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B689404896
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 12:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61E6E4C4;
	Thu,  9 Sep 2021 10:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE10F6E4C4;
 Thu,  9 Sep 2021 10:38:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="243060319"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="243060319"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 03:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="466439616"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 09 Sep 2021 03:38:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 03:38:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 03:38:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 03:38:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 03:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/bvS/7f2PBAzTUR/C2oJvH089+qYV7+St3LSwjlmrzh3swNTBPA76n0A6+dKC4VxbJXoqwtglpsrn/wk/LG15eijSNe1r3G00Z5ZOAtBbdkIySPelR/6HuXpDDjK5rXUm6bd7JC5/7fHoIuqztNb8Uin5hyooKoOBj0z3dabHhxNnGeVMXqDv9Nz568FHZq4YdigR8aLP9XCkTtrnbLzy9iLHkeeLSBAaWBN5rHY4PZR7sSOnsTxyRrpbgumrFxUEEvX6ctfSBZJL5hr2T71UQn6BeSoFWDMBYFoXwuD5rgt+ReQ9DN2YfGuFt6uNSoe0il8KMxBtIa1M0raCNaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=SktviEgOIhZYvlwe9Gesykvz1m6TH98Pi/ptgJHXAQs=;
 b=JkJeV8Rq7OQqQdzAfseePNt1GZrMdaUDoJqhYGcJUzKsBijFZ4jM1fnph/5AdKEPEli3Z0hNgtROfdRmsvFiVX6oTUenV+xkgRtawukLc5TeuCfPvtVzLNMCBuS4HStoeFImXuOiMytl8M2UrvxYtmOB9oQ4iGEFc+pFhjVeLCxDIEwcur0m93lZOjGVItvYtWFOTUEEeJePHYijqunUqhKoRojOGT/Is4FqxYRIeUSgSOTq6BMN0b9aCZKZOGJW/G7r6P0FR7uqeloojY8WP9knPAmCgi3k26Hqaj0aTWr7Hz6aqQA7nNJv5QUDUsA6OGvumaOZV2p0gLECzkXOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SktviEgOIhZYvlwe9Gesykvz1m6TH98Pi/ptgJHXAQs=;
 b=CBhesZwVHZ5mjpL+rxo8hkVnc+ZKxEL0vIFMhLflGOCG2sGDupKLETqw+iU4B35Y4z1bz7pFAYAGmKAFRIVuub7TMI2AbEqjj5Id7hXLYTVu48bCslhjQ0KONc4kllPwlBmbrCpq+2nx9FjoBfhc2AuoTT55Z5vv9+bwB/6Nyhc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16; Thu, 9 Sep 2021 10:38:33 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%8]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 10:38:33 +0000
Subject: Re: [Intel-gfx] [PATCH v7 15/17] drm/i915/pxp: add pxp debugfs
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-16-daniele.ceraolospurio@intel.com>
 <feeca8386eb62d8fceef417f63d023277d047b5b.camel@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <e3b9ff33-3348-2004-5e26-cbca0f56d04f@intel.com>
Date: Thu, 9 Sep 2021 03:38:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <feeca8386eb62d8fceef417f63d023277d047b5b.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: DB8PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:10:110::19) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.56] (2.236.112.29) by
 DB8PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:10:110::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 10:38:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ac78f0e-089e-451b-7852-08d9737df8a6
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB5423202C399C20158271EA57F4D59@DM4PR11MB5423.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJgndqD8aVGHKAjK565A1htpQ8wD3xrExpP/gRFNqJa7ro+a0+n9Q6y5RR7AOydxHUT4B40irKUySAmE3L3RXWHPu/D7gcX5IRDmWZudn6pt3ZQ1a05eMQsU73dD0dm8hWrS105c8V8nmJX86JoLtA5ofv4Nu5AMK8YdeYxJVp5jwkqNUHGWLjaNaRJFMly2jmB7rOY505NXcUwGtpO4mX1eKwC5JGj6tah2F2ezWZCOenL299s+ZRZnxechNLEYlyPmTSz8xOzN36Bf1iDLx9l/07X2YESESYHSLOmOpTUWFvIg9XlzrncZ7IR0KAQzSaoNpJUOFX0t373Gv+UkrMRyH0RsGnPJO8B3P01JrNyRWtG+OrxjhwulxE3XxpWUmWPUgiSHd1GVaM1hhAf7IXumyZxlKPNNE0yLEKbFq1vyS+h1wjRGH57Jiu3HC0XfBpFpNnqfoilmndPLffdTs7IuqOFtLSkSkXJlolMGFUPcS76/lMI+8Ba0b1gsGHl5NL6gj3aGW+NDRqmKfMwFCOxMq3xpe7XAwwnHK7hGDAwsiLI+en8LjXiEjjzYhk6uB0Y/b96SKJEaMn68Tbr5hSDKxjSJ6bASRWXUitq4Vt9CPMuT8QNXfzUSfyzmJS7qm6Yvm9zYzojwoKE7QD2EJnLn8KhSjCrr2QH9lDwIBN4EYkeHNIzzSj2K+CJFyluNYIgwJtZGAb0sHKmjr3exmq8tkLEumMMthjxOnX85p3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(2906002)(38100700002)(31686004)(450100002)(4326008)(186003)(26005)(8676002)(31696002)(8936002)(110136005)(6486002)(316002)(66476007)(66556008)(5660300002)(36756003)(83380400001)(6666004)(956004)(86362001)(478600001)(16576012)(2616005)(53546011)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUcwZ3ZxWjIyTVRaUlZ1UGVCMk5LR1BMYldyQ2x3dEt5YjNlZTlTUXF4L2RN?=
 =?utf-8?B?cDdWZXRJNEw5eWt3ZTY5SVRwYTVqTEFjL2xlQnE2UVhVTlh3bkdTU3dnWHNm?=
 =?utf-8?B?cVE1bjREc0s3b1lwUGtsb1NiVXRRalcvTkRQSWxibzludE1TT2NmajNKNDVS?=
 =?utf-8?B?WDluZHc3dlBiL3Q1MjUzcDg5R0dzaHFIK21ONE1ubzVKdmpKa0Njdnlvb3dY?=
 =?utf-8?B?L1ZUK3R0cW01d0tsbDRvWEFGQ09lWXJob3J3Znp6dVA5cXdTRHg0R01LNTlD?=
 =?utf-8?B?SndReTQ2bHZNbHVkYkl4QWpVdWZuREVsc1hHbE9NTzArT3RIRGZrWGNCc3Qy?=
 =?utf-8?B?WHFqUEs1bm40SWxtZ2taTHpVVk5PanJqR1l6UTYzUlJQUE5MT21URlVvRDd3?=
 =?utf-8?B?SVhpeWE1Q0ZxMXNKUDBYYkZoL2doTTRodENqdWU5RVpIN1dQRmVQbnNhaEEw?=
 =?utf-8?B?QWhpZkFxYURnMEFOWEpldG5JVGxLUDNnWi9ydjFhaVNGR1RVOXRHU3I4ZkVV?=
 =?utf-8?B?ZHFrbUE0QXVhZFF5VG1VMWtQalFUYzVIZ3VGcmR0c3E5UmRrSzU1cTI2YVA0?=
 =?utf-8?B?a2FoWVV1ejF1TUE2QXE2QUgyM3dVb0x6VTJWUTR0Z3kvM295L0VXeU5Pa2dk?=
 =?utf-8?B?ZnFUYVllai85bG95L0ZydkF3UWQrOEtNS3FSYzRXM1NsTWJXWHJCV202aG44?=
 =?utf-8?B?TDlZOGVIckxKajFYa0VJVmd3WGlNUzFxMjJDdEVyd2hPK3N4aWZnTWk2eGtG?=
 =?utf-8?B?NkdYNnBrdlZaa2dNSnZTQzhFM2pEQnpYK2tFNnpFRGoxRm0yQ2xjSGFSTVU2?=
 =?utf-8?B?T1dBWnR3UEtVdlhKc2xaN3VpVTFreUJidHVTK3lyOE01UE9DWTR0cFpHQ1E0?=
 =?utf-8?B?d0tOTHdqZ29CSTY5VmNndDMwbUZmcHRTR2M3SzkwbXU0K3RiOWpkb29zbUVz?=
 =?utf-8?B?TVJWYmhxMlEySDJVMHBJaHhLQkY4WnMvRmZYUms3VFl3WHdEc0xHcW5EYmMr?=
 =?utf-8?B?bEovMjhXTFo2cFRjcWFHUSt0bnd1bGdNeWRidGZzZ0poNlovZlZyeVZoSitm?=
 =?utf-8?B?UC95dU1lQ0hObyt6K2hRQnpNK0JoQTRMK2NRM3NtUzZzNkxrZFJyazRRVGUw?=
 =?utf-8?B?anR0bTJ2cktkNFJobUUzcE1QWTlZQ0xxR25XUU1ZVmI2T2pkRFVrUTBMTmFH?=
 =?utf-8?B?OXBGYVBMazBvbzZtVnl3RVBuL2NQZVJUZHpJSkduOGdCYndUWHFOTzRGMjhD?=
 =?utf-8?B?YlZRUjZQRDlxQUhMU2ZmdFBYbGlmT1Q2OUdWMlN4NmdxUnk0U3ozTC92d2FN?=
 =?utf-8?B?c3JsYmlCMDRRSWFDRnJYVHVaRXFMU2ZTRUtnZE4vckRJeUQwczcrR1JtL213?=
 =?utf-8?B?cXByV0Z1Zk1RTHdvQldubnFOU2ZHYWwwRmxGMFNxZFdMVWNzWHJkMmxHZjhT?=
 =?utf-8?B?Q2hSTDl5eEp4cHRoY0wyWVR1cUl4aWpoZ3NKNzQ1Y1hiODNmeXk2aG44cnZp?=
 =?utf-8?B?NlVCSklWM1RNWitvTEpnbE1mck03L2pVeTVrU0NPSmNtYkFvemJFWjk2T1Rh?=
 =?utf-8?B?T00xZERvUEJwVVFDdzJBZnRZVlp2bGJXU2dPQmw2WWtUaWd2RGtkRlhGYXRi?=
 =?utf-8?B?VkNnV2NWN1pVWUM0eVRjcmhyL1R6WTdub2lSVnlKamdUbTlpREdaVk5qc3Fa?=
 =?utf-8?B?bHJuODQzNldoRGsxS2hnN3FTR0RZdmNWcW9MNVZQc3FBUHYyMURDdVFBRCt6?=
 =?utf-8?Q?88tjsKk9ay3K6kn5p9T+vfs9UA8VB1jUFvilGdh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac78f0e-089e-451b-7852-08d9737df8a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 10:38:33.0297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5IIbArC21ucaVpjtQIpliQWR2SBtxqUDIeOp06d+nmkK2SjdT1aKV3C0EyhDl1AXqS9JUw+AGTgoPQ/3G9MqAC13iLX7l0Ih7oYlREXy0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5423
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



On 9/9/2021 1:17 AM, Teres Alexis, Alan Previn wrote:
> I dont see any issues except a couple of nits.
>
> Reviewed-by : Alan Previn <alan.previn.teres.alexis@intel.com>
>
> ...alan
>
> On Fri, 2021-08-27 at 18:27 -0700, Daniele Ceraolo Spurio wrote:
>> 2 debugfs files, one to query the current status of the pxp session and one
>> to trigger an invalidation for testing.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                |  1 +
>>   drivers/gpu/drm/i915/gt/debugfs_gt.c         |  2 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c | 78 ++++++++++++++++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h | 21 ++++++
>>   4 files changed, 102 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 6f6cbbe98b96..9a44d6f01e3b 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -284,6 +284,7 @@ i915-y += i915_perf.o
>>   i915-$(CONFIG_DRM_I915_PXP) += \
>>   	pxp/intel_pxp.o \
>>   	pxp/intel_pxp_cmd.o \
>> +	pxp/intel_pxp_debugfs.o \
>>   	pxp/intel_pxp_irq.o \
>>   	pxp/intel_pxp_pm.o \
>>   	pxp/intel_pxp_session.o \
>> diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt.c b/drivers/gpu/drm/i915/gt/debugfs_gt.c
>> index 591eb60785db..c27847ddb796 100644
>> --- a/drivers/gpu/drm/i915/gt/debugfs_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/debugfs_gt.c
>> @@ -9,6 +9,7 @@
>>   #include "debugfs_gt.h"
>>   #include "debugfs_gt_pm.h"
>>   #include "intel_sseu_debugfs.h"
>> +#include "pxp/intel_pxp_debugfs.h"
>>   #include "uc/intel_uc_debugfs.h"
>>   #include "i915_drv.h"
>>   
>> @@ -28,6 +29,7 @@ void debugfs_gt_register(struct intel_gt *gt)
>>   	intel_sseu_debugfs_register(gt, root);
>>   
>>   	intel_uc_debugfs_register(&gt->uc, root);
>> +	intel_pxp_debugfs_register(&gt->pxp, root);
>>   }
>>   
>>   void intel_gt_debugfs_register_files(struct dentry *root,
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
>> new file mode 100644
>> index 000000000000..a26e4396ba6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "gt/debugfs_gt.h"
>> +#include "pxp/intel_pxp.h"
>> +#include "pxp/intel_pxp_irq.h"
>> +#include "i915_drv.h"
>> +
>> +static int pxp_info_show(struct seq_file *m, void *data)
>> +{
>> +	struct intel_pxp *pxp = m->private;
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	bool enabled = intel_pxp_is_enabled(pxp);
>> +
>> +	if (!enabled) {
>> +		drm_printf(&p, "pxp disabled\n");
>> +		return 0;
>> +	}
>> +
>> +	drm_printf(&p, "active: %s\n", yesno(intel_pxp_is_active(pxp)));
>> +	drm_printf(&p, "instance counter: %u\n", pxp->key_instance);
>> +
>> +	return 0;
>> +}
>> +DEFINE_GT_DEBUGFS_ATTRIBUTE(pxp_info);
>> +
>> +static int pxp_inval_get(void *data, u64 *val)
>> +{
>> +	/* nothing to read */
>> +	return -EPERM;
>> +}
>> +
>> +static int pxp_inval_set(void *data, u64 val)
>> +{
>> +	struct intel_pxp *pxp = data;
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +
>> +	if (!intel_pxp_is_active(pxp))
>> +		return -ENODEV;
>> +
>> +	/* simulate an invalidation interrupt */
>> +	spin_lock_irq(&gt->irq_lock);
>> +	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
>> +	spin_unlock_irq(&gt->irq_lock);
>> +
>> +	if (!wait_for_completion_timeout(&pxp->termination,
>> +					 msecs_to_jiffies(100)))
>> +		return -ETIMEDOUT;
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(pxp_inval_fops, pxp_inval_get, pxp_inval_set, "%llx\n");
>> +void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *gt_root)
>> +{
>> +	static const struct debugfs_gt_file files[] = {
>> +		{ "info", &pxp_info_fops, NULL },
>> +		{ "invalidate", &pxp_inval_fops, NULL },
> NIT only: consider naming to "invalidate_display" or "display_inval" since we are using this to trigger
> display pxp teardown specific irq code path.

I went with "terminate_state", because the termination interrupt can 
come from the display but can also come from the ME and we handle both 
in the same way. What we want to test is the termination path that we 
enter when a termination interrupt is received, we don't really care who 
the source of the interrupt is.

Daniele

>> +	};
>> +	struct dentry *root;
>> +
>> +	if (!gt_root)
>> +		return;
>> +
>> +	if (!HAS_PXP((pxp_to_gt(pxp)->i915)))
>> +		return;
>> +
>> +	root = debugfs_create_dir("pxp", gt_root);
>> +	if (IS_ERR(root))
>> +		return;
>> +
>> +	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), pxp);
>> +}
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
>> new file mode 100644
>> index 000000000000..3b7454d838e9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2020 Intel Corporation
> NIT - 2021
>> + */
>> +
>> +#ifndef __INTEL_PXP_DEBUGFS_H__
>> +#define __INTEL_PXP_DEBUGFS_H__
>> +
>> +struct intel_pxp;
>> +struct dentry;
>> +
>> +#ifdef CONFIG_DRM_I915_PXP
>> +void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root);
>> +#else
>> +static inline void
>> +intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* __INTEL_PXP_DEBUGFS_H__ */
>> -- 
>> 2.25.1
>>

