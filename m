Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7BD1E93A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0607D10E07A;
	Wed, 14 Jan 2026 11:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="v4U3pivY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jan 2026 11:55:31 UTC
Received: from mail1.manjaro.org (mail1.manjaro.org [142.132.176.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AA210E07A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 11:55:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 4409941A8A; Wed, 14 Jan 2026 12:49:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
 t=1768391353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bBfMjrGo4Jxvu45aSn6YILJa6MyAoiKKy1rZ35UryF8=;
 b=v4U3pivYB5Ma0GveQD03fyuz4PEEBG/2vRZ/ToB5VLr5AMAuV7YFpG3Ms3jPjoxwEyQ4sI
 FVOIk7iomjkvi820S+w1kWqZPawHztknia/Fqu+02pZrLhVhA+A+Egiaxhu/N+pgl/HB38
 HKiMJuIPTXhBhgnn8wDye1FJ5YFZNLkANh8a2E6XY9ecvORG3cWpzeDSh4yZP/TcB2q9DU
 jW3/b06Ms6y8rC+u8Yo5DzVfKbWf6e9GFYS8N6sllkZl94wscWZ1CPCH2esisuICasAVDS
 30bpti0zOyTn13fh1UInsf497F7Ck5uM91hiLaNqmrZ2LlvOCfNkITGQ5lNXJg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <0b9488badb467ef83a0a464eeea921f59e32e6b0.1767111809.git.robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1767111804.git.robin.murphy@arm.com>
 <0b9488badb467ef83a0a464eeea921f59e32e6b0.1767111809.git.robin.murphy@arm.com>
Date: Wed, 14 Jan 2026 12:49:09 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
To: "Robin Murphy" <robin.murphy@arm.com>
MIME-Version: 1.0
Message-ID: <81fcd769-d7a5-e909-7105-23cd3d09e473@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/4] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Move RK3399 eDP pinctrl to boards
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
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

Hello Robin,

On Tuesday, December 30, 2025 18:20 CET, Robin Murphy <robin.murphy@arm=
.com> wrote:
> The EDP=5FHOTPLUG pin is optional, and muxed with other functions (no=
tably
> HDMI CEC), so move its selection from the SoC DTSI to the boards whic=
h
> apparently want it, namely those which enable eDP without "force-hpd"=
.
> By the same token we drop it from Pinebook Pro, which already uses
> "force-hpd", and according to the schematics does not have the pin wi=
red
> at all.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 2 --
>  arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
>  arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3399-base.dtsi
> index 4dcceb9136b7..19a312baa9f1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> @@ -2145,8 +2145,6 @@ edp: dp@ff970000 {
>  		interrupts =3D <GIC=5FSPI 10 IRQ=5FTYPE=5FLEVEL=5FHIGH 0>;
>  		clocks =3D <&cru PCLK=5FEDP>, <&cru PCLK=5FEDP=5FCTRL>, <&cru PCLK=
=5FVIO=5FGRF>;
>  		clock-names =3D "dp", "pclk", "grf";
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&edp=5Fhpd>;
>  		power-domains =3D <&power RK3399=5FPD=5FEDP>;
>  		resets =3D <&cru SRST=5FP=5FEDP=5FCTRL>;
>  		reset-names =3D "dp";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
> index 9d07353df52c..3f3cb0eb5809 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
> @@ -241,6 +241,8 @@ &dmc {
>  };
> =20
>  &edp {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&edp=5Fhpd>;
>  	status =3D "okay";
> =20
>  	/*
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/a=
rch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index eaaca08a7601..dcab04863d28 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -401,8 +401,6 @@ &cpu=5Fl3 {
> =20
>  &edp {
>  	force-hpd;
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&edp=5Fhpd>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.d=
ts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
> index a4ceafe6dd7a..80d6ea0eda84 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
> @@ -141,6 +141,8 @@ sdio=5Fpwrseq: sdio-pwrseq {
>  };
> =20
>  &edp {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&edp=5Fhpd>;
>  	status =3D "okay";
>  };

Thanks for this patch!  These changes are looking good to me, and the
board dts files changed in this patch are the right ones, i.e. those th=
at
enable the "edp" node without specifying the "force-hpd" property.

Additionally,"/omit-if-no-ref/" should be added to the "edp" pinctrl no=
de
in rk3399-base.dtsi, to not include the "edp=5Fhpd" pinctrl definition =
in
the board dtb files where that actuually isn't used.

With the note above addressed, please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

