Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB16486C5B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276310E3CA;
	Thu, 29 Feb 2024 09:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S3JHCsjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296810E34C;
 Thu, 29 Feb 2024 09:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrq4jIfljETosXtZJXeA69IYDNYZPF0oFhBuSuttN6PBNa7M7ec2eGF8W21OZE97KYNihxFWb6M2Ylzu5FwmlvFeMEUiWRAnhQtG4FJUbO3VrmMuwsnMstUFX7VGOTeU7pfH3zwijccECfpfRi2Xjyh5BvT+pz3fx98O/nWdFXdqUgKpnafcUVSQKO38AUcb8laF0JX6f9TyVSebSx5CeNOR//DpvszP0YZolEAZTB4XCKW9kcVcIQsyfkkVOTLF6DMiK/W3CxC9T/J5q/hL3gan8ikG/r3iGVblJtzK71OSwy9s2Bld2Xt9ne0z2Ej7Lh53DPQgkdyHqSQ+z3qCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWYX3h7ebScijFeL3Qo7T/ZPD0WZGQlg1ieNzTKePWA=;
 b=XfDqItrrhQwMzO/X3a/STW7DxPyyP7IS0TZmWD7BsIhNydSOMxzoVr4rju2gyCnohHCi9nrSIz/dBcDiXklZzJL/wcuOlJt+HH4j7s8ZtoUYEKPHoesBs7Y21rXxw9Lw6JQpG+eRuJyl74xe1u6+4ubaSOiuDrNjnvrhqOkniPBKnQNwNW39iiiI/XrimlSzrKDvwFLIj7niu9cUj04FexMtPXjHfmDz21WLUajjsGGJTfTVTR7dAl2fFbaau0n74CIOcAGGWC+msvfeRoVZs0mMgSQyUBroGyIV+97ULRHT2bXCLhX6LAjYN4E63Fs6O8//sWk2qUdkymdhR7sIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWYX3h7ebScijFeL3Qo7T/ZPD0WZGQlg1ieNzTKePWA=;
 b=S3JHCsjMIX66dP5z/AgMCL2UneOTab+OEKgSmcdkGtHZnzzn3MNi8ppiCh4coYScM+jTpe5+MG2zgS8CBF/GVh11noXQ/F2M/rE6djcezeBRNQtklkkOWCK1MOOCznnzT1HpOfmClOjX1qQvsDNlZ9Ftd0WSR5yQmefg/2LXbKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 09:41:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Thu, 29 Feb 2024
 09:41:30 +0000
Content-Type: multipart/alternative;
 boundary="------------6thb4d74p0ITt3oJxb4h3ERf"
