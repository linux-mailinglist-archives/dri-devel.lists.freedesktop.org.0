Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A24B11E00
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8558310E04A;
	Fri, 25 Jul 2025 11:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IVV5o9W7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C876E10E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 11:58:24 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7e278d8345aso202873385a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753444704; x=1754049504;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
 b=IVV5o9W7dw6WVUsX0Zk5fUVYwFUO2GQWEMw1D5Hk8LfGe1CfFB3SzEKsfYP0SYVp2q
 8oYg39nPPyGVQrVnf994EK7wrEVpbp882B2jAi/QpLlRWvIBRmEpomMtRVAxPmxUdQQO
 7Og1nQyn2Km0GlFNq2CE3SCnF1AamVT8Ye9JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753444704; x=1754049504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
 b=TRkVDtJw99jayEQjbvydYga5BF2BnnGyqIg+yT/3Jor3u25KF6jvJoJIOPX8zJcqaa
 qf7tiqA2cqkhND336yk7sSQy5RN5Y+F/Awrr2aftwiiRBcRBr7je1/QOHugu8LWeuP2c
 wOM194BAxL2xsQbSNnpHbxOLQv/xcZU8gpo/gvXT8jsmV5H9fowiYqa2ESV39V7pOSAn
 sgZ7gjoQaQpjwQV6LeEyjlXZ4HVCnvX7KKkboMOMvMjkOrA/g3IdYakNlf/689aRGMUm
 XozDI4Ctp+U7+eaE+mf9SylfjJ8/as174joQMzWvNRzlOPIRvXaS3MpUfRUpmrEBgPcP
 gMvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh+lQnyuCMZwzmYj9JpJq0kl5HJ3L4QcS9pqWfhEiahsTaMF2sytVjZuLEuh6LgLCNxJK1EM+fhWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeJAc+mJbPIt3fkC4Nhs2u8YZQCs7y2aaN+c4SM8EvBrZajmxO
 EhUfkyYEjZMoekZvJ6HPQ0vYVgRtSgNX06BaDUZ8qb9WejRdoxLUY5wco8cAwLnpf+KEOydz/+F
 08Io=
X-Gm-Gg: ASbGnct9ai82f0Dy8+NSTWpBkLmjSkBWyHHDb+qELrXfxo/IFgoNjAjvSvLX2V3xNSq
 p+Xv1pqFJXki/uJXwYZKl1pf8GpoA5uryRceJ+SZRsnEgLYjDCOWfU7ducfp2sOe0Iu7aqpSvtA
 VW3B4xKV7K3t52GVkNWugzx6y1AwP0jrze30I59d4mDVEmpehm+JGMVVKE4yA8YCNlmK5r27dw+
 WwrzkA29BwXru8b8ZQBRSDZwyX/iU0v1ontWFlpa6hBXWRDwzfQ0DU4vVbSawP6mcOos5ZrI8v5
 rvMI8R5hUlJgliIO3aGKqC9irqoXUEPXBQ+9UQ/UrDt5gl70YxXKgCjGfilzpsPKSFnF7cZjc1B
 9ZABIC+MeE9UOSRwE4g5PHfJgPS37anr2S8kFT5DSQuvyX48zWG0fXxFUlHRTwQ==
X-Google-Smtp-Source: AGHT+IF4zBHV/ZCs9Z/OA/CSxF1aNpWzwR6Ue87alq6nfIxakzXsn2+ky+Z89T/4brNiaji2eDwjGQ==
X-Received: by 2002:a05:620a:461f:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7e63be38464mr185082285a.11.1753444703614; 
 Fri, 25 Jul 2025 04:58:23 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e632e3cef4sm237236285a.84.2025.07.25.04.58.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 04:58:23 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7dfc604107eso178300185a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0WhbO0JLwqe3giCxetfqaqNtO9sLFH5XeNUwJYQ1KbD3/CzAiRsV4zm96naq1Ca888BwP362LyeE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:cce:b0:4e6:4e64:baeb with SMTP id
 ada2fe7eead31-4fa3ff55fbamr323634137.17.1753441040390; Fri, 25 Jul 2025
 03:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:56:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
X-Gm-Features: Ac12FXw-hSTS0fHSbHXeHNK-nhzfyTLOXfpWf3gYQQXz8LA0IhEjugCIp682sPw
Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
Subject: Re: [PATCH 17/38] arm64: dts: mediatek: mt6797: Fix pinctrl node names
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
> Change the pinctrl node names to adhere to the binding: the main
> nodes are now named like "uart0-pins" and the children "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index 0e9d11b4585b..be401617dfd8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -135,71 +135,71 @@ pio: pinctrl@10005000 {
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>
> -               uart0_pins_a: uart0 {
> -                       pins0 {
> +               uart0_pins_a: uart0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO234__FUNC_UTXD0>,
>                                          <MT6797_GPIO235__FUNC_URXD0>;
>                         };
>                 };
>
> -               uart1_pins_a: uart1 {
> -                       pins1 {
> +               uart1_pins_a: uart1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO232__FUNC_URXD1>,
>                                          <MT6797_GPIO233__FUNC_UTXD1>;
>                         };
>                 };
>
> -               i2c0_pins_a: i2c0 {
> -                       pins0 {
> +               i2c0_pins_a: i2c0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO37__FUNC_SCL0_0>,
>                                          <MT6797_GPIO38__FUNC_SDA0_0>;
>                         };
>                 };
>
> -               i2c1_pins_a: i2c1 {
> -                       pins1 {
> +               i2c1_pins_a: i2c1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO55__FUNC_SCL1_0>,
>                                          <MT6797_GPIO56__FUNC_SDA1_0>;
>                         };
>                 };
>
> -               i2c2_pins_a: i2c2 {
> -                       pins2 {
> +               i2c2_pins_a: i2c2-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO96__FUNC_SCL2_0>,
>                                          <MT6797_GPIO95__FUNC_SDA2_0>;
>                         };
>                 };
>
> -               i2c3_pins_a: i2c3 {
> -                       pins3 {
> +               i2c3_pins_a: i2c3-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO75__FUNC_SDA3_0>,
>                                          <MT6797_GPIO74__FUNC_SCL3_0>;
>                         };
>                 };
>
> -               i2c4_pins_a: i2c4 {
> -                       pins4 {
> +               i2c4_pins_a: i2c4-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO238__FUNC_SDA4_0>,
>                                          <MT6797_GPIO239__FUNC_SCL4_0>;
>                         };
>                 };
>
> -               i2c5_pins_a: i2c5 {
> -                       pins5 {
> +               i2c5_pins_a: i2c5-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO240__FUNC_SDA5_0>,
>                                          <MT6797_GPIO241__FUNC_SCL5_0>;
>                         };
>                 };
>
> -               i2c6_pins_a: i2c6 {
> -                       pins6 {
> +               i2c6_pins_a: i2c6-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO152__FUNC_SDA6_0>,
>                                          <MT6797_GPIO151__FUNC_SCL6_0>;
>                         };
>                 };
>
> -               i2c7_pins_a: i2c7 {
> -                       pins7 {
> +               i2c7_pins_a: i2c7-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO154__FUNC_SDA7_0>,
>                                          <MT6797_GPIO153__FUNC_SCL7_0>;
>                         };
> --
> 2.50.1
>
>
