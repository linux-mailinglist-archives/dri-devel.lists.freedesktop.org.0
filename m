Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18096504E04
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 10:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3142110EFBD;
	Mon, 18 Apr 2022 08:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B784D10EFBD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:53:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g18so25708297ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zE0sCiZVTtSMdgP1a/N9nihFSo+cH8EmVh/82cgACw0=;
 b=V1Wfx+v3TjmoBwTZ8PT3jZpp7wNmAElaXjBPKdiZGewaOtlJk9B3EAVRHxJ6t3zIAd
 sDHQbEHCJQuOngStauVR1Jlc5jn9UC7Shk4Gv9WjXla8jl4avWcdBWfFZJ+P7m7bPagl
 RlfRnabJiT8hJiQJFNJVFdoPBFeuL+KfEh4PQlY+H1UjSW57ih/FEwx70IO7GUzEMNaq
 ShZbaa7Gz3V40ipqCLiNoGufGxt8J7yUB+G8FeWld02/vDV4MOYTpX41PYvg8Q9OHY8G
 f5d2FV304tKL1CXYTULGbL+DjQLpvvXb+aOHWkUFNEctwS0/9orRBSj75YZyfsv+x5zt
 LO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zE0sCiZVTtSMdgP1a/N9nihFSo+cH8EmVh/82cgACw0=;
 b=MS32EwzbDtEdO0mftGodJ62XmbnuaeaI7x2m6hsgiU1t8XlTFJjggouzqZiu7cCy5V
 PxuftodX1697urDvYHlZheOOzbkSAYS8PIO1pwey+KpSYo8xAngicje1dXdESuPZuqkc
 yzd9kVbW5IuU5Z2rUbSYMnUSxlJKUWHhstC/cwcpUWH6/zZMTaaue7hEFJHjV+l9HyX4
 5wuPpBhkSU7qA4zhDR0sOyprjy2W0sjJbbdUU3BPBjsX/0P1oXmlBZl5t5YEv6UgjHhV
 aflFgb1zZKoRQcvZ5iUCpoIq9XA3rtn8GnPhWHgA/M6upfh0ExMKXsbAEn1KMBaVBAor
 CgiQ==
X-Gm-Message-State: AOAM5321nmkgWN5DmkNXmg+v8KeJUx/LBf8QP4bifFL6SOYDDwvu1D6q
 Af2jWWKN7iOtWO/XJ8Osef71q6GOl7RWJh1Hf2A=
X-Google-Smtp-Source: ABdhPJzA8PsW/F/rNN6VT3O+zAC3fKPA9J8KOlhZUV98FApGsxgqz8KPI0oRHrFixo+h8h0qdVOS9j4cO3DT2BmmpQ8=
X-Received: by 2002:a17:907:c13:b0:6e8:c1be:3979 with SMTP id
 ga19-20020a1709070c1300b006e8c1be3979mr8148934ejc.266.1650271994937; Mon, 18
 Apr 2022 01:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220409100016.9337-1-paul@crapouillou.net>
 <Yl0ON+E7bYluGIYG@ravnborg.org>
In-Reply-To: <Yl0ON+E7bYluGIYG@ravnborg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 18 Apr 2022 18:53:03 +1000
Message-ID: <CAPM=9twqpY33r0RpZcekwEtCDwJp1ohFRHxE6-dq8ySE=OinYA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: newvision-nv3052c: Fix build
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 kbuild-all <kbuild-all@lists.01.org>, kernel test robot <lkp@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Apr 2022 at 17:07, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sat, Apr 09, 2022 at 11:00:16AM +0100, Paul Cercueil wrote:
> > The driver was compile-tested then rebased on drm-misc-next, and not
> > compile-tested after the rebase; unfortunately the driver didn't compile
> > anymore when it hit drm-misc-next.
> >
> > Fixes: 49956b505c53 ("drm/panel: Add panel driver for NewVision NV3052C based LCDs")
> > Cc: Christophe Branchereau <cbranchereau@gmail.com>
> > Cc: kbuild-all <kbuild-all@lists.01.org>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---

Backmerge drm-next. I fixed this up when I merged this driver in the
merge commit.

Dave.
