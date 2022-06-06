Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE80053E506
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EBA11B51C;
	Mon,  6 Jun 2022 14:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343C611B51C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:21:46 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id v1so18586077ejg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opLWEqC00jn82y4owwASw7k3zRYvjzMou2cjWKLBV64=;
 b=gkHpY3ulU0qVJsCW/7cg5SzAjNDdn7t3avgpO4JqTMDcqwd128gyp/ezfuttq/hmoR
 aLEzdUBdsdu9XlKb5oqWrctb+KeObzqrZ5blifz3w5ziL2IdUk1HAwIZtGb0nj94jxEo
 WdDsmtzzAZ//UM7RfSH9d71dAoQNSW5P6aMlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opLWEqC00jn82y4owwASw7k3zRYvjzMou2cjWKLBV64=;
 b=LQb0jPK91hkFWmRBCs1gYFAOkicwab+JuAWsJ2wm9IEAh1CsDvt+U0u4NVxCDYqTKi
 dV2u7YyfuEU3shhkpFm7rwbmMjYGHQbbNriwWlfeZ+0CaUSeOx2R6RJ5y6GJormMOSZQ
 plK6Lulo3AMLWi94G52DD4iMCycmcumlZbU0lTB/OpHratl8Bwb1+BT+e1FtUb8sz5Ud
 4QWDxspzARXFkcorF44/zGpgIWPjd8Mjz7P/cIVhKqpBcSPFeee1aQNF+X9vjqhE1cNw
 3c9Xv1m0hygNG7P+UL+lYzjF+XMOFFIbHNt2Jzr+Xs5iSkeS/QjaUih/J10EiixxYnIq
 GM6A==
X-Gm-Message-State: AOAM532IgcOQSGxubzmqTQVY3bByOHnmqctaculmUzunxgO7h6cKO4k4
 RfXNFBsraSFX8rc+E+Lk7QYyxZ2QPOOpUszo
X-Google-Smtp-Source: ABdhPJzTDDGix7KGDPe5a+RTLuM9K+RFxxF7tpr2yaahWG5oN9zKlohw9fnCxQCGIMtIWj9L0v/1IQ==
X-Received: by 2002:a17:906:f17:b0:6fe:94f6:cb8a with SMTP id
 z23-20020a1709060f1700b006fe94f6cb8amr21174453eji.456.1654525304150; 
 Mon, 06 Jun 2022 07:21:44 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 lo27-20020a170906fa1b00b006fe9209a9edsm6230564ejb.128.2022.06.06.07.21.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:21:39 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so8015649wmz.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:21:39 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr12815954wmd.118.1654525298761; Mon, 06
 Jun 2022 07:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-2-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:21:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
Message-ID: <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN().
>
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
>
> Add an API to return the property from panel to drm/kms driver, so the
> drivers are able to call drm_connector_set_panel_orientation() before
> drm_dev_register().
>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: no change
> ---
>  drivers/gpu/drm/drm_panel.c |  8 ++++++++
>  include/drm/drm_panel.h     | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..4a512ca80673 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>
> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
> +{
> +       if (panel && panel->funcs && panel->funcs->get_orientation)
> +               return panel->funcs->get_orientation(panel);
> +
> +       return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> +}
> +EXPORT_SYMBOL(drm_panel_get_orientation);
>  #ifdef CONFIG_OF

nit: there used to be a blank line before the #ifdef but there no
longer is after your patch.

Other than that...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
