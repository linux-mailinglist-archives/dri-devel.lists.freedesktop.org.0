Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6362D470FE4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F3A10E2FE;
	Sat, 11 Dec 2021 01:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0A810E2FE;
 Sat, 11 Dec 2021 01:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639186390; x=1670722390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JNPd7WEg9ZdzMEbjc8iMZjxMfGcQU0O8Xu9vBxIBQCU=;
 b=SXP2iTWAitxPfsTkhyIeB6tBpwqZ3Ch3IIPPz7m9LH0iZdQWaTPGir7L
 Bl39lDV6MlVWcCVUfP5rJ6PxbhbDkOXWE+nlWN5ZBmJGvOEhFzaBP3YtL
 nSiLHAdIK24zrEYizly/vhnvlYhuLbccrhLZ8fer3XKqxDhkDw43Eqwxc
 8sfAQsKHEZXnIhAUcamz5othdL15perwPtSaIzYlh2jfTA88o9jgKYnMz
 2I1jGG8/v8z42Bx9ZjcSiYw+iOK7F5ICev3TkNQZQylzVDq1DIPPxuUR+
 BTaTNVIfG9iHOoNtVu4ebxpHlJ2b/v4tawxE4bcrZvJMy9nGVYsUgyRRE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238720678"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238720678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="753360878"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 10 Dec 2021 17:33:08 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:33:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:33:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 17:33:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 17:33:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM/2G/Y+t7rGnLoXQUlx+EGf+NlYBzYaCo9xhVj9Jq6HKk3nH0x9D/qV9ev06sea/YqwgD8ajswCc13TPiGWCXDy67P6AiLkDaMntO8WI6UqZ8lrQS81NCLzb8uOmAQJ0JJCp1gZ6Or74eb554DVc8ybuLow2NhwLWKIQaD+bd0TD7IhdJbScFMnVJ2dOnSCuq1AbKNWG/+N8eRb/SiFA7Wnf8qjfVvH5ZHuRWGdHjM3jb9a70/LsJvCC+jd8VhAVzRuKq2sZJ0KwitI7mt1d2+xjoimyj1lI6Ep1XcW+f5EbWCX0+3A/qpYKKwRKheB8avqRz5ldj+wMDPrE/4R4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNTcp4bgxhhCWc8BH6bufeFovDe5w27TLXjyxtNyfec=;
 b=cmbn5ogQ8EREzWhiFuInIzgjKfwDpBscRq7hAeXTdx7uZqv66ZOmGn/jIpfXXWy5b0pDgbuV6gnJz/BOLo/w5E6UqwI/uNFitLHW+mDKYCvGR3v9T5bQDr24ZW61CLYdFJKtK0DJ0xTknLgpkSYuYR+LBv2LkacPtLC/9o2qwxh2wJZO/bARRR+J0kFE+ZYYqs4Taw0eg7E5UEy6vwQIJ7XX/xNeEu9aez8drCFvF2JQ4jd92X5GxzRdOP8CoqvkwrkGgNGhJVq3kAzQP/erlmc9Z1huQlQHJp21sZK6eI23N1gs2TnHCiT4dD7UT8TsOMOODvjFzeC1WHn29BIW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNTcp4bgxhhCWc8BH6bufeFovDe5w27TLXjyxtNyfec=;
 b=wkcUfI6fMCaColiw3WwZP6b1DBrqm8QWw2IbjkBgJNYQClRVOR8APs8lkmevQ6ZqQM2nM1sDlumGObGPMQ98gzxJkY0tbhXETfd8hpmnILI9env7RXe0SFXYfk8ziEZTpTQwroYAZ3rvnfj5JPFDuxhsbGJrJLekwd3UNnYYuuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Sat, 11 Dec
 2021 01:33:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%5]) with mapi id 15.20.4778.015; Sat, 11 Dec 2021
 01:33:05 +0000
