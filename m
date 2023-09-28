Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7CD7B1E16
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400610E65B;
	Thu, 28 Sep 2023 13:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935A10E65C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 13:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPK62yH00ewO7GD7aLDO7fvmxq4Gh2j3Ogpz979S1I2kvDAoWZujhZbFl12MBfKDM9vMmQTnqAKz4wd9fgKd0L3dUzYwKZjvUdR/kdBLRDx/aIT/ceSwXr5bU04I9LLiFaQ1AKgiVcPVa6odOA8NDYl8dNXElh0/IdChMWQcw/zPBc9p7V1AC6K3L6GlGOhYjMZHwoQg7eGdi4PFPIcIo/RNizkqckiTYFgXfsd+feXPWoaNjDe/bHtY3qPykrmBfCdumW4bPEFkbCAbG935rqDmOLoq5l+QPeOoT/gEQXfdmArVo/Vknnpo3/4NidMgUxZtQi+ACCtT4rzEdSZaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LC7d/Jk6i96/5SCtPSk/SCMVL84CJBV40hMkhUXKT4=;
 b=eZGPhGbxxP/ezn55nqfoWIT1Vh9ZQhyV8bcF/LgvZMbXBIFz7h1HuFLtMlkLQ5KOontoJjMRjzwSMpkSllWoG6nbldwOETiypZkf49V8GeBUs4LPDEak4TS0QWYdqo9pW20E9CqaUUYTtO8lFM8s/Y/KvIxHVmQyW0rkFs8fER5aZi8eKBeYE7RlHBSyYdWrYe8wj7xFfX8Gu5qpssUsaBASzck/xPBr6E/D26DEaL/l+cDR5jDBH+HgqQ9GCUnlYfuPPP6HrH1b2fO5zvIbyY+3fnyMvKRz1/uS/xGqKJRI54YUZpM2K7x0Ubd0NAQEsDLxm1jKj/NxH0I3HMwTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LC7d/Jk6i96/5SCtPSk/SCMVL84CJBV40hMkhUXKT4=;
 b=r+fYXV+L+3XzfN0lzYLHjP9RN7IX2gJS5YFxP/ufX3E8notC3TscOuU5eYpfuNwom5/e/s0Ma+1ukMaGEyWYoxoo7wxGFD02IXrllmzhLd2k2vILZw07OLBRWXfAp4aWd2mhmIxwBdxHaCxaN+B6L3CbE6VclQEPOCF/IwS34+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 13:24:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 13:24:00 +0000
Content-Type: multipart/alternative;
 boundary="------------oB8eCBnb2HCYST5OUZLAVlxf"
