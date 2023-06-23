Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353F73BDF7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364C10E695;
	Fri, 23 Jun 2023 17:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95DD10E694
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:41:51 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-47167a4ce3cso400266e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687542110; x=1690134110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4GSLUfapk4UnMTKHQdOWcrvCxbU4UKiakW9bjjA2Nu8=;
 b=bTAjlceqUghV63tnfBHEGBJpDmpkYgoPwWdMAsWfEKRGJ0eurCGaq6eIPpi5B8smss
 wbXKcKkoSSD4uRlGZpWdxpC+dUsH01A/Ays1onDoQnFeBeyWxnqXMoO0/2sdv+VEmQ/8
 o1FUJvlDYQG3QYEacWbYlxaWgxlcgsZYaOgqNC9o47vW2zgjL9Qi4wEXvsJM/gD6w82I
 1K2xM6SN7oJS16Fb3TihnJciOTDANl1g3azjmGOhAG7Auh2PAQ7wjj9sgm3x7GtpzOLE
 qNsZtzDXwD1ig4vYzXuY2oSzoLeP1XJdaGsV4LzeHJbMWVIQPeQfS65gGQYe9RytTKyR
 Xbbw==
X-Gm-Message-State: AC+VfDy60nrq5IaYNBvLJhrfc1+aDGXELaXGM4Gs7esSxsdq0JteFN0X
 Bgedxtr8xxRs02aUG8/HmSj7eJW62pmS1A==
X-Google-Smtp-Source: ACHHUZ688XNf+Tk7reabcxRHHbRcIG/ZDOO4pvNu9gwwYMuv9EpL02cOo5VZNLawMiaE5eLc/JCCjg==
X-Received: by 2002:a1f:5c08:0:b0:457:d0f:37bf with SMTP id
 q8-20020a1f5c08000000b004570d0f37bfmr11173407vkb.16.1687542110062; 
 Fri, 23 Jun 2023 10:41:50 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 x204-20020a0dd5d5000000b0056d33f253fcsm2597088ywd.35.2023.06.23.10.41.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 10:41:49 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5701e8f2b79so8073277b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:41:48 -0700 (PDT)
X-Received: by 2002:a25:2c9:0:b0:bff:242b:78d0 with SMTP id
 192-20020a2502c9000000b00bff242b78d0mr7370299ybc.34.1687542108258; Fri, 23
 Jun 2023 10:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <742b3351c1aed1f546ac2dcc1de15e0d04cc24d4.1687423204.git.geert+renesas@glider.be>
 <20230623150742.GK2112@pendragon.ideasonboard.com>
 <20230623151109.GL2112@pendragon.ideasonboard.com>
 <CAMuHMdWn-V5b61t7SDDEW_fUt09Y=EVPdXCmAiht0c4uD67siA@mail.gmail.com>
 <20230623153425.GQ2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623153425.GQ2112@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jun 2023 19:41:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-2kfL1ysgriVg_2_y85YXr0v49mHuYxLJJGyLGr7V=w@mail.gmail.com>
Message-ID: <CAMuHMdU-2kfL1ysgriVg_2_y85YXr0v49mHuYxLJJGyLGr7V=w@mail.gmail.com>
Subject: Re: [PATCH 06/39] drm: renesas: shmobile: Add support for Runtime PM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 23, 2023 at 5:34=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 23, 2023 at 05:22:45PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 23, 2023 at 5:11=E2=80=AFPM Laurent Pinchart wrote:
> > > On Fri, Jun 23, 2023 at 06:07:44PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jun 22, 2023 at 11:21:18AM +0200, Geert Uytterhoeven wrote:
> > > > > The SH-Mobile LCD Controller is part of a PM Domain on all releva=
nt SoCs
> > > > > (clock domain on all, power domain on some).  Hence it may not be
> > > > > sufficient to manage the LCDC module clock explicitly (e.g. if th=
e
> > > > > selected clock source differs from SHMOB_DRM_CLK_BUS).
> > > > >
> > > > > Fix this by using Runtime PM instead.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 11 +++++++++=
+-
> > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  5 +++++
> > > > >  2 files changed, 15 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/=
drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > > > index fbfd906844da490c..84dbf35025d7be63 100644
> > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > > > @@ -9,6 +9,7 @@
> > > > >
> > > > >  #include <linux/backlight.h>
> > > > >  #include <linux/clk.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > >
> > > > >  #include <drm/drm_crtc.h>
> > > > >  #include <drm/drm_crtc_helper.h>
> > > > > @@ -170,10 +171,16 @@ static void shmob_drm_crtc_start(struct shm=
ob_drm_crtc *scrtc)
> > > > >     if (WARN_ON(format =3D=3D NULL))
> > > > >             return;
> > > > >
> > > > > +   ret =3D pm_runtime_resume_and_get(sdev->dev);
> > > > > +   if (ret)
> > > > > +           return;
> > > > > +
> > > > >     /* Enable clocks before accessing the hardware. */
> > > > >     ret =3D shmob_drm_clk_on(sdev);
> > > >
> > > > This would be best located in the runtime PM resume handler. Same f=
or
> > > > disabling clocks in the runtime PM suspend handler.
> > >
> > > The driver should then depend on CONFIG_PM. There's no indirect
> > > dependency through CONFIG_DRM as far as I can tell, but there's one
> > > through ARCH_SHMOBILE. This then got me puzzled, as ARCH_SHMOBILE is
> > > defined in arch/sh/Kconfig, and this driver depends on ARM. Am I miss=
ing
> > > something ?
> >
> > Vommit 4bd65789ba847f39 ("drm: shmobile: Make DRM_SHMOBILE visible on
> > Renesas SoC platforms") in drm-next:
> >
> > -       depends on DRM && ARM
> > -       depends on ARCH_SHMOBILE || COMPILE_TEST
> > +       depends on DRM
> > +       depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
>
> That's better indeed :-)
>
> A dependency on CONFIG_PM is still needed as ARCH_RENESAS doesn't depend
> on it.

ARCH_RMOBILE selects PM, so PM will be enabled on affected platforms.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
