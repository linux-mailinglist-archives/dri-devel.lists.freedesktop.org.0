Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C521AB09EE4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0010E12D;
	Fri, 18 Jul 2025 09:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ow+Q9JlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04FA10E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:15:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so962738f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752830135; x=1753434935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtFKEM0q0llnqDb5hBHfHcNcA7ogog7O4+RwpSiUi+s=;
 b=Ow+Q9JlQg63Y8jj9yvl0VZ/K0MSaSwvRcmvHAzk+cp7LskNJtoXkp/2JjMwbGmizyH
 Nsm852dlqq8feIlaCxyEM3Qnk5VUAjhyfAPJLwaPtfyqUVi+1FhzYJJcgt0bAFLBp8iF
 IqClYNznS/IFRehblTFExHJXgjQC88rHfG23WX2TgiaQMV49wf7tI61AtsQuJYV57HqX
 I1eWTgSmAMayN6oS3fyZWhr8s3IZPgIaOwrQkXxwXINwSaS+3ylM7DlQUAAA2Q9RL5fN
 xHZAYV5uoGjatkAdRPOLdUP0UMctLK5ZeuQV279SIpTtb/uT0jND5IGRCHWtpwAPKiFL
 bPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830135; x=1753434935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtFKEM0q0llnqDb5hBHfHcNcA7ogog7O4+RwpSiUi+s=;
 b=XLRoDV9o2MD6ZRdXQ3g9FRfNH3/T5A3xNff6jOxWEeTZgcxACn2TupC1bpGE1yppCj
 6RDqj+8K8BGYo3u8cxVOCzEJMDUkQ589/kHoGlUlXoE2+GY0CXxkSO55uiIYMu4KR/CO
 k+Hqrd8LaIwfNTIh3Hrip78oJYMEgehE+EHo6BG0xBxMEn/XGm2BxhQyGFPPF4/8xKBc
 7ib4Oc7yzxPdmbxzue2W5BdDBkZkQ8DRcoRdeCu7AvBZHjWj2W/MNcn8iRBmvWRbu35j
 NK8V2OjfKuOPe3rhytmTy3OoX7H8WMSm2UcbiqydLqIUADWKQaZrcsYQYGmlfnkIOI2e
 ty/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDwoFxbnbZzfF3HhY5AA5d31vGY5C99RtK4TB7XjaMBkSWgRv4X7VwIDXrxHmzU+Cze07FcasQDCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHxOVNG2JGaHRiNS4bySZGUdlYwWzR3cBsXIcFyob9g8Cm5IJU
 F2mgJG7BLz6q0ZImdmFXhH9UW2PnTuUhlFLXu0S1ioYQxE036r98Mklu6pzYoSvEp7bz42M1Smc
 x0YAmYaW5gD+4MVv6pYmb/p/3QmVBGxU=
X-Gm-Gg: ASbGncumFgF5rdwIyZbBNO+q/bR1vyWzGDmgFV61/BP2iPp6qN2IkFXaBJvmYvlz1wh
 95vM21W6hg17egxjQPHCSqZP3ZIzzc0EsXE0ri1lzk8/95BOm/r/tpExVeoxppRmLi15curETqU
 74WcM9GykdxabMOb8P3ouLIanqoJS7/nj4kO8YIIRnd4SulXmfp8wSyjVspE6JbrkcfsGBBU/AA
 vtt7ULA
X-Google-Smtp-Source: AGHT+IFbFV/WrZsVNGTKMIaUnj6VoATdarIKZ5rDIIhGNdW7534p06n1o9brwUTM4SAlEo/IUifRVz1oMt5xHQPbmc4=
X-Received: by 2002:a05:6000:144b:b0:3b5:dfc2:f0ca with SMTP id
 ffacd0b85a97d-3b60e53ea17mr8129767f8f.40.1752830134898; Fri, 18 Jul 2025
 02:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-6-clamor95@gmail.com>
 <4191623.PYKUYFuaPT@senjougahara>
In-Reply-To: <4191623.PYKUYFuaPT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:15:23 +0300
X-Gm-Features: Ac12FXzUeU9Uj9u7cxHHp6Dd6Ir5coldcVfWX0e7hBUUrkEw0TkP5z-Dt_8EOsU
Message-ID: <CAPVz0n3W1yhrOsiYmYecxtPeYdZiK2_UY7vVc2tiYbYwfWPp7g@mail.gmail.com>
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

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:01 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add MIPI calibration device node for Tegra20 and Tegra30.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
> >  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > b/arch/arm/boot/dts/nvidia/tegra20.dtsi index 92d422f83ea4..521261045cc=
8
> > 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > @@ -74,6 +74,16 @@ vi@54080000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             /* DSI MIPI calibration logic is a part of VI/CSI */
> > +             mipi: mipi@54080220 {
> > +                     compatible =3D "nvidia,tegra20-mipi";
> > +                     reg =3D <0x54080220 0x100>;
> > +                     clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> > +                              <&tegra_car TEGRA20_CLK_CSI>;
> > +                     clock-names =3D "vi", "csi";
> > +                     #nvidia,mipi-calibrate-cells =3D <1>;
> > +             };
> > +
>
> As you say in the comment, MIPI calibration on Tegra20/30 is part of VI/C=
SI.
> We can't add a "mipi" device here since such a device doesn't exist in th=
e
> hardware hierarchy. We already have the VI device in the device tree, so =
we
> need to use that.

I understand your point, but embedding MIPI calibration logic into
VI/CSI driver will bring up another lever of unnecessary complexity
and excessive coding. While approach I have proposed preserves
separation between CSI and DSI and reuses already existing MIPI
calibration framework.

>
> A driver for tegra20-vi already exists in staging/drivers/media/tegra-vid=
eo.
> We should aim not to break it. Perhaps bring it out of staging? (At least
> partially, but then why not the whole thing.)

It does not break VI/CSI, I have a WIP CSI implementation for
Tegra20/Tegra30 which I hope to submit soon.

>
> Thanks,
> Mikko
>
>
>
>
