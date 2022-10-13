Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E15FDD2F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 17:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593E810E273;
	Thu, 13 Oct 2022 15:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBFC10E270;
 Thu, 13 Oct 2022 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665674916; x=1697210916;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4nvnLxM1jHt/Rm6xT9mjDM6S2T2ReXyrj6RI9Hxcxmo=;
 b=PlD4RxHW0ukCyqbDlRdf8O5QwDaw7OdmOlQfiKx70HcbVPuplkWv4Vgt
 glVf/Zl2FmOAoMJJvyuBUGCdc7hRo05RNQSznCkrJPJUnQtLsg9wwesvz
 +WyE+BuV/ZZkYb9hbX+sxYDpeA9clie8dRjm+TeB7AChW+lBNRTdfS4ZG
 LkeWzJsLjy4QHhnAI8inQpllB3Ygav11BNK2YHftxmZ+UwyIJR0iMCdUV
 Q+99Vhcpx7ZQvziqM2NhXuv5KAljsai50OsXcoPoA88D6R4zhq9B0hnAE
 0IzruBxPVk6rYF+rdRJP6XVNbEKRJMFfYQtmEj49Bglixj3P/5q1o90/w g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="391419281"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="391419281"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 08:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="690158245"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="690158245"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2022 08:28:08 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 08:28:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 08:28:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 08:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsuL5hNwyglMQChkkUKKxWonn51C468lpAm2owhKESk4Tk1Q7nRLbpcdwIPCOshPgEaknFJ1UnOkQn0RqPDKN7nc2c+i44ZkFgTFMP9cNe68z9LqGgEPoQWQQJ0Ifve39G3DjMf8hzKBn4h9gDWa8wREqjveY1ndI4dGGpVe64nyRxKn2fvQW6EiL+VYMvBsJZ0AkzCNzrGfvYlFr/dHckRRfziciq4G33ZmhkuNqrX9Gbgi7CxLAq7w38iLvx9RXdoE+8GlUuSiQZzMkeeuxTz5JcxeO0nJm+k4lYmfSasTjCCr9zcy3aaE7krm3nt/GP0oNul/vXahR98nLrb43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhGuVUVzcKYu4unC9+239hBYDWfnRKyP3e6GdABGTvg=;
 b=ViEWmUNIQa+xErWQLRQkbxa5vhPDGYHv3KejHN7ksuLL6+6foZaogbBdg3IpwrGX7GD5qkmvJms2yZMNcqKazWXigku70CztRGmiFjsVEwuHxu0oDRkMn8EAPZa+vD9AJpRXGyie7+K7SkKFcGLSOh5SyqTNnMUj04EC/Mpv/MS0351u0Jnz1cumgQK33vNXZqUn/WfiqnEHgxC/jXAXEgq+0H6JNu4SRlUycGj++5Tf8RBRk0LeXheLnOAI/1QRk5rYs+fWkoq+41UwfYT3JZk6tP/RPcTxk2076hI9Omee5X6EVx0M86WkPvezB9PyFTed13vXXh5yohAZVr9l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 15:28:06 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5709.022; Thu, 13 Oct 2022
 15:28:06 +0000
Message-ID: <6cb06ea8-27a4-271f-4839-a4b5e3f91469@intel.com>
Date: Thu, 13 Oct 2022 08:28:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/slpc: Use platform limits for
 min/max frequency
