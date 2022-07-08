Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68256B69D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D511382C;
	Fri,  8 Jul 2022 09:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD9911382C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2F0C832009AA;
 Fri,  8 Jul 2022 05:58:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274304; x=1657360704; bh=nz
 0MhVMKddGTgYw4FqcQbDjuapCCCmkgrWxIJwpCfuM=; b=jc3P+vtwmrD52uhfJ5
 NOa5/wVL7G/oBJYP4eJ+Z/A0mJ3INo03Ihvov9PePscsTIUfnJ5fkSR/08efmid6
 ivuIGSKZfzeaJEkibDhF3nq1EyKoYpIPNf4DtrZWAw2CH7ijOWiZmoSeiDP5FyQQ
 l/rD6Gb48Ijz7HfkPEw+BzQk0oLKSu7sJUbW1t7axNNEag2XrLb9/XsCpPSfYUQr
 IkOxwV2hHLsB2G3ljtFnRV/5qZCdiNfaNpyKEuBqUpho37395nbeF0hvinVkKAqR
 CQT10eAMI2mtRPD22EQ+YHmOHjShTZtSD8kRkfTYa0se1ZZtHZjbIGf/MVYbbtVv
 x0lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274304; x=1657360704; bh=nz0MhVMKddGTg
 Yw4FqcQbDjuapCCCmkgrWxIJwpCfuM=; b=dHWVqXz/hdSOzMHYr+9oys/fy5tLB
 a5s1C0ru1Sp3RZTpS6TSDeVqVrJbW9wizevNK2KnvJcfTfL0zM/xzsjBzKqzZ6pY
 SKQ1hstkz9Asjy5afgDahH0w0U/FQko+1jn7YT7AqatCKUt3RRSPHrlOdCxiwVGM
 gqgn9W/i2NfrIFSem2ZJsTV/vnzBJPSQEmYRkqyERth3xURY4NL3D1qeeGBqPYNv
 ANNix8CIvX5myN6WJiJVQsdtfZYqEFwq4w5XCFKL5FfNQpsy3MNinqCIUGqf9J3e
 MZPg7xr05gd7o5tqlfpbzoX7i5AaW/FSG+A+t0FX86j9nWV8CmCgMPn7Q==
X-ME-Sender: <xms:wP_HYmc-U7CKncFIT8492vukRTwsL7wyUfm7bwrzZ9SZLrRshbv1Lw>
 <xme:wP_HYgM4bP49Gf7p2hmmzhlk_BSy7C9_3ClUwjWc4e6xBME1Ec5uR6TNYLcEjlbeb
 ta0lfL2BRl1VQ3-A6w>
X-ME-Received: <xmr:wP_HYnjjisL6s5dnMobz-GxgeIPlHpoiw0Mepr6Yw2XvgvDnFnBZQHbMPj_PpuGQa7i3bWGmg0C6J6KHcT6V41BkYg6spZxrn7IzA-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wP_HYj8WBKWOokqvgzxPT1AkaQPPqfrkIMT2JUD9q0P2i3H1WL4hiQ>
 <xmx:wP_HYivXEU_MVIfGZnm6BhEqRd8fuxTGx2_E-epSufYnYKE_WGF_Vw>
 <xmx:wP_HYqHbc9goCqTV-A74pK78ukC6XFMu_oKDljOXZOBoHLFiHZvUpw>
 <xmx:wP_HYkXjOoeHickblQKxxq7KXMmrh6g7mr-w0TwK4RLk2RQWe0jeRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 25/69] drm/vc4: dpi: Switch to drmm_kzalloc
Date: Fri,  8 Jul 2022 11:56:23 +0200
Message-Id: <20220708095707.257937-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7c4bfbd7ed9f..7a1112c12be4 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -264,9 +264,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dpi *dpi;
 	int ret;
 
-	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
+	dpi = drmm_kzalloc(drm, sizeof(*dpi), GFP_KERNEL);
 	if (!dpi)
 		return -ENOMEM;
+
 	dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
 	dpi->pdev = pdev;
 	dpi->regs = vc4_ioremap_regs(pdev, 0);
-- 
2.36.1

