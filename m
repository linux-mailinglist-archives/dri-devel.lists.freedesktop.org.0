Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5385FD872
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFB410E893;
	Thu, 13 Oct 2022 11:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D6110E893;
 Thu, 13 Oct 2022 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665660914; x=1697196914;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6dwFQ/3KSH5R9TQ0SrH0kRMo3/UGwlP1HvcqxDJcxnQ=;
 b=QJUOe36wEJRNSjRefxiEmi3UOfg7ID29ys4ah6JiBCw1aDsB9pxYY963
 G/OS/pW6NLKLugrYp+ipd/HJRaG5Td8j9sS/6TWPvoxIg5nAOLz+3Siu5
 81z01Oa00mUkpyNnBsJdsL9EzC7vMI5NVAdDP5FQMqyMyBEsv+6kPL018
 MAaiza3lIDDO6LS0dRomohDkS0FY5inMthaKcG3YRjjUxMzbIvLcvSLEg
 Lv8QY0w8rAEdSPUNht8dBDwSE5AZ6RHuwuX8BaGuXoWK1jk9ETz2HNVNu
 bjCAQ4gjzgtyayrUpCJEZdHKK9eVA0z7UqwrKqXy/c2UtOHJMv8Zgo6/T w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306116290"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="306116290"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 04:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="752487726"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="752487726"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 13 Oct 2022 04:35:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 04:34:57 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 04:34:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 04:34:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 04:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK4mMvauRezNxi3YX78R1OAZUWMi29Yz7F6wZp8eIgI+MyxbA23KqjU5G7SLYbJD8jzRsjN2mmZ+Pgyksq/6MG/ZHY8gJK4lKkNlV4SSYYgQ2ijPYP4A32zuO0V7wY/l3GdTL+iLzuQmoteN3DTajFvcEvgLxiy3eY4Q80aXwtaqRwRzEYh6m6EwTgXAkRPK2Uy4TI9fwrDBAR4SfVj9cEMBTJj3dBW0VAzHZQMkhk/QpdhJ1xuQSM6FNK2iiSg6RrmrH/4bG5iVszoCOH4XAFvg635b8/NjhXjroCE4JB2OaGvP3mMYthVErRKQpB3ZGqvVftfXc30ppOSBq84yOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5F4Y/O33yNwo8EqjLBAkN1+jyX0S8QpuN8mJ3ktO9Y=;
 b=g37HQm65ZQlrl4M8w2/Goqf6hEDiJK0L3cNV4D2LHNIHtfLlXMY3Wp0LKG3anGHGuVZ0SeJ7wKX1S4B78Si1igqYUz9wYS+ybThRjIR2pqjCG5iVFJ3fabGslEd/boh9QYW5hDiOo0Bij+PEd+zils12mbbRL3ZR5G8w+oYNKMZlS9XmCbuJmQcu2rKsFG/QEDk+/dwTZpYx2lenjBwY+sBSyx/eKHFExEeWDt86xo0EPzaghOyf4if34yuLLZjF6jgRxAarxkFl6k5R0thRe35jcGhtUzl6KIPrANS6O5sAXGAP7VoF+DbG0VCQq/KiQFjMR9PzL8XIJKgo3YSHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 11:34:54 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::c7a5:baef:b2be:1516]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::c7a5:baef:b2be:1516%6]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 11:34:54 +0000
