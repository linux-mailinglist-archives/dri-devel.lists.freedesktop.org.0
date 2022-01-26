Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96F49C806
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2D710E808;
	Wed, 26 Jan 2022 10:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1BE10E808
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:52:28 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id m9so22222516oia.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hNuGvUirpZLgviiUUWup/Or/h967yV7FWMRVHEHBy84=;
 b=XuQJ2QuaOAH1guMFs+7qJK7Usxs3OIJFOFUJh3Kg+W+9uVg8Ypcz+nzh+l6fpvZNNr
 WFfm2rMdpfX28Su8mn1xY2IpJUW6FmKhs4toEMVo5qSEu1Omchn0rkkbwdI5t9edO7yt
 BMwnEqCn0Ci7qjy9Yx8Fxa3ZoSb96QLGfI/nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hNuGvUirpZLgviiUUWup/Or/h967yV7FWMRVHEHBy84=;
 b=dBPnoNwwPEHr1KXrsUcOKAjxUBy9JL0Cc2O5Wn8EzkK9jCgccVPZIJHCsFL3cEE6EP
 qnowygQjnDIAt3+s7SV67JA5KIdMwawf6e7yDXlaDr1zQxxnkIbpd5MWmh+gDJsyz+T/
 QGd+xeL0VRAHZlODerAGCdi7k52Y9bu6GPCO+BFoCBZ5PaZI90JeN+ZLp9Ul+mGmXFWx
 C4JfSY9/tSxvr736uH1XUmtmlyAMQjRNauJjKiCxqiMeUSGEVdJJdtra1gLEFwrSPqq0
 /0eQfg5WiMeiH+RAlJn7CZas9DMSKcl6fqu5kYfF6RC2axZCVJMi+sKNp5R1q4yE1718
 qrVQ==
X-Gm-Message-State: AOAM532n8YQ50c//JT6jFmochI9rHICw64MYJBoahrjAjghRMxsxJ6OA
 f9XwfijAPchyIrydnnJwsVwgW89gfN340Db31lzmiw==
X-Google-Smtp-Source: ABdhPJzPYkubRtpxhbQ9mgH5mK8ga1ADV0xj1R2SeDADNqICmknnx/N/28B3XxA4NLAA3/9nww800A/xqxovI/pIEAE=
X-Received: by 2002:aca:ab4a:: with SMTP id u71mr3195965oie.176.1643194347425; 
 Wed, 26 Jan 2022 02:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <YfEmuGVQ+IlhdQDh@kroah.com>
In-Reply-To: <YfEmuGVQ+IlhdQDh@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 11:52:16 +0100
Message-ID: <CAKMK7uEiUH8vD3jUCDPXFbF2YS5LygJLVOosbnUnvMP0MU2kTg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 11:47 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 26, 2022 at 12:02:36PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi
> > >
> > > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> > > > Since we got a maintainer for fbdev, I would like to
> > > > unorphan fbtft (with the idea of sending PRs to Helge)
> > > > and move it out of staging since there is no more clean
> > > > up work expected and no more drivers either.
> > > >
> > > > Thoughts?
> >
> > Thanks for sharing yours, my answers below.
> >
> > > But why? We already have DRM drivers for some of these devices.
> >
> > No, we do not (only a few are available).
> >
> > > Porting
> > > the others to DRM is such a better long-term plan.  OTOH, as no one has
> > > shown up and converted them, maybe they should be left dead or removed
> > > entirely.
> >
> > As I mentioned above there are devices that nobody will take time to
> > port to a way too complex DRM subsystem. But the devices are cheap and
> > quite widespread in the embedded world. I'm in possession of 3 or 4
> > different models and only 1 is supported by tiny DRM.
>
> Great, then let's just move the 2 models that you do not have support
> for in DRM, not the whole lot.  When we have real users for the drivers,
> we can move them out of staging, but until then, dragging all of them
> out does not make sense.

Can't we create drm drivers for these 2-3 models? Like we have drivers
which are below 300 lines with all the helpers taking care of
everything, this shouldn't be too tricky.

And if no one cares enough for that, then imo let's just keep this in
staging and let it quietly&slowly pass away. At least from the people
who've been active in any kind of display development the past 6+
years (which is roughly when Tomi abandoned fbdev as last active
maintainer) the consensus _is_ that drm drivers are simpler, quicker
to type (once you got hold of the subsystem and all its helpers at
least), and adding new fbdev drivers just makes no sense at all.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
