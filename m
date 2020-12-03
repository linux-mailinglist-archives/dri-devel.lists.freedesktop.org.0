Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA82CE9A9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339FF6E14D;
	Fri,  4 Dec 2020 08:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFD96E9C1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4172E58040B;
 Thu,  3 Dec 2020 08:25:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 03 Dec 2020 08:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=CNvjhntOkgVG9DQrm1pmQkB6An
 7R60GdwompaBK6wCU=; b=AAl1HsCMVxJX8VLMEOZfuw1RsltY62sLBewIWaqi0S
 vxVIGr5lX97uraE5XmgCqh9VcWqo1LVE1bvdYWRiJS18viGPCqoLH2eaqLijHuqc
 +/xuKks0H0/BdUe99cohk8G18WkM6hi8Kk3daTqT9zRu06HuR/hZULKEoagY08Ml
 UBj22tk42/uU9XxR+nqEixuWuTtxSmFwEc/HXPcMLiuP3XwR5X6rmznhx4rIUnVr
 ZGKlePHpxX7/zlkPlW3n+xIfslOiefvmPA5CRWhlRdO+Kfb1vBIChVB67CxBjRsQ
 UjjHL4x6wQFz5jIt/QVKtEMx0c63f2hAgkfyCyTARxcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CNvjhn
 tOkgVG9DQrm1pmQkB6An7R60GdwompaBK6wCU=; b=jHm87+8RIEpWwBIWYKdJzn
 uHW/MQOTSj+1cmgWnQW4XZg4QjleAlJz0apBiVJuNuu7dDCDfRUa6PvZGIFkptB2
 UIAkh/8hWAHG8+ubKM6sOc7XNRWrW+ro48NTNpFFigu5vjnExADX0ku87oIMqmbm
 5v50DyD/Ai6XHOekonQO0GmUroFaWN/gtd+tGmu2mWBukO5eD3jKNCK+1rsu9FiC
 t7YKKzXWihY/3XmRK3/7bAqRRGrK/vr70Eexh8B4ovqbMBpkuY4Y5azLbAL/3Xnq
 l+qon6qpXLX3Xf9grQ6wagBPXMTfzQzrBnWeEYAM12+7YpZPSQvaxc25DoZYrYFg
 ==
X-ME-Sender: <xms:WOfIXzr1xOw3vKWMOjIfhRviQ8sYR1aSG6eO5sJOv0vk3sWEoPSFuQ>
 <xme:WOfIX9qhnGlQWh2bF-NV-HwxCqhuzRLgXO9zjB5ZLaRZmDLAoySI99ad-voxckBfR
 SozgxmYjFwxPKCbM3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WOfIXwMec-kFgKy1NcuAlz8PG-moaMNmH9pQeKnsIICVT34YIXjqMg>
 <xmx:WOfIX27loVyQs8XyEwlqV6nd1btGXhenuwrxFOPq7uogBt_VBM1cug>
 <xmx:WOfIXy5IuwYZlPta2mUyrVg1Jf5ysATytefleAfgIMVcRapdwgtAOQ>
 <xmx:XOfIX0uNgR2ZFlSf8JYQWocRHZDQpy9McU4KRvqnldUa0XMRjWmlOA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8E0DD1080067;
 Thu,  3 Dec 2020 08:25:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 0/8] drm/vc4: DSI improvements and BCM2711 support
Date: Thu,  3 Dec 2020 14:25:35 +0100
Message-Id: <20201203132543.861591-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series adding support for the DSI0 controller in the BCM2835 and the
DSI1 controller found in the BCM2711.

Let me know what you think,
Maxime

Dave Stevenson (5):
  drm/vc4: dsi: Correct DSI register definition
  drm/vc4: dsi: Add support for DSI0
  dt-bindings: Add compatible for BCM2711 DSI1
  drm/vc4: dsi: Add configuration for BCM2711 DSI1
  ARM: dts: bcm2711: Use compatible string for BCM2711 DSI1

Maxime Ripard (3):
  drm/vc4: drv: Remove the DSI pointer in vc4_drv
  drm/vc4: dsi: Use snprintf for the PHY clocks instead of an array
  drm/vc4: dsi: Introduce a variant structure

 .../bindings/display/brcm,bcm2835-dsi0.yaml   |   1 +
 arch/arm/boot/dts/bcm2711.dtsi                |   1 +
 drivers/gpu/drm/vc4/vc4_drv.h                 |   1 -
 drivers/gpu/drm/vc4/vc4_dsi.c                 | 111 ++++++++++--------
 4 files changed, 67 insertions(+), 47 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
