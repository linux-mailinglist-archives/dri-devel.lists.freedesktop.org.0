Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2332CB6B7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5E6EA28;
	Wed,  2 Dec 2020 08:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC8D89C13
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 17:06:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 506485804DF;
 Tue,  1 Dec 2020 12:06:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 12:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Xd6YAdRZAzxCRta9Q2GO691ERFj
 8lTLDd0OONx3VR7Y=; b=nzFriMZy/B9T0a2mZez5WqDg34pqluEv+kVPTdqwZmW
 NGIvIz9YCD8A/LSaUikbzMJmmE2gRkE0db+M8WYLq3K5G9H68pGyKoLJDSdrKrzi
 SZHuZuzqKOrcU9YqpKU40jRFVslV2WrszqS9g0rx4AVQgWci1JvXBLIJsqr5/qsz
 n0nUJAlCpr27JY2Da+V/CXqO8o0EnA8F5lIezwivmndvRKXoHHyDQb/cJfKE0byD
 i0bTWIR/EmdJZXKKB2O5UeD5ae7t9q31raYAinM+yz4YgXO2IQHyOM8vWuWnx8Pa
 RaQbuXuoejVZJsqWGKi2Hs0iDSGT7PhscQrBTABKjYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Xd6YAd
 RZAzxCRta9Q2GO691ERFj8lTLDd0OONx3VR7Y=; b=qahOjexe5lLpNScI+3Ef/D
 FRE89sGJvpgJuhcn6Mef601uLSqtLIuYuPx1m61KoPa1HZVn6230aaP84Lmi6qCN
 OBBcs66imAaI/N7ig70V7XiHp+r83U1ZTLBjBkKIZxwsz6wP2UTWTF1QJdE+s9j0
 e9k8uXN0Og+8AvAjlktgxs+F6vTyGxtThXDvGLmDxvBetIxr3PvH9WA2V51rvZ2Y
 VMdiu4lCqtmYx5zXpo+uAB3Y+glVvC1ffMUVCU8BNdFi7b/AJq8rsoXLVhCdZZBc
 SlXcbKUctG8JxgoriVWZczhSgWQvRZjkO6yHWZph8kCu21QdH/YeatEpppCvw3Sg
 ==
X-ME-Sender: <xms:KnjGXxSxvYOq6W3FM-O2Y-to176KpIP1pTgFlixMv6lpeNr8qqC7JA>
 <xme:KnjGX6x5QmPqO5WLrOipWXHVD4zD57lNrWyxM0nHHhSKEnrRMEU7kw56zjLDg9i-X
 2V_vIMddO9qkSrOAZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KnjGX22ujkZxjPdtQrVxXrrv-bawqwb-hY3ZKxe0hfRdr8Yd63wHew>
 <xmx:KnjGX5Ce1dJOxwz7kLMKkhhgMp4nx3jwlw_ZK-c5cqKOtJ4A_0zafA>
 <xmx:KnjGX6inbfoCooJrj40Ye-URO3CGN51p4g72VV6T1Jq3SQVD7BwmlQ>
 <xmx:LXjGXxQ7nc5SgCnf1NI33nok_UnwMVz5VCP8mcs6wOl3u7gTZQM-qw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8EEB83280063;
 Tue,  1 Dec 2020 12:06:50 -0500 (EST)
Date: Tue, 1 Dec 2020 18:06:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/8] drm/vc4: kms: Wait on previous FIFO users before a
 commit
Message-ID: <20201201170649.g2uo6c7ngxdvfw3j@gilmour>
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-7-maxime@cerno.tech>
 <8c5f37b3-a4ff-d4d0-ebe0-8bc931416293@suse.de>
MIME-Version: 1.0
In-Reply-To: <8c5f37b3-a4ff-d4d0-ebe0-8bc931416293@suse.de>
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1654727911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1654727911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rp2onweshvrmr67z"
Content-Disposition: inline


--rp2onweshvrmr67z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Nov 20, 2020 at 02:19:45PM +0100, Thomas Zimmermann wrote:
> Am 13.11.20 um 16:29 schrieb Maxime Ripard:
> > If we're having two subsequent, non-blocking, commits on two different
> > CRTCs that share no resources, there's no guarantee on the order of
> > execution of both commits.
>=20
> Can there only ever be two commits that flip order?

It needs a bit of bad luck, but the patch 2 provides a bit more details.

Basically, if there's two subsequent non-blocking commits, affecting
different CRTCs without anything shared between those CRTCs (so no
plane, encoder or connector in common), you have no guarantee on the
commit order.

Most of the time it's not a big deal precisely because they don't share
anything. However if the private state is shared between the CRTCs then
it becomes an issue and we need to make sure that the ordering is
respected.

> > However, the second one will consider the first one as the old state,
> > and will be in charge of freeing it once that second commit is done.
> >=20
> > If the first commit happens after that second commit, it might access
> > some resources related to its state that has been freed, resulting in a
> > use-after-free bug.
> >=20
> > The standard DRM objects are protected against this, but our HVS private
> > state isn't so let's make sure we wait for all the previous FIFO users
> > to finish their commit before going with our own.
>=20
> I'd appreciate a comment in the code that explains a bit how this works.
> It's sort of clear to me, but not enough to fully get it.

I'm not sure to get what "this" means and what do you want me to comment
there?

> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_kms.c | 118 +++++++++++++++++++++++++++++++++-
> >   1 file changed, 117 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> > index 3034a5a6637e..849bc6b4cea4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -40,6 +40,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct=
 drm_private_state *priv)
> >   struct vc4_hvs_state {
> >   	struct drm_private_state base;
> >   	unsigned int unassigned_channels;
> > +
> > +	struct {
> > +		unsigned in_use: 1;
> > +		struct drm_crtc_commit *last_user;
>=20
> Can these updates run concurrently? If so, the concurrency control via
> in_use is dubious.

No, there's only ever one commit being done. We just need to make sure
they are in the right order.

I'll address your other comments

Maxime

--rp2onweshvrmr67z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8Z4KQAKCRDj7w1vZxhR
xRdQAQDoXrTwcEx5wJMf83iJozqAbfCdz7arV6qk2uQFSKxBfAD/amH5tGFvCrOx
XbpFO45SKECLhELNs5ADEMKKwVXE1wE=
=LWnB
-----END PGP SIGNATURE-----

--rp2onweshvrmr67z--

--===============1654727911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1654727911==--