Message-ID: <e0d0e283-fab3-b023-ecdc-89e5cc913da3@amd.com>
Date: Thu, 28 Sep 2023 15:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2c0159-fc46-462f-3f0a-08dbc0262cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxvbfKDi62qUxlKMK14nh3/U/thoBzTWw+LCfooIhNCKkru10YBNUJ4RCQawYy/Trfd/X9qY5AS+5y+Y5MRKtG6Oqx7VCIvvvW8f4pWXLgrYB1Bo23KKV5kO7/+lVJ3SklS2qYOvsCfasCzONX/YEMNMGuHrYUokef3Oee6LZCdS+I1H6xsoicb1nanO/c+QXcgi4kENpnwXyU5OR828r0dQx1qc/686nD3Cpg479nd040C6ZJ5CelYWyvk++NWQdp14bW8HZqUQ95NcuIJSmfLONPXWvLPF3tB5pMx5xr5zDaY0339kqpQ5H6AnkL2g7GS9kYSUksn9pnegoT3YaxbAEQ/3kiTsM/Sqg0xRIg1Qa9pJUSwNYRWiswKLJqoKdV71vSH618b5cC75g6gekpUq+zf7422VcRJpXM+sq4kNLe/21j933uALU/JXNecxRDd9B7c26K3L5Vh3Cids3ecrDVDh8qknDZ1HgXzwL8s+HmQaI5SeGr1KF8tMCLpfNmGcsdlDb3Lpp/JRaJ622TXsZgE+4oF32Q0Deh8jFJkkyYrI0Zs1YUR2sDytI8v5TBJarp90bM9JAc0sEuPut8M9jOXwj7njcOVKN+svX4jw3uq7RT3T1xz4KUEhbaZWoK5OFbU6fnph5sE2jGzIZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66899024)(2906002)(30864003)(6666004)(53546011)(33964004)(6486002)(6506007)(478600001)(83380400001)(66574015)(6512007)(26005)(2616005)(66946007)(66556008)(66476007)(8676002)(8936002)(4326008)(41300700001)(316002)(6916009)(31686004)(5660300002)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXpHQWE2dzFUOENBM0poWmxQSmdnQWljbFVvVlJLTkoxT2NwSVhSZ3ZsMWhN?=
 =?utf-8?B?UzY0WWdTYmFMV3lLRjd3NGNxam5tbWdPajJ1UHZRSkZXZ0FlaWNiTUgzQnpm?=
 =?utf-8?B?YUJRNjgwVFcweFJ1YzMvWmNVaW54dUtpdVArM2pJeExsK3YzWXAwQ2tTM1hU?=
 =?utf-8?B?L0xGeHF5a0lVMnIrME5uY0ZYWkZBK3JHVDBEbldXNVpuRFJTQktaRkFGT2dN?=
 =?utf-8?B?NFVWc1JzL2xRR1FkOE1SMWtTOW4yY0dBQWQxNXg0ajVKY29RZ3g5Z1AzU1lK?=
 =?utf-8?B?b2diTHhHaFRqS01ZTjdBYjJRZm5zc3lZam1Wa1FFdnN2QS9sZ2tkZThMOGt3?=
 =?utf-8?B?SE9ETW9PczJKL2FQSjdkeisvZ09rczllNHM2clpiM2hKRFpCdlB1bGFmb2pw?=
 =?utf-8?B?WDFZYnFpdmk4dy9IQ1d6cnYxZU05ZlBTc2ZiRXlUY0N5anhpc05pcW50ZDZJ?=
 =?utf-8?B?OS9tQ3ZmczExWVJ5RmhZWThlL2tjMWF1c1lSbTN3dkxlOWc0WDFNR1YyanFW?=
 =?utf-8?B?Z3lMbXVpY2QvRHJCSzhOdEtvNHJLSW92MHJtd05VUXFqZUc4UXdwQ0FqZGZW?=
 =?utf-8?B?cGtuNWwrbC9mNklCcTRTM2gvUXpQRWFTejF4TWxYVWJXRW01NmlnTmxVYzY5?=
 =?utf-8?B?cTJGQkVKOU14QmVOK3ZsV3VkOWM3NzN4R2tjek5kRHdPUmxiT0xmSTl6ZFBK?=
 =?utf-8?B?aVBrUmh5cSsrTnBSelJzVEs5a1czM0U3eWQwL1Z1UFFwNkFLS3hSWHp3WVBL?=
 =?utf-8?B?eWlkTWdpQU9ySTZnSnRmMVhKZXlKK2RZdTFIRTg1RkpCZnlpWHUwYkovcG5h?=
 =?utf-8?B?OTRhOVRRTFVzazFrVGRROU80bi9GRC9Vd3VONlo5djloMnpKZzdxSnhPdHIr?=
 =?utf-8?B?SFNaK3pNb2F4Yi9xSks1WDk5dXBGdGdBc1E2WG5LUFZPRmpuZTlwSlJNcE1i?=
 =?utf-8?B?WDU4WFdQRDZHMlZIVWhzZnQzcW5VbUZPbmRHKy8zeFkzaUx5SWF0MXRFcnZE?=
 =?utf-8?B?R1ZGdE9DNWNFU0MyQkRJb1dCOTBLV2ZUSHRYdXh4V21HL1k2bURQTGpUN2tq?=
 =?utf-8?B?ZDhNUC9uZEFEQitBMldBRzdQNHN0UkFUajlPcU4xZ0VYajdyTmdGdUMrdWhQ?=
 =?utf-8?B?d29iOFM3NHR3Z2FOd1dBbE9RdDVNcmRZL1ZwY0ZIcVZCY2N5SlF6TFk4OWdI?=
 =?utf-8?B?dWFqQnFKTGE2YTdla0EwME42dXc2THQyejNKbU5sd1ZsVHFZTVhzMHp0amF5?=
 =?utf-8?B?c1ZRdGxUdjlwU0VIVVgzMGtGZjRodFF2UlErdWdyaVhvMFhETml3YTIyR1FW?=
 =?utf-8?B?SStROTBqL3dZU3ZlRDY2SGNEV0lia0ZhMDBFUURmUFBiazRHWkZRakZLbFRS?=
 =?utf-8?B?eEx4QTRYQy94UXRpN0F3anI2cHJjb1J4Z29oVlpLbjd5bDZnUHlRczZBQ1V4?=
 =?utf-8?B?a091eGpoNjAraUFrUStreU1QWUZwMVprWVZRRFU3RWdBeE04Mkk4MGRiZytC?=
 =?utf-8?B?QTQrb1pNVklBSjZuSnczQ2dNOWFuZ1NIWHJheis3elZJaVV1ZjVRbklRem9j?=
 =?utf-8?B?UWRoeFFiYm1zQUF2aExJOUt5S2dTcU5KcDFGRFNEVm9YTWJKVWNmdWZkRUMx?=
 =?utf-8?B?dXVIN3hBTUVkVGRYN2dzV0FRRE5Gck5JUDVpV2FJY1d0dS9oU2ZZaDg2VFBU?=
 =?utf-8?B?TG5mVGQ1UU9ob05xTkdRY2QvNFY4ZmNwL21pWCtXelpvSUsxVVBVemxtUjFI?=
 =?utf-8?B?Q0hYdUhNRVNmM29MUFl0d3Nnc1orYVdrcmo5TmVETFpndjF6aWJwNDMvaWlW?=
 =?utf-8?B?bXR4ZSt2QXA1SzhLRWRObEU0QWg5NjNGZnlnL25WbVZGRktoRFlXNkVmVFhs?=
 =?utf-8?B?YmVFZ0R1L3NDOUN5bUZMR1phblRZVzRjSHZlWnV1eDF6MVRMcit0UGx2Qyt4?=
 =?utf-8?B?ZmxTNjFWSnQ0Nk9CbjFVQjFDOUVRbERTTlN4MVR1dlkzVEVPUlRjMnhWcm9h?=
 =?utf-8?B?R01lWGtBZFNhNHZMcmt5TXI1WVpSSXhUMDd3UWVUVHZhOXMyL05zZ05WRkJE?=
 =?utf-8?B?UXEzUTdXMU5VV1ZrWHFOQTFLTmN1S1RhM2NabFFwaE9RYU9NVFY0M285SzFn?=
 =?utf-8?Q?4yZszyUfRghwE2wbpAzTDh5DD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2c0159-fc46-462f-3f0a-08dbc0262cf3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 13:23:59.9682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NhX/dgqo+cs0uxVPmlWcz8XttqR5b3rmDp8BctVeBERMUhaBd7AreG2CgCX9P+0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------oB8eCBnb2HCYST5OUZLAVlxf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 28.09.23 um 14:46 schrieb Ray Strode:
