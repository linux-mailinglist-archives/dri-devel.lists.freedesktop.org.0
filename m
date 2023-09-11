Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31179A84C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E4610E1AB;
	Mon, 11 Sep 2023 13:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DB510E1AB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694439208; x=1725975208;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=89TIwPOaBMHB005xlGpmtU/I8F0bwar2D37fUE5WNpE=;
 b=Lt4JaDLkTQVFoB6ChQ2BEG7YNn85GsAlmfRD1xXrRtuv1Zu0UOsQcZIc
 Olrv8h8KNg3YCwl4WrwZv/bNGMi3scp2+xh8myAzQtZ884pUvvdYxQNzl
 M8IWY/4uv3ZR7KyjdCoslkjbFB3r8gH5ELL6TuIXpz/gbJgxqWq2Lz/8L
 nxhz/+pangPQNeUUYGe7C1ffRi0ZyHQe8mEyrUTxJKDXawY8g3KTp17aY
 QAcs5L+5Rkw0uHVIqzdgsikKkl90RN2Z547UgXQdihubkofiiwExcX50u
 +d46uDCr5DMPIIEi4KBrJ3hoigpmSYMLOCCh2HdX/8T+Gd1zueDRtUHjr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444498402"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="444498402"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 06:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833503266"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="833503266"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 06:33:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 06:33:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 06:33:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 06:33:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 06:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAxsGZ5+e9oZU5md7MBCgmPSxtgk1i3xTS6fB3xCDixWkWMu3/+s8rrsH559AhoF5DCRRDvW6FH3cIFyZsEx8qNog60DgRpShk/nxDKhwRGVvDhhS3BtNvsuNLJNgSJURaUJp/PuPMbIYmevB0d+X3xs8p+/3P2kQLYOJN2SUgoXfLuSFO/GrjN3jEhbrsvw9cIObv72PXzrl98J3d4sIVHz6AduqjL/sbwdRWKYhoDuMTHXHSzUGxuBehhYGzMqHJOseLUFGnuipeo+SnAARVziK7i8OkKU2aVnJK6PNkd1mkEjl7YFQmlKKhJcIFKJ0G2x1+1LIRIQNMWZyOiyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li+Gotzc+63JPVmUnIfBJwVKkODbPtCMIqxMGe62R6I=;
 b=DySx2acLZzM/KIRH7WfTRa2eDIwlkRHRba5YQrCefvhVwmkYLPdFJ1IXpI47DdPEm1VLJrL2dOGJQ/M6uLUpkot7SZ/+lzHeAdDttq9A0K/1PWJjd25RUvkVLl8qRq/uosp4KyRfa+K66q7WJ3atyOo6Bfst+LvKDIzKAx1D07EqDjVJKkKhY9Oa+a0TlorFrqSYPcmaebSSeBO9wJ3dm0icvl2E44ltod4CMxwpZJk+fIxY8T+pttrslsW0vgexflm7r3f8b0MPxPDYcOa9bySP3i4w2t31alK1AHv3Zj7gI4iIOcd1YzJJLin8pMqlLYLi3RPOW+jTMOg6l3K8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Mon, 11 Sep
 2023 13:33:21 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:33:21 +0000
