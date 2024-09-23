Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C3797EC69
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9547F10E406;
	Mon, 23 Sep 2024 13:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ND/RJAYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4110E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:39:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c26a701185so636332a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727098750; x=1727703550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cw7IRe11q1zvgtAIfUwyWyhAz+WbOXNiE5JcshO+fbk=;
 b=ND/RJAYw9k4fXP3M8xy+lFqYPpCr4vp2JcmXrTRdAPNZbAp8MAjxxv5JcVe7d3ZMwO
 InjIlX0na3ceNr8h631/F7cRvghJntTUWis6mn3fQ3lYT9VAUwA5CN4Y2ARk8f2tq0fi
 2/KSuqquP6Gt5z1fWGtVwhCfCh53ffI/IEflpZlL5JKTUPkgH0sw1ZXfOZ8k4Gymfx/H
 3Zdse9SLr5BQcSNNp3eNzgYpmcR9j7pBOoiJqKXQKWK4fjCTWJD3GEY+q5X8+8UdYhS/
 2iPOcebswTebK2FQkspJcp2J29LC8Ue7KOEqihM+xBHMoBQq6galOo1k2MHToUn5PElN
 AJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727098750; x=1727703550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cw7IRe11q1zvgtAIfUwyWyhAz+WbOXNiE5JcshO+fbk=;
 b=f/uKpVESODz4/fV6YsgswrnR6R6KSNkcRuFaLLTo/rFJ61Ytnp1pL0CRRPxFhR6Ag7
 xqdbImOGGz7eRa284AIoiq0szs5KqlyZTtPQu5mUbstJnS5v/jmvwAc+3MVITBmOwk/g
 2m2z7fvAmj/TbeAIfLDbzuMfQP2F2tusOB5iuhyccQuGYUJWAVxkgbbXKp2tWNEYc422
 MZ+3CCae91dXn8K1rSWA7H9mmfkJ3w49cHEfEGucyr9ssRpwJqZkSNGHfeHpmQPOswDe
 GAt4vUkELvBqo9t3JXEtcDrBs2DVRcFq7KD0JSqa+2MXusNMQLMd6hXGG8gGYmOMGd+t
 dt5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9k1KHLMlbyN05CwIIch5dzY7EOCSGaSZmJcD8dWiDdFkgCzW0/xS7x128OejidFt+ksnIKBpl3RA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHxZaQ4Rzox4t02rB9yTB07QlKWGzdgN4YIH4Og9bnmberlRt6
 +ewmpXrBuih2n7og60ytFZl9MO735LjZVEclW5n3rS8rHWiUtfhzAg4x827D+/VcyupVnjXx5dy
 xs4xke20YjGGA9n0vCU3N5UI6JMjkBxR3fgsvIg==
X-Google-Smtp-Source: AGHT+IHe34L//STnNFdkZExOpf57WJIyU+TI74+0dDBUlm+CP+gn4q7WoyH811n2jON5HT5guRcuccPvcwENuEEvRJc=
X-Received: by 2002:a05:6402:4313:b0:5c4:24a4:8848 with SMTP id
 4fb4d7f45d1cf-5c464a5c24bmr3353651a12.4.1727098750253; Mon, 23 Sep 2024
 06:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpqC5tQ45gj8-0bDutinCs7CoxiQVL1EAzwDK9RJTXYMcQ@mail.gmail.com>
 <CA+6=WdR6+nh9e2HCuCVdR6uw3vuJoWfKCG4gPjJMp9db+Quimw@mail.gmail.com>
 <ovmleeivshtixncuxwv3dink6l4fi242rcspklicl3u4qp73rx@km3nu4co4hen>
