Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2C493261
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 02:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AB810E125;
	Wed, 19 Jan 2022 01:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E49010E125;
 Wed, 19 Jan 2022 01:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642556344; x=1674092344;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NOklDj2UXHmYEaZ03b2+Sw8cffd72N4obH5zzAjY4LU=;
 b=aWnIp46IQb4k8lwkBO8Sh5iBzZ3gj5mxX+5NPVk2qg4G9MNTqCY0rtkI
 Bzvnh8oC7c9lm0JNk1w3XiNrKUI9gutDCvQ92FqHzGQQC5MEXTv30HU/H
 icHDO0cP1Rw5jPWRGTEpJ88vPCRmp32ozR3CjAF3/r2Fdbt8ryFhbdOOJ
 ObPA17gMuki8Z8eMBJsw0aI+JNpG7ZMFo5tt5CW+wYHM9x10ivu3sBCwD
 HsqnkBUNpyzPk7Gqaj7eg5jsjnr/TcHMWbEK/8rfeFrIisCnderDpuPBS
 6VuXowf8Wh0hoNlP7QeJILis8lTMnlFE1FTiYon8QxBjeUIMnJCRbJM9Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245153535"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="245153535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 17:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="625707802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 18 Jan 2022 17:39:03 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 17:39:02 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 17:39:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 17:39:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 17:39:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9/geBjKNTOWWu5XO4AYaH6zYxv/4p6nFhyotXlMSQqiWnz6m6UdpcnpXrRTkqGa/XT9MOTe165leCKY77QFwIC92BeueOz0ngZb4Oi0sBXHvDrkpIrRHgS6/e408PazMACyhz1rDa5jZs9HgGQqNkwgNori+30wvCDV2Ebqkr3JcH3nI6minz/tCT6gV2WstRODFFfs8R85Cfmv3Dew95f3p+T5aiXthzgm1/Ic8pY9I8QQ7ErK5DnQGgjHzZnBS6hQ3fCXIoDoa7/JgC3IQ5Knt40kkqKo1TnsHPFngV/TopUJvuYYGUuwfOffzC0xuL0l9tKWw/fmPaJGaClWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDq/GUgO2mlsOTVLLQc3FRRswdyz408nF/JwfAsrvqA=;
 b=IUsiWzqGFXc+AnDaxvdSzYdAMzRw28owcNDN3StR9VhFiX35OYKcUHZTFmCvyQVf42CYys9Lb7KQP1NN74ie3rNz9W3ziSzoCd6cZDD6RLs/UeyyasKQc8vM3E5c9X+Au6qzLACToBgoixrMk44Krql3dFowSlyaVAqb4Ah55JDRghVDCN5L0OnPndL28CT0urze17ZAvRFRg9OHrMKkYd1kXtRgC3bZzyzBH4sAmcI7JSdyXXWTfE+0w+ZAOFJSm1QGJrR/CR5T0Jo7l0PFlW22Zd/gzfV+1YzUVJZT1TznzsfgTnbRRf4jlGfQcwQcBIxc41sjPNtSi2v3YmcAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 01:38:55 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 01:38:55 +0000
