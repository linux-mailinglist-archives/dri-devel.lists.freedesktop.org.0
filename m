Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54586B5735
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 02:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E2010E04B;
	Sat, 11 Mar 2023 01:01:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E1810E025;
 Sat, 11 Mar 2023 01:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678496507; x=1710032507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tf8p6czJgmvf5TaNwCtxlS0IJLSjCa7Xz798mSL77lo=;
 b=l2H0XYYw+7YmThxJFJTZ/VkSTpW9EIEnsjbd7GtCpW+hQgOQlpchg4bg
 FHg7aPE2awVwVugOs0v2SHQPOGtrNhRtf616uJC9OdHnQp4b5ghJSiSo7
 D+8NooDAoq6QxHUJCvxlx5B+WmKJoTrq543k0KATfzahmoOvkAm/rQzMF
 cedd/+3oV6/I3FA8+46ounKJOYHerV9XR3MZFteepJunyuMBfO3qTwT00
 2EfjmXaUdinEYbwI6m0FaracljzZiivDgN+PFmuBoqaxvMjgLUrBYnJ88
 sbqsuRkvomTEp6VPgJJddb2vFYztPExwDC8oF/IWx8r4+qSZdLYb2V8p3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338418945"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="338418945"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 17:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923875648"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="923875648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 17:01:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 17:01:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 17:01:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 17:01:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evu0kgIErbJSssNwQmU/JA3cUyJzsVJyDRT80dtUcv0KOPyRVhUN2OBUyyyNN3GvQU1/P3IDbPk1NoV6iqruKZ9tRq/7FR78x+tme8cLSUwIkNIGxKFk18knsKrSiVJ71/IOvCWwGRFCqHbagVoKx5w17BtIb6g7HhJnBzAzeJ3QnL4vSIKjOdUMN0hjw3zBoMWt+GC51f8CnknVyuFWV1gr+nKA5kwGyVydIuWR2RZQI0762y8lGxYiudMVUkr/ETtQ+ekQlqZfBYMr7+KgPKyBPKNbaWvqZfYSqmB69/nvDlR1PJ8BdbeSIfhEnkZjinUcq6PTX7IcOVF0sucHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gytA2Jq2EU2G2JosEkznHJfgzqilYm1y524ZVgvwDl8=;
 b=AG0XQLAsRK/Y0Y/IFc8lXY3XNZ7XZnJhvNycb5Iu1qkIFGJnBJcy7Uyzzr+MYr5JcGVHo0wXTCmoP2OtoLHmAciNwaw5tnQ1yW4egRRMnwYcAzl4kNlpOOrJ5HizZzP5zjmwuf2j+LHHnU5321LSMSRzBhTqlPMwwBVmSg3duWD1GcSmzyO+ggAeXuhs4UgIOTiAwA6KzF3iPPQ0LrvKlMXtzo7kn8R2axsHzumevhwWts1GzzGEcoo+2Q+i0LTzYujPEaz6aYJnP2JDXNij/who2zizPSsJZ+KajnrjuySPz72qMPDPOkfLKRvA+uZtl1cCjJ3fUjsAVyiW01rEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 01:01:45 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6178.019; Sat, 11 Mar 2023
 01:01:45 +0000
