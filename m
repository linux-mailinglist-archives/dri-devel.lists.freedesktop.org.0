Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5067C4951
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 07:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E010E451;
	Wed, 11 Oct 2023 05:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A37210E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 05:42:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27758c8f579so4063387a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 22:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697002967; x=1697607767;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkWm4pQoCblnREoJeplz4SU6UCHJ08f50cIRgUa2+DI=;
 b=NCBzJKN5X9Lvxns79QxAIOvf1s/SiiWhn2G3AoM8rtWh73dbjFevdIabYkP2Nu38rt
 bMDsetBAmovlGfyIB5dL9ugTqPagEycdpNXdBvoL3NAKWn7aT2HOntFmx8Zvrnm1EJZm
 O+nU3SpF+IDhR+CxHber7FCyFbfX0BFH9ba5vFGngAdlH31m0DTDQNxCNimUVqH03sJ8
 cYV0Bv0uHPNtn7d1FUy5NzYr/tn0Koit0yz21LgCxcbY5u12wi92bm6mulBDCz64JNIY
 apHkUGzfPzMofhUQNK+orVOOp0N83LydyDCaEvzntcGkY+SLCjoi+TUGPw8l4EQnqa3n
 nVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697002967; x=1697607767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkWm4pQoCblnREoJeplz4SU6UCHJ08f50cIRgUa2+DI=;
 b=P3A+T6egwgZaBI3m+K1ieDUcZLbsyUBsaml2a1LPKVjtZdS+sNYbP9O2G9lP/8dVcu
 Jt+vMF44Az4ej2ocd20/9ize/Y5iuPFLIYRwOXf+fctTuIt2d8rUHdAevZBAMFpY+tV5
 dHEw+MsmZVkVfw6LH5O1lpj3wcRtTzuKxllipCelrHNtCfIkji/RGar7yyFNJKDNWhlP
 wy8/V2LhADUA4wxnuIwuEn3Bx8Uvftizju7w/ARAkpbVQrifSTrMfRVP9BKqFZuPv8ER
 rQ/TtsapTUYUOkYc0OgGEf3fmPStZ3+iggAqGDh3AbN1DmV/Y71QIILJB31oPsmI/mrT
 Hybg==
X-Gm-Message-State: AOJu0YyMDG4VlmMMrj5TvGf4lnWdoUwJAE2Ni3to4QGRvVblD+TX9+Ei
 VJOujAp6qNoZSgcPJUAs5ilAJMKxzK0wYZnIMHo5E+mu2hw0dFV94mY=
X-Google-Smtp-Source: AGHT+IGT5GqAZC77IFPXul38sxqiw6EgBTz7daXRb/nm2FSJYxvzAnRiaHDY1r5hXlNV21xn8NjzttvF83UZcR7RM1c=
X-Received: by 2002:a17:90b:1050:b0:27c:f4c7:57f with SMTP id
 gq16-20020a17090b105000b0027cf4c7057fmr2734455pjb.35.1697002967599; Tue, 10
 Oct 2023 22:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
 <20231010121402.3687948-2-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VsjB-gsqXyAs+G8DpHJqHNTxeFXwbpgt20-Wgb757z1w@mail.gmail.com>
In-Reply-To: <CAD=FV=VsjB-gsqXyAs+G8DpHJqHNTxeFXwbpgt20-Wgb757z1w@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 11 Oct 2023 13:42:36 +0800
Message-ID: <CAHwB_NKVSOLwBttWG9GQMvKEFGzuGeE6ukR=vNDNLpdVjjohng@mail.gmail.com>
Subject: Re: [v2 1/3] drm/panel: ili9882t: Break out as separate driver
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 11, 2023 at 3:11=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Tue, Oct 10, 2023 at 5:14=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9882t.c
> > new file mode 100644
> > index 000000000000..e095ad91c4bc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > @@ -0,0 +1,762 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Panels based on the Ilitek ILI9882T display controller.
> > + */
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
>
> nit: remove include of linux/of_device.h since you don't use any of
> the functions declared there.

It seems that of_device_get_match_data will be used.

>
>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +/*
> > + * Use this descriptor struct to describe different panels using the
> > + * Ilitek ILI9882T display controller.
> > + */
> > +struct panel_desc {
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
> > +       const struct panel_init_cmd *init_cmds;
> > +       unsigned int init_cmd_length;
>
> Remove "init_cmd_length" since it's now unused.

Done,thanks.
>
>
> > +static void ili9882t_remove(struct mipi_dsi_device *dsi)
> > +{
> > +       struct ili9882t *ili =3D mipi_dsi_get_drvdata(dsi);
> > +       int ret;
> > +
> > +
> > +       ret =3D mipi_dsi_detach(dsi);
>
> nit: remove extra blank line above.

Done,thanks.

>
>
> Other than nits, this looks good to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
