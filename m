Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFBA8606FE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 00:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3F10EAB7;
	Thu, 22 Feb 2024 23:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2IfmRw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688C610EABD;
 Thu, 22 Feb 2024 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708644723; x=1740180723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mCac9L3CuHK2e1i99SZGdGIZ9Iew1k0vYH9VzShQ480=;
 b=X2IfmRw5Lb17n1d4ZgsU9rreqUmuYOac48YivFj2AcJxZA8kUn5u5qKi
 hCpUknQuFWo4englZoyoDQ3sMHL53AQY+wBb3bFUAq9uz8CBtD8rkG9zp
 Xpa7ewCkgnq9FMCz2KUia/Ks/JPf/+6taiZgcKRbS29eudUeZqS3U5Ahf
 I1fGW1DOCYPFh6rWGKGij6WpN09gsgFXm3Jtqr+BlDBr8DPnkchQPJ7Ef
 h6cI7FKv628ff/0LIdm7r8hLkMc4tcohH5Dx09CPFd5mM56sLG98oWAha
 N1bi297SkjGcNurHroaeZrUCEX5Mb3GAhXmJGUR8/ZiQQRLGzCipP1bCd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3075024"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3075024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5970358"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 15:32:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 15:32:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 15:32:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 15:31:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvrZl4zJbwKCsXsnKgc3a6CeVr/4UeNJtukSJjCVvUN4LeLdzL234sPcEWgrjDvL9Fj6+KdSZHJAAShEF/Lw2KUrg/OyEgTV1bUZoCeKeCb9dEo7oW2V30p0/RHK4BEV/X+w9qGoydUmX4zUfmOfwHcWPLsv7VVrnhTqKoeQDNdnClUqF6eVrXo4Z/OBg945KIagLf/yePFG9brhsDuQJ5VZPNj7WZ9r+yErojwvdNqMRtvhsnfr3oadY6T5RUv53Rzc7/QpEnsTH2T1QRQBz+pA0H5M1kMNb9yT6py3XEIUUYs8SbGqQGf8f/O6vhceo9sygBPgBjJlW0ICANsjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVMaf5DiS5MOUoQcQ/eHxDevYPW7fNE3g86ZrJNpDGQ=;
 b=Tak+Ly1XQzste8mzq3zvpHVUqRvyiRw09e6X1UL/VxNTcMs1tevBMGMNY7yt4VC7G7MJj2UidvuuHh9z5uZhZspPtg1GEs3N8Jd+MGDEtY95hhO8wyCpWRpX1WhzM2m3bp6ebvnGe28sRoQEMBrhEXlmMR4h5FywwOup3JCmpKwt+ihblEo4v6ue0LkIc10kIld5e7VKOwBjlYHc80gNEGcPEtHg0Z1THOsJBOd23tNCi6A0JJZ2iJtCVdHBftQFsCpp2IbKLj0Y29kdI1s7cfacEB0LCFP5mpRyGPDQSntLFMhjse5i/WnLU8QG39IaLilaeLA1x58cU/GrJDx5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 23:31:46 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::8258:3a70:b7c5:1238]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::8258:3a70:b7c5:1238%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 23:31:46 +0000
