Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5E619F1D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F1C10E976;
	Fri,  4 Nov 2022 17:46:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ECF10E974;
 Fri,  4 Nov 2022 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667583965; x=1699119965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UNsom9Az1nUXARUsUlL5lijjn28pSG1cQG11wWlBqz4=;
 b=I84hJiWQSsrFMgYZjJ2DHRianxXHYmXHuwlVO38GArT1DqTTUmGHOs3S
 buKo1N5CUbD4jrlpmV+fj4mzYo+qsZpz+5r8GE1Eo2QkLAcNs+dWOdP9G
 x9uctFW/R9QDTqH9tZc1SLy2zij5TnlO+QDLWJyyXshjIx0dimxdy6k86
 ALIOHX3iH2F0l77BH6AvPeSmg5mqEiWXNGYdvMWHbC4LXplMC0TE0S32p
 xxwh3kuRH5hrlhpRKIqzGwYKH8qk4CV8S7ej9He615p6pQ40tHJzC077A
 O1RXg3hrshUjTlJU/1LxxNWk+TQQjtya/o1YQm4sUNtUlQAADWnKx/afz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="290416729"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="290416729"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="629800930"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="629800930"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 04 Nov 2022 10:46:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 10:46:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 10:46:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 10:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrOmwMfAto7S7LIN7CPDGIdChxBCoQBu3VEvGu18VcdGYh9Cv4VJKXjpi3zY6Ogq7/v4vkcFBOgUPtRoao2UdLyHX8A0eGOcgLirsAj39Fth0ud2A4DHWrZ1qLX8VHd6Hzs7ZDdnhYSkl5wE4Ie3JgxF4mZElnpqkMFjo9zsVnuVEv7mEAQqw7NS/NRyHgixAEPXA31PpWC4Ax7CUtAbnoERlwi/2AJ9W+mB3emopSSnSf2U2T8PLy3ETm4cECXJbC4ALxIbPsBEZqSL/k7zhrhG5w0wtkVYQcU97jidUGexNt7WuziV0Xf7lmzCiWhGrDOs5Aq5zLMvja6VuRipoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/fZXnHnZCR+79th7bIYJNsuemsxxKWL+INZnW4tL0g=;
 b=eRh/WE7KMh9+YYXrofYMIjfoM4ysOaAbaBf8ilbQlwmV/RrjNKUg9hJzq0V0tBis0z6mwQTKloNIxBniwwF1l2vfJGT2EaWtdpOv5cErmaLRYIynRfuRLKYztMKKXmDviNKJrflrQ67DKEGJH5YyPGYEKLY89aqi8CiBRYw+5QoiG4RiXkJ/48cS4VX0WU+q8STs+X5+/+3Rc5eYCeZJndPb+v+BRRBfYi6i4IvCvn3JXjyke5XXuRFWIEPl/w0b++zho96UnLxCp4pGGswK0jWOFjr5jyx/Z0pZ2nyFsLfGj+flnOprEExnsPQDtB+D5TYwm1hnH8kgxJenHc0yaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23; Fri, 4 Nov
 2022 17:46:02 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 17:46:02 +0000