> Hi,
>
> On Thu, Sep 28, 2023 at 2:56 AM Christian König
> <christian.koenig@amd.com>  wrote:
>>> To say the "whole point" is about CPU overhead accounting sounds
>>> rather absurd to me. Is that really what you meant?
>> Yes, absolutely. See the functionality you try to implement already exists.
> You say lower in this same message that you don't believe the
> functionality actually works for the dpms off case I mentioned.

well in the dpms off case there shouldn't be any blocking/as far as I 
understand it.

If you see a large delay in the dpms off case then we probably have a 
driver bug somewhere.
/
> [SNIP]
>> A blocking system call in the sense of RLIMIT_RTTIME means something
>> which results in the process listening for external events, e.g. calling
>> select(), epoll() or read() on (for example) a network socket etc...
>>
>> As far as I can see drmAtomicCommit() is *not* meant with that what
>> similar to for example yield() also doesn't reset the RLIMIT_RTTIME counter.
> No no no, drmModeAtomicCommit() is not like sched_yield(). That's a
> really strange thing to say (you do mean sched_yield() right?).
> sched_yield() is an oddball because it's specifically for giving other
> threads a turn if they need it without causing the current thread to
> sleep if they don't.  It's a niche api that's meant for high performance
> use cases. It's a way to reduce scheduling latency and increase running
> time predictability.  drmModeAtomicCommit() using up rt time, busy
> looping while waiting on the hardware to respond, eating into userspace
> RLIMIT_RTTIME is nothing like that.
>
> I'm getting the idea that you think there is some big bucket of kernel
> syscalls that block for a large fraction of a second by design and are
> not meant to reset RLIMIT_RTTIME.

