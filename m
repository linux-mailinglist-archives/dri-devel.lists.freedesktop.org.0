Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ABA807A46
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AC810E78D;
	Wed,  6 Dec 2023 21:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642EF10E78D;
 Wed,  6 Dec 2023 21:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns1VvWzIeJ5RMkya9rePtdcLxkBuEQu8kPRj3luxKH0AgB+U3RzMydaObE4+ebATLbIhxpXiUvITParufwjA8CD6JjqNHFe7nZljeBnAe9CoKksPzNuR0rhep9aYs5Q2OLe+smetu4ilmxqxZhuKK3hbwsRG1pZP9UjhMoxSlJOMm+IX5bE1/VPljHlyJn8Hx5bsBwMHTMlUNV0riXB/VuDKmGJFoyewEUosU4dBkMKEiuIwqqtaSTb2yJ95lWUQB/jBuelxGO5xTjRkehfeCXCTImNvWChOQ2d9EGsPDgegi5AfS5Fp8glj6+OjsGJkx9i5UfaHpJLc1wDfCFsWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH1Nei34/BFPJ1EweM+pLnE/gKvQnt3YqMz/ZHua8PI=;
 b=dsswWCyz/eENJq8OAeBgsoo0xJrW3UPAslRGuyTY5VlKZ5WoBiwkWdIlT7dVqZKcemParMbrwnKzVdtsHFIIjBpYCjy+fk0MmGLqh7pwe+SKH+iggDNVzhvNgQJuyrLNMUek8+iG9s7RMftHxrXXFfUrFiHcRfsddO6trR6gzvbO6IQYcWP/OpWm64N5bMce2sqz0JOkFxmWkYEZlcbwXYvreNhVYtAL2rUj116JrUz9eiV3Al9ZYgvPK86F5de4IRpTP7Dm1VH8nd5diT/J7ioOBqRfZY/TcjntuZVke6pFdLMq3Zck1+G/7XvbpPF5KvJ4RgpVtwjDHbhS59vALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH1Nei34/BFPJ1EweM+pLnE/gKvQnt3YqMz/ZHua8PI=;
 b=R18q3RRhcIVR4XBw4xdijDNkD5OxLFASjvkU82JHcFjsyOvoeopfs81nWeQwhwXGM5xYSMko9OMeKruoq3x6TMG5E9T21+36+Xs0tHKYCBibUC003WaI5CAqYxEPAIMS0RthuGGa3Q+Am6YYMnOOwDk4V7Yrgbfb8YCHjLg3yRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 21:23:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 21:23:23 +0000
Content-Type: multipart/alternative;
 boundary="------------tST2OMIKPTVQKkULyWUIb3B0"
