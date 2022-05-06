Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F451DDC5
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CDB10E1BC;
	Fri,  6 May 2022 16:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CF010E133;
 Fri,  6 May 2022 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651855439; x=1683391439;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b2yRWFM6wJ8uYCntKxe1Go5VseT5uS8EgTlxdjbzXEI=;
 b=IRCoMXoW+bK+ESZnNgvOB1Kbpg/D+DSOLsmiiSsEyvuFJWDEiw+gf/K4
 0K75mRu3vkSNFOS9m8dYyopRxcARhm2C8hUPPHfTK4yo0YSfZkyuUj8sF
 bzMnT0jHVEMMi5YshwHrIXNc7czWj+qrv8vBDa0tRU76KlVFl1JGUVHSS
 nH/lD2f934UM3MV3l8K/vCVsRP6PYKlYuH3LqR9Fr0999Sv6im0DAInRZ
 kyS7wlAq/1rfTEjX6E5N5RH2tFc+TREFSt/w7in0wavbZk0oajj25vLF0
 85ylMWiOQbZlf+VGQNSquz8Bj6Rl1bGAUkGdOkUngK1UdEm+aypkS8WLM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="266107985"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="266107985"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 09:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="563916630"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2022 09:43:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 09:43:57 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 09:43:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 09:43:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 09:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJJF6/p8NQp/+EDN8ZcjR9mQMOZLtlC3Jz1MMX50jWIH7UjNgNvSzsuUwdTObWtwvstUOCg915V1Mez1oeq1YzBMcE/jt+yP4OtMJvTuO9UtGAM2TYLI48UhPlFplL4Mwr7A514IljpPjaFWWJD6Jlw2eCUCmVegNJmBHTWfQ1RRhWCodaAlLEfL87GwHixjyIDYGETb0vH+IRURXssYIMvMa8prNk+IcC0TWNkKf7xKvBg9RurI66aIw9PJPzGBvccp+GCsaN1NZDzwjbXl+nDmY5j8Q2bGqCdLnszM15dx/zl9jx2v2ALpZt4dsiuHgaGs7rg+L9dPzoAk/nSxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykC/Jl7wOY/8A+oaWISyxFp1K0jTePF+6z3xYkC1D40=;
 b=Tf1xUR2B6Vr0qGHTeoBLvlpSu1Skb4gVhcd0kADz2cHi+YsSZvoAJVNfPDz5ORXEUH11IkDFYXkKIDBmpFMrxg+an6ilR+MdyMckfU8aH5TAjWfR/Bf9iC0fu3SGgNwrLcbnvRAYQ7tUqgKjMEk9O2jpLrG6wHzpnrdddJ6urauVGzjhfIwLT/JxdpAbrAiy4SaAQbEVyQiTEXrQkS6WAijuD83sALYk2ACAJFk8URSxQebdZbRnfVlPqcQM8WQ3d1snlld00VNGzVmnpYO97GeD1WT7cFASRG7lWwBnntr8RTRFWE+i0YcIGQ9BEbX9jFF0KgYV343ywss4Wdeozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 16:43:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976%6]) with mapi id 15.20.5186.028; Fri, 6 May 2022
 16:43:55 +0000
Message-ID: <ecea4fbb-32cc-5ff3-9bff-3537833dce49@intel.com>
Date: Fri, 6 May 2022 09:43:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
 <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
 <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
 <032467b7-8794-882a-e45f-6e9d85a716df@intel.com>
 <1d15f38e-c3d8-a521-4a15-50341dae5000@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1d15f38e-c3d8-a521-4a15-50341dae5000@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33227a3b-3250-4936-b254-08da2f7f9c61
