Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811695AE8BB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 14:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017810E655;
	Tue,  6 Sep 2022 12:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BA910E65B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 12:50:56 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id c198so1407863pfc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pIsthsU1/BjjIJXfCUPOariONLnpNy0n0ke42n9PRpQ=;
 b=i+OQ/0fxRzGRIYqR0hllTsfxwv1VAo0IHvX94q67EhwQPVJg07NELYOX08GrkgGW1A
 8A5/QMVqbB4RRGCdX72wa3ySHaDxrWGcq4MSyMgu583CmUERRItvW912fEmuQDky6adT
 uGzDAZerXnoIyS1FJfp61Ob8TV2VPV+0LeBU8R6bLZWLaK0QkiDAFoZwBfsiB/8iXmrO
 tWOWzhiAcXkgETN+fWYo28eYbWnmhbb+z1Dg7MI5KpUD44G7sHa8HLyO4U8IvVtHXQr+
 82jmPe1+MTVNm0mbS32wIfiwMmmwflg+owrXl6e+ZLNO4fPKm0+AEK1eXzCKoGbo1q+V
 5apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pIsthsU1/BjjIJXfCUPOariONLnpNy0n0ke42n9PRpQ=;
 b=vONwPoiZ+R+c0t3Z5M2aUyUdovsngpZ36H8ulXOxtSqLByh5zyRzm2BzPCdyKBH+ht
 n+X9VLHTYSj95llIEDZesLr+tgr0Ir424AFuQXWAyU4kY22/Qyj3IlTDZ+yBg0UrMHiK
 mHQQjXsmLtZwEHbvDC8FNBBLpJUa9QH9LjOOTzW0cXA4zNgslGe4FDQ4EoPqigi5/TAE
 gfjdgglAkb2hfTqind0M8sbYmWGF2AxeUj9fjCatx9jSFpJ54e8/+ymiqivSlaFVvGqm
 F0zAtrJAOrv0QcPE7//mL2pYg9t7vF2/bSY2Hmhnx7RMSPCgTV28PWlItMTCsT2ACsTx
 8kkg==
X-Gm-Message-State: ACgBeo04x9eBl2hZWvromvKd7ww0lrkIL8UREUfJCp5uBUiVi8TWcZB3
 hq62VA+K8SHOAwCGbksXXLAeYCaM8XLrevL1jOE=
X-Google-Smtp-Source: AA6agR76EOcZdZnldbn/nhwWNmyxTS3mv7s7Gj8gLyVJQP23lPxofAiMWEiWXBNl9LiCLxoyFjKss2xw5+xrqEQujQc=
X-Received: by 2002:a05:6a00:16c4:b0:535:890:d52 with SMTP id
 l4-20020a056a0016c400b0053508900d52mr55380671pfc.9.1662468655738; Tue, 06 Sep
 2022 05:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220905133738.466490-1-hdegoede@redhat.com>
 <20220905133738.466490-2-hdegoede@redhat.com>
In-Reply-To: <20220905133738.466490-2-hdegoede@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 6 Sep 2022 14:50:44 +0200
Message-ID: <CAMeQTsYi34r9Cv2Jp=DtOyjh6xex9xb49nFpw93eiinp7wHz2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/gma500: Fix BUG: sleeping function called from
 invalid context errors
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 3:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> gma_crtc_page_flip() was holding the event_lock spinlock while calling
> crtc_funcs->mode_set_base() which takes ww_mutex.
>
> The only reason to hold event_lock is to clear gma_crtc->page_flip_event
> on mode_set_base() errors.
>
> Instead unlock it after setting gma_crtc->page_flip_event and on
> errors re-take the lock and clear gma_crtc->page_flip_event it
> it is still set.

Hi Hans, thanks for having a look at gma500.

See comments below.

