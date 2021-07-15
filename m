Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F63C958C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 03:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AF16E4A1;
	Thu, 15 Jul 2021 01:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EC16E4A1;
 Thu, 15 Jul 2021 01:21:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210498026"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="210498026"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 18:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="494814403"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2021 18:21:34 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 14 Jul 2021 18:21:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 18:21:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 18:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQybyBuJ/4eXYTFxrsMydqlwid7fkBh1sGFSMrDCkY2XlsT8/X38rjRhqfRiPw8NzKhlxT6LEkW42bHHnVlpTH2trBF5Ecqt7xhhAgppF1124UAXPOytcrUG8y4Sj+FCKS+LZcurhEWNJu3uNKdDQmolmEep1Qz7Cbv0kDHgEz+/h3ZqFyAdHoyNNGcYEBXmPDH1tCgrtF+J9D8eIlIiNj8WAxsjNMJLZPyWL1zYYPMT2j56XC0/T2Uq9cSuPRJmmZvcFOJZdXudEYbqwvajSoRtiM6L3AyOGGRLmmHbCxnSKfgLdnvgzH2Eiqjr2onAjLxah+8OprfBgYReE8a+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1U1etAg9hLEIc+MQPRdohyquYCxAns458HV0zig+4s=;
 b=aBQSE+OROaWvGrQr1LGnpjMlOCnrRRRhCanIOUdsl7lpC2UZGKygq11CHhgQ6DhpwwvVyreSGATtGCLZCFJ62r+Y2uaY9eEZSdVS8Mx1QDm72xE1khYKxPVciMwqvLgRVBknQhvFi5Kw12gi7GN7vwy8QJR/9tjNjPIbo/lsSxT4efTtUom9ze6M7H8DYOxFSDCAN8VCuJKhqY8it9WHZFHXpmZC9mhzVW89DutoKLHUm4+Q7vWKPKw0ZDZtV3zRchdmV3W8gV+VWHsWpfhHm6YFEfgNBhQePCXN/Rhy60w8WHUfy4p9LAh+0Rqk3zf3xQQPdUFP4OIbqu2g/8jjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1U1etAg9hLEIc+MQPRdohyquYCxAns458HV0zig+4s=;
 b=YeyU0+4qKce7C9xva5ZFWsLSxDdWGpa3xJB+Qvrp06sRf58KNCG7XCd/6t+WWkNawSFXwmRCyZuoyVsVgsBY156GY0+ZYXjYtiuoYrvjFv2INHNAIuicyREs0sMjWEFdrZRZVbVe4N30vttRZ1/BmqBXOEdSjhcHiAM6LjwZRfA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22; Thu, 15 Jul 2021 01:21:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 01:21:27 +0000