Message-ID: <111dd483-dff5-2e60-2913-e6bacf35dda9@intel.com>
Date: Fri, 10 Dec 2021 17:33:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 7/7] drm/i915/guc: Selftest for stealing of guc ids
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-8-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211211005612.8575-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0022.namprd21.prod.outlook.com
 (2603:10b6:302:1::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98369660-0803-4e17-65ed-08d9bc462e09
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5200:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5200DE70ECBBAF5214ED52A3BD729@SJ0PR11MB5200.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 196svoSkQC2ANedgmwKgakmVRaEMzCV1hGqMhZoVc+8mBKZR48q1X+a+pYQ9KwM6yQu/QoQcHcaRjmlIw2Yu2En3USkVCmTSPU3EbnOwJTGtaJfLVP6+3jBkX8dwkG2PtNCr8xEvXwfORUC+spA619xcSDyBW8kw2T7SQ1RhTvTVYx554y0FoPL2cozbjw4Gw/0Oj8sCrCdVKHFzHcfe8r3NyH8Y65DbEoXqeybVHAsdu1snsJXh/MNbbGWBHCBzJ8rarBDF8/2kh/Ksbj0pfZucsAxH6sTyChEKwxmcHmlvOLOXQ1WEKeIMzSIiQhk+9lTaPuFXp2OdwTz2fHL3gEqsX5mjFnIYPHjHGqQg+Vuz45uiJx5Inli2qI1Ac5NdtdbLxmhkGZf1vg3j3VY1gP1Q/1ilTMhideNodADa2i8VN7fNY7y0NDr+n43AmK5QqCHWt6VLwWGY59HnbuqxPjOvx5SBPYqKtA9aWPEGF7r+TF/KHztoU7Jz39JONccrKWeQd+ieiofx4dwO22TLFMUFkBxNRrABHeKZp84+PdBznO8bM6GNPQC42B9dU2QgehlsFZd6NbLlzMSGuVamVp1kcIDGJqF+rZBJFrgwzPsOuxif/xi0rvRiYhcBH8apyWRR0T5kNFFk4h0UfvWUQlXKzU48Uunj6S4LIxs/b6QEFmQBVT4e9QkieaVAftDC6YaJqtCNGQ8HebuAHYB289S0KDKlEI0P6vH/4/6TuonxEhZwyRxaWD74to8GxXef
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(31696002)(316002)(107886003)(8936002)(6486002)(2906002)(26005)(6506007)(31686004)(508600001)(38100700002)(450100002)(6666004)(82960400001)(30864003)(66556008)(4326008)(6512007)(83380400001)(2616005)(86362001)(66946007)(186003)(5660300002)(8676002)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlBSWFWdDhzNVlDOTd1d3JETDZDSkNOMm5QSlRjWTIrYUlNUHloWERPZDJn?=
 =?utf-8?B?dTRvODdjZ3lTYXhRUi9PNm1mVHhHTmxrWmpjL0Z2aE5oYTIyYThxQ0tsMjdl?=
 =?utf-8?B?d1kyQksyQ3ZxRDVEd1BIeW9Uckw3TS9SNzE0WGdFdHhTMnd5bWl1Nlh2VG1v?=
 =?utf-8?B?WG8wMWtuUUNZSXYxaFFQQXlEMDVMY3RzTVBqUitHeEJ1SXdnaTlQcWpFcW9j?=
 =?utf-8?B?QkRUT0pRRGhCcTVvN3VqVkJXS1E3M0F5N3RhZkg3Q0pJdnY2THFlRXhIQ2F4?=
 =?utf-8?B?UWROanY1eDdkTEdYMFdrM0dIcW1vUUlkZ2dKd3hjUnpHbkNFdDh1d28vRzV6?=
 =?utf-8?B?em1kU3V4bW1ObEJZWFBNdlZtandQeEtXS0pmS3Vsb0JhaW1UV0pQV3J6dnBC?=
 =?utf-8?B?Z3VGemJuM0hkSTNrNkp4MTlFWDRlRDVtTU9EQS9lbDg1T29QZVJQSjA5ZTNS?=
 =?utf-8?B?R2d4MktKR3pTN0VDb2g0R3VBbVZGRzZsQnBXWUVoOEUxM2VjWFhPZUczQWRH?=
 =?utf-8?B?OENMTUVDdVU1MVBqKzBrNW44V2ZmOVZzcEdtejgxZDFJYnZja1hvaVhZdnpL?=
 =?utf-8?B?RXF1NUs1N1dkSFJRblIxMGhIR25NbnJYYVVFNURwMGthSlBYTkJhclZzWjRj?=
 =?utf-8?B?WW5MZ2swV3pBUG9XRU9jZTROck9sWUlqcUdTSk9pSGk2QnZBd3llc2ZMNC9p?=
 =?utf-8?B?SlNWN0ZCYTJOWmpyZGNoK05SQnlQS2Z1Mjd6SnZIam1ndlBLMFkxOXNGblFH?=
 =?utf-8?B?SndhWks0ZFYyUTN4RHVhWnMwRXZwZXpWaGhvTzZpdy9QVVhScVNPT0lvZ1U2?=
 =?utf-8?B?dEw3S2ZMbmtTZExwdEZzMzFpc1NwWFNiYzdlYVBNdmxWSUU5UGRsNnMyUUpN?=
 =?utf-8?B?SkRPVVVPS21EZmltM05LMFdWTEdhS2Y5QW9FVGE2VzduSW5IV2M0cjJ0RnRO?=
 =?utf-8?B?RmUyeWQ1ekY5YWt2UVdQK0U5WWxyQ2R6UkF1OEFTcTBHa214dWZoeHNQNEtj?=
 =?utf-8?B?dXI2bGEyMzJ2NTExWHJjc0RveXI2SkI2T0RuZkpzZlZacXNVQXNhWjkyUGhG?=
 =?utf-8?B?ZEFiOVRNTVBlV3R0RWoxUU4xUnhQcEhTcUl5Z3kycG0rOVpCL0dnbUZpT1FY?=
 =?utf-8?B?ZU9rdXd2V1RIdEw5RURTb0lXVHRkdDBpd0lTMktHMjFHSDdGUGRWVFJoN2kr?=
 =?utf-8?B?SGw5TXJlYUJjNGFJdWhsaCtLMHlqMmh1REpHN3JRWGoyZHZFUnJiRU1rYWh2?=
 =?utf-8?B?RnZBUmtHVU5tMy9SYjlnUGgwVllJNXRYUURRbHVnZXhsL2s4Y29ZTEl0blYw?=
 =?utf-8?B?UENJT2cxOHlCLzZaSjBwR29qSzJSdTJhWE9uUUpaazZEcDNrWmJiUXcxbjE3?=
 =?utf-8?B?dkVtNCtDNTNKWVpkSHRFQXZwNlZyLzJnYldCQm5HS09ZdVROMmlzcWtpWXlQ?=
 =?utf-8?B?UDVKM0NXMWdMRHdpS3MrRVNWVS81WXZmckZWTU5BN0xTN25BUm84Y1lVWGVN?=
 =?utf-8?B?UGdNSmFqWnFQMHZGU0hBbXpYOVdaR0lkd2s3KzFsUUgyZ0VWWUhsNTBMZVI2?=
 =?utf-8?B?ZC9uMlhyaG55UkQzNkhSK0xvRHpsbE1XQWpCUkF0SmVPY3BGMG5hbmVubFg5?=
 =?utf-8?B?WU5QUTdBc0p0NHJJRHZqZlpZSDZQR1JRZFE5QlJoS3E2Z0tiVUY0OGV1NVpP?=
 =?utf-8?B?ZkZXQ091K0g0Y1lqWk1yT0JaSDFXdEV4NHJMckQvRVJyVjltbVZ2YS8wRlA5?=
 =?utf-8?B?bjNwMXBEOHFvNUdMVFFEbFJqS2FOMG9IZkhiL0hVeEtlUVlMSEhrdzAweVAy?=
 =?utf-8?B?anJVYTJRRmV0a0xXRERiMHp6Nnc3blVUb1FqeXVPUlFTV3FXTmMrbjV4dklW?=
 =?utf-8?B?Y0tCWkpLQXlRN29IOUZDaGJpWHRNK2tZMUFhSkpDQzNQUW13elVIQllWczlq?=
 =?utf-8?B?MDlwZUZNZTYyU2FlRHdZY0VOWWhKSmNOdjVWSjhQU2c4NGI2VWVEdnppRUdR?=
 =?utf-8?B?WnFTN3Z0SHdnekoxREtMbnlmbEY0bmk5UndPakVaa2NWazRWMzhia0VGWHFt?=
 =?utf-8?B?azhmREo0WDFnSDVYRWhLaGZwSGF0VFBqS0xBMTIrRVpRU3JJYytaUXQxS3V3?=
 =?utf-8?B?bmhQSnFaQVNCZTI2ZnhzV2tiTEh4VkVZcGowZWZrQU8ra1UvTW5kQ0JaVDRp?=
 =?utf-8?B?SXh6RzBUYXBMQnBEUmRBb2I0STlqRy9VQzFzMUptRGZ5OEsyUVNGZm1rUFQ3?=
 =?utf-8?Q?nXy1lAiin8Ud7UpvuX0d2Bs97nYxwjyXqmhZKfq58k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98369660-0803-4e17-65ed-08d9bc462e09
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 01:33:05.7767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/1mtSdr4f3D4n4E9TUAmNxXmdfhR1CcAKC4q6xDlgySC/Y+MdvgqQWZflOVk0zK33KMYHDU6AVBcH4MdNnTl6w/AhdGVjkphByMVnfZdkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
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

On 12/10/2021 16:56, Matthew Brost wrote:
> Testing the stealing of guc ids is hard from user spaec as we have 64k
spaec -> space

> guc_ids. Add a selftest, which artificially reduces the number of guc
> ids, and forces a steal. Details of test has comment in code so will not
has -> are

But would a copy&paste really be so hard? It is useful to be able to 
read what a patch does from the commit log and not have to delve inside 
every time.


> repeat here.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 +-
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 171 ++++++++++++++++++
>   3 files changed, 193 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 1cb46098030d..307380a2e2ff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -94,6 +94,11 @@ struct intel_guc {
>   		 * @guc_ids: used to allocate new guc_ids, single-lrc
>   		 */
>   		struct ida guc_ids;
> +		/**
> +		 * @num_guc_ids: Number of guc_ids, selftest feature to be able
> +		 * to reduce this number of test.
of test -> while testing

Should have a CONFIG_SELFTEST around it? And define a wrapper that is 
GUC_MAX_LRC_DESCRIPTORS or num_guc_ids as appropriate.


> +		 */
> +		int num_guc_ids;
>   		/**
>   		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
>   		 */
> @@ -202,6 +207,13 @@ struct intel_guc {
>   		 */
>   		struct delayed_work work;
>   	} timestamp;
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	/**
> +	 * @number_guc_id_stole: The number of guc_ids that have been stole
> +	 */
> +	int number_guc_id_stole;
stole -> stolen (in all three cases)

> +#endif
>   };
>   
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 96fcf869e3ff..57019b190bfb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -145,7 +145,7 @@ guc_create_parallel(struct intel_engine_cs **engines,
>    * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
>    * multi-lrc.
>    */
> -#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
> +#define NUMBER_MULTI_LRC_GUC_ID(guc)	(guc->submission_state.num_guc_ids / 16)
And keep the original definition for the non CONFIG_SELFTEST case?

>   
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
> @@ -1775,7 +1775,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   		  destroyed_worker_func);
>   
>   	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>   	if (!guc->submission_state.guc_ids_bitmap)
>   		return -ENOMEM;
>   
> @@ -1869,13 +1869,13 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   	if (intel_context_is_parent(ce))
>   		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> -					      NUMBER_MULTI_LRC_GUC_ID,
> +					      NUMBER_MULTI_LRC_GUC_ID(guc),
>   					      order_base_2(ce->parallel.number_children
>   							   + 1));
>   	else
>   		ret = ida_simple_get(&guc->submission_state.guc_ids,
> -				     NUMBER_MULTI_LRC_GUC_ID,
> -				     GUC_MAX_LRC_DESCRIPTORS,
> +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> +				     guc->submission_state.num_guc_ids,
>   				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
>   				     __GFP_NOWARN);
>   	if (unlikely(ret < 0))
> @@ -1941,6 +1941,10 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   		set_context_guc_id_invalid(cn);
>   
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +		guc->number_guc_id_stole++;
> +#endif
> +
>   		return 0;
>   	} else {
>   		return -EAGAIN;
> @@ -3779,6 +3783,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index fb0e4a7bd8ca..9ab355e64b3f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -3,8 +3,21 @@
>    * Copyright �� 2021 Intel Corporation
>    */
>   
> +#include "selftests/igt_spinner.h"
>   #include "selftests/intel_scheduler_helpers.h"
>   
> +static int request_add_spin(struct i915_request *rq, struct igt_spinner *spin)
> +{
> +	int err = 0;
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +	if (spin && !igt_wait_for_spinner(spin, rq))
> +		err = -ETIMEDOUT;
> +
> +	return err;
> +}
> +
>   static struct i915_request *nop_user_request(struct intel_context *ce,
>   					     struct i915_request *from)
>   {
> @@ -110,10 +123,168 @@ static int intel_guc_scrub_ctbs(void *arg)
>   	return ret;
>   }
>   
> +/*
> + * intel_guc_steal_guc_ids - Test to exhaust all guc_ids and then steal one
> + *
> + * This test creates a spinner to which is used as to block all subsequent
to which -> which
as to block -> to block

> + * submissions until it completes. Next, a loop creates a context and a NOP
> + * request each iteration until the guc_ids are exhausted (request creation
> + * returns -EAGAIN). The spinner is completed unblocking all requests created in
spinner is ended,

> + * the loop. At this point all guc_ids are exhausted but are available to steal.
> + * Try to create another request which should successfully steal a guc_id. Wait
> + * on last request to complete, idle GPU, verify guc_id was stole via counter,
stole -> stolen

> + * and exit test. Test also artificially reduces the number of guc_ids so the
> + * test runs in a timely manner.
> + */
> +static int intel_guc_steal_guc_ids(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	struct intel_guc *guc = &gt->uc.guc;
> +	int ret, sv, i = 0;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine;
> +	struct intel_context **ce;
> +	struct igt_spinner spin;
> +	struct i915_request *spin_rq = NULL, *rq, *last = NULL;
> +	int number_guc_id_stole = guc->number_guc_id_stole;
stole -> stolen

> +
> +	ce = kzalloc(sizeof(*ce) * GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL);
> +	if (!ce) {
> +		pr_err("Context array allocation failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +	engine = intel_selftest_find_any_engine(gt);
> +	sv = guc->submission_state.num_guc_ids;
> +	guc->submission_state.num_guc_ids = 4096;
> +
> +	/* Create spinner to block requests in below loop */
> +	ce[i++] = intel_context_create(engine);
> +	if (IS_ERR(ce[i - 1])) {
> +		ce[i - 1] = NULL;
> +		ret = PTR_ERR(ce[i - 1]);
Would be less peculiar looking to do the i++ after the if statement.

> +		pr_err("Failed to create context: %d\n", ret);
> +		goto err_wakeref;
> +	}
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		pr_err("Failed to create spinner: %d\n", ret);
> +		goto err_contexts;
> +	}
> +	spin_rq = igt_spinner_create_request(&spin, ce[i - 1], MI_ARB_CHECK);
> +	if (IS_ERR(spin_rq)) {
> +		ret = PTR_ERR(spin_rq);
> +		pr_err("Failed to create spinner request: %d\n", ret);
> +		goto err_contexts;
> +	}
> +	ret = request_add_spin(spin_rq, &spin);
> +	if (ret) {
> +		pr_err("Failed to add Spinner request: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Use all guc_ids */
> +	while (ret != -EAGAIN) {
> +		ce[i++] = intel_context_create(engine);
> +		if (IS_ERR(ce[i - 1])) {
> +			ce[i - 1] = NULL;
> +			ret = PTR_ERR(ce[i - 1]);
> +			pr_err("Failed to create context: %d\n", ret);
> +			goto err_spin_rq;
Won't this try to put the null context? Or rather will see the null 
context and immediately abort the clean up loop. Need to do the i++ 
after the if statement. Or after the nop_user_request call to get rid of 
all the ce[i - 1] things.

John.

> +		}
> +
> +		rq = nop_user_request(ce[i - 1], spin_rq);
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			rq = NULL;
> +			if (ret != -EAGAIN) {
> +				pr_err("Failed to create request, %d: %d\n", i,
> +				       ret);
> +				goto err_spin_rq;
> +			}
> +		} else {
> +			if (last)
> +				i915_request_put(last);
> +			last = rq;
> +		}
> +	}
> +
> +	/* Release blocked requests */
> +	igt_spinner_end(&spin);
> +	ret = intel_selftest_wait_for_rq(spin_rq);
> +	if (ret) {
> +		pr_err("Spin request failed to complete: %d\n", ret);
> +		i915_request_put(last);
> +		goto err_spin_rq;
> +	}
> +	i915_request_put(spin_rq);
> +	igt_spinner_fini(&spin);
> +	spin_rq = NULL;
> +
> +	/* Wait for last request */
> +	ret = i915_request_wait(last, 0, HZ * 30);
> +	i915_request_put(last);
> +	if (ret < 0) {
> +		pr_err("Last request failed to complete: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Try to steal guc_id */
> +	rq = nop_user_request(ce[i - 1], NULL);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		pr_err("Failed to steal guc_id, %d: %d\n", i, ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Wait for last request */
> +	ret = i915_request_wait(rq, 0, HZ);
> +	i915_request_put(rq);
> +	if (ret < 0) {
> +		pr_err("Last request failed to complete: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Wait for idle */
> +	ret = intel_gt_wait_for_idle(gt, HZ * 30);
> +	if (ret < 0) {
> +		pr_err("GT failed to idle: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Verify a guc_id got stole */
> +	if (guc->number_guc_id_stole == number_guc_id_stole) {
> +		pr_err("No guc_ids stolen");
> +		ret = -EINVAL;
> +	} else {
> +		ret = 0;
> +	}
> +
> +err_spin_rq:
> +	if (spin_rq) {
> +		igt_spinner_end(&spin);
> +		intel_selftest_wait_for_rq(spin_rq);
> +		i915_request_put(spin_rq);
> +		igt_spinner_fini(&spin);
> +		intel_gt_wait_for_idle(gt, HZ * 30);
> +	}
> +err_contexts:
> +	while (i && ce[--i])
> +		intel_context_put(ce[i]);
> +err_wakeref:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	kfree(ce);
> +	guc->submission_state.num_guc_ids = sv;
> +
> +	return ret;
> +}
> +
>   int intel_guc_live_selftests(struct drm_i915_private *i915)
>   {
>   	static const struct i915_subtest tests[] = {
>   		SUBTEST(intel_guc_scrub_ctbs),
> +		SUBTEST(intel_guc_steal_guc_ids),
>   	};
>   	struct intel_gt *gt = &i915->gt;
>   

