Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59AB09F83
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D4110E933;
	Fri, 18 Jul 2025 09:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L+MWPCD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B580610E933
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:26:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a522224582so914259f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752830778; x=1753435578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgExZNhP/TQ7TZbqz2PLAB+ZQROoSd4CHB0RnRy8pHo=;
 b=L+MWPCD+ajXxJD2XMGeIhgQGc+kk124si0BgjRWnu5J92Qsw0B0Mx+KwI7zLr9gGoO
 M7egF+xeGtkLgt+jH8uwJfDUme0eCeOeBGya4WbTR9yDA/NQlYDscHKZuYeW+gOfTtDq
 1aeRlk5EBpBMAtK2XycT6S9bCQgcLgEn4/n1gAQ4MUTZBmaM+QfmEApnvezYFyMeAa4A
 mfoPzBGYztjgKWrwtZLSAVsMwKOnCIChQKg8dR9Eubbex5I6Vtb71kVJqvGTsWYqANpL
 zkNNeSBI8VQzGOviL+WwvWYtoTdqKtuAY5irHB05z6XPHUvKK+y62njEbki+GNFdqkBH
 +UrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830778; x=1753435578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgExZNhP/TQ7TZbqz2PLAB+ZQROoSd4CHB0RnRy8pHo=;
 b=Zx96xZhCGnmFdFQ9ijmmSmkrk4YkAXRA28D/wTv6rY7vV5d3ZW3R/MKtzvbGWo56ac
 FYFRXOy4pbQ0pOsMWr8jGJIWwoDsrZ6FdbCW1VoohPYY7600GFKpiwPvB3wid5S7fz7b
 YaiFQFQSvuFWqSaEJ97IdPJ75/FbUYhtyaLwfkbYVCrD63PHMf0IHQcO212Yo/zRU7cP
 95A/xn+jl9pmnp782GIQJet+ptXQji5J4v7gvi6QbkjaAjsMVA+OqtmGhIDWQomJK97r
 nCSRwjbRmmlf+GybRz03/4MmAIy+rwXlGW79BA7Tue8whh3BsA1qLHZHRUWfYyEvhwNn
 B+UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu/FbLUIIXF0WjVdMud8D4Zl4MkH4Zqclwk+uRyDsOsZU/bfc+5u981sa1FXFUsi3kNKXvbXX8IAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcvtNa191OSzkmH/Covltgk6TcmrHaeILTWL/MuEaypF5C7S8a
 vYotwI7Fj9CxVgf7QDnsWnXVY8R6EVbWGqRnzjprq6pqrO0WXy2xFEodgR8p9DguUMPGjZZC3fN
 RTg+Gn62RDP7sTpJVyLGQ57kByuJrveo=
X-Gm-Gg: ASbGnctAJfuvlJBwhrfesg7u/vSnJs4u/V1sOPrBk/IW6OvS1pfF6fVkTJoLjTFBUmf
 87iQpVvyhwTD16d97W9rcMewB5XhTQU4WRy42ab7D771x27OMMnaZhHdCi6hmIIlPVcrhH2rDsa
 YBF25MRmChm46yG/XTRhwF6oRYsJkdnnJWVDGryNT+2CYXuqOkbFm84Z/HEjpXJTS5/Nyh1/Zfy
 61B06wMBcXMV+llbAE=
X-Google-Smtp-Source: AGHT+IE0CZJqfMmd1YFPzJ7hCnSvHejeMeUg8VdqfZngXzMLICt2zU9gwaqmpvwTh2mK2YmmXBgGxVRTXD7xj0ov0CE=
X-Received: by 2002:a05:6000:4305:b0:3a4:d0dc:184d with SMTP id
 ffacd0b85a97d-3b60dd95c4dmr8894808f8f.27.1752830778095; Fri, 18 Jul 2025
 02:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com>
 <4191623.PYKUYFuaPT@senjougahara>
 <CAPVz0n3W1yhrOsiYmYecxtPeYdZiK2_UY7vVc2tiYbYwfWPp7g@mail.gmail.com>
 <26197475.6Emhk5qWAg@senjougahara>
In-Reply-To: <26197475.6Emhk5qWAg@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:26:06 +0300
X-Gm-Features: Ac12FXyATAxMwj6Lv9_7Hfs3i1vL0RU41Y-t1rhajaPZ2VFDLW-nCMuPkMpGoxs
Message-ID: <CAPVz0n1f=bAHqZiF3yMGS2T5Bg6C=CbJbLCGQMGfiAqK1YVzFg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for
 Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, 
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

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:22 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, July 18, 2025 6:15=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:01 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Add MIPI calibration device node for Tegra20 and Tegra30.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >
> > > >  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
> > > >  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
> > > >  2 files changed, 32 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > b/arch/arm/boot/dts/nvidia/tegra20.dtsi index 92d422f83ea4..5212610=
45cc8
> > > > 100644
> > > > --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > @@ -74,6 +74,16 @@ vi@54080000 {
> > > >
> > > >                       status =3D "disabled";
> > > >
> > > >               };
> > > >
> > > > +             /* DSI MIPI calibration logic is a part of VI/CSI */
> > > > +             mipi: mipi@54080220 {
> > > > +                     compatible =3D "nvidia,tegra20-mipi";
> > > > +                     reg =3D <0x54080220 0x100>;
> > > > +                     clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> > > > +                              <&tegra_car TEGRA20_CLK_CSI>;
> > > > +                     clock-names =3D "vi", "csi";
> > > > +                     #nvidia,mipi-calibrate-cells =3D <1>;
> > > > +             };
> > > > +
> > >
> > > As you say in the comment, MIPI calibration on Tegra20/30 is part of
> > > VI/CSI. We can't add a "mipi" device here since such a device doesn't
> > > exist in the hardware hierarchy. We already have the VI device in the
> > > device tree, so we need to use that.
> >
> > I understand your point, but embedding MIPI calibration logic into
> > VI/CSI driver will bring up another lever of unnecessary complexity
> > and excessive coding. While approach I have proposed preserves
> > separation between CSI and DSI and reuses already existing MIPI
> > calibration framework.
>
> We can consider different driver architectures to simplify things, but th=
e
> device tree has to conform to hardware. The host1x bus has no 'mipi' devi=
ce on
> it so we can't put one in the device tree.
>

I assume then placing mipi node as CSI or VI child would resolve your conce=
rn?

> >
> > > A driver for tegra20-vi already exists in
> > > staging/drivers/media/tegra-video. We should aim not to break it. Per=
haps
> > > bring it out of staging? (At least partially, but then why not the wh=
ole
> > > thing.)
> >
> > It does not break VI/CSI, I have a WIP CSI implementation for
> > Tegra20/Tegra30 which I hope to submit soon.
>
> We have to use the tegra20-vi node as that matches hardware, and each nod=
e can
> only be probed to one device, hence the issue.
>
> Great to see a CSI driver!
>
> Mikko
>
> >
> > > Thanks,
> > > Mikko
>
>
>
>
