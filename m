Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF732FEBB7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 14:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5DE6E8EA;
	Thu, 21 Jan 2021 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FFE6E530;
 Thu, 21 Jan 2021 13:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaM5k+gi24B0hICP2CQEDQqruEhwTEsf+I7XbqKxMLoEw8EVhybgX4MGaG8YZL0cZzvm6ng24dJelDH+k+xHKPRQYY/P4cLxeNOootcwDtOVwMZfDhZDW+HvyccEnH1DT1+eN6SQU2DGRkF3D+MFfCf4u64rLnqFo6gDI1kAaCPLcD5XQFHU3eItIFsq1wVuN+tbwg0bbZNqU8qpMWEg0x1zpmgzl85wOh8x3rBd0upqPQskUe8O6vDVprGTvGbyXvX+uGtV6RSxRmWuXysCj72LhIp3ey1VvCgoWfgh9wNArOFgL+7ZAriq/Z7abJeDT0fN1giod01+LlokvaKT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDvnWnS1SB9GG18oQsGqzJD8rc0z/YeS/f4TWQ6DE08=;
 b=c8VncSp7HgWcIteoLCCpTEEGZ9ouz1rq0rM55fGNOlu4m97Flu9O8cIg19y1BfIVkA6pheSB4GB/Ebxv4MA20ErduKntAH0gAA2ywSKfPBzqeSLlKA3oyXCoErSmqArhiljJPE66wXER1VaPqWUDv4ahexM0pxm3L3O6STS2zdrgGsZm2+FSgj4UFinelhJ9g7J4Zxhn7O8a8Gk6EZvYiua1hiB7wYZob+D7ahGZI3o+fvpvlYh+TyQDd06W8Tmmdq+ReTAQ14R25RhTdMFgY95ri+35V22fNaPhkcnFfEGZoyY6S2HpYAoqcvTuWvyGJdVCUslhDaHX+ZWqmTURig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDvnWnS1SB9GG18oQsGqzJD8rc0z/YeS/f4TWQ6DE08=;
 b=xMW/4IpDpd6PuKUw0b+1kF6MZP3BRLiF641E/r0p+nb90bJ7wKGdOtD/hZWetDJ2y8w/6WX6irVcHAyGXzlrNqMnXgAqHMH9c68YImeXxh/WQKsI0XBxNlAyw4olpglCTxXcb4FP47OC09ES4dZHmZ/QmvcQk1tdYaGvMEZmEC0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Thu, 21 Jan
 2021 13:27:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 13:27:08 +0000
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
 <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
 <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
 <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
 <CABXGCsOcBMT4rL-bb4K_TzK70YmQsgNX37sHEHiqp_1kK1_UEQ@mail.gmail.com>
 <5f9e7752-68e8-aa5f-80ff-bb1196ea458d@amd.com>
 <CABXGCsP4KFFeSMLovCPV2yw17Pm9ovzwV5gp3CaQ9vUwx=Y-TA@mail.gmail.com>
 <CABXGCsM85uYEM0fKs5fubj9Lf=xM8oa5QzteVbKJr1eDWsk0wA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bb671243-7031-31ff-c6c3-dc1e4192ef71@amd.com>
