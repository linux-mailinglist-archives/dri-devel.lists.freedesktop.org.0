Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C842E02C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9116E1DE;
	Thu, 14 Oct 2021 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D7F6E1D2;
 Thu, 14 Oct 2021 17:40:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="214680920"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="214680920"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="563987907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2021 10:15:39 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 10:15:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 10:15:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 10:15:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv+RU+KLxnH3rIVqekwjxwaePxCsHPglfL/3A2nI1D+BpNGyim8UjfgGsHBdrqiijsYFe20pNY92tsDQWyHI4p3l5WNGjiYhA8e2JL8arJ/0FPzdh1lGbTOXHmuuq3pvfWK8o7f59rkpqv9j+o4BXIihnmpIdAQKJyzdAoi6htOOPBXJFHC2IJ+2VLBOOxIRcjI0H5SM2wZGpSz5eVNyiaQeRSAzE5sqbMmujlPyskDMjKX3hx2siitXwN7C7E5xIRhPG08FQmXRyfBEdXF0kXwrm0ZErmHAV4C6PbnrJB4wEM3jvhVItW7Rt2Y30/F+KbrTDNVrhW2YBEfbqpsrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hPilEwUNSPsSrhe32ZpZL/8lQTSnqAx8dMEQQ5zlOE=;
 b=OfI9fAJIqc749V4sy9QEAxlisGUuOQAVQ6n9iINFS44e1K0iOaPYUMEiq73+5lTI2JYpUiSMwqEsFJ60LkQfnIfPJ6gjC2LDmJ8NsRRpX9Lqhk4k1sAm5z0v4Jv4UFwzIthkWyGTX9VteMWL3PZrSGs7mL6PDDyAR0A9cAawxWsMc4sNOnNoenV2XMWkn3uEyUXKUZerK9y+dlw8h/W9uPOQ/BRn/SSHDOElFrAcxqDMecnlhrgZdwVLLk8LinSts4nV7YkAWV5S5oCU96LKMyqV04H9igMEhrfFYJQncft1ePi83Y7N/4r7knSynh+9PGNc91pdFU9J+eKXHCFylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hPilEwUNSPsSrhe32ZpZL/8lQTSnqAx8dMEQQ5zlOE=;
 b=expcsgDK5vWQKwwRJO4C8x4DyACCYDkvRzy0bT+1jxEXnoy8kKWvyExyZI8cT6XR0+vzVRU/9+z3CHXeixL7rdv5cUKD+b5E+UHw1qnLgwwBY9GYu1E1oN5tq/o1fHbIpuEV20LxoAb53ux6cvfhyliYYcZPavg2LYp+8CLUaPs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 17:15:36 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 17:15:36 +0000
Subject: Re: [PATCH 16/25] drm/i915/guc: Connect UAPI to GuC multi-lrc
 interface
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-17-matthew.brost@intel.com>
 <83bd3cc3-e1c9-3d6b-f089-38edecf05ca8@intel.com>
 <20211014153259.GA9677@jons-linux-dev-box>
 <cc456737-aa1f-6219-a4ae-085ab85a1b2c@intel.com>
 <20211014164114.GA25379@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <09f2fe1d-32dd-25bc-c26d-a3a1cf7c4af7@intel.com>
