Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D944F605A2D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E0B10E498;
	Thu, 20 Oct 2022 08:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B929810E498
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:50:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3A701320085B;
 Thu, 20 Oct 2022 04:50:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Oct 2022 04:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666255848; x=1666342248; bh=w5WjrHX1p4
 oGXE8GiUzEI3SU/oVM7aMllFffCWen/+c=; b=JMKDRfWeMk7d/aEyjQ2ZgPHU8N
 3eANlS05qRpu954BxJ7JW7lsVCeH7CfH7AxjBf8ilrFYDZlK1dNFihyI6rzzS9FI
 1pVDVQqXahp/l/mNqcY8roSHPY39Xi6gxr5ZqQzq9we8l8lnAtJcTtq2WJ7JpTCs
 wR6S2tpRRYd8DreuSZTQC3Mf4eS0W8GUbn8R2KnFh0RRXJdFCnYtDLY5arfB8ReX
 fJRnVKtWn8z55O/eGZV6h7YGw7ghm4NiqWJXO65GB2dR9wnvPoDDGoa30ijAqkg5
 iSOobzB9gNTTHgcxqrJ1t56WCTFHpc6LD0ze9WQSoUCu8HaMwbDXnfry7zuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666255848; x=1666342248; bh=w5WjrHX1p4oGX
 E8GiUzEI3SU/oVM7aMllFffCWen/+c=; b=ssB3BbU8rKENSAOB4fD1BSSG90DMh
 DzwYygAU2W9SDgNGV0slTmRwFzfttSaVyx07PYTemC23fUpEgTxyj8AsE5X57QI1
 OD2FqPKVZZ04HTx1e9qHL55l65Fts1Ta3rDA9D/gcri5XWt4xaMSTlD1AVDUCVww
 N3KRcaYrxSmKzpHLm0IxssZPAvBsJqgKYswpyE2qWJOM6PSu+FhGUvnChU6sRR8w
 igRdAy/4oN23K/oYVWUCIRsPY8774xnj4GPmUFnwhd8+SJ7p+9aq5Hslcg+ekxOq
 yPltO/BFz7UyPDXiLZNe5dq9TQ3w/ffADuHtRi/QJXodm1OHnp/eV934A==
X-ME-Sender: <xms:6AtRYx47H3pXV5Ighqz1ISFiAN2M1tVePySyVpAePnpZMeAU7K7e7A>
 <xme:6AtRY-47B9rFehLU9R5NijBGW8hU8Gprv-72wjfe183GTIwQphXwliqppBVK4PJ3n
 4_WnQPgXGb_blAUS5o>
X-ME-Received: <xmr:6AtRY4ewtO9wO3hPRwTiJPInPaXrmavUCaK5WclUFtJ6L38-W2OTbZSItlHhpwu7ltTNnDOjxd0DAR_nS6jjTcfeXuq0QWc4CNuP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeuveetteffvdevlefgffelgeduueefleevfedvudegheekfeekheejieek
 gedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6AtRY6Lf33nVyVDS5fNQheIy0hYHsOvJmjrnMzYpUGArO0z10jTPew>
 <xmx:6AtRY1KI2ejs99O6TSiQd7MDowQGMaVb2qTxBPG_iCfLnJhkDVQQew>
 <xmx:6AtRYzxTl92O0FttY4-XPC7aizhEpzSdBrIeroYOtb9Xl7RNNmc0qA>
 <xmx:6AtRYy5iuSIXwpEHto840GtfNDQ82q1iKoYAPLrolaUj5jtcT9o3Mg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:50:47 -0400 (EDT)
Subject: [PATCH v2 0/7] drm/vc4: dpi: Various improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIADQHUWMC/4WNzQrCMBCEX6Xk7Ep+rDU9+R7iIU0Xu9AmZVMDUvruLr6Ah2GYgflmVwWZsKi+2R
 VjpUI5SbCnRsUppBcCjZKV1dYabRzwSjCKaFk5V1wwbQWiG7u2bZ2JziuZDqEgDBxSnGSc3vMs5URl
 y/z5XVUj9vhDrQY03EIX/NVffBz0PSKnfN5QsM/jOL5vI7ZZvgAAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:44 +0200
Message-Id: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=WBeFEiPbgMgKukc/SpChNRlkueJiLmWc/Mq8YeDR5TM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7BbTzN7r8agc9XXzn/31z56zE+sZ5bQXe91z/ji5efPb
 PD/+jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEyk4QQjw/ZZ79rvzsp+OSFA2eDYjG
 xz12+77ijU+QZnqd1te9Ix4SjDX2le48IMxRu37Hi1/F6dnMubFV32ap+qfPFG7pMbmDtsOAE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Those patches have been in the downstream RaspberryPi tree for a while and help
to support more DPI displays.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: Joerg Quinten <aBUGSworstnightmare@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v2:
- Documentation for the media bus formats
- Reword the commit log of patch 5
- Link to v1: https://lore.kernel.org/r/20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech

---
Chris Morgan (2):
      media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
      drm/vc4: dpi: Support RGB565 format

Dave Stevenson (2):
      drm/vc4: dpi: Change the default DPI format to being 18bpp, not 24.
      drm/vc4: dpi: Fix format mapping for RGB565

Joerg Quinten (3):
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X18
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
      drm/vc4: dpi: Support BGR666 formats

 .../userspace-api/media/v4l/subdev-formats.rst     | 111 +++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c                      |  16 ++-
 include/uapi/linux/media-bus-format.h              |   5 +-
 3 files changed, 128 insertions(+), 4 deletions(-)
---
base-commit: 7c99616e3fe7f35fe25bf6f5797267da29b4751e
change-id: 20221013-rpi-dpi-improvements-c3d755531c39

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
