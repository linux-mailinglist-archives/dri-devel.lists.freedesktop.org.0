Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD2D83A42A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 09:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB2710E99D;
	Wed, 24 Jan 2024 08:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBCD10E97D;
 Wed, 24 Jan 2024 08:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZyK+hQ4exA/1JcTOmY6fguiH0kL058EFInFP0TZYt9ZgwsBfIltTVs8Ysnui6gdw9RC/XqFZD12Mgj8xd/osDvl61XMNUPvY2zPpP6Bl2JDWvJNfSy4L95k8r4jw6witoff3I8UAmeoHrz2znxBLg9ZL91vE0xU6Zd0eqHnuuMgsSoR+qiAQXXbIWmBPboNocDVj6slToeoGrIp3jHrVR0frOFZ/zHJnCUerfObl6L80KPbrQaEwkb/sSI1zFPzmwwHaHcyKzMc9VBSk1z9XzC3uC04cB/IqNaXqH6nvvLELuI4jYWc/pQ5Bg4PnY738apmfQtjvn/VY5fHfnARpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQfvHqFLq46cpgAt7+utqMPhNioKsP3yhXc+00TmNug=;
 b=VWE1Wn976lkc5KO89H7j/vGzu25Bz6NdkWnW/a088LsZtbCrA8lx9k5GnObfU8qkUQkRimgNyedGTUNnx1ZvAM/tO5onlMBiXVcvGT7VIi7Fy/m5FzCXgF+XVRc7CACSNtdkGGY5abMvAJATfLUK38s5K/1TDVEONp1d9JTQG00E2tvSzu/qKiApMyjHKDdOgM/fFDR2UWdsb7gVIlI2TQSlTy9TqqG5cCZM5bpFu73yzBAsrpo72DeXfXeZC1I60lv9Ti6Efec7xTB4TOM4f8KMJueRz6kZYfF0HBuXFvzqhUHu9Dvy9WtZTEHWQXNDAAGPYNBQC6kmvs9nlwx72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQfvHqFLq46cpgAt7+utqMPhNioKsP3yhXc+00TmNug=;
 b=yWcd6DFjzcrmVeRtozX017lFPHVjXey+ozGuHbM00fEpW7kl8l2rd3psNg3u3Wu7OTlQZOdd1A4K9V0aFcD8l6zZVtTxntJUuyHfSN2H7cYnHgMa3wA1o/qfve30lQ55GDkvlV7/3WLjP3WwSHJs6PDzQPi99DNSKJEW6s1uM2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 08:33:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Wed, 24 Jan 2024
 08:33:19 +0000
Content-Type: multipart/alternative;
 boundary="------------IeliQqYNaIAS8dxNHeO83bcQ"
