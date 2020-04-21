Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243291B25FA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2986E931;
	Tue, 21 Apr 2020 12:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBE26E930
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:27:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v4so2411375wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qmU6VDakv65FJJosETAWKCa3cyDJLx7WYQNvdAP44Tc=;
 b=EAg0osLEXbJbWQm56pz5XD/2fbzlf5SovRIg5pAvRfRyfFO2ffE2Lpu3rRDGKaDsxq
 jFGbPaQbuSXwz1XKPN9r2TKQ1/NSMgY3CmMa7vSSJc2p9+GrbpWtZ0iZN/lbzEmhq1oR
 Rau8FDs4Jhb1sQ3m3Ip5VwijA0ScmDaZRGUT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qmU6VDakv65FJJosETAWKCa3cyDJLx7WYQNvdAP44Tc=;
 b=pgN/duGMzkE+1kxsZ69bAqDs6Hz2r18TT8QRaoQH57ZwoOQSq4h+UFLZ2Dx+KHO0hA
 iOvehFQf6+p9WOjl5SnlJ0c6i+CfnFsRP+DfTR6BOgjDrQGKp7/TXaOBKptqx6tDF9Lb
 /CY72wn9hkKMklHBSDn3HXvRPchpX/nT9s+EOWKrptdOoSCYix5V6MKyrOjRbXY5i1yA
 0RLVQeM2cARRPCNPRoDgsL/gdcgrADMyRfzUUF6AEXJ1WOBQOaPD1JQ2P0wAslj7YpGl
 8xugPLEk4bA+jSlxiG/L6J/gEmQT00Io8PM7dEYyAzbVOYCPqeta3zCQlPlc5tW51SBR
 z1Tg==
X-Gm-Message-State: AGi0PuaJix0zF/RMX6sz6MVIdE1EdtYXMyOJn0av3glBR+6NKZMVd+r+
 4NXoldILMv6kTneTxFCgs/IACA==
X-Google-Smtp-Source: APiQypJU5xpo8/LAIgPDWow0ew55pmwU5prJYaxGXB+BkqZ9w31v+W9HGZG0ezIJsqD8WKBNwhKFfA==
X-Received: by 2002:a05:600c:4096:: with SMTP id
 k22mr4294659wmh.99.1587472049580; 
 Tue, 21 Apr 2020 05:27:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm3734848wrs.81.2020.04.21.05.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:27:28 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:27:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
Message-ID: <20200421122726.GW3456981@phenom.ffwll.local>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
 <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Hellstrom <thellstrom@vmware.com>,
 dsd@laptop.org, jfrederich@gmail.com, Masahiro Yamada <masahiroy@kernel.org>,
 Saeed Mahameed <saeedm@mellanox.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 04:03:23PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
> > On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> > >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> > >> >
> > >> > If we can agree on these changes, maybe someone can merge them
> > >> > through the drm-misc tree.
> > >> >
> > >> > Please review
> > >>
> > >> Biggest concern I have is that usability of make menuconfig is horrible,
> 
> No doubt about that, but that seems to be unrelated to the cleanup.
> 
> > >> and it's very hard to find options that are hidden by depends on. You can
> > >> use the search interface, if you happen to know the option.
> > >>
> > >> Once you've surmounted that bar, the next one is trying to find what
> > >> exactly you need to enable. Which again means endless of recursive
> > >> screaming at Kconfig files, since make menuconfig doesn't help you at all.
> 
> The changes I'm doing are mostly for fbdev, which is currently the
> odd one out. Most kernel subsystems today follow the documented
> recommendations and only use 'depends on' for things they
> depend on.
> 
> Having fbdev be the exception causes two problems:
> 
> - It does not make kconfig any easier to use overall, just less consistent
>   when it is the only thing that implicitly turns on dependencies and
>   for everything else one still has to look up what the dependencies are.
> 
> - Most of the problems with circular dependencies come from mixing
>   the two methods, and most of the cases where they have caused
>   problems in the past involve fbdev in some way.
> 
> I also doubt switching lots of 'depends on' to 'select' all over Kconfig
> would improve the situation on a global level. It would simplify the
> problem of turning something on without understanding the what it
> does, but in turn it makes it harder to turn off something else.
> 
> E.g. today it is hard to turn off fbdev because that is selected by a
> number of (partly unrelated) options, but there was a recent discussion
> about getting distros to stop enabling fbdev out of security concerns.

I've done some history digging, this is the patch that started this all:

commit d2f59357700487a8b944f4f7777d1e97cf5ea2ed
Author: Ingo Molnar <mingo@elte.hu>
Date:   Thu Feb 5 16:03:34 2009 +0100

    drm/i915: select framebuffer support automatically

I.e. driver gets disabled because a new config is added which isn't
enabled. System doesn't boot, maintainer gets angry regression report,
select hack gets added.

Note on the specific example the code has been reworked enough that even
if you'd upgrade the kernel all that would get disabled now is the fbdev
emulation on top of drm drivers, not any of the drm drivers.

The above says we should have an automatic system for at least oldconfig
(but would be nice in menuconfig too), since "break user's kernel on
upgrade" isn't an option. And without that select is going to come back
somewhere and make a huge nasty mess: We're definitely not going to
fix Kconfig when fixing a regression in -rc kernels.

So in theory no need to convince me that select is terrible. Practice
disagrees unfortunately.
-Daniel

> 
> > I'm really all for switching to using depends when that is the
> > semantically right thing to do. In many places using select is a hack to
> > make the UI simpler, and that's just plain wrong. We'll be doomed to
> > perpetual randconfig build failures and duct tape fixes.
> >
> > I'm pretty tired of this, and I regularly ignore those duct tape fixes
> > to i915 backlight build issues on some bizarre configs that nobody will
> > ever use, and would not exist if depends were used throughout.
> >
> > I'm fine with select but only when it's restricted to symbols that have
> > no dependencies of their own and have no UI. This is in line with
> > Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
> > Kconfig tool shortcoming.
> 
> Agreed, that is generally a good rule.
> 
>       Arnd

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
