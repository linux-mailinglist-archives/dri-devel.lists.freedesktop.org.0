Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3AC86895F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 07:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1AA10E818;
	Tue, 27 Feb 2024 06:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cKp9Gjkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB4610E756;
 Tue, 27 Feb 2024 06:54:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMnAFooLKRHMK09s//nz1gtQT8wPF5IwRpDK3qL15+BxsKdTvOS9ddoA8Ju8uNisQg4pp1Ph3KHwHgqp7s/Rtaig4k1ZllVw+NBoREV693jLC7u/TKiaGE7rFHTt+4AfzYspa6UHDTKU1vMJqXbWA0leV3LcvdmLMxsNl0sHPaNUQUi4T1JSzd8KJpoRQFiEtzfjlCDHqzP2McGbfxcvEJDoumD+Q7kkT+uT7/x1uyGMAPpm9fR9k7GyCZ29bLLfHoA+1tRKfvW+8aNr8P2kV8yQmCtgBM34kZRxXSeOhcwFrVqay5YUtQVcwkvEPWN/NnX55NvwD4YQRRp+IASvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcMRKXntA/E7iThiwgEG5+NXQ3bvRb0YJzWwHIuGSOA=;
 b=Sr+a3QhsUsnub/yokRkzHYUoH67g/2S03oPkHBox4ylpjZgYcU92rHWlrT1Vd/Mz/Gkmh+LdVrglippqFMV4X+JJYaPAmX0Tk+MVbRitsYfZGBsZUI3PeNrlBm/C4/C7aKm2gacpNklJ+/cT20usY/9AhuorSlT8vXrl4OGnsb69xTWF4tuRMlie290T9NvMhwQb0aGf949fXQDK7YBEOw/6mNpx85KvZ0pCypLEsPncBpHtJFNj0Z03RGsOejVI8gLP1yG9dR0HelGFLFYzhkGdzfcbnaL8Qea2RoO2/jhm3A6UXBbhDG5Dve5ra1vz+gfX2O3ufX85A5pcszGGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcMRKXntA/E7iThiwgEG5+NXQ3bvRb0YJzWwHIuGSOA=;
 b=cKp9GjkcS/m/5jqgT/VAVz/naJfdcPQMvt6bQJctGKu12IMP9kcJLEBFL4vxbwyyuNanDfh9vlNyyCpkRLt0yFHiaucEFRzQtAqQ2rSAk5mfEnP37QePOtQWh3MrmuKigabEuznsnTNSqF3tao8dFrK0u0w/AQDIo7XsV+1hHOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB5058.namprd12.prod.outlook.com (2603:10b6:610:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 06:54:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Tue, 27 Feb 2024
 06:54:12 +0000
Content-Type: multipart/alternative;
 boundary="------------NOaiJemk92ZCZTXfuzwyVx6A"
Message-ID: <df2df998-af26-4ae9-a0a4-5aac1b9e3c73@amd.com>
Date: Tue, 27 Feb 2024 07:54:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>
Cc: "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR5P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b85956f-0db0-4c9d-3323-08dc3760e781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6sj3K7juIV4UH7tMpQJJOMypm0Zzy9/fsCtM2SN4jzkhSWmGRdnxmJJHcvRSOW1utCzisg9qhmL01pywUqaumEIjhBIgwbNYfOv3TofOyE7Sm5XYy7RkMfr3P6qG339DHlMgo1YZWK178Pxa4DXkopwPkMc6JO4BfJkVymWtMtCFkVmSgw9YZgtzWu7AJPf/eCJ8OLkritdAZUZaTFNKWrRw1s4g6VOBb2b9ogvu9ttLT95GqG99khxe3HyJ7TJ4/8TQK9mRpokOC89gen6Hfh/xPzMorMS6xNCh90v9QQL1r0yxmdasplos3FA2Q34Ge23Oks0ZoCW7C1vmByBjoktNb9UlGrwkUK1ZYCmaPF4cHGtt3lVswk4wWfgHO39ThWFTbjYbpNue7wdmq/DRjDYPE+rY/lFlmqYr4cg/omFfTHNYqlndMsanc5xw9OtZZhz6ig4EHBpeaWRbvcpg0GCvb3OMgs47t6UtHElLHq6CSrPa3s3BncWlE8Y2gS2Ax2hV2WH/I9EjWQFfR3OjJav0NeD4dRnhzPbATd9/xA0f8JjiVrrKYzxBAcesnDxWh0J5YydqOBmDQH+3077nSvFCCO4mqnbmUnDM6NfVQecUWY5+3eZQoLdaAl1K2II0VoHTBAMFf7oVP3SJjaGHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzNVUlh0N3ViS2R6Z2RjWWdMQ25tdDQ3QXFBYTNUL2VuVy96V3NqdGdYQXVX?=
 =?utf-8?B?Q0xrdlU5V2RBUHd3Wit2eFUvbjNCSExJWjhWTEMvcjM4YVQwRDh1OGpHM3lm?=
 =?utf-8?B?MEduK295a3NhMXJJVWJFU0YxYmJ6c25pS054SEd2YWdIZS9TTUdKYk1JV3h6?=
 =?utf-8?B?eWxsamRWMC9pc2JrNkVGejN6ZDM1N3FFVk1jOUpxMzkrWS9MOWd6aDdhUlRY?=
 =?utf-8?B?ck5yVE43RFFJSlhDYnhSVEwvaFdMTFNvNlJicG1URkUxUXJOSEtJSUVieHB0?=
 =?utf-8?B?VU9VVXlUZVRXS2ZYWG9sKzc2SE9GMHZDNXJIcnZXV0k3bzVBZlJDZkZzdzRI?=
 =?utf-8?B?Vy9TbFdaQ2ExMnc5ZE9EWmdXZ2xOQ1VyTG9UVmE4S1dFYldMakppa2V0SEpP?=
 =?utf-8?B?TEFkT0ZuOXpybE00K2cwZjNCTFNYM0tEalF0K2NQRVFjQTd2UUNoaENCc3Vx?=
 =?utf-8?B?QUh2b29ZUGNYVWpiVlpkb1o1LytzWDdLRWdaRUtad3F2eWU0Y0JpdDlFWjFu?=
 =?utf-8?B?WFk3aEVTd1ZLRlVKS3IzWEJUdnZXeDRIQUFxM3FMa2F6NmNIUUNWN0JVYVlw?=
 =?utf-8?B?a01CVTNzRHRmRytkTXA4YXR5ak9yR2hkUTlNTDN2KzBXZGZ2OFdXQk9XQ2dQ?=
 =?utf-8?B?ZnVrbGwrbnkxVWVWV0p0NC96clVhVG5aMzhXWUd0blArcE5CVHV1VDdHdVpO?=
 =?utf-8?B?Z2I3TFpvdDV5U0YzT0RuZGE4alRZMll0TjZ3dmxMR3VsS20wbGN1WjdxSisz?=
 =?utf-8?B?cDZkS25uUHl0SDdHWFN0OXdCdlVpUUlaM0JZWHJjT2JzTFBlaE1jNVJWWkxv?=
 =?utf-8?B?TDh1YTFmYnZ2UHpDYzFtSlliZklDRGc3a1EzVnpsVllsM2lvcFh1Vk8xVDd3?=
 =?utf-8?B?ZUJtL2hkVGovbFp5eTYzVHYwYk92WEs3T2xhN3Y1UFFjRmtEZ1dvWlBuaHAx?=
 =?utf-8?B?MkFxSUUyLzFSaVdvbWVtcEM1a2JtTW0wZEh2TTkzMnp1c25kVE9ZZDJiK0h2?=
 =?utf-8?B?ckRSWVRGSGxJMTJQcTlwOTJ4akxjcVNqVytLdU9GOFpPejJWNWJGQ3JnZVlV?=
 =?utf-8?B?ZExKUnlKV01NNE8xSGo3MStaQ3NjQ3pSSWd1ZTNiaTJrYU12ajVVUUxlZHEw?=
 =?utf-8?B?Wlh1UjFjUVphN1dCeklWSlFMeGhDWWFoOUwzU2dBc0NIbjZEU2s0RC8vWTR4?=
 =?utf-8?B?Y0NNRUVxY1FtTFJ4T01sWjVOc3lvRm9hWC9QUnhvTlRWTmoyQllFWnNURkg4?=
 =?utf-8?B?Y0VEUldoUTZXc2ZoTlc0S3ZVdVd2THhlNDdJUFJmcHN6RTR1ZGhxZ2p2VTVm?=
 =?utf-8?B?bVlQZFlPaGkxZTVDdzhkVG5KZjNVUGdKZjJPTUM4NlBua0p3YzFiSkk5SFdj?=
 =?utf-8?B?aHJVY2o1WXU4NDYzM01uVDV2NnJUNE1HWm96YTRLcVNIUHlvT2dFOHR2TGR0?=
 =?utf-8?B?bkIyeHlkNGw3azJtWGNkc1ZkYjNucUlad2tsRmhJeUZjM0V6cmRBNnM1S0JM?=
 =?utf-8?B?d1BQTUZCSS8xRVJ1UElkbE1IRmQ2VjN6NVkxeUg1MWJrSlYvcVQ0REtpWHls?=
 =?utf-8?B?VDBQU3pSK3FFRk92OHlhZ1RrTnV0N1Y4Y0M1L2NzNWZPT05pVU92eTRrZ00w?=
 =?utf-8?B?ejQzUkZUM0pQUERaZ1JBamZNaHNvcy9tSEdTVDA4VzA5ZTkvUDlQYlV3VjdE?=
 =?utf-8?B?N1VIU0ZuTFRRWkxzc3RSd2NDVXJWV21zS1pCeERqY3dDbDBsKzBuOVlVd3Fs?=
 =?utf-8?B?NG1qMkRxUHFGdUh4TitXdDl6YXpuTEY5V3dTTmNQRTdMTGxjOHdjLzZjZ1lK?=
 =?utf-8?B?U0dTYWR4ZTMyNFY4KzBnR3RTU29lNTh6V0s3YXROUGM2TVJSYWhxZm9IRE5s?=
 =?utf-8?B?bGt3a1ZhYnM2RG43MFlSVFh5blpHUG80djFWbUhWZzFReGh2djBLTk1iSW1M?=
 =?utf-8?B?NzJXRVM5RUs4UnlvZmRmWklnYmJmKzNBZU1BbCtyOXlqTnEwOXUvWkpLdWlM?=
 =?utf-8?B?cEdEZmViSG5URFpUN2V0SGhvbUx0M0NIVFlYZzhVU3RwUHNsTE94TVdQOHpP?=
 =?utf-8?B?TWpxVGNIMEV3azVKK2FWVngwbTR3dXhJc2hYUHpRTmd1RmhRdUE0WFhKdlhn?=
 =?utf-8?Q?1dSZiM5VrW81wD9oKXKIuSw6Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b85956f-0db0-4c9d-3323-08dc3760e781
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 06:54:12.2671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tundUkEIzUfejF/zWM8xLYmj/EL/NqhMqIerjWKclUgAr4c1L2YRnojuDmQoJ5yQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5058
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

--------------NOaiJemk92ZCZTXfuzwyVx6A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oak,

Am 23.02.24 um 21:12 schrieb Zeng, Oak:
>
> Hi Christian,
>
> I go back this old email to ask a question.
>

sorry totally missed that one.

> Quote from your email:
>
> “Those ranges can then be used to implement the SVM feature required 
> for higher level APIs and not something you need at the UAPI or even 
> inside the low level kernel memory management.”
>
> “SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should 
> not have any influence on the design of the kernel UAPI.”
>
> There are two category of SVM:
>
>  1. driver svm allocator: this is implemented in user space,  i.g.,
>     cudaMallocManaged (cuda) or zeMemAllocShared (L0) or
>     clSVMAlloc(openCL). Intel already have gem_create/vm_bind in xekmd
>     and our umd implemented clSVMAlloc and zeMemAllocShared on top of
>     gem_create/vm_bind. Range A..B of the process address space is
>     mapped into a range C..D of the GPU address space, exactly as you
>     said.
>  2. system svm allocator:  This doesn’t introduce extra driver API for
>     memory allocation. Any valid CPU virtual address can be used
>     directly transparently in a GPU program without any extra driver
>     API call. Quote from kernel Documentation/vm/hmm.hst: “Any
>     application memory region (private anonymous, shared memory, or
>     regular file backed memory) can be used by a device transparently”
>     and “to share the address space by duplicating the CPU page table
>     in the device page table so the same address points to the same
>     physical memory for any valid main memory address in the process
>     address space”. In system svm allocator, we don’t need that A..B
>     C..D mapping.
>
> It looks like you were talking of 1). Were you?
>

