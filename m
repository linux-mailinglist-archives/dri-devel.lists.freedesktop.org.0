Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DC13C274
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396146E9CC;
	Wed, 15 Jan 2020 13:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE526E9CC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:17:18 +0000 (UTC)
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MgzWP-1jJ4fh0Hcb-00hR8R for <dri-devel@lists.freedesktop.org>; Wed, 15
 Jan 2020 14:17:16 +0100
Received: by mail-qv1-f51.google.com with SMTP id l14so7296348qvu.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 05:17:14 -0800 (PST)
X-Gm-Message-State: APjAAAWS2xsqXe4YxPenMBli3q7JkKKmcELon5EeK1PG61q/dmWwDuWn
 dyVvJ0mW+LVgha5MFambiHIFpjyjdXML7jBZkcY=
X-Google-Smtp-Source: APXvYqw6NIFS97lqecGyqkucJJ9eR92lH8OkYLUR/9zn7Yxt/NLRzeCcRu106nWrGyp9+B+UV4pv/9O/RYpLvGnJKEc=
X-Received: by 2002:a0c:d788:: with SMTP id z8mr20666215qvi.211.1579094234004; 
 Wed, 15 Jan 2020 05:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20191029182320.GA17569@mwanda>
 <CGME20191029190229epcas3p4e9b24bd8cde962681ef3dc4644ed2c2e@epcas3p4.samsung.com>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
 <fd4e6f01-074b-def7-7ffb-9a9197930c31@samsung.com>
 <CAK8P3a2uLm9pJtx42qDXJSdD71-dVW6+iDcRAnEB85Ajak-HLw@mail.gmail.com>
 <6ed59903-afe7-d5b2-73eb-ca626616dd6f@samsung.com>
In-Reply-To: <6ed59903-afe7-d5b2-73eb-ca626616dd6f@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jan 2020 14:16:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3SJZ+j0jzYGtETaLGUXwwn0WqjN+wojUrYngOui9+h7A@mail.gmail.com>
Message-ID: <CAK8P3a3SJZ+j0jzYGtETaLGUXwwn0WqjN+wojUrYngOui9+h7A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
X-Provags-ID: V03:K1:2Aj6vF/QtQP6DLVRPDSkZ3d6Ev3Gl5ZIzQNYLkU+mJiGreYknTs
 sD3wiO5PdbwU02u3j1vhvZIgqlV0/tpW2S19BrXo7jHgqhRYmRoGrUswSZ3t3Mc/lhAs8IT
 gWKFkEW4LIY56G9Efd5ihaWQUo7D6pvf6A8SQ/G0fn1iGARqU0fRALB8VtkM6R8ht4z0n7X
 y7xkZOw8enf5TdCscFpIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hHAfE38rQAc=:bUgdVuiPwnzAUAPRciKWlF
 L2TCL50cYLvsE6hXPkXA6zkaPmTR/VY+YuwB98WXyv8+XEVYKv/Sicm/7V5aerjOA9UHjoxWX
 pf13LFsHhiYFOetQuUsOf47Uo7Ihu4gey77lPngXT+D/lnBOf6nbKvWpTxWE3dEAnBVSen3c5
 vSfGkroPNJR/bTYXvqX+gKThEezeq9gXtFmXrl/tx1CCszs75Kbbq2jrY94mFTv8JDxcrqSLI
 ZoEYUiqIzKxaBIzfExQI8Cg3f7sewmhIvGQAjf2tlC/1UspxuvMUcI4rs11wMxvogqdQgBQLM
 SHGyhMi5eOhQH8ip3lAgbrjZxGVXpGZ/7boz45N7gqQjmzCzHPHnvvGfFwiUPj2avkn8f0xym
 TDgd9L7SF8xfOh6ywYsUcgHi2sXp4ZeFHEaX+f8VTDGui89lSg9mUk5P6TUDnn8/6EWdriKJm
 1K7PDB2wG9FrqbhC+peV+1EB3Iz0mCrg9xMe6yxVP10TN7t5T8Zdvp70EkNwF6ySUJPGvWQHP
 7TrTsFyg4uKHtM8C7dMrSM4j+Pwt8F+ss9xs6ucayUBuTMavtWTQWSBeBWjsmRzupMCdrRVI7
 4ySUATXR8FRrsrivbFgMzQKU8SSd/KMyYIzUkqlEdTNhfKZrrkqrqzrZrv93oBPPqUCXZJy0J
 zEyPrAeTfnCpfcapM+ZsHaFYOqBAR+/kzhY43Ok5ab0mPu2TBx3uL/85cmUFmsioPSupGpGen
 i7nv0+euHBkC6IQ79IJm0Ms8sc4BYVgiyL86tn3tpPfD4Ww5JQ1VnBm8lAYU1XTT2lmXSabBE
 0mKRAF9A1CLAB+lGfOtPjlEiArCEnOrk7rkk7NImL6IdtHBcKBgznPKSbnPgCgtvJGFu5SALZ
 0uHZZkhIVH6progD+rlg==
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

On Wed, Jan 15, 2020 at 2:09 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

> > $ git grep -wl register_framebuffer | xargs grep -L framebuffer_alloc
> > Documentation/fb/framebuffer.rst
> > drivers/media/pci/ivtv/ivtvfb.c
> > drivers/media/platform/vivid/vivid-osd.c
> > drivers/video/fbdev/68328fb.c
> > drivers/video/fbdev/acornfb.c
> > drivers/video/fbdev/amba-clcd.c
> > drivers/video/fbdev/atafb.c
> > drivers/video/fbdev/au1100fb.c
> > drivers/video/fbdev/controlfb.c
> > drivers/video/fbdev/core/fbmem.c
> > drivers/video/fbdev/cyber2000fb.c
> > drivers/video/fbdev/fsl-diu-fb.c
> > drivers/video/fbdev/g364fb.c
> > drivers/video/fbdev/goldfishfb.c
> > drivers/video/fbdev/hpfb.c
> > drivers/video/fbdev/macfb.c
> > drivers/video/fbdev/matrox/matroxfb_base.c
> > drivers/video/fbdev/matrox/matroxfb_crtc2.c
> > drivers/video/fbdev/maxinefb.c
> > drivers/video/fbdev/ocfb.c
> > drivers/video/fbdev/pxafb.c
> > drivers/video/fbdev/sa1100fb.c
> > drivers/video/fbdev/stifb.c
> > drivers/video/fbdev/valkyriefb.c
> > drivers/video/fbdev/vermilion/vermilion.c
> > drivers/video/fbdev/vt8500lcdfb.c
> > drivers/video/fbdev/wm8505fb.c
> > drivers/video/fbdev/xilinxfb.c
> >
> > It's possible (even likely, the ones I looked at are fine) that they
> > all correctly
> > zero out the fb_info structure first, but it seems hard to guarantee, so
> > Eric's suggestion would possibly still be the safer choice.
>
> I've audited all above instances and they are all fine. They either
> use the fb_info structure embedded in a driver specific structure
> (which is zeroed out) or (in case of some m68k specific drivers) use
> a static fb_info instance.
>
> Since fbdev is closed for new drivers it should be now fine to use
> the simpler approach (just use memcpy()).

Yes, let's do that then. The complex approach seems more likely
to introduce a bug than one of the existing drivers to stop initializing
the structure correctly.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
