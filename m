Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213C109A08
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8186E258;
	Tue, 26 Nov 2019 08:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFDF6E096
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:43:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 60ED0654E;
 Mon, 25 Nov 2019 04:43:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 25 Nov 2019 04:43:39 -0500
X-ME-Sender: <xms:SqLbXbKg2D3AdsxWTT4Cz_Zs6c6A2KyohBFzrdhXoxvr-mpVMlvuow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiuddgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggufgesghdtreertdervdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
 hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:SqLbXQHW7LH5gEtM8vuzD5j3nJIfcdSwfh5cY86rUYlnLD36jNYdfA>
 <xmx:SqLbXUAKtY87ak_D4hMX32Yf0h_MFsreP1nDxMzN-FMWcv9NzRlz0w>
 <xmx:SqLbXS2nzHdfJiCrQtEZ46EEMNj4NB2tuVo1aNhbUwBH5ZYxCNjUOg>
 <xmx:S6LbXazfs8TuXHLusmYzrRVVk_XcohppASXvmK3Y2WfdTI2G9Zan8g>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3F7E80060;
 Mon, 25 Nov 2019 04:43:37 -0500 (EST)
Date: Mon, 25 Nov 2019 10:43:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191125094336.GA14723@gilmour.lan>
MIME-Version: 1.0
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=XkNywTc9gruksO9sm0YQAKTqetVf+Vc977MnuPemwDs=; b=jpWnFJ/D
 BDbLTJ0GL5PD1O4X6pthzdHCPfIW/vpw1ZOQCHiM/z2/X6B7o5wm8/xTNn8DrfsH
 e9vfiXzGePAOagbkXGro7NRuw6ElNw/TWnqcZexxX/EouGEGRdDyGM0SXDaLpX/A
 M0QU8yWPJJpOJVb4C6TuFC1GUKpERDlVa08ZulIIQT1kpuOgmet75pr0dGX10evX
 4ybO2uE3nOKEzmgGh/gQWoWdskpVboYxQc7oOM1TpGd8JAo56QnJcdqqL5tKtYz2
 jIsjPL0cXCCqmLolnldnrjnHH/+tIySDPeF+KaapEt3RkKaW68xqzoqRSx4goEvy
 Qy5xxvxPw0/jaw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=XkNywTc9gruksO9sm0YQAKTqetVf+
 Vc977MnuPemwDs=; b=UOKux26gOvbSV9kcGqAIa3UFsAp2sLzndzLgCkB4MhOGE
 wB0CYmH8wg13YFT/nclMKVJQhidZw/c/hzx2/9tdVTDa2ucBTyWwxTZaEbyr0UmG
 NSFtaECvCuXj4tWoaohumkKKtcXfSaoN4Wjd1HIg2OXCJDy0yYfifOwrKN4+i0MC
 7CwePbsivc0XnBMLV1UFcp3IP5J1PSS+xGKudlNba5bkF4uudPcIA0z9PowvAWTV
 PMnrVM3+77IbKB0pEzN6I4Bup0ymEpk2imdoqSNhEZaZ8Le11SF4BPcpONLoU5wo
 sZxdceIsQqf4Nt8k81WgvYDtLsMASHsqadGSWC7JA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0603977279=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0603977279==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here are a few lates fixes for drm-misc-fixes. Obviously, it's not
going to make it into 5.4, but it'd be great if they were in the
upcoming PR.

Thanks!
Maxime

drm-misc-fixes-2019-11-25:
 - A fix for a memory leak in the dma-buf support
 - One in mcde DSI support that leads to a pointer dereference
The following changes since commit 0b8e7bbde5e7e2c419567e1ee29587dae3b78ee3:

  drm/sun4i: tcon: Set min division of TCON0_DCLK to 1. (2019-11-13 15:20:33 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-11-25

for you to fetch changes up to 6645d42d79d33e8a9fe262660a75d5f4556bbea9:

  dma-buf: Fix memory leak in sync_file_merge() (2019-11-25 10:21:33 +0100)

----------------------------------------------------------------
 - A fix for a memory leak in the dma-buf support
 - One in mcde DSI support that leads to a pointer dereference

----------------------------------------------------------------
Navid Emamdoost (1):
      dma-buf: Fix memory leak in sync_file_merge()

Stephan Gerhold (1):
      drm/mcde: dsi: Fix invalid pointer dereference if panel cannot be found

 drivers/dma-buf/sync_file.c     | 2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXduiSAAKCRDj7w1vZxhR
xft4AP0fSM1aIsxywcu6b/kA8sFCJMV9rWlgqH0MMCVEE8LSrgD7BnRxTYQ0GDn3
riZ8Ob7Z4+0jMQgBsLUU3qKar8pqnQw=
=pe7d
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

--===============0603977279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0603977279==--
