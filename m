Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCF83DA54
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC4910F124;
	Fri, 26 Jan 2024 12:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6BC10FA0E;
 Fri, 26 Jan 2024 12:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrTNabcGz7EzYRSAhV2x5iq1KeWcZaxaVw2zwzhKV985KTovk6d/qd/uW0AwbbWavul6J4faGeoNGpdcKzZ9w6WKML/0zJNPXFgcf3HBiczBG88tN5Xtbg7r4niz7WYatlvsgECuLZlT3Z8mRx8lzGIsNSkniBC33nqQvIKuNJRvQpE6jAusK5dMqRoJ77DE8kBRu4qnMxb7yCHgZG30+UaaI8/nZPzt+N8eaBUL+Q30UdWqgN1maGx9zl8nJ8CyvTSdQGu6+BohPZyTXJjutIHIHpl8NWe059y0GnnHEYBwuTsNzLm4RWHDmuBc14G/3r34vkqvG0N3ABbhJGh46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCmZ8FehIIYzG1NbJ75FBS/9dP4nzxrRIWbxFdrg1XE=;
 b=Nf8Y97R2EftgUXIeBfW46yKRV+a1nElcZh6WsJoEG+9uy06MuPxzTwCNCMnm/zzDqchtlnMVoCiJi6WI8vfj4j3EPHvNIvjVnTaBIuo+0YDYbh6QiodjGjTz/nMJ+cBf3yRP4etRXbkSUrZP0k+P6h1nYbaSwIulpvsxN8v6PrxbPYORhPv8byKcVntwQOAaMyBoNC47BVFfvklEbWFhbmQw+Z8nHfOmX6tyci2zOXsdrBe7FJOwl2VkVVCGJThG8ZwmSBYI2oH8KhB2EujtbiHsLhDwW5L3llDywwaO5ggKthPwh9cEhnYZOGBjzbKQ2FURjJpuyQ0D5upOtlafGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCmZ8FehIIYzG1NbJ75FBS/9dP4nzxrRIWbxFdrg1XE=;
 b=GDDar5rExsDt1dzkVkETjC9qcBPfW6DNQ/Hkw0Z8dxuahtrKczt0Sct7yXxJCbtD/KuF5Le5K57YegzkhJG3UKgTwrNhkM5c1EMNV/+ZVEdlOkXIYRHL6o1e5J7zX3DyDzT0pE5NxbI+Sx6+bTIVuHw7SNYCHUsftPeYxPTz3ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 12:52:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 12:52:24 +0000
Content-Type: multipart/alternative;
 boundary="------------i1IJ82aN4fNxWLimpfHUpDtW"