In-Reply-To: <ovmleeivshtixncuxwv3dink6l4fi242rcspklicl3u4qp73rx@km3nu4co4hen>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Mon, 23 Sep 2024 21:38:59 +0800
Message-ID: <CA+6=WdRMihx1f-kDYX-RngkQ-kDa2vLGSFU30C75jdFXGz88VQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Sep 23, 2024 at 8:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Sep 23, 2024 at 05:22:20PM GMT, zhaoxiong lv wrote:
> > On Mon, Sep 16, 2024 at 1:15=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Same comment as the one that I've provided to the other patch, plus:
> > >
> > > On Sun, 15 Sept 2024 at 10:11, Zhaoxiong Lv
> > > <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > In order to meet the timing, remove the delay between "backlight of=
f"
> > > > and "display off", and reduce the delay between "display_off" and
> > > > "enter_sleep"
> > >
> > > Separate commit, separate _justification_. Why, not what.
> > >
> > > >
> > > > Removing variables: display_off_to_enter_sleep_delay_ms
> > >
> > > This phrase is useless.
> > >
> > hi Dmitry
> >
> > As in another patch reply, in order to solve a black screen problem,
> > the delay is reduced.
> > The panel spec:
> > 1. https://github.com/Vme5o/power-on-off-sequential
>
> It should be described in the commit message(s). You have removed one
> delay and added another one. Is that a single fix or two separate fixes?
hi Dmitry
We only modify one of the drivers (starry), and the other driver
(boe_th101mb31ig002) is just to keep the original value.

>
> >
> > > >
> > > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google=
.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++---=
---
> > > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b=
/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > > > index 0b87f1e6ecae..c2d0ec199829 100644
> > > > --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > > > +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > > > @@ -29,7 +29,7 @@ struct panel_desc {
> > > >         bool lp11_before_reset;
> > > >         unsigned int vcioo_to_lp11_delay_ms;
> > > >         unsigned int lp11_to_reset_delay_ms;
> > > > -       unsigned int backlight_off_to_display_off_delay_ms;
> > > > +       unsigned int display_off_to_enter_sleep_delay_ms;
> > > >         unsigned int enter_sleep_to_reset_down_delay_ms;
> > > >         unsigned int power_off_delay_ms;
> > > >  };
> > > > @@ -184,12 +184,10 @@ static int boe_th101mb31ig002_disable(struct =
drm_panel *panel)
> > > >                                                       panel);
> > > >         struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->d=
si };
> > > >
> > > > -       if (ctx->desc->backlight_off_to_display_off_delay_ms)
> > > > -               mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_=
to_display_off_delay_ms);
> > > > -
> > > >         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > > >
> > > > -       mipi_dsi_msleep(&dsi_ctx, 120);
> > > > +       if (ctx->desc->display_off_to_enter_sleep_delay_ms)
> > > > +               mipi_dsi_msleep(&dsi_ctx, ctx->desc->display_off_to=
_enter_sleep_delay_ms);
> > > >
> > > >         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > > >
> > > > @@ -275,6 +273,7 @@ static const struct panel_desc boe_th101mb31ig0=
02_desc =3D {
> > > >                           MIPI_DSI_MODE_NO_EOT_PACKET |
> > > >                           MIPI_DSI_MODE_LPM,
> > > >         .init =3D boe_th101mb31ig002_enable,
> > > > +       .display_off_to_enter_sleep_delay_ms =3D 120,
> > > >  };
> > > >
> > > >  static const struct drm_display_mode starry_er88577_default_mode =
=3D {
> > > > @@ -302,7 +301,7 @@ static const struct panel_desc starry_er88577_d=
esc =3D {
> > > >         .lp11_before_reset =3D true,
> > > >         .vcioo_to_lp11_delay_ms =3D 5,
> > > >         .lp11_to_reset_delay_ms =3D 50,
> > > > -       .backlight_off_to_display_off_delay_ms =3D 100,
> > > > +       .display_off_to_enter_sleep_delay_ms =3D 50,
> > > >         .enter_sleep_to_reset_down_delay_ms =3D 100,
> > > >         .power_off_delay_ms =3D 1000,
> > > >  };
> > > > --
> > > > 2.17.1
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
