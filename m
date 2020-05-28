Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4B1E6414
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 16:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B616E02B;
	Thu, 28 May 2020 14:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021726E02B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:37:38 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 1so15858258vsl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhjLeGnnSiMQRUUbdYfOMsIgW1q+H/0EWlHfLoiEMtE=;
 b=CbKCD5fVpYp1aySqZdKnzqK4Q2fgUNjrKce3em6AzjVDLz8s0NG0/V1jiEgII88EV6
 QE9gxRgIdBssjKzN8c9Zg/T88CncTWrDZjjHBURYmyRPX3qJgA5b5hIQZhg/jJU2e7rL
 Rbpdph3yfrYbRsQOvvH4FOvDjbvKauAU44w1rX4VbhcA8W+FSRYO/FBCTsuKp70ynmwv
 j4fnZ5f1/o5nphKz37BhmxIDH1v5xxz0MpLIjCSwp43846om7e/5adWroCwymmxTsb0k
 v6+dHcr8BGLmT+hTMeokGnwbWps5BfsssA7hPevfqdN3VyvbTWkFjWwcYyCFD5TLU6c6
 +7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhjLeGnnSiMQRUUbdYfOMsIgW1q+H/0EWlHfLoiEMtE=;
 b=Wi/bgWBqhT54FUhykkgJOAs7AxwFvIgk7nRkk74uBzDBIGrXzYgkSmpuF03t8sovSl
 ZSbMWOKEBW7eqko3Hv0yhd6VEwqSOPrd8PhfMWakua91rr6A3Qinv76aa/ae89lG2cKe
 GiBDC/jbbUWVloZr/uLUV/EA1ksTPP38awKxc+z66fnFgcJa2TQXb1POFClscdxjBt5u
 ByqXbzm+oQ6+y1gR78dhnHt7R9d5oWBu/pcwg/3LIl5sjogN3j3umJ38i8WO/QJG8J2t
 F1CIuqxcKyicYp5nXIO9fnEItmyXmvZuOFHaUcf/uAHMnHMV1ul5E7wcurm4oKclYgzy
 J1Vg==
X-Gm-Message-State: AOAM533uCh7VFKUISV9csJFOufUOBa4fT4kVXnyc2xWDLbQ9SMjLGC8l
 x8bXrVfOa8VXcw5H8FybKEC7F11vDBeA4p9A8D8=
X-Google-Smtp-Source: ABdhPJxf/Xvp0FffRYRAO2YMcSmKjuft134y0VUyAxlVwQruDsfuEhriUCGMVWXQHGRus78KTihyjqzAINdicC/TUO4=
X-Received: by 2002:a67:be19:: with SMTP id x25mr2244123vsq.37.1590676658056; 
 Thu, 28 May 2020 07:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-8-tzimmermann@suse.de>
 <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
 <ccee78e2-8930-2de6-0b7c-0f1ad1e636f8@suse.de>
In-Reply-To: <ccee78e2-8930-2de6-0b7c-0f1ad1e636f8@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 15:34:30 +0100
Message-ID: <CACvgo52de8opoX98Kchp00gfDa7iGyezumNZPeNaOeLpYjETEQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/hisilicon/kirin: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
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
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 andrew@aj.id.au, Philippe Cornu <philippe.cornu@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sascha Hauer <kernel@pengutronix.de>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 May 2020 at 13:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Emil
>
> Am 22.05.20 um 20:11 schrieb Emil Velikov:
> > Hi Thomas,
> >
> > On Fri, 22 May 2020 at 14:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> The kirin driver uses the default implementation for CMA functions; except
> >> for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro now sets
> >> these defaults and .dumb_create in struct drm_driver. All remaining
> >> operations are provided by CMA GEM object functions.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 12 +-----------
> >>  1 file changed, 1 insertion(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> >> index c339e632522a9..b1ffd7d43e562 100644
> >> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> >> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> >> @@ -921,17 +921,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
> >>  static struct drm_driver ade_driver = {
> >>         .driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >>         .fops = &ade_fops,
> >> -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> >> -       .gem_vm_ops = &drm_gem_cma_vm_ops,
> >> -       .dumb_create = drm_gem_cma_dumb_create_internal,
> >
> > This doesn't seem right. The _internal documentation explicitly says
> > that this should _not_ be used as .dumb_create. Instead drivers should
> > use it to implement their callback.
> >
> > Since it yields the same result as drm_gem_cma_dumb_create we can use
> > the default macro below.
>
> I noticed this and thought that the driver authors probably had their
> reasons. Changing the driver to the default macro is probably still a
> good idea.
>
To be on the _extra_ safe side might want to keep that separate patch
explicitly CC-ing the author/reviewers of the offending commit.
Although as said before - it's your call, I'm fine either way.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
