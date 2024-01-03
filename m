Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E5822B73
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD83510E29E;
	Wed,  3 Jan 2024 10:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DFD10E0B4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 09:11:13 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7ba87489f97so503833339f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704273072; x=1704877872;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j8yaR7nnBqzwfKWJCMQi/KLItTCorDmakCrLrvMisBA=;
 b=GYs7bWUO1REK0/G+fdF8hbx40sJhnrnDcfEVNs+bb6C6ghl4Q71bLTeDT7lkQsCEVg
 U/l1EgIhAa3xUQjmAXkY9rIUQUAPbGdWqd97U/T9EA6IkKyPeBg1RmbTDguVUrOoxDHa
 oiWFoQPRb2QtmkgdihH9kxY+rVVKX53D45GdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704273072; x=1704877872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j8yaR7nnBqzwfKWJCMQi/KLItTCorDmakCrLrvMisBA=;
 b=TRF7X/FUvRCqOfZaIwndXv9YuhKNhXprKoTO47mL4/RjKsHHPxfoBHGlSPuNCBmPAI
 2izfxgPnaNhtjlW3XmMR2oshWcn9UhQbmwB+JA7d9dyS3B0Tl+2FhiySgL3JHkkhMt2n
 S6Rk5MDvPCg91uABlk5dgq1jzHJic16cIrMIlfpLyS4VRhDDqM4QOcUxHoozhT9I4NvF
 PPnXpuJSP6soc2or1KNlN9IbYhRndcu/KsR6YiCgnO6DAxEjHezoFqUUOe2EdC/CsWRh
 I0wj4hQnpq8cDaZu2Avm6eh3Yibc+t50S4cJ+mNTZ8lspld3szZbDmXtYbVAQwqL/PTJ
 bUag==
X-Gm-Message-State: AOJu0YxoE9x2qcaUpfdVDW0d6Ol+k6Y0/1cWFlUqziKJu2HrZbmQIU1c
 WyQgGcLXYAnUJpeRD0t5ErKMMCveZBnpz6uUykb6XbnWCbpI
X-Google-Smtp-Source: AGHT+IF2mHqGmvX5Hrz+8TVYIqRZyjxCsM+QzxtgoFkfmCVrjefsjmHw+biEGRR1qA9fiTcpBDt5Gh1F5PuaZqEuPg4=
X-Received: by 2002:a5e:da4d:0:b0:7bb:b3f9:3f39 with SMTP id
 o13-20020a5eda4d000000b007bbb3f93f39mr3305898iop.15.1704273072186; Wed, 03
 Jan 2024 01:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20231224052540.605040-1-zack.rusin@broadcom.com>
In-Reply-To: <20231224052540.605040-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Wed, 3 Jan 2024 11:11:01 +0200
Message-ID: <CAKLwHdX0zaqzgYd2oo3dr3fErOQ2RQ6UY+VcyErrz2DVB3UHDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Unmap the surface before resetting it on a
 plane state
To: Zack Rusin <zack.rusin@broadcom.com>
Content-Type: multipart/alternative; boundary="000000000000119548060e06ffd7"
X-Mailman-Approved-At: Wed, 03 Jan 2024 10:34:42 +0000
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Ian Forbes <ian.forbes@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Stefan Hoffmeister <stefan.hoffmeister@econos.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000119548060e06ffd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great catch! That was a nasty one.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Sun, Dec 24, 2023 at 7:29=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:

