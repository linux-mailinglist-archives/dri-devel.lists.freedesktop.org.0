Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3627F3368
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6104910E504;
	Tue, 21 Nov 2023 16:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0110E508
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:14:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so7898549a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700583273; x=1701188073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nURXwAGKPkBMiCxEYgbeoQZATAjDf6lDOeHeErDCpZ8=;
 b=Cpx2Nx3kTX3KkkuZfG5O6pQ2yvcXte1AzVRDyE/ubLcDYPpd7DSxdQ3jRkriLN+71V
 CQvw3LJPV2bSk0beIJqRFcnFSJ2SFC9CRSFsw7mwUqExDOMWRLzgt+DkB5RBMY5z9+VU
 nb5iSn5jJ23fDE0XWvpYOwN2z5GGiD6qxa62A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700583273; x=1701188073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nURXwAGKPkBMiCxEYgbeoQZATAjDf6lDOeHeErDCpZ8=;
 b=d4+zKVS85zjUp9NUHQck4B7q9K8R00RnKSZLpXpuMh3JjkSIb5FnZ9fWXvGRCx+37H
 u6EAGT7tG6G5nZhf7B+qb9doFSvdHtwp9YcVgxYRyYiP7URCwmn4dolJvQzqVmefVQ81
 Udoiyh62djetXm2rXc19o4Pbhui7hdDKfmoQ917cbz0FB1fGJVjHI0pVPccM+3couwLn
 9YpIwaryfZqKRQEtEq7Zasquqo9qhMdt8GxQzt6ZFcUkro2bYpdHKzF1JiI7rdzNtE7j
 BEaq9f/4sAgZneLu24TAQAfpPh4KOT3uWNideapUFcWxf5CkgkAjXzEitLv1pSynblfM
 ltWw==
X-Gm-Message-State: AOJu0YxbdsGMytZYA+6G2GgAyNwOFFkRTyJvzcpMQzm40zeQXdH4A7Fv
 dG8wUb+aB5IJle+pbhH11vwwiOkf0l0vJa6dTMH1hmku
X-Google-Smtp-Source: AGHT+IGCqF+DKyhfcg4CsCxrCYFfyuuf3rB9c8YaI5147rweJnMo0rY6zmFRwlSeC4Qg/kywYF6D/A==
X-Received: by 2002:a50:fb88:0:b0:53f:b9d2:d019 with SMTP id
 e8-20020a50fb88000000b0053fb9d2d019mr2193631edq.11.1700583272593; 
 Tue, 21 Nov 2023 08:14:32 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7db4a000000b005489dbe8ed3sm3065483edt.4.2023.11.21.08.14.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 08:14:32 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40b2993e167so55195e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:14:31 -0800 (PST)
X-Received: by 2002:a05:600c:4d0e:b0:40a:483f:f828 with SMTP id
 u14-20020a05600c4d0e00b0040a483ff828mr10002wmp.4.1700583271626; Tue, 21 Nov
 2023 08:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
 <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
 <20231121160514.feveiq2cyemwvqni@pengutronix.de>
In-Reply-To: <20231121160514.feveiq2cyemwvqni@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Nov 2023 08:14:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VK9Lz9dMFDETHyGLQRG6bWkOcF20TdnTd_jWr1u81NFw@mail.gmail.com>
Message-ID: <CAD=FV=VK9Lz9dMFDETHyGLQRG6bWkOcF20TdnTd_jWr1u81NFw@mail.gmail.com>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 21, 2023 at 8:05=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello Doug,
>
> On Tue, Nov 21, 2023 at 07:15:51AM -0800, Doug Anderson wrote:
> > > @@ -1585,22 +1586,28 @@ static const struct pwm_ops ti_sn_pwm_ops =3D=
 {
> > >  static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> > >                            const struct auxiliary_device_id *id)
> > >  {
> > > +       struct pwm_chip *chip;
> > >         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.pare=
nt);
> > >
> > > -       pdata->pchip.dev =3D pdata->dev;
> > > -       pdata->pchip.ops =3D &ti_sn_pwm_ops;
> > > -       pdata->pchip.npwm =3D 1;
> > > -       pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> > > -       pdata->pchip.of_pwm_n_cells =3D 1;
> > > +       /* XXX: should this better use adev->dev instead of pdata->de=
v? */
> > > +       pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1, s=
izeof(&pdata));
> >
> > Yes, it should be "adev->dev". See recent commits like commit
> > 7b821db95140 ("drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
> > with auxiliary device").
>
> I'd do that in a separate commit and not change that hidden in patch
> like this one. Agree? Then I'd keep that as is and not address this in
> this series. Maybe it will take another cycle until this patch goes in
> anyhow ...

You could do it in a commit _before_ this one, but not a commit after
this one. Specifically before "${SUBJECT}" commit I think it was
benign to set pdata->pchip.dev to pdata->dev. Now you're starting to
use it for devm and the incorrect lifetime is worse, I think. Do you
agree?

NOTE: I don't actually have any hardware that uses the PWM here, so
you probably want to CC someone like Bjorn (who wrote the PWM code
here) so that he can test it and make sure it didn't break anything.


> > I also think the size you're passing is technically wrong. The private
> > data you're storing is a pointer to a "struct ti_sn65dsi86". The size
> > of that is "sizeof(pdata)", not "sizeof(&pdata)".
>
> sizeof(*pdata)?

No, that's also wrong. You're not storing a copy of the "struct
ti_sn65dsi86", you're storing a pointer to "struct ti_sn65dsi86".
That's "sizeof(pdata)".

Essentially I'm thinking of it like this. If you were storing 1 byte
of data then you'd pass 1 here. Then allocate and write you'd do:

u8 my_byte;
chip =3D devm_pwmchip_alloc(dev, 1, sizeof(my_byte));
*(u8 *)pwmchip_priv(chip) =3D my_byte;

Here you're storing a pointer instead of a byte, but the idea is the same.

void *my_ptr;
chip =3D devm_pwmchip_alloc(dev, 1, sizeof(my_ptr));
*(void **)pwmchip_priv(chip) =3D my_ptr;

-Doug
