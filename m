Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7C9153E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4044A89BAE;
	Mon, 24 Jun 2024 16:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B29az0y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D87A89BAE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:33:20 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e02c4168e09so4241235276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719246799; x=1719851599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUwpeaNUdZ/Eg74Mr1NNiwSTPXp+vSE1N8cO2JJRSw8=;
 b=B29az0y278tCoTte5bbOsH1WMNnZFa832+GB5ofIGK+YHL15ANHkunmezuepvKVAnH
 ETn8422gY2TquHny9pd7kkCb6UhKW3vr/d7PnRLehg8Xaodwn0Vx4oGETyenC081Ttdr
 YK6N0+tVnfV7wRRZdIRAdkwLxRcivvQbMkysd42VyCVBVyfTiAqC0jgD9HGy3eLJe0gd
 rliTf3YA+kt3MLjjTmGPqR4AnddpKOgOXHdEyAQixW4+U0Izrz+rl3fahrY7xPdURpIv
 yEgeZassHM9Mj9USRBdNfsJ9J4TwOQbPAoQg7SA2Ej8Wrt1ritSv5ywkozx/kQ1169U/
 nB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719246799; x=1719851599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUwpeaNUdZ/Eg74Mr1NNiwSTPXp+vSE1N8cO2JJRSw8=;
 b=u2TvGCcbHyKzgv2ZMxtBd+ivmX5t4hU8LvDMPona55ZkIj+Ae6Y08LtZoi5ZK2/QK/
 5x7dP5JQ5wmmnZGm3Bo8ywI8ocyF5fzmJR4+5yJ6piVOiakhKW042gdnh2/ErR7nxsyH
 NOiEp9Dk6ZjPIFWHTbO78vX3+15Zpmm+sZzQ8DNSjgeEtWmBWPsu7PdSB5srQxx6XFhV
 ZfEgnoCCVS7dZL0q5kDkZfPYSKCP8pk7KtG0L/2p11GMGm5bwtvCnQ2FDrWz3wHCyDMP
 dMKRlCuej156Br7ydfXXvaqA23DaSlRpyefcjgIeSjaAZWfqsPsLa4nOv4f8Vtwabi+i
 AOqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVukiJbqS92bsH7q12to6B/zuGBR+Rfi21KNsd8r5IImPkX1OYwSwYffI2GjeAzfCVBfa9Y+PWieuOL+DDTug8Ht3LZptlx3TcE8SM/bOvE
X-Gm-Message-State: AOJu0Yz9k49rbD6W7if1EmHQmCQd+vmfEzJmt9jR5R9N9C5IFPEebGxu
 /rTzo1JFMcc4p7d6Kjzyy4u5KK+/GQsEcPEmhWxJJlXU3nHDmCQehDVY0/lKAXsleAyro3B7MWI
 eb+ymC+b0t+tgIZLat3ymc3mBL5TtTPSl0SkrRQ==
X-Google-Smtp-Source: AGHT+IGsIHX1h777STxuAZY31c+MOswbbakLfpx8XYYTWe0uWHoumP4q/sTkA3EgMHwZ+5QbasMECc9ZR7Ny0JU6I5Y=
X-Received: by 2002:a25:a041:0:b0:e02:ab25:44aa with SMTP id
 3f1490d57ef6-e0303fc108bmr4211387276.47.1719246799196; Mon, 24 Jun 2024
 09:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-4-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zvkl2wyqp3iem4ln4qkbhgvxafsfn5wkkmqwhufabm2gqs3eqw@vmqs3lx72ekk>
 <CAD=FV=V9tjY-g=w1Dwj+9oiTWfku8Bt48OUPJqYUqZaJrY8C1Q@mail.gmail.com>
In-Reply-To: <CAD=FV=V9tjY-g=w1Dwj+9oiTWfku8Bt48OUPJqYUqZaJrY8C1Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 19:33:06 +0300
Message-ID: <CAA8EJprQD2_yL95wX5S5Gp-Fb-JdwdB3gKNC9VUZtmaaier6VQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped
 MIPI DCS functions
To: Doug Anderson <dianders@google.com>
Cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 dmitry.torokhov@gmail.com, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jikos@kernel.org, benjamin.tissoires@redhat.co, hsinyi@google.com, 
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, 24 Jun 2024 at 19:31, Doug Anderson <dianders@google.com> wrote:
>
> Hi,
>
> On Mon, Jun 24, 2024 at 8:27=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Jun 24, 2024 at 10:19:24PM GMT, Zhaoxiong Lv wrote:
> > > Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers=
 to