Message-ID: <f3de3596-871a-2af3-e72b-f4c66d5e7211@intel.com>
Date: Fri, 4 Nov 2022 10:45:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
 <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
 <2b2eb780-08f7-c7df-0397-a7f732da272d@linux.intel.com>
 <5fad1ec1-8fea-9685-4cc9-2e3c2edf799f@intel.com>
 <448d710a-3af1-932d-c276-7c6fd6c02528@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <448d710a-3af1-932d-c276-7c6fd6c02528@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f96b0e8-f60f-4fce-605a-08dabe8c7070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZRp2S20iD6tWY7gT5zo4wBKO4i9UTMMnW/es1VYxJWb6HEsSxArCLUvKVT5ZMDtX4Dwdmwu3wdiM9hDhkkQo4Mlyg7iE6SyFk31Lo1P8N49XK9eut3PzD6G3G/iI3+GBZgCcf120+QnHp84aUcEt3XAO044Y+J24duoZ7nLWjdODow/gQa7RS89UmH3VeF5ads92pGzEt98wJWHEuc4VBYxkgCEBPUsnsfvDDeWbLZlq5Yte/RXyZJCNCxTm/k+Na7x6NsRYwr0oNaI2Qr37/bKIyO3cO353AbOiJLo8FI4B4zsR8yAqXWa4ujJrgWjyJ5BgE7/82tCfu3b0dAvPClwsiZgZdQiNhqZP14kmYaNEoNfeyeBzOEeE/UL0jayPnQhshLOZWcKpkSLDp9cYYIoFraQmK3XB51BmNSTy4hAE44oauTayQKWcpsF6hiQe1FBB1ira/Kla8+Rg8yJifLn9jk7ABPkIHPT9O+/PzQaFDsHNwT60Mjt95I6mUHD8khx5fVfxYY4kLNl1YcGJeydzerqWBjP6nreuPOgd68+3oFlZXJnWnvYTrRcDamIQFaKAos0pQp01H+fAXE5UVWjVytv8jkumgTYGLH4Wiwmu37/Fb0JjRiglJlIw9C7JTSGSuzSNBsjP7eLYtUbEkbHb8SDWM8gLbH9uiYWAz02u4ETGluZ7kSy2twdl0kQrS5vfx6BOxmNTU9BPBVHxr7zGgKYxqfULyVmKfvFNuA7iGEHf53VDH6Er9W46Ebx4S3GGqx0ejN0Si8qMC6EO/1FndAEr7+4XA3XLHML4V+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199015)(86362001)(31696002)(316002)(83380400001)(36756003)(8936002)(53546011)(66556008)(5660300002)(30864003)(2616005)(2906002)(66946007)(6506007)(66476007)(6512007)(26005)(8676002)(41300700001)(4326008)(186003)(31686004)(6486002)(478600001)(82960400001)(110136005)(38100700002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjNrNUkzSW1jRW1sNUVJbVJPSkN4VU5RbWFKbG5NZ1JOdlFqb05DTnJQWmNz?=
 =?utf-8?B?c2JtZkkycE9QRit0L1RySUpoYWd1L29rT2xJdFZxdEJoNVlGODVtWWlJVGtC?=
 =?utf-8?B?NVVuWTVhdUhyR2NhODluR2YrQmNtYWNuTXlVKzR3bmY0S1l5YVhCN2JkNWhH?=
 =?utf-8?B?d0gxcFVuUU9PVTdEZzB6WnhYaFJjZFVDZkQzN3ZtcW0xdE1JMm1DMEJqSFoz?=
 =?utf-8?B?bHh5UWFQaDRHaXc3QkpNMHI0cThTTGdsL1VxWG5KY1laSTFsWjlQdEVpS3Y2?=
 =?utf-8?B?YWxHUXdEOVNlR1kyU243RytodmZKenl0NUZBUmIrYm9qTngyTE9EcE54ZU1v?=
 =?utf-8?B?em5jV1dkTURTWDViaW84Q3BGTjFRQmlmbW5aU1llblpPL3dCcmZXRmR1bnBR?=
 =?utf-8?B?TjRRVjQramZOWWpPdU1wRVErQU9NeHdkeFZIeTkxNVRsaVhEUkJtSlZNa2hx?=
 =?utf-8?B?MjVnMVlzWkozaEpGdTVMSThURnpyYkl6eS9HdHAzZzBqT0ZjdFg1SGVaZmVK?=
 =?utf-8?B?cERBVWs2NnFTelppNEhLVGxRNFBqaUN4VHZuc2xQa1Jkakpkbm9yTmR6bm82?=
 =?utf-8?B?My84TEJvYWlxekJGRDVwTnVkQzRQV0RtdkJSdFZETUpNZTRIMHFyMWNsaXFh?=
 =?utf-8?B?NkxqNVFES3Z0d3pwd1JvT2p0RFpoelZtUk5ONTJUSjFJTE0wUGZFV0lMcnRs?=
 =?utf-8?B?ZjZRRVU4M2dJUE8wWUdNS1UrZHZjNnVoSlZKUHZJWmFsSjZISTE1dWwwQzNZ?=
 =?utf-8?B?TXVwYXlyYWw1QkFHbi8zRjI1dGVqSEpQRUNhSU1HaVNJa1F4b1dETENoVDFV?=
 =?utf-8?B?UzMzQndGS2kwUkVuQWpuUVhCMk1mR0FjSWdUNmVTOCtzcGpCZHdycFhDazFp?=
 =?utf-8?B?REljMys5em1EZFpnemlaeWJKcjVLYWRvQ2IzMTlZeDROc0JYUUFUOXEwcW03?=
 =?utf-8?B?U1dqd2htbmZWY0F0d01Lbjl4ZTNNVGR1ODRBUzhZRGNvdFJuei9hOUI0aHJP?=
 =?utf-8?B?WjJIT00vdWpuUDN4ZXdmc0dsQ2JDZGU3b3hnMWhlelFQUFVTM3ZYeXExTWhI?=
 =?utf-8?B?UHhkNEJoUEhpTXJmVExjY3YwSjg0KzZ0eCtERWhKcjJ4VWtPQXpReEUyaW16?=
 =?utf-8?B?R0lVT2M1dzRMMUUxb0hzMUcwRDBodWswZ1B6RS9hK3lUMjh4Y0gremxETHNG?=
 =?utf-8?B?TC90ZmlZMUd6eXMybTFtTzNRdG9iUEY3aWltdFBsdDhqUXNzSHU4RnZ4NEhJ?=
 =?utf-8?B?Z0pwSHVPOXJkQkZndUxjZmhPM0V4YWRybnJ0Y0hwcXkyQ1JZNVkyNXYva0Y1?=
 =?utf-8?B?dUdITW5DNTBKWUlIZWloUTUxSDd5bFFFM2U3MmYwZm1leUNmNkFtTVNvYnlL?=
 =?utf-8?B?QmU5NHpTTXZyRFdzWllkdXZ0R3pqWjIzQ3I4VSsyTlFla0xVbUkvalQ1bHFm?=
 =?utf-8?B?T1RUZTMyeG1CdU1kVndteHp4QzN5MmNCTE1VMVVXaSt5eTJ2YTF1UlBicjdP?=
 =?utf-8?B?OVFPcDhteDR6eWNRRGF6MXFiQ1ZMZVF4RlJDM0l2MUYxZHF4Q2lEcWsvNnBP?=
 =?utf-8?B?TERYUGNpT1JVU2xsN0dWVGxvOFJkVmJvRFY3TmgrRjA1OUVNbS9SVWorOWd2?=
 =?utf-8?B?QmxNYTZLcGROM09CVEpNb0poNVFxNkZpK2Y3THJxT3FaZjNqY29xNEJrU1ht?=
 =?utf-8?B?Y3ZxcXZNUGJNSTgzZnA0MFdSS1NxMmsrTkEvY2UrdFRSbFFnMkx5elM4MFJV?=
 =?utf-8?B?MS80QU9oVjlwd1lyTWJDanB1amtMZVBTcWUwTXdmMDh2V0tvVm95THkxOGd1?=
 =?utf-8?B?NHBBN3NVZmg2NVR2SElUdThOQTJCNkVuYWZxNDFjMGx3QXBNc214VUQzRk4w?=
 =?utf-8?B?NCtYREtIdUllK1owWW9WTmkvUjFiNHJmaUlWOW8vZVdnU1A1c3dMMmlXNnhh?=
 =?utf-8?B?OU44dXk5dWdWN3FucFN5WDdNWUo4NkhaUm8yK09QckRMQ254bEpmUCtac0o0?=
 =?utf-8?B?byt6VmFEbXkwQjlxUHN6eE8wNXQwcHNlaUpJS0hFUXZMckFVMmhGNTIyZXVi?=
 =?utf-8?B?ZVIraVZXSStXbGpEYlNsN3hSMkJVZkRSS09TUlVOVVJmQlFPbVM3QzdWSkFw?=
 =?utf-8?B?dFdEUGhIaWEvbFlTZlMxYWVydGMvZHF1cFg5TVNzU3BFODhPMCtwMUYrWFlI?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f96b0e8-f60f-4fce-605a-08dabe8c7070
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 17:46:02.0114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDECA7io2UL7YSe/mEl+OT11qEdmxF+GL9YxbCRGFaKLwTPT1WCjy+YbuurXVwHVZhKfeQTaqfuUm64X5VePQonFJx7gqitKXuS/r0OBJR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/2022 03:01, Tvrtko Ursulin wrote:
> On 03/11/2022 19:16, John Harrison wrote:
>> On 11/3/2022 02:38, Tvrtko Ursulin wrote:
>>> On 03/11/2022 09:18, Tvrtko Ursulin wrote:
>>>> On 03/11/2022 01:33, John Harrison wrote:
>>>>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>>>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>> At the end of each test, IGT does a drop caches call via sysfs 
>>>>>>>> with
>>>>>>>
>>>>>>> sysfs?
>>>>> Sorry, that was meant to say debugfs. I've also been working on 
>>>>> some sysfs IGT issues and evidently got my wires crossed!
>>>>>
>>>>>>>
>>>>>>>> special flags set. One of the possible paths waits for idle 
>>>>>>>> with an
>>>>>>>> infinite timeout. That causes problems for debugging issues 
>>>>>>>> when CI
>>>>>>>> catches a "can't go idle" test failure. Best case, the CI 
>>>>>>>> system times
>>>>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>>>>> reboots the system to recover it. Worst case, the CI system 
>>>>>>>> can't do
>>>>>>>> anything at all and then times out (after 1000s) and simply 
>>>>>>>> reboots.
>>>>>>>> Sometimes a serial port log of dmesg might be available, 
>>>>>>>> sometimes not.
>>>>>>>>
>>>>>>>> So rather than making life hard for ourselves, change the 
>>>>>>>> timeout to
>>>>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>>>>> working system (if possible).
>>>>>>>>
>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>>> @@ -641,6 +641,9 @@ 
>>>>>>>> DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>>>>             DROP_RESET_ACTIVE | \
>>>>>>>>             DROP_RESET_SEQNO | \
>>>>>>>>             DROP_RCU)
>>>>>>>> +
>>>>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>>>>>
>>>>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also 
>>>>>>> only used
>>>>>>> here.
>>>>>>
>>>>>> So move here, dropping i915 prefix, next to the newly proposed one?
>>>>> Sure, can do that.
>>>>>
>>>>>>
>>>>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>>>>> gt/intel_gt.c.
>>>>>>
>>>>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>>>>
>>>>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in 
>>>>>>> intel_gt_pm.c.
>>>>>>
>>>>>> No action needed, maybe drop i915 prefix if wanted.
>>>>>>
>>>>> These two are totally unrelated and in code not being touched by 
>>>>> this change. I would rather not conflate changing random other 
>>>>> things with fixing this specific issue.
>>>>>
>>>>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>>>>>
>>>>>> Add _MS suffix if wanted.
>>>>>>
>>>>>>> My head spins.
>>>>>>
>>>>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT 
>>>>>> applies to DROP_ACTIVE and not only DROP_IDLE.
>>>>> My original intention for the name was that is the 'drop caches 
>>>>> timeout for intel_gt_wait_for_idle'. Which is quite the mouthful 
>>>>> and hence abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised 
>>>>> later that name can be conflated with the DROP_IDLE flag. Will 
>>>>> rename.
>>>>>
>>>>>
>>>>>>
>>>>>> Things get refactored, code moves around, bits get left behind, 
>>>>>> who knows. No reason to get too worked up. :) As long as people 
>>>>>> are taking a wider view when touching the code base, and are not 
>>>>>> afraid to send cleanups, things should be good.
>>>>> On the other hand, if every patch gets blocked in code review 
>>>>> because someone points out some completely unrelated piece of code 
>>>>> could be a bit better then nothing ever gets fixed. If you spot 
>>>>> something that you think should be improved, isn't the general 
>>>>> idea that you should post a patch yourself to improve it?
>>>>
>>>> There's two maintainers per branch and an order of magnitude or two 
>>>> more developers so it'd be nice if cleanups would just be incoming 
>>>> on self-initiative basis. ;)
>>>>
>>>>>> For the actual functional change at hand - it would be nice if 
>>>>>> code paths in question could handle SIGINT and then we could punt 
>>>>>> the decision on how long someone wants to wait purely to 
>>>>>> userspace. But it's probably hard and it's only debugfs so whatever.
>>>>>>
>>>>> The code paths in question will already abort on a signal won't 
>>>>> they? Both intel_gt_wait_for_idle() and 
>>>>> intel_guc_wait_for_pending_msg(), which is where the 
>>>>> uc_wait_for_idle eventually ends up, have an 'if(signal_pending) 
>>>>> return -EINTR;' check. Beyond that, it sounds like what you are 
>>>>> asking for is a change in the IGT libraries and/or CI framework to 
>>>>> start sending signals after some specific timeout. That seems like 
>>>>> a significantly more complex change (in terms of the number of 
>>>>> entities affected and number of groups involved) and unnecessary.
>>>>
>>>> If you say so, I haven't looked at them all. But if the code path 
>>>> in question already aborts on signals then I am not sure what is 
>>>> the patch fixing? I assumed you are trying to avoid the write stuck 
>>>> in D forever, which then prevents driver unload and everything, 
>>>> requiring the test runner to eventually reboot. If you say SIGINT 
>>>> works then you can already recover from userspace, no?
>>>>
>>>>>> Whether or not 10s is enough CI will hopefully tell us. I'd 
>>>>>> probably err on the side of safety and make it longer, but at 
>>>>>> most half from the test runner timeout.
>>>>> This is supposed to be test clean up. This is not about how long a 
>>>>> particular test takes to complete but about how long it takes to 
>>>>> declare the system broken after the test has already finished. I 
>>>>> would argue that even 10s is massively longer than required.
>>>>>
>>>>>>
>>>>>> I am not convinced that wedging is correct though. Conceptually 
>>>>>> could be just that the timeout is too short. What does wedging 
>>>>>> really give us, on top of limiting the wait, when latter AFAIU is 
>>>>>> the key factor which would prevent the need to reboot the machine?
>>>>>>
>>>>> It gives us a system that knows what state it is in. If we can't 
>>>>> idle the GT then something is very badly wrong. Wedging indicates 
>>>>> that. It also ensure that a full GT reset will be attempted before 
>>>>> the next test is run. Helping to prevent a failure on test X from 
>>>>> propagating into failures of unrelated tests X+1, X+2, ... And if 
>>>>> the GT reset does not work because the system is really that badly 
>>>>> broken then future tests will not run rather than report erroneous 
>>>>> failures.
>>>>>
>>>>> This is not about getting a more stable system for end users by 
>>>>> sweeping issues under the carpet and pretending all is well. End 
>>>>> users don't run IGTs or explicitly call dodgy debugfs entry 
>>>>> points. The sole motivation here is to get more accurate results 
>>>>> from CI. That is, correctly identifying which test has hit a 
>>>>> problem, getting valid debug analysis for that test (logs and 
>>>>> such) and allowing further testing to complete correctly in the 
>>>>> case where the system can be recovered.
>>>>
>>>> I don't really oppose shortening of the timeout in principle, just 
>>>> want a clear statement if this is something IGT / test runner could 
>>>> already do or not. It can apply a timeout, it can also send SIGINT, 
>>>> and it could even trigger a reset from outside. Sure it is debugfs 
>>>> hacks so general "kernel should not implement policy" need not be 
>>>> strictly followed, but lets have it clear what are the options.
>>>
>>> One conceptual problem with applying this policy is that the code is:
>>>
>>>     if (val & (DROP_IDLE | DROP_ACTIVE)) {
>>>         ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>>         if (ret)
>>>             return ret;
>>>     }
>>>
>>>     if (val & DROP_IDLE) {
>>>         ret = intel_gt_pm_wait_for_idle(gt);
>>>         if (ret)
>>>             return ret;
>>>     }
>>>
>>> So if someone passes in DROP_IDLE and then why would only the first 
>>> branch have a short timeout and wedge. Yeah some bug happens to be 
>>> there at the moment, but put a bug in a different place and you hang 
>>> on the second branch and then need another patch. Versus perhaps 
>>> making it all respect SIGINT and handle from outside.
>>>
>> The pm_wait_for_idle is can only called after gt_wait_for_idle has 
>> completed successfully. There is no route to skip the GT idle or to 
>> do the PM idle even if the GT idle fails. So the chances of the PM 
>> idle failing are greatly reduced. There would have to be something 
>> outside of a GT keeping the GPU awake and there isn't a whole lot of 
>> hardware left at that point!
>
> Well "greatly reduced" is beside my point. Point is today bug is here 
> and we add a timeout, tomorrow bug is there and then the same dance. 
> It can be just a sw bug which forgets to release the pm ref in some 
> circumstances, doesn't really matter.
>
Huh?

