Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADD840287
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1F410E959;
	Mon, 29 Jan 2024 10:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A3711225B;
 Mon, 29 Jan 2024 10:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdxqdptAa+sfOIiKZ2LVehDelPgmchlR7UIcAxDJDkGIcpn6X0EePkyCBqXmiFwmQhql8INQihKbi9K4vj8OFDFgDaSLLYLFLAYQpCsKpco40np4YCuJAK8KMaIWKoGn+NL/vMXW10+9RvX1I+Mz/h0+6ildqOBXWP5MfhaaRwstIWTuKvW7M4gDtcPnbo07T05VIXqprvCl3/dbiaIBCelRjsDePCaBdHhPvmMUJWZyIKyPgEctjsWojQ1MbThWLmPOYBm5h54T4IY5pei82ngOGgUkGNZncziFHm+1pGmJASUTBoqjAptu2Di36EX1NHfQ2Xv3gXxSCEQtq2LcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2YrlUmdK15F9N4TyYU98y5yIm/f5K6qRof1n3VItzo=;
 b=Sj31SvP9v2monBqSvnvn8beuztuftYH6nF67aTCLGKKrPQWvW3dhQAWesWvFxOwLnUJ9ayxFhx2w6L9BrYVzRXRBDVoXZNov8niDr10Snv0LJy1prepdXIlX0fjfwS+mo3dbVAnOlLN+sQA/ZRecQNeLYP8QLtFugb0DHTUkSUnvXbBAZCZDPJCjzCpcx7P0vWc7DfpBv5Vj3Ns1q4cldqnkhNYulRhU1XlZY01fvVNdzizfh8P7uwQayRs4CaQaiahT2mZmhSvkiajJtG6kfnpMmDhXygKB2vJ8wrITZhgx/Z+0tDRJc4w7txxSUqIFC4YZc468zJ81wdW0mUxggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2YrlUmdK15F9N4TyYU98y5yIm/f5K6qRof1n3VItzo=;
 b=JdgCd2s9Xldt9FQw/P7jH7mwvEQJO38DOUQCav3pYoxKT2GnbWguaQnTGm3Yn9nl54HHZNGYWlz4EcZYcBHeeH5QLYS4FJsDI3klmenf+5dAByW1jnZe7jNmcuCR7LWpIgUizQyqiSeeqJGzf7MJHha/+fKGRhee5moqZNa3Mk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 10:11:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 10:11:02 +0000
Content-Type: multipart/alternative;
 boundary="------------phfEpTtXZ135GAzU1sJiM9qZ"
