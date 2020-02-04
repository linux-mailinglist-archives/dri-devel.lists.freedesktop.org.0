Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752BD15214D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 20:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB74894DE;
	Tue,  4 Feb 2020 19:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B17894DE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 19:44:48 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id z2so19699841oih.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 11:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IW3M1Cka8ciVZTD0T5CJKNc8jjQGbnHljxg1W356uBw=;
 b=XefjkBXNLlErM3RJNAOSqosFgJLKPOoUjxAE+XJxt0u/McKEiagOmBVve+T63xwAxY
 dVtyPeuvF5Y8/7Ogm47ct7nw9pfRV+NArr0yQYzQ/Iw9JRO15aDk2YgCIqGv+SyqR5RO
 zAfGtRcrtOb0x3QQnbaAD0YpIwsnvrnnV1QQDrlhz45mpwXVfmQnze6fpgxVHennJfWT
 rZqNnUnEZk7KQj5jw1WRocyThiP36+zsIEH27mEUeQNV5cAz4coKWmakXP2rNNnkFM6d
 9A3k7C1XWR19i94SWDskrmBo3Gwct4nFo+oj69agtDEKceocrrntSbvpQ30EO+MwdU6F
 DsDg==
X-Gm-Message-State: APjAAAWUAUEVODxW6ys6EUtMfWa/D/7SLUIQU66b7I5jDp067I2wdvai
 Y/f2Qne9tVlvEebdwHEtvrIyRxScRZdAJQ55nz4=
X-Google-Smtp-Source: APXvYqyJ/xykRpxJDrg7SDaAQvv3LO4d6/rgXOEqii3/yaDiH9EiibdNZrVlXqtKbJopxzO/iJLnsdbovxEAw7LQFKk=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr412666oia.148.1580845488096;
 Tue, 04 Feb 2020 11:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
 <20200204182621.GE20396@pendragon.ideasonboard.com>
 <20200204193050.GN10400@smile.fi.intel.com>
In-Reply-To: <20200204193050.GN10400@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2020 20:44:36 +0100
Message-ID: <CAMuHMdW7SX2W5LXvBMgTMXcjsM8bz5nhBBD=DzwLaiA4Xq3e7A@mail.gmail.com>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Tue, Feb 4, 2020 at 8:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Feb 04, 2020 at 08:26:21PM +0200, Laurent Pinchart wrote:
> > On Tue, Feb 04, 2020 at 06:39:34PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko wrote:
> > > > Replace with appropriate types.h.
> > >
> > > Thanks for your patch!
> > >
> > > I have only one very short question: why?
> >
> > Likewise :-) The patch itself looks fine, but the commit message is a
> > bit terse.
>
> The kernel.h for a long time being a dump of a lot of things. I started
> cleaning it up a bit. During this I notice that developers too far too lazy to
> use appropriate headers. For platform data kernel.h by definition is not
> appropriate.

Thanks, that makes perfect sense.

> Any suggestion what should I put to commit message?

I became intrigued by the one-line summary, which seemed to suggest
(according to my interpretation) that including kernel.h is a Real Bad
Thing.

But basically all you wanted to say was:

    drm: shmobile: Reduce include dependencies

and:

    This file doesn't need everything provided by <linux/kernel.h>.
    All it needs are some types, which are provided by <linux/types.h>.

Right?

BTW, <drm/drm_mode.h> already includes <linux/types.h>, but not relying
on implicit includes is indeed a good thing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
