Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010870B987
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA2910E145;
	Mon, 22 May 2023 09:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECD310E145
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:58:49 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-255401f977dso1067548a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684749528; x=1687341528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=whUalPLLm/+pKDHlKOJMhM1pYEl4ZyLh3jFwFdz0S2M=;
 b=u6XWbdKXdGjKlGLiy3IVOT3u+fY0aTLc9qVb/G1qC8iuR/NFDFXzkhTpXr2t6CMQR5
 9Uo2CSgpbzw3w2kCHbodQqP6OwWhkh8y1vypa8C6c/8/xtpe8US1B6X/xrqZAOQDF/c4
 ESFiKwlBpuQNovqghwLkpKyQwz8RWhJ3gDc5JXvzVxnbxsHvtsRHZBW1Gh/NnoOFj8Xo
 CPKOSE9Upnbj2oxmaBpyZMEpRjr6KePY7xDPA5x21GJoCqjXo678qs3n6fpJ+2mQLXkZ
 D0e6LQ5L/Lk+L2cOtyAJyDJVcb8qFLNeyAfW2TjvyPKVGL6gdfeZX+cfaRIZGjHbZ4Yb
 JmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684749528; x=1687341528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whUalPLLm/+pKDHlKOJMhM1pYEl4ZyLh3jFwFdz0S2M=;
 b=EAB6B2sdPOPhTIkj1LkYu+KVuDZi0B3SKLYhi9JtHq18GSeC32paObECV8yJLNxaYU
 nB+kGO2hLuBH5nVvIvFyYogy/aqANprvNwj6fDQqUNXGXL3vleA9VpzkXbTwoXwtOZCi
 CMgj7lntmT45SBjqWIXOZh5miQgL4+rucCcASntVcGpw75isdfjCD5XtsxAKjrIhLrfA
 2Bv6cgUP2S84Xl4QoKn5AB/VSJ7KFHZO65viazIXQ30C1ebhFZ+ilCBJM5JW7ISIehYq
 3MrpBuUg1cLj2gAdHowlVePy85h4OsJWoiBSYgBH/xcOJGFh9JZK/yNAAA4GHXwulb57
 IsiQ==
X-Gm-Message-State: AC+VfDz5Yq5/YEbaFBXSyWVN3h56gtt6fKRVxDSfGvKDWkL+OKHxa8xH
 jhmM4m3A7HQ4heu5OXQdIHAVpWEr8oDvgGz8wubZAg==
X-Google-Smtp-Source: ACHHUZ5m/b03hWD6CB+rnMNzqzpKUQCBXH2wTGmtuhSzsQ7YbvhWx9gV3RE7qhRQoW7czUjg0ZsUI+SdxtkoK1TDXVI=
X-Received: by 2002:a17:90a:ca16:b0:24d:ecf7:cabb with SMTP id
 x22-20020a17090aca1600b0024decf7cabbmr9169091pjt.22.1684749528349; Mon, 22
 May 2023 02:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
 <7a9c58b4-e99c-593d-1825-56c698379d09@linaro.org>
In-Reply-To: <7a9c58b4-e99c-593d-1825-56c698379d09@linaro.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Mon, 22 May 2023 17:58:37 +0800
Message-ID: <CAHwB_NLcGMYWARL=Kp6NnmnVUm8A=_i_cWMpbh6Z51rL-4WXyw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Support for Starry-himax83102-j02 TDDI
 MIPI-DSI panel
To: neil.armstrong@linaro.org
Content-Type: multipart/alternative; boundary="0000000000002c56fd05fc455153"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@google.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002c56fd05fc455153
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,Neil

1: RST will be pull low in  boe_panel_prepare
static int boe_panel_prepare(struct drm_panel *panel)
{
...
gpiod_set_value(boe->enable_gpio, 0);
usleep_range(1000, 1500);
...
...
gpiod_set_value(boe->enable_gpio, 1);
usleep_range(1000, 2000);
gpiod_set_value(boe->enable_gpio, 0);
usleep_range(1000, 2000);
gpiod_set_value(boe->enable_gpio, 1);
usleep_range(6000, 10000);
}
2: Set output-low in DTS pinctrl, so the default is low, we can't add
gpio-hog, then it will always be high.

