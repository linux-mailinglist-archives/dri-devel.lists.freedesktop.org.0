Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4318543FD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5294B10E54F;
	Wed, 14 Feb 2024 08:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hpy6vuLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3809C10E54F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG5NgRaTs8Ocn3w6Icg4BcEqzp/Sh3Dva2Ycz49oM2wjgk3ki2k3KhXh/ibSlDwnzKOHXxEQVjeGqRu5ixOjAqD3psFUc1cKR77ZYuw+HWqgf56WCKyw/clT6vA6Y76R1Nu2rbeR5H9th5iXKBgaljNc63fYlzbevBA3UaiT3FSdPtHSDs4H7ShlHAuC77etkU3vEldcfNVjifZCuOwPporpzETxegYGCG+gKt0+LHS/k4H6k95xdwcr+7BlktxCMuucuZ06KxdqOrGWqZxL9ag5p4vWT9s1QQRLzcSZ3UA1JS+MmO0ETfzDDAN3eoFbBiTz4MI6F12CMt3NVG2Rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IUods4y/0alim7WN7LAC9lw7JbvbPkMMPNZ/DypEM4=;
 b=H4T5dPiBt5/3BCy855HMIGq5ktj/FDm8oAh89bhf6h8dOdT6G8bYxI6Jl+zzrMrDn1QuNb/pmv2hDSRjlc7kqoFfDnHv7DsL9OLzh0jFbi4OcpYp+mJDGmROq0/fxIX2MXEMYKVzI/UPmg1BgD+hKw0+GKGQZg/Sn1h6Mo6UPS+e0Zk08nYBPe7hB35twray3NjIhbZtjsuvHXBkYdihEJJR8nUxndq23/Vl/izxV5mUe2wG+cLbG4wgMreyuDgSdlmcWuS/rjMDbX4aoqf8yVNupdFXnYshVx0PbDPVeHhqNTEUorIqi+cEWk1qfzY5yGu8LzD0lw8GCOWbAKZfJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IUods4y/0alim7WN7LAC9lw7JbvbPkMMPNZ/DypEM4=;
 b=Hpy6vuLHtQq3QL6yAZkihgrPBe6YdgvOAXDZUILHvoWhT8+r+fN2HVu/P+Bv2EJ/aGx2DI3vwqVuFDPDnHEnozTF4SYY8BdDvjCv3VoB5i5DyDT+5Td3Udsu+ydllXPimqGaUi4whdwR/FhABsq59Epuh9b3Y3Mbu1+TQFkpHyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.25; Wed, 14 Feb
 2024 08:23:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 08:23:07 +0000
