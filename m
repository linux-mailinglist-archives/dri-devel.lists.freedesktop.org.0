Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8908D805443
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2882610E504;
	Tue,  5 Dec 2023 12:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12B10E504
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:36:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c0e7b8a9bso20555145e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701779768; x=1702384568; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vi/+U1S70zCpRCmtolwQMMJpjEnLtDmB7aIF6AJ1vQ4=;
 b=MLGktdyEApc72sZ8WOxwkS/7nuwaEbFDuona3E6rwLntEKlZuz2taXA6vlqonbajBz
 XC8CwgkXZDh/jwIdnhu5nisOBlLSh/Cws1b2jVeHABplTdsvA0cJ8jAIcpl9v4qtbnvP
 djxcTvbJ/CuY/ARa/uUKldC6+ME3+UEnsdZCLwhPXMV1izTklKDOmJwPNzMpE63Q7rAy
 GAzJAQY+XCRxrENfvP9+6fLI5C0S4ZGICA51kR5N3kOcoIvkRnaYE+HFObree/94RbCR
 PpXOSRWurOFedBq9Sb5cAR7ahedaGJyYe56Pa4CA/6jnGBta8vqcJKyB3NZC5f+9Wl8c
 rEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701779768; x=1702384568;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vi/+U1S70zCpRCmtolwQMMJpjEnLtDmB7aIF6AJ1vQ4=;
 b=HpsmfppcoGxsqxePjXnmgCskxaylP0wR8LMpH3TTrDbkgrc/YhQ5FN4qy6HAvDhflz
 XAKP80hp9MlBC5//0hadPAp5fQ/2n6SO91ZoyDmFQUult72AnfwqEWid7awcOoBkxCP7
 DMrV+qlKj2E5zofXzbyHC2H7K42BUb7T74+Qt+qsJksmKb9ks/3Cel63TUUesBzHoTj+
 S2PT9tTsZyGJp+50IfJ9hEELhW54Azck9DmtgDbX45MhLhrDsic3dj5ahPQvPAZdnnO0
 cmETCItII7/ok7vPDGhne7VmOAw9TNVQUgYlXEtUBuIBlAnohnsETVbYmq+u8879xzpc
 CQKw==
X-Gm-Message-State: AOJu0YwVfjeQAdSfxLnQIcxdr27TOGLD08J0RxSo2HfcfmJByzDbIcm7
 PofxWcUCYmzwVx8CDyEzxiU=
X-Google-Smtp-Source: AGHT+IFRXDtzFmX4tYMMU5n5XaYJrLQWKmuFyEOl3CF2puX317iplwOttL32TpsSZhFHKXsaDUn0Zw==
X-Received: by 2002:a05:600c:3007:b0:40b:5e21:dd2c with SMTP id
 j7-20020a05600c300700b0040b5e21dd2cmr431012wmh.90.1701779767917; 
 Tue, 05 Dec 2023 04:36:07 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a170906251500b009ff1997ce86sm6715307ejb.149.2023.12.05.04.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 04:36:07 -0800 (PST)
Date: Tue, 5 Dec 2023 13:36:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Message-ID: <ZW8ZNZ_FJSV8fq-U@orome.fritz.box>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <170119374454.445690.515311393756577368.b4-ty@gmail.com>
 <20231128205841.al23ra5s34rn3muj@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Tgq7dxd4jwke8dPo"
Content-Disposition: inline
In-Reply-To: <20231128205841.al23ra5s34rn3muj@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
 linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Tgq7dxd4jwke8dPo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 09:58:41PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Nov 28, 2023 at 06:49:23PM +0100, Thierry Reding wrote:
> >=20
> > On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> > > Merging
> > > =3D=3D=3D=3D=3D=3D=3D
> > > I propose to take entire patchset through my tree (Samsung SoC), beca=
use:
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> > > 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAut=
ov920), so
> > >    they will touch the same lines in some of the DT bindings (not all=
, though).
> > >    It is reasonable for me to take the bindings for the new SoCs, to =
have clean
> > >    `make dtbs_check` on the new DTS.
> > > 2. Having it together helps me to have clean `make dtbs_check` within=
 my tree
> > >    on the existing DTS.
> > > 3. No drivers are affected by this change.
> > > 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus ex=
pect
> > >    follow up patchsets.
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
> >=20
> > [12/17] dt-bindings: pwm: samsung: add specific compatibles for existin=
g SoC
> >         commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f
>=20
> You didn't honor (or even comment) Krzysztof's proposal to take the
> whole patchset via his tree (marked above). Was there some off-list
> agreement?

I had read all that and then looking at patchwork saw that you had
marked all other patches in the series as "handled-elsewhere" and only
this one was left as "new", so I assumed that, well, everything else was
handled elsewhere and I was supposed to pick this one up...

I'll drop this one.

Thierry

--Tgq7dxd4jwke8dPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVvGTUACgkQ3SOs138+
s6FxSg/9GYBUdx6f/ahQ2fBXUlTXv4ykvHBiRJGfUuGbx8MJaPoRIbAl2gcTnwnB
fRuGMlQD0DbWYLVejy/wzASn//gvqYVp3sjPDSKFuFoUMSVNRBAJJy+DmdHcb7ia
ZnhU2k/meHpKnCP8Y3im5k1MEbiexQ8OShzyVx8ARU/Y4BXrj2SfODDI/KGVYFa9
Wfv2b1eoatUBHcDzYbjxow+qyza8E9Ym2b06HRhzQOotMSxLdBF5z1KP/29i4IWj
WGwsIEbPMmM4rLFmQ45IRWz7GwZL8Fh3afeaUijl2cytKINUgBSkvqPsQPx25FdO
xKMJHxcPjtERjnHorOGLNpotMNldbw2VRtQDD57QcqqqDBagcqpHfXwsOfuyK6v/
r9p9gAFCFjF/bpQlKZdwLZ/+khDrkH+UH3cR0OBq/mN1Sb4JcSKbLwv8pGE/F+v6
NXrlp9Xwx/gIyrRL6yijGCW50TXnE06/w4NDhHwi0tdio//f1BhQTWWYVKOArw0B
Dpsrq/yDC2xJ7afiBdfKs+nTFuujmcTS1OguA5v+Ww/8a8Bp5bsBJj5p2GkbJa/3
dChdDhsGy9As2KbUN2WYE+VIYUudcMiXbB8oKf+/kxhgwhSNgP+nirXkV422hKQs
0w+Dee6JI0kKyL3S8AjiEW3ZmbKqJpV30pgyRVUlSIXRjoljdzA=
=cbqG
-----END PGP SIGNATURE-----

--Tgq7dxd4jwke8dPo--
