Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9996E8003
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D902C89364;
	Wed, 19 Apr 2023 17:03:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F673892A6;
 Wed, 19 Apr 2023 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681923814; x=1713459814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ytJMcZ0qP0lUyA+0j009FRYgbgPNYKM7NIutQ/cH1G0=;
 b=n5Gu5HE+Jo/BZIYrnYH7Y1ObtkQWy0RB14axyJtVgJSFvZ6c6IcMSC+L
 vRlBJILqvNiYl2FOmNHNZgjYsO87r15ZOXV+tcIU44MQPWqCDpzmVbwWI
 ap2Kj1Sb9ckokHzbADJsZcmPCJ3rfFdZ6hnCkjJr7yHAqpK/OGHpbTMYx
 kdSYTjZ3wdMG07UKQJi+MQXpQTMkRX6Cf02Mq0W+YLq2onxzF2nnq5yRw
 RLGrlegcayAKhkNZvRbeFGi7o2Bo7Tj+9AXBFpLdNZJlzOw4Lyo7qOqSn
 y/JLeLI+aKrxpUgqzRxiMoSQzL2QrEN9iqc6ixFvxuuXxoSAoIkZz3Rgw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344255650"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="344255650"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724125681"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="724125681"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 10:02:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:02:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:02:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:02:38 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NedHBCIsjn04DBKM4kShd+mubR+4SZKmyKt4beJ8WV04cn5Hr7MyiIXY7nUjzKe4m/4+l6Y/nQTAJdIPBdNBZrBc5yqmU0bKEg4tu5b4HrKjT9r1rg68UgGuUDBmZ9nO/59Rz7sKspPEqc951oYHy1gYSwT3JuET4y9Y6HjxnYXloeNqkrjnB1h5uvAJCfvC6pK1tGCCkKYHmoojtnK2jEakYfVLWV1zsu1lue8+hxygoi2XiErKJqk8DiiDi2Ffo3AixlPhHOQl6Z8MEaqaAdnhiApKSayeOshfMsYo0YlBFepEpgZkWdExuK9xJrq2HlpybcXGhIupo3fEjDrZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z02ehyJNZ0WbCY3x5aqRKcOcwSOmvjkQHnPHk5gwELI=;
 b=Wu4ANjaVYz/WkvrDMvX0DkVBbnD69EzpLEAABnQMxN6GRo4Ce1mWzGlDBX7GY9ASfj0JM69ryqDZX1UL0spJIAc4UGRgG3Yry5YB0nw3LqeKQ4yB5d357mW7piuetdA+bACWL0lrDaygp9WoyRSTPe5M+hv8WxmrH+Jkc7cyUKfHh/kwqqcNh0fze+F+8t6ixLUpIcrPzqyrDhEpyynvnhezqKJBD+1iLTU+4pDvtNVgRAq1GD4tTZ5oV6NtMEuHtEm4GVSjLlYUN6qRngWHarmnjlEonzt6dhd+NkLqESA/jrNlZ0IcECtuBRhEj0cOED1my22dljO1da4Kx0Lp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 17:02:37 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 17:02:36 +0000
