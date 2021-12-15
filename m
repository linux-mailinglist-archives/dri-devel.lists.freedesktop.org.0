Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A64754FA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC410E24B;
	Wed, 15 Dec 2021 09:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C3010E241
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:17:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 981245C01B7;
 Wed, 15 Dec 2021 04:17:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 15 Dec 2021 04:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Zkw9x06k7fUAEmHqzm8xjfWt0M
 NCjyAnCIyvt1lj1WE=; b=hvirX85I7xW10V6xKA7DVlHnr4BOYsv8ssu6h3s5xn
 ZuztGxK5LKyqlxjawboNUCJW6ioyCrjnzO5gUSgthuAu6U0ZWA3N9JYrvde03Iwz
 Mv60FRnItEQd4GyqzTp3tkgEDizvpSDTLyG0sgrBH6oZXgNM6xpinACkGC3WNMux
 o6029D3JSlbrAl4L4UVz2DscqbSD2TkabEcOI6rVZeWS2lxk4mNzWsPsUBpOiPqa
 s5ushyJf3+N7lteygVd3+Sdaqg6ijDxOBjw9YYV7SNBcJ+EOVdBDPIKD9WS6MXPK
 z+WUgFW+IM3gc9Zj5EZoeqXZWEzddn0kcwJrSHjiDZ2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Zkw9x0
 6k7fUAEmHqzm8xjfWt0MNCjyAnCIyvt1lj1WE=; b=WvHUrSRsV2OjsfppTIUfwv
 J/BJrWGxuIexLgSHzjsugKdNVbpo2940jE4ZE/uT27JtuB6ASgdNZaaqw1gprOVh
 fdiSJwX7C11hFNO6RYMYW7GB14F/StU1v6mEWxdb+eU9EFJ+E4XAV0nFodlLgBNX
 CsTlpfRjibyJkyua1rKmz7Evi5n9nVFow9ddnyTTYdihLvRAGOi028dUl1SbtlAT
 Gec1yG6NdFnFU/OqZCC09arIuxw/hJiRmwId+9UIBURi8wSIO68hWQkUseN7UdhW
 ycnEQ7N76yCjMaIxH+KzFmVfE7dPbEF3x+MSSNESJe/yCRvQh99CPz7L/i5lmQmw
 ==
X-ME-Sender: <xms:trK5YcKqKe7xqFiIQpuOn-Yz27cF_UbOZGKm93KaXXBJnwTzOk4fRw>
 <xme:trK5YcIc9sWZYHAq59MpTf-8p0tb4lMOpt6uTKDsSm_Q-hJ6GP6kSYuGDJHwsEpfz
 kteHpDXRZhCAvuUNhI>
X-ME-Received: <xmr:trK5Ycvi2B1gX5b0LkLZhxKJTuaK5fAYvqRjQOt6--aSN177p1aqhNMCEMtbytWxEnbS1otGKHukFzQC4TXtyPzwyJZ0oKVdoR7UTuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:trK5YZZeIvNtghbK8dtQTrOhJAyCpD-PhEM4MSbeD5XTE3pKaxE2rQ>
 <xmx:trK5YTbOKOk8eG3C1XzRHsAW8rUr48H3ysFuw9WKCSwbmOXrSiDNOA>
 <xmx:trK5YVDtUl7727Jz0Cpm119Z4w6Q8xrOzHEQvc7ORJODJaDP2TkrCg>
 <xmx:t7K5YRMUgmH6EGuPj2NqBAEHsNHrZPqB15JW198F6VmnN05RkL6kBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:17:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 0/3] drm/vc4: Support for 30 bits YUV formats
Date: Wed, 15 Dec 2021 10:17:36 +0100
Message-Id: <20211215091739.135042-1-maxime@cerno.tech>
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
Changes from v3:=0D
  - Build-bot static analysis fix=0D
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
 drivers/gpu/drm/vc4/vc4_plane.c | 198 ++++++++++++++++++++++++++------=0D
 drivers/gpu/drm/vc4/vc4_regs.h  |  19 ++-=0D
 include/uapi/drm/drm_fourcc.h   |  11 ++=0D
 4 files changed, 192 insertions(+), 39 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
