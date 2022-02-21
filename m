Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03704BEB72
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 20:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0E210E3D2;
	Mon, 21 Feb 2022 19:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19B010E352
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 19:54:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62AE41F393;
 Mon, 21 Feb 2022 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645473253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q745Q564KmJVNw2+KNdAukT4aGfTFfnZ3w3mvLB/yBI=;
 b=UnbayNe9KQbm/poEukp9x5SViT3pPlKxY0ogOxVGl8qIrIpeo1x9ufInDe10xfvvo74vne
 YMHHnlWJnOQAwGngW36sJTkLhGtMMU4EgHaq8gIeik4SbZ+dHEf54elpdoUhxOI4dPeiTC
 1EaDXP0dgpFlC6eN0mI293iSmDNbrP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645473253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q745Q564KmJVNw2+KNdAukT4aGfTFfnZ3w3mvLB/yBI=;
 b=FeKuXRzQ/pJVq4U81QMByWL9fordS+ipoXTH9aslkKeo+lKfyleBD7c4oc76U0zuYNJocT
 q6sGglrciQAr+WBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D99313B78;
 Mon, 21 Feb 2022 19:54:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iFAiCuXtE2KVPwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Feb 2022 19:54:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 sam@ravnborg.org, kraxel@redhat.com
Subject: [PATCH v2 5/5] drm: Add TODO item for optimizing format helpers
Date: Mon, 21 Feb 2022 20:54:10 +0100
Message-Id: <20220221195410.9172-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221195410.9172-1-tzimmermann@suse.de>
References: <20220221195410.9172-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a TODO item for optimizing blitting and format-conversion helpers
in DRM and fbdev. There's always demand for faster graphics output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7bf7f2111696..7f113c6a02dd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -241,6 +241,28 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 
 Level: Advanced
 
+Benchmark and optimize blitting and format-conversion function
+--------------------------------------------------------------
+
+Drawing to dispay memory quickly is crucial for many applications'
+performance.
+
+On at least x86-64, sys_imageblit() is significantly slower than
+cfb_imageblit(), even though both use the same blitting algorithm and
+the latter is written for I/O memory. It turns out that cfb_imageblit()
+uses movl instructions, while sys_imageblit apparently does not. This
+seems to be a problem with gcc's optimizer. DRM's format-conversion
+heleprs might be subject to similar issues.
+
+Benchmark and optimize fbdev's sys_() helpers and DRM's format-conversion
+helpers. In cases that can be further optimized, maybe implement a different
+algorithm, For micro-optimizations, use movl/movq instructions explicitly.
+That might possibly require architecture specific helpers (e.g., storel()
+storeq()).
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Intermediate
 
 drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
 -----------------------------------------------------------------
-- 
2.35.1

