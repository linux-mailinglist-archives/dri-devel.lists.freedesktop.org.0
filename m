Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C598A806DE4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2E810E6E3;
	Wed,  6 Dec 2023 11:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D26A10E6DE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701862102; x=1733398102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=duBo3mjh/tI6nJ3tDYvioMDsfYOyukKaAJE/LMnPRh8=;
 b=L8vEyVoTu9Wg6gOHVRmJsD19RaaCUdncXfLpIJUDXUVKsbu52TOYRv+8
 PNYdfNDh0L+VjTDI3xAh2OQ+cWKQA09HZM2ds8ZZSTF4+PL4GG9yWKj4w
 ko7IbWE+kCQqOoA3dZoby6VaviJLiXGI+Jxp73tZ78VyKDFhiRsvdEWOS
 hUbYquLudPhjsAH9kMIVJLJrZG0T57ZMJbEm1Dv+GnMXmaOFE+lhyBgbm
 aDV2SQSWavWbDWWJSN3uPqCT1EBp3ICpZEb1CZmpn0aOFQY2Q0OMnAltp
 5BScbiUfUeNswY3oWV5QDylk4YjWU4fXXjYrpoSOzKG2etqOaYDhiDy6G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="932575"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="932575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805616551"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="805616551"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 03:28:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 03:28:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 03:28:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 03:28:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZ55iC2ITZIyD4ddY7RouuYjLM0bj87bZLMj2zrgWENUTi+8Kumo7D5knd63ASd+LNCHhzPThN2ReM09OUGr6WwNySIY0osNlnUb8Ul4+AfXlY4Sv0N+IzVu2yeke91flQjCLD6Vva6VeGFDEIdy+w9/O5atK63/MTXCReuzEe/gWt23SQ7AB5emYISsuWOwuVpRK9VS1T5ju7MGsU0gEFZgGAsqZRbUQRi75ZZWjOWpEgXO+PrgDhA4a0WCVDogsn7m2wE2m1odUCupiYjTA/wUYOl77B7k1kENPVNsetxL5s3E6hPCb6TVKJTkhQGFLoS7YfIbTLEITGmkgj0pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/1H9D2ky2kvtwTp9AHJaMVTOo7YgxJitdHpgScQJes=;
 b=lTTW8yYSc1b+Rzy2s0NBBAVEEkDoY7h+4jOAGfRxEZxdNEd0PcHTt1yZIUnCSvUHMFSYl/hxWTZQ2U3z/zUAay5itr0aQY4+Dnv01+qLnu1/ESaF+ieWAsK39V/AKSrC1ViSZI8akKE+b1po+vLJLrdESobaYbhl345URjT8Qie+o7LYWEasvYyV+VyGaeuW+VcOibUf0BYvEa8MV8ARex15d7m8V+iymaeWLaGUgJmmlLXGVUvD4N/kE66xgOmJ2+A6CHUImyewQXPJaSB9dwLTkKJDZPZ10b1rkS/hd7BdjAetrbjQWH0wvP3ILSdxoRLPMJWISVre4Ylapa3dWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 11:28:18 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692%6]) with mapi id 15.20.7046.036; Wed, 6 Dec 2023
 11:28:18 +0000
