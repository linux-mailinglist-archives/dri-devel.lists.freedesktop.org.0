Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3AD3673B3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E876E9FB;
	Wed, 21 Apr 2021 19:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DC86E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:47:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so3170646wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yfid5mt4o5SnHIBGrtPwH6oVDyBU8btfMOQ75Gb0/cY=;
 b=LKfsuxEC1pQx5HGYVdIakZHU1YNE76qyidClLc1Ingi52X2R8O0ujbEUwocr50BqHq
 FEQ11v/VpDyhweTsTFm8+L8ZAb5V2OgQKNxlZ1uNAUK6keMrv9fIvIRcatZenE93XCqY
 ECmBewYF8nWmY6k1y/EFhLnV1hp/ro93FHJcq1+oZBh7MIo+wQZnAOvri1u0GJEfcGo8
 pEGYgKaOIWJ7O/r0C9r7DQenrBkIQq8X2ZQ/C9neqiZ8Oy2dMR7aDZ3ZU3JZWKIvcU7r
 +VF3Fdk+Vt8aw4gM+rwHxsNw6kMhM9Fkgw186E9FHvut5+p3H5viZEkPWj0rhEWfwK2c
 t5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yfid5mt4o5SnHIBGrtPwH6oVDyBU8btfMOQ75Gb0/cY=;
 b=PMRrJtC0bscRrbqiqeKnpWoi69z0fUHlU4gZwJABv7qWXpgtbRaHhORRr+p2kU1Ijm
 2ZPtFY7Qol4+wfosVBt6KEavO+dbTfsO8t+9pDB9vZdUOJe7DEATTULdlO7ZiQipSiH6
 TDzyRBVDcNnM+QT3Pv+qpVw11vHF8khgBdo7Ig/QUvE0OYb6Q0oo9rGiUYVQaZ/Wo//9
 EPBCAUajdFh2frR2whwYDpX78lKTtu1Ee4dEw6Hq/rd+lTtZ1TVhCgBjP/dApIpITVxU
 dn4I8Zm0OUORLEt7jANekdK37l2Aoq8nSUoknxVuPIQxKOTtu/6Feh92/65T1TPWsMZO
 P+ow==
X-Gm-Message-State: AOAM5323iQ89z0Dq2ZrVONyuQuDUbNAyp0UomL6JAHzpIOEGiCBVbca/
 NSxAdoilt8+5r5DxJF1S/Do=
X-Google-Smtp-Source: ABdhPJz2uLV4nWLi4eXhOCtXdleTEIXrzjTgH7mD6Oolld/dVCTPksywDFUu1wAm+e7Y+o4O5Vx7JQ==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr11443875wmm.110.1619034432706; 
 Wed, 21 Apr 2021 12:47:12 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 c6sm13004217wmr.0.2021.04.21.12.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:47:11 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 5/5] drm: drm_context.c: Adjust end of block comment
Date: Wed, 21 Apr 2021 20:46:58 +0100
Message-Id: <341b1ae1475fad22035cf3ff11df73cd49063d4c.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
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
 drivers/gpu/drm/drm_context.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index c99be950bf17..54e3c513d6a5 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -312,7 +312,8 @@ static int drm_context_switch_complete(struct drm_device *dev,
 
 	/* If a context switch is ever initiated
 	   when the kernel holds the lock, release
-	   that lock here. */
+	   that lock here.
+	 */
 	clear_bit(0, &dev->context_flag);
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
