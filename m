Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04523D7E72
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 21:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30556E4DD;
	Tue, 27 Jul 2021 19:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001176E4DD;
 Tue, 27 Jul 2021 19:22:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="276298962"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="276298962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 12:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="517074710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2021 12:22:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 12:21:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 12:21:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 12:21:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 12:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFnhulgpcgKaGaaokjFkNnPAviezxPeRQzZXOsyiygGARx3ugqh26q5I0pN1lsOgNy3iSoGzLBxQisisIsciSQH2TFmW1kLk8F+rSEEhn+wtCUeg20X6lC1NRlaeLr+CTlk9Hf6LxY1wKsgGkMST0ye5tzAqnprInC4FMsU94ZwVKsuvqJRY69OFbTcIOF0Eoi9u13i98u6lJZWLzDkASBArXkvQCw0aONJF5y+PodcU4DhPCrEBybs7N+YkKzglDtKK80hXxPFi2p2rjmHCIK8wdGiQ/GRSbljWuRrmvGhfBlRx79whHHfB/c0bdNbfgO3xS40FNxkkZMhsYEM5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF10FZVFanMTduLrxpabHAfsP4J8DzPdlzeNozmprdA=;
 b=I02dNP8W8bk57HP2r7tFm9ek7JjqNcu7B2CbyopwmaVVY+JzyYbYFOXcxPaM1hC2o3/Ti38SQLbX1WSL7WShQbYAgsAinxKFfd96vmfPKkwP3QbDEn9tB1Bj+fliSacu+d8kZ4VMf8P+2TVNBt/6PPf2WfmlQ3sAT1XOhrpk/PCev78R2e03VZir/MSonSgON/A+ewJoYViGOssyqpIn68wTV79GISp3OvadSro4ImsLjCEXfHBHgwP/6hwzk7N7HTPTK4JeJwOplWwilwydy6yO1r3sphATavGttaNA036EtjlxKaoWr82lEL6tus2cf9MTXC//ROgWpln1Q4SDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF10FZVFanMTduLrxpabHAfsP4J8DzPdlzeNozmprdA=;
 b=k6M9MUDRA4+O8MeMN0hwCpwt0Q1F4gS2BW0JXQla7fJZgfZXU8OfKPYusY8F1gercdKE4OrGY7YA+iP91lmVVDYwLQFbINnl8+6IdxEaINBeJ1q5X8rv1/pBLZEW5gTIakgK8lC75JR1Qln6UjsyvGbpuWHq6RCdlII+0vN6+RA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 19:21:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 19:21:47 +0000
