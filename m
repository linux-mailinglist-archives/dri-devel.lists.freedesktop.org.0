Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867C817A96
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0310E29F;
	Mon, 18 Dec 2023 19:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2E910E281
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AA7D4B80B65;
 Sun, 17 Dec 2023 22:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FC0C433C7;
 Sun, 17 Dec 2023 22:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702852356;
 bh=N3sSswueORYzvAOU+uyz4bjbbUS1XZg7OxyIMbEBeiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfKaHtApHCxP6V6JQqphAN0TMo7tzLbkXADzl0G1lO+c1cALVDk++1HfXdKjRI0zw
 rwiacjVKaP4wRPHE0INCBxFEw10zFvvYHqutW99JUkSqISd0yajsqDFSqWe3jwivSN
 gRdmFT/tK15KuKtdKwa95hARjELWAfbnq9yoiGOcpzsUO5HjYzS4CbFX5zf5hfvMSj
 UpN6gjrHtJmtf5t+rIASIFzupBi+HaKGa0EgfWO8EhY0x/r3Kvrkco44vWhQCMciy0
 iFtED/2gdJXF/8s7Hf/XNyEIyXvUwY3GiSV+xjFQdxfQAMqEiKLcxnqQdVxbQGT5/h
 arY5fm+i3RzmA==
Date: Sun, 17 Dec 2023 22:32:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
Message-ID: <20231217-catcall-turbulent-0a4072eaba43@spud>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
 <20231217-bacteria-amusable-77efb05770a4@spud>
 <87fs00ms4b.fsf@minerva.mail-host-address-is-not-set>
 <20231217-hunk-cross-4bf51740957c@spud>
 <87cyv4mqvs.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TC9NmRtTLpYSAbHx"
Content-Disposition: inline
In-Reply-To: <87cyv4mqvs.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--TC9NmRtTLpYSAbHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2023 at 11:00:07PM +0100, Javier Martinez Canillas wrote:
> Conor Dooley <conor@kernel.org> writes:
>=20
> Hello Conor,
>=20
> > On Sun, Dec 17, 2023 at 10:33:24PM +0100, Javier Martinez Canillas wrot=
e:
>=20
> [...]
>=20
> >> >> +    then:
> >> >> +      properties:
> >> >> +        width:
> >> >> +          default: 96
> >> >> +        height:
> >> >> +          default: 64
> >> >
> >> > Do you envisage a rake of devices that are going to end up in this
> >> > binding? Otherwise, why not unconditionally set the constraints?
> >> >
> >>=20
> >> Because these are only for the default width and height, there can be
> >> panels using the same controller but that have a different resolution.
> >>=20
> >> For example, there are panels using the SSD1306 controller that have
> >> 128x32 [0], 64x32 [1] or 128x64 [2] resolutions.
> >
> > This, as you know, does not matter here.
> >
>=20
> Are you sure? What I tried to say is that the SSD133x are just OLED
> controllers and manufacturers use those chips to attach a panel that
> has a certain resolution.
>=20
> While it makes sense to use all the supported width and height, some
> manufacturers chose to have a smaller panel instead (I used SSD1306
> as an example because I knew about these but the same might be true
> for let's say SSD1331).
>=20
> Or saying another way, are you sure that every manufacturer selling
> RGB OLED panels using the SSD1331 chip will use the default resolution
> and users won't have to set a custom width and height ?

That's not at all what I was saying. I just meant unconditionally set
the constraints on the property (in this case the default) since you
only have one compatible. Not unconditionally set the height and width.

Apologies if if that was unclear.

Thanks,
Conor.

> I have already chosen to make the DT binding as simple as possible to
> prevent what happened with the SSD1306 "solomon,page-offset" property
> that has a broken default [0] but I think that not allowing to set the
> resolution is already too restrictive and would make it unusable for
> any panel that doesn't have the default width and height.
>=20
> [0]: https://lists.freedesktop.org/archives/dri-devel/2023-November/43115=
0.html
>=20
> >> But answering your question, yes I think that more devices for this
> >> SSD133x family are going to be added later. Looking at [3], there is
> >> at least SSD1333 that has a different default resolutions (176x176).
> >
> > That's fair enough though. I'd probably err on the side of introducing
> > this complexity when the other users actually show up though.
> >
>=20
> Agree and the reason why I did not include entries for the SSD1332 and
> SSD1333. I was planning to add those only if there were users since it
> seems that the SSD1331 is the most popular controller from this family.
>=20
> But as explained, even for the SSD1331 it may be needed to set a width
> and height that is different than the default of this panel controller.
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

--TC9NmRtTLpYSAbHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX92/gAKCRB4tDGHoIJi
0husAQDSENwV0d8UhOR0UCiNhQ00elCy87Ks6qVzuFEWEtgTqgD/bnXfe9j54Ohl
QqQwm807NwnbgesrXBS+xxH/Czb4Vww=
=BghX
-----END PGP SIGNATURE-----

--TC9NmRtTLpYSAbHx--