3:I will add a compatible in DT bindings at nest version.

 Thanks. Regards

On Mon, May 22, 2023 at 5:13=E2=80=AFPM <neil.armstrong@linaro.org> wrote:

> Hi,
>
> On 19/05/2023 05:23, Cong Yang wrote:
> > The Starry-himax83102-j02 panel is a TDDI IC. From the datasheet[1],
> > it seems that the touch can communicate successfully only when the RST
> > signal is high. Since i2c_hid_core_probe comes after boe_panel_prepare
> > let's set the default high for RST at boe_panel_add.
>
> This is a higher level problem, here you basically never set the reset
> signal to low,
> so instead make the reset signal optional and handle the reset elseshere
> like in a gpio-hog.
>
> >
> > [1]:
> https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_Sequen=
ce
>
> PLease update the DT bindings first when introducing a new compatible.
>
> Neil
>
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 103 +++++++++++++++++=
-
> >   1 file changed, 102 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > index 783234ae0f57..0d325fc42bc4 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > @@ -36,6 +36,7 @@ struct panel_desc {
> >       const struct panel_init_cmd *init_cmds;
> >       unsigned int lanes;
> >       bool discharge_on_disable;
> > +     int enable_gpio_init_value;
> >   };
> >
> >   struct boe_panel {
> > @@ -75,6 +76,75 @@ struct panel_init_cmd {
> >       .len =3D sizeof((char[]){__VA_ARGS__}), \
> >       .data =3D (char[]){__VA_ARGS__} }
> >
> > +static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] =
=3D {
> > +     _INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),
> > +     _INIT_DCS_CMD(0xB1, 0x2C, 0xB5, 0xB5, 0x31, 0xF1, 0x31, 0xD7,
> 0x2F, 0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11,
> > +             0x65, 0x00, 0x88, 0xFA, 0xFF, 0xFF, 0x8F, 0xFF, 0x08,
> 0x74, 0x33),
> > +     _INIT_DCS_CMD(0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x12, 0x72,
> 0x3C, 0xA3, 0x03, 0x03, 0x00, 0x00, 0x88, 0xF5),
> > +     _INIT_DCS_CMD(0xB4, 0x76, 0x76, 0x76, 0x76, 0x76, 0x76, 0x63,
> 0x5C, 0x63, 0x5C, 0x01, 0x9E),
> > +     _INIT_DCS_CMD(0xE9, 0xCD),
> > +     _INIT_DCS_CMD(0xBA, 0x84),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xBC, 0x1B, 0x04),
> > +     _INIT_DCS_CMD(0xBE, 0x20),
> > +     _INIT_DCS_CMD(0xBF, 0xFC, 0xC4),
> > +     _INIT_DCS_CMD(0xC0, 0x36, 0x36, 0x22, 0x11, 0x22, 0xA0, 0x61,
> 0x08, 0xF5, 0x03),
> > +     _INIT_DCS_CMD(0xE9, 0xCC),
> > +     _INIT_DCS_CMD(0xC7, 0x80),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xE9, 0xC6),
> > +     _INIT_DCS_CMD(0xC8, 0x97),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xC9, 0x00, 0x1E, 0x13, 0x88, 0x01),
> > +     _INIT_DCS_CMD(0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x33),
> > +     _INIT_DCS_CMD(0xCC, 0x02),
> > +     _INIT_DCS_CMD(0xE9, 0xC4),
> > +     _INIT_DCS_CMD(0xD0, 0x03),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xD1, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0C, 0xFF),
> > +     _INIT_DCS_CMD(0xD2, 0x1F, 0x11, 0x1F),
> > +     _INIT_DCS_CMD(0xD3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
> 0x00, 0x08, 0x37, 0x47, 0x34, 0x3B, 0x12, 0x12, 0x03,
> > +             0x03, 0x32, 0x10, 0x10, 0x00, 0x10, 0x32, 0x10, 0x08,
> 0x00, 0x08, 0x32, 0x17, 0x94, 0x07, 0x94, 0x00, 0x00),
> > +     _INIT_DCS_CMD(0xD5, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> 0x18, 0x18, 0x18, 0x19, 0x19, 0x40, 0x40, 0x1A, 0x1A,
> > +             0x1B, 0x1B, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
> 0x07, 0x20, 0x21, 0x28, 0x29, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
> > +     _INIT_DCS_CMD(0xD6, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> 0x18, 0x18, 0x18, 0x40, 0x40, 0x19, 0x19, 0x1A, 0x1A,
> > +             0x1B, 0x1B, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01,
> 0x00, 0x29, 0x28, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
> > +     _INIT_DCS_CMD(0xD8, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA,
> 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA,
> > +             0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA,
> 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0),
> > +     _INIT_DCS_CMD(0xE0, 0x00, 0x09, 0x14, 0x1E, 0x26, 0x48, 0x61,
> 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0xAB,
> > +             0xAB, 0x55, 0x5C, 0x68, 0x73, 0x00, 0x09, 0x14, 0x1E,
> 0x26, 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F,
> 0x98, 0xAB, 0xAB, 0x55, 0x5C, 0x68, 0x73),
> > +     _INIT_DCS_CMD(0xE7, 0x0E, 0x10, 0x10, 0x21, 0x2B, 0x9A, 0x02,
> 0x54, 0x9A, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x05, 0x02, 0x02,
> 0x10),
> > +     _INIT_DCS_CMD(0xBD, 0x01),
> > +     _INIT_DCS_CMD(0xB1, 0x01, 0xBF, 0x11),
> > +     _INIT_DCS_CMD(0xCB, 0x86),
> > +     _INIT_DCS_CMD(0xD2, 0x3C, 0xFA),
> > +     _INIT_DCS_CMD(0xE9, 0xC5),
> > +     _INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E,
> 0x10, 0xA0, 0x00, 0x00, 0x20, 0x40, 0x50, 0x40),
> > +     _INIT_DCS_CMD(0xBD, 0x02),
> > +     _INIT_DCS_CMD(0xD8, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0, 0xFF,
> 0xFF, 0xBF, 0xFE, 0xAA, 0xA0),
> > +     _INIT_DCS_CMD(0xE7, 0xFE, 0x04, 0xFE, 0x04, 0xFE, 0x04, 0x03,
> 0x03, 0x03, 0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00, 0x20, 0x9E, 0x04,
> 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00),
> > +     _INIT_DCS_CMD(0xBD, 0x03),
> > +     _INIT_DCS_CMD(0xE9, 0xC6),
> > +     _INIT_DCS_CMD(0xB4, 0x03, 0xFF, 0xF8),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xD8, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00,
> 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00,
> 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8,
>  0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00),
> > +     _INIT_DCS_CMD(0xBD, 0x00),
> > +     _INIT_DCS_CMD(0xE9, 0xC4),
> > +     _INIT_DCS_CMD(0xBA, 0x96),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xBD, 0x01),
> > +     _INIT_DCS_CMD(0xE9, 0xC5),
> > +     _INIT_DCS_CMD(0xBA, 0x4F),
> > +     _INIT_DCS_CMD(0xE9, 0x3F),
> > +     _INIT_DCS_CMD(0xBD, 0x00),
> > +     _INIT_DCS_CMD(0x11),
> > +     _INIT_DELAY_CMD(120),
> > +     _INIT_DCS_CMD(0x29),
> > +     {},
> > +};
> > +
> >   static const struct panel_init_cmd boe_tv110c9m_init_cmd[] =3D {
> >       _INIT_DCS_CMD(0xFF, 0x20),
> >       _INIT_DCS_CMD(0xFB, 0x01),
> > @@ -1620,6 +1690,34 @@ static const struct panel_desc
> starry_qfh032011_53g_desc =3D {
> >       .init_cmds =3D starry_qfh032011_53g_init_cmd,
> >   };
> >
> > +static const struct drm_display_mode starry_himax83102_j02_default_mod=
e
> =3D {
> > +     .clock =3D 161600,
> > +     .hdisplay =3D 1200,
> > +     .hsync_start =3D 1200 + 40,
> > +     .hsync_end =3D 1200 + 40 + 20,
> > +     .htotal =3D 1200 + 40 + 20 + 40,
> > +     .vdisplay =3D 1920,
> > +     .vsync_start =3D 1920 + 116,
> > +     .vsync_end =3D 1920 + 116 + 8,
> > +     .vtotal =3D 1920 + 116 + 8 + 12,
> > +     .type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> > +};
> > +
> > +static const struct panel_desc starry_himax83102_j02_desc =3D {
> > +     .modes =3D &starry_himax83102_j02_default_mode,
> > +     .bpc =3D 8,
> > +     .size =3D {
> > +             .width_mm =3D 141,
> > +             .height_mm =3D 226,
> > +     },
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE
> |
> > +                   MIPI_DSI_MODE_LPM,
> > +     .init_cmds =3D starry_himax83102_j02_init_cmd,
> > +     .enable_gpio_init_value =3D 1,
> > +};
> > +
> >   static int boe_panel_get_modes(struct drm_panel *panel,
> >                              struct drm_connector *connector)
> >   {
> > @@ -1694,7 +1792,7 @@ static int boe_panel_add(struct boe_panel *boe)
> >               return PTR_ERR(boe->enable_gpio);
> >       }
> >
> > -     gpiod_set_value(boe->enable_gpio, 0);
> > +     gpiod_set_value(boe->enable_gpio,
> boe->desc->enable_gpio_init_value);
> >
> >       drm_panel_init(&boe->base, dev, &boe_panel_funcs,
> >                      DRM_MODE_CONNECTOR_DSI);
> > @@ -1793,6 +1891,9 @@ static const struct of_device_id boe_of_match[] =
=3D {
> >       { .compatible =3D "starry,2081101qfh032011-53g",
> >         .data =3D &starry_qfh032011_53g_desc
> >       },
> > +     { .compatible =3D "starry,himax83102-j02",
> > +       .data =3D &starry_himax83102_j02_desc
> > +     },
> >       { /* sentinel */ }
> >   };
> >   MODULE_DEVICE_TABLE(of, boe_of_match);
>
>

--0000000000002c56fd05fc455153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,Neil<div><br></div><div>1: RST will be pull low in=C2=
=A0 boe_panel_prepare<br>static int boe_panel_prepare(struct drm_panel *pan=
el)<br>{<br>...<br>gpiod_set_value(boe-&gt;enable_gpio, 0);<br>usleep_range=
(1000, 1500);<br>...</div><div>...<br>gpiod_set_value(boe-&gt;enable_gpio, =
1);<br>usleep_range(1000, 2000);<br>gpiod_set_value(boe-&gt;enable_gpio, 0)=
;<br>usleep_range(1000, 2000);<br>gpiod_set_value(boe-&gt;enable_gpio, 1);<=
br>usleep_range(6000, 10000);<br>}<br>2: Set output-low in DTS pinctrl, so =
the default is low, we can&#39;t add gpio-hog, then it will always be high.=
<br></div><div><br></div><div>3:I will add a compatible in DT bindings=C2=
=A0at nest version.</div><div><br></div><div>=C2=A0Thanks. Regards</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, May 22, 2023 at 5:13=E2=80=AFPM &lt;<a href=3D"mailto:neil.armstrong@l=
inaro.org">neil.armstrong@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 19/05/2023 05:23, Cong Yang wrote:<br>
&gt; The Starry-himax83102-j02 panel is a TDDI IC. From the datasheet[1],<b=
r>
&gt; it seems that the touch can communicate successfully only when the RST=
<br>
&gt; signal is high. Since i2c_hid_core_probe comes after boe_panel_prepare=
<br>
&gt; let&#39;s set the default high for RST at boe_panel_add.<br>
<br>
This is a higher level problem, here you basically never set the reset sign=
al to low,<br>
so instead make the reset signal optional and handle the reset elseshere li=
ke in a gpio-hog.<br>
<br>
&gt; <br>
&gt; [1]: <a href=3D"https://github.com/HimaxSoftware/Doc/tree/main/Himax_C=
hipset_Power_Sequence" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_Sequence</a><br>
<br>
PLease update the DT bindings first when introducing a new compatible.<br>
<br>
Neil<br>
<br>
&gt; <br>
&gt; Signed-off-by: Cong Yang &lt;<a href=3D"mailto:yangcong5@huaqin.corp-p=
artner.google.com" target=3D"_blank">yangcong5@huaqin.corp-partner.google.c=
om</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/panel/panel-boe-tv101wum-nl6.c=C2=A0 =C2=A0 | =
103 +++++++++++++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 102 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/=
gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
&gt; index 783234ae0f57..0d325fc42bc4 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
&gt; @@ -36,6 +36,7 @@ struct panel_desc {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct panel_init_cmd *init_cmds;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int lanes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool discharge_on_disable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int enable_gpio_init_value;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct boe_panel {<br>
&gt; @@ -75,6 +76,75 @@ struct panel_init_cmd {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.len =3D sizeof((char[]){__VA_ARGS__}), \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (char[]){__VA_ARGS__} }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB1, 0x2C, 0xB5, 0xB5, 0x31, 0xF1,=
 0x31, 0xD7, 0x2F, 0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x65, 0x00, 0x88, 0xF=
A, 0xFF, 0xFF, 0x8F, 0xFF, 0x08, 0x74, 0x33),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00,=
 0x12, 0x72, 0x3C, 0xA3, 0x03, 0x03, 0x00, 0x00, 0x88, 0xF5),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB4, 0x76, 0x76, 0x76, 0x76, 0x76,=
 0x76, 0x63, 0x5C, 0x63, 0x5C, 0x01, 0x9E),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xCD),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBA, 0x84),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBC, 0x1B, 0x04),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBE, 0x20),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBF, 0xFC, 0xC4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC0, 0x36, 0x36, 0x22, 0x11, 0x22,=
 0xA0, 0x61, 0x08, 0xF5, 0x03),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xCC),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC7, 0x80),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xC6),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC8, 0x97),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC9, 0x00, 0x1E, 0x13, 0x88, 0x01)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F,=
 0x33),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCC, 0x02),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xC4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD0, 0x03),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD1, 0x37, 0x06, 0x00, 0x02, 0x04,=
 0x0C, 0xFF),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD2, 0x1F, 0x11, 0x1F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD3, 0x06, 0x00, 0x00, 0x00, 0x00,=
 0x00, 0x08, 0x00, 0x08, 0x37, 0x47, 0x34, 0x3B, 0x12, 0x12, 0x03,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x03, 0x32, 0x10, 0x1=
