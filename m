Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DCC4232FF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 23:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756216EC6E;
	Tue,  5 Oct 2021 21:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.de.opalstack.com (smtp2.de.opalstack.com
 [139.162.136.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562A06EC6E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 21:44:26 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp2.de.opalstack.com (Postfix) with ESMTPSA id 5930C12D79C;
 Tue,  5 Oct 2021 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
 s=dkim; t=1633470264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N89vCJUW5C6PtAMTKhh3UWrrTYPPd5RQPb+6C/bnXP0=;
 b=OBPnxKdiqKld2PpKdYUuuf2z2vVAzv9gylAWz0SapUlAh+v+UrgjvoAyMJTf+XRusgQcLf
 +2Nt1sCaOh0Xi/crCfrZYEC6Y7vsepQ5rO5t4Y7twjBZH6ECF4xa2Nv+cHDdjYD++/fLoE
 h4WAdxUzAT5gC6SX/v3jEuUzxAj0HOE=
From: Paul Boddie <paul@boddie.org.uk>
To: Paul Cercueil <paul@crapouillou.net>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, Jon
 as Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
Date: Tue, 05 Oct 2021 23:44:12 +0200
Message-ID: <3514743.EH6qe8WxYI@jason>
In-Reply-To: <O7VI0R.CRIG8R7O0OOI3@crapouillou.net>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=1.66
X-Spam-Level: *
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

On Tuesday, 5 October 2021 22:50:12 CEST Paul Cercueil wrote:
> Hi Nikolaus & Paul,
>=20
> Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> >=20
> > diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> > b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> > index 9e34f433b9b5..c3c18a59c377 100644
> > --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> > +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> > @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
> >=20
> >  		status =3D "disabled";
> >  =09
> >  	};
> >=20
> > +	hdmi: hdmi@10180000 {
> > +		compatible =3D "ingenic,jz4780-dw-hdmi";
> > +		reg =3D <0x10180000 0x8000>;
> > +		reg-io-width =3D <4>;
> > +
> > +		clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
> > +		clock-names =3D "iahb", "isfr";
> > +
> > +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
> > +		assigned-clock-rates =3D <27000000>;
>=20
> Any reason why this is set to 27 MHz? Is it even required? Because with
> the current ci20.dts, it won't be clocked at anything but 48 MHz.

EXCLK will be 48MHz, but the aim is to set the HDMI peripheral clock to 27M=
Hz,=20
which is supposedly required. I vaguely recall a conversation about whether=
 we=20
were doing this right, but I don't recall any conclusion.

> > +
> > +		interrupt-parent =3D <&intc>;
> > +		interrupts =3D <3>;
> > +
> > +		/* ddc-i2c-bus =3D <&i2c4>; */
> > +
> > +		status =3D "disabled";
> > +	};
> > +
> > +	lcdc0: lcdc0@13050000 {
> > +		compatible =3D "ingenic,jz4780-lcd";
> > +		reg =3D <0x13050000 0x1800>;
> > +
> > +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> > +		clock-names =3D "lcd", "lcd_pclk";
> > +
> > +		interrupt-parent =3D <&intc>;
> > +		interrupts =3D <31>;
> > +
> > +		status =3D "disabled";
>=20
> I think you can keep lcdc0 enabled by default (not lcdc1 though), since
> it is highly likely that you'd want that.

As far as I know, the clock gating for the LCD controllers acts like a seri=
es=20
circuit, meaning that they both need to be enabled. Some testing seemed to=
=20
confirm this. Indeed, I seem to remember only enabling one clock and not=20
getting any output until I figured this weird arrangement out.

Paul


