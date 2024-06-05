Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC38FC624
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764E410E666;
	Wed,  5 Jun 2024 08:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P+DqiNRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC5010E6FD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:25:57 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b919d214cso3972491e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717575956; x=1718180756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTYgiHqEKqI6DY4xUoSYEerbolGYT7sqcHeeQXdfKvE=;
 b=P+DqiNRajL7682tcAJUQqMFGxDCDRfD1fUeAARB9uiJwsx5z7hkR0C1lp+mOCu+NMu
 go8VZyXoJ7+dsH+ZIm89OHrQ+HeYK0DoRZcq+ZiuKR5kUHU0oPvkBbx1rXh/u2xdriXj
 G/gqEHU0jGQQJOUir44eftqtQQdBP+K46mDng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575956; x=1718180756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTYgiHqEKqI6DY4xUoSYEerbolGYT7sqcHeeQXdfKvE=;
 b=QovK2xn11xD+zThb0Sdjee0JA+MTgt+SKRxAT/8+D+EiufKh5pKEGisxuoqpOtTlTA
 jC/ZTf8pqLQszfuCcFN55Y4Z7vV6oG50Cd8VV07KuyU5sp7c9mx/ibCKYetoiMntOOsX
 g3n4DRFh9aXJxFy5XGOuvHih8PKuP6nvvrOxXE2bUdiRc/C1yRcHkAPAvx2byAjqOT5v
 c5iRC+KJ+VMGsWCg+4MhDS9aD6HDD4q5ZgPfVgzWB3X6COUdDTKTZ9nao/EhKcxsiMjH
 Bp653UCUwTZjCUJjs/SnNTMdbWIJUApGKoDde52nsTpMkAWa8+Q2KQWdlSt49Om2fDVD
 CMkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfSd8qOSKCqpbtqAweWJ78aRg9gseDB8vrlmkZuIMGVFjVBY9hNJFi9wv3IOO+/A8szKCTkFY86uIMnYJKiUXHZkPJiAUOPJjREp1g/UjD
X-Gm-Message-State: AOJu0YwZuZiUYA76VLgOx4CL9Kk69XJl22WVAz2Dd7FQQnYUqRg5qLTI
 gvx9JSRVqNHiXy/eMUJleGxsiAtPVvV6oM3KDpgggDMuPcbwOAOhoXsPK8MO2caZKZvl79AWzPR
 XzZwVD3jUwFtmEc4MjRw5ddu19yyWgC+1qneA
X-Google-Smtp-Source: AGHT+IEz6cLO0SYpIuAYgl0GIp5y8JoS82uXIYv/gjnD7flwuduPkyTGJYNwDh582C9DE0cOUwen7uBXY5qAmo/W3wY=
X-Received: by 2002:a05:6512:3082:b0:52b:423b:ade2 with SMTP id
 2adb3069b0e04-52bab4b85b8mr1349765e87.3.1717575955882; Wed, 05 Jun 2024
 01:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-6-wenst@chromium.org>
 <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com>
In-Reply-To: <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 16:25:44 +0800
Message-ID: <CAGXv+5GuGz-KahcbKtuyUA1-59sMWSL0QucOdp8FPoQWrc9YUQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power
 domain clock
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Thu, May 30, 2024 at 6:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> > The MFG_ASYNC domain, which is likely associated to the whole MFG block=
,
> > currently specifies clk26m as its domain clock. This is bogus, since th=
e
> > clock is an external crystal with no controls. Also, the MFG block has
> > a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the bloc=
k
> > diagram, gates access to the hardware registers. Having this one as the
> > domain clock makes much more sense. This also fixes access to the MFGTO=
P
> > registers.
> >
> > Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.
> >
> > Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain con=
troller")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Just one question... what happens if there's no GPU support at all and th=
is
> power domain gets powered off?
>
> I expect the answer to be "nothing", so I'm preventively giving you my

Well it's powered off by default. Just double checked, and without the fina=
l
patch:

# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children
            performance
    /device                                             runtime status
---------------------------------------------------------------------------=
-------------------
mfg                             off-0
            0
mfg_2d                          off-0
            0
                                                mfg
mfg_async                       off-0
            0
                                                mfg_2d

And with the last patch but with the powervr removed:

# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children
            performance
    /device                                             runtime status
---------------------------------------------------------------------------=
-------------------
mfg_apm                         off-0
            0
mfg                             off-0
            0
                                                mfg_apm
    /devices/platform/soc/13fff000.clock-controller     suspended
            0
mfg_2d                          off-0
            0
                                                mfg
mfg_async                       off-0
            0
                                                mfg_2d

Things seem to work OK. I can SSH in, and the framebuffer console on the sc=
reen
works fine.


Note that accessing the regmap through debugfs doesn't do much good. regmap
doesn't handle runtime PM. And the syscon regmap isn't even tied to a
struct device. Dumping the regmap through debugfs while the power domain
is off gives all zeroes, likely due to bus isolation.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

ChenYu

> ....but if I'm wrong and the answer isn't exactly "nothing", then I still=
 agree
> with this commit, but only after removing the Fixes tag.
>
> Cheers,
> Angelo
>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8173.dtsi
> > index 3458be7f7f61..136b28f80cc2 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
> >                               };
> >                               mfg_async: power-domain@MT8173_POWER_DOMA=
IN_MFG_ASYNC {
> >                                       reg =3D <MT8173_POWER_DOMAIN_MFG_=
ASYNC>;
> > -                                     clocks =3D <&clk26m>;
> > +                                     clocks =3D <&topckgen CLK_TOP_AXI=
_MFG_IN_SEL>;
> >                                       clock-names =3D "mfg";
> >                                       #address-cells =3D <1>;
> >                                       #size-cells =3D <0>;
>
>