Message-ID: <ada8e6cc-a7d2-4b6f-8f70-f0448cc2e420@amd.com>
Date: Thu, 29 Feb 2024 10:41:24 +0100
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
 <df2df998-af26-4ae9-a0a4-5aac1b9e3c73@amd.com>
 <SA1PR11MB6991786DA69422A1A6095A1E92592@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 42629766-3956-4580-bd9b-08dc390a9b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/dGISAVxyxneHPI3y+NmKff/NzWUdkkueunCWRivQlT6GLcW2PHXEwafilJfKW95NZyekjWQ8pt1zUtQ6mfBIFCswbp8ka6UWgr5BSm4/lYZ+fIfDld7Fjlq/1AFwi/2S9+GZIE8kTWsV0erxaGWZeTdgyz5U49WPVJW8dtvAH84U8uoLLO1wfB7UWDwCfhKtPB3gpNOUW+n09MrrJGPPGmtotAmNxOLIWRx3SQXzU92Ch1dsRj5rqrZifylBbXVK0sEKEoQxE2ewuDXn8Apn2ey9SWC3IcbpOzJhlGcShjbNX/ZzBFDTFnfa7x8Ahj/iwDHRM16JZ2CU2Lux9+GWclYMYIsVvSO6Y45CAYbcoYuVqs9Hb2Uh/e4ciBTAZJeuN9DrtN/YIQ6u7iA4+YYnhFHmvvzTsK2JRGf+t1D+6HfE5gT46q90RU5aMqiwNwC6X9hjMPJE96HcCbEdKFjNH6P7oIXIymc1SP/t9jTRR5dKp2xrzhGHlxMC43PctNGUQN+ryBqvDrjTUvsoBZlD5awVAR1I7uiHjMvdBco8UJtcmEpo+Q8x39lIPyGSIFAZxLD2fDuyUSlJP47wVSFLTCIcmVwBlOdpC3CuXx9cwX+s10gY4pNGJ5Qb1C67W7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1V1U1Axektla29XUWFIZ0l3RkJYRWNwdktncTQ1c05qbHJCZldGcFV0bFg1?=
 =?utf-8?B?S3Y3d09LZ0xadUc1YjJuTVhxcHhrRmV6NmxYbU9YZEgvQmR6c1lMVm1PRTUr?=
 =?utf-8?B?aFVaVEN5a1Fab29lQXg4NW9sdzRwcVlKbVVHZThMRE1UMStwVis2UG9hWmRT?=
 =?utf-8?B?dW9XTllyY0t4TmhOMzhvdjZibTdvT3lLQ21rRll3U1drSkdiMDdTMmF3MzVC?=
 =?utf-8?B?c1dKT0pBWTFVclJWUmZUa0RkeEhlKzUxMFE2em1VcmhBY2pqWGVTTFRKeElB?=
 =?utf-8?B?L1NkZE9KLzV1K05kbWxxcjQrb0JuOVpkdzJRMU9LTmFSR1A3OXdoakZobXlT?=
 =?utf-8?B?S0w4a3cySEkzSm5OeEZja3VyWURDUDVzdHA1a0FDcG4xZktuRlZrSkFLT0tY?=
 =?utf-8?B?QVRsWm1VOGE2UHhiV2JTbWlCU0Y3aGdZY0szYXJsRDYvQXQydzVmU3o5L2tI?=
 =?utf-8?B?WkZvM3pjVkRROEEyYUFEOVpDWHZ0czcyTnJCdGRMcVVzLzc1WUFxdGRRak5H?=
 =?utf-8?B?TGQ4cEpIQzZHM09WYktwcTgxMWZFQmlMdmU5am5wV1hINkVSU3B0TFNpVVFu?=
 =?utf-8?B?UjRKeDQwbElRQXorYVEyQ3IrN2UzNGFyaUhDQWRsTTkvcEljR1hZMTNDNXY5?=
 =?utf-8?B?WkVxYXg0czdNMjZlRXc5ZEZYMkJCeEJFNkQxUXQ0TFdBMFJ5YWtUR1pMNzFC?=
 =?utf-8?B?b0hSOHN2Q2U5WWZlQlVETzMzcmo0R0hCalBoeUpuWElBZ2NpK2ZVSzBTakxi?=
 =?utf-8?B?eEppSTU1dEtVcm0yNjhQS2x0VXlxR29BcCt4V1pHRTEyMGhDemlPZXpnWGV1?=
 =?utf-8?B?d0xwMXdnMERPOTA1alJZSFhIT2ZNaFFxYXhOSDFiZjdLdW1KSWM3Zm82OWdX?=
 =?utf-8?B?cllOY0xWMUYwbFUxZTBJV1VzK0g0bVA1TEtheTRjQmJCMnNtMEZZejREVlFr?=
 =?utf-8?B?cmdVOXl2YkRXWm5JcnUreVVIUWVIbUJEeXJzUm4yMi9KZVltSWowaW9TMVJq?=
 =?utf-8?B?aFFUbUtCc0psR1pxWE0rRVROVnkyWkFwMmpFaElQbDcvT0F1cWdVQTloTDY0?=
 =?utf-8?B?YTVYZ1BOYmEvNEl3U2k1Q0IvczZkeUpSS2ExTDV2ZTRpcENmL1dWR1lDdDQx?=
 =?utf-8?B?cW9qbnVVKzRYck1aZTlOcmRJbGtWNCswdDl5ckhGRkxDcmVxK3hwbzVvbVh3?=
 =?utf-8?B?bWRiQ2JIL0hPUWxydTVYR0NaZ05LdHEzUTNpOTFOYjlMK3RTWU1YcHljNE8w?=
 =?utf-8?B?WnMrVFR2RWFlejhFZXB6R291STVYdUExbnMrRjZOUTVLalRqK0tlUnI0TU1p?=
 =?utf-8?B?NDRQV0k3UTlNb1hzcUduLzcwQVFIVUNOYVAzU1c1ZktHMVZ1SzhWWnMxZjZn?=
 =?utf-8?B?eFJQeTBaMWNNMk54K3puSEFsZVVsYnRVTUQ3cyswWUZnS1kwSHk1WFo0RXJo?=
 =?utf-8?B?UGtrekhSdEs0dUZZYmlCakpVQ1NpbzN3V25UdTRrbzdXemxHSGZvMlJtbTY5?=
 =?utf-8?B?ZGd6eVV1LzFmeEFUSDBrRVNPVzVjSyttV1NsLzg1cFZQWnlvZ1VmU0lFRDBp?=
 =?utf-8?B?UzczVDNWdk5mY0RQczNPczZvZ1ZLS3cxQjRMM2M3cW04aHZHcnZwVitKZC9U?=
 =?utf-8?B?R2d3b3FMNVdPS25wekdvdy9Idm4zenV1Q1FsTnNDRFVEb1NIVmhPRVN5VWh0?=
 =?utf-8?B?WXBJTFplemthNitNY29qQ1A5UW5UcjBKalFORU9va0VQeElMNG5xZzdoVC9C?=
 =?utf-8?B?TVpkcEVWbkhrQWJzU1RHMUNBV3pyd0FkaWRENzZvbURXSFJRZTRPY1NoRHdH?=
 =?utf-8?B?NWZNWTltTEVpRllCQkJGTHVSOS9UZWZDUjJlWHdEeUl6MW9mUXVQdUtHR0Vi?=
 =?utf-8?B?ZlNlcURhQTFuMCs4QUt4dmR4TTBSVG5KQW9SaFNmcFhBTmtBd3l6YkNtS0dT?=
 =?utf-8?B?ZFJPS3M3YmdCYmRJSWVpRDBNamM5M1k2Ky9lQ05qVkFsbGhSbVVsNnJuVVM0?=
 =?utf-8?B?d2huTW56RE1EVXNIYS9IZHBUM2V5SnBXcUpZL2lOZVBDSHBOak1saDVBdHlU?=
 =?utf-8?B?MFVWT0wyWHdJejQyNGxyS25tR1o1OFE4cVY4VFRDS1RYZmR5UTY2eDNXdWVm?=
 =?utf-8?Q?CpSsn9MLb5pIDD7FlZ6Oniz4g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42629766-3956-4580-bd9b-08dc390a9b82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 09:41:30.3743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mho86dCauwA6dA6jAHTfdwnGaJol2GpeHUp6hBdxqX4iiEQyhXunSB/uCjNNs9A1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726
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