Message-ID: <166befb6-a667-4c24-85ed-efb18bd3b7d7@intel.com>
Date: Thu, 22 Feb 2024 15:31:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Add Compute context hint
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240221001416.696780-1-vinay.belgaumkar@intel.com>
 <8e03bde7-fba2-4b8b-ae33-b502cf1a8e4f@linux.intel.com>
 <ZdZq9NH0VYbL-QV8@intel.com>
 <50e4ed39-bc70-471c-be44-f61920405f67@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <50e4ed39-bc70-471c-be44-f61920405f67@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ece12c2-71a2-4f2c-0e34-08dc33fe6f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E37dtcxjt4LThxTecpcJLkIDJzZJeVyjGp3y983bi98YNV+gm/FcYzIO/OBGG5KRm2L3gFN6cb/xHKw5icov7sM4eFKLs+rs+MAoFqRbF97do0NY5AU4neWbNMmhN/o4dYSAQVFb1446FZCVsk+jsmrwMqtFA9eGCT/WgaZHtqjIavsd/DZcDN/6eAkpINNX49eq+/4tl8uzUB8Y2S1ITdF0SIVw6vj7RGvqvibJCcHcgf6go0YJmNdJsIjl0w3GfBwacZyTwBfj9R/l43ScJW6Tm1v98hvj/aimU3r4oUbYeXFuOYryEZrVMwOVNfbtCIZqfgqAbCe31WF2/FgCAuY61Bop/IkdD4+Qe/5vFoSNFolu9TiDrkBSQRmUP3ZFGrojLl5KdfIihGbmM9Zd78FRgIjKJQshTTWZbX5qhks6Kk1C1mABHWeeWQnphw/85X5wFLtUgTgnpMnmvIHzroM051JKTOCU1MLgpwCJVUcDuKxHBfCl1eNI7ZacpoFKJXeezxquSsTYLdnFmw2arg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEFHMDlESS9CTXBHVmt3OWRvRDQ5WnVwZ1R4eWdyODcyQnpQQkpLVnd5K3N2?=
 =?utf-8?B?QVVpQTBjZXZuOHlRTlNjRVdSV05IOFhjMTMydnBlWUFyUnRQaVoyWWcyTW1Z?=
 =?utf-8?B?UFNHTjArVWpQd0dXWVB4bjJ1ZVRRcjB3eCtHNFZIblBGa3RJN21YQTlFUFBr?=
 =?utf-8?B?eXBtN2ROYTBhcWFpMUpCa0R3RHpQMDNpWmpFQ3VLY3J4SUhRSXFNNlp1Umpx?=
 =?utf-8?B?SHJNZldjK29adDI5ME53NGJFd0hxZ2dNaFpuQzVuUnBxekxuamhFbkd5YVZZ?=
 =?utf-8?B?OHVVUzBwZHlIZkR3RGI5eXpveXFmNWExT1BDVXExNTM1S3E2WmZaTlJ2KzZv?=
 =?utf-8?B?VFNJS1BDcXlrZHNxWDdMZ1FxY1hsbGkra0YxKytrcjhMM0pxMVpaVzNKWVgv?=
 =?utf-8?B?VTNNUXEvdCsyLzc3SVM0dTBSR0dPVCtHTGgzMGJYUUN4aEtxUUZ6VDh4Y05r?=
 =?utf-8?B?RWluVCtRaWpQQ1cwU290U3h4UEJNV3QxVk9EUHhQTTZvQkxUSEYxR05TaCtp?=
 =?utf-8?B?c2hYcVFYNko5bVgvMlpLTUxjWmtFdVE0Sk9NSWxlSUpEc0lMdXJmM09ENS92?=
 =?utf-8?B?Q0l1MjJuU1R1WlJWb2x5UGRBR2FjYjI4Y01iYVg0Ly9TSDRVTEFHUllrbXYy?=
 =?utf-8?B?V1J6cENBcEI2YkVsMHFGekM3UGtSNndwa0dlYmlEd21JMlJvTFVzV3dENFRP?=
 =?utf-8?B?cENNUHdwRnNnWEg4UWJPaVZKZ2tFUHRIQmxTSkN2dGovaSszYk5sV3Z4eUJx?=
 =?utf-8?B?YzYrRjg0SVI0USt0bWdrR1BmN0hnYVBrbWNsZGVWY1ZuN1ZBWDMwY1kxNjhy?=
 =?utf-8?B?ZEd0VFBaYm01eFNaaEc5QmpqdC9TNXRLaTFhZjBraWdjcnBCRGdwcnhrK21S?=
 =?utf-8?B?cktXYjRmR2V6b1owMGVhUzZkMlVUeW1iekFRVDVCaHk3ZzdraDAxc01OZkFm?=
 =?utf-8?B?Z0t5YjNITzd0UmpaSTNlUTBERkxrdXBMRkRWRTZrbXNnd3BIRFZCS1pJN2FS?=
 =?utf-8?B?eUt0ME81VHhJdExENUhJalJnMllKaEZRVHFUSVFveDhEWDAwZFpJUnFXdnlW?=
 =?utf-8?B?YVljUkxTWkRkbnZCQ1E4cmJFbGtIZmNrdWs0OG1nNkFVTG4xL012am1uYWZX?=
 =?utf-8?B?azRvTVg1MnJQSFY0ZXhGdkc3RDIxZzNGN213RVRyRERJdDdpZXcwbCtIZUxZ?=
 =?utf-8?B?UUg4T3VpYWp0aS9HeWRPVHVSV2Z2eE5JMG9uS2JWS2c0d1ZwSkVBL2g3dktN?=
 =?utf-8?B?Q0RoZW1kNWpTdTNaZ1pzcHVWSVpoRDJxeS9qU1RXZmRUWjVWdXEwQmJmRm9N?=
 =?utf-8?B?WW9YSWhPYjZNN2xhYThFS0NrRDF6Qm8xZ3NWdFFWK2htR01qYnc3ZjVyNnIx?=
 =?utf-8?B?Q0pGR1FZaUFSTnc5dkV5QVQ2emR4dGVjci83RXFRUDdDNjFCc2FSUldic05t?=
 =?utf-8?B?elRSQldHSVFNYlJ5d0JiQXhyaitGcDkyNm5LdHNtV2JVRnVCK0N1eGJOZnJN?=
 =?utf-8?B?NXV4ZURKejR6YURpemEyRkgxTjBza1ArelEyb1NBU0ZFYkZ0eG5zN3RmK2Fx?=
 =?utf-8?B?MW1TU3JhOWFwSEZBczJVbVpzNllONCtqNnkvMGxieVdsRXhqdzMyM2FqT0JQ?=
 =?utf-8?B?MUx6WGRqMU5VbTVWT2hoWTFsMWN4Z2JEMkFqWWxOMEhDSG8rTng5UDVmdEVI?=
 =?utf-8?B?WktjVHRMQXdKaVEwTVNXekRvU0VYY3liL2Q1WFN3RWRMSjJjam9FTHVUV2lT?=
 =?utf-8?B?OVlGUm9TZ1RSTWMrK3dCL1lIZ2pRai94NGw0MklUZTVBSyt0aGR5MXB2RFV5?=
 =?utf-8?B?MjRJUVFkSmFla2pYM3prRDFEQzFhV1NydHFzWU1XVzVOVGdMYmJaNHZOdDA5?=
 =?utf-8?B?NnptOWVDZnZtZ3ZIdWFOTTdGeXJ0WlE1NzRrMW9ZMENMa0dlOEJZKzVRUzJW?=
 =?utf-8?B?L1J0M3dOS2c3UUxFZGt2Y2R2UlBhQVpWTjlpSFgxQTNEQm5hVDlyVjlabjlM?=
 =?utf-8?B?NjVzMkY0eDM1QlVpY0tXTlc2WjhRZHluNTQ2VXE1K1RQdDNwU1RIRUNKYlBI?=
 =?utf-8?B?cjJteHlzcmthWkhqbFYwbFo1T3hyakhHNkFRbXZqV1liUnlCOXU0bnllclBP?=
 =?utf-8?B?UExDSUlkL2VlaHBITEtDT2hvYnpYdFZnRnR6U25aaDhzMnZrT2doSFlPT3BI?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ece12c2-71a2-4f2c-0e34-08dc33fe6f60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 23:31:46.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0AnnQglBOenUtNypxbUaBYZghey32mobsbrG6FD0sNySPMQRh990heJZid4WQ3v3U2/4Bxsp4rDnv8KQ+7MI/v3LeHSMePtLjSy+I6AdFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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


