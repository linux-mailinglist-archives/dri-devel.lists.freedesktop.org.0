Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684414E96E0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E410E446;
	Mon, 28 Mar 2022 12:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B7C10E446
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:43:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9A09F3200645;
 Mon, 28 Mar 2022 08:43:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Mar 2022 08:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=VZy6X4sb5kLh5biHgGees4qzPf0btkrmGTvg62
 9ef8Q=; b=W1d5zQ32RdQw/m2Zxa8O+ua67wQcDx2DtA9Yim9184NAfbG3ZDBY9Z
 Z/EUyzCgnxRHhr5PS/BpWoZAUTrOOgPmWINdIBldLf0cB8CHR6gCCIDK89t6aYTt
 FGN2Wna3J2rvAfV6SIcQ9c3Q/s8WhZZBsrmQNUhkv+DNlD5x8AsD7EUl4tXpjhgY
 MyLUNOXxjOhT+N9qu31R22R7jm5hN/Rv4uPfCvvlDTPDOtddRPsbckneiWODi4bf
 rQsmVlgWpAdycQhrb+m+Rls/mj09Ch7UGK06TaM4j4B4JCl/gNI4F7z26+mSQEeQ
 g/logc5d2zk5u2giTa801lJuv/xDLjsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VZy6X4
 sb5kLh5biHgGees4qzPf0btkrmGTvg629ef8Q=; b=amRh7gF05Ddp0Trq0887NE
 uimnZbNVScNsZwPpJvorB9+t+aSv20LsN7WdHJVU+yUJWUF80FC/faapuPqRTwSn
 IqR0/5rYT1WPT62owfRF1rQb5DuBdbG9wLgmES5wJei573GWmqUXmjIa/z2HYf8R
 iipdfrcntB2ElkTpD7AVNspC/2KGDk4AQU9F62Gm49zb31aKOedKxWxOxdLSX+XM
 9WaaGHaQaOTDESv+XwVQfYpRolf8J3P8COLfJe9vjh+apkrlZTBxbr0dCzXY0gll
 XJtXGWQDd7jEb8EFs4G4MgX685CyJoubwaUqX8lM9+Qa3Y5wq3+CZgsBuarGPhYA
 ==
X-ME-Sender: <xms:W61BYuLX8-FpfREkxj22G1-Lt4AKu6GK4Z4yu-dx9tz9eAsIFg8YwQ>
 <xme:W61BYmITFpGcCvBrBzQKWr-8OFpPxzS-7VFXt1fDysugBWlzRytBkR28Zr6jTUMBK
 NHD2QICFmELUraw46M>
X-ME-Received: <xmr:W61BYuukiG0gaoenO10X5c9DdHYpljuOm_LQO4r3KWkTD2cJIMWbVYC_TSMdXve4pg_20-jHuLqgUfsrjJhWEpibj9FQNK2UEO-Ezoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W61BYjbG4H6iXBvPnT-jIYG7ock9xxEoO-L9J5vmsDrTmhZDdfNB5w>
 <xmx:W61BYlat1METep3kgBrWvvuN3MkfD931rJKMms0Uz7Hpym1LIJJUPw>
 <xmx:W61BYvCtd3uGjTorxsBFwbRP4msQJFepGDXNb60RQ4P2Glez5qJfjg>
 <xmx:XK1BYqP5boT1megbdeZ9HIzhvcn2N_iC8jVP4JDzLrQ8ktx8MEtEoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 08:43:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/atomic: Atomic Private State debugging
Date: Mon, 28 Mar 2022 14:43:00 +0200
Message-Id: <20220328124304.2309418-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This series adds an atomic_print_state hook for drm_private_obj to ease the=
=0D
debugging of driver-specific sub-classes, and adds one for vc4.=0D
=0D
It also changes the call site of drm_atomic_print_new_state to make it more=
=0D
consistent.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v2:=0D
  - Reworded the commit message of the first patch=0D
  - Printed the state before running atomic_check=0D
=0D
Changes from v1:=0D
  - Added Daniel tags=0D
  - Added drm_private_state documentation=0D
  - Fixed unused variable warning=0D
  - Removed the drm_atomic_nonblocking_commit() logging=0D
=0D
Maxime Ripard (4):=0D
  drm/atomic: Print the state every non-blocking commit=0D
  drm/atomic: Add atomic_print_state to private objects=0D
  drm/vc4: Constify private state accessors=0D
  drm/vc4: Implement atomic_print_state for HVS channel state=0D
=0D
 drivers/gpu/drm/drm_atomic.c      | 20 ++++++++++++++++++++=0D
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ----=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 24 +++++++++++++++++++++---=0D
 include/drm/drm_atomic.h          | 27 +++++++++++++++++++++++----=0D
 4 files changed, 64 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