Date: Thu, 21 Jan 2021 14:27:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CABXGCsM85uYEM0fKs5fubj9Lf=xM8oa5QzteVbKJr1eDWsk0wA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 13:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e935a584-447a-410f-5901-08d8be104027
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3837F304C1725E4567FBCB8F83A10@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6+Ksdac7Gmfd3QcVueXZ7aDxPImOLlH24SdmBxywXncc/o0ZSkfm5xVyFVtj1wZ05tm1jdjNonl/BbYGu1GpmUxLxt6x2M4Uil+kZKkPDD0yhSFv0owq3CrqqjlK+5TNG8AVbjxhZlGPA9QiYNWLCM/Kq5WWac2EhuOcPCnD66+i+h1Rg3L5TiwKMhHGSqbemU0NMAX3aojZx0dEiu+YWfm1fcMMhAnVlYVXX18FcXfrJPXi/S1myJL/Cw0cD6BKCGId4/J2rDTFvGp6mAK5k2U/nT8pr6Zrz59VPwUug67GoVbNPf3+AmUFkznx8AQ3RZXv7N10qPqpaK8oiNrDpjs6yBogeHLFvXb6QTNXs5RENQPfS5A/R6i7InhC4IRum/wkUwJofOgX+VaDSb2dWrjh6CgaGxyeSou4lpplxRxa14GO7P9zFPmWHnPiD+phRJ4LuTLnCAQ6zl3539XJe1PKDhh3FXhVlob0+7kJXEBDwSkBIviYIyHOrpff+xNR9mlpIwxetTMFqj1l8Sn0apesxV8es8exRlNw/CaXoVsIOhZUdBAarIgZWVPKveN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(2906002)(31696002)(86362001)(45080400002)(66556008)(52116002)(8936002)(16526019)(5660300002)(66476007)(8676002)(4326008)(66946007)(478600001)(316002)(6916009)(186003)(966005)(83380400001)(54906003)(6666004)(2616005)(30864003)(36756003)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0lxSDgzWVdGakZwdVFjTkFMUTNQVXlXWHVIbWJsMUpqb3BBekpiWXFNb1or?=
 =?utf-8?B?SHZBc3IxcHR0cTlUTHBCZElHMTVmRVNSWmNodGcrbGdDczB4Z0JCVG5waWsy?=
 =?utf-8?B?eEp4bG44RFRGMUVBUmd0bkNFdys3VTRnZlVOQlNmY0hoL3RhbjNqc2xpNk9X?=
 =?utf-8?B?ekxscTZSam9ObExLWmxSSHE4MVQwbHlDUGNnbkJya0QxcnRkbXNteVNJNGtO?=
 =?utf-8?B?Q3NmOERzTTZKeFZlZm1mS0tSb1liL3A4eExua24zZXRYYTRYakJYaXFPYTdO?=
 =?utf-8?B?NjdlZ1FvTEU3Sk1vdHYrZGhna1dCc3JRNlM2eXZEVmpXdG5JaGtLQWpTOGsr?=
 =?utf-8?B?d250UDJ6NGtTMW1GeEVYSS9JdTBkSUJKQXlqRHFjeE5aaEpBR0tEZS8vUUZl?=
 =?utf-8?B?cytma1ZNMTZPZ0hGa0xXQWNQalEwZkFOVHJqK2tZcklEaVE4YWxadGJvTjFr?=
 =?utf-8?B?U0xtUWVwK3hVdi9NWFNiSGtEUytSa3FQNU9nbk1JS2tuYUtuTDZXSzdIT1ZR?=
 =?utf-8?B?VnEzaDhQUnlQWmE0SHFVRlA5cUo0NHQxVUExcW1zWTkwMS9ycFE0Ym11MS90?=
 =?utf-8?B?ZHh3cEdMdWxabnovV2o4b1haNzdvZ3pHR1VVMWJVTDdUUitEb0V2V0w1akhr?=
 =?utf-8?B?amNrTHE4RnZMTWROZndiS292OVZHdWtGU04xcDd4NmlLU0pZTlE3alNYRWVJ?=
 =?utf-8?B?THY3K2x2TGJVUVF0RDlSZ3Q2dkhCRUdvY3lXcVBDVjdWZ1RqVVJJTURiRmRH?=
 =?utf-8?B?ME8xTE85Z2xjQUV4cHY1bFhaVlEyWUJlcHZHQjZPN2twZENaM2szOXpGYUh3?=
 =?utf-8?B?QTZyeGxZcWs3OXhvWkV1aWF6emNaMmp6RkZ6U2J4SE5OOTI2T1A0TXhTS2VT?=
 =?utf-8?B?dU1Ka21VdGNlYmxNaXRrTDlkbjZxRW1lOXlsYmVIenFKeWdNNTI4bm9vMzY3?=
 =?utf-8?B?T2xJZ1hpdUJuNGpzTXRrTlZkbDFnd2JHQmdHNGl5TDJUMmRLSnZzdVRDNjQ1?=
 =?utf-8?B?Nm5rM3RZNzdLL1p2S3FWdjMvWitqcWZMenpRdkFXclFuMlBRMzgwb2NxY3Z2?=
 =?utf-8?B?bGVhdzdqWDVKbGZYZzhwSVBVOUVFSUErWkluL2ZXakMzR0FIL04wTVpTazVN?=
 =?utf-8?B?M2lndmJScG9aYTkwNnNGYWU0dncxL1RESk9IbWxSZkhMa3ZOazJ4T3Yybk1T?=
 =?utf-8?B?cnkyZG9CaUVPeUN6M200NndvS3dDMzM2SjdiMytHR1BqVSs0NFBGSjVxb3JO?=
 =?utf-8?B?WGZvV0ZZOXlkOEVaTnVOZVdHTzE4SFlOVVRMa2ZRN0orVnJJVy9ibjdQSHFU?=
 =?utf-8?B?S2oyZDBZak82T2U4R0NUdWIydSs4cDBab0QwVXVGMUIyNW04T1lraFJydE9w?=
 =?utf-8?B?RWNIQXd1R3VOVGxha3ZBSjR1c0RXdmJETVJDSlpwdG5OM05Nc2JnTTA3TFJP?=
 =?utf-8?B?QXQ3NldZeW9ncGQyVlV6dkFyTjduTWJFUFFUazB3U0JKUVdHTEVUOFdaa1N2?=
 =?utf-8?Q?8zIDglCdlBRi9mBbgURz6ewJ9dw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e935a584-447a-410f-5901-08d8be104027
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 13:27:08.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoliqjrLtQAXTzJ/7mwzobUC384jLHGNl5F96/qnB6lVReQsi9fbOuA7nQ5+mJBd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I still have no idea what's going on here.