Message-ID: <b8a7ee8a-923e-57b0-8c41-1deae1d61cab@intel.com>
Date: Thu, 13 Oct 2022 17:04:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/slpc: Use platform limits for
 min/max frequency
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20221012182625.10219-1-vinay.belgaumkar@intel.com>
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20221012182625.10219-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd29cb8-3fab-420d-1073-08daad0ef299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6c43r2CxdvqkW4kyPVHwfFvROrlDqusO7xu+A3U6e2WLbnIRyhkCX95p3OijK7JBq3plr9mJRQbrW81SXduIJFpge7OWMNORpN80DcJwmFDpjZZd9G6/iuLg+u23Hn/attcluKxPF6lHlq+eewBvI6f40nyNJFYCdClDmjiklF1IAVz2BwQ94dprQhar+w+aTEKIBMPuA3xw7i1YA5CJ7aGMUah/NHv/lt1sNPaKKT2YogRGXwNNzbHxI7nH2XyHn8fa60qbCFgoYb76/kcA9rQJkuB6ROCfl6VImUMwNn7DbSNPmGz01kGnhL1ys6TWzx0yGS5ioUzrkUuvXEujHongB5fVT8IAXNMWW/LahemV0LJLlcrnAa+xp3lSoUB2A0kR2eNlO9h9MYfR7TvxcrIfIe2xWyP+xEyNJmQauUPbQ84fGSt9n9YHmIoZA0d6+zq3aFoSAByKZ3n5/axWqwVhVzdJmpKXpSOL66LRFL1YpUqhnNI1eUTjZ/xZREpphJa7R6W88cMNEs7jNdBRgidE6qg5udWQAe0YUmk2hiPp1nJaZHRfRh26oIswYMrSdwjW6UfIjjeXw9mvhs+ZYOPVBGRAlMp+X191pij6CNtYCj5N1FfXtgF+DuYdNq0wOGvSnVEpfEca8gDcF73uXLXkNPELNCEdNZXo3Z9vmltlrs1/S1Goasy8V9JaJGawqnVZunlmWF+1pEaOmq9Q4jHEznLsalbrXjVmeiymIK4I71XZJYWfFHWBwY/sTIawYrr16UgWzmIklQLd1fHGPL3HOU3raMFQe9yIn2PXgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(31686004)(83380400001)(8936002)(316002)(66476007)(31696002)(450100002)(66946007)(41300700001)(8676002)(66556008)(86362001)(186003)(36756003)(2616005)(2906002)(6512007)(26005)(53546011)(6486002)(38100700002)(6666004)(5660300002)(6506007)(478600001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZNWlk5WHAzeFpIdXBsRlc4QWptV0R6WmJmUWFVREhFOUVwcmp0ZGdsS0pp?=
 =?utf-8?B?ZGJHNGt5aTBsN05zQ2dpdVNGL2pLc2VFWDdMbWJEcU4vTVEzN1VEOE5MaTAx?=
 =?utf-8?B?b3E5dmZta3JvcTNVTnRZNDNGK3ZlQndHQ3VzN21hQitrcnBFTEo4NnRxNGt0?=
 =?utf-8?B?RS9pOTdtMEpYWGk2em1QSCt5eU5DNndMMGRWZ0VjazZhOG1lQ1ZiWHhzcjJK?=
 =?utf-8?B?UGpxOGpDL2xEOHpwOTZUNzFucmxSUThlUmR2Y2lpYVZFUUtVYktlcHRCeUQw?=
 =?utf-8?B?eUh2RWU5YVN1SFp4cnNYTUdKc08rdzdLRnlpNGFnQlFVa1FkWGM3bHlScy9E?=
 =?utf-8?B?RGRkbkZtMDRxVEx4SE9BSlJad2hNSlhYTGJuK0s1UlFYYS9mSDUvMEk2K1NZ?=
 =?utf-8?B?S3Y1K2V6VXhaUldsNHFJaVVOb2NSTGRaZll2V1M1SlJoOHlPRHhZcWhCcTd4?=
 =?utf-8?B?YWcrb1VPR2VWZ1pUT3NLbFA5SzZCNGFQU1crN3ZXQklQeG95cW9HY3dFeWRh?=
 =?utf-8?B?Q3lxbXBLaUZvUHZOQlRmQ3QxZTR2UVBpb1hINDQyZjYyMXlZdGNnTzdDQkFM?=
 =?utf-8?B?dmx4Sm8wQUs0cndEMnE1MXJRNlRaZTBVbytQZFhPekMwWE9NTXFBU1A3a2tm?=
 =?utf-8?B?bVVoYnh4dDQ5Y1RrRW5OR2Z1ZllNK1BqS2d0cEZnWWV4VEZrSS9iZzhCRHdy?=
 =?utf-8?B?cEpkS2pvM0JLeCsrNUYva25QMUFCRlIvZ0g1akV5b2NDRkU5RFJrSThVMzlN?=
 =?utf-8?B?SnNna3dmYStjKzNlaGRxSVBreDZicHRWM1dMNUtjRFhjM1kzdjg0ZGNHdEFa?=
 =?utf-8?B?RDB6T0ExeEI1TS9QSkxpMzZkQ2hBdE10TDNqRENxS2VwU09TdjI4WHdKUGR5?=
 =?utf-8?B?b1pEWk5VdnltODlmck50Vmt4THRuMmpDc2xBblZTSjk5OVd1dFpJd1JRS3Rj?=
 =?utf-8?B?WHF0MXZMMjhwRDBJVXp5TVUxOEpkdjdvT3l0TXZ4UHFGd0VZMW5lZ2VYcC9L?=
 =?utf-8?B?WU9UUkhkTHlnRDhTdXBFQ29vdEYwd0RReWY3dm5wREJxVmlLVTdmdFVVV1VG?=
 =?utf-8?B?R3BOTldrOGpIMGJ5Q1AxODV3K2xkSm5VenBaQXdDdDQ0dkJ4cVNSRVQrTzlG?=
 =?utf-8?B?cXg2cW5OM3FITmU2b3djeDBPenJYRXQ4TmNpU044U2x2QUdVM0JHeFo3REh6?=
 =?utf-8?B?d21rVnFNYzhKSHVhdnV1a2g0RUhaZE4zMlorYW1jZ3J5N3FHMWYvbVpOZGNW?=
 =?utf-8?B?dnQ2eUxJSFdtWUszMUFtbGpOZm4zbnRpSHVCOU5SQzBGNHBFTjkzdUhGaVpo?=
 =?utf-8?B?Ty84dzhpNkFaMkxjTElEQ2ZoZ3NWV1NlS2NLMEVzQmxlcURpcE40b1N6YzJz?=
 =?utf-8?B?bk5FQXRYQ1BmbjlsUW9SUWVuY0VnYW52R1ZBR2RlMTRDNGd2ZUIyQ1pVbUJJ?=
 =?utf-8?B?MERRNGdiR1gvNVFXbjEzL0RCYVE2T2lxMW5CUHI2dk43WEZ0TklFUEV0dVln?=
 =?utf-8?B?VmFqUTlqQnBudk1RUFA1blIyZW1YV2Q1SldBZGpMQnBnQ2VKSE5QZlhCcTZX?=
 =?utf-8?B?R2gzbHloTFE1YU10RGxwb0dtSnFoQ2N6bFBvdmhuZkRZSzhZeTF0RUhPOWtq?=
 =?utf-8?B?aXVKbDNHV3hnbUJJK2tIT2ZyR2V0aG9oYTN0bzR6T1BqSDcyVFhFYkdqRE5v?=
 =?utf-8?B?dmtTSmhEcWMwWU41enlKUkpITVl5T2k1OTFxbm8vTHg0Y2t5VndqeHJnUGVy?=
 =?utf-8?B?b0EvUlFiYXJ5dUw3eCtodGRWVUJKZGpaRDAweVVWSms0Yk03UVpBQzFEK2xV?=
 =?utf-8?B?Z0pCZFlrVzFWeE12RGRySklzbFhzQU8rcTFoTFpvY0V6WlZ5WWFZaWVObGx0?=
 =?utf-8?B?VktIQUIzRG5TT3V6SzhTNGlGK3g4cEhISjlhVnVQZFRtUWpsTC9heVJ0UDdV?=
 =?utf-8?B?OVdUOHlrcU11cCsrVUZnRDYzeFM5RDJoeE9JZG1ZeFhJYkFHM0pWM21pRkJl?=
 =?utf-8?B?bTVaWEJZWmJkRjk3MzF2cG5TQ21zbTRiUWhkbitYbDY5V0ZuZFJuV3Nqa3Av?=
 =?utf-8?B?QTdNbGhFT2pNa2ZncGNoRktCUzUzM2hJMUwwMzJsQldGZ3RSQk5GY0VlWmVM?=
 =?utf-8?Q?tPIzCvRKzXDrZ06VRFpFNV+Wo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd29cb8-3fab-420d-1073-08daad0ef299
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:34:54.1528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H668C2RZ0DCq7ENMS4IwGnW4W/NTte3FxHEpmZ4fgQGbVdIbLPDpWKBrcymzGIfVHiunS4rVVgIoR7pmwJHXNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
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



On 10/12/2022 11:56 PM, Vinay Belgaumkar wrote:
> GuC will set the min/max frequencies to theoretical max on
> ATS-M. This will break kernel ABI, so limit min/max frequency
> to RP0(platform max) instead.
> 
> Also modify the SLPC selftest to update the min frequency
> when we have a server part so that we can iterate between
> platform min and max.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 40 +++++++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 ++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
>   3 files changed, 60 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
> index 4c6e9257e593..1f84362af737 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
> @@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>   	enum intel_engine_id id;
>   	struct igt_spinner spin;
>   	u32 slpc_min_freq, slpc_max_freq;
> +	u32 saved_min_freq;
>   	int err = 0;
>   
>   	if (!intel_uc_uses_guc_slpc(&gt->uc))
> @@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int test_type)
>   		return -EIO;
>   	}
>   
> -	/*
> -	 * FIXME: With efficient frequency enabled, GuC can request
> -	 * frequencies higher than the SLPC max. While this is fixed
> -	 * in GuC, we level set these tests with RPn as min.
> -	 */
> -	err = slpc_set_min_freq(slpc, slpc->min_freq);
> -	if (err)
> -		return err;
> -
>   	if (slpc->min_freq == slpc->rp0_freq) {
This has to be (slpc_min_freq == slpc_max_freq) instead of
(slpc->min_freq == slpc->rp0_freq).

Servers will have min/max softlimits clamped to RP0

Thanks
Riana
> -		pr_err("Min/Max are fused to the same value\n");
> -		return -EINVAL;
> +		/* Servers will have min/max clamped to RP0 */
> +		if (slpc->min_is_rpmax) {
> +			err = slpc_set_min_freq(slpc, slpc->min_freq);
> +			if (err) {
> +				pr_err("Unable to update min freq on server part");
> +				return err;
> +			}
> +
> +		} else {
> +			pr_err("Min/Max are fused to the same value\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		/*
> +		 * FIXME: With efficient frequency enabled, GuC can request
> +		 * frequencies higher than the SLPC max. While this is fixed
> +		 * in GuC, we level set these tests with RPn as min.
> +		 */
> +		err = slpc_set_min_freq(slpc, slpc->min_freq);
> +		if (err)
> +			return err;
>   	}
>   
> +	saved_min_freq = slpc_min_freq;
> +
> +	/* New temp min freq = RPn */
> +	slpc_min_freq = slpc->min_freq;
> +
>   	intel_gt_pm_wait_for_idle(gt);
>   	intel_gt_pm_get(gt);
>   	for_each_engine(engine, gt, id) {
> @@ -347,7 +363,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>   
>   	/* Restore min/max frequencies */
>   	slpc_set_max_freq(slpc, slpc_max_freq);
> -	slpc_set_min_freq(slpc, slpc_min_freq);
> +	slpc_set_min_freq(slpc, saved_min_freq);
>   
>   	if (igt_flush_test(gt->i915))
>   		err = -EIO;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index fdd895f73f9f..11613d373a49 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>   
>   	slpc->max_freq_softlimit = 0;
>   	slpc->min_freq_softlimit = 0;
> +	slpc->min_is_rpmax = false;
>   
>   	slpc->boost_freq = 0;
>   	atomic_set(&slpc->num_waiters, 0);
> @@ -588,6 +589,31 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>   	return 0;
>   }
>   
> +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
> +{
> +	int slpc_min_freq;
> +
> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
> +		return false;
> +
> +	if (slpc_min_freq > slpc->rp0_freq)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
> +{
> +	/* For server parts, SLPC min will be at RPMax.
> +	 * Use min softlimit to clamp it to RP0 instead.
> +	 */
> +	if (is_slpc_min_freq_rpmax(slpc) &&
> +	    !slpc->min_freq_softlimit) {
> +		slpc->min_is_rpmax = true;
> +		slpc->min_freq_softlimit = slpc->rp0_freq;
> +	}
> +}
> +
>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>   {
>   	/* Force SLPC to used platform rp0 */
> @@ -647,6 +673,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>   
>   	slpc_get_rp_values(slpc);
>   
> +	/* Handle the case where min=max=RPmax */
> +	update_server_min_softlimit(slpc);
> +
>   	/* Set SLPC max limit to RP0 */
>   	ret = slpc_use_fused_rp0(slpc);
>   	if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index 73d208123528..a6ef53b04e04 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -19,6 +19,9 @@ struct intel_guc_slpc {
>   	bool supported;
>   	bool selected;
>   
> +	/* Indicates this is a server part */
> +	bool min_is_rpmax;
> +
>   	/* platform frequency limits */
>   	u32 min_freq;
>   	u32 rp0_freq;
