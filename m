Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD071CFF079
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 18:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C5610E268;
	Wed,  7 Jan 2026 17:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CPsVyJJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com
 [209.85.214.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1E210E2A9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 17:12:46 +0000 (UTC)
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-2a0d0788adaso17261095ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 09:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767805966; x=1768410766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUMcpo3FyNZz5PJeq6x6M9ZsOLHzPhUzACdQ7/revgs=;
 b=EybvxUMuFmQszG1cz5l3h3LZlqqXFxXQZQiqxK5OkD1vcFJnCyMasTu4OS0pU6Pmtk
 cpRqgDmsjAVgvI+H+VnkAGoMq8ecQ+9VVgXvOM62ilgtEykuLeHv2FkNSNmwzNNV4wPX
 ZVzlpQgMhy6ltq6Fp1il01M8botfqagpU3h879uBdh2KA+b1KQ2PVqeceLvPSjjDtg7D
 ryXD+cn+BPxIm+MPyv9myJ+obrNgdfS/Zn8lJRdLIIZm+g/OTlnmeBJf6Xm9M+BeTqW4
 0K7MAfNfgHNo7S29TBR2ZPqVaRRUVTg91jyjzgomVvd9uHmFZTeb8peSaWfA2uoITIQP
 B75w==
X-Gm-Message-State: AOJu0Ywk1ufgvB9QesgJ846FGimcTQ3VDvA5ZmdJlmWGzZKFQ4gsKs4L
 er8WFWDLeK7l/iBw3G3SVK1e7UXFsOJeTKZjkQOsEAppW2X9YZf+wFtvWMEqHES36znASfj4pyu
 87bS4D1g659Ugrgb8U8tCjVzDg4r+4YpOUQ0tG8FSf4rpTcyWRlOk3GrOnwtO/45fXZtQoNZkGx
 xDNKam0t6i3E69WNZMZKHO5ZUjdEQwmMih1IdIAF1wYShVqVfma5mfQ/N/CXL6oTlE3ryfkQd8Z
 LMrGTuHacBI8DClGkGc
X-Gm-Gg: AY/fxX7ljtmLaIfMH8d68bW1k96Rs/ClCq7oUvBkGIzE1nyTEXT1NqmTqBzBsrHaqfJ
 k7Xo4C9Qsju/F0h+cCoeWxlR0ITGQr/N6i6uOhyKvMSjTjS1q0ek7EfyrIVG4eAUHgMUMlAsEhT
 cI+KzByJXlBC2AD7ntC5Em1X9l444sV9BrHEPKx0/WTlCKdikNkfK1lK3wbePv0H2z5PIkuRAQA
 6KJ4w370mJDXr2dHl6frcYUamY+LyMXq/08RXcEKoHCOMMc2ZNOPVIXfxFF1v7w4jrgoRV+rRv4
 azRApIb2W1jW4gieVVSjsuaIygRbbZnEQRcRRA9srxZ0Fv2F1sGcXgMDUQ/RJdoUjke3FrLfD2B
 anXysMF+SWstn1Aho2DxbTXJ4Lgwg0fhosuklQtIRsJFMukXyB1ezWsaa+Ro3Zd0FIhnxMHA2pj
 957rK95pD6zj2HEXHoMwGThZO9vHH6cQ812tiIqF0=
X-Google-Smtp-Source: AGHT+IG/AOFMkXhxz3UhIhZW3qwDU1cD09KKdnjfztqS8V46Tf2E53AgTWkroD8tyPop341RE/STXNxBCx6l
X-Received: by 2002:a17:903:248:b0:2a0:fb1c:144c with SMTP id
 d9443c01a7336-2a3ee40ee95mr28896615ad.5.1767805965789; 
 Wed, 07 Jan 2026 09:12:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2a3e3ccfb79sm6578835ad.57.2026.01.07.09.12.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jan 2026 09:12:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-11f3b54cfdeso1923239c88.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 09:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767805963; x=1768410763;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kUMcpo3FyNZz5PJeq6x6M9ZsOLHzPhUzACdQ7/revgs=;
 b=CPsVyJJDlwbmRBGKRh3yx3/BUts7CIgmI/CyoZL+0QGlL0cGlqyotVcjVFXXsIWxXM
 NgI4xcXpptZynwJ/hhEVfrWcR0IidPAu2+5tpoyavJ1oS1xr1UDzgpbifc1hu1USsKJQ
 /reluE2M2BvY/lIqPR6Ks+W4K2Jgw8y04WdKw=
X-Received: by 2002:a05:7022:428f:b0:119:e56b:98b0 with SMTP id
 a92af1059eb24-121f8b7957cmr1893861c88.23.1767805963236; 
 Wed, 07 Jan 2026 09:12:43 -0800 (PST)
X-Received: by 2002:a05:7022:428f:b0:119:e56b:98b0 with SMTP id
 a92af1059eb24-121f8b7957cmr1893833c88.23.1767805962471; 
 Wed, 07 Jan 2026 09:12:42 -0800 (PST)
Received: from localhost.localdomain ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121f24984b0sm11420146c88.14.2026.01.07.09.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 09:12:41 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 maaz.mombasawala@broadcom.com, Brad Spengler <brad.spengler@opensrcsec.com>
Subject: [PATCH] drm/vmwgfx: Fix invalid kref_put callback in
 vmw_bo_dirty_release
Date: Wed,  7 Jan 2026 12:12:36 -0500
Message-ID: <20260107171236.3573118-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

From: Brad Spengler <brad.spengler@opensrcsec.com>

The kref_put() call uses (void *)kvfree as the release callback, which
is incorrect. kref_put() expects a function with signature
void (*release)(struct kref *), but kvfree has signature
void (*)(const void *). Calling through an incompatible function pointer
is undefined behavior.

The code only worked by accident because ref_count is the first member
of vmw_bo_dirty, making the kref pointer equal to the struct pointer.

Fix this by adding a proper release callback that uses container_of()
to retrieve the containing structure before freeing.

Fixes: c1962742ffff ("drm/vmwgfx: Use kref in vmw_bo_dirty")
Signed-off-by: Brad Spengler <brad.spengler@opensrcsec.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index fd4e76486f2d..45561bc1c9ef 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -260,6 +260,13 @@ int vmw_bo_dirty_add(struct vmw_bo *vbo)
 	return ret;
 }
 
+static void vmw_bo_dirty_free(struct kref *kref)
+{
+	struct vmw_bo_dirty *dirty = container_of(kref, struct vmw_bo_dirty, ref_count);
+
+	kvfree(dirty);
+}
+
 /**
  * vmw_bo_dirty_release - Release a dirty-tracking user from a buffer object
  * @vbo: The buffer object
@@ -274,7 +281,7 @@ void vmw_bo_dirty_release(struct vmw_bo *vbo)
 {
 	struct vmw_bo_dirty *dirty = vbo->dirty;
 
-	if (dirty && kref_put(&dirty->ref_count, (void *)kvfree))
+	if (dirty && kref_put(&dirty->ref_count, vmw_bo_dirty_free))
 		vbo->dirty = NULL;
 }
 
-- 
2.48.1

