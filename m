Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37271B273B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66526E0DC;
	Tue, 21 Apr 2020 13:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148826E0DC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:10:34 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id a2so7286645oia.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CtBUSSUAnONU89jf6Xc+m2AfQq9wgsmNlPGaBPJhUVA=;
 b=fHlp3ep7NmJS/jHkeNPGjgP1wijVBXFXFlG+XimI82LbAPJsOAYc4SkDj5WuqrssPp
 BbIgIaugLit+WPJ8kuaQYeNyeNwPoTOriUW2QB/HR2TdYosxXIYdl+AIU/Ke2qF2tam4
 ZKy7oZIBjKy25ysA3HCmH1DgSIWWD2ZZtyw7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CtBUSSUAnONU89jf6Xc+m2AfQq9wgsmNlPGaBPJhUVA=;
 b=rByCN4vY+Od7Hahs/jwxDFLO4NRcc7zD2ERmdpyw3FLCY8ETCG6Iqv4+6fgqFR4tWb
 mykhzasRfXLKXBxn0uGpznhMcXX18xuOzu2T/34d3N2jSgz+KVrAfylga9zL6NlGkIN8
 4b5CgO07uoD/SGWqMYimXCDP0goQ+h7ygt+cfwDezKnYok6BvU1jTsg9MLXpJ2DjQzIx
 /WKWAKazCfGu7MkarS+tEjCXFzFXy0PhorsvMe7On131dQTygxh7u8n7kFjsiN/Kx6RF
 npQM7/bFwcO1XsaKA/Nmkuu2zwlZG6nnQv17O48O+duS0OVn/1Sm8y8xwF+cHjMknBZk
 in8g==
X-Gm-Message-State: AGi0Pua/2Ag6YD48pv/AVeW28+DRWiYCa21AKQcYRXgGvBrs5qWA5txf
 /x8n+ClnbQS8mPp9Ebx6jmgHI9liHHr3xIZPKmlaBA==
X-Google-Smtp-Source: APiQypIWZ52GsD2DZVv2xOT3Q3brlXihYYeQJdPztYF6TvN250hqCALuL0ItmvQM1WINBEXlETEAkbc7hK8WAC6MUtg=
X-Received: by 2002:aca:2113:: with SMTP id 19mr3062452oiz.128.1587474633238; 
 Tue, 21 Apr 2020 06:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
 <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
 <20200421122726.GW3456981@phenom.ffwll.local> <87a735yp0f.fsf@intel.com>
 <CAMuHMdXRwRe5p65+YM69HDM4BhW+ZuHUju9B9083+=HdCotsqw@mail.gmail.com>
In-Reply-To: <CAMuHMdXRwRe5p65+YM69HDM4BhW+ZuHUju9B9083+=HdCotsqw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 Apr 2020 15:10:21 +0200
Message-ID: <CAKMK7uE7y8TVbZ8ExpDEA2MuvhSDxKQ6y=eDXSbwgjUzsbm44A@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Marek Vasut <marex@denx.de>,
 Thomas Hellstrom <thellstrom@vmware.com>, Daniel Drake <dsd@laptop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Masahiro Yamada <masahiroy@kernel.org>,
 Saeed Mahameed <saeedm@mellanox.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Arnd Bergmann <arnd@arndb.de>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Nicolas Pitre <nico@fluxnic.net>, Jens Frederich <jfrederich@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 3:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Jani,
