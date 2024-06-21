Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD1C912DE4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 21:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2106010E0A9;
	Fri, 21 Jun 2024 19:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ITPG6EOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FDC10E071
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 19:33:58 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44056f72257so513531cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718998437; x=1719603237;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nDGM5BfE4nBzMNctKXy8FB1ab1trnMB0GkxkRe1UUc=;
 b=ITPG6EOOVTLW9UoRriDKdgoCyffPXUvkm2OLc7HguG2q5Igmcc/i6GC7zhlc0n36bF
 PoztKvq72I0SHWgMOmgRIn7FmLhqDZLlYalU4Zm2egFbIKGVbJi/fXlwWMLoVHsTrjat
 DphesJTH1kPC8UzEzx/wrzNykuWedTJkQ//Bt23/OpICVUlgn2aBVUXwLyHh+LqgvvcC
 HoQI3pPA3l9sit/zgLk7A89JWh1CuwTP5PFds2LYiRBQ6FThX0L2PDJefIkDyaV/j9ND
 8dpAzGsVq052Bj9mGHPI9M4zy2TbnUB/+XMf83Wsumen9giK6XLM6AXuC8WM28vgi1kd
 wZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718998437; x=1719603237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6nDGM5BfE4nBzMNctKXy8FB1ab1trnMB0GkxkRe1UUc=;
 b=ituooHfjr4w+XexX7k6M9e4snJ6qXfrQAfscOoampdUfN2B3Ybgq7e1sML7Hkik162
 VSlOkVXpNS0Mc3dFN8n+ZBHG/59T08Eei8UMZPLKBDAZ3ktURtqy/9EGMl6AFtfzVY+L
 YVYkbWAJBdLhyEeGBxlOJl+3YrgqU3BUH+Q+J5Oz5cLLgFW2OYFu925KFXxmbk0bk7JY
 HqVkDwE/FKPyNk2mdrSZSnkOm34+qMXCIx9IzsxGteWNJbfmYqU2ci0xMRLkoMsV9whI
 Fv2eHRqzUevHFNfvwIkBYvKLEvveRYBkq05Ild/vqPNj3DE+a7BE3cIX26LRtqaK40gh
 rm/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ9h/nranKoUaaQbybxyRCGYouMIAh7zmEgopLc/YEN0hPb2f5vV4acNiVMj3JyfE+0/+YqXb2tjNou6/SOEAa+eL5f3B1EXuwCweeh3kK
X-Gm-Message-State: AOJu0YwCn85+ciJrrrnKLU+cSI9DuYnV9pFQIAW7C+KoZMT8og0W3igz
 t22UJUq/ebaPjez7zm43ZRMCjsJA2seDq/XA7ok93BSlOJm9WJFw46ektGiH8rPf7GVeYMseqSs
 At+6XbVS+MxupKBRUcWzryH8It39RqfXesKeA
X-Google-Smtp-Source: AGHT+IFKHeWXsrcarZ99HrTif/DeNk5RsxsZB9FIwbEmo1+KbBeOQrbwcbUobI8IcpYZWtf/8bWvMvgMlUUgnZ+ODWo=
X-Received: by 2002:a05:622a:15c6:b0:441:4920:1fc4 with SMTP id
 d75a77b69052e-444ce34a72emr91451cf.28.1718998436717; Fri, 21 Jun 2024
 12:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240620080509.18504-4-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240620080509.18504-4-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 21 Jun 2024 12:33:45 -0700
Message-ID: <CAD=FV=UTtE1UjxtMWOxTWNb9S_FSt=oTOhRJpVFAzD=MjB83QA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/panel: jd9365da: Support for kd101ne3-40ti
 MIPI-DSI panel.
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
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

Hi,

