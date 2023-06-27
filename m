Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E27403BC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 21:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA810E31B;
	Tue, 27 Jun 2023 19:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E2F10E31B;
 Tue, 27 Jun 2023 19:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687892621; x=1719428621;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e0dBRXeTum7CkSXvRUBCoxAA2xolg4GgC1qbB6osgfI=;
 b=mK3pTVYSgj5eCXqetgk6QPFFI5SXhreeQSJhDBgo69RalfrDDN40j+0Q
 8I+JDNXB2Wb6I9i3F+0ssYLXnxYIXGwm0rs4jrj0qtd5jUQ2ZLO/dFJPB
 b4AC7gmrvH3wRqZALXP5BqweTTDlpsW4UJR345PCbMPjYgemHNAr/7MjL
 33OrpRbly5Spo5yQNQ92ybih/S9jwagIrI3EjhhATEwah7t1nVkRXm+p6
 L9hzV059CRbObUVadIRDkRMJISTIjRQmtX+hUQcCmVsvu4x9mXZH1K+RM
 vYtMCmWM7MsZ8kHG4Wprq74BkE3KmL3Lko11ZBb3fXeCLBzaiOIoTLlUT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361701560"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="361701560"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 12:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829774822"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="829774822"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2023 12:03:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 12:03:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 12:03:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 12:03:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 12:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdgpN81/6FpeKOia7Nycuc5Teo9Aa1jTpBkZ/7yVC9scSWErHwFKPYVZESCLXGAwx6KqVfrn0ac4zLxD2p17Zs6r9Vxgfs3o1UMItue14fbkdWbDnwpMTVaXzWEyFWa9DXBQuC+f5IQBO+t0jLG56mK/6/hrNhQjZlO04Dn59gcFYRE57zriFKQXZFK8FqffNQ3fco9o+XolE4g6SseUoeePlkUInCKqPAxiyIx1YYjQavCGbaJPb7+HE5LYHGYZpq9xT54//sWTp5gTIWkDPe0pZ+6sXwQ+dHpR/MfRWAUEccLv045lYAaEf1qTDGy+5kFZFnNlGxcD/5ESWL4jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EmBJDAMfkyt6GMFPIcof5QpnTmSnNwBOgiMnH9fnkw=;
 b=FOKync6D6RQtiYzPeCcCBVhx+EpQ5Tvh3enQz++Y7kIIyiHs0Bptm2tcrv/lHuR/dY/7n3Zo4oZ2b5yqRy5XUNDgVt+3FakEPKQszTrzyBsAhXEje0rYvOz9sAKbjwVOPrPlwBbeJGtUKq7qZjGD8wzhWxPtSSO9u/0wLB9crH7vuhI0vLom8gk54sYftadqttdSkv2jGF5d9g4RLQ8YfrEFqcL3sFHXneBsfIE7Jf5XX1HALehzGlVgs7LFx8XX38/499BhryK/MPEBncSRh0cNRHBS60/4Bd2CfQHi/EeW0w4sMwqVSYMl6LvnfyzfMr6EXZ0cHG1xJ/uWnQ0hvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 19:03:37 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 19:03:37 +0000