Message-ID: <c3632e2e-c064-d3f6-a68e-c77a662b1d2c@intel.com>
Date: Wed, 19 Apr 2023 10:02:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/uc: Reject doplicate entries in
 firmware table
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-6-John.C.Harrison@Intel.com>
 <ff39e6ca-4ee6-149e-e0ba-13490306c577@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ff39e6ca-4ee6-149e-e0ba-13490306c577@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|CH0PR11MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: cb82e83d-54ab-42f8-8d19-08db40f7e015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/u2WzRQWWkvul/VztnSNX1WSXU/bHjZPh40ioAUwKu4L2uZmm8ohTH896m4KxGLT09qRvls0yhye0LKd09cdrIRBU6Xcw9YOngEl9j18ECem5UVOz3gYSTtGm7Xz0KgP5p8okLcavq9NN6uuMeUCKcNu/gSNK8BYtm3SD07/sM2wtcmChqRUQU38lGtMJKn5Ps4GQvYwZZm9k3GqgfgD41DEWvsIFaHNaQ4v8EKtkMaK5WQqrKepSYF6NFxzVwV1jkt1ccSi4xnO3yTaryy3LOJ+Qdy0O8OEGLTCehrabq1LFtk0LouHbMbtYOEwh5WxKnPGPI/dQQVIa48z41+Cd2TdcQpJzfsiNLGJqjRtZXGWyTG1gV7/tYTaRKYTyGkX8up3rMc//kIjDoTE4lN265PnCfD+e9rpJKnRTxmulODIgGFQWGMkYFAWBJGMCvApCTPjJZXYC6PnroYlO9nr/n0h4b0hus29qBYFoMm88MqFt/5Z8aoa7wbUVLBvLLXtt6B2cbbn5w+UJrk29+SHLErMpotpw+mxxU/d3UnaGnUHBbn39oMHjRT/rRuFybXc+h3rlExFjcsO+6YCBDGVUuG/0+gu8VPJtUmSxewIUrIN+/6gyqfaP0oq1YfeHCvA2+HddxVWZKitP/CSl9RYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(31686004)(4326008)(66476007)(450100002)(66946007)(66556008)(316002)(186003)(53546011)(6512007)(6506007)(26005)(38100700002)(2616005)(83380400001)(41300700001)(8676002)(8936002)(478600001)(6666004)(6486002)(82960400001)(36756003)(86362001)(31696002)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXFRaUZQMEFlTkxTQS9oSDExRUg2UnJ0eTR2RE9lbGI2eDJmVWhidG1USVNU?=
 =?utf-8?B?QTBCWDhiYTI4M3JKVXRHZG85WmsvRDA5WTdIZEIxY1lCdWRxM1F3Sk1UUHZv?=
 =?utf-8?B?clBLV0M3dGxpc2ZxdFFKSU53R0ZmWm1pb1JLaG1uN1I5LzM5T1RYaloxbUln?=
 =?utf-8?B?WmJURy9LeHJFb0dzM1E2Y21hME1seUpBNXRmWUlCb1VvSTltQWE2bWFYOWlt?=
 =?utf-8?B?MzlyRERoWUNTaDJWbnBwUEdKTVl4ZG0yVHloU2hla3dLdkxVczJ1SFVsNmlt?=
 =?utf-8?B?ZWt4cEZzbWRINjBxdDV5aUpremZwZGltc1UxU3BYc2wzTUF0ek84MXBZSEc1?=
 =?utf-8?B?MGNNV1JMMHh3VUs4WTJoMGxqR3FEOWlENTM5cGpGV2Rkd0NvWktOUDlyMEJG?=
 =?utf-8?B?dzl5OWhCNDc5dUdlZDVmekd2VnVjay8yREkrRFFCZW92L3RqbWNaNGpDc1hS?=
 =?utf-8?B?cnZzb1hJb0Z5U283Z2NncjNsZzZ6dEpaREh6MW5odVQ1RlVBbldJL2N6MWxy?=
 =?utf-8?B?ektGTDRtQnBNeFpmQkVqMHJkekpGTjZhdGx2a3RERngvbkdac2s3cUlmdkE0?=
 =?utf-8?B?NFRSMXl0STF1dVg3TEtmdjhhdUNkNUl0SHFMQVc4ODFGbG00MTNMeDBQWUp0?=
 =?utf-8?B?aUpnMVltOWw5QlBGR1RsRUdVcjZDZ01WaWVnWW04ejZtNS9kQUEyQ0c1Z1lE?=
 =?utf-8?B?bXUvQng2OXRDakhublNMUC8zS3lLTzRkRE8wZkZwQVVEOUV0c0VtNnY2eEIw?=
 =?utf-8?B?clViUFhBMUhsTjhuZXdlNUdnYXkyZXhyY2w0VUswR3U0VzloVFhsSHBRUjJ0?=
 =?utf-8?B?QjVpbGZFakdDVlRlcGtCMHJVTFlhME91NzV0OVh5dGZQeVhHVnliS0JTK01Z?=
 =?utf-8?B?VExVUGRlRmxVbmk0UStQRzQrVlI5MnpHa1Eyek50Q1NxeDJCaUJENE1sRG9t?=
 =?utf-8?B?V1F2cWIySkQ2MHkwVFFadHJLWE9tKzR0ZTRXUGc3djdrdXIvcE5xYy9YQjdl?=
 =?utf-8?B?a0dlWFduM2xJSzlXcVBIRTZJZUVRNU5LVGZ3eU1mL0Rta3h4ams5RnVha0gv?=
 =?utf-8?B?d2drSGlWZUJlb2Y5bG1jSXUxWDQwczZiaEZrSXh3aTVYRXpXVm5NRElDUDNK?=
 =?utf-8?B?ZjdtZ0ltSC9qOGQySVFLSElOQlRDWlBkRlNoaVVZT2JGUERZTk55b2ZKRkVn?=
 =?utf-8?B?aGUrRFJEOU9ITVl2TTBTU3pvd3NHbGhTd3JVWEtUd2lzajlsQkFUT2Y4NjhH?=
 =?utf-8?B?bFJrNzZkRldiSlZmdEtFMGtrWGo5T285RkhnODVnV2JOdGJSc29KQkRFQXlN?=
 =?utf-8?B?eVpTbThVZ2t3SnJZSDBhKzcyZkc1a0pQSVEydWxVSmdsTktyQkxBKzIzS1hE?=
 =?utf-8?B?dFFJSThvQndWTFAvVEovTFhVT2FKTG0reStscmVsalAzd3VITTV2YStRaVBH?=
 =?utf-8?B?bmtMaEx6QklJNzB6WDMwekg4ZElQTHNEU0J2d1dkbHJtOWk1TlVQQUZWVXpK?=
 =?utf-8?B?bEhkeW1lU3h5UGFpbGp3RTgzQjBjejJSb2pGaTBJRHdSUEJqL001MEhwMVJY?=
 =?utf-8?B?Ynp1WGl2UkE1c0VGSjFyNlBJZzVwdmptaFJGcFlUczBaclJZcERjblhzQ3ZN?=
 =?utf-8?B?clp2S0prc0pNczhEbVpMWWFUWkVCY0VNaVNsTWo4akFLZGR2U0htMkZ2NUJQ?=
 =?utf-8?B?TG82NkNoU1FIb2ZPVHlKVTJsNFo0NThjWk9TUFJkejlNOWhnQkZsVDR1RU44?=
 =?utf-8?B?cWMvQzR3U3E4OTloNVpUM1FmRmhMZ0wxWjJCQkRFMFpoK2F2b2lCeVpVQzF2?=
 =?utf-8?B?TXowWlAxTndralNIQWtRTGxhekZWNkVUQmdEWVBuc1lQWHBRQ3Y4WVhKNDJ4?=
 =?utf-8?B?TVBhOEtjTGhTVFoyaDBOK1ZnZElkVGxRQ0FESXRqN2pOSjhVejRXUmJKOE1B?=
 =?utf-8?B?SVBXRXJiVWY1L0dGbDBLUzFvZFQ4UW5NOUxJM21BY1hRazdEWlUrVHloVEFu?=
 =?utf-8?B?RE02T0xsTllmMnl4NHpBMWY2OW5GQXlJMDBqMDVaekZ3RFBQY0pNUzIzYi9N?=
 =?utf-8?B?TzAxdE5SUWl1K3lhYkFtR2ZGR3RQblNzSEtUdjBTR2RiVkpNWXJHTi80WDlY?=
 =?utf-8?B?QjNvVlVYR0MwOXFqc1JxcmtpdnpNRUY5TytHODlqcHVLZ2pNSFlxd2Y3b0s5?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb82e83d-54ab-42f8-8d19-08db40f7e015
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:02:36.5990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNse1EuIRMqDmPF1oQS+UXISxhVunOcxB3orDvtLuCeoFnNEXAOXxVJofjN1txHsk86HCeIxLQrRQ/y4TU8yu2oFRVmJPl4/iu54hTe+wV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/2023 16:24, Ceraolo Spurio, Daniele wrote:
> Typo doplicate in patch title
>
> On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> It was noticed that duplicte entries in the firmware table could cause
>
> typo duplicte
>
>> an infinite loop in the firmware loading code if that entry failed to
>> load. Duplicate entries are a bug anyway and so should never happen.
>> Ensure they don't by tweaking the table validation code to reject
>> duplicates.
>
> Here you're not really rejecting anything though, just printing an 
> error (and even that only if the SELFTEST kconfig is selected). This 
> would allow our CI to catch issues with patches sent to our ML, but 
> IIRC the reported bug was on a kernel fork. We could disable the FW 
> loading is the table for that particular blob type is in an invalid 
> state, as it wouldn't be safe to attempt a load in that case anyway.
The validation code is rejecting duplicates. Whether the driver loads or 
not after a failed validation is another matter.

