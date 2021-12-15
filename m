Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BE47560F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376D110E207;
	Wed, 15 Dec 2021 10:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CD910E207
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:17:49 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id p2so39987070uad.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tGUfGLJsnkYbNayGgM3Mm1XQontxpSVASOu9gzNQ7w=;
 b=pQ5VEQnW4sOQQO4MlhPB1Ki/Ed73oIsDRQnQOG8ocj6qcZXAeZnnYjbe2jRinK8Ub8
 eypnSvrpEc09Lx7woNHwO6WMx9VoClUEUtfXS+ABaVWytvvNE/PwCa6tx8Jj4cQiuhVA
 kRWOaLBpB6BTYpPXbUFb0VIdKwn390JLmy9BnXbd4C9Ains0z9paZ7BzesseHwSM6u91
 WmT9WHtvT90A7I9/ivPdW7s3qMPmLgnWNq3EJCnKSHyYEu1TY5DtL47dtSJ9crIZ7YeC
 tsDQixCbPQI5g0Uzhm98WlsZaSPTMTP1Eh+UEQaMcfgS/P2ptKtsQnbOVKaQm+HUA+Fs
 5Mnw==
X-Gm-Message-State: AOAM530WnxNt+WhBtdQ+iviYGZUGvj66ONhno5icpvrbUfRS4j4ceoul
 JFp4hNy/zCnmNGI7ekQyNSKyCfoV/4jm4g==
X-Google-Smtp-Source: ABdhPJyAYxfvC9q/agoid1SpoeCF2udvxel36wuIXnXHmTlss25zOd/UBiHXwhCZqFpXFEXZ6BYLzg==
X-Received: by 2002:ab0:598b:: with SMTP id g11mr159031uad.107.1639563468871; 
 Wed, 15 Dec 2021 02:17:48 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id i7sm324584vkh.24.2021.12.15.02.17.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:17:48 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id u40so6845033uad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:17:48 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr2278231vsj.77.1639563468070;
 Wed, 15 Dec 2021 02:17:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be>
 <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
In-Reply-To: <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:17:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
Message-ID: <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: DRM_RCAR_USE_LVDS should depend on
 DRM_RCAR_DU
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > disabled doesn't have any impact on the kernel built.  Hence add a
> > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > when configuring a kernel without R-Car Display Unit support, like is
> > already done for DRM_RCAR_CMM.
> >
> > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > before.
> > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> >
> >  config DRM_RCAR_USE_LVDS
> >       bool "R-Car DU LVDS Encoder Support"
> > -     depends on DRM_BRIDGE && OF
> > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
>
> Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could

DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)

> wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.

That might work.  It can be tricky with bool/tristate, as sometimes m
is not properly propagated.

> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded LVDS encoders.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
