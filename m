Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D37BC7672
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 07:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A4910E1FB;
	Thu,  9 Oct 2025 05:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EQ5FSHFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9F310E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 05:12:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4060b4b1200so602644f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759986743; x=1760591543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAc4vwDFuA0RvRFYPmaQPlYUcz1xA/Dd48r7PtXPvic=;
 b=EQ5FSHFf2Nuv57NEabd+4KWL+Dfr2/uJ/br2uYfAxLnxqvORPaxY4QIm/lbV8pv9if
 55F0mvPaiaycPVk43VWsSJ/qTLeF1nVv8d/QA0mcko3KFCy9Q1WcgutRZa/EXP3pJZfi
 Bl3DOVXLbckvT92yhM61oeiWJP7YpAo+jUqkoiA6vBNQjqGMI8Sd4NFHsqbZ6QJx5Cbn
 roqCLlFKaPERA7lHtjtc43LwxjgVDAU9jWW4LLfcVudJpothunbwtsoc3obEiwCzjBba
 /ef0wbyy5jFa22yeztPpnqBjT3f9YI4oKcL2z9AyjplBDUzCPwudQr0k8YlnLSRNI4Ss
 HgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759986743; x=1760591543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MAc4vwDFuA0RvRFYPmaQPlYUcz1xA/Dd48r7PtXPvic=;
 b=iFuVCFDPiiuS39H4bOlhgSvdiL6U6Fna4mOWc3OOJY8nrWdRLWLTFTfRqFUJKAW/qr
 wEL0WYtCQpbvtlsu3DtVseVYCEA4jEqXHQVsE3Wp5q/mZreuutLWRZdbN7ga5sry2BU1
 Du1lg6b+yGcyqtV0kMtJdVaG+NTsTbmHyALJBSqFuAnFeQrjTHBWS17kLKxFIco2++Ov
 pAKJB3GPvkrWeTfSJg+hiEBQaK3/2DFOO/rDb1pEeofzBScWstMmDLrAn5lDyuVDNS4E
 6tDPaxRkMe6myklVn0zgopz6xtdPDLwMUBq2c3zxF+jt46H9axWoxK0mJJvxGx8d/sfU
 L0DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVsheoRlNyjTgfmi5JBX5r1j0Z09o2K5pBLjhC5D1kOYmwSn7kW5HD7ff4lU7KWyZmt/sMfBhbi+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysDkz+1cr6H71sOIE+qoY9GmXhYDEs89og/tsuV20VDfDaynWw
 W9b3d6j+vw4qjWhAWC8Rv96+1Hrhv0UFHLwe1JgZIurEKLCXtSsJmxpfxDQPWDOTZOAsujtiva7
 U/R8wzNp2b3aFA+AWRZpPQnqnsHlTvUg=
X-Gm-Gg: ASbGncu7MHyEI4f0urxIZ6c1Hwb8GKogVXeFWOxc8r5wEVRJJsk/+SDlBSPzwlRmwxP
 eUQqL/ZIKRtcjRQZ22mGcK16dga8PQi8d6wbxC3tospKtBSV9DLEqtGtQJMOEeIhdzLU75Pgn9d
 l4I4j2no9rHa+PAQORaqMXxNdaH9Zo31TgJ04a+Fy9pTgkGGXRrgmVH+0p28JF/dKHSF1D+Ihw4
 hjqGAxgatMrt/zyUQoTFNVZnuelcdQB
X-Google-Smtp-Source: AGHT+IHEqPFGpsLkjdTJExInkzeCUrYeoBDzsTotN3s9CHFAoYRfgbeWdXnEHXE7zwgYrarYKck5hazoT/ajbub9quM=
X-Received: by 2002:a05:6000:1a85:b0:3eb:60a6:3167 with SMTP id
 ffacd0b85a97d-4266e8f7f02mr3364005f8f.32.1759986742670; Wed, 08 Oct 2025
 22:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-12-clamor95@gmail.com>
 <20251008-craving-composite-81aa70b6e882@spud>
In-Reply-To: <20251008-craving-composite-81aa70b6e882@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 9 Oct 2025 08:12:11 +0300
X-Gm-Features: AS18NWCooDACEZg9v1dc4kKxxOAalz7xHeMkJMNqgQiJE_XE0BU4PgbUW_JYKFI
Message-ID: <CAPVz0n1OEA=WHTzBtVBLQ=6vTAwG_uP1tC3Vbrb67wZDUtyVYA@mail.gmail.com>
Subject: Re: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132
 MIPI calibration device
To: Conor Dooley <conor@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:14=
 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 08, 2025 at 10:30:33AM +0300, Svyatoslav Ryhel wrote:
> > Document MIPI calibration device found in Tegra132.
>
> Could you explain why a fallback is not suitable? The patchset is really
> too big for me to trivially check that the change is correct.

First of all, this compatible already exists in Linux kernel, I have
just documented it to satisfy warnings. Secondly, each Tegra SoC
generation has unique set of registers which should be configured.
They all differ, hence fallback is not suitable here.

> With an explanation,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra114-mipi.yaml
> > index 193ddb105283..9a500f52f01d 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-m=
ipi.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-m=
ipi.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - nvidia,tegra114-mipi
> >        - nvidia,tegra124-mipi
> > +      - nvidia,tegra132-mipi
> >        - nvidia,tegra210-mipi
> >        - nvidia,tegra186-mipi
> >
> > --
> > 2.48.1
> >
