Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11162A3CAB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 07:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692266E32F;
	Tue,  3 Nov 2020 06:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38D86E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 06:15:42 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa0f5910000>; Mon, 02 Nov 2020 22:15:45 -0800
Received: from [10.2.49.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 06:15:40 +0000
Subject: Re: [resource] 22b17dc667: Kernel panic - not syncing: Fatal exception
To: lkp <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201103060649.GA30210@xsang-OptiPlex-9020>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1ec0dee9-e1bb-9cf1-a8c2-ad1e294c5acf@nvidia.com>
Date: Mon, 2 Nov 2020 22:15:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201103060649.GA30210@xsang-OptiPlex-9020>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604384145; bh=HHKB/RdS8zOAOPLdFEq5BHCD+y3I+0AFVJdR07v4b2Y=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=JwOwCwijT1kVCiMMH7uWO3V38VR6sMEcYyvq67pbbu3hJ+DPHKUtnJqETyaxHWRIT
 m2xUbsYFpKxlfg5ce1M6aG2etyTc++fQlJpwIDZWLn2afx9gbk7WaClnMP3sVhQoZ8
 6GX9VHqqwD16fLg9I8hpx/8ZVIUAUWLvE6NhWo/ec4JhNV5HDtMZvF+W1nUgdeeJgj
 Lf169WBQDhKmaXdFsKjUUEguegA0pS0aJO/LCDltQmzs+qKxkCMXJuxbSt9jQh2/0J
 MeNCr8rseweUGqS7xAMB0+C5n0ZbF66TmR81JNS1sc11HJPPRlRgDtnh3xYDv/DVXI
 oKrB4bDrDJhGw==
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org, Jason
 Gunthorpe <jgg@ziepe.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, lkp@lists.01.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/20 10:06 PM, lkp wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: 22b17dc667d36418ccabb9c668c4b489185fb40a ("[PATCH v5 13/15] resource: Move devmem revoke code to resource framework")
> url: https://github.com/0day-ci/linux/commits/Daniel-Vetter/follow_pfn-and-other-iomap-races/20201030-181112
> base: git://linuxtv.org/media_tree.git master
> 
> in testcase: fsmark
> version: fsmark-x86_64-3.3-1_20201007
> with following parameters:
> 
> 	iterations: 1x
> 	nr_threads: 1t
> 	disk: 1BRD_48G
> 	fs: f2fs
> 	fs2: nfsv4
> 	filesize: 4M
> 	test_size: 40G
> 	sync_method: NoSync
> 	cpufreq_governor: performance
> 	ucode: 0x5002f01
> 
> test-description: The fsmark is a file system benchmark to test synchronous write workloads, for example, mail servers workload.
> test-url: https://sourceforge.net/projects/fsmark/
> 
> 
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz with 192G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 

Yep, this is the same crash that I saw. And the .config also has

   # CONFIG_IO_STRICT_DEVMEM is not set

so it all makes sense.


> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> [   28.644165] systemd[1]: RTC configured in localtime, applying delta of 0 minutes to system time.
> 
> [   28.699473] #PF: supervisor read access in kernel mode
> [   28.704611] #PF: error_code(0x0000) - not-present page
> [   28.709749] PGD 0 P4D 0
> [   28.712291] Oops: 0000 [#1] SMP NOPTI
> [   28.715956] CPU: 0 PID: 1 Comm: systemd Not tainted 5.10.0-rc1-00015-g22b17dc667d3 #1
> [   28.723793] RIP: 0010:do_dentry_open+0x1c9/0x360
> [   28.728410] Code: 84 82 01 00 00 81 ca 00 00 04 00 89 53 44 48 8b 83 f0 00 00 00 81 63 40 3f fc ff ff 48 8d bb 98 00 00 00 c7 43 34 00 00 00 00 <48> 8b 00 48 8b 70 30 e8 2b cb f4 ff f6 43 41 40 74 5a 48 8b 83 f0
> [   28.747157] RSP: 0018:ffffc9000006fcc8 EFLAGS: 00010206
> [   28.752380] RAX: 0000000000000000 RBX: ffff8881502ad400 RCX: 0000000000000000
> [   28.759506] RDX: 00000000000a201d RSI: ffffffff8284d260 RDI: ffff8881502ad498
> [   28.766639] RBP: ffff88a485a06490 R08: 0000000000000000 R09: ffffffff8284d260
> [   28.773769] R10: ffffc9000006fcc8 R11: 756c6176006d656d R12: 0000000000000000
> [   28.780895] R13: ffffffff8133ddc0 R14: ffff8881502ad410 R15: ffff8881502ad400
> [   28.788028] FS:  00007ff54afa1940(0000) GS:ffff888c4f600000(0000) knlGS:0000000000000000
> [   28.796113] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   28.801858] CR2: 0000000000000000 CR3: 0000000100120003 CR4: 00000000007706f0
> [   28.808983] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   28.816114] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   28.823239] PKRU: 55555554
> [   28.825952] Call Trace:
> [   28.828412]  path_openat+0xaa8/0x10a0
> [   28.832073]  do_filp_open+0x91/0x100
> [   28.835653]  ? acpi_os_wait_semaphore+0x48/0x80
> [   28.840186]  ? __check_object_size+0x136/0x160
> [   28.844631]  do_sys_openat2+0x20d/0x2e0
> [   28.848470]  do_sys_open+0x44/0x80
> [   28.851878]  do_syscall_64+0x33/0x40
> [   28.855457]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   28.860509] RIP: 0033:0x7ff54c1521ae
> [   28.864086] Code: 25 00 00 41 00 3d 00 00 41 00 74 48 48 8d 05 59 65 0d 00 8b 00 85 c0 75 69 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 0f 87 a6 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
> [   28.882833] RSP: 002b:00007ffd1c9586d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> [   28.890399] RAX: ffffffffffffffda RBX: 00007ffd1c9587d0 RCX: 00007ff54c1521ae
> [   28.897531] RDX: 0000000000080000 RSI: 00007ff54bfa0e5a RDI: 00000000ffffff9c
> [   28.904662] RBP: 00007ffd1c9587d8 R08: 000000000000021f R09: 000055f837cf4290
> [   28.911796] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000056dd9000
> [   28.918927] R13: 00000000ffffffff R14: 00007ffd1c9587d0 R15: 0000000000000002
> [   28.926060] Modules linked in: ip_tables
> [   28.929986] CR2: 0000000000000000
> mDebian GNU/Linu
> [   28.933416] ---[ end trace 94e4f9aa3df66098 ]---
> [   28.939355] RIP: 0010:do_dentry_open+0x1c9/0x360
> [   28.943975] Code: 84 82 01 00 00 81 ca 00 00 04 00 89 53 44 48 8b 83 f0 00 00 00 81 63 40 3f fc ff ff 48 8d bb 98 00 00 00 c7 43 34 00 00 00 00 <48> 8b 00 48 8b 70 30 e8 2b cb f4 ff f6 43 41 40 74 5a 48 8b 83 f0
> [   28.962721] RSP: 0018:ffffc9000006fcc8 EFLAGS: 00010206
> [   28.967948] RAX: 0000000000000000 RBX: ffff8881502ad400 RCX: 0000000000000000
> [   28.975079] RDX: 00000000000a201d RSI: ffffffff8284d260 RDI: ffff8881502ad498
> [   28.982211] RBP: ffff88a485a06490 R08: 0000000000000000 R09: ffffffff8284d260
> [   28.989337] R10: ffffc9000006fcc8 R11: 756c6176006d656d R12: 0000000000000000
> [   28.996467] R13: ffffffff8133ddc0 R14: ffff8881502ad410 R15: ffff8881502ad400
> [   29.003592] FS:  00007ff54afa1940(0000) GS:ffff888c4f600000(0000) knlGS:0000000000000000
> [   29.011668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   29.017409] CR2: 0000000000000000 CR3: 0000000100120003 CR4: 00000000007706f0
> [   29.024539] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   29.031671] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   29.038804] PKRU: 55555554
> [   29.041508] Kernel panic - not syncing: Fatal exception
> ACPI MEMORY or I/O RESET_REG.
> 
> 
> To reproduce:
> 
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> 
> 
> 
> Thanks,
> oliver.sang@intel.com
> 

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
