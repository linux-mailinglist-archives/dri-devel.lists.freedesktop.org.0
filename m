Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05354622D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D93113FC8;
	Fri, 10 Jun 2022 09:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47669113FC8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9DE865C01AE;
 Fri, 10 Jun 2022 05:30:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853400; x=1654939800; bh=1B
 1KtcUsiV6Yz4qWoq/kHVt2Xc78hBy8NDTu51LJ1mU=; b=KoMSCNbge4KuaI4JtK
 Fasl2UjJsrzrxrrjiAI9hMDG1I39l/BTjRO7hzBfmfcixOmRcoyE572vW6CQQtvR
 OP/MbzNptVokDPQkSHr09e0/Fxg9EsQz7YL9EMy8YQJadbgp2SN+MYj/nN8Ou6Br
 D2RrXdziyzlbUqo76br6JaR6RXaZQsvsnzdXhfMFE0gL5B/q3VheArd5N5IaPJ4H
 fRy2p6x8Xs/augzMa+mVe3hesuiF1gtIYFQ46vKz0F04QrIcKGH0qTAmbA3SlHD7
 lbxZoshuxHiUQQc24NYRpSKSdRTwZ0CdkvZ71jsSpxEkymEXARs6PXHbV0ic2AW+
 stwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853400; x=1654939800; bh=1B1KtcUsiV6Yz
 4qWoq/kHVt2Xc78hBy8NDTu51LJ1mU=; b=P0Qd/w7Hugf3CaFfDJ0t/GVKMfUC0
 3YMzV0+ZsMT5Uap4ztFI2dgpwHzmcOruVyfOUyq5THK21iQ5nt60Jo+N1fpij8AL
 72WAy27QiWL1D3Akmmuf7ZRs1FbqnYJaCfH2Vhg+Qr+SXEgzR/Aux81yQI6jvbk8
 sHv05sCN2kRW9K3JQfDL9d+L+OzUDQ62s8w9qE9kypva6VVPvuKMvjf8inE2FaSb
 U8ia9+vivsdz6D+Hy9fQQXrgj8xeCK3PJbRb94CpQ/2nJ4cz1nWmmuQDbxUkLHfh
 /OiYxgqXnV2z3kvTyXHUiHvqcS9eSlebAWb/2tWtPxr4ew6P1xI9GltiQ==
X-ME-Sender: <xms:GA-jYqbum2xCJE2g5nIQnH0PGRXceyEI9MywhxnSUYBPrfHrc6siMA>
 <xme:GA-jYtbcy5PZQ2Ng9f3ClDuZwLPuMu0QolsE_r5-QKOvni2-ig5jbjHXmVRGgz5ar
 MApgiDmQM8ayVOsGgc>
X-ME-Received: <xmr:GA-jYk-j3Ta7gfQHBrEFyXlqG53YVygzmeh65t4hT5ks6OFCUOKiVCCrGl8-R6P50EeXHWNHIFPXu5QAO--_ELcx25b3ePk4k6N2VFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GA-jYsruztAVk1nWhi362K8qC0BCZwNolovgIYLmcn5JE2h4GckWtQ>
 <xmx:GA-jYlrsIF0hXRG7wp07nCbpNJqiEWF0zctTF4FAxvlXeUFNdYYp7A>
 <xmx:GA-jYqQaPKtNijJDhn4xhvq5ZWauODaQTflwrIKeM_JZHKqvVDFS6w>
 <xmx:GA-jYmnhZm4-jArdeW2icEnSdmp3UyLI7bDAIvVLI1POOz1KCjiiQA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 18/64] drm/vc4: crtc: Switch to drmm_kzalloc
Date: Fri, 10 Jun 2022 11:28:38 +0200
Message-Id: <20220610092924.754942-19-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 1f7e987e68aa..c74fa3d07561 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1178,7 +1178,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_crtc *crtc;
 	int ret;
 
-	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
+	vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
-- 
2.36.1

