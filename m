Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7347F3538
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 18:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310F10E54A;
	Tue, 21 Nov 2023 17:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E71810E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 17:48:40 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso4486083a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700588920; x=1701193720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAK/ItuSDRPVMNR15AwNhdUvFP+x071LcAQ3w3yTJs0=;
 b=k5Z2gHj8ALfkgx8Ol9UdknZQupCWVWRracF29KB1wwPyPBTuUTwYLJaVMtFXLuijEH
 tHHRGLzAnJ5n30MXlE/zd6rdyigCT7ReUftsx4YgXQ4FYE7fAZjOq4Kmjmtw40CzxDyZ
 pH7T4FTqH8moVdb3ci+qcOwYe6mSck0MJTu0UfaT4MD6JdnFEqFRpAZC6AwGJbtGQ93F
 L1KvnKP6cnGlPeBKAyllzvR8aTNEsBJuSK3/KUUFw73X9lzPJgxRAia+6qzvExfoZafr
 qUGuT/Wy7cz2Y4SNekoFmUcyjJOofIsQnAlwpQB2Ysf61e1NNI/Mrg6dHv/qtWXFKtmQ
 CM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700588920; x=1701193720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAK/ItuSDRPVMNR15AwNhdUvFP+x071LcAQ3w3yTJs0=;
 b=WwFDaPkqqpW/+iAC38bjeV16FNVJMX4qpL8taMz+4LTq55IAQeQhXzuzMoqnh4JClA
 YZd8C8BR426ivdiXHvzbwA+f9im34U2QQPq67oL4AlUnGPkr9YajOVNOS7nfFdjqhSWH
 fzk8kC+9GA7/enZmq7bh72y9TfDIJ1ibvqschDBOgb13hbspnDcFgVrmwsHXNhKs8urN
 HsrEVb17th0ytElyYns0rgmL7mIKcZ/5cHjYL2gZ5V3lepR6+oCTIzz0+yCXNwXYQXsf
 ZM6MvvnC4DicJ6m4/mIHjkwNW3qJjOYQVMRmq0eI/8Q6FrsidR8BmHdOqUdctFg0LGZI
 GSCQ==
X-Gm-Message-State: AOJu0YzFm6jO0qd9N8XDW2sSPj9ArkwHa11LzloKFIVZYv/N7/npI8BM
 /6CLcTa1/TLjZqdPBM+Y+IprSKKl2bmblEWMUBFaGg==
X-Google-Smtp-Source: AGHT+IGsVYAziCjXoCBHiftycTLKlFRj+F3xZDSfXKxIguYqxWX7xqT/er/I16AqY0h4UFWzZ5qHqodRZyjJQpRXSA8=
X-Received: by 2002:a05:6a20:4306:b0:187:5be4:67e2 with SMTP id
 h6-20020a056a20430600b001875be467e2mr16406256pzk.53.1700588920073; Tue, 21
 Nov 2023 09:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 21 Nov 2023 11:48:29 -0600
Message-ID: <CAPLW+4nkrMwc9GiQyn7ojaPz_50NQ3vAcMt9+tOzpHfq7G7+Tg@mail.gmail.com>
Subject: Re: [PATCH 16/17] arm64: dts: exynos850: add specific compatibles to
 several blocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 8, 2023 at 4:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Exynos850 reuses several devices from older designs, thus historically
> we kept the old (block's) compatible only.  This works fine and there is
> no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>
> Add compatibles specific to Exynos850 in front of all old-SoC-like
> compatibles.  This will also help reviews of new code using existing
> DTS as template.  No functional impact on Linux drivers behavior.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 34 +++++++++++++----------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 53104e65b9c6..df5ea43ebcad 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -396,7 +396,7 @@ pinctrl_aud: pinctrl@14a60000 {
>                 };
>
>                 rtc: rtc@11a30000 {
> -                       compatible =3D "samsung,s3c6410-rtc";
> +                       compatible =3D "samsung,exynos850-rtc", "samsung,=
s3c6410-rtc";
>                         reg =3D <0x11a30000 0x100>;
>                         interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> @@ -406,7 +406,8 @@ rtc: rtc@11a30000 {
>                 };
>
>                 mmc_0: mmc@12100000 {
> -                       compatible =3D "samsung,exynos7-dw-mshc-smu";
> +                       compatible =3D "samsung,exynos850-dw-mshc-smu",
> +                                    "samsung,exynos7-dw-mshc-smu";
>                         reg =3D <0x12100000 0x2000>;
>                         interrupts =3D <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -419,7 +420,7 @@ mmc_0: mmc@12100000 {
>                 };
>
>                 i2c_0: i2c@13830000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13830000 0x100>;
>                         interrupts =3D <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -432,7 +433,7 @@ i2c_0: i2c@13830000 {
>                 };
>
>                 i2c_1: i2c@13840000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13840000 0x100>;
>                         interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -445,7 +446,7 @@ i2c_1: i2c@13840000 {
>                 };
>
>                 i2c_2: i2c@13850000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13850000 0x100>;
>                         interrupts =3D <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -458,7 +459,7 @@ i2c_2: i2c@13850000 {
>                 };
>
>                 i2c_3: i2c@13860000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13860000 0x100>;
>                         interrupts =3D <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -471,7 +472,7 @@ i2c_3: i2c@13860000 {
>                 };
>
>                 i2c_4: i2c@13870000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13870000 0x100>;
>                         interrupts =3D <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -485,7 +486,7 @@ i2c_4: i2c@13870000 {
>
>                 /* I2C_5 (also called CAM_PMIC_I2C in TRM) */
>                 i2c_5: i2c@13880000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13880000 0x100>;
>                         interrupts =3D <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -499,7 +500,7 @@ i2c_5: i2c@13880000 {
>
>                 /* I2C_6 (also called MOTOR_I2C in TRM) */
>                 i2c_6: i2c@13890000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13890000 0x100>;
>                         interrupts =3D <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -640,7 +641,8 @@ usi_hsi2c_0: usi@138a00c0 {
>                         status =3D "disabled";
>
>                         hsi2c_0: i2c@138a0000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x138a0000 0xc0>;
>                                 interrupts =3D <GIC_SPI 193 IRQ_TYPE_LEVE=
L_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -668,7 +670,8 @@ usi_hsi2c_1: usi@138b00c0 {
>                         status =3D "disabled";
>
>                         hsi2c_1: i2c@138b0000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x138b0000 0xc0>;
>                                 interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVE=
L_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -696,7 +699,8 @@ usi_hsi2c_2: usi@138c00c0 {
>                         status =3D "disabled";
>
>                         hsi2c_2: i2c@138c0000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x138c0000 0xc0>;
>                                 interrupts =3D <GIC_SPI 195 IRQ_TYPE_LEVE=
L_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -738,7 +742,8 @@ usi_cmgp0: usi@11d000c0 {
>                         status =3D "disabled";
>
>                         hsi2c_3: i2c@11d00000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x11d00000 0xc0>;
>                                 interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -778,7 +783,8 @@ usi_cmgp1: usi@11d200c0 {
>                         status =3D "disabled";
>
>                         hsi2c_4: i2c@11d20000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x11d20000 0xc0>;
>                                 interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 #address-cells =3D <1>;
> --
> 2.34.1
>
