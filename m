Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A512B3AF3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0089DFB;
	Mon, 16 Nov 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C346E528
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:28:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC3BC58051B;
 Fri, 13 Nov 2020 10:28:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=7Zmgsv4bn6m3O58vV2b3+wNJJw
 TAQp+Lmd3f32mWRH4=; b=k7UlQIfFELipVX33MndLesTIB2ZjsgWgbg2aR7qmrb
 y8zs9fDgXkzcoIXrDBUEkNZm4HVKwVme6nxVozLau+IC7I85Qw2ZNztyx7bz+1gf
 YLXTnYS2Hezl5qaamo/8zdvj0ZXTA9k5orS8micuQHYan5xhS4XTYOrD57kO7R8y
 8Psy8vU4I5brcsgHWK05g5G69q+yPNPq7vqFYIjN0Pj2g2G5WO+AdMpKpirwhvpW
 Ckp9uh4iRrbV8fP8DhknmTPIt4eysBZFDgKC6h30HER7OwAIsOLL1DWNZQih5MXY
 XFDq9pMtlQy2BnudQ86efgKPYurvv1b4W3K/0gbHvlSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Zmgsv
 4bn6m3O58vV2b3+wNJJwTAQp+Lmd3f32mWRH4=; b=KqZuYf9kT9CSy+HgMq92XQ
 jOYNG5YWYRXEA6F1djA4Spy+tuFnd13U19G2ZQHmNmhaCTZ3wiAX1/6VKcA01rk3
 YPVPkxRmOrNXC7upxy/d5nSfSlDd9xPToisM6eM9va35y/EhaZBvgeiBZ1CjsZpN
 UJ1Kx5baVAgAxXXW2N8eA0eRL4E11JtzIWRsWHSXomoS9y5eOsKb1SliY9tRjlHJ
 9aHPvhqIm/rKfYf8YSMdMPJ5OiQ9tGsSrSfuWL5XmpDVEBSHNqx1C+Z2vAr0b72r
 QicVGXZBZNTEJCVW3vr0akBi9kMmt5/Rx340WnNg/ZVXqL0h5N5zR4JXOQ/0nW2A
 ==
X-ME-Sender: <xms:HaauX8eTfqcO7-nFieSEt4JmaS4FOFneOe1TMolRmDxSkZaaxNYyug>
 <xme:HaauX-PREx9KU_zPG0lRs7oNTNBXLNXaMqmdKc2vYFRg0RA94JpH4eQfnEGsPIURb
 7Q5_HE8oYdOK8JGx9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HaauX9inpliFxwYna_M_xdoXpqfzULazwKVVvf_eFP7kDDfUs6F4XA>
 <xmx:HaauXx_zxMnp2AVlmJMBdiL551_vVkqeGKuVC4sQAMMJU_VqKrgR3w>
 <xmx:HaauX4siIRq_PBLcI-4Elu7K14sldPg-uuDvos2XeQiGslI-7yr1DA>
 <xmx:H6auX4GxUkRiT65JtyLG2RvC_hKujEFhOD61NNX4r4ZhECUX2bqLMg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F7C33280068;
 Fri, 13 Nov 2020 10:28:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/8] vc4: Convert to drm_atomic_helper_commit
Date: Fri, 13 Nov 2020 16:28:19 +0100
Message-Id: <20201113152827.139110-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a conversion of vc4 to remove the hand-rolled atomic_commit helper from
vc4 in favour of the generic one.

This requires some rework of vc4, but also a new hook and some documentation
for corner-cases in the DRM core that have been reported and explained by
Daniel recently.

Let me know what you think,
Maxime

Maxime Ripard (8):
  drm: Introduce an atomic_commit_setup function
  drm: Document use-after-free gotcha with private objects
  drm/vc4: kms: Move HVS state helpers around
  drm/vc4: kms: Simplify a bit the private obj state hooks
  drm/vc4: Simplify a bit the global atomic_check
  drm/vc4: kms: Wait on previous FIFO users before a commit
  drm/vc4: kms: Remove async modeset semaphore
  drm/vc4: kms: Convert to atomic helpers

 drivers/gpu/drm/drm_atomic_helper.c      |   6 +
 drivers/gpu/drm/vc4/vc4_crtc.c           |  13 --
 drivers/gpu/drm/vc4/vc4_drv.h            |   2 -
 drivers/gpu/drm/vc4/vc4_kms.c            | 269 +++++++++++------------
 include/drm/drm_atomic.h                 |  18 ++
 include/drm/drm_modeset_helper_vtables.h |  18 ++
 6 files changed, 173 insertions(+), 153 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
