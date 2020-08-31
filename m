Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9725712E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 02:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1AE89A75;
	Mon, 31 Aug 2020 00:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FF89A75
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 00:21:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c8so235939edv.5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 17:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6HdyqHVivfNhnk9ly+FjwTjY3Zt8AbJh2F7cbnVyVc=;
 b=LMOdDWoQGNE2uyzaedKQQWP2tHcoCrFluG08SN5bbkrv10x8OTCVH+m25Ptvi4rDM+
 a22uk70z55teG3MocVShxLP2fDFBcLpD6OB/C3LFooGcTfuG0DJ575RdjTRQTxCibXnE
 tXBfyBH/8HqCUrkWA/aQIeu1B3PMrIIACItjwVolp9EOiwGMQALQCV48lSQikT+L9jjm
 82T8jH37489THJS1X6JYDBgucIOKQiTtHlyU+npJL0Enx3ZNpYE0CFfX3g6WI4ReJEdj
 3ovR4cR2/t2x0OSr5kTFLCH5cgbpnRAw0DF7EVTEiL2bK3RjZVppaX36v91XHhnQ6lWP
 HIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6HdyqHVivfNhnk9ly+FjwTjY3Zt8AbJh2F7cbnVyVc=;
 b=dKD9YXueHhNqAE87N1XyxQCRBe0CPYlrHkqDEDngf7TWokI4KfTF/1Px4yRQaI/gxt
 i9Y7cyY/RXOmqRLArG+JVe8RtZQ/b4AOFXBM6mU8KLBUKuaFUYNL+29Q5NCpApOBk9JA
 tbDKMWZzQ/AheuCpGYAfPZ0rBjaQ4SyHeAcpytMlChWuuX7tyE7PAB4bg0Lwmxs8K0v9
 r/aK6pcMouceHDLLQJnqat5feJMOfAajwEtSOleQIOZ8dBm2S9RxaymWE78Id+5hsUiz
 f2vUzP2rxd0tDXBUvhAhR2Yczcq7FFrB/EBR9UyzOYdvrHMrDgeWeeN3uFN0fhueV/31
 Cj8A==
X-Gm-Message-State: AOAM533Rt6mas3lM08vNQ+efRbjAgFlT1Tc4cUtk/fRyVmmar5/NM0+K
 zmSxz/3Xz0RuhtBsMlz24mCTVbI5TwNojnFxd1MaK6YbR9Q=
X-Google-Smtp-Source: ABdhPJxBx79VPUZ+zhpNJRIiCaZl+CvY32kO0H0ZQycTNjI9576Bq2IhyrK530mkgPAXNSOU4P/Y6sQuNAkz0jVYgXg=
X-Received: by 2002:a05:6402:2c3:: with SMTP id
 b3mr4309729edx.213.1598833271172; 
 Sun, 30 Aug 2020 17:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200827114404.36748-1-paul@crapouillou.net>
 <20200827114404.36748-2-paul@crapouillou.net>
In-Reply-To: <20200827114404.36748-2-paul@crapouillou.net>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 30 Aug 2020 21:21:00 -0300
Message-ID: <CAAEAJfD9q-iB9iCgCBWdA0_77=T1zsk9DFh-qvVtLHWqEnOWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ingenic: Fix driver not probing when IPU port
 is missing
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Thu, 27 Aug 2020 at 09:04, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Even if support for the IPU was compiled in, we may run on a device
> (e.g. the Qi LB60) where the IPU is not available, or simply with an old
> devicetree without the IPU node. In that case the ingenic-drm refused to
> probe.
>
> Fix the driver so that it will probe even if the IPU node is not present
> in devicetree (but then IPU support is disabled of course).
>
> v2: Take a different approach
>
> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index c1bcb93aed2d..b7074161ccf0 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -673,7 +673,7 @@ static void ingenic_drm_unbind_all(void *d)
>         component_unbind_all(priv->dev, &priv->drm);
>  }
>
> -static int ingenic_drm_bind(struct device *dev)
> +static int ingenic_drm_bind(struct device *dev, bool has_components)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         const struct jz_soc_info *soc_info;
> @@ -808,7 +808,7 @@ static int ingenic_drm_bind(struct device *dev)
>                         return ret;
>                 }
>
> -               if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
> +               if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
>                         ret = component_bind_all(dev, drm);
>                         if (ret) {
>                                 if (ret != -EPROBE_DEFER)
> @@ -939,6 +939,11 @@ static int ingenic_drm_bind(struct device *dev)
>         return ret;
>  }
>
> +static int ingenic_drm_bind_with_components(struct device *dev)
> +{
> +       return ingenic_drm_bind(dev, true);
> +}
> +
>  static int compare_of(struct device *dev, void *data)
>  {
>         return dev->of_node == data;
> @@ -957,7 +962,7 @@ static void ingenic_drm_unbind(struct device *dev)
>  }
>
>  static const struct component_master_ops ingenic_master_ops = {
> -       .bind = ingenic_drm_bind,
> +       .bind = ingenic_drm_bind_with_components,
>         .unbind = ingenic_drm_unbind,
>  };
>
> @@ -968,14 +973,12 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>         struct device_node *np;
>
>         if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
> -               return ingenic_drm_bind(dev);
> +               return ingenic_drm_bind(dev, false);
>
>         /* IPU is at port address 8 */
>         np = of_graph_get_remote_node(dev->of_node, 8, 0);

How about we get rid of this (seems a bit odd to rely on port address) ?
Rockchip-drm driver has a nice approach, and I think we might need
something like that going forward, to support dw-hdmi.

Thanks,
Ezequiel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