>
> On Tue, Apr 21, 2020 at 2:58 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Tue, 21 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Mon, Apr 20, 2020 at 04:03:23PM +0200, Arnd Bergmann wrote:
> > >> On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
> > >> <jani.nikula@linux.intel.com> wrote:
> > >> > On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >> > > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> > >> > >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> > >> > >> >
> > >> > >> > If we can agree on these changes, maybe someone can merge them
> > >> > >> > through the drm-misc tree.
> > >> > >> >
> > >> > >> > Please review
> > >> > >>
> > >> > >> Biggest concern I have is that usability of make menuconfig is horrible,
> > >>
> > >> No doubt about that, but that seems to be unrelated to the cleanup.
> > >>
> > >> > >> and it's very hard to find options that are hidden by depends on. You can
> > >> > >> use the search interface, if you happen to know the option.
> > >> > >>
> > >> > >> Once you've surmounted that bar, the next one is trying to find what
> > >> > >> exactly you need to enable. Which again means endless of recursive
> > >> > >> screaming at Kconfig files, since make menuconfig doesn't help you at all.
> > >>
> > >> The changes I'm doing are mostly for fbdev, which is currently the
> > >> odd one out. Most kernel subsystems today follow the documented
> > >> recommendations and only use 'depends on' for things they
> > >> depend on.
> > >>
> > >> Having fbdev be the exception causes two problems:
> > >>
> > >> - It does not make kconfig any easier to use overall, just less consistent
> > >>   when it is the only thing that implicitly turns on dependencies and
> > >>   for everything else one still has to look up what the dependencies are.
> > >>
> > >> - Most of the problems with circular dependencies come from mixing
> > >>   the two methods, and most of the cases where they have caused
> > >>   problems in the past involve fbdev in some way.
> > >>
> > >> I also doubt switching lots of 'depends on' to 'select' all over Kconfig
> > >> would improve the situation on a global level. It would simplify the
> > >> problem of turning something on without understanding the what it
> > >> does, but in turn it makes it harder to turn off something else.
> > >>
> > >> E.g. today it is hard to turn off fbdev because that is selected by a
> > >> number of (partly unrelated) options, but there was a recent discussion
> > >> about getting distros to stop enabling fbdev out of security concerns.
> > >
> > > I've done some history digging, this is the patch that started this all:
> > >
> > > commit d2f59357700487a8b944f4f7777d1e97cf5ea2ed
> > > Author: Ingo Molnar <mingo@elte.hu>
> > > Date:   Thu Feb 5 16:03:34 2009 +0100
> > >
> > >     drm/i915: select framebuffer support automatically
> > >
> > > I.e. driver gets disabled because a new config is added which isn't
> > > enabled. System doesn't boot, maintainer gets angry regression report,
> > > select hack gets added.
> >
> > Gotta love a good commit message from a decade ago.
> >
> > First, it says it's a migration helper. And that the problem
> > specifically is that the user has a working config *without* FB enabled
> > as a starting point.
> >
> > Now, if the starting point for a new config *now* is less than ten years
> > old, and it had i915 enabled, it'll also have FB enabled. Because
> > select. The migration part has done its job, and I think we should be
> > good to make some progress.
>
> It will indeed work with "make oldconfig", as an old config with
> CONFIG_DRM_I915 enabled will have CONFIG_FB set.
>
> However, that is not true when starting with a defconfig that has
> CONFIG_DRM_I915 enabled: such a defconfig will not have CONFIG_FB set,
> due to the trimming process when creating a minimal defconfig.
>
> Hence when making the change from "select FB" to "depends on FB", you
> have to make sure to update the affected defconfigs, too:
>
> $ git grep CONFIG_DRM_I915 -- "*defconfig*"
> arch/x86/configs/i386_defconfig:CONFIG_DRM_I915=y
> arch/x86/configs/x86_64_defconfig:CONFIG_DRM_I915=y

To clarify what I was aiming for with my mail: I'm not worried about
fbdev here, I'm just worried that this will come back, and we'll grow
select somewhere else until it's become a big & totally horrible mess.
I think a lot of the backlight selects have also grown because of
this, so this isn't just a one-off I think.

If Arnd is happy to play "Kconfig select" whack-a-mole ever once in a
while (and deal with the intermediate compile horrors while everyone
upgrades) I'm ok with this landing. Just not terribly happy if the
underlying issue isn't fixed.
-Daniel

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
