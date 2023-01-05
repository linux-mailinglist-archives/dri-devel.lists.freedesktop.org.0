Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4965E8EB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544410E6E0;
	Thu,  5 Jan 2023 10:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205BE10E6E0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:23:05 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id ge16so35734808pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QW8mExk2Nc3xqwsCWhcXGMVs98kEZwkVDbL0tRWyTY8=;
 b=PJrJAYnb90s7w4gDAt1RZ4zaUBBcOCgFck+92/xYf73O/WsoTY1Cm0LXbCmQi5K5fk
 oH35M46D5q37UGuC9LJpSotKeUkdIk2j37oQ1BfIpGOqb6jjvoVeWHGgXy/W/F1fZIE2
 GxJHAu/llSd6RYIYwS/A0YhiSVxn59qrgsfTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QW8mExk2Nc3xqwsCWhcXGMVs98kEZwkVDbL0tRWyTY8=;
 b=Ca0+gh51loZ5jDi/OJxXV6SAyeFI9URoFW/+hEPuSnzNeeYUSBI7Iq5jcUR4wAGmYK
 WFuOIZ9fftj/w3CsH3+hpHeOq6aQT2sm0cGiC/y58nx6XnxVSXu+Pl4/wfoDs1U2sL/Y
 EKG5dsyg9Z1S90dOAVxZ2O9edtE6Kc+bWUZXoiX37SRNxx727tzPDZ6d1K9ZRTKLWqPw
 PWLsq4+zex2doX7S3HdHRQM0eSeTctbiz511Wx5dimM66DajaeEbFBk5sRmH+niwpHYD
 FHfgY3hgSfr+is4SPKuxpMVH7rnEVdrOiiKnkUWYoiNdkRpjk5tDQeFnmdaDH5ZOQXqh
 45vA==
X-Gm-Message-State: AFqh2krbtMZXhltxRhLC93b5lYsKr6Pdi+b33/NSN2NfkzFrnKJhcWYa
 ilUOWT9NYINveGnXn0egxJE4YGJD0Bozpr4iroRV4A==
X-Google-Smtp-Source: AMrXdXt2H+AtWOYKmaNsNlvhTfXsGkSKph/Ah0bsT/z+2hIax16T17+aU+L31MdtLvGjCg8XOYiEbyN1LRTMZHVfLF8=
X-Received: by 2002:a17:902:7884:b0:192:bf3c:b85e with SMTP id
 q4-20020a170902788400b00192bf3cb85emr1050467pll.68.1672914184720; Thu, 05 Jan
 2023 02:23:04 -0800 (PST)
MIME-Version: 1.0
References: <Y7aGw/irynC61O85@ls3530>
In-Reply-To: <Y7aGw/irynC61O85@ls3530>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 11:22:53 +0100
Message-ID: <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev fixes for v6.2-rc3
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Jan 2023 at 09:14, Helge Deller <deller@gmx.de> wrote:
>
> Hi Linus,
>
> please pull the fbdev driver updates for 6.2-rc3, to receive
> fixes for matroxfb, offb, omapfb and fbmem.
>
> Thanks,
> Helge
>
> ----
>
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc3
>
> for you to fetch changes up to 764043cccd7232a783753a612d628fc0cb7854be:
>
>   fbdev: omapfb: avoid stack overflow warning (2023-01-04 19:09:40 +0100)
>
> ----------------------------------------------------------------
> fbdev updates for kernel 6.2-rc3:
>
> - Fix Matrox G200eW initialization failure
> - Fix build failure of offb driver when built as module
> - Optimize stack usage in omapfb
> - Prevent use-after-free in fbmem
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       fbdev: omapfb: avoid stack overflow warning
>
> Hang Zhang (1):
>       fbdev: fbmem: prevent potential use-after-free issues with console_lock()

I looked at this, and even by fbdev locking standards this makes
absolutely no sense to me. I think this should be dropped before we've
reached some sort of conclusion on what is going on, or whether this
is just pure static checker conjecture without fully understanding how
this is supposed to work really.
-Daniel

> Paul Menzel (1):
>       fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
>
> Randy Dunlap (1):
>       fbdev: make offb driver tristate
>
> Xu Panda (2):
>       fbdev: omapfb: use strscpy() to instead of strncpy()
>       fbdev: atyfb: use strscpy() to instead of strncpy()
>
>  drivers/video/fbdev/Kconfig                |  4 ++--
>  drivers/video/fbdev/aty/atyfb_base.c       |  3 +--
>  drivers/video/fbdev/core/fbmem.c           |  2 ++
>  drivers/video/fbdev/matrox/matroxfb_base.c |  4 ++--
>  drivers/video/fbdev/omap/omapfb_main.c     |  5 ++---
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 28 ++++++++++++++++++----------
>  6 files changed, 27 insertions(+), 19 deletions(-)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
