Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25819D08B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5DF6EB03;
	Fri,  3 Apr 2020 06:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B6A6E41D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 02:26:14 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m17so6669393wrw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 19:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8qP4HMBtgJcP3marxCvlPQM9EFvKm/v0Fyiot+R1GsA=;
 b=ScIMSWfMnsrla8uAenHK1uo9zA/AEmGHi707UQmAtVeQVmrHa9Qsl/p2yb0UfP5R2A
 fm74AxgyRryOoRv+MCk2i+dBZmcBjHww2+tPdSGF+d7CgouoObzQZeFL6ecfXd4d8UqV
 1mnIXA/V8NFYMY9oa0THwurtkBKi355Lcv2QJ9e72p55LimTZWkc+A5OKDqFUMg5hy/h
 gIGen7WC/oY+KEGyFROi3ejILIotOdhbqWT2t42ZooFwZ1yWN/lzbpvC8sNColkimABE
 zU9uGEzvL0Es9e7KoIrWH6gjSblkqXOXmuwbdSovIrBfO5gMzmIfWMAP4XRqahwDt97y
 oM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8qP4HMBtgJcP3marxCvlPQM9EFvKm/v0Fyiot+R1GsA=;
 b=Cvpge2SLWV1xgel7K58/fgM5Gq1MiXlfxKAsyKgWCLBtvBWFCq/KWlcH3EWLw1+max
 Uoqim7EE0j75ec/z1OBJtlG1ecKecDQiVGDg0F1GSIBnoa6kWUO+a+19Z6wZkQqMsXo5
 H8zPhG+te0UlRIxkxabXOCNgf2lv2yATojVPHGyunTiNrbd3a96zWYfoE6ohx2hd+LDl
 pvmzyuaRlWCquo6262rgVd8FhIlntXsiLY7FjPJKuDJs5mfRBgUkPcssB3JZsDx97hVn
 ETJ0//1O29l1c2iNmIEyQsuIldXtp1YGa77dVmAKUIqCJ26iILndCrQMikriRuDyKP9y
 Ejcw==
X-Gm-Message-State: AGi0PuakQg0nBcAyNc8xTF1+0GQ+B2919cESAV2alKvnxfaxOPPDgblO
 iPE2snY99KqwRkdEod97Z6m8X6TaN30KQ8IV50a2sw==
X-Google-Smtp-Source: APiQypKNqjpq5zsdm7paTTwT5mrYSRaq+pPFJWnICDZB81b6LKwVd2z7s8iLBVPLFkgKpwY0frAVE0e2jJKwM9HNlTU=
X-Received: by 2002:a5d:5112:: with SMTP id s18mr6550112wrt.306.1585880773030; 
 Thu, 02 Apr 2020 19:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
 <1583466184-7060-5-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1583466184-7060-5-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Fri, 3 Apr 2020 10:26:01 +0800
Message-ID: <CAKoKPbwgiFdvfLHXoD9wPJvJ5yzMMrxNEEJUArSEvNdx46+m9Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/hisilicon: Code cleanup for hibmc_drv_vdac
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linuxarm@huawei.com,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tao,

On Fri, 6 Mar 2020 at 11:44, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> code cleanup for hibmc_drv_vdac.c, no actual function changes.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 49 ++++++++----------------
>  1 file changed, 16 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 678ac2e..f0e6bb8 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -52,32 +52,6 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> -static struct drm_connector *
> -hibmc_connector_init(struct hibmc_drm_private *priv)
> -{
> -       struct drm_device *dev = priv->dev;
> -       struct drm_connector *connector;
> -       int ret;
> -
> -       connector = devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);
> -       if (!connector) {
> -               DRM_ERROR("failed to alloc memory when init connector\n");
> -               return ERR_PTR(-ENOMEM);
> -       }
> -
> -       ret = drm_connector_init(dev, connector,
> -                                &hibmc_connector_funcs,
> -                                DRM_MODE_CONNECTOR_VGA);
> -       if (ret) {
> -               DRM_ERROR("failed to init connector: %d\n", ret);
> -               return ERR_PTR(ret);
> -       }
> -       drm_connector_helper_add(connector,
> -                                &hibmc_connector_helper_funcs);
> -
> -       return connector;
> -}
> -
>  static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
>                                    struct drm_display_mode *mode,
>                                    struct drm_display_mode *adj_mode)
> @@ -109,13 +83,6 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>         struct drm_connector *connector;
>         int ret;
>
> -       connector = hibmc_connector_init(priv);
> -       if (IS_ERR(connector)) {
> -               DRM_ERROR("failed to create connector: %ld\n",
> -                         PTR_ERR(connector));
> -               return PTR_ERR(connector);
> -       }
> -
>         encoder = devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
>         if (!encoder) {
>                 DRM_ERROR("failed to alloc memory when init encoder\n");
> @@ -131,6 +98,22 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>         }
>
>         drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
> +       connector = devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);
> +       if (!connector) {
> +               DRM_ERROR("failed to alloc memory when init connector\n");
> +               return -ENOMEM;
> +       }
> +
> +       ret = drm_connector_init(dev, connector,
> +                                &hibmc_connector_funcs,
> +                                DRM_MODE_CONNECTOR_VGA);
> +       if (ret) {
> +               DRM_ERROR("failed to init connector: %d\n", ret);
> +               return ret;
> +       }
> +
> +       drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
> +       drm_connector_register(connector);

You don't need to register a non-hotplug connector as it will be
registered at drm_dev_register automatically.

See function definition:

 488 /**
 489  * drm_connector_register - register a connector
 490  * @connector: the connector to register
 491  *
 492  * Register userspace interfaces for a connector. Only call this
for connectors
 493  * which can be hotplugged after drm_dev_register() has been
called already,
 494  * e.g. DP MST connectors. All other connectors will be
registered automatically
 495  * when calling drm_dev_register().
 496  *
 497  * Returns:
 498  * Zero on success, error code on failure.
 499  */
 500 int drm_connector_register(struct drm_connector *connector)
 501 {


Besides, I don't think this patch cleans much things.

-Xinliang

>         drm_connector_attach_encoder(connector, encoder);
>
>         return 0;
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
