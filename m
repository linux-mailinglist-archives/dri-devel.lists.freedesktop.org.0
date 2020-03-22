Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00D118E5DE
	for <lists+dri-devel@lfdr.de>; Sun, 22 Mar 2020 02:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DA66E231;
	Sun, 22 Mar 2020 01:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432B6E231;
 Sun, 22 Mar 2020 01:47:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so12175944wrl.1;
 Sat, 21 Mar 2020 18:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PjxOqTM/8n+sRdTazUP+EEaK0f4OJEw2xiMlB+iolU0=;
 b=W6gpHPy8D8kiqjouqTm/0FqG7Ecz9gnyEhJKhx3gwB3zUhMqzIg5wONlD7qkVLzQ09
 x8jvqBxwM6q+znuSHV5HvVzx+VnXqX8CQ9Oi7nq7KlIszZwVYykhfLzAZE3GBQtNDlsl
 tf2Hg5F0SjrOEvk6/SEG/AjS+sZ0LpKLTV8f77+RyvZS5fbTtgW0luKLKHEUXArO7mje
 rSab3E1rVscFdtinoDHhuHpBx0qBTr9LBNxSMNlAQpemxQkSI5V+ryQuUt7pdGyyXGwa
 Tmg4awtk1dS6e/gcB6ovdIOV3lB3S5LkVWVKAbJ049nHCDuQI+fus63zMIkxR5GAYk7X
 vvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjxOqTM/8n+sRdTazUP+EEaK0f4OJEw2xiMlB+iolU0=;
 b=D4wms/NNZbN/LQQVFo/3MpcY9oTbSVvbNW5n8xNzgjPF/y4eteyGULs3BuTTODOAt0
 oRiELtEdqeioZ/Oa8y4NTqPiqy7NopdJZYYX0uA67cP0Z22jVkr6ReyppZtqXVjwCE7U
 MnkoQsgya+rFI964A/M1MhflUHb7prLaVZ8nAEGC8STeSrKSJIRTolMyCawkksRvF3NA
 KFurDcKk/zm5CagwZNjFFbnQribGTK92uvF7ZZqdf/RDEwabTa2UH3mp3O52Hgr/C/la
 WhPeDT6fC2HwcECKUxtIxfzTbezQ0+N9v/ms0NfLDNntqyDeBd15WAXWTuZuo/ZMWuIL
 e2Hg==
X-Gm-Message-State: ANhLgQ3Ex0sFL2ZnkFlYFkkR8fdijsgfn31I+GP+DEoDOAmGy6MTpgUC
 KGfWOheHPlkG6ZqzjSdav5hFjknk/HCPZ/CUUH4=
X-Google-Smtp-Source: ADFU+vs4Whq9UK3EEQcgMmkMlC+1GiOdPTHVXfO+JeyyvZ+rmxXAgHKVowCMKF+cJTKUeMFV1WtCOJ7UBL4jBUnkbZM=
X-Received: by 2002:a5d:4cc2:: with SMTP id c2mr20969118wrt.398.1584841641141; 
 Sat, 21 Mar 2020 18:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200222024210.18697-1-yuq825@gmail.com>
 <CA+E=qVcYACGpcgY2WehVDtzAiQHVVpRezozR4XuPh91ps2HGRQ@mail.gmail.com>
In-Reply-To: <CA+E=qVcYACGpcgY2WehVDtzAiQHVVpRezozR4XuPh91ps2HGRQ@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 22 Mar 2020 09:47:10 +0800
Message-ID: <CAKGbVbvX7g2j96NYNny3qQh107nrseq_1FHiJ+tpTvOUmTPL_Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/lima: add error debug functionality
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Icenowy Zheng <icenowy@aosc.io>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for review and test. Applied patch 1~4 to drm-misc-next.
As patch 5, due to related with non-continuous command stream,
I'd like to apply it when non-continuous command stream has been
implemented which may need a more common VA interface.

Thanks,
Qiang

On Sun, Mar 15, 2020 at 12:32 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Fri, Feb 21, 2020 at 6:43 PM Qiang Yu <yuq825@gmail.com> wrote:
> >
> > Save task error state when it fail and export to user by
> > sysfs as a binary file which can be dumped and replayed
> > by lima_dump tool at:
> > https://gitlab.freedesktop.org/lima/lima_dump
>
> With v2 of Patch 3, series is:
>
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
>
>
> > Qiang Yu (5):
> >   drm/lima: save process info for debug usage
> >   drm/lima: add max_error_tasks module parameter
> >   drm/lima: save task info dump when task fail
> >   drm/lima: add error sysfs to export error task dump
> >   drm/lima: add LIMA_BO_FLAG_FORCE_VA
> >
> >  drivers/gpu/drm/lima/lima_ctx.c    |   3 +
> >  drivers/gpu/drm/lima/lima_ctx.h    |   5 ++
> >  drivers/gpu/drm/lima/lima_device.c |  13 +++
> >  drivers/gpu/drm/lima/lima_device.h |   8 ++
> >  drivers/gpu/drm/lima/lima_drv.c    | 123 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/lima/lima_drv.h    |   1 +
> >  drivers/gpu/drm/lima/lima_dump.h   |  77 +++++++++++++++++
> >  drivers/gpu/drm/lima/lima_gem.c    |   7 +-
> >  drivers/gpu/drm/lima/lima_gem.h    |   4 +-
> >  drivers/gpu/drm/lima/lima_sched.c  | 128 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/lima/lima_sched.h  |   7 ++
> >  drivers/gpu/drm/lima/lima_vm.c     |  13 ++-
> >  include/uapi/drm/lima_drm.h        |   9 +-
> >  13 files changed, 385 insertions(+), 13 deletions(-)
> >  create mode 100644 drivers/gpu/drm/lima/lima_dump.h
> >
> > --
> > 2.17.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
