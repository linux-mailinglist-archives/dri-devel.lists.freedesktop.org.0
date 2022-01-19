Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624654939DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 12:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4886F10ED7A;
	Wed, 19 Jan 2022 11:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBAB10ED7A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 11:48:06 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id c36so3891842uae.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 03:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCbX2OMJvl/EE6vcwTdZbTk0S6N5nx5++Qk7hJWCnWw=;
 b=QrjOTpqEVxYxJCmzc+jXuqFRoLP3pYD2dW7BsIGjn/Hv/b2w0G8x4+eOjvsFar5MwL
 qy9/LrlhqR7psQbE8Yzu9H87Aw+fcGNgt0Kh3RfxkNpe6pMnNSHqlWW7AltqZbX9FEix
 a73ht+y2XaahZTd9kkWy6/DMmGjPBmiXAkj1tTUAkGjbVRrHbnDHnbG3jxDuJ6vB6F78
 3CPt8SjsvhjnrrubTXzQBRA5n7X5WL8EwYRWbF7WvIDmvJYWR7bB6IxjAChalN8lqOjb
 JTrB3fdTFOBWKar+KnIdWh89zk4aelkiN8wWNBEtwLHLd6c1ntalsQyhIWd6oS/Jqlti
 jQOg==
X-Gm-Message-State: AOAM530e1N+C5D3uhAG0gJS0ztY6Zi1fSjemWMsQJOB+hnkMtJl9uhmE
 kN/GZyWpVYKJCmYKslKZ2KbEc3V9yAY2DQ==
X-Google-Smtp-Source: ABdhPJzWfaWmEMaeZKReVESxcqRtjrk2yPslN830yvtIZrsrqAhxMAkIw2KPgddzSRFvPhaKGwPP7w==
X-Received: by 2002:a67:e014:: with SMTP id c20mr12018613vsl.39.1642592884386; 
 Wed, 19 Jan 2022 03:48:04 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id k77sm1994275vka.20.2022.01.19.03.48.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:48:03 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id m15so3959564uap.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 03:48:02 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr11427171vsu.5.1642592881909; 
 Wed, 19 Jan 2022 03:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <Yef0j8+DBbwC7Kjv@kroah.com> <Yef15k2GtC40aJEu@kroah.com>
In-Reply-To: <Yef15k2GtC40aJEu@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jan 2022 12:47:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
Message-ID: <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg,

On Wed, Jan 19, 2022 at 12:28 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Jan 19, 2022 at 12:22:55PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Jan 19, 2022 at 12:08:39PM +0100, Helge Deller wrote:
> > > This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.
> > >
> > > Revert this patch.  This patch started to introduce the regression that
> > > all hardware acceleration of more than 35 existing fbdev drivers were
> > > bypassed and thus fbcon console output for those was dramatically slowed
> > > down by factor of 10 and more.
> > >
> > > Reverting this commit has no impact on DRM, since none of the DRM drivers are
> > > tagged with the acceleration flags FBINFO_HWACCEL_COPYAREA,
> > > FBINFO_HWACCEL_FILLRECT or others.
> > >
> > > Signed-off-by: Helge Deller <deller@gmx.de>

> > As for "why", I think there was a number of private bugs that were
> > reported in this code, which is why it was removed.  I do not think it
> > can be safely added back in without addressing them first.  Let me go
> > dig through my email to see if I can find them...
>
> Ah, no, that was just the soft scrollback code I was thinking of, which

So the bugs argument is moot.

> was a different revert and is still gone, thankfully :)

FTR, not everyone else was thankful about that one...

> This one was just removed because Daniel noticed that only 3 drivers
> used this (nouveau, omapdrm, and gma600), so this shouldn't have caused
> any regressions in any other drivers like you are reporting here.
>
> So perhaps this regression is caused by something else?

1. Daniel's patch was not CCed to linux-fbdev,
2. When I discovered the patch, I pointed out that the premise of 3
   drivers was not true, and that it affects 32 more fbdev drivers[1] .
   The patch was applied regardless.
3. When the patch was suggested for backporting, I pointed out the
   same[2].
   The patch was backported regardless.

[1] https://lore.kernel.org/r/alpine.DEB.2.22.394.2010311116530.379363@ramsan.of.borg/
[2] https://lore.kernel.org/r/CAMuHMdXRgam2zahPEGcw8+76Xm-0AO-Ci9-YmVa5JpTKVHphRw@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
