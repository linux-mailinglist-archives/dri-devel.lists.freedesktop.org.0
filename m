Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC678AE121
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 11:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969FE10F00D;
	Tue, 23 Apr 2024 09:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YRIOiNMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B4110F00D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 09:37:54 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so3315264a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 02:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713865074; x=1714469874;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7qEzAeGQbSR+e0QLIBsBqx0r9aehVaKkSQghGhq9Bo=;
 b=YRIOiNMDFmZYFtVGQigwTjw1cEfxXu8REgAwgZNvKLbv+mTwsNZYzhGWAXqhhGRnhS
 xrra6GNnNa4El6MnP7XmgcrW59x2lE8G8im/VxEghuS+iFWAhKsqLw2JcFSNir12bNO2
 kNRFdbalmtUSATFYAv+hixTTgv9Mdk1o/zgku9c/k5chbzcUgObz5UVxoTVRdnGVZMWC
 GwmQZr0ilIlAl62vfUEWrBkZrbVSMfozzwzHc2zG9WqRMGhLNscUULUj+iu0ssUbyWqF
 jS3Cna2rnjqZf+o3Y9t0vI4boFO20WgxEVCFMI9l6Y9e1UzECfODx5di58eyncCxhjd1
 aVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713865074; x=1714469874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7qEzAeGQbSR+e0QLIBsBqx0r9aehVaKkSQghGhq9Bo=;
 b=Gzmq4YTeGmScAu7XYFIAvENRrHBuUs5v7VYpXN63cTq8bKlpou+UEJ0mT+IYHqCcny
 EWRU0C3wqjrOpRTMYaJaM6v6154eP9oLYKCbraPo+KIOUTBPHUi6JOyEuvQtw8yN5cHm
 jsQHuvOt7m9pb8V7srL3SVIETwhW8ccZqAx4bmuDcsSlfwcyMWbMsHj2iI5lEOT5X9Zx
 w86Bw8ZNdgU2Xtq8/qZBT2VAkdxO0vLcJPzGypjN5j5UwSzdtQWss9MPHI4gylwUacfS
 QGYq/WieJcNrrq8CAoZDLpdvCSne3DtVgmVSXW4n8/j7o0Xt1FCmdSoOjlfdwFx4QAE1
 /0Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQHFP/6nOPBsF8mHDgXo2NUaEK++RRL7VYS3U4ay87Nzhtp+A0fgkG16EwtX5TvkfNgKvYeR25AztTixrUE4sENtggC2pwjQBwI6mk3/zs
X-Gm-Message-State: AOJu0YwOd7hTICA4sMS6/j02cCoTkT2mBRTdE7+mrwsFfHtQjX1P7TKy
 DiKOGxVOBwPIMoiNtYp/iyUS7c+lby2qUVu/yiyu4JLi0IipscyGbtgKql453VJY3u8ocIlm3Hy
 Ma7hytnX54naRtn3b/6y0n6rHcxtOjkcuEbzaLQ==
X-Google-Smtp-Source: AGHT+IFFLdxyFRIq+ARQuf3JajFuxDy//Aasarf/dudwTIXRsO2jCILHM+5eWcUSmNYXIIy0MyPqrmkQ2ju0iGdDttE=
X-Received: by 2002:a17:90a:fe07:b0:2ac:3c42:5839 with SMTP id
 ck7-20020a17090afe0700b002ac3c425839mr9995209pjb.1.1713865074341; Tue, 23 Apr
 2024 02:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
