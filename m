Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E09136E782
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FED6E1BD;
	Thu, 29 Apr 2021 09:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B08C6E1B2;
 Thu, 29 Apr 2021 09:03:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id DC9C6580723;
 Thu, 29 Apr 2021 05:03:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Apr 2021 05:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=L1zO+2WghJ7tccfuc/GcUqzQQOiz4lVwM6uCcotL9Vo=; b=lcnuBmyD
 9Y3QmK7eaWTn7n0gEnr4k3HW5L62pQunmIbs7Xk3Z/qED5t+TXgQXads2D2mT9aE
 C/t7smx8qemniW+7ULAB0mDBQnv5jBqj3Lm8fOpGhQV/V1pw0UgmuDHa7VECoEQJ
 4963vdVJe1dGiBRqtEbbjrB1X42Uxs91mAI5Yi9LfOWNlm73EHRVqlu6tEnRCZNb
 /mfAeETq2KS3xX5ZIlGtnjfyB1M2XFXuyqcWyjWkR23wXqJqnO7fqcWNuECeDEhL
 3mL3dqnaIMNY9kumXEf5QoZ/YTXiQU3IiBS5ptfqYYBtJqEP++LjkItdeuGlJH9R
 sfBzcPhM/L/TqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=L1zO+2WghJ7tccfuc/GcUqzQQOiz4
 lVwM6uCcotL9Vo=; b=pL92EWbDV84aMAQ+8yGL9eI0YJXSIwx8+HdI6OFgPmush
 oJCDgiZJvPpta2EIx/AIwdRIkNyah1T4y2tbZMaRnJ2ma2AkP3ZBqxW044ukRQBF
 XujBc1M7Tdz3QlSGOBAWeROXqY3OwNg8EMMtUjVSoMSMV03IMvCmkavcxIrDluxN
 Cd6Oq9WwLcBH3zKJCwd4sCnvphW287NDm1L4wROxFKtFrOY5SPNKLB3QQsBZOm7Z
 aZTux3HrzPy7mn1MtdLQ6feN5tMHhU8WAgltVE8odi7bk5cZIclyzy93LhhKgQrS
 pNPhN5WR/cPpwKwETFIipuV6b0/sDzICnGHeCMwcw==
X-ME-Sender: <xms:T3aKYO2pr8txvaTf5YEST8nLbXkNDZbiH3_2OqQmUteOFaA7KO_WMQ>
 <xme:T3aKYBFk6ACaoF3k5vV1xiGLtm3uxre90KtrDDpjVvojrsKaVEPWVSr0dGDGi__zf
 V4AI-3G38mUzRNX5QI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:T3aKYG455iFt6wnq5VsKR3f8TxOhuv2m2edBJesEIlcqobReT9WeJQ>
 <xmx:T3aKYP2z6uAM4FHyKkUlrsrzlPoEtIbrNnP41_uDiH1c_49qdVmFeg>
 <xmx:T3aKYBG1IzHrVlQYaIPNRE6bEVMLu_ivZmceqZuWoK3gTgF5CQKmPg>
 <xmx:UXaKYHZZbuX8NZLU6fuGS6t4LJ1vlWhU202hytS5WDbRW4NIt04DWg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 05:03:10 -0400 (EDT)
Date: Thu, 29 Apr 2021 11:03:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20210429090308.k3fuqvenf6vupfmg@gilmour>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0043736729=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0043736729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xm3p6rrwvxpkauem"
Content-Disposition: inline


--xm3p6rrwvxpkauem
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-next-fixes PR

Maxime

drm-misc-next-fixes-2021-04-29:
Two patches in drm-misc-next-fixes this week, one to fix the error
handling in TTM when a BO can't be swapped out and one to prevent a
wrong dereference in efifb.
The following changes since commit a4394b6d0a273941a75ebe86a86d6416d536ed0f:

  drm/ttm: Don't count pages in SG BOs against pages_limit (2021-04-21 15:35:20 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-04-29

for you to fetch changes up to 74deef03a44ae77db85dd80e7ef95777a902e0b3:

  efifb: Check efifb_pci_dev before using it (2021-04-26 17:33:03 -0400)

----------------------------------------------------------------
Two patches in drm-misc-next-fixes this week, one to fix the error
handling in TTM when a BO can't be swapped out and one to prevent a
wrong dereference in efifb.

----------------------------------------------------------------
Kai-Heng Feng (1):
      efifb: Check efifb_pci_dev before using it

Shiwu Zhang (1):
      drm/ttm: fix error handling if no BO can be swapped out v4

 drivers/gpu/drm/ttm/ttm_device.c    | 2 +-
 drivers/gpu/drm/ttm/ttm_tt.c        | 2 ++
 drivers/gpu/drm/vmwgfx/ttm_memory.c | 2 +-
 drivers/video/fbdev/efifb.c         | 6 ++++--
 4 files changed, 8 insertions(+), 4 deletions(-)

--xm3p6rrwvxpkauem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIp2TAAKCRDj7w1vZxhR
xcXeAP4gfyACcp11N6TmZ2t+9mJU9ZdogB1kxBSMaTuzxRwLhgD/f3+Kbx84IxaH
PfyxzsnaAlqfwRkIeyZTjQS0fK5IfAo=
=7Kgu
-----END PGP SIGNATURE-----

--xm3p6rrwvxpkauem--

--===============0043736729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0043736729==--
