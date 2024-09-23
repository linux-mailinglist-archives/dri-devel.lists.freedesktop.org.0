Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0397EC68
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D32F10E264;
	Mon, 23 Sep 2024 13:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dXXpyNm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007010E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:39:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c5b640da9cso514599a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727098747; x=1727703547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jxxryawPG2WRoNsIiFqe8HMwXZCeIVaB5Utv67yYo8=;
 b=dXXpyNm3OJculg26tfICZDsPxET1GGzeA4sbcRKTfqRFwMi+PgWy2K0gySPHau7dE0
 w/uO+Pgt+nxQEp0+lMe/8TuX6nqkBHp1Z7qrLCwMuUBPiyS3DVK+bNAisHTR1jL+LJFS
 uIQNgahAPaAGWbYwavxrsi1/AqjjhwrGcxbY6jsxvKFdGxkPTVVkKzoaptlI4T/DTIsJ
 1PFOza9cg8d5Tfg8IkVyJnvaft0ZqJpCe3k8SXI94H+lrY9uJF676q+S/ESznR+ox/7k
 WHBoFR7+0zcZf2BNtagLOQ/7Fiy76Dz990PeFCgQe/g4adqWW4OIbGVlr74/rjtVtT5F
 iLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727098747; x=1727703547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jxxryawPG2WRoNsIiFqe8HMwXZCeIVaB5Utv67yYo8=;
 b=jszeK/Z2MSyvXA8N8kCe+/FRR+ajYB2WblLWbuBYX6JjEh3m77jly4DRDC4/o6/Ryt
 rTEZlrHw4dY+cgw116nJ4iEH6hrnS3AOxxsEBN9LN47FOuNEDlt6ZtbMYCcuf2W8xLFM
 5Qj1QPDw53dZl5UZxAXyFV9HN00Dhj3Ddw4Y7lYl+VAZGjiJDwHirG4sA8F+5nhsMuRQ
 DlWtFYQtU0u3RlptrgwqwYcR01itP92aPdoZ27HajswuecOvJtunSQVA46CDrlOYQ/6t
 6aR1lAFIOecp/TduE/pbEOanR0A9ZO4auh6fjeZaxI/KwYJwuzO/9OxKUFrYWTt8WCqM
 hS9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE6AhZ+mmQmsRp9ERGaj5kbIseyWY21ISRpbyqNly8oVlwDce5fF1GJd+zxSFgCLW/yTQcIUKHYkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKrbfuS6l9mtkc8UQWrTh0G91ZYIzsPS9LOmM0+KTZo3Zdbo17
 SJ7dDued8BQKX1iHMPUkfiJWL8QiXGXvt3QRScnPiPiqJTRAWoghTpjj9A1AJ9YTdDRur/qsr58
 FAV2obiVQ5f54/yf4kotwgnPnHioupXRUXohSig==
X-Google-Smtp-Source: AGHT+IFHR0YPBI+WpC/SVDkzcygKoAsQ/r5jHC9ny5l74u+ns6g3j6y41m5RZ1x0P5p5ddW4+uHmw6zs3SYDLAByqeE=
X-Received: by 2002:a05:6402:208a:b0:5c5:b9bb:c67d with SMTP id
 4fb4d7f45d1cf-5c5b9bbc766mr2935752a12.1.1727098747362; Mon, 23 Sep 2024
 06:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpp1ZHFFY9M3i47d658Q-m3ggJzhxSRUapX=tckgdAwcNg@mail.gmail.com>
 <CA+6=WdS4i3tWei=zzfS_-OW8hs-tgnifOLbNCirGpTx61xEtCQ@mail.gmail.com>
 <zqmpodwfmabxpjtyhbbuiqkkgaggv3sif7iidv4epjswfw7chp@jomwcvififxk>
In-Reply-To: <zqmpodwfmabxpjtyhbbuiqkkgaggv3sif7iidv4epjswfw7chp@jomwcvififxk>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Mon, 23 Sep 2024 21:38:56 +0800
Message-ID: <CA+6=WdRaTpEeKJRRARD77fVVQVhn3dUo4XrAQZLjyhf+2RYWpQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
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

