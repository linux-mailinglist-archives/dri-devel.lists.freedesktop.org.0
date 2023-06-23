Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54F73BB89
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA97110E656;
	Fri, 23 Jun 2023 15:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7403B10E656
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:22:58 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-57015b368c3so6475967b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 08:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687533777; x=1690125777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDiyFgY/P4UigW7QW8bCP4HR3ID78EGLq0qXlWW8WmE=;
 b=BcgqyYH8wjfBTaBpmxXXitgHAMlKg5Cd64/dFbcmB9gRfyQQbR/FWsVr/kEN6xEYQM
 XgV2X142fUMRACOJliv5uUz2ULd/9sEvhne6lhWirrRI6BgUeXBwe149unhUfbwzgfm4
 zvXBWGcPTWvGze/ES89Q3tcoTou8XclslY3+stLYDFjRWfKyrRrMAWzdb6GIlPnp7/Qb
 PpQdYFmQU1le8Iye24zMW2szfxcwN0herK7G0POYGgtAhHwZcSfop+SGdmkX6quKEaW1
 SsMcig3NSUNz4hSjsptZ56iXJYgq8A9V9vrfUsbvsnwFnruxZEOs+q1qDNEDQSlkztZU
 VIfw==
X-Gm-Message-State: AC+VfDx4ZtW6X1vW5MCQcZcQmLG6EjfnOCvMc2uxlSkHXxjimqDOrXQo
 rIdBemr04WfS8Gm7SDMHprApROMijfo80g==
X-Google-Smtp-Source: ACHHUZ4XL5/DOTH95xXRaBWQl4UWgqcQ8pD3N0heaDvDRCOBCLWq2wC5DxgKtIS8itpFtcEt/7quqg==
X-Received: by 2002:a25:48c:0:b0:bfe:bdb6:687b with SMTP id
 134-20020a25048c000000b00bfebdb6687bmr6947080ybe.19.1687533776813; 
 Fri, 23 Jun 2023 08:22:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 z3-20020a5b0203000000b00bca782fcd6esm2041117ybl.55.2023.06.23.08.22.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 08:22:56 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-57338656a8aso6544887b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 08:22:56 -0700 (PDT)
X-Received: by 2002:a25:f802:0:b0:b9e:712f:4a17 with SMTP id
 u2-20020a25f802000000b00b9e712f4a17mr15639096ybd.6.1687533776073; Fri, 23 Jun
 2023 08:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <742b3351c1aed1f546ac2dcc1de15e0d04cc24d4.1687423204.git.geert+renesas@glider.be>
 <20230623150742.GK2112@pendragon.ideasonboard.com>
 <20230623151109.GL2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623151109.GL2112@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jun 2023 17:22:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWn-V5b61t7SDDEW_fUt09Y=EVPdXCmAiht0c4uD67siA@mail.gmail.com>
Message-ID: <CAMuHMdWn-V5b61t7SDDEW_fUt09Y=EVPdXCmAiht0c4uD67siA@mail.gmail.com>
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

On Fri, Jun 23, 2023 at 5:11=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 23, 2023 at 06:07:44PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 22, 2023 at 11:21:18AM +0200, Geert Uytterhoeven wrote:
> > > The SH-Mobile LCD Controller is part of a PM Domain on all relevant S=
oCs
> > > (clock domain on all, power domain on some).  Hence it may not be
> > > sufficient to manage the LCDC module clock explicitly (e.g. if the
> > > selected clock source differs from SHMOB_DRM_CLK_BUS).
> > >
> > > Fix this by using Runtime PM instead.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 11 ++++++++++-
> > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  5 +++++
> > >  2 files changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/driv=
ers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > index fbfd906844da490c..84dbf35025d7be63 100644
> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > @@ -9,6 +9,7 @@
> > >
> > >  #include <linux/backlight.h>
> > >  #include <linux/clk.h>
> > > +#include <linux/pm_runtime.h>
> > >
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_crtc_helper.h>
> > > @@ -170,10 +171,16 @@ static void shmob_drm_crtc_start(struct shmob_d=
rm_crtc *scrtc)
> > >     if (WARN_ON(format =3D=3D NULL))
> > >             return;
> > >
> > > +   ret =3D pm_runtime_resume_and_get(sdev->dev);
> > > +   if (ret)
> > > +           return;
> > > +
> > >     /* Enable clocks before accessing the hardware. */
> > >     ret =3D shmob_drm_clk_on(sdev);
> >
> > This would be best located in the runtime PM resume handler. Same for
> > disabling clocks in the runtime PM suspend handler.
>
> The driver should then depend on CONFIG_PM. There's no indirect
> dependency through CONFIG_DRM as far as I can tell, but there's one
> through ARCH_SHMOBILE. This then got me puzzled, as ARCH_SHMOBILE is
> defined in arch/sh/Kconfig, and this driver depends on ARM. Am I missing
> something ?

Vommit 4bd65789ba847f39 ("drm: shmobile: Make DRM_SHMOBILE visible on
Renesas SoC platforms") in drm-next:

-       depends on DRM && ARM
-       depends on ARCH_SHMOBILE || COMPILE_TEST
+       depends on DRM
+       depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST

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
