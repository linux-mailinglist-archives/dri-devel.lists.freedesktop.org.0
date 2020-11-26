Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0F2C629D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1C56EB86;
	Fri, 27 Nov 2020 10:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E997F6E81F;
 Thu, 26 Nov 2020 08:54:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4B20E580687;
 Thu, 26 Nov 2020 03:54:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Nov 2020 03:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=T0VOcITP7XJe0ox3OJH4E/HSb4hbqVauYgjMOWqeQNU=; b=Y7aFWBUD
 mJkTSTxuw6949SVnNYbSpfuRkxSSoH8PnyGnT5c+0RDQHFIPKt1d9mH67p4LJ04L
 IW34x96Js8Zu3xP4fPpZPEVS9sFB18pw/q8wtJABF40GXe7zGFgiRxWfePxrahyK
 4VidqLN5ROlkatUGUAH+QY/AZFnmELIVXKJfwIJMguEr2bnFXvb4tirdQ4RJsFiE
 pp28/exQwmLqdMOMjCGs6OBi2K7QDl6yfrqJq7ISXtqb007hJ6VJ2ywuRFLWplHu
 o0QJICp3x6tmRw8a4hYFHlMgytFKeBSSRqlvcxv6QfsE/emiPDhMNmhCe9EMMrh+
 9Reg8ASmGn7mHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=T0VOcITP7XJe0ox3OJH4E/HSb4hbq
 VauYgjMOWqeQNU=; b=LsMOV8G7c9rqJ9+9d5XztCb39CJ6iskUSC/FfPbZnTIIB
 PJ6HY8KP1s/eSBf6/My5VnHNjf1zayg4xvVxUf0yiky4Ol+fS6F9YSZlgK5NrEEH
 bVrf/t687/2NlItCGNzpS9s2OKZf3NvVBe6VDuy6i0NZxQ5iDoFoGC2GcX80E7nG
 dnjWvWroEm+q/znX5TAmkUXbFp4y55chNAQAXLLd5TN9L3wa/hTr8UwQhvSYb0Ai
 sPIReEEsuYYNfw3lh8Lwf8vD9/TS1lyeqtyHkMlllj8WXYWQ90WpEac8hQtEL5+V
 wemVMtcY+RVv7cJpl52XDLY+bx9EfscANdtLWPznQ==
X-ME-Sender: <xms:XG2_X8GzjxQpx9Nn98B_CVY3W27wL67MPVHA6IaEJ1jtD_RsQYemGw>
 <xme:XG2_X1ULkTgsxMsQXJjJps4aDHVvvdc7beCVJTXexOcACOAUWa2Nik3fB2gyEb8ha
 YD2sfszTLN_fjQbHgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehuddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeijefgieefgedvueeutdegleekgeegvedvuddutdefkeeutdegueduudeiuedt
 teenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorh
 hgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XG2_X2KJrIV24UCsa-CrLT89Y51t4THy2WRwPM564dODIWLgGp-adw>
 <xmx:XG2_X-H2H9WEsiwQNmmD6uLgMk7R_kF-kEGGpSpYDZ7SgwsMsaE7cA>
 <xmx:XG2_XyUIGmjllKGV5fN7ylrB2MAHMKGoLzUplynfjHLxP1B1lK3Iog>
 <xmx:Xm2_X2qO-IEqkA85ng0YO9LzMScM3AolMoYEdUWQgIzAvMzPFBR_Kw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4915A3064AA6;
 Thu, 26 Nov 2020 03:54:52 -0500 (EST)
Date: Thu, 26 Nov 2020 09:54:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20201126085450.r3i7wvj7pizsa4l6@gilmour>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Content-Type: multipart/mixed; boundary="===============0206375744=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0206375744==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fd5orq2irqcv33hb"
Content-Disposition: inline


--fd5orq2irqcv33hb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week round of fixes for drm-misc

Maxime

drm-misc-fixes-2020-11-26:
A bunch of fixes for vc4 fixing some coexistence issue between wifi and
HDMI, unsupported modes, and vblank timeouts, a fix for ast to reload
the gamma LUT after changing the plane format and a double-free fix for
nouveau
The following changes since commit cdf117d6d38a127026e74114d63f32972f620c06:

  Merge tag 'drm/sun4i-dma-fix-pull-request' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mripard/linux into drm-misc-fixes (2020-11-19 09:26:07 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-11-26

for you to fetch changes up to 2be65641642ef423f82162c3a5f28c754d1637d2:

  drm/nouveau: fix relocations applying logic and a double-free (2020-11-26 08:04:19 +0100)

----------------------------------------------------------------
A bunch of fixes for vc4 fixing some coexistence issue between wifi and
HDMI, unsupported modes, and vblank timeouts, a fix for ast to reload
the gamma LUT after changing the plane format and a double-free fix for
nouveau

----------------------------------------------------------------
Matti Hamalainen (1):
      drm/nouveau: fix relocations applying logic and a double-free

Maxime Ripard (11):
      drm/vc4: hdmi: Make sure our clock rate is within limits
      drm/vc4: hdmi: Block odd horizontal timings
      drm/vc4: kms: Switch to drmm_add_action_or_reset
      drm/vc4: kms: Remove useless define
      drm/vc4: kms: Rename NUM_CHANNELS
      drm/vc4: kms: Split the HVS muxing check in a separate function
      drm/vc4: kms: Document the muxing corner cases
      dt-bindings: display: Add a property to deal with WiFi coexistence
      drm/vc4: hdmi: Disable Wifi Frequencies
      drm/vc4: kms: Store the unassigned channel list in the state
      drm/vc4: kms: Don't disable the muxing of an active CRTC

Thomas Zimmermann (1):
      drm/ast: Reload gamma LUT after changing primary plane's color format

 .../bindings/display/brcm,bcm2711-hdmi.yaml        |   6 +
 drivers/gpu/drm/ast/ast_mode.c                     |  17 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   8 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   4 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  48 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  11 +
 drivers/gpu/drm/vc4/vc4_kms.c                      | 246 +++++++++++++++------
 7 files changed, 272 insertions(+), 68 deletions(-)

--fd5orq2irqcv33hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX79tWgAKCRDj7w1vZxhR
xZJAAP4ufETTy3Jx9Xl5OCLMcNVsmBszSAJRnmX8sFMZ+VSMxAEAswgE6JWrARws
d3THw97O9ZRiTvQvqvZimbf9O3qGpgY=
=4chX
-----END PGP SIGNATURE-----

--fd5orq2irqcv33hb--

--===============0206375744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0206375744==--