Greatly reduced is the whole point. Today there is a bug and it causes a 
kernel hang which requires the CI framework to reboot the system in an 
extremely unfriendly way which makes it very hard to work out what 
happened. Logs are likely not available. We don't even necessarily know 
which test was being run at the time. Etc. So we replace the infinite 
timeout with a meaningful timeout. CI now correctly marks the single 
test as failing, captures all the correct logs, creates a useful bug 
report and continues on testing more stuff.

Sure, there is still the chance of hitting an infinite timeout. But that 
one is significantly more complicated to remove. And the chances of 
hitting that one are significantly smaller than the chances of hitting 
the first one.

So you are arguing that because I can't fix the last 0.1% of possible 
failures, I am not allowed to fix the first 99.9% of the failures?


>> Regarding signals, the PM idle code ends up at 
>> wait_var_event_killable(). I assume that is interruptible via at 
>> least a KILL signal if not any signal. Although it's not entirely 
>> clear trying to follow through the implementation of this code. Also, 
>> I have no idea if there is a safe way to add a timeout to that code 
>> (or why it wasn't already written with a timeout included). Someone 
>> more familiar with the wakeref internals would need to comment.
>>
>> However, I strongly disagree that we should not fix the driver just 
>> because it is possible to workaround the issue by re-writing the CI 
>> framework. Feel free to bring a redesign plan to the IGT WG and 
>> whatever equivalent CI meetings in parallel. But we absolutely should 
>> not have infinite waits in the kernel if there is a trivial way to 
>> not have infinite waits.
>
> I thought I was clear that I am not really opposed to the timeout.
>
> The rest of the paragraph I don't really care - point is moot because 
> it's debugfs so we can do whatever, as long as it is not burdensome to 
> i915, which this isn't. If either wasn't the case then we certainly 
> wouldn't be adding any workarounds in the kernel if it can be achieved 
> in IGT.
>
>> Also, sending a signal does not result in the wedge happening. I 
>> specifically did not want to change that code path because I was 
>> assuming there was a valid reason for it. If you have been 
>> interrupted then you are in the territory of maybe it would have 
>> succeeded if you just left it for a moment longer. Whereas, hitting 
>> the timeout says that someone very deliberately said this is too long 
>> to wait and therefore the system must be broken.
>
> I wanted to know specifically about wedging - why can't you 
> wedge/reset from IGT if DROP_IDLE times out in quiescent or wherever, 
> if that's what you say is the right thing? 
Huh?

DROP_IDLE has two waits. One that I am trying to change from infinite to 
finite + wedge. One that would take considerable effort to change and 
would be quite invasive to a lot more of the driver and which can only 
be hit if the first timeout actually completed successfully and is 
therefore of less importance anyway. Both of those time outs appear to 
respect signal interrupts.

> That's a policy decision so why would i915 wedge if an arbitrary 
> timeout expired? I915 is not controlling how much work there is 
> outstanding at the point the IGT decides to call DROP_IDLE.

Because this is a debug test interface that is used solely by IGT after 
it has finished its testing. This is not about wedging the device at 
some random arbitrary point because an AI compute workload takes three 
hours to complete. This is about a very specific test framework cleaning 
up after testing is completed and making sure the test did not fry the 
system.

And even if an IGT test was calling DROP_IDLE in the middle of a test 
for some reason, it should not be deliberately pushing 10+ seconds of 
work through and then calling a debug only interface to flush it out. If 
a test wants to verify that the system can cope with submitting a 
minutes worth of rendering and then waiting for it to complete then the 
test should be using official channels for that wait.

>
>> Plus, infinite wait is not a valid code path in the first place so 
>> any change in behaviour is not really a change in behaviour. Code 
>> can't be relying on a kernel call to never return for its correct 
>> operation!
>
> Why infinite wait wouldn't be valid? Then you better change the other 
> one as well. ;P
In what universe is it ever valid to wait forever for a test to complete?

See above, the PM code would require much more invasive changes. This 
was low hanging fruit. It was supposed to be a two minute change to a 
very self contained section of code that would provide significant 
benefit to debugging a small class of very hard to debug problems.

John.


>
> Regards,
>
> Tvrtko
>
>> And if you don't wedge then you don't recover. Each subsequent test 
>> would just hit the infinite timeout, get killed by the CI framework's 
>> shiny new kill signal and be marked as yet another unrelated bug that 
>> will be logged separately. Whereas, using a sensible timeout and then 
>> wedging will at least attempt to recover the situation. And if it can 
>> be recovered, future tests will pass. If it can't then future testing 
>> will be aborted.
>>
>> John.
>>
>>
>>> Regards,
>>>
>>> Tvrtko
>>