The KASAN messages from the DC code are completely unrelated.

Please add the full dmesg to your bug report.

Christian.

Am 20.01.21 um 01:59 schrieb Mikhail Gavrilov:
> On Fri, 15 Jan 2021 at 03:43, Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
> In rc4, the number of warnings has dropped dramatically.
> No more errors "kasan slab-out-of-bounds" and no "DMA-API device
> driver failed to check map error".
> But still not fixed "sleeping function called from invalid context at
> include/linux/sched/mm.h:196" and "BUG: key ffff88810b0d9148 has not
> been registered!"
> Second issue Navi specific because it started to happen in 5.10 kernel
> after replacing Radeon VII to 6900XT.
>
> 1.
> BUG: sleeping function called from invalid context at
> include/linux/sched/mm.h:196
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 500, name: systemd-udevd
> 1 lock held by systemd-udevd/500:
>   #0: ffff888107690258 (&dev->mutex){....}-{3:3}, at:
> device_driver_attach+0xa3/0x250
> CPU: 9 PID: 500 Comm: systemd-udevd Not tainted
> 5.11.0-0.rc4.129.fc34.x86_64+debug #1
> Hardware name: System manufacturer System Product Name/ROG STRIX
> X570-I GAMING, BIOS 2802 10/21/2020
> Call Trace:
>   dump_stack+0xae/0xe5
>   ___might_sleep.cold+0x150/0x17e
>   ? dcn30_clock_source_create+0x53/0x110 [amdgpu]
>   kmem_cache_alloc_trace+0x23f/0x270
>   dcn30_clock_source_create+0x53/0x110 [amdgpu]
>   dcn30_create_resource_pool+0x998/0x4890 [amdgpu]
>   ? dcn30_calc_max_scaled_time+0x40/0x40 [amdgpu]
>   ? lock_is_held_type+0xb8/0xf0
>   ? unpoison_range+0x3a/0x60
>   ? ____kasan_kmalloc.constprop.0+0x84/0xa0
>   ? dc_create_resource_pool+0x26e/0x5e0 [amdgpu]
>   dc_create_resource_pool+0x26e/0x5e0 [amdgpu]
>   dc_create+0x636/0x1bc0 [amdgpu]
>   ? lock_acquire+0x2dd/0x7a0
>   ? sched_clock+0x5/0x10
>   ? sched_clock_cpu+0x18/0x170
>   ? find_held_lock+0x33/0x110
>   ? dc_create_state+0xa0/0xa0 [amdgpu]
>   ? lock_downgrade+0x6b0/0x6b0
>   ? module_assert_mutex_or_preempt+0x3e/0x70
>   ? lock_is_held_type+0xb8/0xf0
>   ? unpoison_range+0x3a/0x60
>   ? ____kasan_kmalloc.constprop.0+0x84/0xa0
>   amdgpu_dm_init.isra.0+0x479/0x640 [amdgpu]
>   ? vprintk_emit+0x1c0/0x460
>   ? dev_vprintk_emit+0x2d8/0x31a
>   ? sched_clock+0x5/0x10
>   ? dm_resume+0x13b0/0x13b0 [amdgpu]
>   ? dev_attr_show.cold+0x35/0x35
>   ? lock_downgrade+0x6b0/0x6b0
>   ? dev_printk_emit+0x8c/0xa8
>   ? dev_vprintk_emit+0x31a/0x31a
>   ? wait_for_completion_io+0x240/0x240
>   ? __dev_printk+0x71/0xdf
>   ? smu_hw_init.cold+0x16b/0x18a [amdgpu]
>   ? smu_suspend+0x240/0x240 [amdgpu]
>   ? navi10_ih_irq_init+0xea3/0x2420 [amdgpu]
>   dm_hw_init+0xe/0x20 [amdgpu]
>   amdgpu_device_init.cold+0x3031/0x4940 [amdgpu]
>   ? amdgpu_device_cache_pci_state+0xf0/0xf0 [amdgpu]
>   ? pci_bus_read_config_byte+0x140/0x140
>   ? do_pci_enable_device+0x1f8/0x260
>   ? pci_find_saved_ext_cap+0x110/0x110
>   ? pci_enable_bridge+0xf9/0x1e0
>   ? pci_dev_check_d3cold+0x107/0x250
>   ? pci_enable_device_flags+0x201/0x340
>   amdgpu_driver_load_kms+0x167/0x8a0 [amdgpu]
>   amdgpu_pci_probe+0x235/0x360 [amdgpu]
>   ? amdgpu_pci_remove+0xd0/0xd0 [amdgpu]
>   local_pci_probe+0xd8/0x170
>   pci_device_probe+0x318/0x5c0
>   ? kernfs_create_link+0x16c/0x230
>   ? pci_device_remove+0x1d0/0x1d0
>   really_probe+0x224/0xc40
>   driver_probe_device+0x1f2/0x380
>   device_driver_attach+0x1df/0x250
>   __driver_attach+0xf6/0x260
>   ? device_driver_attach+0x250/0x250
>   bus_for_each_dev+0x114/0x180
>   ? subsys_dev_iter_exit+0x10/0x10
>   bus_add_driver+0x352/0x570
>   driver_register+0x20f/0x390
>   ? __pci_register_driver+0x13a/0x210
>   ? 0xffffffffc1d8d000
>   do_one_initcall+0xfb/0x530
>   ? perf_trace_initcall_level+0x3d0/0x3d0
>   ? __memset+0x2b/0x30
>   ? unpoison_range+0x3a/0x60
>   do_init_module+0x1ce/0x7a0
>   load_module+0x9841/0xa380
>   ? module_frob_arch_sections+0x20/0x20
>   ? lockdep_hardirqs_on_prepare+0x3e0/0x3e0
>   ? sched_clock_cpu+0x18/0x170
>   ? sched_clock+0x5/0x10
>   ? lock_acquire+0x2dd/0x7a0
>   ? sched_clock+0x5/0x10
>   ? lock_is_held_type+0xb8/0xf0
>   ? __do_sys_init_module+0x18b/0x220
>   __do_sys_init_module+0x18b/0x220
>   ? load_module+0xa380/0xa380
>   ? ktime_get_coarse_real_ts64+0x12f/0x160
>   do_syscall_64+0x33/0x40
>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7f2c109da07e
> Code: 48 8b 0d f5 1d 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 8b 0d c2 1d 0c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffc84d33f88 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> RAX: ffffffffffffffda RBX: 000055b87f8260a0 RCX: 00007f2c109da07e
> RDX: 000055b87f834060 RSI: 0000000001e2cbf6 RDI: 00007f2c0b7e0010
> RBP: 00007f2c0b7e0010 R08: 000055b87f8281e0 R09: 00007ffc84d30a26
> R10: 000055bd2404cc18 R11: 0000000000000246 R12: 000055b87f834060
> R13: 000055b87f831ca0 R14: 0000000000000000 R15: 000055b87f832640
> [drm] Display Core initialized with v3.2.116!
> [drm] DMUB hardware initialized: version=0x02000001
> usb 1-3.2: Device not responding to setup address.
> usb 1-3.2: device not accepting address 5, error -71
> [drm] REG_WAIT timeout 1us * 100000 tries - mpc2_assert_idle_mpcc line:480
>
>
> 2.
> BUG: key ffff88810b0d9148 has not been registered!
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(1)
> WARNING: CPU: 25 PID: 500 at kernel/locking/lockdep.c:4618
> lockdep_init_map_waits+0x592/0x770
> Modules linked in: amdgpu(+) drm_ttm_helper ttm iommu_v2 gpu_sched
> drm_kms_helper cec crct10dif_pclmul crc32_pclmul crc32c_intel drm
> ghash_clmulni_intel ccp igb nvme dca nvme_core i2c_algo_bit xhci_pci
> xhci_pci_renesas wmi pinctrl_amd fuse
> CPU: 25 PID: 500 Comm: systemd-udevd Tainted: G        W
> --------- ---  5.11.0-0.rc4.129.fc34.x86_64+debug #1
> Hardware name: System manufacturer System Product Name/ROG STRIX
> X570-I GAMING, BIOS 2802 10/21/2020
> RIP: 0010:lockdep_init_map_waits+0x592/0x770
> Code: 08 84 d2 0f 85 d8 01 00 00 8b 3d e1 02 38 04 85 ff 0f 85 7e fc
> ff ff 48 c7 c6 e0 04 ca 8e 48 c7 c7 40 fd c9 8e e8 01 8e 23 02 <0f> 0b
> e9 64 fc ff ff 48 89 df 44 89 4c 24 0c 44 89 44 24 08 48 89
> RSP: 0018:ffffc900029bef88 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
> RDX: 0000000000000027 RSI: 0000000000000004 RDI: fffff52000537de7
> RBP: 0000000000000000 R08: 0000000000000001 R09: ffff8886f9fe72ab
> R10: ffffed10df3fce55 R11: 0000000000000001 R12: ffff88810b0d9148
> R13: 0000000000000000 R14: ffffffff8edbda60 R15: ffff88810b0db690
> FS:  00007f2c0fdda140(0000) GS:ffff8886f9e00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055b8800aec68 CR3: 0000000127fd0000 CR4: 0000000000350ee0
> Call Trace:
>   ? lockdep_hardirqs_on+0x75/0xf0
>   __kernfs_create_file+0x102/0x2f0
>   sysfs_add_file_mode_ns+0x1af/0x500
>   sysfs_create_bin_file+0x100/0x160
>   ? lock_is_held_type+0xb8/0xf0
>   ? sysfs_add_file_to_group+0x150/0x150
>   ? static_obj+0x8a/0xc0
>   ? lockdep_init_map_waits+0x2a2/0x770
>   hdcp_create_workqueue+0x879/0xb50 [amdgpu]
>   amdgpu_dm_init.isra.0.cold+0x7f2/0x374c [amdgpu]
>   ? vprintk_emit+0x140/0x460
>   ? dev_vprintk_emit+0x2d8/0x31a
>   ? sched_clock+0x5/0x10
>   ? dm_resume+0x13b0/0x13b0 [amdgpu]
>   ? dev_attr_show.cold+0x35/0x35
>   ? psp_set_srm+0x250/0x250 [amdgpu]
>   ? hdcp_update_display+0x5b0/0x5b0 [amdgpu]
>   ? lock_downgrade+0x6b0/0x6b0
>   ? dev_printk_emit+0x8c/0xa8
>   ? dev_vprintk_emit+0x31a/0x31a
>   ? wait_for_completion_io+0x240/0x240
>   ? __dev_printk+0x71/0xdf
>   ? smu_hw_init.cold+0x16b/0x18a [amdgpu]
>   ? smu_suspend+0x240/0x240 [amdgpu]
>   ? navi10_ih_irq_init+0xea3/0x2420 [amdgpu]
>   dm_hw_init+0xe/0x20 [amdgpu]
>   amdgpu_device_init.cold+0x3031/0x4940 [amdgpu]
>   ? amdgpu_device_cache_pci_state+0xf0/0xf0 [amdgpu]
>   ? pci_bus_read_config_byte+0x140/0x140
>   ? do_pci_enable_device+0x1f8/0x260
>   ? pci_find_saved_ext_cap+0x110/0x110
>   ? pci_enable_bridge+0xf9/0x1e0
>   ? pci_dev_check_d3cold+0x107/0x250
>   ? pci_enable_device_flags+0x201/0x340
>   amdgpu_driver_load_kms+0x167/0x8a0 [amdgpu]
>   amdgpu_pci_probe+0x235/0x360 [amdgpu]
>   ? amdgpu_pci_remove+0xd0/0xd0 [amdgpu]
>   local_pci_probe+0xd8/0x170
>   pci_device_probe+0x318/0x5c0
>   ? kernfs_create_link+0x16c/0x230
>   ? pci_device_remove+0x1d0/0x1d0
>   really_probe+0x224/0xc40
>   driver_probe_device+0x1f2/0x380
>   device_driver_attach+0x1df/0x250
>   __driver_attach+0xf6/0x260
>   ? device_driver_attach+0x250/0x250
>   bus_for_each_dev+0x114/0x180
>   ? subsys_dev_iter_exit+0x10/0x10
>   bus_add_driver+0x352/0x570
>   driver_register+0x20f/0x390
>   ? __pci_register_driver+0x13a/0x210
>   ? 0xffffffffc1d8d000
>   do_one_initcall+0xfb/0x530
>   ? perf_trace_initcall_level+0x3d0/0x3d0
>   ? __memset+0x2b/0x30
>   ? unpoison_range+0x3a/0x60
>   do_init_module+0x1ce/0x7a0
>   load_module+0x9841/0xa380
>   ? module_frob_arch_sections+0x20/0x20
>   ? lockdep_hardirqs_on_prepare+0x3e0/0x3e0
>   ? sched_clock_cpu+0x18/0x170
>   ? sched_clock+0x5/0x10
>   ? lock_acquire+0x2dd/0x7a0
>   ? sched_clock+0x5/0x10
>   ? lock_is_held_type+0xb8/0xf0
>   ? __do_sys_init_module+0x18b/0x220
>   __do_sys_init_module+0x18b/0x220
>   ? load_module+0xa380/0xa380
>   ? ktime_get_coarse_real_ts64+0x12f/0x160
>   do_syscall_64+0x33/0x40
>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7f2c109da07e
> Code: 48 8b 0d f5 1d 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 8b 0d c2 1d 0c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffc84d33f88 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> RAX: ffffffffffffffda RBX: 000055b87f8260a0 RCX: 00007f2c109da07e
> RDX: 000055b87f834060 RSI: 0000000001e2cbf6 RDI: 00007f2c0b7e0010
> RBP: 00007f2c0b7e0010 R08: 000055b87f8281e0 R09: 00007ffc84d30a26
> R10: 000055bd2404cc18 R11: 0000000000000246 R12: 000055b87f834060
> R13: 000055b87f831ca0 R14: 0000000000000000 R15: 000055b87f832640
> irq event stamp: 593331
> hardirqs last  enabled at (593331): [<ffffffff8c3602f0>]
> console_unlock+0x7c0/0x9a0
> hardirqs last disabled at (593330): [<ffffffff8c3601e8>]
> console_unlock+0x6b8/0x9a0
> softirqs last  enabled at (593162): [<ffffffff8e801112>]
> asm_call_irq_on_stack+0x12/0x20
> softirqs last disabled at (593157): [<ffffffff8e801112>]
> asm_call_irq_on_stack+0x12/0x20
> ---[ end trace 37dc3a4a3aa1704a ]---
>
> Issue with the switching off monitor still happens too, but messages
> in logs become more detailed:
> [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the buffer list -4!
> amdgpu 0000:0b:00.0: amdgpu: 0000000087613007 pin failed
> [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
> framebuffer with error -12
> [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the buffer list -4!
> [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the buffer list -4!
>
> I hope "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the
> buffer list -4!" gives an idea of what happened.
>
> Full kernel log is here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FnX69zgvf&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cdee77ab7d3c04b44adda08d8bcdebcfe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467012155850822%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=J6TiqMBHrrZyNolxaUgKo4%2BNa6kBCBytrs1bJhqzGuU%3D&amp;reserved=0
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
