Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9AAACBC43
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 22:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AB810E586;
	Mon,  2 Jun 2025 20:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fossekall.de header.i=@fossekall.de header.b="e3Id86jq";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="LV6IAvB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CC010E586
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 20:25:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748895753; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=W3vN+4KLO8cK3qU5USVsvEUhYd19mZ4zndWa6enD87kQ8K9CyUsbCpJBBY2x765wHL
 q1LTZaVy08DRO3Pwzjl0uJ10WkDib/MApCJtsNhofJW75wA+ul5UGHP4g1VAJTAE3hsC
 ID2ww8BCfxe9iS4/RViuZZFuN2NKtbbhR71IUydDX7ZZ2yPB/rRFCZ8ZzIEW5JtN4q9b
 vmZ9QQoTLgZR4ScHYAAO7tNSlKotP+SLpAeD529+i6hTNS1JrkoFS7wCxcTNGWDes8qd
 n54DhdwdpDjdZ8dPP4/q0PIfedwBSGIyw0dFqVJuWHpHgodZ49LseMWGpFbgSqwR4rum
 uUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748895753;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SgTlm3ZMGL6dC8XB4ryrz5XCs5DUrmAxkcSAJQ6NXEw=;
 b=S92goXEE/X9QhaSFvYqfG6b1iBEJB1++OS0yz79JaaxhjK5SLpdm6bseKctZ7HX3xC
 u9EvgsJDEsYnkPwgUe0xd7eJQZr7imniFmHXFKnUiqMA/lpQTwN3VuDMJwDIM/kKo1QO
 DJhyoXWwjUCqgH9nTWATL+V56uT2nbAwGpheHEdnflbcB81qR2dYGQRO7WfuL23pO9ma
 rKT7rAa1lP8Wkxrnoe71Po5mCoxBEOtRUeduxjSbayF9ZzHHqzTKGfJYebyzaWDQe4SD
 fZNR+pdWyKB8dOIA0PESumsceCKvY2vgCSJ3FRjHeqKpfGgMvCVVHthssvPKy+waTzVw
 C1Sw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748895753;
 s=strato-dkim-0002; d=fossekall.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SgTlm3ZMGL6dC8XB4ryrz5XCs5DUrmAxkcSAJQ6NXEw=;
 b=e3Id86jqlAGlf0QayOWpJZ5FGQMOhyUXErO+ZR81efZgDzBjpTYs7/3P5gS3ZX8yth
 PvyET/TzrjUUZo3jlD2lCouQeXmTrUxXLV0DOSGFJ/+11v3C7mk60VlxlvEvt24oOi4S
 YLHhNfROHbviby8s+0XoGSeHA6lhqyRv6scdU5qMPcr6kKB14FIAuGIgOCXKxvtlCJ7T
 4L9LNHsaeHZmCk7oALllq0FDEozH3CMeXafyCiIcYLqqM/BsyayH25lI6kxMnpBbzRCL
 eqBaK8zHfTVmXe94Ob+9m8GClmyvgxoVX6JeAl/cwwzhY/HbVh1yFNR6LKkYM2WzPEgh
 PM+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748895753;
 s=strato-dkim-0003; d=fossekall.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SgTlm3ZMGL6dC8XB4ryrz5XCs5DUrmAxkcSAJQ6NXEw=;
 b=LV6IAvB63t6pe14GWWzxv+D26ngS3FRo3lj/GNubUXfomHAv/8Qp/Oh2od6tYq6vqY
 W+Ol4WReQyIRJZ328TCg==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl by smtp.strato.de (RZmta 51.3.0 AUTH)
 with ESMTPSA id f28b35152KMWrD6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 2 Jun 2025 22:22:32 +0200 (CEST)
Received: from koltrast.home ([192.168.1.32] helo=a98shuttle.de)
 by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <michael@fossekall.de>)
 id 1uMBfz-00044L-1k; Mon, 02 Jun 2025 22:22:31 +0200