Subject: Re: [PATCH 26/47] drm/i915/guc: GuC virtual engines
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-27-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <95eba0f3-3710-da4b-5cad-5a6c21e46ca2@intel.com>
Date: Wed, 14 Jul 2021 18:21:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210624070516.21893-27-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0324.namprd03.prod.outlook.com (2603:10b6:a03:39d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 01:21:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6a3dde7-2cbc-4086-26a2-08d9472eddd4
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB54889CBE793AEBDFB3C9555EF4129@DM4PR11MB5488.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lq3BK1HEyjRWme9nG7gFoqKaJKBs0/4M9CSlMo9OByZ7VmosA0YkKkSHwNEecZMNxaw9V79/3bzE0v0RO8azCxCibO+/vGS6v+L17V45g1dOs6BbNrSynNtpi7Es4aUrk8tV8fxORjyEnXgWoCZILAGLqMXyW/EbVQKefX8dPEEVKQldcjRc048jstkcT4gE/RSK0xbG3/PK88owkOC4JXbAWFfIZtyiJYdlxYAAQSBlgPtIanCfAB5718Xa0Qou2oZU0pbnO1wdX8ZOn8U5F0nLL05CGa4crw/HLcW6yKpKP61fo8aXhpDJ/98B+Fm4OwYixguktgMV+6kCQtWn7vqzyGiJ8lF/50cCnVmZpVgWaTWJQ7kS2py1Iy7k/wvgDX7XCdqRqGOnzitPWEDbK5Bu44ZOuuh1U6PpEV1njvF9VGnjyUVNHQNomZA4EHgfmDTS3on5Nzpkp5z6APojV1XxPmHcRqjXTbs97iLS65eLZCOuYoBvVkTVxJAC6yGEw5RH5CTC+PJN3e9sYRA6eddVH63PtbW3kZSC+1JjmZTwhT/X/g6Sa1fBCCOIko2Lanklbpu0+oHDnXVLozcDtvUw+40zAlbh4iBTICcE6kGALzpgQwxLU/NEA35gHbY1P6EI2pKo7zmb1fDePAw4MUm/HEFkmtaR/XUmxVGtzEgfJJzPC2DBKDb2Mki3SwfWuIBr/KZhUUIf4tEubIUdpWUuQj1jZiMo6nsd7Mz5SeO3Pc68huTAuxykFb+lbTGeDPJvXbG3kGOD4DM+vgWjiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(53546011)(26005)(186003)(478600001)(36756003)(8676002)(66476007)(86362001)(66556008)(66946007)(31696002)(16576012)(31686004)(8936002)(4326008)(5660300002)(2906002)(30864003)(316002)(107886003)(83380400001)(956004)(38100700002)(2616005)(450100002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2dDWWFlVXc0Y0grWndQajE3RDhiNUsxMmxJQklER0NoUngwT2dVczQxYnFt?=
 =?utf-8?B?NlRSeGRBeTJCS0djQkNWYzRDUk82bjJpUmIwZm54YloyWnM3RDhRMjBCVXNV?=
 =?utf-8?B?ZXBqRXdMVWxtckdweWNjWXJRSVRuejNST1VJeTdEbThsRzAyYmdmZnpyb1Zi?=
 =?utf-8?B?SHdYc0s3cGtOL2d2QlBONStPbTlWYm1kUjRWamdHOTZZWkNOSDdhZkFIUnBU?=
 =?utf-8?B?cWJHeVhDN0JaUTVsWFBha00zNjFVemRHSG9lQTI2c3JQTWxCaFBzS2Z4Umll?=
 =?utf-8?B?RWcxbStHZlNud3RoOHlXWkxEOGpyVVBLem9jc0xIcmkzVms4VGMyYWk2RkRD?=
 =?utf-8?B?b0REWFYra09BT3QraVFGUmQ4MHZxWk1WSCtRdFAxV1ErVnBkZXExdTRQR1dQ?=
 =?utf-8?B?ZjlSSGNnMmpVNjYvVXRvL1IyMVVSQlJKZFM2cFYvWW9xQlNISnhUbVNwZUF5?=
 =?utf-8?B?OVVxSXNFMW5yZ1R1VUNqcklScWF5YUY2M3YwOXBFSkhpekFLVURPTll6dEZh?=
 =?utf-8?B?SUJVMFAwaFZpd0IxdXhPS2V4WWFSN0pMam1QOU9DOWJtZWNSUjdZRWdMc3RZ?=
 =?utf-8?B?dkVFWHpES052QnNtVXo1bGtFWG02RHdUOG9FMFlSdTlRYUtRaXNZRGJjZENM?=
 =?utf-8?B?S0lnWktncndiMkF2WStST1B5Nm5QTVhLaGR0bDZnNURNaVpnYTFEQVAyaThw?=
 =?utf-8?B?NnpkRC8yRXFBeDIzSkN4SzVBaUdUelphVFNIN3d2ZEMwZmlabnpoTzI3NVMx?=
 =?utf-8?B?L0pBdGN1MkVWdUIvakFueEkzZkZWZWJjdHNka0g3cjBjVTFGODlKVEtIWjR3?=
 =?utf-8?B?cXV1dmkwL1dNdXZVYm1ZTmZnRnJDcGJCWFJCWkx0YUlzR3ZMczJYNGN0Rmkv?=
 =?utf-8?B?Mk9wYnBTaVdJaUhHQktFRkRwMllGYkdHQVZnL0orVFBPOXhGU1I0dkRGYkpR?=
 =?utf-8?B?YlJjYmZiQ204eUFZTEo0ZzJQMFVuWE1iS0RkaXZOeEpmYVRDSjhVTlBVckFC?=
 =?utf-8?B?bnRnaTV3SUVGdklRd1duOTV6allzRkErMDQwK3JZWVoyR0EvdzgzeUFyU2F4?=
 =?utf-8?B?WFJERnFWZlI0eE1oRDQrZFovbGFxTHNZWEhqakkwYnZ6MFJtTnkveVhZVGJQ?=
 =?utf-8?B?di9sMTNPdzJKdTZXRGIxUm44OEdQQzZ1WUpEcENDeWR5Q0I2MHVBcmpWRy9Q?=
 =?utf-8?B?WTNndGw1bzlJS0ZpY3Q0S0hEMnZtcFRuVDNobXE0RlpWUkphRWprWXo0YTd0?=
 =?utf-8?B?N1UwSnVjTmQrN1FiT2E3Q0w2QkwyK1NsTGZrTkNYMjdKcGlaNE5LRzJrNlNQ?=
 =?utf-8?B?SWtudDd5L1VSUVpKMGJNelA3a0ZCdmUwTVVpbVpFa1hLZkIrMHBOWHo5WGF3?=
 =?utf-8?B?WW1KcUo3M2xYYVFjMnJQWVBsQWNHSlY3VFdRalNucUp5Z1hCVkxvYkhISkdu?=
 =?utf-8?B?WHJKeHg3QUNFTWpKWlBNNFhpS09TWjVrMEZJS0ppcS81L0NMalFQL25VY0pR?=
 =?utf-8?B?Y1NDTzNLK05wZ1Z1eTl3OW9ORTI0MkJPOWR0ei9PM0dCc1R1aUdxa09zQXEz?=
 =?utf-8?B?eDJ2ZXN1ZTZFUW82SXRoSHRDczJoMU1DUW5JV0pDdVRSSWRaQ2pJZ2Z1eEpH?=
 =?utf-8?B?NW5Rb0lvRjc3SEpNZ2c2NlpWWkRWaDNTa0dIMFdCeS9ScWRFaHZCczhtMlRu?=
 =?utf-8?B?N1lubHJpSnNXQzRFbVZ0YlRrZlNpcXdUQnFxOW13Y0NMUEUxMVg1aUhORWdO?=
 =?utf-8?Q?PWJ+NJlTDkbF6fD2WtDzX0qyv9qdYiNbvrVk4pM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a3dde7-2cbc-4086-26a2-08d9472eddd4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 01:21:26.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLztLtpRGmRX1pSrHNoz8s8dMBffx+o3MCZ5zU9EX/tG2nQpOWAmRJRU0kbU7ESkgIY5mhRQjFRsT99BMx6zk0NL7tBZWvOT5k5Zo1tPJvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5488
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/24/2021 12:04 AM, Matthew Brost wrote:
> Implement GuC virtual engines. Rather simple implementation, basically
> just allocate an engine, setup context enter / exit function to virtual
> engine specific functions, set all other variables / functions to guc
> versions, and set the engine mask to that of all the siblings.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  19 +-
>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |   1 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  10 +
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  45 +++-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  14 +
>   .../drm/i915/gt/intel_execlists_submission.c  | 186 +++++++------
>   .../drm/i915/gt/intel_execlists_submission.h  |  11 -
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |  20 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 253 +++++++++++++++++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   2 +
>   10 files changed, 429 insertions(+), 132 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 5c07e6abf16a..8a9293e0ca92 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -72,7 +72,6 @@
>   #include "gt/intel_context_param.h"
>   #include "gt/intel_engine_heartbeat.h"
>   #include "gt/intel_engine_user.h"
> -#include "gt/intel_execlists_submission.h" /* virtual_engine */
>   #include "gt/intel_gpu_commands.h"
>   #include "gt/intel_ring.h"
>   
> @@ -1568,9 +1567,6 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>   	if (!HAS_EXECLISTS(i915))
>   		return -ENODEV;
>   
> -	if (intel_uc_uses_guc_submission(&i915->gt.uc))
> -		return -ENODEV; /* not implement yet */
> -
>   	if (get_user(idx, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -1627,7 +1623,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>   		}
>   	}
>   
> -	ce = intel_execlists_create_virtual(siblings, n);
> +	ce = intel_engine_create_virtual(siblings, n);
>   	if (IS_ERR(ce)) {
>   		err = PTR_ERR(ce);
>   		goto out_siblings;
> @@ -1723,13 +1719,9 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
>   		 * A non-virtual engine has no siblings to choose between; and
>   		 * a submit fence will always be directed to the one engine.
>   		 */
> -		if (intel_engine_is_virtual(virtual)) {
> -			err = intel_virtual_engine_attach_bond(virtual,
> -							       master,
> -							       bond);
> -			if (err)
> -				return err;
> -		}
> +		err = intel_engine_attach_bond(virtual, master, bond);
> +		if (err)
> +			return err;
>   	}
>   
>   	return 0;
> @@ -2116,8 +2108,7 @@ static int clone_engines(struct i915_gem_context *dst,
>   		 * the virtual engine instead.
>   		 */
>   		if (intel_engine_is_virtual(engine))
> -			clone->engines[n] =
> -				intel_execlists_clone_virtual(engine);
> +			clone->engines[n] = intel_engine_clone_virtual(engine);
>   		else
>   			clone->engines[n] = intel_context_create(engine);
>   		if (IS_ERR_OR_NULL(clone->engines[n])) {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index b5c908f3f4f2..ba772762f7b9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -10,6 +10,7 @@
>   #include "i915_gem_context_types.h"
>   
>   #include "gt/intel_context.h"
> +#include "gt/intel_engine.h"
>   
>   #include "i915_drv.h"
>   #include "i915_gem.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e7af6a2368f8..6945963a31ba 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -47,6 +47,16 @@ struct intel_context_ops {
>   
>   	void (*reset)(struct intel_context *ce);
>   	void (*destroy)(struct kref *kref);
> +
> +	/* virtual engine/context interface */
> +	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
> +						unsigned int count);
> +	struct intel_context *(*clone_virtual)(struct intel_engine_cs *engine);
> +	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
> +					       unsigned int sibling);
> +	int (*attach_bond)(struct intel_engine_cs *engine,
> +			   const struct intel_engine_cs *master,
> +			   const struct intel_engine_cs *sibling);

Cloning and bonding for VE have been removed, so can be dropped. I'll 
skip reviewing all the related code in this patch.

>   };
>   
>   struct intel_context {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index f911c1224ab2..923eaee627b3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -273,13 +273,56 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>   	return intel_engine_has_preemption(engine);
>   }
>   
> +struct intel_context *
> +intel_engine_create_virtual(struct intel_engine_cs **siblings,
> +			    unsigned int count);
> +
> +static inline bool
> +intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> +{
> +	if (intel_engine_uses_guc(engine))
> +		return intel_guc_virtual_engine_has_heartbeat(engine);
> +	else
> +		GEM_BUG_ON("Only should be called in GuC submission");
> +
> +	return false;
> +}

This could use a better explanation. Maybe something like:

static inline bool
intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
{
	/*
	 * For non-GuC submission we expect the back-end to look at the
	 * heartbeat status of the actual physical engine that the work
	 * has been (or is being) scheduled on, so we should only reach
	 * here with GuC submission enabled.
  	 */
	GEM_BUG_ON(!intel_engine_uses_guc(engine));

	return intel_guc_virtual_engine_has_heartbeat(engine);
}


> +
>   static inline bool
>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>   {
>   	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>   		return false;
>   
> -	return READ_ONCE(engine->props.heartbeat_interval_ms);
> +	if (intel_engine_is_virtual(engine))
> +		return intel_virtual_engine_has_heartbeat(engine);
> +	else
> +		return READ_ONCE(engine->props.heartbeat_interval_ms);
> +}
> +
> +static inline struct intel_context *
> +intel_engine_clone_virtual(struct intel_engine_cs *src)
> +{
> +	GEM_BUG_ON(!intel_engine_is_virtual(src));
> +	return src->cops->clone_virtual(src);
> +}
> +
> +static inline int
> +intel_engine_attach_bond(struct intel_engine_cs *engine,
> +			 const struct intel_engine_cs *master,
> +			 const struct intel_engine_cs *sibling)
> +{
> +	if (!engine->cops->attach_bond)
> +		return 0;
> +
> +	return engine->cops->attach_bond(engine, master, sibling);
> +}
> +
> +static inline struct intel_engine_cs *
> +intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> +{
> +	GEM_BUG_ON(!intel_engine_is_virtual(engine));
> +	return engine->cops->get_sibling(engine, sibling);
>   }
>   
>   #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 88694822716a..d13b1716c29e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1736,6 +1736,20 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   	return total;
>   }
>   
> +struct intel_context *
> +intel_engine_create_virtual(struct intel_engine_cs **siblings,
> +			    unsigned int count)
> +{
> +	if (count == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (count == 1)
> +		return intel_context_create(siblings[0]);
> +
> +	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
> +	return siblings[0]->cops->create_virtual(siblings, count);
> +}
> +
>   static bool match_ring(struct i915_request *rq)
>   {
>   	u32 ring = ENGINE_READ(rq->engine, RING_START);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index cdb2126a159a..bd4ced794ff9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -205,6 +205,9 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>   	return container_of(engine, struct virtual_engine, base);
>   }
>   
> +static struct intel_context *
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +
>   static struct i915_request *
>   __active_request(const struct intel_timeline * const tl,
>   		 struct i915_request *rq,
> @@ -2560,6 +2563,8 @@ static const struct intel_context_ops execlists_context_ops = {
>   
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
> +
> +	.create_virtual = execlists_create_virtual,
>   };
>   
>   static int emit_pdps(struct i915_request *rq)
> @@ -3506,6 +3511,94 @@ static void virtual_context_exit(struct intel_context *ce)
>   		intel_engine_pm_put(ve->siblings[n]);
>   }
>   
> +static struct intel_engine_cs *
> +virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> +{
> +	struct virtual_engine *ve = to_virtual_engine(engine);
> +
> +	if (sibling >= ve->num_siblings)
> +		return NULL;
> +
> +	return ve->siblings[sibling];
> +}
> +
> +static struct intel_context *
> +virtual_clone(struct intel_engine_cs *src)
> +{
> +	struct virtual_engine *se = to_virtual_engine(src);
> +	struct intel_context *dst;
> +
> +	dst = execlists_create_virtual(se->siblings, se->num_siblings);
> +	if (IS_ERR(dst))
> +		return dst;
> +
> +	if (se->num_bonds) {
> +		struct virtual_engine *de = to_virtual_engine(dst->engine);
> +
> +		de->bonds = kmemdup(se->bonds,
> +				    sizeof(*se->bonds) * se->num_bonds,
> +				    GFP_KERNEL);
> +		if (!de->bonds) {
> +			intel_context_put(dst);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
> +		de->num_bonds = se->num_bonds;
> +	}
> +
> +	return dst;
> +}
> +
> +static struct ve_bond *
> +virtual_find_bond(struct virtual_engine *ve,
> +		  const struct intel_engine_cs *master)
> +{
> +	int i;
> +
> +	for (i = 0; i < ve->num_bonds; i++) {
> +		if (ve->bonds[i].master == master)
> +			return &ve->bonds[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int virtual_attach_bond(struct intel_engine_cs *engine,
> +			       const struct intel_engine_cs *master,
> +			       const struct intel_engine_cs *sibling)
> +{
> +	struct virtual_engine *ve = to_virtual_engine(engine);
> +	struct ve_bond *bond;
> +	int n;
> +
> +	/* Sanity check the sibling is part of the virtual engine */
> +	for (n = 0; n < ve->num_siblings; n++)
> +		if (sibling == ve->siblings[n])
> +			break;
> +	if (n == ve->num_siblings)
> +		return -EINVAL;
> +
> +	bond = virtual_find_bond(ve, master);
> +	if (bond) {
> +		bond->sibling_mask |= sibling->mask;
> +		return 0;
> +	}
> +
> +	bond = krealloc(ve->bonds,
> +			sizeof(*bond) * (ve->num_bonds + 1),
> +			GFP_KERNEL);
> +	if (!bond)
> +		return -ENOMEM;
> +
> +	bond[ve->num_bonds].master = master;
> +	bond[ve->num_bonds].sibling_mask = sibling->mask;
> +
> +	ve->bonds = bond;
> +	ve->num_bonds++;
> +
> +	return 0;
> +}
> +
>   static const struct intel_context_ops virtual_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -3520,6 +3613,10 @@ static const struct intel_context_ops virtual_context_ops = {
>   	.exit = virtual_context_exit,
>   
>   	.destroy = virtual_context_destroy,
> +
> +	.clone_virtual = virtual_clone,
> +	.get_sibling = virtual_get_sibling,
> +	.attach_bond = virtual_attach_bond,
>   };
>   
>   static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
> @@ -3668,20 +3765,6 @@ static void virtual_submit_request(struct i915_request *rq)
>   	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
>   }
>   
> -static struct ve_bond *
> -virtual_find_bond(struct virtual_engine *ve,
> -		  const struct intel_engine_cs *master)
> -{
> -	int i;
> -
> -	for (i = 0; i < ve->num_bonds; i++) {
> -		if (ve->bonds[i].master == master)
> -			return &ve->bonds[i];
> -	}
> -
> -	return NULL;
> -}
> -
>   static void
>   virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
>   {
> @@ -3704,20 +3787,13 @@ virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
>   	to_request(signal)->execution_mask &= ~allowed;
>   }
>   
> -struct intel_context *
> -intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> -			       unsigned int count)
> +static struct intel_context *
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   {
>   	struct virtual_engine *ve;
>   	unsigned int n;
>   	int err;
>   
> -	if (count == 0)
> -		return ERR_PTR(-EINVAL);
> -
> -	if (count == 1)
> -		return intel_context_create(siblings[0]);
> -
>   	ve = kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
>   	if (!ve)
>   		return ERR_PTR(-ENOMEM);
> @@ -3850,70 +3926,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
>   	return ERR_PTR(err);
>   }
>   
> -struct intel_context *
> -intel_execlists_clone_virtual(struct intel_engine_cs *src)
> -{
> -	struct virtual_engine *se = to_virtual_engine(src);
> -	struct intel_context *dst;
> -
> -	dst = intel_execlists_create_virtual(se->siblings,
> -					     se->num_siblings);
> -	if (IS_ERR(dst))
> -		return dst;
> -
> -	if (se->num_bonds) {
> -		struct virtual_engine *de = to_virtual_engine(dst->engine);
> -
> -		de->bonds = kmemdup(se->bonds,
> -				    sizeof(*se->bonds) * se->num_bonds,
> -				    GFP_KERNEL);
> -		if (!de->bonds) {
> -			intel_context_put(dst);
> -			return ERR_PTR(-ENOMEM);
> -		}
> -
> -		de->num_bonds = se->num_bonds;
> -	}
> -
> -	return dst;
> -}
> -
> -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> -				     const struct intel_engine_cs *master,
> -				     const struct intel_engine_cs *sibling)
> -{
> -	struct virtual_engine *ve = to_virtual_engine(engine);
> -	struct ve_bond *bond;
> -	int n;
> -
> -	/* Sanity check the sibling is part of the virtual engine */
> -	for (n = 0; n < ve->num_siblings; n++)
> -		if (sibling == ve->siblings[n])
> -			break;
> -	if (n == ve->num_siblings)
> -		return -EINVAL;
> -
> -	bond = virtual_find_bond(ve, master);
> -	if (bond) {
> -		bond->sibling_mask |= sibling->mask;
> -		return 0;
> -	}
> -
> -	bond = krealloc(ve->bonds,
> -			sizeof(*bond) * (ve->num_bonds + 1),
> -			GFP_KERNEL);
> -	if (!bond)
> -		return -ENOMEM;
> -
> -	bond[ve->num_bonds].master = master;
> -	bond[ve->num_bonds].sibling_mask = sibling->mask;
> -
> -	ve->bonds = bond;
> -	ve->num_bonds++;
> -
> -	return 0;
> -}
> -
>   void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   				   struct drm_printer *m,
>   				   void (*show_request)(struct drm_printer *m,
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index 4ca9b475e252..74041b1994af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -32,15 +32,4 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   							int indent),
>   				   unsigned int max);
>   
> -struct intel_context *
> -intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> -			       unsigned int count);
> -
> -struct intel_context *
> -intel_execlists_clone_virtual(struct intel_engine_cs *src);
> -
> -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> -				     const struct intel_engine_cs *master,
> -				     const struct intel_engine_cs *sibling);
> -
>   #endif /* __INTEL_EXECLISTS_SUBMISSION_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 08896ae027d5..88aac9977e09 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -3727,7 +3727,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>   	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>   
>   	for (n = 0; n < nctx; n++) {
> -		ve[n] = intel_execlists_create_virtual(siblings, nsibling);
> +		ve[n] = intel_engine_create_virtual(siblings, nsibling);
>   		if (IS_ERR(ve[n])) {
>   			err = PTR_ERR(ve[n]);
>   			nctx = n;
> @@ -3923,7 +3923,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>   	 * restrict it to our desired engine within the virtual engine.
>   	 */
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_close;
> @@ -4054,7 +4054,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>   		i915_request_add(rq);
>   	}
>   
> -	ce = intel_execlists_create_virtual(siblings, nsibling);
> +	ce = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ce)) {
>   		err = PTR_ERR(ce);
>   		goto out;
> @@ -4106,7 +4106,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>   
>   	/* XXX We do not handle oversubscription and fairness with normal rq */
>   	for (n = 0; n < nsibling; n++) {
> -		ce = intel_execlists_create_virtual(siblings, nsibling);
> +		ce = intel_engine_create_virtual(siblings, nsibling);
>   		if (IS_ERR(ce)) {
>   			err = PTR_ERR(ce);
>   			goto out;
> @@ -4208,7 +4208,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>   	if (err)
>   		goto out_scratch;
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_scratch;
> @@ -4431,16 +4431,16 @@ static int bond_virtual_engine(struct intel_gt *gt,
>   		for (n = 0; n < nsibling; n++) {
>   			struct intel_context *ve;
>   
> -			ve = intel_execlists_create_virtual(siblings, nsibling);
> +			ve = intel_engine_create_virtual(siblings, nsibling);
>   			if (IS_ERR(ve)) {
>   				err = PTR_ERR(ve);
>   				onstack_fence_fini(&fence);
>   				goto out;
>   			}
>   
> -			err = intel_virtual_engine_attach_bond(ve->engine,
> -							       master,
> -							       siblings[n]);
> +			err = intel_engine_attach_bond(ve->engine,
> +						       master,
> +						       siblings[n]);
>   			if (err) {
>   				intel_context_put(ve);
>   				onstack_fence_fini(&fence);
> @@ -4576,7 +4576,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>   	if (igt_spinner_init(&spin, gt))
>   		return -ENOMEM;
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_spin;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d605af0d66e6..ccbcf024b31b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -60,6 +60,15 @@
>    *
>    */
>   
> +/* GuC Virtual Engine */
> +struct guc_virtual_engine {
> +	struct intel_engine_cs base;
> +	struct intel_context context;
> +};
> +
> +static struct intel_context *
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
>   /*
> @@ -928,20 +937,35 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
>   	return ret;
>   }
>   
> -static int guc_context_pre_pin(struct intel_context *ce,
> -			       struct i915_gem_ww_ctx *ww,
> -			       void **vaddr)
> +static int __guc_context_pre_pin(struct intel_context *ce,
> +				 struct intel_engine_cs *engine,
> +				 struct i915_gem_ww_ctx *ww,
> +				 void **vaddr)
>   {
> -	return lrc_pre_pin(ce, ce->engine, ww, vaddr);
> +	return lrc_pre_pin(ce, engine, ww, vaddr);
>   }
>   
> -static int guc_context_pin(struct intel_context *ce, void *vaddr)
> +static int __guc_context_pin(struct intel_context *ce,
> +			     struct intel_engine_cs *engine,
> +			     void *vaddr)
>   {
>   	if (i915_ggtt_offset(ce->state) !=
>   	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
>   		set_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
>   
> -	return lrc_pin(ce, ce->engine, vaddr);
> +	return lrc_pin(ce, engine, vaddr);
> +}
> +
> +static int guc_context_pre_pin(struct intel_context *ce,
> +			       struct i915_gem_ww_ctx *ww,
> +			       void **vaddr)
> +{
> +	return __guc_context_pre_pin(ce, ce->engine, ww, vaddr);
> +}
> +
> +static int guc_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	return __guc_context_pin(ce, ce->engine, vaddr);
>   }
>   
>   static void guc_context_unpin(struct intel_context *ce)
> @@ -1041,6 +1065,21 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	deregister_context(ce, ce->guc_id);
>   }
>   
> +static void __guc_context_destroy(struct intel_context *ce)
> +{
> +	lrc_fini(ce);
> +	intel_context_fini(ce);
> +
> +	if (intel_engine_is_virtual(ce->engine)) {
> +		struct guc_virtual_engine *ve =
> +			container_of(ce, typeof(*ve), context);
> +
> +		kfree(ve);
> +	} else {
> +		intel_context_free(ce);
> +	}
> +}
> +
>   static void guc_context_destroy(struct kref *kref)
>   {
>   	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> @@ -1057,7 +1096,7 @@ static void guc_context_destroy(struct kref *kref)
>   	if (context_guc_id_invalid(ce) ||
>   	    !lrc_desc_registered(guc, ce->guc_id)) {
>   		release_guc_id(guc, ce);
> -		lrc_destroy(kref);

AFAICS after this patch we only have 1 use of lrc_destroy inside the 
execlists file, while we do have 2 open coded implementations (here and 
execlists VE). Since lrc_fini and intel_context_fini are still always 
called as a pair, maybe we can replace lrc_destroy with a function that 
calls those 2 (i.e basically just remove the free() from lrc_destroy)? 
Can be done as a follow up.

> +		__guc_context_destroy(ce);
>   		return;
>   	}
>   
> @@ -1073,7 +1112,7 @@ static void guc_context_destroy(struct kref *kref)
>   	if (context_guc_id_invalid(ce)) {
>   		__release_guc_id(guc, ce);
>   		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> -		lrc_destroy(kref);
> +		__guc_context_destroy(ce);
>   		return;
>   	}
>   
> @@ -1118,6 +1157,8 @@ static const struct intel_context_ops guc_context_ops = {
>   
>   	.reset = lrc_reset,
>   	.destroy = guc_context_destroy,
> +
> +	.create_virtual = guc_create_virtual,
>   };
>   
>   static void __guc_signal_context_fence(struct intel_context *ce)
> @@ -1246,6 +1287,96 @@ static int guc_request_alloc(struct i915_request *rq)
>   	return 0;
>   }
>   
> +static struct intel_engine_cs *
> +guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +	unsigned int num_siblings = 0;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (num_siblings++ == sibling)
> +			return engine;
> +
> +	return NULL;
> +}
> +
> +static int guc_virtual_context_pre_pin(struct intel_context *ce,
> +				       struct i915_gem_ww_ctx *ww,
> +				       void **vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return __guc_context_pre_pin(ce, engine, ww, vaddr);
> +}
> +
> +static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return __guc_context_pin(ce, engine, vaddr);
> +}
> +
> +static void guc_virtual_context_enter(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_get(engine);
> +
> +	intel_timeline_enter(ce->timeline);
> +}
> +
> +static void guc_virtual_context_exit(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_put(engine);
> +
> +	intel_timeline_exit(ce->timeline);
> +}
> +
> +static int guc_virtual_context_alloc(struct intel_context *ce)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return lrc_alloc(ce, engine);
> +}
> +
> +static struct intel_context *guc_clone_virtual(struct intel_engine_cs *src)
> +{
> +	struct intel_engine_cs *siblings[GUC_MAX_INSTANCES_PER_CLASS], *engine;
> +	intel_engine_mask_t tmp, mask = src->mask;
> +	unsigned int num_siblings = 0;
> +
> +	for_each_engine_masked(engine, src->gt, mask, tmp)
> +		siblings[num_siblings++] = engine;
> +
> +	return guc_create_virtual(siblings, num_siblings);
> +}
> +
> +static const struct intel_context_ops virtual_guc_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_virtual_context_pre_pin,
> +	.pin = guc_virtual_context_pin,
> +	.unpin = guc_context_unpin,
> +	.post_unpin = guc_context_post_unpin,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.sched_disable = guc_context_sched_disable,
> +
> +	.destroy = guc_context_destroy,
> +
> +	.clone_virtual = guc_clone_virtual,
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>   {
>   	struct intel_timeline *tl;
> @@ -1557,7 +1688,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
>   		release_guc_id(guc, ce);
> -		lrc_destroy(&ce->ref);
> +		__guc_context_destroy(ce);
>   	}
>   
>   	decr_outstanding_submission_g2h(guc);
> @@ -1669,3 +1800,107 @@ void intel_guc_log_context_info(struct intel_guc *guc,
>   			   atomic_read(&ce->guc_sched_state_no_lock));
>   	}
>   }
> +
> +static struct intel_context *
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +{
> +	struct guc_virtual_engine *ve;
> +	struct intel_guc *guc;
> +	unsigned int n;
> +	int err;
> +
> +	ve = kzalloc(sizeof(*ve), GFP_KERNEL);
> +	if (!ve)
> +		return ERR_PTR(-ENOMEM);
> +
> +	guc = &siblings[0]->gt->uc.guc;
> +
> +	ve->base.i915 = siblings[0]->i915;
> +	ve->base.gt = siblings[0]->gt;
> +	ve->base.uncore = siblings[0]->uncore;
> +	ve->base.id = -1;
> +
> +	ve->base.uabi_class = I915_ENGINE_CLASS_INVALID;
> +	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
> +	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
> +	ve->base.saturated = ALL_ENGINES;

Most of these settings are the same for both execlists and GuC and 
aren't back-end dependent. Maybe we can have a:

intel_virtual_engine_init_early(struct intel_engine_cs *engine,
                                 struct intel_engine_cs *sibling);

And call that from both places? Can be done as a follow-up

> +	ve->base.breadcrumbs = intel_breadcrumbs_create(&ve->base);
> +	if (!ve->base.breadcrumbs) {
> +		kfree(ve);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
> +
> +	ve->base.sched_engine = i915_sched_engine_get(guc->sched_engine);
> +
> +	ve->base.cops = &virtual_guc_context_ops;
> +	ve->base.request_alloc = guc_request_alloc;
> +
> +	ve->base.submit_request = guc_submit_request;
> +
> +	ve->base.flags = I915_ENGINE_IS_VIRTUAL;
> +
> +	intel_context_init(&ve->context, &ve->base);
> +
> +	for (n = 0; n < count; n++) {
> +		struct intel_engine_cs *sibling = siblings[n];
> +
> +		GEM_BUG_ON(!is_power_of_2(sibling->mask));
> +		if (sibling->mask & ve->base.mask) {
> +			DRM_DEBUG("duplicate %s entry in load balancer\n",
> +				  sibling->name);
> +			err = -EINVAL;
> +			goto err_put;
> +		}
> +
> +		ve->base.mask |= sibling->mask;
> +
> +		if (n != 0 && ve->base.class != sibling->class) {
> +			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> +				  sibling->class, ve->base.class);
> +			err = -EINVAL;
> +			goto err_put;
> +		} else if (n == 0) {
> +			ve->base.class = sibling->class;
> +			ve->base.uabi_class = sibling->uabi_class;
> +			snprintf(ve->base.name, sizeof(ve->base.name),
> +				 "v%dx%d", ve->base.class, count);
> +			ve->base.context_size = sibling->context_size;
> +
> +			ve->base.emit_bb_start = sibling->emit_bb_start;
> +			ve->base.emit_flush = sibling->emit_flush;
> +			ve->base.emit_init_breadcrumb =
> +				sibling->emit_init_breadcrumb;
> +			ve->base.emit_fini_breadcrumb =
> +				sibling->emit_fini_breadcrumb;
> +			ve->base.emit_fini_breadcrumb_dw =
> +				sibling->emit_fini_breadcrumb_dw;
> +
> +			ve->base.flags |= sibling->flags;
> +

Same here, most of these setting from the sibling are the same. 
intel_virtual_engine_inherit_from_sibling()?

Apart from the various nits the code LGTM, but I'll wait until the next 
spin for an r-b since a good chunk of the patch is going away.

Daniele

> +			ve->base.props.timeslice_duration_ms =
> +				sibling->props.timeslice_duration_ms;
> +		}
> +	}
> +
> +	return &ve->context;
> +
> +err_put:
> +	intel_context_put(&ve->context);
> +	return ERR_PTR(err);
> +}
> +
> +
> +
> +bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (READ_ONCE(engine->props.heartbeat_interval_ms))
> +			return true;
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 6453e2bfa151..95df5ab06031 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -25,6 +25,8 @@ void intel_guc_log_submission_info(struct intel_guc *guc,
>   				   struct drm_printer *p);
>   void intel_guc_log_context_info(struct intel_guc *guc, struct drm_printer *p);
>   
> +bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
> +
>   static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>   {
>   	/* XXX: GuC submission is unavailable for now */

