Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA0099290D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 12:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280B10E365;
	Mon,  7 Oct 2024 10:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kr4jNoQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6842310E365
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 10:21:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fada911953so49775281fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 03:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728296498; x=1728901298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42VI+/VqIwVfuu0I3eZ6zIr2bxJZcgc94pI3kbkx00Q=;
 b=Kr4jNoQhwKXPosZAzE7EYy7M4uLaRKLCoe3xjTmX5XDAT2H118ahIUwafRj3qx1zF1
 U61PBoX3DvIwloPaSfPLW4upXOOvjj4/NSGfFqecLLv0Emp7h0daXwa51fVxSnHGNWKZ
 UWyReJIUZUgEa47N50Jy8LCdZxKSsVp35+6OQGTlgEo/RVOhs/L/ieXnCQ0G20ww8YM5
 GZinhABbNxUMIYOqKupqVddDA2JTdkjXKgLsTA6TnnXA2CYHKFxHPeqhCOMjBi4uAtw6
 DY3rzpoTVwePrFFZdadI7s7KM70QNEoKkdp0sS4TSwZg8UR3bUqrZgGAmi1TV1ux1Al9
 f8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728296498; x=1728901298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42VI+/VqIwVfuu0I3eZ6zIr2bxJZcgc94pI3kbkx00Q=;
 b=XFxQa5vu/LdIHBIIPy3zhuJxZvyUdlgNmlRrxpPK7pZ6RVT5IBG/N6gKF13EUGSj8b
 cvUA7jz3EA/JswpFSvveizG4rmAGzgNztszKEYEQUuPXqhnQ2S0aMoIQEAw3oA+Kz+tG
 6yp6Pww8TJgnqKq6uDeAhq5Ky/RKhJBBHQzIm5zkm860/4y/IpneuXg+KyUIxMUxOfd+
 9PMErRENwZSLAJDRqIj+EOYExJrZmQTBOb8j0ZWgrv6KZkzWLmEZMvyefCZ9CPO0HR8H
 0Cm/DTOu3Gvw07jIA8UWQbioRM12TV7Fg+YKGn/Y9/LiVkC6oQJQevTORvZBwIMzLRdq
 6YAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfRvCnFDr6S57jHMuzafas6msv2h/XOnKnwCCiGyTVfZ7UcsDswzRwVoT6XeCCASduaE8Kep/2A64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygSURido7+8dCdzo8uksk1H2WaBOBam/6qymdnDj4VxqxrP0y1
 Cj8zSIikeTYPRMHrVVx0nIg15pD8ie1sE2crxL8DzNuawDYqCXfBCV3rBNZgFVFr79Kt0Wbbdmc
 O5EPZ/EXtYgLwZ/jjWB8Zwm4Mu7W4DgqkJI110A==
X-Google-Smtp-Source: AGHT+IHlMfA/pcWv2+DY9iQvFy/My+z3wfF73pL3P5IaEuYxJ3RSQTNXxxl8wziWzlqxsxegJhC+HlVXy29H0n3c1NA=
X-Received: by 2002:a2e:a552:0:b0:2f7:5900:1a37 with SMTP id
 38308e7fff4ca-2faea25332amr46441421fa.17.1728296498430; Mon, 07 Oct 2024
 03:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <ZwLNuZL-8Gh5UUQb@robin>
In-Reply-To: <ZwLNuZL-8Gh5UUQb@robin>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Oct 2024 12:21:26 +0200
Message-ID: <CACRpkdayPwv3QZka0V48S63CVf1XOwRVWJ4gjJRzhv_7J089Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-dma: Only cleanup deferred I/O if necessary
To: Janne Grunau <j@jannau.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Oct 6, 2024 at 7:49=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> Commit 5a498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if
> necessary") initializes deferred I/O only if it is used.
> drm_fbdev_dma_fb_destroy() however calls fb_deferred_io_cleanup()
> unconditionally with struct fb_info.fbdefio =3D=3D NULL. KASAN with the
> out-of-tree Apple silicon display driver posts following warning from
> __flush_work() of a random struct work_struct instead of the expected
> NULL pointer derefs.
>
> [   22.053799] ------------[ cut here ]------------
> [   22.054832] WARNING: CPU: 2 PID: 1 at kernel/workqueue.c:4177 __flush_=
work+0x4d8/0x580
> [   22.056597] Modules linked in: uhid bnep uinput nls_ascii ip6_tables i=
p_tables i2c_dev loop fuse dm_multipath nfnetlink zram hid_magicmouse btrfs=
 xor xor_neon brcmfmac_wcc raid6_pq hci_bcm4377 bluetooth brcmfmac hid_appl=
