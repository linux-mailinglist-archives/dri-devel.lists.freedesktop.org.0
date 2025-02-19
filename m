Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F7A3B0DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 06:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6706510E466;
	Wed, 19 Feb 2025 05:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="qSCPWcfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn19012012.outbound.protection.outlook.com
 [52.103.14.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E610E1FD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:22:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKaIcgbfT+sDgmPmgpuNzRJf11Sg4OH7f23wzSe/gBIdQsfqVAYVUb2dV8Mn9agHqPQuJdXSvf7FtIqtW4BZJ3Aewt0ZaRCe3b1c5h4hXeGiG1XAOMRg9EnrPBDo8Eu+9S84iDl8OnUeRUAVEjllvDd42NQIZ3K5q5lL0MEq8Tyxl6ovlohvVGwfwjGijZnrVJzF3zi6Deu/0w2m+EFdsXZQ5CFi8c4BP8lIpk3g22QJtSt2jftXo0PdwBi1/EdvMHM+IHPQDUxtiNtrgF13z4UIGcN+fFF3x5yJjIutGWKTIj0giBfYqigrRYM9HaF6gWoWzWqCjDNqpNEKs6wWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMvGqqsJFpVYcfliiu6iTpYl4SZ96/qKZh5lkYE3y+4=;
 b=BmO0xVTB+pHNRGBMwEcOVISUhSTumP+VzhONYBQFwCHoaVX0nXiLW1wHrfn4cYc/OUJoTpIaQS25b14zc44CNdEUXcEPHjgTUljb/dldlei8sMR6i447HPvTKVoR4wcTESiddfznnuwWheHQtBwtPb7CbJtporPM6ishWcLvA8hhuO1pcmuVr1eBOFudj8nvYND/+3wuDjy33jzsET/AuaFsK22rfjivSfQgWu2RBE46JDsRCVW7nzbABTvcYP0qnFV+MDnaFN9rMZoBwOQAMU76eso/HYaa4/0eOCriwurpTPpr9xPiCn4mCH5EiMn+2iHhmTaTAQ+4J6WtJttPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMvGqqsJFpVYcfliiu6iTpYl4SZ96/qKZh5lkYE3y+4=;
 b=qSCPWcfe4ozMH4+r7x8MovfLWnggQzFUHradU3o4oGbx2WQ9D3qSn+f876/KA3s8bZqNiC0Dkb1SME20YVTzSXlkr158+WCaesVbbr6G4BiEjSojgY9AiZ/2LufTUkSBWqX0hPsEcbMLk6uxOTMz0c1gIF03GajGTASlHl9wxeBqQSZp6XOutloqImnYGgQDj8tF2ZqE+pDN5592snzszSUep+RD2Tx4drf93GkYzQwM7iqAeeKNkZ62PZxPPTm9PvmJxn98YfKQrhY5ZczViOAcjT7+HsBQHQ4moqdnbnrhSapQlwztwmbBwpTV2c+qwZvDqCR537e6mezkwShGKA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DM4PR02MB9262.namprd02.prod.outlook.com (2603:10b6:8:106::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 05:22:38 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 05:22:38 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, "kys@microsoft.com"
 <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
 <decui@microsoft.com>, "deller@gmx.de" <deller@gmx.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: RE: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Topic: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Index: AQHbf4rly0L2XRweZkiIboVOb0veYbNN636g
Date: Wed, 19 Feb 2025 05:22:36 +0000
Message-ID: <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DM4PR02MB9262:EE_
x-ms-office365-filtering-correlation-id: 43e03099-ce6b-4d55-4bea-08dd50a56bcd
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|15080799006|461199028|3412199025|440099028|12091999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?n7N/+RBfmvGYohQ7iRTU/d5mmvnMC69IBFgcDjL+jeQ3SzR9+E6YNewoN3YN?=
 =?us-ascii?Q?duN629+foaIV2DIm1VgmjSsdJF725i5JvQZI6DRHCojzuOf+a8y7Qnw2YBLh?=
 =?us-ascii?Q?Wi9Gjyy8ffZcOLxxJQy0nXmJYsbT//90hyqkVsplcrbrcdaFZ4BmmqCwtucg?=
 =?us-ascii?Q?shuHzeOt4KxV6UfRaozcThv/fGy6AmntvGeai2k08kNb6lbYFznPIQ2Q9cVv?=
 =?us-ascii?Q?Vyl9NECwS6C0+CnAOYgkfdeynbMAIZq+6InB5pYPw/JRhPwM25nSJEVtnVgo?=
 =?us-ascii?Q?TK9ZPrzwv0TSAn2x/LX0+/HFz9uhc8GfV6kAN3TsBLS4IPrSkY+DRH0oaEA6?=
 =?us-ascii?Q?qTdBGoTkUzQYiMFk2elOmUJXUVWVkgJh4wl551/XmynJS+J+X8rNZJ37zXSG?=
 =?us-ascii?Q?ZBPTTSLb00mN8sjTQ1e91u0+rvlejLW3l9vG5uLPjKS83KKEGjNG1UcnyWCq?=
 =?us-ascii?Q?vWwJ44oDytCoAkHhtjLlC63tA/gc/bEHnx1QObpPuxgPUnwgvrtS9aVOq8kL?=
 =?us-ascii?Q?rpcKryijNlctUYwlTWgvcX7/KPELgZmzQ22lUR4KbbJ/gCIJPd9P2WgoGhBK?=
 =?us-ascii?Q?aLNzoujhMk79rVQfMhUjv2QhtJDJK+5VpoLYrm4NLJDn58+CP6Z8VX8aVsF+?=
 =?us-ascii?Q?JPKmP1CQk+IM5Em62YU3YD6k1TErmL8+Y30TJ4m1xcCv2WCZ3llRtrg/DKl9?=
 =?us-ascii?Q?E2vUSUrRQ/0UuSfQMmCdXi9DvsdowdSrmfl56sj3dwYGWp1O/SU2XtuzQL0e?=
 =?us-ascii?Q?vzOnq1o3XDeTGvx+Isoxto2d0FYkPHhsa/oH4TEg/dDHcq7w8PXwG22/6R7r?=
 =?us-ascii?Q?4baXTu0dJRCTsyneI+fio4cKZfzJG/2R/RzFRj0dXAA6sbY4Ar7hTV+1q6LQ?=
 =?us-ascii?Q?rOVR7kf5Q1xA3uqNrA5SVK3yceN3f0l0j1qciLF7AF4Dr2+L2/TUAminuyHJ?=
 =?us-ascii?Q?/aI4AG0xUHP0r+Emrr3EfVtFNEHqhpIbwQOT2wTQN4AI5CmlyAaRp0VXKiTL?=
 =?us-ascii?Q?aVB7nzU+luwAMan8NtSP7nO2ty6C9SrVQ8oVU5u2mckEAW4HpWAxhWDDVTcK?=
 =?us-ascii?Q?f15YphspL/YilIJQK0ydKIKrOj1g/w=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XDetji7OubRsmNZQmu2xIN7gW3tEiDO53R5ON2ccdj9hcGF8+AGXvODEXMJL?=
 =?us-ascii?Q?FAeDNHSLmWoUDGl2KqybeBxJlgZtqteBzXyIiTtDp6Qgxp1NTrWXwa52HVSU?=
 =?us-ascii?Q?57b36+cuWwQFUNE8vN4bG0BdCX1oerblxWJc9mBXrh13afXTD3HOsCH/BPtl?=
 =?us-ascii?Q?DCJbkrLrNKtdN8Ypyuggn9lwpiABxN5PiR7dsMiNFrOSOAkya1MjkR41XB1D?=
 =?us-ascii?Q?oTVnV/vGPW0RlUuyjST/T2P7Q9OYBD24ydJiEj/92iTZ53XcCUKZUpKN9NP0?=
 =?us-ascii?Q?a21T+k1cNcdgNUg6sxNGYQuwOf1LDmJ57lpOPWUY0J2U0Su8a0qYCXg9N9QT?=
 =?us-ascii?Q?urKm7mrnrBoxwO/1mMQUGK/y3vJ56S7qpV/lmD7gWx4KhQbAGV7sGWm3CAyO?=
 =?us-ascii?Q?DjwtuGtLLQ4jLIcXSHLqvmPD5EAoHcQsBcX95pRgFvpS3AlvuKbQC3OxRB5Z?=
 =?us-ascii?Q?B2zW8S7tUhnSjEejK5IT6VhPRtiBmDR7oE745FkRWq9uQqIyjI7yflhBd4Yf?=
 =?us-ascii?Q?a3LoeowA5ciEwrXjxS1hntAPS764H6KBTq29qYh/pm5J7FktG8W7q5tUGK2D?=
 =?us-ascii?Q?5bKTBSIjYFOlex7eGas7117CfFEdshhB5hTmdBExpUFzIH1FloeFTV0p6f71?=
 =?us-ascii?Q?Wt6xtTZvOww+eIoFPNOVUGHuTE6SC+onmgQXGie5Amecemgn+vokn56+XYO3?=
 =?us-ascii?Q?0kAlr62cc++a8ad3Wgg5KYscLUHO8o/j6tEh38Y2DCtDV21ncvMlhtyxFMXb?=
 =?us-ascii?Q?59zfPG+Rr2sjE6rJE5Gu8r++ZwiNnW++fiOiiLNPY1prn+CM13KYu8SvDDRA?=
 =?us-ascii?Q?Rolk4tb/QnKhJjSchZOk3xlm6NfUpLmL4573Kt6hOarhpgI4ZEzRWCQKvgrB?=
 =?us-ascii?Q?hPW7AEXtQNNxtKk5E8aAiSTvOuxZfosygGS376D2MDuLP/jVwWmedyccbmBm?=
 =?us-ascii?Q?GtfZy1wJqgACCRpA/JxVoLYlFKdn/C5smd/cr6RxerNJras/KrhZxhBNbnQM?=
 =?us-ascii?Q?3cdSmlEYEAxZ2kAVYM7ntTqV3r/rz16j/Me02Loo0EL9Jy13/OSKo1L+IYKV?=
 =?us-ascii?Q?ygOFahzAod4vAiIgOzFZNjRuDEvJ0h38VwpPi9ir+h2+jkC1E2zta/w0Qt50?=
 =?us-ascii?Q?Q57pfxuzYcWaPPi8W4iKNZMHzgidtMP9Oav56T96I2Z+UlXdB9WAllt9CHzg?=
 =?us-ascii?Q?BQHbZFbXLbr/gzgjAH2S0r6BsR7q/k++KpQAnrBkplag2wFWP45acG/vJvI?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e03099-ce6b-4d55-4bea-08dd50a56bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 05:22:36.4508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB9262
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

From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Saturday, February=
 15, 2025 1:21 AM
>=20
> When a Hyper-V framebuffer device is unbind, hyperv_fb driver tries to
> release the framebuffer forcefully. If this framebuffer is in use it
> produce the following WARN and hence this framebuffer is never released.
>=20
> [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/core/fb_=
info.c:70 framebuffer_release+0x2c/0x40
> < snip >
> [   44.111289] Call Trace:
> [   44.111290]  <TASK>
> [   44.111291]  ? show_regs+0x6c/0x80
> [   44.111295]  ? __warn+0x8d/0x150
> [   44.111298]  ? framebuffer_release+0x2c/0x40
> [   44.111300]  ? report_bug+0x182/0x1b0
> [   44.111303]  ? handle_bug+0x6e/0xb0
> [   44.111306]  ? exc_invalid_op+0x18/0x80
> [   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
> [   44.111311]  ? framebuffer_release+0x2c/0x40
> [   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
> [   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
> [   44.111323]  device_remove+0x40/0x80
> [   44.111325]  device_release_driver_internal+0x20b/0x270
> [   44.111327]  ? bus_find_device+0xb3/0xf0
>=20
> Fix this by moving the release of framebuffer to fb_ops.fb_destroy functi=
on
> so that framebuffer framework handles it gracefully

These changes look good for solving the specific problem where
the reference count WARN is produced. But there is another
problem of the same type that happens when doing unbind
of a hyperv_fb device that is in use (i.e., /dev/fb0 is open and
mmap'ed by some user space program).

For this additional problem, there are three sub-cases,
depending on what memory gets mmap'ed into user space.
Two of the three sub-cases have a problem.

1) When Hyper-V FB uses deferred I/O, the vmalloc dio memory
is what get mapped into user space. When hyperv_fb is unbound,
the vmalloc dio memory is freed. But the memory doesn't actually
get freed if it is still mmap'ed into user space. The deferred I/O
mechanism is stopped, but user space can keep writing to the
memory even though the pixels don't get copied to the actual
framebuffer any longer.  When the user space program terminates
(or unmaps the memory), the memory will be freed. So this case
is OK, though perhaps a bit dubious.

2) When Hyper-V FB is in a Gen 1 VM, and the frame buffer size
is <=3D 4 MiB, a normal kernel allocation is used for the
memory that is mmap'ed to user space. If this memory
is freed when hyperv_fb is unbound, bad things happen
because the memory is still being written to via the user space
mmap. There are multiple "BUG: Bad page state in process
bash  pfn:106c65" errors followed by stack traces.

3) Similarly in a Gen 1 VM, if the frame buffer size is > 4 MiB,
CMA memory is allocated (assuming it is available). This CMA
memory gets mapped into user space. When hyperv_fb is
unbound, that memory is freed. But CMA complains that the
ref count on the pages is not zero. Here's the dmesg output:

[  191.629780] ------------[ cut here ]------------
[  191.629784] 200 pages are still in use!
[  191.629789] WARNING: CPU: 3 PID: 1115 at mm/page_alloc.c:6757 free_conti=
g_range+0x15e/0x170

Stack trace is:=20

[  191.629847]  ? __warn+0x97/0x160
[  191.629849]  ? free_contig_range+0x15e/0x170
[  191.629849]  ? report_bug+0x1bb/0x1d0
[  191.629851]  ? console_unlock+0xdd/0x1e0
[  191.629854]  ? handle_bug+0x60/0xa0
[  191.629857]  ? exc_invalid_op+0x1d/0x80
[  191.629859]  ? asm_exc_invalid_op+0x1f/0x30
[  191.629862]  ? free_contig_range+0x15e/0x170
[  191.629862]  ? free_contig_range+0x15e/0x170
[  191.629863]  cma_release+0xc6/0x150
[  191.629865]  dma_free_contiguous+0x34/0x70
[  191.629868]  dma_direct_free+0xd3/0x130
[  191.629869]  dma_free_attrs+0x6b/0x130
[  191.629872]  hvfb_putmem.isra.0+0x99/0xd0 [hyperv_fb]
[  191.629874]  hvfb_remove+0x75/0x80 [hyperv_fb]
[  191.629876]  vmbus_remove+0x28/0x40 [hv_vmbus]
[  191.629883]  device_remove+0x43/0x70
[  191.629886]  device_release_driver_internal+0xbd/0x140
[  191.629888]  device_driver_detach+0x18/0x20
[  191.629890]  unbind_store+0x8f/0xa0
[  191.629891]  drv_attr_store+0x25/0x40
[  191.629892]  sysfs_kf_write+0x3f/0x50
[  191.629894]  kernfs_fop_write_iter+0x142/0x1d0
[  191.629896]  vfs_write+0x31b/0x450
[  191.629898]  ksys_write+0x6e/0xe0
[  191.629899]  __x64_sys_write+0x1e/0x30
[  191.629900]  x64_sys_call+0x16bf/0x2150
[  191.629903]  do_syscall_64+0x4e/0x110
[  191.629904]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

For all three cases, I think the memory freeing and iounmap() operations
can be moved to the new hvfb_destroy() function so that the memory
is cleaned up only when there aren't any users. While these additional
changes could be done as a separate patch, it seems to me like they are all
part of the same underlying issue as the reference count problem, and
could be combined into this patch.

Michael=20

>=20
> While we fix this, also replace manual registrations/unregistration of
> framebuffer with devm_register_framebuffer.
>=20
> Fixes: 68a2d20b79b1 ("drivers/video: add Hyper-V Synthetic Video Frame Bu=
ffer Driver")
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 363e4ccfcdb7..83b1ab4da984 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -862,6 +862,16 @@ static void hvfb_ops_damage_area(struct fb_info *inf=
o, u32 x, u32 y, u32 width,
>  		hvfb_ondemand_refresh_throttle(par, x, y, width, height);
>  }
>=20
> +/*
> + * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> + * of unregister_framebuffer() or fb_release(). Do any cleanup related t=
o
> + * framebuffer here.
> + */
> +static void hvfb_destroy(struct fb_info *info)
> +{
> +	framebuffer_release(info);
> +}
> +
>  /*
>   * TODO: GEN1 codepaths allocate from system or DMA-able memory. Fix the
>   *       driver to use the _SYSMEM_ or _DMAMEM_ helpers in these cases.
> @@ -877,6 +887,7 @@ static const struct fb_ops hvfb_ops =3D {
>  	.fb_set_par =3D hvfb_set_par,
>  	.fb_setcolreg =3D hvfb_setcolreg,
>  	.fb_blank =3D hvfb_blank,
> +	.fb_destroy	=3D hvfb_destroy,
>  };
>=20
>  /* Get options from kernel paramenter "video=3D" */
> @@ -1172,7 +1183,7 @@ static int hvfb_probe(struct hv_device *hdev,
>  	if (ret)
>  		goto error;
>=20
> -	ret =3D register_framebuffer(info);
> +	ret =3D devm_register_framebuffer(&hdev->device, info);
>  	if (ret) {
>  		pr_err("Unable to register framebuffer\n");
>  		goto error;
> @@ -1220,14 +1231,11 @@ static void hvfb_remove(struct hv_device *hdev)
>=20
>  	fb_deferred_io_cleanup(info);
>=20
> -	unregister_framebuffer(info);
>  	cancel_delayed_work_sync(&par->dwork);
>=20
>  	vmbus_close(hdev->channel);
> -	hv_set_drvdata(hdev, NULL);
>=20
>  	hvfb_putmem(hdev, info);
> -	framebuffer_release(info);
>  }
>=20
>  static int hvfb_suspend(struct hv_device *hdev)
> --
> 2.43.0