Message-ID: <99ef9f6f-a84b-fa4c-8a33-a214b4b9695c@intel.com>
Date: Mon, 11 Sep 2023 15:33:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
 <87fs3lf0ht.fsf@intel.com> <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
 <4080bd92-d10e-4cb3-fce4-a76892834baf@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4080bd92-d10e-4cb3-fce4-a76892834baf@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e78ae0-40d2-4c39-fe3c-08dbb2cbaa7f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsIETVhOI09xtH4pqCg2E+l/iy3tX0nVHk2S409vIsQIC7XKoB22sWHkO3grecJSm8jjrowrRZu3A8VP3W402BMz95iHr/qqfSQ8LzHLAJrd1jM/ZR47+4SbFWYEW6pIGIB+2pM6dGAwDKKfW5B7+vlVU7kg1MsYkxOjz782oCovK1g6A+2volzpNeyzzY8Hrt5MAaTS+WhU9Vrk6EWwUwCC+tO/kCMOyDwWkZrhCzNmoHQbDjdfMRdLMEWze/x+XPewVTfir1hIllP3pk0cuvcqaLREHKDjQrgbUx44vRKcXcsS+7hVtqQyaaZSaUbSZED3nUkQc8aeX9fW2UNMZIJICwtvh2l9aByphZxzqcvYsgSd1tWM85WvOOLGbYWg2vUGy3AXFU2/lD/ZZieVthZhvyrIYw5WT77jZEuw1h+Xv/e7Q3ogQ9TiLPJPHx/23N6kHABY4rnasHgsZ/gFsUIXZL+BLZHbdB8QCHUnk+9DejcFRJW7+I/qjM9eZXFlXY6VkcywGQuhcS07jh9EM7yXwld1MXhMhMgW3roNvah4n69BWjkTHISa/mrsP/3CaOZhxwdyWEhkdiugNhTs0tZqMcmca6BcGQZE5AEpX1UTVMs75M0j0A8PCH/hv0oR9DVkF7F6q3MX0gQ7UiQUHch1G1qHF3Xa4euOL2N+1y41Jb7UA3znjwFvR0dnajJB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199024)(186009)(1800799009)(5660300002)(8676002)(6486002)(6506007)(8936002)(44832011)(15650500001)(66476007)(41300700001)(66946007)(4326008)(54906003)(66556008)(6512007)(2906002)(478600001)(6666004)(316002)(53546011)(966005)(31686004)(26005)(2616005)(36916002)(66574015)(83380400001)(82960400001)(110136005)(38100700002)(66899024)(31696002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDFnUHczdHBkaGtDOCt3NjlMV3Bab2p4Qi9CZ1FqbWs4V1BFSzZiK09SVXVw?=
 =?utf-8?B?akxiUC8vUkFmSU8vOEFVaWVlRStxZnBPb29YZDB1RTF2L1dabDFrWTA2VERP?=
 =?utf-8?B?MGtXSmZmOWRsUU45TkdubnNqa1lFWkkzY2RlcFEyYjh5dFR4VlZmaExaeFZv?=
 =?utf-8?B?dklnRElVR3BJQ0pSV3ZFc3MxTDQ0YWl2OExLVENZdlJkMkhVWEwrWTliWHVR?=
 =?utf-8?B?SThDVlZ0em9XNmpJUng0aEppYkhTMlFTN1NOZCsreEUxY1ZQcEV3S01PQjY0?=
 =?utf-8?B?bEJTbjZDMkhXbXhhcFhtZXhld3o0WjdYVUFOenExcDd2aDNSUmNuWUVITzZ4?=
 =?utf-8?B?TGtBOG5qdTFUUUxQcGkvM0NhRC9ETzB0amJ2UXlrWWZyVjlzUXpVYklwNXhR?=
 =?utf-8?B?eWFrSDh2NzZmVTBma01sNDBiRDdQZ1hlNXpSZVYwWEdGNXM4eUZodFdJbEdv?=
 =?utf-8?B?OFJMMG01WnBxUWM1eVFNRlExVUNxV2U1QTR4YUhEUS8yNDhFKzVIb2t0Mk9D?=
 =?utf-8?B?WEQwRUNTaFlha0Nlamp6TDMxajZkOXFQVmZCSkllRC95cDRLZ1I2NDAyUnpD?=
 =?utf-8?B?a29tWlhRZ0tLR1RreGYyWDhGOUpFNklDeDhjcENEOGdXRURBNmlicmRlWlFo?=
 =?utf-8?B?WnQyZ0tvdVBhWVBSRTZNRHQ5V2RFTi9SQkhYcjdHVnIrcHVQUGhWY2plb1p0?=
 =?utf-8?B?b2pibEJFOHZDdjZuakZGaFZiNXN6OEltTFVJRDRPYWQ3cGowbHVXcm9qcjE1?=
 =?utf-8?B?NUYzNDR1UHFtUytZcTgxQlFNOVVrNStmRmFhSU4vZnVRTVZ3LzdHRENNcE93?=
 =?utf-8?B?YVlyQVM3NkltQ05kRkJYMkw3aWwzaFRNbjFCbzV0Mmgvc0pZNzUyMVIzVFVl?=
 =?utf-8?B?SkdXa3psVFdpSEwzN0hrc25JWFJaY2lQZ3VxSW9xc1N3VVVwK3hYQmpHS2h2?=
 =?utf-8?B?S1cwMTM0OWFPWU0yU2dINzAxM3ZPeEFyL0RiZkR1V216YTBSdVhJZnlZbWVa?=
 =?utf-8?B?bWtEdEFHNmZ1TVRXWmF4aXNLMjRWZ2F2MmJ0dk1XZTZKYlI0aUlLUFpBUFUx?=
 =?utf-8?B?Vmo1Sm54cjlsODNkc25wZENvU3JEWnZSYUxoRGRPMGlaVGhxeFRXMXFNL1do?=
 =?utf-8?B?MG41Y09Fa2pXZDd0RWR5VWFzc3QwM2c2eXNyWnFPMEp5WS8xVlFwNDRvTVlt?=
 =?utf-8?B?eUhpK0JlRmJWNDNHeEZNblBncDdGZGNDTmRBZXBSaGdmRE85cmcveDU2NTFY?=
 =?utf-8?B?aXlGOHNiR25wMS9hWHh6L1JLNi8yaG50WlJVcnREa1l5N1J5dWs5aXhONU9p?=
 =?utf-8?B?VjFIR3V2R2FoS3VYUmtONjMraWFFbWRVYXY4d2prbmlUVjJDak9yeWRGUDBr?=
 =?utf-8?B?anZXTHJZQmdvblFsK0VLM0JxVlM0cmwxT282OVNST3lYNnFJb3ZSeHhHNHZx?=
 =?utf-8?B?ZEhHUVFqYVpaMWdOR3hXOW05YjgyNVh6U3RsK1NYM0UrTG5XeEEwTUZiSUI4?=
 =?utf-8?B?KzRwb1Mya3RMQ05CMm9Rblg1OEs0ZVIwVjI3Ujl5RExhMXRVOWRmUEY3c0lK?=
 =?utf-8?B?cVhRWENHZkdWYmFPVnZUNnBJU2QvV2ZJWDdyemdoNUxOWVhxVCtBY0tablQ5?=
 =?utf-8?B?bklqbDNMZENrM1B3WmVyTzhqdGRLaDI4cFIxSGtoNHQ1UW1Ub2YvMm9FV01I?=
 =?utf-8?B?TFNPQ3B3MFpBYWovN2Y1L2VMVStvMlYva0E4c0p4OExrK3p5Mk1aVkJmTkpv?=
 =?utf-8?B?bGFVWHJsbVpUKzVMZFpJQVdPTEVlZnZrd0dmeXVoWDA3VjF5cXRWdVYzaDlW?=
 =?utf-8?B?d3lodjNwYWJPME41dWpkV09vUDI1SXdHNU1CdHNIZ2pIQmZaRENYZWpJZU03?=
 =?utf-8?B?WEhhRzdTS242Q3pJQ1ZaYTVIeXhsNWRQQ2d1a1NuUnR0eFFTaVRmanJ6Ylc2?=
 =?utf-8?B?TFVBYzFYcHNkVTQ4VkJiYy9SNEVENVloSjFHVXdQbWxLYzRNeXFuZDJzT0NN?=
 =?utf-8?B?R3p4dE9LZTBrYnVwT1d2dXF2Q0NoY3Z5QUxPd3VidTNvWHNYY01Rcm0zbUl0?=
 =?utf-8?B?WUhCcDJPdU5VdkplVG1sTkUrVUVSbDhXMWh5REpIZis5V3dVOGNqV2I3U0ll?=
 =?utf-8?B?OGhIVXd3eGt2V0FyQ3FQdmp4SkFQNWh4cTNMMlVrRUxPTGNhV0pob1EvaytS?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e78ae0-40d2-4c39-fe3c-08dbb2cbaa7f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:33:21.4241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tn1mOsCGuJmE2oNGcW7MaW4ChB6yYQJMU09faR9HuJteGWFWW5W+kaKfRysO8SId9Fd4r8qq1puowze40T59Zd4it0MWl+jHNgqqNrWWA4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.09.2023 15:12, Christian König wrote:
> Am 11.09.23 um 13:47 schrieb Karolina Stolarek:
>> On 11.09.2023 12:49, Jani Nikula wrote:
>>> On Mon, 11 Sep 2023, Karolina Stolarek <karolina.stolarek@intel.com> 
>>> wrote:
>>>> Update Makefile so it can produce a module that consists of TTM tests.
>>>> This will allow us to test non-exported functions when KUnit tests
>>>> are built as a module. Remove the tests' Makefile.
>>>
>>> I'm asking questions instead of making assertions, because I'm not 100%
>>> confident, but I don't feel like this Makefile could work right.
>>
>> Questions, assertions and comments are fine, I'm glad you're taking a 
>> look at the patch :) I'm not 100% confident either, so I welcome 
>> suggestions on how to improve it.
>>
>> The problem is that TTM tests try to test symbols that are not 
>> exported, so I have to compile all the files together into one module 
>> if I choose to build KUnit tests as a module. The other option that 
>> I'm considering is to make the tests are builtin only. I'm tempted to 
>> go with it (for the sake of simplicity), but I'm trying to get the 
>> module option to work first.
> 
> I have to admit that this looks pretty awkward, but I'm not an expert on 
> the Linux build system in the first place.