No, even when you fully mirror the whole address space from a process 
into the GPU you still need to enable this somehow with an IOCTL.

And while enabling this you absolutely should specify to which part of 
the address space this mirroring applies and where it maps to.

I see the system svm allocator as just a special case of the driver 
allocator where not fully backed buffer objects are allocated, but 
rather sparse one which are filled and migrated on demand.

Regards,
Christian.

> Oak
>
> *From:*Christian König <christian.koenig@amd.com>
> *Sent:* Wednesday, January 24, 2024 3:33 AM
> *To:* Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich 
> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter 
> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>
> *Cc:* Welty, Brian <brian.welty@intel.com>; 
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; 
> Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ghimiray, Himal Prasad 
> <himal.prasad.ghimiray@intel.com>; Thomas.Hellstrom@linux.intel.com; 
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; 
> Brost, Matthew <matthew.brost@intel.com>; Gupta, saurabhg 
> <saurabhg.gupta@intel.com>
> *Subject:* Re: Making drm_gpuvm work across gpu devices
>
> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>
>     [SNIP]
>
>     Yes most API are per device based.
>
>     One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.
>
>
> Yeah and that was a big mistake in my opinion. We should really not do 
> that ever again.
>
>
>     Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).
>
>
> Exactly that thinking is what we have currently found as blocker for a 
> virtualization projects. Having SVM as device independent feature 
> which somehow ties to the process address space turned out to be an 
> extremely bad idea.
>
> The background is that this only works for some use cases but not all 
> of them.
>
> What's working much better is to just have a mirror functionality 
> which says that a range A..B of the process address space is mapped 
> into a range C..D of the GPU address space.
>
> Those ranges can then be used to implement the SVM feature required 
> for higher level APIs and not something you need at the UAPI or even 
> inside the low level kernel memory management.
>
> When you talk about migrating memory to a device you also do this on a 
> per device basis and *not* tied to the process address space. If you 
> then get crappy performance because userspace gave contradicting 
> information where to migrate memory then that's a bug in userspace and 
> not something the kernel should try to prevent somehow.
>
> [SNIP]
>
>         I think if you start using the same drm_gpuvm for multiple devices you
>
>         will sooner or later start to run into the same mess we have seen with
>
>         KFD, where we moved more and more functionality from the KFD to the DRM
>
>         render node because we found that a lot of the stuff simply doesn't work
>
>         correctly with a single object to maintain the state.
>
>     As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.
>
>
> Yes, I'm perfectly aware of that. And I can only repeat myself that I 
> see this design as a rather extreme failure. And I think it's one of 
> the reasons why NVidia is so dominant with Cuda.
>
> This whole approach KFD takes was designed with the idea of extending 
> the CPU process into the GPUs, but this idea only works for a few use 
> cases and is not something we should apply to drivers in general.
>
> A very good example are virtualization use cases where you end up with 
> CPU address != GPU address because the VAs are actually coming from 
> the guest VM and not the host process.
>
> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should 
> not have any influence on the design of the kernel UAPI.
>
> If you want to do something similar as KFD for Xe I think you need to 
> get explicit permission to do this from Dave and Daniel and maybe even 
> Linus.
>
> Regards,
> Christian.
>