Message-ID: <819a71aa-fba9-ab3f-59e6-005c96f81f0c@intel.com>
Date: Tue, 27 Jun 2023 12:03:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Dump perf_limit_reasons for
 debug
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627021218.123999-1-vinay.belgaumkar@intel.com>
 <871qhxd25r.wl-ashutosh.dixit@intel.com>
 <8c1b95aa-29c3-35dd-d0cc-609449a6730c@intel.com>
 <87jzvp5rsj.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87jzvp5rsj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|IA0PR11MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9e0fff-14db-4886-6765-08db77413682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tqfIpRMFLrG2Uk5kkYERQJ+bWlrXAzakvNn2JpWKYs+5TZJT7a3Xy6gfVvzxdSFIZ3cFt6pzvDnXNbYNMn/WDVTEGAnvQ3N1rQCao5tRbehE1FuXS4d4On6H4k+zSHsz4Gx46+u72zMpSeGp3ZJ8g1lxp1qeZXPxUpHrXsLfP0mhSv7e/Dl7qjI+Sz2sX7xQkv2r2mFP/dsEqmIlQYH69W5PDD4fLPQcaY6RFGRPyNWDL6AGFqq5HC2TUn+IT7SS5flUNBwctRRFAlt3QRLPEtIWS5Wse0EHZn9N5QhU+1nBzfHyVONb3QUkpLqeG33UbiEHrIVPdkmeMMPiGJsbhVmjgprCIjyJnwqi7VPbMOruq2Dxq9Fk+W3+/x1n6dI+tp6r/Gi74eFQEVJgkNp+6eaQFM5MPtlUDM4eKiqUZnlkpYCJ/0iul++ahvNDDy3XKgCy+wE4tAHl4jHgTjbmbnGEb49JZV0tbSgH9wX4tCbgtjTFtdvssEYT1J+LXscom26rnhIBVCuXR8Dbdj4mxcAoea46EJM4rqG4US5d3xHLZ7q05S+e+RnLVtt9bpT1PaCNqKiiU+yWcSUV2e79egjMxKlSlQLXsrCHVZXL+I+RiCLf8XTgDAB53Uhg8tAFaTXH4SgbjEg3r330MZUXmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(2906002)(186003)(6486002)(82960400001)(38100700002)(83380400001)(2616005)(6506007)(6512007)(53546011)(6666004)(86362001)(26005)(37006003)(31696002)(41300700001)(316002)(478600001)(36756003)(66556008)(4326008)(66946007)(66476007)(450100002)(6636002)(31686004)(5660300002)(8676002)(8936002)(6862004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGdyQmtyRXB3dVJaMUtiRGlQb0pIejAxY0pjMEJjMFk1RWRORWt3Sk5ta3NW?=
 =?utf-8?B?Y2phdEF4U0JlR2pFL2FLMGdpQ2ZDTTRLbmpmcVFsOGtFakJxVjgxdkNnYVlI?=
 =?utf-8?B?UlpDbVJ4VFlwRHIxWE9haEJPTWhkYWRMVktHeWFJZFg1WWllaTNVVFJBejJ5?=
 =?utf-8?B?c3pHckJvbnpkZmI5UVRHUW1WT2haR3pucUxJQTdpZ3praXlxVE1mQkVGZlR6?=
 =?utf-8?B?WmlJSkJteHhNVHh2alNVTDdSeTlydHRpOGJmakp4YWtWTG00S3hUVGYrNXpx?=
 =?utf-8?B?SUE4djA0RHNWbUgwelMrWkFXOFpGQnZ3eDBuTjdTUHZkMExDZXYyc051RldQ?=
 =?utf-8?B?TTVtVGpMOTFKVVc1SXVmVUU1bmJPYjJSVDNPQ1E1M2JoTzBYN2tPWE4zc3Fn?=
 =?utf-8?B?Wk9nVitlSXV0VHU5bzZCYXJoUE5TZ0xlOTJQREFiVEppZUVIYXRCLy9pOExI?=
 =?utf-8?B?bnU5d3RWQllIa3ZQUUEwa1hOanRzUG9ycmRhcjBuZDMxVE55eUFqMnNmZ2Nu?=
 =?utf-8?B?ZnNybDlpbVgrSjU1eElwNVFhNEh0UWp3YmZPa0o0d2h3RnRMQWM0QW5DQ0pk?=
 =?utf-8?B?TGZoMm1Ud3FmOG5vTDdrRHd5UForelROcEw5bkwxZy83YmlHcjkzeStMQ3pl?=
 =?utf-8?B?dzIyYVBhNTFjbmJvZ3R5Vi9hM21RR2M2bFFLQkZUUnNIeGNJdDJGOHVzMU9p?=
 =?utf-8?B?SFBzMk1vNlYxWXh2OTBGN0tzL1Z6Q1JWTGlZYk81YTFDZnhKODJXbTEyOVVT?=
 =?utf-8?B?b1BIcEFNdGtZZlZmcHZHYTQ4TEZLRzB6Mmg5T3Z3YlNKejk4WmtOR0xKNDdB?=
 =?utf-8?B?NU5VSHZqYjVhRUdJNmcyNTFqSWg3NVNhcUhxd29rN3FjOGJQYk5jVzV4Z01p?=
 =?utf-8?B?akx2bDNyazFiSzdjSUUrNjFieFhNdGt0YUZXMlFJTTBKbFVQdUpybllPVW4z?=
 =?utf-8?B?aktLK2tESGZ6eTJKaXE1Nm1UbDJ0Z0JSTlNSQWJOVGdrVUYyYXQwM2RSR3U4?=
 =?utf-8?B?V003TE9zamJsamFzUXVPSzZSNFlYSytTSncyUEZnMThNWnU0cUthVGNHbkVL?=
 =?utf-8?B?NWJtTHA1cXE4S282YlFhbFB6d0xXTDFIMjBrVm91UTk4Umt6VDdWSitZV2k1?=
 =?utf-8?B?OEJjeWF5eUtnSm1pemN5MTB6eURRYlZnMzh1MUplWFVVTWlwZExzNmllMXc2?=
 =?utf-8?B?MHJlY2JwMG82MXgxU1dGTm55QU5ZMzRFcHJ5bWxEYnJpVVVrd3lCKzJNM3Bt?=
 =?utf-8?B?ZEdCQ3VrNTdHYzdaY1JGYUJYTitlcElESUNHSEcreWJ6QXpWYnFUUzhOZEpv?=
 =?utf-8?B?R3JuTXpEQWJ6ZUdBamJpRE9pMFVqNkQ2RHZJTm5Dd1RGOEFFU01VQjk1L0Rp?=
 =?utf-8?B?Smoya3ZHcWdSUEdJUlRWcGtLMFN5QnV0NTAxeE4wRlRnOHJHYlhWNTRZV2xO?=
 =?utf-8?B?ZmsxSkQrVDkyMUlUM3NRMXJjR2RzUmNRSUJpWXZKT1JacG5UTDVvZjNLYW9t?=
 =?utf-8?B?aDJLa2dHMm1iYzM4Y1BrekRtOFF4cWZOL3lqdnhNd2VkR0JoeGVKWVhmcWdi?=
 =?utf-8?B?RERwdHFFU3FNNnVEOFRZamF0Y0k1U3BhVkw1V0ZDRHd3eFVyc2tvZ1Bmd0Fr?=
 =?utf-8?B?bU5FZGVkclIrOGh1UGY0WW03RnBMYUQzSjBhdjVUYVF4ZkIxbjgrN2FSK0RX?=
 =?utf-8?B?eE5LVEF5WVBTT1JWb2t3RVNKeUk1Mjg1MDhGWVYwYm94a25hUDRYTDY3NWlF?=
 =?utf-8?B?NFE4VTFVZisvbFh3S0ZDajFhOXhRSENMM2pXaWZ6UnI0dUJidDR5a01zOXRs?=
 =?utf-8?B?WmpnYWNxUlJKc2I5aFFiMjV5NEQ4aGRqWDM2UlFEUml4TldEVVI4K3RUaXlU?=
 =?utf-8?B?dHZRekk3ZnN5TUNJUEwrM2t2emVxV1h0MjQ4RFg2OEZhb2tneXpFNjZuNGJh?=
 =?utf-8?B?YTQzT0pwY1ZtM3M1TytCdnoyaTB5UjJ2VnpIaFp4L203Q3lQbk0ybmNkd3RG?=
 =?utf-8?B?YzBYMFhHZnowa0pZejR5N1ZoY0V0QWhSVHk3UTNWaGRyY3gvcHBvT0xsRFZz?=
 =?utf-8?B?Z1BqZk9UYitoVVJJeWN5WEdKL1libTdWSm1OVEQwYlZrN3pGS2ZzQXNGa0dn?=
 =?utf-8?B?NWVvbWN2bUtiM0ttVlhJLzNnOHczbXVPd2hURnNjYTlPZWhYNHNoaks0bmhw?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9e0fff-14db-4886-6765-08db77413682
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 19:03:37.5379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfTa/eVKhj2GxQos2/rRmmh1UaT0bydP/HqdBfJjx6d8B/SgemPbD58eTahgZcKwsS/SDSoz7OlBNELJiItknjMJ88BRQAmp8A7KFJBFQrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/26/2023 11:43 PM, Dixit, Ashutosh wrote:
> On Mon, 26 Jun 2023 21:02:14 -0700, Belgaumkar, Vinay wrote:
>>
>> On 6/26/2023 8:17 PM, Dixit, Ashutosh wrote:
>>> On Mon, 26 Jun 2023 19:12:18 -0700, Vinay Belgaumkar wrote:
>>>> GuC load takes longer sometimes due to GT frequency not ramping up.
>>>> Add perf_limit_reasons to the existing warn print to see if frequency
>>>> is being throttled.
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>>>> index 364d0d546ec8..73911536a8e7 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>>>> @@ -254,6 +254,8 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>>> 		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
>>>> 			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
>>>> 			 before_freq, status, count, ret);
>>>> +		guc_warn(guc, "perf limit reasons = 0x%08X\n",
>>>> +			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
>>> Maybe just add at the end of the previous guc_warn?
>> Its already too long a line. If I try adding on the next line checkpatch
>> complains about splitting double quotes.
> In these cases of long quoted lines we generally ignore checkpatch. Because
> perf limit reasons is part of the "excessive init time" message it should
> be on the same line within the square brackets. So should not be
> splitting double quotes.
>
> Another idea would be something like this:
>
> 		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X]\n",
> 			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
> 			 before_freq, status);
> 		guc_warn(guc, "excessive init time: [count = %d, ret = %d, perf limit reasons = 0x%08X]\n",
> 			 count, ret, intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));

ok, I will split iut based on freq and non-freq based debug.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