Date: Mon, 2 Jun 2025 22:22:30 +0200
From: Michael Klein <michael@fossekall.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <aD4IBoyGSJ5A5L-O@a98shuttle.de>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
 <20250526-refined-dog-of-blizzard-b48f11@houat>
 <aDTZXagQ28OdNtLh@a98shuttle.de>
 <20250602-psychedelic-purring-poodle-900a5b@houat>
 <aD3wE_mkfYA2XqA6@a98shuttle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aD3wE_mkfYA2XqA6@a98shuttle.de>
Content-Transfer-Encoding: 7bit
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

On Mon, Jun 02, 2025 at 08:40:20PM +0200, Michael Klein wrote:
>On Mon, Jun 02, 2025 at 11:55:44AM +0200, Maxime Ripard wrote:
>>On Mon, May 26, 2025 at 11:13:01PM +0200, Michael wrote:
>>>On Mon, May 26, 2025 at 07:30:35PM +0200, Maxime Ripard wrote:
>>>> On Mon, May 12, 2025 at 10:27:06PM +0200, Michael wrote:
>>>> > with v6.9 and later there is no output on the BananaPI HDMI connector.
>>>> >
>>>> > I have bisected the issue to the following commit:
>>>> >
>>>> >   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
>>>> >
>>>> > With this patch, sun4i_hdmi_connector_clock_valid() is occasionally called
>>>> > with clock=0, causing the function to return MODE_NOCLOCK.
>>>> > In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is
>>>> > always!=0, maybe that gives someone a hint.
>>>>
>>>> This doesn't make sense to me, if only because the two callers of
>>>> tmds_char_rate_valid (hdmi_compute_clock and
>>>> drm_hdmi_connector_mode_valid) have, right before calling it, checks to
>>>> make sure the clock rate isn't 0, and would return MODE_ERROR or EINVAL
>>>> in such a case.
>>>>
>>>> https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_hdmi_state_helper.c#L234
>>>> https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_hdmi_state_helper.c#L553
>>>
>>>Before 6.14, sun4i_hdmi_connector_clock_valid() was also called from
>>>sun4i_hdmi_connector_atomic_check()...
>>>
>>>> Do you have some logs (with dri.devel=0xff)? Does it happen with 6.15 as
>>>> well?
>>>
>>>It does not happen with 6.15, as it was fixed in 6.14 with 84e541b1e58e
>>>("drm/sun4i: use drm_atomic_helper_connector_hdmi_check()").
>>
>>Then we might still need to backport that patch.
>>
>>Does applying it to 6.9 alone makes it work, or do you need some additional ones (I'm thinking of
>>ae048fc4f96d in particular, which in turn would require 47368ab437fd)
>
>No way to apply this to anything 6.9. The closest I can get it into is 
>6.11, which requires both ae048fc4f96d and 47368ab437fd (with one 
>trivial conflict) to make it work. Anthing earlier lacks the entire 
>HDMI connector framework.

HDMI signal is fine, but panics when shutting down:

[   80.182719] 8<--- cut here ---
[   80.190019] Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
[   80.203132] [00000000] *pgd=00000000
[   80.210869] Internal error: Oops: 5 [#1] SMP THUMB2
[   80.219762] Modules linked in: rfkill sunrpc sun4i_gpadc_iio axp20x_adc sunxi_cir sun4i_ts sunxi_cedrus(C) v4l2_mem2mem videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videodev videobuf2_common mc cpufreq_dt lz4hc evdev lz4 uio_pdrv_genirq uio zram zsmalloc binfmt_misc ledtrig_netdev dm_mod configfs autofs4 ext4 mbcache jbd2 axp20x_usb_power industrialio pinctrl_axp209 lima gpu_sched sun4i_gpadc sunxi phy_generic simpledrm drm_shmem_helper display_connector realtek
[   80.278276] CPU: 0 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G         C         6.11.11-edge-sunxi #2
[   80.292150] Tainted: [C]=CRAP
[   80.299353] Hardware name: Allwinner sun7i (A20) Family
[   80.308856] PC is at drm_match_cea_mode+0x1a/0x164
[   80.317864] LR is at drm_default_rgb_quant_range+0xd/0x18
[   80.327409] pc : [<c068be8a>]    lr : [<c068bfe1>]    psr: 80000033
[   80.337879] sp : f0819be0  ip : 00000000  fp : c1d99400
[   80.347275] r10: 00000000  r9 : c350e600  r8 : c350f400
[   80.356623] r7 : 00000000  r6 : 00000043  r5 : c1de9840  r4 : c2f72200
[   80.367251] r3 : c1a7b200  r2 : 00000000  r1 : 00000014  r0 : 00000000
[   80.377866] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment none
[   80.389216] Control: 50c5387d  Table: 4350406a  DAC: 00000051
[   80.398974] Register r0 information: NULL pointer
[   80.407594] Register r1 information: non-paged memory
[   80.416432] Register r2 information: NULL pointer
[   80.424851] Register r3 information: slab task_struct start c1a7b200 pointer offset 0 size 2560
[   80.437302] Register r4 information: slab kmalloc-512 start c2f72200 pointer offset 0 size 512
[   80.449595] Register r5 information: slab kmalloc-2k start c1de9800 pointer offset 64 size 2048
[   80.461962] Register r6 information: non-paged memory
[   80.470615] Register r7 information: NULL pointer
[   80.478819] Register r8 information: slab kmalloc-512 start c350f400 pointer offset 0 size 512
[   80.491012] Register r9 information: slab kmalloc-512 start c350e600 pointer offset 0 size 512
[   80.503137] Register r10 information: NULL pointer
[   80.511370] Register r11 information: slab kmalloc-1k start c1d99400 pointer offset 0 size 1024
[   80.523615] Register r12 information: NULL pointer
[   80.531889] Process systemd-shutdow (pid: 1, stack limit = 0x606ed489)
[   80.541956] Stack: (0xf0819be0 to 0xf081a000)
[   80.549838] 9be0: 00000000 7465f854 00000004 eff95f00 c1a7b480 00153997 00000012 00000000
[   80.561631] 9c00: c16177c8 c16177c8 00000001 c15a0500 eff8b500 2e9eb000 00000014 c01631a9
[   80.573432] 9c20: 00000012 00000000 f0819c38 eff95f00 00000000 c01531f3 00000000 c014fefb
[   80.585202] 9c40: 00000000 ab217527 00000012 00000001 c16177c8 7465f854 00000000 c2f72200
[   80.596929] 9c60: c1de9840 00000043 00000000 c350f400 c350e600 00000000 c1d99400 c068bfe1
[   80.608686] 9c80: 00000000 c06c41e3 00000014 c06aa6b9 c1a7b200 2e9eb000 c160b100 c160b100
[   80.620365] 9ca0: 2e9eb000 2e9eb000 f0819cd0 c350f400 c38c3ec0 c06aab2f c1a7b200 c38c3ec0
[   80.631960] 9cc0: c1de9840 00000043 c2f72200 c350f400 c350e600 00000000 c1d99400 c06aa89f
[   80.643459] 9ce0: 00000043 c29e4740 c15aaec0 00000000 c1a7b200 aa4033e7 00000001 00000000
[   80.654883] 9d00: c0baeee4 c01a248d c1d99400 c0dbfbf0 c0dbfd3c 00000001 c0dbfcc4 00000000
[   80.666249] 9d20: 00000002 c1d99400 c38c3ec0 00000001 c2f72200 00000000 c350e600 c1d99400
[   80.677586] 9d40: c38c3ec0 c06c4c45 c06c4c35 00000014 c1de9840 c067ffc5 c38c3ec0 00000000
[   80.688949] 9d60: 00000000 7465f854 c1de9840 c0698f71 c0698f71 c0dbcfb0 00000000 c069c493
[   80.700343] 9d80: 00000000 7465f854 c3bc60c0 c1d99400 00000000 00000000 00000000 c38c3ec0
[   80.711744] 9da0: c1d99400 00000000 c3bc66c0 00000000 c1c06c54 00000058 4321fedc c0680ca5
[   80.723146] 9dc0: 00000000 7465f854 00000000 c0ab622b 00000000 c1c06c10 00000000 00000000
[   80.734573] 9de0: 00000000 c0ab622b 00000000 c1c06c10 00000000 00000000 00000000 7465f854
[   80.746010] 9e00: c1c466f0 c38c3ec0 00000008 c06ad727 c1d99400 00000000 c1c06c10 c17f01ac
[   80.757468] 9e20: c17a0018 c06ad78d c1a7b200 00000017 0000000b 00000000 00000000 00000000
[   80.768964] 9e40: c1dea868 c1d99504 00000000 7465f854 c1c06c14 c1c06c14 c172b6d0 c06d80cf
[   80.780459] 9e60: c1a7b200 c17a0f4c 00000000 c161357c fee1dead 00000000 c1a7b200 c013e66f
[   80.791939] 9e80: c1a7b200 c013e7fd 00000000 00000000 00000000 00000000 00000000 00000000
[   80.803406] 9ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.814873] 9ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.826316] 9ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.837678] 9f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.849011] 9f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.860286] 9f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.871477] 9f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   80.882646] 9f80: 00000000 00000000 00000000 7465f854 00000000 00000000 00000003 00000058
[   80.893755] 9fa0: c01002a0 c0100061 00000000 00000000 fee1dead 28121969 4321fedc 00000000
[   80.904935] 9fc0: 00000000 00000000 00000003 00000058 bef22d44 00000000 bef22a9c 4321fedc
[   80.916090] 9fe0: 00000058 bef229ec b6c70c55 b6be0656 60000030 fee1dead 00000000 00000000
[   80.927251] Call trace: 
[   80.927270]  drm_match_cea_mode from drm_default_rgb_quant_range+0xd/0x18
[   80.942505]  drm_default_rgb_quant_range from drm_atomic_helper_connector_hdmi_check+0x67/0x520
[   80.954267]  drm_atomic_helper_connector_hdmi_check from drm_atomic_helper_check_modeset+0x363/0x974
[   80.966483]  drm_atomic_helper_check_modeset from sun4i_de_atomic_check+0x11/0x2c
[   80.977035]  sun4i_de_atomic_check from drm_atomic_check_only+0x471/0x730
[   80.986897]  drm_atomic_check_only from drm_atomic_commit+0x61/0xac
[   80.996205]  drm_atomic_commit from drm_atomic_helper_disable_all+0x127/0x130
[   81.006385]  drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x5d/0xd0
[   81.017192]  drm_atomic_helper_shutdown from device_shutdown+0xcf/0x174
[   81.026851]  device_shutdown from kernel_power_off+0x2f/0x60
[   81.035541]  kernel_power_off from __do_sys_reboot+0x15d/0x18c
[   81.044367]  __do_sys_reboot from ret_fast_syscall+0x1/0x5c
[   81.052908] Exception stack(0xf0819fa8 to 0xf0819ff0)
[   81.060899] 9fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
[   81.072085] 9fc0: 00000000 00000000 00000003 00000058 bef22d44 00000000 bef22a9c 4321fedc
[   81.083257] 9fe0: 00000058 bef229ec b6c70c55 b6be0656
[   81.091295] Code: 25a8 921d f04f 0200 (6803) 4605 
[   81.099305] ---[ end trace 0000000000000000 ]---
[   81.107011] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[   81.117724] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-- 
Michael
