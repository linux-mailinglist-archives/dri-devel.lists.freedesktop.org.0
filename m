Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A017BAB74C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67210E4C1;
	Tue, 30 Sep 2025 05:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fbfSQvDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FF510E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:13:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so3828768f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759209214; x=1759814014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28sCSdkIVoMtYwQnNKzmgCLDZmhKADtDsinxYnd+TVA=;
 b=fbfSQvDZtMxCFVq9dK9Ah+pBjLEObeen/k3I2rfozLLQ0nHo55G+wHv361oloEELML
 wutU87QpRb8OvkA7AwAyLRuh3scSeNk6qsD990goG5lteIeAaaLnBig8CKKCH8yezyGR
 hzBVkwzV1E+X0+LRtfCjOlcloF/UB15gaIOlE11IMAM574OzvhEZ8o61/HNRp2yW3w2S
 XJPmr3zAMjo+CV0KkyN0iqYS6+l8bBksEwhybMFfF6vYajj4GvbX26TYNpD8we62EQsC
 ZHUaTsxlniGembk8KXpqzyNENK/Qd/iaD9iMdG8eL1w1UO1Tge0u/y4mJObVgT4xh1oZ
 evKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759209214; x=1759814014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28sCSdkIVoMtYwQnNKzmgCLDZmhKADtDsinxYnd+TVA=;
 b=ld8mjIlBa/NacYT1C20Z036qM5+iFFgroNGxuRDd1X7NOQisJ62FZiHXdf1rL7ir7j
 ETihF1mnZL8Q0TsP1YtZiXNEmHpuUsGrHwpU+pX8RRbn/i6lCf3CN9jH/D9/JHWYQRZ7
 t/jR3NGKg6jOKJpwcYgBThMZdBn5fVSYs1e9VO64EAsiXMWSDkXuzp6vtG8fmlLXyZOk
 F52RxIirjYkPNK0xtWngK/2RCodXSsCk2aKfHoPBUto+0HGKdPUu5YhWKnDo0OnIgAHv
 Vg5R/XYDL8acvb8DwnLFd6DiqYLoXmaA+J5Aph1aV64AIT8CzF4QDHDYHiIG8paWj7Fp
 ZQlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcx5R6M1dCMdOXPisXQXnuZ3TDa6oOWq+WIS2Pdcq4ybvENwdoo0BO4YXUQm9Bqq0XObKNl7tB43A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxej+97yMcdt2O/wsoHjHEmvaQB0w4imOQZBqiaZdyN+rv8UpFC
 6uvP/YyhHRFOh/ULvDgLykxOXwrGshokgMkZvlRun6pi2GfSi7nsthnCZJUnMR7XwUFh1txNz9a
 ahbufw8sHQQVUd9JQzs//NNiqOY5VAAY=
X-Gm-Gg: ASbGncv4eu1+GVtcmuyRrJDfyr5jFZTjaMkVmLY3OKxPkmTvDqwJ9SF0r45uU+Cs9bA
 x+OhBOrG+0BNwytqGdtcVYe7hwi8ULS8VOzSZoejiZFdeMdaVg5qdnSO5fhYvdlhxhaaYHMFEow
 YqzKzHXnCPCbPXkxy8qKdvOxLDPIKwnSwyS4yn2Vq8LJDIOjLezGPsbfVv+cvOWOrOaQCoKbnWX
 e4M5HvZ8cBJUeoeHbIc+Zlmdr0vWO5W
X-Google-Smtp-Source: AGHT+IGNsNom4Su7QU2fEFnEBxj4//549PM/wOR2kmlflhsMvTkZdTQKcaYW+oCjOcHIQs7uwi6qpfRZ1OSv0kwES0U=
X-Received: by 2002:a5d:64c6:0:b0:3f0:8d2f:5ed9 with SMTP id
 ffacd0b85a97d-424107810d7mr2398569f8f.1.1759209214395; Mon, 29 Sep 2025
 22:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-3-clamor95@gmail.com>
 <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
In-Reply-To: <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 30 Sep 2025 08:13:23 +0300
X-Gm-Features: AS18NWAktzvo6CdHqu1-L08mlA4famWpZ3H0hjW0E_8qfU4dix6TX2hosFTbY0I
Message-ID: <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

=D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 06:20 Doug=
 Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > +static int lg_ld070wx3_prepare(struct drm_panel *panel)
> > +{
> > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> > +       struct device *dev =3D panel->dev;
> > +       int ret;
> > +
> > +       ret =3D regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv-=
>supplies);
> > +       if (ret < 0) {
> > +               dev_err(dev, "failed to enable power supplies: %d\n", r=
et);
> > +               return ret;
> > +       }
> > +
> > +       /*
> > +        * According to spec delay between enabling supply is 0,
> > +        * for regulators to reach required voltage ~5ms needed.
> > +        * MIPI interface signal for setup requires additional
> > +        * 110ms which in total results in 115ms.
> > +        */
> > +       mdelay(115);
> > +
> > +       mipi_dsi_dcs_soft_reset_multi(&ctx);
> > +       mipi_dsi_msleep(&ctx, 20);
> > +
> > +       /* Differential input impedance selection */
> > +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xae, 0x0b);
> > +
> > +       /* Enter test mode 1 and 2*/
> > +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0xea);
> > +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x5f);
> > +
> > +       /* Increased MIPI CLK driving ability */
> > +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x68);
> > +
> > +       /* Exit test mode 1 and 2 */
> > +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x00);
> > +
> > +       return 0;
>
> Shouldn't this return the accumulated error?
>

Downstream does not, and I am not, though I agree that this may be a
decent idea. Thank you.

>
> > +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> > +{
> > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> > +
> > +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> > +
>
> Maybe add some comment about ignoring the accumulated error in the
> context and still doing the sleeps?
>

Isn't that obvious? Regardless of what command returns power supply
should be turned off, preferably with a set amount of delays (delays
are taken from datasheet) to avoid leaving panel in uncertain state
with power on.

>
> > +       msleep(50);
> > +
> > +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->suppli=
es);
> > +
> > +       /* power supply must be off for at least 1s after panel disable=
 */
> > +       msleep(1000);
>
> Presumably it would be better to keep track of the time you turned it
> off and then make sure you don't turn it on again before that time?
> Otherwise you've got a pretty wasteful delay here.
>

And how do you propose to implement that? Should I use mutex?
Datasheet is clear regarding this, after supply is turned off there
MUST be AT LEAST 1 second of delay before supplies can be turned back
on.

>
> > +static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
> > +{
> > +       struct device *dev =3D &dsi->dev;
> > +       struct lg_ld070wx3 *priv;
> > +       int ret;
> > +
> > +       priv =3D devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
> > +                                   &lg_ld070wx3_panel_funcs,
> > +                                   DRM_MODE_CONNECTOR_DSI);
> > +       if (IS_ERR(priv))
> > +               return PTR_ERR(priv);
> > +
> > +       priv->supplies[0].supply =3D "vcc";
> > +       priv->supplies[1].supply =3D "vdd";
> > +
> > +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplies)=
, priv->supplies);
> > +       if (ret < 0)
> > +               return dev_err_probe(dev, ret, "failed to get regulator=
s\n");
>
> Better to use devm_regulator_bulk_get_const() so you don't need to
> manually init the supplies?

So you propose to init supplies in the probe? Are you aware that
between probe and panel prepare may be 8-10 seconds, sometimes even
more. Having power supplies enabled without panel configuration may
result in permanent panel damage during that time especially since
panel has no hardware reset mechanism.
