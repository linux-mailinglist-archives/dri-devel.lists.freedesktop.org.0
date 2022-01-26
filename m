Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08B49C7B9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC1610E7EA;
	Wed, 26 Jan 2022 10:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39D210E794
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:43:33 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so29116191oti.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rK+78XaAQPCLB0cX0TSDW4GUNb2Fr1WFpEws/EiYsHo=;
 b=H5Mpc3SICXdb/tu7QNJsAZJY9cx8gxyADjsjYqFs2OGzikcrQv9d6aUFd4nu2DR/uM
 pg7r7egDc5hJX7SpJWHXbqu8eN/zn6I3n9JfcARrYRnMh14um9Nuf3hnkZUyptzEzpMD
 xu/W8FcZqPRJYWljwQmeV3Ea1kT+hmVGT0+Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rK+78XaAQPCLB0cX0TSDW4GUNb2Fr1WFpEws/EiYsHo=;
 b=N0JJZJ2FKTqQ3TEzYQ81oxMAEKHZE9yuqwUXPJHSm15zvt0bb42+2JXE+FQzK0vKp8
 f0NhmsQ6KZWKc/5BwzOzQH89/WMscIPkmMYlvcBuf7lTdlXcZpilmFBQMyf1in2K9hJU
 gnc34rUD5fjTKQCsR9Z3viKz/lw1EsND+dN2ZII7khBbyEWHI8xVIikP2imJGQjvvjYN
 JFp3WOwV/XN0cUA2yDSVnH97pWXak2LFpIM9hdjDsFzw2kX/pG1tGSBxV2oXYlzPFKPj
 ibSxpb11Znn+i0qUikDYo3NBqZfTfvL8AbigSE1W6K+Vd6SeoL2c3LMXrW6EGn5hKMby
 XKiw==
X-Gm-Message-State: AOAM530jfKCmTH0Uto+ChikuwCXDqf3Lh4cU2ZGoYhgDjObocWVU2C5Y
 LVcyKU8o2Xi0g33oFE02QN46nVgedh4m6cN+Ejv39w==
X-Google-Smtp-Source: ABdhPJypyU3SWjtazA+dR1jy9183rhmFmvhtPfxYhBvLEhFBxk3eEbVjurEEmBVicGmboHD3dxP03AD+st+JrZGg+yE=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr17390007otu.323.1643193812904; 
 Wed, 26 Jan 2022 02:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
In-Reply-To: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 11:43:21 +0100
Message-ID: <CAKMK7uEQUxDUg6yFgcc5gee=fqS6ehuVV_ZouwvTeq7kLreqNQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 11:03 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> > > Since we got a maintainer for fbdev, I would like to
> > > unorphan fbtft (with the idea of sending PRs to Helge)
> > > and move it out of staging since there is no more clean
> > > up work expected and no more drivers either.
> > >
> > > Thoughts?
>
> Thanks for sharing yours, my answers below.
>
> > But why? We already have DRM drivers for some of these devices.
>
> No, we do not (only a few are available).
>
> > Porting
> > the others to DRM is such a better long-term plan.  OTOH, as no one has
> > shown up and converted them, maybe they should be left dead or removed
> > entirely.
>
> As I mentioned above there are devices that nobody will take time to
> port to a way too complex DRM subsystem. But the devices are cheap and
> quite widespread in the embedded world. I'm in possession of 3 or 4
> different models and only 1 is supported by tiny DRM.

If we go with "way too complex" no one should try writing good linux
drivers in general, because with the bazillion of helpers, different
subsystems and specific solution for pretty much any possible problem
you might ever have, the linux kernel overall is "way too complex".

Yes it's overwhelming and also dri-devel is a chaotic firehose, but
let's try to address these issues instead of creating tiny little
corners where nothing happens, but at least things are simple.

Maybe Greg needs to expand his "I'll help you upstream your drivers"
project to drm? We're trying to do that but sometimes it's a bit too
much chaos, and also no one is actually paid in drm to do that kind of
work even part time (except contracting for specific customers, but
that's not the problem here I think).
-Daniel

> On top of that the subtle fact people forgot about FBTFT is that it
> does support parallel interface (yes, I know that it's not performant,
> but one of the displays I have is with that type of interface).
>
> P.S. For the record, I will personally NAK any attempts to remove that
> driver from the kernel. And this is another point why it's better not
> to be under the staging.
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