X-MS-TrafficTypeDiagnostic: DM4PR11MB5312:EE_
X-Microsoft-Antispam-PRVS: <DM4PR11MB531298789487EF67298447D8BDC59@DM4PR11MB5312.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tEsYOLqlKnuhOnvcrpY6kumegU/AznaMdRM9nG730SQmN17/8yMne3agMD24yDpoX8LujYg0AKS5Tb/x/84GC6fhVbtTAYHSUUcpTVix0cgH58Asrp8Od9A+OA/wSk6VNlln9NB57tntKcIi6dmZMAVRE2CsVQYlkmhQ2rkunlfmfSwedvVyjndtgeMZ6dgJKBWC8u1zp6Ax0Zkjj68ETFARwOGqRUOZ7qmPvLbe3AGPn+A2/yI41hv4vI88Ahd9u+k/GipyYRVMTDeV2/Hf6TiTQ8jV8Mbl0d2OjVHtvCeGd8n4vdIis5Fi7eUAT4/lo2FvRMRZe4XjswlaKdSSQruaeqsMZbcRDfJDe6XyN/718EXtKaLbh3b8/ZP9Rr+IM+u1tteym0ksrYamfT+8wwtJOnEylDVrQOts+UwTSdmBW23O4cTWYW8c7XSNzfCKQ8LzpTJV8kirk8YVG7MLpfbp8CtrD8S/sEKw4EpDATCa3z99muBOt5G89O6Kem9ILrTZH38BpadnJQlLE0QG6G5vqlcf4PCSjLvpRSKkW6+gNUgjWBv9eDif09cQ0VyZnQv9ilC6WPrRv5AtkPpJ1kcPXnMVIaRsuc6HX2EISIaK4mYdx0d3dEW634nKHKoUzUOgNS0lPSY9XOMfZb03qtva2C+kWP5DXDPvfJqzDWcmRbyQ7zlLc5eX+ULYnrPA+troGfysFrY5Y8Mopfsbpe5TOlrjma2X3gpZ9EjsVjTVQZU+Y+BbtLiA2kL8spE1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(66946007)(8676002)(66476007)(66556008)(38100700002)(6486002)(508600001)(86362001)(5660300002)(316002)(110136005)(82960400001)(8936002)(83380400001)(26005)(6512007)(2616005)(186003)(36756003)(31686004)(2906002)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjVQamduQlNEd1VXbEUwNGM5VDhhbFN0QXZTcGltY2phanFWNjdmRGxvaGFs?=
 =?utf-8?B?Q1d3VGtmWHF4OGpCSVdKMUI2TGVMWjFiVGlpeStuVmYyMzUrOTE3TUVEUmgv?=
 =?utf-8?B?c3h3bENVR2pRK0dwam9heDhrVGwrOXJmcnRWck5PTUZpOGk2aWU5K0g0NzlX?=
 =?utf-8?B?aHlIVE9zdjZETXp6TGFYNTIyYXRZaStiWkRHV21IRDAvb1E3eEUwckMvdEN1?=
 =?utf-8?B?anhSNnRwZlJzNEVIWHE4azRhUXZvTU5pV29HMnJ5d08rcUEzV2Ixd0ZOWVc4?=
 =?utf-8?B?alhGdW5DS1hhVWg2Zko5dzZINGVTTWR3OFc2T3JTbW9RQzRZOTVHLytWUjcy?=
 =?utf-8?B?dU5WMkRCVnlVa01KUjg5NVVzN2hnaG9xc2FuRjJMa3JSbUpBTG8rcGRLdndv?=
 =?utf-8?B?K0c0dCt5RVY3NFdvOVIrejRHdVM1QzdPL21rZjF0UExYOFNRd1hVK1JoZlAw?=
 =?utf-8?B?bHI1LzIyaDhJOGJjQUxqMU9JbmlXM3VhRGxDMTRYSE5GRGp6aU11UUd2Ylcr?=
 =?utf-8?B?NnhVZlNtSVFhUGMxSDhnN0VGUVFQaC9qdWFZdTRrZW1HUjdvK0RVb2JnUSts?=
 =?utf-8?B?NGd1aVVhaGl6eXZYQnYvanNwTHRjMEdGZ2hHckNjRC9BVGZIdHFuYjg5RU1F?=
 =?utf-8?B?cU4zRWticGFTZjhXTmM2c1RWc0hXTFhTMklGZzRCTXRLRHlPTWRCZS9leEJE?=
 =?utf-8?B?R1ArSEFwUnNHN3B1WXROdnRQSzdqS2RHT2ltSHV3bEZldGVWRmVjWHFRVVF4?=
 =?utf-8?B?Q1hVV0tsU0c5L3RPUWdEQkxXMkh6ZjYyK0tSTE5SQVlaaUk4REdIYzllck94?=
 =?utf-8?B?UXZVbk1yYkFOVHlMUTV0NjYzZHpob1hzQ3RzdCtad1VMRDJTK3VqblgvNXEv?=
 =?utf-8?B?QzcrN3BPWXl4NnFnUDNGbXk3QUhjRFJ1dXNkMGxPSjBCSW9EOVhvSXhkblAz?=
 =?utf-8?B?blZZNnd4QlZleTdkYTJacWc4NTlhQkVNYi9FZ0pSMW1pUE9MaC9WZ1kvMWtx?=
 =?utf-8?B?TFoxWE1aSVVHTGtPYVA2UkF5M3lOeGxzcWFkblJwQytKK09hSVRqdkVsUEhZ?=
 =?utf-8?B?cWFGS1FkOW8rREVvSVBURzZIbzhyNzFhSVB3MWpJRnZhNys4cDVPUTdyNnAr?=
 =?utf-8?B?SGFCSkZyM3pKQW4vQkR5YkpaWG1QMlVyMEs0Q1VOVXF4U2RtREQ1RWV0M3lP?=
 =?utf-8?B?L1ZRd1pwQUFZRXVOSER1SmdNdTFhd3J0d3Z6VkRKVVdZNk8wQ1VEaEIxdWVK?=
 =?utf-8?B?YjJLL0FaRFhUUkJGYkU0T2VGVjQ1YXB0dHJ0Z282eHNTeHZXa3RIZFVhWlFP?=
 =?utf-8?B?Wk91Y1pua0pBQW1FMWpUbVFNdGwzMjQ0UlZDYmg2c2x2UmpQYUZGa0Z1bjRv?=
 =?utf-8?B?bm4reG41NHlDUGthNVhmMS93QTI2Ri94QWpYZFZZTDhuQi80ODVqNk5qSGtM?=
 =?utf-8?B?bExuOURzYm5QVWdHZU9JcE5OWXNXZXVMRTllQVBkNEdYVEQrdlRxYW9xeDdu?=
 =?utf-8?B?ZFVuaXowQUh5dkRaWkNWL3RTUEVORzF1MkNva2l0ckVlT3lSc0hMSE5uZmZm?=
 =?utf-8?B?WHNDVnFkQW0rR0hsQ282Y3lSQURzazgwRWlLRmZJYlltRldEYk8yYmxDSTgx?=
 =?utf-8?B?R3E1eUxXaG9qYmxBZEpnMHU5RDViVjAvOUN1SjcrSmFBYkl6cG9HdE0yREFI?=
 =?utf-8?B?a25nTjlDMDB3N0phL2k0aHRwTmw1UFNUYmorZHdLVXUzLy9CTG9iakc0bHU0?=
 =?utf-8?B?OEZ0Q1FGYWtTbjN3OFpCbzhCNTU2REpMTjN4RS92Y3dWUTcxMW9lOXkwVW5u?=
 =?utf-8?B?Nk5UYnowRGkrUG5DWUU2ZTN1Rit3VitobmxWNGY5RVA3VFF3STN6Ui9uZEVG?=
 =?utf-8?B?bVBRVHhRdmhybUtrSmdsQUtyb2QxVEhmbTRQWnpSRTduTjBOZlVSSHBMOVdm?=
 =?utf-8?B?WmNqWVVML0dJa1VibCtwMkRiVnBLNWNFNU9WdDNab21aeFQyU0paMTdrNzBV?=
 =?utf-8?B?NnNmdE82ZnRhWHdEWEpvWmtwa3FTMUhoaGp3R0t3cVZwRWszc01ZWVZ1MjdR?=
 =?utf-8?B?NGxvV3c2N3hjaHpyZGZlN0F0TWE5SFZZWjBrZ05EcHFKYW1QQ0xJWHhWd21H?=
 =?utf-8?B?NDUrYmdCR1BmN0pKM3g1V2ZrOFM4eFhCY0ZRejgwTUhOeEdaNjVPVFVydjdq?=
 =?utf-8?B?c3orNjNEaU0wUmFEbXc3OWRqd2JHMGhLTXc0WE80ODAybDRmSnk2bUNvWnNs?=
 =?utf-8?B?bmEvbGdSVnVDSEViNFRkd3c1MW1IMGdMZ2NlbE02bGg5dlppOWRrQXNDQnlD?=
 =?utf-8?B?dXl0ZGVXWjdKbTE4ZktJVmtvdGNic0ZaQ2t2bDh1RW5IZ3NrK25reHd1NHdW?=
 =?utf-8?Q?oc4f/Go1bxadYbQQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33227a3b-3250-4936-b254-08da2f7f9c61
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 16:43:55.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2q8J8YzFITqiDJ/Okp6mh0scBnZgMTWua82JJdQnHUO+tP8U2PJ0yuTQTR/9VY2z9Wf5oTjYROGQS3YSqc7J5lRnAiz+yXyQD75PIyhGLIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
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