On Thu, Jun 20, 2024 at 1:05=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> @@ -31,6 +31,15 @@ struct jadard_panel_desc {
>         enum mipi_dsi_pixel_format format;
>         const struct jadard_init_cmd *init_cmds;
>         u32 num_init_cmds;
> +       bool lp11_before_reset;
> +       bool reset_before_power_off_vcioo;
> +       unsigned int vcioo_to_lp11_delay;
> +       unsigned int lp11_to_reset_delay;
> +       unsigned int exit_sleep_to_display_on_delay;
> +       unsigned int display_on_delay;
> +       unsigned int backlight_off_to_display_off_delay;
> +       unsigned int display_off_to_enter_sleep_delay;
> +       unsigned int enter_sleep_to_reset_down_delay;

If the above delays are in milliseconds please add a "_ms" suffix to
the variables.

It's also surprising to me that you need all these extra delays /
boolean options if this is really the same underlying chipset. Any
idea why they didn't need it?


> @@ -53,6 +62,7 @@ static int jadard_enable(struct drm_panel *panel)
>         struct device *dev =3D panel->dev;
>         struct jadard *jadard =3D panel_to_jadard(panel);
>         struct mipi_dsi_device *dsi =3D jadard->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
>         int err;
>
>         msleep(120);
> @@ -61,10 +71,16 @@ static int jadard_enable(struct drm_panel *panel)
>         if (err < 0)
>                 DRM_DEV_ERROR(dev, "failed to exit sleep mode ret =3D %d\=
n", err);
>
> +       if (jadard->desc->exit_sleep_to_display_on_delay)
> +               mipi_dsi_msleep(dsi_ctx, jadard->desc->exit_sleep_to_disp=
lay_on_delay);

mipi_dsi_msleep() is really only useful if you're using it between a
whole bunch of other "_multi" functions. If you just have a simple
"msleep()" then just call "msleep()".

...but really you should be transitioning the function to just use
more "_multi" functions since they exist for the other functions
called here. In other words, this function should look something like:

mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
if (...)
  mipi_dsi_msleep(...)

mipi_dsi_dcs_set_display_on_multi

if (...)
  mipi_dsi_msleep(...)

return dsi_ctx.accum_err;

I would also note that you seem to be missing commit 66055636a146
("drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep"), which
changes the first argument of mipi_dsi_msleep() to be a pointer.


> @@ -72,16 +88,26 @@ static int jadard_disable(struct drm_panel *panel)
>  {
>         struct device *dev =3D panel->dev;
>         struct jadard *jadard =3D panel_to_jadard(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
>         int ret;
>
> +       if (jadard->desc->backlight_off_to_display_off_delay)
> +               mipi_dsi_msleep(dsi_ctx, jadard->desc->backlight_off_to_d=
isplay_off_delay);
> +
>         ret =3D mipi_dsi_dcs_set_display_off(jadard->dsi);

Similar comments here to the enable function. Use more _multi which
then makes mipi_dsi_msleep() make sense.


> @@ -100,6 +127,20 @@ static int jadard_prepare(struct drm_panel *panel)
>         if (ret)
>                 return ret;
>
> +       if (jadard->desc->vcioo_to_lp11_delay)
> +               mipi_dsi_msleep(dsi_ctx, jadard->desc->vcioo_to_lp11_dela=
y);
> +
> +       if (jadard->desc->lp11_before_reset) {
> +               ret =3D mipi_dsi_dcs_nop(jadard->dsi);
> +               if (ret)
> +                       return ret;
> +
> +               usleep_range(1000, 2000);

Why do you need this extra sleep. For any panel that needs it can't
the "lp11_to_reset_delay" just be increased by 1ms?


> @@ -582,6 +628,233 @@ static const struct jadard_panel_desc cz101b4001_de=
sc =3D {
>         .num_init_cmds =3D ARRAY_SIZE(cz101b4001_init_cmds),
>  };
>
> +static const struct jadard_init_cmd kingdisplay_kd101ne3_init_cmds[] =3D=
 {
> +       { .data =3D { 0xe0, 0x00 } },
> +       { .data =3D { 0xe1, 0x93 } },
> +       { .data =3D { 0xe2, 0x65 } },
> +       { .data =3D { 0xe3, 0xf8 } },

As mentioned in my reply to patch #1, please don't add new panels that
use the table-based approach. Before adding your new panel to this
driver have a patch that transitions it to a per-panel init() function
that uses mipi_dsi_dcs_write_seq_multi().
