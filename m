Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A4D01A83
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2310E6AA;
	Thu,  8 Jan 2026 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6525710E6A6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:51:59 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-55b302b8369so1969683e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862318; x=1768467118;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMmmgiMrP7PykuOoZT5Ct8AU80Hz1S68kZySKKagG2w=;
 b=MyhND5pmObgO9fKQ7AszF/0ZedqoNoqhnJIBNKrZn3wnGZTsw1scdDGKS5PC/oLeHf
 AiDY4iLHdkQZ0mLfgLwqhuHRpwWAE6mu1dN9d/9iboeTbvrqYrZ8ioK8ZDpwAOi9jDeq
 rTQvFiO5GJSs0feT6sxQ9UMT0p4CKwz3RQ0FXctqU9fPhLHVAuGOh2wKxJ4wrSHE7LwQ
 3+AaVz4lq+NB0it9T6M7fP2s5CKsO3GuzD/8uszvFaps3TnC1qzgJxcERVCWZcBEmJYb
 Cfw6FrHBJCQr/7gWc2XK8JWtWL+nHh/kaKZoGtX4UUrNKv0bSoaanosvggO5b0QlGWZy
 G6lA==
X-Gm-Message-State: AOJu0YyE5SF3HH2ctEvv1R9b6U4iL6NbtettLY95WTz2KR2ADylklwBO
 Dmk2cCcHQRrFOJU3DJijJvcMmodKsT9BOzseGKa3WswSXZoYYciyytPxPzAt6KoN
X-Gm-Gg: AY/fxX7VX87ifQ0ln46tOpwUOKE55C5AeNcLGycD0gIFWBaKQszFwmXHkCtYa6wSD16
 /PYIlyCqBwiks8EPGfkHnHLkPFPzmDJqxwWsowDqU9AlkItUr+QFf2TbjgrMzQ/2rbm5nakwEol
 8by1sydVA7gpBTTulFcW9H8HFeDvp9fg5ivNZxHUb/djZFd2HoscvsYEw8uX4WCXuesNj+uGQFS
 1uH//51z+vZNPv2+a5UnE5OAh8Dckk9PSF2VDDp3DpViNIcM0Wb8DMhoFcPXdUQyqwq9JzTaaIh
 SYQLwSTpW1ISmte9fGR/6JsVq9dxCr1yzYLml1uyQBV3Ol7a7cDPn8jRImH4KuYYDksjRrTNeoo
 IsEKctUp92Dm5l+m5fwR+EqilWarEe7wZRWzX1pIidpaycWY2X+uLvGwAp2Qepft3VcAP+cJyrL
 FGMoDNYR6cEt0Je3vn/YGDMuT8YvL5jDFptGhO0IVxt+2uBmUe
X-Google-Smtp-Source: AGHT+IHlRtEFax7XTcnadNNP5jlkIHWMyDFZ1f7F1+sm3WpT4Lg4FPMSPnSGpE9epsNuX0+XpX0u2w==
X-Received: by 2002:a05:6122:31a6:b0:55b:6b20:a17a with SMTP id
 71dfb90a1353d-56347e96ac2mr1926275e0c.9.1767862318232; 
 Thu, 08 Jan 2026 00:51:58 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5633a414242sm5404908e0c.16.2026.01.08.00.51.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 00:51:57 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-93f5667f944so1799844241.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:51:57 -0800 (PST)
X-Received: by 2002:a05:6102:c0b:b0:5db:fce3:af72 with SMTP id
 ada2fe7eead31-5ecb1eadbd9mr2251987137.11.1767862317065; Thu, 08 Jan 2026
 00:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
