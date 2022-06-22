Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92649554C03
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3010F0E7;
	Wed, 22 Jun 2022 14:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F2910FE40
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:01:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D673221C2A;
 Wed, 22 Jun 2022 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655906496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzekeBi4Y7KZsC56z0dvdn1JMQTC3UW1T2mc7ZG1Qag=;
 b=Q5or96XnbPgFbUBfpam2kqhkYDdnoBN/8lSPuXXtgcmbS1HLL9gqzgEP9wgi5nMjnI9knj
 FIGhRXi51pm2R7DBcLXZHHqvekcEy8SrRw9ZxNbRTLG1oRPc1VbIDJ418GalK6J2KC74wT
 tPuyBRFadtbZpGHp4Sq+O6rEgLo0m3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655906496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzekeBi4Y7KZsC56z0dvdn1JMQTC3UW1T2mc7ZG1Qag=;
 b=RQKePWKJdUv87dWW2oQ6/398YRfc9wQIQATig2QDQze8Qjkeya1QVAONohAUKJD6yifrHr
 TTWYgFjOExzxdCDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8874A13AC7;
 Wed, 22 Jun 2022 14:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qGtiIMAgs2IVRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Jun 2022 14:01:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alex.williamson@redhat.com, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org,
 javierm@redhat.com, lersek@redhat.com, kraxel@redhat.com
Subject: [PATCH v3 1/3] MAINTAINERS: Broaden scope of simpledrm entry
Date: Wed, 22 Jun 2022 16:01:32 +0200
Message-Id: <20220622140134.12763-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622140134.12763-1-tzimmermann@suse.de>
References: <20220622140134.12763-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There will be more DRM drivers for firmware-provided framebuffers. Use
the existing entry for simpledrm instead of adding a new one for each
driver. Also add DRM's aperture helpers, which are part of the driver's
infrastructure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0275a0b4fe6..d4c091739db2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6466,13 +6466,15 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/savage/
 F:	include/uapi/drm/savage_drm.h
 
-DRM DRIVER FOR SIMPLE FRAMEBUFFERS
+DRM DRIVER FOR FIRMWARE FRAMEBUFFERS
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/drm_aperture.c
 F:	drivers/gpu/drm/tiny/simpledrm.c
+F:	include/drm/drm_aperture.h
 
 DRM DRIVER FOR SIS VIDEO CARDS
 S:	Orphan / Obsolete
-- 
2.36.1

