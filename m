Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BC65E926
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E1910E6E8;
	Thu,  5 Jan 2023 10:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7803310E6E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:39:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9so22190495pll.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2lIH75JPp0HO79B17hSan6J0r/4agwXblyvknowG4AU=;
 b=heY3FrxSZswFxVIeQb2FO3fzRPQ/mMrv+iPYV5wYl5iHp6Yv4ToVPrLR8g1GM9HsaO
 uXpy60Ya+K3J4OSoTDMDcichnWE/ppR6+NLfpODrr6CP9ehvpjSMsyFZdWQD0Xbs93YW
 ckODKMWxd2D/Qi03KvC6Mv4jK7ohEVDOddWpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2lIH75JPp0HO79B17hSan6J0r/4agwXblyvknowG4AU=;
 b=f/JFgSBE+LmvuPZHvkqoPYHheJQ7d0jSgvI8Em7/wIi9k06VrbFox4+0dHL1ZTXAII
 cpes1sH/sHYzaC+3ojyRdjhF5vususSicFMcXap5b2X+1fzWX6syR4FTwPewJmeb961k
 UAwCwFyeM9Aa4cftQ8rw3U1E5RNFI8+AM6jGot5X8bQHUO5WxMnmWW8fK1kkokBzd3ZH
 bG22sVgL9oKYxnOKiCqJ9ac5r+y4DL7v97bakHD2eRAF9WRq1r+wJiIcyueRmxnXgOwq
 cMdTO3ZsjezL4WHrMPXBRwFN0G9f72fFYCBpfAHjKPIzYAQxxCDkvp0I4xkgxJKrAD2W
 fFfA==
X-Gm-Message-State: AFqh2koc5xikkughOwezcFjnEAXJL/gciWbRUXp32N5MyvZWV98yVIiN
 dzDLvTgMqd3dyZZ2BFlmL4APZADlOhNIQ0H4rrAfJA==
X-Google-Smtp-Source: AMrXdXug3Rv8MtWdCbuqoeAFsFZ4JzB428LPyU99P0UT4Pupd9+ETqirDhbIJL1dNfPKpTdH8fAcEMMGdHMTLN8LkJE=
X-Received: by 2002:a17:902:b902:b0:190:e27b:b554 with SMTP id
 bf2-20020a170902b90200b00190e27bb554mr3098677plb.148.1672915161012; Thu, 05
 Jan 2023 02:39:21 -0800 (PST)
MIME-Version: 1.0
References: <Y7aGw/irynC61O85@ls3530>
 <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
 <ed7a65bb-f521-e5a5-85eb-0f24b023421b@gmx.de>
In-Reply-To: <ed7a65bb-f521-e5a5-85eb-0f24b023421b@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 11:39:09 +0100
Message-ID: <CAKMK7uFXTsCrbn3JhnjgG-WfEZcdUELuCk98=4PEGF4VS0N+gQ@mail.gmail.com>
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

On Thu, 5 Jan 2023 at 11:31, Helge Deller <deller@gmx.de> wrote:
>
> On 1/5/23 11:22, Daniel Vetter wrote:
> > On Thu, 5 Jan 2023 at 09:14, Helge Deller <deller@gmx.de> wrote:
> >>
> >> Hi Linus,
> >>
> >> please pull the fbdev driver updates for 6.2-rc3, to receive
> >> fixes for matroxfb, offb, omapfb and fbmem.
> >>
> >> Thanks,
> >> Helge
> >>
> >> ----
> >>
> >> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> >>
> >>    Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>    http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc3
> >>
> >> for you to fetch changes up to 764043cccd7232a783753a612d628fc0cb7854be:
> >>
> >>    fbdev: omapfb: avoid stack overflow warning (2023-01-04 19:09:40 +0100)
> >>
> >> ----------------------------------------------------------------
> >> fbdev updates for kernel 6.2-rc3:
> >>
> >> - Fix Matrox G200eW initialization failure
> >> - Fix build failure of offb driver when built as module
> >> - Optimize stack usage in omapfb
> >> - Prevent use-after-free in fbmem
> >>
> >> ----------------------------------------------------------------
> >> Arnd Bergmann (1):
> >>        fbdev: omapfb: avoid stack overflow warning
> >>
> >> Hang Zhang (1):
> >>        fbdev: fbmem: prevent potential use-after-free issues with console_lock()
> >
> > I looked at this, and even by fbdev locking standards this makes
> > absolutely no sense to me. I think this should be dropped before we've
> > reached some sort of conclusion on what is going on, or whether this
> > is just pure static checker conjecture without fully understanding how
> > this is supposed to work really.
> > -Daniel
>
> Sure.
>
> I'll send a new pull request where this patch is dropped.

Thanks a lot!
-Daniel

>
> Thanks!
> Helge
>
>
> >
> >> Paul Menzel (1):
> >>        fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
> >>
> >> Randy Dunlap (1):
> >>        fbdev: make offb driver tristate
> >>
> >> Xu Panda (2):
> >>        fbdev: omapfb: use strscpy() to instead of strncpy()
> >>        fbdev: atyfb: use strscpy() to instead of strncpy()
> >>
> >>   drivers/video/fbdev/Kconfig                |  4 ++--
> >>   drivers/video/fbdev/aty/atyfb_base.c       |  3 +--
> >>   drivers/video/fbdev/core/fbmem.c           |  2 ++
> >>   drivers/video/fbdev/matrox/matroxfb_base.c |  4 ++--
> >>   drivers/video/fbdev/omap/omapfb_main.c     |  5 ++---
> >>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 28 ++++++++++++++++++----------
> >>   6 files changed, 27 insertions(+), 19 deletions(-)
> >
> >
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
