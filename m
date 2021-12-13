Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6747327D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FCE10E7D9;
	Mon, 13 Dec 2021 16:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842FA10E79F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:56:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B26305C008D;
 Mon, 13 Dec 2021 11:56:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 13 Dec 2021 11:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=RBPg1q5PsgkemghkFGPmaPTBiD
 kPt/bLLsNcYY8EVyw=; b=S9GAiAAmP7dL04A6mEfqCNFQ3X48yavKoRCjFx8iOQ
 hnd4+uFr8ft3+cIHpqZxxfthtHewTdAjRx2w0JuhRHhq2vONTZvVWcilZAuRgVId
 9svr+AOMCgj/jWZJhZT4nrtypheCVD82Bok4P8gyEycJz0JhOZm9hRU/pSN5a9Np
 l1uFebBEuOUr+2ROBkpUbgYMTRbv+UK9Eydq0/ZjeB8uLHFkuIYu0oSyQckStI1H
 6w23EJOvMoJdBEVRlVE7daLDV26IrQZoO3NtwMe62W3cbMXpsxbJftalnlNr6jgm
 2l2baedIvshwQPrBifocVxCcyfBQ8YSgx8AlduZjGJoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RBPg1q
 5PsgkemghkFGPmaPTBiDkPt/bLLsNcYY8EVyw=; b=eOFti4P4Vg6JXjGhjclYUM
 BRczJvd2/G+Quqo2Jn2FA9snymXyVn9Sf1ngwSFsRzMuuMvYUuEvG91mun2Vtfwz
 +85nzzfLcPvx0NmdmbDwtXBGGhTA+nLHZ9YizQu+LgRkfv9F7MMMeInhE+xwq//Z
 aMDHw6Xt4TrQcZ5BdhKZM7OB++Sifj7xlzVaWU3r2cmY+IXMsnMNCGYHIOjLCPIG
 IL0fjC1bNAofV2XOnaGcPPI2nr8F6I/DJL6cvkGlEtsbEC8Cc8r9GHDxYWsnVe+S
 gnD8O5qXP5Jd0G0muHu4TYDkv/WAryrhfV5ko15x59Pe0PqSp8HUset23F4wH/Fg
 ==
X-ME-Sender: <xms:Qnu3YfjAgYNYy7mCEdgKmoWMUQCqKgESnUqdLPLqS7S7EzDpgorSrQ>
 <xme:Qnu3YcAVNM6xcqmwjlVXXd0reiCUGRa67fhL3V_apc3bhT4QYeSePr8sV_Y9wi_2U
 ZTdxwiP9vHOle11hB0>
X-ME-Received: <xmr:Qnu3YfEaGBwR-AyIs-lDovaL8kY9Z9dIcmXFEgU-dvp3a30BFkgtXgKp-HtHbBVL7cULxxwqtj_dGkGCF_tkLAUsBanjnGKJRkXOVW_d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Qnu3YcRqh7cBHu094xZRIXRAB49KpTfKbyl80BgwRNvMqvn1Cetlog>
 <xmx:Qnu3YcxRiG-rI8Y_yFWRdreJfVd0VwzyOU1um3u1v4xPEdUYMEuHEA>
 <xmx:Qnu3YS64fscVJ-GXNjA70Uwvp6dKDpqiMEiA60AW54LgS60L72P_9A>
 <xmx:Qnu3YbmhNx9uKne5UY6k7zhgp2kw0gE6vlNY6f4wNtXHaD4kDXUjNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:56:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 0/3] drm/vc4: Support for 30 bits YUV formats
Date: Mon, 13 Dec 2021 17:56:29 +0100
Message-Id: <20211213165632.255283-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Here are a few patches adding support for the P030 and the BT709 and BT2020=
=0D
colorspaces.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v2:=0D
  - Fixed Dave email address=0D
  - Fixed a typo in the first patch commit log=0D
=0D
Changes from v1:=0D
 - Reworded the format description=0D
 - Fixed use before initialisation=0D
=0D
Dave Stevenson (3):=0D
  drm/fourcc: Add packed 10bit YUV 4:2:0 format=0D
  drm/vc4: plane: Add support for DRM_FORMAT_P030=0D
  drm/vc4: plane: Add support for YUV color encodings and ranges=0D
=0D
 drivers/gpu/drm/drm_fourcc.c    |   3 +=0D
 drivers/gpu/drm/vc4/vc4_plane.c | 199 ++++++++++++++++++++++++++------=0D
 drivers/gpu/drm/vc4/vc4_regs.h  |  19 ++-=0D
 include/uapi/drm/drm_fourcc.h   |  11 ++=0D
 4 files changed, 193 insertions(+), 39 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