0, 0x00, 0x10, 0x32, 0x10, 0x08, 0x00, 0x08, 0x32, 0x17, 0x94, 0x07, 0x94, =
0x00, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD5, 0x18, 0x18, 0x18, 0x18, 0x18,=
 0x18, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19, 0x40, 0x40, 0x1A, 0x1A,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1B, 0x1B, 0x00, 0x0=
1, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x28, 0x29, 0x18, 0x18, =
0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD6, 0x18, 0x18, 0x18, 0x18, 0x18,=
 0x18, 0x18, 0x18, 0x18, 0x18, 0x40, 0x40, 0x19, 0x19, 0x1A, 0x1A,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1B, 0x1B, 0x07, 0x0=
6, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x29, 0x28, 0x21, 0x20, 0x18, 0x18, =
0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD8, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA,=
 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xAA, 0xA0, 0xAA, 0xB=
A, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, =
0xEA, 0xAA, 0xAA, 0xA0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE0, 0x00, 0x09, 0x14, 0x1E, 0x26,=
 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0x=
AB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xAB, 0x55, 0x5C, 0x6=
8, 0x73, 0x00, 0x09, 0x14, 0x1E, 0x26, 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, =
0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0xAB, 0xAB, 0x55, 0x5C, 0x68, 0x73),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE7, 0x0E, 0x10, 0x10, 0x21, 0x2B,=
 0x9A, 0x02, 0x54, 0x9A, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x05, 0x=
