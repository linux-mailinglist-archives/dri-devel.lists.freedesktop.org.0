Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A734E65A1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978B710E8BF;
	Thu, 24 Mar 2022 14:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D565710E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:47:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DFD743200F9C;
 Thu, 24 Mar 2022 10:47:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 24 Mar 2022 10:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=KhQaqrg/wmhXmI2EC3IGdhkeXNaB6heX02XEwi
 tkkXY=; b=bbu1/zm1XuI/dAbFTN4tpfeEPnkeM+ZJ9YGRIj9GnlOHqoJT9XLo+5
 T6wI3ySQIVDD+4L/bhrojO7ASKc+/rYfu4G4AIXdjkuJWm25ukUhHkyRBctcqja7
 j0pVIZTru4xyf0mLvysFJVj6fuXwcnJkZRctbbfWl4Gax8LYjHjYIU+N0LJxiFoQ
 6iALp4S7OFDBZkzbnF031QFg62TvePczLzZlb5vGFmavJYySOCD+2bbpXX/BJGUl
 tCckhsMp/tSJeN0FkWItDbOHiOi261j92c8y51AZKjqlrech1EZxKgoMm90iETN8
 ocGHFczsdzI5lkjYXlxTgwS+BY2Lr89A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KhQaqr
 g/wmhXmI2EC3IGdhkeXNaB6heX02XEwitkkXY=; b=W8O6zk57tgcnf2wIAOjJFq
 rZgfx+uy4wELNdiSsoihDgXZv3tJqdFAWja7v8MdrWDoZfymH073AbqwZKQYdAwN
 s0P8G5RPq1Wmavbc+yjd4pgl2p9uXdPOwLz8u3/6CegCZGDDR37PQeWvcmd1qXNU
 8fSORi4AM36fHWxBMNiHJVgzuK7GxBmu2+nWnKDDjMKl9NkqqZUosk7XJtwMkr0E
 zhKKmpQZRMkvoLQv0BWDxw7MHvIorgThpIWyGkR/5RhaIn8zJwMPJPLpf9emuUxI
 OJeLj2N7Z2GTwgB/O7AuU06qnwQ7BzQ2Tw7FM4qjYJ2ffGtMVYEaFJkM8ZdRKoMg
 ==
X-ME-Sender: <xms:foQ8YtAqB42NBo9w_SWFQKTjMnoHyuwK_qhJMv1NoaokofjLVeb5mQ>
 <xme:foQ8Yrg2OpzVgmyNN0R1xPs-gTaH4BVcCa8WOLHfkX9fuccsrc6Otw7_X1t3VOtCY
 ZGSXW14OXtee0jq8yA>
X-ME-Received: <xmr:foQ8Yon08sqeq3h62fqKLx1-pX98y2rJChIEeC5wGTUtr8JjFd2RiHsUygRZUlBDnTFkyklgY1SEPqVNHa-F4M674Du14GeXl-hmqd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:foQ8YnygVDKfDnlbx4Saqaq5LJWsFyHvYJC5zgB8kj9L51qTtW1okw>
 <xmx:foQ8YiSByywtKyoKkA9Yy4qprELj1fqanCmBp11tusEnDl7z441tOw>
 <xmx:foQ8Yqbwwq7T06x4xyF0H8P3B4LkYvKLsgwvBWXDevCcPKAB3Qq79g>
 <xmx:foQ8YoONKo1ypfdLeBoUfLc412r3kXmmP0Sh-wemLmU0DBigaOABYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 10:47:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/atomic: Atomic Private State debugging
Date: Thu, 24 Mar 2022 15:47:20 +0100
Message-Id: <20220324144724.1306133-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
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
Maxime Ripard (4):=0D
  drm/atomic: Print the state every commit=0D
  drm/atomic: Add atomic_print_state to private objects=0D
  drm/vc4: Constify private state accessors=0D
  drm/vc4: Implement atomic_print_state for HVS channel state=0D
=0D
 drivers/gpu/drm/drm_atomic.c      | 24 ++++++++++++++++++++++++=0D
 drivers/gpu/drm/drm_atomic_uapi.c |  3 ---=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 24 +++++++++++++++++++++---=0D
 include/drm/drm_atomic.h          | 13 +++++++++++++=0D
 4 files changed, 58 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
