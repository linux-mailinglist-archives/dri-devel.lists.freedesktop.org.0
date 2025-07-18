Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA301B09F18
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B6B10E33A;
	Fri, 18 Jul 2025 09:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOXlLEXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5564A10E33A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:19:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so19984235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752830376; x=1753435176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F9624kxdlf6YfwvmNaKwA8YxPHmSVKpCcbiEww8Vk3E=;
 b=FOXlLEXOjuTqTCWEQTLtTpx4/i246fINrBEsvdXD9ypWx0Qij9z3ya0vK6IQD1JqiM
 DXwMEExMY1/HSHA9a1e2zjJg0rQlbQCxgfdnTjkrt98jm3VDZ98rNHmMUiLbhIzPC6hI
 /u9HaA1+1iSVmvfbtTUgygni8bZw8FXA8K17ZtWF6Qwt3BYS/IHZFlOclMULMi2varjw
 ukw+SpIhjicA6MAo/Ah3AuzI0LJZK8Qlpk9L7tKh1fnYwjqrg+upl0eaKMJwbvTP23VA
 mP5/oO4vD77wEHobgo/mliVsVOH5sW1dFOu6s+PGNwy/kAji6FEqUzfM5Iyt2E/eWlbK
 mHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830376; x=1753435176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F9624kxdlf6YfwvmNaKwA8YxPHmSVKpCcbiEww8Vk3E=;
 b=KdmMyT6wgMpEajjDpi/rXHvJLRZMv2IaeVL7DgLBPq5DFHhSphcFnHswRgCFf/hrxP
 QuqOqiacsQbPa6V7sABsMls4UYnxXAkgUDWsShOI1M9mNCfZHY5tvy1IB53TgCFn2nij
 0sCw5Eo1HbQ7NfsWHxAHNHNuJTcICanN7w77uc8h1MHF15XOHgIzDrgOH26ES9GHrsVt
 sMIwrWvYeN69cQ07j091FodqUcBqrZmeKxMimW//dJsmd/oIyitjN74VOHKoCk9RB5tZ
 7mV0iuRKD+NAWHidYSQg7iLafAaajbzAtQqHJ7RPB3XrmAlORzIoBI8sW7qRFwMoGfCn
 4LWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOEP+5ylfjUhKJgX8hcAXT8LgwYHY56uIoILhV/LfPYqDv3XUDX1uvqTGcX7zbawJ+9ZNs4/V7PXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeLD3rG/ge49ww66QDxo5reLWL68wbnbBtiVa5g/ORJqIBFQ9d
 B7A3WCTgWA86IzeWRbB6qiUltoYgMLpbZzMLvLQwxnwxytYhc3tErI9HUdfDppVT8jtfWb+fJPa
 2kWUCsYYR+ahlISbfDkaa+/6l0dotXIk=
X-Gm-Gg: ASbGncsDJ7voCHpsmZDS1fgq3Ci6rvMYuMAPi+vaz8WhHycY2PUZkgb+YRAygH6wcCl
 ImuCQO5qVqEoQ1JMo988zHx2s0iojuD1kr06V9A/EzGAt/zI9rL9iISWj0SnMFAmJGtL1HpMAhr
 NcSouoXj/XfVl+TvDEurPrGnEqYgVgFmBu0YUdJRgusmUYkXlJahyvWXT+y1HZtEMZDv1QiVyzV
 mm2Snrt
X-Google-Smtp-Source: AGHT+IFXFUxkSHC0x5yD9GpDrGnP0Vkk/6Hcqaopw6DVq8kJphRsVttXTBgES6eJ3vh7JXBvsfZ8EFDzCZr6pelsBmI=
X-Received: by 2002:a05:600c:4f4f:b0:456:2cd9:fc41 with SMTP id
 5b1f17b1804b1-4562e3b9937mr83880645e9.20.1752830375388; Fri, 18 Jul 2025
 02:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-5-clamor95@gmail.com>
 <10778402.NyiUUSuA9g@senjougahara>
In-Reply-To: <10778402.NyiUUSuA9g@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:19:24 +0300
X-Gm-Features: Ac12FXzJO2FaPvG3kozLgWWtNWGcHAVWJUosR9Xg-jWP9kyKhG0okiB-C1KmNR4
Message-ID: <CAPVz0n1u3=UcYvbZEfC59kMLD647pJKKiOQ308oQ9qde4vQcyQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:15 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apa=
rt
>
> 'apart from'
>
> > clock configuration and MIPI calibration which are addressed by this pa=
tch.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c |  2 ++
> >  drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
> >  drivers/gpu/drm/tegra/dsi.h | 10 ++++++
> >  3 files changed, 54 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 4596073fe28f..5d64cd57e764 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> > host1x_drm_suspend,
> >
> >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> >       { .compatible =3D "nvidia,tegra20-dc", },
> > +     { .compatible =3D "nvidia,tegra20-dsi", },
> >       { .compatible =3D "nvidia,tegra20-hdmi", },
> >       { .compatible =3D "nvidia,tegra20-gr2d", },
> >       { .compatible =3D "nvidia,tegra20-gr3d", },
> >       { .compatible =3D "nvidia,tegra30-dc", },
> > +     { .compatible =3D "nvidia,tegra30-dsi", },
> >       { .compatible =3D "nvidia,tegra30-hdmi", },
> >       { .compatible =3D "nvidia,tegra30-gr2d", },
> >       { .compatible =3D "nvidia,tegra30-gr3d", },
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 3f91a24ebef2..85bcb8bee1ae 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -662,39 +662,48 @@ static int tegra_dsi_pad_enable(struct tegra_dsi =
*dsi)
> > {
> >       u32 value;
> >
> > -     value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDI=
O(0);
> > -     tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +     /* Tegra20/30 uses DSIv0 while Tegra114+ uses DSIv1 */
> > +     if (of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-ds=
i")
> ||
> > +         of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-ds=
i"))
>
> You need to add "soc data" structures to the of_match table instead of
> checking for compatible string in the code itself.
>

I assumed that introducing "soc data" for 2 occurrences would be excessive.

> Thanks,
> Mikko
>
>
>
>