Message-ID: <47140f4b-5fae-4176-9480-0207bc676906@amd.com>
Date: Wed, 14 Feb 2024 09:23:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: airlied@gmail.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org
References: <20231116141547.206695-1-christian.koenig@amd.com>
 <ZVaWVH+mX+PXKqfD@pollux> <b38ea934-ea53-422f-aaa9-34ec468ea52c@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b38ea934-ea53-422f-aaa9-34ec468ea52c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ba6f8a-5d6f-45ef-6817-08dc2d362bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjYLkQ1MZDVSqJNAhkU1Rz6EuitI2GUbtZwnc0TjVnJkuUKV8DloHP9NG8zjb8DDL+Jw+efwnlFCii2igZP3M5yd/Zx8Z/SDHQk2nQoe4eiqDW7tv4KDA8Vrg2AAjkWb70IjVqTUPGHR4B3Ety0VlG58o5dQluuZjOwV5NreDsnODmuSyF53A6wPCnel8hwrEQvHrngpFuJoG6Ut3fj8QyolJUgd4cQjjjDbbUKKaOG395L244dK1XLX9qQlkp40Mwb1ibYbBSg93dPgMXf14j5ymcsi9daXjPoX92r1kS7M8cTQxOCAgyRIf2RTfSfxg/P9aC3WYiLmKhJbLPWabj3Kwdy15/JLBlcXYOKKhHFhyk7zpDxkvwXNCfno+v4vjRRbw7CPuGEEPNcvHGd1seRqDrqfts0pR3PkXKtz9H4c1aE2pJWfbIiZ/Efdm0Y3Ij2vzRKzPuLT8CM4xI5cX8rykJqnF3c4qYj3l89CwQkwurb9GhDfRDg8fX4sQJE4jAjgoTIRHUGlpUXEWtB6TZSs07nBfAcEP47O7POWjyhHw1hzQk+M5t4g9qRW1sZ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230273577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6486002)(6512007)(478600001)(31686004)(41300700001)(66899024)(8936002)(4326008)(8676002)(30864003)(2906002)(5660300002)(110136005)(53546011)(6506007)(316002)(66946007)(66476007)(66556008)(6666004)(83380400001)(2616005)(66574015)(31696002)(86362001)(26005)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdpVGE0bmpQd09HQWtlTFBWNkVDK09RTjNnMks1cWlaT0VKKy9ldkV5cjJt?=
 =?utf-8?B?V0FwNmFBdUMrNDQ0SjV4ZlNRZnRhN3F0TXBMQ3l5aDJLdXZUMngwc2E2ektv?=
 =?utf-8?B?Y28yQjFBV1FzOTFqZHpaKzJhaERmZ08vUnRtMzQ0cXg2OTlsR3RhSit5Zlpx?=
 =?utf-8?B?MTFZWkFaMXIxOENzWGhIbDFzeFhxblpNd1g2dWJoS1BmRXJJR2owZkMzNm9S?=
 =?utf-8?B?dzlXT29hMjN4ZzVuVEo5bVhZeitGalErRGZicG13OWlUMmJNeEFBdDFnNlhC?=
 =?utf-8?B?ajlUeVFlWUdEYlJFdUlYNHY2WEF0Qmp3cFVqL09MNXBHd0lLR1hjck1rMHR6?=
 =?utf-8?B?MUY3WGprZjlHWTR5MmQzOXRpWGwyTTl2WEhjb2t5NVhTbmJpTEFJM2xYRU9O?=
 =?utf-8?B?cmk1OXJmSXFvck1sVWxEYmcrNDM1ZlZrdG5pTlo1ZFZtdWtqdWR2QjlZbjFV?=
 =?utf-8?B?T214N2VhNDhqelJPeUpKUTZ3SmlGc09CUUVsZzVRV2diK0NiYm5CRG4xdjFT?=
 =?utf-8?B?OERFNlpuY1Z3ekZCWXdJRDMvdUx4QjMrM2EwRGhsYWd1ZXBGY1RUcDBNN2hp?=
 =?utf-8?B?T2tUdG5aRUozVWFTN0xnRTdyUzVFQUgweERqdFp3cDFGUlQrM05xR2tQUjRJ?=
 =?utf-8?B?TW41YnE5bUNuS2ZaeG9tdlJVTFNvUWpGclpNZHZBd0J5VXlkTllXK1hNRjZh?=
 =?utf-8?B?NWJzcFB1aURLU3hGYllMbmFlYVhFSTFaMElRdi9mL2ZHOHM5NytCZEMyMEtC?=
 =?utf-8?B?NHh1c1JkZmNmVDYrbDd6V3hHZ0hOS2lxVnhIYXRSeCtWSU1NRmdxeG5RMHYz?=
 =?utf-8?B?b2F5dlJ0SkhCenZERGgrV05pa24rQ3RwdDFTWWYxSk5tbnllejNTLyt2N0tn?=
 =?utf-8?B?czlqWCt0VldTSTc3WmE3TEU3VktxbU5DaHkvNStpNU50YVVteUQ0dWUyWnRU?=
 =?utf-8?B?VXh2TFdObUIzZWxaTUt5UVYweEpRWjh3VzVNRThhZ2RVajVxMmowTGNaUmE4?=
 =?utf-8?B?SW12VXRIVDFWKzY4ZWo0c1hzd0VROFFVY3ZtOVQrRUdIRTZWTDdqTXdOMmIz?=
 =?utf-8?B?K3locjdCaHRLKzVPV0lIaktudXJCeFNiK2VUQ2dIaDREWDBtWVJzYWk5ZElU?=
 =?utf-8?B?cW5jeGFpZTRtZ2VrWFRMQWo1dG94NXB4Y0lGMHFlNVBlOHJGY3F2WEs1cncy?=
 =?utf-8?B?NS9LUnhMSjJEYVRZc0ErNWtNbkhuVHA4YnRrWHA1bDN4QWJZbHNKRXhjUGlz?=
 =?utf-8?B?MW45aGVCVTYxR2dkMk80V3RNWWl4d2p3NG1FbHdCZVFwclU0Z1FqaGZkaW5n?=
 =?utf-8?B?c3RJWUlZbEpzV1Vaalc2SERMS1d1RFBxem9HQytsV2VYaUJRbUFrbk9NZGUw?=
 =?utf-8?B?V1lvMGR0blJWQkE5M3g1MXFQR3c3RDVZY2wxak5WNFkrVnJ6VDUvdnNBZkxr?=
 =?utf-8?B?UWtiZmdNVXljZVdpWlRyOTZvNGdZdnZMc3FtMEo0b3E0ZlpMTGVUWGd2dXdM?=
 =?utf-8?B?aUphbGU4R3ZtcFB1djNobmRHTnpTNDZoRXUrcGdKL1R3SU5YaEVza1AyTFp1?=
 =?utf-8?B?SUsyV09TekhDVTNNaXR1NHdqRzlOZDlsYldtb1BkeDVGRE11WGp1ak8xbXVj?=
 =?utf-8?B?MlNVZHdpeDJaNVVCNkNIOHJXM3FydVBZenMzTVB1ZGFNdjhhYzIvWVpWVWdK?=
 =?utf-8?B?dzRCckdMK2NodktteVVnUDZvYXQzTVp4K3krTVB2QTNYYS9TYjlsTVBjVG5r?=
 =?utf-8?B?S2JOOXl4a0FySUJ4cms5VXZEZmFKNnJNTHc3YlFLeGFhUjdnYnp6amw1bE9a?=
 =?utf-8?B?aytNa21yTysxeDYzbVJyR1FOUjJKNnhkS2tuZmNxbTdmZXZWME82K0lWZ2lI?=
 =?utf-8?B?VFhTWGtUYWx5UEMwcnZjNEtHUmlNS0pnQ3drRDIvZ1dra1UyMW9YaExmVzFC?=
 =?utf-8?B?Q3FWNzcwbE03V1hBYWFEQzJBVjJ1dkNLYjlab09rc1dJZnVFa3VBanFrNi9K?=
 =?utf-8?B?VG51WlF2bkVoeUd0T1FYay96Tk5WeDRaRFdXZWpyc2dEOTdheCtteVd0a1hl?=
 =?utf-8?B?OEljMUIvUG4yVU94K2piaWZaM2ZSZUtYUUJZZlhIV2VZcDdkeTM3RU1DOE5F?=
 =?utf-8?Q?R5WQZqE6s84q5iBQAgg1u2arK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ba6f8a-5d6f-45ef-6817-08dc2d362bf4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 08:23:07.0114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Q6TDes6g3aOlHmkpRI3y+sftoJR07rcWH6DLlUP/hAJWTkzovRtTSkUAhhCoUUC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995
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

