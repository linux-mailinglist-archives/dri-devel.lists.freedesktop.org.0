Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C494E3F2360
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 00:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151F26E9E3;
	Thu, 19 Aug 2021 22:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8021A6E90E;
 Thu, 19 Aug 2021 22:47:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216702274"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="216702274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 15:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="522636615"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2021 15:47:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 15:47:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 15:47:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 15:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnVN+1duxe/vePS4nh1vFrukQQQIsKTMB2cOtTaHaBsu2d194w1t8zzSjutGm0DjnwSeqUNR94eKAL0EofRgymJ0ya/DLnRVE9sosWvRz4YAJPv2WvntyFzunopr1lnb9m6d2DrO8P1+xg875YtU5Wa0MBZhAos4SBZlS8M1pah3Q3hGVhCM+aZBerixj6S/jc3Uy0tYIn69v3fS1qmpBo9V5OMD7ao+BzCf12Jrhc+KPnsQF+aRq7Imfpb6sMIAd2M7fc0IuBTNRs0Ycb9lXBumsTVhOZznK8apygW0fXjLfTlJfaGVZA5igJ4zBq+7dT36qrXlcFI74OrxFEGhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNZ9m6Gij/jqQaJS/aQcFkbbDJEZHSy0AwPmeOonk9A=;
 b=AHxk+fZ/9CbuA/qG2QQAQ3nvZGGkMxIRVRaZnqzmIUd7D/UzyDwziedY8w7xb66s4zYiv7g6fPGnATgVNyz5cYg1IDn+Te7RbLd05EvBmjLneDuDjpZIaLlCuovt/vUcMZTyVBo64kxY2bzCbEOMCkTnMfTsUjEeCQ9JANqcyq2n+ft8AsOdJZ1gOH2y0faep30G1O9bE1r7UQFAD9PMQFE0J+w18OOn1BgW3/J3weov7LLj8FsJ3OKbO9mSrtNsCW89aXBmRvtOZJVO+42soggZsSCzTn4LPMHtEInxMy4qB8ooUxCOHytxzR526Uo72NH5xrsU7FaHK1D/9Kw55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNZ9m6Gij/jqQaJS/aQcFkbbDJEZHSy0AwPmeOonk9A=;
 b=miuPDU8n2/nvSEtmfIUtl9wg2UslbBuKc1VOCKOyrbpcnif33PDgFfM9gQN2rCk3MlUNg7Nv3GOHrAB/5e1e1cFPvtnqFDxn2jzOhkj48P+kSnZh/1eCpe34JesXBTFtxCnpTRi1nPnOM9QBe78zc/PUdsehh0CM8rn8MBFatp0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5612.namprd11.prod.outlook.com (2603:10b6:510:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 22:47:40 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110%6]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 22:47:40 +0000
Subject: Re: [PATCH 1/1] drm/i915/selftests: Increase timeout in
 i915_gem_contexts selftests
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20210727031703.40395-1-matthew.brost@intel.com>
 <20210727031703.40395-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <175fb44d-bd09-8baa-d2aa-41e2bf29dd23@intel.com>
