Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3C129FFCA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6476ECF8;
	Fri, 30 Oct 2020 08:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB73E8979D;
 Thu, 29 Oct 2020 17:34:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8554A5807BA;
 Thu, 29 Oct 2020 13:34:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 13:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=xlulBW6qtswo/tKkVkQKjGduxgACGtB+xRBMnDnD7Ro=; b=bAyoeb1c
 X9CRvHMESP0xOr6KlIK+a2AnKNhdWPVdtDQh3l4j/UNlJfzZUmxqIXKyr2o9u2CM
 8UH6HEHqwrSW2jkFKTX95CBM+BNYlkQ6b3cPC8fAV8K56Fqac/ekZhO4KyMugq38
 xv6hIgjP4ffTDsN8wuqxHqy+ItO3UJMc6dyio3FfxnDR3JhQtUtqMZqoQn62SkEp
 0hl6NuOqcbnlS2lpAHNbfTczdYS06jDP1o64zvIIrvnhQlf6kaF7AOb2y97/5/MT
 1AdtRk8RkX4wrphDPLebE1Cr7WCn7KYm+jByXLhLwMCPBD7fkWNpkJJkZ9kXxFrh
 Bx0dclc0aXFeNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=xlulBW6qtswo/tKkVkQKjGduxgACG
 tB+xRBMnDnD7Ro=; b=JrMRo7Z33JFXPjq8SK35SCpb/rESEvHq+qu9UDdGvxm8l
 03aFBkJi4Xb2md914e88ITvJr8hJjha9gPzdvlLUvzAgXnwsJq5Pi0AmtjKwAifR
 RYM73aUsZYg+WzlrufRpXn8exiorUNdoKRy+7s4KkZwpTOZ2EsaTZ14bDJa1oP+r
 +3gOER59aCqIGMT2HBCuqBiFGWLg8mgtAbUPdpTrJc59n2lxITY1MsJM95rWNC0e
 lpHXwDxbL4znLUD2eT7wTolZQ1Ja82jYUgdxarmfmDJDV2kPAWcsNDr+vjaaWmIo
 lk2jJDxqN4TSJ16Fm4rTPUCledCO5nZursM6/8KEw==
X-ME-Sender: <xms:GP2aXznYtNqZBYbUgnfCraV5qVNAzvPPOxVnwF0P5HXajmUrgjWB_Q>
 <xme:GP2aX21ixaPy1b5UFine5qXaYNhbNNZzetrddytJRmB8l6So_d5duWcA8crxm2aw_
 6HwWJe4c7P6M8i1PV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GP2aX5ouVUskCKRa7fNJA1P9Q78rBbYh5j5XTe5reF-xmhuhZbv2Zw>
 <xmx:GP2aX7mf_mEod2SSePsNq3R7Hd5_vHOHa-G_5JSAWlxO4Z72ih1Bmg>
 <xmx:GP2aXx38uWWCV5ulWpBmYbrLRfnaMQmp2Kvxxs5ad2Ie8IT_9Q7diQ>
 <xmx:Gf2aX6LxdOAIWMGCUtK39agX6ZpH-7cQowFuIECxxSBLFkCZ82BKbQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44B643064685;
 Thu, 29 Oct 2020 13:34:16 -0400 (EDT)
Date: Thu, 29 Oct 2020 18:34:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20201029173414.fxrl5jacsdwqheto@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Content-Type: multipart/mixed; boundary="===============0732148472=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0732148472==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w5rl6nb5txzhq5tc"
Content-Disposition: inline


--w5rl6nb5txzhq5tc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's the first round of fixes for drm-misc

Maxime

drm-misc-fixes-2020-10-29:
First round of drm-misc-fixes with a couple of leftovers from
drm-misc-fixes next.

Some reset fixes for the mantix panel, some fixes for a scaler issue on
sun4i, many kernel-doc fixes and various fixes for vc4 (mostly HDMI audio
related)
The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-10-29

for you to fetch changes up to 5066f42c7d3c7766c16ba6e73da514af04d43ff7:

  drm/vc4: Rework the structure conversion functions (2020-10-29 10:26:04 +=
0100)

----------------------------------------------------------------
First round of drm-misc-fixes with a couple of leftovers from
drm-misc-fixes next.

Some reset fixes for the mantix panel, some fixes for a scaler issue on
sun4i, many kernel-doc fixes and various fixes for vc4 (mostly HDMI audio
related)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/v3d: Fix double free in v3d_submit_cl_ioctl()

Daniel Vetter (1):
      drm/shme-helpers: Fix dma_buf_mmap forwarding bug

Guido G=FCnther (3):
      drm/panel: mantix: Don't dereference NULL mode
      drm/panel: mantix: Fix panel reset
      dt-binding: display: Require two resets on mantix panel

Hoegeun Kwon (1):
      drm/vc4: drv: Add error handding for bind

Mauro Carvalho Chehab (7):
      drm: kernel-doc: document drm_dp_set_subconnector_property() params
      drm/dp: fix kernel-doc warnings at drm_dp_helper.c
      drm/dp: fix a kernel-doc issue at drm_edid.c
      drm: drm_edid: remove a duplicated kernel-doc declaration
      drm: kernel-doc: add description for a new function parameter
      drm: kernel-doc: drm_dp_helper.h: fix a typo
      drm: drm_print.h: fix kernel-doc markups

Maxime Ripard (7):
      Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into drm-=
misc-fixes
      drm/sun4i: frontend: Rework a bit the phase data
      drm/sun4i: frontend: Reuse the ch0 phase for RGB formats
      drm/sun4i: frontend: Fix the scaler phase on A33
      drm/vc4: hdmi: Avoid sleeping in atomic context
      drm/vc4: hdmi: Add a name to the codec DAI component
      drm/vc4: Rework the structure conversion functions

 .../display/panel/mantix,mlaf057we51-x.yaml        |  4 +++
 drivers/gpu/drm/drm_dp_helper.c                    | 12 +++++++-
 drivers/gpu/drm/drm_edid.c                         |  2 +-
 drivers/gpu/drm/drm_gem.c                          |  4 +--
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  7 ++++-
 drivers/gpu/drm/drm_prime.c                        |  1 +
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   | 25 ++++++++++-----
 drivers/gpu/drm/sun4i/sun4i_frontend.c             | 36 ++++++------------=
----
 drivers/gpu/drm/sun4i/sun4i_frontend.h             |  6 +---
 drivers/gpu/drm/v3d/v3d_gem.c                      |  1 -
 drivers/gpu/drm/vc4/vc4_drv.c                      |  1 +
 drivers/gpu/drm/vc4/vc4_drv.h                      | 12 ++++----
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  6 ++--
 include/drm/drm_dp_helper.h                        |  2 +-
 include/drm/drm_edid.h                             |  7 -----
 include/drm/drm_print.h                            | 20 ++++++++++--
 16 files changed, 82 insertions(+), 64 deletions(-)

--w5rl6nb5txzhq5tc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5r9FgAKCRDj7w1vZxhR
xcSfAP9xe4gEsmmNMIAxz/Del1vUHqbKvQfOt9KZiNhC1dcZUwD/ZMR9mXkKDQtV
DYv1GB0BnpgmUpw09pfUFUzabuw7LwQ=
=vCQW
-----END PGP SIGNATURE-----

--w5rl6nb5txzhq5tc--

--===============0732148472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0732148472==--