On 5/6/2022 00:18, Tvrtko Ursulin wrote:
> On 05/05/2022 19:36, John Harrison wrote:
>> On 5/5/2022 10:21, Belgaumkar, Vinay wrote:
>>> On 5/5/2022 5:13 AM, Tvrtko Ursulin wrote:
>>>> On 05/05/2022 06:40, Vinay Belgaumkar wrote:
>>>>> SLPC min/max frequency updates require H2G calls. We are seeing
>>>>> timeouts when GuC channel is backed up and it is unable to respond
>>>>> in a timely fashion causing warnings and affecting CI.
>>>>
>>>> Is it the "Unable to force min freq" error? Do you have a link to 
>>>> the GitLab issue to add to commit message?
>>> We don't have a specific error for this one, but have seen similar 
>>> issues with other H2G which are blocking.
>>>>
>>>>> This is seen when waitboosting happens during a stress test.
>>>>> this patch updates the waitboost path to use a non-blocking
>>>>> H2G call instead, which returns as soon as the message is
>>>>> successfully transmitted.
>>>>
>>>> AFAIU with this approach, when CT channel is congested, you instead 
>>>> achieve silent dropping of the waitboost request, right?
>>> We are hoping it makes it, but just not waiting for it to complete.
>> We are not 'hoping it makes it'. We know for a fact that it will make 
>> it. We just don't know when. The issue is not about whether the 
>> waitboost request itself gets dropped/lost it is about the ack that 
>> comes back. The GuC will process the message and it will send an ack. 
>> It's just a question of whether the i915 driver has given up waiting 
>> for it yet. And if it has, then you get the initial 'timed out 
>> waiting for ack' followed by a later 'got unexpected ack' message.
>>
>> Whereas, if we make the call asynchronous, there is no ack. i915 
>> doesn't bother waiting and it won't get surprised later.
>>
>> Also, note that this is only an issue when GuC itself is backed up. 
>> Normally that requires the creation/destruction of large numbers of 
>> contexts in rapid succession (context management is about the slowest 
>> thing we do with GuC). Some of the IGTs and selftests do that with 
>> thousands of contexts all at once. Those are generally where we see 
>> this kind of problem. It would be highly unlikely (but not 
>> impossible) to hit it in real world usage.
>
> Goto ->
>
>> The general design philosophy of H2G messages is that asynchronous 
>> mode should be used for everything if at all possible. It is fire and 
>> forget and will all get processed in the order sent (same as batch 
>> buffer execution, really). Synchronous messages should only be used 
>> when an ack/status is absolutely required. E.g. start of day 
>> initialisation or things like TLB invalidation where we need to know 
>> that a cache has been cleared/flushed before updating memory from the 
>> CPU.
>>
>> John.
>>
>>
>>>>
>>>> It sounds like a potentially important feedback from the field to 
>>>> lose so easily. How about you added drm_notice to the worker when 
>>>> it fails?
>>>>
>>>> Or simply a "one line patch" to replace i915_probe_error (!?) with 
>>>> drm_notice and keep the blocking behavior. (I have no idea what is 
>>>> the typical time to drain the CT buffer, and so to decide whether 
>>>> waiting or dropping makes more sense for effectiveness of 
>>>> waitboosting.)
>>>>
>>>> Or since the congestion /should not/ happen in production, then the 
>>>> argument is why complicate with more code, in which case going with 
>>>> one line patch is an easy way forward?
>
> Here. Where I did hint I understood the "should not happen in 
> production angle".
>
> So statement is GuC is congested in processing requests, but the h2g 
> buffer is not congested so no chance intel_guc_send_nb() will fail 
> with no space in that buffer? Sounds a bit un-intuitive.
That's two different things. The problem of no space in the H2G buffer 
is the same whether the call is sent blocking or non-blocking. The 
wait-for-space version is intel_guc_send_busy_loop() rather than 
intel_guc_send_nb(). NB: _busy_loop is a wrapper around _nb, so the 
wait-for-space version is also non-blocking ;). If a non-looping version 
is used (blocking or otherwise) it will return -EBUSY if there is no 
space. So both the original SLPC call and this non-blocking version will 
still get an immediate EBUSY return code if the H2G channel is backed up 
completely.

