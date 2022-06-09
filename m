Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41554467B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 10:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF7010F559;
	Thu,  9 Jun 2022 08:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF1B10F559
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 08:52:29 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A34F9FF804;
 Thu,  9 Jun 2022 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654764745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QAaKsRT9Fep3P+3J9x+QNlXa0fQNHas0o57m3Dfvzn4=;
 b=Gmnovgy1pYM6DHS4NdPpIik6QfZrXk2iyEHXYwmNcLnugJP62Jf7y1If/rnetIRb5h0eMV
 D7b2uLs7fRZB0d5vm6g8cCERB3jeKy3x4RqL99yYTdX5kvEiyfos+SwWrzKYD6w5Gg0tXx
 OJYuUpMJeXTkvEC3pgze8QblC0Q38gec987Zu/jf6hqNXKF50O13lBQE5rn2ZRlltQKrk6
 IRwysoTVD/e2PlJKSUJdQ3ao6P4YXeVukLnAazCPiKjixBumQ8W3dpPBLzgqRhsEWCNZXt
 NtYXeEQ+jQhzMXOj/dcsrdQxGQNJHK/F9riuljBgM6SF+uBQbE0oRUz0GLPNQQ==
Date: Thu, 9 Jun 2022 10:52:24 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH 3/3] dt-bindings: ltk050h3146w: add compatible for
 LTK050H3148W-CTA6 variant
Message-ID: <YqG0yL7nnUkTrnN1@aptenodytes>
References: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
 <20220131164723.714836-3-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j21ZuvV3I6j8tCOl"
Content-Disposition: inline
In-Reply-To: <20220131164723.714836-3-quentin.schulz@theobroma-systems.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Quentin Schulz <foss+kernel@0leil.net>,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--j21ZuvV3I6j8tCOl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 31 Jan 22, 17:47, quentin.schulz@theobroma-systems.com wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>=20
> The LTK050H3148W-CTA6 is a 5.0" 720x1280 DSI display, whose driving
> controller is a Himax HX8394-F, slightly different from LTK050H3146W by
> its init sequence, mode details and mode flags.

No difference needed in the binding at all then, I suppose.

> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk0=
50h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk=
050h3146w.yaml
> index 3715882b63b6..63d2a00348e9 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146=
w.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146=
w.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - leadtek,ltk050h3146w
>        - leadtek,ltk050h3146w-a2
> +      - leadtek,ltk050h3148w
>    reg: true
>    backlight: true
>    reset-gpios: true
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--j21ZuvV3I6j8tCOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmKhtMcACgkQ3cLmz3+f
v9ErTAf/fZH/QynDmrkqJG6GCCF/ohHeT3YC4s6RpGQiGY94KcxsVcBHScnZRPmL
zvsrlIMtv1q4Xm6Y319S4Xok/6738Dd0mx5H8p8hZZ9cg2fuDJuA4AIvhJr3Lvab
b5LejJ13rwpywcCHqhjExa0CNDwLzocLUmkqGdojXkkFZlnQl6S/IDfrUqg0knlK
6KZ5XYZDNBg8h4HafqqEl25R2F/hg8t4FcMPewlN+H1jhssdhxSUB4cUsmpRz0Pe
tBMIRkdKuV6achQc7GlnNTP/mfx3Pb1dQ9qFQZPjxFQHqBSgdfuc9t5QQz1eexw4
aVEfH3qFPanieSAzNGVogIA4H+1Mhw==
=usqI
-----END PGP SIGNATURE-----

--j21ZuvV3I6j8tCOl--