Message-ID: <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
Date: Fri, 26 Jan 2024 13:52:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe13a89-554a-4590-435a-08dc1e6da477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktBaR+C2rXR9LQYE+TpZ0Fnh0pz9iqJvdxsjmwjGlSwpRLYqXymfb6udI61G3/hiEUBOs9eQGEsXADAsGWWRi7lyZhRZIGgIyZDOjYEZ7ITNcOueKMOsHRDivA+trwq/eM0C2cAwF4N9nH30VBoxOE9rQYxei9nPDHuxrYWF3Bf+GX5t0IR3DHRucDQDnAR6IMNr6+PnHpjm2Yx8pvPa+thSjREUYw6JW/gbbefKoD4utGxtqgLqJzAIfjf/qXOtJI2+uWkbdvmOmLer+gftQ3YkjHqrweiigZYsmBPVTz4ZlYBNMNZypPYxMu9JrZQwd9ahO5YQIsb4InyFGLzdr2W/yfv1kgi6DSXnZMF535lvCnG7RHHIxxXdE7WI4DKefAgj8IwU3VjrZYHTN/LyxPxyIfYwoO5H/5N67ZFQz5OAThzx80r4wov0tACR2aTKIjeBunzrtHxZgorzRq/hTfbPIHBDJfPJFtey1ZSaYihah2rdwVidzeOQP0uTgarkStl5+cyaXSmlwzJSeV24nbERUpxXg4Q/5C3/SI1CKUn4fBDcBqwYXcs0acpxpWKYFyY9MJ9edBA2gzT3kzy+UA6j7qcaDEZQG4X3hvJuAHbOcipjsUJr939FCUfBIQ+Cje/xoL0MAJ1KblpTxk7qlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31686004)(6666004)(33964004)(6506007)(2616005)(6512007)(66574015)(26005)(86362001)(31696002)(36756003)(166002)(38100700002)(5660300002)(30864003)(83380400001)(7416002)(2906002)(41300700001)(6486002)(8676002)(8936002)(4326008)(316002)(478600001)(966005)(110136005)(66556008)(66476007)(54906003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG9rMGthV2R5bzc1Qnl6R2lQRWN3TlFtKzFZTG9OMjJPcTZmeWVaN3VNTGVV?=
 =?utf-8?B?bHorL2MwKzFqdmJiRC9Zd3k4M1pGMGVXTDF2S3pEdnNyS21pYmhsVzZQbU5i?=
 =?utf-8?B?WWx6VjJyY0g3MDN4WUJMTlZQajgyVlpmZkhlY3J6S29IblJncXlBL1FSQjNx?=
 =?utf-8?B?NGx0QVlhRzE3dFlQZllYNjFNZHd5S2JiSm1TemRNbkxFQTVKUmxQUCtPNm9Q?=
 =?utf-8?B?TTVvM3FWLyt5cUlzQnhrK0Vud2I4NmQ1cVZVY1BtcWZjWVRZNXRDQWZPSEhH?=
 =?utf-8?B?TFM2N3E3eGVXVG1yTE5wWHN4V2ZCc3FQdCtCaHp1OGZKdzVjK1hBeVUwZGd4?=
 =?utf-8?B?UjI2eWUxV3NodVUyalR0YXE1STJER0Fnck9KZlRseWRZUnEwQVBQYzNhRSts?=
 =?utf-8?B?N3oxZ0txVjVieUFrQlgxT1pVV0xkbytlenduSHhDNncwMDF5Y3hMN3hnNUZ4?=
 =?utf-8?B?OHJ6SDZvU21KZERrM0tYTEwrbjZ0Z0tqNUZ2cHdDL0Q0bGNGVDdwYXJFdFQv?=
 =?utf-8?B?TVMwSy9DbDhpY2RaWjNrRDhuZE9wb1N3WjZjSG9PMlVxZnY1dHh0QmoxYUkw?=
 =?utf-8?B?a3U4QmNUcHJGUU0vMnUwYzhoamdFSVoweHRjVVFMU0pEamdKKzVFNHlSNWto?=
 =?utf-8?B?Y0JyemFIbGJBOWJQVU9YTmtYMndVanVuRmhKb3RUcUo4U3dBamRhbWhhNUJU?=
 =?utf-8?B?TGVOS2wzVHZiNytrWDEyYmx2bTdnTk9MWnRHZHg4TmcxbHoycC9BTWxXcldp?=
 =?utf-8?B?RWlVcEc1UTVpOGhQWFlFYktxRWJMK0g5akw4OU1hWkNyNGNRNm1Bcno5ZGJZ?=
 =?utf-8?B?dGxMWWNldi9PL3VjRlFVbWQwQWo2dVhqOW5iVlNUSUYxSkxkMExUemxQNlc1?=
 =?utf-8?B?aUhaYkt3VDRVdkdQQ2xkckZmRlczTXNGLzBxaXE2MGxRUnhyc0laVjBBdnAy?=
 =?utf-8?B?Q00wVXY3YlJjdStUME1KOHFEK0RvM3kvOG9tWGlLQmVBanRVazdmRjNSMXdR?=
 =?utf-8?B?RDR4QUJESU9Td3pIcFRacSs4NHk0c1pQa0xEd3VZOENxTFlHMURBUCsxb3F2?=
 =?utf-8?B?UnpQQThqM1A3NnhRUGI5T1UrU09QS0lnQmRORkxaSTdoTXRGZGluYXRxREQ5?=
 =?utf-8?B?c1NZdWhhcEQwMUdybjhwOXZySkwxK015MXZZQ1BmcElHRWE1OER6MjhBMThM?=
 =?utf-8?B?VW85UklwRm95dzdVNUZnaUVZT0hZWVduUS9lOXJlQlRIRjJ4UExPYS83T0d1?=
 =?utf-8?B?ci93bVpFZDNGOU5MSDRDM1VmZHo1SmdDZElkYVdYOW9QaXlmelU4bGRQVEdQ?=
 =?utf-8?B?bkY2ZUNjWG9aK2RlZVZUTVVTMEJqU2cwc0NFOGNyWlpzVFhVY25WVFZoUElN?=
 =?utf-8?B?R0lMN2lrN0FieGxCUGNOM3N1NVk1bGJBbGszdE14SEc5YUNOQi9rbzlpbHdi?=
 =?utf-8?B?WVh4dmZjZ1ljRlo5WXVUeFRLZ0FtektUdmo4VElYU0JIUEJhdVY4Ync5Rkoy?=
 =?utf-8?B?UlFXSVFQZXFSM2dDTHA0QmIrUHlEc1c5ZXM5RlFNOWxKSDlaOHFuUEU5QmUw?=
 =?utf-8?B?NjhybE5tcTl4a1BVRUFNL2djRjVocTdEK1J3SVlmVTFwNjJucWMzRDhNNklP?=
 =?utf-8?B?Zm5IZFNHS2tta2xHRjA0UmxjTFNtV0piS3pLbWhIckptNE10VWxKOGdqM2J2?=
 =?utf-8?B?OTZWMVBqSFk3cXVFZ3BqTTRKYnpuL2RxNEtxb3R5ak45aVlFZ1U3WVVIMEEz?=
 =?utf-8?B?aWdUeXRTTS9HTEdrMUQzREkySEJhNi9qSjdoMjhPSnZrK1pMaHo3WnVoTGht?=
 =?utf-8?B?bitWMUpQOVMwRlJBa1VxejhYVVVnNE9Ub0FDM29NYnNjUmU5eEpLUWk0TW5Q?=
 =?utf-8?B?NVc2bzZRMUNXOCs5Z3hDVzBJRU42YkRCbTVJOVZXRWphNzFSVkNvcEdsR2t2?=
 =?utf-8?B?MzJnUC9vR2lVSmxFYjRmTDNBSXJ4cmJkK3cwYkdHSHJYQ0FadS9UVkhDUGNY?=
 =?utf-8?B?Tlh5RXNIcGwyYmJWMWFqZTkwSlhjVFNhanZFVC95ZDhaV0lQVGFuaEQrdE1n?=
 =?utf-8?B?a1lJaE5uVXErT09ubFhXb0hEa2tlVFp1M00zTG0vcVZlWmRSUVBoRWtCNmJU?=
 =?utf-8?Q?yBXomyDR2NNezeyk88Z3AvLfX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe13a89-554a-4590-435a-08dc1e6da477
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 12:52:24.1861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2ji1vwa789HkXcx6n3189+pxL0vgQycWcJ4a4Ey3MwJYwuX+bg+07aU3W+uDmle
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Dave Airlie <airlied@redhat.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------i1IJ82aN4fNxWLimpfHUpDtW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.01.24 um 09:21 schrieb Thomas Hellström:
> Hi, all
>
> On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:
>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>> [SNIP]
>>>> Yes most API are per device based.
>>>>
>>>> One exception I know is actually the kfd SVM API. If you look at
>>>> the svm_ioctl function, it is per-process based. Each kfd_process
>>>> represent a process across N gpu devices.
>>> Yeah and that was a big mistake in my opinion. We should really not
>>> do that
>>> ever again.
>>>
>>>> Need to say, kfd SVM represent a shared virtual address space
>>>> across CPU and all GPU devices on the system. This is by the
>>>> definition of SVM (shared virtual memory). This is very different
>>>> from our legacy gpu *device* driver which works for only one
>>>> device (i.e., if you want one device to access another device's
>>>> memory, you will have to use dma-buf export/import etc).
>>> Exactly that thinking is what we have currently found as blocker
>>> for a
>>> virtualization projects. Having SVM as device independent feature
>>> which
>>> somehow ties to the process address space turned out to be an
>>> extremely bad
>>> idea.
>>>
>>> The background is that this only works for some use cases but not
>>> all of
>>> them.
>>>
>>> What's working much better is to just have a mirror functionality
>>> which says
>>> that a range A..B of the process address space is mapped into a
>>> range C..D
>>> of the GPU address space.
>>>
>>> Those ranges can then be used to implement the SVM feature required
>>> for
>>> higher level APIs and not something you need at the UAPI or even
>>> inside the
>>> low level kernel memory management.
>>>
>>> When you talk about migrating memory to a device you also do this
>>> on a per
>>> device basis and *not* tied to the process address space. If you
>>> then get
>>> crappy performance because userspace gave contradicting information
>>> where to
>>> migrate memory then that's a bug in userspace and not something the
>>> kernel
>>> should try to prevent somehow.
>>>
>>> [SNIP]
>>>>> I think if you start using the same drm_gpuvm for multiple
>>>>> devices you
>>>>> will sooner or later start to run into the same mess we have
>>>>> seen with
>>>>> KFD, where we moved more and more functionality from the KFD to
>>>>> the DRM
>>>>> render node because we found that a lot of the stuff simply
>>>>> doesn't work
>>>>> correctly with a single object to maintain the state.
>>>> As I understand it, KFD is designed to work across devices. A
>>>> single pseudo /dev/kfd device represent all hardware gpu devices.
>>>> That is why during kfd open, many pdd (process device data) is
>>>> created, each for one hardware device for this process.
>>> Yes, I'm perfectly aware of that. And I can only repeat myself that
>>> I see
>>> this design as a rather extreme failure. And I think it's one of
>>> the reasons
>>> why NVidia is so dominant with Cuda.
>>>
>>> This whole approach KFD takes was designed with the idea of
>>> extending the
>>> CPU process into the GPUs, but this idea only works for a few use
>>> cases and
>>> is not something we should apply to drivers in general.
>>>
>>> A very good example are virtualization use cases where you end up
>>> with CPU
>>> address != GPU address because the VAs are actually coming from the
>>> guest VM
>>> and not the host process.
>>>
>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
>>> not have
>>> any influence on the design of the kernel UAPI.
>>>
>>> If you want to do something similar as KFD for Xe I think you need
>>> to get
>>> explicit permission to do this from Dave and Daniel and maybe even
>>> Linus.
>> I think the one and only one exception where an SVM uapi like in kfd
>> makes
>> sense, is if the _hardware_ itself, not the software stack defined
>> semantics that you've happened to build on top of that hw, enforces a
>> 1:1
>> mapping with the cpu process address space.
>>
>> Which means your hardware is using PASID, IOMMU based translation,
>> PCI-ATS
>> (address translation services) or whatever your hw calls it and has
>> _no_
>> device-side pagetables on top. Which from what I've seen all devices
>> with
>> device-memory have, simply because they need some place to store
>> whether
>> that memory is currently in device memory or should be translated
>> using
>> PASID. Currently there's no gpu that works with PASID only, but there
>> are
>> some on-cpu-die accelerator things that do work like that.
>>
>> Maybe in the future there will be some accelerators that are fully
>> cpu
>> cache coherent (including atomics) with something like CXL, and the
>> on-device memory is managed as normal system memory with struct page
>> as
>> ZONE_DEVICE and accelerator va -> physical address translation is
>> only
>> done with PASID ... but for now I haven't seen that, definitely not
>> in
>> upstream drivers.
>>
>> And the moment you have some per-device pagetables or per-device
>> memory
>> management of some sort (like using gpuva mgr) then I'm 100% agreeing
>> with
>> Christian that the kfd SVM model is too strict and not a great idea.
>>
>> Cheers, Sima
>
> I'm trying to digest all the comments here, The end goal is to be able
> to support something similar to this here:
>
> https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/
>
> Christian, If I understand you correctly, you're strongly suggesting
> not to try to manage a common virtual address space across different
> devices in the kernel, but merely providing building blocks to do so,
> like for example a generalized userptr with migration support using
> HMM; That way each "mirror" of the CPU mm would be per device and
> inserted into the gpu_vm just like any other gpu_vma, and user-space
> would dictate the A..B -> C..D mapping by choosing the GPU_VA for the
> vma.

Exactly that, yes.

> Sima, it sounds like you're suggesting to shy away from hmm and not
> even attempt to support this except if it can be done using IOMMU sva
> on selected hardware?

I think that comment goes more into the direction of: If you have 
ATS/ATC/PRI capable hardware which exposes the functionality to make 
memory reads and writes directly into the address space of the CPU then 
yes an SVM only interface is ok because the hardware can't do anything 
else. But as long as you have something like GPUVM then please don't 
restrict yourself.

Which I totally agree on as well. The ATS/ATC/PRI combination doesn't 
allow using separate page tables device and CPU and so also not separate 
VAs.

This was one of the reasons why we stopped using this approach for AMD GPUs.

Regards,
Christian.

> Could you clarify a bit?
>
> Thanks,
> Thomas
>
>
>
>
>
>
>

--------------i1IJ82aN4fNxWLimpfHUpDtW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 26.01.24 um 09:21 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi, all

On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Am 23.01.24 um 20:37 schrieb Zeng, Oak:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">[SNIP]
Yes most API are per device based.

One exception I know is actually the kfd SVM API. If you look at
the svm_ioctl function, it is per-process based. Each kfd_process
represent a process across N gpu devices.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yeah and that was a big mistake in my opinion. We should really not
do that
ever again.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Need to say, kfd SVM represent a shared virtual address space
across CPU and all GPU devices on the system. This is by the
definition of SVM (shared virtual memory). This is very different
from our legacy gpu *device* driver which works for only one
device (i.e., if you want one device to access another device's
memory, you will have to use dma-buf export/import etc).
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Exactly that thinking is what we have currently found as blocker
for a
virtualization projects. Having SVM as device independent feature
which
somehow ties to the process address space turned out to be an
extremely bad
idea.

The background is that this only works for some use cases but not
all of
them.

What's working much better is to just have a mirror functionality
which says
that a range A..B of the process address space is mapped into a
range C..D
of the GPU address space.

Those ranges can then be used to implement the SVM feature required
for
higher level APIs and not something you need at the UAPI or even
inside the
low level kernel memory management.

When you talk about migrating memory to a device you also do this
on a per
device basis and *not* tied to the process address space. If you
then get
crappy performance because userspace gave contradicting information
where to
migrate memory then that's a bug in userspace and not something the
kernel
should try to prevent somehow.

[SNIP]
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I think if you start using the same drm_gpuvm for multiple
devices you
will sooner or later start to run into the same mess we have
seen with
KFD, where we moved more and more functionality from the KFD to
the DRM
render node because we found that a lot of the stuff simply
doesn't work
correctly with a single object to maintain the state.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">As I understand it, KFD is designed to work across devices. A
single pseudo /dev/kfd device represent all hardware gpu devices.
That is why during kfd open, many pdd (process device data) is
created, each for one hardware device for this process.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yes, I'm perfectly aware of that. And I can only repeat myself that
I see
this design as a rather extreme failure. And I think it's one of
the reasons
why NVidia is so dominant with Cuda.

This whole approach KFD takes was designed with the idea of
extending the
CPU process into the GPUs, but this idea only works for a few use
cases and
is not something we should apply to drivers in general.

A very good example are virtualization use cases where you end up
with CPU
address != GPU address because the VAs are actually coming from the
guest VM
and not the host process.

SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
not have
any influence on the design of the kernel UAPI.

If you want to do something similar as KFD for Xe I think you need
to get
explicit permission to do this from Dave and Daniel and maybe even
Linus.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I think the one and only one exception where an SVM uapi like in kfd
makes
sense, is if the _hardware_ itself, not the software stack defined
semantics that you've happened to build on top of that hw, enforces a
1:1
mapping with the cpu process address space.

Which means your hardware is using PASID, IOMMU based translation,
PCI-ATS
(address translation services) or whatever your hw calls it and has
_no_
device-side pagetables on top. Which from what I've seen all devices
with
device-memory have, simply because they need some place to store
whether
that memory is currently in device memory or should be translated
using
PASID. Currently there's no gpu that works with PASID only, but there
are
some on-cpu-die accelerator things that do work like that.

Maybe in the future there will be some accelerators that are fully
cpu
cache coherent (including atomics) with something like CXL, and the
on-device memory is managed as normal system memory with struct page
as
ZONE_DEVICE and accelerator va -&gt; physical address translation is
only
done with PASID ... but for now I haven't seen that, definitely not
in
upstream drivers.

And the moment you have some per-device pagetables or per-device
memory
management of some sort (like using gpuva mgr) then I'm 100% agreeing
with
Christian that the kfd SVM model is too strict and not a great idea.

Cheers, Sima
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

I'm trying to digest all the comments here, The end goal is to be able
to support something similar to this here:

<a class="moz-txt-link-freetext" href="https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/">https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/</a>

Christian, If I understand you correctly, you're strongly suggesting
not to try to manage a common virtual address space across different
devices in the kernel, but merely providing building blocks to do so,
like for example a generalized userptr with migration support using
HMM; That way each &quot;mirror&quot; of the CPU mm would be per device and
inserted into the gpu_vm just like any other gpu_vma, and user-space
would dictate the A..B -&gt; C..D mapping by choosing the GPU_VA for the
vma.</pre>
    </blockquote>
    <br>
    Exactly that, yes.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
Sima, it sounds like you're suggesting to shy away from hmm and not
even attempt to support this except if it can be done using IOMMU sva
on selected hardware?</pre>
    </blockquote>
    <br>
    I think that comment goes more into the direction of: If you have
    ATS/ATC/PRI capable hardware which exposes the functionality to make
    memory reads and writes directly into the address space of the CPU
    then yes an SVM only interface is ok because the hardware can't do
    anything else. But as long as you have something like GPUVM then
    please don't restrict yourself.<br>
    <br>
    Which I totally agree on as well. The ATS/ATC/PRI combination
    doesn't allow using separate page tables device and CPU and so also
    not separate VAs.<br>
    <br>
    This was one of the reasons why we stopped using this approach for
    AMD GPUs.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Could you clarify a bit?

Thanks,
Thomas







</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------i1IJ82aN4fNxWLimpfHUpDtW--
