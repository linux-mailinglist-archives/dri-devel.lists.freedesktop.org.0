Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A7B11E1F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 14:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ACD10E9E8;
	Fri, 25 Jul 2025 12:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PZrVHI9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3868010E9E4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 12:07:44 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4ab71ac933eso18658611cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753445263; x=1754050063;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
 b=PZrVHI9rlpQ7gLXsoUZtlxLPZvG/j+qJuapff+IEAHlv6JieLPQqMoQcA0r8MS2mmH
 y44uuEjKq94X043Bv/s92TassBa/2t2aedswXLltxDz6KaUq9GhH+yppqSezRFTySWQF
 ELlZ6PAjzX2b8Q2yW2bYSdU0UqoemhtS6d1kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753445263; x=1754050063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
 b=nWSU4CWhyfesUF6BMTHiHir/e+GyQh6bbT9TcLBNqSFiKI39v4tu3kW++7Y+hRK8rj
 wPkErGE2qfkOJCzZQv+cBc0jezVMOZTYsdZMI33yqrc+lVqdDzSCjQgIwNh/1QtZ/YkV
 gDBMuFUTwBLUPlh9ccioaaPiJVzfaISfNr931qoN4mqIG3k+G/mLPMHRn10cF2xARykw
 6Y0DXz4pJnqqfQaAP/0uEvX8IdiPzxswp71htgYFxccCo/uZm7VxSYw3nO+8F/AHAk/K
 TPx7b+IHdlr/BhTZDKRQxVSYj5eUipCtGB9sbqprGOIzRgSWpuKSw+RbQQIvOm6EtI2m
 RGcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9N6bS3efWS4F8k3MHqW7oa8lleNW74e1q/fqDMePiNkMfDcpwnK6VCgxwQVDMKjgWKMDhqphWAk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeN8FNt0NOUjsi6l3f+iR2h9r5K6iy7gr7OmSXkgj78rCcz4Au
 HD+KSmfj4UPgqksNNau9dZQFxu5eqfLvBuCkcS7rgtIcVuc9lUxYSrQa/Dx40+r6PpEb30SsTo6
 A0Tc=
X-Gm-Gg: ASbGncs3sMp6sjDndevEw1k2DCSDWzCZ/zZluIkuz1OHLsjoCbyg/uPEEz0XDrSIuus
 VD1Mr8kHSqPj3wOnRk2AnpDKu+WPtM38rCE4vl0lINXXXRk0gUApEqd0STchmPEionEPx1veLgq
 XJ/Lxy/ehfZAKZ7sGuyONmiyK++GGSxhG+cAGAKjsncxlVMtZ0ZWYEHAAiWuaG9svhLwx7z+iNt
 de9sqkTZZlPIyfHqBjKJsN2HIKvYd9l8w273m5Vc+s5P8PXQiBUqzm61vcqpPTb2+WNnbmm2te6
 rdb2ii0KvyDyl/fZnmi8IS2TMeJ/VUKOY/t1sLVgzdZYxtPzA5tlx42xPXytU8MGo7kLFG0jyFw
 HhJCKPHJYnw+VVI6MJJgBDTQKgtCgm5tzMvAxzOaQDnB2BbTSWH1IxGBMMHgSNA==
X-Google-Smtp-Source: AGHT+IGqWTNi37gN+2vxQamwa0aWgEtMwc1/zlogTE5G53+0fWsC38hGhewEuz67uddL4n89CcBSGA==
X-Received: by 2002:ac8:5d53:0:b0:4ab:a762:4c8d with SMTP id
 d75a77b69052e-4ae8ef5ba1emr21816841cf.4.1753445262456; 
 Fri, 25 Jul 2025 05:07:42 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ae7e2c5c66sm23381781cf.6.2025.07.25.05.07.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 05:07:42 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7e182e4171bso200491485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 05:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWzYekSN403hovq8MiQwby9sRikoohnEIywHo2W3ErtndpgoBWieQAVHAh7ckZ01tvWVQNVpQXKgZE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:358c:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4fa3fc6be93mr374132137.16.1753440996607; Fri, 25 Jul 2025
 03:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
X-Gm-Features: Ac12FXy6b-EYxcfTGxWYM-OfSnpWrsOFjS6YFWPk3kTV_ZIdvcSVvNebJ1JSwHk
Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators, 
 rtc, keys node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
 herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
 andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
 p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
 tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
 broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
 matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
 linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
 sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
 andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
 tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
 linux-media@vger.kernel.org, davem@davemloft.net
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
>
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>  #include <dt-bindings/input/input.h>
>
>  &pwrap {
> -       pmic: mt6331 {
> +       pmic: pmic {
>                 compatible =3D "mediatek,mt6331";
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> -               mt6331regulator: mt6331regulator {
> +               mt6331regulator: regulators {
>                         compatible =3D "mediatek,mt6331-regulator";
>
>                         mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>                         };
>
>                         mt6331_vdig18_reg: ldo-vdig18 {
> -                               regulator-name =3D "dvdd18_dig";
> +                               regulator-name =3D "vdig18";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-ramp-delay =3D <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>                         };
>                 };
>
> -               mt6331rtc: mt6331rtc {
> +               mt6331rtc: rtc {
>                         compatible =3D "mediatek,mt6331-rtc";
>                 };
>
> -               mt6331keys: mt6331keys {
> +               mt6331keys: keys {
>                         compatible =3D "mediatek,mt6331-keys";
>                         power {
>                                 linux,keycodes =3D <KEY_POWER>;
> --
> 2.50.1
>
>
