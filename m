Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E585EE9D2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 01:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7790010E583;
	Wed, 28 Sep 2022 23:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CC310E583
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 23:03:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bj12so30032063ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 16:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vwvvaACGCKhjkKhvyRFiSBwZA9OPfmCcSnk7G2GmJps=;
 b=fphnCY5tHOp8UsnyleYcp1d+pSYb4DE2LmQpb1hehH251xjO8lyCuKhRIfiz9rzlxj
 wr0Zkb8kfNmWLUGiXbqVmVc3SgnFeaSYlPKRKmsaRR0IE7oD7O1UWSEE3ZCe7QZFa2Nf
 3akpGXp/13PZtV7IH8N4vIZMzBbpJmW6tTVDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vwvvaACGCKhjkKhvyRFiSBwZA9OPfmCcSnk7G2GmJps=;
 b=KniTlJtbKdRaXJ7NwaRGrwp3btA1oNievHQCEyz7DbuVtH1TQyaKgNbx6fOyuxCW7L
 PTKmrjXJeS9qQQY1SEErFigzNJeVR0SGr6aVWB3KWfcXkTvBXDCut+issJvzGGcJqVHA
 T2qY6jhpeacD3+jux7RHc6Zgiy5JEWz9b5V+uRWLxhCmjVECNB6V+tt7ez0GVAOGn+1t
 ZepAxCO9GlGea+An/rwSxJ96GC5ipSou3JPi8BtmM6X3beFhGRYEUFaaQ6eElxx1uO+U
 9c1F0C6y6NWwI8ci68hGOrAZkbxI0MaxL6ChpYtGXR6ouWG5TAwGu3r69Odm0JuDezCc
 TXVg==
X-Gm-Message-State: ACrzQf2hZ69OmDlHc4o1hFQXxp6chcETK4nqfreJX+pZJ2WBymcuVxyE
 FnfM0FPKwAAKXJMvDK8IFKjq1Rh0U/UFC+8R
X-Google-Smtp-Source: AMsMyM4huz7p4TD9Q5UDvOPcg8cGW//+qw1ckZc/DsRrtE/PPiz8bQfR0P3MY71zr6xpA3Dmi7MbtQ==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id
 wu9-20020a170906eec900b0073dc369690fmr171029ejb.767.1664406200860; 
 Wed, 28 Sep 2022 16:03:20 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 b12-20020a50cccc000000b00456988774c8sm4198647edj.57.2022.09.28.16.03.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 16:03:19 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id iv17so9380963wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 16:03:19 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id
 n13-20020a05600c500d00b003b50234d7e9mr197541wmr.57.1664406199471; Wed, 28 Sep
 2022 16:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220924015616.34293-1-yuancan@huawei.com>
 <20220924015616.34293-11-yuancan@huawei.com>
In-Reply-To: <20220924015616.34293-11-yuancan@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Sep 2022 16:03:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjwaWwGTLJW0jNOPJHttpEpHDxg5DaJo-U5eMvGSo8_A@mail.gmail.com>
Message-ID: <CAD=FV=XjwaWwGTLJW0jNOPJHttpEpHDxg5DaJo-U5eMvGSo8_A@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/panel: simple: Use dev_err_probe() to simplify
 code
To: Yuan Can <yuancan@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 23, 2022 at 6:59 PM Yuan Can <yuancan@huawei.com> wrote:
>
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0cb3be26e2e6..1607824dc2b3 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -575,12 +575,9 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>
>         panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
>                                                      GPIOD_OUT_LOW);
> -       if (IS_ERR(panel->enable_gpio)) {
> -               err = PTR_ERR(panel->enable_gpio);
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to request GPIO: %d\n", err);
> -               return err;
> -       }
> +       if (IS_ERR(panel->enable_gpio))
> +               return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
> +                                    "failed to request GPIO\n");

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'd be happy to land this patch and the panel-edp one into drm-misc
just because I've touched those panel drivers in the past. I'd tend to
leave the other panel drivers to others unless you really get stuck.

For now I'll sit tight because I think you can make a 2nd fix to the
panel-edp one and put them into the same patch.

-Doug
