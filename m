Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D5FE97D8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486206ECCA;
	Wed, 30 Oct 2019 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D396E25C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 12:18:12 +0000 (UTC)
Received: from [2a02:790:ff:919:7ee9:d3ff:fe1f:a246] (helo=localhost)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1iPQRl-0007Aq-Qi; Tue, 29 Oct 2019 13:18:02 +0100
Received: from [::1] (helo=localhost) by eeepc with esmtp (Exim 4.89)
 (envelope-from <andreas@kemnade.info>)
 id 1iPQRj-0000pw-SV; Tue, 29 Oct 2019 13:17:59 +0100
Date: Tue, 29 Oct 2019 13:16:26 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20191029131626.2a18d27e@kemnade.info>
In-Reply-To: <CAL_Jsq+zDYifFntHMqmqU4qmsj7_nafN+W7a0Vh+HdwGvVj5TA@mail.gmail.com>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
 <CAL_Jsq+zDYifFntHMqmqU4qmsj7_nafN+W7a0Vh+HdwGvVj5TA@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZ+5u4A+qnpHl/68OvUYQcD2pzD+zlilhEVKLONYfvU=; b=VYUWPhKLnHoCNMor4xDtDak84
 Gc/1BVOIz1agTd2AssvOHtWX1qyIRf20wQPlrnniW8E8/lXx1TpWSe0umZOi1PWcr/vMzEdA4h7aZ
 L5s9KOne9OZruFeFIyKU0kubi9SkXw4KrOU+oV5c6JX4PoCD1njo33Wwr3XZgoc8Znvy4=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============0177771412=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0177771412==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DGHuyPjjOiEtDx6AE.MMu8p"; protocol="application/pgp-signature"

--Sig_/DGHuyPjjOiEtDx6AE.MMu8p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 28 Oct 2019 18:25:56 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Thu, Sep 12, 2019 at 4:33 PM Andreas Kemnade <andreas@kemnade.info> wr=
ote:
> >
> > add enable-gpios to describe HWEN pin
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org> =20
>=20
> This breaking linux-next now...
>=20
oops, sorry.=20

> > ---
> > changes in v2: added example
> > changes in v3: added Acked-by
> > changes in v4: moved enable-gpios to the right position
> >   in the example
> >  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-b=
acklight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-ba=
cklight.yaml
> > index dc129d9a329e..c8470628fe02 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backligh=
t.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backligh=
t.yaml
> > @@ -29,6 +29,10 @@ properties:
> >    '#size-cells':
> >      const: 0
> >
> > +  enable-gpios:
> > +    description: GPIO to use to enable/disable the backlight (HWEN pin=
).
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -96,6 +100,7 @@ examples:
> >          led-controller@38 {
> >                  compatible =3D "ti,lm3630a";
> >                  reg =3D <0x38>;
> > +                enable-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>; =20
>=20
> Error: Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight=
.example.dts:24.46-47
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [Documentation/devicetree/bindings/leds/backlight/lm3630a-ba=
cklight.example.dt.yaml]
> Error 1
> scripts/Makefile.lib:314: recipe for target
> 'Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.examp=
le.dt.yaml'
> failed
>=20
> You need the include for the define.

gpio/gpio.h is missing.
Yes, was not aware of that these things will be compiled and the automatic
check did not work on my system at all. So I decided not to fix that for ju=
st
this simple thing which was a not so good idea.
Will send a fixup.

Regards,
Andreas

--Sig_/DGHuyPjjOiEtDx6AE.MMu8p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl24LZoACgkQl4jFM1s/
ye/XiA/8DVVyxxx109wsfNmna3iGryDIzfVOZVxZKmh2SUGenfnGGggrA2vM9QJx
GRYg0Wi7kkXEW2EmYrgI0AddYBxTsuEI82ANE4BO6umA+1nCSedjttxZ2OptyZCH
sZqcV+nKvtROpTwSWOdG4cYH+3vpL7Is9meLNlyFbiDUjznJ67K0tgXuOCE6Iq69
xvw1xhnaomCXazrimAlht1JNDQc6Rgma7FT9AUSM9ngEW7tbfxSVhuYUCKaMlN17
M6DhV9PePIf1SZVelYIeOT8pkBHxpcb+Pza61FpQYrXF2iRwsmfMtzNx8LOiCobp
5qnkyz2YIRZ5CIz7gc5EkZim+pIPCAJekZz3HEWsS3ypkhw3pLabRBOekX2r57iO
NwqStsPFM71+xZnElqULvQ5o331G3aCbJEFkCsG9sZp98qNN0yI0UYABVl+MIeqT
euvtkNHzvntSBsqYUm7MjWW8uUiFxuS0eL+AIiXBOofvJ6nsvuQHyEDvHsMNec1R
dokvq/TxLbKe81rZY1OBGT/UGzMKKGuwkH0BetpuJ0eOYZJ+nHCXA20JWr5fCoPS
06G2W/MLRyTTuL7tGJ8Xa6RcKvj9pCxO+upE3eRGp02ZxyGefs68gHprOS8UiclL
TMCcxD8d3k9LmR2e089kZwoA+9JhgUK33pCZBQwVVIBGuSxl1nY=
=c3AX
-----END PGP SIGNATURE-----

--Sig_/DGHuyPjjOiEtDx6AE.MMu8p--

--===============0177771412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0177771412==--