Message-ID: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
Date: Wed, 24 Jan 2024 09:33:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ad2ba4-cb3e-448d-cc8d-08dc1cb71e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7/whFTY/g94Pw+fQLpDrwBNjlWNq3NzouEsUT7CMJ5oF9GN99SQN4+vH+BauQEb1/VV+rcbBuaTxPNL8FIkA8ql4TasdUtONvPc4FQ9JTGL38PMEQ4YAzEkW5B4hWxdkpyep9012kOP9MeeUlZEW+9hWXSdH0x2WiawzsAKakDy190WUksqGiqNna4hJQI36RiWpEK6OExFZwoj8/qA8nuyOMUG8cxS70KFNhyABS1rzk/LIvoMNIXC+aj66Z8H2TJUJoNpQy1BluYBHCEM14PSHB1046GJcLv2P7tkIHn7Kj/MVSd7ePOcqUwLm0GY5yQ3vPvrvZNYEk5rW97/czE/O0M2Q0+KAQs2fHz8B7YhrAXkv+0jtwAesXFVq4Bf1OS6VUnOrwqbFG1PnswuJyt7DB4Kv9aLdcvUR8IlzV4DaRULsjVAtB5wSpK2oW7RZceU/htBfO6TDzcigRaAmLugI2wUAhdgmuWk8GC8OqS517c5RgtTH9Uw2JaAp7wKAg1nRCFLLS3nnDyhlvawxCvGGW3aUWCtTq9AmjuhbipkySm/W838gZ9ZnPl6TPwmFMV/w5gBJMZRZreZZcXPGpqzEJRf0aRqk+KdHmy0/S3W5f2MoO5wbfkNgUn2TuVl96DVrw5IhXhY5hRxEY8adA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(8936002)(31686004)(8676002)(83380400001)(110136005)(31696002)(6512007)(86362001)(41300700001)(2906002)(478600001)(7416002)(4326008)(2616005)(26005)(36756003)(66476007)(54906003)(66556008)(6636002)(316002)(66946007)(6666004)(6486002)(33964004)(6506007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJacU9JazdmcUNmYW1FcFNGcW4ybVRXR1VuemV1VGJKYlBUYnYzclNFdTAw?=
 =?utf-8?B?bUpnVWsvYW04enk5aGhVQm9WWFMvUU9hQUpMN0dGdExDZWR4aHErUzdpQVh4?=
 =?utf-8?B?MmZ5eFFYcUcrREQ4dUhMVWIxK3lqWUIya1FqSEQ4M1JmNzZrdFlSOUg1VTBF?=
 =?utf-8?B?cTF4K0FudHFoSkkrSGNtTTY4YTQrZmoxUk1MUnZ1UFJyR3dPWW14MmlnUm0v?=
 =?utf-8?B?QldkVUNYL0pSTzIzbjh4NmdvSFFCQVpmK210MU1VQk9hU2dTSS9sL3pKMWN6?=
 =?utf-8?B?bDBoMzN3TFlNekp4dm1rM3BpT3VNdnN5eWV4ald3aVgzeVlhaXNmMktieEdt?=
 =?utf-8?B?R2ppM3kxVU9lWFQ2TlJ6b3MrODhpRXIwclNDWldUdkxQVHZFYk9OUUh3Wmhj?=
 =?utf-8?B?Vi9ZWGhwMk9tMEhhZ1F5T3NCRXROWnlNQUxvYWJLN1hnVkxKeEt4QlptOTdY?=
 =?utf-8?B?WlkxL0tVdWszMUNlZ0pZUlR2VHZLa0I2VTMxRkluNDRlMGZsUEhSVk02Qm15?=
 =?utf-8?B?QlpPd3dMNURoL21UczMzakNCUTVibXpvdGVNaFA4ODJycTV0VWMwNUxSSDRu?=
 =?utf-8?B?RzhnZnM5d0o2ZUhKUU9qUytTM2RmZVpXMkhIOEhoVWhMMmdWN0MxMVRhVnhQ?=
 =?utf-8?B?aFA5THBJMGx3ZWVTRU44NFloZTR1ODRzSEw4Z0FBbkhIZ0JnWm01RVlRN2Z2?=
 =?utf-8?B?ZjM4QlQwOEhRbTdrZnhlaUdYRVIza255V3lWdHRjbnBxajdzUGVPeGVuT1lm?=
 =?utf-8?B?SUdGMnNjRmRYdGRhN1BtNGhpeFdjbmFRRXNFWG1vQVI5clljRkpUdmpOOXhi?=
 =?utf-8?B?c2dzbjkrZlJXazFwUy9sOGNvUHdiSTNmUU93T0hVV0U0dVVhbG0za0ZzalYr?=
 =?utf-8?B?dWpVdGxRSVZjUkt3V1ZSQm9XMkYwYkVnL1dmd3dvc1pzSW9PazQ3Y1lxL2Yz?=
 =?utf-8?B?UjEzcUE2OTJqZXFEdzdtVEpHVVB5dkRFUHZvVVlvLzNZU3pmS1c5NUcxVnB2?=
 =?utf-8?B?c1JIbHRKMVczNUdESnhaOFNvN2RnTzhyOENEc1Z4Uk44SmVncnNFSkFtcjBo?=
 =?utf-8?B?T2NnMjVnemY2WmNwa2tRemd0eE5CZnl2R0IvcUhRT0hPV1dISnZIK0VxZ1V6?=
 =?utf-8?B?K1dLNUlpU0tuTFo5SENhU2pycEJCNFhBQUJHRi95dGN4VmxCYzc5QXJUQnBw?=
 =?utf-8?B?eC8wMDFuV250anVnSE9FWW5OdEZtVFZuUmdzVWhkdjFBYTJ5MHNndzVBNEky?=
 =?utf-8?B?bzdtUHY2UUtLWTgvN01pTkg0Q05lVnI3NG5LU3FLNTV0MnVGQUtyVkQwTk5L?=
 =?utf-8?B?QThWZVVCMXZrT21xcXA0L201a0dIMWFnQjdaU3RxQU41Zkc3bWQway9rUDBX?=
 =?utf-8?B?MTB0TmE3bzRFR2dXcllYK0V1SHZySTg5eXp1TE5rTTdIS2dld3g2OXhPdVg0?=
 =?utf-8?B?T3VxWjlENk9nMVBNcHhaSm53cExiT0wycGcwOGYxNTFRcHFyRUFFbmdLMUdY?=
 =?utf-8?B?eTl2QlpKeUZDeFkzM21Ub3Z5eG9nS3pyOW1uQU1tWUl3a1cyYlk5VytCV3Y2?=
 =?utf-8?B?N1BRS08yR0hJbGZhY0YzOGttaHNrbTM1Y2gyVXlEZzl1WHVYU1Y5b0kxZW9J?=
 =?utf-8?B?Qis2ZS9YWmYxNHY5a09qMmludmd1RlgyTWkyZUQ1QlhlNW5VcXlRUGlKS21Q?=
 =?utf-8?B?dUw2OUp5M1IzMjlwUHNydUxsM3FLQkR1eGJrVjJMc1lBL04wRnl0anMzdFNW?=
 =?utf-8?B?cWRyZjkxeWlIYjJCb2JjdFhQR1BTVHZ2S3BScDg3cjdKWU03UlFyOTZLc3g3?=
 =?utf-8?B?eGtkQ0UzV0FvZmtic0REK3NZNWI3VG1uWjU4dTVXRzZZSHFCaVpPZkFYVmI4?=
 =?utf-8?B?VG82QlJPVElYQUtlUU1TeklIK1RhN3QyWGpJZjJjelVabDNucC85Q1FBN21Y?=
 =?utf-8?B?ZmlSZFZMenZjbUI0RGVxbGhMT0thNS9SRUwySkFxYlNBQTczWEhWczE3Y05C?=
 =?utf-8?B?T0h3SDhQYlFiQVR5Y0Urb0dJMnhXdHNPSGE3VHgyNllWRUpyQTJMZE1oUmJO?=
 =?utf-8?B?Y1hyKzJwTFRUcXpzbzdoemxuaGVUcXJoeTh5dWwwQTFMWk9keVpLK2JwaVpu?=
 =?utf-8?Q?WoUOGBpyZs/rrU3TBsqGjbAHr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ad2ba4-cb3e-448d-cc8d-08dc1cb71e57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 08:33:19.4599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JG1VYDJFnRKoyNi/5M8uaziCwFCDNZTkFVkgzhWGgNH0pbwmh6hZwmkpim6uQnqV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456
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
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------IeliQqYNaIAS8dxNHeO83bcQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 23.01.24 um 20:37 schrieb Zeng, Oak:
> [SNIP]
> Yes most API are per device based.
>
> One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.

Yeah and that was a big mistake in my opinion. We should really not do 
that ever again.

> Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).