Message-ID: <eeb90b3c-dbfe-a045-468d-9bf5456096dd@intel.com>
Date: Fri, 10 Mar 2023 17:01:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Allow for very slow GuC
 loading
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
 <20230217234715.3609670-3-John.C.Harrison@Intel.com>
 <3baf596b-cd5e-87c0-bbd4-54a0e39f9e8c@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3baf596b-cd5e-87c0-bbd4-54a0e39f9e8c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec64283-8669-4b19-de8e-08db21cc2e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAr82yldJfq79hnhGdqVOUiH8psw6zn5UOH5I3hw69wTjqCuomFniQeBw0akNwDFkUxmNkmsaQtLctdytOyJl+1UFdKFOV/sEXWqN+asMlt7GA0w0PEvea7OZuXSbqM9bI1/XJ6mhYoQIvXef2z835f45euR8EUXKbz9XvLh3hMJf38gfFx9qEf61fyjE0t6LnjkkIT2DQS6wGcXSrrlGZAMRpLpzkEFkjrXqv4/f5bOZDFRYB6+SmCUIzoKRzkOfWRWQGreSKymBPka8fwJ5Rgixlwrles1+h7BWteqdDCJjbsRJw0gVIi9izd2CW78C1v7krE+USKCv5adVyvJfRl5VN5D6+YNhcmGhFwxGJWzihhXmOGcS2Uxls55ifE1GeX23Q+4x88PkKAl4IhBPe9b21nC8sMi/bsy8D+TnAheipcxrSI52l37gj0NJ8tY/hihoHpc9GeE/ek3G9OZ4tcszr+d7SfEz3+vU3geNJv+kuxI0PKYl0r/ZuhOM0E01uJrfZY6X7LeSUuxWD0Ic9+pPpqXPJpeDXazvqB/70/U31GWzpiQMfsw0R8Ycb5ajfFFwzKWYDaiHhbN6X471gF56c3wL4owiP93VtVX3hUNrfChnbwLRnZbJuZx2ZD9949NhMuaoPa5PRIS1llGOLorFcAUv46nchGcKDHsEUHRFrXnVfGnaVVtdZioZunV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(36756003)(86362001)(31696002)(82960400001)(38100700002)(83380400001)(478600001)(4326008)(966005)(2906002)(5660300002)(316002)(8676002)(66946007)(450100002)(66476007)(66556008)(31686004)(41300700001)(6486002)(2616005)(186003)(6666004)(53546011)(6506007)(6512007)(8936002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1RtbkZsb0JQZ1RDZy9wZUYvODhBMVlVdlNXaUljUEd1NXZPN0NmNnlHMGFt?=
 =?utf-8?B?K2ZBS1pZSzk0R1pQR0JoQnF2RUJCc2t6anJHMW1hc1Myd09pK2RSbVJvSGZz?=
 =?utf-8?B?cG1iQkdNbGVTWW1PV1FYVWhMSDI5NmJ1b3FRbkkyUC9haitmUjNqaklCNEEy?=
 =?utf-8?B?NlppemVJYWxlemNSeDNpeW9uRmJWQWRJZXdGRFY0bzRwUWlLU01DMlRQWkYy?=
 =?utf-8?B?Z2N5MlZzeHhETTlRQXg5T2ZNRVdGRTl5cG5MSEFpWkZaOVZ6US9tbWlVYkpk?=
 =?utf-8?B?NkJJTHlWV0JVc2l3Q1A2eEtRZDZoTHNyYUNvZzlISTBlR1JpZGJuTjJiRU56?=
 =?utf-8?B?RXArOTZpY0pkNFBhL1RBdnFMMXRmSW1UNk1MbTlHb05BMFgxckJna0NnUE1T?=
 =?utf-8?B?QlhOWG94akxhNFNXT0grTU1JSEdBci9Ubmx4NVBhT1NVOFRDUVFQOHRQWnda?=
 =?utf-8?B?WGExb1dpaTdOTFg3SWdCT0IrRHhmcS9iMDd1ZUFlU1FqdWl0WUVvdDduQ3dB?=
 =?utf-8?B?V3p4QmpxUzF1VHA2QWJ3QXBJK2FjR0lmbGJlZGh0QnpKWDEwT1NWR2pLRml0?=
 =?utf-8?B?Z1F6OWMxbzlXVzRvRllkcU0zWmhUYzYySDBodkErNit4RXl2aktuYTR6b1JU?=
 =?utf-8?B?RCtiQmljTU5VRE4rMEp1dG1LSGtsNUZGQUNuVTkvTm95VTNGcHlDZ3BpZEdP?=
 =?utf-8?B?aEtuVFZMeHRWUUgzR2tFclFVOGV6MjJVRURuMnZlZDgyc1VUTE9Fek5qdndE?=
 =?utf-8?B?Q1dCejdSK0RjcjFwK3JEQS9oRHhEdHdMWTVmZXUxeWpJdndEVnFoR0d0SFRu?=
 =?utf-8?B?b2xmM1dRbU9ucXdFNitFL0diR3VtRWFxaU1kU2gvdVE4aGMwTWxibW1CQ0Zu?=
 =?utf-8?B?QmFTb0M5Mkl3Q25jN2RGRGpWZmR1OUZFTUJGNjM0djgrZGRidjhIYXhzUXA5?=
 =?utf-8?B?Yk5aQTE5WEhjV09rcGFZOUpZWVR4YnBxMmFtL3VUQWdHakh1SHNURjJqT1Nj?=
 =?utf-8?B?d0tMclZkdWwweHpubE9YUUZ4WXBGc0pCVTBhOE43WGZUb2J5ekFsaXQ4NHVI?=
 =?utf-8?B?bFZCZlA4ZHUzN1JQOFROcFFOVnhhTEpxRm5DSXE5WS9MNzI1QTQ4WmdaZ010?=
 =?utf-8?B?aFhBMFFxYkVNL2txdEtldlN6WjdwUXI1ZWEzZG5iNWpRZGhPUjU0ZVBOUDF6?=
 =?utf-8?B?MzBxMlFRMzkyMWhjZEFEUTlJRm9TcW14a0h2anZ0TW9aSWRNRCtabVdkQ0Rl?=
 =?utf-8?B?KzhWUks1aXVhTVlZVEJOcTNvNkxlTWdUVC9ZMzRSOUozNGhXWSs3OSs4eXhm?=
 =?utf-8?B?RUJJaWo4S2dpbm0zWnE1WW9wYklyNDNmWWJXbjE1d0ZQWU9tKzBXbXM3VFp0?=
 =?utf-8?B?K1JWSWxaQnp2UUZ6RHlsV1NwanBwMHUxeFhwWVh0djVvQ1E1dk1PWS9oaVVl?=
 =?utf-8?B?TUc1T0lxSGpYQ1h5SHV1djYwdlZWVEoxbW5SNlZpdzB4T1ZrbU12bW9WbUl5?=
 =?utf-8?B?N05ycHg1YTlXeGdRMHRZVGVJQmUyalZlZzR3R3luMFZXSko1WVRUeGxRZDBU?=
 =?utf-8?B?d1BlNlpuSHVTNy83eXAzRWRUKzJqMGhuQ3dtM05HdEwrVWs3MmZjdlNiSlZV?=
 =?utf-8?B?UUlBd2I2clBZcm4rRTluOFNjaTR6Y0xaMFBZZFMrMEpEK3lqVE9KcEdYWWd4?=
 =?utf-8?B?akhIZUE2WENLUEZqNHpyMXgwWnBpVkhIYUt5aEhqeFBsUHA2dGRwbGlCSjgr?=
 =?utf-8?B?ekpSZnQ1dWhoWmFYei84cjdXb3pucnd2UDB2ZFplU3U2OTBjSXdGamtMeXBO?=
 =?utf-8?B?bGZvdlg1TlZ1emNBWlJ1bDBpbXJnQ2s1akxyeXM4cTJJK1FLZm1JaVRxdk9X?=
 =?utf-8?B?UmdFZUxJSngzb0tSdm5zeWZ0SnhHTkxsM0d2M1N5Q3RvdmN5Ulo4Q3BNejl0?=
 =?utf-8?B?d1E0OFgrYXVsOVUweFdxL0haOTFwZFlpUElFMHkrb1V0SUMvd2FoU1NSZVNE?=
 =?utf-8?B?VVMvWmVCSllDd0xxWFdSTmNvRGdBZ1J0UmlSdzFlOGFGRDJDU2xJVXpXU3Ur?=
 =?utf-8?B?MkFCMDdMMGQ0VnQrNkdQa2dNT2wrcTZrdzBMcElSTzVkSy9SSjRKYXhtbnhv?=
 =?utf-8?B?WlpwZXpEM1h2eVpUWkNicCsvT3ZaQXlTS1RnMHZ2MDJna3RqM0NCMStkbFNz?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec64283-8669-4b19-de8e-08db21cc2e96
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 01:01:44.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHjUV6XOOksZkXcxqve8g33flp5Ken96iA7R6LugzvtRy4BtqiaDbyTZDS20l/xHRSysxFnLd5WcHVzznG6OMlgVH/0lxy50fn1YrY//0tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

On 3/3/2023 11:20, Ceraolo Spurio, Daniele wrote:
> On 2/17/2023 3:47 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A failure to load the GuC is occasionally observed where the GuC log
>> actually showed that the GuC had loaded just fine. The implication
>> being that the load just took ever so slightly longer than the 200ms
>> timeout. Given that the actual time should be tens of milliseconds at
>> the slowest, this should never happen. So far the issue has generally
>> been caused by a bad IFWI resulting in low frequencies during boot
>> (depsite the KMD requesting max frequency). However, the issue seems
>> to happen more often than one would like.
>>
>> So a) increase the timeout so that the user still gets a working
>> system even in the case of slow load. And b) report the frequency
>> during the load to see if that is the case of the slow down.
>
> Some refs would be good here. From a quick search, these seems to match:
>
> https://gitlab.freedesktop.org/drm/intel/-/issues/7931
> https://gitlab.freedesktop.org/drm/intel/-/issues/8060
> https://gitlab.freedesktop.org/drm/intel/-/issues/8083
> https://gitlab.freedesktop.org/drm/intel/-/issues/8136
> https://gitlab.freedesktop.org/drm/intel/-/issues/8137
Should these have a prefix tag? If so, what? 'closes' is not entirely 
accurate. This patch is just to help with debug of the underlying issue. 
And if the timeout is reduced then it won't necessarily allow a slow 
system to work. See below.


