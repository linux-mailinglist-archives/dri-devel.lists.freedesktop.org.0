Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D251D74E01C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 23:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320BB10E2D8;
	Mon, 10 Jul 2023 21:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D560C10E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 21:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFsK/HK9jpBT2gv5ZXZEheksHJ4Vm8PcKwHbEjCoW0E/igyIGOzvfZKWMnkImOjLxBxROargsqBoZ4EXrYEymk8bIoOa3PQHAKuzXoBdW6JGsM0XWIRvsFSsbZb1lBCiOaYSKzf6ZbHlM1tsq6bxJtv0UvqBfnRzcaFvF3uz+YhjChlRz5/zYAblXcEcMJH0ti8M5ubhHvjXAbB+D32nJu10W2+tkxR5FPRyIL0E3RA1HAOFwpcNZtim+BuICcel3VLwnhAeMBqtZD+IPcYg1h5RlzWaJTv2aq1elwN0odqKZ3Cix2MGB5fa+T9/BESJxxxPJkFkESsf1Yj3B70P6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8W0IL5Q2QrlZ5oEg2Y6BRzEPA7/Y8HjXx+VUzvj8MBI=;
 b=P2eAKsP1xbgR6soSQA2p1bV6AI5UHaotOa/eO2YM0BXZU/RWsQ4VNybYzZ39RLXBPS9DqSBR0WTpankBm9pC7KEqpKcOVf+Gt26YrOyckcpegvzeQpRB2RNKMFXJ9PJxJjPhuatul97eKGwJBrEQjG5QP7PHnOmvijKjo4EyND83gvp8nMmI+3GW+u2wUAzUyNeT90nOW5yA3U+Qrb/qDRZNUsuEVrJKmCAY/kYGIMrEq3Piwk5DEEpoHbqKEkO7033S5qn/0DPn+FNQv8KuJ+tTXors09UjuO1e/3roidgSI1eoZKFiysjyNV85a5XLN7Fsx1L4dOdgXptSNCnoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W0IL5Q2QrlZ5oEg2Y6BRzEPA7/Y8HjXx+VUzvj8MBI=;
 b=qHfhMyLZkp1+NtY2uN9jsxpe5v8acnkbHIYfJ2mvvLc+AYFgz7RNSNw8UhrHvnTkyPQP8EswZwUjKZzgqYmbSoZ8b0yv6x4DZM4skZIldhVSZQ/avbt0IVmzXkrzZswkgovPVmjgovoTMZePnhP/pStGGUgePb18nV8pW84LRUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 21:15:42 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48%2]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 21:15:42 +0000