I was basically assuming that CI will fail on the error message and thus 
prevent such code ever being merged. But yeah, I guess we don't run CI 
on backports to stable kernels and such. Although, I would hope that 
anyone pushing patches to a stable kernel would run some testing on it 
first!

Any thoughts on a good way to fail the load? We don't want to just 
pretend that firmware is not wanted/required on the platform and just 
load the i915 module without the firmware. Also, what about the longer 
plan of moving the validation to a selftest. You can't fail the load at 
all then.

John.

>
>>
>> For full m/m/p files, that can be done by simply tweaking the patch
>> level check to reject matching values. For reduced version entries,
>> the filename itself must be compared.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 27 +++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index c589782467265..44829247ef6bc 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -319,7 +319,7 @@ static void validate_fw_table_type(struct 
>> drm_i915_private *i915, enum intel_uc_
>>   {
>>       const struct uc_fw_platform_requirement *fw_blobs;
>>       u32 fw_count;
>> -    int i;
>> +    int i, j;
>>         if (type >= ARRAY_SIZE(blobs_all)) {
>>           drm_err(&i915->drm, "No blob array for %s\n", 
>> intel_uc_fw_type_repr(type));
>> @@ -334,6 +334,27 @@ static void validate_fw_table_type(struct 
>> drm_i915_private *i915, enum intel_uc_
>>         /* make sure the list is ordered as expected */
>>       for (i = 1; i < fw_count; i++) {
>> +        /* Versionless file names must be unique per platform: */
>> +        for (j = i + 1; j < fw_count; j++) {
>> +            /* Same platform? */
>> +            if (fw_blobs[i].p != fw_blobs[j].p)
>> +                continue;
>> +
>> +            if (fw_blobs[i].blob.path != fw_blobs[j].blob.path)
>> +                continue;
>> +
>> +            drm_err(&i915->drm, "Diplicaate %s blobs: %s r%u 
>> %s%d.%d.%d [%s] matches %s r%u %s%d.%d.%d [%s]\n",
>
> Typo Diplicaate
>
> Daniele
>
>> + intel_uc_fw_type_repr(type),
>> +                intel_platform_name(fw_blobs[j].p), fw_blobs[j].rev,
>> +                fw_blobs[j].blob.legacy ? "L" : "v",
>> +                fw_blobs[j].blob.major, fw_blobs[j].blob.minor,
>> +                fw_blobs[j].blob.patch, fw_blobs[j].blob.path,
>> +                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>> +                fw_blobs[i].blob.legacy ? "L" : "v",
>> +                fw_blobs[i].blob.major, fw_blobs[i].blob.minor,
>> +                fw_blobs[i].blob.patch, fw_blobs[i].blob.path);
>> +        }
>> +
>>           /* Next platform is good: */
>>           if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>               continue;
>> @@ -377,8 +398,8 @@ static void validate_fw_table_type(struct 
>> drm_i915_private *i915, enum intel_uc_
>>           if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>               goto bad;
>>   -        /* Patch versions must be in order: */
>> -        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>> +        /* Patch versions must be in order and unique: */
>> +        if (fw_blobs[i].blob.patch < fw_blobs[i - 1].blob.patch)
>>               continue;
>>     bad:
>

