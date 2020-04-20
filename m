Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D6F1B0DB8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C6A6E59F;
	Mon, 20 Apr 2020 14:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0408C6E598
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:44 +0000 (UTC)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MD9jV-1jZ1Kh3cRN-009AVy for <dri-devel@lists.freedesktop.org>; Mon, 20
 Apr 2020 16:03:43 +0200
Received: by mail-qt1-f170.google.com with SMTP id 71so8430353qtc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:03:42 -0700 (PDT)
X-Gm-Message-State: AGi0Pua3n/iv32gnszP9fwp6q+LBz/xMabp5x4+DQPDGu4vgMPVqUp/F
 f12iU/dzaPIcqkEdOzsg8Ht69dtSypAFJjeYdfU=
X-Google-Smtp-Source: APiQypLgkJfmxem3QQ9mpbfFVWX2Eq7VL/YOi+A92q5vGjWEyme3hEEzHhZFQKp66z7ucvnd+DcBNLfbLLeJTWKGjvs=
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr15982609qtw.204.1587391419935; 
 Mon, 20 Apr 2020 07:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
In-Reply-To: <87y2qq1smt.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Apr 2020 16:03:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
Message-ID: <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Provags-ID: V03:K1:B7DNKizAuJ10ZsrUxxx68aQ6qNX/J/8s7lrhPSqy4faXXc+BWYc
 3nmxAbwg/FXgEGIAxUNi7L1bJtHrSQHqlDPPzdYMwUOkzWonm+p5L2G1VBfAifltrKBk7iP
 OHHobwmKgwy5y+RXiSbdtxawYHXfkeRLV/EeULaYhbLR+INYSWpgfE3RFZR8krs6EedqpTL
 N3XVnXmYTWkKxOUsNXJjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:585zPDJt/y8=:YnOxUiBXQp0VqKlFraiyJU
 AG1IiRreDMdJWxqebX2a+D92kJ2F4lvzTOA/XvDqyc4xNz9joHQCnYqjk3oaABS5XnbhHRi35
 gSwoiWL67LARc3pBAInOmE3Xde2+Qswa9xmpmExHA8zqau7mGjeaJFVAwEtnnb+EWj6DcDsLD
 f9ZCqWgNuomiRu6fosSg8TVJavPAUwXr8AO1vBbCX0VJC//ugSr0Ny1iUVTGrefB8RovXn6/D
 WnbAP0RH+56jorTXyd4VziIVewCDUReetAU4VwLfJhLXmN1Hvx5meeXrwJCSifwuzVEpLDZ8Z
 9bF0zz8xXX+1KIJArRyWtiGouX4R86ZmwIP4YfuDbSeZ0gKlJu6z0ZKpcGebQbUVFH5bMcYp/
 2Wkp6NoF+ReQ62TZjBqZ2/WeeUEfzneofDeabO/Zxkg5kxxfK+sEPVpqMaINcoL0lJ7BbbGPy
 oK3u5Ju5K1OKKWPgBg+VFp9K2Mo3M09TZqPevVv80/CGOyWgv8kwjc7PDd8n3Zwfq4QPDOmRf
 pnJp9bUqAOlbPNiJRS0GdY7Y8iV7hA+LYICNDKSfkS3N4W1OgtxDx1l+XaahzCV6d6NjmNeJL
 5StBq7Mnerkx84baDn3uXtn16bXAAjwrW4bDuay27s9cWnhpBrBN0neNt3+NB4dKA1daw6F6K
 4Y078a55euHpb1ECdC2EW+hZgBQYPK+HqB1V7P4bDsruPyNGPiDNImbFc+r1Q+thP4tIgWVmq
 bwijmgOViJ0Ap9QKBb6c5V5JAYFbD0FEUh3IRt0W1s6miBftCoIUCfmfA5j2QqvN8IMonJj2X
 Vsj1NlkO9MpGmFCHdSEstuXcje6tmE7Xi64EgDpgcfrARR3m7c=
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
 Thomas Hellstrom <thellstrom@vmware.com>, dsd@laptop.org,
 Saeed Mahameed <saeedm@mellanox.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Geert Uytterhoeven <geert@linux-m68k.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
 jfrederich@gmail.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> >> >
> >> > If we can agree on these changes, maybe someone can merge them
> >> > through the drm-misc tree.
> >> >
> >> > Please review
> >>
> >> Biggest concern I have is that usability of make menuconfig is horrible,

No doubt about that, but that seems to be unrelated to the cleanup.

> >> and it's very hard to find options that are hidden by depends on. You can
> >> use the search interface, if you happen to know the option.
> >>
> >> Once you've surmounted that bar, the next one is trying to find what
> >> exactly you need to enable. Which again means endless of recursive
> >> screaming at Kconfig files, since make menuconfig doesn't help you at all.

The changes I'm doing are mostly for fbdev, which is currently the
odd one out. Most kernel subsystems today follow the documented
recommendations and only use 'depends on' for things they
depend on.

Having fbdev be the exception causes two problems:

- It does not make kconfig any easier to use overall, just less consistent
  when it is the only thing that implicitly turns on dependencies and
  for everything else one still has to look up what the dependencies are.

- Most of the problems with circular dependencies come from mixing
  the two methods, and most of the cases where they have caused
  problems in the past involve fbdev in some way.

I also doubt switching lots of 'depends on' to 'select' all over Kconfig
would improve the situation on a global level. It would simplify the
problem of turning something on without understanding the what it
does, but in turn it makes it harder to turn off something else.

E.g. today it is hard to turn off fbdev because that is selected by a
number of (partly unrelated) options, but there was a recent discussion
about getting distros to stop enabling fbdev out of security concerns.

> I'm really all for switching to using depends when that is the
> semantically right thing to do. In many places using select is a hack to
> make the UI simpler, and that's just plain wrong. We'll be doomed to
> perpetual randconfig build failures and duct tape fixes.
>
> I'm pretty tired of this, and I regularly ignore those duct tape fixes
> to i915 backlight build issues on some bizarre configs that nobody will
> ever use, and would not exist if depends were used throughout.
>
> I'm fine with select but only when it's restricted to symbols that have
> no dependencies of their own and have no UI. This is in line with
> Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
> Kconfig tool shortcoming.

Agreed, that is generally a good rule.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