Yes, exactly that's the case as far as I know.

The purpose of RLIMIT_RTTIME is to have a watchdog if an application is 
still responsive. Only things which make the application look for 
outside events are considered a reset for this whatdog.

So for example calling select() and poll() will reset the watchdog, but 
not calling any DRM modeset functions or an power management IOCTL for 
example.

There are only two possibilities I can see how a DRM modeset is 
triggering this:

1. We create enough CPU overhead to actually exceed the limit. In this 
case triggering it is certainly intentional.

2. We busy wait for the hardware to reach a certain state. If that is 
true then this is a bug in the driver.

>   I could be wrong, but I don't think
> that's true. Off the top of my head, the only ones I can think of that
> might reasonably do that are futex() (which obviously can't sleep),
> sched_yield() (who's whole point is to not sleep), and maybe a
> some obscure ioctls (some probably legitimately, some probably
> illegitimately and noone has noticed.). I'm willing to be proven wrong
> here, and I might be, but right now from thinking about it, my guess is
> the above list is pretty close to complete.
>
>> Well you are breaking the RLIMIT_RTTIME functionality.
>>
>> The purpose of that functionality is to allow debugging and monitoring
>> applications to make sure that they keep alive and can react to external
>> signals.
> I don't think you really thought through what you're saying here. It
> just flatly doesn't apply for drmModeAtomicCommit. What is an
> application supposed to do?

Get terminated and restart. That's what the whole functionality is good for.

If you don't desire that than don't use the RLIMIT_RTTIME functionality.

>   It can't block the SIGKILL that's coming.
> Respond to the preceding SIGXCPUs? What response could the application
> possibly make? I'm guessing drmModeAtomicCommit isn't going to EINTR
> because it's busy looping waiting on hardware in the process context.
> And the kernel doesn't even guarantee SIGXCPU is going to go to the
> thread with the stuck syscall, so even if there was a legitimate
> response (or even "pthread_cancel" or some wreckless nonsense like
> that), getting the notification to the right part of the program is an
> exercise in gymnastics.
>
>>  From the RLIMIT_RTTIME documentation: "The intended use of this limit
>> is to stop a runaway real-time process from locking up the system."
>>
>> And when drmAtomicCommit() is triggering this then we either have a
>> problem with the application doing something it is not supposed to do
>> (like blocking for vblank while it should listen to network traffic) or
>> the driver is somehow buggy.
> drmModeAtomicCommit() is used by display servers. If drmModeAtomicCommit
> runs away in e.g. a set of 100ms busy loops responding to a confused or
> slow responding GPU, the system will seemingly lock up to the user. That
> is an intractable problem that we can not get away from. It doesn't
> matter if the kernel is stuck in process context or on a workqueue. And,
> regardless, it's not reasonable to expect userspace to craft elaborate
> workarounds for driver bugs. We just have to fix the bugs.

Exactly that's the reason why I'm pointing out that this isn't a good idea.

>
>> No when you disable everything there is of course no fence allocated.
> Okay, so it's not actually an answer
>
>> But then you also should never see anything waiting for to long to
>> actually be able to trigger the RLIMIT_RTTIME.
> But we do. That's the problem. That's like the whole problem. The amdgpu
> driver thinks it's okay to do something like:
>
> for_each_command_in_queue(&queue, command) {
>          execute_command(command);
>          while (1) {
>                  wait_for_response();
>
>                  if (delay++ > 100000)
>                          break;
>                  udelay(1);
>          }
> }
>
> or something like that. all while keeping the process in the RUNNABLE
> state. It just seems wrong to me. At least let the userspace process
> get scheduled out.

That just papers over the problem. The process doesn't become more 
responsive by hiding the problem.

What you need to do here is to report those problems to the driver teams 
and not try to hide them this way.

Regards,
Christian.

>
>>> Regardless, this seems like a roundabout way to address a problem that
>>> we could just ... fix.
>> Well to make it clear: This is not a problem but intended behavior!
> I'm going to be frank, I don't think this was intended behavior. We can
> wait for sima to get off PTO and chime in, to know one way or the other
> (or maybe airlied can chime in with his take?), but I doubt he was
> thinking about realtime scheduling minutiae when he put together the
> drmModeAtomicCommit implementation.
>
> There's no practical reason for doing things the way they're being done
> as far as I can tell.
>
> --Ray

--------------oB8eCBnb2HCYST5OUZLAVlxf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    <br>
    <div class="moz-cite-prefix">Am 28.09.23 um 14:46 schrieb Ray
      Strode:<br>
    </div>
    <blockquote type="cite" cite="mid:CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi,

On Thu, Sep 28, 2023 at 2:56 AM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">To say the &quot;whole point&quot; is about CPU overhead accounting sounds
rather absurd to me. Is that really what you meant?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes, absolutely. See the functionality you try to implement already exists.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You say lower in this same message that you don't believe the
functionality actually works for the dpms off case I mentioned.</pre>
    </blockquote>
    <br>
    well in the dpms off case there shouldn't be any blocking<i> as far
      as I understand it.<br>
      <br>
      If you see a large delay in the dpms off case then we probably
      have a driver bug somewhere.<br>
    </i><br>
    <blockquote type="cite" cite="mid:CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com">[SNIP]
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">A blocking system call in the sense of RLIMIT_RTTIME means something
which results in the process listening for external events, e.g. calling
select(), epoll() or read() on (for example) a network socket etc...

As far as I can see drmAtomicCommit() is *not* meant with that what
similar to for example yield() also doesn't reset the RLIMIT_RTTIME counter.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">No no no, drmModeAtomicCommit() is not like sched_yield(). That's a
really strange thing to say (you do mean sched_yield() right?).
sched_yield() is an oddball because it's specifically for giving other
threads a turn if they need it without causing the current thread to
sleep if they don't.  It's a niche api that's meant for high performance
use cases. It's a way to reduce scheduling latency and increase running
time predictability.  drmModeAtomicCommit() using up rt time, busy
looping while waiting on the hardware to respond, eating into userspace
RLIMIT_RTTIME is nothing like that.

I'm getting the idea that you think there is some big bucket of kernel
syscalls that block for a large fraction of a second by design and are
not meant to reset RLIMIT_RTTIME.</pre>
    </blockquote>
    <br>
    Yes, exactly that's the case as far as I know.<br>
    <br>
    The purpose of RLIMIT_RTTIME is to have a watchdog if an application
    is still responsive. Only things which make the application look for
    outside events are considered a reset for this whatdog.<br>
    <br>
    So for example calling select() and poll() will reset the watchdog,
    but not calling any DRM modeset functions or an power management
    IOCTL for example.<br>
    <br>
    There are only two possibilities I can see how a DRM modeset is
    triggering this:<br>
    <br>
    1. We create enough CPU overhead to actually exceed the limit. In
    this case triggering it is certainly intentional.<br>
    <br>
    2. We busy wait for the hardware to reach a certain state. If that
    is true then this is a bug in the driver.<br>
    <br>
    <blockquote type="cite" cite="mid:CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> I could be wrong, but I don't think
that's true. Off the top of my head, the only ones I can think of that
might reasonably do that are futex() (which obviously can't sleep),
sched_yield() (who's whole point is to not sleep), and maybe a
some obscure ioctls (some probably legitimately, some probably
illegitimately and noone has noticed.). I'm willing to be proven wrong
here, and I might be, but right now from thinking about it, my guess is
the above list is pretty close to complete.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Well you are breaking the RLIMIT_RTTIME functionality.

The purpose of that functionality is to allow debugging and monitoring
applications to make sure that they keep alive and can react to external
signals.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't think you really thought through what you're saying here. It
just flatly doesn't apply for drmModeAtomicCommit. What is an
application supposed to do?</pre>
    </blockquote>
    <br>
    Get terminated and restart. That's what the whole functionality is
    good for.<br>
    <br>
    If you don't desire that than don't use the RLIMIT_RTTIME
    functionality.<br>
    <br>
    <blockquote type="cite" cite="mid:CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> It can't block the SIGKILL that's coming.
Respond to the preceding SIGXCPUs? What response could the application
possibly make? I'm guessing drmModeAtomicCommit isn't going to EINTR
because it's busy looping waiting on hardware in the process context.
And the kernel doesn't even guarantee SIGXCPU is going to go to the
thread with the stuck syscall, so even if there was a legitimate
response (or even &quot;pthread_cancel&quot; or some wreckless nonsense like
that), getting the notification to the right part of the program is an
exercise in gymnastics.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From the RLIMIT_RTTIME documentation: &quot;The intended use of this limit
is to stop a runaway real-time process from locking up the system.&quot;

And when drmAtomicCommit() is triggering this then we either have a
problem with the application doing something it is not supposed to do
(like blocking for vblank while it should listen to network traffic) or
the driver is somehow buggy.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
drmModeAtomicCommit() is used by display servers. If drmModeAtomicCommit
runs away in e.g. a set of 100ms busy loops responding to a confused or
slow responding GPU, the system will seemingly lock up to the user. That
is an intractable problem that we can not get away from. It doesn't
matter if the kernel is stuck in process context or on a workqueue. And,
regardless, it's not reasonable to expect userspace to craft elaborate
workarounds for driver bugs. We just have to fix the bugs.</pre>
    </blockquote>
    <br>
    Exactly that's the reason why I'm pointing out that this isn't a
    good idea.<br>
    <br>
    <blockquote type="cite" cite="mid:CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">No when you disable everything there is of course no fence allocated.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Okay, so it's not actually an answer

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">But then you also should never see anything waiting for to long to
actually be able to trigger the RLIMIT_RTTIME.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But we do. That's the problem. That's like the whole problem. The amdgpu
driver thinks it's okay to do something like:

for_each_command_in_queue(&amp;queue, command) {
        execute_command(command);
        while (1) {
                wait_for_response();

                if (delay++ &gt; 100000)
                        break;
                udelay(1);
        }
}

or something like that. all while keeping the process in the RUNNABLE
state. It just seems wrong to me. At least let the userspace process
get scheduled out.</pre>
    </blockquote>
    <br>
    That just papers over the problem. The process doesn't become more
    responsive by hiding the problem.<br>
    <br>
    What you need to do here is to report those problems to the driver
    teams and not try to hide them this way.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Regardless, this seems like a roundabout way to address a problem that
we could just ... fix.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well to make it clear: This is not a problem but intended behavior!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm going to be frank, I don't think this was intended behavior. We can
wait for sima to get off PTO and chime in, to know one way or the other
(or maybe airlied can chime in with his take?), but I doubt he was
thinking about realtime scheduling minutiae when he put together the
drmModeAtomicCommit implementation.

There's no practical reason for doing things the way they're being done
as far as I can tell.

--Ray
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------oB8eCBnb2HCYST5OUZLAVlxf--
