Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78C133F56
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 11:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19AC6E88A;
	Wed,  8 Jan 2020 10:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2632C6E88B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 10:33:58 +0000 (UTC)
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N2Ujn-1jq1Wc1unv-013xYj for <dri-devel@lists.freedesktop.org>; Wed, 08
 Jan 2020 11:33:57 +0100
Received: by mail-qv1-f43.google.com with SMTP id l14so1153004qvu.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 02:33:57 -0800 (PST)
X-Gm-Message-State: APjAAAXSY0j86j3yDRCI62q6jwKobFaGIRwdyelOB1l+KDmAOat/3hMC
 VMjRdnbDGqpeRL5I01sQM1JRbeGg/3r2CvgA3WU=
X-Google-Smtp-Source: APXvYqxXCQd6CIRrMcZAzZ7Jb6On5M7WksNLfnrFz14xSPP1bwLoo6JqWqEWphK9g72g0rLwxLfzVPITgsRsCo+vDTw=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr3277751qvp.210.1578479636142; 
 Wed, 08 Jan 2020 02:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20200107203231.920256-1-arnd@arndb.de> <87zheyqnla.fsf@intel.com>
 <20200108100831.GA23308@ravnborg.org>
In-Reply-To: <20200108100831.GA23308@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 11:33:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1FKOV=1No7Q0g1vF_NQmVHK+g0VOqzPL499Pxbbt1aPQ@mail.gmail.com>
Message-ID: <CAK8P3a1FKOV=1No7Q0g1vF_NQmVHK+g0VOqzPL499Pxbbt1aPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_panel: fix export of drm_panel_of_backlight,
 try #3
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:eRsQYKnEg0njvqx3H+IlRtECeRKcA0feg+OMp51RGYeuNYl9+YD
 j/nnFp09ck62G+Oewi49RgkFdZXK1BJtQejiru9JLgW9FpNA/AafTQIQGVUSXdd91ccfS9x
 Aczy6QKe7UdAGwFxs+Jzttfq7AaDOHIMq1rfQw5/vGdF/W1YTO4COYB9bGHo17KDHDO/gMq
 ZdWE6+pHaliNipYHpFWhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gfRB3BLjtWc=:XmbDZsy0DtxBCe30gUBVt4
 8YxOR5hCHRMRk9R+wsYHn4edYAleOc/lAgK1NvoJWZHxuT1KJb2s5+1D8lKjsX7WR2dcMlXMP
 a86vHqPQqV8rrjyMuWEvNmzUmENpnz68HGdJsYUh8AfMxb1wYGj3i3EY4uDqP/X/8OXKPuJe1
 d8SHuxq7eU8V78qb/A6n8zHAAvVZF+ChHTO1XTWDcrJ/2mmYlore4XvzUiRiOptfMVJFdI0/M
 Cw/6xn0wRXzRwkqkiX7ERq4RR5/4ROA9io/wsdk8NKJ6s/JfR+9843K0OiPs4hCjDdVZwNv70
 r8tla7Cq7XlWeeABOFApRAaFnapZBiuXMkmMejTOAtHY7BjfZWMF6pDzcJlTNiYQLY3fqw63h
 YkgU1I4Ihwv34sYmQ2p55NI/x6ycsknIDsBu8RAQj9YPGiJwN/6ZJ+ngz35AT9E28OmHlqmzV
 gqOqtQp6Ls16eHfWZyfY5GAgsq8ly7UvHkVb5k7swEEtC6lHiisntoRPLRloAMaU2fcJz2HkE
 lNGzaKYlNepOqnm/mpDS+0uijThwnYsPG/gwXhgRRYhOB9H6nV7jdsXzZ460ji7KypRe/Xavr
 LNCjtE3UUVRVID3DDOd3JWHE14I6sZnTDMdNi8IyTKr/m3rCtEAb0gQXVfT15ovVGtUxj+KHi
 r3UDj+ZXo+L++5JRC06uRXqUlYri1an4pGdsSsRE9nsm3IEGO50bNEIwksphbRBXS+h3q51i9
 nvC3X3fYQ+KRLkH8HCX5zhoxviwpLQLKFaG6+u7pl2/BbeQCop9lLLVvrWpxGviraQ06DAuAd
 RssFV8Fo0L2VMBm47TmLeTbCOYrbSMD0RGaPaJrBv5Cmz4+YAblxxkd/+cBj7Gu6jk53KmE6B
 aBe3jATNbY9yxJoaA93Q==
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

On Wed, Jan 8, 2020 at 11:08 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jan 08, 2020 at 11:55:29AM +0200, Jani Nikula wrote:
> > On Tue, 07 Jan 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > > Making this IS_REACHABLE() was still wrong, as that just determines
> > > whether the lower-level backlight code would be reachable from the panel
> > > driver. However, with CONFIG_DRM=y and CONFIG_BACKLIGHT_CLASS_DEVICE=m,
> > > the drm_panel_of_backlight is left out of drm_panel.o but the condition
> > > tells the driver that it is there, leading to multiple link errors such as
> > >
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sitronix-st7701.ko] undefined!
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sharp-ls043t1le01.ko] undefined!
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-seiko-43wvf1g.ko] undefined!
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-ronbo-rb070d30.ko] undefined!
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-rocktech-jh057n00900.ko] undefined!
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.ko] undefined!
> > > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.ko] undefined!
> > >
> > > Change the condition to check for whether the function was actually part
> > > of the drm module. This version of the patch survived a few hundred
> > > randconfig builds, so I have a good feeling this might be the last
> > > one for the export.
> >
> > Broken record, this will still be wrong, even if it builds and links. No
> > backlight support for panel despite expectations.
> >
> > See http://mid.mail-archive.com/87d0cnynst.fsf@intel.com
> >
> > All of this is just another hack until the backlight config usage is
> > fixed for good. Do we really want to make this the example to copy paste
> > wherever we hit the issue next?
> >
> > I'm not naking, but I'm not acking either.
>
> I will try to take a look at your old BACKLIGHT_CLASS_DEVICE patch this
> weekend. I think we need that one fixed - and then we can have this mess
> with "drm_panel_of_backlight" fixed in the right way.

I had also attempted to fix the larger mess around 'select' statements in DRM/FB
around BACKLIGHT_CLASS_DEVICE  several times in the past, and even at
some point sent a patch that was acked but never merged and later broke because
of other changes.

If there is a new approach, I'm happy to add patches to my randconfig builder
and see if there are regressions in some corner cases.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