Content-Language: en-US
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20221012182625.10219-1-vinay.belgaumkar@intel.com>
 <b8a7ee8a-923e-57b0-8c41-1deae1d61cab@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <b8a7ee8a-923e-57b0-8c41-1deae1d61cab@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25)
 To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a79b12c-e755-49c3-7c1e-08daad2f8699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZJSIjVNccQ2vQVTYbOCyj9K81y7QqIa2ilzpWEqfbGHSTYLzw76hlf+o23Iq6luUX5b/ubK6nnrlFpsFyzAl2KOoU0gGLTkE62uugLj3FtJQ8RQcpBf5achXzvq4WtnyaGFn9mfnuPWPGP9BV3daS+ChNaPAZI/VmJ+ejBBBiRVdkXdiazUrzZjN+EVRX5GcGFwROwlEJqFE98Yf5ht0l9QuSrJpj87WLzew1IabV0+0NQDxyrN4+VEu8KrFmnPdR3QMpFkmLHqYMkhPqTW24lAw1JiWS6XOP/sztkgfIrVLbnmJNO8r7Qv5JJMpsoCCrfwDLv4h+APuUOEt+4NF7g9lvEy2BYbm+MHd7VtHwk0/KS2wIYPEFBp3Fqiv0PmUyeGMYWdeUHC8aEHpCFJ8i6cbLzC3FEUBtbNpenmQ9mbfSH8YIB5ffv5AttLuIr6fSqqRb2ZIdMRfcKxVSlLmPPwmW82SlS6KBKM/SV93TMx76gYylyU1kHuivOIg4YrYsFHuIe7TxJYOxRA6kpNHEhjS9hEDsucaDZevRz9zY+nh9fm48GSZbgL40As5kwXF7F+gMDsjzeQ5IJIOC57OQFw9jegXeZzTyFQ1WRownTlD/6wv34X+FGNaiopCENoMSwjai3yHzQKsXFy5zBy94SrRoMbRko0Pne+wK7Y5Z5/6Z6etg6DQbwoSwTKT1wziwDc+z4rJpvrg0MPv8Matb4c2rirmLkO7C2zkYay70l//GOAoFIWFpCgFXirJc8yHmTQlpMgxeTiuphRBXNl5QTyLJvozZxkvioPYEvcIfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(53546011)(26005)(6512007)(5660300002)(36756003)(8936002)(41300700001)(6506007)(66476007)(66556008)(66946007)(450100002)(8676002)(6666004)(38100700002)(31696002)(86362001)(186003)(2906002)(2616005)(83380400001)(82960400001)(31686004)(6486002)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVCZ25KaVMzVGNZSkc3NmE2T0xKTWttNkNoTi81WW12QzVwUC9mUWY5WFRv?=
 =?utf-8?B?R2J6ZFZtY0dJRU9vTmdlL1ZxM2RNVHh1NnhHelFpZU1FZkNYUkVOdUNpN1ls?=
 =?utf-8?B?Tld0dWI0Y0h4bWtmbitDWWljOUZoaHVscjJXZmIxajVEY3hReVlQK1pFb3NC?=
 =?utf-8?B?clZ4NG8yUWZqTDliSWRqY1E2dEVHKzMrTGJQSVk3TjdYRkl3WVRBeHRUYjQz?=
 =?utf-8?B?eEJIYnU1RjduVHdSSkhFKytsQ1JTd1FIY1gzbU0yKzZQUGttUStFMi9ma3pa?=
 =?utf-8?B?S3drMVRLRkhWVEYwSXRtOFIxSWR2TVBKcHlMQU9CZEl1cVVxeEpKdStNQU95?=
 =?utf-8?B?aytXNWcvL3IweGZaV2lWV0QyT0JuZXdtK3FNa2I1YjJDcmkrNDFTQll6YzFj?=
 =?utf-8?B?NkcwSzgxb09XNlRndElkR01XNUtSeGtkQmxIYnVzZDJIWGxOL3Z3WncwVmEw?=
 =?utf-8?B?VHk1T2N5Y3dOMmRhQytibGlsMkZETHo0M1N2M0xpWjRLY0dFTnJQdHYvMjU5?=
 =?utf-8?B?YzR5UkF2cHlkL2FwRkY1cUVuU1k3a1dhNkxvQm83TGc2S09nTko1aVBzM3Jt?=
 =?utf-8?B?ZTFzL3hkMXNzNjd6VWZiSUM3elQ3VDVYai9mQUdDYUFBRzhYeUNPV29aMitU?=
 =?utf-8?B?aEtvRnpmd3h2Z3ZnL2NGWUdZWmRmVzErbnhHTVdpeDlndWFmeDF1d2hqU1Z3?=
 =?utf-8?B?YktGRFhHK3Fwa0EyczdLUkNVbXBXazJOajRLb0E5SVZQZTJZWEVPbXhTSjk3?=
 =?utf-8?B?UlVNMmhTMGhTWlcvZEh3SVRBNEZScUVWdjU0Y3p3bmRzd3R0NmxOVy94ZHFG?=
 =?utf-8?B?ME5rbnVZRW1vNGdLb0Y0WFd2OWxTK1QrT1A0NzlldEtWcUpOcTFtSTVQa01X?=
 =?utf-8?B?UEZZN2c4TjhOU1Z2cktiRVF0MnlFQy8reGZCa1dxdHRoeHYyT3lra3BNemw5?=
 =?utf-8?B?dkhEYlozc2xETmtISkdVRXBhcVRMU3ZiTHFVbjdIdEorOGJjOUc1aUtlbGJi?=
 =?utf-8?B?OU0rYzJ3Z0wvcm9ubmR2Lzh3MmhnQ0dRQUpDdUVWdG9RNTNFaFc2c2ZQcnVM?=
 =?utf-8?B?UDRCdzFvZHdTRmQydTdqTXVTT1RHM3R4K2w1eXZyU2JaalBLWTY5akFla21i?=
 =?utf-8?B?ZVVXaTc4NjFKcHdCMTVCSGtOTFdEai9KQzVrM0txTXNrcTV3WmhTRVdwb3pL?=
 =?utf-8?B?dXVqbnlJRWpseWkzSlgzclliaW82V0h6RDdOR25TeXlKNFRJUWZlQ0dXR2wy?=
 =?utf-8?B?K2VYeHFjaUV4TWFLZGdaQ3NIN2ZkRGUvcjRiWFh2bWNZakc2SlVyMElSek9F?=
 =?utf-8?B?bjlmam1MRDlJTXN5SCtsWUhLZnZRclduNmQwTmdQaWZEQldxK0FWN1lLSWVG?=
 =?utf-8?B?VWlTUGptT2M4RnhabVdFWjVJOFpkUVJnY1FSZjJGSG5nYzA5ZmNJSjUwTXBW?=
 =?utf-8?B?V1NzeVc1Y2VWOUtkR3czR1Fjai95Wjg0UVlqRXBwdzZsOGxVNFlzRC8yRDd2?=
 =?utf-8?B?c0M1K2puR3JKaWF2LzRWQUFRKy92d3UrYmsxd0hxcTRvL05NNVk5OG9IVXhl?=
 =?utf-8?B?cm5GZXVFNXlhODZGRXpFQzBrSVQ1WEQ4bVpxcWNobnU4Tyt4QSthbHRuYjJE?=
 =?utf-8?B?TmM0UWdOcHV5Q2Q5QVJhK0Y0Q3dSSG1JYmdDSXpqRHlKSVNIaXJXbWFuQ1Az?=
 =?utf-8?B?TlhRdzg5ZzlBSVdZWEtvMnJ4MkMrUFlUZjAyL1V4YUE4b3FnbGZiK0xOcml2?=
 =?utf-8?B?NlRCUThIMGNMTTZYOUpQVnJ3OGd5bFVtalRoTTZRT0RteC9DU083ZnBSTDJM?=
 =?utf-8?B?QWxrbUZXdnVybm1YVm1zUlo1VnFXS1ppaEw3Z2ZBdnFJcTlZcmtsVTAvckFW?=
 =?utf-8?B?Y1pkaEdjTm9HNDlLWTRaMS9GUWpFTHlUQklhUFUvOUt0eDN4M2xBYm9CTTdn?=
 =?utf-8?B?cTFidmJ2S21QVmJhcEZlelJFQUJvSUJGNXRLdElrTFRkU0w3dy84dXJWMzJ6?=
 =?utf-8?B?ZTcraDZUS0EzcEhWQVBabitsaG1xVnhSRjJnR1VxejFSSy84ck0vNkp0ZnhL?=
 =?utf-8?B?Y3dCd3BnbWRDY0IyYUlQWm55TGJlR3BZUTNKcUdzQjI2Vk43akVGOFNXZHZI?=
 =?utf-8?B?WFp4aUlXWnd0Q09ZdEhVSmxaa0JlZXh2RXNhTjNRcGdtQTJDaXlBaW1DSFFi?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a79b12c-e755-49c3-7c1e-08daad2f8699
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 15:28:06.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LooP9QpigC8Nv/zlr7s0FPVym5Bl3KjyZwh9wSWH4viioCrgSuPjoCPH3Wr3bX97S6A3R1E43MdR4WjfJr7hjNCXFO1fvEC9qCuNaAB8f0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
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


