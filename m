Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B1526C31F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 15:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D75C6E17B;
	Wed, 16 Sep 2020 13:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C466E0E5;
 Wed, 16 Sep 2020 13:08:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k15so6841474wrn.10;
 Wed, 16 Sep 2020 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boqFmJSvqYexxLobLNyh9qTrVnM8InJDrYRAbGJcCho=;
 b=PmsES2SARiy3RNMai1PKHwmsW52gv1/E88+yqUQ9Tv0jC62ZlRhBcsmzE3b4ti/83J
 r967Z58Yh8Cq5xasJ5umEjNwsnfDwjz2P6JpvpSZxUi5Hpu8xv08QlwTCltKOHoDtSZR
 of5GhwBlvKJLkJX0yM3FjWHxODmE3o+/AWfrJFfAlwuoIa+cZjjbbAB2S77mUnpl/nzz
 IEARN45BnQqyfl3YrVY+FFSj3o2L5Kwft3L6/7+JH5t6W08YP+9B9PvrfNUDcxhXqwhK
 bGp+rdUw4xXROyTT7ev5ufpUQ5a1W57gboULd52Ki4ZQQ8vQ/nGMbr8yEOkW5K8bmwXY
 JvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boqFmJSvqYexxLobLNyh9qTrVnM8InJDrYRAbGJcCho=;
 b=ZaGLUstXAfvM29IFnrgjugl5Y6/KDqDR5Brxl1zkX/1XiifK15l8Rs/yaaGjn4GVsp
 4EPKWkBnNwnKVvR+FAmXqpi98QRR9l9Z7Yq+N6sntf6rVStg2chEo09JCLBc3n/NLGaW
 zqVkHvU5aE3Liu2ignay56TXyXecV5Y8xrFrUk1oMZjoLF+CFE4BzqJ0djNf6Dmh1M1/
 wsAXr4G7J5xwByskbGTIe3jUu/n9Jy6e6rxNBDfFm6p3787Xrlue9Sgpd1xJH5g6IYgr
 /JYzQAGlvmRgpq+vV7AaAABHVPnJy1ZURzV9tphu9KbfKkXd0pmvNb8JsPt3mWhr//KC
 RZNg==
X-Gm-Message-State: AOAM533wxrDYSB0mUpi4x1SbsRrX31xKXISDIU344mB7valkUF9Zx9iJ
 vT+Y4biFvHU4QkDHlk+zDxW2s2romT/Pm7vmPic=
X-Google-Smtp-Source: ABdhPJyn/PJ7xHU8ZYPwNfmhW+wrz8y3cokw/6HfKfyVIclqmJYVI81DT7pBaNF79qcayK5F8vAfGKFPbwm8P2+ByXQ=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr28315368wrl.419.1600261731057; 
 Wed, 16 Sep 2020 06:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200915184607.84435-1-alexander.deucher@amd.com>
 <20200916063300.GJ142621@kroah.com>
In-Reply-To: <20200916063300.GJ142621@kroah.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Sep 2020 09:08:39 -0400
Message-ID: <CADnq5_ObvQ9sT_p=mdEk1m_o_LPHx6zwiEP5qFvX9YxveOBOZA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "for 3.8" <stable@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 2:32 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 15, 2020 at 02:46:07PM -0400, Alex Deucher wrote:
> > This change breaks tons of systems.
>
> Very vague :(

Screen corruption making the system unusable.

>
> This commit has also been merged for over a year, why the sudden
> problem now?
>

It was noticed by several people closer to when the change went in as
well.  If you notice, most of the bugs date back quite a while.  We
looked into it a bit at the time but couldn't determine the problem.
It only seems to affect really old chips (like 15-20 years old) which
makes it hard to reproduce if you don't have an old system.  There
were a couple of threads at the time, but nothing was resolved.  I was
able to find one of them:
https://lkml.org/lkml/2019/12/14/263

There were several new bugs filed which brought the issue back to my
attention recently.

> > This reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.
>
> You mean "33b3ad3788ab ("drm/radeon: handle PCIe root ports with
> addressing limitations")"?
>
> That's the proper way to reference commits in changelogs please.  It's
> even documented that way...

When you revert a patch with git, that is what it does.  Maybe we
should fix git to change the formatting.

>
> >
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206973
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206697
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=207763
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1140
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1287
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Cc: stable@vger.kernel.org
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: christian.koenig@amd.com
>
> Fixes: 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations")
>

Sure, I can add that, but it doesn't really fix it, it reverts it.
But point taken, it does fix the commit by removing it.

Alex

> as well?
>
> thanks,
>
> greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
