Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE64843BE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0471F10E381;
	Tue,  4 Jan 2022 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093ED10E381
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:51:50 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id p14so27265313plf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IBOXIVJ/9ODRpWZ2t8YyvwewRSLcB73KHVDeto9Ufug=;
 b=KZJ4ya+ftRXuPa8G4YHTOBQ3griEfMcCR1C3oLa/22nrJthnlj/7JXl3kLymIfmE+Z
 8qXQD62z1VuPVf1sWJWl8zA7Cwl0jvEI0ouyM3m40IVAZyPpkvrf57JHPouEBZrDqsgs
 Flqt937S+Wo5YQaLzYlc18KL+HC2xiAc3oFVf4KWIReD8xEAm0PdfOvTXsDh1QajT4Lo
 WOjY6UI7aYFiAgES04j23tFHWH6QRnPszMnsXgs4hhvOZFIzAKDD2wENDtcyA+ExyBSN
 TvAjudH+SYU9oPFQ4AkKIxdjvgpbJF8TqS7XnVVfgOumqP3MsWDCE6xqWYB+WnqKye32
 T8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBOXIVJ/9ODRpWZ2t8YyvwewRSLcB73KHVDeto9Ufug=;
 b=d2O+T1vyhQpVSDZnFuY4QpWfeo74u7PY1OD0etOt5Gmf37zynORXqI3ID9rNzlzy69
 oWpsKNQtL0dcCJf1PpfDNyqQ7TrWMZdxFQXGPQm/fDQTo9tTzbmGgOEGUTxw2NJ7YKT0
 o72Me3sz55bWd8VuNOpK717Rdm0vREiAvupR4fySYkUCdjF4IV4wxma95LVlb84rH/BJ
 YvNuS6NbvMkl9Vr3Pujp7Xull9En2CWtOUpbEAactPdLud259niCCRcq5/mvXv2mipuv
 1INGnBZgLLTg5004lzhgm1cBFCuIhXUiPpm3kaq4B+WBlL5ZvoCWl2iJc3xEqTviDzLT
 V6YA==
X-Gm-Message-State: AOAM533+s+iXoyj7LUwZCs5JobwTe8LNiMLvJlP3pZOYeY5qJ5mYKleN
 Zjmt+q/IP+pCDtbqkx5z2GhaKFKMeEWZJuq0jjY95g==
X-Google-Smtp-Source: ABdhPJz+zYhSn8IUBdNrZg8WUxNS8+LtGVq0PzMyiztWuIZnBFINgnSywxDOxIECCUvUP8a7Sa/6f5NhlXBuX8Pmvnk=
X-Received: by 2002:a17:902:b189:b0:149:6c45:24c with SMTP id
 s9-20020a170902b18900b001496c45024cmr42976481plr.21.1641307909619; Tue, 04
 Jan 2022 06:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20211109024237.3354741-1-xji@analogixsemi.com>
 <20211109024237.3354741-2-xji@analogixsemi.com>
In-Reply-To: <20211109024237.3354741-2-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 15:51:38 +0100
Message-ID: <CAG3jFyu-JtZRHod7fv_J7y5CrBo+2BMdOCLMnP2qEfP-kKLUPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: anx7625: add audio codec .get_eld support
To: Xin Ji <xji@analogixsemi.com>
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, tzungbi@google.com,
 sam@ravnborg.org, qwen@analogixsemi.com, dan.carpenter@oracle.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 03:43, Xin Ji <xji@analogixsemi.com> wrote:
>
> Provide .get_eld interface in hdmi_codec_ops for hdmi-codec driver.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 6d93026c2999..67a87d21b0ba 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1821,9 +1821,27 @@ static int anx7625_audio_hook_plugged_cb(struct device *dev, void *data,
>         return 0;
>  }
>
> +static int anx7625_audio_get_eld(struct device *dev, void *data,
> +                                u8 *buf, size_t len)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       if (!ctx->connector) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "connector not initial\n");
> +               return -EINVAL;
> +       }
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "audio copy eld\n");
> +       memcpy(buf, ctx->connector->eld,
> +              min(sizeof(ctx->connector->eld), len));
> +
> +       return 0;
> +}
> +
>  static const struct hdmi_codec_ops anx7625_codec_ops = {
>         .hw_params      = anx7625_audio_hw_params,
>         .audio_shutdown = anx7625_audio_shutdown,
> +       .get_eld        = anx7625_audio_get_eld,
>         .get_dai_id     = anx7625_hdmi_i2s_get_dai_id,
>         .hook_plugged_cb = anx7625_audio_hook_plugged_cb,
>  };
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
