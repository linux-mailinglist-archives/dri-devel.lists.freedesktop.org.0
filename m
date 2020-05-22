Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10241DEF0B
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 20:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656756EA20;
	Fri, 22 May 2020 18:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E156EA20
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:18:09 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id t4so4657588vsq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwXQ16I6Cp2tgFwIySqzt/G64hlPbh8xuNdm4rchjh4=;
 b=t/xBBcZ6O5/2xUet4xFV+IUG27uwEk7PUYFcckf192Tp2MyuY8B0DXdr96rOA13B0j
 /U0mcz2QsJq6wEyD+jG/VLOxi1JxIAjvbLaLGK3hfLWFMtNaGFdEnyhbRN5Yewnf7qHy
 maVP/Xh2HPoAegbriQFlRSP4oSIY4+Z01Hsoq3UPyKO9nSsuQT2/14nHEUAOqqUNglGu
 TQqf3dJf+wgdtg7oGqztDuNqFoXnub8XqcMVClftHonMR76pAFMJY2OI/kOnQFeLQvSZ
 UKIqM8eDIePrh+GAK4WtRGHgFV+7/ChPCy05Mz5s1SjfdyrKdgQzYx9n66CVjZzlduCW
 kRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwXQ16I6Cp2tgFwIySqzt/G64hlPbh8xuNdm4rchjh4=;
 b=p8uaAxx0x7wUJh6BnCYjyvBf8avIqdE/epYJFqqtopNBCnp606EXqbcmf9VgZfnQRb
 qNTeIxNvXyP5bA6ni3H2Nx640hl8VUWeCd9/ehgZGuUjHXOeXzdhyMWSIE7FFc8W9p7N
 jDT6gU9OsuIC77FNZqnwMxrJRIgrl2NiypuOFTXNMTuLpJbWFCyHzAj+wLXVSlQ1Z2CZ
 H1Wt/mcCxp8RpELAWhwRSDh2SqTwwogFWOFJjcrTLSfBPq7rPrTHJ70SYQ+oMhJrhpMv
 76jFfIe5kvN/O6s5bIdyRrJwivN8xXje7psI/dmeWyq8OztLyW6fbkphZUwOV89ZTSys
 IpTg==
X-Gm-Message-State: AOAM532hW8uG7p8IeEdBw4DGIOE9vqqzrvA1j8jxQGDkdW3zUir2Zle4
 c5/ScC7Qrz/A3PICXEKvWtqtgZomlDZSQkQL4OU=
X-Google-Smtp-Source: ABdhPJwVcoOuyG4xj6v7doBPjWJI5CgDAYK+frvnQUSyH9g309h6bcUom+gOtv4klrPgAnir7w1wtRTnZaAYYLLrXeE=
X-Received: by 2002:a67:71c2:: with SMTP id
 m185mr12122722vsc.186.1590171488867; 
 Fri, 22 May 2020 11:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-2-tzimmermann@suse.de>
 <20200522174835.GA1087580@ravnborg.org>
In-Reply-To: <20200522174835.GA1087580@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 22 May 2020 19:15:10 +0100
Message-ID: <CACvgo53YDOD1t4KYOWKiO-q8T639jNbMrZuyTXcbe1FBAfxP+Q@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS
 macro
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, khilman@baylibre.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, ludovic.desroches@microchip.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, joel@jms.id.au,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Jyri Sarha <jsarha@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Vincent Abriou <vincent.abriou@st.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 andrew@aj.id.au, Philippe Cornu <philippe.cornu@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 May 2020 at 18:48, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Thomas.
>
> On Fri, May 22, 2020 at 03:52:26PM +0200, Thomas Zimmermann wrote:
> > Rename the macro to DRM_GEM_CMA_DRIVER_OPS to align with SHMEM
> > helpers.
> This part is fine, I like that the naming is somehow consistent.
>
> > An internal version is provided for drivers that override
> > the default .dumb_create callback. Adapt drivers to the changes.
> I loathe anything named __foo or __FOO. This __ signals to me
> that the author was clueless in naming - or some sort.
> I know that __ is used in some lib headers - but thats not the case
> here.
>
> But I love that we have a variant that takes a create function.
> So we do not have to escape from the nice macro.
> The macro is another way to tell me as rewiewer that this
> drivers uses all the default helpers for this.
>
Fwiw I share the sentiment, although I fear we're a little late. __
prefixed functions are widely common in core drm and it's helpers.

>
> So critizising the name I better suggest something that
> I personally like better:
>
> DRM_GEM_CMA_DRIVER_OPS_CREATE()
>
> It would look like this:
>         /* GEM Operations */
> -       DRM_GEM_CMA_VMAP_DRIVER_OPS,
> -       .dumb_create            = drm_sun4i_gem_dumb_create,
> +       DRM_GEM_CMA_DRIVER_OPS_CREATE(drm_sun4i_gem_dumb_create),
>
>
>
> Please fix zte/zx_drm_drv.c which also uses DRM_GEM_CMA_VMAP_DRIVER_OPS.
>
Isn't DRM_GEM_CMA_VMAP_DRIVER_OPS introduced to zte with the last
patch in the series?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