Neither am I, and it shows :)

> Would it be an option to build the unit tests into the standard ttm.ko 
> module and let them run whenever that module loads?

You mean appending the list of tests to ttm-y, depending on 
$(CONFIG_DRM_TTM_KUNIT_TEST)? I _think_ I tried something similar, and 
couldn't get it to work, got a bunch of "twice exported" warnings.

> On the other hand if this solution here works, why not?

Because it's complicated and, well, awkward. I'm still thinking about a 
use case where we would prefer to have KUnit tests defined as a module. 
IIRC, in CI we enable KUnit tests as bultins and run them during the 
boot. kunit.py helper also defines the tests as builtins.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>>
>>>
>>>>
>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
>>>> Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
>>>> Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>> ---
>>>>   drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>>>>   drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>>>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>>>   delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>>> b/drivers/gpu/drm/ttm/Makefile
>>>> index dad298127226..6322a33e65ed 100644
>>>> --- a/drivers/gpu/drm/ttm/Makefile
>>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>>> @@ -2,10 +2,18 @@
>>>>   #
>>>>   # Makefile for the drm device driver.  This driver provides 
>>>> support for the
>>>>   -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>>> -    ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
>>>> -    ttm_device.o ttm_sys_manager.o
>>>> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>>> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>> ttm_pool.o \
>>>> +       ttm_device.o ttm_sys_manager.o
>>>> +obj-$(CONFIG_DRM_TTM) += $(ttm)
>>>
>>> Does that not lead to each object in $(ttm) becoming its own module?
>>
>> Huh, yes, that is what would happen here. Not good...
>>
>>>
>>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>
>>> Does this not create a ttm.o with just one object, depending on
>>> CONFIG_AGP?
>>
>> I just left it as it was before my changes.
>>
>>>
>>>>   -obj-$(CONFIG_DRM_TTM) += ttm.o
>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>>> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
>>>> +             tests/ttm_pool_test.o
>>>
>>> I'd preserve the one object per line syntax. It's nicer for the diffs in
>>> subsequent updates.
>>
>> OK, will update it in the next version (if such comes). I just 
>> followed the style of "ttm-y".
>>
>>>
>>>> +
>>>> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
>>>> +    ttm-test-objs := $(ttm) $(ttm-tests)
>>>
>>> Isn't the -objs syntax for host/userspace programs? And if not, doesn't
>>> it lead to objects with exported symbols being present in two places?
>>
>> I saw it in use in other Makefiles, so I followed it. As for the 
>> exported symbols, I tested both builtin and module configs, and it was 
>> fine, but it's possible I missed something. I suspect that the 
>> variables are first expanded, and then processed by the Makefile.
>>
>> Many thanks,
>> Karolina
>>
>>>
>>> Confused.
>>>
>>> BR,
>>> Jani.
>>>
>>>> +    obj-m := ttm-test.o
>>>> +else
>>>> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
>>>> +endif
>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>> deleted file mode 100644
>>>> index ec87c4fc1ad5..000000000000
>>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>>> +++ /dev/null
>>>> @@ -1,6 +0,0 @@
>>>> -# SPDX-License-Identifier: GPL-2.0 AND MIT
>>>> -
>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>> -        ttm_device_test.o \
>>>> -        ttm_pool_test.o \
>>>> -        ttm_kunit_helpers.o
>>>
> 
