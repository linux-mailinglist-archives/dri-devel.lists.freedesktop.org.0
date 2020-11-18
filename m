Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13022B8D2B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F296E532;
	Thu, 19 Nov 2020 08:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044516E2DE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 09:05:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E2F3B10DA;
 Wed, 18 Nov 2020 04:04:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 18 Nov 2020 04:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=NX2d125+mzWeDsg9Z+w9503P7MyH2v/IqWMY+tihLD0=; b=XybMosVi
 KV7pF8WVq+jtLhwAqKCgIQOIKbFV+uYcWM854ck4AyXMkeiRRFijLarUWdr8hX37
 IPkP0B0EYOjWjmBXdgn72zRDxy81zJ8m+cXl4p45dl/5O8Uu5HM1qXqXF2K19vY+
 yxhxkvmLF606zwS7oNZ30Qj8e9vaBTRZALz4QBD2pnKVMDaS18BAxlJ0/fbGY7xm
 m/z9AZgUnSlOhjT6RsTPzVQD/cvYeMLLx8E3c7PKxHNuZGYrB/YvIVZbL2/pj7u5
 Rc2jwsHWZOUy5qTiNSSEVUCCaHAtw4uAC6dyW7aj46fRRpGOETxCjVBpN2JwmvGk
 y/2bgspOYimcYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=NX2d125+mzWeDsg9Z+w9503P7MyH2
 v/IqWMY+tihLD0=; b=i+WnKmcbZY6Erzs2zjynYV6Iaf2bjl9zjWoGkP7cB4Dtq
 cMhOoqI4iJcP55GE0orKPJ+n1BXlYwOc7RFUEUCOJtZ+OmrvxhycmHEnHwQ3nIOB
 cqppErhW3T6jFf0HXZkLhchdExfHZ+IUftZNyerfZngbVG/FBFyLvHI20UCUZfQx
 657KPj54Iqkat1OXgsLjTf0TRmaieHkhgzaNncNwNMJgmMrVQQpBv3VOlYP3y3kC
 uTNslsDDwd4PIJ+/IIiA9v3D93gqSQiaJCd6A8S6XDmz0eZJBUyctP8/cJOJ43Py
 lza+rD3+5Xp2h13uKX0wuot5xu9ylryii7e7QsuAA==
X-ME-Sender: <xms:ueO0XzcSiKzEQwX6g6iDC--Gemh26Qg93QlNsLjCqzm9nTHlKbAXJA>
 <xme:ueO0X5NH93owAwHSk-xh9gfA_tiUHS3NP41QsZQJ4OzwCuC53RkK83i86kp6I2z_L
 FpCRAcBjMKB2JZWBow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeehvddvffelveeiuefggfeiueduvdfhfeeuhffgleejleeghfdvgedtveegleek
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ueO0X8jje_IYDOF0za8GlXj9T1k30sx3bp8p9nptWvAO_1_0iPLBPw>
 <xmx:ueO0X08YqT5Gfu8vs4_L3ogLOJbHw4JaLjeGYOi-SVFL9KdKQuZ_yw>
 <xmx:ueO0X_sX7sCkIYL_t05SMFcSUCBZbuVjcv_-4sZBW8Iwv-3UfahBLA>
 <xmx:u-O0X5KIi37niE0yvT8q1T62IGYY0kt0_QjTHHvsJIPw_DoAmutyAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 995AD328005A;
 Wed, 18 Nov 2020 04:04:57 -0500 (EST)
Date: Wed, 18 Nov 2020 10:04:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [GIT PULL] Fix for drm/sun4i shared with arm-soc
Message-ID: <20201118090455.sznrgpduuytlc22k@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: arm@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0331749679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0331749679==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="srtz37whhktotzfn"
Content-Disposition: inline


--srtz37whhktotzfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's a fix shared with the DMA work for sun4i that will be merged
through arm-soc.

This conflicts with the subsequent work done for sun4i and
dma_direct_set_offset, so it would be better to merge that fix through a
PR in drm-misc-fixes.

Maxime

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/drm/sun4i-dma-fix-pull-request

for you to fetch changes up to 957a1ea3599210e9996777a734ea5284eaef75c7:

  drm/sun4i: backend: Fix probe failure with multiple backends (2020-11-18 09:01:30 +0100)

----------------------------------------------------------------
Fix for drm/sun4i shared with arm-soc

This patch is a preliminary fix that will conflict with subsequent work merged
through arm-soc.

----------------------------------------------------------------
Maxime Ripard (1):
      drm/sun4i: backend: Fix probe failure with multiple backends

 drivers/gpu/drm/sun4i/sun4i_backend.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--srtz37whhktotzfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7TjtwAKCRDj7w1vZxhR
xYftAQCWoTv/cQbIY46NDVs91lBNrmgyL+zbOefCq1fqovGeywD/RVS2PDE5gSir
iRv2LdoMcnJ6xzICC8q/GpgodWWQRQU=
=s9kP
-----END PGP SIGNATURE-----

--srtz37whhktotzfn--

--===============0331749679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0331749679==--
