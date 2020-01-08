Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39493134CFE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 21:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314236E8C1;
	Wed,  8 Jan 2020 20:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49006E8C1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 20:17:51 +0000 (UTC)
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MyKU6-1jcxyz3gLs-00ydvb for <dri-devel@lists.freedesktop.org>; Wed, 08
 Jan 2020 21:17:50 +0100
Received: by mail-qv1-f45.google.com with SMTP id z3so2010478qvn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 12:17:49 -0800 (PST)
X-Gm-Message-State: APjAAAVxvKG8seeW9wHXk1f25KzKAKUsl3Lc30cQ6lRhVhpnfIKw6ofO
 jGDp4SuTftNnGjhSor3bZdFGneFg1scLevmX8GQ=
X-Google-Smtp-Source: APXvYqzAnhWsLJVUU5gIZirzQYVUkqnaExIjs6+GxvB+JpeQ3bcq39GJcmTczRoqMdXQWqf27Oikx5ybv5fsl0NqlYk=
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr5886413qvo.222.1578514668816; 
 Wed, 08 Jan 2020 12:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20200107203231.920256-1-arnd@arndb.de> <87zheyqnla.fsf@intel.com>
 <20200108100831.GA23308@ravnborg.org>
 <CAK8P3a1FKOV=1No7Q0g1vF_NQmVHK+g0VOqzPL499Pxbbt1aPQ@mail.gmail.com>
 <20200108164618.GA28588@ravnborg.org>
In-Reply-To: <20200108164618.GA28588@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 21:17:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1TmfqXA3gK0YwbPBSeydEs=b8Tae=JWvju4OZaSMUscA@mail.gmail.com>
Message-ID: <CAK8P3a1TmfqXA3gK0YwbPBSeydEs=b8Tae=JWvju4OZaSMUscA@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_panel: fix export of drm_panel_of_backlight,
 try #3
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:FvlkvLJncsQQXxjj6NMzHIw6eN/sD+osCwWPNACfL6qQ56DtKUy
 NTVObpX2uXXOygN/eOMxDVfxm2iFPhBitzS/OPfRaJ71/rfJAXx3QEcEFsweRjWAIj4ZHcz
 MpmUGfXu+Vwj19z6fC1Z4FHyydtHsBwcyft2OVYdC9iq1NbhubtcQK5Gt1bKYmIjEcYxtRt
 8uM9aOdlcSXO4s6BM4MUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7w9LyOMzNCE=:TcBvV8sehXCwIg7WEH2mLT
 9yLHbrjtfOQW09sHCaWSmzviuYKvWtSz+y/EvXWEuFrxDQ5KySWu5SylLYsfZ03GJBJbKrTSZ
 ZYJBgSllVaxQRFq7t2VFY1zwLnGohoJUQkkacsXGM3CBkR7SWKpoGcoYPfutjx23xGw/m/lu4
 tdjcNP2IGpdUpVOjI1+wFJhRuT/YtU4n8qnwkB5sXjr3Q4gMmnFkpdBiWPiGTqUtmHx9Wa01m
 RaqlcJU4wwsryQYEovIM1QrkY0F0zxXpxyYR/BWHBK0MuV6+Q2+SbTLob0AFsbPBvi1tU7+fZ
 e8MM/wbE7JbceXA0SVnH00VXeJZNWSDOpjqfUaXMrREpbPiQJIjuDLLNKM72bE0SyNMSz7Jim
 De7GnhDiQlxQjXVUP4KXZVRllDpG80+w8qhJZRNxwtD4SLBEV5jaQFYr5z1c9ddqcsNY80VAA
 Aa2ga5Qw1hFyYaxFn+3+pppKdc/DW5AaPtzELIFeI07AJazTSAMGHrKrpvnmuAubcAN3KNPhf
 bgYfuAgCVIyi6C/ubFrSyOZRsOLeaZ9S+lmUbHmYDg30nQxk/IqIhSXzHy1WmL5UiIFvxDZWW
 G6hpRN+dny5osB/VaDS4LYs7TgHvZFzkGavyR9qypopKzGlbxZySRPf4EEPJVev0jpJg69zfl
 ebwLJT97mxMV/TzKmNwmxdBej+c5FhHP2wuqyWzuIMT1Kym5w3nu69FPLSG7zsvCUIbhXek40
 ZRE6uQwCwnyx0hv3dbpzZDwobpHjLbLyLoHisVtW6C5riaLP6z/cXYdG55Rp2HHgvrhFfDcxY
 WGxLZdI4oBNrFB42+KDLyh2q6y5mVW002a0Ab5mCXHSTmz0YDS24eQ9J2Hn45b9MrUKiePaQr
 Nj+n1k9Uc/0522Pv/EJQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 5:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Arnd.
>
> > > > All of this is just another hack until the backlight config usage is
> > > > fixed for good. Do we really want to make this the example to copy paste
> > > > wherever we hit the issue next?
> > > >
> > > > I'm not naking, but I'm not acking either.
> > >
> > > I will try to take a look at your old BACKLIGHT_CLASS_DEVICE patch this
> > > weekend. I think we need that one fixed - and then we can have this mess
> > > with "drm_panel_of_backlight" fixed in the right way.
> >
> > I had also attempted to fix the larger mess around 'select' statements in DRM/FB
> > around BACKLIGHT_CLASS_DEVICE  several times in the past, and even at
> > some point sent a patch that was acked but never merged and later broke because
> > of other changes.
>
> Any chance you have the patch around or can dig up a pointer?
> My google foo did not turn up anything.

I found it now:
https://lore.kernel.org/lkml/20170726135312.2214309-1-arnd@arndb.de/

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