On 2/22/2024 7:32 AM, Tvrtko Ursulin wrote:
>
> On 21/02/2024 21:28, Rodrigo Vivi wrote:
>> On Wed, Feb 21, 2024 at 09:42:34AM +0000, Tvrtko Ursulin wrote:
>>>
>>> On 21/02/2024 00:14, Vinay Belgaumkar wrote:
>>>> Allow user to provide a context hint. When this is set, KMD will
>>>> send a hint to GuC which results in special handling for this
>>>> context. SLPC will ramp the GT frequency aggressively every time
>>>> it switches to this context. The down freq threshold will also be
>>>> lower so GuC will ramp down the GT freq for this context more slowly.
>>>> We also disable waitboost for this context as that will interfere with
>>>> the strategy.
>>>>
>>>> We need to enable the use of Compute strategy during SLPC init, but
>>>> it will apply only to contexts that set this bit during context
>>>> creation.
>>>>
>>>> Userland can check whether this feature is supported using a new 
>>>> param-
>>>> I915_PARAM_HAS_COMPUTE_CONTEXT. This flag is true for all guc 
>>>> submission
>>>> enabled platforms since they use SLPC for freq management.
>>>>
>>>> The Mesa usage model for this flag is here -
>>>> https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
>>>
>>> This allows for setting it for the whole application, correct? Upsides,
>>> downsides? Are there any plans for per context?
>>
>> Currently there's no extension on a high level API 
>> (Vulkan/OpenGL/OpenCL/etc)
>> that would allow the application to hint for power/freq/latency. So 
>> Mesa cannot
>> decide when to hint. So their solution was to use .drirc and make 
>> per-application
>> decision.
>>
>> I would prefer a high level extension for a more granular and 
>> informative
>> decision. We need to work with that goal, but for now I don't see any
>> cons on this approach.
>
> In principle yeah I doesn't harm to have the option. I am just not 
> sure how useful this intermediate step this is with its lack of 
> intra-process granularity.
>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +++++++
>>>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
>>>>    drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +++++++
>>>>    .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 
>>>> +++++++++++++++++++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++++
>>>>    drivers/gpu/drm/i915/i915_getparam.c          | 11 ++++++++++
>>>>    include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
>>>>    9 files changed, 89 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> index dcbfe32fd30c..ceab7dbe9b47 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct 
>>>> drm_i915_file_private *fpriv,
>>>>                       struct i915_gem_proto_context *pc,
>>>>                       struct drm_i915_gem_context_param *args)
>>>>    {
>>>> +    struct drm_i915_private *i915 = fpriv->i915;
>>>>        int ret = 0;
>>>>        switch (args->param) {
>>>> @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct 
>>>> drm_i915_file_private *fpriv,
>>>>                pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>>>>            break;
>>>> +    case I915_CONTEXT_PARAM_IS_COMPUTE:
>>>> +        if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>> +            ret = -EINVAL;
>>>> +        else
>>>> +            pc->user_flags |= BIT(UCONTEXT_COMPUTE);
>>>> +        break;
>>>> +
>>>>        case I915_CONTEXT_PARAM_RECOVERABLE:
>>>>            if (args->size)
>>>>                ret = -EINVAL;
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> index 03bc7f9d191b..db86d6f6245f 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> @@ -338,6 +338,7 @@ struct i915_gem_context {
>>>>    #define UCONTEXT_BANNABLE        2
>>>>    #define UCONTEXT_RECOVERABLE        3
>>>>    #define UCONTEXT_PERSISTENCE        4
>>>> +#define UCONTEXT_COMPUTE        5
>>>
>>> What is the GuC behaviour when SLPC_CTX_FREQ_REQ_IS_COMPUTE is set for
>>> non-compute engines? Wondering if per intel_context is what we want 
>>> instead.
>>> (Which could then be the i915_context_param_engines extension to mark
>>> individual contexts as compute strategy.)
>>
>> Perhaps we should rename this? This is a freq-decision-strategy inside
>> GuC that is there mostly targeting compute workloads that needs lower
>> latency with short burst execution. But the engine itself doesn't 
>> matter.
>> It can be applied to any engine.
>
> I have no idea if it makes sense for other engines, such as video, and 
> what would be pros and cons in terms of PnP. But in the case we end up 
> allowing it on any engine, then at least userspace name shouldn't be 
> compute. :)
Yes, one of the suggestions from Daniele was to have something along the 
lines of UCONTEXT_HIFREQ or something along those lines so we don't 
confuse it with the Compute Engine.
>
> Or if we decide to call it compute and only apply to compute engines, 
> then I would strongly suggest making the uapi per intel_context i.e. 
> the set engines extension instead of the GEM context param. Otherwise 
> it would be odd that some engines get it and some don't. With explicit 
> configuration userspace gets to see the clear picture of what is what.

It will not be per engine, so may be better to keep it at the 
gem_context level. Trying to percolate it to the intel_context level 
seems to be more complicated. We process the gem_context_param flags 
first and then create the intel_context per engine. Not sure if we want 
to keep 2 copies of the same flag in gem_context and intel_context as well.

>
> Regards,
>
> Tvrtko
>
>>>>        /**
>>>>         * @flags: small set of booleans
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> index 4feef874e6d6..1ed40cd61b70 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> @@ -24,6 +24,7 @@
>>>>    #include "intel_pcode.h"
>>>>    #include "intel_rps.h"
>>>>    #include "vlv_sideband.h"
>>>> +#include "../gem/i915_gem_context.h"
>>>>    #include "../../../platform/x86/intel_ips.h"
>>>>    #define BUSY_MAX_EI    20u /* ms */
>>>> @@ -1018,6 +1019,13 @@ void intel_rps_boost(struct i915_request *rq)
>>>>            struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>>            if (rps_uses_slpc(rps)) {
>>>> +            const struct i915_gem_context *ctx;
>>>> +
>>>> +            ctx = i915_request_gem_context(rq);
>>>> +            if (ctx &&
>>>> +                test_bit(UCONTEXT_COMPUTE, &ctx->user_flags))
>>>> +                return;
>>>> +
>>>
>>> I think request and intel_context do not own a strong reference to GEM
>>> context. So at minimum you need a local one obtained under a RCU 
>>> lock with
>>> kref_get_unless_zero, as do some other places do.
>>>
>>> However.. it may be simpler to just store the flag in 
>>> intel_context->flags.
>>> If you carry it over at the time GEM context is assigned to 
>>> intel_context,
>>> not only you simplify runtime rules, but you get the ability to not 
>>> set the
>>> compute flags for video etc.
>>
>> +1 on the intel_context->flags
>>
>>>
>>> It may even make sense to add a "don't waitboost" flag on top of the 
>>> "is
>>> compute" so this call site becomes self-documenting (otherwise I ask 
>>> to add
>>> a comment here please). Then you could even move it out from the SLPC
>>> special case.
>>
>> +1 on the dont_waitboost flag as well. might be worth for other cases
>> like display metrics for instance.

We could define another disable_waitboost flag in intel_context, but 
seems redundant if we already have this info in the gem_context. We 
don't need to check for SLPC special case, just need to check this flag 
as we won't enable it for the non-slpc case anyways.

Thanks,

Vinay.

>>
>>>
>>>>                slpc = rps_to_slpc(rps);
>>>>                if (slpc->min_freq_softlimit >= slpc->boost_freq)
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h 
>>>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>> index 811add10c30d..c34674e797c6 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>> @@ -207,6 +207,27 @@ struct slpc_shared_data {
>>>>        u8 reserved_mode_definition[4096];
>>>>    } __packed;
>>>> +struct slpc_context_frequency_request {
>>>> +    u32 frequency_request:16;
>>>> +    u32 reserved:12;
>>>> +    u32 is_compute:1;
>>>> +    u32 ignore_busyness:1;
>>>> +    u32 is_minimum:1;
>>>> +    u32 is_predefined:1;
>>>> +} __packed;
>>>> +
>>>> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE        REG_BIT(28)
>>>> +
>>>> +struct slpc_optimized_strategies {
>>>> +    u32 compute:1;
>>>> +    u32 async_flip:1;
>>>> +    u32 media:1;
>>>> +    u32 vsync_flip:1;
>>>> +    u32 reserved:28;
>>>> +} __packed;
>>>> +
>>>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE        REG_BIT(0)
>>>> +
>>>>    /**
>>>>     * DOC: SLPC H2G MESSAGE FORMAT
>>>>     *
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index 3e681ab6fbf9..706fffca698b 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct 
>>>> intel_guc_slpc *slpc, u32 *val)
>>>>        return ret;
>>>>    }
>>>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
>>>> +{
>>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>> +    intel_wakeref_t wakeref;
>>>> +    int ret = 0;
>>>> +
>>>> +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>>>> +        ret = slpc_set_param(slpc,
>>>> +                     SLPC_PARAM_STRATEGIES,
>>>> +                     val);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc 
>>>> *slpc, u32 val)
>>>>    {
>>>>        struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>> @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc 
>>>> *slpc)
>>>>        /* Set cached media freq ratio mode */
>>>>        intel_guc_slpc_set_media_ratio_mode(slpc, 
>>>> slpc->media_ratio_mode);
>>>> +    /* Enable SLPC Optimized Strategy for compute */
>>>> +    intel_guc_slpc_set_strategy(slpc, 
>>>> SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>>> +
>>>>        return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> index 6ac6503c39d4..1cb5fd44f05c 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt 
>>>> *gt);
>>>>    void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>>>>    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>>>>    int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc 
>>>> *slpc, bool val);
>>>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 
>>>> val);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> index f3dcae4b9d45..bbabfa5532e5 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, 
>>>> EXECUTION_QUANTUM)
>>>>    MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>>>>    MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>>>>    MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, 
>>>> PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
>>>> +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>>>>    #undef MAKE_CONTEXT_POLICY_ADD
>>>> @@ -2662,8 +2663,10 @@ static int 
>>>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>>>        struct intel_engine_cs *engine = ce->engine;
>>>>        struct intel_guc *guc = &engine->gt->uc.guc;
>>>>        struct context_policy policy;
>>>> +    struct i915_gem_context *ctx = rcu_dereference(ce->gem_context);
>>>>        u32 execution_quantum;
>>>>        u32 preemption_timeout;
>>>> +    u32 slpc_ctx_freq_req = 0;
>>>>        unsigned long flags;
>>>>        int ret;
>>>> @@ -2675,11 +2678,15 @@ static int 
>>>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>>>        execution_quantum = engine->props.timeslice_duration_ms * 1000;
>>>>        preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>>>> +    if (ctx && (ctx->user_flags & BIT(UCONTEXT_COMPUTE)))
>>>> +        slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>>>> +
>>>>        __guc_context_policy_start_klv(&policy, ce->guc_id.id);
>>>>        __guc_context_policy_add_priority(&policy, ce->guc_state.prio);
>>>> __guc_context_policy_add_execution_quantum(&policy, 
>>>> execution_quantum);
>>>> __guc_context_policy_add_preemption_timeout(&policy, 
>>>> preemption_timeout);
>>>> +    __guc_context_policy_add_slpc_ctx_freq_req(&policy, 
>>>> slpc_ctx_freq_req);
>>>>        if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>>>> __guc_context_policy_add_preempt_to_idle(&policy, 1);
>>>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c 
>>>> b/drivers/gpu/drm/i915/i915_getparam.c
>>>> index 5c3fec63cb4c..0f12e36b2a12 100644
>>>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>>>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>>>> @@ -155,6 +155,17 @@ int i915_getparam_ioctl(struct drm_device 
>>>> *dev, void *data,
>>>>             */
>>>>            value = 1;
>>>>            break;
>>>> +    case I915_PARAM_HAS_COMPUTE_CONTEXT:
>>>> +        /* This feature has been available in GuC for a while but
>>>> +         * a use case now required the use of this feature. We
>>>> +         * return true now since this is now being supported from
>>>> +         * the kernel side as well.
>>>> +         */
>>>
>>> Nit - stick to the multi-line comment style i915 uses please.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>> +            value = 1;
>>>> +        else
>>>> +            value = -EINVAL;
>>>> +        break;
>>>>        case I915_PARAM_HAS_CONTEXT_ISOLATION:
>>>>            value = intel_engines_has_context_isolation(i915);
>>>>            break;
>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>> index 2ee338860b7e..1bd12f536108 100644
>>>> --- a/include/uapi/drm/i915_drm.h
>>>> +++ b/include/uapi/drm/i915_drm.h
>>>> @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
>>>>     */
>>>>    #define I915_PARAM_PXP_STATUS         58
>>>> +/*
>>>> + * Query if kernel allows marking a context as a Compute context. 
>>>> This will
>>>> + * result in more aggressive GT frequency ramping for this context.
>>>> + */
>>>> +#define I915_PARAM_HAS_COMPUTE_CONTEXT 59
>>>> +
>>>>    /* Must be kept compact -- no holes and well documented */
>>>>    /**
>>>> @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
>>>>     * -EIO: The firmware did not succeed in creating the protected 
>>>> context.
>>>>     */
>>>>    #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>>>> +
>>>> +/*
>>>> + * I915_CONTEXT_PARAM_IS_COMPUTE:
>>>> + *
>>>> + * Mark this context as a Compute related workload which requires 
>>>> aggressive GT
>>>> + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to 
>>>> check if the kernel
>>>> + * supports this functionality.
>>>> + */
>>>> +#define I915_CONTEXT_PARAM_IS_COMPUTE        0xe
>>>>    /* Must be kept compact -- no holes and well documented */
>>>>        /** @value: Context parameter value to be set or queried */
