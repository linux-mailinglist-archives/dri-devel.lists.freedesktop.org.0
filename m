Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEAA828BF9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 19:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A958410E4BD;
	Tue,  9 Jan 2024 18:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32010E4BD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:09:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 804F5B81BB9;
 Tue,  9 Jan 2024 18:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717C6C433F1;
 Tue,  9 Jan 2024 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704823784;
 bh=xa3Fx62EyFYW4/AAOxEME9LtjMwoCbZ9D18izBItFgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fBBZdhS6nJWOj/dydkQRocNSg7YB8edTU7fqwsPHo6E5ZPGXU+ln5xu5xolOGh0dX
 NERMPyqUuAoIpoSHKbXn0CB9MHfVpYcQVHaP8QZszqyFJpMAb7Xc/5o2+cEPg1q9NQ
 ZHRJCtnZyz1V52Gxxghz6nKsH8m71KJ00bEw2EM9P0FvdwQ0R/0fzKYSn3hR7Fbsm5
 1CvzGx7FYOie9dxqEBA5qA+lt8/cIxftsimUnOf4pmmRhxzAshQoSzgim0v/XnSHv5
 TDYFKpBXFhh72fcWcSKS8T88Z1lepYs9LWn/n9pcPl9MXb0TTPpUTBHA1OZgCHl1Ss
 PpqSgVdqSGepA==
Date: Tue, 9 Jan 2024 18:09:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v6 27/37] dt-bindings: ata: ata-generic: Add new
 targets
Message-ID: <20240109-twelve-conceal-3730dd6f896e@spud>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <06fdb2cf7927681acf3099b826390ef75ba321af.1704788539.git.ysato@users.sourceforge.jp>
 <20240109-scoured-step-9a01fa3c5ac8@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="26AM8whvvcnixlKS"
Content-Disposition: inline
In-Reply-To: <20240109-scoured-step-9a01fa3c5ac8@spud>
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
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--26AM8whvvcnixlKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 06:07:19PM +0000, Conor Dooley wrote:
> On Tue, Jan 09, 2024 at 05:23:24PM +0900, Yoshinori Sato wrote:
> > Added new ata-generic target.
> > - iodata,usl-5p-ata
> > - renesas,rts7751r2d-ata
> >=20
> > Each boards have simple IDE Interface. Use ATA generic driver.
> >=20
> > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

That said, a bullet point list in the commit message of what
compatibles you added isn't really achieving anything, you can drop that
=66rom the commit message if/when you resend the series.


>=20
> Cheers,
> Conor.
>=20
> > ---
> >  Documentation/devicetree/bindings/ata/ata-generic.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/ata/ata-generic.yaml b/D=
ocumentation/devicetree/bindings/ata/ata-generic.yaml
> > index 0697927f3d7e..1025b3b351d0 100644
> > --- a/Documentation/devicetree/bindings/ata/ata-generic.yaml
> > +++ b/Documentation/devicetree/bindings/ata/ata-generic.yaml
> > @@ -18,6 +18,8 @@ properties:
> >        - enum:
> >            - arm,vexpress-cf
> >            - fsl,mpc8349emitx-pata
> > +          - iodata,usl-5p-ata
> > +          - renesas,rts7751r2d-ata
> >        - const: ata-generic
> > =20
> >    reg:
> > --=20
> > 2.39.2
> >=20



--26AM8whvvcnixlKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ2L2wAKCRB4tDGHoIJi
0oe4APdZUl08BEzIFQmanLf93zBxnZPMk/WX4BC/2Fpb6JohAP905vgXzXkRD3jN
rc/X/PimXkM1IP1dHXhcSIjj9lV+Bg==
=ecle
-----END PGP SIGNATURE-----

--26AM8whvvcnixlKS--