--------------NOaiJemk92ZCZTXfuzwyVx6A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Oak,<br>
    <br>
    <div class="moz-cite-prefix">Am 23.02.24 um 21:12 schrieb Zeng, Oak:<br>
    </div>
    <blockquote type="cite" cite="mid:SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}span.ui-provider
	{mso-style-name:ui-provider;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}ol
	{margin-bottom:0cm;}ul
	{margin-bottom:0cm;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi Christian,<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I go back this old email to ask a question.</p>
      </div>
    </blockquote>
    <br>
    sorry totally missed that one.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Quote from your email:<o:p></o:p></p>
        <p class="MsoNormal">“Those ranges can then be used to implement
          the SVM feature required for higher level APIs and not
          something you need at the UAPI or even inside the low level
          kernel memory management.”<o:p></o:p></p>
        <p class="MsoNormal">“SVM is a high level concept of OpenCL,
          Cuda, ROCm etc.. This should not have any influence on the
          design of the kernel UAPI.”<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><span class="ui-provider">There are two
            category of SVM:<o:p></o:p></span></p>
        <ol style="margin-top:0cm" type="1" start="1">
          <li class="MsoListParagraph" style="margin-left:0cm;mso-list:l0 level1 lfo1"><span class="ui-provider">driver svm allocator: this is
              implemented in user space, &nbsp;i.g., cudaMallocManaged (cuda)
              or zeMemAllocShared (L0) or clSVMAlloc(openCL). Intel
              already have gem_create/vm_bind in xekmd and our umd
              implemented clSVMAlloc and zeMemAllocShared on top of
              gem_create/vm_bind.
            </span>Range A..B of the process address space is mapped
            into a range C..D of the GPU address space, exactly as you
            said.<span class="ui-provider"><o:p></o:p></span></li>
          <li class="MsoListParagraph" style="margin-left:0cm;mso-list:l0 level1 lfo1"><span class="ui-provider">system svm allocator: &nbsp;This doesn’t
              introduce extra driver API for memory allocation. Any
              valid CPU virtual address can be used directly
              transparently in a GPU program without any extra driver
              API call. Quote from kernel Documentation/vm/hmm.hst: “Any
              application memory region (private anonymous, shared
              memory, or regular file backed memory) can be used by a
              device transparently” and “</span><span style="color:black">to share the address space by
              duplicating the CPU page table in the device page table so
              the same address points to the same physical memory for
              any valid main memory address in the process address space</span><span class="ui-provider">”. In system svm allocator, we don’t
              need that A..B C..D mapping.</span><span class="ui-provider"><o:p></o:p></span></li>
        </ol>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">It looks like you were talking of 1). Were
          you?</p>
      </div>
    </blockquote>
    <br>
    No, even when you fully mirror the whole address space from a
    process into the GPU you still need to enable this somehow with an
    IOCTL.<br>
    <br>
    And while enabling this you absolutely should specify to which part
    of the address space this mirroring applies and where it maps to.<br>
    <br>
    I see the system svm allocator as just a special case of the driver
    allocator where not fully backed buffer objects are allocated, but
    rather sparse one which are filled and migrated on demand.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Oak<o:p></o:p></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span lang="EN-US"> Christian König
                  <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
                  <br>
                  <b>Sent:</b> Wednesday, January 24, 2024 3:33 AM<br>
                  <b>To:</b> Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>;
                  Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Dave Airlie
                  <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Daniel Vetter
                  <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Felix Kuehling
                  <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a><br>
                  <b>Cc:</b> Welty, Brian <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Bommu, Krishnaiah
                  <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Ghimiray, Himal
                  Prasad <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:Thomas.Hellstrom@linux.intel.com">Thomas.Hellstrom@linux.intel.com</a>; Vishwanathapura,
                  Niranjana <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>;
                  Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Gupta,
                  saurabhg <a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a><br>
                  <b>Subject:</b> Re: Making drm_gpuvm work across gpu
                  devices<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Am 23.01.24 um 20:37 schrieb Zeng, Oak:<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal">[SNIP] <o:p></o:p></p>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Yes most API are per device based.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal"><br>
            Yeah and that was a big mistake in my opinion. We should
            really not do that ever again.<br>
            <br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal"><br>
            Exactly that thinking is what we have currently found as
            blocker for a virtualization projects. Having SVM as device
            independent feature which somehow ties to the process
            address space turned out to be an extremely bad idea.<br>
            <br>
            The background is that this only works for some use cases
            but not all of them.<br>
            <br>
            What's working much better is to just have a mirror
            functionality which says that a range A..B of the process
            address space is mapped into a range C..D of the GPU address
            space.<br>
            <br>
            Those ranges can then be used to implement the SVM feature
            required for higher level APIs and not something you need at
            the UAPI or even inside the low level kernel memory
            management.<br>
            <br>
            When you talk about migrating memory to a device you also do
            this on a per device basis and *not* tied to the process
            address space. If you then get crappy performance because
            userspace gave contradicting information where to migrate
            memory then that's a bug in userspace and not something the
            kernel should try to prevent somehow.<br>
            <br>
            [SNIP]<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>I think if you start using the same drm_gpuvm for multiple devices you<o:p></o:p></pre>
              <pre>will sooner or later start to run into the same mess we have seen with<o:p></o:p></pre>
              <pre>KFD, where we moved more and more functionality from the KFD to the DRM<o:p></o:p></pre>
              <pre>render node because we found that a lot of the stuff simply doesn't work<o:p></o:p></pre>
              <pre>correctly with a single object to maintain the state.<o:p></o:p></pre>
            </blockquote>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal"><br>
            Yes, I'm perfectly aware of that. And I can only repeat
            myself that I see this design as a rather extreme failure.
            And I think it's one of the reasons why NVidia is so
            dominant with Cuda.<br>
            <br>
            This whole approach KFD takes was designed with the idea of
            extending the CPU process into the GPUs, but this idea only
            works for a few use cases and is not something we should
            apply to drivers in general.<br>
            <br>
            A very good example are virtualization use cases where you
            end up with CPU address != GPU address because the VAs are
            actually coming from the guest VM and not the host process.<br>
            <br>
            SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This
            should not have any influence on the design of the kernel
            UAPI.<br>
            <br>
            If you want to do something similar as KFD for Xe I think
            you need to get explicit permission to do this from Dave and
            Daniel and maybe even Linus.<br>
            <br>
            Regards,<br>
            Christian.<o:p></o:p></p>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------NOaiJemk92ZCZTXfuzwyVx6A--