>
> This fixes the following WARN/stacktrace:
>
> [  512.122953] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:870
> [  512.123004] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1253, name: gnome-shell
> [  512.123031] preempt_count: 1, expected: 0
> [  512.123048] RCU nest depth: 0, expected: 0
> [  512.123066] INFO: lockdep is turned off.
> [  512.123080] irq event stamp: 0
> [  512.123094] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [  512.123134] hardirqs last disabled at (0): [<ffffffff8d0ec28c>] copy_process+0x9fc/0x1de0
> [  512.123176] softirqs last  enabled at (0): [<ffffffff8d0ec28c>] copy_process+0x9fc/0x1de0
> [  512.123207] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [  512.123233] Preemption disabled at:
> [  512.123241] [<0000000000000000>] 0x0
> [  512.123275] CPU: 3 PID: 1253 Comm: gnome-shell Tainted: G        W         5.19.0+ #1
> [  512.123304] Hardware name: Packard Bell dot s/SJE01_CT, BIOS V1.10 07/23/2013
> [  512.123323] Call Trace:
> [  512.123346]  <TASK>
> [  512.123370]  dump_stack_lvl+0x5b/0x77
> [  512.123412]  __might_resched.cold+0xff/0x13a
> [  512.123458]  ww_mutex_lock+0x1e/0xa0
> [  512.123495]  psb_gem_pin+0x2c/0x150 [gma500_gfx]
> [  512.123601]  gma_pipe_set_base+0x76/0x240 [gma500_gfx]
> [  512.123708]  gma_crtc_page_flip+0x95/0x130 [gma500_gfx]
> [  512.123808]  drm_mode_page_flip_ioctl+0x57d/0x5d0
> [  512.123897]  ? drm_mode_cursor2_ioctl+0x10/0x10
> [  512.123936]  drm_ioctl_kernel+0xa1/0x150
> [  512.123984]  drm_ioctl+0x21f/0x420
> [  512.124025]  ? drm_mode_cursor2_ioctl+0x10/0x10
> [  512.124070]  ? rcu_read_lock_bh_held+0xb/0x60
> [  512.124104]  ? lock_release+0x1ef/0x2d0
> [  512.124161]  __x64_sys_ioctl+0x8d/0xd0
> [  512.124203]  do_syscall_64+0x58/0x80
> [  512.124239]  ? do_syscall_64+0x67/0x80
> [  512.124267]  ? trace_hardirqs_on_prepare+0x55/0xe0
> [  512.124300]  ? do_syscall_64+0x67/0x80
> [  512.124340]  ? rcu_read_lock_sched_held+0x10/0x80
> [  512.124377]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [  512.124411] RIP: 0033:0x7fcc4a70740f
> [  512.124442] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  512.124470] RSP: 002b:00007ffda73f5390 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  512.124503] RAX: ffffffffffffffda RBX: 000055cc9e474500 RCX: 00007fcc4a70740f
> [  512.124524] RDX: 00007ffda73f5420 RSI: 00000000c01864b0 RDI: 0000000000000009
> [  512.124544] RBP: 00007ffda73f5420 R08: 000055cc9c0b0cb0 R09: 0000000000000034
> [  512.124564] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c01864b0
> [  512.124584] R13: 0000000000000009 R14: 000055cc9df484d0 R15: 000055cc9af5d0c0
> [  512.124647]  </TASK>
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/gma500/gma_display.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index bd40c040a2c9..cf038e322164 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -532,15 +532,19 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
>                 WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>
>                 gma_crtc->page_flip_event = event;
> +               spin_unlock_irqrestore(&dev->event_lock, flags);
>
>                 /* Call this locked if we want an event at vblank interrupt. */

If we don't hold the event_lock around mode_set_base() we could
potentially get a vblank before we do the modeset. That would send the
event prematurely. I think this is what the comment tries to tell us.

-Patrik

>                 ret = crtc_funcs->mode_set_base(crtc, crtc->x, crtc->y, old_fb);
>                 if (ret) {
> -                       gma_crtc->page_flip_event = NULL;
> -                       drm_crtc_vblank_put(crtc);
> +                       spin_lock_irqsave(&dev->event_lock, flags);
> +                       if (gma_crtc->page_flip_event) {
> +                               gma_crtc->page_flip_event = NULL;
> +                               drm_crtc_vblank_put(crtc);
> +                       }
> +                       spin_unlock_irqrestore(&dev->event_lock, flags);
>                 }
>
> -               spin_unlock_irqrestore(&dev->event_lock, flags);
>         } else {
>                 ret = crtc_funcs->mode_set_base(crtc, crtc->x, crtc->y, old_fb);
>         }
> --
> 2.36.1
>
