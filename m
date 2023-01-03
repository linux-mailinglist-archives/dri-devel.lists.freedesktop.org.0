Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3EC65C23C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F35C10E05F;
	Tue,  3 Jan 2023 14:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004BB10E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 14:49:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 9DFA22B06765;
 Tue,  3 Jan 2023 09:49:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Jan 2023 09:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1672757369; x=1672764569; bh=0U8Dc4iCaL6C9vbYyR27QO6ej8UD7Qm71qF
 u47CiqGI=; b=bMuNGTn/bW42fVpm/AlA1Jl4Ba0g0oJ6zpV00K4yh8FOhHcOlV4
 y8EiIF4X+zqB5s07dtL3j0AMwLLyUq+OiGLGZLViKIiSfhMttngMRB/9DB2yTGc3
 ZRCNyHAfohm+0ia/BF1zhjWx9SwDqnG3zrMoPVKNohevIiv+RbB/5MU7UWM32Z8S
 gQYcaq8sbEUAshF1jfRnAlifglbKIS93BSrmEDMamvodT5JzpCo8A4JdiGW6Ii74
 dcrXNQC4qVALojwxRlnJr752Ou7crx+hjVQ7GjE1s6nvRpqiDNwjIM7/kGF+TY2j
 JyJ9i+mtsG9RDzcJRE7Vyfnwo8a4RqlMpTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672757369; x=
 1672764569; bh=0U8Dc4iCaL6C9vbYyR27QO6ej8UD7Qm71qFu47CiqGI=; b=P
 x+aDsqDROIFBnX2ATdDZ59g5eZwizyLHx3McwaCJ2FQoU+err1FBZj36U1pg9lrE
 z7mRAwKHlbcMwtr7q5IKZL8Kl5nZ9/kiBskzZRZiP7i79fEp9qBLLQE6jCY9jAus
 5lBMWBPaowt7y8unCaucpNyNI8jG9ydzYSsBcR9M8QXDqSaOmAmRQihMBcvSQJTC
 QA2N2PDTU9Sc8B2dCALkT1kRqq2KI74SUeNXaX6lmCKisKi9dILxIDc+SX0t5+Wa
 n1OK3+RE43HvT0lz2gmRE5e/kysMj8xNoN6XdyGVm0vORiYBlZCr6tnqwnZly1Ve
 H2NlTwFziK5SZdl1p3PAw==
X-ME-Sender: <xms:eEC0YzhWVj5Pu9AIKO1F1fC4xWxbmznNfq1bf_deOxSwxrH-m9Xp3g>
 <xme:eEC0YwAiz2-zafDwBq5UZX0RGN1TbwUVFrx9IGoTW3V_6LVs687jGrPJgUayhFtfJ
 UcZ13GGGyf-VCmaYBM>
X-ME-Received: <xmr:eEC0YzHSHQNljVIymFR7M8d8NTbw49oknea9NdCbh-yHExUnF92xG_HKVlY4V54imFfMeOroHantTdQqMEsHCgT4FbrPN8is8rXM1vur60NZXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudevjeei
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:eEC0YwTxmaYIXN_ECOYmpA0__-9ZMNMmpY3F9T3KqVZAIR4jVrjaCQ>
 <xmx:eEC0Ywz7CCJg4Qe8kzpalZ3hXMZKzxLTcDMGsVKIpTJ_7dLGTCiK_Q>
 <xmx:eEC0Y25IVucFDWli_yrkErmKdIioLLKzf3DyxukzxNrGzBIdOedBHA>
 <xmx:eUC0Y3jsCraBnKQzBsChCK9iWhWfnkUQ7q1bQ9ooGHaj4Z1lmnWgY4jciQg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 09:49:28 -0500 (EST)
Date: Tue, 3 Jan 2023 15:49:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20230103144926.bmjjni3xnuis2jmq@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r4krfhntoipmnwy5"
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


--r4krfhntoipmnwy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's the drm-misc-next-fixes leftovers.

Maxime

drm-misc-next-fixes-2023-01-03:
The drm-misc-next-fixes leftovers. It addresses a bug in drm/scheduler
ending up causing a lockup, and reduces the stack usage of some drm/mm
kunit tests.
The following changes since commit b02897e56b4e1fa6445be695ce5d605bb098435c:

  Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper" (2022-11-23 09:11:32 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-01-03

for you to fetch changes up to 03dec92c4f788c54a7c01b40a018f601eb8a6c52:

  drm/scheduler: Fix lockup in drm_sched_entity_kill() (2023-01-02 17:45:18 +0300)

----------------------------------------------------------------
The drm-misc-next-fixes leftovers. It addresses a bug in drm/scheduler
ending up causing a lockup, and reduces the stack usage of some drm/mm
kunit tests.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tests: reduce drm_mm_test stack usage

Dmitry Osipenko (1):
      drm/scheduler: Fix lockup in drm_sched_entity_kill()

 drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
 drivers/gpu/drm/tests/Makefile           | 2 ++
 drivers/gpu/drm/tests/drm_mm_test.c      | 6 +++---
 4 files changed, 8 insertions(+), 6 deletions(-)

--r4krfhntoipmnwy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7RAdgAKCRDj7w1vZxhR
xTwJAQDhD+Gn8Zs+WsCoFUVYBUCTdWvjj4fgowvuFw0e2mL0YAEA5lrHa0bPDyQN
KfPdB9Ue7ep3XHHYbvIr0Uz91Rq+yws=
=oNgP
-----END PGP SIGNATURE-----

--r4krfhntoipmnwy5--
