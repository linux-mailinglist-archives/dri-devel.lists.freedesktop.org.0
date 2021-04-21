Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE43673AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7BD6E9F3;
	Wed, 21 Apr 2021 19:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F486E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:47:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso1917562wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/b4PlwxeP2QN4jZJPRCUuw530f+oAMFiERG4rj/EFOU=;
 b=oRb/Pv7kKn6wnsQoRvbOHot0M6ERkC5VhaOWWR9PziWbjjeHA4mMoLvIDw4jv9NQeN
 +uB8lGcgtWmIXdzPDScHmJzixhHWpHObtqEBdOQvlmAApqk8g6Pxgo1Ngax39zr4OhbJ
 Jw+qGjGRsOofNnwPUsdy2R8epkMkQWt8Ie/NpXyCFcd6aFROHl8ZEHS0OIBI8AP1NG+J
 2X9IrP6HtnyHnAu39yW56UpSqq6hrZ2OI+5z2HkZlagtsc8Vt7kVNLluICtnfoL/BdCx
 HG9rHoLExR8S3kWPRBGanrdENDBbQeaLf5DTieVAzLOUFccx1yZBV/9PzIYC/pljKIf8
 3+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/b4PlwxeP2QN4jZJPRCUuw530f+oAMFiERG4rj/EFOU=;
 b=jmb7XP8kMHbEjyJDZW8aI+AA/0ohy3QEdZtlavQduMgnioUe4AlGJKdDLnYYe3jM7g
 AoQJdt1xNM/1jh/Y0TeUZ9ybcT9SmWH6NlpjOxv/uVywFTPIkNcEDdBpnq2O5+F8Ui+s
 dEDP1J02kzvK6XcD0Ykq+Tsu/n8i/81VPQCGdzxmJzQok9rrDZGajrsjtupCmOsQ9UA3
 kqSTJsYhJ1YK4OCwEn9PeZWjOsZ0wauVqrbveznFyrQvRhqG9Zk8Ot3Cc+4VPnhYGbB+
 cj68T4mPF/pf2W1SSitXfP7LwY7GGK41RLHOKmq/CRobPkgv5fusPXHcx75aj+r2Er6e
 /gHw==
X-Gm-Message-State: AOAM531Mpm3a4GUQTX3S1VPIGMfQJsRzIAGfmkEzk2UWPNj0qtdEA2u0
 z70wqQuNNItvGOml01WrcJk=
X-Google-Smtp-Source: ABdhPJymZJaAG6iK8rk6VTmbVcTXlqdX94dLNUJfkHzsI39JJC1B0LOSzvtXV6qUC3J7GB3Fxl+4fg==
X-Received: by 2002:a05:600c:2d56:: with SMTP id
 a22mr11476861wmg.175.1619034426954; 
 Wed, 21 Apr 2021 12:47:06 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 c6sm13004217wmr.0.2021.04.21.12.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:47:06 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/5] drm: drm_bufs.c: Adjust end of block comment
Date: Wed, 21 Apr 2021 20:46:56 +0100
Message-Id: <c3a261994b88f6fc39f69ee8c1af8ab115d76a87.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new line with */ on the last line of a block comment to follow the
Linux kernel coding conventions.
Problem found by checkpatch.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index e3d77dfefb0a..731a42a31c44 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -325,7 +325,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		/* dma_addr_t is 64bit on i386 with CONFIG_HIGHMEM64G,
 		 * As we're limiting the address to 2^32-1 (or less),
 		 * casting it down to 32 bits is no problem, but we
-		 * need to point to a 64bit variable first. */
+		 * need to point to a 64bit variable first.
+		 */
 		map->handle = dma_alloc_coherent(dev->dev,
 						 map->size,
 						 &map->offset,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
