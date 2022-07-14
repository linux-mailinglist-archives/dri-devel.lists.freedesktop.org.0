Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A55745CB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 09:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD112B8A4;
	Thu, 14 Jul 2022 07:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DA893918;
 Thu, 14 Jul 2022 07:18:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 84AE93200930;
 Thu, 14 Jul 2022 03:18:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 03:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1657783105; x=1657869505; bh=ikFanWY917QenhU0fjIRw6VS1WxJeoWN02r
 Zk0hNVt0=; b=k+cfsxEqvHet9gs10Q3rjcxKm4uE6bbtErcqJfl1x5GxglSIdwn
 TPl0h7PI24yV5RFBn5d3S0q/sh326xPiuChXSpfB4ml/ZkcBb8huXJYnMfNvPUHg
 acnNBeEYdZf7L5PA1YHbz+fQwf0fJl1R/iOXJY0LcTfasbANeHyM83ww/zAi0bwq
 bIG8Ir5jpgnTDo0BFhViNH/uuYPiA/a1jmSGGHHqebc4DJ6rYoUOyG8HTDUotxCe
 lPSPjYDm8lEKCBOvz/WJDuFcKjeD6DNgg4CXJU8pPSasU80wD793ei96u0W2uxx5
 t/arxpGGvOkeO/JC5+I52De1ooigSE3RArQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657783105; x=
 1657869505; bh=ikFanWY917QenhU0fjIRw6VS1WxJeoWN02rZk0hNVt0=; b=T
 HSvMPX8NkeOsS/ySL/WNjMIHUQSc0HPookQgkUFnpuH4fy+JTAPuPncKY+kcPyEY
 XoWOReFm5Z+BH0doN6GZbCvgPPZD/z/xJTjAe2m550m+fzxfPjX6HpY1YTHsgabr
 /Tt3s/8FkL/DvlHEn5YyKpJX5Rde6e0f86KWC2bW4b+ucJTWG3QhQKu4QJrxfJzG
 Wrgx3HcwPlHHx9qWp1Yk/61nN5cqkUx2fcRc16S5bP84DUrXZqCRaS9XnKCeqtBD
 3rgKwwUAZgwidIoGmH58ODe6IfmNKUPMzhMVSJ9Sdqe3NcuHgkiB4Ri+6tLOSvFY
 QFru4NoLxBzit6PSaKsUA==
X-ME-Sender: <xms:QMPPYvob09zaPIPOkG1f_S2qqZAa50dKfSIo90uGcS49KxDUNJ1uvw>
 <xme:QMPPYpqhc4-c-r9e69GCxpA0jY4pkwgmNVDfaJgqNtbYZH1MUH6LO7DK3CWwEf9ft
 _9bCAu9Vsik1Jbf2hA>
X-ME-Received: <xmr:QMPPYsOCxHSN-8szE2jlZYXVtOA8GYkhFCn84YxHiy2x-5jDGwp7iKxC-puPgvYy3EvDGI0XLUz43Ruy1eV73c1RChh6D49pO23kZgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejkedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudev
 jeeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:QMPPYi5Lzi_LpV5XSV7bifyRim1VNQ6TeZmCcuVX0nHlj59_427Gqg>
 <xmx:QMPPYu4aDSHfMlC7wEd0f4UvZ2SAE7zlEtBjZ18ecEJRnXUd9LlS0Q>
 <xmx:QMPPYqjnFJEjEKubQIoY_n9Ry8wC_MCDe1QDUNb9Y1aZuTxqKGTt7g>
 <xmx:QcPPYrxEyIJrryXiMe5R_DQnFAu1HA8e2ZONPDUfV77bpIfFA5roUg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 03:18:23 -0400 (EDT)
Date: Thu, 14 Jul 2022 09:18:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220714071821.hsejxpsgkbbzlec2@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oqqptlvw3xhy4ojq"
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


--oqqptlvw3xhy4ojq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-07-14:
Only a revert for amdgpu reverting the switch to the drm buddy
allocator.
The following changes since commit b68277f19e31a25312c4acccadb5cf1502e52e84:

  drm/ssd130x: Fix pre-charge period setting (2022-07-07 10:52:03 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-07-14

for you to fetch changes up to 925b6e59138cefa47275c67891c65d48d3266d57:

  Revert "drm/amdgpu: add drm buddy support to amdgpu" (2022-07-08 14:24:30 +0200)

----------------------------------------------------------------
Only a revert for amdgpu reverting the switch to the drm buddy
allocator.

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      Revert "drm/amdgpu: add drm buddy support to amdgpu"

 drivers/gpu/drm/Kconfig                        |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  97 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h        |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c   | 359 ++++++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h   |  89 ------
 5 files changed, 176 insertions(+), 380 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

--oqqptlvw3xhy4ojq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYs/DPQAKCRDj7w1vZxhR
xSk1AP0X+n7TWE1X7th+B7pSBBaHTMPpMeeB3xbHcy/d43MWxQD8CiIHmie63tMN
//wQvIVJkXJpfDNbSDcb2W47cCiLYgE=
=7gBP
-----END PGP SIGNATURE-----

--oqqptlvw3xhy4ojq--