Message-ID: <720f3b08-a9b0-3512-99a9-5c5b6f3b5743@intel.com>
Date: Tue, 18 Jan 2022 17:38:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] drm/i915/guc: Flush G2H handler during a GT reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220118214357.33740-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:303:2a::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8746dc-11a8-43a4-8c6a-08d9daec7467
X-MS-TrafficTypeDiagnostic: CO1PR11MB5153:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO1PR11MB51538AFA8C17ED63358E2F67BD599@CO1PR11MB5153.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QN9wagr1KD48RTl8MAWJu/ImxjE/Zvbo7Leej6HYulPt/aT/gsoAScISmVIEdmmo33byfRN5Hhv07FPpB1I5T0aAKUyykiuh5yCjtlywOqics8F2fNcCR6VGMqr0pkCNjYYzAu6t8WIYQsciq4JN9C5YEhRujbUWg3Q37cL1hQjZQGdlU8U/HZ+lynMEk3ntkhOMjAmmbCIrh8KJapUwR3vr9XZrorf8nunxQSxJefoAm2544SITmyJRWDgwWy5Q6KzS9Y2YaDIgQ1laf3HNrgJwks5kfgSLtka/0a5cwS3N5W6mosmwU9PkZN5oQRW95PfxHS0M7fu8BTpVVim26VMuxOiLxAnyKTGfM0NDmGASxDnxo9RARFBUxfaDFuN7EciweHaqhv5pF5hqvagguWBc3+zCNTPSHY8cn+w/oMaqx4Zp75oPM8J33DdijJENcZ1IhfZwAj6/+sOFMknRvSjQRqFQRi7W/7fdwIq6c1UM5u5TfGr7N2vL5AIYsfNK7Iw2aiCkfyGpk6nLvxlUbeboX7ZhOCaQOIGODj+f5PdhBOSVgKhv7M7Kbgd9WRGZ2ixrlUolM5D1AV2iFOgDyzd8O1quEoZ9BxyleOBgJgYatZ5TMLAMuL7YapiXUzq3nPjCjzpgK250OZudU5DEXfC2PllBnoRHZo9SPy6LjnTxtUirNSC/eXl5Ag476Z8BvIugz6Rzh8/WZkWTWECEW4hkxGeCuasVjH44OazgIa6a66qM7lj4PZMqEP0ocTZY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(86362001)(26005)(6486002)(83380400001)(6506007)(53546011)(186003)(66946007)(66556008)(66476007)(5660300002)(31696002)(6666004)(316002)(31686004)(38100700002)(82960400001)(8676002)(8936002)(4326008)(2906002)(2616005)(6512007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak04OFBOS1dnRUJWSGVlYi9hNXk3MWs5cVJFeDJvemY4V01ieUhiZ1UxTjJ4?=
 =?utf-8?B?VXBVM29ndkZwM3d3aFhma3ZpUGl5ZmJHMWs2SDJpM2VSQ3FNc2xrVTNRTHpU?=
 =?utf-8?B?cmt5QXcyUlBLbFJXaXVWdEVyQkV1cmU0eHYxL2ZDeHVYQlYxNzRuN3luVER4?=
 =?utf-8?B?aER0N1dyQW9qSzBVVmN5UkZwb2kxUzJDS0lvUWFGU056NWNWRlpIUzZZNmdJ?=
 =?utf-8?B?MlhBTU00cEhVeENEaDE0SGxCWHZIUkNKb2czNXpTQTdhVFFMVGlwN21acmhY?=
 =?utf-8?B?UnkyTmw0OCsxbW83azlvODBRRlZSekg4RWM0YkV2UFJqc3RRWlVLaWNTaGNJ?=
 =?utf-8?B?UTdGY0ZhcjhOOXVsWGZVZUFyenV0OWhXbTVMcEVuZHE3WHJVTmgrZVpFVmta?=
 =?utf-8?B?UVN1bHEvNEtjbFRNdkt1MllsZ2tRdjhEUVlOTDh3YkFIcTYrSUZkNytKUW91?=
 =?utf-8?B?bUtlNTNhMzRUUkRxdkZKVlR3OTNsMS95L0gwdUo2ZnBDdVRBZnJHOUJVREdY?=
 =?utf-8?B?cy9FMENoNUp1R3FHT1RYYnNBajZPV0Fldmp1VWVEeC9neEtuYXQvbzVtRDZH?=
 =?utf-8?B?OURXZWE3RnpySndZWUQ5cmRldlhZZER5OGxzTzRnSDkvM2V1NUpWTnZ0ZWNq?=
 =?utf-8?B?VWlCZWtTZk82YU1wT0VFSGlTeWtaOXR1RlBWNTdnTzZ4cDcyUXlEU0xnbWF4?=
 =?utf-8?B?QzlESlY5SVdROHdXQklzTW5Vbm1abnZjUDRDN3lyaDVvNnhBM0wyRFdHREo5?=
 =?utf-8?B?TlBNWmduZ3p4cmVHNEwyaFIrR3ZYRGRNTU9FZjJrbHdaOUJXejBMcU1pSG1I?=
 =?utf-8?B?UnhodjkzM1lhcDJiVFIyd2hMSHlvTlZ0QjRVaEVnU1FTQnpHd2VaQzE4dG5n?=
 =?utf-8?B?eXFWd1NnWFBTS0tRVndISDNrU2Fzb21Zc0FaQXFqQk9pQitCOU9MclNMSHdJ?=
 =?utf-8?B?WW1TS1FVckV3cEZrS0RodEoyQWJmM3lGMlI0TTgrMW1NdlQxNHc4Y1FtQ1NH?=
 =?utf-8?B?WVcvTTdlYWVuZWhxbjcwRHREemlYd3ZScjROOFYzdFl3VVdwaHk3ZldIT0Fs?=
 =?utf-8?B?OWJsWmNVdFM0TEhvcDRGMWNJdnE3SnRGZXhCYUNqZXRaRFQybnZJWlVSTVdK?=
 =?utf-8?B?ekxSQnZGRVdnRDY4Yy83MmtQQXY1YkltSzhhOVRkNitsR0RqanFndmY0UFR5?=
 =?utf-8?B?Vm5IZXFaZXlTVGFtdXZzRksyWFhXaWFTaEVsSXE2a3JCeStpRExRMERKYTEy?=
 =?utf-8?B?NkdlK2krRjFibHMvOGE4WEZUeklRZURvcVRzUHNidXpLVUQwcC9XWDJXUzAv?=
 =?utf-8?B?QTBZTUdkR2VqNlFZQ3lWUXd5SlA0RFBHaUNnR0FQbjd1SEVQMEI0WW1MNkh2?=
 =?utf-8?B?R2VGN2NoeHFFSURVVlpibS94T0ZBYXN2TExOOFRnWit1d3cwNllBTFg0Q2Ri?=
 =?utf-8?B?Um5WWHRYZ2FLVmIxZUZoZFdaTWtmTnpRZTNiY2hUaDl1VkNSQUpOVGlPSWNM?=
 =?utf-8?B?NDdkcVhvSnZIdmUwVnNiTzJqOVBuUHlCWGx1Y3hpajBQd2ZldTZjT1hFa0xy?=
 =?utf-8?B?TXBoMzJLaTNSRVo1dStESHZ2K2o2OERFTGdPeFd2QUUza1dYUnBPYnNocVZz?=
 =?utf-8?B?bDFjODJiaExWNC9IUkVDbHJVY3NnS0F5eGd6STlINm9iNUxvclp0YnRVcWdF?=
 =?utf-8?B?UktVRmtJL01ZdVdBMVFyTnB4YnNnb3MzRUR6U0RiWlJnODk5MUJSMzFIWCsy?=
 =?utf-8?B?VHFPVGF3ZG94NTczK2cyK0ZySjlLUk1CSDM2cnV4QlZRMFR2cDRMRFE3YVdw?=
 =?utf-8?B?a1VKYnU1dTlvOU9qTUJyODRpZkFVTkN6UndlcW1aUnc5MnZrSG1YdFFkU2ps?=
 =?utf-8?B?Vk1VMU5ySVlsT2VnNUU3bmo2bVlOOGI3TGlNbEtmUm1JRGJhTVN5N1RNVk84?=
 =?utf-8?B?cGtLcVFGYWhQS09GWjB3UlRVU3ltZU13SnNtOGhlRVlMeEV6TjliekUyVW42?=
 =?utf-8?B?SkNDOVlvRHpJTGh4OUNWaWwwM2tBR0hwRGQ5SERkLzFxdTBsRk5pK011dXFn?=
 =?utf-8?B?QW00Y1p2dU1VSmxUMjNtT3d0SkVjUHU4cXRvUTI3MGdVd3QxdnJSV25UeHZ3?=
 =?utf-8?B?SEZpVy9wR0xMM2J5Y1dNT3NVQjdhMzMrbld0UjVYcTF4dFdXOGVpRTdVNG4v?=
 =?utf-8?B?TzdXZlFUVC9KK1YrWEJ5bGNNSzR2NWpUbjA5RWtqcWZsaXdmZ2prYjNOQTVX?=
 =?utf-8?Q?91uVUK1Frxevg0u2zIpwTG1o3PlqhvOiIeu+Cf+umg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8746dc-11a8-43a4-8c6a-08d9daec7467
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 01:38:55.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xE/MOXU2sV5jg/jMrYc7PFAiAXRMfGDvbqjBHPNioa3CCMF4qBUFwHi1qMKDHiXtG7zpMMYkxv0S3Pw3x8jlLW7ISeIqtlpakcsuB8qEpz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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
Cc: thomas.hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/2022 13:43, Matthew Brost wrote:
> Now that the error capture is fully decoupled from fence signalling
> (request retirement to free memory, which is turn depends on resets) we
s/is/in/

With that fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

John.

> can safely flush the G2H handler during a GT reset. This is eliminates
> corner cases where GuC generated G2H (e.g. engine resets) race with a GT
> reset.
>
> Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index cdd8d691251ff..1a11e8986948b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1396,8 +1396,6 @@ static void guc_flush_destroyed_contexts(struct intel_guc *guc);
>   
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   {
> -	int i;
> -
>   	if (unlikely(!guc_submission_initialized(guc))) {
>   		/* Reset called during driver load? GuC not yet initialised! */
>   		return;
> @@ -1414,21 +1412,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   
>   	guc_flush_submissions(guc);
>   	guc_flush_destroyed_contexts(guc);
> -
> -	/*
> -	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> -	 * each pass as interrupt have been disabled. We always scrub for
> -	 * outstanding G2H as it is possible for outstanding_submission_g2h to
> -	 * be incremented after the context state update.
> -	 */
> -	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
> -		intel_guc_to_host_event_handler(guc);
> -#define wait_for_reset(guc, wait_var) \
> -		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
> -		do {
> -			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> -		} while (!list_empty(&guc->ct.requests.incoming));
> -	}
> +	flush_work(&guc->ct.requests.worker);
>   
>   	scrub_guc_desc_for_outstanding_g2h(guc);
>   }

