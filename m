Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662856002A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857B14A64F;
	Wed, 29 Jun 2022 12:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A452014A646
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7E3953200970;
 Wed, 29 Jun 2022 08:37:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506272; x=1656592672; bh=SL
 lTDF24f9TC/ZRMmQERuc7qJrq5dcBWscLKlS4WiXo=; b=VWOkBeqf/XKeNPfd68
 Ycyu4Ag6iBAzxCezQecfzA7RclFDX9AaOpAoF1ZBxW55bpRlfrNZO8D4RAe3P+uR
 IO8537qP2lMzVAyYvsztzEnZqukBXLAuiw3XV53W7OQuH+00r20I/ZxchdpxoUGX
 L9nPsgqrYmVN9MnQwD9T+vd7QJATlGLZ5+bUf2OjlAMlrcduDRqyvJGwYHEi1/dj
 1rI1jT/WpsX5kA4nqRandwIgYQeMtKt75DXFmWquhMzumEwVou0T153GmPaOhqva
 Yi9EM0wc3cIKxEio0yBTWXC6kaVMMjxsnh1xG4gXG03dHc4srdGCIsvkFQoaGGZI
 YWLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506272; x=1656592672; bh=SLlTDF24f9TC/
 ZRMmQERuc7qJrq5dcBWscLKlS4WiXo=; b=dcgTAUC7cCxe+EZvyV85tcqkKXt/E
 /uMuvZf/BHAi90t6Gn0PLiQz4Z26jDcg5aweedETUWas0ckJvu19BBtWoMHTILFI
 lI3QGdqENxoMpOdNuFMIgG37nO9qhGAcF/umckL6Ov4+b2DJstpnMSrX1KwxoQR+
 SnEK01i2YG6DKWmhkf249dloLvdJbLcUtka3+vCF1OiEQPimlVtBfVR13XGIDN/r
 5CpIrQNG80j8EAG3aZ4ErNAGqACmgiym05VC+lJzRmSRqFlEBhLWBo7ShXecDKqn
 a4fdU3C+GmmuvVS9WeGULElgY0KPmscf1mmC98gLg+loKFEjwhFDrve0w==
X-ME-Sender: <xms:n0e8YjE7n7XErmMmC_Z5sBMp23EXN-stB3httSoYXSW9M-HqDKSo9w>
 <xme:n0e8YgVWHLuNOzo8w3INK9xef5a-yhSqE6uvAOVbP5FOBvoV9NT20uVmrX3z5-xx5
 LVPDhJrkKXI1yeKxx8>
X-ME-Received: <xmr:n0e8YlJ2VbqleghMfCgVgTRjay3UTOE30ot1SwJwwusAjsYi0e1GIkheXrjnwLlMrPJYxXGSK8uKDsIFscx19Y22IKK7KsxpPc9CeGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n0e8YhF5LJP67PFaN8_4I3ObZEAqc6vsubzbJKILPL9MaSNJoVS3Kg>
 <xmx:n0e8YpWWpDRMpCoIrCUjoUrN9kXsYOmzNcW1_WJjoaZH_R8CK9Zlhg>
 <xmx:n0e8YsOXoNHL_z4I-X-8BC0F_vfqP0gkjoWQ2e_RxsumGxtR-cwhDA>
 <xmx:oEe8Yvy0cMRjIii6TRljIFPvxqcMmW6LGXYpz-UpmCXKHMqpye8Rtw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 53/71] drm/vc4: txp: Switch to drmm_kzalloc
Date: Wed, 29 Jun 2022 14:34:52 +0200
Message-Id: <20220629123510.1915022-54-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

