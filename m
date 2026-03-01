Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id w8U1NKvNo2nTNgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 06:24:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197FC1CE8FA
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 06:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC4F10E0F0;
	Sun,  1 Mar 2026 05:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lechnology.com header.i=@lechnology.com header.b="ev3Ot1cL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galaxy.gendns.com (galaxy.gendns.com [66.235.175.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4077C10E0F0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 05:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GZBayzTvm5ChUOjsV24CUt1VTjRFFJG7F8JQg8HnZiI=; b=ev3Ot1cL9GJwSWgLCJDumVGh45
 DKkXJIuPOoDLmmxSixEfQEeBNlCGiXzRzOD90lnYz1BBKJZmrMWLujLifvtgYhRAm7yrUvqgXiZh5
 zbjoFhDfsXPAbaJuxo7qC3rI6uLKw9j9kFrX6PyxHh8bDfhKE7Qe+81lLq2iGoVhu2PZ/01cHeHIt
 5LnaGAUUULnG/pHAlX6lLy42CCvzf66FRlTG2hSDGGRgqEHwkiUFs3cXiD58bXEGHwp8G8uW0oPLm
 +qiE7auqLM2CDD2w0hPHDC3/EpblzT9qfdY269iE5bVKh8CjWo0CHWdsXAcnsUL7UDqbrGHSJk7eB
 SegR4IxQ==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:44218
 helo=[192.168.1.142])
 by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.99.1) (envelope-from <david@lechnology.com>)
 id 1vwZIR-0000000BEHR-3Du2; Sun, 01 Mar 2026 00:24:51 -0500
Message-ID: <e499a22c-9205-4e02-b787-bf5ef7b36ead@lechnology.com>
Date: Sat, 28 Feb 2026 23:24:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] drm/st7586: Use regular atomic helpers; drop
 simple-display helpers
From: David Lechner <david@lechnology.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 architanant5@gmail.com, wens@kernel.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20260224153656.261351-1-tzimmermann@suse.de>
 <20260224153656.261351-12-tzimmermann@suse.de>
 <d3eec0ed-d88f-489e-8e12-843098856e1f@lechnology.com>
Content-Language: en-US
Autocrypt: addr=david@lechnology.com; keydata=
 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