Message-ID: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
Date: Wed, 6 Dec 2023 16:23:21 -0500
User-Agent: Mozilla Thunderbird
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Proposal to add CRIU support to DRM render nodes
Content-Language: en-US
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu@openvz.org
X-ClientProxiedBy: YQBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::22)
 To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 049533ea-bd51-46dc-0046-08dbf6a193d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUKbBokoUXJsB6d6P8DElVG5ioGeITe4GRP1gDLh9oSQNcA12RPsN7qqzvRxUEnnklzCd+yvnbMqsV0OCxZLeKYXvytjqpFhmHhouIc0MXahbh8g3RrICaK7v6/cWOBhE6LjSQ9VOnFAu5Ov0VZJ2En5iun0YHgew4KkK8K7O7qLHlkZCyXWzHx+r+RN51IJqOKn6viErC8ZOveCUYzSPU9kKEDpGSElYqlrDW2INqqSIwOBX6YeDiwlhy0z6gvSqBwKlAYL7lIviiPl9WjnftHWq4pBF1LwvvadlWeyEpgjYk3vKMH0eiLd9RdrMcY64PWM0VhlLUN3JJc/E5ck1pcl0VwwGMcA8O1Thj+us2YcZecNBtwyzSh5G34Yi6FV3dl/kid2cJ/ldaPF3PZavkpS0FvLGcvurASNAdkDKQUIEG3AJiV+rge9CXTwmb9f+/7TtKlMyOpWQn6DIQVKdj8iMS2xhf/hCRybD3EhurFw3AkLlJ3Fux5TVl5Qa0iw9iq3pZKGcveD4d0HiIawh2TcQDeaJR71JH5jFG0AOFcfrmn8jMTZZems4qczv0su6fC82iQ5FFW2tgP4M70s1WDEH8xx+1G9BVEWeO3se7apSuYn1rc4TT6nwIHKxrC88+vrF/yH6AgYQ1KwiKrAL7KwB2Bs7p4lR0EdnfULiGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(3613699003)(31686004)(2906002)(30864003)(5660300002)(83380400001)(33964004)(6506007)(6512007)(166002)(26005)(2616005)(41300700001)(66899024)(966005)(110136005)(478600001)(6486002)(36756003)(8936002)(86362001)(66556008)(54906003)(66476007)(31696002)(8676002)(66946007)(44832011)(316002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW9ET0RhZnpWSWEranBydFZ2NXFIc05HcjlhK2ZNTTNUazkwaU16YmFFY2w5?=
 =?utf-8?B?cHdlV09pQ3BNb0dvVUFaV1pNRFJoclhST2hNV0x2K1VISktCVGdsc2JhTlk5?=
 =?utf-8?B?MnVvM2o2WGcycHJDVEZXZDV6UHZPZ3VPNVppOFp5ZitFSE10eG1kcm12YXN2?=
 =?utf-8?B?Wm9CRTk3S1hVNFNjM2xQeGNBNTU0dHF3N3l1emx1TXpFN3NKRW9RT2FMM3J4?=
 =?utf-8?B?NFhyL2Q1dFZWUEFBa0srSE96UzBXWFRyMk1MVUl0L2NmWVN3RFROQUFiVVVH?=
 =?utf-8?B?UndYeW1VTnRHT09zMEgzcnhQYVdXV1RSa29oS2V6VzNmUFR2WG5DbWg3WkZS?=
 =?utf-8?B?SlAxUHVUSzJSNnJncUs4RndGNlM3TEtYUnRWTi9QUTZYcnI3K1VPZTZkYytq?=
 =?utf-8?B?UlZMMzVOQTdTWGh2YkJzY1lsT0kwYnNpMTRZTGNmSGZzUGdCTkU4SDd0YUxl?=
 =?utf-8?B?T3h3aG1VQ1kyekZGMzVpWlFIK0ltRkZPc2VGdGFZQm9jYkEyTnFzZUF3TlJG?=
 =?utf-8?B?SUx0ZVlucGFXWVJkRU1VbUxMYUx0Ri9LeXI5c3Q2UWgvNzJrTUYxMnhmOGV1?=
 =?utf-8?B?YXJZNWpTSXBrMXdIZmFOaFZsSDdCblVUZ0xDbUkvaUxuVzFrQUk4ZHVodFZj?=
 =?utf-8?B?c0MzMDV6ZFEvTUdhN2o5TytsL3dXVkJGNHo2SXJBQkRlMlE5UkRwZG9ZUUlQ?=
 =?utf-8?B?N21SeTBXbTc3UHJOSkRZMi8yVjhjNjFLaVRUSTgyRndZdXZucWwxRm9pNDdm?=
 =?utf-8?B?VzJzaUdVbFVsQVpFNmRVMGxqVThqUjBlRjlRU0lBdVhBWFduSEdVSDBxSEhq?=
 =?utf-8?B?VW1uYVY1MmdyeHh5REZDcTRCVW44UmFncVIyZG40TnZGcm95eE42VC9rVnlx?=
 =?utf-8?B?YTVDZzI1SGdtRVFsbzVjY1E1TmJLcXB5RHBzRVAyS01LZFhtVE9EQVVYRThS?=
 =?utf-8?B?Ykw0V0ZNMENkM2NHQ3h1YTQwendjOC9aMDJld2pzc2NmNkRuZHIrUzNRM3lv?=
 =?utf-8?B?ckZPUFF2V3VMU3YvUjY4b0JMb25QVFcrcUFodzlzMkpvdUk5TFB3RFpLZ1Zv?=
 =?utf-8?B?Uk9NMWlMK3YyR1c3TWdyL2VCZ3FMc3NZZWd5K0ZMbC9uWGd6a3c2MmhwcnBE?=
 =?utf-8?B?Z2ZtdVg1bDRKRTFxQjJZMDVjaXpBY2FKT01zN3NGYTJBZWhrcE51WFBLUXA1?=
 =?utf-8?B?dEpRTTJTY2Q5SFdFeG5VUGRKdFc2TmxxT29ZMDhSRTRHdlNBaXVpZWxNdEd2?=
 =?utf-8?B?WHZkcUpuckpkekwxZTJrZVA0YVpvYWE4Y3FGYVkvYkp1am9LcHArTEdvZUJy?=
 =?utf-8?B?dngwWGRXVVFCK3ExMTE5ZWxiWExyMUZqVFNQZW1nanZnek5JcU82M0dzcE5S?=
 =?utf-8?B?cFBhME4rM282R2FhbGI0Umg3QjNWOFZrY3lKWm1nMXFvK0lOd3MycTRmcTV5?=
 =?utf-8?B?OHllaHZIbEd3V1ZnZkRMTlVuY1BWWWlTV2MvazhzdVBYbWhib3M0Vm1ZZ3M4?=
 =?utf-8?B?dUc5bzl1dnNDRkg2UUtDL1JSTEcyYjEzaHpLREp5bWo3eUM5cmVDc1ZxNWxh?=
 =?utf-8?B?ZWJmbHJiZC9KK2lLMXdlRUlBYkU1NHd6Vm52VFJYcHhrN0pRWGV0QWk2MWlF?=
 =?utf-8?B?T2hLYmVxTXVteFZ1TStsQnd2RksrZXJzdlFwY2V1R2lBVHFFNzI1ajYyTEZL?=
 =?utf-8?B?V2dvYnRibEhMRTR3aEgwTkhzSzlxZXQwVHNDT1ZDZXNUbTNmYUI2ZWIzT1pt?=
 =?utf-8?B?LzlJRDZTTnZrZW5qTjRiYW1EMHFYakU2NDgvRFJla1NmN0VjeWhPdUpLL3lj?=
 =?utf-8?B?bzdoSHZ5M1d4Qm5IYWU4QnJQaXpuV0tyd1pCRk9aa0RBM2NZS3JhR09aYjIv?=
 =?utf-8?B?TUlEQ09xWFg5bS93SkZWbng3dmJsenp4Z2tOZTgyYWRvelBlTnpBUG9OQXR1?=
 =?utf-8?B?amgrTUY0K09uYTJvZmZYbXNWZG1QbEZaR1NiRWlsV3l6Rlp0eU5EeEUwbWlr?=
 =?utf-8?B?MTd2dlRJTEpDaGNFUGhyTXVSR2JHeUlmMzltQ2ZZcFlKNDY5NFVZenVYOXE3?=
 =?utf-8?B?SWxYelBRRm1FeVkydHF1NU9kSHZJeXUrQmVLL0NIekRmMjVIcG03Wk9vbWVl?=
 =?utf-8?Q?atMV+UBMZm4p9lijLcKKqKHCy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049533ea-bd51-46dc-0046-08dbf6a193d1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 21:23:23.4590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Rlxq2j9vzjoK/VdGiuuMlvXrxVb9IHenxfLIU6/kImUxHx/NCF59sxUApVIUKiGD6GNZe1AW08PIqrwXUk52g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
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
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------tST2OMIKPTVQKkULyWUIb3B0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Executive Summary: We need to add CRIU support to DRM render nodes in 
order to maintain CRIU support for ROCm application once they start 
relying on render nodes for more GPU memory management. In this email 
I'm providing some background why we are doing this, and outlining some 
of the problems we need to solve to checkpoint and restore render node 
state and shared memory (DMABuf) state. I have some thoughts on the API 
design, leaning on what we did for KFD, but would like to get feedback 
from the DRI community regarding that API and to what extent there is 
interest in making that generic.

We are working on using DRM render nodes for virtual address mappings in 
ROCm applications to implement the CUDA11-style VM API and improve 
interoperability between graphics and compute. This uses DMABufs for 
sharing buffer objects between KFD and multiple render node devices, as 
well as between processes. In the long run this also provides a path to 
moving all or most memory management from the KFD ioctl API to libdrm.

Once ROCm user mode starts using render nodes for virtual address 
management, that creates a problem for checkpointing and restoring ROCm 
applications with CRIU. Currently there is no support for checkpointing 
and restoring render node state, other than CPU virtual address 
mappings. Support will be needed for checkpointing GEM buffer objects 
and handles, their GPU virtual address mappings and memory sharing 
relationships between devices and processes.

Eventually, if full CRIU support for graphics applications is desired, 
more state would need to be captured, including scheduler contexts and 
BO lists. Most of this state is driver-specific.

After some internal discussions we decided to take our design process 
public as this potentially touches DRM GEM and DMABuf APIs and may have 
implications for other drivers in the future.

One basic question before going into any API details: Is there a desire 
to have CRIU support for other DRM drivers?

With that out of the way, some considerations for a possible DRM CRIU 
API (either generic of AMDGPU driver specific): The API goes through 
several phases during checkpoint and restore:

Checkpoint:

 1. Process-info (enumerates objects and sizes so user mode can allocate
    memory for the checkpoint, stops execution on the GPU)
 2. Checkpoint (store object metadata for BOs, queues, etc.)
 3. Unpause (resumes execution after the checkpoint is complete)

Restore:

 1. Restore (restore objects, VMAs are not in the right place at this time)
 2. Resume (final fixups after the VMAs are sorted out, resume execution)

For some more background about our implementation in KFD, you can refer 
to this whitepaper: 
https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md

Potential objections to a KFD-style CRIU API in DRM render nodes, I'll 
address each of them in more detail below:

  * Opaque information in the checkpoint data that user mode can't
    interpret or do anything with
  * A second API for creating objects (e.g. BOs) that is separate from
    the regular BO creation API
  * Kernel mode would need to be involved in restoring BO sharing
    relationships rather than replaying BO creation, export and import
    from user mode

# Opaque information in the checkpoint

This comes out of ABI compatibility considerations. Adding any new 
objects or attributes to the driver/HW state that needs to be 
checkpointed could potentially break the ABI of the CRIU 
checkpoint/restore ioctl if the plugin needs to parse that information. 
Therefore, much of the information in our KFD CRIU ioctl API is opaque. 
It is written by kernel mode in the checkpoint, it is consumed by kernel 
mode when restoring the checkpoint, but user mode doesn't care about the 
contents or binary layout, so there is no user mode ABI to break. This 
is how we were able to maintain CRIU support when we added the SVM API 
to KFD without changing the CRIU plugin and without breaking our ABI.

Opaque information may also lend itself to API abstraction, if this 
becomes a generic DRM API with driver-specific callbacks that fill in 
HW-specific opaque data.

# Second API for creating objects

Creating BOs and other objects when restoring a checkpoint needs more 
information than the usual BO alloc and similar APIs provide. For 
example, we need to restore BOs with the same GEM handles so that user 
mode can continue using those handles after resuming execution. If BOs 
are shared through DMABufs without dynamic attachment, we need to 
restore pinned BOs as pinned. Validation of virtual addresses and 
handling MMU notifiers must be suspended until the virtual address space 
is restored. For user mode queues we need to save and restore a lot of 
queue execution state so that execution can resume cleanly.

# Restoring buffer sharing relationships

Different GEM handles in different render nodes and processes can refer 
to the same underlying shared memory, either by directly pointing to the 
same GEM object, or by creating an import attachment that may get its SG 
tables invalidated and updated dynamically through dynamic attachment 
callbacks. In the latter case it's obvious, who is the exporter and who 
is the importer. In the first case, either one could be the exporter, 
and it's not clear who would need to create the BO and who would need to 
import it when restoring the checkpoint. To further complicate things, 
multiple processes in a checkpoint get restored concurrently. So there 
is no guarantee that an exporter has restored a shared BO at the time an 
importer is trying to restore its import.

A proposal to deal with these problems would be to treat importers and 
exporters the same. Whoever restores first, ends up creating the BO and 
potentially attaching to it. The other process(es) can find BOs that 
were already restored by another process by looking it up with a unique 
ID that could be based on the DMABuf inode number. An alternative would 
be a two-pass approach that needs to restore BOs on two passes:

 1. Restore exported BOs
 2. Restore imports

With some inter-process synchronization in CRIU itself between these two 
passes. This may require changes in the core CRIU, outside our plugin. 
Both approaches depend on identifying BOs with some unique ID that could 
be based on the DMABuf inode number in the checkpoint. However, we would 
need to identify the processes in the same restore session, possibly 
based on parent/child process relationships, to create a scope where 
those IDs are valid during restore.

Finally, we would also need to checkpoint and restore DMABuf file 
descriptors themselves. These are anonymous file descriptors. The CRIU 
plugin could probably be taught to recreate them from the original 
exported BO based on the inode number that could be queried with fstat 
in the checkpoint. It would need help from the render node CRIU API to 
find the right BO from the inode, which may be from a different process 
in the same restore session.

Regards,
   Felix


--------------tST2OMIKPTVQKkULyWUIb3B0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Executive Summary: We need to add CRIU support to DRM render nodes
    in order to maintain CRIU support for ROCm application once they
    start relying on render nodes for more GPU memory management. In
    this email I'm providing some background why we are doing this, and
    outlining some of the problems we need to solve to checkpoint and
    restore render node state and shared memory (DMABuf) state. I have
    some thoughts on the API design, leaning on what we did for KFD, but
    would like to get feedback from the DRI community regarding that API
    and to what extent there is interest in making that generic.<br>
    <p>We are working on using DRM render nodes for virtual address
      mappings in ROCm applications to implement the CUDA11-style VM API
      and improve interoperability between graphics and compute. This
      uses DMABufs for sharing buffer objects between KFD and multiple
      render node devices, as well as between processes. In the long run
      this also provides a path to moving all or most memory management
      from the KFD ioctl API to libdrm.</p>
    <p>Once ROCm user mode starts using render nodes for virtual address
      management, that creates a problem for checkpointing and restoring
      ROCm applications with CRIU. Currently there is no support for
      checkpointing and restoring render node state, other than CPU
      virtual address mappings. Support will be needed for checkpointing
      GEM buffer objects and handles, their GPU virtual address mappings
      and memory sharing relationships between devices and processes.</p>
    <p>Eventually, if full CRIU support for graphics applications is
      desired, more state would need to be captured, including scheduler
      contexts and BO lists. Most of this state is driver-specific.</p>
    <p>After some internal discussions we decided to take our design
      process public as this potentially touches DRM GEM and DMABuf APIs
      and may have implications for other drivers in the future.</p>
    <p>One basic question before going into any API details: Is there a
      desire to have CRIU support for other DRM drivers?</p>
    <p>With that out of the way, some considerations for a possible DRM
      CRIU API (either generic of AMDGPU driver specific): The API goes
      through several phases during checkpoint and restore:</p>
    <p>Checkpoint:</p>
    <ol>
      <li>Process-info (enumerates objects and sizes so user mode can
        allocate memory for the checkpoint, stops execution on the GPU)</li>
      <li>Checkpoint (store object metadata for BOs, queues, etc.)</li>
      <li>Unpause (resumes execution after the checkpoint is complete)</li>
    </ol>
    <p>Restore:</p>
    <ol>
      <li>Restore (restore objects, VMAs are not in the right place at
        this time)</li>
      <li>Resume (final fixups after the VMAs are sorted out, resume
        execution)</li>
    </ol>
    <p>For some more background about our implementation in KFD, you can
      refer to this whitepaper:
      <a class="moz-txt-link-freetext" href="https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md" moz-do-not-send="true">
https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md</a><br>
    </p>
    <p>Potential objections to a KFD-style CRIU API in DRM render nodes,
      I'll address each of them in more detail below:</p>
    <ul>
      <li>Opaque information in the checkpoint data that user mode can't
        interpret or do anything with</li>
      <li>A second API for creating objects (e.g. BOs) that is separate
        from the regular BO creation API</li>
      <li>Kernel mode would need to be involved in restoring BO sharing
        relationships rather than replaying BO creation, export and
        import from user mode<br>
      </li>
    </ul>
    <p># Opaque information in the checkpoint<br>
    </p>
    <p>This comes out of ABI compatibility considerations. Adding any
      new objects or attributes to the driver/HW state that needs to be
      checkpointed could potentially break the ABI of the CRIU
      checkpoint/restore ioctl if the plugin needs to parse that
      information. Therefore, much of the information in our KFD CRIU
      ioctl API is opaque. It is written by kernel mode in the
      checkpoint, it is consumed by kernel mode when restoring the
      checkpoint, but user mode doesn't care about the contents or
      binary layout, so there is no user mode ABI to break. This is how
      we were able to maintain CRIU support when we added the SVM API to
      KFD without changing the CRIU plugin and without breaking our ABI.</p>
    <p>Opaque information may also lend itself to API abstraction, if
      this becomes a generic DRM API with driver-specific callbacks that
      fill in HW-specific opaque data.<br>
    </p>
    <p># Second API for creating objects</p>
    <p>Creating BOs and other objects when restoring a checkpoint needs
      more information than the usual BO alloc and similar APIs provide.
      For example, we need to restore BOs with the same GEM handles so
      that user mode can continue using those handles after resuming
      execution. If BOs are shared through DMABufs without dynamic
      attachment, we need to restore pinned BOs as pinned. Validation of
      virtual addresses and handling MMU notifiers must be suspended
      until the virtual address space is restored. For user mode queues
      we need to save and restore a lot of queue execution state so that
      execution can resume cleanly.<br>
    </p>
    <p># Restoring buffer sharing relationships</p>
    <p>Different GEM handles in different render nodes and processes can
      refer to the same underlying shared memory, either by directly
      pointing to the same GEM object, or by creating an import
      attachment that may get its SG tables invalidated and updated
      dynamically through dynamic attachment callbacks. In the latter
      case it's obvious, who is the exporter and who is the importer. In
      the first case, either one could be the exporter, and it's not
      clear who would need to create the BO and who would need to import
      it when restoring the checkpoint. To further complicate things,
      multiple processes in a checkpoint get restored concurrently. So
      there is no guarantee that an exporter has restored a shared BO at
      the time an importer is trying to restore its import.</p>
    <p>A proposal to deal with these problems would be to treat
      importers and exporters the same. Whoever restores first, ends up
      creating the BO and potentially attaching to it. The other
      process(es) can find BOs that were already restored by another
      process by looking it up with a unique ID that could be based on
      the DMABuf inode number. An alternative would be a two-pass
      approach that needs to restore BOs on two passes:</p>
    <ol>
      <li>Restore exported BOs</li>
      <li>Restore imports</li>
    </ol>
    <p>With some inter-process synchronization in CRIU itself between
      these two passes. This may require changes in the core CRIU,
      outside our plugin. Both approaches depend on identifying BOs with
      some unique ID that could be based on the DMABuf inode number in
      the checkpoint. However, we would need to identify the processes
      in the same restore session, possibly based on parent/child
      process relationships, to create a scope where those IDs are valid
      during restore.<br>
    </p>
    <p>Finally, we would also need to checkpoint and restore DMABuf file
      descriptors themselves. These are anonymous file descriptors. The
      CRIU plugin could probably be taught to recreate them from the
      original exported BO based on the inode number that could be
      queried with fstat in the checkpoint. It would need help from the
      render node CRIU API to find the right BO from the inode, which
      may be from a different process in the same restore session.<br>
    </p>
    <p>Regards,<br>
      &nbsp; Felix<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------tST2OMIKPTVQKkULyWUIb3B0--
