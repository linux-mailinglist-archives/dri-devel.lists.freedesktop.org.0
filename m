Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CD38B10D
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582289817;
	Thu, 20 May 2021 14:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3723C892CD;
 Thu, 20 May 2021 14:08:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 69187166C;
 Thu, 20 May 2021 10:08:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 May 2021 10:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=OpO40UksSZoji3rH/L54K4WYXZ1844OgNyT8sXrC4n0=; b=Q0tCrslh
 I0g+yjaLdLNljY1I6AJ3KSZbPZRvoAMxyWF6zQ+Id97LMz37l0nFx0YG+0Ss3XJo
 bb3JLFMJEhSkyrwvuJR4o5FlM5pPPXCzVfj6PEfJgsQvLIGrkM7jKapSj2hnZodd
 rNUppCYM0DTP5m6tmoICoTqFpHKWFaulzTDXNbewZDu52+wML1u+vLLMjPbI0HY0
 2FCtWuNd+gcutOqGjr19Cn6C8VvJA636aqfkXbwSP9saz6JyXj4mZm6fAau+nI80
 A5BicwWIoqZe3UhlnWdZlevfbd5zKBQQD/DtyvbZrySzv/pqk3hR/7QhEwe7C0Kx
 sSLWGiteyD3y4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=OpO40UksSZoji3rH/L54K4WYXZ184
 4OgNyT8sXrC4n0=; b=AA+7uJ/KE+fFQ7oqgBbCsqcsJM4VmkQKPxleh0IYkU+Hr
 uEu5QRCZyUXRNnu1VGBy45k4Wmz4gIki8em0EecHH/MjtJ+eKYVfJ2ED4qPX/RXb
 tsfUHmHBVDRRbRg29KN4VgBS51dDiQ56w56fa/ob+T7P3O94hVP370em/8JqpGk6
 wPjPMXz5IfTcAro2++HBOXRLlx/l3jR68kK+KdklKBxKUJmVA1TlPKJFGFOMKuUl
 XdWnxcoK4DsUVytbYkIaO2kz5rsUyqI0cOCJxDcHz3fl7JHOevIRg7amq9kg9hgD
 ilZ9asberVPpXHNkf3OLK1kiM/5bZZlI2zOSskTjA==
X-ME-Sender: <xms:TG2mYKKSp584SjLstLZZTCqwu5ON76087np1bZVk2GBVGTFGdyiX8A>
 <xme:TG2mYCIXZXmf958Fd7Q5Ty5L_7gNqGsSwKxuvIPOo0lRpi5pGr_Zvg_VJe7aaTGQM
 nLMEwTKxBKa_ryir2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TG2mYKu9i0l2qcPgLUxl-B_Xsyc17kzWkodVBNRcvjSGVimwTsX8Aw>
 <xmx:TG2mYPbPbkWXjGVaYEYqgSzB1o5LmsC4JRwPOUEb-G-H-2OpCkLN1A>
 <xmx:TG2mYBZUEWaGf31EZ6hVvTWzUkyxEt0KOwRlC7gzN57B02AWYmFquA>
 <xmx:TW2mYPNmIQ2S7umFcl8cBQJEUuMk2prN4pOCCJqvv2I5ChZw5kmChDslcsM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 10:08:11 -0400 (EDT)
Date: Thu, 20 May 2021 16:08:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20210520140808.ds6bk6i3oarmiea6@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ovnn7ghb3p5wi3dq"
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ovnn7ghb3p5wi3dq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week fix for drm-misc-fixes

Maxime

drm-misc-fixes-2021-05-20:
Just a single fix for a dma-buf related WARN
The following changes since commit c55b44c9386f3ee1b08752638559f19deaf6040d:

  Merge drm/drm-fixes into drm-misc-fixes (2021-05-11 13:35:52 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-05-20

for you to fetch changes up to 7e008b02557ccece4d2c31fb0eaf6243cbc87121:

  dma-buf: fix unintended pin/unpin warnings (2021-05-20 14:02:27 +0200)

----------------------------------------------------------------
Just a single fix for a dma-buf related WARN

----------------------------------------------------------------
Christian K=F6nig (1):
      dma-buf: fix unintended pin/unpin warnings

 drivers/dma-buf/dma-buf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--ovnn7ghb3p5wi3dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKZtSAAKCRDj7w1vZxhR
xf4SAQCx79e+ltPXx2cZRUkg5wBmW0nCuT+264I4mACRujy7agEAsijEGuP6rJfw
2GFDZRwNXE5JG0MmJkh5FiALRpFP8ww=
=Q8mm
-----END PGP SIGNATURE-----

--ovnn7ghb3p5wi3dq--
