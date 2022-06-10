Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65954624A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454CE11B292;
	Fri, 10 Jun 2022 09:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA69F11B33E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 123765C01AE;
 Fri, 10 Jun 2022 05:30:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853429; x=1654939829; bh=oZ
 uETHlNIqitNxX7W5Y3EO0bKGhGn6H4O2CkEmgsESw=; b=frP0jiV+W3oKrgjabF
 quA1lC2IqRfDmSCNjy6ek4VLMzP+N/8IScftqGZoCrmF980SAKz7epd7dF5osHz0
 ToCE+JsVJ+xmabfuilfMlGIwZ9bfAOjYQ8a18HB1x+qZ3kCPXXonfVbkUyZKKczo
 fMcOCBS/GgZ9/ofkINWSf85D3wThGj0X0TqZBWsAQBWym66DdfXGJdfshCBiUnEe
 sfap6856a8guRdYct6EdSGmtAH1bvBTsos/xO/X5EIL3oSBW7GrvxZz+IowmTchZ
 Vo09H5XTCCqJT55kYopjuFzkpMStOp22PVq1nfNbxd6yDCKhgGKkDHcTDyejfcxg
 aFpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853429; x=1654939829; bh=oZuETHlNIqitN
 xX7W5Y3EO0bKGhGn6H4O2CkEmgsESw=; b=CaVNAXkfDDQPMJlULZIDG0rlBGpqU
 oLNpsR6blMcY19fRBkWUiUSf7uMFIRqEPABSxs/UYzPe50OKrmrOYKuEn29GB4o1
 VDcTlnYulHNunX+ggdvUUMEPPFWiD/2NSVyjwIVMHR53F9JViYYz1hPB6Z8KeVls
 DVJnukmyecvuWQ81SJ8LkDtXZ1Jyj8/N+babk857yjQ1s7hlsROKiyRGgTzw/XgP
 N82rFhLYofwJVnt0nd8uhWXXDQmpVPZy5PjcwrQlfOI4jibwaE8PCqOwWsdePzJ0
 rkmOsrjfouDygalvcu5Qz7f6+PBdah3Yw7dO/xUsSKi+bsBvK4ZWV65fg==
X-ME-Sender: <xms:NA-jYr6gk2vBxVtR0iPR-b1Fn6TLyhvvktjbYpqZnVWAR0TDA5y4vQ>
 <xme:NA-jYg5BZKtUTH24i9IxJLOwl39EtToSGwZMDMWYlQNPI_U7JRjS_A7BVpBLAKYDG
 H-z8twxy1m9ZAPRmdw>
X-ME-Received: <xmr:NA-jYiefaiA-UgYoDy2YToWW_O4dSdNRtDnAqylQ3KGZPAqLtyX3trUqQqknRy9QyM9d1P4NL3LmRZ4PUL1j8iiY9JgUBR8Cp-Y3YZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NA-jYsI5OmdZ1CtOYIgXouB78UAbGRINF_fwoMrrld_BGqIiJaKUDQ>
 <xmx:NA-jYvKnyvrdwELUHFaZNb6dIiUTSF4iu7E3J0W_2dZO-HsYwTyz6A>
 <xmx:NA-jYlyKKwulSDjLvcZyAvWVsRc8Cqodzb49unfa2m_rcgxFB9Ocaw>
 <xmx:NQ-jYsGVQgbQFKhddJYN3RL8l6TmxnwkdAF15Zr5E4oRxdgb0jpzmg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 34/64] drm/vc4: hdmi: Switch to drmm_kzalloc
Date: Fri, 10 Jun 2022 11:28:54 +0200
Message-Id: <20220610092924.754942-35-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
removed. In our case, the most like source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6aadb65eb640..eb8ff7b258d1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2833,9 +2833,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *ddc_node;
 	int ret;
 
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
+	vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+
 	mutex_init(&vc4_hdmi->mutex);
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
-- 
2.36.1

