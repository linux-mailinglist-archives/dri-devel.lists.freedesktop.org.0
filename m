Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6868395AA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 18:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ABB10E447;
	Tue, 23 Jan 2024 17:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462410E7EB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 17:01:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B5D03CE2EDC;
 Tue, 23 Jan 2024 17:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2FBC433F1;
 Tue, 23 Jan 2024 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706029279;
 bh=V+pi3c5KR+NexGtTEkvtMJ8NNNixuoR/P6ynDkGNHog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EkGZ+/ogS6+hCHS8WHjmlSxTgntXLY5/EvV7KM/I0UJQsFIvfYFISudTysjnMMAtm
 XBN8NJ1rWx0kgM3kDM3ITGf+2vNTRV5P70FmMznXtyuaO/VZVvKJy/EIPztnP4fY8b
 fMhzPv3e/J8qlgnYBt5k9wMH2ZqDGtqkCuEeOgOZf4E+zdf7KQeLHXyAoLVbHeyuy7
 ypaKJbkV6koOWVdtRSWwXeybmQyzWHpyqUVXZQBJLlid3iUCUsGSaQgDjp2VLEpDjc
 NTH3uZG2rSC8dWPP2DSbD5Jd3wsbUr2TeN6Lp/ysx/0OjMe71Z7r7VpGpddE9Hn3bJ
 MI4xI7Pgdt9lw==
Date: Tue, 23 Jan 2024 17:01:13 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Message-ID: <20240123-powwow-drainable-77dfd6158b05@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
 <20240119-demote-fragment-624a35367a87@spud>
 <9c447297-2738-4b63-9da9-0d004660e65d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2CTCg0wQKdRlifcE"
Content-Disposition: inline
In-Reply-To: <9c447297-2738-4b63-9da9-0d004660e65d@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shawn Sung <shawn.sung@mediatek.com>, devicetree@vger.kernel.org,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2CTCg0wQKdRlifcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 11:38:15AM +0100, AngeloGioacchino Del Regno wrote:
> Il 19/01/24 17:44, Conor Dooley ha scritto:
> > Rob,
> >=20
> > On Fri, Jan 19, 2024 at 02:32:22PM +0800, Jason-JH.Lin wrote:
> > > Add mediatek,gce-props.yaml for common GCE properties that is used for
> > > both mailbox providers and consumers. We place the common property
> > > "mediatek,gce-events" in this binding currently.
> > >=20
> > > The property "mediatek,gce-events" is used for GCE event ID correspon=
ding
> > > to a hardware event signal sent by the hardware or a sofware driver.
> > > If the mailbox providers or consumers want to manipulate the value of
> > > the event ID, they need to know the specific event ID.
> > >=20
> > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >   .../bindings/mailbox/mediatek,gce-props.yaml  | 52 ++++++++++++++++=
+++
> >=20
> > Is bindings/mailbox the correct directory to put this in?
> >=20
>=20
> Well, the GCE is a mailbox :-)
>=20
> ...but I get why you're asking... and I don't think that this should go to
> arm/mediatek/ as it's really just only referring to extra properties for =
kind of
> "special" mailbox client events...

gce is a mailbox, but this isn't a binding for the mailbox itself, hence
me wondering. I haven't been able to think of something better though,
so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--2CTCg0wQKdRlifcE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa/w2QAKCRB4tDGHoIJi
0mVkAQD1E1YROaciJvV15+DoVLqDPd5wy0CwA0/B+tXa1nnLGAEAx7CXc/CtIrWm
h/V9z3ZETpXmdBl0DoEl6myfpxb9pgc=
=/QkO
-----END PGP SIGNATURE-----

--2CTCg0wQKdRlifcE--