>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 37 +++++++++++++++++++++--
>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> index 2f5942606913d..72e003f50617d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> @@ -12,6 +12,7 @@
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_gt_mcr.h"
>>   #include "gt/intel_gt_regs.h"
>> +#include "gt/intel_rps.h"
>>   #include "intel_guc_fw.h"
>>   #include "intel_guc_print.h"
>>   #include "i915_drv.h"
>> @@ -139,9 +140,12 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       struct intel_uncore *uncore = gt->uncore;
>> +    ktime_t before, after, delta;
>>       bool success;
>>       u32 status;
>> -    int ret;
>> +    int ret, count;
>> +    u64 delta_ms;
>> +    u32 before_freq;
>>         /*
>>        * Wait for the GuC to start up.
>> @@ -159,13 +163,32 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>        * issues to be resolved. In the meantime bump the timeout to
>>        * 200ms. Even at slowest clock, this should be sufficient. And
>>        * in the working case, a larger timeout makes no difference.
>> +     *
>> +     * IFWI updates have also been seen to cause sporadic failures 
>> due to
>> +     * the requested frequency not being granted and thus the firmware
>> +     * load is attempted at minimum frequency. That can lead to load 
>> times
>> +     * in the seconds range. However, there is a limit on how long an
>> +     * individual wait_for() can wait. So wrap it in a loop.
>>        */
>> -    ret = wait_for(guc_load_done(uncore, &status, &success), 200);
>> +    before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
>> +    before = ktime_get();
>> +    for (count = 0; count < 20; count++) {
>> +        ret = wait_for(guc_load_done(uncore, &status, &success), 1000);
>
> Isn't 20 secs a bit too long for an in-place wait? I get that if the 
> GuC doesn't load (or fail to) within a few secs the HW is likely 
> toast, but still that seems a bit too long to me. What's the worst 
> case load time ever observed? I suggest reducing the wait to 3 secs as 
> a compromise, if that's bigger than the worst case.
I can drop it to 3 for normal builds and keep 20 for 
CONFIG_DRM_I915_DEBUG_GEM builds. However, that won't actually be long 
enough for all slow situations. We have seen times of at least 11s when 
the GPU is running at minimum frequency. So, for CI runs we definitely 
want to keep the 20s limit. For end users? Is it better to wait for up 
to 20s or to boot in display only fallback mode? And note that this is a 
timeout only. A functional system will still complete in tens of 
milliseconds.

John.

>
> The patch LGTM apart from this point.
>
> Daniele
>
>> +        if (!ret || !success)
>> +            break;
>> +
>> +        guc_dbg(guc, "load still in progress, count = %d, freq = 
>> %dMHz\n",
>> +            count, intel_rps_read_actual_frequency(&uncore->gt->rps));
>> +    }
>> +    after = ktime_get();
>> +    delta = ktime_sub(after, before);
>> +    delta_ms = ktime_to_ms(delta);
>>       if (ret || !success) {
>>           u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>           u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>   -        guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", 
>> status, ret);
>> +        guc_info(guc, "load failed: status = 0x%08X, time = %lldms, 
>> freq = %dMHz, ret = %d\n",
>> +             status, delta_ms, 
>> intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
>>           guc_info(guc, "load failed: status: Reset = %d, BootROM = 
>> 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>                REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>                bootrom, ukernel,
>> @@ -206,6 +229,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>           /* Uncommon/unexpected error, see earlier status code print 
>> for details */
>>           if (ret == 0)
>>               ret = -ENXIO;
>> +    } else if (delta_ms > 200) {
>> +        guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, 
>> before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
>> +             delta_ms, 
>> intel_rps_read_actual_frequency(&uncore->gt->rps),
>> +             before_freq, status, count, ret);
>> +    } else {
>> +        guc_dbg(guc, "init took %lldms, freq = %dMHz, before = 
>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>> +            delta_ms, 
>> intel_rps_read_actual_frequency(&uncore->gt->rps),
>> +            before_freq, status, count, ret);
>>       }
>>         return ret;
>

