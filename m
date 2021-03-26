Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404034B25B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 00:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4756F4F2;
	Fri, 26 Mar 2021 23:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55A66F4F2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 23:00:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6crX64BLz9sRR;
 Sat, 27 Mar 2021 10:00:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1616799632;
 bh=l9qIpJVf65SIyrUI6tFu8dlfpDPaK9/6dX0MC+0TIhQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GXehqjJmNsGkFjEk1OUUzWhUbHroB4lUnDts51SS8zbXwI3ZokcHf2e35ICTwUoh3
 YZSTWYoAx5aj4uV7XS2HmJFr3D81wwMJ6DNyE8MW7HC2Md1eafkzKm82QuXtwgNruY
 Fr5me0qMwqb4MxG64EmMm2u1h2MMLiwgJJS4yeYT3VXarROzYqLVuQrDUt08Gm+mXa
 irhwFAzc6qcQRZLDH6Do499COOX+Wl0w3ZuwbkM6nwx8Yo2k/xlatg099kkAfzT48d
 1+kpIsc89KQ7bJNITQ12+vTja2+VN8lK5xhAX/y+tyPpCuAQFqEe0P2htz6eg42WHt
 Z3XHWvN5ix/IQ==
Date: Sat, 27 Mar 2021 10:00:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: bcm2711-hdmi: Fix broken schema
Message-ID: <20210327100026.53cc228c@canb.auug.org.au>
In-Reply-To: <CAL_JsqKtGz3mtzc1KTASVtAcc7PSV7Z8Y-n8JjOzxua8EpQ5ZQ@mail.gmail.com>
References: <20210218152837.1080819-1-maxime@cerno.tech>
 <20210223212624.GA89721@robh.at.kernel.org>
 <CAL_JsqKtGz3mtzc1KTASVtAcc7PSV7Z8Y-n8JjOzxua8EpQ5ZQ@mail.gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0174020501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0174020501==
Content-Type: multipart/signed; boundary="Sig_/UeyUklmSCsCsvR/XpFoc66b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UeyUklmSCsCsvR/XpFoc66b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 26 Mar 2021 15:01:34 -0600 Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Feb 23, 2021 at 2:26 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, 18 Feb 2021 16:28:37 +0100, Maxime Ripard wrote: =20
> > > For some reason, unevaluatedProperties doesn't work and
> > > additionalProperties is required. Fix it by switching to
> > > additionalProperties.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml          | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > =20
> >
> > Applied, thanks! =20
>=20
> Something weird is going on with this fix. linux-next doesn't end up
> with the change even though 5.12-rc2 has it. I suspect it's because
> the original commit is in 2 branches (drm-misc-next and
> drm-misc-fixes), but the fix was applied by me. I'm not sure how
> linux-next didn't have a manual merge for this.

I think it goes like this:

Commit a99163e9e708 ("Merge drm/drm-next into drm-misc-next") was merged
into v5.12-rc1-dontuse and had "additionalProperties: false" and is the
common base for all later changes to this file.

Commit 6ff92deff711 ("dt-binding: display: bcm2711-hdmi: Add CEC and
hotplug interrupts") changes to "unevaluatedProperties: false" and is
merged into v5.12-rc1-dontuse.

Commit a3cb15cda1b8 ("dt-bindings: bcm2711-hdmi: Fix broken schema")
changes to "additionalProperties: false" and is merged into v5.12-rc2.

Commit e7cbc68a28e1 ("dt-binding: display: bcm2711-hdmi: Add
CEC and hotplug interrupts") changes (from a99163e9e708) to
"unevaluatedProperties: false" in the drm-misc and then drm trees.

When I come to merge the drm tree into linux-next, the merge base is
v5.12-rc3 and the only change to this file since v5.12-rc3 is in the
drm tree ...

Another way to look at it is that one one side of my merge, the line
goes from "additionalProperties: false" to "unevaluatedProperties:
false" and back to "additionalProperties: false" (so no net change)
and on the other side if my merge the line changes to
"unevaluatedProperties: false".
--=20
Cheers,
Stephen Rothwell

--Sig_/UeyUklmSCsCsvR/XpFoc66b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBeZ4oACgkQAVBC80lX
0Gxbcwf/fwgfIYpFvh9wgrQRIkbtjg7xUnoqT/MseIXYb7rvQGsPYqzw6rq2luuj
jjyCJ3kTRN+Tjv+GfBOhbU3A8eEryD+LhusKlLlRodj+3DURUGUrsPJ70HTiFk5P
La9/MaQVa0ALEGg9uWGM82JBgvWOtGD9NbP0E3UHpgr+Fqlk/ck+gmg4JCKk7Xao
JFSRPlb2FQl5nUHXG3/2s2NIKGzU4ItZ/dRjGccnAfhx7zSqQ0zbQ9xokQew1Djb
FP3OzuoFDkKmeFxCJwrTCQU3p5rVK4l1OeStGvVREJkvTq/dYzNiQGydo/N5xJym
OrzpwbOvvbKh7fAv4IgswrTawTVO9g==
=4GuN
-----END PGP SIGNATURE-----

--Sig_/UeyUklmSCsCsvR/XpFoc66b--

--===============0174020501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0174020501==--
