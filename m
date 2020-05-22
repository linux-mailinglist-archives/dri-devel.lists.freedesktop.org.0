Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD121DEEFE
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 20:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01D76E877;
	Fri, 22 May 2020 18:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C213C6E877
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:14:07 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u2so6529616vsi.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wk1gbg+bM/GmwTo+ErImdJXdcBRK1O8Y6ClkW84B2gk=;
 b=Z/VXBNCrQukwB/grZDpR4JRrrIFVDGnXPVQGzoZdFZSY9+lsS7zBSg3/y4yKjgfGGY
 Hlj5ggTwWFhM4Iu+lrCmvA/kpLeGMAEh9IBnukVKYeQ8XAlipwDOSWtp/zxdlarZe0Ab
 KvXgH4mWD1TMWCfzlY+BRVaZhSueDefG7JQ044dDwB4FuVwzuDfMKV4biTRnF4wmMIVF
 0PIelwwEPF7vEwG9a+xjdmbaEJYqeCTRbseyqHHRd32tKMngQOFIoy6wi8U41id/FPlT
 xKNkFeRVWoORZy8tZs1IuTypjJJhRKlaDx+UHqOEQNGDW+9x3RIdi/uKd2jmGF7NS5Ox
 g+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wk1gbg+bM/GmwTo+ErImdJXdcBRK1O8Y6ClkW84B2gk=;
 b=i27cujmS6EFlCZ20hbyAWMGq7KfKMkyDmCvYCJgQ+TWZHg1kttEixY//YywgWhl2ss
 tkFXi1S6mThuIqdIu13uzu0PYAx+Ephf1Ib08tLwNObG6XnxIhpNkNKKGdaGouvPmoHJ
 pAEeUkbz7i2iIfT5TKLF38hGm45+36ZMGCpwLdjjdssJobe0DgMNuxI6nZSLcJr67tXC
 HQpyEEapyeCddj+8XZzinAUQbvijirdtSLe1bfR11xHRKPwwR8NK1aG357Y0R7sy7ZZS
 bSBHFkr3A04cTKPGOiKXaLVroRKo8TUm1soDEsByjpqxtCwiE7gs/vO089edV2xuWrBb
 PV0g==
X-Gm-Message-State: AOAM532lU9Ypvz7IRoXf+1xcu7rJTNcitZ2rNqw5PfapS1z6ezwUi9Bq
 LdMrpXPnmLQdvT2YyAgYRCmaiLHtahA1TggK5zw=
X-Google-Smtp-Source: ABdhPJz+FS0+nkoHuNauP4SBN7HFaoJApeyTujO2QZSYWTwKxkjR6gI9c6cMAPRYKxV76mdsTNNwl7AcQJAkrkUUF7M=
X-Received: by 2002:a67:71c2:: with SMTP id
 m185mr12109967vsc.186.1590171246836; 
 Fri, 22 May 2020 11:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-8-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-8-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 22 May 2020 19:11:09 +0100
Message-ID: <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
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
 Liviu Dudau <liviu.dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, ludovic.desroches@microchip.com,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 joel@jms.id.au, NXP Linux Team <linux-imx@nxp.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Jyri Sarha <jsarha@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Vincent Abriou <vincent.abriou@st.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 andrew@aj.id.au, ML dri-devel <dri-devel@lists.freedesktop.org>,
 nicolas.ferre@microchip.com, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, khilman@baylibre.com,
 Rongrong Zou <zourongrong@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, 22 May 2020 at 14:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The kirin driver uses the default implementation for CMA functions; except
> for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro now sets
> these defaults and .dumb_create in struct drm_driver. All remaining
> operations are provided by CMA GEM object functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index c339e632522a9..b1ffd7d43e562 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -921,17 +921,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
>  static struct drm_driver ade_driver = {
>         .driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>         .fops = &ade_fops,
> -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> -       .gem_vm_ops = &drm_gem_cma_vm_ops,
> -       .dumb_create = drm_gem_cma_dumb_create_internal,

This doesn't seem right. The _internal documentation explicitly says
that this should _not_ be used as .dumb_create. Instead drivers should
use it to implement their callback.

Since it yields the same result as drm_gem_cma_dumb_create we can use
the default macro below.

Weather to the .dumb_create in separate patch, or squash it here -
I'll leave to you.
In case of the latter, please mentioned it in the commit message.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