> Switch to a new plane state requires unreferencing of all held surfaces.
> In the work required for mob cursors the mapped surfaces started being
> cached but the variable indicating whether the surface is currently
> mapped was not being reset. This leads to crashes as the duplicated
> state, incorrectly, indicates the that surface is mapped even when
> no surface is present. That's because after unreferencing the surface
> it's perfectly possible for the plane to be backed by a bo instead of a
> surface.
>
> Reset the surface mapped flag when unreferencing the plane state surface
> to fix null derefs in cleanup. Fixes crashes in KDE KWin 6.0 on Wayland:
>
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 4 PID: 2533 Comm: kwin_wayland Not tainted 6.7.0-rc3-vmwgfx #2
> Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop
> Reference Platform, BIOS 6.00 11/12/2020
> RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
> Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 0=
0
> 48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 <48> 8b 78 28 e8
> e3 f>
> RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600
> RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920
> R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000
> R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00
> FS:  00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0
> Call Trace:
>  <TASK>
>  ? __die+0x23/0x70
>  ? page_fault_oops+0x171/0x4e0
>  ? exc_page_fault+0x7f/0x180
>  ? asm_exc_page_fault+0x26/0x30
>  ? vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
>  drm_atomic_helper_cleanup_planes+0x9b/0xc0
>  commit_tail+0xd1/0x130
>  drm_atomic_helper_commit+0x11a/0x140
>  drm_atomic_commit+0x97/0xd0
>  ? __pfx___drm_printfn_info+0x10/0x10
>  drm_atomic_helper_update_plane+0xf5/0x160
>  drm_mode_cursor_universal+0x10e/0x270
>  drm_mode_cursor_common+0x102/0x230
>  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10
>  drm_ioctl_kernel+0xb2/0x110
>  drm_ioctl+0x26d/0x4b0
>  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10
>  ? __pfx_drm_ioctl+0x10/0x10
>  vmw_generic_ioctl+0xa4/0x110 [vmwgfx]
>  __x64_sys_ioctl+0x94/0xd0
>  do_syscall_64+0x61/0xe0
>  ? __x64_sys_ioctl+0xaf/0xd0
>  ? syscall_exit_to_user_mode+0x2b/0x40
>  ? do_syscall_64+0x70/0xe0
>  ? __x64_sys_ioctl+0xaf/0xd0
>  ? syscall_exit_to_user_mode+0x2b/0x40
>  ? do_syscall_64+0x70/0xe0
>  ? exc_page_fault+0x7f/0x180
>  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> RIP: 0033:0x7f1e93f279ed
> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 0=
0
> 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0
> ff f>
> RSP: 002b:00007ffca0faf600 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 000055db876ed2c0 RCX: 00007f1e93f279ed
> RDX: 00007ffca0faf6c0 RSI: 00000000c02464bb RDI: 0000000000000015
> RBP: 00007ffca0faf650 R08: 000055db87184010 R09: 0000000000000007
> R10: 000055db886471a0 R11: 0000000000000246 R12: 00007ffca0faf6c0
> R13: 00000000c02464bb R14: 0000000000000015 R15: 00007ffca0faf790
>  </TASK>
> Modules linked in: snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns
> nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
> nft_reject_ine>
> CR2: 0000000000000028
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
> Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 0=
0
> 48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 <48> 8b 78 28 e8
> e3 f>
> RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600
> RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920
> R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000
> R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00
> FS:  00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and
> CursorBypass 4")
> Reported-by: Stefan Hoffmeister <stefan.hoffmeister@econos.de>
> Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/34
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Ian Forbes <ian.forbes@broadcom.com>
> Cc: Broadcom internal kernel review list <
> bcm-kernel-feedback-list@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.19+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 65ed9b061753..e7bbe4b05233 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -693,6 +693,10 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane
> *plane,
>         int ret =3D 0;
>
>         if (vps->surf) {
> +               if (vps->surf_mapped) {
> +                       vmw_bo_unmap(vps->surf->res.guest_memory_bo);
> +                       vps->surf_mapped =3D false;
> +               }
>                 vmw_surface_unreference(&vps->surf);
>                 vps->surf =3D NULL;
>         }
> --
> 2.40.1
>
>

