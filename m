Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F5526C487
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A936EA52;
	Wed, 16 Sep 2020 15:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E51E6E153
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 11:21:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B44135C0134;
 Wed, 16 Sep 2020 07:20:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 16 Sep 2020 07:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=toOFwU7TnIQcZDmGmOHA/d3pUVT
 QUsO5+7jZbJlT70Q=; b=gIamoFbYSuCYkITDhwKCmZO6bC1YndpjhkmQ5tB4/Np
 lhbWIOEk+3iTT9yZwpg75KGyJeM9dD3r7SY1Moq0WfPcqbkl931foVKEQYs9iza2
 TrqCx4+8fAMQqUzT2JD/gvHFzA0eF3MwxrfLziYE6IeRcpEkvbimIhCtj91Su4do
 7DiDDZrLf4bNeTZoqEPTiSJGb/ky3pShYvRVljec7suT76d3ECKVXfylIDp9Ebju
 z5j9OTstBqaaRBawN0yznDzkM3n9oUmfasRosC803d9MFH771bZ2BnRl/05SSvJH
 /NUaqiaY4sj1f9QTswPSr+CHPPb8s7uj2P43AgnCXkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=toOFwU
 7TnIQcZDmGmOHA/d3pUVTQUsO5+7jZbJlT70Q=; b=gpl1AsNsjVAvJ3TbYMZCUd
 /7TyOgDcQDOIGLi8gh9pMRxWgrbhyGmDG9W84yisgwR1ucnd7TwMftkJtoqI3ed9
 Pc0ORl6lBs7GCJ2UVrU7foQQEphAsOZGqw+gWAiieBv1zmDkakp3RWX4DDjW8PN4
 CDCrwncApkN2TQB7nDdYDfCD5uUDsyvfPM8eH6RWLZx5DGeBO0M+RhXmNHqr8u5p
 0vFF1pTTxrb9t6ZtTjFqmaEhM+ypUSqhue1VhilUKRspQtF/LtrdvmQMYOXCqubW
 KbKF4V6KODUSmtfcY5YkIKYZge0q7EsKNlNxt4jxb0YNkBCNcjULj7bqI2rHMrJg
 ==
X-ME-Sender: <xms:GPVhX6o0BAGBkbsOFZ4Uvcyq3lrHrrpiZNNoXzEblaUPN04iOLuQ0g>
 <xme:GPVhX4pEyXa2EfkSSoIAvUdpu_-8jnps6ZjDNZlJTEM9FOp1AmnDF1CaZ-uFzzzyN
 Fs9n3ZudyhEE6scB4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GPVhX_OC3jmyo4mvqovxcpOptb8V3_eYzIjwR22H_5XdEuIF3UwTDA>
 <xmx:GPVhX55_S0RA7_2w_3swlN-JnWpAegVPQzBJeafD4nMQk8YF8Zh4EA>
 <xmx:GPVhX54Ouc4fY9sDDENB-bvMLmRVxapqTx3KEW7f29b3DjuFVxym_A>
 <xmx:GfVhXznKymhtOKnYeShKvcbfneInIjuuOJtM-cOYJ0iJN2EdCaU7DA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9B662328005A;
 Wed, 16 Sep 2020 07:20:56 -0400 (EDT)
Date: Wed, 16 Sep 2020 13:20:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [git pull] virtio-shm region
Message-ID: <20200916112054.5pgj43mvsbh3mbod@gilmour.lan>
References: <CAAfnVBn2BzXWFY3hhjDxd5q0P2_JWn-HdkVxgS94x9keAUZiow@mail.gmail.com>
 <20200915152657.oyz52c4q5qb5q7rw@gilmour.lan>
 <CAAfnVB=BPD+MDnpjTzbXat-_k0E=G4tc5OfGfSpBc1MU6RtkaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVB=BPD+MDnpjTzbXat-_k0E=G4tc5OfGfSpBc1MU6RtkaA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 16 Sep 2020 15:49:22 +0000
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Content-Type: multipart/mixed; boundary="===============1860851566=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1860851566==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ou46wfn2f7d7xel"
Content-Disposition: inline


--5ou46wfn2f7d7xel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:38:04PM -0700, Gurchetan Singh wrote:
> On Tue, Sep 15, 2020 at 8:27 AM Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > Hi,
> >
> > On Mon, Sep 14, 2020 at 04:39:41PM -0700, Gurchetan Singh wrote:
> > > Hi,
> > >
> > > This set of changes are required for zero-copy virtio-gpu.
> > >
> > > The following changes since commit
> > 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> > >
> > >   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
> > virtio-shm
> > >
> > > for you to fetch changes up to 38e895487afc2ed42c11045853cbb3fa20b52b=
6e:
> > >
> > >   virtio: Implement get_shm_region for MMIO transport (2020-09-10
> > 10:05:58
> > > +0200)
> > >
> > > ----------------------------------------------------------------
> > > Sebastien Boeuf (3):
> > >       virtio: Add get_shm_region method
> > >       virtio: Implement get_shm_region for PCI transport
> > >       virtio: Implement get_shm_region for MMIO transport
> > >
> > >  drivers/virtio/virtio_mmio.c       | 31 +++++++++++++
> > >  drivers/virtio/virtio_pci_modern.c | 95
> > > ++++++++++++++++++++++++++++++++++++++
> > >  include/linux/virtio_config.h      | 17 +++++++
> > >  include/uapi/linux/virtio_mmio.h   | 11 +++++
> > >  include/uapi/linux/virtio_pci.h    | 11 ++++-
> > >  5 files changed, 164 insertions(+), 1 deletion(-)
> >
> > It's not really clear who you expect to pull that PR?
> >
>=20
> Hmm, Daniel recommended "send[ing] the topic pull request to drm-misc
> maintainers (Maarten, Maxime, Thomas)" in the other thread, but I'm not
> really sure which one.  Maybe whomever is in charge of drm-misc-next pull
> requests?

That would be me then. I've applied it (but had to hack dim a bit, it
doesn't like !text email too much apparently) and pushed it to
drm-misc-next.

Maxime

--5ou46wfn2f7d7xel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2H1FgAKCRDj7w1vZxhR
xZVmAQC1I3ntVQwApAoGwtrrC1X3E2Ciik/Dv8ZCHZ1GDXAe8AD+O60hDIswHFcl
T66lEO3DOmZ6lqJBI7Qwt2axlPM/uwE=
=3B8O
-----END PGP SIGNATURE-----

--5ou46wfn2f7d7xel--

--===============1860851566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1860851566==--
