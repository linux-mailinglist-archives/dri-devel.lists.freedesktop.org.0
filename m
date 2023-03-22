Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A676C585E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48D10E272;
	Wed, 22 Mar 2023 21:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EC110E272;
 Wed, 22 Mar 2023 21:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679519006; x=1711055006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1XZUiTkvYWkw0zJKy02HjoeOpWUMtAIBBIjSwSfAcAw=;
 b=k589l9yIogRUyv1rcojzncjp6rwQxzjw9IdmCxR3/LATb4UI0RvsfzCO
 it1rKdy7UggTV+wT7SvNp0a9I/uTr/a9bnJGgshEeff/EBBXbwQ3ACHlI
 X6h1KlsxcX0oDx/MVQiTawEvd+I5ddfQ0RtGbgVoXTGXauyAgK3opVHU6
 WgFwwpoaeYrcVJJvOAng67NE9K3Qu6BGwMSu/Jkleh2gg6ZR680/ErIZt
 cE3KYURvAejXh7Y0ou+Obkkl0maCMRDpLfiJHmsFeV97qJYWUuETXj5L6
 CljZ3HQ6G5giHkQxzV41UE+SO0obo1IRIRhfUoP9M3gow0CK/Wpmc2aDW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340870298"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="340870298"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 14:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751219155"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="751219155"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 14:03:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 14:03:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 14:03:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 14:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAhUPYIK5S4nCRun9w9C1xT84M2yYY80i7hdJJA7KMmpHISW/Xsd84oEqsRdjeX+bAHv9RD8xUtd3ccX3KZYKJyVg4QC4FNS47ZrbqaGvsak1gYcnvSZpNz7Y781rAVVrmx1igxrtLc8DMXJqZ/EqnJbGTJFIWHJNY0I0Mchn9ja7u9iREoOkEVFY4pFyQJRQUfBKTrNq0DIG8RenXBXHklnKUkzTjbwmUKGclZYmWUB5lAzONJVz6Kl/ZkKZjIjfzQSXOx6Y0R/xAvhbucQjTp/DWWyd3ErxHLqw7peS2T9cqsRgHhAIXSQYy6TjPuMhpRZxcswN83SPR+FHbCUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsvoKxaG179aTsGEPOoIOcnUJ+Wp/ERzNLhIhjMFJ3E=;
 b=CjCAB6knMmZXrWPR4B2EHRwY8afqJIA69lFfwiCGw+n8L2YI+9O7mi8I+HYbL/A3Vj4VDgo5tdrJ1PKAP+xBJ4Eu9NwfeODREG4o0lLbxXrich1uHcxVuLIyTONEIvcUjUtW+lqhbDJ7lOXpS28DuG1W/ni2P4O1Ye4eA/E0prC5v/NN73P9RmDapbeGRe+lbrdicxqmr3rw1/3W0qpog6ikAL5+oRLhfUw7PgHK8ImIZvXDsypNMzfmWsnL46cI3ML42VusVSn9x/bJYYDWzwkRdbKFrfOUBi9LYgWiYTy4Z9zFPY5bqWRZhcUH9m3/y00XGqZJu9FLfrAeD4KFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 21:03:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:03:23 +0000