--000000000000119548060e06ffd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great catch! That was a nasty one.<br><div><br>Reviewed-by=
: Martin Krastev &lt;<a href=3D"mailto:martin.krastev@broadcom.com">martin.=
krastev@broadcom.com</a>&gt;</div><div><br></div><div>Regards,</div><div>Ma=
rtin<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Dec 24, 2023 at 7:29=E2=80=AFAM Zack Rusin &lt;<a h=
ref=3D"mailto:zack.rusin@broadcom.com">zack.rusin@broadcom.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Switch to a n=
ew plane state requires unreferencing of all held surfaces.<br>
In the work required for mob cursors the mapped surfaces started being<br>
cached but the variable indicating whether the surface is currently<br>
mapped was not being reset. This leads to crashes as the duplicated<br>
state, incorrectly, indicates the that surface is mapped even when<br>
no surface is present. That&#39;s because after unreferencing the surface<b=
r>
it&#39;s perfectly possible for the plane to be backed by a bo instead of a=
<br>
surface.<br>
<br>
Reset the surface mapped flag when unreferencing the plane state surface<br=
>
to fix null derefs in cleanup. Fixes crashes in KDE KWin 6.0 on Wayland:<br=
>
<br>
Oops: 0000 [#1] PREEMPT SMP PTI<br>
CPU: 4 PID: 2533 Comm: kwin_wayland Not tainted 6.7.0-rc3-vmwgfx #2<br>
Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference=
 Platform, BIOS 6.00 11/12/2020<br>
RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]<br>
Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 00 =
48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 &lt;48&gt; 8b 78 2=
8 e8 e3 f&gt;<br>
RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246<br>
RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027<br>
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600<br>
RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920<br>
R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000<br>
R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00<br>
FS:=C2=A0 00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000) knlGS:0000000000=
000000<br>
CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>
CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0<br>
Call Trace:<br>
=C2=A0&lt;TASK&gt;<br>
=C2=A0? __die+0x23/0x70<br>
=C2=A0? page_fault_oops+0x171/0x4e0<br>
=C2=A0? exc_page_fault+0x7f/0x180<br>
=C2=A0? asm_exc_page_fault+0x26/0x30<br>
=C2=A0? vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]<br>
=C2=A0drm_atomic_helper_cleanup_planes+0x9b/0xc0<br>
=C2=A0commit_tail+0xd1/0x130<br>
=C2=A0drm_atomic_helper_commit+0x11a/0x140<br>
=C2=A0drm_atomic_commit+0x97/0xd0<br>
=C2=A0? __pfx___drm_printfn_info+0x10/0x10<br>
=C2=A0drm_atomic_helper_update_plane+0xf5/0x160<br>
=C2=A0drm_mode_cursor_universal+0x10e/0x270<br>
=C2=A0drm_mode_cursor_common+0x102/0x230<br>
=C2=A0? __pfx_drm_mode_cursor2_ioctl+0x10/0x10<br>
=C2=A0drm_ioctl_kernel+0xb2/0x110<br>
=C2=A0drm_ioctl+0x26d/0x4b0<br>
=C2=A0? __pfx_drm_mode_cursor2_ioctl+0x10/0x10<br>
=C2=A0? __pfx_drm_ioctl+0x10/0x10<br>
=C2=A0vmw_generic_ioctl+0xa4/0x110 [vmwgfx]<br>
=C2=A0__x64_sys_ioctl+0x94/0xd0<br>
=C2=A0do_syscall_64+0x61/0xe0<br>
=C2=A0? __x64_sys_ioctl+0xaf/0xd0<br>
=C2=A0? syscall_exit_to_user_mode+0x2b/0x40<br>
=C2=A0? do_syscall_64+0x70/0xe0<br>
=C2=A0? __x64_sys_ioctl+0xaf/0xd0<br>
=C2=A0? syscall_exit_to_user_mode+0x2b/0x40<br>
=C2=A0? do_syscall_64+0x70/0xe0<br>
=C2=A0? exc_page_fault+0x7f/0x180<br>
=C2=A0entry_SYSCALL_64_after_hwframe+0x6e/0x76<br>
RIP: 0033:0x7f1e93f279ed<br>
Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 =
48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 &lt;89&gt; c2 3d 0=
0 f0 ff f&gt;<br>
RSP: 002b:00007ffca0faf600 EFLAGS: 00000246 ORIG_RAX: 0000000000000010<br>
RAX: ffffffffffffffda RBX: 000055db876ed2c0 RCX: 00007f1e93f279ed<br>
RDX: 00007ffca0faf6c0 RSI: 00000000c02464bb RDI: 0000000000000015<br>
RBP: 00007ffca0faf650 R08: 000055db87184010 R09: 0000000000000007<br>
R10: 000055db886471a0 R11: 0000000000000246 R12: 00007ffca0faf6c0<br>
R13: 00000000c02464bb R14: 0000000000000015 R15: 00007ffca0faf790<br>
=C2=A0&lt;/TASK&gt;<br>
Modules linked in: snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns nf_con=
ntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_=
ine&gt;<br>
CR2: 0000000000000028<br>
---[ end trace 0000000000000000 ]---<br>
RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]<br>
Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 00 =
48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 &lt;48&gt; 8b 78 2=
8 e8 e3 f&gt;<br>
RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246<br>
RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027<br>
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600<br>
RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920<br>
R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000<br>
R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00<br>
FS:=C2=A0 00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000) knlGS:0000000000=
000000<br>
CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>
CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0<br>
<br>
Signed-off-by: Zack Rusin &lt;<a href=3D"mailto:zack.rusin@broadcom.com" ta=
rget=3D"_blank">zack.rusin@broadcom.com</a>&gt;<br>
Fixes: 485d98d472d5 (&quot;drm/vmwgfx: Add support for CursorMob and Cursor=
Bypass 4&quot;)<br>
Reported-by: Stefan Hoffmeister &lt;<a href=3D"mailto:stefan.hoffmeister@ec=
onos.de" target=3D"_blank">stefan.hoffmeister@econos.de</a>&gt;<br>
Closes: <a href=3D"https://gitlab.freedesktop.org/drm/misc/-/issues/34" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/misc/-=
/issues/34</a><br>
Cc: Martin Krastev &lt;<a href=3D"mailto:martin.krastev@broadcom.com" targe=
t=3D"_blank">martin.krastev@broadcom.com</a>&gt;<br>
Cc: Maaz Mombasawala &lt;<a href=3D"mailto:maaz.mombasawala@broadcom.com" t=
arget=3D"_blank">maaz.mombasawala@broadcom.com</a>&gt;<br>
Cc: Ian Forbes &lt;<a href=3D"mailto:ian.forbes@broadcom.com" target=3D"_bl=
ank">ian.forbes@broadcom.com</a>&gt;<br>
Cc: Broadcom internal kernel review list &lt;<a href=3D"mailto:bcm-kernel-f=
eedback-list@broadcom.com" target=3D"_blank">bcm-kernel-feedback-list@broad=
com.com</a>&gt;<br>
Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dr=
i-devel@lists.freedesktop.org</a><br>
Cc: &lt;<a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@=
vger.kernel.org</a>&gt; # v5.19+<br>
---<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/v=
mwgfx_kms.c<br>
index 65ed9b061753..e7bbe4b05233 100644<br>
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c<br>
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c<br>
@@ -693,6 +693,10 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vps-&gt;surf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vps-&gt;surf_ma=
pped) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vmw_bo_unmap(vps-&gt;surf-&gt;res.guest_memory_bo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vps-&gt;surf_mapped =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmw_surface_unrefer=
ence(&amp;vps-&gt;surf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vps-&gt;surf =3D NU=
LL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.40.1<br>
<br>
</blockquote></div>

--000000000000119548060e06ffd7--
