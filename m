Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E131474A5C9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A5F10E4B5;
	Thu,  6 Jul 2023 21:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C6510E4B5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 21:14:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98934f000a5so148879066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688678092; x=1691270092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLaQczdD7KeTXk4DDv/J61xDEsmIdzEy/EqXxRGJCq0=;
 b=AQZYQkWa9CIfOPfWKekTzdiT8eXjPTkZYlrI45cYBma1pak53T1buzaqOKRY3+wyDW
 Mi1Zyuvhw/VvPvgGd1rHar6oJvNQGrKpt7zOjtVikXX5taWuccqhiAVEMTFWZHoTmf/+
 k5VSDbKTDaRDuHDai/HAf0aH4v8qMbGMF6eWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688678092; x=1691270092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLaQczdD7KeTXk4DDv/J61xDEsmIdzEy/EqXxRGJCq0=;
 b=ke3VjnJIO/7X6v5CeZWhxrABfmaDg2YebeyRXvfrKO/8EBmb9pUYxuD7yf2HwOuCE/
 X29Zj9rPCpPDa4qLViX0cFq0iaOZIgTB0A0F4ct54XzykRU2SpR0Z2sWp6niojNFAEfz
 7osJGMbhLiVN6GSw6x/mGVoDaneabzg4h+vOv4Hc6NTtzkzASvu8unfpBcWifOEPJPMv
 ozA+KkZsqd4qFExByQ3W9G4tILbnpRR5mMt0U/r4evIQYGIAeYRZLyEOIyQCbx2O0Pz+
 BRHMvZOUNYwaVpRX2aIj37o5rQz5Da0QA2jIYmnnKpduAVdQv9zFsB4DWI4MqMx7yUiA
 OjiQ==
X-Gm-Message-State: ABy/qLaeUGlQUL6mWkXs0/WKFpgw4oNZgluQBXf9M4jkyhaJBCDu+xZH
 ruAcs+ihtZTAZcoR/oh7F1zLCkSOnsnE34QoIHBcvBTM
X-Google-Smtp-Source: APBJJlET/iyUQq2Vo0UIgbncRB42aU9VcthJhu5SUtE/2C5sV23zaHrvNAxWaUJnVGzOJZZIBat/Rw==
X-Received: by 2002:a17:906:314c:b0:988:aeb7:2a37 with SMTP id
 e12-20020a170906314c00b00988aeb72a37mr1566092eje.33.1688678092299; 
 Thu, 06 Jul 2023 14:14:52 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a170906d29a00b009887f4e0291sm1281202ejb.27.2023.07.06.14.14.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 14:14:52 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so1081a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:14:51 -0700 (PDT)
X-Received: by 2002:a50:ab56:0:b0:51a:2012:5b34 with SMTP id
 t22-20020a50ab56000000b0051a20125b34mr29385edc.4.1688678091505; Thu, 06 Jul
 2023 14:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <20230703-fix-boe-tv101wum-nl6-v3-3-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-3-bd6e9432c755@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Jul 2023 14:14:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xkr3Qpd8m_6Xta_2jL_ezbxsmMyarbKXTXL+UJLG9xNw@mail.gmail.com>
Message-ID: <CAD=FV=Xkr3Qpd8m_6Xta_2jL_ezbxsmMyarbKXTXL+UJLG9xNw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/panel: ili9882t: Break out as separate driver
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 6:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The Starry ILI9882t-based panel should never have been part of the boe
> tv101wum driver, it is clearly based on the Ilitek ILI9882t display
> controller and if you look at the custom command sequences for the
> panel these clearly contain the signature Ilitek page switch (0xff)
> commands. The hardware has nothing in common with the other panels
> supported by this driver.
>
> Break this out into a separate driver and config symbol instead.
>
> If the placement here is out of convenience for using similar code,
> we should consider creating a helper library instead.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                  |   9 +
>  drivers/gpu/drm/panel/Makefile                 |   1 +
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 386 -------------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  | 739 +++++++++++++++++++=
++++++
>  4 files changed, 749 insertions(+), 386 deletions(-)

I have no real objection here and am happy to let others argue about
bikeshed color. I think the "panel-boe-tv101wum-nl6.c" driver ended up
becoming a dumping ground for a bunch of panels in response to Sam's
feedback originally [1].

[1] https://lore.kernel.org/all/YSPAseE6WD8dDRuz@ravnborg.org/

...so it would be good to get Sam's feedback here.


> +/*
> + * Use this descriptor struct to describe different panels using the
> + * Ilitek ILI9882T display controller.
> + */
> +struct panel_desc {
> +       const struct drm_display_mode *modes;
> +       unsigned int bpc;
> +
> +       /**
> +        * @width_mm: width of the panel's active display area
> +        * @height_mm: height of the panel's active display area
> +        */
> +       struct {
> +               unsigned int width_mm;
> +               unsigned int height_mm;
> +       } size;
> +
> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       int (*init)(struct mipi_dsi_device *dsi);
> +       unsigned int lanes;
> +       bool discharge_on_disable;

IMO "discharge_on_disable" should be removed since the one panel
supported by this driver doesn't use it. If later we find that some
ili9882t panels need this logic then we can add it back in, but it
seems hard to believe it would use the same code.


> +       bool lp11_before_reset;

IMO "lp11_before_reset" should be removed. The one panel supported by
this driver _always_ needs lp11_before_reset. If we later find that
some ili9882t panels want different behavior then we can add it back
in. It doesn't feel like the kind of thing that would be different on
different drivers using the same chip.


> +static int ili9882t_get_modes(struct drm_panel *panel,
> +                              struct drm_connector *connector)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +       const struct drm_display_mode *m =3D ili->desc->modes;
> +       struct drm_display_mode *mode;
> +
> +       mode =3D drm_mode_duplicate(connector->dev, m);
> +       if (!mode) {
> +               dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +                       m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +               return -ENOMEM;
> +       }
> +
> +       mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +       drm_mode_set_name(mode);
> +       drm_mode_probed_add(connector, mode);
> +
> +       connector->display_info.width_mm =3D ili->desc->size.width_mm;
> +       connector->display_info.height_mm =3D ili->desc->size.height_mm;
> +       connector->display_info.bpc =3D ili->desc->bpc;
> +       /*
> +        * TODO: Remove once all drm drivers call
> +        * drm_connector_set_orientation_from_panel()
> +        */
> +       drm_connector_set_panel_orientation(connector, ili->orientation);

I'd be inclined to take the above call out and assume anyone using
this new panel has a DRM driver that's working properly...


-Doug
