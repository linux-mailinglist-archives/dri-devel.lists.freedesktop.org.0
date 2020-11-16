Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFC52B45CB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 15:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10789CF1;
	Mon, 16 Nov 2020 14:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972989CF1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 14:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQCDM9KGv9FJGr9KSBZfFmF4LlXH4H7J1xEL92K8wcPXh9UM9YkUxk6c7HKOYxuLLb0r/JfP3hXoyAXTVOPCp38Ztvc5rWOpGUbaannJ5PBsDdH9jQyRXjNLUW3Wu714MfB8+Tyd/L+3G+LqUNymGjD10+SL66g5ULkO3UnX8BLzF4XgsDQPC9uBVuEX18N9o77HLRa5XYhKLnt0RRqkaDWElaOzMFLraOWu6+pQ5dacy3Cnsh1n7LTH0dBC2QYJz3iMXvI2oxU9LVPk+FYcd3uli0h44zbxacbqvbMb/0ch4OfNn9XugoXXWL+TKENRti/PTr/EGhCpGneL6KLW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34mtPgzXERVKKWlGfYXMHOXUYM72A5KBlHXdtWAK2x4=;
 b=IG9e2yY7vfHc3xagbzdWPi6RglOjObtrWnSjk4o+OQckv/Ua5Upl9ZEbwYGzlXOPwMEKdCXmvNEl20uGqbcS0J5iHdAVcglciT81NXKH4zutyZzQBnuW+3zw21pCDoAjB0csAV5B0pPmkX4D2apWIWRFznsKW3r24zejoCJ2Qc1yNQe1d99j4oSdOK/NUfOBLFupbmXfXTuUFRlVzE3EG7wbkJx1wXdOHjQqT8L6NtsqAzyi4fy3J5YxeqiVujMxQn0p6/C/W/wl7rryWbf9Mc6gRvPwADyTHLzvAFNS7Ejds8+YBorPiXIPtFpvXrtYvGbQl05x/ctyVyQmh525Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34mtPgzXERVKKWlGfYXMHOXUYM72A5KBlHXdtWAK2x4=;
 b=Wq/flwY9pvijMtUW1Nrl5W8eTdKHbioKTL6zBjc9Cfr6C3N7gAZKdlQLgAXipgB8acfwKGuD0qddCz8zViDhwVNX+dM1xYSPuXkhp4El2JKR0xxHvQ2K5Mjty27WZ+ypO8iGlrWy3JrrfXNnpXPss5CQNvuGJYpQ7Rc6Srb71xs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3840.namprd12.prod.outlook.com (2603:10b6:208:16f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 14:25:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 14:25:07 +0000
Subject: Re: [PATCH 4/4] drm/radeon/ttm: use multihop
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-5-airlied@gmail.com>
 <9a41272a-91d6-9f7a-829f-c8c20d1774ea@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d367fb93-5682-8502-4eeb-423b47ab6a41@amd.com>
Date: Mon, 16 Nov 2020 15:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9a41272a-91d6-9f7a-829f-c8c20d1774ea@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0128.eurprd05.prod.outlook.com
 (2603:10a6:207:2::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0128.eurprd05.prod.outlook.com (2603:10a6:207:2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 14:25:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03854287-6cd8-4559-bf31-08d88a3b6a99
X-MS-TrafficTypeDiagnostic: MN2PR12MB3840:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3840E3CE771F07CFE82A171E83E30@MN2PR12MB3840.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRcbIIiam41Icqw/wUG8EF2KRVtla49YxnGjTTwqB4cjGFfqPVBh2cI4WAhhRxBd2sQweaYjn3mbsOvBROs0bI2UB5N47Zdvq+HO6Jnyvr7PqBvVdprvFHFdZHqhMmHbwHZNPn3oDdOUwf4gWJJJnyilgkJ6scYTiOIOJSMcc2hJ2MRo3NPn36nCC1m3jDBZQUOU2e3iWRvy7bAcNq7lo8/IIECpUcuqQEbRgNQvcEhpP9JVxkjY+MCIzAf2XudM8sy7mLaepJwiFmybWtK7muFYzMZU5qWJuU+Vizs9nfAoTAIlRYQ/7AkxW07GwUjRHgafbNtFYMIPPhw6+r52XSeu53CLhBN/RTne3+CoHOS6Zub/Mv57Klnpp1nf0+LT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(83380400001)(45080400002)(8676002)(52116002)(31696002)(36756003)(478600001)(86362001)(6486002)(8936002)(31686004)(16526019)(6666004)(5660300002)(30864003)(2616005)(110136005)(66946007)(66476007)(2906002)(66556008)(186003)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0V4ZC9aK0tZYkxKdDFpdHdLWHJlR3RTUXNWTVRGV1pPbHFHOFJDSnRINlNZ?=
 =?utf-8?B?c203UXhPYUJDZTdqZ0puZmpaUVhvL0E0N3BwVUo0a0tIalJzUUhMTVZDb1JP?=
 =?utf-8?B?bUpuTVYyaUp2UXZGV2pPMmxiZ3NQTm1ROGlmV2ZySFhZd01GalNNZlVoOVVH?=
 =?utf-8?B?aU5VdFc2ZnZ5WnJ4MnFpVVR4dGxPQTBHNkdxTnpMcTFPTitaRHR3UncrQ2dD?=
 =?utf-8?B?Y00yN2ZHcWlJci9QSVc3V0xoMzlGRUZXcDB0b0hxZkhQVndnK2RPbWg5MDRI?=
 =?utf-8?B?MjU5S0VOeFo5bk54NFhuSmtzb3pyY2Z4RDRhTlB5aGhYN284ODIyN0FlMm1P?=
 =?utf-8?B?aEhVUkxnUDAvTXhUbDlIYm5kdGVXdUVEbHRaWkp2NEIzQ2ZSblludFFYOG5Q?=
 =?utf-8?B?UGxLQ0xWaEN6eitrYTNUVlNCWGhzQzAweExWTUk4UjA1aENiQ2tEaWdhU3Rq?=
 =?utf-8?B?MGVVR2ZqL2k0NjVDSk1rUTdsa2ZweCs0UHFFZFlkd0RTemttUGZ2L1o0OGpv?=
 =?utf-8?B?bC9lODh5UmMzYTBJT0hOVzRFRGl4U1N0NXdqL1R6RmR4UWpUem95R3RFWXEy?=
 =?utf-8?B?cUZRdkRsZzFnTEZPYzJXNG1MYmVhVDA1Q1NBYnZqNHV1K3pNdnF6SzBuQnhY?=
 =?utf-8?B?V29PUlZhbGZmU0xwM3dYS2tuenV0UlJrcnpxdEtLM0pJRzhkNFZmMDVQNXdj?=
 =?utf-8?B?Uk9HQUtxbVdhSnp6USs5K0p2N0x4VHVGdGZKdDVNNWhGbG9HM2F0WCthVSti?=
 =?utf-8?B?aUprNGhOVC9pRjNpZVNHUDU1NnZVbU9hNTNJa2xxS1F2UjNuYUhTY3ptV2tM?=
 =?utf-8?B?VWtuVUE5ekZDVU8xZk01dUNsTkNmYXB3K0lwbWlQMjFkU0xPSGw2aWhZOWY5?=
 =?utf-8?B?ZkxtY0szKzNBMFNDRmNFV3h0MGN2N3p4K2F4RHJhalVNdFRwUCs1VmhCQXZP?=
 =?utf-8?B?RHg3QS9SZE5HbE1IQzF1bUo4WEdvck4vcUNPc1ZHNlQ1V29rVE5KMGVrMWpa?=
 =?utf-8?B?SUlXOHlhWUoreTVBZ1ZTNDg5Rmw2NWtxZndXR285TG45WGFqN291MWxYZHlD?=
 =?utf-8?B?WUY0N2lneERzYmN3M05VSjROaWN1S0lTRWxWSVIyTEpnMVN0cHZUTWpqYWFQ?=
 =?utf-8?B?Y3oyd3ZNWG5SeHJCQjJQbmN1VGFYWVZvdy9JczJVandZZng4Tm8va2dnOWpy?=
 =?utf-8?B?TnJXa1M1VU4vVGU1cnVGeEEzMXRFK0IwUHdqRTdzT0RHS3R0VUxTeGJIdFU5?=
 =?utf-8?B?cG9ycnZCZ2NRSFp4dDQxbUhOVlVWdGM2WmloQm9NSXdSWlI0QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03854287-6cd8-4559-bf31-08d88a3b6a99
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 14:25:07.7664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzGL8sIUQ+d+QgRtrOfy0F04JabX7f08BF0h/y82FLOp4snVGuQMlXSkLuTAeCXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3840
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

amdgpu also blows up immediately, going to investigate now what's wrong 
here.

Christian.

Am 16.11.20 um 13:51 schrieb Thomas Zimmermann:
> Hi
>
> Am 09.11.20 um 01:54 schrieb Dave Airlie:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> This removes the code to move resources directly between
>> SYSTEM and VRAM in favour of using the core ttm mulithop code.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> ---
>>   drivers/gpu/drm/radeon/radeon_ttm.c | 119 +++-------------------------
>>   1 file changed, 13 insertions(+), 106 deletions(-)
> I got the following regression from that patch:
>
> [   17.639429] ------------[ cut here ]------------
> [   17.645322] Memory manager not clean during takedown.
> [   17.650557] WARNING: CPU: 4 PID: 327 at drivers/gpu/drm/drm_mm.c:998
> drm_mm_takedown+0x2e/0x40
> [   17.659367] Modules linked in: hid_generic(E+) crct10dif_pclmul(E)
> crc32_pclmul(E) ghash_clmulni_intel(E) radeon(E+) aesni_intel(E)
> glue_helper(E) crypto_simd(E) drm_ttm_helper(E) cryptd(E) usbhid(E)
> ttm(E) i915(E+) prime_numbers(E) w)
> [   17.673721] hid-generic 0003:046A:0001.0001: input,hidraw0: USB HID
> v1.00 Keyboard [HID 046a:0001] on usb-0000:00:14.0-7/input0
> [   17.697411] CPU: 4 PID: 327 Comm: systemd-udevd Tainted: G
>   E     5.10.0-rc3-1-default+ #639
> [   17.718744] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
> 10/24/2018
> [   17.718757] RIP: 0010:drm_mm_takedown+0x2e/0x40
> [   17.718766] Code: 00 55 48 8d 6f 38 53 48 89 fb 48 89 ef e8 ba db 85
> ff 48 8b 43 38 48 39 c5 75 03 5b 5d c3 48 c7 c7 40 ff b5 8e e8 b8 d8 62
> 00 <0f> 0b 5b 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00
> [   17.749995] RSP: 0018:ffffc900018d7790 EFLAGS: 00010282
> [   17.755382] RAX: 0000000000000000 RBX: ffff8881490ad8a8 RCX:
> 0000000000000000
> [   17.762713] RDX: 1ffff110f99fdd15 RSI: 0000000000000008 RDI:
> fffff5200031aee8
> [   17.762720] RBP: ffff8881490ad8e0 R08: 0000000000000001 R09:
> ffff8887ccff80a7
> [   17.762727] R10: ffffed10f99ff014 R11: 0000000000000001 R12:
> 0000000000000000
> [   17.762734] R13: 0000000000000002 R14: ffff888158b40b58 R15:
> ffff8881490ad998
> [   17.762741] FS:  00007f15529ca940(0000) GS:ffff8887cce00000(0000)
> knlGS:0000000000000000
> [   17.762748] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   17.762754] CR2: 0000564e8a6283d8 CR3: 000000012aac6004 CR4:
> 00000000001706e0
> [   17.762760] Call Trace:
> [   17.762788]  ttm_range_man_fini+0x8b/0x150 [ttm]
> [   17.762930]  radeon_ttm_fini+0xd1/0x210 [radeon]
> [   17.763063]  radeon_bo_fini+0xf/0x60 [radeon]
> [   17.763190]  si_fini+0x150/0x1d0 [radeon]
> [   17.763313]  radeon_device_fini+0x61/0x177 [radeon]
> [   17.763439]  radeon_driver_unload_kms+0x7a/0x130 [radeon]
> [   17.763564]  radeon_driver_load_kms+0x227/0x330 [radeon]
> [   17.763593]  drm_dev_register+0x13b/0x2b0
> [   17.763604]  ? drmm_add_final_kfree+0x46/0x60
> [   17.763734]  radeon_pci_probe+0x19c/0x260 [radeon]
> [   17.763854]  ? radeon_pmops_runtime_idle+0xe0/0xe0 [radeon]
> [   17.763871]  local_pci_probe+0x74/0xc0
> [   17.763893]  pci_call_probe+0xb7/0x1d0
> [   17.763905]  ? pci_pm_suspend_noirq+0x440/0x440
> [   17.763951]  pci_device_probe+0x102/0x140
> [   17.763960]  ? driver_sysfs_add+0xe2/0x150
> [   17.763978]  really_probe+0x185/0x680
> [   17.764010]  driver_probe_device+0x13f/0x1d0
> [   17.764032]  device_driver_attach+0x114/0x120
> [   17.764048]  ? device_driver_attach+0x120/0x120
> [   17.764058]  __driver_attach+0xb0/0x1a0
> [   17.764076]  ? device_driver_attach+0x120/0x120
> [   17.764083]  bus_for_each_dev+0xdd/0x120
> [   17.764097]  ? subsys_dev_iter_exit+0x10/0x10
> [   17.764133]  bus_add_driver+0x1fb/0x2e0
> [   17.764161]  driver_register+0x103/0x180
> [   17.764175]  ? 0xffffffffc102a000
> [   17.764189]  do_one_initcall+0xbb/0x3a0
> [   17.764204]  ? trace_event_raw_event_initcall_finish+0x120/0x120
> [   17.764212]  ? mark_held_locks+0x23/0x90
> [   17.764220]  ? lockdep_enabled+0x39/0x50
> [   17.764231]  ? lock_is_held_type+0xb8/0xf0
> [   17.764258]  ? rcu_read_lock_sched_held+0x3f/0x80
> [   17.764269]  ? kasan_unpoison_shadow+0x33/0x40
> [   17.764300]  do_init_module+0xfd/0x3c0
> [   17.764327]  load_module+0xc04/0xc70
> [   17.764359]  ? layout_and_allocate+0x260/0x260
> [   17.764376]  ? kernel_read_file_from_fd+0x4b/0x90
> [   17.764402]  __do_sys_finit_module+0xff/0x180
> [   17.764415]  ? __ia32_sys_init_module+0x40/0x40
> [   17.764508]  ? syscall_trace_enter.constprop.0+0x85/0x230
> [   17.764531]  do_syscall_64+0x33/0x80
> [   17.764543]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   17.764551] RIP: 0033:0x7f155355e799
> [   17.764560] Code: 48 8d 3d 3a bf 0c 00 0f 05 eb a5 66 0f 1f 44 00 00
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 76 0c 00 f7 d8 64 89 01 48
> [   17.764566] RSP: 002b:00007ffccda06428 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   17.764579] RAX: ffffffffffffffda RBX: 000055c6d44158f0 RCX:
> 00007f155355e799
> [   17.764585] RDX: 0000000000000000 RSI: 00007f155367d3a3 RDI:
> 000000000000000f
> [   17.764592] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 000055c6d4417960
> [   17.764598] R10: 000000000000000f R11: 0000000000000246 R12:
> 00007f155367d3a3
> [   17.764605] R13: 000055c6d4429ff0 R14: 0000000000000000 R15:
> 000055c6d441c100
> [   17.764670] CPU: 4 PID: 327 Comm: systemd-udevd Tainted: G
>   E     5.10.0-rc3-1-default+ #639
> [   17.764675] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
> 10/24/2018
> [   17.764680] Call Trace:
> [   17.764700]  dump_stack+0xae/0xe5
> [   17.764716]  ? drm_mm_takedown+0x2e/0x40
> [   17.764724]  __warn.cold+0x29/0x8a
> [   17.764739]  ? drm_mm_takedown+0x2e/0x40
> [   17.764755]  report_bug+0xcb/0xf0
> [   17.764782]  handle_bug+0x38/0x90
> [   17.764795]  exc_invalid_op+0x14/0x40
> [   17.764809]  asm_exc_invalid_op+0x12/0x20
> [   17.764816] RIP: 0010:drm_mm_takedown+0x2e/0x40
> [   17.764824] Code: 00 55 48 8d 6f 38 53 48 89 fb 48 89 ef e8 ba db 85
> ff 48 8b 43 38 48 39 c5 75 03 5b 5d c3 48 c7 c7 40 ff b5 8e e8 b8 d8 62
> 00 <0f> 0b 5b 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00
> [   17.764829] RSP: 0018:ffffc900018d7790 EFLAGS: 00010282
> [   17.764839] RAX: 0000000000000000 RBX: ffff8881490ad8a8 RCX:
> 0000000000000000
> [   17.764845] RDX: 1ffff110f99fdd15 RSI: 0000000000000008 RDI:
> fffff5200031aee8
> [   17.764851] RBP: ffff8881490ad8e0 R08: 0000000000000001 R09:
> ffff8887ccff80a7
> [   17.764856] R10: ffffed10f99ff014 R11: 0000000000000001 R12:
> 0000000000000000
> [   17.764862] R13: 0000000000000002 R14: ffff888158b40b58 R15:
> ffff8881490ad998
> [   17.764939]  ttm_range_man_fini+0x8b/0x150 [ttm]
> [   17.765071]  radeon_ttm_fini+0xd1/0x210 [radeon]
> [   17.765198]  radeon_bo_fini+0xf/0x60 [radeon]
> [   17.765322]  si_fini+0x150/0x1d0 [radeon]
> [   17.765443]  radeon_device_fini+0x61/0x177 [radeon]
> [   17.765563]  radeon_driver_unload_kms+0x7a/0x130 [radeon]
> [   17.765686]  radeon_driver_load_kms+0x227/0x330 [radeon]
> [   17.765711]  drm_dev_register+0x13b/0x2b0
> [   17.765722]  ? drmm_add_final_kfree+0x46/0x60
> [   17.765849]  radeon_pci_probe+0x19c/0x260 [radeon]
> [   17.765968]  ? radeon_pmops_runtime_idle+0xe0/0xe0 [radeon]
> [   17.765984]  local_pci_probe+0x74/0xc0
> [   17.766007]  pci_call_probe+0xb7/0x1d0
> [   17.766020]  ? pci_pm_suspend_noirq+0x440/0x440
> [   17.766065]  pci_device_probe+0x102/0x140
> [   17.766073]  ? driver_sysfs_add+0xe2/0x150
> [   17.766090]  really_probe+0x185/0x680
> [   17.766121]  driver_probe_device+0x13f/0x1d0
> [   17.766142]  device_driver_attach+0x114/0x120
> [   17.766157]  ? device_driver_attach+0x120/0x120
> [   17.766166]  __driver_attach+0xb0/0x1a0
> [   17.766184]  ? device_driver_attach+0x120/0x120
> [   17.766190]  bus_for_each_dev+0xdd/0x120
> [   17.766202]  ? subsys_dev_iter_exit+0x10/0x10
> [   17.766238]  bus_add_driver+0x1fb/0x2e0
> [   17.766264]  driver_register+0x103/0x180
> [   17.766278]  ? 0xffffffffc102a000
> [   17.766291]  do_one_initcall+0xbb/0x3a0
> [   17.766304]  ? trace_event_raw_event_initcall_finish+0x120/0x120
> [   17.766312]  ? mark_held_locks+0x23/0x90
> [   17.766319]  ? lockdep_enabled+0x39/0x50
> [   17.766329]  ? lock_is_held_type+0xb8/0xf0
> [   17.766356]  ? rcu_read_lock_sched_held+0x3f/0x80
> [   17.766365]  ? kasan_unpoison_shadow+0x33/0x40
> [   17.766392]  do_init_module+0xfd/0x3c0
> [   17.766417]  load_module+0xc04/0xc70
> [   17.766447]  ? layout_and_allocate+0x260/0x260
> [   17.766463]  ? kernel_read_file_from_fd+0x4b/0x90
> [   17.766488]  __do_sys_finit_module+0xff/0x180
> [   17.766501]  ? __ia32_sys_init_module+0x40/0x40
> [   17.766594]  ? syscall_trace_enter.constprop.0+0x85/0x230
> [   17.766615]  do_syscall_64+0x33/0x80
> [   17.766626]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   17.766634] RIP: 0033:0x7f155355e799
> [   17.766641] Code: 48 8d 3d 3a bf 0c 00 0f 05 eb a5 66 0f 1f 44 00 00
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 76 0c 00 f7 d8 64 89 01 48
> [   17.766647] RSP: 002b:00007ffccda06428 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   17.766660] RAX: ffffffffffffffda RBX: 000055c6d44158f0 RCX:
> 00007f155355e799
> [   17.766666] RDX: 0000000000000000 RSI: 00007f155367d3a3 RDI:
> 000000000000000f
> [   17.766672] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 000055c6d4417960
> [   17.766679] R10: 000000000000000f R11: 0000000000000246 R12:
> 00007f155367d3a3
> [   17.766684] R13: 000055c6d4429ff0 R14: 0000000000000000 R15:
> 000055c6d441c100
> [   17.766775] irq event stamp: 35403
> [   17.766785] hardirqs last  enabled at (35409): [<ffffffff8d1b3bc1>]
> console_trylock_spinning+0x1c1/0x1d0
> [   17.766794] hardirqs last disabled at (35414): [<ffffffff8d1b3b70>]
> console_trylock_spinning+0x170/0x1d0
> [   17.766803] softirqs last  enabled at (35002): [<ffffffff8e6003dd>]
> __do_softirq+0x3dd/0x554
> [   17.766812] softirqs last disabled at (34989): [<ffffffff8e4010f2>]
> asm_call_irq_on_stack+0x12/0x20
> [   17.766818] ---[ end trace a1567ba1be224825 ]---
> [   17.767050]
> ==================================================================
> [   17.767110] BUG: KASAN: null-ptr-deref in
> ttm_range_man_fini+0x35/0x150 [ttm]
> [   17.767116] Write of size 1 at addr 0000000000000000 by task
> systemd-udevd/327
> [   17.767122]
> [   17.767130] CPU: 4 PID: 327 Comm: systemd-udevd Tainted: G        W
>   E     5.10.0-rc3-1-default+ #639
> [   17.767135] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
> 10/24/2018
> [   17.767141] Call Trace:
> [   17.767161]  dump_stack+0xae/0xe5
> [   17.767182]  ? ttm_range_man_fini+0x35/0x150 [ttm]
> [   17.767193]  __kasan_report.cold+0x5/0x38
> [   17.767225]  ? ttm_range_man_fini+0x35/0x150 [ttm]
> [   17.767243]  kasan_report+0x3a/0x50
> [   17.767262]  ttm_range_man_fini+0x35/0x150 [ttm]
> [   17.767395]  radeon_ttm_fini+0xde/0x210 [radeon]
> [   17.767525]  radeon_bo_fini+0xf/0x60 [radeon]
> [   17.767651]  si_fini+0x150/0x1d0 [radeon]
> [   17.767771]  radeon_device_fini+0x61/0x177 [radeon]
> [   17.767893]  radeon_driver_unload_kms+0x7a/0x130 [radeon]
> [   17.768017]  radeon_driver_load_kms+0x227/0x330 [radeon]
> [   17.768043]  drm_dev_register+0x13b/0x2b0
> [   17.768054]  ? drmm_add_final_kfree+0x46/0x60
> [   17.768182]  radeon_pci_probe+0x19c/0x260 [radeon]
> [   17.768299]  ? radeon_pmops_runtime_idle+0xe0/0xe0 [radeon]
> [   17.768315]  local_pci_probe+0x74/0xc0
> [   17.768338]  pci_call_probe+0xb7/0x1d0
> [   17.768351]  ? pci_pm_suspend_noirq+0x440/0x440
> [   17.768397]  pci_device_probe+0x102/0x140
> [   17.768404]  ? driver_sysfs_add+0xe2/0x150
> [   17.768421]  really_probe+0x185/0x680
> [   17.768452]  driver_probe_device+0x13f/0x1d0
> [   17.768472]  device_driver_attach+0x114/0x120
> [   17.768488]  ? device_driver_attach+0x120/0x120
> [   17.768497]  __driver_attach+0xb0/0x1a0
> [   17.768515]  ? device_driver_attach+0x120/0x120
> [   17.768523]  bus_for_each_dev+0xdd/0x120
> [   17.768536]  ? subsys_dev_iter_exit+0x10/0x10
> [   17.768572]  bus_add_driver+0x1fb/0x2e0
> [   17.768598]  driver_register+0x103/0x180
> [   17.768611]  ? 0xffffffffc102a000
> [   17.768625]  do_one_initcall+0xbb/0x3a0
> [   17.768639]  ? trace_event_raw_event_initcall_finish+0x120/0x120
> [   17.768646]  ? mark_held_locks+0x23/0x90
> [   17.768654]  ? lockdep_enabled+0x39/0x50
> [   17.768663]  ? lock_is_held_type+0xb8/0xf0
> [   17.768689]  ? rcu_read_lock_sched_held+0x3f/0x80
> [   17.768699]  ? kasan_unpoison_shadow+0x33/0x40
> [   17.768728]  do_init_module+0xfd/0x3c0
> [   17.768754]  load_module+0xc04/0xc70
> [   17.768785]  ? layout_and_allocate+0x260/0x260
> [   17.768800]  ? kernel_read_file_from_fd+0x4b/0x90
> [   17.768825]  __do_sys_finit_module+0xff/0x180
> [   17.768840]  ? __ia32_sys_init_module+0x40/0x40
> [   17.768932]  ? syscall_trace_enter.constprop.0+0x85/0x230
> [   17.768953]  do_syscall_64+0x33/0x80
> [   17.768963]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   17.768971] RIP: 0033:0x7f155355e799
> [   17.768979] Code: 48 8d 3d 3a bf 0c 00 0f 05 eb a5 66 0f 1f 44 00 00
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 76 0c 00 f7 d8 64 89 01 48
> [   17.768984] RSP: 002b:00007ffccda06428 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   17.768995] RAX: ffffffffffffffda RBX: 000055c6d44158f0 RCX:
> 00007f155355e799
> [   17.769001] RDX: 0000000000000000 RSI: 00007f155367d3a3 RDI:
> 000000000000000f
> [   17.769008] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 000055c6d4417960
> [   17.769014] R10: 000000000000000f R11: 0000000000000246 R12:
> 00007f155367d3a3
> [   17.769019] R13: 000055c6d4429ff0 R14: 0000000000000000 R15:
> 000055c6d441c100
> [   17.769080]
> ==================================================================
> [   17.769084] Disabling lock debugging due to kernel taint
> [   17.772656] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> [   17.786496] BTRFS: device fsid 293b6b08-509d-4de5-bde5-fc22f8707d6e
> devid 1 transid 10671 /dev/sda3 scanned by systemd-udevd (312)
> [   17.790614] #PF: supervisor write access in kernel mode
> [   17.790616] #PF: error_code(0x0002) - not-present page
> [   17.790619] PGD 0 P4D 0
> [   18.843454] Oops: 0002 [#1] SMP KASAN PTI
> [   18.843457] CPU: 4 PID: 327 Comm: systemd-udevd Tainted: G    B   W
>   E     5.10.0-rc3-1-default+ #639
> [   18.843458] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24
> 10/24/2018
> [   18.843468] RIP: 0010:ttm_range_man_fini+0x35/0x150 [ttm]
> [   18.843472] Code: 4c 63 ee 41 54 55 49 8d 6d 18 53 4c 8d 34 ef 48 89
> fb 4c 89 f7 48 83 ec 10 e8 57 07 86 cc 48 8b 2c eb 48 89 ef e8 0b 05 86
> cc <c6> 45 00 00 48 89 ee 48 89 df e8 4c 05 00 00 41 89 c4 85 c0 74 12
> [   18.890909] RSP: 0018:ffffc900018d77a8 EFLAGS: 00010282
> [   18.890912] RAX: 0000000000000001 RBX: ffff888158b40a88 RCX:
> dffffc0000000000
> [   18.890913] RDX: 0000000000000007 RSI: 0000000000000004 RDI:
> 0000000000000297
> [   18.890916] RBP: 0000000000000000 R08: 0000000000000000 R09:
> ffffffff8f546ae3
> [   18.917654] R10: fffffbfff1ea8d5c R11: 0000000000000001 R12:
> ffff888158b40a88
> [   18.917655] R13: 0000000000000001 R14: ffff888158b40b50 R15:
> ffff88812e3e6490
> [   18.917658] FS:  00007f15529ca940(0000) GS:ffff8887cce00000(0000)
> knlGS:0000000000000000
> [   18.917659] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   18.917660] CR2: 0000000000000000 CR3: 000000012aac6004 CR4:
> 00000000001706e0
> [   18.917661] Call Trace:
> [   18.917738]  radeon_ttm_fini+0xde/0x210 [radeon]
> [   18.917802]  radeon_bo_fini+0xf/0x60 [radeon]
> [   18.964662]  si_fini+0x150/0x1d0 [radeon]
> [   18.964730]  radeon_device_fini+0x61/0x177 [radeon]
> [   18.973659]  radeon_driver_unload_kms+0x7a/0x130 [radeon]
> [   18.973752]  radeon_driver_load_kms+0x227/0x330 [radeon]
> [   18.984442]  drm_dev_register+0x13b/0x2b0
> [   18.984445]  ? drmm_add_final_kfree+0x46/0x60
> [   18.984505]  radeon_pci_probe+0x19c/0x260 [radeon]
> [   18.997717]  ? radeon_pmops_runtime_idle+0xe0/0xe0 [radeon]
> [   18.997723]  local_pci_probe+0x74/0xc0
> [   19.007104]  pci_call_probe+0xb7/0x1d0
> [   19.007107]  ? pci_pm_suspend_noirq+0x440/0x440
> [   19.007112]  pci_device_probe+0x102/0x140
> [   19.007117]  ? driver_sysfs_add+0xe2/0x150
> [  OK     19.023596]  really_probe+0x185/0x680
> [   19.023600]  driver_probe_device+0x13f/0x1d0
> [   19.023612]  device_driver_attach+0x114/0x120
> [   19.023615]  ? device_driver_attach+0x120/0x120
> [   19.023617]  __driver_attach+0xb0/0x1a0
> [   19.023619]  ? device_driver_attach+0x120/0x120
> [   19.023623]  bus_for_each_dev+0xdd/0x120
> 0m] Found device[   19.054256]  ? subsys_dev_iter_exit+0x10/0x10
> [   19.054260]  bus_add_driver+0x1fb/0x2e0
> [   19.054264]  driver_register+0x103/0x180
> [   19.054266]  ? 0xffffffffc102a000
> [   19.054270]  do_one_initcall+0xbb/0x3a0
> [   19.054273]  ? trace_event_raw_event_initcall_finish+0x120/0x120
> [   19.054276]  ? mark_held_locks+0x23/0x90
> [   19.054279]  ? lockdep_enabled+0x39/0x50
> [   19.054282]  ? lock_is_held_type+0xb8/0xf0
> [   19.054286]  ? rcu_read_lock_sched_held+0x3f/0x80
> [   19.054288]  ? kasan_unpoison_shadow+0x33/0x40
>   ST1000[   19.054292]  do_init_module+0xfd/0x3c0
> [   19.054296]  load_module+0xc04/0xc70
> DM003-1ER162 1   19.110979]  ? layout_and_allocate+0x260/0x260
> [   19.110982]  ? kernel_read_file_from_fd+0x4b/0x90
> [   19.110985]  __do_sys_finit_module+0xff/0x180
> [   19.110988]  ? __ia32_sys_init_module+0x40/0x40
> [   19.110995]  ? syscall_trace_enter.constprop.0+0x85/0x230
> [   19.111001]  do_syscall_64+0x33/0x80
> 0m.
> [   19.139555]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   19.139558] RIP: 0033:0x7f155355e799
> [   19.139563] Code: 48 8d 3d 3a bf 0c 00 0f 05 eb a5 66 0f 1f 44 00 00
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 76 0c 00 f7 d8 64 89 01 48
> [   19.139566] RSP: 002b:00007ffccda06428 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   19.139571] RAX: ffffffffffffffda RBX: 000055c6d44158f0 RCX:
> 00007f155355e799
> [   19.139575] RDX: 0000000000000000 RSI: 00007f155367d3a3 RDI:
> 000000000000000f
> [   19.189525] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 000055c6d4417960
> [   19.189526] R10: 000000000000000f R11: 0000000000000246 R12:
> 00007f155367d3a3
> [   19.189528] R13: 000055c6d4429ff0 R14: 0000000000000000 R15:
> 000055c6d441c100
> [   19.189532] Modules linked in: hid_generic(E) crct10dif_pclmul(E)
> crc32_pclmul(E) ghash_clmulni_intel(E) radeon(E+) aesni_intel(E)
> glue_helper(E) crypto_simd(E) drm_ttm_helper(E) cryptd(E) usbhid(E)
> ttm(E) i915(E+) prime_numbers(E) wm)
> [   19.211092] CR2: 0000000000000000
> [   19.211136] ---[ end trace a1567ba1be224826 ]---
> [   19.256281] RIP: 0010:ttm_range_man_fini+0x35/0x150 [ttm]
> [   19.256284] Code: 4c 63 ee 41 54 55 49 8d 6d 18 53 4c 8d 34 ef 48 89
> fb 4c 89 f7 48 83 ec 10 e8 57 07 86 cc 48 8b 2c eb 48 89 ef e8 0b 05 86
> cc <c6> 45 00 00 48 89 ee 48 89 df e8 4c 05 00 00 41 89 c4 85 c0 74 12
> [   19.256285] RSP: 0018:ffffc900018d77a8 EFLAGS: 00010282
> [   19.256288] RAX: 0000000000000001 RBX: ffff888158b40a88 RCX:
> dffffc0000000000
> [   19.256289] RDX: 0000000000000007 RSI: 0000000000000004 RDI:
> 0000000000000297
> [   19.256291] RBP: 0000000000000000 R08: 0000000000000000 R09:
> ffffffff8f546ae3
> [   19.256292] R10: fffffbfff1ea8d5c R11: 0000000000000001 R12:
> ffff888158b40a88
> [   19.256294] R13: 0000000000000001 R14: ffff888158b40b50 R15:
> ffff88812e3e6490
> [   19.256295] FS:  00007f15529ca940(0000) GS:ffff8887cce00000(0000)
> knlGS:0000000000000000
> [   19.256297] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   19.256298] CR2: 0000000000000000 CR3: 000000012aac6004 CR4:
> 00000000001706e0
>
> The display remains dark after that. Reverting this patch restores
> functionality.
>
> Best regards
> Thomas
>
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 29062dbea299..788655ebafdb 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -206,101 +206,6 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
>>   	return r;
>>   }
>>   
>> -static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
>> -				bool evict,
>> -				struct ttm_operation_ctx *ctx,
>> -				struct ttm_resource *new_mem)
>> -{
>> -	struct ttm_resource *old_mem = &bo->mem;
>> -	struct ttm_resource tmp_mem;
>> -	struct ttm_place placements;
>> -	struct ttm_placement placement;
>> -	int r;
>> -
>> -	tmp_mem = *new_mem;
>> -	tmp_mem.mm_node = NULL;
>> -	placement.num_placement = 1;
>> -	placement.placement = &placements;
>> -	placement.num_busy_placement = 1;
>> -	placement.busy_placement = &placements;
>> -	placements.fpfn = 0;
>> -	placements.lpfn = 0;
>> -	placements.mem_type = TTM_PL_TT;
>> -	placements.flags = 0;
>> -	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
>> -	if (unlikely(r)) {
>> -		return r;
>> -	}
>> -
>> -	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
>> -	if (unlikely(r)) {
>> -		goto out_cleanup;
>> -	}
>> -
>> -	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
>> -	if (unlikely(r)) {
>> -		goto out_cleanup;
>> -	}
>> -	r = radeon_move_blit(bo, true, &tmp_mem, old_mem);
>> -	if (unlikely(r)) {
>> -		goto out_cleanup;
>> -	}
>> -	r = ttm_bo_wait_ctx(bo, ctx);
>> -	if (unlikely(r))
>> -		goto out_cleanup;
>> -
>> -	radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
>> -	ttm_resource_free(bo, &bo->mem);
>> -	ttm_bo_assign_mem(bo, new_mem);
>> -out_cleanup:
>> -	ttm_resource_free(bo, &tmp_mem);
>> -	return r;
>> -}
>> -
>> -static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
>> -				bool evict,
>> -				struct ttm_operation_ctx *ctx,
>> -				struct ttm_resource *new_mem)
>> -{
>> -	struct ttm_resource *old_mem = &bo->mem;
>> -	struct ttm_resource tmp_mem;
>> -	struct ttm_placement placement;
>> -	struct ttm_place placements;
>> -	int r;
>> -
>> -	tmp_mem = *new_mem;
>> -	tmp_mem.mm_node = NULL;
>> -	placement.num_placement = 1;
>> -	placement.placement = &placements;
>> -	placement.num_busy_placement = 1;
>> -	placement.busy_placement = &placements;
>> -	placements.fpfn = 0;
>> -	placements.lpfn = 0;
>> -	placements.mem_type = TTM_PL_TT;
>> -	placements.flags = 0;
>> -	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
>> -	if (unlikely(r)) {
>> -		return r;
>> -	}
>> -
>> -	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
>> -	if (unlikely(r))
>> -		goto out_cleanup;
>> -
>> -	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
>> -	if (unlikely(r))
>> -		goto out_cleanup;
>> -
>> -	ttm_bo_assign_mem(bo, &tmp_mem);
>> -	r = radeon_move_blit(bo, true, new_mem, old_mem);
>> -	if (unlikely(r)) {
>> -		goto out_cleanup;
>> -	}
>> -out_cleanup:
>> -	ttm_resource_free(bo, &tmp_mem);
>> -	return r;
>> -}
>> -
>>   static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>>   			  struct ttm_operation_ctx *ctx,
>>   			  struct ttm_resource *new_mem,
>> @@ -311,6 +216,17 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>>   	struct ttm_resource *old_mem = &bo->mem;
>>   	int r;
>>   
>> +	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
>> +	     new_mem->mem_type == TTM_PL_VRAM) ||
>> +	    (old_mem->mem_type == TTM_PL_VRAM &&
>> +	     new_mem->mem_type == TTM_PL_SYSTEM)) {
>> +		hop->fpfn = 0;
>> +		hop->lpfn = 0;
>> +		hop->mem_type = TTM_PL_TT;
>> +		hop->flags = 0;
>> +		return -EMULTIHOP;
>> +	}
>> +
>>   	if (new_mem->mem_type == TTM_PL_TT) {
>>   		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
>>   		if (r)
>> @@ -351,17 +267,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>>   		goto memcpy;
>>   	}
>>   
>> -	if (old_mem->mem_type == TTM_PL_VRAM &&
>> -	    new_mem->mem_type == TTM_PL_SYSTEM) {
>> -		r = radeon_move_vram_ram(bo, evict, ctx, new_mem);
>> -	} else if (old_mem->mem_type == TTM_PL_SYSTEM &&
>> -		   new_mem->mem_type == TTM_PL_VRAM) {
>> -		r = radeon_move_ram_vram(bo, evict, ctx, new_mem);
>> -	} else {
>> -		r = radeon_move_blit(bo, evict,
>> -				     new_mem, old_mem);
>> -	}
>> -
>> +	r = radeon_move_blit(bo, evict,
>> +			     new_mem, old_mem);
>>   	if (r) {
>>   memcpy:
>>   		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
