Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D7256B6DB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98641123B1;
	Fri,  8 Jul 2022 09:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4D8112BD9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D467232009F8;
 Fri,  8 Jul 2022 05:59:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274381; x=1657360781; bh=SL
 lTDF24f9TC/ZRMmQERuc7qJrq5dcBWscLKlS4WiXo=; b=l8a6bP5G7V6JVhlMyf
 FbvPfUV0hdAsvu496NtWxoRngBwNrkWehvN+lyEUpN8OUYxb68nObaCL9HMn4zgZ
 4HzdB+HsbFhYCalSYBQOI9MA+9PHLHlo4Js7XqsoRbZ0Ovl7+d1lk7IbFn+Q6ohm
 x1O8I3oD5I74kwWvjM+r+vuqGSNs3LCyBdW/ty/1rURZbTlCYBnUDd5Jj4fmk655
 KHEGC25RhRF4hvO/SxYaiqmxAlzHBLvf2GFHq+syuutsAO+LKMVNhIsqTiK2WW2X
 MC0pMnNrux0ynBOQyxL3YR0FACETmkPCGakpz1+24TyUITYKAT3htZUqDvaUWr7V
 mIWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274381; x=1657360781; bh=SLlTDF24f9TC/
 ZRMmQERuc7qJrq5dcBWscLKlS4WiXo=; b=yF2OH2Kx6gvTsIxYWj7M4KjLot01g
 JQoqCHY3wh22FVmeOIrPscEJ5PQZ9T9rldcOiwnWxkqI5sR6+SBzFSzJ5C8JXxg1
 VZT5mmMk6t+47e72yFF1eIa3I/sna5osyZCX+37ZjMOf35cKqOMSVHOcSx1S22Ew
 uuFC6CQplwt8zzsWxrQTY2ILdvATMQrK63SyrOgbSYZlPuUGLNVfYUrEVCfoD1cp
 N+2zCiGlFUOOMLAtejqFfBj0muLSfh3dAjrXYv9pEEzsbJXrJ6u28AFY689TOBo/
 MI7M/zN6WDdD43F7a7mnVIE1znj0rliZAVG9Eo9dS+eLmWHfJW482Gcnw==
X-ME-Sender: <xms:DQDIYrZbmGpTy0NAqeyTL8QBnQItUWE5AcQL_BhA_PNfuZXI_lzNZA>
 <xme:DQDIYqasAu15albFWTslYhZlnVIADZFrHMA052PbcZfk3R8ouLppXsL6c44FE6Bid
 HJ-TucikXu9xpsBKaM>
X-ME-Received: <xmr:DQDIYt_-qGWphHCePrbh-769LUOsC4lCzUO4nBUmsTcswjGIbVoygMJMSH98voSj2sAo8mKm7A9gne_8D1STRXm86krXXVjyj_AUn5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DQDIYhpLaLo8wGtMxXL9_Xsz0XyJdglsH4cNQTDfGn6boYRNRMOC5g>
 <xmx:DQDIYmoaHRYhO4ixcJQxeDOikzT9cG1boo85SNU3jqB3rrB8fUwcjg>
 <xmx:DQDIYnQXvlbiOeFhraYHMd_BmvEoklIhDCQZNu2OkzmmhO9xk7Nv2A>
 <xmx:DQDIYvlnOCW4_0EMX2Svmxx8h4ofsHOeseuNF4i0-o_Z_I8RPsEyIg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 51/69] drm/vc4: txp: Switch to drmm_kzalloc
Date: Fri,  8 Jul 2022 11:56:49 +0200
Message-Id: <20220708095707.257937-52-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 19e37924ce77..160f9d0ec6f0 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -478,7 +478,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (irq < 0)
 		return irq;
 
-	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
+	txp = drmm_kzalloc(drm, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
 	vc4_crtc = &txp->base;
-- 
2.36.1