e brcmutil nvmem_spmi_mfd simple_mfd_spmi dockchannel_hid cfg80211 joydev r=
egmap_spmi nvme_apple ecdh_generic ecc macsmc_hid rfkill dwc3 appledrm snd_=
soc_macaudio macsmc_power nvme_core apple_isp phy_apple_atc apple_sart appl=
e_rtkit_helper apple_dockchannel tps6598x macsmc_hwmon snd_soc_cs42l84 vide=
obuf2_v4l2 spmi_apple_controller nvmem_apple_efuses videobuf2_dma_sg apple_=
z2 videobuf2_memops spi_nor panel_summit videobuf2_common asahi videodev pw=
m_apple apple_dcp snd_soc_apple_mca apple_admac spi_apple clk_apple_nco i2c=
_pasemi_platform snd_pcm_dmaengine mc i2c_pasemi_core mux_core ofpart adpdr=
m drm_dma_helper apple_dart apple_soc_cpufreq leds_pwm phram
> [   22.073768] CPU: 2 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted 6.1=
1.2-asahi+ #asahi-dev
> [   22.075612] Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
> [   22.077032] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [   22.078567] pc : __flush_work+0x4d8/0x580
> [   22.079471] lr : __flush_work+0x54/0x580
> [   22.080345] sp : ffffc000836ef820
> [   22.081089] x29: ffffc000836ef880 x28: 0000000000000000 x27: ffff80002=
ddb7128
> [   22.082678] x26: dfffc00000000000 x25: 1ffff000096f0c57 x24: ffffc0008=
2d3e358
> [   22.084263] x23: ffff80004b7862b8 x22: dfffc00000000000 x21: ffff80005=
aa1d470
> [   22.085855] x20: ffff80004b786000 x19: ffff80004b7862a0 x18: 000000000=
0000000
> [   22.087439] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000005
> [   22.089030] x14: 1ffff800106ddf0a x13: 0000000000000000 x12: 000000000=
0000000
> [   22.090618] x11: ffffb800106ddf0f x10: dfffc00000000000 x9 : 1ffff8001=
06ddf0e
> [   22.092206] x8 : 0000000000000000 x7 : aaaaaaaaaaaaaaaa x6 : 000000000=
0000001
> [   22.093790] x5 : ffffc000836ef728 x4 : 0000000000000000 x3 : 000000000=
0000020
> [   22.095368] x2 : 0000000000000008 x1 : 00000000000000aa x0 : 000000000=
0000000
> [   22.096955] Call trace:
> [   22.097505]  __flush_work+0x4d8/0x580
> [   22.098330]  flush_delayed_work+0x80/0xb8
> [   22.099231]  fb_deferred_io_cleanup+0x3c/0x130
> [   22.100217]  drm_fbdev_dma_fb_destroy+0x6c/0xe0 [drm_dma_helper]
> [   22.101559]  unregister_framebuffer+0x210/0x2f0
> [   22.102575]  drm_fb_helper_unregister_info+0x48/0x60
> [   22.103683]  drm_fbdev_dma_client_unregister+0x4c/0x80 [drm_dma_helper=
]
> [   22.105147]  drm_client_dev_unregister+0x1cc/0x230
> [   22.106217]  drm_dev_unregister+0x58/0x570
> [   22.107125]  apple_drm_unbind+0x50/0x98 [appledrm]
> [   22.108199]  component_del+0x1f8/0x3a8
> [   22.109042]  dcp_platform_shutdown+0x24/0x38 [apple_dcp]
> [   22.110357]  platform_shutdown+0x70/0x90
> [   22.111219]  device_shutdown+0x368/0x4d8
> [   22.112095]  kernel_restart+0x6c/0x1d0
> [   22.112946]  __arm64_sys_reboot+0x1c8/0x328
> [   22.113868]  invoke_syscall+0x78/0x1a8
> [   22.114703]  do_el0_svc+0x124/0x1a0
> [   22.115498]  el0_svc+0x3c/0xe0
> [   22.116181]  el0t_64_sync_handler+0x70/0xc0
> [   22.117110]  el0t_64_sync+0x190/0x198
> [   22.117931] ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Fixes: 5a498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if necessa=
ry")

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