In-Reply-To: <d3eec0ed-d88f-489e-8e12-843098856e1f@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - galaxy.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: galaxy.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: galaxy.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lechnology.com:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[lechnology.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_X_AS(0.00)[davidmain@lechnology.com];
	HAS_X_GMSV(0.00)[davidmain+lechnology.com/only user confirmed/virtual account not confirmed];
	FORGED_SENDER(0.00)[david@lechnology.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,redhat.com,gmail.com,kernel.org,linux.intel.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_X_SOURCE(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[david@lechnology.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[lechnology.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Rspamd-Queue-Id: 197FC1CE8FA
X-Rspamd-Action: no action

On 2/28/26 10:45 PM, David Lechner wrote:
> On 2/24/26 9:24 AM, Thomas Zimmermann wrote:
>> Replace simple-display helpers with regular atomic helpers. Store the
>> pipeline elements in struct st7586_device and initialize them as part
>> of probing the device. Use mipi-dbi's existing helpers and initializer
>> macros where possible.
>>
>> Effectively open-codes the modesetting code in the initializer helpers
>> of mipi-dbi and simple-display. St7586 requires custom helpers for
>> various pipeline elements, and non-freeing cleanup of the pipeline.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
> 
> This results in a couple of unused variable warnings, but otherwise seems
> to still work.
> 
> Tested-by: David Lechner <david@lechnology.com>
> 
> 
> /home/david/work/bl/linux/drivers/gpu/drm/sitronix/st7586.c: In function ‘st7586_pipe_enable’:
> /home/david/work/bl/linux/drivers/gpu/drm/sitronix/st7586.c:180:25: warning: unused variable ‘rect’ [-Wunused-variable]
>   180 |         struct drm_rect rect = {
>       |                         ^~~~
> /home/david/work/bl/linux/drivers/gpu/drm/sitronix/st7586.c:177:40: warning: unused variable ‘shadow_plane_state’ [-Wunused-variable]
>   177 |         struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>       |                                        ^~~~~~~~~~~~~~~~~~
> 

Actually, I messed up and didn't notice a merge conflict with [1] when
applying the patches. So I only tested all of the patches before this
one. This means the unused variables are caused by [PATCH 01/16]
("drm/mipi-dbi: Only modify planes on enabled CRTCs").

When I actually tested the full series including this patch, it crashed with:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000004 when read
[00000004] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
CPU: 0 UID: 0 PID: 23 Comm: kworker/u4:1 Not tainted 7.0.0-rc1-next-20260227ad7944-mainline-00016-gb3e6bd63e5a4 #48 PREEMPT 
Hardware name: Generic DA850/OMAP-L138/AM18x
Workqueue: events_unbound deferred_probe_work_func
PC is at detect_connector_status+0x8/0x44
LR is at 0x0
pc : [<c0498114>]    lr : [<00000000>]    psr: 60000013
sp : c488d93c  ip : 00000001  fp : 00000000
r10: 00000080  r9 : 000000b2  r8 : 00000003
r7 : c1462000  r6 : 00000000  r5 : c14633d4  r4 : c1463378
r3 : 00000000  r2 : 00000001  r1 : c488d98c  r0 : c1463378
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 0005317f  Table: c0004000  DAC: 00000053
Register r0 information: slab kmalloc-8k start c1462000 pointer offset 4984 size 8192
Register r1 information: 2-page vmalloc region starting at 0xc488c000 allocated at kernel_clone+0xa8/0x3a4
Register r2 information: non-paged memory
Register r3 information: NULL pointer
Register r4 information: slab kmalloc-8k start c1462000 pointer offset 4984 size 8192
Register r5 information: slab kmalloc-8k start c1462000 pointer offset 5076 size 8192
Register r6 information: NULL pointer
Register r7 information: slab kmalloc-8k start c1462000 pointer offset 0 size 8192
Register r8 information: non-paged memory
Register r9 information: non-paged memory
Register r10 information: non-paged memory
Register r11 information: NULL pointer
Register r12 information: non-paged memory
Process kworker/u4:1 (pid: 23, stack limit = 0x(ptrval))
Stack: (0xc488d93c to 0xc488e000)
d920:                                                                c0499674
d940: 00000026 c1570760 00000000 c0076e00 00000800 c488d9cc 00000820 00000000
d960: fffffdff 00000001 00000001 380d677e 00000000 c488da88 c488d9cc 000000b2
d980: 00000001 c14620c4 c488d9d8 c0d77100 00000001 00000001 00000000 00000000
d9a0: c0a50460 00000000 00000000 00000000 c14620dc c14620dc 00000000 380d677e
d9c0: c04849d4 00000001 00000000 00000000 c1570620 000000b2 00000080 c1462000
d9e0: 00000000 c0484a54 ffffffff c0059b58 c173eb28 00000000 c488daa0 c09b7a1c
da00: c0d77100 00000001 c1462000 c1570620 c1570580 c15705c0 c155fd00 00000000
da20: 000000b2 00000080 c157061c c15705a0 c15705e0 c488dae0 c488da60 00000000
da40: 69a3cc58 c14620b4 00000004 c155fd18 69a3cc58 00000008 2f167180 00000000
da60: c157061c c488daa8 c11168a0 c488db08 c488da98 c488daa8 c11168a0 c488db08
da80: c488da98 00000000 00000000 00000000 c11168a0 c0160210 69a3cc58 00000000
daa0: 2f167180 00000000 69a3cc58 00000000 2f167180 00000000 69a3cc58 380d677e
dac0: 2f167180 c155fd00 00000000 c1462000 c146207c 00000001 c1463328 c1462000
dae0: 00000000 c049b560 c111b990 c11168a0 c111b990 c111b990 c098b4e8 c0170710
db00: c11168a0 c027b0e0 69a3cc58 00000000 2f167180 00000000 c1462000 380d677e
db20: c488db30 c155fc00 c1570620 380d677e c155fc00 c155fd00 00000000 c1462000
db40: c146207c 00000001 c1463328 ffffffea 00000000 c049fbb4 c155fd00 c155fd08
db60: c1462000 c0482fe4 c1462000 c155fd00 00000020 c1462000 c155fd00 00000000
db80: c1463378 c049fcb4 00000000 c1462000 c1462000 00000000 c1548800 c049eedc
dba0: c1462000 c04a1efc 00000000 00000000 c08659f8 00000001 00000000 c0a506cc
dbc0: 00000000 380d677e c1548800 c1548800 00000000 c0a506dc 00000000 c0c3693c
dbe0: c0a50974 c04ab444 c1548800 c0a506dc c1548800 00000040 c0c3693c c04ab6d0
dc00: 60000013 c0a50974 c0a7d3d4 c0a506dc c1548800 00000040 c0c3693c c04ab8b0
dc20: c0a7d3d4 c0a506dc c488dc7c c1548800 c0c3693c c04aba48 00000000 c0c36900
dc40: c488dc7c c04ab98c c0c3693c c04a9774 c0c36900 c0c36960 c0c1df34 380d677e
dc60: c3fec7d4 c1548800 00000001 c1548844 c0c36900 c04abddc 00000000 c1548800
dc80: 00000001 380d677e c0c36900 c1548800 c0c36900 c04ac024 c1548800 c1548800
dca0: c0c36900 c04aa600 c1548800 00000000 c3fec7d4 c1549400 00000000 c04a7ea4
dcc0: c1548800 00000000 c0cdf610 c0cdf610 c0a5308c 380d677e c1548800 c1548800
dce0: c1549400 00000000 c0cdf610 c0a5308c 00000000 c05254e0 00000000 c1548800
dd00: 00000000 380d677e c488dd18 00000000 c1548800 c3fec7c8 c15495e0 c0525e18
dd20: 00000000 00000002 000000e8 c1549400 00000000 00989680 00000000 00000000
dd40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
dd60: 00000000 00000000 00000000 380d677e c3fec7c8 c1549400 c3fec7c8 00000000
dd80: c15495a8 c0a5308c c15652a0 00000001 00000000 c05265b4 00000000 c1549400
dda0: c0cdf610 00000000 c1549400 c0cdf610 c0cdf610 c0529020 00000028 0000fffe
ddc0: 00000001 c0528a5c c1549700 c1549400 c0cdf610 c0529430 00000000 c0d07360
dde0: c1549700 c0cdf610 c0d07380 00000004 00000001 380d677e c0a50c7c c0cdf610
de00: c0a53550 c0a53550 00000000 c0c32e3c c0a50c7c c0c0ca1c 00000402 c04ada80
de20: c0cdf610 00000000 c0a53550 c04ab444 c0cdf610 c0a53550 c0cdf610 00000040
de40: c0c32e3c c04ab6d0 60000013 c0a50c7c c0a7d3d4 c0a53550 c0cdf610 00000040
de60: c0c32e3c c04ab8b0 c0a7d3d4 c0a53550 c488dec4 c0cdf610 c0c32e3c c04aba48
de80: 00000000 c0c32e00 c488dec4 c04ab98c c0c32e3c c04a9774 c0c32e00 c0c32e60
dea0: c0c1dcf4 380d677e c0c1f10d c0cdf610 00000001 c0cdf654 c0c32e00 c04abddc
dec0: c0a50c58 c0cdf610 00000001 380d677e c0c32e00 c0cdf610 c0c32e00 c04ac024
dee0: c0cdf610 c0cdf610 c0c32e00 c04aa600 c0cdf610 c0a50c48 c0a50c58 00000000
df00: c0c1f10d c04aaa9c c0d2f980 c0d77100 c0c1f100 00000000 c0c1f10d c003efa8
df20: 00000002 c0d77100 c0d77100 c0c0ca00 c0a400e0 c0d77100 c0d77100 c0d2f980
df40: c0d2f9ac c0c0ca00 c0a400e0 c0d77100 c0d77100 c003fb10 c003f928 c0d2f980
df60: c4831ec0 00000000 c488df7c c0d34200 c0d77100 c0c05360 c003f928 c0d2f980
df80: c4831ec0 00000000 00000000 c0048ddc c0d34200 c0048cac 00000000 00000000
dfa0: 00000000 00000000 00000000 c000850c 00000000 00000000 00000000 00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
Call trace: 
 detect_connector_status from drm_helper_probe_single_connector_modes+0x4fc/0x634
 drm_helper_probe_single_connector_modes from drm_client_modeset_probe+0x1bc/0x173c
 drm_client_modeset_probe from __drm_fb_helper_initial_config_and_unlock+0x2c/0x5d8
 __drm_fb_helper_initial_config_and_unlock from drm_fbdev_client_hotplug+0x6c/0xb0
 drm_fbdev_client_hotplug from drm_client_register+0x58/0x94
 drm_client_register from drm_fbdev_client_setup+0x98/0x1bc
 drm_fbdev_client_setup from drm_client_setup+0x9c/0xe4
 drm_client_setup from st7586_probe+0x264/0x2d0
 st7586_probe from really_probe+0xc4/0x2cc
 really_probe from __driver_probe_device+0x84/0x19c
 __driver_probe_device from driver_probe_device+0x30/0x10c
 driver_probe_device from __device_attach_driver+0xbc/0x138
 __device_attach_driver from bus_for_each_drv+0x90/0xe8
 bus_for_each_drv from __device_attach+0xa4/0x1b0
 __device_attach from device_initial_probe+0x3c/0x48
 device_initial_probe from bus_probe_device+0x28/0x7c
 bus_probe_device from device_add+0x560/0x778
 device_add from __spi_add_device+0x178/0x26c
 __spi_add_device from of_register_spi_device+0x5b4/0x9ec
 of_register_spi_device from spi_register_controller+0x364/0x624
 spi_register_controller from spi_bitbang_start+0x3c/0x70
 spi_bitbang_start from davinci_spi_probe+0x298/0x434
 davinci_spi_probe from platform_probe+0x58/0x90
 platform_probe from really_probe+0xc4/0x2cc
 really_probe from __driver_probe_device+0x84/0x19c
 __driver_probe_device from driver_probe_device+0x30/0x10c
 driver_probe_device from __device_attach_driver+0xbc/0x138
 __device_attach_driver from bus_for_each_drv+0x90/0xe8
 bus_for_each_drv from __device_attach+0xa4/0x1b0
 __device_attach from device_initial_probe+0x3c/0x48
 device_initial_probe from bus_probe_device+0x28/0x7c
 bus_probe_device from deferred_probe_work_func+0x74/0xa0
 deferred_probe_work_func from process_one_work+0x170/0x348
 process_one_work from worker_thread+0x1e8/0x424
 worker_thread from kthread+0x130/0x158
 kthread from ret_from_fork+0x14/0x28
Exception stack(0xc488dfb0 to 0xc488dff8)
dfa0:                                     00000000 00000000 00000000 00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e3a00003 e12fff1e e52de004 e590e47c (e59ee004) 
---[ end trace 0000000000000000 ]---

