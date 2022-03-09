Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF14D3BEA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761EF10E489;
	Wed,  9 Mar 2022 21:16:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCAF10E482;
 Wed,  9 Mar 2022 21:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646860601; x=1678396601;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bSBdFBJ6hJpSu7eMa0Gw+obcfWmbCjwRz+/BmXcJ+2A=;
 b=FkxmLDZrXrO5LHXNcDggQsW98G+NpNceZYJ2UhtBPkls9UsXOPi+GEwu
 VgAyqwVsjDS6iuuDEFQlTaWyNVor2+jFGlAjtmMeTDFnEkmAdMmSTCNQz
 sMMNC0Nhgep3ZAyOI+45GFbhbyC3ovuhC50zKSVy1wCwADA2wwSQOMv1j
 wL86vVU544yPEsQ78EnokemPlg5Iss/4FH33jmsl4YgEIwzNyYoBXaLLl
 ETE0FOnzNYwpS8sMVbkpNXbhwOpz/+IoXPe5wwHhhLwxjRbDrbOWnEkUm
 uS5Eb197Lps8QMruga8y6hF8FlW2xsVZccIu+PtumctO9O6buqd8d4LqM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="315812134"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="315812134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 13:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="554299766"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 09 Mar 2022 13:16:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 13:16:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 13:16:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 13:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABy5BA4ID64npeC66FIj1YBF+CVo9/rRCmmYNnLTMq3vDO3oEHB6Dy2Rf0mUIqL/80y8kgtWyG9+7TKMk2MbIixNGq4YlODXRC4ykIMifkCSKk6E1voQGFhu4GaZlaaQiLkulmSJ7oDanb3fobfWy4Vu6qZ7kKPCs4kN/ZimG2xgzGFr1PvZx2hF+rZLRi75pVqv2pHVWN8Kq6eOQcku1aCqAVAQCJwdQuf96hDWFsuRNppfaVE9X+RfWbiyxO29ojKz92UYOBnFZ9vX8hqe/wqGQDtukEUeBu3Q8XpbjhMB+pYTEfkuvVSSDAYADaFX2xbrC0pevwslfsvh1roVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDY4tl45sgWyeLhVGmfFAt3m6OgZearFULyt0v4/Hyo=;
 b=PgzB/JxgJ3VqCXwHHhLOWwSX2OA3yytYOlVyhm7pWSlNeMeQxkTVXIKOD/Slrm105h3v3AAk+mrUFs//Ywuc204iPRiCUJ5Brj0F3D0EZLKDYhwGOYJUjG3fDOQjyoRcVq/jYXsQuDmwzHH4P4nqLufcARpZNI85YmWLdeU/deii82sIs1/XsoLO73Zxr7jfCCdQcfPFti+145q5QI6Z4dJwZSmDImrnBP6Zy3EFdQupRfLQABUdyaCuOz2/blWtLqVw6IqfcB7UIV2oMFq/fLXisHQDTyywAtfDsrW8HqLAVJc886RRbKvLSqBtg3K2EtrD1sRR/sOp/Qb0uWO6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB3951.namprd11.prod.outlook.com (2603:10b6:208:13b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 21:16:38 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 21:16:38 +0000
Message-ID: <991c5d38-7904-dff8-e610-c4030e526e2e@intel.com>
Date: Wed, 9 Mar 2022 13:16:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [Intel-gfx] [PATCH v3 4/4] drm/i915: Improve long running OCL w/a
 for GuC submission
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-5-John.C.Harrison@Intel.com>
 <71a0f9af-7473-ece9-dae8-bcc1c3b55cf5@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <71a0f9af-7473-ece9-dae8-bcc1c3b55cf5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 209a5705-c8a8-4333-e55f-08da02121910
