Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D563E6A1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 01:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8908910E51D;
	Thu,  1 Dec 2022 00:41:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329210E51D;
 Thu,  1 Dec 2022 00:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669855283; x=1701391283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tolwVVpbhFP6iuPcElY6x39QLeCRcR0RSp6If0naVK4=;
 b=msbIe49PcXTyTCPCfGG/veRnxf97ePk5ynq3CudSja5Y7xYVj5ziP3Yd
 3pDt9WzxJSxam98xibFL9cPECSsLpgOf2Il1ZmqVzFBaqntvlscDoqc5V
 4tBXjSiwC8KHJpxoJPb8aJiZnoEeVXGx9/sNK73Brn/Y/k44HqS6pvlfD
 G0RoEzdZSKmwFE0c5sV+V74ZLWyyjG78qFehSmrPMps+t1YJbsbSX7os5
 oEYfVkXNir04guzxpffOKJotq8TRfab+gafrynhOP9GLQFAg1kV03nH4T
 /Y008BBIHoy42+dzQVDNI6KMERSqlTrQGpzvQEnmUnV8IvLCbKKiqHbn9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="342475957"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="342475957"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 16:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="818836862"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="818836862"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2022 16:41:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 16:41:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 16:41:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 16:41:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 16:41:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4cuXeldKBlMj35hHO+NO+q2cbISy+SpUQtRkFcxuUoaa9rQIOwjE1/tSgMw2pvEzm3Tw96z3LpXg0EIACz4raWN6sCpAhEeI7sOCmlhM78QJ0c5wbBClOhGxPKRCehNKI5Mq0BUCIfvVZjauFMA5gUDkdeW3q5S9jrQlK7XUO4fvD3qI5+fGV5PCf/SDcfD8xXmRtAP0YWR1dFoHPTCgvY0H/bTfwBYyUMOxSYMzqMlL4+LPF0fU1Is2lDUpUkYxk1cTN+0jWrCdSWH/eQeFs7TzeOO4kRTQh1XiIlpNYMTIXmT12+AgGG41LF+gZYR8TGxxC2+R6rh6xFqYlHrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eo+qCl8ZtqTWH1M6Z2/DgqwFw2EXo1pLE1E03/QTDU=;
 b=i1gemIz90kijZ3LAl7ptiPSGfJdbYHDrVqtUetMHIairsV+MlCrggCxxhe3kHk+Hc4iIklpqCfdk2BActB/WdaPfzWufAbUvMA1XBe1sHOn0rYuijHaofYVIjhirG7Vx0d3aUaOW0xVFVB3X0EovdS70UdHmCUt3R0H2N9xrxmpfB/WwOEeTrD38CBm6XomgoQ/AhktjXEcPTNc6nOLm7Rn7Cia90x23L+DhH8eC5vs1ow+D63OTS2kq7AFXfzzH+7KRm3u1KbXlRV8yIdX4vDQF406MaNPDgZytbpGAVzokK4F7noo3VKOgjpZDuecDG3NITljeDR7lbT6AmSYhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 00:41:17 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::aaaa:56aa:988:ba00]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::aaaa:56aa:988:ba00%7]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 00:41:17 +0000
