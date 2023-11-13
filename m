Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2917E9B80
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066B610E366;
	Mon, 13 Nov 2023 11:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487E10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:55:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43F621F6E6;
 Mon, 13 Nov 2023 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699876510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/5kYUV1rEFjHNEaAdgspwkitSoq5USt+2BcNwPIYOiU=;
 b=Yg/aw22Nos0HVsCb5HEK5E32aSCmR06EFnT4UpNQTWPjFJ7uQbsNMaZf+hEzbZ2bqmWtKC
 uv1odWRywV3JDpiZvxhPzfHu6gMJWNgT7BiYbEYeSlc267cU0l3OeZwXOZE3gAAIHehEo2
 HkG78RkdvantjYAuXd3CX/3KFlFei4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699876510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/5kYUV1rEFjHNEaAdgspwkitSoq5USt+2BcNwPIYOiU=;
 b=x8udOIrW2UzPgkn0PE4X5AnRwBJXxDyIFtjNi4s5+TctjDfGMmnBKr29duhBys4vMbXFnG
 sec97xrJuw4HAOCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC15213398;
 Mon, 13 Nov 2023 11:55:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JL/9N50OUmVcVwAAMHmgww
 (envelope-from <jdelvare@suse.de>); Mon, 13 Nov 2023 11:55:09 +0000
Date: Mon, 13 Nov 2023 12:55:08 +0100
From: Jean Delvare <jdelvare@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/loongson: Add platform dependency
Message-ID: <20231113125508.4dc755e8@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only offer the Loongson DRM driver as an option on platforms where
it makes sense.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
Changes since v1:
* Use the architecture dependencies suggested by Sui Jingfeng.

 drivers/gpu/drm/loongson/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-6.6.orig/drivers/gpu/drm/loongson/Kconfig
+++ linux-6.6/drivers/gpu/drm/loongson/Kconfig
@@ -3,6 +3,7 @@
 config DRM_LOONGSON
 	tristate "DRM support for Loongson Graphics"
 	depends on DRM && PCI && MMU
+	depends on LOONGARCH || MIPS || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select I2C


-- 
Jean Delvare
SUSE L3 Support