Message-ID: <0296ba17-6e91-76f2-4866-179feb94074b@intel.com>
Date: Wed, 22 Mar 2023 14:03:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/i915: limit double GT reset to pre-MTL
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
 <382f0058-2b4f-4ef2-8031-27a2f75715df@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <382f0058-2b4f-4ef2-8031-27a2f75715df@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA0PR11MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: caa4ca38-7400-444b-5a5b-08db2b18df7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pF1jJ3l5Iij8yhi0N8QQ144q9QquiztCdZbLL+beKXG4njGDeXsOgyGpaOI9xKKa5SMQUSB7WBB2+Fv6CkzZgvjXS/YyLCWgbMkh10EO0xZxGvrIQyY7Emqb2raDqHaNFbfGWJexRnL77jYZkRw6uK3sHY8HLGSpfuAXaDU7U7QRGX4AvSF6XJ0ya66Aihe3jipGlUe5+MxHTAe8pPZcLZ38Nzlzj9ngY86pBcxtAWfvze2iK2n5m90UEjg1LLjMpzSws/uFmGqP+q1HKIvqtl+BHNKRt8K12DVkk532j137Q0c0mF47dRn6rYrPC2NcpiddOpa1koPTOTq9wvSraoRpKEI9Yrgbkm07twQtNiGvJNmL5VfUQy2e0gi+DGsoGH/QqgTxgQgy9ISW9NH6lvhlAbN62jX5hM0xPEGOrgVL8xdGtDqDUrLTSZQo1TuB4aq5D1fWdfUAHB86+f+qM5JDLUVIvlMpQQ3yrKjm3hVi/F1m9gCLV0fmSILgdQJ+koZEfqY8jF9hXWoWMjXIqWIn63tGHKqnFc+6Mjb4pcp8coxy7M5p22PjehEDCLk6zdjRQKJRCJz0H6lC/KT6SxAZ0ZB9pCpwN5HJOI0pbSj7QPnOMTRryfvoiheURxdzgiTb3YFCTqsMHjLAbVO2hXvCeTSdbaKsI/f1aJmHDgbDrbd6OzTpy72wY1zL7X51kc0Qryrj0B57XK8D2vgiFPkRCnEEMPtTqeZjPD1Y0dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199018)(2616005)(6506007)(6486002)(26005)(186003)(4326008)(478600001)(83380400001)(316002)(54906003)(66946007)(66556008)(66476007)(8676002)(53546011)(31686004)(6512007)(8936002)(5660300002)(41300700001)(38100700002)(2906002)(36756003)(82960400001)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJ3RS9yUXVNYXltS0FXZ1ZKdTdCSENSWlZQZEc4K2w5aUM5Uk5UNTdCdnU4?=
 =?utf-8?B?NnV3L1BLM3prdWd3KzhtSEdBUTJ3U04rMWRsZGU1TGtGMmttMms1YzZRUDB5?=
 =?utf-8?B?dzFEcUtCdFFiaHZvcFlEb1lOVHhuS2hkUytPU1NMcFArd0oxWitoOUF3SnFy?=
 =?utf-8?B?SEV0NE5YQ1pUMDBxdUhSdTJteFNHWWp6NVZxenNWL1M1d0dILzNoMmFXeStx?=
 =?utf-8?B?Mm5yeTNRYW96UXNFWmZyQWJhNWU4VWM1TmxtVmwwdlo4RGUxaDRHNytWTDd1?=
 =?utf-8?B?VjBuOXhrbG83cFl5UHVsWElVczJ1OFlqUUpCdHE3UDhQbW4rUTJ2WENKRzBF?=
 =?utf-8?B?YUtXUVA5Y08vdG1WTXJYTnlXZFZoYmhXVitzKzRFRDZkaVE5SFIyU2NnNjli?=
 =?utf-8?B?a2dDN1R3bTljMFhBbXc5a0V4ZHNSWVFhL0k0RkxOWk0rZVZmNm4vZ29QOXhY?=
 =?utf-8?B?VGZqZ2VNWGc2S01lZERZeGlPdEtwajdxRGxtdm82eTJlUGVVNXZPK0ptZXRF?=
 =?utf-8?B?K21TTFgrNFJxY1NIelJ2K0s3SzI4WHVmbkxleVIzM2E0SUM3MnZwdjE0alRx?=
 =?utf-8?B?cjlQOTIwMWk3UFdrV3BIVnRMYWZ0TTZoa3FzZGJCSVI2blJSRFBPaVNHTHdH?=
 =?utf-8?B?dWxtb2luSnNuWXJJSTlHd1NwN2VyUEFNVVc3dnZYMzM5b1pVL0h3d3daZ3pB?=
 =?utf-8?B?MXRWT2xiaGR3Q2FZbkVxN0NuakJtdGg4L2syUjV1azVxYnMvM0dnZkpNMFZB?=
 =?utf-8?B?dUxJaEhlWXJkaUVXZ3JMbDk5THhORDZvTTRpRzJZaE5uQ2tDZjA4SHR0Qkcy?=
 =?utf-8?B?QXZ3OU1UeGlxeHlURkEyaEthdTNwbWhHdTBlMlBnbk83bHZneklvZUJZVlhq?=
 =?utf-8?B?Y0xxY1E3RTFqelE4U2pxbnpjNVBSUUZMV25WaGYzS1YwT3U1czhVc1c3M3JD?=
 =?utf-8?B?VjI2MjNBVWVJSEVNUllMbWpnTGU5WUdTcDF2MW8ybHR1blBoa2RlU1pJRFV0?=
 =?utf-8?B?U0U3blhRSmw0K1pVK2hzTGljN1hFelhXekJ0SXBqUCs0bGFWOXNoc1p4VFhF?=
 =?utf-8?B?UlRxRnZnTFB4ZEN0QnBCakhjajA5MXkvc0w5ZXhTa2R5TENyQ21kTXhYd1lU?=
 =?utf-8?B?bm9OMVZuQkxDb0dISmtGdmF5aXZsUEJuckZSbGp2YmtHRmRTNUtJTEJzY0ww?=
 =?utf-8?B?aDgrMjJuZnpjWCtRRGdJTC9qRkw3SDcwYmZVU0xHMHVKSlB3NUtYZ290UTlB?=
 =?utf-8?B?dll2MzZmdmRmSzZva09pcXdtdm9EMnlwZ21mOUpKaDFuQzM3M2F5c2kwbWdJ?=
 =?utf-8?B?TWFNeVJrWkh1aHFRVmhyTitENllIMjBNQmhibXBSQU15eTBLck0zOEpDTkpp?=
 =?utf-8?B?cnppeHJXVjlQOUNTZ29oRFBpUGEzZHMrKy93aVhGeENka1VaY1NteVZxc0lx?=
 =?utf-8?B?ZGZ0dEpyYXVENEVhcjB1WE9sNGtwUkRZS2ZrUEoyd0g0K0g2WlVEOXFmcUpG?=
 =?utf-8?B?Zk1jM3ZBNTBLdm1JM09TZ211VHBiQmVXZWNjejM0ZUJTcmthTDBac2MyM2lK?=
 =?utf-8?B?SGQxcCtKMnMrWnVnZ2dMNzk4enJoRkI5bmpxdCtESWx0ZUx2NnMvbklGVHlu?=
 =?utf-8?B?cTZrSUEreW1LencxS1I0dEt4c0prK2tpZGR2Q3M4UFdPaWdVdWdpYjh2WU9F?=
 =?utf-8?B?VEtnT3pxZjQ4LzVPUU9VbG9DQm5GUUoyejZkallvK2pqUDBGL0dCbDEyL3FM?=
 =?utf-8?B?R3dUU1ltV0JlOU45OVZBNm9vbm4rblUza1ZhbzcyNXNDT1BrWjZvWlZsZWhR?=
 =?utf-8?B?UFJjVm1PNDhlRDQ3UEZKTmg5U3NjQlVjdHRTTjh4N2FaWFBxckVIclJYYklH?=
 =?utf-8?B?WXRnVkFQV2RiTkxENGV4RG5NV1ZQWjl2M0Rlam9idmJqRFpEei84UHNlS3BQ?=
 =?utf-8?B?ZmJnUnJxSFdLbEJacUJiVHFVQldWN245KzErRkZlaFhoQTJNUkNyU0t2S2lw?=
 =?utf-8?B?VGZDZmZhT241aUEzVm4vbjhtTWVVWWU1NXBMRHhOSEVsb0JmN0hsRE1VeGJF?=
 =?utf-8?B?RE0vdHdLK3pMbVBJaFRmM05XRm01elJMUUxzcWZaRkJLQ2VOYWxEVFNHTDRG?=
 =?utf-8?B?ODNMY2lPeW5JU3dsQXFtbjZsM290dXFsTVhXVm53ZkhtN240UHF4WWY0ZWJt?=
 =?utf-8?Q?uplqstMHY/ad3CWPiVAb6uk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caa4ca38-7400-444b-5a5b-08db2b18df7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:03:23.3675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYQxmt2VIlr0kSxoW+hm0xY9+uIuxRyCiIZNwHaBOSNyTvPS04XvCIbMoVYB5ua7VaKYlcDxZpA+88G7YHFE7HfFnMQkj4QcE2UcxX0WKvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/22/2023 12:44 PM, John Harrison wrote:
> On 3/20/2023 14:10, Daniele Ceraolo Spurio wrote:
>> Commit 3db9d590557d ("drm/i915/gt: Reset twice") modified the code to
>> always hit the GDRST register twice when doing a reset, with the
>> reported aim to fix invalid post-reset engine state on some platforms
>> (Jasperlake being the only one actually mentioned).
> It still concerns me that there are no actual details about this issue 
> from a hardware perspective as to what/why it goes wrong, the comment 
> is fully of non-definitive language - 'appears to', 'should', 'is 
> still a concern that'. And there is no w/a number associated with it. 
> It all feels extremely suspect and warrants a great big FIXME tag as a 
> minimum.

I agree that the whole thing is unclear and we could add a FIXME, but 
IMO that is outside the scope of this patch as I'm not adding the code 
in question. This should be discussed with the original author/reviewers.

Daniele

>
> John.
>
>
>>
>> This is a problem on MTL, due to the fact that we have to apply a time
>> consuming WA (coming in the next patch) every time we hit the GDRST
>> register in a way that can include the GSC engine. Even post MTL, the
>> expectation is that we'll have some work to do before and after hitting
>> the GDRST if the GSC is involved.
>>
>> Since the issue requiring the double reset seems to be limited to older
>> platforms, instead of trying to handle the double-reset on MTL and
>> future platforms it is just easier to turn it off. The default on MTL is
>> also for GuC to own engine reset, with i915 only covering full-GT reset.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 35 +++++++++++++++------------
>>   1 file changed, 20 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index 0bb9094fdacd..2c3463f77e5c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -268,9 +268,27 @@ static int ilk_do_reset(struct intel_gt *gt, 
>> intel_engine_mask_t engine_mask,
>>   static int gen6_hw_domain_reset(struct intel_gt *gt, u32 
>> hw_domain_mask)
>>   {
>>       struct intel_uncore *uncore = gt->uncore;
>> -    int loops = 2;
>> +    int loops;
>>       int err;
>>   +    /*
>> +     * On some platforms, e.g. Jasperlake, we see that the engine 
>> register
>> +     * state is not cleared until shortly after GDRST reports 
>> completion,
>> +     * causing a failure as we try to immediately resume while the 
>> internal
>> +     * state is still in flux. If we immediately repeat the reset, the
>> +     * second reset appears to serialise with the first, and since 
>> it is a
>> +     * no-op, the registers should retain their reset value. 
>> However, there
>> +     * is still a concern that upon leaving the second reset, the 
>> internal
>> +     * engine state is still in flux and not ready for resuming.
>> +     *
>> +     * Starting on MTL, there are some prep steps that we need to do 
>> when
>> +     * resetting some engines that need to be applied every time we 
>> write to
>> +     * GEN6_GDRST. As those are time consuming (tens of ms), we 
>> don't want
>> +     * to perform that twice, so, since the Jasperlake issue hasn't 
>> been
>> +     * observed on MTL, we avoid repeating the reset on newer 
>> platforms.
>> +     */
>> +    loops = GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70) ? 2 : 1;
>> +
>>       /*
>>        * GEN6_GDRST is not in the gt power well, no need to check
>>        * for fifo space for the write or forcewake the chip for
>> @@ -279,20 +297,7 @@ static int gen6_hw_domain_reset(struct intel_gt 
>> *gt, u32 hw_domain_mask)
>>       do {
>>           intel_uncore_write_fw(uncore, GEN6_GDRST, hw_domain_mask);
>>   -        /*
>> -         * Wait for the device to ack the reset requests.
>> -         *
>> -         * On some platforms, e.g. Jasperlake, we see that the
>> -         * engine register state is not cleared until shortly after
>> -         * GDRST reports completion, causing a failure as we try
>> -         * to immediately resume while the internal state is still
>> -         * in flux. If we immediately repeat the reset, the second
>> -         * reset appears to serialise with the first, and since
>> -         * it is a no-op, the registers should retain their reset
>> -         * value. However, there is still a concern that upon
>> -         * leaving the second reset, the internal engine state
>> -         * is still in flux and not ready for resuming.
>> -         */
>> +        /* Wait for the device to ack the reset requests. */
>>           err = __intel_wait_for_register_fw(uncore, GEN6_GDRST,
>>                              hw_domain_mask, 0,
>>                              2000, 0,
>

