Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5E6A3DC0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A08D10E3AB;
	Mon, 27 Feb 2023 09:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8373010E388
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:04:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 7AB1A41A42;
 Mon, 27 Feb 2023 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1677488684;
 bh=6xesS6Ljou66pP6PWhd2jHCz/oRFGXqhqdZJF8Pqu1Q=;
 h=From:Date:Subject:To:Cc;
 b=w0xGWlmEV7OPrLJlrOKrWGYFhD0k444BX2duDEDHbSEjUVYQ8XOreZfl64+/x8zQH
 e0SpnCTY8SBVUD6RjDQFzlzITqdmLrgOTi5R4PYHq27qS1qVzHF6POb0EGCpY+FEck
 /fvehgHqgXkBypCtRZPfCnKbAZFb+lYphz5w0Cr9/xQM+Fx1yUPwqF52hzbfASQ9Nz
 sM2lNUGp06NxG/Dkiz+8J1R9w/tL4E/gq10DxQdXjDd7d0U1xOM64HZOQWt1OhBoW1
 cTpQVi4VTNrrN2NStOb1EM40dppWWWda7zPmoQdlchezWWwuTrV/cMGOip10w5oCO8
 AV6GKmQA+HN4Q==
From: Asahi Lina <lina@asahilina.net>
Date: Mon, 27 Feb 2023 18:04:21 +0900
Subject: [PATCH] drm/shmem-helper: Revert accidental non-GPL export
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
X-B4-Tracking: v=1; b=H4sIABRy/GMC/x2NQQqDMBBFryKz7kASlZZepXQR9dvMIlFmShHEu
 ze6fI//+DsZVGD0bHZS/MRkKRX8raExxfIBy1SZggutC+HOljIyY1sX/fIsGz/6eYJve+9dRzU
 booEHjWVMZ5ijlFOvirq+nl7v4/gDwpvuV3kAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677488681; l=1150;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=6xesS6Ljou66pP6PWhd2jHCz/oRFGXqhqdZJF8Pqu1Q=;
 b=HkugH8SjAQj8+MQlqS+NqL2h3dR12a7j47b1UtiTRuIfvIf4NwxK1ZD3DSg5iscrgwpF+jHpt
 GEJerGjGAoMB/Bnjfige8yg8ZPnbbwJq+F7DHst6hYKtD7Ra+vhgPIC
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The referenced commit added a wrapper for drm_gem_shmem_get_pages_sgt(),
but in the process it accidentally changed the export type from GPL to
non-GPL. Switch it back to GPL.

Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Fixes: ddddedaa0db9 ("drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()")
Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 7e5c6a8d0212..75185a960fc4 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -744,7 +744,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	return sgt;
 }
-EXPORT_SYMBOL(drm_gem_shmem_get_pages_sgt);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
 
 /**
  * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from

---
base-commit: f3a2439f20d918930cc4ae8f76fe1c1afd26958f
change-id: 20230227-shmem-export-fix-85fde1351104

Thank you,
~~ Lina

