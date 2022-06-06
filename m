Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEDB53EE5C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EDA11A415;
	Mon,  6 Jun 2022 19:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE6711A4DB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:16:49 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 g13-20020a9d6b0d000000b0060b13026e0dso11434697otp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0ISgbHiV4o5sZcHUC78zgYQXpXhaQoJ6UxzNGiryKJ8=;
 b=CBgVQb1ZbwpHj6ip0ODYxgb4cXYCkJ38H4sisthI4mJaz8l4VaspsrbKLeJJV/1SVk
 8Ymd6q9UwbXJTbOLlTFrJW6UjBC1pWbB+mvRBlN7GK2+7gJzpmci3HP3EljH9CVYa+TF
 OvYU5zEwK/vuBrZnhYaWtD2kEY6UNXXnhrjqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0ISgbHiV4o5sZcHUC78zgYQXpXhaQoJ6UxzNGiryKJ8=;
 b=pDkIItbmQoR5hQRUExGF2Ge0GcjjR6xpWmPV5EMn5ix0YH+VylFVZypC6aJY6kq/Ws
 YEIBdYnBEM+8fSOJgYOjYXHflV5wKfvu0z/Er/LZYp1iugV/cvXfWVrTH4OJUWWQl2OX
 Zt0ZPyPCObiRtQ1itRCdVtqMTuPUK/W/UFgF1oDvvN+gpsbp/zgaKiXYM5ze+XKEqxvr
 k0z+jkf9KzVc8Z88SKy9COpLviLSGlNNCg/uRn3NnC8BtdN17sy91ciCDPKkwJ0zAC9o
 /nWBGA3khpXP/zAzE5hwepwXWgIqIU9Oh3OIMIW4l5nbqBTeN/HwuBEMrJqogoPJAFsM
 TuBw==
X-Gm-Message-State: AOAM5304cmUTIwiDnzqEdSstT90/cIgQMaNS0GITkgZOc4AHcUvOLdtB
 +Imj+aceUBLstBSR6R44I1GvkLJ8gx9/SKbQE7cFRQ==
X-Google-Smtp-Source: ABdhPJzrtp9rNjx/MRKwpP7DdfW0iFsQFuzWAL7ZNWmFj9UIEt2EemDZZ/o72GqwyMu+DAw6tK2o5XVWQKasAGXXwEI=
X-Received: by 2002:a05:6830:113:b0:60b:eb0b:4054 with SMTP id
 i19-20020a056830011300b0060beb0b4054mr5483588otp.159.1654543009163; Mon, 06
 Jun 2022 12:16:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 12:16:48 -0700
MIME-Version: 1.0
In-Reply-To: <20220606152431.1889185-9-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-9-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 12:16:48 -0700
Message-ID: <CAE-0n51Lq381dQW6zw3D0fibdj=Jm4r3uAYG59ySo4CXbx+EpA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-06 08:24:31)
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9f10a33e6fa..c56282412bfa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>                 ret = PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       /* Read panel orientation */
> +       if (dsi->panel)
> +               drm_connector_set_panel_orientation(dsi->connector,
> +                               drm_panel_get_orientation(dsi->panel));
> +

It could be simplified like so?

	drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);

Then the API could get the orientation if the panel pointer is valid.
Does any code need to use/modify the orientation value besides
drm_connector_set_panel_orientation()?

>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
