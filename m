Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385526AB35
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028736E8CE;
	Tue, 15 Sep 2020 17:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F89B89E33
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 15:27:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A1D2CD60;
 Tue, 15 Sep 2020 11:27:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 15 Sep 2020 11:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=lSXqI0P+bIjFz3r1rWwpD56EWed
 PJRvm/9nyK/XS7kY=; b=dhzGDsJnd+760smzVcgAZNTrPb1cUQpgvQfdnekCDNO
 V+vs1RkDpMuMGRPORa4F/cgdZHdBBAR5jyAjhEfbdDVTJXBF8yCwW4U/9lYhQGC9
 7n9izEaf74VfzIyCqiOgkRfjFm1Ls9MyWR05W3z7QSW7qFOAF8Kh21eqbjP0Gulr
 J97MwVBktEoYpOuK8hvwRipGCRJSZIjFx8jUR8zC5+vNNxqYfX5id7uerA5szmOL
 vk1s4X8VBFyaqypbOmoztGUbGMIFAKc7tYYhBQMmvpyQWdKqGKgBEjUQmza2Ny7+
 UKKmM57icGAx6RPK+OCc0HSF+IojlawSkxQ1nWxekPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lSXqI0
 P+bIjFz3r1rWwpD56EWedPJRvm/9nyK/XS7kY=; b=drElAWnKTfEJ+N5/6CMDOh
 FU0mLx7XVbeFgQUa6XW5rvT6978EDCKJYGDLzFuQaMcqSjEyiY6Z/i4A9nQ7cvfJ
 tEVW2RDdP8AVhsDOHME3HhCy8OQK/D0cun0Q6iGWTQY/bGInpVKq1BuCi4tWDAv6
 B5clwG/tMOAhU+lf/c2OIloT2wCS/Jce4N66RA/S863M1KzlqvkRl7qcW/hDEdrA
 5UdGE0cmzvxrIkIfUjDNpnaeZfTrz2NLWQyYQcSdBmzjbAHW8RbZmNSpsF+Eh9Kt
 cHZ90Fr40udmp1lA/IH72ma3zy0bS6rtncmMck/ed4yIbjOZVh3kY1Ry47FpQqYA
 ==
X-ME-Sender: <xms:Q91gX1qgu8x2KbRwyf8n_G8oqoZleE8LKEV8ZQr2uza-qBCrflW1HA>
 <xme:Q91gX3o-4uSLtGkH-56vRi10zFSdjRVv4Gs6Nys88t67un6YembeqauMdF7wLMtM_
 TXlo0f-qDXGWqcT_bs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddtgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Q91gXyOOThRMKvkzzVyxX_woisxLpoJT7xrEsJecEhIxMy0SEKM8eQ>
 <xmx:Q91gXw5jTeDuyYicCUS3JlZFuHqhtoTLNhj-dWVNpk_4S9AEimVdIA>
 <xmx:Q91gX06FHblA1rxeSqEHFdP-MeY5SdDQNPMN5AHuIkoIV2GE7Mneng>
 <xmx:RN1gXymhJfOj6qp5BzJSQYJMQzcELzA4TtTjTdRRTNjLpOZ7-WDO2Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C114306467E;
 Tue, 15 Sep 2020 11:26:59 -0400 (EDT)
Date: Tue, 15 Sep 2020 17:26:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [git pull] virtio-shm region
Message-ID: <20200915152657.oyz52c4q5qb5q7rw@gilmour.lan>
References: <CAAfnVBn2BzXWFY3hhjDxd5q0P2_JWn-HdkVxgS94x9keAUZiow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBn2BzXWFY3hhjDxd5q0P2_JWn-HdkVxgS94x9keAUZiow@mail.gmail.com>
X-Mailman-Approved-At: Tue, 15 Sep 2020 17:54:30 +0000
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
Content-Type: multipart/mixed; boundary="===============0271431345=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0271431345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q3nvvzc3dahypzdr"
Content-Disposition: inline


--q3nvvzc3dahypzdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 14, 2020 at 04:39:41PM -0700, Gurchetan Singh wrote:
> Hi,
>=20
> This set of changes are required for zero-copy virtio-gpu.
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git virtio-=
shm
>=20
> for you to fetch changes up to 38e895487afc2ed42c11045853cbb3fa20b52b6e:
>=20
>   virtio: Implement get_shm_region for MMIO transport (2020-09-10 10:05:58
> +0200)
>=20
> ----------------------------------------------------------------
> Sebastien Boeuf (3):
>       virtio: Add get_shm_region method
>       virtio: Implement get_shm_region for PCI transport
>       virtio: Implement get_shm_region for MMIO transport
>=20
>  drivers/virtio/virtio_mmio.c       | 31 +++++++++++++
>  drivers/virtio/virtio_pci_modern.c | 95
> ++++++++++++++++++++++++++++++++++++++
>  include/linux/virtio_config.h      | 17 +++++++
>  include/uapi/linux/virtio_mmio.h   | 11 +++++
>  include/uapi/linux/virtio_pci.h    | 11 ++++-
>  5 files changed, 164 insertions(+), 1 deletion(-)

It's not really clear who you expect to pull that PR?

Maxime

--q3nvvzc3dahypzdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2DdQQAKCRDj7w1vZxhR
xdbGAP98KDNghL8WVgirEJDhvHmtbOv0c+miOVRF5SPnDIIQnAD9FW5DjAuewoU0
tWDX9Ay/y3VclvgKgYpVrSPfzU6LGw0=
=MaUa
-----END PGP SIGNATURE-----

--q3nvvzc3dahypzdr--

--===============0271431345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0271431345==--