X-MS-TrafficTypeDiagnostic: MN2PR11MB3951:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB3951188CAD23F374D1142A19BD0A9@MN2PR11MB3951.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQ34wd6pYAQLLLfp2ppsJUFpA4EZDRJhHw1+gBwkCcen1enmX5d/TRK8HrfdHc0DwWRO1rUOnVh3+fAqD7oEPoDKzijqeiMx5wf1Uu0xkCU2ZZX2i+bPUUhdNk4PtI7abSASjdT3kuQihhtR9NHx3peZ3LgO5/U3ekZq2b21ZvspTi5o4KZ3IC/F566PE6ub70o9IFw1WQ1npSiDhfR7uLKUdAipO/g6zd0NmQczxvrkWRpKhCjXZV0SMUlnZNccyjukjoruSCj0S/0EmO292ALCjtpXFPxki5fZrpWJKb4vfTrJ6RzkLol3iGUcoEhETP0lWQXfDOIwJgPh9FN+ct6GoHSLnSENt6eqAuXUgk9shGFTTnk463FYObEI8OWUb307cIUsFNJ+ubtzLL344mRypVlWn95ULh7vI6jn5sjXfTnZAZt/yrSp5gp+6jGyYR5LtqmKKMofWreCP0PDn95zEYoFZZ6ewz1VmWt6xJNnwM4VgxX0naHgRfnYTAAg9L4f8ByNMTvTP0a9oix3rGtDJyY5DQITBVHmnA1vy9xlHgjqU8krDke7d47XVKvmCs2Nas1ZpuwO/WlAMjjhZecl+grDgfY54FLWkkmEmsgXLozMa6yfLeuxlommHoAQ/aiuqQnEEmx8ETaLTPHELTs5xlVcMFlMX6+nw3nSzEUq+nkD6cnODH+E6X2p8b/ekcF6udOdWVZPe3al/AwU9vk+rytZ5F3Igm54jkpuu42fS3viLVQJX7otrH2xvZUk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(31696002)(316002)(6506007)(86362001)(53546011)(6486002)(6666004)(2616005)(36756003)(186003)(26005)(31686004)(83380400001)(6512007)(66556008)(82960400001)(4326008)(38100700002)(8676002)(66946007)(2906002)(66476007)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1M1bmtWeElaaEhBUG5sUWNPQzlJRklxcWw1UmhIVFB3SXVJYlNsS1ZrcmxZ?=
 =?utf-8?B?VUh0bXFWRlk1ZEhTTjJxYWpJWCt5WjA2cHdoVVBmelAzb0RMMUhiQ0Z1MFpr?=
 =?utf-8?B?c0xoeVRZREJOSmlOVFlYSlh6YkdSNWZyQ1krdDgxbEJVUTdCL2IraDF5cGhU?=
 =?utf-8?B?NVhoaVkweCsxbDBvbzk5WFFESm9wYm5nanRCT0xuLzJvdWVkR2htU3BTU3ln?=
 =?utf-8?B?TXlnRDZ6Yks4b2ZIa2VBQ3BQSklsVi9aRkFFd00xN1dxMFdyMlF4ZHlYYVp6?=
 =?utf-8?B?Qm93ZFVEREp4ZTBWdjFtYW1jZ09vVHNtUUl6L0tkTnV1MGZ2VGl4T1N6cUVa?=
 =?utf-8?B?dW54ajRiMnJBZ1dGZlRPUmFHbGgzZnhEMTQxakJXVTFtYitwV2padzdUNWhv?=
 =?utf-8?B?cUVjZnpseWVCOWtGRjdkbGtYQ1AxenJrUmQvTVlFaGtvUE9iSWhvWVhwQ3JH?=
 =?utf-8?B?UW50SFFrcjBsNDl2V1ZUbktDTG9MNENUWkh2QjdkRUx5QlFOUTZFMXlkRFR5?=
 =?utf-8?B?RTFRVUZZa2xETFdIQTdZVGY4ZGRIdmYzZWQ4TkVkdGFsQmlURGx5OGw1V0JH?=
 =?utf-8?B?d2Qwb09oS2hQZW9ORnJLNkxZS25xODlPTklnWTJ4UzRrMlpDaDNBMUZ4U281?=
 =?utf-8?B?b0YzQmV5ZFNtaFFEdHl0Z2tMbkx1c053RUZnV1JoUUJaVlFtV0szZTFXL0hH?=
 =?utf-8?B?N0N3aE1zek1NaDBuWkxsSXpKRzc5M0ZQbTgxSkZjM2RUNmxUakpiTmxWVFZO?=
 =?utf-8?B?UTRZTEQ3YU0wVXRySTBwZEEybWdjbVN0SmV4dy9xUUN0ZDlRcDZNQVBXYU8z?=
 =?utf-8?B?cHg0TXFyWU5Qdk9xbm4zMEFxQVNQZFpXeTBSVk1HT3dRL1lFUTMya1MwUjB2?=
 =?utf-8?B?cGluUXhKQUdJSU9CeHljU0NwU1FOc01jWXZZVHZjaHpqMDdGVytVRnVYeTJJ?=
 =?utf-8?B?YWFoaE4yVndWejB5V21rdE16ZVJrOTIxQVFYS2lzREhSeW13cjJIc1Z3aStr?=
 =?utf-8?B?QTI5bU4xd3F3ME03RFpxeURhQk1kVjZnMlJXcllWWSthbVhQNFRrU1V2c0Q4?=
 =?utf-8?B?akFtU1htVlNFalFDYnJIQnVTcUpZZ3M5OHJzcE02eVFSYW9WT3FzSk9paG9o?=
 =?utf-8?B?Q3l1elJRUDBhUnE2MDExVEY0R1hkTmNMZmJEcmRqSHp5d0tUS2pnTTA1WlFE?=
 =?utf-8?B?S012QVMwUTZrSnpMVldQT0JFNGIxTWxJYmltY2Y4eE14QXgrTlZHb1BtS2xP?=
 =?utf-8?B?UXNlV0Y2RDRXN0h4Q3BnTk5iSUcrWFJzaUxDV2duamNtWmtMVnJOcGtDRHBo?=
 =?utf-8?B?eDRudXd0Ri81OHBab2NGclJyV25ncjVMdFlrYnIyU3BqUTI5d2VtOHFaQ3Fp?=
 =?utf-8?B?Q1NtZE1aRmV1bnovNmVaZE1zeVZOWlQzOURQZmttYjVmcFhVQzNmMDRwRWtI?=
 =?utf-8?B?L2d5RjhuZVYxbHVWbzF4WU5qNlBId3RUVUFYMFB4aDJNWitMQnh4OGRxRjVn?=
 =?utf-8?B?ODkyWWw5YUpSYkR0ZVdYODZFWUhucUJUOCs4bjcwTTBqVFBId0VoQ0VwWWpT?=
 =?utf-8?B?Y0ZoeDArdUowMnVZUGZhWlJZNTR3dkNMR0pqcG1jSWlCZTEvL01UMmplL09h?=
 =?utf-8?B?ak9nVjRtVHJmaTdMU0VsNkh6Nk9NYzJUM1JQVlE3VEpOY3RFOGg5MzlDdVVL?=
 =?utf-8?B?NWg3V3FoSlFUczRUblIxVEMyOHQwSjBaQ0dIUGU4TjRiRHI5eldMcG9lZmJh?=
 =?utf-8?B?TXdjMlJ1cTVHOVFNYWtnTVo5TU9oZ3MyaDExUjNWd0hGa0VIeTJxN1h5STF4?=
 =?utf-8?B?UHV0OE5ydXVNaFNsVkdCcXh6UzJlQ0lFY3preHl1bTU4RG5Fc3N2MGhLUjUr?=
 =?utf-8?B?M2QydkFwZlhLWXdOaGdTUytvNlRTRVdQcnBUUnVjTlIzOTZka1ZSZUtSVUwx?=
 =?utf-8?B?UkZhZm54UGc3ZzFWNmNCYy9VbzQzWDlKdFRDZnk2eit3WEREbVBYc0d4MWR5?=
 =?utf-8?B?UHJ3VE1Nd0lPWVRzaDMvUHZGaXdnZndmbzNTNERKUmJMS0R5dE95aXVicU0w?=
 =?utf-8?B?RWpNbEhMSi80NFVYdUhqSzcvVUttQk94eXFELzF0M2pvZ0M0ZHFKVy9weW1n?=
 =?utf-8?B?NnIvYU9VTG0xM0NCU3I3ekthR3MzL1FSREJRQ0MvZ2tTajlnSUlIQ3BuRUp6?=
 =?utf-8?B?VVB5NVJNWFJLc01IdFpsNHRIaDJRcVdPemhrS2YxUDNqK0FDaHJhcFd6NTkx?=
 =?utf-8?Q?fHhEkDnJVZv5KVZ+70qcPQ02aKQW/ivuW6NrKuhJpw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 209a5705-c8a8-4333-e55f-08da02121910
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 21:16:38.2519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDTpjTYTwTcfhNUqdD2sNnIWYEptRDQRM4ODUPQrwqAtvjPMWwHByLb80549R7E57NEYePtpPyew07kVzxUA0exVWUgk1A+X6YZouBZ8h3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3951
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
Cc: Michal Mrozek <michal.mrozek@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/2022 01:41, Tvrtko Ursulin wrote:
> On 03/03/2022 22:37, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A workaround was added to the driver to allow OpenCL workloads to run
>> 'forever' by disabling pre-emption on the RCS engine for Gen12.
>> It is not totally unbound as the heartbeat will kick in eventually
>> and cause a reset of the hung engine.
>>
>> However, this does not work well in GuC submission mode. In GuC mode,
>> the pre-emption timeout is how GuC detects hung contexts and triggers
>> a per engine reset. Thus, disabling the timeout means also losing all
>> per engine reset ability. A full GT reset will still occur when the
>> heartbeat finally expires, but that is a much more destructive and
>> undesirable mechanism.
>>
>> The purpose of the workaround is actually to give OpenCL tasks longer
>> to reach a pre-emption point after a pre-emption request has been
>> issued. This is necessary because Gen12 does not support mid-thread
>> pre-emption and OpenCL can have long running threads.
>>
>> So, rather than disabling the timeout completely, just set it to a
>> 'long' value.
>>
>> v2: Review feedback from Tvrtko - must hard code the 'long' value
>> instead of determining it algorithmically. So make it an extra CONFIG
>> definition. Also, remove the execlist centric comment from the
>> existing pre-emption timeout CONFIG option given that it applies to
>> more than just execlists.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> 
>> (v1)
>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Kconfig.profile      | 26 +++++++++++++++++++----
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
>>   2 files changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/Kconfig.profile 
>> b/drivers/gpu/drm/i915/Kconfig.profile
>> index 39328567c200..7cc38d25ee5c 100644
>> --- a/drivers/gpu/drm/i915/Kconfig.profile
>> +++ b/drivers/gpu/drm/i915/Kconfig.profile
>> @@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
>>       default 640 # milliseconds
>>       help
>>         How long to wait (in milliseconds) for a preemption event to 
>> occur
>> -      when submitting a new context via execlists. If the current 
>> context
>> -      does not hit an arbitration point and yield to HW before the 
>> timer
>> -      expires, the HW will be reset to allow the more important context
>> -      to execute.
>> +      when submitting a new context. If the current context does not 
>> hit
>> +      an arbitration point and yield to HW before the timer expires, 
>> the
>> +      HW will be reset to allow the more important context to execute.
>> +
>> +      This is adjustable via
>> +      /sys/class/drm/card?/engine/*/preempt_timeout_ms
>> +
>> +      May be 0 to disable the timeout.
>> +
>> +      The compiled in default may get overridden at driver probe 
>> time on
>> +      certain platforms and certain engines which will be reflected 
>> in the
>> +      sysfs control.
>> +
>> +config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
>> +    int "Preempt timeout for compute engines (ms, jiffy granularity)"
>> +    default 7500 # milliseconds
>> +    help
>> +      How long to wait (in milliseconds) for a preemption event to 
>> occur
>> +      when submitting a new context to a compute capable engine. If the
>> +      current context does not hit an arbitration point and yield to HW
>> +      before the timer expires, the HW will be reset to allow the more
>> +      important context to execute.
>>           This is adjustable via
>>         /sys/class/drm/card?/engine/*/preempt_timeout_ms
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 4185c7338581..cc0954ad836a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -438,9 +438,14 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>       engine->props.timeslice_duration_ms =
>>           CONFIG_DRM_I915_TIMESLICE_DURATION;
>>   -    /* Override to uninterruptible for OpenCL workloads. */
>> +    /*
>> +     * Mid-thread pre-emption is not available in Gen12. Unfortunately,
>> +     * some OpenCL workloads run quite long threads. That means they 
>> get
>> +     * reset due to not pre-empting in a timely manner. So, bump the
>> +     * pre-emption timeout value to be much higher for compute engines.
>> +     */
>>       if (GRAPHICS_VER(i915) == 12 && (engine->flags & 
>> I915_ENGINE_HAS_RCS_REG_STATE))
>> -        engine->props.preempt_timeout_ms = 0;
>> +        engine->props.preempt_timeout_ms = 
>> CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
>
> I wouldn't go as far as adding a config option since as it is it only 
> applies to Gen12 but Kconfig text says nothing about that. And I am 
> not saying you should add a Gen12 specific config option, that would 
> be weird. So IMO just drop it.
>
You were the one arguing that the driver was illegally overriding the 
user's explicitly chosen settings, including the compile time config 
options. Just having a hardcoded magic number in the driver is the 
absolute worst kind of override there is.

And technically, the config option is not Gen12 specific. It is actually 
compute specific, hence the name. It just so happens that only Gen12 
onwards has compute engines. I can add an extra line to the Kconfig 
description if you want "NB: compute engines only exist on Gen12 but do 
include the RCS engine on Gen12".

John.


> Regards,
>
> Tvrtko
>
>>         /* Cap properties according to any system limits */
>>   #define CLAMP_PROP(field) \