On 10/13/2022 4:34 AM, Tauro, Riana wrote:
>
>
> On 10/12/2022 11:56 PM, Vinay Belgaumkar wrote:
>> GuC will set the min/max frequencies to theoretical max on
>> ATS-M. This will break kernel ABI, so limit min/max frequency
>> to RP0(platform max) instead.
>>
>> Also modify the SLPC selftest to update the min frequency
>> when we have a server part so that we can iterate between
>> platform min and max.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 40 +++++++++++++------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 ++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
>>   3 files changed, 60 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c 
>> b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> index 4c6e9257e593..1f84362af737 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int 
>> test_type)
>>       enum intel_engine_id id;
>>       struct igt_spinner spin;
>>       u32 slpc_min_freq, slpc_max_freq;
>> +    u32 saved_min_freq;
>>       int err = 0;
>>         if (!intel_uc_uses_guc_slpc(&gt->uc))
>> @@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int 
>> test_type)
>>           return -EIO;
>>       }
>>   -    /*
>> -     * FIXME: With efficient frequency enabled, GuC can request
>> -     * frequencies higher than the SLPC max. While this is fixed
>> -     * in GuC, we level set these tests with RPn as min.
>> -     */
>> -    err = slpc_set_min_freq(slpc, slpc->min_freq);
>> -    if (err)
>> -        return err;
>> -
>>       if (slpc->min_freq == slpc->rp0_freq) {
> This has to be (slpc_min_freq == slpc_max_freq) instead of
> (slpc->min_freq == slpc->rp0_freq).
>
> Servers will have min/max softlimits clamped to RP0

Agree. will send out v2.

Thanks,

Vinay.

>
> Thanks
> Riana
>> -        pr_err("Min/Max are fused to the same value\n");
>> -        return -EINVAL;
>> +        /* Servers will have min/max clamped to RP0 */
>> +        if (slpc->min_is_rpmax) {
>> +            err = slpc_set_min_freq(slpc, slpc->min_freq);
>> +            if (err) {
>> +                pr_err("Unable to update min freq on server part");
>> +                return err;
>> +            }
>> +
>> +        } else {
>> +            pr_err("Min/Max are fused to the same value\n");
>> +            return -EINVAL;
>> +        }
>> +    } else {
>> +        /*
>> +         * FIXME: With efficient frequency enabled, GuC can request
>> +         * frequencies higher than the SLPC max. While this is fixed
>> +         * in GuC, we level set these tests with RPn as min.
>> +         */
>> +        err = slpc_set_min_freq(slpc, slpc->min_freq);
>> +        if (err)
>> +            return err;
>>       }
>>   +    saved_min_freq = slpc_min_freq;
>> +
>> +    /* New temp min freq = RPn */
>> +    slpc_min_freq = slpc->min_freq;
>> +
>>       intel_gt_pm_wait_for_idle(gt);
>>       intel_gt_pm_get(gt);
>>       for_each_engine(engine, gt, id) {
>> @@ -347,7 +363,7 @@ static int run_test(struct intel_gt *gt, int 
>> test_type)
>>         /* Restore min/max frequencies */
>>       slpc_set_max_freq(slpc, slpc_max_freq);
>> -    slpc_set_min_freq(slpc, slpc_min_freq);
>> +    slpc_set_min_freq(slpc, saved_min_freq);
>>         if (igt_flush_test(gt->i915))
>>           err = -EIO;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index fdd895f73f9f..11613d373a49 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>         slpc->max_freq_softlimit = 0;
>>       slpc->min_freq_softlimit = 0;
>> +    slpc->min_is_rpmax = false;
>>         slpc->boost_freq = 0;
>>       atomic_set(&slpc->num_waiters, 0);
>> @@ -588,6 +589,31 @@ static int slpc_set_softlimits(struct 
>> intel_guc_slpc *slpc)
>>       return 0;
>>   }
>>   +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>> +{
>> +    int slpc_min_freq;
>> +
>> +    if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
>> +        return false;
>> +
>> +    if (slpc_min_freq > slpc->rp0_freq)
>> +        return true;
>> +    else
>> +        return false;
>> +}
>> +
>> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
>> +{
>> +    /* For server parts, SLPC min will be at RPMax.
>> +     * Use min softlimit to clamp it to RP0 instead.
>> +     */
>> +    if (is_slpc_min_freq_rpmax(slpc) &&
>> +        !slpc->min_freq_softlimit) {
>> +        slpc->min_is_rpmax = true;
>> +        slpc->min_freq_softlimit = slpc->rp0_freq;
>> +    }
>> +}
>> +
>>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>   {
>>       /* Force SLPC to used platform rp0 */
>> @@ -647,6 +673,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc 
>> *slpc)
>>         slpc_get_rp_values(slpc);
>>   +    /* Handle the case where min=max=RPmax */
>> +    update_server_min_softlimit(slpc);
>> +
>>       /* Set SLPC max limit to RP0 */
>>       ret = slpc_use_fused_rp0(slpc);
>>       if (unlikely(ret)) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index 73d208123528..a6ef53b04e04 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -19,6 +19,9 @@ struct intel_guc_slpc {
>>       bool supported;
>>       bool selected;
>>   +    /* Indicates this is a server part */
>> +    bool min_is_rpmax;
>> +
>>       /* platform frequency limits */
>>       u32 min_freq;
>>       u32 rp0_freq;
