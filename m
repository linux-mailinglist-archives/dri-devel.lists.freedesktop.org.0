Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13EBAD3F8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71F010E2C1;
	Tue, 30 Sep 2025 14:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRP+PFWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C73510E2C1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 14:48:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so31287815e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759243680; x=1759848480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uWMswBnAUaMNeL0bXv/Vzh36u4kcyphWPqYjGwjiu8=;
 b=fRP+PFWGBNdKrOV/VHZyIhPkqOHFR1fmv26mDLOerec/frThVokK9N+K5wT24CstwD
 Y1sATJ52wT6Hew7WBiSBqnkNhlbk1RFbjNEZ5i7nIHiJoOC7JRgaNTEsRuAhuwYq3KzY
 cgjrQpbKiHemYUe5phFycYezoufMKEzYZFuI0dQk45W4tTbATBV9sQExmuq7KaSqr5Tc
 JnTvDg4mAKpURIWItYFZGW8g9mJMhiv/OX/yNVGqf8imu8HH/ehGDe3kjryLCkVLuyCA
 UK7N1YhfeFYTyz8XJLrSPRf8/lblsunJU//njKJYwur6oEjoo5nIaZTYy+8P//IpcJ5w
 VnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759243680; x=1759848480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uWMswBnAUaMNeL0bXv/Vzh36u4kcyphWPqYjGwjiu8=;
 b=sjsBEl8RcsZ5ccXaJcU7bmKJVy8SetCPtIHG1m+3jDHmulutWyebb7FUZ6Hf9/I2CI
 uZf+I5qbrV9YGu91vA2OKj7dHGYf4JK6qeS/eZ0xvCQFAVPLHBCUGl2mMGtCaEzSdxVr
 ALr9upp0AYxnQKJH0tAktzmi2AGAxusuBYpP8KcJxk0+Osxra8RUgwevpnXjbJlWYfAO
 xSD4pJm6lmA/EgwqhgAIGG7K7BUH1exHXe5RgGlnbqjds/q0PDDMpjogok7jiN+Qi4J6
 8xqzrlcbwzzuz9tqbrLpWFCgJwveutce9qZrGyeJ2A+zIdcNs4WPVEDi57evtzi8NJBC
 +qhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjhv7jv4IReXYxsJpfUFpdNa0XX/BiLbtb+UIvBS0HFDVwMgjEKRfgrizGTRjd3h9eWS9x6Eku6tc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypJNl3v7H8qijFZoWBJbOIZkwpTMTWULJBeUd1l/XF1vQIyBlD
 kvfcB4ELcFie+4y5MLg+dmkp/QlZoVkq8i1/0e2MA2laPewB9iqMg511Ch1TL9WZ3PHVs0ve0yz
 NXKU60bl0RH7SUB/gZ3voTwvuoETYh5c=
X-Gm-Gg: ASbGncvx9PwcKpG5/TESGHf70ELNjkOcDt5oyVZAf3RM1aAPwefYsC+lUwcxNmquHnm
 li6L0jGi8oRGLOstGQBSlEKEYhffQKNfM4BqSoBPKRSaaRWFwd+tD9AgVdFc7LQNuaRU5lzbqXk
 B0KcnsWVpcq3MJHQ38QZQ6lprC5ybPgRiPnxqWYP6L51KzQqfRMzi0Q30x8n1KB3AN2UTMwEb3V
 V+ShhiyptTnOyWuKvTCd20gbmrN4D98
X-Google-Smtp-Source: AGHT+IHws2FT4ntqw2aBfyYphiayJTViDr0NCOtRLHShrE7HH9AkcKRZ2uE4KegclrFt6GzjPLHB7HCfhOLqLk8uwho=
X-Received: by 2002:a05:6000:40dd:b0:401:8707:8a4b with SMTP id
 ffacd0b85a97d-4240fde589fmr4347238f8f.13.1759243679506; Tue, 30 Sep 2025
 07:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-3-clamor95@gmail.com>
 <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
 <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
 <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
In-Reply-To: <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 30 Sep 2025 17:47:47 +0300
X-Gm-Features: AS18NWDDLFPY7QuoEvdlKlGc5VsyjEg3iP3wTpt3AoBP5LXpgO2i_gfVf-6QDQM
Message-ID: <CAPVz0n1y86mKKvViG9dVN4gkqkbsjcZrFraTtKQ+Tvf4DBJCVw@mail.gmail.com>
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

