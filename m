Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1B464D37
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C596F994;
	Wed,  1 Dec 2021 11:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6F96F96F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 11:46:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6DA22170E;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638359207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lkg9ryMU6lPpTgqFBkXH/p8+CE29YxfePBQjBRZC8A=;
 b=MkAQ6dtcUY4j6sTjJ+CTQUyjlfEK8RKz49eWcYHBdEOHRyTCncdjPeoYVPl73h63Xn/lpz
 lYAcNJR0VQ0giVoGTNFpwd1zKSp5OSLHFxbW/sas0DPOazRrwCPNC00NEHNmh3Pxu+3Xu1
 CyFNb0qEuOYSOLts7wf8ILfFIfau4KE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638359207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lkg9ryMU6lPpTgqFBkXH/p8+CE29YxfePBQjBRZC8A=;
 b=3ii9R0Op7oqFIv4vzmqWxl0wGlSlm2+LTk2XkoqU6mQpyLv5t4rbKJlT7eoCQPCB79XyRC
 9TQV9xv5nXDp0bBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4F0F13B7E;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gOgvK6dgp2HbDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 11:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH v2 3/7] agp: Documentation fixes
Date: Wed,  1 Dec 2021 12:46:41 +0100
Message-Id: <20211201114645.15384-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201114645.15384-1-tzimmermann@suse.de>
References: <20211201114645.15384-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix compiler warnings

  drivers/char/agp/backend.c:68: warning: Function parameter or member 'pdev' not described in 'agp_backend_acquire'
  drivers/char/agp/backend.c:93: warning: Function parameter or member 'bridge' not described in 'agp_backend_release'

by adding the necessary documentation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/char/agp/backend.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/agp/backend.c b/drivers/char/agp/backend.c
index 004a3ce8ba72..0e19c600db53 100644
--- a/drivers/char/agp/backend.c
+++ b/drivers/char/agp/backend.c
@@ -62,6 +62,7 @@ EXPORT_SYMBOL(agp_find_bridge);
 
 /**
  *	agp_backend_acquire  -  attempt to acquire an agp backend.
+ *	@pdev: the PCI device
  *
  */
 struct agp_bridge_data *agp_backend_acquire(struct pci_dev *pdev)
@@ -83,6 +84,7 @@ EXPORT_SYMBOL(agp_backend_acquire);
 
 /**
  *	agp_backend_release  -  release the lock on the agp backend.
+ *	@bridge: the AGP backend to release
  *
  *	The caller must insure that the graphics aperture translation table
  *	is read for use by another entity.
-- 
2.34.0