Message-ID: <3bcebac5-81d8-79a5-cdfb-48db782ec206@amd.com>
Date: Mon, 10 Jul 2023 17:15:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-CA, en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230710205625.130664-1-robdclark@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: Add missing RCU flag to fence slab
In-Reply-To: <20230710205625.130664-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::34) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 94758251-73a4-4c1d-d820-08db818ad160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9pLdXI1cuN3uIwdGQjJccjk7UbI5jFYn4JfkfmA4kQceP6yYGvglBEaL9tHm4YiRAoORA43gc8rvJsnNPWaZ3rGs8Pi6NkKZMRnu8w1FWxPLpcASrRTaACLQr/YFx2zXTl1C+WkcAE1IWVXx7BAAbqXq0W1EEmwuw0FPBIDqyWSfrTgZnh966Or+H8xa4DPI0D0+YmZmsVJjyXrpK5CP8QaMqOGr2hnCZFLvWAEB+t9b4YzyIh2F0e6IxSw4B1wM5KsNUN6qWgiu2OMZOq8l75NyskEZ1ZoRU9sCdibHPp2UItXL8Koo2CIJI4liH5ENi3vg7O5RBGSg+tAASgfPD9kCfBZZmXy4qIZbZpOF9r2rKoWHv6rTU/4pUkiArrDjPN+a+FGShK2wAvLO6LQkm1uEL8zuMindXV6gYZlbjzId5EVDWkPmOQkGGTVgqk1L2lYC1zA8lu3StzsyJqGQ+ps12LK2L5bMR4HAPBShjO8BuRq258MjImuhBp/sSS6K77xsOuW1N7UrA/mn1SCulv6VpoCqfhtzf5RxuB88wZzV02CUg62X39CBTPZFzsm9wYa1GscnQMJ/trVX3RvuXl3+JSKs7D8r/skmLFd96IEbpAfgbTvHhvMQExGTd902fBznS+0LuVTG3DkEcSZAOU+QPJxw12zcHkqc1wGv7sizkK1n45mr2/zZntGXanw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(186003)(6506007)(53546011)(6512007)(2616005)(26005)(44832011)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8936002)(8676002)(66476007)(478600001)(66946007)(6486002)(54906003)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001)(505234007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhLTGxQWjFEUFpTakQ5aHBUMVE1Yk41TkNYc25GVmRUeTlwMUZGNG4zVW9j?=
 =?utf-8?B?ekI1Q1M1M3VBcndhdWxUVExwa2gvNHJGT0xYcmQ5Z1luL1J5cGtaRlRNeU4z?=
 =?utf-8?B?ZUcrN21MK200V2p3MTV0ZnNXZkJuOG1CdHQ0RDlINWxJbWNLVkJ5VUJHdXRn?=
 =?utf-8?B?NTNUeGcyTEs4YkdUQldEU2N0ZjJabXpGMTkrdXRlUXlKVnNralRac1BTWlFP?=
 =?utf-8?B?ZlVYcG5lekNVcG5BdEpKS0l6MWhqQnlza2V2SzZpU1FUR1k0TDNVb211bFdY?=
 =?utf-8?B?VzhuVm9qY0czaDc4blJKWjJ2V0dNbTJhMlRUWGhkMmlTTjJCQUhrOXNrVVdN?=
 =?utf-8?B?eTlXWWlUNjM0OWtLQ29Dd0luRS91TnNkUmtxRWdWb2lnVzk1bCtsVjF2VWkw?=
 =?utf-8?B?UVFzM2F2eCtCNnBXcnBmQU0rSmNGL0VWRk9KUWlyVmNxZjRXNHFnMU1zU01Z?=
 =?utf-8?B?MmNHeGpzVFZ2eGIvM2cyOEhndmh3Y2d2TU9VcDl4RzVwUjd0YWFET0o2dFN5?=
 =?utf-8?B?UGJjcXVYYWhhR3M2dVJFLzRRdzRQNGQvWWlNMWJxT3RRTlJ1OUNnOHJPU29D?=
 =?utf-8?B?N1JvZzdhYUZMNHJVaFpMRlNyQVpEbERDNW1TNjBqaGZRVHV2NzNqbDdCWCth?=
 =?utf-8?B?bWxITU5GZjhSWkZJNWFpZGdhVEFOSUN3YW5CMzBSZEg1Y3pWYzVmZUJ1bTlj?=
 =?utf-8?B?RytHY2V5Vk5zVGlDSHhISHZvUXJ5ekhDeWNVWCs3U1FWL3FEbG5VU2g2NFRS?=
 =?utf-8?B?dk85VThyOFM4ZVlDbk0xQ3YxZWxsWmxCMm1CT1JJdHdNYTZlNWVvZG55NDNi?=
 =?utf-8?B?bi9US3dMRTdONlBvNXdrOFh4VHBOS3JrL3puM2JBQnp6MldZcG9XaFgrbmlN?=
 =?utf-8?B?OWdQbGdLMmtkUmZaNkFCdXhqOE95a042OWlIV29oWnpkQXR0bWpFQ2ZIU1RW?=
 =?utf-8?B?TlpReW9FenM3SXJ4RnpZbDVraGcvbmRSM09pakhHL3JKcE1scmpTUWVkOXVp?=
 =?utf-8?B?Q2lKQXczdnFKVHR0S0NkcFBKSlM0d0ZRYVUwQ24vZDhkUHhWMEJrOGtadnZw?=
 =?utf-8?B?TU95YmN1OEI2ZnBUcW1FeVhrUUxpTFRNWCtNbzdrM0cwNUNxWnMrUnBnZjdW?=
 =?utf-8?B?U3ArM3hRK2oyeVhKenVSaXpPQ1dTdHRCRDcrU2RUS3J0UlcvbFZrNndKN3U5?=
 =?utf-8?B?cTg1M3ZyQm5hMEVpOEExRmRJeWdHNTdZTm5VbEJuOGIyVlN0Ti9wR2V6ZFQw?=
 =?utf-8?B?MjRUZU1zTTZQTHMxWUEzSUwzWGNUcXdRaHE3VjF5aU02WnNZQklWWWpUMVJw?=
 =?utf-8?B?d2xVYzR6NHY1NWJaTytaNGNJYVBtQy9iVFpyNkNnTVRsek9oTDArSW9COSsv?=
 =?utf-8?B?QVJuTDNzSDFsMjcwdXBzMzlGYUJuYUY3VnVmbG4xR2xBZi9QbjUveFVISDhh?=
 =?utf-8?B?SFVDZFYwdjlEWjJkbFRYRGRPNEN4L0d5NW4rbjlKTGhENWxMcHhienFrRlZG?=
 =?utf-8?B?bnRoRHp3SmJrVnh2bmxxdmVGUVJWRkUzVEEycXhTTEJZcU1Kb1RVS2NkZTVT?=
 =?utf-8?B?eVNWYzcxQk9CVWFVZy9RZGlnUlNGMHZ5OHB4Z2hPdURkYWl5MTdxdTZhV1JS?=
 =?utf-8?B?TWd2TFkwZTFyR09QSVFIbXM2NmhmRjZHb3loY3hkQ1M3aDRMay9sMjJGYXAw?=
 =?utf-8?B?b3dJaWZnSDRpck1HL0wwR1IrWGZKQXMvTlNYTzV2MW1CRVA1SzNiT291THN2?=
 =?utf-8?B?cFlXdGpqNmlRNk5GQ3lHZXdqUnQ0QTVibHZzcEh1U0lTcE9rbEtEeEZ5aEYz?=
 =?utf-8?B?WHl5Tmg3Q1hwejRvZ3dSV2d5ZU0zZ0xxTXpkWkJtNDlRT0h5RFdicUtianhi?=
 =?utf-8?B?Q1VSMDliN3U1MmdBVmFXeFgrYkVxWTR0dDdKTjZSbGJSM0F5L2prZUtZMEg2?=
 =?utf-8?B?S051VTJpc2tua3g3aVlrZFpHOUhROEZ3SCtBZzRKSkxFNVpBaTRKeVhwbkYw?=
 =?utf-8?B?R2NEMlpmVjVaNUNqTHhlU0psQXI0RjY3QUswSmNHMjc3MU5ON1pTei81VU1F?=
 =?utf-8?B?K1p4ZE93QXdBbUUwWWR4STJYa3lVNWhzRGxWd0d2THNTYU5SVU9XZ2VCLzlG?=
 =?utf-8?Q?HUCCojsyLSCIiz8jDiN4ZNXEC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94758251-73a4-4c1d-d820-08db818ad160
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 21:15:42.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBh6wNwp5cEJPV2UaBbmpuvCiLmD/dKn4H58a1WyIoxG907luenAPc7QhTgInQYi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Alexander Potapenko <glider@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-10 16:56, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the KASAN splat:
> 
>    ==================================================================
>    BUG: KASAN: use-after-free in msm_ioctl_wait_fence+0x31c/0x7b0
>    Read of size 4 at addr ffffff808cb7c2f8 by task syz-executor/12236
>    CPU: 6 PID: 12236 Comm: syz-executor Tainted: G        W         5.15.119-lockdep-19932-g4a017c53fe63 #1 b15455e5b94c63032dd99eb0190c27e582b357ed
>    Hardware name: Google Homestar (rev3) (DT)
>    Call trace:
>     dump_backtrace+0x0/0x4e8
>     show_stack+0x34/0x50
>     dump_stack_lvl+0xdc/0x11c
>     print_address_description+0x30/0x2d8
>     kasan_report+0x178/0x1e4
>     kasan_check_range+0x1b0/0x1b8
>     __kasan_check_read+0x44/0x54
>     msm_ioctl_wait_fence+0x31c/0x7b0
>     drm_ioctl_kernel+0x214/0x418
>     drm_ioctl+0x524/0xbe8
>     __arm64_sys_ioctl+0x154/0x1d0
>     invoke_syscall+0x98/0x278
>     el0_svc_common+0x214/0x274
>     do_el0_svc+0x9c/0x19c
>     el0_svc+0x5c/0xc0
>     el0t_64_sync_handler+0x78/0x108
>     el0t_64_sync+0x1a4/0x1a8
>    Allocated by task 12224:
>     kasan_save_stack+0x38/0x68
>     __kasan_slab_alloc+0x6c/0x88
>     kmem_cache_alloc+0x1b8/0x428
>     drm_sched_fence_alloc+0x30/0x94
>     drm_sched_job_init+0x7c/0x178
>     msm_ioctl_gem_submit+0x2b8/0x5ac4
>     drm_ioctl_kernel+0x214/0x418
>     drm_ioctl+0x524/0xbe8
>     __arm64_sys_ioctl+0x154/0x1d0
>     invoke_syscall+0x98/0x278
>     el0_svc_common+0x214/0x274
>     do_el0_svc+0x9c/0x19c
>     el0_svc+0x5c/0xc0
>     el0t_64_sync_handler+0x78/0x108
>     el0t_64_sync+0x1a4/0x1a8
>    Freed by task 32:
>     kasan_save_stack+0x38/0x68
>     kasan_set_track+0x28/0x3c
>     kasan_set_free_info+0x28/0x4c
>     ____kasan_slab_free+0x110/0x164
>     __kasan_slab_free+0x18/0x28
>     kmem_cache_free+0x1e0/0x904
>     drm_sched_fence_free_rcu+0x80/0x9c
>     rcu_do_batch+0x318/0xcf0
>     rcu_nocb_cb_kthread+0x1a0/0xc4c
>     kthread+0x2e4/0x3a0
>     ret_from_fork+0x10/0x20
>    Last potentially related work creation:
>     kasan_save_stack+0x38/0x68
>     kasan_record_aux_stack+0xd4/0x114
>     __call_rcu_common+0xd4/0x1478
>     call_rcu+0x1c/0x28
>     drm_sched_fence_release_scheduled+0x108/0x158
>     dma_fence_release+0x178/0x564
>     drm_sched_fence_release_finished+0xb4/0x124
>     dma_fence_release+0x178/0x564
>     __msm_gem_submit_destroy+0x150/0x488
>     msm_job_free+0x9c/0xdc
>     drm_sched_main+0xec/0x9ac
>     kthread+0x2e4/0x3a0
>     ret_from_fork+0x10/0x20
>    Second to last potentially related work creation:
>     kasan_save_stack+0x38/0x68
>     kasan_record_aux_stack+0xd4/0x114
>     __call_rcu_common+0xd4/0x1478
>     call_rcu+0x1c/0x28
>     drm_sched_fence_release_scheduled+0x108/0x158
>     dma_fence_release+0x178/0x564
>     drm_sched_fence_release_finished+0xb4/0x124
>     dma_fence_release+0x178/0x564
>     drm_sched_entity_fini+0x170/0x238
>     drm_sched_entity_destroy+0x34/0x44
>     __msm_file_private_destroy+0x60/0x118
>     msm_submitqueue_destroy+0xd0/0x110
>     __msm_gem_submit_destroy+0x384/0x488
>     retire_submits+0x6a8/0xa14
>     recover_worker+0x764/0xa50
>     kthread_worker_fn+0x3f4/0x9ec
>     kthread+0x2e4/0x3a0
>     ret_from_fork+0x10/0x20
>    The buggy address belongs to the object at ffffff808cb7c280
>    The buggy address is located 120 bytes inside of
>    The buggy address belongs to the page:
>    page:000000008b01d27d refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10cb7c
>    head:000000008b01d27d order:1 compound_mapcount:0
>    flags: 0x8000000000010200(slab|head|zone=2)
>    raw: 8000000000010200 fffffffe06844d80 0000000300000003 ffffff80860dca00
>    raw: 0000000000000000 0000000000190019 00000001ffffffff 0000000000000000
>    page dumped because: kasan: bad access detected
>    Memory state around the buggy address:
>     ffffff808cb7c180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     ffffff808cb7c200: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
>    >ffffff808cb7c280: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                                    ^
>     ffffff808cb7c300: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
>     ffffff808cb7c380: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
>    ==================================================================
> 
> Suggested-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index ef120475e7c6..b624711c6e03 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -35,7 +35,7 @@ static int __init drm_sched_fence_slab_init(void)
>  {
>  	sched_fence_slab = kmem_cache_create(
>  		"drm_sched_fence", sizeof(struct drm_sched_fence), 0,
> -		SLAB_HWCACHE_ALIGN, NULL);
> +		SLAB_HWCACHE_ALIGN | SLAB_TYPESAFE_BY_RCU, NULL);
>  	if (!sched_fence_slab)
>  		return -ENOMEM;
>  

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

But let it simmer for 24 hours so Christian can see it too (CC-ed).
-- 
Regards,
Luben