Date: Thu, 19 Aug 2021 15:47:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210727031703.40395-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR13CA0232.namprd13.prod.outlook.com (2603:10b6:a03:2c1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Thu, 19 Aug 2021 22:47:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cf5235f-9884-4ee0-d18f-08d96363594b
X-MS-TrafficTypeDiagnostic: PH0PR11MB5612:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5612132398A863C583BFF1BABDC09@PH0PR11MB5612.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0MwNUyo71R9ncdouE580miNXdZpkv56LW8xnvS7RvzeBg7/lKjJrFh45qJH+LqfoWBXqxqoab7mroQf2TiOYB4/T2xP7NZRkeUalvoDrCa8yG7ApzYa5EadcsB8WfeMv6j3nGyckmqD9jcnS3+k13kM1mcuyKOQKZ6QrK/tPAf5LKohxAkYEkeXg0VRWa2PXwNrICIB2VPl0Z5XHN3M2U+/780ZHLTTLakdYbRdIs58p9hnpTYlFjwxJVbKeNvAX0pPUtM6APToQD0rvO1AAjJmkVHkyrIpURlyVgHbw8h4iJF14HkfPq9w3elvkEBIKviMKa1ZyHYWpKgS4YApWgC1dntNAfwys2cNfbNQlng6+JGAMI9zK8noTcqxLn34k9U6x+U+7pAYn1A38GvViKFUpbfPdIzCCzzMPbgSigyJG8fBSNN/A0qTHnhZAA7yZr+GnmpPoo5A7I9pQcV022Dnez/kaC+r7+V9VNQUyYLr3FEoqlgj49jw3ZYOoXO19bco25NdPOGzs8I+Sj2lXYK7LVLB49KWBVvqOwrlomTbPtgusg2vM9/FF3DntQ04UpV+WbU3PK6/5d/CEqcK0QGPqoVnT/avwVHJ/18EmuhpwUwlg4Do/RlAvlM0dxUMl3ZACd6sJaO7vUl1vnsuwCdoJVHlPL/iSluUFf8ob33B1qjmT+bpD1j3CTGpglChh1Fxohg8JJS4DoOBZ9KqUxAnt5h3bU844yWCzg3u9mcw9xUOKsprzSkkcqJpf/y/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(6486002)(31696002)(53546011)(16576012)(8676002)(5660300002)(316002)(31686004)(26005)(107886003)(86362001)(38100700002)(186003)(36756003)(2906002)(478600001)(83380400001)(66476007)(450100002)(66556008)(66946007)(2616005)(956004)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUlYWnNycmxjYkdjMzFHbHZVVkhDVFl5bjRMTFpOVFRidHYyS0J2eUtHUFBQ?=
 =?utf-8?B?TTloK0NVU3BFY0IxMzBaRjRTaUJCQXpiVk9CS3ZZWnZTOXpqTGVuSTJncWtH?=
 =?utf-8?B?RU80TzVPekVsbnJONWkxamlwWHBFOWFrMDJXYmtaS3lyditZNk8vMW1MN2Jv?=
 =?utf-8?B?ZGJpUGhXRE1UeXlVc0lldENOSkp0ck1PaS9lb3Z4cHRHZXB6WEFZZ3pHTVdx?=
 =?utf-8?B?bTJIUXE1ei9wQ2hjY2Y3aG5Yb2YvY1RWd0Q4M0hSdDJnUzRtVDRKZmpzVzdq?=
 =?utf-8?B?ekhOdEFzTXpjQnpNSnIzUUpnRTRLWXJXWDRVeUQ0VVFIbm9PSTd0R1M3NE5W?=
 =?utf-8?B?Rm9JNlVJbjRMVFE4cVZsUUNQQXc0Q2piUFljd0srQ1JIelNMMU5IeHlpL0o5?=
 =?utf-8?B?TFNKSGlnV083N21ZSncrMTBRa09wOEZWNzdHVWxxU1pVK1dERm11S3p3ZThv?=
 =?utf-8?B?dzZkRlAveWxaTWxPdE9oWXJUVDRYeERTY2lkanMrazM1cVp5WUZCYVRscnRX?=
 =?utf-8?B?dE44cm1xdEYrRVdrOENnUkFFaHpFR0NuY3RUbmJ6dlJhYjUrQ0tpRWdhSDVx?=
 =?utf-8?B?NWYrSnovRU5aZm4vcWoyV21UWm5BSzFsbzViNjUrMXRMZFh4dW5BQ25tTm53?=
 =?utf-8?B?OHVUblVGUCtMbWxCa3dvM0NQOGszQmpZYjJWOUtuQ3VVTSsvbkRZQmNuWk1C?=
 =?utf-8?B?WWJpMUFWbUg5dWxJZFM2cDZPUUd3WitKaGlWQXlVdUVtek1acENlZitvVDk0?=
 =?utf-8?B?bElic09ySHJ3S2NEWEh0YWhubWh6cHpKRGp4VlBLOHlQZUsxUityT0o0N0tI?=
 =?utf-8?B?cjd1UmRLN0QzUDNVRjlQYjA5dXEzd2hRYnZNTTVvMTFZTGFOQlNyTTh3OGcy?=
 =?utf-8?B?QjZnMG1DTC9jZ0JrVFd0Zm9zUjJMNk4rbVRFS3RvbEZjTUVUTXEwSEdsMHg0?=
 =?utf-8?B?T3UzRjB4TjkzSklCL09mekhYM05ZQkVrMk93V3BhMEVVUW9QVUJ1M1JFZFRQ?=
 =?utf-8?B?cmNDdVZEclBhV0M5ZzJVd1VqSG5jTTY0SWZsc2J5SndHemd1RzA3Mll3V0t1?=
 =?utf-8?B?Sjd1VHBDZkxoellXKzFFVTdCN3k3YWVMUnh5aTRYOHhTVnQzM29ManZVVHc3?=
 =?utf-8?B?R2dad1lXSkJuTFNCTHFMSXpYc3B1V2RtWVpGVExPZElSVHNQUWgxRE5udm1a?=
 =?utf-8?B?RXNaZWQ4b2J0cHJZVlVZUXJ4MWxTblNzeWVRWklNVW9wRE9YVlNyVkVIL1Bu?=
 =?utf-8?B?SWpYOFlrMVpTdWplakRpMUpRWTdtL3BxVlIvd3B4ZjZIYVU3YXpHVFNMU1FR?=
 =?utf-8?B?aFQ2UUpiSTBmdnY4K3duMDd1eTV6RWhXSTZXYmFLam1VWUIvM3o4UHZkdTJs?=
 =?utf-8?B?eStzZmZ1VFcyS1loamFFWk1Samxya2dGdS8vRHl2TmN4SWNIRVQrRDlNcE4z?=
 =?utf-8?B?Z2FNNHdhWGF0QTZ2K0puT2JHaVdzaG9RRldxUllsUWlBODhzbzdKV3Voc1Iv?=
 =?utf-8?B?QXlGRGdZaCtzb0xHcGpqb2d5U3Z0TXJuOTRnMHNHejdzSS9TdlY5Q0FjcFRW?=
 =?utf-8?B?bG1PTmlCVHR5Sk8xSk90Zy94T0Vsa3AzK1JEV0k2empzTURCRE1nT09WVmlw?=
 =?utf-8?B?MUVIVTJZNmU1eEozNVNDdE1XTThsR1UvbXNPaUQrQVI4UFp4d09uSjdiNUNw?=
 =?utf-8?B?bHRMcnBuZEh1WWx0L21RNDU4RjVEeWVKMDdDa3V6UTJxWko4d09OZ0pVQVRE?=
 =?utf-8?Q?OBS85GheeyT+HVO6R7MI3AriXc3BqW2Sj8Me419?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf5235f-9884-4ee0-d18f-08d96363594b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 22:47:40.2142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/+2MQr49tsO9s8xYvuf4MtoMDuRA7PzgFByIXRlAgS45iv1eoxkgxEGdAW03d8RaDYlfVxC2oM28BCqn1eXl6wJF+N8fyeQfOBaBqzWzrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5612
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

On 7/26/2021 20:17, Matthew Brost wrote:
> Like in the case of several other selftests, generating lots of requests
> in a loop takes a bit longer with GuC submission. Increase a timeout in
> i915_gem_contexts selftest to take this into account.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 8eb5050f8cb3..4d2758718d21 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -94,7 +94,7 @@ static int live_nop_switch(void *arg)
>   			rq = i915_request_get(this);
>   			i915_request_add(this);
>   		}
> -		if (i915_request_wait(rq, 0, HZ / 5) < 0) {
> +		if (i915_request_wait(rq, 0, HZ) < 0) {
>   			pr_err("Failed to populated %d contexts\n", nctx);
>   			intel_gt_set_wedged(&i915->gt);
>   			i915_request_put(rq);

