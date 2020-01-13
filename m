Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C681139165
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 13:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C0389E36;
	Mon, 13 Jan 2020 12:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDD289E36
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 12:49:50 +0000 (UTC)
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MtO06-1jf6TS3SQg-00uqWp for <dri-devel@lists.freedesktop.org>; Mon, 13
 Jan 2020 13:49:49 +0100
Received: by mail-qt1-f175.google.com with SMTP id g1so8905263qtr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 04:49:48 -0800 (PST)
X-Gm-Message-State: APjAAAVV0tby+L1dpG6lLnlueC6RVJ1v9AIG03lMSnfe9oeYWeiLpMqj
 i47Z7pTMwATYrsD7x8ChskvrSP+4ZHPTc6d2QVI=
X-Google-Smtp-Source: APXvYqzFNee6oMqlwdnJFaK96+kqQeTvX1mVko2+fsSOjGGm7mJkzAnLuZGtaJ8nkF1quBL2liWsixLifYLOWUujuDc=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr13837250qto.304.1578919787752; 
 Mon, 13 Jan 2020 04:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20191029182320.GA17569@mwanda>
 <CGME20191029190229epcas3p4e9b24bd8cde962681ef3dc4644ed2c2e@epcas3p4.samsung.com>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
 <fd4e6f01-074b-def7-7ffb-9a9197930c31@samsung.com>
In-Reply-To: <fd4e6f01-074b-def7-7ffb-9a9197930c31@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Jan 2020 13:49:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2uLm9pJtx42qDXJSdD71-dVW6+iDcRAnEB85Ajak-HLw@mail.gmail.com>
Message-ID: <CAK8P3a2uLm9pJtx42qDXJSdD71-dVW6+iDcRAnEB85Ajak-HLw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
X-Provags-ID: V03:K1:8fdrcuQ+1Ivcgam6LzqNpcEXrfYQs/uhkB0FxAskpIjVsqK+qoV
 BtCVrMcMjAHXXtD25hmM/uVTuV8h6HoOwShA02P+WS/3cj+w69scG+ixIXrit03mukiWX2W
 tUkkbBEii54WCw5qk+bES1ip8t6Kq2xhPgBBme6DjO4OZ+y3vtGzkLlO65Erpdw1zj1fQFa
 M1pzATxC4WWaniCk71mEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7XrP/BptEp0=:KT+iYU+aQk2MAWWeNKIKRz
 kg0NMALvnRKyDsOoAZ46oB6P/ruuCRTKy/45H/ji+0rbjH2nAbLw13mT+OiVfFdA5jJzpU2Um
 yDUw+igZMb5JfFeffrPYvNInvdvHCIZ33DqoONQoIhwbwpQl0CpiWejAIZ/KYRk9aZvae1GOq
 Rnxw5fOuJfIfehlQJW1MykVTlDKm9JIQNj5nJXIQkJ8ehBu0y7PcyPnsUNXlsRzYxBZZSWpOS
 cj0qYRuEnx76IjP+SNNGVND5pAu/MOcKWZz2xSSN4nJDL3mOgUci4lVWjSlYsFXmYxxfMVItl
 xzJZZyhOm9S0MlOiUZeGiwQlQJosN9Z0bYzrva1qgeldL46ZqRv2OceEp3/r3ZSTG5G/i/xOR
 P6nZkRM3zv5iI9OvxOOjG914TiXCMrYl6vPKiJtbDMc1SAfuV9Z9fhilylorKxXZzIH9Cd4gu
 B5O+u1C3jyGWbYJWh56Aj175Jm9rW601OYi7EMtKGAFbN7L+JMAFgBkHVBSvv66DtlhBZGV5D
 XF2fkxlyiNMMeeSW8nchMBbjgP4RX8APxdXwxBbG5/EmqunJhyECH1PMSk6h+6w+SSvHsrp52
 y/zUOEgG2F5oItjhjGgj308Lmes6niye9LR1YWcDsVp7gwMh4vDeQVJKm8/i6m/l4VDLVlMO/
 bEsVCm+cns+cjt0acQzlyAXCgGCTjVS8kRruJnha3z6yWpctEJqAdKzOruAzecy20yuTlFv+O
 RRf70qRtgl71iYt461sE6aRfrn+9R7E8MMJJdSkr9Wn2xox4WEWidL8Dg7JkPvU8dvRMwl9Mu
 txqP3jcAdC44gZ1l2C+o8ZUYtAf9XS1DUdgvCvuEkgGRXXxrKgGvR6w3Xq8wMuUzTa02Ss45n
 B38XBjIGprDoGUk039hA==
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
 security@kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Julia Lawall <Julia.Lawall@lip6.fr>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Joe Perches <joe@perches.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrea Righi <righi.andrea@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 2:09 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 10/29/19 8:02 PM, Eric W. Biederman wrote:
> >
> > The goal is to avoid memory that has values of the previous users of
> > that memory region from leaking to userspace.  Which depending on who
> > the previous user of that memory region is could tell userspace
> > information about what the kernel is doing that it should not be allowed
> > to find out.
> >
> > I tried to trace through where "info" and thus presumably "info->fix" is
> > coming from and only made it as far as  register_framebuffer.  Given
>
> "info" (and thus "info->fix") comes from framebuffer_alloc() (which is
> called by fbdev device drivers prior to registering "info" with
> register_framebuffer()). framebuffer_alloc() does kzalloc() on "info".
>
> Therefore shouldn't memcpy() (as suggested by Jeo Perches) be enough?

Is it guaranteed that all drivers call framebuffer_alloc() rather than
open-coding it somewhere?

Here is a list of all files that call register_framebuffer() without first
calling framebuffer_alloc:

$ git grep -wl register_framebuffer | xargs grep -L framebuffer_alloc
Documentation/fb/framebuffer.rst
drivers/media/pci/ivtv/ivtvfb.c
drivers/media/platform/vivid/vivid-osd.c
drivers/video/fbdev/68328fb.c
drivers/video/fbdev/acornfb.c
drivers/video/fbdev/amba-clcd.c
drivers/video/fbdev/atafb.c
drivers/video/fbdev/au1100fb.c
drivers/video/fbdev/controlfb.c
drivers/video/fbdev/core/fbmem.c
drivers/video/fbdev/cyber2000fb.c
drivers/video/fbdev/fsl-diu-fb.c
drivers/video/fbdev/g364fb.c
drivers/video/fbdev/goldfishfb.c
drivers/video/fbdev/hpfb.c
drivers/video/fbdev/macfb.c
drivers/video/fbdev/matrox/matroxfb_base.c
drivers/video/fbdev/matrox/matroxfb_crtc2.c
drivers/video/fbdev/maxinefb.c
drivers/video/fbdev/ocfb.c
drivers/video/fbdev/pxafb.c
drivers/video/fbdev/sa1100fb.c
drivers/video/fbdev/stifb.c
drivers/video/fbdev/valkyriefb.c
drivers/video/fbdev/vermilion/vermilion.c
drivers/video/fbdev/vt8500lcdfb.c
drivers/video/fbdev/wm8505fb.c
drivers/video/fbdev/xilinxfb.c

It's possible (even likely, the ones I looked at are fine) that they
all correctly
zero out the fb_info structure first, but it seems hard to guarantee, so
Eric's suggestion would possibly still be the safer choice.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
