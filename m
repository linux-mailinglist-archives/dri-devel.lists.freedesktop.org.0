Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E734143A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A936EB03;
	Wed, 22 Sep 2021 08:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135626EB03
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:22:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 301F35C0180;
 Wed, 22 Sep 2021 04:22:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 22 Sep 2021 04:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=8/FaVj2N3vNX/7Wt6Ao5kZ1r4Dv
 35oTxSYGVunQBJGk=; b=sC+yOKzWtKUAuKuIdIW/18ns7QO6UOilSRQPytESW2Y
 n8l+dHFNyd+XQiZtmyc7/pq/H7ixxp5fTIH49UFGjx7UbVL5MHkPw1+n/1x1qllP
 +gOmcQ11mtXzfPRvq8TrLJFp/Y7wOH9VML8HTOcvbOOHi5A92ceTQ0ALyTlID5Rf
 xFANaQteLfXmp/8mYnb3Xl9cNAbOaDwqE2+dcTC2Mc5IdDLGFsCG9hBn3DTDVQ2F
 Xjr2c9aEWj+nphJbaYhya6hIcDXyde1Mf7hNlM2L0T2BzGVh+K4LNZBNUKPqk7cX
 hp19S8IVFAve6Mbf6dZWw7aOyckkH2jGLZq3xAu+NoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8/FaVj
 2N3vNX/7Wt6Ao5kZ1r4Dv35oTxSYGVunQBJGk=; b=t+ATHxvYIaUeoaa98Sq9vX
 0dW48+v4PcpikaGfyOpRdO0t91tZxgwqsq6d1WxbKCzLODiQo0ltjZY3p6zMbu9v
 pex1aRFi0b0bH2WikEm/Se75Mz32lxg9HLBogPhBGVsfzztCAD/wjR5J+EqQHVKN
 9fBK1adcUDH+CEj6CrBmrSEO5mivEnlzCVPieWIc+g81JgxBaSaq2xLbW6F2qheG
 Rm9Mln4Jc0iAwFfOG18UsS6ZFT/UMDUb/GI9isF3T7YcGpzvfZiE8b6T9CX0us7+
 0Cl/YBsEIfsxGDwzIxagUcjqEhwQRtgiiGnNaNZVyLL8wN9zbxIeHNibqsh+CCNA
 ==
X-ME-Sender: <xms:wudKYWWui_1eRHOomPb7UFdvonoCiEPAdKVjECLDaueVeEWqcIG8VQ>
 <xme:wudKYSkbOhblJ510p-6A8R6UkkNSIG7KCtyCVCivogunK-9PYCVnkW6FET6XNWZER
 TabeplebV-RP89H66U>
X-ME-Received: <xmr:wudKYaa-UDqS2pH7UYy0mCSUX22FpU224m4XlOgycCaeBZjS2G5veUnumirKmgTg_k_viTIKpX7VjFPw8PWJoh9y0hdBhUaw5hsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wudKYdW8lVlqRoYBUG1DhBcgu8ke9DO6_9NmSKZquz-JP7qNS2arCg>
 <xmx:wudKYQmJCLPzOPRk8EX5i8bADQIy6ABRhGh92TQ8JXHQdDj9oFT2Dw>
 <xmx:wudKYScL84gVRjl77Tip6eCfzr5lwj-0RoCq1FodJb48Q_TEKuwT_w>
 <xmx:xOdKYfulRa8D5w9qKuYBmBifkfOg2nGE8dcTvmxbiNeQX07zO8r7TQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 04:22:26 -0400 (EDT)
Date: Wed, 22 Sep 2021 10:22:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
Message-ID: <20210922082223.goihdlpxctnybkz6@gilmour>
References: <20210917180925.2602266-1-maxime@cerno.tech>
 <4266046.upgBnu7FSg@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vn3sij6zaj7oj7xh"
Content-Disposition: inline
In-Reply-To: <4266046.upgBnu7FSg@diego>
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


--vn3sij6zaj7oj7xh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 10:49:55PM +0200, Heiko St=C3=BCbner wrote:
> Hi Maxime,
>=20
> Am Freitag, 17. September 2021, 20:09:25 CEST schrieb Maxime Ripard:
> > By depending on devm_drm_panel_bridge_add(), devm_drm_of_get_bridge()
> > introduces a circular dependency between the modules drm (where
> > devm_drm_of_get_bridge() ends up) and drm_kms_helper (where
> > devm_drm_panel_bridge_add() is).
> >=20
> > Fix this by moving devm_drm_of_get_bridge() to bridge/panel.c and thus
> > drm_kms_helper.
> >=20
> > Fixes: 87ea95808d53 ("drm/bridge: Add a function to abstract away panel=
s")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> I started with drm-misc-next at
> - e46ad85acd90 ("MAINTAINERS: add Andrey as the DRM GPU scheduler maintai=
ner")
>=20
> with your patch on top, I end up with:
>=20
> make[1]: Verzeichnis =E2=80=9E/home/devel/hstuebner/02_drm/linux/_build-a=
rm64=E2=80=9C wird betreten
>   GEN     Makefile
>   CALL    ../scripts/atomic/check-atomics.sh
>   CALL    ../scripts/checksyscalls.sh
>   CC [M]  drivers/gpu/drm/bridge/panel.o
>   CC [M]  drivers/gpu/drm/drm_bridge.o
>   LD [M]  drivers/gpu/drm/drm.o
> ../drivers/gpu/drm/bridge/panel.c: In function =E2=80=98devm_drm_of_get_b=
ridge=E2=80=99:
> ../drivers/gpu/drm/bridge/panel.c:359:8: error: implicit declaration of f=
unction =E2=80=98drm_of_find_panel_or_bridge=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
>   359 |  ret =3D drm_of_find_panel_or_bridge(np, port, endpoint,
>       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> adding the following makes it compile again:
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 285a079cdef5..b32295abd9e7 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>=20
>=20
> I obviously also ran into the circular dependency-issue right now,
> so with the above addition:
>=20
> Tested-by: Heiko Stuebner <heiko@sntech.de>

I'm not sure how I missed that, thanks for testing :)

I've just pushed the patch with your fix to drm-misc-fixes

Maxime

--vn3sij6zaj7oj7xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUrnvwAKCRDj7w1vZxhR
xX25AP9HPAgax3/tfwIkrcuOgAAbhk8i2k4As/RiZwbfr6JdHAEAgT/jvOCi6JRv
QsAONoSU27by84w6+Dl4alxHhGMz2AA=
=zTjs
-----END PGP SIGNATURE-----

--vn3sij6zaj7oj7xh--
