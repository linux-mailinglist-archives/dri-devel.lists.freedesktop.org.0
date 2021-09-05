Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E09401138
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 20:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F0E89B30;
	Sun,  5 Sep 2021 18:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0BF89B30;
 Sun,  5 Sep 2021 18:51:16 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id g34so1503941vkd.11;
 Sun, 05 Sep 2021 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OFhp5qOgHpAi603N0nela2D85qEGVdFHkGLbavWDR6w=;
 b=Tn4yoeJXDQw2MDPyO5z0Pll4WYHKB9sTqXQ5s5dsFJ7CMLurgNRWfNQs9ez5KxmwEd
 hcm2va+WW9xNJy8ae/POty5VIqq8ZnM/LT7PlN34iSXsh25CUw0OPD+lKiHTn2J/0yPz
 gqUpy3kXEWZ81n+1JepzH3iovBITzmo0gaMtd2/WbJ9NobKx8kiUP+NRsmXVCJImKc+F
 WX+L1w9/JbAo+Al/KBJY4UK//84VPYNV4aI+ZjrH8YXbjMhTzToW6DvQDyA3hNyF1eWL
 rU0SgrQ2F9EtULcTk8TLE9YENUH7RKI6/XpGk861gYAFO/SdLmAn1UvwsTeG4t/cRPTF
 3Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OFhp5qOgHpAi603N0nela2D85qEGVdFHkGLbavWDR6w=;
 b=CzWZnNKJoqDq+7K70bMbufUmtShlfyeO3tffOXBjsptyPlFapfqrX4h7WhR2pbVpV3
 gx+KqTGvnDFCGcrvNivjexm4hExGBGLXLlCHdwWxPqBXyXd+YllqOLfzbbEgF6YENO9+
 MJ+xewf8ALJFmulvL4gnxuNaJcJ8A7bZjQVBJ/7OwRpW/Q91e6K7Ql8ERKdB8pQfCx9H
 qCcuGZxMApyLm0ssu/01Kvfr9mBiK8uamiuMi3eYUcxxvGH16QSvlqrR4FBj/jexMWUX
 m66MciG2EKT8PX0I8vXGJ6i/CuaqwyhG9WqdOGzwKzcsp82xgBrvTZtUQXuyY0e4QwYn
 ZBfw==
X-Gm-Message-State: AOAM5307oxd16duhClDeBA9/uLPyMF9dcQwQblOoy3TT8z8a77Xm6thN
 hYtysGF9Y+rtEjVmSrN2BDNEJoz6EPOrL8gSIGw=
X-Google-Smtp-Source: ABdhPJwe5mYz8Qo5C8x6jThg2xR12TyzrY7uSlQtxgco4MVzuWlwZ2fvpqc12r6MAaX62HtYq+ZcTG81lVmZXibfAFg=
X-Received: by 2002:a1f:9e85:: with SMTP id h127mr1010337vke.22.1630867875366; 
 Sun, 05 Sep 2021 11:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-7-jim.cromie@gmail.com>
In-Reply-To: <20210831202133.2165222-7-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Sun, 5 Sep 2021 12:50:48 -0600
Message-ID: <CAJfuBxwqdy888_v7a6U5BYPZxDkQAB4SLPdFyEv+MW98ByNuQg@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] drm_print: instrument drm_debug_enabled
To: Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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

On Tue, Aug 31, 2021 at 2:21 PM Jim Cromie <jim.cromie@gmail.com> wrote:
>
> Duplicate drm_debug_enabled() code into both "basic" and "dyndbg"
> ifdef branches.  Then add a pr_debug("todo: ...") into the "dyndbg"
> branch.
>
> Then convert the "dyndbg" branch's code to a macro, so that its
> pr_debug() get its callsite info from the invoking function, instead
> of from drm_debug_enabled() itself.
>
> This gives us unique callsite info for the 8 remaining users of
> drm_debug_enabled(), and lets us enable them individually to see how
> much logging traffic they generate.  The oft-visited callsites can
> then be reviewed for runtime cost and possible optimizations.
>
> Heres what we get:
>
> bash-5.1# modprobe drm
> dyndbg: 384 debug prints in module drm
> bash-5.1# grep todo: /proc/dynamic_debug/control
> drivers/gpu/drm/drm_edid.c:1843 [drm]connector_bad_edid =_ "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_print.c:309 [drm]___drm_dbg =p "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_print.c:286 [drm]__drm_dev_dbg =p "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_vblank.c:1491 [drm]drm_vblank_restore =_ "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_vblank.c:787 [drm]drm_crtc_vblank_helper_get_vblank_timestamp_internal =_ "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_vblank.c:410 [drm]drm_crtc_accurate_vblank_count =_ "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_atomic_uapi.c:1457 [drm]drm_mode_atomic_ioctl =_ "todo: maybe avoid via dyndbg\012"
> drivers/gpu/drm/drm_edid_load.c:178 [drm]edid_load =_ "todo: maybe avoid via dyndbg\012"
>
> At quick glance, edid won't qualify, drm_print might, drm_vblank is
> strongest chance, maybe atomic-ioctl too.
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---

heres 120 seconds of enabled todos, from this patch

[jimc@frodo wk-next]$ journalctl -b0 | grep todo | grep 'frodo kernel'
[jimc@frodo wk-next]$ sudo su -c 'echo format ^todo: +pfml >
/proc/dynamic_debug/control;  sleep 120; echo format ^todo: -p >
/proc/dynamic_debug/control'
[sudo] password for jimc:
[jimc@frodo wk-next]$ journalctl -b0 | grep todo | grep 'frodo kernel'
 > todo-120-log
[jimc@frodo wk-next]$ wc todo-120-log
  228  2516 24066 todo-120-log

so overall thats not too much work, not so many bitchecks as to be
worth avoiding.

I think I'll try hitting it with my new igt-tools hammer, see what breaks :-)


[jimc@frodo wk-next]$ hsto todo-120-log
120 :  drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal:787:
todo: maybe avoid via dyndbg
40 :  i915:process_csb:1904: todo: maybe avoid via dyndbg
20 :  drm:drm_vblank_restore:1491: todo: maybe avoid via dyndbg
20 :  drm:drm_crtc_accurate_vblank_count:410: todo: maybe avoid via dyndbg
20 :  i915:skl_print_wm_changes:6068: todo: maybe avoid via dyndbg
2 :  dyndbg: applied: func="" file="" module="" format="^todo:" lineno=0-0
2 :  dyndbg: parsed: func="" file="" module="" format="^todo:" lineno=0-0
1 :  dyndbg: split into words: "format" "^todo:" "-p"
1 :  dyndbg: split into words: "format" "^todo:" "+pfml"
1 :  dyndbg: query 0: "format ^todo: -p" mod:*
1 :  dyndbg: query 0: "format ^todo: +pfml" mod:*