Exactly that thinking is what we have currently found as blocker for a 
virtualization projects. Having SVM as device independent feature which 
somehow ties to the process address space turned out to be an extremely 
bad idea.

The background is that this only works for some use cases but not all of 
them.

What's working much better is to just have a mirror functionality which 
says that a range A..B of the process address space is mapped into a 
range C..D of the GPU address space.

Those ranges can then be used to implement the SVM feature required for 
higher level APIs and not something you need at the UAPI or even inside 
the low level kernel memory management.

When you talk about migrating memory to a device you also do this on a 
per device basis and *not* tied to the process address space. If you 
then get crappy performance because userspace gave contradicting 
information where to migrate memory then that's a bug in userspace and 
not something the kernel should try to prevent somehow.

[SNIP]
>> I think if you start using the same drm_gpuvm for multiple devices you
>> will sooner or later start to run into the same mess we have seen with
>> KFD, where we moved more and more functionality from the KFD to the DRM
>> render node because we found that a lot of the stuff simply doesn't work
>> correctly with a single object to maintain the state.
> As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.

Yes, I'm perfectly aware of that. And I can only repeat myself that I 
see this design as a rather extreme failure. And I think it's one of the 
reasons why NVidia is so dominant with Cuda.

This whole approach KFD takes was designed with the idea of extending 
the CPU process into the GPUs, but this idea only works for a few use 
cases and is not something we should apply to drivers in general.