Message-ID: <ac844c7e-dd3b-426e-bfa4-87dc8aeaffcf@amd.com>
Date: Mon, 29 Jan 2024 11:10:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, David Airlie <airlied@redhat.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25rZinyFDMmvPftWwnstOQSJJR01y1X8UkDUBTLgCAZ34Q@mail.gmail.com>
 <SA1PR11MB69918735BCF8BE99182BA3E8927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <95970cff-2d51-4e97-9d2f-3756de6f6c04@amd.com>
 <SA1PR11MB6991862AEA0DDAA59134958192792@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB6991862AEA0DDAA59134958192792@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9baefe-3434-4c60-8b30-08dc20b298c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYnNA2zlElLWY6hrzB8cLqwWiLEcRh8PvYtoJXPwBQLbNIbK5+GHdOwiXv9rAJWio/oezj4BywrMtZlrMAqMZ2x07mQGAtbxI4wEydvOPK7A0AuNWsp1CTWkA85Y6Q4/X4/k64n2IkANld9kKA3Iw0/YztBGgxRtNhmHaLCH2H/znTf+WDvBug1WvQHhbM3dLSiK86hFmI1418KbR8Nd0SFPPqcCgdnbSd/HvkEfQV8lsKryvEJjGKlIGalrSAJvs3h08WDS+DzNk6xwltdNrBXcVn6Vm9fh1lCHODK/xf+xJXaKO6u/ZMg/VDo6fvpn9CBUgh/D2I3b5cag625nEnXMhy8aj6fIj6STJghBl5JFUrH1nQEgoGsK9jb8DoDHSAYy4fpPHyoq0xUZ4EcGFqHZF4LmAtG0r0WHcUzhQY46+0V2Z6bhAoeBSwdOJZrrRaJdFVanoqYhyWoCypgLilFqeMX5KjnSH3CIJ2RPOAgF/rHWEZJyJeyba5xaneJPP03rFlQDPJNZO6XHs1JPqXVfVF+jFyUky51/meYIFS00etnO9e7pfc8EGG6RzKuRZoghr5XPhwtsMvJag7j3TI9zXQv/K55ZGW8jzQ1HxEbtTKr5pyhkDDPBqPh8r9Px
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(83380400001)(86362001)(31696002)(36756003)(166002)(2616005)(38100700002)(26005)(6512007)(66574015)(6486002)(966005)(53546011)(6506007)(2906002)(30864003)(478600001)(6666004)(41300700001)(110136005)(316002)(33964004)(66946007)(66556008)(66476007)(54906003)(5660300002)(8936002)(4326008)(8676002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBpNGpnZzhEeEVjOUo1RnlDODhPZFNrdk90NVVZSVF2by9uUEtvMmNXNFpE?=
 =?utf-8?B?SmRadGhYQXJvVGtkdURVUTVaNHAyRzlDU3VEbE1MVDQ5Yll1OWdORENNV2VH?=
 =?utf-8?B?bjZSdUlEa3NrMHhNZC9vZDFtM3FWdFpQM2lJUSsvYUpSODRuK3g2T2x3Q0Vo?=
 =?utf-8?B?ajRvcTlWa0d2L1NuRXZ4bTR2L2FNTG9JaWRFWjErR2JudFVKVTZSeDdEMzQw?=
 =?utf-8?B?bi9Kc3JmcWV1OU9rZFZWRFZkbmNINGJvY0FSRm9QNUhjYXNNeE5MZ0hZNGlF?=
 =?utf-8?B?cWdJRXRMQ3NnZlhWVXl4ZVpNbnJzLzRCTEdIVGk0aE1xS1JIMVNCSHlWaUJJ?=
 =?utf-8?B?cHZGUW5oeWJQZjEvdHYzSHIvekdKeEVVc285TytFUXVNN3hGZTQ3Tjk1OXh1?=
 =?utf-8?B?bjN3clNXYmc3OGZXTEc2bHJKRlFPYWRrVHMrYm10Q1dDdWJ0L3RVbFFTdWF4?=
 =?utf-8?B?cEF6VWlTN0xpVThwYnFEL0RFZVVOVDBDOWZub2lrbDhSblliL0NjQnJGdjNJ?=
 =?utf-8?B?TnU3RElvaURuVWhVM0xCVm9qU3lPTHlhT243WERkZjE2SFh2L3N2UTB6WGJD?=
 =?utf-8?B?NUwrVXc3bFNXNU5jV2VyWXdhMnJURGVFdkoxN3FmMVlReTZMbjYvU3RXcEpH?=
 =?utf-8?B?bmZYdFdWZU4wZFR4OG5WclVCVE9NcndIZE1GelAvSE8zd3hrdWE5emdYM1Ey?=
 =?utf-8?B?NGY1NWQvS09maUVoYzlHbnNYOENOZHNRck9RUzMzb1plN2JhV2R6alFJK0hy?=
 =?utf-8?B?TFQ3OFRtRjdlMGlEbWJVUFpwM2hGSlB1RzdVUHlJemNaaXF2V2R6STVQdXVY?=
 =?utf-8?B?K3hZc2dXVW1ZRkVOVmViS2xOZC8rY3ZBN2NScE50MElDanFnOVIrN29UYjFt?=
 =?utf-8?B?eHh3R3dXeDk0akRZaDhXM2dCbDdYZmFJWDlaNVdMKzhJZm1heU9hbllzUVk3?=
 =?utf-8?B?WmVzL3U3QzE5VHpUcXhVWklQNWJoMmJtMWYxSDdGd2pWL1J0byt1Y2FxWjhs?=
 =?utf-8?B?QjFkSkZLTVpaK2JUcUwvckRSQ1Y0SWJ6MHlNUmNYazR5Y1lEYmdrK3hReis2?=
 =?utf-8?B?VjZwOHBjVHRITUNJL1J1YzJsMG5JZ25mRStIcGwrc0JGOXRCbEs1ek9XN1Fp?=
 =?utf-8?B?Q2pYeFl2T01PeS96WjJ6S0pFWXZXVFFXV1NSV2pkamR5V0Z5eEk0eG9hN3pX?=
 =?utf-8?B?cG1aZDl3RTdHTHNLMGpkRG00dG9RTUlyQTg3NHFMWmZabU1FRndaVGJWS28y?=
 =?utf-8?B?bFp3L2gyVUdZNDVWNEI5RHdwN1MxQjV2SDlmL1IyRWRmT2pPMklIMnF2RVFt?=
 =?utf-8?B?KzhzQjNqOU5zU2ovcnZEZVBnalpkNkJRdHR0KzBKcFJ5SmdXdmNtUjI0UllX?=
 =?utf-8?B?YlNDZTdCcEhXaTZSY1M3aEZjMVZ3alc3VlFkdS9XMzhkaFl6dHRCeGRnWFdV?=
 =?utf-8?B?bEVka21xRW9mdW52b3cxQnphQWliSUNtY3d5U3RGbldydnVTNHRKdUJiZGto?=
 =?utf-8?B?SkZGbURFUVhEdjBnejlnbEVXczZKKzFNc2F1RXNYNmkwVEMvUGpaNDVuallp?=
 =?utf-8?B?MlVoNTYzWjBibEF1S3ZycjduRUpWUVFxY3RFamdUMzNEdnMzYlBxQm5EMlk4?=
 =?utf-8?B?NlBSV1JUWWRLUkdnT3VOSytWbDZNUzViQkF0eExkdi9yVGVzZXMwdkZLVkxr?=
 =?utf-8?B?Zm5ZUHVhaVVOd1JvWHlyYnM5LzVUKzhUanlJMGJlZ0p6OHlwOHAzRlNUcjdE?=
 =?utf-8?B?N0tiUXhPT3BYNENKZ3FHZDZ1WHBBOEcvTFM5ZlZ5OTBSVmljZWNLVWNqaXFY?=
 =?utf-8?B?MHVYUFVCczJVN1NhamRqalA4QUhWZHdKcnZhd0hJMzdNY2hnVTlyNVlLVGpD?=
 =?utf-8?B?SkxCNmJRZCt1bkFBSmFZcVdJVVJ0TmswQ3I4REc2ckNZUzF3d3RCLzYvK2lo?=
 =?utf-8?B?R0dnWGo4eThGNnZPS1VnZ2xla1J5U1RZclU5VWdsNjZRU2FYY01IbUlHaXVC?=
 =?utf-8?B?TnRKL2xBY3ZaMnluN056OFRoMGQzZ0kzMlY0OWdQWHZtNnlvTkpSSXk4cU9o?=
 =?utf-8?B?RDVUbm40M2ZZZVZKMDNRa0FIeGJGdDRxcjZldGZxbWhMTnoxM2hDTXJIMkFt?=
 =?utf-8?Q?zbCI0xAG8OYMOctnytoaCTNar?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9baefe-3434-4c60-8b30-08dc20b298c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 10:11:02.1890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWgVEC0Fxo43+kzc+fkPyOpOtIJUneKbq6w3V3XfXxlrZxZ467zGYePkdGoLp8+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260
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
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------phfEpTtXZ135GAzU1sJiM9qZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.01.24 um 21:13 schrieb Zeng, Oak:
>> -----Original Message-----
>> From: Christian König<christian.koenig@amd.com>
>> Sent: Friday, January 26, 2024 5:10 AM
>> To: Zeng, Oak<oak.zeng@intel.com>; David Airlie<airlied@redhat.com>
>> Cc: Ghimiray, Himal Prasad<himal.prasad.ghimiray@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; Winiarski, Michal
>> <michal.winiarski@intel.com>; Felix Kuehling<felix.kuehling@amd.com>; Welty,
>> Brian<brian.welty@intel.com>; Shah, Ankur N<ankur.n.shah@intel.com>; dri-
>> devel@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Gupta, saurabhg
>> <saurabhg.gupta@intel.com>; Danilo Krummrich<dakr@redhat.com>; Daniel
>> Vetter<daniel@ffwll.ch>; Brost, Matthew<matthew.brost@intel.com>; Bommu,
>> Krishnaiah<krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>> Hi Oak,
>>
>> you can still use SVM, but it should not be a design criteria for the
>> kernel UAPI. In other words the UAPI should be designed in such a way
>> that the GPU virtual address can be equal to the CPU virtual address of
>> a buffer, but can also be different to support use cases where this
>> isn't the case.
> Terminology:
> SVM: any technology which can achieve a shared virtual address space b/t cpu and devices. The virtual address space can be managed by user space or kernel space. Intel implemented a SVM, based on the BO-centric gpu driver (gem-create, vm-bind) where virtual address space is managed by UMD.
> System allocator: another way of implement SVM. User just use malloc'ed memory for gpu submission. Virtual address space is managed by Linux core mm. In practice, we leverage HMM to implement system allocator.
> This article described details of all those different model:https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/
>
> Our programming model allows a mixture use of system allocator (even though system allocator is ) and traditional vm_bind (where cpu address can != gpu address). Let me re-post the pseudo codes:
>
> 	1. Fd0 = open(/"dev/dri/render0")
> 	2. Fd1 = open("/dev/dri/render1")
> 	3. Fd3 = open("/dev/dri/xe-svm")
> 	4. Gpu_Vm0 =xe_vm_create(fd0)
> 	5. Gpu_Vm1 = xe_vm_create(fd1)
> 	6. Queue0 = xe_exec_queue_create(fd0, gpu_vm0)
> 	7. Queue1 = xe_exec_queue_create(fd1, gpu_vm1)
> 	8. ptr = malloc()
> 	9. bo = xe_bo_create(fd0)
> 	10. Vm_bind(bo, gpu_vm0, va)//va is from UMD, cpu can access bo with same or different va. It is UMD's responsibility that va doesn't conflict with malloc'ed PTRs.
> 	11. Xe_exec(queue0, ptr)//submit gpu job which use ptr, on card0
> 	12. Xe_exec(queue1, ptr)//submit gpu job which use ptr, on card1
> 	13. Xe_exec(queue0, va)//submit gpu job which use va, on card0
>
> In above codes, the va used in vm_bind (line 10, Intel's API to bind an object to a va for GPU access) can be different from the CPU address when cpu access the same object. But whenever user use malloc'ed ptr for GPU submission (line 11, 12, so called system allocator), it implies CPU and GPUs use the same ptr to access.
>
> In above vm_bind, it is user/UMD's responsibility to guarantee that vm_bind va doesn't conflict with malloc'ed ptr. Otherwise it is treated as programming error.
>
> I think this design still meets your design restrictions.

Well why do you need this "Fd3 = open("/dev/dri/xe-svm")" ?

As far as I see fd3 isn't used anywhere. What you can do is to bind 
parts of your process address space to your driver connections (fd1, fd2 
etc..) with a vm_bind(), but this should *not* come because of 
implicitely using some other file descriptor in the process.

As far as I can see this design is exactly what failed so badly with KFD.

Regards,
Christian.

>
>
>> Additionally to what Dave wrote I can summarize a few things I have
>> learned while working on the AMD GPU drivers in the last decade or so:
>>
>> 1. Userspace requirements are *not* relevant for UAPI or even more
>> general kernel driver design.
>>
>> 2. What should be done is to look at the hardware capabilities and try
>> to expose those in a save manner to userspace.
>>
>> 3. The userspace requirements are then used to validate the kernel
>> driver and especially the UAPI design to ensure that nothing was missed.
>>
>> The consequence of this is that nobody should ever use things like Cuda,
>> Vulkan, OpenCL, OpenGL etc.. as argument to propose a certain UAPI design.
>>
>> What should be done instead is to say: My hardware works in this and
>> that way -> we want to expose it like this -> because that enables us to
>> implement the high level API in this and that way.
>>
>> Only this gives then a complete picture of how things interact together
>> and allows the kernel community to influence and validate the design.
> What you described above is mainly bottom up. I know other people do top down, or whole system vertical HW-SW co-design. I don't have strong opinion here.
>
> Regards,
> Oak
>
>> This doesn't mean that you need to throw away everything, but it gives a
>> clear restriction that designs are not nailed in stone and for example
>> you can't use something like a waterfall model.
>>
>> Going to answer on your other questions separately.
>>
>> Regards,
>> Christian.
>>
>> Am 25.01.24 um 06:25 schrieb Zeng, Oak:
>>> Hi Dave,
>>>
>>> Let me step back. When I wrote " shared virtual address space b/t cpu and all
>> gpu devices is a hard requirement for our system allocator design", I meant this is
>> not only Intel's design requirement. Rather this is a common requirement for
>> both Intel, AMD and Nvidia. Take a look at cuda driver API definition of
>> cuMemAllocManaged (search this API onhttps://docs.nvidia.com/cuda/cuda-
>> driver-api/group__CUDA__MEM.html#group__CUDA__MEM), it said:
>>> "The pointer is valid on the CPU and on all GPUs in the system that support
>> managed memory."
>>> This means the program virtual address space is shared b/t CPU and all GPU
>> devices on the system. The system allocator we are discussing is just one step
>> advanced than cuMemAllocManaged: it allows malloc'ed memory to be shared
>> b/t CPU and all GPU devices.
>>> I hope we all agree with this point.
>>>
>>> With that, I agree with Christian that in kmd we should make driver code per-
>> device based instead of managing all devices in one driver instance. Our system
>> allocator (and generally xekmd)design follows this rule: we make xe_vm per
>> device based - one device is *not* aware of other device's address space, as I
>> explained in previous email. I started this email seeking a one drm_gpuvm
>> instance to cover all GPU devices. I gave up this approach (at least for now) per
>> Danilo and Christian's feedback: We will continue to have per device based
>> drm_gpuvm. I hope this is aligned with Christian but I will have to wait for
>> Christian's reply to my previous email.
>>> I hope this clarify thing a little.
>>>
>>> Regards,
>>> Oak
>>>
>>>> -----Original Message-----
>>>> From: dri-devel<dri-devel-bounces@lists.freedesktop.org>  On Behalf Of
>> David
>>>> Airlie
>>>> Sent: Wednesday, January 24, 2024 8:25 PM
>>>> To: Zeng, Oak<oak.zeng@intel.com>
>>>> Cc: Ghimiray, Himal Prasad<himal.prasad.ghimiray@intel.com>;
>>>> Thomas.Hellstrom@linux.intel.com; Winiarski, Michal
>>>> <michal.winiarski@intel.com>; Felix Kuehling<felix.kuehling@amd.com>;
>> Welty,
>>>> Brian<brian.welty@intel.com>; Shah, Ankur N<ankur.n.shah@intel.com>;
>> dri-
>>>> devel@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Gupta, saurabhg
>>>> <saurabhg.gupta@intel.com>; Danilo Krummrich<dakr@redhat.com>; Daniel
>>>> Vetter<daniel@ffwll.ch>; Brost, Matthew<matthew.brost@intel.com>;
>> Bommu,
>>>> Krishnaiah<krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
>>>> <niranjana.vishwanathapura@intel.com>; Christian König
>>>> <christian.koenig@amd.com>
>>>> Subject: Re: Making drm_gpuvm work across gpu devices
>>>>
>>>>> For us, Xekmd doesn't need to know it is running under bare metal or
>>>> virtualized environment. Xekmd is always a guest driver. All the virtual address
>>>> used in xekmd is guest virtual address. For SVM, we require all the VF devices
>>>> share one single shared address space with guest CPU program. So all the
>> design
>>>> works in bare metal environment can automatically work under virtualized
>>>> environment. +@Shah, Ankur N +@Winiarski, Michal to backup me if I am
>> wrong.
>>>>>
>>>>> Again, shared virtual address space b/t cpu and all gpu devices is a hard
>>>> requirement for our system allocator design (which means malloc’ed memory,
>>>> cpu stack variables, globals can be directly used in gpu program. Same
>>>> requirement as kfd SVM design). This was aligned with our user space
>> software
>>>> stack.
>>>>
>>>> Just to make a very general point here (I'm hoping you listen to
>>>> Christian a bit more and hoping he replies in more detail), but just
>>>> because you have a system allocator design done, it doesn't in any way
>>>> enforce the requirements on the kernel driver to accept that design.
>>>> Bad system design should be pushed back on, not enforced in
>>>> implementation stages. It's a trap Intel falls into regularly since
>>>> they say well we already agreed this design with the userspace team
>>>> and we can't change it now. This isn't acceptable. Design includes
>>>> upstream discussion and feedback, if you say misdesigned the system
>>>> allocator (and I'm not saying you definitely have), and this is
>>>> pushing back on that, then you have to go fix your system
>>>> architecture.
>>>>
>>>> KFD was an experiment like this, I pushed back on AMD at the start
>>>> saying it was likely a bad plan, we let it go and got a lot of
>>>> experience in why it was a bad design.
>>>>
>>>> Dave.

--------------phfEpTtXZ135GAzU1sJiM9qZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 26.01.24 um 21:13 schrieb Zeng, Oak:<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:SA1PR11MB6991862AEA0DDAA59134958192792@SA1PR11MB6991.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Sent: Friday, January 26, 2024 5:10 AM
To: Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>; David Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>
Cc: Ghimiray, Himal Prasad <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:Thomas.Hellstrom@linux.intel.com">Thomas.Hellstrom@linux.intel.com</a>; Winiarski, Michal
<a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>; Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a>; Welty,
Brian <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>; Shah, Ankur N <a class="moz-txt-link-rfc2396E" href="mailto:ankur.n.shah@intel.com">&lt;ankur.n.shah@intel.com&gt;</a>; dri-
<a class="moz-txt-link-abbreviated" href="mailto:devel@lists.freedesktop.org">devel@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Gupta, saurabhg
<a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>; Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Daniel
Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Bommu,
Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Vishwanathapura, Niranjana
<a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
Subject: Re: Making drm_gpuvm work across gpu devices

Hi Oak,

you can still use SVM, but it should not be a design criteria for the
kernel UAPI. In other words the UAPI should be designed in such a way
that the GPU virtual address can be equal to the CPU virtual address of
a buffer, but can also be different to support use cases where this
isn't the case.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Terminology:
SVM: any technology which can achieve a shared virtual address space b/t cpu and devices. The virtual address space can be managed by user space or kernel space. Intel implemented a SVM, based on the BO-centric gpu driver (gem-create, vm-bind) where virtual address space is managed by UMD.
System allocator: another way of implement SVM. User just use malloc'ed memory for gpu submission. Virtual address space is managed by Linux core mm. In practice, we leverage HMM to implement system allocator.
This article described details of all those different model: <a class="moz-txt-link-freetext" href="https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/">https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/</a>

Our programming model allows a mixture use of system allocator (even though system allocator is ) and traditional vm_bind (where cpu address can != gpu address). Let me re-post the pseudo codes:

	1. Fd0 = open(/&quot;dev/dri/render0&quot;)
	2. Fd1 = open(&quot;/dev/dri/render1&quot;)
	3. Fd3 = open(&quot;/dev/dri/xe-svm&quot;)
	4. Gpu_Vm0 =xe_vm_create(fd0) 
	5. Gpu_Vm1 = xe_vm_create(fd1) 
	6. Queue0 = xe_exec_queue_create(fd0, gpu_vm0)
	7. Queue1 = xe_exec_queue_create(fd1, gpu_vm1)
	8. ptr = malloc()
	9. bo = xe_bo_create(fd0)
	10. Vm_bind(bo, gpu_vm0, va)//va is from UMD, cpu can access bo with same or different va. It is UMD's responsibility that va doesn't conflict with malloc'ed PTRs.
	11. Xe_exec(queue0, ptr)//submit gpu job which use ptr, on card0
	12. Xe_exec(queue1, ptr)//submit gpu job which use ptr, on card1
	13. Xe_exec(queue0, va)//submit gpu job which use va, on card0

In above codes, the va used in vm_bind (line 10, Intel's API to bind an object to a va for GPU access) can be different from the CPU address when cpu access the same object. But whenever user use malloc'ed ptr for GPU submission (line 11, 12, so called system allocator), it implies CPU and GPUs use the same ptr to access.

In above vm_bind, it is user/UMD's responsibility to guarantee that vm_bind va doesn't conflict with malloc'ed ptr. Otherwise it is treated as programming error.

I think this design still meets your design restrictions. </pre>
    </blockquote>
    <br>
    Well why do you need this &quot;Fd3 = open(&quot;/dev/dri/xe-svm&quot;)&quot; ?<br>
    <br>
    As far as I see fd3 isn't used anywhere. What you can do is to bind
    parts of your process address space to your driver connections (fd1,
    fd2 etc..) with a vm_bind(), but this should *not* come because of
    implicitely using some other file descriptor in the process.<br>
    <br>
    As far as I can see this design is exactly what failed so badly with
    KFD.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991862AEA0DDAA59134958192792@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Additionally to what Dave wrote I can summarize a few things I have
learned while working on the AMD GPU drivers in the last decade or so:

1. Userspace requirements are *not* relevant for UAPI or even more
general kernel driver design.

2. What should be done is to look at the hardware capabilities and try
to expose those in a save manner to userspace.

3. The userspace requirements are then used to validate the kernel
driver and especially the UAPI design to ensure that nothing was missed.

The consequence of this is that nobody should ever use things like Cuda,
Vulkan, OpenCL, OpenGL etc.. as argument to propose a certain UAPI design.

What should be done instead is to say: My hardware works in this and
that way -&gt; we want to expose it like this -&gt; because that enables us to
implement the high level API in this and that way.

Only this gives then a complete picture of how things interact together
and allows the kernel community to influence and validate the design.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What you described above is mainly bottom up. I know other people do top down, or whole system vertical HW-SW co-design. I don't have strong opinion here.

Regards,
Oak

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This doesn't mean that you need to throw away everything, but it gives a
clear restriction that designs are not nailed in stone and for example
you can't use something like a waterfall model.

Going to answer on your other questions separately.

Regards,
Christian.

Am 25.01.24 um 06:25 schrieb Zeng, Oak:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Dave,

Let me step back. When I wrote &quot; shared virtual address space b/t cpu and all
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">gpu devices is a hard requirement for our system allocator design&quot;, I meant this is
not only Intel's design requirement. Rather this is a common requirement for
both Intel, AMD and Nvidia. Take a look at cuda driver API definition of
cuMemAllocManaged (search this API on <a class="moz-txt-link-freetext" href="https://docs.nvidia.com/cuda/cuda">https://docs.nvidia.com/cuda/cuda</a>-
driver-api/group__CUDA__MEM.html#group__CUDA__MEM), it said:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
&quot;The pointer is valid on the CPU and on all GPUs in the system that support
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">managed memory.&quot;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
This means the program virtual address space is shared b/t CPU and all GPU
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">devices on the system. The system allocator we are discussing is just one step
advanced than cuMemAllocManaged: it allows malloc'ed memory to be shared
b/t CPU and all GPU devices.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
I hope we all agree with this point.

With that, I agree with Christian that in kmd we should make driver code per-
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">device based instead of managing all devices in one driver instance. Our system
allocator (and generally xekmd)design follows this rule: we make xe_vm per
device based - one device is *not* aware of other device's address space, as I
explained in previous email. I started this email seeking a one drm_gpuvm
instance to cover all GPU devices. I gave up this approach (at least for now) per
Danilo and Christian's feedback: We will continue to have per device based
drm_gpuvm. I hope this is aligned with Christian but I will have to wait for
Christian's reply to my previous email.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
I hope this clarify thing a little.

Regards,
Oak

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: dri-devel <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel-bounces@lists.freedesktop.org">&lt;dri-devel-bounces@lists.freedesktop.org&gt;</a> On Behalf Of
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">David
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Airlie
Sent: Wednesday, January 24, 2024 8:25 PM
To: Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>
Cc: Ghimiray, Himal Prasad <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:Thomas.Hellstrom@linux.intel.com">Thomas.Hellstrom@linux.intel.com</a>; Winiarski, Michal
<a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>; Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a>;
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Welty,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Brian <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>; Shah, Ankur N <a class="moz-txt-link-rfc2396E" href="mailto:ankur.n.shah@intel.com">&lt;ankur.n.shah@intel.com&gt;</a>;
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">dri-
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap=""><a class="moz-txt-link-abbreviated" href="mailto:devel@lists.freedesktop.org">devel@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Gupta, saurabhg
<a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>; Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Daniel
Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>;
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Bommu,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Vishwanathapura, Niranjana
<a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>; Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Subject: Re: Making drm_gpuvm work across gpu devices

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
For us, Xekmd doesn't need to know it is running under bare metal or
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">virtualized environment. Xekmd is always a guest driver. All the virtual address
used in xekmd is guest virtual address. For SVM, we require all the VF devices
share one single shared address space with guest CPU program. So all the
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">design
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">works in bare metal environment can automatically work under virtualized
environment. +@Shah, Ankur N +@Winiarski, Michal to backup me if I am
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">wrong.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">

Again, shared virtual address space b/t cpu and all gpu devices is a hard
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">requirement for our system allocator design (which means malloc’ed memory,
cpu stack variables, globals can be directly used in gpu program. Same
requirement as kfd SVM design). This was aligned with our user space
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">software
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">stack.

Just to make a very general point here (I'm hoping you listen to
Christian a bit more and hoping he replies in more detail), but just
because you have a system allocator design done, it doesn't in any way
enforce the requirements on the kernel driver to accept that design.
Bad system design should be pushed back on, not enforced in
implementation stages. It's a trap Intel falls into regularly since
they say well we already agreed this design with the userspace team
and we can't change it now. This isn't acceptable. Design includes
upstream discussion and feedback, if you say misdesigned the system
allocator (and I'm not saying you definitely have), and this is
pushing back on that, then you have to go fix your system
architecture.

KFD was an experiment like this, I pushed back on AMD at the start
saying it was likely a bad plan, we let it go and got a lot of
experience in why it was a bad design.

Dave.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------phfEpTtXZ135GAzU1sJiM9qZ--
