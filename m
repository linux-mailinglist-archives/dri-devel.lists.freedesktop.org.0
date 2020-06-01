Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6151EA861
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 19:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1298A89CF3;
	Mon,  1 Jun 2020 17:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CF189CF3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 17:26:01 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t7so236871plr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hMi/4BxM0AbXAkM7OIaB/P+4lYmXtN8bwq9ouV8Hcfg=;
 b=gixcreoioOVRmb/MHec/20OTFgvBLgJMODpAhpBX8wvXRjGV0VJOZIyDEoIHnDz86V
 E/JNAO4TOvEXU9jpEk5jMB8Jl8gLxblRSDwng4aBZ9lTRF564K/hpD+/CJBFolIh4BpM
 2NgF6hapRSFk8AGYFTziS/P8G2MVrOacSFcjy50TNgCXbDG4NBFteLodKkvO0vbUx0C5
 M8zDbPWxFOBCcv4qfraFT2gGFM9LjOPlLWAo8u4Q8TUkpNF6B+c0FDolyHwmo9Kx2uXs
 IrohpGP4hEXXWA3bXBcKpAfqKRjS9GCCs6IN6Jnwd/hnjbQ77MGXUmR/yIibfWRxdrcJ
 4vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hMi/4BxM0AbXAkM7OIaB/P+4lYmXtN8bwq9ouV8Hcfg=;
 b=RkL1CLRkpENsGCuKSGjFmn9RD3eB9vGseR6wbyInKnWMNvzUSegokqVcSdbXT8sNom
 oLADbLk/FulT+6TQo6AGHBRuJeUwVFri/OGFIfg/T01OBgvLxalRX5HUXe+8PNq0YESD
 gtEj/bFM2eszTzAqSDfaY163oqb/cBoE9IEJ+YvyE+O/NSbQw9Zbe3/XEmMqudcNCsC1
 U4BpPEE0Gsf3cpZrR+WI5Zju0mQMg5OTcyN44/pJumEWkGEVOLs9BqOF34xDdAHx5OB1
 Q1t5by/peG9Gutw5enhmrGawlGDf/uLsltruFmpv7S5U7NdapcFwr3QKqaDj3QUoCPX/
 wGDw==
X-Gm-Message-State: AOAM532rSzL8L1YyVqfUscb9tsYIY7/GgJXo9kTZJtUaEwRJy70k/+Qv
 hqkPpehh3OAqbEVT14lAEGN8NBal78C+9Dp4kWQ=
X-Google-Smtp-Source: ABdhPJzk4Shgd8HYl9JK13sPsEt9pslUnIpILMIGTxNZDqYLmGXh9+fcZeaRJBl6q2TRwroNi5hrcGBg/uiGSbF/Vkc=
X-Received: by 2002:a17:90a:ac05:: with SMTP id
 o5mr492670pjq.228.1591032360279; 
 Mon, 01 Jun 2020 10:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200522041506.39638-1-jhubbard@nvidia.com>
 <20200531205819.GC138722@ravnborg.org>
 <854fae07-3cb4-dbcf-fa93-35b447f9d084@nvidia.com>
 <CAHp75Vf6=UuC2Sef3m3CpRmjAOWt8ZgBW+OPf0-_53P3F__CWw@mail.gmail.com>
 <e7f95207-1b30-17a8-4667-ca58b77ec0a3@nvidia.com>
 <CAHp75VcaXTM86K9vzyxTQJP_oNnzJ8mMHzgm7ybEioVhG6DHDQ@mail.gmail.com>
 <8fa07f59-6d77-f76b-7539-c88bf85c5036@nvidia.com>
In-Reply-To: <8fa07f59-6d77-f76b-7539-c88bf85c5036@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 1 Jun 2020 20:25:43 +0300
Message-ID: <CAHp75VfHnLz56jyR5PNgpxWGtO_u0bss45+iHhQ03c_4L3jH5g@mail.gmail.com>
Subject: Re: [PATCH 0/2] video: fbdev: fix error handling,
 convert to pin_user_pages*()
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Mundt <lethal@linux-sh.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 1, 2020 at 8:10 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-06-01 03:35, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 1:00 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >> On 2020-05-31 14:11, Andy Shevchenko wrote:
> >>>      ...
> >>> JFYI, we have history.git starting from v0.01.
> >>>
> >> OK, thanks for that note. According to that history.git [1],
> >> then: drivers/video/pvr2fb.c had get_user_pages_fast() support added to
> >> pvr2fb_write() back in 2004, but only for CONFIG_SH_DMA, as part of
> >>
> >>       commit 434502754f2 ("[PATCH] SH Merge")
> >>
> >> ...and that commit created the minor bug that patch 0001 here
> >> addresses. (+Cc Paul just for the sake of completeness.)
> >>
> >>
> >> [1] git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
> >
> > I mentioned this one, but I guess content should be the same.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/
> >
>
> Actually, that history.git *starts* at Linux 2.6.12-rc2,

It's not true.

> while
> tglx/history.git *ends* at Linux 2.6.12-rc2 (which is in April, 2005).
> And the commit I was looking for is in 2004. So that's why I needed a
> different stretch of history.

Actually history/history.git contains all of them starting from v0.01.
But it ends, indeed, on 2.6.33.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
