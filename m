Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893DA416C29
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1B66EE07;
	Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0369F6EDF4;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id BA6BC581082;
 Fri, 24 Sep 2021 02:44:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Sep 2021 02:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XfJogIGLAj5OT
 81g+tui9DWnR48Irs4IqE3/HCsJYoM=; b=ij/gSoCX7lvPk5tr1A9OXnqZqCMRr
 U0haB6gEeGrh9Y9jN/nJwy6w+i5kDtagb7aEnzhFzgD2HOEM6DlS3UH+Kk6bFhjC
 ebrgK7f/MHy5rHDg8y3AE9z7KmK13hnWr+wfF1auvNmv0lz4748rBukBbB1i/T4f
 J5FIk8r0j1xguek2Pz4c4qQJ4L62LuJ4BI2f7QSx62q1kZhor5d0PyHH2WtFpJQJ
 Hs9Cy34+aJ0tYQc/HuIBosphvrtUMOxDNr/QITNp5P1idIGKJEkbYGw36AcY2FiI
 PT93zcxsfWgOKFE0BohvydKzh5BsM3DIeQU5ERYPYZLPYCzXxdnrH7Qfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XfJogIGLAj5OT81g+tui9DWnR48Irs4IqE3/HCsJYoM=; b=amtM/Scu
 45i/msMp1j/6QmVXCuKWbczO3R6PXM4V2IqrrtRNMczn528AikHK1P4YKlI557MZ
 YRQGReMlh7/kCFniNkGe+g7ERM3UoDjWukuRpfccgIkKvRt6IMbKWzlbIvW6vB7L
 wqHLHpmjDJFeKAxf6X7K+5LnJ4GuF7ivlti/9CcXik+fVplAymdFYum7eByYKCZo
 9zF3/wDeRu8YQr/eEM7cI3yCJBNDgf0TJ2hrrfxcacu+n2JNWKORSwc32TB3Nvav
 7bt43SpqlSb6ET66yp3mcBZHJgyGv4kKwc6LcgYF2gPV3qWdQ45sJbDC5DqRrvLU
 KUhQ23ysoOM1SQ==
X-ME-Sender: <xms:xnNNYSvEzsNEIDIAsKMKyBq1Y1KpBd5sGi0Y_-LjnXGX_C-TGGLziA>
 <xme:xnNNYXdE4oyjZcvRl-GxJtVInMAYdqKNVTDhehR4JpkmZvtIOpjb3_FCwdDbhZqgb
 GRlDo-MQaUr9kzU3g>
X-ME-Received: <xmr:xnNNYdxo7owbIRCtkYUXDdcMOrCvDqD3RWirTKdRY5rqoh-LMZcps_N6Lt9xhA3TPtB_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeegnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:xnNNYdO5a-sMk-t_g8OUbcznBnK42aehjeXKomDIZX14mNFK5FcOPQ>
 <xmx:xnNNYS91mYrXXL9edztOfmblpQ9uVG88-cFkO2gSC01eT4_wwgg99w>
 <xmx:xnNNYVW72SwU9pak8JcwrTPW1yJkAVUZF5v8sdlKx-vtGJKA0GT-lA>
 <xmx:xnNNYVb1fg46HdQu4etxelBVYEKR4qB7pQhZQgYnzuXz9_IZ55PtXg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:19 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 17/17] doc: drm: remove TODO entry regarding
 DRM_MODSET_LOCK_ALL cleanup
Date: Fri, 24 Sep 2021 08:43:24 +0200
Message-Id: <20210924064324.229457-18-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous commits do exactly what this entry in the TODO file asks
for, thus we can remove it now as it is no longer applicable.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 Documentation/gpu/todo.rst                | 17 -----------------
 Documentation/locking/ww-mutex-design.rst |  2 +-
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 12e61869939e..6613543955e9 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -353,23 +353,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
 
 Level: Intermediate
 
-Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
----------------------------------------------------------
-
-For cases where drivers are attempting to grab the modeset locks with a local
-acquire context. Replace the boilerplate code surrounding
-drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
-DRM_MODESET_LOCK_ALL_END() instead.
-
-This should also be done for all places where drm_modeset_lock_all() is still
-used.
-
-As a reference, take a look at the conversions already completed in drm core.
-
-Contact: Sean Paul, respective driver maintainers
-
-Level: Starter
-
 Rename CMA helpers to DMA helpers
 ---------------------------------
 
diff --git a/Documentation/locking/ww-mutex-design.rst b/Documentation/locking/ww-mutex-design.rst
index 6a4d7319f8f0..6a8f8beb9ec4 100644
--- a/Documentation/locking/ww-mutex-design.rst
+++ b/Documentation/locking/ww-mutex-design.rst
@@ -60,7 +60,7 @@ Concepts
 Compared to normal mutexes two additional concepts/objects show up in the lock
 interface for w/w mutexes:
 
-Acquire context: To ensure eventual forward progress it is important the a task
+Acquire context: To ensure eventual forward progress it is important that a task
 trying to acquire locks doesn't grab a new reservation id, but keeps the one it
 acquired when starting the lock acquisition. This ticket is stored in the
 acquire context. Furthermore the acquire context keeps track of debugging state
-- 
2.33.0

