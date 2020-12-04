Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C166D2D0C43
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1204F6E5CA;
	Mon,  7 Dec 2020 08:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF146E196
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:11:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 52BEF58013E;
 Fri,  4 Dec 2020 10:11:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Dec 2020 10:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oLUVqYRCny2R8
 Jjp/WXxzOhh4siMAbZuA2TK4TdNTiw=; b=cdKwvnnG5a/GEt2B2KkI76Qxc6aB2
 DR7bqz6dv6ME2BZ1r6I/zLfljgKf9S2//R67OX43jjParjpXrAvKRb4WuR0oyPdP
 mEs/IxYnB8+QlrYGCY0NTN76es2YsGPUucbTPTZlHDgxaB2Dyg4N0K9huez9gw4Q
 iZxSAzzIIOOvwJYzdaRCER2SHsinthUQAUfNr5X8EA2bZ3RBnL+HHqBrp4EoNtVM
 APCe6qATOyh19DVtr1fnCQvcK70ITtQKR3zkMJfu4f4ucQKQrOLgjTjSSI8ux2mi
 bU6dYaDMIq/FF9JW1za9vxR+TbgpXGOatzYnOArYNLbICxpwhgk7pe/Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=oLUVqYRCny2R8Jjp/WXxzOhh4siMAbZuA2TK4TdNTiw=; b=OaOitfbc
 qVUEbSk5R4Z6PXvPth6rqKO47uQBjd7vcDx09p6zQY3BUv6hsTmhGgI7qkn+XW8i
 /IKkES/pnbrB5Bfylx30zKW4dQJeeWfolPqkS67C4PQP7kSth4TimD8OMpomaAmq
 BNzzekC/JsOhaoxRNP3Reejc/8WFjluFm61ZXxwOFIzV91K+chgtPkT2qHvSp9+H
 xaVMD4MLX+utqeA1cUKvoGVYiopnwrjpb5I2iqcCcZEjWOpCrMSRxmtXvWV6xcoN
 7h8fNkafHmXjEfCFoCYHkMlVybcgAUFNti0/aW4Jd4T0wnhoDKM1DgUC5j0c6lFV
 4VyZogsQPcldMw==
X-ME-Sender: <xms:sFHKXzaJHyWZqZKSokELeOXh8xi_fCa0rfl2g2rnwGUnQGtUS73mLw>
 <xme:sFHKX3k3_KXshf0bwrIXB4FYNgdiIwnH1s5klQeEo7IgfIVuiif2WrOGCo2_MXhDY
 l-2GjtdAwXM3wFnNO4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sFHKX5XcMHd85uM_weGu9kg01fYQUQ-mBs5zJF3J2SwkHlSfjV314w>
 <xmx:sFHKX5IIdtOG4BxI4EYJya0uLwXVmYWPwXshA2EmclJgv15xZ-zIFQ>
 <xmx:sFHKX5tlCHqECGzF05XW2xwwFQ-rp3_qDeobtFY6dBHo0kLK2Lf7oA>
 <xmx:sFHKX0leYeLJ5Afw10_Q8nRJZJwu_HfUbnyMPDwwpg8rMrtHyhoI-Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 06E6E240065;
 Fri,  4 Dec 2020 10:11:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 2/7] drm: Document use-after-free gotcha with private
 objects
Date: Fri,  4 Dec 2020 16:11:33 +0100
Message-Id: <20201204151138.1739736-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204151138.1739736-1-maxime@cerno.tech>
References: <20201204151138.1739736-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The private objects have a gotcha that could result in a use-after-free,
make sure it's properly documented.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index d07c851d255b..5d34c1df03f3 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -248,6 +248,26 @@ struct drm_private_state_funcs {
  *    drm_dev_register()
  * 2/ all calls to drm_atomic_private_obj_fini() must be done after calling
  *    drm_dev_unregister()
+ *
+ * If that private object is used to store a state shared by multiple
+ * CRTCs, proper care must be taken to ensure that non-blocking commits are
+ * properly ordered to avoid a use-after-free issue.
+ *
+ * Indeed, assuming a sequence of two non-blocking &drm_atomic_commit on two
+ * different &drm_crtc using different &drm_plane and &drm_connector, so with no
+ * resources shared, there's no guarantee on which commit is going to happen
+ * first. However, the second &drm_atomic_commit will consider the first
+ * &drm_private_obj its old state, and will be in charge of freeing it whenever
+ * the second &drm_atomic_commit is done.
+ *
+ * If the first &drm_atomic_commit happens after it, it will consider its
+ * &drm_private_obj the new state and will be likely to access it, resulting in
+ * an access to a freed memory region. Drivers should store (and get a reference
+ * to) the &drm_crtc_commit structure in our private state in
+ * &drm_mode_config_helper_funcs.atomic_commit_setup, and then wait for that
+ * commit to complete as the first step of
+ * &drm_mode_config_helper_funcs.atomic_commit_tail, similar to
+ * drm_atomic_helper_wait_for_dependencies().
  */
 struct drm_private_obj {
 	/**
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
