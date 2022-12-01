Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A095E63EB66
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EED10E564;
	Thu,  1 Dec 2022 08:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24610E567
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:44:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DE9245C0156;
 Thu,  1 Dec 2022 03:44:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 01 Dec 2022 03:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669884242; x=1669970642; bh=V2T5j/m0HF
 xONdbkkVGX8FRuR3HfY3gf15m5xHApg9g=; b=Pax7whp2PckV/HVpCbwyIcR0zv
 NAcyfKzwmbrl5nEf8EDx9+rjfl0PlHc+lUSgITg/ylkgwgojM7CGux28kcAL5T3g
 tZPFwpbOwYs/CL2YzB8CpHT47w3PO1oJq18DXdYhqdIvlmgK+ezmZ1o9DRQTDXw7
 oA1zOqcljo9Jl5HOwJaoaxTkTjDEP9SLIGtt+6zAWEIV97e/UsFTQnjMNvl3sptk
 1VDUvNaVd/PJR1Y7DOzS1EcgfAouZDHolihNkY3TQec7yBNK4If1PMVCGlfmduIt
 oPc7yiyPRrdoG+H2vtSwkyBR2rcgw12D4aMoLUTjRd5Eq0MbGeZ+/ZnNh9xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669884242; x=1669970642; bh=V2T5j/m0HFxON
 dbkkVGX8FRuR3HfY3gf15m5xHApg9g=; b=tEnUW6FKHkd/TMRs/jeFPt87wsI+4
 kd4t/4GZwBkcOEOjIOMfeV/wfm01/gF0Z4WqmaQnxcDopjSeNEQeyS3lxqw/FbHY
 yjUAlSLZByxzf3g7PaHFNh0oUus5mmf7W+tRanAjrYqH0X8rbeXEwPlpEuJ4KSwf
 hzKE0KZvngOwkSFsD3igD+aqS41MUhPG14KujFVOi80FoZOczNh2droQQ5tpmoKk
 is7h6/kvSjee3XlKkhc0NicJS+IUkKSFpNcMih/2JSHFPd5M0tkJjC1mcV8y10ex
 qzBM4IdDq/m2MJGU2sAhRS+UOmtEZrl5z7ytw8OvzGHjGoApkif/eynmg==
X-ME-Sender: <xms:UmmIY5emrg5FJsZidQv58Lf3ud1He6U-lEZKCRU5LGRQUhxOIDiUew>
 <xme:UmmIY3O0MvfKGuibdehktXv5_p_LVK2JaCJ5lez6hV_UtZPSc1ow8cFUsPdpeyG1y
 BkaLLoxlUthVKPGboE>
X-ME-Received: <xmr:UmmIYyh_Gtrk2wMs1JI5XUxagjx-f6peTdogLTW9g57ILhMwGZGbl6A6jCewqwf6PdPUa8d9-B-9BN3k4mmXfai0nUewoCiNUwwd_3pQFIk21Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeuveetteffvdevlefgffelgeduueefleevfedvudegheekfeekheejieek
 gedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UmmIYy-ASdkniUHwBibDhLEuvFJQLke4iKVlEX5dyx_Qvg2J1fQp-A>
 <xmx:UmmIY1uSDbeXCaUnE11VrQRqOduXKnfjsKtAvMyNd_wFx8FgyLmPkA>
 <xmx:UmmIYxGvD3noEFQaNINFT1Jdl3VIY7Qk7UvBvlKimX65uOgEmyAR3g>
 <xmx:UmmIY5A_9CqaQvKQSYkGfEwT2dJG0556SFa38bJJSGlFY0AXOWaYFw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 03:44:01 -0500 (EST)
Subject: [PATCH v3 0/7] drm/vc4: dpi: Various improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAAVpiGMC/43NywrCMBAF0F8pWRvJwz7iyv8QF8l0tIE2KUkMSOm/O7hzpYthuAP3zMYyJo+ZnZ
 uNJaw++xgo6EPDYLLhgdyPlJkSSkkhNU+r5yONX9YUKy4YSuagx75tWy1BG0ZVZzNyl2yAicrhOc90
 nHwuMb0+r6qkdf2hVskFH2xvTWdOBpy4AKYQjwWJvZFY1T+KIqXvjDRC352B4UvZ9/0N59ZHnAQBAA
 A=
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 09:42:45 +0100
Message-Id: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=CXTUHloU/ZPIVB6khtQLrUodKC6oAdI1v87+zq31l9M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdmWybbgkWfdDWSNqm833nP6Fp8r32gVUcsjcyOVdk7J6+
 fNGCjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkQp+RYYfy0rt3Wxw3Kd+ZKz41K5
 TR++OuJ+d5t5dYMhj81irIucTwVyZu/v/4rZw+c6c82fXE3ODGz98P1PYesLuXu9eKIVPYjA0A
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
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
Changes in v3:
- Rebased on drm-misc-next-2022-11-24
- Fixed the order of the new defines and documentation
- Link to v2: https://lore.kernel.org/r/20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech

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
base-commit: 6fb6c979ca628583d4d0c59a0f8ff977e581ecc0
change-id: 20221013-rpi-dpi-improvements-c3d755531c39

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
