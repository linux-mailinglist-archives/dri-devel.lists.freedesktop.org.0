Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA92FB43F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8BE6E84D;
	Tue, 19 Jan 2021 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4389233
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:12:22 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B600550f50003>; Mon, 18 Jan 2021 01:12:21 -0800
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 18 Jan 2021 09:12:19 +0000
Date: Mon, 18 Jan 2021 11:12:15 +0200
From: Eli Cohen <elic@nvidia.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Change eats memory on my server
Message-ID: <20210118091215.GA40909@mtl-vdi-166.wap.labs.mlnx>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
 <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
 <20210118074913.GA39161@mtl-vdi-166.wap.labs.mlnx>
 <a39c1b62-3e22-2454-d68b-e9eb510891d3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a39c1b62-3e22-2454-d68b-e9eb510891d3@amd.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610961141; bh=CVvdqOczVyspDxDujTQIfx45D4m2o6GVOUtUkxyyc+U=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding:
 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=YtCsLTLf2AqZhW6ubQCUsISYbmYQtxt3ankSIrXrrfI3ZFSiA6H2dkFyhSwwkDT4V
 4B5CLsi+/j7dkyjoSyQbdP5VQGHi3WGRY6cOxqnTHWjM7G+/Eyvbx3yu7lCxVNzLLg
 +00gZju4qQgVIf1HpNDI5wOhcjklKbYJLsfsETRyR7NYVcRhPqw/fTCVfQ10yAoYk3
 ARcICzT9St/QA5UlwDNIOu8gsXdzATbUXZC7MzCfFY+3fmru8U7kndXpc1xQAB07r+
 8yBAI16u0y8JZaICvDWVIOJxvKV/I+TRY5PqrtnMuZDAkxJsZp57CRaPlt/gdrW9wY
 sftuGAeATBvfg==
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 08:57:26AM +0100, Christian K=F6nig wrote:
> Am 18.01.21 um 08:49 schrieb Eli Cohen:
> > On Mon, Jan 18, 2021 at 08:43:12AM +0100, Christian K=F6nig wrote:
> > > Hi Eli,
> > > =

> > > have you already tried using kmemleak?
> > > =

> > > This sounds like a leak of memory allocated using kmalloc(), so kmeml=
eak
> > > should be able to catch it.
> > > =

> > Hi Christian,
> > =

> > I have the following configured but I did not see any visible complaint
> > in dmesg.
> > =

> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > CONFIG_DEBUG_KMEMLEAK=3Dy
> > CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D16000
> > =

> > Any other configuration that I need to set?
> =

> As long as you don't have any kernel parameters to enable it I think you
> need to do "echo scan > /sys/kernel/debug/kmemleak" to start a scan.
> =

> The result can then be queried using "cat /sys/kernel/debug/kmemleak".
> =


There are some minor leaks that I noticed a while ago coming from SE
Linux. I don't think these leaks are killing my server but here they
are. Maybe someone from SELInux would like to address them.


unreferenced object 0xffff8884a5cd5000 (size 512):
  comm "swapper/0", pid 1, jiffies 4294736382 (age 8097.039s)
  hex dump (first 32 bytes):
    03 00 00 00 05 00 00 00 03 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 ad 4e ad de  .............N..
  backtrace:
    [<0000000028e4d3ae>] selinux_sb_alloc_security+0x2e/0xf0
    [<000000009037afcc>] security_sb_alloc+0x2b/0x50
    [<00000000a8f69eea>] alloc_super+0x140/0x590
    [<00000000b417f227>] sget_fc+0xa9/0x380
    [<0000000041b639cf>] get_tree_single+0x26/0x100
    [<00000000bf572b76>] vfs_get_tree+0x4c/0x140
    [<00000000c0aa3dd6>] vfs_kern_mount.part.0+0x75/0xd0
    [<00000000aa61ad1d>] kern_mount+0x2f/0x60
    [<000000006ce5ffac>] init_sel_fs+0xf6/0x1a6
    [<00000000d3ba532d>] do_one_initcall+0xbb/0x3a0
    [<0000000084b518fb>] do_initcalls+0xff/0x129
    [<00000000a0cc02b2>] kernel_init_freeable+0x14c/0x178
    [<000000005767353a>] kernel_init+0xd/0x120
    [<00000000d425dea7>] ret_from_fork+0x22/0x30