Am 13.02.24 um 18:37 schrieb Danilo Krummrich:
> Hi Christian,
>
> What's the status of this effort? Was there ever a follow-up?

It's unfortunately on hold for the moment since I have to look into some 
internal things with highest priority. No idea when this will calm down 
again.

Christian.

>
> - Danilo
>
> On 11/16/23 23:23, Danilo Krummrich wrote:
>> Hi Christian,
>>
>> Thanks for sending an update of this patch!
>>
>> On Thu, Nov 16, 2023 at 03:15:46PM +0100, Christian König wrote:
>>> Start to improve the scheduler document. Especially document the
>>> lifetime of each of the objects as well as the restrictions around
>>> DMA-fence handling and userspace compatibility.
>>>
>>> v2: Some improvements suggested by Danilo, add section about error
>>>      handling.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   Documentation/gpu/drm-mm.rst           |  36 +++++
>>>   drivers/gpu/drm/scheduler/sched_main.c | 174 
>>> +++++++++++++++++++++----
>>>   2 files changed, 188 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-mm.rst 
>>> b/Documentation/gpu/drm-mm.rst
>>> index acc5901ac840..112463fa9f3a 100644
>>> --- a/Documentation/gpu/drm-mm.rst
>>> +++ b/Documentation/gpu/drm-mm.rst
>>> @@ -552,12 +552,48 @@ Overview
>>>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>>      :doc: Overview
>>>   +Job Object
>>> +----------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>> +   :doc: Job Object
>>> +
>>> +Entity Object
>>> +-------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>> +   :doc: Entity Object
>>> +
>>> +Hardware Fence Object
>>> +---------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>> +   :doc: Hardware Fence Object
>>> +
>>> +Scheduler Fence Object
>>> +----------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>> +   :doc: Scheduler Fence Object
>>> +
>>> +Scheduler and Run Queue Objects
>>> +-------------------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>> +   :doc: Scheduler and Run Queue Objects
>>> +
>>>   Flow Control
>>>   ------------
>>>     .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>>      :doc: Flow Control
>>>   +Error and Timeout handling
>>> +--------------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>> +   :doc: Error and Timeout handling
>>> +
>>>   Scheduler Function References
>>>   -----------------------------
>>>   diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 044a8c4875ba..026123497b0e 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -24,28 +24,122 @@
>>>   /**
>>>    * DOC: Overview
>>>    *
>>> - * The GPU scheduler provides entities which allow userspace to 
>>> push jobs
>>> - * into software queues which are then scheduled on a hardware run 
>>> queue.
>>> - * The software queues have a priority among them. The scheduler 
>>> selects the entities
>>> - * from the run queue using a FIFO. The scheduler provides 
>>> dependency handling
>>> - * features among jobs. The driver is supposed to provide callback 
>>> functions for
>>> - * backend operations to the scheduler like submitting a job to 
>>> hardware run queue,
>>> - * returning the dependencies of a job etc.
>>> - *
>>> - * The organisation of the scheduler is the following:
>>> - *
>>> - * 1. Each hw run queue has one scheduler
>>> - * 2. Each scheduler has multiple run queues with different priorities
>>> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
>>> - * 3. Each scheduler run queue has a queue of entities to schedule
>>> - * 4. Entities themselves maintain a queue of jobs that will be 
>>> scheduled on
>>> - *    the hardware.
>>> - *
>>> - * The jobs in a entity are always scheduled in the order that they 
>>> were pushed.
>>> - *
>>> - * Note that once a job was taken from the entities queue and 
>>> pushed to the
>>> - * hardware, i.e. the pending queue, the entity must not be 
>>> referenced anymore
>>> - * through the jobs entity pointer.
>>> + * The GPU scheduler implements some logic to decide which command 
>>> submission
>>> + * to push next to the hardware. Another major use case of the GPU 
>>> scheduler
>>> + * is to enforce correct driver behavior around those command 
>>> submissions.
>>> + * Because of this it's also used by drivers which don't need the 
>>> actual
>>> + * scheduling functionality.
>>
>> This reads a bit like we're already right in the middle of the 
>> documentation.
>> I'd propose to start with something like "The DRM GPU scheduler 
>> serves as a
>> common component intended to help drivers to manage command 
>> submissions." And
>> then mention the different solutions the scheduler provides, e.g. 
>> ordering of
>> command submissions, dma-fence handling in the context of command 
>> submissions,
>> etc.
>>
>> Also, I think it would be good to give a rough overview of the 
>> topology of the
>> scheduler's components. And since you already mention that the 
>> component is
>> "also used by drivers which don't need the actual scheduling 
>> functionality", I'd
>> also mention the special case of a single entity and a single 
>> run-queue per
>> scheduler.
>>
>>> + *
>>> + * All callbacks the driver needs to implement are restricted by 
>>> DMA-fence
>>> + * signaling rules to guarantee deadlock free forward progress. 
>>> This especially
>>> + * means that for normal operation no memory can be allocated in a 
>>> callback.
>>> + * All memory which is needed for pushing the job to the hardware 
>>> must be
>>> + * allocated before arming a job. It also means that no locks can 
>>> be taken
>>> + * under which memory might be allocated as well.
>>
>> I think that's good. Even though, with the recently merged workqueue 
>> patches,
>> drivers can actually create a setup where the free_job callback isn't 
>> part of
>> the fence signalling critical path anymore. But I agree with Sima 
>> that this is
>> probably too error prone to give drivers ideas. So, this paragraph is 
>> probably
>> good as it is. :-)
>>
>>> + *
>>> + * Memory which is optional to allocate, for example for device 
>>> core dumping or
>>> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate 
>>> error
>>> + * handling taking if that allocation fails. GFP_ATOMIC should only 
>>> be used if
>>> + * absolutely necessary since dipping into the special atomic 
>>> reserves is
>>> + * usually not justified for a GPU driver.
>>> + */
>>> +
>>> +/**
>>> + * DOC: Job Object
>>> + *
>>> + * The base job object contains submission dependencies in the form 
>>> of DMA-fence
>>> + * objects. Drivers can also implement an optional prepare_job 
>>> callback which
>>> + * returns additional dependencies as DMA-fence objects. It's 
>>> important to note
>>> + * that this callback can't allocate memory or grab locks under 
>>> which memory is
>>> + * allocated.
>>> + *
>>> + * Drivers should use this as base class for an object which 
>>> contains the
>>> + * necessary state to push the command submission to the hardware.
>>> + *
>>> + * The lifetime of the job object should at least be from pushing 
>>> it into the
>>
>> "should at least last from"
>>
>>> + * scheduler until the scheduler notes through the free callback 
>>> that a job
>>
>> What about "until the free_job callback has been called and hence the 
>> scheduler
>> does not require the job object anymore."?
>>
>>> + * isn't needed any more. Drivers can of course keep their job 
>>> object alive
>>> + * longer than that, but that's outside of the scope of the scheduler
>>> + * component. Job initialization is split into two parts, 
>>> drm_sched_job_init()
>>> + * and drm_sched_job_arm(). It's important to note that after 
>>> arming a job
>>
>> I suggest to add a brief comment on why job initialization is split up.
>>
>>> + * drivers must follow the DMA-fence rules and can't easily 
>>> allocate memory
>>> + * or takes locks under which memory is allocated.
>>> + */
>>> +
>>> +/**
>>> + * DOC: Entity Object
>>> + *
>>> + * The entity object which is a container for jobs which should 
>>> execute
>>> + * sequentially. Drivers should create an entity for each 
>>> individual context
>>> + * they maintain for command submissions which can run in parallel.
>>> + *
>>> + * The lifetime of the entity should *not* exceed the lifetime of the
>>> + * userspace process it was created for and drivers should call the
>>> + * drm_sched_entity_flush() function from their file_operations.flush
>>> + * callback. So it's possible that an entity object is not alive any
>>
>> "Note that it is possible..."
>>
>>> + * more while jobs from it are still running on the hardware.
>>
>> "while jobs previously fetched from this entity are still..."
>>
>>> + *
>>> + * Background is that for compatibility reasons with existing
>>> + * userspace all results of a command submission should become visible
>>> + * externally even after after a process exits. This is normal 
>>> POSIX behavior
>>> + * for I/O operations.
>>> + *
>>> + * The problem with this approach is that GPU submissions contain 
>>> executable
>>> + * shaders enabling processes to evade their termination by 
>>> offloading work to
>>> + * the GPU. So when a process is terminated with a SIGKILL the 
>>> entity object
>>> + * makes sure that jobs are freed without running them while still 
>>> maintaining
>>> + * correct sequential order for signaling fences.
>>> + */
>>> +
>>> +/**
>>> + * DOC: Hardware Fence Object
>>> + *
>>> + * The hardware fence object is a DMA-fence provided by the driver 
>>> as result of
>>> + * running jobs. Drivers need to make sure that the normal 
>>> DMA-fence semantics
>>> + * are followed for this object. It's important to note that the 
>>> memory for
>>> + * this object can *not* be allocated in the run_job callback since 
>>> that would
>>> + * violate the requirements for the DMA-fence implementation. The 
>>> scheduler
>>> + * maintains a timeout handler which triggers if this fence doesn't 
>>> signal in
>>> + * a configurable time frame.
>>> + *
>>> + * The lifetime of this object follows DMA-fence ref-counting 
>>> rules, the
>>> + * scheduler takes ownership of the reference returned by the 
>>> driver and drops
>>> + * it when it's not needed any more.
>>> + */
>>> +
>>> +/**
>>> + * DOC: Scheduler Fence Object
>>> + *
>>> + * The scheduler fence object which encapsulates the whole time 
>>> from pushing
>>> + * the job into the scheduler until the hardware has finished 
>>> processing it.
>>> + * This is internally managed by the scheduler, but drivers can 
>>> grab additional
>>> + * reference to it after arming a job. The implementation provides 
>>> DMA-fence
>>> + * interfaces for signaling both scheduling of a command submission 
>>> as well as
>>> + * finishing of processing.
>>> + *
>>> + * The lifetime of this object also follows normal DMA-fence 
>>> ref-counting
>>> + * rules. The finished fence is the one normally exposed outside of 
>>> the
>>> + * scheduler, but the driver can grab references to both the 
>>> scheduled as well
>>> + * as the finished fence when needed for pipe-lining optimizations.
>>> + */
>>> +
>>> +/**
>>> + * DOC: Scheduler and Run Queue Objects
>>> + *
>>> + * The scheduler object itself does the actual work of selecting a 
>>> job and
>>> + * pushing it to the hardware. Both FIFO and RR selection algorithm 
>>> are
>>> + * supported, but FIFO is preferred for many use cases.
>>
>> I suggest to name the use cases FIFO scheduling is preferred for and 
>> why.
>>
>> If, instead, it's just a general recommendation, I also suggest to 
>> explain why.
>>
>>> + *
>>> + * The lifetime of the scheduler is managed by the driver using it. 
>>> Before
>>> + * destroying the scheduler the driver must ensure that all 
>>> hardware processing
>>> + * involving this scheduler object has finished by calling for example
>>> + * disable_irq(). It is *not* sufficient to wait for the hardware 
>>> fence here
>>> + * since this doesn't guarantee that all callback processing has 
>>> finished.
>>
>> This is the part I'm most concerned about, since I feel like we leave 
>> drivers
>> "up in the air" entirely. Hence, I think here we need to be more 
>> verbose and
>> detailed about the options drivers have to ensure that.
>>
>> For instance, let's assume we have the single-entity-per-scheduler 
>> topology
>> because the driver only uses the GPU scheduler to feed a firmware 
>> scheduler with
>> dynamically allocated ring buffers.
>>
>> In this case the entity, scheduler and ring buffer are bound to the 
>> lifetime of
>> a userspace process.
>>
>> What do we expect the driver to do if the userspace process is 
>> killed? As you
>> mentioned, only waiting for the ring to be idle (which implies all HW 
>> fences
>> are signalled) is not enough. This doesn't guarantee all the free_job()
>> callbacks have been called yet and hence stopping the scheduler 
>> before the
>> pending_list is actually empty would leak the memory of the jobs on the
>> pending_list waiting to be freed.
>>
>> I already brought this up when we were discussing Matt's Xe inspired 
>> scheduler
>> patch series and it seems there was no interest to provide drivers 
>> with some
>> common mechanism that gurantees that the pending_list is empty. 
>> Hence, I really
>> think we should at least give recommendations how drivers should deal 
>> with that.
>>
>>> + *
>>> + * The run queue object is a container of entities for a certain 
>>> priority
>>> + * level. This object is internally managed by the scheduler and 
>>> drivers
>>> + * shouldn't touch them directly. The lifetime of run queues are 
>>> bound to the
>>> + * schedulers lifetime.
>>
>> I think we should also mention that we support a variable number of 
>> run-queues
>> up to DRM_SCHED_PRIORITY_COUNT. Also there is this weird restriction 
>> on which
>> priorities a driver can use when choosing less than 
>> DRM_SCHED_PRIORITY_COUNT
>> run-queues.
>>
>> For instance, initializing the scheduler with a single run-queue, 
>> requires the
>> corresponding entities to pick DRM_SCHED_PRIORITY_MIN, otherwise 
>> we'll just
>> fault since the priority is also used as an array index into 
>> sched->sched_rq[].
>>
>>>    */
>>>     /**
>>> @@ -72,6 +166,42 @@
>>>    * limit.
>>>    */
>>>   +/**
>>> + * DOC: Error and Timeout handling
>>> + *
>>> + * Errors schould be signaled by using dma_fence_set_error() on the 
>>> hardware
>>> + * fence object before signaling it. Errors are then bubbled up 
>>> from the
>>> + * hardware fence to the scheduler fence.
>>> + *
>>> + * The entity allows querying errors on the last run submission 
>>> using the
>>> + * drm_sched_entity_error() function which can be used to cancel 
>>> queued
>>> + * submissions in the run_job callback as well as preventing 
>>> pushing further
>>> + * ones into the entity in the drivers submission function.
>>> + *
>>> + * When the hardware fence fails to signal in a configurable amount 
>>> of time the
>>> + * timedout_job callback is issued. The driver should then follow 
>>> the procedure
>>> + * described on the &struct drm_sched_backend_ops.timedout_job 
>>> callback (TODO:
>>> + * The timeout handler should probably switch to using the hardware 
>>> fence as
>>> + * parameter instead of the job. Otherwise the handling will always 
>>> race
>>> + * between timing out and signaling the fence).
>>> + *
>>> + * The scheduler also used to provided functionality for 
>>> re-submitting jobs
>>> + * with replacing the hardware fence during reset handling. This 
>>> functionality
>>> + * is now marked as deprecated. This has proven to be fundamentally 
>>> racy and
>>> + * not compatible with DMA-fence rules and shouldn't be used in any 
>>> new code.
>>> + *
>>> + * Additional there is the drm_sched_increase_karma() function 
>>> which tries to
>>   "Additionally"
>>
>>> + * find the entity which submitted a job and increases it's 'karma'
>>> + * atomic variable to prevent re-submitting jobs from this entity. 
>>> This has
>>> + * quite some overhead and re-submitting jobs is now marked as 
>>> deprecated. So
>>> + * using this function is rather discouraged.
>>> + *
>>> + * Drivers can still re-create the GPU state should it be lost 
>>> during timeout
>>> + * handling when they can guarantee that forward progress is made 
>>> and this
>>> + * doesn't cause another timeout. But this is strongly hardware 
>>> specific and
>>> + * out of the scope of the general GPU scheduler.
>>> + */
>>> +
>>>   #include <linux/wait.h>
>>>   #include <linux/sched.h>
>>>   #include <linux/completion.h>
>>> -- 
>>> 2.34.1
>>>
>

