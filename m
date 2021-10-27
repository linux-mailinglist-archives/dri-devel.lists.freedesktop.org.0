Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABB43C2F2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F065589D43;
	Wed, 27 Oct 2021 06:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 27 Oct 2021 06:25:13 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB0A6E52F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:25:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MWAay-1m94Y81MXi-00XaYy for <dri-devel@lists.freedesktop.org>; Wed, 27
 Oct 2021 08:20:06 +0200
Received: by mail-wr1-f52.google.com with SMTP id g7so1093957wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:20:05 -0700 (PDT)
X-Gm-Message-State: AOAM533q1cbQ+/76xqkxT3+aRBIpCx0UGmTSD4MXn8sayGy+wB2Y8U8M
 LBsS+KHqt1QxYYB2h9Ett/AZNnL0Ep7Go7VnmB4=
X-Google-Smtp-Source: ABdhPJyy7nMJ2AqnRxxIsziFa0nrcomvSIh2Cl1eTfL7Cca9Sa5hYBCRHYi7xeYQozcc/3b5PTQdRRvxP40Y1dTgIRA=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr37906808wra.428.1635315605492; 
 Tue, 26 Oct 2021 23:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
 <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
In-Reply-To: <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Oct 2021 08:19:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
Message-ID: <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0FQyCnvqFjnVZYT7mLfFNQPaIsiguhTzANudtZmjsWlIHGThwY7
 xN34ygcgkQvGJ0tXY1bnTteaVXNZCSGIxSP1nFJZTE670pwsKKrgmI5cW3xlkzHZJjpW3K8
 vcGPraDL9ZA8jO42pKjCNz0ieH6zEQU9fTMhs0GbtEZMoUOsLeO8B/vxJMWOSed6LDgeyMP
 4oiFHImrGEsXG7AHzqwWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j5LQT42nyVs=:0q2BTb84FUUfS0L6NhCM5e
 EGozcorZeBezacXIgq+pyz0pucb+IWmQS6arKTHh5/1FK8NWP2SkUEljQR3SIW2u7JdHHchBn
 QhDoXOJI1JVcbizJ3VfFVFABkgIpSBedAAYlT0SzLM7hO2F2jtMPeOPm3Q3GJgeWoVLSwrIzf
 Ij1biZasXoJbnwE1qfVS2kjVVTQJ41Bgp0/5y4Jo0eKFpzddNMJQF9KwxnjAkDTH/Se5XEriX
 pD0yxOgypyw/5SYTa5sQ8PUOKnCjL9gamFWW703NUiqCWYojhg8DVeB3fxRBTcNagITNeSO99
 MwLRZPn0H5Ukg4dL8G3GbIJEcDzZIYm9Bg1hDHyU0ohcnsRC9shaV5u7jpPoxekAOCW9VtNmZ
 ehnSMXcgu4b4iNyVJwEU6tOox7NL7gv545DPpBVO1K44eSKqgaeY6hUzhva/4YX36cmI6nyDw
 QJmDBy8iudCHMXBXE2lul4ej6c2/lZXGEUbruGp22+5IxJ54X7LFWr4tgRpOmpzy4dYnkkR95
 IOmMZ6QaODIZbMySYpXQarbbGRZ3i49qoKR/Oha2BV/lOx1swHxztaTWWc/nTipwQRAGifc2U
 LP1Iw62GfttNuOP1S0eBMIznBx3b4q9b7UQnOW+d+XLp8Bvwa9RM2UJuMHWYEoCPsDf47fIHi
 Dg6ZW1HmvCObyW14iYpGJKk+9wJrjeSMs5fFMUPi8/IC2zZIwq1BuuGDxq9hEFBc94Lo=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 2:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> >
> > Looking at this config, there is:
> >
> > CONFIG_DRM=y
> > # CONFIG_DRM_DP_AUX_CHARDEV is not set
> > # CONFIG_DRM_DEBUG_MM is not set
> > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > CONFIG_DRM_KMS_HELPER=m
> > # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> > # CONFIG_DRM_DP_CEC is not set
> > CONFIG_DRM_GEM_CMA_HELPER=y
> > CONFIG_DRM_KMS_CMA_HELPER=y
> >
> > GEM_CMA_HELPER depends on KMS_HELPER, but the latter is a module. That's probably the cause of the problem. Is it intentionally set this way?
> >
>
> The only drivers that select DRM_KMS_HELPER are both =m, so that's how
> DRM_KMS_HELPER is set also.
>
> Symbol: DRM_KMS_HELPER [=m]
> Type : tristate
> Defined at drivers/gpu/drm/Kconfig:82
> Depends on: HAS_IOMEM [=y] && DRM [=y]
> Selected by [m]:
> - DRM_ATMEL_HLCDC [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && COMMON_CLK [=y] && MFD_ATMEL_HLCDC [=y] && ARM [=y]
> - DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && (COMPILE_TEST [=n] || ARCH_ASPEED [=y]) && MMU [=y]
>
>
> I did the ARM cross-build and also see the linker error.
> I didn't understand why -- and still don't, but here is a little
> speculation:
>
> In the past (e.g. 10 years ago), we have to move some .o files
> in lib/ from lib-y to obj-y so that they would always be included
> in the final object file and not cause their user/caller object
> files to suffer from undefined references.
> These happened because unused functions(?) in lib-y files are
> stripped out of the final object files.
> The same thing could be happening here (still just guessing).
>
> Does that help any?  I dunno.
>
> Adding Arnd to Cc: to see if he has any ideas...

From all I can tell, the problem is that DRM_KMS_CMA_HELPER is a 'bool'
symbol, so if it gets selected by a '=m' driver, it turns into '=y', which
then selects DRM_GEM_CMA_HELPER=y, but that one cannot link
against DRM_KMS_HELPER=m code.

This trivial change makes it all build:

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c08860db2520..699f434ce813 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -218,7 +218,7 @@ config DRM_GEM_CMA_HELPER
          Choose this if you need the GEM CMA helper functions

 config DRM_KMS_CMA_HELPER
-       bool
+       tristate
        depends on DRM
        select DRM_GEM_CMA_HELPER
        help

but this needs some more testing to make sure it doesn't add
any other regressions.

Interestingly, I never hit the problem in randconfig testing since
there is always some '=y' driver that selects DRM_KMS_HELPER.

        Arnd