unreferenced object 0xffff888498ae6a78 (size 8):
  comm "(journald)", pid 379, jiffies 4294738985 (age 8094.447s)
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000727257f3>] selinux_key_alloc+0x33/0xa0
    [<0000000023fcc23d>] security_key_alloc+0x3b/0x60
    [<000000009b8f5c5c>] key_alloc+0x46e/0x900
    [<00000000a49c5ee1>] keyring_alloc+0x27/0x70
    [<0000000047d4e2e0>] install_session_keyring_to_cred+0xd7/0x120
    [<0000000092fa69fa>] join_session_keyring+0x109/0x1b0
    [<00000000c31be2c8>] __do_sys_keyctl+0x2c2/0x310
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff888498ae6aa0 (size 8):
  comm "(journald)", pid 379, jiffies 4294738985 (age 8094.447s)
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000727257f3>] selinux_key_alloc+0x33/0xa0
    [<0000000023fcc23d>] security_key_alloc+0x3b/0x60
    [<000000009b8f5c5c>] key_alloc+0x46e/0x900
    [<00000000d752137d>] key_create_or_update+0x45a/0x760
    [<00000000cfad8dc7>] __do_sys_add_key+0x144/0x2a0
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff88812bdab6e0 (size 8):
  comm "(lymouthd)", pid 573, jiffies 4294744193 (age 8089.252s)
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000727257f3>] selinux_key_alloc+0x33/0xa0
    [<0000000023fcc23d>] security_key_alloc+0x3b/0x60
    [<000000009b8f5c5c>] key_alloc+0x46e/0x900
    [<00000000a49c5ee1>] keyring_alloc+0x27/0x70
    [<0000000047d4e2e0>] install_session_keyring_to_cred+0xd7/0x120
    [<0000000092fa69fa>] join_session_keyring+0x109/0x1b0
    [<00000000c31be2c8>] __do_sys_keyctl+0x2c2/0x310
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff88812bdab708 (size 8):
  comm "(lymouthd)", pid 573, jiffies 4294744193 (age 8089.252s)
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000727257f3>] selinux_key_alloc+0x33/0xa0
    [<0000000023fcc23d>] security_key_alloc+0x3b/0x60
    [<000000009b8f5c5c>] key_alloc+0x46e/0x900
    [<00000000d752137d>] key_create_or_update+0x45a/0x760
    [<00000000cfad8dc7>] __do_sys_add_key+0x144/0x2a0
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff8884945e6c00 (size 32):
  comm "plymouthd", pid 585, jiffies 4294744220 (age 8089.268s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 03 00 00 00 18 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000036de713e>] selinux_sk_alloc_security+0x55/0xc0
    [<00000000fb9da50f>] security_sk_alloc+0x39/0x60
    [<000000007dc46eaf>] sk_prot_alloc+0x71/0x190
    [<00000000ed8b4081>] sk_alloc+0x2c/0x3c0
    [<000000007ae589bb>] unix_create1+0x94/0x310
    [<000000002da4459b>] unix_create+0x6b/0xd0
    [<0000000022417d2a>] __sock_create+0x203/0x3c0
    [<0000000099e43719>] __sys_socket+0xb6/0x160
    [<00000000a9850552>] __x64_sys_socket+0x3d/0x50
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff888363795940 (size 32):
  comm "plymouthd", pid 585, jiffies 4294744222 (age 8089.267s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 03 00 00 00 2b 00 00 00 00 00 00 00  ........+.......
  backtrace:
    [<0000000036de713e>] selinux_sk_alloc_security+0x55/0xc0
    [<00000000fb9da50f>] security_sk_alloc+0x39/0x60
    [<00000000fd684046>] sk_prot_alloc+0x144/0x190
    [<00000000ed8b4081>] sk_alloc+0x2c/0x3c0
    [<000000009df0b02a>] __netlink_create+0x4b/0x180
    [<0000000046434ad4>] netlink_create+0x186/0x330
    [<0000000022417d2a>] __sock_create+0x203/0x3c0
    [<0000000099e43719>] __sys_socket+0xb6/0x160
    [<00000000a9850552>] __x64_sys_socket+0x3d/0x50
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff88811baa5ac0 (size 32):
  comm "(ystemctl)", pid 677, jiffies 4294749096 (age 8084.410s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 01 00 00 00 18 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000036de713e>] selinux_sk_alloc_security+0x55/0xc0
    [<00000000fb9da50f>] security_sk_alloc+0x39/0x60
    [<000000007dc46eaf>] sk_prot_alloc+0x71/0x190
    [<00000000ed8b4081>] sk_alloc+0x2c/0x3c0
    [<000000007ae589bb>] unix_create1+0x94/0x310
    [<000000002da4459b>] unix_create+0x6b/0xd0
    [<0000000022417d2a>] __sock_create+0x203/0x3c0
    [<0000000099e43719>] __sys_socket+0xb6/0x160
    [<00000000a9850552>] __x64_sys_socket+0x3d/0x50
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff88811baa5a80 (size 32):
  comm "(ystemctl)", pid 677, jiffies 4294749096 (age 8084.410s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 01 00 00 00 18 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000036de713e>] selinux_sk_alloc_security+0x55/0xc0
    [<00000000fb9da50f>] security_sk_alloc+0x39/0x60
    [<000000007dc46eaf>] sk_prot_alloc+0x71/0x190
    [<00000000ed8b4081>] sk_alloc+0x2c/0x3c0
    [<000000007ae589bb>] unix_create1+0x94/0x310
    [<00000000bf10ff2c>] unix_stream_connect+0x154/0x990
    [<00000000a535f0b9>] __sys_connect+0xfd/0x130
    [<000000006ffa2364>] __x64_sys_connect+0x3e/0x50
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff88810c60d6b8 (size 8):
  comm "(ystemctl)", pid 677, jiffies 4294749097 (age 8084.455s)
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000727257f3>] selinux_key_alloc+0x33/0xa0
    [<0000000023fcc23d>] security_key_alloc+0x3b/0x60
    [<000000009b8f5c5c>] key_alloc+0x46e/0x900
    [<00000000a49c5ee1>] keyring_alloc+0x27/0x70
    [<0000000047d4e2e0>] install_session_keyring_to_cred+0xd7/0x120
    [<0000000092fa69fa>] join_session_keyring+0x109/0x1b0
    [<00000000c31be2c8>] __do_sys_keyctl+0x2c2/0x310
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff88810c60d6e0 (size 8):
  comm "(ystemctl)", pid 677, jiffies 4294749097 (age 8084.455s)
  hex dump (first 8 bytes):
    01 00 00 00 00 00 00 00                          ........
  backtrace:
    [<00000000727257f3>] selinux_key_alloc+0x33/0xa0
    [<0000000023fcc23d>] security_key_alloc+0x3b/0x60
    [<000000009b8f5c5c>] key_alloc+0x46e/0x900
    [<00000000d752137d>] key_create_or_update+0x45a/0x760
    [<00000000cfad8dc7>] __do_sys_add_key+0x144/0x2a0
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff8884c10ab380 (size 32):
  comm "systemctl", pid 677, jiffies 4294749145 (age 8084.407s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 01 00 00 00 18 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000036de713e>] selinux_sk_alloc_security+0x55/0xc0
    [<00000000fb9da50f>] security_sk_alloc+0x39/0x60
    [<000000007dc46eaf>] sk_prot_alloc+0x71/0x190
    [<00000000ed8b4081>] sk_alloc+0x2c/0x3c0
    [<000000007ae589bb>] unix_create1+0x94/0x310
    [<000000002da4459b>] unix_create+0x6b/0xd0
    [<0000000022417d2a>] __sock_create+0x203/0x3c0
    [<0000000099e43719>] __sys_socket+0xb6/0x160
    [<00000000a9850552>] __x64_sys_socket+0x3d/0x50
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
unreferenced object 0xffff8884c10ab2c0 (size 32):
  comm "systemctl", pid 677, jiffies 4294749145 (age 8084.407s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 01 00 00 00 18 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000036de713e>] selinux_sk_alloc_security+0x55/0xc0
    [<00000000fb9da50f>] security_sk_alloc+0x39/0x60
    [<000000007dc46eaf>] sk_prot_alloc+0x71/0x190
    [<00000000ed8b4081>] sk_alloc+0x2c/0x3c0
    [<000000007ae589bb>] unix_create1+0x94/0x310
    [<00000000bf10ff2c>] unix_stream_connect+0x154/0x990
    [<00000000a535f0b9>] __sys_connect+0xfd/0x130
    [<000000006ffa2364>] __x64_sys_connect+0x3e/0x50
    [<00000000a99bb85a>] do_syscall_64+0x33/0x40
    [<00000000acf36f32>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
