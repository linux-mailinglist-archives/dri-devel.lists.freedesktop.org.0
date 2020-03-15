Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83552185A12
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 05:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0BE6E111;
	Sun, 15 Mar 2020 04:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12BB6E102;
 Sun, 15 Mar 2020 04:32:53 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id u10so6997060qvi.2;
 Sat, 14 Mar 2020 21:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTOkcFGlkR20hYR3hXKjfjvaNdy/iw3rLh1DO9DjrUY=;
 b=Qcy/6P0uVgVkXnZVEZuMsbHkBuPeTj2u8vf2Iur05GHKwcdqdRmQtCn0KACvXIDG/0
 48uvpbofM44QkglVhRhHaOZBnAPqPol3YDs6nLBByZUz/j+a0MRFNvzAq8tPD97+OXcp
 20+4Rxr0NBlych28GOxfG8yyjp7uUhr1IHKnx8JoNvNM2a46ySE2isCH+R8jy7wmC3CI
 Eht6I0PSR/2zaVRnrZnRlZ7jPISS+mNrEojlbGldI/soPEU+gRMd4cABiPKcFMhcuM8l
 4aJcO1F69HQC5NGsjGcE8s2+ATsyxPZs+Y41UsdGwJDM9QSWXSIYhZcnpFsLHe4lSBtN
 67Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTOkcFGlkR20hYR3hXKjfjvaNdy/iw3rLh1DO9DjrUY=;
 b=Jm2cmiRMso1zGSjT5WZaXdTImhztkPpwvH/VVwznKUCUg1Uw/Atn4AcIor//NvmAQt
 cKQw5xN/WuaQxaq3fVOC1ekDeR2s7d+8gPOJWEutaqdhrsPsMK6am9i41ib5Npisl7h7
 P51d4U/XnEo6qUQmBScgS558zaKXuCIroNsdCvhtfhJ/sdvXjIn2t6BBFJAaCJmLvYju
 IvjrnR3Qf7X/Il66Od97NqeTmt+scvedpXc64y4k2TOsAqKsVNOrS60L1dr5/rjlCBzM
 zUd2m1OtFM8LgMvgtrB66pyFSny09YoZzSjHXYcLH4zAtBTdRth/yTW6WAs3X1AHr8Jj
 /uYQ==
X-Gm-Message-State: ANhLgQ3vXjZJBGeagn4fa1O9uqkv2s33GoGuOlYRH/FY4XMp8BFcEGxu
 cyVIZj/N1VGRsBQrVQk11YfGzOP3YARH3djuFUs=
X-Google-Smtp-Source: ADFU+vt4Gza6CqV04yIWTlUZ1hKtYsnHbhnMfWco0vQtBrRd0mz0SLCXHQ/zwLd6nfxb140l2CMN72R/veGS8yu1aF8=
X-Received: by 2002:ad4:4766:: with SMTP id d6mr18116912qvx.136.1584246772845; 
 Sat, 14 Mar 2020 21:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200222024210.18697-1-yuq825@gmail.com>
In-Reply-To: <20200222024210.18697-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 14 Mar 2020 21:33:10 -0700
Message-ID: <CA+E=qVcYACGpcgY2WehVDtzAiQHVVpRezozR4XuPh91ps2HGRQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/lima: add error debug functionality
To: Qiang Yu <yuq825@gmail.com>
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

On Fri, Feb 21, 2020 at 6:43 PM Qiang Yu <yuq825@gmail.com> wrote:
>
> Save task error state when it fail and export to user by
> sysfs as a binary file which can be dumped and replayed
> by lima_dump tool at:
> https://gitlab.freedesktop.org/lima/lima_dump

With v2 of Patch 3, series is:

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>


> Qiang Yu (5):
>   drm/lima: save process info for debug usage
>   drm/lima: add max_error_tasks module parameter
>   drm/lima: save task info dump when task fail
>   drm/lima: add error sysfs to export error task dump
>   drm/lima: add LIMA_BO_FLAG_FORCE_VA
>
>  drivers/gpu/drm/lima/lima_ctx.c    |   3 +
>  drivers/gpu/drm/lima/lima_ctx.h    |   5 ++
>  drivers/gpu/drm/lima/lima_device.c |  13 +++
>  drivers/gpu/drm/lima/lima_device.h |   8 ++
>  drivers/gpu/drm/lima/lima_drv.c    | 123 +++++++++++++++++++++++++--
>  drivers/gpu/drm/lima/lima_drv.h    |   1 +
>  drivers/gpu/drm/lima/lima_dump.h   |  77 +++++++++++++++++
>  drivers/gpu/drm/lima/lima_gem.c    |   7 +-
>  drivers/gpu/drm/lima/lima_gem.h    |   4 +-
>  drivers/gpu/drm/lima/lima_sched.c  | 128 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_sched.h  |   7 ++
>  drivers/gpu/drm/lima/lima_vm.c     |  13 ++-
>  include/uapi/drm/lima_drm.h        |   9 +-
>  13 files changed, 385 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_dump.h
>
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