Subject: Re: [PATCH 29/33] drm/i915/selftest: Increase some timeouts in
 live_requests
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-30-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <c2cc8170-45b7-ec64-2f68-0ef1de183ecc@intel.com>
Date: Tue, 27 Jul 2021 12:21:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210727002348.97202-30-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BYAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:a02:a8::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 27 Jul 2021 19:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c5a6aec-9f36-4dd6-cb6f-08d95133c6a9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5578:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55789AA87C3E89C21733DE05BDE99@PH0PR11MB5578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqoMotQnhS3OMW0fw3lZziC+H242cHdIsOG5hXu1eKXjzC6xxsvm8asotXO00rGg0hVeJUALgOE+1uNpCjVCFfAFaVijEXffV8AsEM/asN9SAdNCUrmxVk9RoDgBtjO5jlze/NtzdOB8bTacBVTyCPWqRELAyfJQ2AUBeQUk6rHba8yoZmyvi/6fKXgvD+fqyYvRBNfI8mjXib+QbSSEUFlmYvX6Hz3Op2WjRm0kF2P8FKY3VKAHiUHwMSVSYtMs+UZD2brCAqoyZEscjgy0FKU75KgRrvaMdi1ZBlg3hIz+lBRwQo8q0AfjWoER0W4TKZ4fg1qaJxAQ1MXQ9/JDE92Z83+r2r5fC4hBiFuFHCMAufXPBvp4tyYADWReoEGITdwZjPHf+vTaf4LRWIW8AZcL5/AOlhX/Mh+dm62OF44GNmoOmZD8QCcMz0var7vWIFpJZozbts940tE3Pib6FwiFeEEUPMZGC9P0qlIK8kYwc5ZCHxq6onkoyZs131y7ML0J8vvHEy08KLhgeGWsnr4BDDRdOOMCUGX2YY1ihUiRLWLzUFI4ymqbZFr3eow2hI5nqdXKeOwGmrrvu4vrdmO070GeMSGxaXCux+SGiU2NY4AaAyYc1SbyE6Tz3b4kTfCcoJ7zl3StUV+gH+Il45hHsVdti/pe3sjrWrp4N9jZkScgXXDSlzCDBZibcuXOg/PWmecZZXsVQCVHo/wk7qRB6M1dPL9uhwDuyMl9bndfJXvSSlWzYX5b+XnyDCZn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(31686004)(450100002)(6486002)(83380400001)(8676002)(107886003)(16576012)(2906002)(5660300002)(316002)(36756003)(86362001)(66556008)(66946007)(478600001)(31696002)(4326008)(53546011)(956004)(66476007)(2616005)(8936002)(26005)(186003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJmYXpmQ1VNNTRTQ2g4YStsVCtpVCs2cXRpb2NpaUtSaVBCT1BSRldDR3NR?=
 =?utf-8?B?aHp4MXJZc3NBQzlvWjlpQTR1SXZySE4zQ1pUS0VnMndDSVJXY0lzZTBLeUlK?=
 =?utf-8?B?cDhTVmNFM1VDM0N0ZHBkK2JLQU5pbjRIdjFubEVsVWN1R2Rpc2F2ZVl4K2pE?=
 =?utf-8?B?alBBZE1tajJXYmF0Qk5ZR25hVG1WVUVNc21YZ3U5ckx6UmtRaTQ3M3ArbE5E?=
 =?utf-8?B?L1U3UG9BSzNHOG9ud3NSTERVSitlTkNCVjVhM3VkZndKTUlHdUFuSHI2V1Bu?=
 =?utf-8?B?RlA3S2NCT3FKVWJhY1RIWnBoQ2NBQlBNTU9FT0Z0S0dVeFE4NTd4dmE1cmsr?=
 =?utf-8?B?bFpuRG15Rmx5ZktlRmZpL1cxUUtiNkU1ZlhkVUpzKzZCenVLVmgyZ0RXbmx3?=
 =?utf-8?B?WndVc0toOU5md1ZsYUFYaTBKc3NnUDVpQVMyVytDcE1uT1JvWDgxREM0RWho?=
 =?utf-8?B?dWFISHhEVjlNMUFKTUFMQ1NEZ014ZjNUVWVIVHA1d3JSdnBYZnVqeEE4eWph?=
 =?utf-8?B?Tmo3ejFqNDc4UkNWTUVMT1NCSmNKcHVSSWJ1UDlHdFJKZnFWNHZzZ0UwZ1Vq?=
 =?utf-8?B?dHlsdE9LNFp0dFYwL2wvWERzeEhWZmNTemFONFRNbUlJbDV2Zk82QjBQRmhi?=
 =?utf-8?B?ZGYyYzhwc3I3Tlh3NTAxUUdhbis3VjBlNkFOdkN5Ui82ZHJITjNpaVUraWJa?=
 =?utf-8?B?Zmg2VkZBN0w4NThxQzFwaHRBNzc3N2ErUmpLcmJCQmYrRExleUYwNFJnZ3F0?=
 =?utf-8?B?b3F6V1VKMXQ0MkpmRFU3VEhGMVRnZ3EyOUM3VkZmZitjMXI1QXRHeUlsMkVs?=
 =?utf-8?B?UnQrNktwM3padFZHOEtTWTVlOWVuYUIxWU9vb2RZZzhoNXI3YTNnclpCcjQr?=
 =?utf-8?B?WE9xUytybVR4em92VytRcFgvblExMmFxQ21XRFl5UG1lTm1kRG0zN0tVOGlF?=
 =?utf-8?B?KytkZFZwZ05EdHNFY3lJM2FDRnlncDB3Q3R4aDFJVForM2xyODJNS0dTZU5E?=
 =?utf-8?B?VUJjeWV3MkozdUlBNWpyMTBWVW1BYUJGSmVSaUtNRUNuSlJNMURiNXhMU1dq?=
 =?utf-8?B?bDhKNWpIaFZwT1lVVERDMlBKbnZZR0JuTjNpSE5NME1pZ1phb3VxMFU4V1Zq?=
 =?utf-8?B?SHVXY0hZMmFBTUF3V1RqZk9jNlNLNjVPVzZobUFlUDRhTnhzS0M5c3BWa2xm?=
 =?utf-8?B?MEs5Qm1Yemlhd2hEeDNXVVluMVVDZ3k2MkFMcGVkY0ZYYUhwLzRwaG9oL2V5?=
 =?utf-8?B?clE1MFoyY09MclZPT3ZHWXF0NEp6dzRXanhlZlNqNFIxdVdKRTg1eEdVVnlI?=
 =?utf-8?B?TnRKWUtyS1JabVFMSzlKR3U5MFB6MVc1WHVwVm9QUEs4K3ZTMmxhNGZCNEpy?=
 =?utf-8?B?KzhzWC85L2hPZVdBZjYxQnFNN01qcmhRQ1dYSTJtSENBWllxQ1ZYbzRaQ2RS?=
 =?utf-8?B?YjFnazZIWUtBa3N4bmJhT29JUldaVVJVK3FsRkJlWUc2SVZUeUg1NTFscG1j?=
 =?utf-8?B?ZDJuWWV6NGlqaXJBMzRQZG9LZ2tSaStDRVZaU2xOZ1N2aWJpMDdKOURJU3FU?=
 =?utf-8?B?R1g3ak1HQjQxeHBmQWtCclZkM2tZaHQ1NTFTREtFeFVVTTV2Nk00WGRSbXFm?=
 =?utf-8?B?OW52citwMXFUWEZLa1pod0RSN1FJQURwY3pRbCtjUXVmQjl6SkpZbmw1V1E5?=
 =?utf-8?B?eXV4RDQ3R3BmNkErVmpPY1NjbUdzbDIrZkhrMDJjaGN2L3AzZk1BallJV0d3?=
 =?utf-8?Q?LvEMuuO338caeroqfQbqvRFdE7KVEBmnfZKJt4S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5a6aec-9f36-4dd6-cb6f-08d95133c6a9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 19:21:47.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtoCfa39wMrrmj48Q3gaLufZEui8JCj6UX0ff/nDqSEYukmXlkkhZdo+W7k2Ma0NLWr4xm+yZN6oZWr7hLyojToysFLb4JaDOc0eGe0vD5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/2021 17:23, Matthew Brost wrote:
> Requests may take slightly longer with GuC submission, let's increase
> the timeouts in live_requests.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Was already reviewed in previous series. Repeating here for patchwork:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index bd5c96a77ba3..d67710d10615 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -1313,7 +1313,7 @@ static int __live_parallel_engine1(void *arg)
>   		i915_request_add(rq);
>   
>   		err = 0;
> -		if (i915_request_wait(rq, 0, HZ / 5) < 0)
> +		if (i915_request_wait(rq, 0, HZ) < 0)
>   			err = -ETIME;
>   		i915_request_put(rq);
>   		if (err)
> @@ -1419,7 +1419,7 @@ static int __live_parallel_spin(void *arg)
>   	}
>   	igt_spinner_end(&spin);
>   
> -	if (err == 0 && i915_request_wait(rq, 0, HZ / 5) < 0)
> +	if (err == 0 && i915_request_wait(rq, 0, HZ) < 0)
>   		err = -EIO;
>   	i915_request_put(rq);
>   

