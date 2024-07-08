Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433392A8E7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 20:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57CB10E2FD;
	Mon,  8 Jul 2024 18:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bDuMxd78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3788010E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 17:23:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-1fb3cf78fcaso25370805ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720459382; x=1721064182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l8dssTOE5YtjaCpjIjX/bht9CAwJzQ5jf+TiBoCd/rc=;
 b=bDuMxd783NbK2qiSQQUDgRKm1AVQs69/GlPDvzPSbTJ2jjPKtgvB9YiNUQOLgZKVeg
 uIZDudgDZNJw9IktngGj4FsPDz8Y4J1RP3qfdllIOlXS8g1lXfNifhwGtR7h7gIYpD7R
 NjoHVsPQc1SEGL9VDJOuwJjanEfHbYp36h3HIGXgSANh3ZJxveZJPXbJrhrZyKaAulnd
 L/pFirWJgHFRZ5Ao14AToMtaqTGQzy+mf16V1GwsQhsS7xcniHhUZyDWqGFd66z6H64h
 N7fbIRzl5i9vus5P8CxjQgW6rFd9PH5woxhrjbDzbi9Cy5eaoJcCWALnnBLDE1n1ikNZ
 lRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720459382; x=1721064182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8dssTOE5YtjaCpjIjX/bht9CAwJzQ5jf+TiBoCd/rc=;
 b=nI8gaekorxE/s7faS96YDEuHh3UFUikNNSonJ27uSZlhdHkB5xoRTiOOCGLIRpQu55
 jODbRECF9R+69pNtEkzNenbZUwKNzRKvL/LvSYx/e70RNsOvs0T6muHSpQuXfgcNdpaU
 96Avl8lGsy/GXB3vJyH8tvUQzQguqkZyuLuznEVjkghioF9mJI/oD9C8cNaEDu02j5nJ
 QfLXya1UcXZbt7KnyYDHvl6IuFcEo/FM0GA9NZrIeYzjVoNACTBU9482Uc3rCB1Boo5K
 gAjmlV4GlsikvTc58cocMuhCE5VGth6OXgHF/duGUmk8SsoUjDmm+N1DpqVvyaQ1UFlH
 +KmA==
X-Gm-Message-State: AOJu0Ywbz7Rg9+sYK3z49RHXjFlA6r8yUO/TbK9wumOwjPPdHT4oFiO0
 VbpT71u6R8aeIuYbJeAYpW5pRnSOaT4Z4eEmwZLCDWchF7A8v3jo
X-Google-Smtp-Source: AGHT+IEnHd1r/rT95kPOKGYZBxgklx50F/DDhELRb5rGAwZPK7BNWUon2xTWMeDCG3gWIbiM3Cj76A==
X-Received: by 2002:a17:902:e84f:b0:1fb:3b30:8ce0 with SMTP id
 d9443c01a7336-1fbb6ed5798mr1508735ad.44.1720459381664; 
 Mon, 08 Jul 2024 10:23:01 -0700 (PDT)
Received: from embed-PC.. ([122.173.216.255]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a10852sm1190705ad.27.2024.07.08.10.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:23:00 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli24@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Abhishek Tamboli <abhishektamboli24@gmail.com>
Subject: [PATCH] drm: Add documentation for struct drm_plane_size_hint members
Date: Mon,  8 Jul 2024 22:52:24 +0530
Message-Id: <20240708172224.46073-1-abhishektamboli24@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Jul 2024 18:21:55 +0000
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

Add descriptions for 'width' and 'height' members in struct
drm_plane_size_hint to improve clarity and documentation coverage.

Signed-off-by: Abhishek Tamboli <abhishektamboli24@gmail.com>
---
 include/uapi/drm/drm_mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1ca5c7e418fd..25891a636e4f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -872,7 +872,13 @@ struct drm_color_lut {
  * array of struct drm_plane_size_hint.
  */
 struct drm_plane_size_hint {
+	/**
+	 * @width: Width of the plane size hint.
+	 */
 	__u16 width;
+	/**
+	 * @height: Height of the plane size hint.
+	 */
 	__u16 height;
 };
 
-- 
2.34.1

