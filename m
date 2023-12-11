Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8380C48B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBCE10E378;
	Mon, 11 Dec 2023 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Mon, 11 Dec 2023 09:28:31 UTC
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69C10E378
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702286557;
 bh=ulOUj2d1rLxVD+Rt9jaW5XEf8PQFaLVfEJgma1yIlXo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=v+tgHyKSYBgekwED0nXpYjbFYJT1QR0h1dLJNd9cUINZjuQp6/z6NRwbBbzq4g33K
 B8P8ef6/uF84W7Dc7P+43UDigzX+u69jeizILEMBew82yM+3MW+JieIFdJgkTtiULB
 Qa3f6Ho0/VoCz6ztyisv49aOPZ00398YHg2rrmSJou3/6eTVMEqbiCpYJB/70TTXz9
 XUvvyze2sEhtUcDzCfoKKb3nddXdxloLWr305Ej4slbCvWzC6s/z9Btr1hS0Tsp76U
 xFTlvKvz/fzMcsjDq8xlyptEbK5IVg+Bw0GyMS97hAAumZ+pRYc2WpGtRdrfHBhi8A
 B7yCQJRXa5JCg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id ED64637813F8;
 Mon, 11 Dec 2023 09:22:36 +0000 (UTC)
Date: Mon, 11 Dec 2023 11:22:24 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <20231211112224.491d3455.pekka.paalanen@collabora.com>
In-Reply-To: <ohy2e56obfcsclujv7ti6ch6ev4dlvqwrg332woa2jxt4azfoo@g2lozla4yfn5>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
 <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
 <20231208100828.2155d1bd.pekka.paalanen@collabora.com>
 <6m6c7qctjkecsr2duwjjmkk26g6fqgmt7dcywho5kv6wysexzi@o7owf3zvy7gg>
 <20231208155946.4ea13179.pekka.paalanen@collabora.com>
 <ohy2e56obfcsclujv7ti6ch6ev4dlvqwrg332woa2jxt4azfoo@g2lozla4yfn5>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XIV2.bMZ9V4o30u9_5F+G29";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XIV2.bMZ9V4o30u9_5F+G29
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Dec 2023 16:20:37 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Dec 08, 2023 at 03:59:46PM +0200, Pekka Paalanen wrote:
> > On Fri, 8 Dec 2023 13:25:22 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > On Fri, Dec 08, 2023 at 10:08:28AM +0200, Pekka Paalanen wrote: =20
> > > > On Thu, 7 Dec 2023 15:27:33 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >    =20
> > > > > On Tue, Dec 05, 2023 at 10:51:06AM +0200, Pekka Paalanen wrote:  =
 =20
> > > > > > On Mon,  4 Dec 2023 13:17:06 +0100
> > > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > > >      =20
> > > > > > > The current documentation of drm_atomic_state says that it's =
the "global
> > > > > > > state object". This is confusing since, while it does contain=
 all the
> > > > > > > objects affected by an update and their respective states, if=
 an object
> > > > > > > isn't affected by this update it won't be part of it.
> > > > > > >=20
> > > > > > > Thus, it's not truly a "global state", unlike object state st=
ructures
> > > > > > > that do contain the entire state of a given object.
> > > > > > >=20
> > > > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > ---
> > > > > > >  include/drm/drm_atomic.h | 10 +++++++++-
> > > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)

...

> > Sima's phrasing is an addition, not a replacement, to this. There are
> > two things:
> >=20
> > a) An atomic commit does not need to contain all the objects of a
> >    drm_device.
> >=20
> > b) An atomic commit may affect more objects than it originally
> >    contained. (from userspace perspective)
> >=20
> > Here b) is important for userspace to know, because it can be
> > surprising, but I understand that this patch is not userspace doc. =20
>=20
> Right, so my initial goal from this series was to make sure the
> ambiguous meaning of what a state was was (hopefully) lifted, and thus
> we could progress on your userspace doc patch. So I want to address
> point A here.
>=20
> B is also important, but maybe we should discuss it into a separate
> patch?

Sure!

Just mind both cases to not accidentally imply something about b) when
talking about a).


Thanks,
pq

--Sig_/XIV2.bMZ9V4o30u9_5F+G29
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV21NAACgkQI1/ltBGq
qqcWAg/+Pit814nWLntlQo2COE/e+NucKdywMmPDwm/feGXBF1X2phxtyNdJnFJI
dvKT4at8IioLMUB28CtO8WSInh2TtktbJzOvGa09STQW+gGBBH+zMsKKeyOdYfFD
iXhYLkorGDrubXEvE0vLIZSuZXzPmkzaKbCrISV6+iupT9CZ2EKJCPprZ7I3b1pE
f6isVcZ39ah/h1xwn05n24bvKpvwX/RJgxWZfz9Lc/wS+H74yqy9C+WJacVoWk+f
cTV9s8UyjZO33eQrSIKsDFfIEZ5U8v8ixuNxlbQFpJFXBKIdtcvbotuJghEJVV9G
vwkbaqmAtLTI7gXF7siNDBkmf/jQnCVwhzyKZspAhcWc7HQi1dMotVVDtGZfuxRH
akcVdezNTSihpCdsCUnccQvWpXaXbRl+sbi4bO6nLRmLt3hB5K20KDhFvGi7KKqp
X2DXTgdX7JV05ei50dW1Qc/1tEeWTD1HeU2zz2vJn2tFeZKTkcFNX4u1OGqo8tc9
znDkDXHam4qks/RSrsHOQWmfbx+iHkEJ68xuHqTohr1TfH5c55S45l7FrYSVEciY
TKNaxwlnnW+yPEe/ynkuU95hoMzbkZK1dIs5ofM4CSVbCkAAxIkCFga2eLgqkmat
YcRnpOMv7TDu1h4mYC45gbsZt/n4NUQR43JQKyCHJiVY3Pd11s0=
=j08q
-----END PGP SIGNATURE-----

--Sig_/XIV2.bMZ9V4o30u9_5F+G29--
