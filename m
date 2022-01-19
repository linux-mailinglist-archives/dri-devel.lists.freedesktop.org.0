Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E7494259
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23510E1D0;
	Wed, 19 Jan 2022 21:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6DF10E1D0;
 Wed, 19 Jan 2022 21:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642626448; x=1674162448;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ieyVre8jZBFM7c4kCHzDOeMno947WMxy05hXuO318A8=;
 b=T0X1zDQECtolkLByGG8yGiMzXC1HydY2QzTSX8xW6Z1HkTzOc7XYxgwO
 O+HLzQcoiCTtjFlamkKaJzMkEwt1GmvvlewjlLt+29UZBzcM+7TKjYhUm
 YgCX33CFxObXEoOTKxPGdboVAE1cvYMyh68eVgBkaIGuu3ORMxuA7fLPK
 FJeYc9Kk83dJ5ToJ+CIghnfNG45Uq7U7TCeV/45gScjBBY7/DKv/7SLhb
 PNpMWQ4sMM5ZUdkHVFOWB95NwBNz+oPTpxHM7lPJ1cENUWYjXkK4lL0HQ
 hHx+2AUTCNDqJggO2nuJvgtH4Wnne4gHsrTiR60ivyaNT1vBm7Hh9Seic A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331543924"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="331543924"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="693940588"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 19 Jan 2022 13:07:27 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 13:07:26 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 13:07:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 13:07:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 13:07:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmSBxhCLCzqtbU+Tj18s/uw6jliLHKrpULjSYaYnaCRkztre0VErU2rsa1wehB1CM3cHJrajtMCN+RRsvVssW/wAyq52rkVLYSAxpBBSjhx4TJ3SkBFVVj7Qqe+60NnrnJqal67yE1zOvxtl/puZETneco2WiqBEcm9AJA7Mo03K89tp9An8NEyjEzauHFH/TLhfQr1Xhs/SQTDQqTzEBTEntgXbAWXjepm8TRTp2tsiOc24/YKQqqyNZMb5BcJPNRDWwphGyYNsp6k9ePYaBS6m3BMeFmG26IoyNArkZKoLql/fWaQUOuZj61+McnVcJI3cwGy7K6X+1U8b3TqzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtH7Eu4NNmt0nj2vkVueCTSwLXVQgLkWZsI9G+pSWBw=;
 b=kPhnBbm3lN0frFNpgizKD/sOiN5xR1q5ERimn3JTA2nTmI6C9jeRG+RrI6QX1n0qVd8kzqGLPoajktnH/wCLNgOFUFo439xTm0S3+iHWJHlr8lgLmENm7J94HKayu9PMdxCAh7z6KTP2ye+vY29xJ2xHV4SPF5xpmQfzPE/2BSKDYYDRw+tWWuYfq4WoNxPxOMnFlSyRV2vn5p3rfXa3zyNUlOWRRS9u5O/JYAL4AMxcA9zgP2hZGFqx6+xWUsivJ3KYAkREfVZOZwY0VTk2fkm7lWhJ3avbdRRSCu7ZKCVpwTEnIB7clQz63LGmXmpaWIM7A9tYOO8t50g3wDHKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB2779.namprd11.prod.outlook.com (2603:10b6:5:c6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 21:07:24 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 21:07:24 +0000
Message-ID: <4f6e2027-bf15-7c84-7573-74c6d5daae42@intel.com>
Date: Wed, 19 Jan 2022 13:07:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-3-matthew.brost@intel.com>
 <50355add-0758-c4cc-df74-a6bb329ceb15@intel.com>
 <20220119205405.GA32440@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220119205405.GA32440@jons-linux-dev-box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR22CA0049.namprd22.prod.outlook.com
 (2603:10b6:300:12a::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9b0efd4-45d4-4ff0-dba1-08d9db8fb0cd
X-MS-TrafficTypeDiagnostic: DM6PR11MB2779:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB2779B7B18E589B0F5CC150D0BD599@DM6PR11MB2779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnoL0+1Ba2I9oMJStibVsWi16CNetFU/E5EDV7eMB35ScvCfUzgLU87LMNnS9kXOXs76Wq+hCTDT6cD9FxsDXL0XtezmYclCurQVb7Ybm7i4P38st6cR/mkJjDxWjeT1ZhfKiwHQAjaY7LGQqpEQ7joKi2Rfx/WFQ6BeafU3dCr33DuZa78CTl1EJ43k1WMOl0dH1EFjAMC3VCF1Us/aoSB3yu4f1f3+ljMND+0zZurf8VL55UT6GAe07Tv1VkQaFLSinGWuBh1YOHtMeFkp+V/NsDKFNgu74r3ibeh+Diwl7pq9z8g7h1zJDueuj0HXtREPcnHNkQgdFQKhMXviil82cvXIG55eIiAzQkyz1x9M3nmAlchVXNaHCsCw/gZfpj0qob/+gOv0KSijb6/tn7BJzaOetsReSSDXHVTyFcDWu8lbQvbg+rkzzWHvzpk1IgnNmyhNDw4hwhRU78etJBmNbyMhQR0ZbwrUINy3I8osglQ9vqN3xRT+wym9xzH+DEoO+38U2Te8E7qqgdrLafaClHiVKJROdS/iww1dD0yxH/jBtpBalZGJzVjvVB4vh+czyNW3TZSJ753U5dJCd9GCyT0Uyex2rEMMj5hts62cYlZ27sw9aOkcYvSLFZz2O2HCdcgv1viqA6NnddYXlCjrA5wdACdykXqERWG9L+cFfuUsbAzGByVWuIz1BQlh/A/+NKXxC93+7sHKfSKPBqWUhQwub4vPNGV5uMU5SmWAIoPlhul6NXB14v0eNKjb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6862004)(6512007)(8936002)(5660300002)(6506007)(66556008)(6636002)(31696002)(26005)(66946007)(86362001)(36756003)(6486002)(53546011)(2906002)(37006003)(83380400001)(8676002)(31686004)(186003)(38100700002)(2616005)(316002)(508600001)(66476007)(82960400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZTaUovcmd0am0ram4xY2dVMy9GMEFwWTlucEZaQ204d2xQLzBsMHR0cUEx?=
 =?utf-8?B?aDMrZExtcnEwWUE0cUxzVUhlSGNMdDJJUVk4Y3NGb0FzUm16R3dLWFZ0c0Ji?=
 =?utf-8?B?dmFkM1lnYm8rZlptYytqYitKMHhScWplZ0k0ekhZbDJpaHIwcmo3REEzT1ND?=
 =?utf-8?B?WWl1UUZKVjNVb3JkRzEyWlBvN0FESGpMWThDeGVWVmVqMmRWVHhoY1NaVG1s?=
 =?utf-8?B?WUNXa3pmYVIzRHRRS0V3YjNnbXBtam1kRjZ1ZmJRZzMyVlRtcEdza3Btd1Fx?=
 =?utf-8?B?RlVKU1k5alNNdFZnTjRCcnJua1RvdWhVSE9GcG1hQXo2U25sNDY5WjFqZm5q?=
 =?utf-8?B?Wmo0ck9jcVlWS0NMRzIrRU56cU9zR3lSZUlWNHAzTEl0MW9rZnlmczBjM1JH?=
 =?utf-8?B?SW90UWQ3WW9iZXQydjJsbHkzZjdZL0NucVBTbTJpakV2UitjTnV2WjM2TzNN?=
 =?utf-8?B?RjhpUTdDVXhYLzRPbmZmR0gyUjduR3gyQy9jSWxzRVdoV2F2b0g3ZGlxWU1N?=
 =?utf-8?B?d3BNaGl3Y0JMYUxZdC9DbDNtd0RPaDZGdGViSHJkRDJYNXdVakxvZ2U5bTJD?=
 =?utf-8?B?dWNMUFZSb0NsUzVyTUk4NDhQUlBXblFlendhTXlqNDVaMlBwbERzZnhzeGc4?=
 =?utf-8?B?eWdZZFB1V1lQeFI5YVVvdFZZNjlpdnE3WFo1M2Z3cXIvQXE3N1JkT2g4NCs5?=
 =?utf-8?B?RmZnaGdML3hPdnc5bVFWWFg2eWR0V2tTa2JQZzc4MDkvWmlTT08wb2g4TEF0?=
 =?utf-8?B?dnJYU3A3R3dXR3pXMHArQm9PZEhFL0ZrWndNcVhkTXlIdjdLSlBlSVNLcXpN?=
 =?utf-8?B?MkFYcEJDVjRTWE03RjlrU1BvT1l4WENjaEVENDdEY1BLMGV5SzFxWFNrK0w0?=
 =?utf-8?B?Y2tIdENTL3c0RCs4cTZPNktzQmZrZk95ZnpKakpaaE5tT0xDekQ0ZXdnR3Nk?=
 =?utf-8?B?R3JHK3hWK0VybkhLOEQ4Y2tHbTdINS9YOExMQzlYbG9McW1TNXdEbGJFN2V6?=
 =?utf-8?B?RVg4cWdFOEdGSmNHWGU2TzF3aVQ1cFd0NlE1UGtBZ09ZMWdobHF1MHZmNDZH?=
 =?utf-8?B?M01TS1dIcmY3QmJYSlNLbmtocmd2THlLeWdQUXo3UnhyM09mekNYa1QzOVMx?=
 =?utf-8?B?b1luc0JaYzB3WEFaUWlXcVFoWmMxZEVyK1Y5MmNvU3ViZHEva2VYZ3RKQXYz?=
 =?utf-8?B?aERHS3hBZWtCZlY2T0d2OW5NS0pIWXZzQndYRUNNdkpEbzIvNTQwc2xSbFlW?=
 =?utf-8?B?ejJPdlZEdDJ6ak5qYzFsQjIwL29mNlhEQk8vWkZudHJDWWFaODFsOHBCdElp?=
 =?utf-8?B?SlR6eC9wVVZHMFRhREhCMTdPVHptdjFmNDMwWnlldDRpK2liOTYwb1J5L04w?=
 =?utf-8?B?bzVxSExuUFNzQmJRZ1dHMys1TTZlbFkrcmZCc1N0bzczMnIzcG9XbTVMVFhr?=
 =?utf-8?B?VFM1MDdJVUZnYzA1cEN5d3gvODE3TEo4U3UzMmpJVnVYVnQ4c3ZTckkySkx0?=
 =?utf-8?B?ZUJBSkx2VEVhdnVZOGVwN2tOQ3lyWjA4UjNWUjhzU04yR0lYSlg4dWNHNDVh?=
 =?utf-8?B?bEVlOU1ncmlYSjcrVVVteW84R25DY2ZNTkR6eFljdUx2QjFXNGFQK2F0VXQ0?=
 =?utf-8?B?aU16cU9XSlBwZVBXNG9JdjU4SzFjL2F1Ykg5Rmd4bXd0TitaVzM4S1V2UXdV?=
 =?utf-8?B?S0ZJaXhMUEFnNWQ5bVZVcWcwUExRV0E1c2RzUzNzdWRQYnJ1dXY3YVJvazdi?=
 =?utf-8?B?ZXNUSkw2ei9CV0luWHpXcDhERFJJSXZBNk91d0FxQUJEbXFqTU5rT2RYdFNy?=
 =?utf-8?B?Z2I5Z2U3aWFJaFFIbmVPMkN2TWV6NUVLWDFCN25JZDQxUHN6d3hnRVhCSHhY?=
 =?utf-8?B?eldSTXVzS0hzdzFNUzhHeEZwb0c4S09kaTBNTERNRVJUSVBhUkQ5OVpUNWJF?=
 =?utf-8?B?dFdCZ2JCSEVoOUJmVGFGWnRyelh0cnhRT3F6RFFtN2NaODd0M01WWDR3ejdZ?=
 =?utf-8?B?cHJnT2ZaNnhmaXRDWm1GSHJrbGhYT05YdERLVkdrd2lPM3h0dk9adnJNdEdS?=
 =?utf-8?B?S3VONDBkbmNCQytYSU82L1dyZzEyOXd1anJ5L2RkbFlLRm5ES0k5WUM5OWVK?=
 =?utf-8?B?ZlU3T2xabXNKd0hkbDV6OGdlL3I4Mi9BeXlVRGgya3JTUm9BVXJxVXVMSlFF?=
 =?utf-8?B?NWNNM1RHR2xOUzBvNjVaNzVmVUNUcnZKMWt2MjAwY0tDSTVMWXlxYi91WGxP?=
 =?utf-8?Q?rjm/1gDHt+DnM1KpfGAJ2SzAU/VazM8Dzb4Uyyf71Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b0efd4-45d4-4ff0-dba1-08d9db8fb0cd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:07:24.3816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBbYSxLBV+VlwIY7FjXpz1p/QuJ5tolPhWRKJE5hUgLZk05tf6clFhiSOYKyfACM88NiDEYgEf0kXv9eJRPFcJ53ezVhpR8nmOjhL3BXdnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2779
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/2022 12:54, Matthew Brost wrote:
> On Tue, Jan 18, 2022 at 05:37:01PM -0800, John Harrison wrote:
>> On 1/18/2022 13:43, Matthew Brost wrote:
>>> The G2H handler needs to be flushed during a GT reset but a G2H
>>> indicating engine reset failure can trigger a GT reset. Add a worker to
>>> trigger the GT when a engine reset failure is received to break this
>> s/a/an/
>>
> Yep.
>
>>> circular dependency.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 ++++
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 +++++++++++++++----
>>>    2 files changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index 9d26a86fe557a..60ea8deef5392 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -119,6 +119,11 @@ struct intel_guc {
>>>    		 * function as it might be in an atomic context (no sleeping)
>>>    		 */
>>>    		struct work_struct destroyed_worker;
>>> +		/**
>>> +		 * @reset_worker: worker to trigger a GT reset after an engine
>>> +		 * reset fails
>>> +		 */
>>> +		struct work_struct reset_worker;
>>>    	} submission_state;
>>>    	/**
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 23a40f10d376d..cdd8d691251ff 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1746,6 +1746,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>>>    }
>>>    static void destroyed_worker_func(struct work_struct *w);
>>> +static void reset_worker_func(struct work_struct *w);
>>>    /*
>>>     * Set up the memory resources to be shared with the GuC (via the GGTT)
>>> @@ -1776,6 +1777,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>>>    	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>>>    	INIT_WORK(&guc->submission_state.destroyed_worker,
>>>    		  destroyed_worker_func);
>>> +	INIT_WORK(&guc->submission_state.reset_worker,
>>> +		  reset_worker_func);
>>>    	guc->submission_state.guc_ids_bitmap =
>>>    		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>>> @@ -4052,6 +4055,17 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
>>>    	return gt->engine_class[engine_class][instance];
>>>    }
>>> +static void reset_worker_func(struct work_struct *w)
>>> +{
>>> +	struct intel_guc *guc = container_of(w, struct intel_guc,
>>> +					     submission_state.reset_worker);
>>> +	struct intel_gt *gt = guc_to_gt(guc);
>>> +
>>> +	intel_gt_handle_error(gt, ALL_ENGINES,
>>> +			      I915_ERROR_CAPTURE,
>>> +			      "GuC failed to reset a engine\n");
>> s/a/an/
>>
> Yep.
>
>>> +}
>>> +
>>>    int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>>    					 const u32 *msg, u32 len)
>>>    {
>>> @@ -4083,10 +4097,11 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>>    	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
>>>    		guc_class, instance, engine->name, reason);
>>> -	intel_gt_handle_error(gt, engine->mask,
>>> -			      I915_ERROR_CAPTURE,
>>> -			      "GuC failed to reset %s (reason=0x%08x)\n",
>>> -			      engine->name, reason);
>> The engine name and reason code are lost from the error capture? I guess we
>> still get it in the drm_err above, though. So probably not an issue. We
>> shouldn't be getting these from end users and any internal CI run is only
>> likely to give us the dmesg, not the error capture anyway! However, still
> That was my reasoning on the msg too.
>
>> seems like it is work saving engine->mask in the submission_state structure
>> (ORing in, in case there are multiple resets). Clearing it should be safe
>> because once a GT reset has happened, we aren't getting any more G2Hs. And
>> we can't have multiple message handlers running concurrently, right? So no
>> need to protect the OR either.
>>
> I could do that but the engine->mask is really only used for the error
> capture with GuC submission as any i915 based reset with GuC submission
> is a GT reset. Going from engine->mask to ALL_ENGINES will just capture
> all engine state before doing a GT reset which probably isn't a bad
> thing, right?
>
> I can update the commit message explaining this if that helps.
Except that a failure to reset is notionally a hardware bug. As recently 
demonstrated, it could be a software bug due to timeouts being broken. 
But officially, it is something that should never happen. So in the rare 
case where one does show up, we would want to know as much as possible 
about the issue. Most especially - which engine it was that failed. And 
if all we get is a customer bug report with an error capture but no 
dmesg then we will have no idea which. It just seems wrong to be 
throwing away potentially important information for no real reason.

John.


>
> Matt
>
>> John.
>>
>>
>>> +	/*
>>> +	 * A GT reset flushes this worker queue (G2H handler) so we must use
>>> +	 * another worker to trigger a GT reset.
>>> +	 */
>>> +	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
>>>    	return 0;
>>>    }

