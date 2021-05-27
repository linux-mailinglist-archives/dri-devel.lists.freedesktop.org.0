Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA3392D9F
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9826EEA3;
	Thu, 27 May 2021 12:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962376EEA0;
 Thu, 27 May 2021 12:08:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC2BE5846A6;
 Thu, 27 May 2021 08:08:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 May 2021 08:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=ZXwc7bHybojmWh0s1+HGW0f5AeOyzC4i9KbmT093GSc=; b=FbTubiN2
 e5tqOpyND0vzRb+sXEo6N+xzJG+oti3DGLjyJwZqfjZACVA9CtKTb/2KwTJjdBtI
 3MAhtnjl0/hK/zF6WIuYsbdcBeaY47Sjhi/JcPC0+hUNVkZOFIvqQBN3Qc5l5e3/
 D71a9CoyiTZUOTnbtreDR+4phfV+jS5j9w6+4gkOGrUtRNJCaub9M7szglD16Kqq
 eqzQTCxRfcV0vVoETi16ijZoCsIul8aWD8fTdFqalGW62W5UEBxw43UbLt5tA33a
 RL2nOMeVyf4Q6arSD0FhdCSiWD4yU+iaeXE6/mLpbkusKgE4gnkIf7ghy+nzi9bp
 qp11usTF8J2rTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ZXwc7bHybojmWh0s1+HGW0f5AeOyz
 C4i9KbmT093GSc=; b=c3ET8edLaPztjyEm7VOs2u3Uav+U2zMUELYep+Wngofpk
 +QC8zlJfDL3OBkvXuHTfi3yGXABAhqeoXXUfj4IJVrYN7IeiHoZWxGlzUaqGOMmV
 DwHJgMbS1t2FVyMeZPvj0hlZtZp81L37F2AnhI8FOXTlzqulN5xIdbC3vjBu//JX
 cUvNz3C2IfDbQohuEwFlgakOipHNmviJPypKwrGCAV3ThPB4PETE+xnLPFuFiMo+
 7OGv2PR8ZrUIO13nE4slqILJC9M4LAKHNKOTObCXH6ENeVEfoaCQDhP2AJIHJyQx
 sgtpsCYFT28QVne/3tgaB5FNPoZefvti3qxdzQGdg==
X-ME-Sender: <xms:v4uvYBC8kGXqPrCPYlp-hmGpZLkJbBO6NaAGo0eGWGF_1x4MpiVoOQ>
 <xme:v4uvYPiOTM7nznuzSUdQyfETQ9dx7twszsc398SWtAhtdRanxeSflE6DCDiTT_vsX
 Hl2I8bQgsQ3iyPw6WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v4uvYMkHDHPmi5xG4YLtm5DsPmbcgOslrMEPLsk_TnoSfAcIDnwaIg>
 <xmx:v4uvYLxSTYsWWXYoYtCfkhvj0IkNsXeUlg0P1DRaOQhzq566OSQhTg>
 <xmx:v4uvYGTm1FHu0nopeagRkZ7b_WgPzba1PfrclxYr_a_NwxyqLa3hyA>
 <xmx:wYuvYJF04Gx-XmJ06Z5ndb2X1TxaM4IxNXmxS2MmtC4usdW2Uir33A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:08:31 -0400 (EDT)
Date: Thu, 27 May 2021 14:08:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20210527120828.3w7f53krzkslc4ii@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l7w4huk22jki3v3r"
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


--l7w4huk22jki3v3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's the fixes for drm-misc-fixes for this week

Maxime

drm-misc-fixes-2021-05-27:
A fix in meson for a crash at shutdown and one for TTM to prevent
irrelevant swapout
The following changes since commit 7e008b02557ccece4d2c31fb0eaf6243cbc87121:

  dma-buf: fix unintended pin/unpin warnings (2021-05-20 14:02:27 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-05-27

for you to fetch changes up to 35f819d218035ddfbc71e7cf62a4849231701e58:

  drm/ttm: Skip swapout if ttm object is not populated (2021-05-26 15:02:47 +0200)

----------------------------------------------------------------
A fix in meson for a crash at shutdown and one for TTM to prevent
irrelevant swapout

----------------------------------------------------------------
Neil Armstrong (1):
      drm/meson: fix shutdown crash when component not probed

xinhui pan (1):
      drm/ttm: Skip swapout if ttm object is not populated

 drivers/gpu/drm/meson/meson_drv.c | 9 +++++----
 drivers/gpu/drm/ttm/ttm_device.c  | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

--l7w4huk22jki3v3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYK+LvAAKCRDj7w1vZxhR
xQZKAP9+b20xt0jmjtg6ucGZ+t6ivaJyha+wNZqnTj91aI7CsgD8DVFMBbGCBiLk
HvEi0cgsSyOXcqw+BYLlM2fA9ul6fg0=
=zRRr
-----END PGP SIGNATURE-----

--l7w4huk22jki3v3r--
