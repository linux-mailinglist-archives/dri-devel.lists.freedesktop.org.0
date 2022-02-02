Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870E64A71E8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC8C10E77F;
	Wed,  2 Feb 2022 13:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CF110E77F;
 Wed,  2 Feb 2022 13:48:29 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 n6-20020a9d6f06000000b005a0750019a7so19506265otq.5; 
 Wed, 02 Feb 2022 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uu884ediVQVvJM3ZzCLfpTG+ntZuBEo87SA1KIuOuM0=;
 b=UuvxzlJp9adTcB4epAAVweTNAsxOGsy+9dgSgBz2IxuUFw2v2WVeVkJQA8SvIqoawM
 BIVikL3qoGFEVX3pciAfMW+Zpbyk6BaaVLApudc0M0u6g6ogN/UqM858NWiK7EJdBW9W
 Wewg6qYRjA8ZYl5c8a1l72R2nU5agi0BR0B3DIgb8YY4jX9wIm9zzm2Du8AOwBkJueQW
 m0j3d3cnwKTw+KmmZPkE2S9t0E6Dzqy6UqV7yCGvIDQBziQWJmsy5pj5gPDiEyEpv8D8
 jiWDXszqcjGVNI2A2hL9T69hJ2Q+m2fnCBvcvPCO0jq5SvsuHJRnbi4vv7QVp2gURKnV
 JMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uu884ediVQVvJM3ZzCLfpTG+ntZuBEo87SA1KIuOuM0=;
 b=XmSC7AMpNM6c8kBhKJmo269vLdfwbRGAzd4bTW1GB/sTC5T2iuTwwI/elKEy0bH6n4
 L6lzLSwm/uWxKpPs+p8uJ1ZgTUSfPRPS+4P592uLf8XB83rr2RGD36oy6xOqKH1ZAv04
 tR20H1MyKebWppQ/wAwq2PH/Dflo+shptPbyYijMwT5sjmr92I9nr2G5nGHQTpDqtcmb
 LNxfn+IujVCsqx2ec16FeOsevuD3OzzWVGiDEiVtECv85A+Aw73XUT6S8TwRFhHi6Py/
 j98U+gB5TgAvD4/0JfpQjqjxupvoQhViKMcKenutk5WcUwp/XjPeDB5CZ10AWMorgbzV
 s4vQ==
X-Gm-Message-State: AOAM531r2HcYlTQATUqdEsMUtFz76uE3g9J14S7D1YTAUzP4yBxhEOYZ
 tvnrEPEYSN6K6jEm/sl1hn72dMMCe+ZfQTSNAVE=
X-Google-Smtp-Source: ABdhPJwigQJstWLtxI0ElSovHNJx6WRVGD0F5N1ydlyffTBNNCafbHWtsFqtK4UihV0E85NiyjbLer9ZQe5qShM0GNk=
X-Received: by 2002:a9d:e94:: with SMTP id 20mr16685522otj.200.1643809708794; 
 Wed, 02 Feb 2022 05:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
 <20220202113126.3rgzqkhnorrbfj6b@houat>
In-Reply-To: <20220202113126.3rgzqkhnorrbfj6b@houat>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Feb 2022 08:48:17 -0500
Message-ID: <CADnq5_M6Q0L7UmXtGryOEL51Etz_MTwM4T1D0rb3KxY1bunUvw@mail.gmail.com>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sven Schnelle <svens@stackframe.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Suarez <cssk@net-c.es>, Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Feb 2, 2022 at 6:31 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jan 31, 2022 at 10:05:32PM +0100, Daniel Vetter wrote:
> > Ever since Tomi extracted the core code in 2014 it's been defacto me
> > maintaining this, with help from others from dri-devel and sometimes
> > Linus (but those are mostly merge conflicts):
> >
> > $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
> >     35  Daniel Vetter
> >     23  Linus Torvalds
> >     10  Hans de Goede
> >      9  Dave Airlie
> >      6  Peter Rosin
> >
> > I think ideally we'd also record that the various firmware fb drivers
> > (efifb, vesafb, ...) are also maintained in drm-misc because for the
> > past few years the patches have either been to fix handover issues
> > with drm drivers, or caused handover issues with drm drivers. So any
> > other tree just doesn't make sense. But also, there's plenty of
> > outdated MAINTAINER entries for these with people and git trees that
> > haven't been active in years, so maybe let's just leave them alone.
> > And furthermore distros are now adopting simpledrm as the firmware fb
> > driver, so hopefully the need to care about the fbdev firmware drivers
> > will go down going forward.
> >
> > Note that drm-misc is group maintained, I expect that to continue like
> > we've done before, so no new expectations that patches all go through
> > my hands. That would be silly. This also means I'm happy to put any
> > other volunteer's name in the M: line, but otherwise git log says I'm
> > the one who's stuck with this.
> >
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: DRI Development <dri-devel@lists.freedesktop.org>
> > Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> > Cc: Claudio Suarez <cssk@net-c.es>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sven Schnelle <svens@stackframe.org>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> Acked-by: Maxime Ripard <maxime@cerno.tech>
>
> Maxime