Message-ID: <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
Date: Wed, 30 Nov 2022 16:41:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::37) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b079e0-d54f-4a59-f89b-08dad334c216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ywEQ6fvZi/yIy/NvGP/HvqWRc+5FGLVzkiMOONRhu6ChYF214xKOtA42nzUvNOGlZy+HLcMPu49SEck6zlj13cY6iwiN22mINqvJBsjeIjGLmmNK/AgLqS2LvcM/OAXTuZ0/U2P8trmPJWH2lMpPEpLxet9JIhrl8XNFJ8JL37kQLTsQY+7V32GeOVS2tdR3CBUOzXnAPXg7yMuBF51YXg2E/R9fwX1cCMEnipZaRN+z+5EV4/PWgxM4P7yBcgY4rZaizHgptv5ebQi1YGNvNGdF45nL/p3ajK3N2RdWL3rCvJA4Wj/sP14AVD11TwWSx2BbkNWDylxEo5J39dy98MrOkQzVNmCJirEnPMrRXOcrVdKA4prKY+u7H+o02+/+wDPKM3fnxyOb81QLO7fmi5rK7aOWGOI6ltYjnNcUx47aplIbqCsa/fVfkDwwgArX50uDXMjm8x4tBAaF1Di9mZ/Swv++WiVJ1KgLBMDUU1zUOOZP8OK+UlCJ1eCXwLSgaWEZt+mH7nVpr+zAg2ydDKjxjkr7py4HA9nNeteBaioBgFy6ONsu79zP6YQa5b25uH9s4mCiYALU1n7fFGZ+7IZQtNqyFyqySZjNO6H8AOm+jj9832dGzvbkMTrhQY1tWu4L7EjSsqygnWdLJ4q/k0bKWklTqFre8CWph5Mg9ugcGNwWJBlHwQNKWxBK/Nzxjn+7VwGyni2HVOr9bbc49LfximgVt+6U3h85k80nRio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(41300700001)(186003)(2616005)(8936002)(36756003)(2906002)(31696002)(86362001)(83380400001)(66556008)(82960400001)(66476007)(450100002)(5660300002)(316002)(66946007)(4326008)(8676002)(478600001)(6486002)(31686004)(6506007)(38100700002)(6512007)(30864003)(53546011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFlM1VNM0FDenpkc244aCsybGtHeVROZkpvcjZjWC9BVDRIY1dWaE9VbTRR?=
 =?utf-8?B?VFJDOWJGMFJaaEUzcnRpclo2cFFjaVc3cmxMOXJMbS91MGNrS0pvUmkxQUt6?=
 =?utf-8?B?dzkxYzNCUTVxeHNXR3ZqU1ppY0xEazZJd3NkeHBFUThYY0dGNTFuTEdjNFZY?=
 =?utf-8?B?NzhvYm0wTlFZSElGdVE4QytIRGxlQkZMVklseFg5RC9NdEJSSys2TFhXa2pm?=
 =?utf-8?B?NldjMkczVE9INVVoa3I5OWlIeGwzOG1nVzBPc0dOdXc2dnFyN2dlRnptWTZl?=
 =?utf-8?B?bEViMWJhMWpjN2t1WXJMN3ZpUUtwaUhkU2VpY0s0S2FKK3VaS3FvNlIwQi84?=
 =?utf-8?B?aC9paVFUeloyNTdEV3Yza1lNREloaEpxa3ZCZkVPMXBsV00rLzJtUzhwQXBL?=
 =?utf-8?B?RGE0Z0NQOE5RNStZTmc5OVhTTktYNFNGY1cySGtXTi8zSVBVZWRtQWN2cFRC?=
 =?utf-8?B?SkcxemxhcHhIWnpaZlNCQ2kvL2lodlFCTkRxeldLMjZsR3F0YWNYcFZFQ2lh?=
 =?utf-8?B?TVpxVjRQUHdkc2MyNnVNd0J3Q0tGbUNUei85V1M0VHNkSUxCbkp4TGRabzVM?=
 =?utf-8?B?OVFVdUcyN2l1cXRTdnFpaVNGNk42RG40SGpTZTdtcnN2NWc4K0I5WlBjWS9p?=
 =?utf-8?B?b0QzV05BSTRkYzM5T3g2ZU9qYm9zUTh1Ky85Umc5SDdVaTBjd1ZaeUQ4RitE?=
 =?utf-8?B?K3I5NVNUb2NoZ1ExTUgxTFVQbGZDT1Y4UUF4dHlnR2ZYK0Z0aWUxMzFRS3Bi?=
 =?utf-8?B?bFpJdXhTbm0vNkNQRkF3RHo1UU9oS3JEV291OXRwQ1JMSzFBTU1aeDhkRDBP?=
 =?utf-8?B?UVRhcVpjTmlSZUdPeUIyc1VzK2U2WmlZTVpLRk11ZTJobjFSejhnNUJJNkhw?=
 =?utf-8?B?czBxT1ZWakIzdzkxMlNmN3lBTHIvREFLaFVXVENiUFliSlJqcFovYmJ4M0tY?=
 =?utf-8?B?NjJxNjZ0TlQ3Ylc1L2xieHJlOXl3aTlrUytyWDJYZmRQTy91THNxOGF6R3hC?=
 =?utf-8?B?bzBFZW1aRHdlY1NmNzRXdXZNUVBjYnZIdytTS3k0UGUyWWhvVzJvRk9aTHZu?=
 =?utf-8?B?UjVlTGtxSUlrNGxPdXhYaDhGVS9seFBtZk5nRXVoWExDM2x1QWNBaVdQWFlT?=
 =?utf-8?B?aFlNUDlHR20rd3Bkc2Y1dnJibHBubWZONmxteVBTMU1tdlpXV0k4N2UrTnI3?=
 =?utf-8?B?SXljQjhzZTUxbCtFc2hpWVNKcFRvcnpJZTEyTGZtRXZwSGRnZG9iY3Yzc2oz?=
 =?utf-8?B?M2FKRkw5MGcvbXBOS0YyWXRwRjNLb3RucmNCSStEN2MwbDBqUzVJb0FWc0pB?=
 =?utf-8?B?ZWNGdU5jZEtROUlJNzJidWQ0ZzBTdmxWRkN6aldOYTNzMlRyWWlsMHB2WG1i?=
 =?utf-8?B?czJwYXBOR1hKRkUxN0daS0V4Z1NHUWpZeXl4ZXVNME8vNHdwVSsya3VQcXk2?=
 =?utf-8?B?dnp2dmJjUUR3YkxDdmpnSEpJSlk1R3RjWE1uTnMrRlBzbmtRVWFwQnYySVZ5?=
 =?utf-8?B?VDZMTlE1aDk0YnVqMHArTlE2WDk1U0VaK2FDdElGZjlYZE95bUxDR2lQdkEv?=
 =?utf-8?B?cmU2eDFFL3RqZnlWVm1WK1Z0cUhmV2FOL2Z6MVB4NFd2RVFjKzMza1NyVDBm?=
 =?utf-8?B?L2g1UmVDdEI3K1FxTUtpR00vb25vNVQwMEp4TnIwcndqUzNHY0tNeHhNTzBx?=
 =?utf-8?B?bWFBYlIza1F4MUpzanZ4U1RLc21GcGxINE5pVHJGekw5RHZlU0piTHJTQUNj?=
 =?utf-8?B?ZWgvZXBuemVMQWhXY0d5cVRkd093WFdrMm1jQmt3Nk4wa3NRaC9wY0FHS0VJ?=
 =?utf-8?B?MDZPMVZYVS9pY0pHR2ttMC80aEdPcW5yYlpKL1JxRmFoME1uUk82c0ROZUtz?=
 =?utf-8?B?SUU2QjhHeU9WL1Fqc1NjejA5dWQ2N3pWZkJuK0RVY2pnWVVyQ3JOYkRsSGU3?=
 =?utf-8?B?N29JUTJnSy9za3lrZHJJcVNzYm84YlZLNDVRRm8rc2ZuVXJnV2hBbkJJTkli?=
 =?utf-8?B?Wk1Fa2RvMWlpaHJhakFjYkRJRDZVYWhTNW5ueFNWREFGMGoyMkxmRWRhdW9X?=
 =?utf-8?B?RlNKL01DdUgvZXN5VFV1bnd5d3UyM21nYVEwYUF3Q08xVnpud0hkY2NGLzFV?=
 =?utf-8?B?SkFISVdFbnBKaXgvWnBWVlpJOFdwNWxsNi9xYWVyUnJGNUNsT3JUUXY1REFp?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b079e0-d54f-4a59-f89b-08dad334c216
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 00:41:17.5798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpS8cxlVcJDMYo1up7X1yxvJK2y9jAQXQosKgHmsHnkkCYwXEkLNQ1k17d4O+wybYS8rsvuxyA6Wahh6csVSIvCkvBpvJoo0gCnzCaqzz5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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

On 11/23/2022 12:45, Michal Wajdeczko wrote:
> On 23.11.2022 02:25, John Harrison wrote:
>> On 11/22/2022 09:54, Michal Wajdeczko wrote:
>>> On 18.11.2022 02:58, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Re-work the existing GuC CT printers and extend as required to match
>>>> the new wrapping scheme.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 222 +++++++++++-----------
>>>>    1 file changed, 113 insertions(+), 109 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> index 2b22065e87bf9..9d404fb377637 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> @@ -18,31 +18,49 @@ static inline struct intel_guc *ct_to_guc(struct
>>>> intel_guc_ct *ct)
>>>>        return container_of(ct, struct intel_guc, ct);
>>>>    }
>>>>    -static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
>>>> -{
>>>> -    return guc_to_gt(ct_to_guc(ct));
>>>> -}
>>>> -
>>>>    static inline struct drm_i915_private *ct_to_i915(struct
>>>> intel_guc_ct *ct)
>>>>    {
>>>> -    return ct_to_gt(ct)->i915;
>>>> -}
>>>> +    struct intel_guc *guc = ct_to_guc(ct);
>>>> +    struct intel_gt *gt = guc_to_gt(guc);
>>>>    -static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>>>> -{
>>>> -    return &ct_to_i915(ct)->drm;
>>>> +    return gt->i915;
>>>>    }
>>>>    -#define CT_ERROR(_ct, _fmt, ...) \
>>>> -    drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>>>> +#define ct_err(_ct, _fmt, ...) \
>>>> +    guc_err(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define ct_warn(_ct, _fmt, ...) \
>>>> +    guc_warn(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define ct_notice(_ct, _fmt, ...) \
>>>> +    guc_notice(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define ct_info(_ct, _fmt, ...) \
>>>> +    guc_info(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>> +
>>>>    #ifdef CONFIG_DRM_I915_DEBUG_GUC
>>>> -#define CT_DEBUG(_ct, _fmt, ...) \
>>>> -    drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>>>> +#define ct_dbg(_ct, _fmt, ...) \
>>>> +    guc_dbg(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>>    #else
>>>> -#define CT_DEBUG(...)    do { } while (0)
>>>> +#define ct_dbg(...)    do { } while (0)
>>>>    #endif
>>>> -#define CT_PROBE_ERROR(_ct, _fmt, ...) \
>>>> -    i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define ct_probe_error(_ct, _fmt, ...) \
>>>> +    do { \
>>>> +        if (i915_error_injected()) \
>>>> +            ct_dbg(_ct, _fmt, ##__VA_ARGS__); \
>>>> +        else \
>>>> +            ct_err(_ct, _fmt, ##__VA_ARGS__); \
>>>> +    } while (0)
>>> guc_probe_error ?
>>>
>>>> +
>>>> +#define ct_WARN_ON(_ct, _condition) \
>>>> +    ct_WARN(_ct, _condition, "%s", "ct_WARN_ON("
>>>> __stringify(_condition) ")")
>>>> +
>>>> +#define ct_WARN(_ct, _condition, _fmt, ...) \
>>>> +    guc_WARN(ct_to_guc(_ct), _condition, "CT " _fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define ct_WARN_ONCE(_ct, _condition, _fmt, ...) \
>>>> +    guc_WARN_ONCE(ct_to_guc(_ct), _condition, "CT " _fmt,
>>>> ##__VA_ARGS__)
>>>>      /**
>>>>     * DOC: CTB Blob
>>>> @@ -170,7 +188,7 @@ static int ct_control_enable(struct intel_guc_ct
>>>> *ct, bool enable)
>>>>        err = guc_action_control_ctb(ct_to_guc(ct), enable ?
>>>>                         GUC_CTB_CONTROL_ENABLE :
>>>> GUC_CTB_CONTROL_DISABLE);
>>>>        if (unlikely(err))
>>>> -        CT_PROBE_ERROR(ct, "Failed to control/%s CTB (%pe)\n",
>>>> +        ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n",
>>>>                       str_enable_disable(enable), ERR_PTR(err));
>>> btw, shouldn't we change all messages to start with lowercase ?
>>>
>>> was:
>>>      "CT0: Failed to control/%s CTB (%pe)"
>>> is:
>>>      "GT0: GuC CT Failed to control/%s CTB (%pe)"
>>>
>>> unless we keep colon (as suggested by Tvrtko) as then:
>>>
>>>      "GT0: GuC CT: Failed to control/%s CTB (%pe)"
>> Blanket added the colon makes it messy when a string actually wants to
>> start with the prefix. The rule I've been using is lower case word when
>> the prefix was part of the string, upper case word when the prefix is
> Hmm, I'm not sure that we should attempt to have such a flexible rule as
> we shouldn't rely too much on actual format of the prefix as it could be
> changed any time.  All we should know about final log message is that it
> _will_ properly identify the "GT" or "GuC" that this log is related to.
>
> So I would suggest to be just consistent and probably always start with
> upper case, as that seems to be mostly used in kernel error logs, and
> just make sure that any prefix will honor that (by including colon, or
> braces), so this will always work like:
>
> "[drm] *ERROR* GT0: Failed to foo (-EIO)"
> "[drm] *ERROR* GT0: GUC: Failed to foo (-EIO)"
> "[drm] *ERROR* GT0: GUC: CT: Failed to foo (-EIO)"
>
> or
>
> "[drm] *ERROR* GT0: Failed to foo (-EIO)"
> "[drm] *ERROR* GT0: [GUC] Failed to foo (-EIO)"
> "[drm] *ERROR* GT0: [GUC] CT: Failed to foo (-EIO)"
>
> and even for:
>
> "[drm] *ERROR* GT(root) Failed to foo (-EIO)"
> "[drm] *ERROR* GuC(media) Failed to foo (-EIO)"
> "[drm] *ERROR* GT0 [GuC:CT] Failed to foo (-EIO)"
All of which are hideous/complex/verbose/inconsistent. 'GT0: GUC: CT:'? 
Really? Or 'GT0: [GUC] CT:'? Why the random mix of separators? And how 
would you implement '[GUC:CT]' without having a CT definition that is 
entirely self contained and does chain on to the GuC level version?

This is pointless bikeshedding. If you want to re-write every single 
debug print (yet again) and invent much more complicated macro 
definitions then feel free to take over the patch set. If not can we 
just approve the v3 version and move on to doing some actual work?

John.


>
>
>> just being added as a prefix. I originally just had the prefix as raw
>> with no trailing space, so the individual print could decide to add a
>> colon, a space, or whatever as appropriate. But that just makes for
>> messy code with some files having every string look like ": Stuff
>> happened" and other files have every string look like " failed to ...".
>> The current version seems to be the most readable from the point of view
>> of writing the code and of reading the dmesg results.
>>
>> And to be clear, the 'CT0' you have in your 'was' example only exists in
>> the internal tree. It never made it to upstream. It is also just plain
>> wrong. Each GT has two CTs - send and receive. So having 'CT1' meaning
>> some random CT on GT1 (as opposed to the read channel on GT0, for
>> example) was very confusing.
> I don't think I was wrong, it might be you confusing CT with CTB.
>
> Note that we only support _single_ CT (Command Transport) and this
> single CT includes _pair_ of CTBs (Command Transport Buffers).
>
> And logs/macros are CT oriented, not CTB.
The GuC spec does not make any distinction. In fact, there is no CT in 
the spec. There is just CTB. So at best it is ambiguous as to what CT0 / 
CT1 refers to.

>
> Regarding those my internal changes that were printing "CT%u": they were
> added exactly for the same reason as your series: to know which GT
> traffic we are tracing.  And were done locally on CT level only as there
> was no helpers that would automatically append "GT%u" prefix - helpers
> that you're defining right now ;)
>
> Michal
>
>> John.
>>
>>
>>> Michal
>>>
>>>>          return err;
>>>> @@ -201,7 +219,7 @@ static int ct_register_buffer(struct intel_guc_ct
>>>> *ct, bool send,
>>>>                       size);
>>>>        if (unlikely(err))
>>>>    failed:
>>>> -        CT_PROBE_ERROR(ct, "Failed to register %s buffer (%pe)\n",
>>>> +        ct_probe_error(ct, "Failed to register %s buffer (%pe)\n",
>>>>                       send ? "SEND" : "RECV", ERR_PTR(err));
>>>>          return err;
>>>> @@ -235,21 +253,21 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>>>>        blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>>>> CTB_G2H_BUFFER_SIZE;
>>>>        err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma,
>>>> &blob);
>>>>        if (unlikely(err)) {
>>>> -        CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data
>>>> (%pe)\n",
>>>> +        ct_probe_error(ct, "Failed to allocate %u for CTB data
>>>> (%pe)\n",
>>>>                       blob_size, ERR_PTR(err));
>>>>            return err;
>>>>        }
>>>>    -    CT_DEBUG(ct, "base=%#x size=%u\n", intel_guc_ggtt_offset(guc,
>>>> ct->vma), blob_size);
>>>> +    ct_dbg(ct, "base=%#x size=%u\n", intel_guc_ggtt_offset(guc,
>>>> ct->vma), blob_size);
>>>>          /* store pointers to desc and cmds for send ctb */
>>>>        desc = blob;
>>>>        cmds = blob + 2 * CTB_DESC_SIZE;
>>>>        cmds_size = CTB_H2G_BUFFER_SIZE;
>>>>        resv_space = 0;
>>>> -    CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "send",
>>>> -         ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
>>>> -         resv_space);
>>>> +    ct_dbg(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "send",
>>>> +           ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
>>>> +           resv_space);
>>>>          guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size,
>>>> resv_space);
>>>>    @@ -258,9 +276,9 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>>>>        cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
>>>>        cmds_size = CTB_G2H_BUFFER_SIZE;
>>>>        resv_space = G2H_ROOM_BUFFER_SIZE;
>>>> -    CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "recv",
>>>> -         ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
>>>> -         resv_space);
>>>> +    ct_dbg(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "recv",
>>>> +           ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
>>>> +           resv_space);
>>>>          guc_ct_buffer_init(&ct->ctbs.recv, desc, cmds, cmds_size,
>>>> resv_space);
>>>>    @@ -338,7 +356,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>>>>        return 0;
>>>>      err_out:
>>>> -    CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
>>>> +    ct_probe_error(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
>>>>        return err;
>>>>    }
>>>>    @@ -387,14 +405,12 @@ static int ct_write(struct intel_guc_ct *ct,
>>>>      #ifdef CONFIG_DRM_I915_DEBUG_GUC
>>>>        if (unlikely(tail != READ_ONCE(desc->tail))) {
>>>> -        CT_ERROR(ct, "Tail was modified %u != %u\n",
>>>> -             desc->tail, tail);
>>>> +        ct_err(ct, "Tail was modified %u != %u\n", desc->tail, tail);
>>>>            desc->status |= GUC_CTB_STATUS_MISMATCH;
>>>>            goto corrupted;
>>>>        }
>>>>        if (unlikely(READ_ONCE(desc->head) >= size)) {
>>>> -        CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
>>>> -             desc->head, size);
>>>> +        ct_err(ct, "Invalid head offset %u >= %u)\n", desc->head,
>>>> size);
>>>>            desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>>>            goto corrupted;
>>>>        }
>>>> @@ -415,8 +431,8 @@ static int ct_write(struct intel_guc_ct *ct,
>>>>            FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>>>>                   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>>>    -    CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
>>>> -         tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
>>>> +    ct_dbg(ct, "writing (tail %u) %*ph %*ph %*ph\n",
>>>> +           tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
>>>>          cmds[tail] = header;
>>>>        tail = (tail + 1) % size;
>>>> @@ -447,8 +463,8 @@ static int ct_write(struct intel_guc_ct *ct,
>>>>        return 0;
>>>>      corrupted:
>>>> -    CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>>>> -         desc->head, desc->tail, desc->status);
>>>> +    ct_err(ct, "Corrupted descriptor on write head=%u tail=%u
>>>> status=%#x\n",
>>>> +           desc->head, desc->tail, desc->status);
>>>>        ctb->broken = true;
>>>>        return -EPIPE;
>>>>    }
>>>> @@ -507,17 +523,14 @@ static inline bool ct_deadlocked(struct
>>>> intel_guc_ct *ct)
>>>>            struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
>>>>            struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
>>>>    -        CT_ERROR(ct, "Communication stalled for %lld ms, desc
>>>> status=%#x,%#x\n",
>>>> -             ktime_ms_delta(ktime_get(), ct->stall_time),
>>>> -             send->status, recv->status);
>>>> -        CT_ERROR(ct, "H2G Space: %u (Bytes)\n",
>>>> -             atomic_read(&ct->ctbs.send.space) * 4);
>>>> -        CT_ERROR(ct, "Head: %u (Dwords)\n", ct->ctbs.send.desc->head);
>>>> -        CT_ERROR(ct, "Tail: %u (Dwords)\n", ct->ctbs.send.desc->tail);
>>>> -        CT_ERROR(ct, "G2H Space: %u (Bytes)\n",
>>>> -             atomic_read(&ct->ctbs.recv.space) * 4);
>>>> -        CT_ERROR(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
>>>> -        CT_ERROR(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
>>>> +        ct_err(ct, "Communication stalled for %lld ms, desc
>>>> status=%#x,%#x\n",
>>>> +               ktime_ms_delta(ktime_get(), ct->stall_time),
>>>> send->status, recv->status);
>>>> +        ct_err(ct, "H2G Space: %u (Bytes)\n",
>>>> atomic_read(&ct->ctbs.send.space) * 4);
>>>> +        ct_err(ct, "Head: %u (Dwords)\n", ct->ctbs.send.desc->head);
>>>> +        ct_err(ct, "Tail: %u (Dwords)\n", ct->ctbs.send.desc->tail);
>>>> +        ct_err(ct, "G2H Space: %u (Bytes)\n",
>>>> atomic_read(&ct->ctbs.recv.space) * 4);
>>>> +        ct_err(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
>>>> +        ct_err(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
>>>>              ct->ctbs.send.broken = true;
>>>>        }
>>>> @@ -563,8 +576,7 @@ static inline bool h2g_has_room(struct
>>>> intel_guc_ct *ct, u32 len_dw)
>>>>          head = READ_ONCE(desc->head);
>>>>        if (unlikely(head > ctb->size)) {
>>>> -        CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
>>>> -             head, ctb->size);
>>>> +        ct_err(ct, "Invalid head offset %u >= %u)\n", head, ctb->size);
>>>>            desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>>>            ctb->broken = true;
>>>>            return false;
>>>> @@ -715,17 +727,17 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>                /* wait_for_ct_request_update returns -ENODEV on
>>>> reset/suspend in progress.
>>>>                 * In this case, output is debug rather than error info
>>>>                 */
>>>> -            CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is
>>>> disabled\n",
>>>> -                 action[0], request.fence);
>>>> +            ct_dbg(ct, "Request %#x (fence %u) cancelled as CTB is
>>>> disabled\n",
>>>> +                   action[0], request.fence);
>>>>            else
>>>> -            CT_ERROR(ct, "No response for request %#x (fence %u)\n",
>>>> -                 action[0], request.fence);
>>>> +            ct_err(ct, "No response for request %#x (fence %u)\n",
>>>> +                   action[0], request.fence);
>>>>            goto unlink;
>>>>        }
>>>>          if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) ==
>>>> GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>>> -        CT_DEBUG(ct, "retrying request %#x (%u)\n", *action,
>>>> -             FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, *status));
>>>> +        ct_dbg(ct, "retrying request %#x (%u)\n", *action,
>>>> +               FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, *status));
>>>>            send_again = true;
>>>>            goto unlink;
>>>>        }
>>>> @@ -737,12 +749,12 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>          if (response_buf) {
>>>>            /* There shall be no data in the status */
>>>> -        WARN_ON(FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0,
>>>> request.status));
>>>> +        ct_WARN_ON(ct, FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0,
>>>> request.status));
>>>>            /* Return actual response len */
>>>>            err = request.response_len;
>>>>        } else {
>>>>            /* There shall be no response payload */
>>>> -        WARN_ON(request.response_len);
>>>> +        ct_WARN_ON(ct, request.response_len);
>>>>            /* Return data decoded from the status dword */
>>>>            err = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, *status);
>>>>        }
>>>> @@ -771,7 +783,7 @@ int intel_guc_ct_send(struct intel_guc_ct *ct,
>>>> const u32 *action, u32 len,
>>>>            struct intel_guc *guc = ct_to_guc(ct);
>>>>            struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
>>>>    -        WARN(!uc->reset_in_progress, "Unexpected send:
>>>> action=%#x\n", *action);
>>>> +        ct_WARN(ct, !uc->reset_in_progress, "Unexpected send:
>>>> action=%#x\n", *action);
>>>>            return -ENODEV;
>>>>        }
>>>>    @@ -784,11 +796,11 @@ int intel_guc_ct_send(struct intel_guc_ct
>>>> *ct, const u32 *action, u32 len,
>>>>        ret = ct_send(ct, action, len, response_buf, response_buf_size,
>>>> &status);
>>>>        if (unlikely(ret < 0)) {
>>>>            if (ret != -ENODEV)
>>>> -            CT_ERROR(ct, "Sending action %#x failed (%pe)
>>>> status=%#X\n",
>>>> -                 action[0], ERR_PTR(ret), status);
>>>> +            ct_err(ct, "sending action %#x failed (%pe) status=%#X\n",
>>>> +                   action[0], ERR_PTR(ret), status);
>>>>        } else if (unlikely(ret)) {
>>>> -        CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
>>>> -             action[0], ret, ret);
>>>> +        ct_dbg(ct, "send action %#x returned %d (%#x)\n",
>>>> +               action[0], ret, ret);
>>>>        }
>>>>          return ret;
>>>> @@ -838,7 +850,7 @@ static int ct_read(struct intel_guc_ct *ct,
>>>> struct ct_incoming_msg **msg)
>>>>                 * contexts/engines being reset. But should never
>>>> happen as
>>>>                 * no contexts should be active when CLIENT_RESET is sent.
>>>>                 */
>>>> -            CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
>>>> +            ct_err(ct, "Unexpected G2H after GuC has stopped!\n");
>>>>                status &= ~GUC_CTB_STATUS_UNUSED;
>>>>            }
>>>>    @@ -850,15 +862,13 @@ static int ct_read(struct intel_guc_ct *ct,
>>>> struct ct_incoming_msg **msg)
>>>>      #ifdef CONFIG_DRM_I915_DEBUG_GUC
>>>>        if (unlikely(head != READ_ONCE(desc->head))) {
>>>> -        CT_ERROR(ct, "Head was modified %u != %u\n",
>>>> -             desc->head, head);
>>>> +        ct_err(ct, "Head was modified %u != %u\n", desc->head, head);
>>>>            desc->status |= GUC_CTB_STATUS_MISMATCH;
>>>>            goto corrupted;
>>>>        }
>>>>    #endif
>>>>        if (unlikely(tail >= size)) {
>>>> -        CT_ERROR(ct, "Invalid tail offset %u >= %u)\n",
>>>> -             tail, size);
>>>> +        ct_err(ct, "Invalid tail offset %u >= %u)\n", tail, size);
>>>>            desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>>>            goto corrupted;
>>>>        }
>>>> @@ -873,7 +883,7 @@ static int ct_read(struct intel_guc_ct *ct,
>>>> struct ct_incoming_msg **msg)
>>>>        /* beware of buffer wrap case */
>>>>        if (unlikely(available < 0))
>>>>            available += size;
>>>> -    CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail,
>>>> size);
>>>> +    ct_dbg(ct, "read available %d (%u:%u:%u)\n", available, head,
>>>> tail, size);
>>>>        GEM_BUG_ON(available < 0);
>>>>          header = cmds[head];
>>>> @@ -882,24 +892,24 @@ static int ct_read(struct intel_guc_ct *ct,
>>>> struct ct_incoming_msg **msg)
>>>>        /* message len with header */
>>>>        len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) +
>>>> GUC_CTB_MSG_MIN_LEN;
>>>>        if (unlikely(len > (u32)available)) {
>>>> -        CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
>>>> -             4, &header,
>>>> -             4 * (head + available - 1 > size ?
>>>> -                  size - head : available - 1), &cmds[head],
>>>> -             4 * (head + available - 1 > size ?
>>>> -                  available - 1 - size + head : 0), &cmds[0]);
>>>> +        ct_err(ct, "Incomplete message %*ph %*ph %*ph\n",
>>>> +               4, &header,
>>>> +               4 * (head + available - 1 > size ?
>>>> +                size - head : available - 1), &cmds[head],
>>>> +               4 * (head + available - 1 > size ?
>>>> +                available - 1 - size + head : 0), &cmds[0]);
>>>>            desc->status |= GUC_CTB_STATUS_UNDERFLOW;
>>>>            goto corrupted;
>>>>        }
>>>>          *msg = ct_alloc_msg(len);
>>>>        if (!*msg) {
>>>> -        CT_ERROR(ct, "No memory for message %*ph %*ph %*ph\n",
>>>> -             4, &header,
>>>> -             4 * (head + available - 1 > size ?
>>>> -                  size - head : available - 1), &cmds[head],
>>>> -             4 * (head + available - 1 > size ?
>>>> -                  available - 1 - size + head : 0), &cmds[0]);
>>>> +        ct_err(ct, "No memory for message %*ph %*ph %*ph\n",
>>>> +               4, &header,
>>>> +               4 * (head + available - 1 > size ?
>>>> +                size - head : available - 1), &cmds[head],
>>>> +               4 * (head + available - 1 > size ?
>>>> +                available - 1 - size + head : 0), &cmds[0]);
>>>>            return available;
>>>>        }
>>>>    @@ -909,7 +919,7 @@ static int ct_read(struct intel_guc_ct *ct,
>>>> struct ct_incoming_msg **msg)
>>>>            (*msg)->msg[i] = cmds[head];
>>>>            head = (head + 1) % size;
>>>>        }
>>>> -    CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
>>>> +    ct_dbg(ct, "received %*ph\n", 4 * len, (*msg)->msg);
>>>>          /* update local copies */
>>>>        ctb->head = head;
>>>> @@ -920,8 +930,8 @@ static int ct_read(struct intel_guc_ct *ct,
>>>> struct ct_incoming_msg **msg)
>>>>        return available - len;
>>>>      corrupted:
>>>> -    CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>>>> -         desc->head, desc->tail, desc->status);
>>>> +    ct_err(ct, "Corrupted descriptor on read head=%u tail=%u
>>>> status=%#x\n",
>>>> +           desc->head, desc->tail, desc->status);
>>>>        ctb->broken = true;
>>>>        return -EPIPE;
>>>>    }
>>>> @@ -944,18 +954,17 @@ static int ct_handle_response(struct
>>>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>>>               FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) !=
>>>> GUC_HXG_TYPE_NO_RESPONSE_RETRY &&
>>>>               FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) !=
>>>> GUC_HXG_TYPE_RESPONSE_FAILURE);
>>>>    -    CT_DEBUG(ct, "response fence %u status %#x\n", fence, hxg[0]);
>>>> +    ct_dbg(ct, "response fence %u status %#x\n", fence, hxg[0]);
>>>>          spin_lock_irqsave(&ct->requests.lock, flags);
>>>>        list_for_each_entry(req, &ct->requests.pending, link) {
>>>>            if (unlikely(fence != req->fence)) {
>>>> -            CT_DEBUG(ct, "request %u awaits response\n",
>>>> -                 req->fence);
>>>> +            ct_dbg(ct, "request %u awaits response\n", req->fence);
>>>>                continue;
>>>>            }
>>>>            if (unlikely(datalen > req->response_len)) {
>>>> -            CT_ERROR(ct, "Response %u too long (datalen %u > %u)\n",
>>>> -                 req->fence, datalen, req->response_len);
>>>> +            ct_err(ct, "response %u too long (datalen %u > %u)\n",
>>>> +                   req->fence, datalen, req->response_len);
>>>>                datalen = min(datalen, req->response_len);
>>>>                err = -EMSGSIZE;
>>>>            }
>>>> @@ -967,12 +976,11 @@ static int ct_handle_response(struct
>>>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>>>            break;
>>>>        }
>>>>        if (!found) {
>>>> -        CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
>>>> -        CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
>>>> -             ct->requests.last_fence);
>>>> +        ct_err(ct, "Unsolicited response (fence %u)\n", fence);
>>>> +        ct_err(ct, "Could not find fence=%u, last_fence=%u\n", fence,
>>>> +               ct->requests.last_fence);
>>>>            list_for_each_entry(req, &ct->requests.pending, link)
>>>> -            CT_ERROR(ct, "request %u awaits response\n",
>>>> -                 req->fence);
>>>> +            ct_err(ct, "request %u awaits response\n", req->fence);
>>>>            err = -ENOKEY;
>>>>        }
>>>>        spin_unlock_irqrestore(&ct->requests.lock, flags);
>>>> @@ -998,7 +1006,7 @@ static int ct_process_request(struct
>>>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>>>        action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>>>>        len = hxg_len - GUC_HXG_MSG_MIN_LEN;
>>>>    -    CT_DEBUG(ct, "request %x %*ph\n", action, 4 * len, payload);
>>>> +    ct_dbg(ct, "request %x %*ph\n", action, 4 * len, payload);
>>>>          switch (action) {
>>>>        case INTEL_GUC_ACTION_DEFAULT:
>>>> @@ -1016,9 +1024,6 @@ static int ct_process_request(struct
>>>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>>>            break;
>>>>        case INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
>>>>            ret = intel_guc_error_capture_process_msg(guc, payload, len);
>>>> -        if (unlikely(ret))
>>>> -            CT_ERROR(ct, "error capture notification failed %x %*ph\n",
>>>> -                 action, 4 * len, payload);
>>>>            break;
>>>>        case INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION:
>>>>            ret = intel_guc_engine_failure_process_msg(guc, payload, len);
>>>> @@ -1028,11 +1033,11 @@ static int ct_process_request(struct
>>>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>>>            ret = 0;
>>>>            break;
>>>>        case INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
>>>> -        CT_ERROR(ct, "Received GuC crash dump notification!\n");
>>>> +        guc_err(guc, "notification: Crash dump!\n");
>>>>            ret = 0;
>>>>            break;
>>>>        case INTEL_GUC_ACTION_NOTIFY_EXCEPTION:
>>>> -        CT_ERROR(ct, "Received GuC exception notification!\n");
>>>> +        guc_err(guc, "notification: Exception!\n");
>>>>            ret = 0;
>>>>            break;
>>>>        default:
>>>> @@ -1041,8 +1046,7 @@ static int ct_process_request(struct
>>>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>>>        }
>>>>          if (unlikely(ret)) {
>>>> -        CT_ERROR(ct, "Failed to process request %04x (%pe)\n",
>>>> -             action, ERR_PTR(ret));
>>>> +        ct_err(ct, "Failed to process request %04x (%pe)\n", action,
>>>> ERR_PTR(ret));
>>>>            return ret;
>>>>        }
>>>>    @@ -1070,8 +1074,8 @@ static bool
>>>> ct_process_incoming_requests(struct intel_guc_ct *ct)
>>>>          err = ct_process_request(ct, request);
>>>>        if (unlikely(err)) {
>>>> -        CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
>>>> -             ERR_PTR(err), 4 * request->size, request->msg);
>>>> +        ct_err(ct, "Failed to process message (%pe) %*ph\n",
>>>> +               ERR_PTR(err), 4 * request->size, request->msg);
>>>>            ct_free_msg(request);
>>>>        }
>>>>    @@ -1149,8 +1153,8 @@ static int ct_handle_hxg(struct intel_guc_ct
>>>> *ct, struct ct_incoming_msg *msg)
>>>>          if (unlikely(err)) {
>>>>    failed:
>>>> -        CT_ERROR(ct, "Failed to handle HXG message (%pe) %*ph\n",
>>>> -             ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
>>>> +        ct_err(ct, "Failed to handle HXG message (%pe) %*ph\n",
>>>> +               ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
>>>>        }
>>>>        return err;
>>>>    }
>>>> @@ -1166,8 +1170,8 @@ static void ct_handle_msg(struct intel_guc_ct
>>>> *ct, struct ct_incoming_msg *msg)
>>>>            err = -EOPNOTSUPP;
>>>>          if (unlikely(err)) {
>>>> -        CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
>>>> -             ERR_PTR(err), 4 * msg->size, msg->msg);
>>>> +        ct_err(ct, "Failed to handle message (%pe) %*ph\n",
>>>> +               ERR_PTR(err), 4 * msg->size, msg->msg);
>>>>            ct_free_msg(msg);
>>>>        }
>>>>    }
>>>> @@ -1198,7 +1202,7 @@ static void ct_try_receive_message(struct
>>>> intel_guc_ct *ct)
>>>>    {
>>>>        int ret;
>>>>    -    if (GEM_WARN_ON(!ct->enabled))
>>>> +    if (ct_WARN_ON(ct, !ct->enabled))
>>>>            return;
>>>>          ret = ct_receive(ct);
>>>> @@ -1220,7 +1224,7 @@ static void ct_receive_tasklet_func(struct
>>>> tasklet_struct *t)
>>>>    void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
>>>>    {
>>>>        if (unlikely(!ct->enabled)) {
>>>> -        WARN(1, "Unexpected GuC event received while CT disabled!\n");
>>>> +        ct_warn(ct, "Unexpected event received while disabled!\n");
>>>>            return;
>>>>        }
>>>>    

