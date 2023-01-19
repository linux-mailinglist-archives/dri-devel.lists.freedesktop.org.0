Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C4673383
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 09:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2F710E8EA;
	Thu, 19 Jan 2023 08:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923910E8E1;
 Thu, 19 Jan 2023 08:21:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 541962B063E5;
 Thu, 19 Jan 2023 03:21:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 19 Jan 2023 03:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1674116461; x=1674123661; bh=mtmi+oMGv5IhxOpYCVbvotdaNSDJ50djyOC
 tdmyYaG4=; b=QvOtEnQj4Fm1sluBvmsuqKg4kwMXjpL1cGC9BSprGihT9FpRuXD
 dOvbaPBGQKlv5+gPTOQpKpkpPG+UU6ZV7J1PBd6OiidpB8GtfJ7TpC+fJryvHD0g
 oJGu7fchNhvb3knYnl+xqA2b0579o8tCfz0iTwog5g2ngDGvd9i/puGgw4hhg/eA
 J5ds9+C3JseaXAVqTnOuAYZwkn4oEXGipWquCXxOW1oRo10zNfqE7lr8G56Ef2mG
 Bm/4VswGeTGGLMSyXlLHqz+59wnEGdA/23/yb7vkmdczgOUOpjRdw9/7s/VKQmXG
 moWnRQ2zXHwXdbOYyrxxUJrtLbbiSwIDWjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674116461; x=
 1674123661; bh=mtmi+oMGv5IhxOpYCVbvotdaNSDJ50djyOCtdmyYaG4=; b=P
 p+Or4iDPUvVFtEIIOCubrg77Mq7RB3MTrKTrlJmeUbELLvN/7JWF7lVHfE49gLhx
 8SIIIntV8X8wg/ID8GLpzEoaRUWAdvY0kDLakz/oaAblHuabdJVh0deopm9q/lLz
 2oGSr7eKVmvkRm2XoINVU7BL8neFUggKBkQFYTjczMP2vnfVHfTewA33VPaQgDQK
 TlwEvQJQHDJxSX8I4840ONYWaMVIWnCbeTi2MOc8b7ssMHvpS5wAbQ4xxU+AA1JG
 VdB0rubElmyZHmMoM41sQaVvUO8nGwhVkqB0ZHzsoklkVvmdpEsN3veKIgy7XXwZ
 39GHuqwWYHEN4IrusSFuw==
X-ME-Sender: <xms:bf3IYzACQ_7HFhn3Anwrkze7RWbakxjS9DNqPKAVYLOuZOEi7Gx_HA>
 <xme:bf3IY5gqtWI_jzFwcWQmGbS2-vK2ZhszwkAvr6cZIm-eqPjmoLdkJLls5ujf2zniF
 2VWrVnHrEmOMz28ctA>
X-ME-Received: <xmr:bf3IY-kK6NbU5qSg4rjAp2fnV6fBiUmdtjm1WEOhcTxomioUkO_hzPoJVCqqDaNYQu7MatxTFYgIH45RNBDejLwkB5Q6Y8M46ACTQHTItlEuiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudev
 jeeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:bf3IY1xnSVyyhtsEtCj3-gDuncVVb812NREKHum_fXi5NCLJai40-Q>
 <xmx:bf3IY4RuMYudc9pYtIe4mOkRRsZOCARielm8eYyUPWnjPlEl9EzZLA>
 <xmx:bf3IY4ZC7YfTBPvZa-e3SoYPgfOH31VljWB0yjw6j8GwtnRlXppyyA>
 <xmx:bf3IY3D0VM4BsONncXIHzLQxnJvzi-VE_Znfq9YKyDFEkstFcuGGhUyifaY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 03:21:01 -0500 (EST)
Date: Thu, 19 Jan 2023 09:20:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230119082059.h32bs7zqoxmjbcvn@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dy6za6a4l5z47ieb"
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dy6za6a4l5z47ieb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Thanks!
Maxime

drm-misc-fixes-2023-01-19:
A fix for vc4 to address a memory leak when allocating a buffer, a
Kconfig fix for panfrost and two fixes for i915 and fb-helper to
address some bugs with vga-switcheroo.
The following changes since commit 5640e81607152d7f2d2558227c0f6cb78b8f39cf:

  drm: Optimize drm buddy top-down allocation method (2023-01-12 13:50:28 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-01-19

for you to fetch changes up to 2293a73ad4f3b6c37c06713ff1b67659d92ef43d:

  drm/i915: Remove unused variable (2023-01-18 13:33:15 -0500)

----------------------------------------------------------------
A fix for vc4 to address a memory leak when allocating a buffer, a
Kconfig fix for panfrost and two fixes for i915 and fb-helper to
address some bugs with vga-switcheroo.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/panfrost: fix GENERIC_ATOMIC64 dependency

Maxime Ripard (2):
      drm/vc4: bo: Fix drmm_mutex_init memory hog
      drm/vc4: bo: Fix unused variable warning

Nirmoy Das (1):
      drm/i915: Remove unused variable

Thomas Zimmermann (2):
      drm/i915: Allow switching away via vga-switcheroo if uninitialized
      drm/fb-helper: Set framebuffer for vga-switcheroo clients

 drivers/gpu/drm/drm_fb_helper.c        | 7 +++++++
 drivers/gpu/drm/i915/i915_driver.c     | 5 +----
 drivers/gpu/drm/i915/i915_switcheroo.c | 6 +++++-
 drivers/gpu/drm/panfrost/Kconfig       | 3 ++-
 drivers/gpu/drm/vc4/vc4_bo.c           | 6 ++----
 5 files changed, 17 insertions(+), 10 deletions(-)

--dy6za6a4l5z47ieb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY8j9awAKCRDj7w1vZxhR
xb5NAP9u9dOuTyFsVNGNIjwDhLlXufpzHxQFn9m/U93OfiPEoAEArNgft2uWAK9Z
VUvWrF6tCm23hXi5dZCkVQPV41WtfQs=
=/mXd
-----END PGP SIGNATURE-----

--dy6za6a4l5z47ieb--
