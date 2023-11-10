Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5C7E7DED
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A13B10E125;
	Fri, 10 Nov 2023 16:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B5C10E125
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 16:58:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBD39219A8;
 Fri, 10 Nov 2023 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699635535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+3mM52AXpOZ9MrEKYPBVbqVv8vvAn3QwzxWDKzZSW1U=;
 b=FsbxarlHHH4HkZej1w4IRXAexRalSUEGHP0HPV8s0hXfVxZn4voAbOEKkYQEMiL5elfLwz
 rCjpyrk8rpjTU+43DAQ6zgA6Zn3Lc+v4Lquq/GMBiB4ZzbZtln5Q/miEjU53n1teo2bNIK
 csNTbwYW/1cI8n5q++7gaPYmBYgCqsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699635535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+3mM52AXpOZ9MrEKYPBVbqVv8vvAn3QwzxWDKzZSW1U=;
 b=qsVsqfrBp5RxDPS2Gri/OF5naqWZWOpsZUf48wkXFnHalVCRpWEEPE8MaDtEc993Ztkco+
 f5nFGnbmHyM3zYCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3D6C138FC;
 Fri, 10 Nov 2023 16:58:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r3hMJk9hTmWDHgAAMHmgww
 (envelope-from <jdelvare@suse.de>); Fri, 10 Nov 2023 16:58:55 +0000
Date: Fri, 10 Nov 2023 17:58:54 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Dependencies of DRM_LOONGSON
Message-ID: <20231110175854.40ee0629@endymion.delvare>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingfeng,

You recently added the loongson drm driver to the Linux kernel tree.
Unlike all other loongson drivers, the drm driver doesn't have any
dependency set on the platform or architecture, and is therefore
proposed on all architectures. As far as I understand, this driver is
only useful on Loongson-based MIPS systems, therefore I believe it
should only be offered as an option on these systems.

Would the following change be OK with you?

From: Jean Delvare <jdelvare@suse.de>
Subject: drm/loongson: Add platform dependency

Only offer the Loongson DRM driver as an option on platforms where
it makes sense.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/gpu/drm/loongson/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-6.6.orig/drivers/gpu/drm/loongson/Kconfig
+++ linux-6.6/drivers/gpu/drm/loongson/Kconfig
@@ -3,6 +3,7 @@
 config DRM_LOONGSON
 	tristate "DRM support for Loongson Graphics"
 	depends on DRM && PCI && MMU
+	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select I2C

Thanks,
-- 
Jean Delvare
SUSE L3 Support
