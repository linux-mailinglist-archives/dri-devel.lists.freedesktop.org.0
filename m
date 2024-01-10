Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3B829E46
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 17:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74810E603;
	Wed, 10 Jan 2024 16:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3161F10E603
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 16:12:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4ACC7CE1D12;
 Wed, 10 Jan 2024 16:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2CAC433C7;
 Wed, 10 Jan 2024 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704903118;
 bh=TjB+hX1j46U+CflASkOHj4zTVTFUzA+ZbdAbWk2ryio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a3/tV8d/TpSrMMPBNe5Bio2tR6BViJo6DwIaOLYJ6dXTqqXN76rzMj52xy/TIVYU7
 YzbZtfDGI1pGi7Q//oC4Lp0Acc/UwQQCLOjmh7jQh7VaiOqDdh1HTPGwZSaIbsiby+
 cCWurXhUDUygFH/SHOzL1xtk0z4CjUb628cwyw7KwK5NQyVn9isyvX7rtXkjU4nI6S
 DQNgr5OzBM4Aitk1dNvvk+XrhQ2Lg0d0lHZa/o80mZ7ygooh+LXNeO/Yn7VkenHUa+
 tA/u0+X+ndRiC+QBeR8hwS9cofweI4PMtsBo9b5Fdo2xUbrp3dUKq39pJv1WiqrCDO
 edCMvCyR2u92g==
Date: Wed, 10 Jan 2024 16:11:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [DO NOT MERGE v6 26/37] dt-bindings: vendor-prefixes: Add smi
Message-ID: <20240110-sincere-tripod-9d34175fcbce@spud>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <c8aaf67e3fcdb7e60632c53a784691aabfc7733e.1704788539.git.ysato@users.sourceforge.jp>
 <20240109-fructose-bundle-05d01033277b@spud>
 <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NUFAcOAItrfxYJZq"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--NUFAcOAItrfxYJZq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 12:23:37PM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Tue, Jan 9, 2024 at 7:06=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Tue, Jan 09, 2024 at 05:23:23PM +0900, Yoshinori Sato wrote:
> > > Add Silicon Mortion Technology Corporation
>=20
> Motion
>=20
> > > https://www.siliconmotion.com/
> > >
> > > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 94ed63d9f7de..a338bdd743ab 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -1283,6 +1283,8 @@ patternProperties:
> > >      description: Skyworks Solutions, Inc.
> > >    "^smartlabs,.*":
> > >      description: SmartLabs LLC
> > > +  "^smi,.*":
> > > +    description: Silicon Motion Technology Corporation
> >
> > How come "smi" is used for a company with this name?
> > Why is it not something like SMTC? There's probably some history here
> > that I am unaware of.
>=20
> See Documentation/devicetree/bindings/display/sm501fb.txt
> The stock ticker is "SIMO", though.
> https://www.nasdaq.com/market-activity/stocks/simo

If there's an existing user, there's little reason to stand in the way I
think.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--NUFAcOAItrfxYJZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ7BwAAKCRB4tDGHoIJi
0q9OAQDdFxNbk8a1RbWhCTMkuhEoMnbyCFIJrJbkoyX9CvOgjgEA+TlXk2NSR1lR
ie4wsGsQcBrpiUsYvM61XxlwsOPsRgg=
=6SO8
-----END PGP SIGNATURE-----

--NUFAcOAItrfxYJZq--
