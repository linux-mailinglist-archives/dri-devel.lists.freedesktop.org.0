Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972A2B9C10
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3F96E827;
	Thu, 19 Nov 2020 20:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198689935;
 Thu, 19 Nov 2020 08:39:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6948C58055A;
 Thu, 19 Nov 2020 03:39:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 03:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=/Nuf/UvUu1iKqW+y5+gZOwGx+P3twwnQhQYjHd6/ngE=; b=ags7uyrm
 fJouaLRczseuxTaNU4wLw/tpwehX+ux3D8FBkdLUKHdtnqSnpQRAZ7SKIQl20SvV
 YyPmHCFHjz1+Uc5eUzZXbXOSl7dZoGrpHSaOwW/TXN8eEQqhTWCGDPq0pbNeQq3W
 yaU7JujKcLLTnnfhTjtwWjJk4/W0iNdGB42qk+8oSLZgRsozeSe4qJV+22MB/LnQ
 VeLD6yYRL7QCR5qTaFl4+9eKLrbIwikIAw7BAoGQsLgJDc7vuWnd6lW+3QKlSr/6
 AzonxqINTAxwe6DaNIgLssz/CXNV9iivtuaTb8x9XBosXg4nRZhzI2+6rmbYEh7W
 XWt20dJYxolTmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=/Nuf/UvUu1iKqW+y5+gZOwGx+P3tw
 wnQhQYjHd6/ngE=; b=QseA8dDxPPWGXqa8j3tUJ7Jh6RfcjiSQqftaMFieIh3aO
 bpq9B3hZSoN7qUT0RDpCbcJwwL4MbznvdWG8dCpDuvg1E+drWD9cKliCQFu1zf52
 AKxN2wrGfLOT7dCVtDBhYJ+IITBLnu9gE1ApdHknZs855q816ThSZUG0VZqozJV9
 dQtP7oOnE/z1BfsTvnp3V/7Hm0Hw/Xb6BPUa7xvf5EkOkQ7nz8je8CD/SsjeGgqo
 y5lRWGdaUb+ww9KQGCOtwea8cvru6XCm3tMiFDv6R89bWoOGKi/iQHlhVhX2d6d7
 HCVnHrMZzudWbr2VCnFUeoSy6eGaDmHFIg5PgdmUw==
X-ME-Sender: <xms:TS-2X-AI2Y4MJg4p18qbMR7lJdOFiA5dbNe-QHc0XAW6Ezr7garfYg>
 <xme:TS-2X4gj2Ib9Vs6uZhA8Mgj8BrzIE5DpL9yL9oclIPglmwti1hTPSMyocTkYz5Cb5
 2snSycnWRMSXSP5e8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefiedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeludeghffhkeejteegiedugeefudetkedvieffveeiudeuudeufeekfedvvdel
 veenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorh
 hgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TS-2Xxmps0JVZIJKiz6W96zbGQLrowye64leXtbobgptJb8moFMHrA>
 <xmx:TS-2X8zhWqariq_c7xgCGZoRe9gO3oIw_a7kUOQ_nrg4jcdcUK7X4Q>
 <xmx:TS-2XzQw48fws_pELAAEhsQWJ-kxJ_VZF9py5nujsUJUwPCTYm1lcg>
 <xmx:Ti-2X-EJ840_VHmr0wJWsS8okRpV3F_ujV6oU8j0IFSK2ZBuYWk8VQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B5373064AAE;
 Thu, 19 Nov 2020 03:39:41 -0500 (EST)
Date: Thu, 19 Nov 2020 09:39:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20201119083939.ddj3saipyg5iwvb4@gilmour>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Content-Type: multipart/mixed; boundary="===============0104404819=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0104404819==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="riwlig6y2hejb7jd"
Content-Disposition: inline


--riwlig6y2hejb7jd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week round of fixes for drm-misc

Maxime

drm-misc-fixes-2020-11-19:
two patches to fix dw-hdmi bind and detection code, and one fix for
sun4i shared with arm-soc
The following changes since commit a6c40b8032b845f132abfcbcbed6bddebbcc3b4a:

  drm/mcde: Fix unbalanced regulator (2020-11-11 00:27:53 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-11-19

for you to fetch changes up to cdf117d6d38a127026e74114d63f32972f620c06:

  Merge tag 'drm/sun4i-dma-fix-pull-request' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mripard/linux into drm-misc-fixes (2020-11-19 09:26:07 +0100)

----------------------------------------------------------------
two patches to fix dw-hdmi bind and detection code, and one fix for
sun4i shared with arm-soc

----------------------------------------------------------------
Jonathan Liu (1):
      drm: bridge: dw-hdmi: Avoid resetting force in the detect function

Maxime Ripard (2):
      drm/sun4i: backend: Fix probe failure with multiple backends
      Merge tag 'drm/sun4i-dma-fix-pull-request' of ssh://gitolite.kernel.org/.../mripard/linux into drm-misc-fixes

Xiongfeng Wang (1):
      drm/sun4i: dw-hdmi: fix error return code in sun8i_dw_hdmi_bind()

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ------
 drivers/gpu/drm/sun4i/sun4i_backend.c     | 8 +++++++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c     | 1 +
 3 files changed, 8 insertions(+), 7 deletions(-)

--riwlig6y2hejb7jd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7YvSwAKCRDj7w1vZxhR
xRNzAQD2FeKcytDgaVYRGzUQtCkpj2brLUyw/bgtQoHfI3WFGQEArnpehVYjHjhV
fdv1dCmKmJC69aDr0GFf1OIlm/o9IQ8=
=19fj
-----END PGP SIGNATURE-----

--riwlig6y2hejb7jd--

--===============0104404819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0104404819==--
