Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D6828BE4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 19:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC39310E0A7;
	Tue,  9 Jan 2024 18:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C7310E0A7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:06:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5AC29B81BB9;
 Tue,  9 Jan 2024 18:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8AAC433C7;
 Tue,  9 Jan 2024 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704823565;
 bh=NN/FbWiRX53UohMXPf7fLJZkdhyGG0EUcymSjVK7DwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kcp7JAxN3AiJT/zSfbaoA2+7fPC3A0ZWVvSpRFAXx0sFyslV297XJ83IYJOjo4WAv
 RUdWxNZ+T4f+tX8USIS62YD32DyNu8gWf/EukR9JAZCISzWgu8dBFDlcQVcUef3Qz+
 qkeRllPXAqI8/+i1uMFcsFAVDEyFdefmurq958sF8q6Q1EDAqkZtVovABFy0M4KCPP
 /3SbdOHFNikwrWGa3c8z8h8x3ZkVs4szS72knM0ROeuCbSWYF8N/GbynYZCQraVBub
 IdFyuk+hxImNfwll+1mwS83rquldTk9ZtxZiCRx01zOHozYZdd8m+oaJLcGS5nFK5t
 kPz07I2XU00Bw==
Date: Tue, 9 Jan 2024 18:05:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v6 26/37] dt-bindings: vendor-prefixes:  Add smi
Message-ID: <20240109-fructose-bundle-05d01033277b@spud>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <c8aaf67e3fcdb7e60632c53a784691aabfc7733e.1704788539.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6n8cYfu9ndq1dxnc"
Content-Disposition: inline
In-Reply-To: <c8aaf67e3fcdb7e60632c53a784691aabfc7733e.1704788539.git.ysato@users.sourceforge.jp>
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


--6n8cYfu9ndq1dxnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 05:23:23PM +0900, Yoshinori Sato wrote:
> Add Silicon Mortion Technology Corporation
> https://www.siliconmotion.com/
>=20
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 94ed63d9f7de..a338bdd743ab 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1283,6 +1283,8 @@ patternProperties:
>      description: Skyworks Solutions, Inc.
>    "^smartlabs,.*":
>      description: SmartLabs LLC
> +  "^smi,.*":
> +    description: Silicon Motion Technology Corporation

How come "smi" is used for a company with this name?
Why is it not something like SMTC? There's probably some history here
that I am unaware of.

Cheers,
Conor.

>    "^smsc,.*":
>      description: Standard Microsystems Corporation
>    "^snps,.*":
> --=20
> 2.39.2
>=20

--6n8cYfu9ndq1dxnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ2K/wAKCRB4tDGHoIJi
0s/8APwPEbHULafVMSeaB1GSkVcjbGMU9USLjp1+xwbzkhRskwEA53VXD7JPeCRu
EW9RzYohxhrQuLlQKIa6cMs0R07nowg=
=ftc0
-----END PGP SIGNATURE-----

--6n8cYfu9ndq1dxnc--
