Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10C58368C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 03:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A822C93E0;
	Thu, 28 Jul 2022 01:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0202C93E0;
 Thu, 28 Jul 2022 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658973275; x=1690509275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I+TlQBXCa1Wpr8tpuG/+iAJobSxlZ4b27lRKnBgusuA=;
 b=SpDsgJhqLTP9gZVUZy4VGOSaIxomVprE6UM5yhmPV3WhaWKIXOJpodqb
 S3lAENA1VeTOSDmsTpT3tIql4na0GStoGi9S8SgmqAV0JZHRSe2hCeSDq
 R6yZNdnIi09GVjdv8I4tISz5U+gox12YPbpUNIqB5MCugly0lk/nHnKYN
 RQSk5B0LB2jA+2Nnr8BhF2hcCYPgiZgq+2ASSbNZXgyc6NyJpE8J0eKBd
 DusLoOZCtvybMUN3K/8VelAMnYvZNiywWCwlbB/2ogbDd+cz/qqs1LSEp
 Y5ZwBNIzaktI/mZm7WK2nyd/57xawDCIgDYVrBZmbd9tKIWagm55MgOZK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="352390520"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="352390520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 18:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="659466991"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2022 18:54:34 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 18:54:34 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 18:54:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 18:54:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 18:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acBSRiuoe4puUP59tqwNZLA37+MTaj2GRR+q1+PyH9XxIXzhqcHHQy3U2+3oYo/uYfoi2Gkj63AvbNWDLJpJ9rVnuRweB3kKRC/CUsoDog5fATP5ic/Yc9tOAyX641swxO2HNihWf0U39Moe0+d2u6mm/UeumjE0WoJiC4c7MfxxCCc7XWKebuLGjj6v071WrSmNuGCx5/hdo8kv/7Q+MYnc/CwWibiBh5KHsOhCWce7AwOBvo/QtK8B/XEKRjMatq27HADGS5VxJsCGn0L+NGSi88IPCZmM3O17xU8VoW5ILRLzdZ3a/5nStkFjB86tmJKajDBWz/Ou2e8g1Jm7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/EbavRbGIudYn3STXeI+SeTZT5b4TOFn2wTolD6hOY=;
 b=eGFFMmnOemmc2NUH8ohC+6pdPNbBmGFVEBEqwV1lzoZp1QZaFs807SimEzS0Db2PrDBIfj9tAAHgCAJVGKdmkSINaiqIDk8M6g9/SsAxCR95ME0ZY7rr200Twj6NzNkuZNbeGlV5hnviHRbYLHvwt4/4+chu6hPi3B9DRnXn9PjUZXigPnrJKH7l3U3rTgfSj2ysdzI48dC5Knm5EvCtCzkAuGS134pqYSjxqqbkEhI7SLYy/vw14ou0w5/xVuWnVdMZDNFmUbfKciswRhaboL9g0u0Oonv3t86R5Jf4qo3q13xRkO3H+s/A73ji1O5u6jnf1/dYbbWIoXsvVQom8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5584.namprd11.prod.outlook.com (2603:10b6:a03:3ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 01:54:29 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 01:54:29 +0000
Message-ID: <9d8c07c9-ac3c-7c46-42eb-0841c858033f@intel.com>
Date: Wed, 27 Jul 2022 18:54:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/guc: Don't send policy update for child contexts.
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220728003339.2361010-1-daniele.ceraolospurio@intel.com>
 <1e05b82e-b19e-644c-c1a6-614de643dc64@intel.com>
 <086bd24f-aa89-055a-ebd2-792b215eb67f@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <086bd24f-aa89-055a-ebd2-792b215eb67f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03309a0c-888c-40d1-382f-08da703c1b9a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5584:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1b0ehs9NPg9GBA3Xi5zYgDbohMOQe+gGJags7ytJSdF0fUkjsimnMg9NaVlWkNZ2TCAm7QQQEpASRC3Oqmy2DmrvD1jPSEDdeFAf0xzxU4qnKo9UmRoruAbwd9eniFk6MC82IakiC7rQYFFsl2gd6egLmzd0dDlfKk/AwiaFjqsXO+xP0QnW/BoHzponZbMKXoGWyr6sIA94wcXp366lc5UOy/AVjysuYvL/b4SAcpXgGeGMv/8Q1ruFU0UJTPkXSm2vuNXiNpYW5NGmBKjWVuyCDChqexDIeF+dBd+zipZluDRlK2zZOSfq4phloGZUW8U0VMsZAGs1vsQMzQwXFLp86mcqOhwkrCmYtGOXYYqHgF+b47qExqbacFWWUNOEDKX+t0iIOhZHuClVY1KStcptPFwCJ1MKoDy8J5dmcSca6xJzsfspniXFwd6IdvuDKvD76Mr8qRPf/2iqUO43pkNlfikQrAROkhNAq9Z1FoFNy3FlTfAZY5cVOTKik55ISP47+iOqXDeRUkpHf8CCNPWB0DZLkCrscKPzXeILEFHCHcVLirBha4Aju3cHPTBFikLJMPzr+XW9305QoNaNx/us6Gpo9TCcpV7SbLxneWFWqX+orzAy+PDV/gs5pwcJhGNY0XzH9IQWvwxPxfS4sPlsMq3/OTxXpYHyzeeV5JTo+Mv70ZUOtDpROc1RSnyUk+UPW0Q8bl7tmnWr7ejd5IDvHdsg6dWBrXg+vnNn6XEftMNnTQtBgawAzCmIel1SLu0tiXLCPg5qk4F60+BlFsekMaGqPiob8LW2P25Hw7DtDw+Gd1yVlzuHhbW67tF3dBrkNa79TcZTeyud4NFCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(396003)(346002)(376002)(316002)(6486002)(31696002)(8676002)(41300700001)(83380400001)(66946007)(478600001)(450100002)(53546011)(2616005)(66476007)(66556008)(5660300002)(2906002)(38100700002)(15650500001)(4326008)(82960400001)(36756003)(86362001)(8936002)(31686004)(6506007)(186003)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRjaHlsQjFpb2NKWHQ1RUVib3BzRWdJaUVoYlNGNjE4U0JHM3NpUHlBNGpB?=
 =?utf-8?B?WmlCNUY3TXRVV2dpWHkrY1JvelVhaC8zS0dLaXNHQk4yVi8wa2xTeWlsOEVm?=
 =?utf-8?B?UUlZYmVXMm5zQW1ncmF3VFhKdDJjOVFhNEEvbHlndXgxUjhMQk02UFJMWkl1?=
 =?utf-8?B?alBJcG95SXRLMUg5enFhMmptTVhiYk1XN1FXTEJVbjNSYUNUcFBUTXJVaG4r?=
 =?utf-8?B?ZUVDbFdaRUdoK3dGcTNOckxFYVI2NlRQNGJLSUJUalVRcmFHRkE0UE5RRjNY?=
 =?utf-8?B?bDliSmIyVmpsV2Zia3ZEdlc5ZWcwemxxQXhpb1dBdDBQaXAxTFhhbFN4MEQz?=
 =?utf-8?B?ajJwK1ZSd2NUMGFwSEZDMmlUVFlRNEVQcjdNcUg0b3ZiVG45WFVpZDlubmVW?=
 =?utf-8?B?bXVyUEhLVjV3eE9ZM2hhSm9jRXBncFpEQmN6RTN1dnBQOVVVMkZCNTBaUHVt?=
 =?utf-8?B?Q1Z6eXdRRWpndERGSXJJVzlidktOSkhKWjlIWTVqa0g5cVp2eEo4amREa00z?=
 =?utf-8?B?cU40OXZJUmJ0elZUbXVhY291MWxyckVrRUNKWDQ5dVNNejVIM1hCeUVTOFJU?=
 =?utf-8?B?QUNBaGliTUNld28rQkhBYUhLK2lhNndiV3hmdFlDOSszNkpBNjQ0NmRwSmNa?=
 =?utf-8?B?Yy9xZE5xbm9nV1RFYWR2WGx5c2lpcnFCdEZSS3FKT0Q1d0s4TzNyQXhabnZx?=
 =?utf-8?B?WDJxWUhQeVJIaUhDMjlrTk1ZQ0hNWEI1YkZJZHVTLzhyYUZYZnUrcXFCbnNq?=
 =?utf-8?B?N2RnYVN0c0Vwakpsb1JTZ1hsT2ovTEEydWVIUmp2akVnVGE1VUhhcEJvajRH?=
 =?utf-8?B?Z3FuZjB5S25aeG1YQ0tpRjE2L01OMTdrd2duVFMxSGVOZlVDd3RYTnJ0N2ZJ?=
 =?utf-8?B?S1F0Tlg4ZElOMG9YclgxdmpJeHVWSlpZM3YvT2NwQ1hUbk9FcmZUSW84d09J?=
 =?utf-8?B?NnA3cVVGV3I4Uy9rMEhtRkRLcXF1Z0ZldWo5akJWR08rM1Bxa3I5dkpmcWpm?=
 =?utf-8?B?LzdlQ2QzYm80WlFGY3EvaUVIcGdJS3h3ZW43OXlEaGxwdzdtTThtenZMa1hG?=
 =?utf-8?B?OUl3cmRmekZUbEU4eTFBanFsUUdZemNtUU9iNW9JMm5OK2tDbGtXVEFIMjVh?=
 =?utf-8?B?SGxGbkVlcUJ1N3RqWU9mL28zazZURTdvcytpRE51aWp2QWtXUC96VUs5cWdv?=
 =?utf-8?B?WE1DMDdaMG1sTUp1MlRxemxZbWdZZzcxL25KdXZHVHFsdFZGK1ppRzZQVFJM?=
 =?utf-8?B?NC9TeElZV256VENMbWxDcmJBVHhlV3p4c3podEpwd2RrZ2I2Skl4MU9aeTFJ?=
 =?utf-8?B?ZzN2cDZubXltbk95SGxhY3haeUh5ankySk5VaFI2UEpvTTZqaXRjcGNYUTRV?=
 =?utf-8?B?WXlvaDg3OW1zakRHUjR1WWd0MTdCcWQ1VEZDZkdVUnZlbTVUaW1aQVVzNDQ4?=
 =?utf-8?B?TUJTT2h2cXNjbFVzc0RCMVNHR2xYOTg1Y2MvVUZNYURrVjhoQnJaMjNnUExu?=
 =?utf-8?B?OWRKLzBCVnYvRnBQMVFwOFV2TlFXWlFiR1NCeTBIMFJFdVUwSTdwZFVDQ0xP?=
 =?utf-8?B?ZWVjYkRDUHI1TDE2YWxoQlRPZi9uNi9kUHBMeFFjMmcxSEthQitVVUMzQWlt?=
 =?utf-8?B?b3lnOVN6cDZydGsvUjlHTWFlSlFEMXdncWlOVTNtNWNDVFRmcXhsM1hpOTE5?=
 =?utf-8?B?ZGZBc1FHcGp5UnMvdVBLVnlubGwvR1JDMDJ6b3hHcFAvMkhxZVR4cXdqTE93?=
 =?utf-8?B?aEJnNm5IRDl6bDFQMSthY3RsZ0hvamFQNzhwZEFxZnZvUW5QbWp2TStsK1hB?=
 =?utf-8?B?TGh0aWZrT01IL1RCY3dON0dNTGk1N25WR3YxYnFFblZrczFTOSsyZy9uTW9m?=
 =?utf-8?B?ckxnZVh5b3Y4Vm1SWU51c1c5TjU3MHkyRGE1SVJMVUw5UklacjJBRGRTcG01?=
 =?utf-8?B?Zkg2UndVazE0MzNqMHRSbzY5K1QvcTdSNU8zazlIVE9yZmxlQzlYRDRlNVRr?=
 =?utf-8?B?Y3R3elptMkkxMnBCSEkyb1l2N2ZYcnZKbVcrdDFheFdENDJIMzNFRWxKUnpQ?=
 =?utf-8?B?U3ExWmdoNFByUFJBR0FKSGpwYW5ib3pXdWNnUmtxMEpLYVJidXY5VFU3eGoz?=
 =?utf-8?B?Z1dadnlzR1Rta3h0ZDNBYWxNSUxEdmN6Y3BOdU12RE9IbGxTNDVmYnJEbDIx?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03309a0c-888c-40d1-382f-08da703c1b9a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 01:54:29.5099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/gPTQrhgUwsb3WIAdX9qMXagUVAWaOeW2t4oSlv2Cv4fK/pOQyEKWljRQ3Zrlkl78CYngEau1Xb06dciqsxamQLmI2zfqauLhgMuozNSyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5584
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2022 18:50, Ceraolo Spurio, Daniele wrote:
> On 7/27/2022 6:44 PM, John Harrison wrote:
>> On 7/27/2022 17:33, Daniele Ceraolo Spurio wrote:
>>> The GuC FW applies the parent context policy to all the children,
>>> so individual updates to the children are not supported and we
>>> should not send them.
>>>
>>> Note that sending the message did not have any functional consequences,
>>> because the GuC just drops it and logs an error; since we were trying
>>> to set the child policy to match the parent anyway the message being
>>> dropped was not a problem.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>> Needs a Fixes tag for the original v70 update patch?
>
> I don't think so. I added the explanation about it not being a 
> functional issue to make it clear that everything still works as 
> expected without this patch, just with a bit of extra noise in the GuC 
> logs. If you think it is still worth applying to older kernels I'll 
> add the tag in.
>
> Daniele
Hmm. It is strictly speaking a bug fix. But yes, the only impact is 
extra H2G traffic on context registration and in the GuC log. So maybe 
not worth worrying about.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
>>
>> John.
>>
>>> ---
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 
>>> +------------------
>>>   1 file changed, 1 insertion(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 76916aed897a..5e31e2540297 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2420,7 +2420,6 @@ static int guc_context_policy_init_v70(struct 
>>> intel_context *ce, bool loop)
>>>       struct context_policy policy;
>>>       u32 execution_quantum;
>>>       u32 preemption_timeout;
>>> -    bool missing = false;
>>>       unsigned long flags;
>>>       int ret;
>>>   @@ -2438,32 +2437,9 @@ static int 
>>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>> __guc_context_policy_add_preempt_to_idle(&policy, 1);
>>>         ret = __guc_context_set_context_policies(guc, &policy, loop);
>>> -    missing = ret != 0;
>>> -
>>> -    if (!missing && intel_context_is_parent(ce)) {
>>> -        struct intel_context *child;
>>> -
>>> -        for_each_child(ce, child) {
>>> -            __guc_context_policy_start_klv(&policy, child->guc_id.id);
>>> -
>>> -            if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>>> - __guc_context_policy_add_preempt_to_idle(&policy, 1);
>>> -
>>> -            child->guc_state.prio = ce->guc_state.prio;
>>> -            __guc_context_policy_add_priority(&policy, 
>>> ce->guc_state.prio);
>>> - __guc_context_policy_add_execution_quantum(&policy, 
>>> execution_quantum);
>>> - __guc_context_policy_add_preemption_timeout(&policy, 
>>> preemption_timeout);
>>> -
>>> -            ret = __guc_context_set_context_policies(guc, &policy, 
>>> loop);
>>> -            if (ret) {
>>> -                missing = true;
>>> -                break;
>>> -            }
>>> -        }
>>> -    }
>>>         spin_lock_irqsave(&ce->guc_state.lock, flags);
>>> -    if (missing)
>>> +    if (ret != 0)
>>>           set_context_policy_required(ce);
>>>       else
>>>           clr_context_policy_required(ce);
>>
>