Message-ID: <817fdcb9-e4f6-4f8d-8311-27b0b5fd444e@intel.com>
Date: Wed, 6 Dec 2023 12:28:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] Improve test coverage of TTM
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
 <ZW9ENFoRHlec4HNE@ashyti-mobl2.lan>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZW9ENFoRHlec4HNE@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b5fea3-5af3-413d-1e78-08dbf64e716e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGHneEjwphQzElEIRNhvJT6WSk8t1FN+llPAr8cDQpBPlLmnBLuNo9f/aFimOA1twBo05RDUfWAPk6g8iCB9ZSvwn4eV7sCcLU/fAPl44SUTZjRHHVe0GLiddhZtaY2hlZ0KxU4s5/TNRFNU20HKdkzaoiGjG+UFzxT6cZY7jKYntNADAhWwZ+53X9XVSZ1VsHU8bzQ6Y7aK7KurXRsX/7FRv4Dcu6lC+ssn+DUtJZB7fHa9yi4KkmsXmOltdyuF2RaMfPzz90RccXtPsfFOyAOgcuqMve794iD/iyd1cFI9DcAwKl2CzoOobrvG/l5rh+AA4Emz67ebddHqRk1ZaiAZzEsKwfa7R4A++7zwWe+ld9g/SRWNlSkgoEEfKum//VAInq9xew/FrVvqbyGFJd8zdyaekhTs+Mm3HIpuU0SI1VDwCv8QB3gNvzWsAz0qOAIR7YZ4YSiK89zQieJia+YdoHwgNpEPRpXp+jyugX1OCQMqK5KX471NXcR/WkUbxiDhIuFta3ffoUuNnMCU4mHDbxMHS9Fu7QrmbqYSIntOr9GIdcF+2/WR4SgOnwXB1TWcSck/WsoPmEvaC/sFWbU59js9DdxaKDiHlgDeKTnIn0ZE3VyBVOsWgAkzHkJivF7Ya8YMTkC3zCvzah8QVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(53546011)(41300700001)(2616005)(6512007)(36756003)(86362001)(44832011)(26005)(31696002)(6486002)(316002)(6916009)(66946007)(66556008)(6666004)(8676002)(66476007)(4326008)(36916002)(8936002)(6506007)(478600001)(38100700002)(31686004)(82960400001)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekF4RnV4eHlkdWFRNm4wVy9TYnpKZXh4ZXhDaEZoWVZ0UWN5MVhIbmIzZ1hq?=
 =?utf-8?B?TWFGa0ZqY24yazZWQlNBdU45aTNIS1JCV0ZjTWxOZ2VwaXMydEVCMklLS01i?=
 =?utf-8?B?V3dlaWcraGJqS2JFZkJubGdIQWRlUGhPRlVYYnBzOU5QNUdVM0ZCdjAwNjQ3?=
 =?utf-8?B?d3FZUk83UFY2UTVqTmNhYkdvK3JYOVJCanRBb2krZUVxdUhoTHhSY0ZFUStk?=
 =?utf-8?B?V2NVakJ6R3FnYmdhaG90dlFRbnI4UTVoaFNHT2cvK1o3TUhobnUvL2Y3Y0hk?=
 =?utf-8?B?amduMUtFdHVxc0kzWjNvOXNZWnNOemhkbG1NQUxzVUI0OXA2VmZvVnE0Vlkv?=
 =?utf-8?B?RVBVT1d5dWJob20zTGxtUTd3VHNLODZSWE1VeDl5TlY2Y242OUhpeGg0ZDYy?=
 =?utf-8?B?OVBiQWorbGhCT3RKWE5yQmhDVjVLTGY1M1FGdG5nMVBEZm41TTloVHhxMExD?=
 =?utf-8?B?NGJCcm15NlFDSUV0aWlTY2hESTd2OWFiUCs0U1gwa0oyTVFtUGFuTjQvYk1l?=
 =?utf-8?B?azdkWkZaTDJLai9UbGlVMXN5Sng5SjhyWlNRNlNRWXErS1oyV1BJL2g0bzla?=
 =?utf-8?B?QUhiYWdzeTVLeVNMTjJOQmViTVN2K0Z0ZGJkaXZMMzg0LzdLY0R2SjZBc00y?=
 =?utf-8?B?aEtENnZBNkJrRWV5VHNUTG5MWWZQeVM5cDk2U2k4bWZTMGZ6V2VrN0t3Tmlp?=
 =?utf-8?B?S3VwQ0MwczEzN05vUFFibjNDanRJaWRHYUtud3NyZkpaQUJUOXNIWTc4b2Nw?=
 =?utf-8?B?SjVNZTdmc0RPVm1uTVV6STNGWjhteUpvS0JWZDl1cld6YjdnWW1ldk5OaFdl?=
 =?utf-8?B?RkFlaDBJblY4cnFzWXpxSXhVdmNDVFB6MjNGaGlweTc4TEYvbitRbGl4RS9F?=
 =?utf-8?B?Z242dmtKVFFXemhxZTg1OUhIdEE5VlhLS0Y5RHkzMHNPN1lINVdrYUh3Nk9Y?=
 =?utf-8?B?M0xabWpVdm9wRU56MTdQQ09wYml6Z0lvbFZkblJna2sySGx2U0dXK1NuNDhJ?=
 =?utf-8?B?R2dnV0UySHQ4aUZ3b2V0MU16WU1zS1ZhcVN0ODB4L2R3d1dIZzZZa3h1Qkhj?=
 =?utf-8?B?bytZdjNORXBIVGNPd1F3RGRWZ1F3NkM1aTZic3lmSmZMdkdtdTRmeStjRmdE?=
 =?utf-8?B?b2svanp3YnJabElJRnFNRndrWWE0T2JUY1ZiOGNGZTloeGpNeVA1dUxibW9F?=
 =?utf-8?B?YjhYQU1XdjNYZTYxbFZLK3pXR2xZOWRoMzRzd2V2cjdpWUtCcEJKVk9hZTdF?=
 =?utf-8?B?WHhTYnVwTjNobVE2aGNiRVVrZFZnd3FJbTZYZENJdmw5MFBnN0FBaXp3QjZT?=
 =?utf-8?B?SnZ6TVVlUHJOSVg2YkZNSjhFaU5TMFJ4RE0xYmNNS2ozdVFYUGxUQkNDamhy?=
 =?utf-8?B?WXJXK2FHR0Nvd1o5TzJqazcwWCttV0FsdGE5enI2cDZ4QmdjREhJL1N1cVdP?=
 =?utf-8?B?TGFQZlRHelQxdmtOZGRscmhTVzRRYkFYMS9sYlhzM1JrUGtkelJ6dTJ5NnMw?=
 =?utf-8?B?eGYrQ0N2M0RBdzdGblhiTlcwSVhMQzgzVFVWcjc3UTFVT0lVTnFwaVJYcnI2?=
 =?utf-8?B?dHRuNDJsQ0diQnh5VFFnbUJra2JmcEkwSHp2aHE1SVBjeGE1dXdGV0c3aXRK?=
 =?utf-8?B?bzMyWDhMUkduR2tLQ3Q5aXBTMVY3VFVjd0tWZVcrMW42aTZzMmVwM1cxYzk4?=
 =?utf-8?B?Y3lzNDdIMlZDTW1EN2ttTEdrMGxtcEZKT1d6Q1BuaktTWmFpVzcwUmJKVEJ6?=
 =?utf-8?B?YVA1VnFQS1FFWlQ3Z1Y1Q1p4b1NVdkdCRk11US85RXU1RjN5S1BEY1hZVklL?=
 =?utf-8?B?TkhaK3krTnp2QU5ndWg3c2o2bjJKNVlvZXlmSmEwN0ZBdUxkWk9VSjVLN0NY?=
 =?utf-8?B?bEV5WVY1b3Z4VVZGWUxHQ29JVmlFbkdCdW9idnFrSi9ZSzRzY1lWaDRrdmdC?=
 =?utf-8?B?eGs2SmtyU3FTMWxzY1VMQklFUFgzY21mMnVncFMwUVdNYldxY01VZGRFUGM0?=
 =?utf-8?B?cHg2emVYV05meEdRSTZqRDlzbmU5OVlmTWpERmtnY0hlWE5aRXlKOGFsNnpI?=
 =?utf-8?B?MFFUZWwrcVlLYmVnZzh3eWFjaytobnppUmFPaWp5b3NOYjFRdlZUVFBtNEI0?=
 =?utf-8?B?WFMyZzU5c2VqTmR4SENGL0FWVmgxbVI5ck41Zm50M3JCbXoyaStUWHBPK3A2?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b5fea3-5af3-413d-1e78-08dbf64e716e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:28:17.5839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfNIWLuriPQJdjThCf8YaBMKwSWIEl+hyK3Hf7Nmgzo5XtKwjDfFePDVM/FFYesOiUZICky95nA5RgQ0s5uiHLjF6yC64aBjcQs8Hgij9Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Andi,