Whether the code should be handling EBUSY or not is another matter. 
Vinay, does anything higher up do a loop on EBUSY? If not, maybe it 
should be using the _busy_loop() call instead?

The blocking vs non-blocking is about waiting for a response if the 
command is successfully sent. The blocking case will sit and spin for a 
reply, the non-blocking assumes success and expects an asynchronous 
error report on failure. The assumption being that the call can't fail 
unless something is already broken - i915 sending invalid data to GuC 
for example. And thus any failure is in the BUG_ON category rather than 
the try again with a different approach and/or try again later category.

This is the point of the change. We are currently getting timeout errors 
when the H2G channel has space so the command can be sent, but the 
channel already contains a lot of slow operations. The command has been 
sent and will be processed successfully, it just takes longer than the 
i915 timeout. Given that we don't actually care about the completion 
response for this command, there is no point in either a) sitting in a 
loop waiting for it or b) complaining that it doesn't happen in a timely 
fashion. Hence the plan to make it non-blocking.

>
> Anyway, it sounds okay to me to use the non-blocking, but I would like 
> to see some logging if the unexpected does happen. Hence I was 
> suggesting the option of adding drm_notice logging if the send fails 
> from the worker. (Because I think other callers would already 
> propagate the error, like sysfs.)
>
>   err = slpc_force_min_freq(slpc, slpc->boost_freq);
>   if (!err)
>        slpc->num_boosts++;
>   else
>        drm_notice(... "Failed to send waitboost request (%d)", err);
The only error this should ever report would be EBUSY when the H2G 
channel is full. Anything else (ENODEV, EPIPE, etc.) means the system is 
already toast and bigger errors will likely have already have been reported.