=D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 17:34 Doug=
 Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Mon, Sep 29, 2025 at 10:13=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> >
> > > > +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> > > > +{
> > > > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > > > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi =
};
> > > > +
> > > > +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> > > > +
> > >
> > > Maybe add some comment about ignoring the accumulated error in the
> > > context and still doing the sleeps?
> > >
> >
> > Isn't that obvious? Regardless of what command returns power supply
> > should be turned off, preferably with a set amount of delays (delays
> > are taken from datasheet) to avoid leaving panel in uncertain state
> > with power on.
>
> I won't insist, though IMO any time an error return is purposely
> ignored a comment about why can be justified.
>
>
> > > > +       msleep(50);
> > > > +
> > > > +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->su=
pplies);
> > > > +
> > > > +       /* power supply must be off for at least 1s after panel dis=
able */
> > > > +       msleep(1000);
> > >
> > > Presumably it would be better to keep track of the time you turned it
> > > off and then make sure you don't turn it on again before that time?
> > > Otherwise you've got a pretty wasteful delay here.
> > >
> >
> > And how do you propose to implement that? Should I use mutex?
> > Datasheet is clear regarding this, after supply is turned off there
> > MUST be AT LEAST 1 second of delay before supplies can be turned back
> > on.
>
> You don't really need a mutex since the DRM core will make sure that
> prepare and unprepare can't be called at the same time. panel-edp
> implements this. See `unprepared_time` I believe.
>
> NOTE: if you want to get really deep into this, it's actually a bit of
> a complicated topic and I would also encourage you to add an

Please spare me of this, I have enough stuff to work with and have no
capacity to delve into depth of drm any deeper. In case this panel had
a reset I would not care about regulators too much, but it already
gave me too much pain and caused partially reversible damage to itself
that I am not willing to risk.

> "off-on-delay-us" to the regulator in your device tree (which only
> works on some regulators but really should be universal). This is
> important because:
>
> 1. The regulator could be shared by other consumers and they could
> cause violations of this.
>
> 2. The regulator could potentially be in either state when Linux starts.
>
> 3. The regulator framework could adjust the state of the regulator at
> regulator probe time.
>
> The "off-on-delay-us" handles at least some more of those cases,
> though I seem to remember that at least a few of them still have rough
> edges...

regulator may be not fixes and not handled fully by framework, I am
not wiling to risk.

>
>
> > > > +static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
> > > > +{
> > > > +       struct device *dev =3D &dsi->dev;
> > > > +       struct lg_ld070wx3 *priv;
> > > > +       int ret;
> > > > +
> > > > +       priv =3D devm_drm_panel_alloc(dev, struct lg_ld070wx3, pane=
l,
> > > > +                                   &lg_ld070wx3_panel_funcs,
> > > > +                                   DRM_MODE_CONNECTOR_DSI);
> > > > +       if (IS_ERR(priv))
> > > > +               return PTR_ERR(priv);
> > > > +
> > > > +       priv->supplies[0].supply =3D "vcc";
> > > > +       priv->supplies[1].supply =3D "vdd";
> > > > +
> > > > +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->suppl=
ies), priv->supplies);
> > > > +       if (ret < 0)
> > > > +               return dev_err_probe(dev, ret, "failed to get regul=
ators\n");
> > >
> > > Better to use devm_regulator_bulk_get_const() so you don't need to
> > > manually init the supplies?
> >
> > So you propose to init supplies in the probe? Are you aware that
> > between probe and panel prepare may be 8-10 seconds, sometimes even
> > more. Having power supplies enabled without panel configuration may
> > result in permanent panel damage during that time especially since
> > panel has no hardware reset mechanism.
>
> Maybe look more closely at devm_regulator_bulk_get_const(). Really it
> should just save you the lines of code:
>
>   priv->supplies[0].supply =3D "vcc";
>   priv->supplies[1].supply =3D "vdd";
>
> ...and it lets you put those names in a "static const" table in your
> driver. All the timings of when regulators are initted should be the
> same.
>

Here it is my bad, devm_regulator_bulk_get_const indeed should be
preferred. I thought you meant devm_regulator_bulk_get_enable which is
not the case.

> -Doug
