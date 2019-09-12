Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36BB18D1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B539E6EE93;
	Fri, 13 Sep 2019 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2695B6ED99
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:58:26 +0000 (UTC)
Received: from [77.247.85.104] (helo=localhost)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i8QY5-0005Vh-M2; Thu, 12 Sep 2019 16:58:18 +0200
Received: from [::1] (helo=localhost) by eeepc with esmtp (Exim 4.89)
 (envelope-from <andreas@kemnade.info>)
 id 1i8QY3-0006dy-3x; Thu, 12 Sep 2019 16:58:15 +0200
Date: Thu, 12 Sep 2019 16:58:08 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190912165808.3c38b7a2@kemnade.info>
In-Reply-To: <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-2-andreas@kemnade.info>
 <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diUgc0I/ohhBLoo+DfzpNbJII4nieNRP6PUcXuYVoMU=; b=hRoSE76zUVKfkeRCwX+M76w5G
 A7L271OHeTUZtSSmDD3PBAO03jMYGiqNFzxpzp2TuNks8KyeaelhToRr13Axa+wk172htXGHVov6M
 4vw+oU2WUUmlVUgilSrqTXOHbJije70cX/0hQNIkcrbAsrgHVk/0Lq+o2wGv+q2P/1wSE=;
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2073052281=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2073052281==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p=GURwKtHNf6YhQ_WKbnjoL"; protocol="application/pgp-signature"

--Sig_/p=GURwKtHNf6YhQ_WKbnjoL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Sep 2019 06:39:50 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Andreas
>=20
> On 9/11/19 12:21 PM, Andreas Kemnade wrote:
> > add enable-gpios to describe HWEN pin
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> > changes in v2: added example
> > changes in v3: added Acked-by
> >   .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-b=
acklight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-ba=
cklight.yaml
> > index dc129d9a329e..1fa83feffe16 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backligh=
t.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backligh=
t.yaml
> > @@ -29,6 +29,10 @@ properties:
> >     '#size-cells':
> >       const: 0
> >  =20
> > +  enable-gpios:
> > +    description: GPIO to use to enable/disable the backlight (HWEN pin=
).
> > +    maxItems: 1
> > +
> >   required:
> >     - compatible
> >     - reg
> > @@ -92,6 +96,7 @@ examples:
> >       i2c {
> >           #address-cells =3D <1>;
> >           #size-cells =3D <0>;
> > +        enable-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> >  =20
> >           led-controller@38 {
> >                   compatible =3D "ti,lm3630a"; =20
>=20
> Looks good to me
>=20
well, the enable-gpios is still at the same place as in v2. This was sent
before your comments to v2 have been arrived.

Regards,
Andreas

--Sig_/p=GURwKtHNf6YhQ_WKbnjoL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl16XQAACgkQl4jFM1s/
ye8SEw/+IjRu/Eq+1Wkt7PlbCz3K+lHCVv+BKCe5EZrbK5rIIs6Xy/HaIH+R4aEX
JNyDe6TkjAreOLuSSFoZcE3CLA7lzhi5NGVGXfpdvNSFkJfvMGL0y8AJmhcbsQUf
4tMGEJVpF7WiUiwNynxGWKxRU1Q/++kBzcFiC0eFnewx4/0kELVCVwx+uLJQkm84
OInsI/5n+9huEmB/I2SUr5Wa0luaMDWH2XzKYvLSzM1x1L8yMFPbwrqSuU+c83mR
hEad0DRscDJhca01BZTiRpyf5HSRnPPwS8Q7YuWXDTY5VIs6QJNbdB2NfooYFnFb
bKLXfSkGBfB5mNfJq0nEP7F6RumBJ5W68gokNF0uQxy8kfR9Qz9INZjOzNIphI3z
jWvIraehnGd/1Qsu7046bj+seQIj7OjXVgsqvl2GvgYH8g9sM69sDJWvWEkXAH+8
Y8ltoMngNcW9BMf01FPpaY/LcprUPA1ylOISy6orWbFoEczKKySovOvrBOscNXTG
wUaz7yPeRzgJwHMfUQpw6r0TjWo424U3gqDQN38SCfiKhoo3GoInfRBemdU/Vh9E
vjHdTKyCx3xeWiy8a4o4lVa/YGNz3dvnZSdShMu+hxD5cpcL+iHl2kMEMVMHwDit
hjS3YcYEbtQHEtlQ88Zwv0wJmgQJ9SOExUTd8dPtJra05qtfdL0=
=1gCA
-----END PGP SIGNATURE-----

--Sig_/p=GURwKtHNf6YhQ_WKbnjoL--

--===============2073052281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2073052281==--