> > > simplify driver's init/enable/exit code.
> > >
> > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om>
> > > ---
> > >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 793 +++++++++-------=
--
> > >  1 file changed, 390 insertions(+), 403 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drive=
rs/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > index a9c483a7b3fa..e836260338bf 100644
> > > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > @@ -19,17 +19,13 @@
> > >  #include <linux/of.h>
> > >  #include <linux/regulator/consumer.h>
> > >
> > > -#define JD9365DA_INIT_CMD_LEN                2
> > > -
> > > -struct jadard_init_cmd {
> > > -     u8 data[JD9365DA_INIT_CMD_LEN];
> > > -};
> > > +struct jadard;
> > >
> > >  struct jadard_panel_desc {
> > >       const struct drm_display_mode mode;
> > >       unsigned int lanes;
> > >       enum mipi_dsi_pixel_format format;
> > > -     const struct jadard_init_cmd *init_cmds;
> > > +     int (*init)(struct jadard *jadard);
> > >       u32 num_init_cmds;
> > >  };
> > >
> > > @@ -50,46 +46,33 @@ static inline struct jadard *panel_to_jadard(stru=
ct drm_panel *panel)
> > >
> > >  static int jadard_enable(struct drm_panel *panel)
> > >  {
> > > -     struct device *dev =3D panel->dev;
> > >       struct jadard *jadard =3D panel_to_jadard(panel);
> > > -     struct mipi_dsi_device *dsi =3D jadard->dsi;
> > > -     int err;
> > > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->ds=
i };
> > >
> > >       msleep(120);
> > >
> > > -     err =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > > -     if (err < 0)
> > > -             DRM_DEV_ERROR(dev, "failed to exit sleep mode ret =3D %=
d\n", err);
> > > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > >
> > > -     err =3D  mipi_dsi_dcs_set_display_on(dsi);
> > > -     if (err < 0)
> > > -             DRM_DEV_ERROR(dev, "failed to set display on ret =3D %d=
\n", err);
> > > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > >
> > > -     return 0;
> > > +     return dsi_ctx.accum_err;
> > >  }
> > >
> > >  static int jadard_disable(struct drm_panel *panel)
> > >  {
> > > -     struct device *dev =3D panel->dev;
> > >       struct jadard *jadard =3D panel_to_jadard(panel);
> > > -     int ret;
> > > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->ds=
i };
> > >
> > > -     ret =3D mipi_dsi_dcs_set_display_off(jadard->dsi);
> > > -     if (ret < 0)
> > > -             DRM_DEV_ERROR(dev, "failed to set display off: %d\n", r=
et);
> > > +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > >
> > > -     ret =3D mipi_dsi_dcs_enter_sleep_mode(jadard->dsi);
> > > -     if (ret < 0)
> > > -             DRM_DEV_ERROR(dev, "failed to enter sleep mode: %d\n", =
ret);
> > > +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > >
> > > -     return 0;
> > > +     return dsi_ctx.accum_err;
> > >  }
> > >
> > >  static int jadard_prepare(struct drm_panel *panel)
> > >  {
> > >       struct jadard *jadard =3D panel_to_jadard(panel);
> > > -     const struct jadard_panel_desc *desc =3D jadard->desc;
> > > -     unsigned int i;
> > >       int ret;
> > >
> > >       ret =3D regulator_enable(jadard->vccio);
> > > @@ -109,13 +92,9 @@ static int jadard_prepare(struct drm_panel *panel=
)
> > >       gpiod_set_value(jadard->reset, 1);
> > >       msleep(130);
> > >
> > > -     for (i =3D 0; i < desc->num_init_cmds; i++) {
> > > -             const struct jadard_init_cmd *cmd =3D &desc->init_cmds[=
i];
> > > -
> > > -             ret =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD936=
5DA_INIT_CMD_LEN);
> >
> > This function usesd mipi_dsi_dcs_write_buffer()...
> >
> > > -             if (ret < 0)
> > > -                     return ret;
> > > -     }
> > > +     ret =3D jadard->desc->init(jadard);
> > > +     if (ret)
> > > +             return ret;
> > >
> > >       return 0;
> >
> > [...]
> >
> > > +static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
> > > +{
> > > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->ds=
i };
> > > +
> > > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);
> >
> > ... while your code uses mipi_dsi_dcs_write_seq_multi(), which
> > internally calls mipi_dsi_generic_write_multi(). These two function use
> > different packet types to send the payload. To be conservatite, please
> > use mipi_dsi_dcs_write_buffer_multi().
>
> Are you certain about this? I see that mipi_dsi_dcs_write_seq_multi()
> is just a wrapper on mipi_dsi_dcs_write_buffer_multi(). Specifically,
> I see:

I see, I was looking at mipi_dsi_generic_write_seq_multi() instead.
Please excuse me.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> #define mipi_dsi_dcs_write_seq_multi(ctx, cmd, seq...)                  \
>   do {                                                            \
>     static const u8 d[] =3D { cmd, seq };                     \
>     mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>   } while (0)
>
> Certainly I could be confused...
>



--=20
With best wishes
Dmitry
