Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C849C798
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626C310E8CB;
	Wed, 26 Jan 2022 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7B710E8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:31:57 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id m9so22135927oia.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PARYSeIeXIRXwXqFcnW3Wz91jHJIg+/6lKoOo1XNXrI=;
 b=I3kUr8qfahBfszwo6LNqD5ZWF9kbC+G+AIHcoBCRezvQYE3SqIfzljpjCVjfIeUbKL
 /hb68PKQhFaCjgZOyHw+gYJ/ei9uM4swYOiN4djukilmM5j6y7WPe4l6XWAgd0gufDNh
 xhsFCpIAtqhF8Nluu4DTHaEsI1zgLKLsFCHtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PARYSeIeXIRXwXqFcnW3Wz91jHJIg+/6lKoOo1XNXrI=;
 b=dtP7rllZK3GbFL9WPbgiskNmNduYBZujh6LTJkL//scNYzbSbIeD7wWU79FUoK0QGt
 ud0q6TNmgiinK+fTBA0hmwrYtR4VunlghKEwJAqd217xQXACyXiuWqIW7+PeIesvmr4w
 bA35oxos4+jAFnJV0FMkJY819Qj3d1SDax1LXJNBqltBUp6O+ODwmf5AwRawpFkahLYG
 ZMIkFCnlicijAVFM7/7WRmeYJcej7Ki5zJHLrCrvZKNyT6UXkLXZmS9yxrNujNhdwO6r
 O4dAqungnQCzR/OT8n61iXsph4FQTcX69K2soos06nFAU/OLKZjdqaos6fLvsvZIW/yV
 69Ig==
X-Gm-Message-State: AOAM530k68SqBg4UrNRk5zA9nI77BVaX6kPRmQr8unwXNB/1IvU2l5NR
 c1YjLcD8TWT0HZQV9tRjt9gRGMjEdhA1FTtfIuML/g==
X-Google-Smtp-Source: ABdhPJzjwv/0sLlbLiWvmxRAGel0mMOAKI6UYaYppLOrZDc1WgZAwnk5CLyfI1LGm6q5W5cApZ7TCM6rQd58C8u5svs=
X-Received: by 2002:a05:6808:f03:: with SMTP id
 m3mr3247262oiw.330.1643193116706; 
 Wed, 26 Jan 2022 02:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
In-Reply-To: <YfEG2qVO9K9G+g1d@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 11:31:45 +0100
Message-ID: <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
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
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> > Let's maintain occasional fixes to the fbtft driver.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  MAINTAINERS | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ea3e6c914384..16e614606ac1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7372,9 +7372,11 @@ F:     Documentation/fault-injection/
> >  F:   lib/fault-inject.c
> >
> >  FBTFT Framebuffer drivers
> > +M:   Andy Shevchenko <andy@kernel.org>
> >  L:   dri-devel@lists.freedesktop.org
> >  L:   linux-fbdev@vger.kernel.org
> > -S:   Orphan
> > +S:   Maintained
> > +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
>
> I'm ok with the files moving if the dri developers agree with it.  It's
> up to them, not me.

On one hand I'm happy anytime someone volunteers to help out.

On the other hand ... why does it have to be resurrecting fbdev?
There's an entire community of people who really know graphics and
display and spent considerable amount of effort on creating useful and
documented helpers for pretty much anything you might ever want to do.
And somehow we have to go back to typing out things the hard way, with
full verbosity, for an uapi that distros are abandoning (e.g. even for
sdl the direction is to run it on top of drm with a compat layer,
afaiui fedora is completely ditching any userspace that still even
uses /dev/fb/0). And yes I know there's still some gaps in drm,
largely for display features which were really en vogue about 20 years
ago. And we're happy to add that support, if someone who still has
such hardware can put in the little bit of work needed ...

I don't get this.
-Daniel


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
