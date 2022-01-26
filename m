Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF449C8A3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7E10E92D;
	Wed, 26 Jan 2022 11:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9611010E8DB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:27:31 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 j38-20020a9d1926000000b0059fa6de6c71so9501368ota.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 03:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5fcmue9JGNrEVQdtBVNPmwhwIAf9whpXHVpHXm1fCU=;
 b=SHtAmyZuexHqrBpkdQYeSiAPX3PE0nXKd+pvvyI8W89oj62lBtQlmtZoxceAaa6Dv+
 7kLLvdsuuoluD7C1zZw4yX0wbdmq9Ua3QwPKtHkcZVIm8J1QgQmeReb06gB50ellmHRw
 lse6y/lSQaLbcTyfPFfWw6P5QvC9HZkjVobUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5fcmue9JGNrEVQdtBVNPmwhwIAf9whpXHVpHXm1fCU=;
 b=QajVuzeaVEMgds9Rcmt0Z0GinSKXveOrtQDSTK6LLFff9yHi3nuJ+PZi5WX0p4N74W
 j79ePsNpaI1t7oHtxBZ9n21+Z6jwIMx846Sa3MXT8kGS2HSU3YhFWKu6SHLyRhEYwZEn
 jR1c9KMFH16OlzrOkT7/946jXqzvBLLTzg2sZ5y6n0D2DozC535Wv7dVf93IhsyGEZ9F
 FLTNOFGlEWmr6upfihKj8DNrWrQeU6VtxCpXWKXXtHWur6pvfBSve7wLsj9TkgoZus/P
 e0/vJWHds7Xm9B6Fa2n4+g9bMBFoipk6gUVx4xR7pcc0LkzSOWDAn8uXUe3DSJnA+ZUD
 v+PQ==
X-Gm-Message-State: AOAM5312bAhGct7p2aEhYkLHYOywICir1WGY/p8YXPohS0/eaRfHzwQW
 nHEK2HXOq7d906/UWkjk3Cn30rAtwGNvZbvzaU/CvQ==
X-Google-Smtp-Source: ABdhPJzxBwXr2/Lo6sUntBiprCyVHs6MlzSJluy1t2ZYT92MpqbH6loH8t5dyGrpDiZ9+sIH4Ever+tG43xhIM66Auk=
X-Received: by 2002:a05:6830:1e76:: with SMTP id
 m22mr12004649otr.75.1643196450752; 
 Wed, 26 Jan 2022 03:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
In-Reply-To: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 12:27:19 +0100
Message-ID: <CAKMK7uFhJPpiHqL-040ozbCM=QxiWNrFHp1gOEUvpEUjxbwAQQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:18 PM Helge Deller <deller@gmx.de> wrote:
>
> On 1/26/22 11:31, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> >>> Let's maintain occasional fixes to the fbtft driver.
> >>>
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>> ---
> >>>  MAINTAINERS | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index ea3e6c914384..16e614606ac1 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -7372,9 +7372,11 @@ F:     Documentation/fault-injection/
> >>>  F:   lib/fault-inject.c
> >>>
> >>>  FBTFT Framebuffer drivers
> >>> +M:   Andy Shevchenko <andy@kernel.org>
> >>>  L:   dri-devel@lists.freedesktop.org
> >>>  L:   linux-fbdev@vger.kernel.org
> >>> -S:   Orphan
> >>> +S:   Maintained
> >>> +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
> >>
> >> I'm ok with the files moving if the dri developers agree with it.  It's
> >> up to them, not me.
> >
> > On one hand I'm happy anytime someone volunteers to help out.
> >
> > On the other hand ... why does it have to be resurrecting fbdev?
> > There's an entire community of people who really know graphics and
> > display and spent considerable amount of effort on creating useful and
> > documented helpers for pretty much anything you might ever want to do.
> > And somehow we have to go back to typing out things the hard way, with
> > full verbosity, for an uapi that distros are abandoning (e.g. even for
> > sdl the direction is to run it on top of drm with a compat layer,
> > afaiui fedora is completely ditching any userspace that still even
> > uses /dev/fb/0). And yes I know there's still some gaps in drm,
> > largely for display features which were really en vogue about 20 years
> > ago. And we're happy to add that support, if someone who still has
> > such hardware can put in the little bit of work needed ...
> >
> > I don't get this.
>
> You are describing a transitioning over to DRM - which is Ok.
> But on that way there is no need to ignore, deny or even kill usage scenarios
> which are different compared to your usage scenarios (e.g. embedded devices,
> old platforms, slow devices, slow busses, no 3D hardware features,
> low-color devices, ...).

This patchset isn't about killing existing support.

This is about adding new drivers to a subsystem where consensus the
past 6 years or so was that it's closed for new drivers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
