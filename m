Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF85132585
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 13:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E50889D53;
	Tue,  7 Jan 2020 12:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE3389D5E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 12:00:21 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id r9so2797207otp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 04:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1wiXwjq5bNvmzPILmmYBOTjMYtnHu6yYzhrvwBxyhQ=;
 b=FEW6aDBNqtpN4IPDugxqiv60rzSTTMturZvSj4eLNaM3z/6SovWl2binpEBlbH4Edp
 RZvyRWQGsQ0uRFNna96O+9G/4wQqyHa62Y8fgbW9eu+ZzLjycy2lLLdJ6RMtD8eVCLiK
 zMNGTDWK9+CSybCGDdA2VjL5UyaYVJzQBW3/BjTTMpa8vfqSqSL3RQAuQTvGsfgAjWqf
 z/YafqrQHLSJOpHB/NCIVPaBj8528/UWJ0r69gvpSqC5Tg1BhSFNZMEPWqUNo0yCg7gh
 qb5Em9tUJgCpNEGcEnaSl0Xd026bRc0NvVkuyl8rGV3zWQKyolSjne77axx2OSkLuYWx
 Ff7w==
X-Gm-Message-State: APjAAAXx6d6mgVKENAUx3ZQWT9FUnsJAGc+l47c9aKJPOnCxiVF5zhXi
 DfQUNqPh3lw3umtMigg+4sP/CWZ9KQNxAeuaCRs=
X-Google-Smtp-Source: APXvYqzT7NKt5AuNhkaTac1R66p2sfv4kCORKqYWKCFnDXfFGTTAXq67T4+HRh5ZfjBhcY6kAGr9/0+4yeC44TRkpqE=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr22257984ots.250.1578398420315; 
 Tue, 07 Jan 2020 04:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-4-geert+renesas@glider.be>
 <20200105091303.GB29102@ravnborg.org>
 <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
 <20200106170808.GA21745@ravnborg.org>
In-Reply-To: <20200106170808.GA21745@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2020 13:00:08 +0100
Message-ID: <CAMuHMdXa4zRipzxpKi=YnP672guW5YOvUJ49t6bEX9xp7DyuUg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Jan 6, 2020 at 6:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
> > > > Add support for the Okaya RH128128T display to the st7735r driver.
> > > >
> > > > The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
> > > > ST7715R TFT Controller/Driver.  The latter is very similar to the
> > > > ST7735R, and can be handled by the existing st7735r driver.
> > >
> > > As a general comment - it would have eased review if this was split
> > > in two patches.
> > > One patch to introduce the infrastructure to deal with another set of
> > > controller/display and one patch introducing the new combination.
> >
> > I had thought about that, but didn't pursue as the new combination is
> > just 7 added lines.  If you prefer a split, I can do that.
>
> The good thing with a split is that is shows how little is really
> required to support a new controller/panel pair.
> So it would be good if you did so.

OK.

> > > > --- a/drivers/gpu/drm/tiny/st7735r.c
> > > > +++ b/drivers/gpu/drm/tiny/st7735r.c
> > > > @@ -1,8 +1,9 @@
> > > >  // SPDX-License-Identifier: GPL-2.0+
> > > >  /*
> > > > - * DRM driver for Sitronix ST7735R panels
> > > > + * DRM driver for Sitronix ST7715R/ST7735R panels
> > >
> > > This comment could describe the situation a little better.
> > > This is a sitronix st7735r controller with a jianda jd-t18003-t01
> > > display.
> > > Or a sitronix st7715r controller with a okaya rh128128t display.
> >
> > Indeed. It is currently limited to two controller/display combos.
> > But I expect more combos to be added over time.
> > Hence does it make sense to describe all of that in the top comments?
>
> If we do describe it we should do so as kernel-doc and then wire up the
> driver somwhere under Documentation/gpu/
> But there is no good place to wire it up yet.

Documentation/devicetree/bindings/display/sitronix,st7735r.yaml? ;-)

> > > > @@ -37,12 +39,28 @@
> > > >  #define ST7735R_MY   BIT(7)
> > > >  #define ST7735R_MX   BIT(6)
> > > >  #define ST7735R_MV   BIT(5)
> > > > +#define ST7735R_RGB  BIT(3)
> > > > +
> > > > +struct st7735r_cfg {
> > > > +     const struct drm_display_mode mode;
> > > > +     unsigned int left_offset;
> > > > +     unsigned int top_offset;
> > > > +     unsigned int write_only:1;
> > > > +     unsigned int rgb:1;             /* RGB (vs. BGR) */
> > > > +};
> > > > +
> > > > +struct st7735r_priv {
> > > > +     struct mipi_dbi_dev dbidev;     /* Must be first for .release() */
> > > > +     unsigned int rgb:1;
> > > > +};
> > >
> > > The structs here uses "st7735r" as the generic prefix.
> > > But the rest of this file uses "jd_t18003_t01" as the generic prefix.
> > >
> > > It would help readability if the same prefix is used for the common
> > > stuff everywhere.
> >
> > Agreed.
> > So I think it makes most sense to rename jd_t18003_t01_pipe_{enable,funcs}
> > to sh7735r_pipe_{enable,funcs}?
> s/sh/st/

Oops, seen to much SuperH-derived hardware ;-)

> Yeah, or maybe just sitronix_pipe_{enable,funcs} as we have support
> for more than one Sitronix controller anyway.

Note that there are other drivers for Sitronix controllers, e.g.
drivers/gpu/drm/tiny/st7586.c, which is a different beast.
So st7735r_* sounds better to me ('15 and '35 are very similar).

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
