Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF73D1AF8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 02:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2C96EB0F;
	Thu, 22 Jul 2021 00:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27C16E93C;
 Thu, 22 Jul 2021 00:56:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="191817872"
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="191817872"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 17:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="470347933"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2021 17:56:21 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 17:56:21 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 17:56:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 21 Jul 2021 17:56:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 21 Jul 2021 17:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFce2NGDqtnU8vKJ0aDTMz/knMpAocoK1SXoY2X1u7iOZxzI5woL0whUGa0LDA3DsKY1dlBy/CJVyZcTAICfdDjF1F3UqoK8NH787VY2ZsEyqD6o3RQYF8cqejUJFwae8j8MwNPVyFQqt8Z+QAPjPMyXO8S30SwisKdsvyzh11u+fmkj1uNl73nCtdIyq3qEeDxu73Ke9NrtE5LU83lXYpZ7LMUKZnc+K3t0cpdJ7kruObEcnKbMZe8r6aLOPh8kZkf5Ww0i24VQQEzStNH2jSF2WePD78lFbSwU2S5Ht7Rh78TA4zgQgDpOY7J+9hGQ9p9HuwR+VYprPvb7rAueEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgYH4V5yTtZF/L2ZsZz0tGs4kVCngctoTaA5NyhXGP4=;
 b=iV6mbIVRrhKcYeJ7vaGihpmfjfj6yAAa8qVmPFDR3v1gfvAuAksnjqYdo5x0hm7VHcV61h7Btha0oX737DhRmdIDrcVd9oV2ApUR2aTqttSWcu7JORyb/VO5JMso7zoN4WZjNjkuFO6cKjuC21jRFNoKIlCkT3qu3yijsD7BjrkcR0dHfjAqM68IVZmWoMXjmITCTIuE153AOP1MaD1kyvJbxR6SSlxhScKNAE/K4pDEa4QW0V0WjYMvwLzep+bsnozVHCC01D3VUXEPDNLIjyv2/XuXNmlSA6pCK4RPPRZ/0FHRJJmmSogBOdqsuwe4nlG0+2Qze0G5gbHwOdX4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgYH4V5yTtZF/L2ZsZz0tGs4kVCngctoTaA5NyhXGP4=;
 b=dPbv54IBBSCm2km7o0dEpowXkYLFDzTHH8651gPiP2IMQf2DZUfn19eLkcMJGU4CBvgK+VB6CQixU4MGIo6ZEitGuRTHvcqP4BJ/2U00RP3hw4qp5lf5DVH1PqJLMB6UybVRBRNAlFrmPL+AuEXiyjW71rFxEx3tE2eGKyDYM5A=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Thu, 22 Jul
 2021 00:56:19 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 00:56:19 +0000
Subject: Re: [PATCH 02/14] drm/i915/guc/slpc: Initial definitions for SLPC
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-3-vinay.belgaumkar@intel.com>
 <039a95d3-c44c-bab7-0f53-75098a55acc6@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <132fceb9-4078-1823-451c-f18a2ceeb751@intel.com>
