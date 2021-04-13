Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0A35E484
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 19:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9386E820;
	Tue, 13 Apr 2021 17:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADF36E820
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 17:02:25 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so11043215pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZEvaouwR6lKKsvFUe8XHeQdwyMiT3upsGjjAA793nvs=;
 b=XCUdCrTs7PS2BCOHvUAl8I29Ib8v3H0FphqThvZBwx3NKViGWKDBWGWD/pgO443/V4
 YagaA48DTdz+gCXgGiM2BlSeuJiRLr9HpUbz7S+5t6h6gnNOxHIPU8Wn2ZN3wF4KpPx8
 4B7hXBQ5I6RSCAnCnyc/kmo0I3pRj0I4AY8Iy6mEB2J+NGpFLwhMk/S3JIkcALC3C8Pj
 fbXpVTF50wEPQbcFlijwEmjbGD5swOK+my/KO9EPgDav6lX+j0GH+VoSnwHDF+Xw8jnr
 UIuSuW5wg37/iRhT29CuS/2berWbmZzfq/OrLVy5mD/LNUS7FmzjMtdkARKB2aRe3JoJ
 Y/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEvaouwR6lKKsvFUe8XHeQdwyMiT3upsGjjAA793nvs=;
 b=sEpXqpAm7rQlaw0v4EEh20fQHZxSzthIkpaGRKkDkilo3XJTt7QyQcU+bAQXG7XZKX
 xvqbui0wLkOuEkgoJ2YLXfhEyGnZSzctYgwxtObyQFplFgq/0QsXRgJyjrStFqrnp26u
 sDkh1jr89n+iyL4NdaYY1LGL+/X5/gY/psNM4GpoMsXfkLBO2DHG0Krf3K33pMlNHOQZ
 0/Ax41tctqR+CGigAs+/lo+IKdTHNCGo9SM6lL6AAsTz2ZJL9yfgEVT/BMnsIaObpSyZ
 Wx42KTgUlkiqGNvBsWBtsc3qkTGfBqbgmqfbf8//kx/6n9JFx9v4uo+jZxiJyE2EMvdf
 a4FQ==
X-Gm-Message-State: AOAM530H3N6d6yw67JIR+cN+JEs5Pb49wMx1DxEiRsPJw/Fri1sUvJsm
 fPBSOSX5AEA2yGCjuTIqEiOQT+fkYIhCYQq9aHRz6A==
X-Google-Smtp-Source: ABdhPJw4Xf7iLvL5C5ojXqkG49c+zHbpQq2lLokzmBbfykkgXcvLHiS+M+BX1uBFsPDo7JNSVhjzjvaVB40CDKZXky4=
X-Received: by 2002:a17:90b:392:: with SMTP id
 ga18mr989125pjb.222.1618333345157; 
 Tue, 13 Apr 2021 10:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210408130746.175358-1-robert.foss@linaro.org>
 <f1d5f9d4-cb98-cc1c-83ef-74e7e8005b1f@infradead.org>
In-Reply-To: <f1d5f9d4-cb98-cc1c-83ef-74e7e8005b1f@infradead.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 13 Apr 2021 19:02:14 +0200
Message-ID: <CAG3jFys1xF9qrhDziUNm9fY8uDY0LSt6xvsnNohY7z0Qp6hMaQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge/sii8620: fix dependency on extcon
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kernel test robot <lkp@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Randy,

Thanks for looking at this!

On Fri, 9 Apr 2021 at 18:38, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/8/21 6:07 AM, Robert Foss wrote:
> > The DRM_SIL_SII8620 kconfig has a weak `imply` dependency
> > on EXTCON, which causes issues when sii8620 is built
> > as a builtin and EXTCON is built as a module.
> >
> > The symptoms are 'undefined reference' errors caused
> > by the symbols in EXTCON not being available
> > to the sii8620 driver.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >
> > Changes since v1:
> >  - Fix typo on comment
> >
> >  drivers/gpu/drm/bridge/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 22a467abd3e9..2289b44613af 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -169,7 +169,7 @@ config DRM_SIL_SII8620
> >       tristate "Silicon Image SII8620 HDMI/MHL bridge"
> >       depends on OF
> >       select DRM_KMS_HELPER
> > -     imply EXTCON
> > +     depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
> >       depends on RC_CORE || !RC_CORE
> >       help
> >         Silicon Image SII8620 HDMI/MHL bridge chip driver.
> >
>
> That gives me: (on linux-next 20210409)
>
> drivers/gpu/drm/Kconfig:77:error: recursive dependency detected!
> drivers/gpu/drm/Kconfig:77:     symbol DRM_KMS_HELPER is selected by DRM_SIL_SII8620
> drivers/gpu/drm/bridge/Kconfig:168:     symbol DRM_SIL_SII8620 depends on EXTCON
> drivers/extcon/Kconfig:2:       symbol EXTCON is selected by CHARGER_MANAGER
> drivers/power/supply/Kconfig:499:       symbol CHARGER_MANAGER depends on POWER_SUPPLY
> drivers/power/supply/Kconfig:2: symbol POWER_SUPPLY is selected by OLPC_XO1_SCI
> arch/x86/Kconfig:2757:  symbol OLPC_XO1_SCI depends on GPIO_CS5535
> drivers/gpio/Kconfig:1156:      symbol GPIO_CS5535 depends on GPIOLIB
> drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by I2C_MUX_LTC4306
> drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C
> drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:83:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"

I'm not sure how to avoid this circular dependency. The above solution
is what I've seen w/r to issues like [1]. Clearly it doesn't work in
this situation. `select EXTCON` doesn't seem to cause this dependency
error, but I'm not sure it accurately represents the dependency
sii8620 has on extcon.

[1] https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