Date: Thu, 14 Oct 2021 10:15:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211014164114.GA25379@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:104:5::32) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 CO2PR04CA0202.namprd04.prod.outlook.com (2603:10b6:104:5::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 17:15:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1dc0b30-3f1b-48a9-185c-08d98f363cfb
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5595F6A6C1ABA23FD8FF9DC1BDB89@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFYfkcZrjA0RsHfDV3pMErxARMZToyi9BCiEYlc+Y0TJTL8qCibd2S+JnYgG0X82vLGn7Jj5jxi3qGEYGsOR6GsLfnlJI98Q1aLqF9bjt386QEFXJR8W26tkkFq797CyyWydWLqgrj6k3z4eE+kDlDy2jmHK2OovsGtlIEnDzG13WG2iAy1l9GTMjlpj9QcGR56mtSZCqmFCeeoqhYYnPvQg9Og8+9d5lDo3SBYL12mLPzwyt5nxqGeHfIm4v7aCcHCmZijBLMAZmklBsJnvh/Eb8MH6QxBhVLEZP0J+xpWBDJ2FEO8tw2sjXD8D07WPN/bkYAG3Ef8CTKz4uICjJvB/TRdTIXJ+oHj2L8ZIzCkC29GrNnh2L1B1BXxvuHxkduHm4s7dGmEUM4J5hDOZnVDhK7h31BVrOXp7yUIz3bC+ng0z1trLaXqO13/2Y9qHxvZGdKeP8I44wW1FpnR/bgL3co/FUfE0f4v4RMPaDDIn/MJ+mRV13/F1gnpe0VaEFD0CsLErGURMT/uqmKwuF3ZQUswamNju/YxyWQs/QIJkKXUR8X5lkDp8as0l4iWGD564/Nasur3dqtH+Jdp5Gq3fxsZiau94EOOdrBczdgAtWbnNWdUjFDJLT2vdLZ1/wwfSyyF7i7wytUXT/fm1lCftEt8Tsz/4HrBskmh7IB6keXDdJOarM6kjZtZEt8am4xCodVAtc2uK78xUdXIkDEEoKnycti9brw4NYSdR5IPkgXAkgqbls6ji0i8LMLI321R2dBPKBJdFrPdArizb5kPt3OuQfj/S80D0S0lOpNckKvKUc+FU3Lf6kI0TNprLsWNQzZikpPZCi6YiPQIY25sgAfwyfOvDru5yalr8jRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(5660300002)(4326008)(26005)(53546011)(2616005)(31696002)(956004)(186003)(966005)(83380400001)(8676002)(37006003)(316002)(508600001)(6862004)(6636002)(8936002)(450100002)(30864003)(6666004)(36756003)(66556008)(16576012)(66946007)(82960400001)(86362001)(31686004)(66476007)(38100700002)(6486002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTEyKzFOeGJFWlIrUnNuY3AxWWM0MzR0OHJJUStqL05zVFFGdnpYdGhzdlZS?=
 =?utf-8?B?MHBXWXZXOUtKTWVSaVcvdURYYUUzZ0Zra1huSzVaSTBYMEQ5UTRrZm0wY0pB?=
 =?utf-8?B?REYyaVduR2VISE5NaTE3alQ1Mk5iNng0UFJkVjhGQnlXYUkyRittWmJoMlJt?=
 =?utf-8?B?NEVDZzU0a3VlanovVkoydjBoak5OaW5JaU5nWFZneGhVUjY5QXBvQkxzUHMy?=
 =?utf-8?B?UERTM2FrMlBlbC9GeFpyRGNrdTFDMnNkR0s4Z2ZieXRkZWdPNCticjkvaThs?=
 =?utf-8?B?Qk1rM0J3OVNxMGZ1a29IR2d5Y0xFVU5MOFRLMlh1SVlvSFllWUdWa3Y1dG5t?=
 =?utf-8?B?N3VVREVsWStuYU1oSEdKSjlCQXNhcytZdm5GbVVla3Evd3NkQ21RalFXN0My?=
 =?utf-8?B?RWtKZ2s0emVwWXBGdHJQVG9rbFlKTjlLcm01eUJRYjhCcm9XTHU4OEg3UUd2?=
 =?utf-8?B?akxzNmpxelRtUHF3SmRpTHBJTkUxUGtTRjdQa3pQNElsUVpRYXc2YmxsbGRN?=
 =?utf-8?B?MFBLcDZxNFRsZ1dWNEIwT2p5MjJkUGlZWDZJRGMwODhEYXk4MHJXL3ljcVNm?=
 =?utf-8?B?L1g3bk5PN2dqK0RuMGt3TU9ScVdrT285cUM3TWowNDdLVkRDWGhLcG1EVEFD?=
 =?utf-8?B?WFlDTkVERDZXa3RlRmExbUFMUFRwUnJUeHJ3Z0tMSGw5ZXd0dGFMMGJsaDJ3?=
 =?utf-8?B?d3BqOEg1T3MrMEQ1MFFZa3RkYVZ1WTdaaEFQOWpGSTZBbklRTXB2RDVqd0d4?=
 =?utf-8?B?TDd1RmczZEVFSStaR2FqT0RSZHFDZTdlaTNnTUJPdjgwZVpLaDNFSTdraE44?=
 =?utf-8?B?Qm14bkJTOGhadVAwOXlGUytBenZackNDdFFqOVJscWFSRTdBdUZ0V1h5N0d5?=
 =?utf-8?B?dEoyV2oyb2VvZmthUlgwdElJcXVtYjV0a0RxYkw3dkxKWHBqenl0eCtTQnFm?=
 =?utf-8?B?S3doenVndFhndnRFQnhIY3ptRFJrenZkVE1YZktsRXZrVStzUE13OXpEVitI?=
 =?utf-8?B?NFM4bW95emNzNVE1Z0trR2V4cm5TVXE0ZDNiOWpDczc2K0QzdWZ0RzgvYUZy?=
 =?utf-8?B?Q2EzdHhqeG1ZcElON3BZOW1BbXF5VFhHOUZEVUNYRlhNcjg3UUpQcjJ5M2ZP?=
 =?utf-8?B?dEdlcDhsbUdEelNTRy8ybFBnaGljQWZKMlZUUStPcWIxbUZOZTBrZFczbFVz?=
 =?utf-8?B?WW91MVgyVnA4ZFZXZmI1Z2U2ci9zNHdHa1lZUmtxRENFL250eWhFTW9tV1FK?=
 =?utf-8?B?K2Y5N1p3OWZrMGcvT2F2OFI1eFBpa09ONk12S3pZOXRBSHQ5dy9EZk0vU3Vw?=
 =?utf-8?B?RUZEdUdEQ0JnMzNwY0k1M2NZSEtTSFI3UEJ4MzdYd3dFVkh0VURFUGlVcGRr?=
 =?utf-8?B?cEFMYU9ibElPdUE2MGpITXk1d1B4enBJYjZwb1NYek5GL21QOG5xRktKL2Fv?=
 =?utf-8?B?QXhzOGhMWDZUNjcxa0p0Z1BoSmlkV3lWS3BPd0ZVNFZ1QVM2R2RwQkJNenpv?=
 =?utf-8?B?L1dNYzl3d0cxSEtUdWdTaVd4dDIvdzRveCtpcVI5cEs5cTFxU2xQZXNPaHN3?=
 =?utf-8?B?RTg3RHNPM1UrL2xXV29JakFFME5oSjh4dzRtUGoxNDJhSFJlWXZaYVlZSGtK?=
 =?utf-8?B?V2tFdHE3aTVhblg5VStRNEhuZHVocFFDbUVIL3dNbWQzbC9tYnBTZEdHVHgz?=
 =?utf-8?B?amJOZ2VlRXZUZ3AyaFlUbUdpMGZDcXVJMENadXd6dkZZZjR4K3A0UnpIM0VO?=
 =?utf-8?Q?/V3VjHqWM/yoEmlDXpSVhllpqrW5FHwTVqZZNn1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dc0b30-3f1b-48a9-185c-08d98f363cfb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 17:15:36.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB0OFDLLwdc++Hc+InHBWw87DBnT++pq/qQ4G+e6W21Oi8ckDvvYvKLNj5iy22Uyf7fiKWMKsNgV7Sq7Wx9T37r9ikQlQ74VeSNKegUJtXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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

On 10/14/2021 09:41, Matthew Brost wrote:
> On Thu, Oct 14, 2021 at 09:43:36AM -0700, John Harrison wrote:
>> On 10/14/2021 08:32, Matthew Brost wrote:
>>> On Wed, Oct 13, 2021 at 06:02:42PM -0700, John Harrison wrote:
>>>> On 10/13/2021 13:42, Matthew Brost wrote:
>>>>> Introduce 'set parallel submit' extension to connect UAPI to GuC
>>>>> multi-lrc interface. Kernel doc in new uAPI should explain it all.
>>>>>
>>>>> IGT: https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1
>>>>> media UMD: https://github.com/intel/media-driver/pull/1252
>>>>>
>>>>> v2:
>>>>>     (Daniel Vetter)
>>>>>      - Add IGT link and placeholder for media UMD link
>>>>> v3:
>>>>>     (Kernel test robot)
>>>>>      - Fix warning in unpin engines call
>>>>>     (John Harrison)
>>>>>      - Reword a bunch of the kernel doc
>>>>> v4:
>>>>>     (John Harrison)
>>>>>      - Add comment why perma-pin is done after setting gem context
>>>>>      - Update some comments / docs for proto contexts
>>>>>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gem/i915_gem_context.c   | 228 +++++++++++++++++-
>>>>>     .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
>>>>>     drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>>>>>     drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +-
>>>>>     drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   6 +-
>>>>>     .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
>>>>>     drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
>>>>>     .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 ++++++++-
>>>>>     include/uapi/drm/i915_drm.h                   | 131 ++++++++++
>>>>>     9 files changed, 503 insertions(+), 31 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> index d225d3dd0b40..6f23aff6e642 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> @@ -556,9 +556,150 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>>>>>     	return 0;
>>>>>     }
>>>>> +static int
>>>>> +set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>>>>> +				      void *data)
>>>>> +{
>>>>> +	struct i915_context_engines_parallel_submit __user *ext =
>>>>> +		container_of_user(base, typeof(*ext), base);
>>>>> +	const struct set_proto_ctx_engines *set = data;
>>>>> +	struct drm_i915_private *i915 = set->i915;
>>>>> +	u64 flags;
>>>>> +	int err = 0, n, i, j;
>>>>> +	u16 slot, width, num_siblings;
>>>>> +	struct intel_engine_cs **siblings = NULL;
>>>>> +	intel_engine_mask_t prev_mask;
>>>>> +
>>>>> +	/* Disabling for now */
>>>>> +	return -ENODEV;
>>>>> +
>>>>> +	/* FIXME: This is NIY for execlists */
>>>>> +	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	if (get_user(slot, &ext->engine_index))
>>>>> +		return -EFAULT;
>>>>> +
>>>>> +	if (get_user(width, &ext->width))
>>>>> +		return -EFAULT;
>>>>> +
>>>>> +	if (get_user(num_siblings, &ext->num_siblings))
>>>>> +		return -EFAULT;
>>>>> +
>>>>> +	if (slot >= set->num_engines) {
>>>>> +		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>>>>> +			slot, set->num_engines);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	if (set->engines[slot].type != I915_GEM_ENGINE_TYPE_INVALID) {
>>>>> +		drm_dbg(&i915->drm,
>>>>> +			"Invalid placement[%d], already occupied\n", slot);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	if (get_user(flags, &ext->flags))
>>>>> +		return -EFAULT;
>>>>> +
>>>>> +	if (flags) {
>>>>> +		drm_dbg(&i915->drm, "Unknown flags 0x%02llx", flags);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
>>>>> +		err = check_user_mbz(&ext->mbz64[n]);
>>>>> +		if (err)
>>>>> +			return err;
>>>>> +	}
>>>>> +
>>>>> +	if (width < 2) {
>>>>> +		drm_dbg(&i915->drm, "Width (%d) < 2\n", width);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	if (num_siblings < 1) {
>>>>> +		drm_dbg(&i915->drm, "Number siblings (%d) < 1\n",
>>>>> +			num_siblings);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	siblings = kmalloc_array(num_siblings * width,
>>>>> +				 sizeof(*siblings),
>>>>> +				 GFP_KERNEL);
>>>>> +	if (!siblings)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	/* Create contexts / engines */
>>>>> +	for (i = 0; i < width; ++i) {
>>>>> +		intel_engine_mask_t current_mask = 0;
>>>>> +		struct i915_engine_class_instance prev_engine;
>>>>> +
>>>>> +		for (j = 0; j < num_siblings; ++j) {
>>>>> +			struct i915_engine_class_instance ci;
>>>>> +
>>>>> +			n = i * num_siblings + j;
>>>>> +			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
>>>>> +				err = -EFAULT;
>>>>> +				goto out_err;
>>>>> +			}
>>>>> +
>>>>> +			siblings[n] =
>>>>> +				intel_engine_lookup_user(i915, ci.engine_class,
>>>>> +							 ci.engine_instance);
>>>>> +			if (!siblings[n]) {
>>>>> +				drm_dbg(&i915->drm,
>>>>> +					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
>>>>> +					n, ci.engine_class, ci.engine_instance);
>>>>> +				err = -EINVAL;
>>>>> +				goto out_err;
>>>>> +			}
>>>>> +
>>>>> +			if (n) {
>>>>> +				if (prev_engine.engine_class !=
>>>>> +				    ci.engine_class) {
>>>>> +					drm_dbg(&i915->drm,
>>>>> +						"Mismatched class %d, %d\n",
>>>>> +						prev_engine.engine_class,
>>>>> +						ci.engine_class);
>>>>> +					err = -EINVAL;
>>>>> +					goto out_err;
>>>>> +				}
>>>>> +			}
>>>>> +
>>>>> +			prev_engine = ci;
>>>>> +			current_mask |= siblings[n]->logical_mask;
>>>>> +		}
>>>>> +
>>>>> +		if (i > 0) {
>>>>> +			if (current_mask != prev_mask << 1) {
>>>>> +				drm_dbg(&i915->drm,
>>>>> +					"Non contiguous logical mask 0x%x, 0x%x\n",
>>>>> +					prev_mask, current_mask);
>>>>> +				err = -EINVAL;
>>>>> +				goto out_err;
>>>>> +			}
>>>>> +		}
>>>>> +		prev_mask = current_mask;
>>>>> +	}
>>>>> +
>>>>> +	set->engines[slot].type = I915_GEM_ENGINE_TYPE_PARALLEL;
>>>>> +	set->engines[slot].num_siblings = num_siblings;
>>>>> +	set->engines[slot].width = width;
>>>>> +	set->engines[slot].siblings = siblings;
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +out_err:
>>>>> +	kfree(siblings);
>>>>> +
>>>>> +	return err;
>>>>> +}
>>>>> +
>>>>>     static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
>>>>>     	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
>>>>>     	[I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
>>>>> +	[I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT] =
>>>>> +		set_proto_ctx_engines_parallel_submit,
>>>>>     };
>>>>>     static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
>>>>> @@ -818,6 +959,25 @@ static int intel_context_set_gem(struct intel_context *ce,
>>>>>     	return ret;
>>>>>     }
>>>>> +static void __unpin_engines(struct i915_gem_engines *e, unsigned int count)
>>>>> +{
>>>>> +	while (count--) {
>>>>> +		struct intel_context *ce = e->engines[count], *child;
>>>>> +
>>>>> +		if (!ce || !test_bit(CONTEXT_PERMA_PIN, &ce->flags))
>>>>> +			continue;
>>>>> +
>>>>> +		for_each_child(ce, child)
>>>>> +			intel_context_unpin(child);
>>>>> +		intel_context_unpin(ce);
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +static void unpin_engines(struct i915_gem_engines *e)
>>>>> +{
>>>>> +	__unpin_engines(e, e->num_engines);
>>>>> +}
>>>>> +
>>>>>     static void __free_engines(struct i915_gem_engines *e, unsigned int count)
>>>>>     {
>>>>>     	while (count--) {
>>>>> @@ -933,6 +1093,40 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>>>>>     	return err;
>>>>>     }
>>>>> +static int perma_pin_contexts(struct intel_context *ce)
>>>>> +{
>>>>> +	struct intel_context *child;
>>>>> +	int i = 0, j = 0, ret;
>>>>> +
>>>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>>>> +
>>>>> +	ret = intel_context_pin(ce);
>>>>> +	if (unlikely(ret))
>>>>> +		return ret;
>>>>> +
>>>>> +	for_each_child(ce, child) {
>>>>> +		ret = intel_context_pin(child);
>>>>> +		if (unlikely(ret))
>>>>> +			goto unwind;
>>>>> +		++i;
>>>>> +	}
>>>>> +
>>>>> +	set_bit(CONTEXT_PERMA_PIN, &ce->flags);
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +unwind:
>>>>> +	intel_context_unpin(ce);
>>>>> +	for_each_child(ce, child) {
>>>>> +		if (j++ < i)
>>>>> +			intel_context_unpin(child);
>>>>> +		else
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>>     static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>>>     					     unsigned int num_engines,
>>>>>     					     struct i915_gem_proto_engine *pe)
>>>>> @@ -946,7 +1140,7 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>>>     	e->num_engines = num_engines;
>>>>>     	for (n = 0; n < num_engines; n++) {
>>>>> -		struct intel_context *ce;
>>>>> +		struct intel_context *ce, *child;
>>>>>     		int ret;
>>>>>     		switch (pe[n].type) {
>>>>> @@ -956,7 +1150,13 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>>>     		case I915_GEM_ENGINE_TYPE_BALANCED:
>>>>>     			ce = intel_engine_create_virtual(pe[n].siblings,
>>>>> -							 pe[n].num_siblings);
>>>>> +							 pe[n].num_siblings, 0);
>>>>> +			break;
>>>>> +
>>>>> +		case I915_GEM_ENGINE_TYPE_PARALLEL:
>>>>> +			ce = intel_engine_create_parallel(pe[n].siblings,
>>>>> +							  pe[n].num_siblings,
>>>>> +							  pe[n].width);
>>>>>     			break;
>>>>>     		case I915_GEM_ENGINE_TYPE_INVALID:
>>>>> @@ -977,6 +1177,29 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>>>     			err = ERR_PTR(ret);
>>>>>     			goto free_engines;
>>>>>     		}
>>>>> +		for_each_child(ce, child) {
>>>>> +			ret = intel_context_set_gem(child, ctx, pe->sseu);
>>>>> +			if (ret) {
>>>>> +				err = ERR_PTR(ret);
>>>>> +				goto free_engines;
>>>>> +			}
>>>>> +		}
>>>>> +
>>>>> +		/*
>>>>> +		 * XXX: Must be done after calling intel_context_set_gem as that
>>>>> +		 * function changes the ring size while the ring is allocated
>>>>> +		 * when the context is pinned. Mismatch the ring size will cause
>>>> while... when... is ambiguous - changes the ring size at the point when the
>>>> context is pinned even though the ring is already allocated? Or changes the
>>>> ring size even though the ring is already allocated and the context is
>>>> already pinned? Something else?
>>>>
>>> The default size is 4k, intel_context_set_gem changes the size the 16k.
>>> If the pin is done before intel_context_set_gem the ring is allocated at
>>> 4k, then intel_context_set_gem changes the size to 16k == mismatch and
>>> hangs.
>> Right. But, what does 'changes the ring size while the ring is allocated
>> when the context is pinned' mean? That sentence needs to be split up /
>> re-worded because it is not possible to parse unambiguously.
>>
> This is where I landed on the reword:
>
> 1187                 /*
> 1188                  * XXX: Must be done after calling intel_context_set_gem as that
> 1189                  * function changes the ring size. The ring is allocated when
> 1190                  * the context is pinned. If the ring size is changed after
> 1191                  * allocation we have a mismatch of the ring size and will cause
> 1192                  * the context to hang. Presumably with a bit of reordering we
> 1193                  * could move the perma-pin step to the backend function
> 1194                  * intel_engine_create_parallel.
> 1195                  */
>
> Matt
That works.

Also, just wondering if it is worth adding a BUG_ON(pinned) to line of 
code that actually changes the ring size? Would make it more obvious as 
to what went wrong than just some random hang.

John.


>> John.
>>
>>>> Mismatch the ring -> A mismatch of the ring
>>>>
>>> Yep.
>>>
>>> Matt
>>>
>>>> John.
>>>>
>>>>
>>>>> +		 * the context to hang. Presumably with a bit of reordering we
>>>>> +		 * could move the perma-pin step to the backend function
>>>>> +		 * intel_engine_create_parallel.
>>>>> +		 */
>>>>> +		if (pe[n].type == I915_GEM_ENGINE_TYPE_PARALLEL) {
>>>>> +			ret = perma_pin_contexts(ce);
>>>>> +			if (ret) {
>>>>> +				err = ERR_PTR(ret);
>>>>> +				goto free_engines;
>>>>> +			}
>>>>> +		}
>>>>>     	}
>>>>>     	return e;
>>>>> @@ -1219,6 +1442,7 @@ static void context_close(struct i915_gem_context *ctx)
>>>>>     	/* Flush any concurrent set_engines() */
>>>>>     	mutex_lock(&ctx->engines_mutex);
>>>>> +	unpin_engines(__context_engines_static(ctx));
>>>>>     	engines_idle_release(ctx, rcu_replace_pointer(ctx->engines, NULL, 1));
>>>>>     	i915_gem_context_set_closed(ctx);
>>>>>     	mutex_unlock(&ctx->engines_mutex);
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>>> index a627b09c4680..282cdb8a5c5a 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>>> @@ -78,13 +78,16 @@ enum i915_gem_engine_type {
>>>>>     	/** @I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set */
>>>>>     	I915_GEM_ENGINE_TYPE_BALANCED,
>>>>> +
>>>>> +	/** @I915_GEM_ENGINE_TYPE_PARALLEL: A parallel engine set */
>>>>> +	I915_GEM_ENGINE_TYPE_PARALLEL,
>>>>>     };
>>>>>     /**
>>>>>      * struct i915_gem_proto_engine - prototype engine
>>>>>      *
>>>>>      * This struct describes an engine that a context may contain.  Engines
>>>>> - * have three types:
>>>>> + * have four types:
>>>>>      *
>>>>>      *  - I915_GEM_ENGINE_TYPE_INVALID: Invalid engines can be created but they
>>>>>      *    show up as a NULL in i915_gem_engines::engines[i] and any attempt to
>>>>> @@ -97,6 +100,10 @@ enum i915_gem_engine_type {
>>>>>      *
>>>>>      *  - I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set, described
>>>>>      *    i915_gem_proto_engine::num_siblings and i915_gem_proto_engine::siblings.
>>>>> + *
>>>>> + *  - I915_GEM_ENGINE_TYPE_PARALLEL: A parallel submission engine set, described
>>>>> + *    i915_gem_proto_engine::width, i915_gem_proto_engine::num_siblings, and
>>>>> + *    i915_gem_proto_engine::siblings.
>>>>>      */
>>>>>     struct i915_gem_proto_engine {
>>>>>     	/** @type: Type of this engine */
>>>>> @@ -105,10 +112,13 @@ struct i915_gem_proto_engine {
>>>>>     	/** @engine: Engine, for physical */
>>>>>     	struct intel_engine_cs *engine;
>>>>> -	/** @num_siblings: Number of balanced siblings */
>>>>> +	/** @num_siblings: Number of balanced or parallel siblings */
>>>>>     	unsigned int num_siblings;
>>>>> -	/** @siblings: Balanced siblings */
>>>>> +	/** @width: Width of each sibling */
>>>>> +	unsigned int width;
>>>>> +
>>>>> +	/** @siblings: Balanced siblings or num_siblings * width for parallel */
>>>>>     	struct intel_engine_cs **siblings;
>>>>>     	/** @sseu: Client-set SSEU parameters */
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>> index 8309d1141d0a..1d880303a7e4 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>> @@ -55,9 +55,13 @@ struct intel_context_ops {
>>>>>     	void (*reset)(struct intel_context *ce);
>>>>>     	void (*destroy)(struct kref *kref);
>>>>> -	/* virtual engine/context interface */
>>>>> +	/* virtual/parallel engine/context interface */
>>>>>     	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
>>>>> -						unsigned int count);
>>>>> +						unsigned int count,
>>>>> +						unsigned long flags);
>>>>> +	struct intel_context *(*create_parallel)(struct intel_engine_cs **engines,
>>>>> +						 unsigned int num_siblings,
>>>>> +						 unsigned int width);
>>>>>     	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
>>>>>     					       unsigned int sibling);
>>>>>     };
>>>>> @@ -113,6 +117,7 @@ struct intel_context {
>>>>>     #define CONTEXT_NOPREEMPT		8
>>>>>     #define CONTEXT_LRCA_DIRTY		9
>>>>>     #define CONTEXT_GUC_INIT		10
>>>>> +#define CONTEXT_PERMA_PIN		11
>>>>>     	struct {
>>>>>     		u64 timeout_us;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>> index d5ac49c0691e..08559ace0ada 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>> @@ -282,9 +282,19 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>>>>>     	return intel_engine_has_preemption(engine);
>>>>>     }
>>>>> +#define FORCE_VIRTUAL	BIT(0)
>>>>>     struct intel_context *
>>>>>     intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>>>> -			    unsigned int count);
>>>>> +			    unsigned int count, unsigned long flags);
>>>>> +
>>>>> +static inline struct intel_context *
>>>>> +intel_engine_create_parallel(struct intel_engine_cs **engines,
>>>>> +			     unsigned int num_engines,
>>>>> +			     unsigned int width)
>>>>> +{
>>>>> +	GEM_BUG_ON(!engines[0]->cops->create_parallel);
>>>>> +	return engines[0]->cops->create_parallel(engines, num_engines, width);
>>>>> +}
>>>>>     static inline bool
>>>>>     intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> index 2eb798ad068b..ff6753ccb129 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> @@ -1953,16 +1953,16 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>>>>>     struct intel_context *
>>>>>     intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>>>> -			    unsigned int count)
>>>>> +			    unsigned int count, unsigned long flags)
>>>>>     {
>>>>>     	if (count == 0)
>>>>>     		return ERR_PTR(-EINVAL);
>>>>> -	if (count == 1)
>>>>> +	if (count == 1 && !(flags & FORCE_VIRTUAL))
>>>>>     		return intel_context_create(siblings[0]);
>>>>>     	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
>>>>> -	return siblings[0]->cops->create_virtual(siblings, count);
>>>>> +	return siblings[0]->cops->create_virtual(siblings, count, flags);
>>>>>     }
>>>>>     struct i915_request *
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> index 43a74b216efb..bedb80057046 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> @@ -201,7 +201,8 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>>>>>     }
>>>>>     static struct intel_context *
>>>>> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>>>>> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>>>> +			 unsigned long flags);
>>>>>     static struct i915_request *
>>>>>     __active_request(const struct intel_timeline * const tl,
>>>>> @@ -3784,7 +3785,8 @@ static void virtual_submit_request(struct i915_request *rq)
>>>>>     }
>>>>>     static struct intel_context *
>>>>> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>>>>> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>>>> +			 unsigned long flags)
>>>>>     {
>>>>>     	struct virtual_engine *ve;
>>>>>     	unsigned int n;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>>>> index 25a8c4f62b0d..b367ecfa42de 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>>>> @@ -3733,7 +3733,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>>>>>     	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>>>>>     	for (n = 0; n < nctx; n++) {
>>>>> -		ve[n] = intel_engine_create_virtual(siblings, nsibling);
>>>>> +		ve[n] = intel_engine_create_virtual(siblings, nsibling, 0);
>>>>>     		if (IS_ERR(ve[n])) {
>>>>>     			err = PTR_ERR(ve[n]);
>>>>>     			nctx = n;
>>>>> @@ -3929,7 +3929,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>>>>>     	 * restrict it to our desired engine within the virtual engine.
>>>>>     	 */
>>>>> -	ve = intel_engine_create_virtual(siblings, nsibling);
>>>>> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>>>>>     	if (IS_ERR(ve)) {
>>>>>     		err = PTR_ERR(ve);
>>>>>     		goto out_close;
>>>>> @@ -4060,7 +4060,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>>>>>     		i915_request_add(rq);
>>>>>     	}
>>>>> -	ce = intel_engine_create_virtual(siblings, nsibling);
>>>>> +	ce = intel_engine_create_virtual(siblings, nsibling, 0);
>>>>>     	if (IS_ERR(ce)) {
>>>>>     		err = PTR_ERR(ce);
>>>>>     		goto out;
>>>>> @@ -4112,7 +4112,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>>>>>     	/* XXX We do not handle oversubscription and fairness with normal rq */
>>>>>     	for (n = 0; n < nsibling; n++) {
>>>>> -		ce = intel_engine_create_virtual(siblings, nsibling);
>>>>> +		ce = intel_engine_create_virtual(siblings, nsibling, 0);
>>>>>     		if (IS_ERR(ce)) {
>>>>>     			err = PTR_ERR(ce);
>>>>>     			goto out;
>>>>> @@ -4214,7 +4214,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>>>>>     	if (err)
>>>>>     		goto out_scratch;
>>>>> -	ve = intel_engine_create_virtual(siblings, nsibling);
>>>>> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>>>>>     	if (IS_ERR(ve)) {
>>>>>     		err = PTR_ERR(ve);
>>>>>     		goto out_scratch;
>>>>> @@ -4354,7 +4354,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>>>>>     	if (igt_spinner_init(&spin, gt))
>>>>>     		return -ENOMEM;
>>>>> -	ve = intel_engine_create_virtual(siblings, nsibling);
>>>>> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>>>>>     	if (IS_ERR(ve)) {
>>>>>     		err = PTR_ERR(ve);
>>>>>     		goto out_spin;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index 013f36ef98cc..ecb938bb99fb 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -124,7 +124,13 @@ struct guc_virtual_engine {
>>>>>     };
>>>>>     static struct intel_context *
>>>>> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>>>>> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>>>> +		   unsigned long flags);
>>>>> +
>>>>> +static struct intel_context *
>>>>> +guc_create_parallel(struct intel_engine_cs **engines,
>>>>> +		    unsigned int num_siblings,
>>>>> +		    unsigned int width);
>>>>>     #define GUC_REQUEST_SIZE 64 /* bytes */
>>>>> @@ -2615,6 +2621,7 @@ static const struct intel_context_ops guc_context_ops = {
>>>>>     	.destroy = guc_context_destroy,
>>>>>     	.create_virtual = guc_create_virtual,
>>>>> +	.create_parallel = guc_create_parallel,
>>>>>     };
>>>>>     static void submit_work_cb(struct irq_work *wrk)
>>>>> @@ -2864,8 +2871,6 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>>>>>     	.get_sibling = guc_virtual_get_sibling,
>>>>>     };
>>>>> -/* Future patches will use this function */
>>>>> -__maybe_unused
>>>>>     static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>>>>>     {
>>>>>     	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
>>>>> @@ -2882,8 +2887,6 @@ static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>>>>>     	return __guc_context_pin(ce, engine, vaddr);
>>>>>     }
>>>>> -/* Future patches will use this function */
>>>>> -__maybe_unused
>>>>>     static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>>>>>     {
>>>>>     	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
>>>>> @@ -2895,8 +2898,6 @@ static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>>>>>     	return __guc_context_pin(ce, engine, vaddr);
>>>>>     }
>>>>> -/* Future patches will use this function */
>>>>> -__maybe_unused
>>>>>     static void guc_parent_context_unpin(struct intel_context *ce)
>>>>>     {
>>>>>     	struct intel_guc *guc = ce_to_guc(ce);
>>>>> @@ -2912,8 +2913,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>>>>>     	lrc_unpin(ce);
>>>>>     }
>>>>> -/* Future patches will use this function */
>>>>> -__maybe_unused
>>>>>     static void guc_child_context_unpin(struct intel_context *ce)
>>>>>     {
>>>>>     	GEM_BUG_ON(context_enabled(ce));
>>>>> @@ -2924,8 +2923,6 @@ static void guc_child_context_unpin(struct intel_context *ce)
>>>>>     	lrc_unpin(ce);
>>>>>     }
>>>>> -/* Future patches will use this function */
>>>>> -__maybe_unused
>>>>>     static void guc_child_context_post_unpin(struct intel_context *ce)
>>>>>     {
>>>>>     	GEM_BUG_ON(!intel_context_is_child(ce));
>>>>> @@ -2936,6 +2933,98 @@ static void guc_child_context_post_unpin(struct intel_context *ce)
>>>>>     	intel_context_unpin(ce->parallel.parent);
>>>>>     }
>>>>> +static void guc_child_context_destroy(struct kref *kref)
>>>>> +{
>>>>> +	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
>>>>> +
>>>>> +	__guc_context_destroy(ce);
>>>>> +}
>>>>> +
>>>>> +static const struct intel_context_ops virtual_parent_context_ops = {
>>>>> +	.alloc = guc_virtual_context_alloc,
>>>>> +
>>>>> +	.pre_pin = guc_context_pre_pin,
>>>>> +	.pin = guc_parent_context_pin,
>>>>> +	.unpin = guc_parent_context_unpin,
>>>>> +	.post_unpin = guc_context_post_unpin,
>>>>> +
>>>>> +	.ban = guc_context_ban,
>>>>> +
>>>>> +	.cancel_request = guc_context_cancel_request,
>>>>> +
>>>>> +	.enter = guc_virtual_context_enter,
>>>>> +	.exit = guc_virtual_context_exit,
>>>>> +
>>>>> +	.sched_disable = guc_context_sched_disable,
>>>>> +
>>>>> +	.destroy = guc_context_destroy,
>>>>> +
>>>>> +	.get_sibling = guc_virtual_get_sibling,
>>>>> +};
>>>>> +
>>>>> +static const struct intel_context_ops virtual_child_context_ops = {
>>>>> +	.alloc = guc_virtual_context_alloc,
>>>>> +
>>>>> +	.pre_pin = guc_context_pre_pin,
>>>>> +	.pin = guc_child_context_pin,
>>>>> +	.unpin = guc_child_context_unpin,
>>>>> +	.post_unpin = guc_child_context_post_unpin,
>>>>> +
>>>>> +	.cancel_request = guc_context_cancel_request,
>>>>> +
>>>>> +	.enter = guc_virtual_context_enter,
>>>>> +	.exit = guc_virtual_context_exit,
>>>>> +
>>>>> +	.destroy = guc_child_context_destroy,
>>>>> +
>>>>> +	.get_sibling = guc_virtual_get_sibling,
>>>>> +};
>>>>> +
>>>>> +static struct intel_context *
>>>>> +guc_create_parallel(struct intel_engine_cs **engines,
>>>>> +		    unsigned int num_siblings,
>>>>> +		    unsigned int width)
>>>>> +{
>>>>> +	struct intel_engine_cs **siblings = NULL;
>>>>> +	struct intel_context *parent = NULL, *ce, *err;
>>>>> +	int i, j;
>>>>> +
>>>>> +	siblings = kmalloc_array(num_siblings,
>>>>> +				 sizeof(*siblings),
>>>>> +				 GFP_KERNEL);
>>>>> +	if (!siblings)
>>>>> +		return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +	for (i = 0; i < width; ++i) {
>>>>> +		for (j = 0; j < num_siblings; ++j)
>>>>> +			siblings[j] = engines[i * num_siblings + j];
>>>>> +
>>>>> +		ce = intel_engine_create_virtual(siblings, num_siblings,
>>>>> +						 FORCE_VIRTUAL);
>>>>> +		if (!ce) {
>>>>> +			err = ERR_PTR(-ENOMEM);
>>>>> +			goto unwind;
>>>>> +		}
>>>>> +
>>>>> +		if (i == 0) {
>>>>> +			parent = ce;
>>>>> +			parent->ops = &virtual_parent_context_ops;
>>>>> +		} else {
>>>>> +			ce->ops = &virtual_child_context_ops;
>>>>> +			intel_context_bind_parent_child(parent, ce);
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	kfree(siblings);
>>>>> +	return parent;
>>>>> +
>>>>> +unwind:
>>>>> +	if (parent)
>>>>> +		intel_context_put(parent);
>>>>> +	kfree(siblings);
>>>>> +	return err;
>>>>> +}
>>>>> +
>>>>>     static bool
>>>>>     guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
>>>>>     {
>>>>> @@ -3762,7 +3851,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>>>>>     }
>>>>>     static struct intel_context *
>>>>> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>>>>> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>>>> +		   unsigned long flags)
>>>>>     {
>>>>>     	struct guc_virtual_engine *ve;
>>>>>     	struct intel_guc *guc;
>>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>> index 0179f92e0916..c2a63e1584cb 100644
>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>> @@ -1824,6 +1824,7 @@ struct drm_i915_gem_context_param {
>>>>>      * Extensions:
>>>>>      *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
>>>>>      *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
>>>>> + *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
>>>>>      */
>>>>>     #define I915_CONTEXT_PARAM_ENGINES	0xa
>>>>> @@ -2098,6 +2099,135 @@ struct i915_context_engines_bond {
>>>>>     	struct i915_engine_class_instance engines[N__]; \
>>>>>     } __attribute__((packed)) name__
>>>>> +/**
>>>>> + * struct i915_context_engines_parallel_submit - Configure engine for
>>>>> + * parallel submission.
>>>>> + *
>>>>> + * Setup a slot in the context engine map to allow multiple BBs to be submitted
>>>>> + * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
>>>>> + * in parallel. Multiple hardware contexts are created internally in the i915 to
>>>>> + * run these BBs. Once a slot is configured for N BBs only N BBs can be
>>>>> + * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
>>>>> + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
>>>>> + * many BBs there are based on the slot's configuration. The N BBs are the last
>>>>> + * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
>>>>> + *
>>>>> + * The default placement behavior is to create implicit bonds between each
>>>>> + * context if each context maps to more than 1 physical engine (e.g. context is
>>>>> + * a virtual engine). Also we only allow contexts of same engine class and these
>>>>> + * contexts must be in logically contiguous order. Examples of the placement
>>>>> + * behavior are described below. Lastly, the default is to not allow BBs to be
>>>>> + * preempted mid-batch. Rather insert coordinated preemption points on all
>>>>> + * hardware contexts between each set of BBs. Flags could be added in the future
>>>>> + * to change both of these default behaviors.
>>>>> + *
>>>>> + * Returns -EINVAL if hardware context placement configuration is invalid or if
>>>>> + * the placement configuration isn't supported on the platform / submission
>>>>> + * interface.
>>>>> + * Returns -ENODEV if extension isn't supported on the platform / submission
>>>>> + * interface.
>>>>> + *
>>>>> + * .. code-block:: none
>>>>> + *
>>>>> + *	Examples syntax:
>>>>> + *	CS[X] = generic engine of same class, logical instance X
>>>>> + *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>>>> + *
>>>>> + *	Example 1 pseudo code:
>>>>> + *	set_engines(INVALID)
>>>>> + *	set_parallel(engine_index=0, width=2, num_siblings=1,
>>>>> + *		     engines=CS[0],CS[1])
>>>>> + *
>>>>> + *	Results in the following valid placement:
>>>>> + *	CS[0], CS[1]
>>>>> + *
>>>>> + *	Example 2 pseudo code:
>>>>> + *	set_engines(INVALID)
>>>>> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
>>>>> + *		     engines=CS[0],CS[2],CS[1],CS[3])
>>>>> + *
>>>>> + *	Results in the following valid placements:
>>>>> + *	CS[0], CS[1]
>>>>> + *	CS[2], CS[3]
>>>>> + *
>>>>> + *	This can be thought of as two virtual engines, each containing two
>>>>> + *	engines thereby making a 2D array. However, there are bonds tying the
>>>>> + *	entries together and placing restrictions on how they can be scheduled.
>>>>> + *	Specifically, the scheduler can choose only vertical columns from the 2D
>>>>> + *	array. That is, CS[0] is bonded to CS[1] and CS[2] to CS[3]. So if the
>>>>> + *	scheduler wants to submit to CS[0], it must also choose CS[1] and vice
>>>>> + *	versa. Same for CS[2] requires also using CS[3].
>>>>> + *	VE[0] = CS[0], CS[2]
>>>>> + *	VE[1] = CS[1], CS[3]
>>>>> + *
>>>>> + *	Example 3 pseudo code:
>>>>> + *	set_engines(INVALID)
>>>>> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
>>>>> + *		     engines=CS[0],CS[1],CS[1],CS[3])
>>>>> + *
>>>>> + *	Results in the following valid and invalid placements:
>>>>> + *	CS[0], CS[1]
>>>>> + *	CS[1], CS[3] - Not logically contiguous, return -EINVAL
>>>>> + */
>>>>> +struct i915_context_engines_parallel_submit {
>>>>> +	/**
>>>>> +	 * @base: base user extension.
>>>>> +	 */
>>>>> +	struct i915_user_extension base;
>>>>> +
>>>>> +	/**
>>>>> +	 * @engine_index: slot for parallel engine
>>>>> +	 */
>>>>> +	__u16 engine_index;
>>>>> +
>>>>> +	/**
>>>>> +	 * @width: number of contexts per parallel engine or in other words the
>>>>> +	 * number of batches in each submission
>>>>> +	 */
>>>>> +	__u16 width;
>>>>> +
>>>>> +	/**
>>>>> +	 * @num_siblings: number of siblings per context or in other words the
>>>>> +	 * number of possible placements for each submission
>>>>> +	 */
>>>>> +	__u16 num_siblings;
>>>>> +
>>>>> +	/**
>>>>> +	 * @mbz16: reserved for future use; must be zero
>>>>> +	 */
>>>>> +	__u16 mbz16;
>>>>> +
>>>>> +	/**
>>>>> +	 * @flags: all undefined flags must be zero, currently not defined flags
>>>>> +	 */
>>>>> +	__u64 flags;
>>>>> +
>>>>> +	/**
>>>>> +	 * @mbz64: reserved for future use; must be zero
>>>>> +	 */
>>>>> +	__u64 mbz64[3];
>>>>> +
>>>>> +	/**
>>>>> +	 * @engines: 2-d array of engine instances to configure parallel engine
>>>>> +	 *
>>>>> +	 * length = width (i) * num_siblings (j)
>>>>> +	 * index = j + i * num_siblings
>>>>> +	 */
>>>>> +	struct i915_engine_class_instance engines[0];
>>>>> +
>>>>> +} __packed;
>>>>> +
>>>>> +#define I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(name__, N__) struct { \
>>>>> +	struct i915_user_extension base; \
>>>>> +	__u16 engine_index; \
>>>>> +	__u16 width; \
>>>>> +	__u16 num_siblings; \
>>>>> +	__u16 mbz16; \
>>>>> +	__u64 flags; \
>>>>> +	__u64 mbz64[3]; \
>>>>> +	struct i915_engine_class_instance engines[N__]; \
>>>>> +} __attribute__((packed)) name__
>>>>> +
>>>>>     /**
>>>>>      * DOC: Context Engine Map uAPI
>>>>>      *
>>>>> @@ -2157,6 +2287,7 @@ struct i915_context_param_engines {
>>>>>     	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
>>>>>     #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
>>>>>     #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
>>>>> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>>>>>     	struct i915_engine_class_instance engines[0];
>>>>>     } __attribute__((packed));