02, 0x02, 0x10),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x01),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB1, 0x01, 0xBF, 0x11),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCB, 0x86),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD2, 0x3C, 0xFA),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xC5),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x00, 0x00, 0x80,=
 0x0C, 0x01),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E,=
 0x0F, 0x7E, 0x10, 0xA0, 0x00, 0x00, 0x20, 0x40, 0x50, 0x40),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x02),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD8, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA,=
 0xA0, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE7, 0xFE, 0x04, 0xFE, 0x04, 0xFE,=
 0x04, 0x03, 0x03, 0x03, 0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00, 0x20, 0x=
9E, 0x04, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x03),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xC6),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB4, 0x03, 0xFF, 0xF8),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD8, 0x00, 0x2A, 0xAA, 0xA8, 0x00,=
 0x00, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x=
00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00, 0x0=
0, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xC4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBA, 0x96),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x01),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0xC5),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBA, 0x4F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE9, 0x3F),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x11),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DELAY_CMD(120),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x29),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static const struct panel_init_cmd boe_tv110c9m_init_cmd[]=
 =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x20),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFB, 0x01),<br>
&gt; @@ -1620,6 +1690,34 @@ static const struct panel_desc starry_qfh032011=
_53g_desc =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.init_cmds =3D starry_qfh032011_53g_init_cmd=
,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static const struct drm_display_mode starry_himax83102_j02_default_mo=
de =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.clock =3D 161600,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1200,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1200 + 40,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1200 + 40 + 20,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.htotal =3D 1200 + 40 + 20 + 40,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vdisplay =3D 1920,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_start =3D 1920 + 116,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_end =3D 1920 + 116 + 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vtotal =3D 1920 + 116 + 8 + 12,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PR=
EFERRED,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct panel_desc starry_himax83102_j02_desc =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.modes =3D &amp;starry_himax83102_j02_default_mod=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bpc =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.size =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width_mm =3D 141,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height_mm =3D 226,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.lanes =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.format =3D MIPI_DSI_FMT_RGB888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MO=
DE_VIDEO_SYNC_PULSE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
MIPI_DSI_MODE_LPM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.init_cmds =3D starry_himax83102_j02_init_cmd,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable_gpio_init_value =3D 1,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static int boe_panel_get_modes(struct drm_panel *panel,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_connector *connector)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -1694,7 +1792,7 @@ static int boe_panel_add(struct boe_panel *boe)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(b=
oe-&gt;enable_gpio);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gpiod_set_value(boe-&gt;enable_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(boe-&gt;enable_gpio, boe-&gt;desc=
-&gt;enable_gpio_init_value);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_panel_init(&amp;boe-&gt;base, dev, &amp;=
boe_panel_funcs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 DRM_MODE_CONNECTOR_DSI);<br>
&gt; @@ -1793,6 +1891,9 @@ static const struct of_device_id boe_of_match[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;starry,2081101qfh032=
011-53g&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;starry_qfh032011_53g_d=
esc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;starry,himax83102-j02&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;starry_himax83102_j02_desc<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0MODULE_DEVICE_TABLE(of, boe_of_match);<br>
<br>
</blockquote></div>

--0000000000002c56fd05fc455153--
