Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1A343CAA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D2F89CC1;
	Mon, 22 Mar 2021 09:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F33289CC1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:24:28 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id l5so14172848ilv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQdQkAy4QTPcaslkVCb6TSJTc6s74LSUzgNupdQjH2U=;
 b=I56LF9shF8V/CEc2wcHkm0GgrHPfIyH7VmZMb0yI4yyz8G+LuFXI2KM1Q+s6LgucRV
 sJ8sg4N6DtfI6sJskPmr1QEshiU01fJuCjYv3kaaQQHrx1TRFQiSOmTeQ4JeuyZeBP4L
 +IotIS2oc9eNHA72kjc8Sx1FoMKzY3J7RNv/a58oTCjF5XbQyx0aSNX9oOEBP0A6huD3
 h2F7NHVWH3H50dZMvwdybP1nNeL8LJTwrQ/F7F9hD3Pw1/Ep7oDXKanZmWwvjh86DJ0D
 Ka012SZYTWZYM6QgNL5O0zfFd678SOE+4hSkobO3LnbZ1jC72C1LB+dS/YPqpIcjNp6N
 EyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQdQkAy4QTPcaslkVCb6TSJTc6s74LSUzgNupdQjH2U=;
 b=FBNGgzMnYfk8thmiN4iU7q/B8UuSBOavCFIpe7ELvNXVxBhuf9VaxV/vHv+JCVIdS3
 mo7Y8T0CTusRQ48+fdF/6DESVU8SYf0GzyKluFOwfrHQpzHDM68PfpnTUG1e9GQONPpr
 h4dEiTH+kHO2HfV4HaJXdcJKYPJwXuNgYI38BWAGX7OpbTB7vSX1DVNap+0x/4TJEX31
 l7YkK09GNId04U+VMciPSGOcRaeqWdZjD1B2TStJkKd4U9jdSCM7IX35DHMEgli9ODCN
 Ce53QVkclF/2tQaX+Ni+Cn9lT55GxfPNHVM8Cm+GHbGDsCZ/CZTlBOZUeZGjGSTIaw88
 T5dA==
X-Gm-Message-State: AOAM532msHh1L6WNkT+Bw8ycno/hzT4j7SnZomZv4/8mf7fXt92ildDU
 ZIEy/tASJa+K3WjLMkr0NzBe41zERFCWQFp7AVs=
X-Google-Smtp-Source: ABdhPJxia+sd/epiEbZVMRemaDAqz+tMIhv55qjy7i/BNQ/vUhT3vI66Df9rkTwhZNVJPilf9EJUTrwgzW+eZOyUxDc=
X-Received: by 2002:a05:6e02:170c:: with SMTP id
 u12mr10843037ill.100.1616405068056; 
 Mon, 22 Mar 2021 02:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210315123811.159205-1-festevam@gmail.com>
In-Reply-To: <20210315123811.159205-1-festevam@gmail.com>
From: Ying Liu <gnuiyl@gmail.com>
Date: Mon, 22 Mar 2021 17:24:17 +0800
Message-ID: <CAOcKUNUVcZH5fN98n45kLCP=P4pRMq5oGuB4y2GDZbn6FkmJwA@mail.gmail.com>
Subject: Re: [PATCH] drm/imx/dcss: Use device_get_match_data()
To: Fabio Estevam <festevam@gmail.com>
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
Cc: laurentiu.palcu@oss.nxp.com,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Mon, Mar 15, 2021 at 8:38 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> The retrieval of driver data can be a bit simplified by using
> device_get_match_data(), so switch to it.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index c849533ca83e..de0f02de94c4 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -168,13 +168,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>         int ret;
>         struct resource *res;
>         struct dcss_dev *dcss;
> -       const struct dcss_type_data *devtype;
> -
> -       devtype = of_device_get_match_data(dev);

It looks like this is the only user of linux/of_device.h in this file?
If so, remove linux/of_device.h and include linux/platform_device.h?

Regards,
Liu Ying

> -       if (!devtype) {
> -               dev_err(dev, "no device match found\n");
> -               return ERR_PTR(-ENODEV);
> -       }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res) {
> @@ -187,7 +180,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>                 return ERR_PTR(-ENOMEM);
>
>         dcss->dev = dev;
> -       dcss->devtype = devtype;
> +       dcss->devtype = device_get_match_data(dev);
>         dcss->hdmi_output = hdmi_output;
>
>         ret = dcss_clks_init(dcss);
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