--------------6thb4d74p0ITt3oJxb4h3ERf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.02.24 um 20:51 schrieb Zeng, Oak:
>
> The mail wasn’t indent/preface correctly. Manually format it.
>
> *From:*Christian König <christian.koenig@amd.com>
> *Sent:* Tuesday, February 27, 2024 1:54 AM
> *To:* Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich 
> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter 
> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>; 
> jglisse@redhat.com
> *Cc:* Welty, Brian <brian.welty@intel.com>; 
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; 
> Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ghimiray, Himal Prasad 
> <himal.prasad.ghimiray@intel.com>; Thomas.Hellstrom@linux.intel.com; 
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; 
> Brost, Matthew <matthew.brost@intel.com>; Gupta, saurabhg 
> <saurabhg.gupta@intel.com>
> *Subject:* Re: Making drm_gpuvm work across gpu devices
>
> Hi Oak,
>
> Am 23.02.24 um 21:12 schrieb Zeng, Oak:
>
>     Hi Christian,
>
>     I go back this old email to ask a question.
>
>
> sorry totally missed that one.
>
>     Quote from your email:
>
>     “Those ranges can then be used to implement the SVM feature
>     required for higher level APIs and not something you need at the
>     UAPI or even inside the low level kernel memory management.”
>
>     “SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This
>     should not have any influence on the design of the kernel UAPI.”
>
>     There are two category of SVM:
>
>     1.driver svm allocator: this is implemented in user space,  i.g.,
>     cudaMallocManaged (cuda) or zeMemAllocShared (L0) or
>     clSVMAlloc(openCL). Intel already have gem_create/vm_bind in xekmd
>     and our umd implemented clSVMAlloc and zeMemAllocShared on top of
>     gem_create/vm_bind. Range A..B of the process address space is
>     mapped into a range C..D of the GPU address space, exactly as you
>     said.
>
>     2.system svm allocator:  This doesn’t introduce extra driver API
>     for memory allocation. Any valid CPU virtual address can be used
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
>     It looks like you were talking of 1). Were you?
>
>
> No, even when you fully mirror the whole address space from a process 
> into the GPU you still need to enable this somehow with an IOCTL.
>
> And while enabling this you absolutely should specify to which part of 
> the address space this mirroring applies and where it maps to.
>
> */[Zeng, Oak] /*
>
> Lets say we have a hardware platform where both CPU and GPU support 
> 57bit(use it for example. The statement apply to any address range) 
> virtual address range, how do you decide “which part of the address 
> space this mirroring applies”? You have to mirror the whole address 
> space [0~2^57-1], do you? As you designed it, the gigantic 
> vm_bind/mirroring happens at the process initialization time, and at 
> that time, you don’t know which part of the address space will be used 
> for gpu program. Remember for system allocator, *any* valid CPU 
> address can be used for GPU program.  If you add an offset to 
> [0~2^57-1], you get an address out of 57bit address range. Is this a 
> valid concern?
>

Well you can perfectly mirror on demand. You just need something similar 
to userfaultfd() for the GPU. This way you don't need to mirror the full 
address space, but can rather work with large chunks created on demand, 
let's say 1GiB or something like that.

The virtual address space is basically just a hardware functionality to 
route memory accesses. While the mirroring approach is a very common use 
case for data-centers and high performance computing there are quite a 
number of different use cases which makes use of virtual address space 
in a non "standard" fashion. The native context approach for VMs is just 
one example, databases and emulators are another one.

>
>
> I see the system svm allocator as just a special case of the driver 
> allocator where not fully backed buffer objects are allocated, but 
> rather sparse one which are filled and migrated on demand.
>
> */[Zeng, Oak] /*
>
> Above statement is true to me. We don’t have BO for system svm 
> allocator. It is a sparse one as we can sparsely map vma to GPU. Our 
> migration policy decide which pages/how much of the vma is 
> migrated/mapped to GPU page table.
>
> *//*
>
> The difference b/t your mind and mine is, you want a gigantic vma 
> (created during the gigantic vm_bind) to be sparsely populated to gpu. 
> While I thought vma (xe_vma in xekmd codes) is a place to save memory 
> attributes (such as caching, user preferred placement etc). All those 
> memory attributes are range based, i.e., user can specify range1 is 
> cached while range2 is uncached. So I don’t see how you can manage it 
> with the gigantic vma. Do you split your gigantic vma later to save 
> range based memory attributes?
>

Yes, exactly that. I mean the splitting and eventually merging of ranges 
is a standard functionality of the GPUVM code.

So when you need to store additional attributes per range then I would 
strongly suggest to make use of this splitting and merging functionality 
as well.

So basically an IOCTL which says range A..B of the GPU address space is 
mapped to offset X of the CPU address space with parameters Y (caching, 
migration behavior etc..). That is essentially the same we have for 
mapping GEM objects, the provider of the backing store is just something 
different.

Regards,
Christian.

> Regards,
>
> Oak
>
>
>
> Regards,
> Christian.
>

--------------6thb4d74p0ITt3oJxb4h3ERf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 28.02.24 um 20:51 schrieb Zeng, Oak:<br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.ui-provider
	{mso-style-name:ui-provider;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
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
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">The mail wasn’t indent/preface correctly.
          Manually format it.</p>
        <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class="MsoNormal" style="margin-left:36.0pt"><b><span lang="EN-US">From:</span></b><span lang="EN-US">
                  Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
                  <br>
                  <b>Sent:</b> Tuesday, February 27, 2024 1:54 AM<br>
                  <b>To:</b> Zeng, Oak &lt;<a href="mailto:oak.zeng@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">oak.zeng@intel.com</a>&gt;;
                  Danilo Krummrich &lt;<a href="mailto:dakr@redhat.com" moz-do-not-send="true" class="moz-txt-link-freetext">dakr@redhat.com</a>&gt;;
                  Dave Airlie &lt;<a href="mailto:airlied@redhat.com" moz-do-not-send="true" class="moz-txt-link-freetext">airlied@redhat.com</a>&gt;;
                  Daniel Vetter &lt;<a href="mailto:daniel@ffwll.ch" moz-do-not-send="true" class="moz-txt-link-freetext">daniel@ffwll.ch</a>&gt;;
                  Felix Kuehling &lt;<a href="mailto:felix.kuehling@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">felix.kuehling@amd.com</a>&gt;;
                  <a href="mailto:jglisse@redhat.com" moz-do-not-send="true" class="moz-txt-link-freetext">jglisse@redhat.com</a><br>
                  <b>Cc:</b> Welty, Brian &lt;<a href="mailto:brian.welty@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">brian.welty@intel.com</a>&gt;;
                  <a href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true" class="moz-txt-link-freetext">dri-devel@lists.freedesktop.org</a>;
                  <a href="mailto:intel-xe@lists.freedesktop.org" moz-do-not-send="true" class="moz-txt-link-freetext">intel-xe@lists.freedesktop.org</a>;
                  Bommu, Krishnaiah &lt;<a href="mailto:krishnaiah.bommu@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">krishnaiah.bommu@intel.com</a>&gt;;
                  Ghimiray, Himal Prasad &lt;<a href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;;
                  <a href="mailto:Thomas.Hellstrom@linux.intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">Thomas.Hellstrom@linux.intel.com</a>;
                  Vishwanathapura, Niranjana &lt;<a href="mailto:niranjana.vishwanathapura@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">niranjana.vishwanathapura@intel.com</a>&gt;;
                  Brost, Matthew &lt;<a href="mailto:matthew.brost@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">matthew.brost@intel.com</a>&gt;;
                  Gupta, saurabhg &lt;<a href="mailto:saurabhg.gupta@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">saurabhg.gupta@intel.com</a>&gt;<br>
                  <b>Subject:</b> Re: Making drm_gpuvm work across gpu
                  devices<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal" style="mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;margin-left:36.0pt">
            Hi Oak,<o:p></o:p></p>
          <div>
            <p class="MsoNormal" style="margin-left:36.0pt">Am 23.02.24
              um 21:12 schrieb Zeng, Oak:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal" style="margin-left:36.0pt">Hi
              Christian,<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">I go back
              this old email to ask a question.<o:p></o:p></p>
          </blockquote>
          <p class="MsoNormal" style="mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;margin-left:36.0pt">
            <br>
            sorry totally missed that one.<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal" style="margin-left:36.0pt">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">Quote from
              your email:<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">“Those
              ranges can then be used to implement the SVM feature
              required for higher level APIs and not something you need
              at the UAPI or even inside the low level kernel memory
              management.”<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">“SVM is a
              high level concept of OpenCL, Cuda, ROCm etc.. This should
              not have any influence on the design of the kernel UAPI.”<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt"><span class="ui-provider">There are two category of SVM:</span><o:p></o:p></p>
            <p class="MsoListParagraph" style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l0 level1 lfo3">
              <!--[if !supportLists]--><span style="mso-list:Ignore">1.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span></span><!--[endif]--><span class="ui-provider">driver
                svm allocator: this is implemented in user space, &nbsp;i.g.,
                cudaMallocManaged (cuda) or zeMemAllocShared (L0) or
                clSVMAlloc(openCL). Intel already have
                gem_create/vm_bind in xekmd and our umd implemented
                clSVMAlloc and zeMemAllocShared on top of
                gem_create/vm_bind. </span>Range A..B of the process
              address space is mapped into a range C..D of the GPU
              address space, exactly as you said.<o:p></o:p></p>
            <p class="MsoListParagraph" style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l0 level1 lfo3">
              <!--[if !supportLists]--><span style="mso-list:Ignore">2.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span></span><!--[endif]--><span class="ui-provider">system
                svm allocator: &nbsp;This doesn’t introduce extra driver API
                for memory allocation. Any valid CPU virtual address can
                be used directly transparently in a GPU program without
                any extra driver API call. Quote from kernel
                Documentation/vm/hmm.hst: “Any application memory region
                (private anonymous, shared memory, or regular file
                backed memory) can be used by a device transparently”
                and “</span><span style="color:black">to share the
                address space by duplicating the CPU page table in the
                device page table so the same address points to the same
                physical memory for any valid main memory address in the
                process address space</span><span class="ui-provider">”.
                In system svm allocator, we don’t need that A..B C..D
                mapping.</span><o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">&nbsp;<o:p></o:p></p>
            <p class="MsoNormal" style="margin-left:36.0pt">It looks
              like you were talking of 1). Were you?<o:p></o:p></p>
          </blockquote>
          <p class="MsoNormal" style="margin-left:36.0pt"><br>
            No, even when you fully mirror the whole address space from
            a process into the GPU you still need to enable this somehow
            with an IOCTL.<br>
            <br>
            And while enabling this you absolutely should specify to
            which part of the address space this mirroring applies and
            where it maps to.<o:p></o:p></p>
          <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal"><b><i>[Zeng, Oak] </i></b><o:p></o:p></p>
          <p class="MsoNormal">Lets say we have a hardware platform
            where both CPU and GPU support 57bit(use it for example. The
            statement apply to any address range) virtual address range,
            how do you decide “which part of the address space this
            mirroring applies”? You have to mirror the whole address
            space [0~2^57-1], do you? As you designed it, the gigantic
            vm_bind/mirroring happens at the process initialization
            time, and at that time, you don’t know which part of the
            address space will be used for gpu program. Remember for
            system allocator, *any* valid CPU address can be used for
            GPU program. &nbsp;If you add an offset to [0~2^57-1], you get an
            address out of 57bit address range. Is this a valid concern?</p>
        </div>
      </div>
    </blockquote>
    <br>
    Well you can perfectly mirror on demand. You just need something
    similar to userfaultfd() for the GPU. This way you don't need to
    mirror the full address space, but can rather work with large chunks
    created on demand, let's say 1GiB or something like that.<br>
    <br>
    The virtual address space is basically just a hardware functionality
    to route memory accesses. While the mirroring approach is a very
    common use case for data-centers and high performance computing
    there are quite a number of different use cases which makes use of
    virtual address space in a non &quot;standard&quot; fashion. The native
    context approach for VMs is just one example, databases and
    emulators are another one.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
          <p class="MsoNormal"><o:p></o:p></p>
          <p class="MsoNormal" style="margin-left:36.0pt"><br>
            <br>
            I see the system svm allocator as just a special case of the
            driver allocator where not fully backed buffer objects are
            allocated, but rather sparse one which are filled and
            migrated on demand.<o:p></o:p></p>
          <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal"><b><i>[Zeng, Oak] <o:p></o:p></i></b></p>
          <p class="MsoNormal">Above statement is true to me. We don’t
            have BO for system svm allocator. It is a sparse one as we
            can sparsely map vma to GPU. Our migration policy decide
            which pages/how much of the vma is migrated/mapped to GPU
            page table.<o:p></o:p></p>
          <p class="MsoNormal"><b><i><o:p>&nbsp;</o:p></i></b></p>
          <p class="MsoNormal">The difference b/t your mind and mine is,
            you want a gigantic vma (created during the gigantic
            vm_bind) to be sparsely populated to gpu. While I thought
            vma (xe_vma in xekmd codes) is a place to save memory
            attributes (such as caching, user preferred placement etc).
            All those memory attributes are range based, i.e., user can
            specify range1 is cached while range2 is uncached. So I
            don’t see how you can manage it with the gigantic vma. Do
            you split your gigantic vma later to save range based memory
            attributes?</p>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, exactly that. I mean the splitting and eventually merging of
    ranges is a standard functionality of the GPUVM code.<br>
    <br>
    So when you need to store additional attributes per range then I
    would strongly suggest to make use of this splitting and merging
    functionality as well.<br>
    <br>
    So basically an IOCTL which says range A..B of the GPU address space
    is mapped to offset X of the CPU address space with parameters Y
    (caching, migration behavior etc..). That is essentially the same we
    have for mapping GEM objects, the provider of the backing store is
    just something different.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
          <p class="MsoNormal"><o:p></o:p></p>
          <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Regards,<o:p></o:p></p>
          <p class="MsoNormal">Oak <o:p></o:p></p>
          <p class="MsoNormal" style="mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;margin-left:36.0pt">
            <br>
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            <o:p></o:p></p>
          <p class="MsoNormal" style="margin-left:36.0pt"><o:p>&nbsp;</o:p></p>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6thb4d74p0ITt3oJxb4h3ERf--
