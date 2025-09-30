Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37163BAD677
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5699110E5F3;
	Tue, 30 Sep 2025 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fokK6KtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F078210E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 14:59:37 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b54dd647edcso5134668a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759244376; x=1759849176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSc3erqR+m9Cq3XMrwel4zg9jxga5W34DHU66LfGEqk=;
 b=fokK6KtSblBUj3oNOP+w0qCZ7OgKBvTpBiBFe7dcvZEsgn+j2GlAhISiOJI46O3AtZ
 /QdcrpMTkt5ayCVCBbHfTGn9FeO944uZsgPdkNZkbfwq2NK6PPEfHkuiZFJBzMSSOeMa
 3RoX8JKzEQUIDe83ZbuQaB8iFsJB4MMKC0eOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759244376; x=1759849176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSc3erqR+m9Cq3XMrwel4zg9jxga5W34DHU66LfGEqk=;
 b=AyTnb9bzqK+eHscQrY5cdVT71HYh3n4nzEpFvRunB6M/UhkvK1hDTb9q6zttdFNk+N
 UYmqHFMT4o1MKabKy/i7XC94cjyoj7Fq29HEpzzggEs6JpQN5CBHqO6pYXOPMoBHdqcu
 7cH7ZwLK1uH4kW2ZMAsbYVGxbYnJ/nPni7kgssvaXdck8EusH2QwfBhC2Q1jn5GBrf6N
 00+DJ1BQgXay316te+2paiX29bjuUUBCpHrIsFBZq+a7DJghHRZaemJOoCIYrA+5jFYS
 zLmP3GwJsDxXaiKxYkFf43KRDa64BWooRbLcHc94cnZ+JMJDk+0zeGdhMjNbhpVapd5+
 zkfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDweV5ZjlcCrJ/eUdF0Q4TTsewOKOciu0XiBIcjTkq/RNy8mA9JLg4j7wJ2Uar/wtDklO4SnUFhD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmiZSJxO5+6HtBDTnej9f719hSRDwRsdwJCnEUn0Zw1egtM1CS
 R1SIA2OdygqlPGl66qXinLbuQNLI/W7A8FmWyPy/NWCybsUNVPjdUao37Ys7Pup5cQIF9kocUWb
 PlTs=
X-Gm-Gg: ASbGnctnA1VtN6w5KwSl0ztBkCizH7S4/wcY9JmKX4zNgdyetWb01ZB/E+Mt3ZAefRl
 qA6eALsetpApAw5P2+JkpVawDUE2EvciebIaWHKY5UkDd0YYAz0a/2EfRI6DjN6fukMWAf8gmaJ
 LJiAChaTrllI0PHpXvSodRLRuURRvlzuIhUGnmY4Iuw7TeZi0OgQB+1BTPH03XlAgSKnJjSLPFL
 kZFUQPM4BIW0YZFBE2k+kQJ4jB6D3ynBtan5tXrUuToXIEXtDu7GqwdylltPSaYS+mKDVAjAWOI
 aKlS33/o6ppO9b/1cZhak9635fNdaXX1y//ei3Xq53K3rjWaBXb+T5oOvqVvSMu/UGD+A7ochPS
 qkaS4vX7YVvnhqVivfWhBRVjuoqrzTMp0ufuwIV6sOE/ORLxvJT/sXzZXIA9Vm3gxQOi4IW0jOB
 IMoUGfjwAxZRc7cw==
X-Google-Smtp-Source: AGHT+IEzlCJhRUyKKppxZzl1ar7agE0A/TzyTBe49HtCHCaxAhEZyCzJcKm/l/WuyFEIRXPMBPg3lw==
X-Received: by 2002:a17:902:c382:b0:267:776b:a31a with SMTP id
 d9443c01a7336-28e7f328be1mr185405ad.29.1759244376114; 
 Tue, 30 Sep 2025 07:59:36 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6702cf9sm160467585ad.38.2025.09.30.07.59.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 07:59:31 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-27eec33b737so63338945ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyXYzdKofSbThZLW3bb2JdGSyC+YSalezG01+n44tWoq6DYkrI9LyqcA/VveCujLZC1/jQAHWQVgc=@lists.freedesktop.org
X-Received: by 2002:a17:902:fc8f:b0:267:9e3d:9b6e with SMTP id
 d9443c01a7336-28e7f442a78mr193225ad.51.1759244369479; Tue, 30 Sep 2025
 07:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-3-clamor95@gmail.com>
 <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
 <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
 <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
 <CAPVz0n1y86mKKvViG9dVN4gkqkbsjcZrFraTtKQ+Tvf4DBJCVw@mail.gmail.com>
In-Reply-To: <CAPVz0n1y86mKKvViG9dVN4gkqkbsjcZrFraTtKQ+Tvf4DBJCVw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Sep 2025 07:59:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzVGE88k6kmN+BxO_SV4H9JDM=96E1Mco3K2mofRbnGA@mail.gmail.com>
X-Gm-Features: AS18NWAy2O8-X47mCuul_Hv6w1Ke6zCRmOjrUq428DdWDjkLHW5ffnJ8B6LXgeQ
Message-ID: <CAD=FV=UzVGE88k6kmN+BxO_SV4H9JDM=96E1Mco3K2mofRbnGA@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
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

Hi,

On Tue, Sep 30, 2025 at 7:48=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> =D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 17:34 Do=
ug Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi,
> >
> > On Mon, Sep 29, 2025 at 10:13=E2=80=AFPM Svyatoslav Ryhel <clamor95@gma=
il.com> wrote:
> > >
> > > > > +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> > > > > +{
> > > > > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > > > > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->ds=
i };
> > > > > +
> > > > > +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> > > > > +
> > > >
> > > > Maybe add some comment about ignoring the accumulated error in the
> > > > context and still doing the sleeps?
> > > >
> > >
> > > Isn't that obvious? Regardless of what command returns power supply
> > > should be turned off, preferably with a set amount of delays (delays
> > > are taken from datasheet) to avoid leaving panel in uncertain state
> > > with power on.
> >
> > I won't insist, though IMO any time an error return is purposely
> > ignored a comment about why can be justified.
> >
> >
> > > > > +       msleep(50);
> > > > > +
> > > > > +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->=
supplies);
> > > > > +
> > > > > +       /* power supply must be off for at least 1s after panel d=
isable */
> > > > > +       msleep(1000);
> > > >
> > > > Presumably it would be better to keep track of the time you turned =
it
> > > > off and then make sure you don't turn it on again before that time?
> > > > Otherwise you've got a pretty wasteful delay here.
> > > >
> > >
> > > And how do you propose to implement that? Should I use mutex?
> > > Datasheet is clear regarding this, after supply is turned off there
> > > MUST be AT LEAST 1 second of delay before supplies can be turned back
> > > on.
> >
> > You don't really need a mutex since the DRM core will make sure that
> > prepare and unprepare can't be called at the same time. panel-edp
> > implements this. See `unprepared_time` I believe.
> >
> > NOTE: if you want to get really deep into this, it's actually a bit of
> > a complicated topic and I would also encourage you to add an
>
> Please spare me of this, I have enough stuff to work with and have no
> capacity to delve into depth of drm any deeper. In case this panel had
> a reset I would not care about regulators too much, but it already
> gave me too much pain and caused partially reversible damage to itself
> that I am not willing to risk.

I won't insist. It's not much code, but it could always be done later.

-Doug