On 5.12.2023 16:39, Andi Shyti wrote:
> Hi Karolina and Christian,
> 
>> Karolina Stolarek (8): drm/ttm/tests: Add tests for ttm_resource 
>> and ttm_sys_man drm/ttm/tests: Add tests for ttm_tt drm/ttm/tests:
>>  Add tests for ttm_bo functions drm/ttm/tests: Fix argument in 
>> ttm_tt_kunit_init() drm/ttm/tests: Use an init function from the 
>> helpers lib drm/ttm/tests: Test simple BO creation and validation 
>> drm/ttm/tests: Add tests with mock resource managers drm/ttm/tests:
>> Add test cases dependent on fence signaling
> 
> I see that all these files (and previous patches, as well) don't have
> a consistent prefix system, like kunit_ttm_*. But they all start with
> ttm_*, thread_*, drm_*, etc, which makes it a bit difficult to follow
> and grep through.

I see what you mean. As for ttm_* part, I decided to keep it as it is
based on what was in DRM KUnit tests and helpers lib. Almost all
functions and subtests start with drm_*, and as I'm working on TTM
tests, ttm_* prefix seemed like a natural choice. With thread_*, I could
add ttm_kunit_* in front of it, but not sure what would be the benefit
of doing this.

To be honest, I haven't considered using kunit_* prefix here. In the
code context, it's obvious these are kunit tests, and repeating that
information would make already long function/struct names even longer.

I had a quick glance at other KUnit tests in the kernel and this seems
to be the case, no kunit_* prefixes are used.

> Can we please maintain a consistent prefix system?
> 
> I know it looks bad to come out with it after this series (and 
> previous work too) has been out for several months already. I need to
> say my "mea culpa" as well as I've been in the review loop, as well.

After this series, I plan to send a small one to wrap up my work in this
field. How about adding a TODO to clean these up? I mean, that's
just how I see it, I'd like to hear Christian's thoughts on this.

All the best,
Karolina
