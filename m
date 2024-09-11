Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F86975C1E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34DA10EAA0;
	Wed, 11 Sep 2024 20:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XITp1LHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2F610E9A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:48:44 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7d4f9e39c55so4650325a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726062524; x=1726667324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jCx961giDzkawX4RkON4d9oRpJgphqstJWVnXbsVBFk=;
 b=XITp1LHGw3F3hgjUtnyf7Vvtc9/TFx1jcmjuVIPVAaaagDXo5nrby4AZX2NvyWE/2r
 /yAn7DaSNtLjIaxKL+D4dBgm/DADkG4K55KvO48B0/1s41sIxlam+Op0RjlSkGJ2b/zR
 vLsiZr98ArGKQVdAzQiI4asj0CutZVD9CLN0SFcRbqgJGdMpCoLWnAVe8aELnLm66Ybw
 OZDdjC2m9XhVyw8kc9X0PcxsTIZXazUNZD1xCWt+JQqJgmiejA5sC+iYwWilyrf9DmWQ
 sMor01LppaMfHn6YRocNPkLtp+jDfRVpu9/tVNMr+r9chgoJVBEow4jBFdREOVUoJonh
 PVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726062524; x=1726667324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jCx961giDzkawX4RkON4d9oRpJgphqstJWVnXbsVBFk=;
 b=HJ5P1NdxQJ8DEO5LuIcIY5nhRF7q9nXUcOJWXRbKgUNahmCP+0M8DxDB2Q8jUXcIWS
 C8pGVjEJUrA2Eg1UMHi6WoD+XzGRxW86drjmshYXhCNnXTHlWCOdlMxMIYZ5RxzxlL5W
 Z2PJ8HeiOMlsM8JMZutXKkOeeg+EfQQI5ZvLHYgp9hBLlooiG/yT//NejQ6CP2wkV9LO
 NvXg0/gabRNISLFLNhCm3UrcZXcWmDbz41LJOILk7A9nzG3MBlnxqN9+69KGHkJZjioz
 ubgp9jPtNRzz/qqK5OGaDv3SCGRjQF/IxF4Sih1slJkOwtrT+IbG2iiSTQFhWWfW5V1a
 6h+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXccsh5Kf/+78qi6B4my0cPYdi3imGt3U7wPSBuSq0BFTpi97JBBiMLDS92zp6oosrHxlzvN1LKm6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5N2sFewSsuzSRxGcs8gCI6OblBB1AMCAUNbP/voe4aOW79gsL
 gF9lH/dKAqwWBjbZl/gyR8Ru+iiATcFs8PacTJpV7JThKHTTd1zB
X-Google-Smtp-Source: AGHT+IEEaBij1LC75ufDL1ammpPlxeRl+6VZZLpg5ZDFJiqcVeBdQwOQhSrfa0mDiJYnHvvijk98BA==
X-Received: by 2002:a05:6a21:513:b0:1cf:337e:98f6 with SMTP id
 adf61e73a8af0-1cf5e13350amr4446721637.29.1726062523749; 
 Wed, 11 Sep 2024 06:48:43 -0700 (PDT)
Received: from maloca.localdomain (d162-157-58-14.abhsia.telus.net.
 [162.157.58.14]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fc8d76sm2989232b3a.4.2024.09.11.06.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 06:48:43 -0700 (PDT)
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] MAINTAINERS: remove myself as a VKMS maintainer
Date: Wed, 11 Sep 2024 07:50:46 -0600
Message-ID: <20240911135051.44579-1-rodrigosiqueiramelo@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Sep 2024 20:58:09 +0000
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

I haven't been able to follow or review the work on the driver for a
long time and I don't see the situation improving anytime soon. Hence,
this commit removes me from the maintainers list.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 333ed0718175..1e6356a1b6c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7346,7 +7346,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/udl/
 
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
-M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
 M:	Maíra Canal <mairacanal@riseup.net>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
 R:	Simona Vetter <simona@ffwll.ch>
-- 
2.46.0

