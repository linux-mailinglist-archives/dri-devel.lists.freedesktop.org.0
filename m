Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D9476BD9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7C910E42D;
	Thu, 16 Dec 2021 08:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F8310E1FF;
 Thu, 16 Dec 2021 08:26:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 45B902B000E0;
 Thu, 16 Dec 2021 03:26:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Dec 2021 03:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=khO/rWt3/nnU2RGdMyLCXbB8pMaklieWSXpoJIa4Wwg=; b=AU2XHg6I
 VFVmJtTJmfGEgIwJ+n1MHeHDW25u2alFm3jwybA80iRjSf0BTY7m+nVaqtWQ7AlS
 EPLZ6ieoV4rLH4EFr/8KuD0tvCCf4h8EQu7rNDAn+H3yLQKCMXbFm5Bcwo+lETyj
 2kaIXXxGskOQHGOdXdUqzfxlHvYn+yDwqGWUJ6hn0WooqXm4ivfGnWWv4W3Znx+4
 s2TIcL56JVSKvoNTkdFe55e4cUoUbF1zjGep+a1yTIsDYcgYtqfGTqW+58iOdu8B
 U9752kRRLV/N5uRxjI8k7iW5hiZrqo7BFY2H8uljpFaeV7xX/j4wvQeQERl0bo9R
 ZiaExPk6s1ki0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=khO/rWt3/nnU2RGdMyLCXbB8pMakl
 ieWSXpoJIa4Wwg=; b=jmn4ACFi0Wmmh8UBOEV3zoBTMYmypvLWb4Zur6ZcS42xW
 6FeB6BWdgihdAICtlQRR6wsjj/MYZ+1fNgnX9cSray7BjCiBlridZwNaq+aEt43L
 AeAYdH3sALWO9NwkroIqvjXJUYnJDzMxlY7S2ln/jOwu3832V0dzt0Jzx7+DGcZS
 w40KXAC/tnw7JUYx84SL5iVDbOVYZHixnhdEVK5pDC+F2ivfom7VIV8FXUJsPu8c
 Yz6i9qeiVsvCz0wV5WDCLjZ9ssMV61jfWMpqJn7xt8iy75NDF6pElm3+0NfRCjhT
 NOqnCjCgIiqyEYf7gKIwMnULGxt2f53RVo7iIzcKA==
X-ME-Sender: <xms:Hvi6YVR7EUk8K1V0EW6mpDXc028FQnibn-6kAZDhjE4QjF3QBdYeNQ>
 <xme:Hvi6YewWpaLsL70lbLWPrIl68gwixTiKbpY8rMOgQ_PGytqzDcDKE4_AWOiPht_Qa
 LSmClGBw8DMbVmCuxk>
X-ME-Received: <xmr:Hvi6Ya0i01Od5mn-Wz_XQ_AFiH_vPHjIV6_nKVZItxeCvzScvjfBfLZQgBQxoytwpAeuUIM9WqN6nF9WhdonOPxldEqmgadGorLEmYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleefgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:Hvi6YdCdbKQz2BmEQS8U5iItyJOeh2MWKPEnh0ufaJapjT-Eu44p1g>
 <xmx:Hvi6YejVC7DuVXsQo2gIkvSZWj3r69h3015eeg0AvITzNO0OMto7UA>
 <xmx:Hvi6YRog_3nf4LhNBkcn51srRzl2TFoBLmJNc620jUmK0ra7tqHMIg>
 <xmx:Hvi6YZPSJDgI-RQ7tsBnHhtG8S9I9sROVnJE1SfQc2HTZifMuSozCTWSTQk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 03:26:05 -0500 (EST)
Date: Thu, 16 Dec 2021 09:26:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20211216082603.pm6yzlckmxvwnqyv@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7uzv5e5skyluybsp"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7uzv5e5skyluybsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR.

Note that dim pull-request was stalling when generating the email, so I
had to send this with git request-pull, hence the odd tag name and the
format slightly different.

Maxime

The following changes since commit b19926d4f3a660a8b76e5d989ffd1168e619a5c4:

  drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence. (2021-12-08 17:19:48 +0100)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2021-12-16-1

for you to fetch changes up to fea3fdf975dd9f3e5248afaab8fe023db313f005:

  drm/ast: potential dereference of null pointer (2021-12-14 09:18:28 +0100)

----------------------------------------------------------------
One null pointer dereference fix for ast, a pixel clock unit fix for
simpledrm and a user-space regression revert for fb-helper

----------------------------------------------------------------
Alejandro Concepcion-Rodriguez (1):
      drm: simpledrm: fix wrong unit with pixel clock

Javier Martinez Canillas (1):
      Revert "drm/fb-helper: improve DRM fbdev emulation device names"

Jiasheng Jiang (1):
      drm/ast: potential dereference of null pointer

 drivers/gpu/drm/ast/ast_mode.c   | 5 ++++-
 drivers/gpu/drm/drm_fb_helper.c  | 8 +++++++-
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

--7uzv5e5skyluybsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbr4GwAKCRDj7w1vZxhR
xfhoAQCkdRHgBw5o4McbF4gfFr163KJLmD3RorxTQ4oJSYak7QD8C8q+UCm9V98/
6aP/ruPk1UMY2ir06nx1StYkIt0oQQw=
=fdy3
-----END PGP SIGNATURE-----

--7uzv5e5skyluybsp--
