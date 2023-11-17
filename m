Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A47EEE04
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 10:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA310E730;
	Fri, 17 Nov 2023 09:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E610E730
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ox4yREanjSbrr4w2qdFPSOI3QB3lLh1dNP9tsqyc2QsC0/DAHIENKgewuoW7u7dUYgoesTuAbZrzH1temZKRYZh99fBW868mmzjlMB8iqL5pQ6QXVxHwlhhxcNyirYBd0wm3vQCIEVirq0s8iguGHaQ0RYUzvM45n2WM1bRwfZwwh4BUSExcJ6zXpXUqPIllsVUnqZdEHS4/RRj6ybaL0KkF4yWLeHS7HGuBZAqcyPNNU5h/s/qQbhX+1+5zt2D6k/WLVUwwx2gUhbm/OJblPnnPiGfDBBM18gxSY/3/hGbUoWDB5JPpMiNsfMeRSp/onSvxfCXcawKBiU2H/hL4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLOdMmZzHiFnKwTDrwtWqMJTeI+gg6SFrNL8kVqUY58=;
 b=MAvldBQ2kt/wnsJaXRFS7OLEuTtA3zS5pxltkjNFjm48gldbohEuJA3Zk4fLXUNMwJZdG3YBTBcAast4MXFG4tTSirdo6SiKyPimKMAe/cLf7MpX2a0IgFfKLPK9+f3M6hSRezkP8BrVlWfjRRKMhym2cGLW9Xi6z1ubmi0tLDzxBELw0pra/44JLGKdd5qNJxLwdlVPsuBzCx3eV/6vZYLkJ88ht4FJRfuFt96XSB4oB8lK73k3xF+GL3RIqeIjMmh17bfkv2ekN7B0EdrU85/icPdcbjEWOxi360LrfVM4+Dy5wvB0XhxxLe8X/FDzcPVxbrJABZQL46GGxhoikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLOdMmZzHiFnKwTDrwtWqMJTeI+gg6SFrNL8kVqUY58=;
 b=pTCuBRXNc1MXunyYlQ2fWpSuh+Uv8k1OfNHYaHofKn4LpLQR22RB/p/nyyTHXdgSDZl5FGFRuBcD9HKKmY2qYDJ5xf9ED9T3HD47yK5PruATuo/ze2S+aQ0amsDsHqN3Sd8w/NmwSHX3nydQcPVEBWU7VGANLjyNWAYHLEJo7Zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 09:01:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 09:01:38 +0000
