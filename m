Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FC60A6FF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7A910E3C0;
	Mon, 24 Oct 2022 12:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A0710E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 12:43:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5782A5803A2;
 Mon, 24 Oct 2022 08:43:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 24 Oct 2022 08:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1666615406; x=1666622606; bh=PA9s8+uu97uqEdJ+Sht6ZeSGV7LRvhOvpDC
 f8dGKBQg=; b=pDHGVodW7TkvB2bghs7DOitx7AgeNrF3kxGE4oR6dCyjtFyc/ij
 96PVyeSvYbkp1Y4ILpPBqvbaEm2lOdoquK5igVmzSxM/KY/dYmlTao8pDmTn3ua8
 J4Cu2G//l2OzoRf6F44/8FhIBbRK3llr9P2WoEWy6zmFmR6v5b638nyCDiW35egP
 R0SmezXxlijPQ9c2LAuHgvTW82OjwaWKscvGAcZScGsFhHsMHY1wHpi9IExa5nPg
 jdtSCzrs954in2RmciETVB1OIA1eTd6YTpaetttd0mEV/Ud5eKm1gmoIATsxjZ66
 zst0k9w55RkWblFUNspwrRiRNG9J1OGAsLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666615406; x=
 1666622606; bh=PA9s8+uu97uqEdJ+Sht6ZeSGV7LRvhOvpDCf8dGKBQg=; b=f
 bJxMpoYIlLOS5+pYjMoLyU+rFpLvzr1G7CohugLoo4Q1nKcLqXf97RPHnPIHtto0
 eGtWcKrAQZiB6sMA12PcO+emSgRJ7CPiXaBv2b5mzj4LBSL/ASp3+OLpG3dau8Xy
 nVJXlhAc2jIatLLw+ALhlGdTX9iEwhipbHGyLlJzTGboIKWlZmJOFGzhqoYgfZEd
 a3Y8R8grzbZ7P3RLMLeZ+pXBHbg7zh5+779FzQf7mLVEtnNRxj1EFvJEn0vmDPCI
 oAetyhZgWD/hMkKHZHw5I+x+F7Rvo5U9ETiOhOrXhaNSwcS/P5Sh3DnAyUgWhATW
 02HwT6/YEqagvk0QcN08w==
X-ME-Sender: <xms:bYhWY3pI-MSEF0HG3d-9r_vIzAzkaL23Fg5XOBFvaTCdUjExJiWf-Q>
 <xme:bYhWYxqUQtMW5flM53zPguCyw9x8sklcClA5BewM4G_HWAoPntZZZIrB4Cg08FF-A
 9ae4QAwW2wEzDqzZiY>
X-ME-Received: <xmr:bYhWY0PDwM855a4ERVBZf-FdLLhRAO0bZGDT64H0qnPzqACmGJMmFNsuN1ssu1vO1TTOfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepmhgrgihimhgv
 segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpedugfdtkeelvdegkedugedvud
 ekhfffteeikeduvddufeevudefffeffeejieejleenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bYhWY67BKAUmYbFsawLt_X4b1Y9fnV7P3DzixYOvAxr4IgoMV1qWMg>
 <xmx:bYhWY26PCH0HY8OaMUdneunc1kH23RDNN0ZFnZQrs27nw6L6WWRRww>
 <xmx:bYhWYyiC0AuTDarJbYkYfU8bRmXLsnNczrnCblQ4L4T7po0nX-mldA>
 <xmx:bohWY7m0qWHquM7frtYDD54oD2NROM8_nG7MjKEE8ip5dwDPGmdeoQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 08:43:24 -0400 (EDT)
From: maxime@cerno.tech
Date: Mon, 24 Oct 2022 14:43:23 +0200
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
Subject: Must-Pass Test Suite for KMS drivers
Message-ID: <20221024124323.tfyxcadyd4nz56jz@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2dmxmodhjaajdztg"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Martin Roukala <martin.roukala@mupuf.org>, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2dmxmodhjaajdztg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've discussing the idea for the past year to add an IGT test suite that
all well-behaved KMS drivers must pass.

The main idea behind it comes from v4l2-compliance and cec-compliance,
that are being used to validate that the drivers are sane.

We should probably start building up the test list, and eventually
mandate that all tests pass for all the new KMS drivers we would merge
in the kernel, and be run by KCi or similar.

I did a first pass to create a draft of such a test-suite, which would
contain:

igt@core_auth@basic-auth
igt@core_auth@getclient-master-drop
igt@core_auth@getclient-simple
igt@core_auth@many-magics
igt@core_getclient
igt@core_getstats
igt@core_getversion
igt@core_hotunplug@hotrebind-lateclose
igt@core_hotunplug@hotunbind-rebind
igt@core_hotunplug@unbind-rebind
igt@core_setmaster
igt@core_setmaster_vs_auth
igt@device_reset@unbind-reset-rebind
igt@drm_read
igt@dumb_buffer
igt@fbdev
igt@feature_discovery@display
igt@kms_3d
igt@kms_addfb_basic
igt@kms_async_flips
igt@kms_color
igt@kms_concurrent
igt@kms_cursor_crc
igt@kms_cursor_edge_walk
igt@kms_cursor_legacy@basic-busy-flip-before-cursor
igt@kms_cursor_legacy@basic-flip-after-cursor
igt@kms_cursor_legacy@basic-flip-after-cursor
igt@kms_display_modes
igt@kms_dither
igt@kms_dp_aux_dev
igt@kms_flip@basic-flip-vs-dpms
igt@kms_flip@basic-flip-vs-modeset
igt@kms_flip@basic-flip-vs-wf_vblank
igt@kms_flip@basic-plain-flip
igt@kms_flip_event_leak@basic
igt@kms_force_connector_basic@force-connector-state
igt@kms_force_connector_basic@force-edid
igt@kms_force_connector_basic@force-load-detect
igt@kms_force_connector_basic@prune-stale-modes
igt@kms_getfb
igt@kms_hdmi_inject
igt@kms_hdr
igt@kms_invalid_mode
igt@kms_lease
igt@kms_panel_fitting
igt@kms_pipe_crc_basic
igt@kms_plane_alpha_blend
igt@kms_plane
igt@kms_plane_cursor
igt@kms_plane_lowres
igt@kms_plane_multiple
igt@kms_plane_scaling
igt@kms_prop_blob
igt@kms_properties
igt@kms_rmfb
igt@kms_scaling_modes
igt@kms_sequence
igt@kms_setmode
igt@kms_sysfs_edid_timing
igt@kms_tv_load_detect
igt@kms_universal_plane
igt@kms_vblank
igt@kms_vrr
igt@kms_writeback

Most of them are skipped on vc4 right now, but I could see that some of
them fail already (kms_rmfb, core_hotunplug), so it proves to be useful
already.

What do you think? Is there some more tests needed, or did I include
some tests that shouldn't have been there?

Thanks!
Maxime

--2dmxmodhjaajdztg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1aIawAKCRDj7w1vZxhR
xaG/AQCQB4q4ubcOyjczAsYRbONVmM5omzkz0TOL8W0auwZzAgEAmoIby8HLuxgq
Etd9UuxGcj0qeLCETV9ql9OddgrMdgQ=
=g52/
-----END PGP SIGNATURE-----

--2dmxmodhjaajdztg--
