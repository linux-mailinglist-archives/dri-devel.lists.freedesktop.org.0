Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F36C2F5BF3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 09:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928E89852;
	Thu, 14 Jan 2021 08:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FE489852
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:05:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB99823A56;
 Thu, 14 Jan 2021 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610611500;
 bh=3L3VSinaQV9/6wu4p400uD1amdFzsglY2QC0uVTTqUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S2lFIy8ETL8fZ9yUfZ3GD9Med6hNEOB9E9l/8pU6hADeHiU0u9D27nczLHKgnywG8
 hRz6LQ51tA79iHTO056IdFECyy/O3U+jmalvlbifS1Pk6zZb8UIDNPK1Bc/p8Z9pqL
 L0ZRGASxvkNcLuEJX2jDiBJYOW/mt5PRigHoyt6RaXPy3VZOVMDvMd3UA4WCmDyz5i
 QkMSs8CuevceyizAEqO+cyicQPhbnxq2TN5kNSab06SEtrloyrvf0gnZO+VyOdPhwb
 Tb9ENkCey+xFc3b7w3IVWiF50puzBhYcQ/OmibnpauIXLujdPlnj7YQVEpfmMTpK/H
 v06KihDjIFqGQ==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzxco-00EQ72-GG; Thu, 14 Jan 2021 09:04:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v6 15/16] drm: drm_crc: fix a kernel-doc markup
Date: Thu, 14 Jan 2021 09:04:51 +0100
Message-Id: <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A function has a different name between their prototype
and its kernel-doc markup:

	../include/drm/drm_crtc.h:1257: warning: expecting prototype for drm_crtc_alloc_with_planes(). Prototype was for drmm_crtc_alloc_with_planes() instead

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_crtc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 540e2e43ec93..13eeba2a750a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1232,7 +1232,7 @@ void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 				    const char *name, ...);
 
 /**
- * drm_crtc_alloc_with_planes - Allocate and initialize a new CRTC object with
+ * drmm_crtc_alloc_with_planes - Allocate and initialize a new CRTC object with
  *    specified primary and cursor planes.
  * @dev: DRM device
  * @type: the type of the struct which contains struct &drm_crtc
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
