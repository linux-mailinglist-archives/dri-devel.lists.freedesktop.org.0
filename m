Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850EB1064D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6513010E927;
	Thu, 24 Jul 2025 09:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oAlphdwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B4D10E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:34:29 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55628eaec6cso735249e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753349668; x=1753954468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
 b=oAlphdwYBt2Xgy68b6GFp3s8hPZBqZlz04a7aopBTdMajffR5Qa5WOMCpxbsM38s+j
 PNSqPqxzSKfhKRQwSI8A2ieI7uU3CP4349nVo9RhEomCPWfSEquoPwz+o0mYSzjOJqq8
 Eih1dENXSFMMKKh86k6MJ1dzzQFFl0X/cNvPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753349668; x=1753954468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
 b=baIg+cXFN530sBrTIXeOeZsS8Kxztjz4bILzvcAN/SCbpOIP74cg15kZ+uzCQtSmds
 +JbsKu2y792yRJT22G7rX2HXlWEUXd9ETnr+z11apwFZfN03OfSxdJbVTHxdNF4ZfOXb
 P+ujiPF8pAhUej+c65cwmWgXpeT1vFzRsVWTdka5ge8LrFptP/sY8QdgWxlPrDLksnXx
 5TSD9pMR7ssILCNxMipSmA2jNL2Kbym2yyuaiasQt3zT/Un/TaOdQcqRzpXsut++Wzgc
 iL4LZ0iuEDyQQaCik/qznFY/gebdtsNO7An2Y9jFhGrTpBU9cMFgB4LYcBhXLTZjh44S
 RNtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4/sWmfmm6z0BAGKwr62I+r7Yxlv3C9EcXIAdVmuUbTZfzPKuX9kTRVnsjzXAtOH3yVTY6MipfIDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6UYDUj3IwXHZkFLmKNFNd9GKd5XBmFomhssIXgAg1tB09LZzX
 fp5RrLGkOEv2Rx16q7XA+Et0hiMSMnsKBMcSNpf+KHeL6i42Z4omm/U4EYIvmDQFtRDd55SfVC5
 gpSzSrZt1mYztVcTTYWvRgzAMC6EIurOCtXs1kZ7M
X-Gm-Gg: ASbGncsZ5Glr6s1SZAhpnVn2ApgQT71gk0tBeW4Na3uGLnfp+oATAj7RfsZAoollr6M
 e3siWrmZD0gq7Mc5s1c2aI21tWaZJgPLlNpP5EunCnS6LXz7IeHjjsL8cqzGrybNSFSr/wQo/Ol
 XEzLSE8hPoX4yxGFqTbbGTq7IGR2dffRDvYSs/S3tWJZrGJoZVa1pufoeSRs/YW9ws/4QHAvE68
 f1pb/85HqAM0I0m37efUZLrnCynwagr2JY=
X-Google-Smtp-Source: AGHT+IGbQGAzYrZuGKb7ZyVDVB2IA3/m7/1T14ShQ1gB/s052YEW14kETsBT1/6F7qIVfTgZAU3RoBMdAKdnokA3DJc=
X-Received: by 2002:a05:6512:2391:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-55a513bf799mr2287118e87.31.1753349667560; Thu, 24 Jul 2025
 02:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:34:15 +0800
X-Gm-Features: Ac12FXx-dC7GqsweL9em8IYbzr7gdu7h7TRc-hJouMaDYtIUw_U2Osb1ZV53HA8
Message-ID: <CAGXv+5ECM53Q4ndZ49Xa71mamy=GhGqdOMQYXydH6cEeT=0EgA@mail.gmail.com>
Subject: Re: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel
 node to machine dtsis
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
 ck.hu@mediatek.com, houlong.wei@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
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

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Not all of the kukui machines have got a real DSI panel, infact,
> some of those have got a DSI to eDP bridge instead: this means
> that the address and size cells are necessary in the first case
> but unnecessary in the latter.
>
> Instead of adding a bunch of /delete-node/ which would impact on
> human readability, move the entire panel node declaration to each
> of the relevant Kukui machine dtsi: even though this introduces
> some duplication, the advantages in readability surclass that.

This is just an artifact of the lineage. Kukui the original design
was a tablet with MIPI DSI panels. Then the Jacuzzi clamshell design
with eDP panels was derived from that.

If we really don't like the duplication, maybe we could introduce
a `mt8183-kukui-tablet.dtsi` file for the bits that are specific
to the tablet design.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
>  5 files changed, 83 insertions(+), 28 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index f2afca63c75a..1b74ec171c10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
>         };
>  };
>
> -&dsi0 {
> -       status =3D "okay";
> -       /delete-node/panel@0;
> -};
> -
>  &dsi_out {
>         remote-endpoint =3D <&anx7625_in>;
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 472d4987615a..d71972c94e42 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -61,6 +61,33 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 1b21e3958061..b702ff066636 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
>         };
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a85c73b43195..b6cfcafd8b06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -45,6 +45,34 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 8f3a0e85b4ed..4ac0a60fdd24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -252,29 +252,6 @@ &cpu7 {
>
>  &dsi0 {
>         status =3D "okay";
> -       #address-cells =3D <1>;
> -       #size-cells =3D <0>;
> -       panel: panel@0 {
> -               /* compatible will be set in board dts */
> -               reg =3D <0>;
> -               enable-gpios =3D <&pio 45 0>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&panel_pins_default>;
> -               avdd-supply =3D <&ppvarn_lcd>;
> -               avee-supply =3D <&ppvarp_lcd>;
> -               pp1800-supply =3D <&pp1800_lcd>;
> -               backlight =3D <&backlight_lcd0>;
> -               rotation =3D <270>;
> -               port {
> -                       panel_in: endpoint {
> -                               remote-endpoint =3D <&dsi_out>;
> -                       };
> -               };
> -       };
> -};
> -
> -&dsi_out {
> -       remote-endpoint =3D <&panel_in>;
>  };
>
>  &gic {
> --
> 2.50.1
>