In-Reply-To: <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 23 Apr 2024 17:37:43 +0800
Message-ID: <CAHwB_NJsDsTc=gjP8TJ+6ipo10uMYFLmuf+tKGVgxnznhuAcUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
Thanks for review.

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=BA=8C 05:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Mon, Apr 22, 2024 at 2:03=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The Starry HX83102 based mipi panel should never have been part of the =
boe
> > tv101wum driver. Discussion with Doug and Linus in V1 [1], we need a
> > separate driver to enable the hx83102 controller.
> >
> > In hx83102 driver, add DSI commands as macros. So it can add some panel=
s
> > with same control model in the future.
> >
> > [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aS=
AZQvdMV95r3zRUw@mail.gmail.com
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  99 ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c   | 567 ++++++++++++++++++
> >  4 files changed, 577 insertions(+), 99 deletions(-)
> >  create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index d037b3b8b999..eb378c897353 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -145,6 +145,15 @@ config DRM_PANEL_LVDS
> >           handling of power supplies or control signals. It implements =
automatic
> >           backlight handling if the panel is attached to a backlight co=
ntroller.
> >
> > +config DRM_PANEL_HIMAX_HX83102
> > +       tristate "himax HX83102-based panels"
>
> Capital "h" for "Himax".

Got it, fix in V3. Thanks.

>
>
> > +#define DRV_NAME "panel-himax-hx83102"
>
> I don't think DRV_NAME buys you very much. Get rid of this #define and
> just use it below.

Got it, fix in V3. Thanks.

>
>
> > +struct hx83102 {
> > +       struct drm_panel base;
> > +       struct mipi_dsi_device *dsi;
> > +
> > +       const struct hx83102_panel_desc *desc;
> > +
> > +       enum drm_panel_orientation orientation;
> > +       struct regulator *pp1800;
> > +       struct regulator *avee;
> > +       struct regulator *avdd;
> > +       struct gpio_desc *enable_gpio;
> > +
> > +       bool prepared;
>
> We're trying to get rid of the tracking of "prepared" in panels. You
> should be able to delete this and remove the code dealing with it. The
> core DRM code should ensure that your prepare/unprepare functions are
> called appropriately.

Got it, fix in V3. Thanks.

>
>
>
> > +struct hx83102_panel_desc {
> > +       const struct drm_display_mode *modes;
> > +       unsigned int bpc;
> > +
> > +       /**
> > +        * @width_mm: width of the panel's active display area
> > +        * @height_mm: height of the panel's active display area
> > +        */
> > +       struct {
> > +               unsigned int width_mm;
> > +               unsigned int height_mm;
> > +       } size;
> > +
> > +       unsigned long mode_flags;
> > +       enum mipi_dsi_pixel_format format;
> > +       unsigned int lanes;
> > +       bool lp11_before_reset;
>
> Seems like you can remove "lp11_before_reset" since it's always true
> for this controller. If later you find someone using this controller
> that needs this false then we can always add it back in.
>
> I think you could also remove "bpc", "format", and "mode_flags". If
> these are all the same controller then that will be common between all
> the panels, right? So you shouldn't need to define those on a
> per-panel basis... You could maybe even remove "lanes" unless some
> people using this panel are expected to hook up fewer lanes...

Okay, remove =E2=80=9Clanes=E2=80=9D together.

>
>
> > +static int starry_init_cmd(struct hx83102 *ctx)
> > +{
> > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21, =
0x55, 0x00);
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2C, 0xB5, 0xB5,=
 0x31, 0xF1, 0x31, 0xD7, 0x2F,
> > +                                                 0x36, 0x36, 0x36, 0x3=
6, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF,
> > +                                                 0xFF, 0x8F, 0xFF, 0x0=
8, 0x74, 0x33);
>
> I know this is a sticking point between Linus W. and me, but I'm
> really not a fan of all the hardcoded function calls since it bloats
> the code so much. I think we need to stick with something more table
> based at least for the majority of the commands. If I understand
> correctly, Linus was OK w/ something table based as long as it was in
> common code [1]. I think he also wanted the "delay" out of the table,
> but since those always seem to be at the beginning or the end it seems
> like we could still have the majority of the code as table based. Do
> you want to make an attempt at that? If not I can try to find some
> time to write up a patch in the next week or so.

Do you mean not add "delay" in the table?  However, the delay
required by each panel may be different. How should this be handled?
It would be great if you could help provide a patch. Thank you so much.

>
> [1] https://lore.kernel.org/r/CACRpkdYtM=3D5jdQddCqRFgBRXvcJEjk1ULJNKKFz7=
jhhkGxV59Q@mail.gmail.com
>
> ...also: nit that, in general, the Linux community prefers lowercase
> hex, so 0xfa instead of 0xFA, for instance.

Done. Fix in V3.

>
>
> > +static int hx83102_get_modes(struct drm_panel *panel,
> > +                           struct drm_connector *connector)
> > +{
> > +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> > +       const struct drm_display_mode *m =3D ctx->desc->modes;
> > +       struct drm_display_mode *mode;
> > +
> > +       mode =3D drm_mode_duplicate(connector->dev, m);
> > +       if (!mode) {
> > +               dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > +                       m->hdisplay, m->vdisplay, drm_mode_vrefresh(m))=
;
> > +               return -ENOMEM;
> > +       }
>
> nit: no need for an error message when drm_mode_duplicate() fails. It
> is incredibly unlikely that the allocation will fail and the Linux
> kernel will already do a stack crawl in the case that it does fail.

Got it, fix in V3. Thanks.

>
>
> > +       /*
> > +        * TODO: Remove once all drm drivers call
> > +        * drm_connector_set_orientation_from_panel()
> > +        */
> > +       drm_connector_set_panel_orientation(connector, ctx->orientation=
);
>
> Pretty sure you can drop the call to
> drm_connector_set_panel_orientation() here. I believe that nearly
> everyone is using panel_bridge which will handle this for you.

Got it, fix in V3. Thanks.

>
>
> > +static int hx83102_panel_add(struct hx83102 *ctx)
> > +{
> > +       struct device *dev =3D &ctx->dsi->dev;
> > +       int err;
> > +
> > +       ctx->avdd =3D devm_regulator_get(dev, "avdd");
> > +       if (IS_ERR(ctx->avdd))
> > +               return PTR_ERR(ctx->avdd);
> > +
> > +       ctx->avee =3D devm_regulator_get(dev, "avee");
> > +       if (IS_ERR(ctx->avee))
> > +               return PTR_ERR(ctx->avee);
> > +
> > +       ctx->pp1800 =3D devm_regulator_get(dev, "pp1800");
> > +       if (IS_ERR(ctx->pp1800))
> > +               return PTR_ERR(ctx->pp1800);
> > +
> > +       ctx->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LO=
W);
> > +       if (IS_ERR(ctx->enable_gpio)) {
> > +               dev_err(dev, "cannot get reset-gpios %ld\n",
>
> it's not "reset-gpios".
>
>
> > +                       PTR_ERR(ctx->enable_gpio));
> > +               return PTR_ERR(ctx->enable_gpio);
>
> Rather than the above, use "dev_err_probe" and combine into one line. Unt=
ested:
>
> if (IS_ERR(ctx->enable_gpio))
>   return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio), "Cannot get
> enable GPIO\n");

Got it, fix in V3. Thanks.

>
>
> > +       }
> > +
> > +       gpiod_set_value(ctx->enable_gpio, 0);
>
> You don't need the above line. When you got the GPIO you already
> passed "GPIOD_OUT_LOW" which means that this is redundant.

Got it, fix in V3. Thanks.

>
>
> > +
> > +       ctx->base.prepare_prev_first =3D true;
> > +
> > +       drm_panel_init(&ctx->base, dev, &hx83102_drm_funcs,
> > +                      DRM_MODE_CONNECTOR_DSI);
> > +       err =3D of_drm_get_panel_orientation(dev->of_node, &ctx->orient=
ation);
> > +       if (err < 0) {
> > +               dev_err(dev, "%pOF: failed to get orientation %d\n", de=
v->of_node, err);
> > +               return err;
> > +       }
>
> Could also use "dev_err_probe" to make the above one line. Not sure
> you really need the of_node name, too...

Okay, fix in V3. Thanks.

>
> if (err < 0)
>   return dev_err_probe(dev, err, "failed to get orientation\n");
>
> -Doug