As above, maybe this should be looping on the EBUSY case. Presumably it 
is safe to do so if it was already looping waiting for the response. And 
then printing a notice level warning on more catastrophic errors seems 
reasonable.

John.

>
> Something like that.
>
> Regards,
>
> Tvrtko
>
>
>>> Even if we soften the blow here, the actual timeout error occurs in 
>>> the intel_guc_ct.c code, so we cannot hide that error anyways. 
>>> Making this call non-blocking will achieve both things.
>>>
>>> Thanks,
>>>
>>> Vinay.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 
>>>>> ++++++++++++++++-----
>>>>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> index 1db833da42df..c852f73cf521 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc 
>>>>> *slpc)
>>>>>       return data->header.global_state;
>>>>>   }
>>>>>   +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, 
>>>>> u8 id, u32 value)
>>>>> +{
>>>>> +    u32 request[] = {
>>>>> +        GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>>>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>>>>> +        id,
>>>>> +        value,
>>>>> +    };
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>>>>> +
>>>>> +    return ret > 0 ? -EPROTO : ret;
>>>>> +}
>>>>> +
>>>>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, 
>>>>> u32 value)
>>>>> +{
>>>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>>>> +
>>>>> +    GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>>>> +
>>>>> +    return guc_action_slpc_set_param_nb(guc, id, value);
>>>>> +}
>>>>> +
>>>>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 
>>>>> id, u32 value)
>>>>>   {
>>>>>       u32 request[] = {
>>>>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct 
>>>>> intel_guc_slpc *slpc, u32 freq)
>>>>>        */
>>>>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>>> -        ret = slpc_set_param(slpc,
>>>>> - SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> -                     freq);
>>>>> -        if (ret)
>>>>> -            i915_probe_error(i915, "Unable to force min freq to 
>>>>> %u: %d",
>>>>> -                     freq, ret);
>>>>> +        /* Non-blocking request will avoid stalls */
>>>>> +        ret = slpc_set_param_nb(slpc,
>>>>> + SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> +                    freq);
>>>>>       }
>>>>>         return ret;
>>>>> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct 
>>>>> *work)
>>>>>        */
>>>>>       mutex_lock(&slpc->lock);
>>>>>       if (atomic_read(&slpc->num_waiters)) {
>>>>> -        slpc_force_min_freq(slpc, slpc->boost_freq);
>>>>> -        slpc->num_boosts++;
>>>>> +        if (!slpc_force_min_freq(slpc, slpc->boost_freq))
>>>>> +            slpc->num_boosts++;
>>>>>       }
>>>>>       mutex_unlock(&slpc->lock);
>>>>>   }
>>

