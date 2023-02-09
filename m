Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440369023A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADBE10E957;
	Thu,  9 Feb 2023 08:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E1010E957;
 Thu,  9 Feb 2023 08:36:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E5CF4581F5B;
 Thu,  9 Feb 2023 03:36:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 09 Feb 2023 03:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1675931763; x=1675938963; bh=VI1F6qQwdnd2e/jklyUoxXjZqqg0CwEfy3v
 gBWoA9XE=; b=LJP6WhY3JUuLN3032F4mQEvNtoV0gpe7Afcb5aDE8XSeBgcFP/K
 jd1tBJ+EQXrA3t5m7q5/9qJ4i59t+GO6qYDjmGJPsO/tcuXTYYVmtXccREs0VJek
 g2eh0nOuGiI7Jt5oA6vCXzqcxxl5xB1Jt+Eq6VFlPJnV1IhfbBNJksGQB1QnFVFw
 RJ93ntQbQSme6YRCyqoIJts8xuFAi8DNSzyaiTlXub8n+VNeXafFjzS5tg2QFCwg
 FGD5j7ISJKwAeeyIh0toxlMhifsFcF3dOzmH70ulLr9ZPVmPFH5OEOUDywD3gVQ+
 eonPMrh1xHL9xyThYUaweVG485xhafRwX1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675931763; x=
 1675938963; bh=VI1F6qQwdnd2e/jklyUoxXjZqqg0CwEfy3vgBWoA9XE=; b=C
 Q1T5jCRyvTJhVGRK+sRvUZLYcqB7JWE9FVXhqhzUiJEFokpkoHJDdpLgfiKS/CI7
 TV8CyCU5ga5tigpmS18RjauXn2dxvvTLodqR3SX+tqHi7goJXdM8UGBu9IRH9aeG
 0wS2Lz1oWASrn20v1lKg+Zgri8dJDM7QabXe4tS+lMcazEUtJ4AxcabasdSaMzMW
 7Z9sMdTFlDJ6C6kY9Z+gXqfMWEzK4qvJ5q4HlNLwuANOogUWyGwnFtyHMEscetyE
 714fYEm/HuzUb3r/xql2RISjQz3QF6HH6rM4D635zJBYStcddM2fGCnIYxJ8bLam
 /NZrqoE/TJto3QbskCPZQ==
X-ME-Sender: <xms:c7DkYwadd3jmK2xCOGylQvPITAVnmfbfaVW_lA8qxR75XwFvxSdiYQ>
 <xme:c7DkY7Zbf_8DHL0c8OaYY8U4Xd4sz5gAkrqhAZikz-B9C4BEIexLSIk4J7sFHdBaU
 -_NBmuKV5oPu_f7YjE>
X-ME-Received: <xmr:c7DkY6_ox4x2DDMtRcrIe4Zr3NDkZOMLRUx3QRo_WTLvk6u3dJZMTyrJ5AHNqa2njFKTsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:c7DkY6q4YhRmtWyXWrXZXpa6VVg1Z0jy8S-HUUCRM1hxebxcwBtw6g>
 <xmx:c7DkY7og7URyQe1KCoA3Rx9zKdqC5nSoCgHaGbt57MPKkUtrAa9L4g>
 <xmx:c7DkY4SnvFyf3QgUfzsW9pYtMks1bTepH3haDLrIQ7vxZz5JI6AaBA>
 <xmx:c7DkY0ayDbNO7DMYSILAb7gjfmpv-6KWkkoIi-aZ6Ju2h0Qmhclzng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 03:36:02 -0500 (EST)
Date: Thu, 9 Feb 2023 09:36:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230209083600.7hi6roht6xxgldgz@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u3oitxqnyciu556w"
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


--u3oitxqnyciu556w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-02-09:
A fix for a circular refcounting in drm/client, one for a memory leak in
amdgpu and a virtio fence fix when interrupted
The following changes since commit a3ee9e0b57f8ecca02d1c16fad4941e09bfe2941:

  drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable (20=
23-02-01 11:41:15 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-02-09

for you to fetch changes up to 85e26dd5100a182bf8448050427539c0a66ab793:

  drm/client: fix circular reference counting issue (2023-02-07 09:42:56 +0=
100)

----------------------------------------------------------------
A fix for a circular refcounting in drm/client, one for a memory leak in
amdgpu and a virtio fence fix when interrupted

----------------------------------------------------------------
Bert Karwatzki (1):
      drm/amdgpu: fix memory leak in amdgpu_cs_sync_rings

Christian K=F6nig (1):
      drm/client: fix circular reference counting issue

Ryan Neph (1):
      drm/virtio: exbuf->fence_fd unmodified on interrupted wait

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |  5 ++++-
 drivers/gpu/drm/drm_client.c           | 33 ++++++++++++++++++++----------=
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +----
 include/drm/drm_client.h               |  5 -----
 include/uapi/drm/virtgpu_drm.h         |  1 +
 5 files changed, 26 insertions(+), 23 deletions(-)

--u3oitxqnyciu556w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY+SwcAAKCRDj7w1vZxhR
xU/NAQD1IHX9BnOcsLN7opP6XSCjNMuzwU67vm17u1g+ZhMArgD+Jw6tPIzZqMBT
izRNyZFor67fPtDnnFQ2P3YgMdqdLgs=
=Wo3Q
-----END PGP SIGNATURE-----

--u3oitxqnyciu556w--