A very good example are virtualization use cases where you end up with 
CPU address != GPU address because the VAs are actually coming from the 
guest VM and not the host process.

SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should not 
have any influence on the design of the kernel UAPI.

If you want to do something similar as KFD for Xe I think you need to 
get explicit permission to do this from Dave and Daniel and maybe even 
Linus.

Regards,
Christian.
--------------IeliQqYNaIAS8dxNHeO83bcQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 23.01.24 um 20:37 schrieb Zeng, Oak:<br>
    <blockquote type="cite" cite="mid:SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""></pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes most API are per device based.

One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.</pre>
    </blockquote>
    <br>
    Yeah and that was a big mistake in my opinion. We should really not
    do that ever again.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).</pre>
    </blockquote>
    <br>
    Exactly that thinking is what we have currently found as blocker for
    a virtualization projects. Having SVM as device independent feature
    which somehow ties to the process address space turned out to be an
    extremely bad idea.<br>
    <br>
    The background is that this only works for some use cases but not
    all of them.<br>
    <br>
    What's working much better is to just have a mirror functionality
    which says that a range A..B of the process address space is mapped
    into a range C..D of the GPU address space.<br>
    <br>
    Those ranges can then be used to implement the SVM feature required
    for higher level APIs and not something you need at the UAPI or even
    inside the low level kernel memory management.<br>
    <br>
    When you talk about migrating memory to a device you also do this on
    a per device basis and *not* tied to the process address space. If
    you then get crappy performance because userspace gave contradicting
    information where to migrate memory then that's a bug in userspace
    and not something the kernel should try to prevent somehow.<br>
    <br>
    [SNIP]<br>
    <blockquote type="cite" cite="mid:SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com"><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I think if you start using the same drm_gpuvm for multiple devices you
will sooner or later start to run into the same mess we have seen with
KFD, where we moved more and more functionality from the KFD to the DRM
render node because we found that a lot of the stuff simply doesn't work
correctly with a single object to maintain the state.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.</pre>
    </blockquote>
    <br>
    Yes, I'm perfectly aware of that. And I can only repeat myself that
    I see this design as a rather extreme failure. And I think it's one
    of the reasons why NVidia is so dominant with Cuda.<br>
    <br>
    This whole approach KFD takes was designed with the idea of
    extending the CPU process into the GPUs, but this idea only works
    for a few use cases and is not something we should apply to drivers
    in general.<br>
    <br>
    A very good example are virtualization use cases where you end up
    with CPU address != GPU address because the VAs are actually coming
    from the guest VM and not the host process.<br>
    <br>
    SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
    not have any influence on the design of the kernel UAPI.<br>
    <br>
    If you want to do something similar as KFD for Xe I think you need
    to get explicit permission to do this from Dave and Daniel and maybe
    even Linus.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------IeliQqYNaIAS8dxNHeO83bcQ--
