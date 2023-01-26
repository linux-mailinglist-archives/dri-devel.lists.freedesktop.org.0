Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839167C8D0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 11:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A663F10E480;
	Thu, 26 Jan 2023 10:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074A710E0F7;
 Thu, 26 Jan 2023 10:40:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 052E62B0686C;
 Thu, 26 Jan 2023 05:40:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Jan 2023 05:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1674729621; x=1674736821; bh=8nYVPhG2kYkrJeQYSN33IGzKuFT43eqNEYe
 QAtFi70o=; b=YzKwn223XQ0GAu8YzW3Khkea2WNlmdNlvcG035HKuJmuL+78U3V
 eFH9zNMQMNYgH/IaKdrtJGOw90SyI8729g+Jr9bem0tvUaP0ZkcGdUC7UldmReUV
 Xrk45VaJPogiZq4Sd7/4GU3yQqqnJe/S+or0UDUmkuCqB8vDK0YP911ftrwLMsRf
 4xb2kQTW6/ojevOhJvJIOeYNfoTDa04aN8IUDHjmPntdiXjTTyJTW88ez8EMJl5y
 Vfw2wTuQ5GZvEcrpLu1DKacJpELeR5EjoiEq0sX6kzIZl7qjZ+ZEAh2aQkYOQZ+a
 SRf6hqRq73nwwjh0+b0YbyxV53QFPokzF/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674729621; x=
 1674736821; bh=8nYVPhG2kYkrJeQYSN33IGzKuFT43eqNEYeQAtFi70o=; b=j
 4HNApoNMqdAMkZUkff3Jh100mN2R4YHNDcnyrwJXpcpMVewQAKSzJUYceVzjN3ve
 75uhyW21u/7RFA1M/S8+SmrrOZDXGHfqrNOu3MhkkGHFepHBqptQu44II7t/6Nzt
 1cOy6Rrv7PLa6eF6Wpki/TcXGxbz956L0E7duRw1TikKb8pu4jLZ3WQBDfUmP8Ff
 saznWRrsEwSXiX7vip9EwqYWTru78BWXe74ruwmVx6LE5pC4k2950S6QZnvQelZy
 i//L8JLu2rKp/Vh6uybgF2rdGyZZPVJSnK+c7vTTjtI1tJKXOYn7QpfPZcdz17cH
 RLTy1hnExoATErhxXJodw==
X-ME-Sender: <xms:lVjSYyxDl_94eKLCP4sUgihtaPJ31EIg0ySDhxC1UqeCTCPuh9ZAkg>
 <xme:lVjSY-Q9Rxa2d97LF0y4jjczy5YZxadPDtsWByaIIwBE3Nh3S6Q_-VTKn6xYkflRp
 x1spsaffYfP_L8Syp4>
X-ME-Received: <xmr:lVjSY0WKgDvgSYFsGf_NkO5j_rRWTdioVuY2wAQgFQ3fuFfv5iMoYktwQ5iH3otLFhojDf2R4PDXvl6UL54YfdNyAyv15E1pU_nnTjb0U1K58A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:lVjSY4hJdGT6e3w2I29D9W38Jeg-kF67_hT7eRVsShgzeWFb6J16Tw>
 <xmx:lVjSY0BDNzUHASAPeAf6vfgE17qH6ASH-TbhUdzOLqWaWee47AY_tA>
 <xmx:lVjSY5K-2U6JMLbbEhGfe5bzGXNL7HbljILcbU9cfeUU6RXVxIZVDA>
 <xmx:lVjSY2xjKRBP4r1LNPYlMRdrDYJXm9aEV-U4RAEXREy2jMqPNj34pPDZD8Y>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 05:40:20 -0500 (EST)
Date: Thu, 26 Jan 2023 11:40:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230126104018.cbrcjxl5wefdbb2f@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="745g4enuyskp2rff"
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


--745g4enuyskp2rff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-01-26:
A fix and a preliminary patch to fix a memory leak in i915, and a use
after free fix for fbdev deferred io
The following changes since commit 2293a73ad4f3b6c37c06713ff1b67659d92ef43d:

  drm/i915: Remove unused variable (2023-01-18 13:33:15 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-01-26

for you to fetch changes up to d6591da5f3ff284a376d56b5f7a48a34e9cb159d:

  drm/fb-helper: Use a per-driver FB deferred I/O handler (2023-01-24 11:13:08 +0100)

----------------------------------------------------------------
A fix and a preliminary patch to fix a memory leak in i915, and a use
after free fix for fbdev deferred io

----------------------------------------------------------------
Javier Martinez Canillas (2):
      drm/fb-helper: Check fb_deferred_io_init() return value
      drm/fb-helper: Use a per-driver FB deferred I/O handler

Nirmoy Das (2):
      drm/drm_vma_manager: Add drm_vma_node_allow_once()
      drm/i915: Fix a memory leak with reused mmap_offset

 drivers/gpu/drm/drm_fbdev_generic.c      | 15 ++++---
 drivers/gpu/drm/drm_vma_manager.c        | 76 +++++++++++++++++++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_mman.c |  2 +-
 include/drm/drm_fb_helper.h              | 12 +++++
 include/drm/drm_vma_manager.h            |  1 +
 5 files changed, 76 insertions(+), 30 deletions(-)

--745g4enuyskp2rff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9JYkgAKCRDj7w1vZxhR
xdVKAQDebeiVMYssc2ptHJYRlG4+9pFxMo533C8PP4kue2AQogEAg3gi4Kax1N9z
MuAbO2+lgs3FxAGNWA9184phQB1VAw0=
=O/FB
-----END PGP SIGNATURE-----

--745g4enuyskp2rff--
