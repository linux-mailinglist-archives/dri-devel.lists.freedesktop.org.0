Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDE43C349
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCD06E51D;
	Wed, 27 Oct 2021 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09226E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:50:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M2w4S-1meWqa3Feu-003KAe for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct
 2021 08:50:56 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1432974wmz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:50:56 -0700 (PDT)
X-Gm-Message-State: AOAM532FKxb176Ldg5V0q80vraH8FF45e0YuJwmjQ1bhNoEaoA91Rr/y
 BzW9fz0xikOSW1l9fSC9kpErp55mrgUEJZYr1lc=
X-Google-Smtp-Source: ABdhPJwQCZU65OJ5le40ErfDG3lMpipzGPEQQiKR+5p4NqDSNXnQjgYl35DAhfFkrtD8UsNvlTNRmWPFObv6j8fyG5M=
X-Received: by 2002:a1c:4489:: with SMTP id r131mr3881742wma.1.1635317455940; 
 Tue, 26 Oct 2021 23:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
 <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
 <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
 <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
In-Reply-To: <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Oct 2021 08:50:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
Message-ID: <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:r6pij2JZAITwn8aj+fKIQdV3yThGgNaTxGrU66wnQ2cuvFV/0jJ
 PPDVYBj40/CCiAY0ijtEV4/xiFKEl+rrUyUR2/8Bk/rPb6I5S6lx9gnlJItNLLYqVBV6T6l
 YQGXDAL4CzshV08jlU3WaHF0JuHurflon5WV7dvw/pKSGx44gu6SoxUf7vDZvSYkHnqymrt
 fjKw78+GZZnaNr0GUvFww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jc4ShQmhzc4=:I5i4R63IbdAR75+sY6v2Ku
 QMXr+ksaJs3wuveG4hAVqPGpfYAdZL2Letc2dCcAfLc9D31f2BULoI0B7Gkl24nEVV9g0xj9F
 HSpL1OwzRGmX3rc8BCFLehtxQu3gUAvTUfSOWYQ1Wzlmeh3mgMFqCdneK2Z0mr7ty8h08JCov
 r8jywICcJ43bE7EivpJoOa8VRVseevcS6wbSYyXGbKL8a+XPL+ntz2JcXndFGYYBb4V6IH9Q0
 cSxxSsTmV8rqeDjzBAWYbjcDl4iAWKkbyRt9wUmI128SMk8a1igRe2+W3CNzeyz0uL3Kgt/UQ
 P125MglfaqbqHwRUmhxI4K7cJcxYh6aoCr7OjD3pEmrObnkcGhIkKp4oZNrb/vPznzlGI8UNR
 1ZYgOJE6JhrOpLBF8pR1mREzMAXonBIF9bWbsAUh2nE1nf2m+5O0YVFF+k/3v33jmCjNhZPqW
 Bg9yrIaaVX667cJtDMMbMmA4GS0kLjrHqR7Cd929ll3jQ61Wuj/ey+fd7JsZvPvAoxOOcNipX
 VUM9ElD6LI7G1t3x0sL0SO/SCKUnXdZuloB0E41gZ0HndMor/Y7C5p3h85uymnenPdbTIebE+
 Q6f2UahA50H7HO3nGO5HqzkD0VSC+MVTfzvxP2Uz22qm1j/iDRg1C5L9aPOxX5g/ndkVRPb/S
 ID1wpCyXk5IZvnIRltVLIf7d35P2lT327P1i+/wUIQw1Pz5JKtdwImFublz/HCO/gnlnEEwyV
 BzpDxcoL5CW/MNNWOvlKPTTzZJgE8tVVIN8iYnBOb1m4Ko5v0VekgslGEGeDdTQ6KMwuuX4po
 5qsY2eYi/5g84PE/LiAQovI1feTXmIblIFEXkq/2itKtH08y00=
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

On Wed, Oct 27, 2021 at 8:26 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/26/21 11:19 PM, Arnd Bergmann wrote:
> > On Wed, Oct 27, 2021 at 2:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> > This trivial change makes it all build:
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index c08860db2520..699f434ce813 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -218,7 +218,7 @@ config DRM_GEM_CMA_HELPER
> >            Choose this if you need the GEM CMA helper functions
> >
> >   config

> > -       bool
> > +       tristate
> >          depends on DRM
> >          select DRM_GEM_CMA_HELPER
> >          help
> >
> > but this needs some more testing to make sure it doesn't add
> > any other regressions.
> >
> > Interestingly, I never hit the problem in randconfig testing since
> > there is always some '=y' driver that selects DRM_KMS_HELPER.
>
> Thomas had posted a patch that also fixes the problem.
> Somehow I missed seeing that the first time around.

Ah right, I missed that as well. That patch seems reasonable
to me, but I think we may want both of them in this case, as
it does not address DRM_GEM_CMA_HELPER being set to =y
when it is only used from modules.

       Arnd