Date: Wed, 21 Jul 2021 17:56:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <039a95d3-c44c-bab7-0f53-75098a55acc6@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:300:c0::34) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR08CA0060.namprd08.prod.outlook.com (2603:10b6:300:c0::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 00:56:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 598e8c62-fa49-43ee-b77e-08d94cab8408
X-MS-TrafficTypeDiagnostic: CO6PR11MB5652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5652C9C2B657DEC34305525F85E49@CO6PR11MB5652.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kg6XYaNjx7Clb9dqElePsgtPvVXkshcMPsSmC24L3DCa3GHqUpNuLoIaM9+wMiP1+RIH+zJA5OghFGjFpr7vvRbadmtMGUFEx+STeuag4ElQ5Grdik/u9Xk2Wa+q29Ox3yYVjo6WbiJaQrGjKLxoMZgK1b/Gv//rZHFOMz9b8YYQ4EHMQgxwiC6cyci8+tIVHV5Q0zIgQcJ2vo/QOMuCS1kcl/iA2wUmYCRjlPR6bQFq5Zt3ifzalRyUALdsJxSg8utemnHfJWhsCRdqgJVO8bls1U5d/cZGZX4C0mykuSLx2GrQOLbogsNQjHm4EuWYneR//mBO4j9+gitauHTffUS0y1SKh8SIYkt3DjNCPHQkVJjuJnQ4qZos2Da1LSejoaBrt1h36PxtYf8+Wng8DBcmQzwpZlRNeyr2a08II+1/Mx553o41yoYC0ZGKdzeag7V/Qcmwi2vZtclN3LbCM1oPea7J4supTSAQEOEv58a0JjLchugCI2prclnTDVHixb+M8PmcYgZx/YjhFKV4gQyyvTkIfZWP7O2/O/nvMgH8i1ZM+whFbx0sYG8LGW8TcDEnY14C7VpsmFloEgFlIWFkm3eBq+0sWLd2qsr23qqQvJDh4ktDWAEHeEl+OL6Z55SF9Uu46mBjRXpAI76w/YAIDPuP99IpR/FRlwc8gLvWfR/1zqqasu6nNhRra/iqi1ljKQbrw0oaBai9s5ncZiuRzTh6vQFvIczMr8mrERnOWIW5bxt6WsvZZyccn8LL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(316002)(26005)(4326008)(186003)(450100002)(66476007)(956004)(31686004)(31696002)(66556008)(86362001)(2906002)(107886003)(66946007)(478600001)(5660300002)(16576012)(8936002)(2616005)(53546011)(6486002)(36756003)(83380400001)(8676002)(38100700002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxUbTZydDc2TC9mQ1hINk5mMVZCUXlYK3RRQm5ncFlYVGdDUDNkSitRajdn?=
 =?utf-8?B?a3JyNWJVRFhhVU94Ulk1VFV6U09UcmVkajZJUkRPYmFpVHVhL0RnV1dUdnh4?=
 =?utf-8?B?dE9oYk1wSUJaNVVyNkd3WGNHRExPSWNpU3RmeFBtZjV1U2MxTkUrem5MZVNB?=
 =?utf-8?B?a2xheFNsbnp2azBNTHhxQjNWaEFGUmtBYVdwcE9ud3VwNHg3ZXBmcWFDRU4v?=
 =?utf-8?B?U2hYMkZZbXpBNmpCMS9HYVFhU2tPYnV4bGVFL1lycy95Q0syeW13OHN0NkpS?=
 =?utf-8?B?Z1pZWFN2VE93aCtkQTgzbS8xbDZlQlBRbFZyVEdmOXcxZ3U0NVI5RTNha3FG?=
 =?utf-8?B?T0puNk9aMlRGVk5QTnpRSStsdS9Rd29ueGNXOHBvSElJSkZKb05sWHJ1LzNo?=
 =?utf-8?B?QnJJNHFwSTVkYjY2LzJyV1dqNGVpS0pBazUvd1p6eU9aRjFyN3o3bHc2ZFBG?=
 =?utf-8?B?K0VFNzBzVlk1RUpxWDZYU1ZzNXFpeHl2enRzYThyNXRNZXpCZ21DZ3EvQjRF?=
 =?utf-8?B?Q0FvU1A3Z0ZybnNTRk1ndHFCOUE1U3R1VXBlSWJ0VHFYZDUybmYraWEvQ0ZB?=
 =?utf-8?B?OEdWVkJwMHFFU3JnemtxWm9SZGEvdGJEd1h3OEQwTWFWTEpIQ3pPUnh2Q1c4?=
 =?utf-8?B?U1FsSEZmRUgzNzFDUkxSTWhEZDBURFdIbkRDbnlPdkVIeGkvU1NHT2xwV3Vh?=
 =?utf-8?B?elhuZ2EzTUpCYlBRb3JnYmpFakV3TEg5dXpFdXpJQTMyRXhIVHBWSUNnOXlQ?=
 =?utf-8?B?ZDZVNzRKalhLOW9DMnFOUDdWa2ZDVzdWdWJPajdxajJRYVhkN3QyK2J5OUhR?=
 =?utf-8?B?Y25EZzI1WjBmd2w0YTdHaUtvd3JyVXNOakdBNUsrZS82a3lFWEtzSWpuYlVH?=
 =?utf-8?B?allYNUxFZ2h3VCtLVXR0bjZyREhxSjRjNjA3K1h5SU1LZnowb2ZYUkgwQkJk?=
 =?utf-8?B?RVV0bkgzYWtnQWMveFdiM0tOT29FYmtRK0hXemMrYWprMjlFMmZWREMwSUNt?=
 =?utf-8?B?V0txNDlJWGJjRkdibmY1RWMyMW95NXBsUTNMUTNGYldLclVxVGJZNUlaRUV3?=
 =?utf-8?B?MzZybkExMDVOdGwwb0FDWENxUVQ1U2lDbi9ramFRaDl1SmtoV3RubXBSYm5u?=
 =?utf-8?B?REZBTmFuU09yWHBlZFRMdmZzVXZyUkdDRnE4U1RYRmEvUDB0VW1DMVh4RGw3?=
 =?utf-8?B?RDBRVS8xMXp4dmU1UWIwR0dQTk14bEVScnhwTTBmaXhOVTZ2cjhwckZLdlVT?=
 =?utf-8?B?dkVCdVo0Ym1rNmg3NnJpWHJXUTBjbk5salo2QUltb1dweUpTZURHOEd1Lzk3?=
 =?utf-8?B?cTR6cTRNMEhwYlJ4YmNjMk1hS1VqQXYxK0orTDZKdUphNDIrQUIyaDFyamZi?=
 =?utf-8?B?cG5aa3h4dEo1N1ByLzNScENzRDFNMHhUUFJiU2oyYVpkcTE4Mm1tZGdnNlFw?=
 =?utf-8?B?UmUyR2FoUExYNGM5WDV6MUNiZzNleHBiWURKeWdjTWppU1RrMGZzOXV3alJU?=
 =?utf-8?B?d3paN2Y1cmFiZ0phUGFNTTBTZFgxb3FGYkowWFlGa1BlZHBzUjR1dEFuTzJr?=
 =?utf-8?B?UWg1NGFyaVRtUDh1bDluVE1GcmRaSUt5bHY1YW5XTmRoTEx4bElFODVtNUov?=
 =?utf-8?B?eENISnBKNXJvdGVtdU5KbnluM1ZKWTdkL1cyMy9hUWp1R1hnVENKMzlHWHpV?=
 =?utf-8?B?TzlrYksrUlZNVkxTT3grMlNlUlc5enFPUnpZc2lJTlQySFljRkR5QW91YlBn?=
 =?utf-8?Q?+83WJ+Udte1lee/viT5KmOqih4eJ87eOO1mVYHM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 598e8c62-fa49-43ee-b77e-08d94cab8408
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 00:56:18.9103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcwsFaJ/ymZFjHPxr4abLfWn69+Ut07ss31fE0LeWWsilrIMumHfVoQtMy9xDA3tWh5xerSTSqOFTkpQWRs4Zsut1gLatqJWgyWYGw84gvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Sundaresan
 Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 10:24 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Add macros to check for SLPC support. This feature is currently supported
>> for Gen12+ and enabled whenever GuC submission is enabled/selected.
>>
>> Include templates for SLPC init/fini and enable.
>>
>> v2: Move SLPC helper functions to intel_guc_slpc.c/.h. Define basic
>> template for SLPC structure in intel_guc_slpc_types.h. Fix copyright (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> drm/i915/guc/slpc: Lay out slpc init/enable/fini
>>
>> Declare init/fini and enable function templates.
>>
>> v2: Rebase
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 63 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   | 33 ++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h | 15 +++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
>>   8 files changed, 124 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index ab7679957623..d8eac4468df9 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_guc_fw.o \
>>   	  gt/uc/intel_guc_log.o \
>>   	  gt/uc/intel_guc_log_debugfs.o \
>> +	  gt/uc/intel_guc_slpc.o \
>>   	  gt/uc/intel_guc_submission.o \
>>   	  gt/uc/intel_huc.o \
>>   	  gt/uc/intel_huc_debugfs.o \
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 979128e28372..39bc3c16057b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -7,6 +7,7 @@
>>   #include "gt/intel_gt_irq.h"
>>   #include "gt/intel_gt_pm_irq.h"
>>   #include "intel_guc.h"
>> +#include "intel_guc_slpc.h"
>>   #include "intel_guc_ads.h"
>>   #include "intel_guc_submission.h"
>>   #include "i915_drv.h"
>> @@ -157,6 +158,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>>   	intel_guc_ct_init_early(&guc->ct);
>>   	intel_guc_log_init_early(&guc->log);
>>   	intel_guc_submission_init_early(guc);
>> +	intel_guc_slpc_init_early(&guc->slpc);
>>   
>>   	mutex_init(&guc->send_mutex);
>>   	spin_lock_init(&guc->irq_lock);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 9c62c68fb132..8cecfad9d7b1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -15,6 +15,7 @@
>>   #include "intel_guc_ct.h"
>>   #include "intel_guc_log.h"
>>   #include "intel_guc_reg.h"
>> +#include "intel_guc_slpc_types.h"
>>   #include "intel_uc_fw.h"
>>   #include "i915_utils.h"
>>   #include "i915_vma.h"
>> @@ -30,6 +31,7 @@ struct intel_guc {
>>   	struct intel_uc_fw fw;
>>   	struct intel_guc_log log;
>>   	struct intel_guc_ct ct;
>> +	struct intel_guc_slpc slpc;
>>   
>>   	/* Global engine used to submit requests to GuC */
>>   	struct i915_sched_engine *sched_engine;
>> @@ -57,6 +59,8 @@ struct intel_guc {
>>   
>>   	bool submission_supported;
>>   	bool submission_selected;
>> +	bool slpc_supported;
>> +	bool slpc_selected;
>>   
>>   	struct i915_vma *ads_vma;
>>   	struct __guc_ads_blob *ads_blob;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> new file mode 100644
>> index 000000000000..d9feb430ce35
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include "i915_drv.h"
>> +#include "intel_guc_slpc.h"
>> +#include "gt/intel_gt.h"
>> +
>> +static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>> +{
>> +	return container_of(slpc, struct intel_guc, slpc);
>> +}
>> +
>> +static bool __detect_slpc_supported(struct intel_guc *guc)
>> +{
>> +	/* GuC SLPC is unavailable for pre-Gen12 */
>> +	return guc->submission_supported &&
>> +		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
>> +}
>> +
>> +static bool __guc_slpc_selected(struct intel_guc *guc)
>> +{
>> +	if (!intel_guc_slpc_is_supported(guc))
>> +		return false;
>> +
>> +	return guc->submission_selected;
>> +}
>> +
>> +void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	guc->slpc_supported = __detect_slpc_supported(guc);
>> +	guc->slpc_selected = __guc_slpc_selected(guc);
>> +}
>> +
>> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>> +{
>> +	return 0;
>> +}
>> +
>> +/*
>> + * intel_guc_slpc_enable() - Start SLPC
>> + * @slpc: pointer to intel_guc_slpc.
>> + *
>> + * SLPC is enabled by setting up the shared data structure and
>> + * sending reset event to GuC SLPC. Initial data is setup in
>> + * intel_guc_slpc_init. Here we send the reset event. We do
>> + * not currently need a slpc_disable since this is taken care
> 
> s/slpc/SLPC

ok.

> 
>> + * of automatically when a reset/suspend occurs and the GuC
>> + * CTB is destroyed.
> 
> quite large description of the empty function ;)
> better to add it together with actual body

Sure, will move to next patch that defines it fully.

> 
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>> +{
>> +	return 0;
>> +}
>> +
>> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>> +{
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> new file mode 100644
>> index 000000000000..c3b0ad7f0f93
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GUC_SLPC_H_
>> +#define _INTEL_GUC_SLPC_H_
>> +
>> +#include "intel_guc_submission.h"
>> +#include "intel_guc_slpc_types.h"
>> +
>> +static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>> +{
>> +	return guc->slpc_supported;
>> +}
>> +
>> +static inline bool intel_guc_slpc_is_wanted(struct intel_guc *guc)
>> +{
>> +	return guc->slpc_selected;
>> +}
>> +
>> +static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
>> +{
>> +	return intel_guc_submission_is_used(guc) && intel_guc_slpc_is_wanted(guc);
>> +}
>> +
>> +void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>> +
>> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> new file mode 100644
>> index 000000000000..b85148265b1f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GUC_SLPC_TYPES_H_
>> +#define _INTEL_GUC_SLPC_TYPES_H_
>> +
>> +#include <linux/types.h>
> 
> likely not needed at this point, add when needed
ok.
> 
>> +
>> +struct intel_guc_slpc {
>> +
> 
> no need to have this empty line
> 
Done.
Thanks,
Vinay.

> Thanks,
> Michal
> 
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index da57d18d9f6b..e6bd9406c7b2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -75,16 +75,18 @@ static void __confirm_options(struct intel_uc *uc)
>>   	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>   
>>   	drm_dbg(&i915->drm,
>> -		"enable_guc=%d (guc:%s submission:%s huc:%s)\n",
>> +		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
>>   		i915->params.enable_guc,
>>   		yesno(intel_uc_wants_guc(uc)),
>>   		yesno(intel_uc_wants_guc_submission(uc)),
>> -		yesno(intel_uc_wants_huc(uc)));
>> +		yesno(intel_uc_wants_huc(uc)),
>> +		yesno(intel_uc_wants_guc_slpc(uc)));
>>   
>>   	if (i915->params.enable_guc == 0) {
>>   		GEM_BUG_ON(intel_uc_wants_guc(uc));
>>   		GEM_BUG_ON(intel_uc_wants_guc_submission(uc));
>>   		GEM_BUG_ON(intel_uc_wants_huc(uc));
>> +		GEM_BUG_ON(intel_uc_wants_guc_slpc(uc));
>>   		return;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index e2da2b6e76e1..925a58ca6b94 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "intel_guc.h"
>>   #include "intel_guc_submission.h"
>> +#include "intel_guc_slpc.h"
>>   #include "intel_huc.h"
>>   #include "i915_params.h"
>>   
>> @@ -83,6 +84,7 @@ __uc_state_checker(x, func, uses, used)
>>   uc_state_checkers(guc, guc);
>>   uc_state_checkers(huc, huc);
>>   uc_state_checkers(guc, guc_submission);
>> +uc_state_checkers(guc, guc_slpc);
>>   
>>   #undef uc_state_checkers
>>   #undef __uc_state_checker
>>
> 
