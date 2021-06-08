Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854D39F9D8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5B56E1B3;
	Tue,  8 Jun 2021 15:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB1C6E1B3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:03:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B64965C012E;
 Tue,  8 Jun 2021 11:03:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 08 Jun 2021 11:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=9uxUaFYZ+DQ2h7cod7sdDbU03oQ
 7ZNjk02RDTPiDk1g=; b=u1rkJw7DK/Vi7SA9ePKcxrHelbyQudRRd1kqBGi3aGO
 eUmSqtCsHiEfay5TJR3xMkVB6PvpSFvVstQ3F+BtMHgCkvszXNqI8gwwVfQpQ675
 tTQKdvX5iS4fIwTOMkpimQrcNeTqcpaukhf/xGm9LaY7Y+tPudwNDvuFfYOuAhMO
 3Oj8fnrXybrYsb90+2twzMd0mIlkGjjPv1BBiBq2Is0bsEqOVM1kRLJYvMfkqBif
 zIbIn0m5Hue6IvWgc5HEvXOw30b23nw/S/Fe6CK1L0I2/irbLbluZrgSSM9epi2i
 nZ7ABuSMIvxHToI5d8qYd1hbo64vEuw0T7ESvep03Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9uxUaF
 YZ+DQ2h7cod7sdDbU03oQ7ZNjk02RDTPiDk1g=; b=j/U5ccdc8x/hNkZPGZcWZi
 7avkH36rK50w4VjKB9eiFzYcQJYhjD22WJTfK0h9JSw1Grj/sf5C1a5vvUI7YNyS
 W86kDV+zEixnV7+yeGYoOcjtMZbRefw5lKaeZQbJslX1jU2BqF9Ve+44HGfHjdqm
 g9JagBZiCN3kAz6c677rShZBjp3/q3ekToJxzxdKIFj6J2/ZvfYtLCAOmAyCV/F6
 MObPT5XLGl6hST820I8jFH858kFzMyo06HhH54ED7XozDj3PYi+wKDGbflqmS4oR
 7qq6plP5nQSKd+8q8+yWwfq/tg8FrHd3JTgihhrROs/j2gBO1yknPdSw952qKfcg
 ==
X-ME-Sender: <xms:r4a_YO-V9DiWibq_UCHjvcArxUfSoVp-iZxt-xFDxPoG39TiXVB2sQ>
 <xme:r4a_YOusIsGZYI7oCDLebpZVjK3puui4uHLA1qko3A2l9E-XO7BmrZ4-GeZ67Nk2D
 m5S3U16jabtRQnikMA>
X-ME-Received: <xmr:r4a_YEAaI40bIsBTT01Z56w6Y9LIud9RRD1js9K6tJmxI-EG4S66TRL27_eMq_kRsg2rK1d0mXbWPsgwarm2MWLz8TI7SvdM90NU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:r4a_YGcZa5k8Tuhx-uyCMTexk909l23wetvuObKpqcqP2kE_ZGsn_A>
 <xmx:r4a_YDMfpIRCHbvx4T-VAl1AKWoWr63IO61YTSA3R0XwAozWoJL5bw>
 <xmx:r4a_YAm302vVN0Uzm0U-K3Ci-meWZ3nPoNUro2VOq5O8GDdb72JAAQ>
 <xmx:sYa_YMgSzTgPFat4WntmzKVfViN6JEIWv7RXyv9A8q0GQGRM8btbXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 11:03:11 -0400 (EDT)
