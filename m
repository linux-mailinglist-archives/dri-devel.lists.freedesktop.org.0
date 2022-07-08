Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D856B652
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A4711385B;
	Fri,  8 Jul 2022 09:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7829E11385A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3832A320031A;
 Fri,  8 Jul 2022 05:58:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274292; x=1657360692; bh=wO
 w0QPjcoT28Jn/AcQofwFvgn93CX1N7DOu10LfM7O8=; b=eceRoiF0E5b4ec8RfB
 aGg24kUMY38+ZlbmOU9+kX0kHSm2dcsAOT4Op60e4SrseM2ZuVil/KnrKpXeYkfB
 /Y6xSqxcfPbGB2yYzRwIXjP9spk7RbmemiJ/NOr/+GqQ5i+gXtJdZOJrTAaZkrkK
 G0mW2UJXtFcZL9Cg0SKmh5WA1AlZp/p8PP8/7vwMVHNhHGNipX0tQctJu5OboQm2
 Eg3pqn3ewW3AO1bsOKy2m3j8I1KYdQpvfcs6Ld1WRKL6TLvWoD1RPqBtCbUryjrp
 du1w0LTaTZlV/eCnNXHPRHPI+jMe4wTyz5Ys16Tah15brBEZXN8dFoZVKXY4O3ap
 C3Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274292; x=1657360692; bh=wOw0QPjcoT28J
 n/AcQofwFvgn93CX1N7DOu10LfM7O8=; b=OCCYaqNnWITjant6SmxWK7+Ho/Xrk
 AgCEd4022N0ugM4Rz32LPD2LkLu/6Kg7D8G06AnVNtmxLgG+iGjPoHfhFvRq+3Nu
 2+UAfUl/hW9YpVa74QARJ9HgrReDAI95sznTmODfKGOO1ArYE7fO1JoQThGwgZE5
 dNQmKtXT967GxwMZ03W6ssXr9pz6QKRJcn56DtTEXr96zzVmteW59xMmBlRqItCx
 722AhUcsuh4V+SPHG3IjdDYBw0ZUzYAdW8g/19f4marTJUK3dqYKCsmEOBUfRi4n
 BAEbWpaiVbusc1y+83SymkqiTlyu0So1nkyojlXKWRO9lEA2u+rH8CrMA==
X-ME-Sender: <xms:tP_HYpOS9EAGLgWoIgm5Y5HXMdLJwMK9FYj20iQt9z8_eJMMXoGKOQ>
 <xme:tP_HYr-WTEUdDQpLJEc4_WjI4MrSLjDzABMofTenD9_aRz5aH60xJOYwvpzrbUFd8
 nesCstC_vsxGu2HBZk>
X-ME-Received: <xmr:tP_HYoQhgOIHAjdAuCVGEOuJDNQY8BJNZzERW60UQ1PCPYhWNjvlyCiP5FxxtjokJRc3pDdy0RxsMWaX8HrTFz_NQUkkkcYTseMutxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tP_HYltJPjH5KcNCHH5pdJen5l4bQrl34fNTw-6BiM4zuZmCWDmguA>
 <xmx:tP_HYhfClLOkbg4-oFgNypok4yKcKu0tUgk1AFwh2exufk5nQg4hdQ>
 <xmx:tP_HYh3q0XywvXuqf8oDsvO6rMieSrUlisHOOE-ILEgvVhAPO3gwaw>
 <xmx:tP_HYqFrBfaxUOigY1Ft0H4HGXoMCWxOypniLaH-96ag9G7cr75j1w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 21/69] drm/vc4: crtc: Switch to drmm_kzalloc
Date: Fri,  8 Jul 2022 11:56:19 +0200
Message-Id: <20220708095707.257937-22-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bcce61879d53..d5158a6c0f21 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1284,7 +1284,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_crtc *crtc;
 	int ret;
 
-	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
+	vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
-- 
2.36.1

