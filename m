Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCNjBNGGl2kgzwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:55:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A1162F97
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6848710E339;
	Thu, 19 Feb 2026 21:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="cGOtijqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5710E339
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rb4auJXP+QCfWH3ANOoL4dRGEJWizRw0Mek7tVIJigs=; b=cGOtijqPVvk4MGrc3q6In+PkJh
 yPxqu0lANZ3FSi1TEx2QUNkRTRcqBc20tD+9e1XHFW7lEsFu41qyJYIWm/srEhhR707kavg2KZTmL
 ukfHxtaXvq8ZAe8JhuBfuFeQtETa7UgCABZhwPsmwmU0mYsgcZjBvbRUziAXKPwez+/aYJ6eZpZ67
 1Bc1+OJ20E/tEbytZ97yYv6qJPbtVCfZ9JLSQZlfCvkGyhYPw9oZm+zYcX3aG6QmvbCs+SnrYOUQH
 hqKvlRP7gmPtNc15g9r4nv6ln0ASN7H8FBnKMW/5uzm/GFsaFnWUxJDnUvVkU+RXWsB1l+cwPjx87
 atyokbUg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vtBzZ-0000000C7Bz-0Is4; Thu, 19 Feb 2026 21:55:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH v2] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
Date: Thu, 19 Feb 2026 13:55:24 -0800
Message-ID: <20260219215524.468142-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,sholland.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.941];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ffwll.ch:email,infradead.org:mid,infradead.org:email,linux.dev:email,intel.com:email,suse.de:email]
X-Rspamd-Queue-Id: 101A1162F97
X-Rspamd-Action: no action

Correct the kernel-doc notation, add a missing struct member comment,
and add a missing "Returns:" function comment to eliminate kernel-doc
warnings:

Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
 kernel-doc format: * @mode_set
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set'
 not described in 'sunxi_engine_ops'
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
 not described in 'sunxi_engine'
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
 for return value of 'sunxi_engine_layers_init'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
v2: add Reviewed-by & resend

Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sunxi_engine.h |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- linux-next-20260218.orig/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ linux-next-20260218/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -114,7 +114,7 @@ struct sunxi_engine_ops {
 	void (*vblank_quirk)(struct sunxi_engine *engine);
 
 	/**
-	 * @mode_set
+	 * @mode_set:
 	 *
 	 * This callback is used to set mode related parameters
 	 * like interlacing, screen size, etc. once per mode set.
@@ -131,6 +131,7 @@ struct sunxi_engine_ops {
  * @node:	the of device node of the engine
  * @regs:	the regmap of the engine
  * @id:		the id of the engine (-1 if not used)
+ * @list:	engine list management
  */
 struct sunxi_engine {
 	const struct sunxi_engine_ops	*ops;
@@ -140,7 +141,6 @@ struct sunxi_engine {
 
 	int id;
 
-	/* Engine list management */
 	struct list_head		list;
 };
 
@@ -163,6 +163,9 @@ sunxi_engine_commit(struct sunxi_engine
  * sunxi_engine_layers_init() - Create planes (layers) for the engine
  * @drm:	pointer to the drm_device for which planes will be created
  * @engine:	pointer to the engine
+ *
+ * Returns: The array of struct drm_plane backing the layers, or an
+ *		error pointer on failure.
  */
 static inline struct drm_plane **
 sunxi_engine_layers_init(struct drm_device *drm, struct sunxi_engine *engine)