Date: Tue, 8 Jun 2021 17:03:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] drm/vc4: fix vc4_atomic_commit_tail() logic
Message-ID: <20210608150309.ggoffedtwntkcoxz@gilmour>
References: <20210608085513.2069-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="62jyrdut76dhr3o3"
Content-Disposition: inline
In-Reply-To: <20210608085513.2069-1-mark.rutland@arm.com>
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
Cc: Emma Anholt <emma@anholt.net>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--62jyrdut76dhr3o3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 08, 2021 at 09:55:12AM +0100, Mark Rutland wrote:
> In vc4_atomic_commit_tail() we iterate of the set of old CRTCs, and
> attempt to wait on any channels which are still in use. When we iterate
> over the CRTCs, we have:
>=20
> * `i` - the index of the CRTC
> * `channel` - the channel a CRTC is using
>=20
> When we check the channel state, we consult:
>=20
>   old_hvs_state->fifo_state[channel].in_use
>=20
> ... but when we wait for the channel, we erroneously wait on:
>=20
>   old_hvs_state->fifo_state[i].pending_commit
>=20
> ... rather than:
>=20
>    old_hvs_state->fifo_state[channel].pending_commit
>=20
> ... and this bogus access has been observed to result in boot-time hangs
> on some arm64 configurations, and can be detected using KASAN. FIx this
> by using the correct index.
>=20
> I've tested this on a Raspberry Pi 3 model B v1.2 with KASAN.
>=20
> Trimmed KASAN splat:
>=20
> | =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0x1cc/0x910
> | Read of size 8 at addr ffff000007360440 by task kworker/u8:0/7
> | CPU: 2 PID: 7 Comm: kworker/u8:0 Not tainted 5.13.0-rc3-00009-g694c523e=
7267 #3
> |
> | Hardware name: Raspberry Pi 3 Model B (DT)
> | Workqueue: events_unbound deferred_probe_work_func
> | Call trace:
> |  dump_backtrace+0x0/0x2b4
> |  show_stack+0x1c/0x30
> |  dump_stack+0xfc/0x168
> |  print_address_description.constprop.0+0x2c/0x2c0
> |  kasan_report+0x1dc/0x240
> |  __asan_load8+0x98/0xd4
> |  vc4_atomic_commit_tail+0x1cc/0x910
> |  commit_tail+0x100/0x210
> | ...
> |
> | Allocated by task 7:
> |  kasan_save_stack+0x2c/0x60
> |  __kasan_kmalloc+0x90/0xb4
> |  vc4_hvs_channels_duplicate_state+0x60/0x1a0
> |  drm_atomic_get_private_obj_state+0x144/0x230
> |  vc4_atomic_check+0x40/0x73c
> |  drm_atomic_check_only+0x998/0xe60
> |  drm_atomic_commit+0x34/0x94
> |  drm_client_modeset_commit_atomic+0x2f4/0x3a0
> |  drm_client_modeset_commit_locked+0x8c/0x230
> |  drm_client_modeset_commit+0x38/0x60
> |  drm_fb_helper_set_par+0x104/0x17c
> |  fbcon_init+0x43c/0x970
> |  visual_init+0x14c/0x1e4
> | ...
> |
> | The buggy address belongs to the object at ffff000007360400
> |  which belongs to the cache kmalloc-128 of size 128
> | The buggy address is located 64 bytes inside of
> |  128-byte region [ffff000007360400, ffff000007360480)
> | The buggy address belongs to the page:
> | page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 in=
dex:0x0 pfn:0x7360
> | flags: 0x3fffc0000000200(slab|node=3D0|zone=3D0|lastcpupid=3D0xffff)
> | raw: 03fffc0000000200 dead000000000100 dead000000000122 ffff000004c02300
> | raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> | page dumped because: kasan: bad access detected
> |
> | Memory state around the buggy address:
> |  ffff000007360300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> |  ffff000007360380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> | >ffff000007360400: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
> |                                            ^
> |  ffff000007360480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> |  ffff000007360500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> | =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Link: https://lore.kernel.org/r/4d0c8318-bad8-2be7-e292-fc8f70c198de@sams=
ung.com
> Link: https://lore.kernel.org/linux-arm-kernel/20210607151740.moncryl5zv3=
ahq4s@gilmour
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Will Deacon <will@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Applied, thanks!
Maxime

--62jyrdut76dhr3o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL+GrQAKCRDj7w1vZxhR
xYjaAP99sIC/Te+afa4YPVj30ky5lhFJpF9/MrlMUmKIWa/JnAD+KjMNv0mKXWPZ
JZz2Ue9Sdn7cbovemU6yOjEJoF2bDAM=
=ZRlj
-----END PGP SIGNATURE-----

--62jyrdut76dhr3o3--