In-Reply-To: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 09:51:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbiZUbBJp5CBNfsgcX6u1sRGpXKhutg2VP_HLspc7Sqg@mail.gmail.com>
X-Gm-Features: AQt7F2r8moIHrOkMlf_6a8GIEX9x_afn5WPax_SKTXguBO_eSWO-zKA_pd40Nf8
Message-ID: <CAMuHMdXbiZUbBJp5CBNfsgcX6u1sRGpXKhutg2VP_HLspc7Sqg@mail.gmail.com>
Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Biju Das Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Hugo,

On Wed, 7 Jan 2026 at 23:06, Hugo Villeneuve <hugo@hugovil.com> wrote:
> when issuing a reboot command, I encounter the following kernel panic:
>
> [   36.183478] SError Interrupt on CPU1, code 0x00000000be000011 -- SError
> [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> [   36.183504] Tainted: [M]=MACHINE_CHECK
> [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> [   36.183547] sp : ffff8000813db860
> [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x27: ffff000009dd7450
> [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x24: ffff800080e1f7a8
> [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x21: ffff000009dd7430
> [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x18: 00000000ffffffff
> [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000813db220
> [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x12: 00000000000009a2
> [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9 : ffff800081255bc0
> [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6 : 0000000000000000
> [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3 : 0000000000000028
> [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0 : ffff800081780000
> [   36.183652] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> [   36.183665] Tainted: [M]=MACHINE_CHECK
> [   36.183668] Hardware name: devboard1 (DT)
> [   36.183672] Call trace:
> [   36.183675]  show_stack+0x18/0x24 (C)
> [   36.183692]  dump_stack_lvl+0x34/0x8c
> [   36.183702]  dump_stack+0x18/0x24
> [   36.183708]  vpanic+0x314/0x35c
> [   36.183716]  nmi_panic+0x0/0x64
> [   36.183722]  add_taint+0x0/0xbc
> [   36.183728]  arm64_serror_panic+0x70/0x80
> [   36.183735]  do_serror+0x28/0x68
> [   36.183742]  el1h_64_error_handler+0x34/0x50
> [   36.183751]  el1h_64_error+0x6c/0x70
> [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> [   36.183792]  ili9881c_unprepare+0x38/0x88
> [   36.183802]  drm_panel_unprepare+0xbc/0x108
> [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x100
> [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2fc/0x5f8
> [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> [   36.183865]  commit_tail+0xa4/0x18c
> [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> [   36.183884]  drm_atomic_commit+0x8c/0xcc
> [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> [   36.183920]  platform_shutdown+0x24/0x34
> [   36.183931]  device_shutdown+0x128/0x284
> [   36.183938]  kernel_restart+0x44/0xa4
> [   36.183950]  __do_sys_reboot+0x178/0x270
> [   36.183959]  __arm64_sys_reboot+0x24/0x30
> [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> [   36.183979]  do_el0_svc+0x40/0xc0
> [   36.183988]  el0_svc+0x3c/0x164
> [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> [   36.184002]  el0t_64_sync+0x198/0x19c
> [   36.184020] Kernel Offset: disabled
> [   36.184022] CPU features: 0x200000,00020001,4000c501,0400720b
> [   36.184028] Memory Limit: none
> [   36.495305] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
>
> The problem is present since linux-6.18-rc1, but not in linux-6.17. I also confirm the bug is present in linux-6.19-rc4.
>
> The bug seems to be happening in rzg2l_mipi_dsi_host_transfer().
>
> After bisecting, here is the first bad commit:
>
>     commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
>
> Reverting this change makes the bug disappear.
>
> My limited understanding seems to indicate that the MIPI/DSI host may
> no longer be available/on when the panel tries to send MIPI/DSI
> commands in ili9881c_unprepare(), maybe because the MIPI/DSI clock has been stopped...

Looks like the RZ/G2L driver is missing a pm_runtime_resume_and_get()
call in the shutdown path, or calls pm_runtime_put() too early.

> The exact same board with two other panels (jd9365da and st7703) doesn't have the bug.

The drivers for these panel indeed do not make any mipi_dsi_*() calls
from their .unprepare() callbacks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
