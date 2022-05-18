Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1652C24C
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 20:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B8010E587;
	Wed, 18 May 2022 18:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9309B10E587
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 18:30:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 349FF1F9C4;
 Wed, 18 May 2022 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652898610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhFDl2NOlV91LYZ76ENca4DEnibAY9AsTKgpOxk6/Lc=;
 b=wMsWtuBhE56i8OgwKTz+ZhItOV2OWx6xUDrHDlFg3KYXU/3jkr67BwkzfM9q3OT7w9i18P
 uZexzv1A4dzD8aTkoVKIYYXfmCn1uem2xb2Rn4jbbOJuYeynO9qkCMjb0hqv3IEHfvIXeH
 IGpIpdpTda/GRF/exK08N/7qejbyXjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652898610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhFDl2NOlV91LYZ76ENca4DEnibAY9AsTKgpOxk6/Lc=;
 b=qmyJSBzXsHKtMCjXRivek24kDukp5WMRHl3fYz3MMpdK836l/NuDX/tt1BAV/3E9BPlA6m
 5IGAkWzZr1MlooDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4DBE13ADC;
 Wed, 18 May 2022 18:30:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QKQCNzE7hWLPGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 18 May 2022 18:30:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH 1/2] MAINTAINERS: Broaden scope of simpledrm entry
Date: Wed, 18 May 2022 20:30:05 +0200
Message-Id: <20220518183006.14548-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518183006.14548-1-tzimmermann@suse.de>
References: <20220518183006.14548-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There will be more DRM drivers for firmware-provided framebuffers. Use
the existing entry for simpledrm instead of adding a new one for each
driver. Also add DRM's aperture helpers, which are part of the driver's
infrastructure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c1fd93d9050..43d833273ae9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6388,13 +6388,15 @@ S:	Orphan / Obsolete
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