Message-ID: <62dc2fb1-23dd-428d-8508-6f1ccc5bb377@amd.com>
Date: Fri, 17 Nov 2023 10:01:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: improve GPU scheduler documentation
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexander.deucher@amd.com
References: <20231113123832.120710-1-christian.koenig@amd.com>
 <bffaa7eb-05e4-4842-b199-f03a46036414@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bffaa7eb-05e4-4842-b199-f03a46036414@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce083ca-2356-44f0-37a5-08dbe74bcf22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BTwRPwEgEYbcWvXSta++z8ShutsWgMM7Fq2W9a5JTB/RM+D5qAahalkbJJzTa3NNXOvo6kt+e5+nlQB7DOALhKWQYZrKnTYadJscN5o3mhsp2onXy6fzUZ2GYr6mYrTt6S4GYkjOw36L+sebrUy2TJTsLCxyb4S+UKiT/63IRARp0bBsEQzKk3jyRSy14jmrA5+CCcm0BuEP0QiNGB83yiaoQ5RBNewWmrI4Et7QWDbgdPjPnHueZNlyElK3bA4ZFJgCa+uo9+ckI8fk6fFSTqKsfENERHnZpWe41XfOS5BDLz10W++BIQpedxJL76bsWFtK+/Wdqis2ROfyOPp9K6H9FFJXyGbrpz1Ts5B9ybs4pwTwvOhttJeeIcqZy4HhPkqsj3If++4euEgKYKI4LNv6GolXJnwHPxsDouTzUORQnSjnBYYlbugxl+MPEwyuN7XxGk9D0IiojJ+dDX95/GibVg013YCq4+iaMIC+FmnMc2iK5cOk1lDT4uDSw2kfMEQaCdvlPo2NAHi1MzUwCjO41+djSnmwv9oQ+FIu0YhbTs1aIWuw1jxlr0mvJ7U/n9sP57+H+o2i3k+NcpfHyOTQKnGJEZaBeGOu4lDgsLf3o9EGfQzo2XlqQLpHAHtQvgxOP+yfzWMIAycnayApF3kvWW85vWlVklLPkJ83Dec4Y38tNnJ4Gg1Qzzq6AGF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799009)(186009)(64100799003)(36756003)(316002)(6512007)(6486002)(6636002)(478600001)(38100700002)(83380400001)(4001150100001)(41300700001)(66574015)(8936002)(8676002)(5660300002)(6506007)(26005)(6666004)(31696002)(86362001)(31686004)(66946007)(66556008)(66476007)(110136005)(2906002)(2616005)(30864003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU1tMVd2eFZ4UWpib2tnNFZhOWh4TmlTenJITThydkJXSW1sVDFNbVFzSlBI?=
 =?utf-8?B?Y2dKZldSRTBscDlnZWlkaHpJb01QM2UyRlFBODBJTlREck95cmhlcDR0b0cw?=
 =?utf-8?B?QnkxRWtEU0dma1poQ0YxK3RwTmY4NlNkUC84NUpKbDFkdEgzTUM1dWZ3UHA0?=
 =?utf-8?B?WUgyYmp3NXNLc05mSENBRlRZV09SQmJ5c3lsVjhlZ25YbzZOQlQ2MndnZkxX?=
 =?utf-8?B?OHpjWnVaWmZiMXF5NFNPdkxrY3Z5RmJBNHk2bUVhTGMzK0JNdW1NR0k5QWVI?=
 =?utf-8?B?VG04UmJST2piUXY4M3lmWFgrV2Z2UHhCSk1OTnNuY3A2WXhOakYyZHMwWHFl?=
 =?utf-8?B?cGFreGdWMGdZOWdiZG5yblZSbncwd1lWbHZ3RzFDb2tTNTk1YUhoSUZKRmww?=
 =?utf-8?B?ckFxdGdXSVhYTTVxQ3dwWGpLWm00OG5Jc2RMQXZxbjNkZXlFSDlYMGJDdzBm?=
 =?utf-8?B?RTh4OW5pcVVDb1E1VHFBUG5RQXdZVUFLRldrbjlnVFp2dGtHNkZJekhlREVs?=
 =?utf-8?B?S1NETlFldGVSSndWZTJjVXZOMUxZNk5FNFAyYkIrSHc0VWoxcVJlL0JNVlhL?=
 =?utf-8?B?MXpzYjJDVEw5TmdVa0NqMjlsMm9Vb09kNC9zVjFzSVNxTFJKUHlZSnhiTGpR?=
 =?utf-8?B?Zkxmd3NkaFZVUWNiMHdiVHowZjhJNi9JS2lsTzJQaW5JcnJ3clljTjY5L0Zk?=
 =?utf-8?B?NVRoWHVpZ2VqNVR3R0FnM0RvTkg0d1FoWmI3Y1AycGpKSndPcW5GbWEwVi9v?=
 =?utf-8?B?aVpldjh6RnF3dm52ZkFNdER1TFdnMnZWTk1zQlorRENYQ2hDbjZGb1ltQm91?=
 =?utf-8?B?R3lFR3ZIL1U1WC9pcTdrSWZ3WjNnNnlQZWNQMUhjREpRZ2FVVUlpdzZiNHN4?=
 =?utf-8?B?bXUyVzZ5aTBhOWxHc05jTVZGcXlDYy9hcTJ2QnpudUxPYUZzNWtqSmZtY2hy?=
 =?utf-8?B?MGdVUlk0eGhnN1FYb25HNDFreWhEdVAraElmMi9YVUJmUm1mbmh3bjhMbHo0?=
 =?utf-8?B?NFpxZklua3VyNUFJNnZRMjRJUTQ1aS9pdnplN2hiU2E4SXdxOHVDY2MxYTVr?=
 =?utf-8?B?OUpwVlluWE9EamhTRFBuY3Jxdi9YUjBsWU5zTFB1eUtka2N3bEV6MDk3TDYz?=
 =?utf-8?B?T3BmcTNjTTlibkhZSFd6MTB5YlBXd0YvdFUzTC9HVjFYT2wxY3JDYzFlMmV0?=
 =?utf-8?B?UHkrblA0c0VheEhwVWl3KzA3YURnRXNpQnhPWHpjV2RXVW9QMmVoYWFDRVBs?=
 =?utf-8?B?ZDZWT1JBVFNLVTVDRnAvTTFJSXpOY3pyNlVVbVdmT1FzR2pxZlFnV0VEYXQ1?=
 =?utf-8?B?VXl6NURBTXk0NHBySDVXVUxqa0FMWXBPT1dqWEV1VERLTjAweXZKL1lTVS9k?=
 =?utf-8?B?QWxqUzJOdUtBYW84RVhRWWRpdjUzZ254aCt0MzBaOExNVjhIeVlyZzd3OHQ4?=
 =?utf-8?B?bENGR3hEcS91dXBmZS9XQzdTM1pnbi94Tm1USW1GN2sxbGtNbGVzbUhSckNU?=
 =?utf-8?B?cklzZTUzL0Q2eTQvY0lzWUtOUzBHQ2hvSjJzazkwSGR5U0VmYTltMjFRekdx?=
 =?utf-8?B?Z2ptTlNma3NsZ09jaUc1MGRUK1pTbFRGeXIrUDZjUmlRU3RJejVlbzBhYkMw?=
 =?utf-8?B?bGF6K2dLbHlwbTg0ZFYwSGs2WHNmNTNPTitYbFVZUStlWXh5amh6WFZCN0RR?=
 =?utf-8?B?cTFHQ1ZlTklINmtCSzhlR25DYUFxYWIwUzJHMGFCRHYyL0loZy8wQ0xIaFg2?=
 =?utf-8?B?QjlwVHBxR2VwcjNXMmVDREdCc0p3MzMrQ0x5aXdQNDZ2ZXcwUE9iSktoakhi?=
 =?utf-8?B?YTlEc0p6c29FM2ZmRVRPR0tYYTV1QzVoRlJLTWs2VHRYT29DQStxUTdxZnp1?=
 =?utf-8?B?QWhlcmVUcVZVRUdrTVZpZWZqRnluQjVqMGtSRzBRRW1CeDJqTis2TUhnemRN?=
 =?utf-8?B?NHIzWVRvUVJHU3B5d20veXVBZUdSTnRjdEhjcTlMazZqMERxdWtuOGF3SXcz?=
 =?utf-8?B?S2VlaTgydkpvcG1jc3lKQlYxcVJyK2QvZk0zcEQ2M3MvYngvWXo0ZEVZaDF2?=
 =?utf-8?B?c3orQ1hSdldraUVudEptZk9GZGovT3lJY2dBQmFabTdWS2xaUGR5N1JiOHlE?=
 =?utf-8?Q?/a9k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce083ca-2356-44f0-37a5-08dbe74bcf22
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 09:01:38.8030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoC3jgtaZKaemcSaKQSw0ivmC9C1ijRj9kuCPuRrBr8QTRENR1HFVN5n2RMoFB/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044
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

Am 17.11.23 um 04:18 schrieb Luben Tuikov:
> On 2023-11-13 07:38, Christian König wrote:
>> Start to improve the scheduler document. Especially document the
>> lifetime of each of the objects as well as the restrictions around
>> DMA-fence handling and userspace compatibility.
> Thanks Christian for doing this--much needed.
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 126 ++++++++++++++++++++-----
>>   1 file changed, 104 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 506371c42745..36a7c5dc852d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -24,28 +24,110 @@
>>   /**
>>    * DOC: Overview
>>    *
>> - * The GPU scheduler provides entities which allow userspace to push jobs
>> - * into software queues which are then scheduled on a hardware run queue.
>> - * The software queues have a priority among them. The scheduler selects the entities
>> - * from the run queue using a FIFO. The scheduler provides dependency handling
>> - * features among jobs. The driver is supposed to provide callback functions for
>> - * backend operations to the scheduler like submitting a job to hardware run queue,
>> - * returning the dependencies of a job etc.
> So, I don't mind this paragraph, as it provides an overview or the relationship between
> a DRM GPU scheduler, entities, run-queues, and jobs.
>
>> - *
>> - * The organisation of the scheduler is the following:
>> - *
>> - * 1. Each hw run queue has one scheduler
>> - * 2. Each scheduler has multiple run queues with different priorities
>> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
>> - * 3. Each scheduler run queue has a queue of entities to schedule
>> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
>> - *    the hardware.
> This is also good, and shouldn't have been deleted.
>
>> - *
>> - * The jobs in a entity are always scheduled in the order that they were pushed.
> I'd have said here "jobs within an entity". Again shouldn't have been deleted.
> This is good overall/overview information.

I was hoping that I have incorporated all this into the per object 
description text. Did I miss anything?

>
>> - *
>> - * Note that once a job was taken from the entities queue and pushed to the
>> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
>> - * through the jobs entity pointer.
>> + * The GPU scheduler implements some logic to decide which command submission
>> + * to push next to the hardware. Another major use case for the GPU scheduler
>> + * is to enforce correct driver behavior around those command submission.
> The GPU scheduler also enforces correct driver behaviour around those command submissions.
>
>> + * Because of this it's also used by drivers which don't need the actual
>> + * scheduling functionality.
> ... but need to push jobs into their firmware/hardware and maintain/keep correct
> DRM dependencies in the form of "fences".

Good point, going to add that.

>
>> + *
>> + * To fulfill this task the GPU scheduler uses of the following objects:
>> + *
>> + * 1. The job object which contains a bunch of dependencies in the form of
> Drop "which".
>
> Instead of listing what it contains, how it is used, what it does, explain
> what it is: work/task to be executed by the GPU. _Then_ you can start listing
> what it contains, how it is used, what it does.
>
>> + *    DMA-fence objects. Drivers can also implement an optional prepare_job
>> + *    callback which returns additional dependencies as DMA-fence objects.
> "can also"? This would usually follow if the other callbacks/etc., have been described
> and they haven't, so I'd say "Drivers implement an optional prepare_job callback,..."
>
>> + *    It's important to note that this callback must follow the DMA-fence rules,
>> + *    so it can't easily allocate memory or grab locks under which memory is
>> + *    allocated. Drivers should use this as base class for an object which
>> + *    contains the necessary state to push the command submission to the
>> + *    hardware.
>> + *
>> + *    The lifetime of the job object should at least be from pushing it into the
>> + *    scheduler until the scheduler notes through the free callback that a job
>> + *    isn't needed any more. Drivers can of course keep their job object alive
>> + *    longer than that, but that's outside of the scope of the scheduler
>> + *    component.
> [New paragraph starts describing the job initialization.]
>
> Add:  Job initialization is split into two parts,
>> + *    drm_sched_job_init() and drm_sched_job_arm().
> Perhaps we should mention briefly what each one does..?
>
> Add:  It's important to note that
>> + *    after arming a job drivers must follow the DMA-fence rules and can't
>> + *    easily allocate memory or takes locks under which memory is allocated.
>> + *
>> + * 2. The entity object which is a container for jobs which should execute
> Drop "which". "The entity object is a container of ..."
>
>> + *    sequentially. Drivers should create an entity for each individual context
>> + *    they maintain for command submissions which can run in parallel.
> This isn't very clear, but can be made so by: "they maintain for command submissions."
> "Entities' jobs can run in parallel as facilitated by the GPU."
>
>> + *
>> + *    The lifetime of the entity should *not* exceed the lifetime of the
>> + *    userspace process it was created for and drivers should call the
>> + *    drm_sched_entity_flush() function from their file_operations.flush
>> + *    callback.
> Okay... they should... WHEN? When we use "should do something" we always clarify with "when xyz happens."
>
> Add:  Background is that for compatibility reasons with existing
>> + *    userspace all results of a command submission should become visible
> "Background" --> "The reason for this is for compatibility with existing ..."
>
>> + *    externally even after after a process exits. The only exception to that
> Remove one of the two "after".
>
>> + *    is when the process is actively killed by a SIGKILL. In this case the
>> + *    entity object makes sure that jobs are freed without running them while
>> + *    still maintaining correct sequential order for signaling fences. So it's
>> + *    possible that an entity object is not alive any more while jobs from it
> "to not be alive"
> (This paragraph here, including SIGKILL, could be made clearer, by splitting it in two
> parts. One describing normal behaviour, i.e. SIGTERM, and the other describing SIGKILL.)
>
>> + *    are still running on the hardware.
>> + *
>> + * 3. The hardware fence object which is a DMA-fence provided by the driver as
> Drop "which". "The hardware fence object is a DMA-fence which is provided by the driver
> as _a_ result of running a job/jobs."
>
>> + *    result of running jobs. Drivers need to make sure that the normal
>> + *    DMA-fence semantics are followed for this object. It's important to note
> "DMA-fence semantics" are mentioned several times so far, and a link to a description
> of said semantics (or NULL if none is in the kernel)--would be nice to put.
>
>> + *    that the memory for this object can *not* be allocated in the run_job
>> + *    callback since that would violate the requirements for the DMA-fence
>> + *    implementation.
> Is it "no allocation" or just "allocation for this object" in run_job?
> (Or maybe no kernel allocation..., we should probably clarify this.)
>
> Add:  The scheduler maintains a timeout handler which triggers
>> + *    if this fence doesn't signal in a configurable time frame.
>> + *
>> + *    The lifetime of this object follows DMA-fence ref-counting rules, the
>> + *    scheduler takes ownership of the reference returned by the driver and
>> + *    drops it when it's not needed any more. Errors should also be signaled
>> + *    through the hardware fence and are bubbled up back to the scheduler fence
> By whom?
> "through the hardware fence by the driver, and are ..."
>
>> + *    and entity.
>> + *
>> + * 4. The scheduler fence object which encapsulates the whole time from pushing
>> + *    the job into the scheduler until the hardware has finished processing it.
> Perhaps drop "time encapsulation."
>
> It's not very clear what you want to say here. Perhaps, use "exists" and drop "which", as in:
> 4. The scheduler fence object exists/is ref-ed by DRM, etc., from the time when the job is
> pushed into the scheduler until the hardware has finished with it.
>
> If fence signaling is involved in those two steps, it should be noted here.
>
> If this is about ownership, it should be simply stated.
>
>> + *    This is internally managed by the scheduler, but drivers can grab
>> + *    additional reference to it after arming a job. The implementation
> Instead of "implementation" perhaps use "DRM scheduler code?"
>
>> + *    provides DMA-fence interfaces for signaling both scheduling of a command
>> + *    submission as well as finishing of processing.
> I'd clarify with
> 	"provides DMA-fence interfaces for drivers, for the scheduling of a command
> 	 submission, akin to the start of a command, and finishing command processing."
>
> Perhaps we can also mention when drivers are supposed to call these...?
>
>> + *
>> + *    The lifetime of this object also follows normal DMA-fence ref-counting
>> + *    rules. The finished fence is the one normally exposed outside of the
>> + *    scheduler, but the driver can grab references to both the scheduled as
>> + *    well as the finished fence when needed for pipe-lining optimizations.
>> + *
>> + * 5. The run queue object which is a container of entities for a certain
>> + *    priority level. The lifetime of those objects are bound to the scheduler
>> + *    lifetime.
> "which is" --> "is"
> "entities for a certain" --> "entities of a certain"
>
>> + *
>> + *    This is internally managed by the scheduler and drivers shouldn't touch
>> + *    them directly.
>> + *
>> + * 6. The scheduler object itself which does the actual work of selecting a job
>> + *    and pushing it to the hardware. Both FIFO and RR selection algorithm are
>> + *    supported, but FIFO is preferred for many use cases.
> Let's drop "which" and just say "The scheduler object does the actual work of ..."
>
>> + *
>> + *    The lifetime of this object is managed by the driver using it. Before
>> + *    destroying the scheduler the driver must ensure that all hardware
>> + *    processing involving this scheduler object has finished by calling for
>> + *    example disable_irq(). It is *not* sufficient to wait for the hardware
>> + *    fence here since this doesn't guarantee that all callback processing has
>> + *    finished.
> Okay, and perhaps we could mention drm_sched_fini() here.
>
>> + *
>> + * All callbacks the driver needs to implement are restricted by DMA-fence
>> + * signaling rules to guarantee deadlock free forward progress. This especially
>> + * means that for normal operation no memory can be allocated. All memory which
> Need a pointer to the "DMA-fence signaling rules" and also need to define "normal operation",
> or clarify it in the sentence.
>
>> + * is needed for pushing the job to the hardware must be allocated before
>> + * arming a job. It also means that no locks can be taken under which memory
>> + * might be allocated as well.
> Yes, that makes sense. I think this is generally the case for driver and firmware
> writers, and I'd think is common sense, but it is good to have it in writing.
>
>> + *
>> + * Memory which is optional to allocate for device core dumping or debugging
>> + * *must* be allocated with GFP_NOWAIT and appropriate error handling taking if
>> + * that allocation fails. GFP_ATOMIC should only be used if absolutely
>> + * necessary since dipping into the special atomic reserves is usually not
>> + * justified for a GPU driver.
> Yes, that's well said. Good to have it here.
>
>> + *
>> + * The scheduler also used to provided functionality for re-submitting jobs
> "The scheduler also used ..." --> "The scheduler is also used ..."
>
>> + * with replacing the hardware fence during reset handling. This functionality
>> + * is now marked as deprecated since this has proven to be fundamentally racy
>> + * and not compatible with DMA-fence rules and shouldn't be used in any new
>> + * code.
> I wouldn't use a contraction here. In order to emphasize that job re-submission
> is depreciated, I'd use:
> 	"and should not be used in any new code."

I only skimmed over the rest of the comment. Danilo already suggested 
some similar notes, especially on the style which resulted in a v2 of 
the documentation.

Going over this here later today and will probably send out a v3 on Monday.

Thanks,
Christian.

>
>>    */
>>   
>>   #include <linux/kthread.h>

