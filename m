Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8C54B58E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F6F112184;
	Tue, 14 Jun 2022 16:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597A9112198
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:14:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x5so12372767edi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RuXEMInRh5OLlG1hNRf8KLhCKoE0VEKqtgXb35ooNag=;
 b=G7uye22/PSMwaNQh+8r6QuEtGEqWiRWduscwra00sE5KkUVX7Es4pEOXNI0RczJ+7v
 OtsA3Dx6t6lI7c9DgMIc0DMPoNpprH32yEYUSDk/d3L+4703tvaGYuhXoEFy3PMqi/x1
 3PhFRNm6LOQFf4OLZYsSXEHFfzIjkm4N0DXra/hZkcWnRePby0mZ1ODuWYza309+e8Xe
 ssUX9Oq9dXw62JiQwkWn9vqlSfFn52XEqmKlYrL+WIhUfrLGy0yLapv7SSACUmmcQOqJ
 P13/FR3649k2YxK5qOIutaWRmAkA69q1oJEWVJN7+V/JiwgWenkZPQYwihv3z5l287p/
 5iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RuXEMInRh5OLlG1hNRf8KLhCKoE0VEKqtgXb35ooNag=;
 b=Gez45eESO6wFUdAJvW89nLhEj5acnlyJf40Hay3q+UJH1ipiTfSQeQcMs7eFUk7gk8
 FItEffyadoUbAx0oBIqgvQHPKuZji4ObBI5ACNwmSWSeFbrRbmpPysQSIQ8IizTb2g6A
 u4l4og+4PrNewEAvMZXKQu4G7c97b7y3lREryb7Cq4mJOzaFfRc+KtiB4iUVU8l6h/lI
 jrDYCGGBva//y0Amw2WtNyQdoSf4aGZJwszZl/xBnqnJV0TcRLt2LSdyyyv0LGuiySlE
 xFixAVkBBWJlprMSSOIZgILO7wiqF/Gw7WwmyeWNXfaHK7dsQwz77evoPfwxLdqZ7Wl2
 ei/A==
X-Gm-Message-State: AOAM533nc6nsWzlu59YT/pjJZElNJU7QBJ+TyYf/UuJVuuaUrJHQIG6T
 6E1Ne/QnMssYtverW9wtjSvcSXGeVSLkNnkLJL1oRQ==
X-Google-Smtp-Source: AGRyM1sL/siRoi50DJ7nmtio2CvDfDZ9umPXSQVUDLF9mGttjqu7NzdJ5fwJKNy1ft5gzrQ8wZozCYwjH+HdCoQJ0Ao=
X-Received: by 2002:a05:6402:1857:b0:42d:bcd6:3a88 with SMTP id
 v23-20020a056402185700b0042dbcd63a88mr7162887edy.6.1655223286865; Tue, 14 Jun
 2022 09:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-24-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-24-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:14:31 +0100
Message-ID: <CAPY8ntC42PJ_WGM+nCU-k-7OU4DDTh32j6QoQ=AJsA4jzN-mQA@mail.gmail.com>
Subject: Re: [PATCH 23/64] drm/vc4: dpi: Return an error if we can't enable
 our clock
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> If we fail to enable the DPI clock, we just ignore the error and moves
> forward. Let's return an error instead.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index d1eaafb43bd1..658e0aa9e2e1 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -270,6 +270,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>                         DRM_ERROR("Failed to get core clock: %d\n", ret);
>                 return ret;
>         }
> +
>         dpi->pixel_clock = devm_clk_get(dev, "pixel");
>         if (IS_ERR(dpi->pixel_clock)) {
>                 ret = PTR_ERR(dpi->pixel_clock);
> @@ -279,8 +280,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>         }
>
>         ret = clk_prepare_enable(dpi->core_clock);
> -       if (ret)
> +       if (ret) {
>                 DRM_ERROR("Failed to turn on core clock: %d\n", ret);
> +               return ret;
> +       }
>
>         drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
>         drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
> --
> 2.36.1
>
