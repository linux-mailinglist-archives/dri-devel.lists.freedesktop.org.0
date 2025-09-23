Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C892B950CB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDC910E59E;
	Tue, 23 Sep 2025 08:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0edCd5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254D610E59E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:43:57 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b28e1b87aa7so377890466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758617036; x=1759221836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/mGp4D0/N7zj9lqu2hqSY2BaksNmyzuS6a+IwtNsiCQ=;
 b=G0edCd5WyGvEtqUY7eoAnou+6J2GwHSAPoomy+jbA1Brc9yVq/gXmiRrjQG1hU5nef
 rrEb0LG9gU+TggWyGkVFDQlk2sTiik9mqk8wSXfeRPWudreZ0Z8JVZS/anE3Q3Z9VKkr
 HS7ojhwo6bJJFD5aTs9os8Ys1xtz4iiLcx450IYGLxZl8hyXADNBwWQX7q9Y/Ucgpt93
 TOXujeXcgFzgaTYFnN6bh/1nsIxDOpDUKe+K2dGhkyTtGhUgkB5FPobAwxJ2Gb4P5e85
 7NG8W7y9RqzTKn83iV7+9XPhZQrc+44jeUNK76/5cXnFVUANpcMiz6+sxhwy17gshA31
 +5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758617036; x=1759221836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/mGp4D0/N7zj9lqu2hqSY2BaksNmyzuS6a+IwtNsiCQ=;
 b=UFNbpl2ysPxt9YOkFHGa4qdHLEkSXqSd3ficKR06dYxui174j3B7YnMAe3ZsEslnG0
 1xrMsm05WxSTQjtjItBxa4oC8qVjrXxsjqb84vKCc8sMKiU6mZdT8cjVhquBi4K3I6Qu
 BCi/yMH9MvIsggwxKDun9umE77NYkbpIH37JJbj1KtrNDfqLwkwy6YU6NlkrIzCSVmEl
 HcwRz+4c0SrEhhZZnK2gaukWrhOJCNu1t7bXpr16XL3VtqHOkZxRmn6AqmF7mWqwIDNA
 t/De+WHeUlXZPuchRekVoeBHbCPBLQcB7jJ+LeC+h2lTb3ycRaZo9JarGCCDdD8nhrl1
 Qsyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiN+TCL1EVMpqE9K6VBU0qWFH5Wc9ZDmO8LfMvWpH41iSUHd6lRjDVZSP0/Z4L9mnbMupDxazXRSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4HpsKrH7jmo/8AvncUSvKXFwnAwAeVvy3pc4Lw4UGcGoEsmQN
 BDd3HveFpcC9BliaVvUeelEqTFX11bjutRBsKo3VbHFi+4QtAXMPK50a
X-Gm-Gg: ASbGncsH3VK9J2S4hL5bZ+3QHTD6O65tksEeAeLC0/2bYyJok13PUONNOeUXPDIyWy5
 5CabiGxkql0AR/1ZzNQv9txZMu4vFpDQFuU+7yKZeDMXNqEWsnEVcIeqbVDZlJD9VCjtjeU4roi
 PtwTZlx6q1k2XkL74MjvQeSFKGezrMxTF1ZG/1DQH8XMnI6g7X6Ghc0F2COQ9byfJ2x+JkUwDQk
 mejEJ/X5AmkVCgmaGZocIpowm36V/AfN46Qyi2+fS44eN2/2kH3IAsA/ONGvlspXPe1fKEZL3j8
 EcZqA1qdA75DzwzTxN9BBcdC4pXifTA7SZBAtIiuwB3PpjdUKBwK+XGM4W5s2PJO/r5x/prAGev
 wkdBSa2jhLwhwCKqW838yJxiBew==
X-Google-Smtp-Source: AGHT+IHZf6TnZmvJ/kWnGmv0GcPcYtIPGdUTBRc/Tnmg6bn8o3PfdZRyuZLiArXHvkr85ZYF6HZWCQ==
X-Received: by 2002:a17:906:dc8d:b0:b2b:62f8:e490 with SMTP id
 a640c23a62f3a-b3027a4ace6mr168920566b.27.1758617035386; 
 Tue, 23 Sep 2025 01:43:55 -0700 (PDT)
Received: from hsukr3.. ([141.70.88.200]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b261bdfe8d2sm943936766b.58.2025.09.23.01.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 01:43:55 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Sukrut Heroorkar <hsukrut3@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] fbdev/radeon: Update stale product link in Kconfig/FB_RADEON
Date: Tue, 23 Sep 2025 10:41:50 +0200
Message-ID: <20250923084157.11582-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous Radeon product page link was no longer valid. Repalce
it with the current working link.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c21484d15f0c..3037455adf48 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -949,7 +949,7 @@ config FB_RADEON
 	  don't need to choose this to run the Radeon in plain VGA mode.
 
 	  There is a product page at
-	  https://products.amd.com/en-us/GraphicCardResult.aspx
+	  https://www.amd.com/en/products/specifications/graphics.html
 
 config FB_RADEON_I2C
 	bool "DDC/I2C for ATI Radeon support"
-- 
2.43.0