On Mon, Sep 23, 2024 at 8:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Sep 23, 2024 at 05:22:11PM GMT, zhaoxiong lv wrote:
> > On Mon, Sep 16, 2024 at 1:11=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Sun, 15 Sept 2024 at 10:10, Zhaoxiong Lv
> > > <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > In order to meet the timing, remove the delay between "backlight of=
f"
> > > > and "display off"
> > > >
> > > > Removing variables: display_off_to_enter_sleep_delay_ms
> > >
> > > This is not enough. If this is a fix, then describe why the original
> > > commit is incorrect, provide necessary explanation, details, etc.
> > > Otherwise it looks as if you are removing the delay that was necessar=
y
> > > for other panels
> > >
> > > Also if this is a fix, it should be properly notated with the Fixes
> > > tag, maybe cc:stable, etc.
> > >
> > > In its current state: NAK.
> >
> > hi Dmitry
> >
> > Our machine encountered an issue where, after entering S3 in the black
> > screen state, there is a probability that the screen remains black
> > after waking up. It seems that the DRM runtime resume has not yet
> > completed, but the system has already started the suspend process.
> > After reducing the delay for disable, this issue no longer occurs,
> > Therefore, under the premise of meeting the timing requirements, we
> > removed the delay between "backlight off" and "display off".
> >
> > Previously,  "backlight_off_to_display_off_delay_ms" was added between
> > "backlight off" and "display off"  to prevent "display off" from being
> > executed when the backlight is not fully powered off, which may cause
> > a white screen. However, we removed this
> > "backlight_off_to_display_off_delay_ms" and found that this situation
> > did not occur. Therefore, in order to solve the problem mentioned
> > above, we removed this delay.
>
> This should go to the commit message, rewritten to use imperative
> language, with the appropriate Fixes tags.

hi Dmitry
OK, thank you for your correction, we will fix it in the next patch.

>
> >
> > This is the timing specification for the two panels:
> > 1.  Kingdisplay panel timing spec:
> > https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
> > 2.  LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_L=
IB
> >
> > thanks
> >
> > >
> > > >
> > > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google=
.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 6 ------
> > > >  1 file changed, 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/dri=
vers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > > index 44897e5218a6..2f8af86bc2a0 100644
> > > > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > > @@ -31,7 +31,6 @@ struct jadard_panel_desc {
> > > >         bool reset_before_power_off_vcioo;
> > > >         unsigned int vcioo_to_lp11_delay_ms;
> > > >         unsigned int lp11_to_reset_delay_ms;
> > > > -       unsigned int backlight_off_to_display_off_delay_ms;
> > > >         unsigned int display_off_to_enter_sleep_delay_ms;
> > > >         unsigned int enter_sleep_to_reset_down_delay_ms;
> > > >  };
> > > > @@ -69,9 +68,6 @@ static int jadard_disable(struct drm_panel *panel=
)
> > > >         struct jadard *jadard =3D panel_to_jadard(panel);
> > > >         struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard=
->dsi };
> > > >
> > > > -       if (jadard->desc->backlight_off_to_display_off_delay_ms)
> > > > -               mipi_dsi_msleep(&dsi_ctx, jadard->desc->backlight_o=
ff_to_display_off_delay_ms);
> > > > -
> > > >         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > > >
> > > >         if (jadard->desc->display_off_to_enter_sleep_delay_ms)
> > > > @@ -858,7 +854,6 @@ static const struct jadard_panel_desc kingdispl=
ay_kd101ne3_40ti_desc =3D {
> > > >         .reset_before_power_off_vcioo =3D true,
> > > >         .vcioo_to_lp11_delay_ms =3D 5,
> > > >         .lp11_to_reset_delay_ms =3D 10,
> > > > -       .backlight_off_to_display_off_delay_ms =3D 100,
> > > >         .display_off_to_enter_sleep_delay_ms =3D 50,
> > > >         .enter_sleep_to_reset_down_delay_ms =3D 100,
> > > >  };
> > > > @@ -1109,7 +1104,6 @@ static const struct jadard_panel_desc melfas_=
lmfbx101117480_desc =3D {
> > > >         .reset_before_power_off_vcioo =3D true,
> > > >         .vcioo_to_lp11_delay_ms =3D 5,
> > > >         .lp11_to_reset_delay_ms =3D 10,
> > > > -       .backlight_off_to_display_off_delay_ms =3D 100,
> > > >         .display_off_to_enter_sleep_delay_ms =3D 50,
> > > >         .enter_sleep_to_reset_down_delay_ms =3D 100,
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
