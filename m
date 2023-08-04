Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E398B77008A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 14:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1AC10E6EA;
	Fri,  4 Aug 2023 12:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631FC10E6ED
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691153527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E5xN1heImVZNR+PxjfKlixHWlk07JRG1661WVNvOkoo=;
 b=L0zVSgOCW5I4EX+EPlGDvUwwxyn7KB79bKOgO5Az6vTXBGeku9ytl78Kap5dT3axwXCo1k
 8GT5a6LG4VP8wKjNnkVWntfGHmdFlGq0IO1HcHa+JEF24zYVsEQMHeuJO6hDzSqF8A2LIY
 gtRQlPXgZgVsFRQwhcNoYCVtPEgF53E=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-oGHEA1UnMBWW0U92HxPdeA-1; Fri, 04 Aug 2023 08:52:06 -0400
X-MC-Unique: oGHEA1UnMBWW0U92HxPdeA-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-56c8f0995faso2824169eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 05:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691153525; x=1691758325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E5xN1heImVZNR+PxjfKlixHWlk07JRG1661WVNvOkoo=;
 b=Z7oVc+t+aPvoOdkarrsiVfUsr6G2i3d2sKg8IE9+CsuLrZ+HB98S2SzLYp9TirE1Mh
 SZG9MafBVNhzuSrUtEZXxEfu8JEcHLIPpwSl1n2c7FHWNTIc3fnctkf50Ja81k+xiwZD
 S+hpK4uBckSnrZggTgF7w0VpEMpbVrTZcIvlZUIOBfs+UZILxCSgETd97ikDKqyOIFJc
 0AqHOi8IcEkTkuW9uJXjTVZAFG9AfnKmnNMWhRAsDtlhp8Fe3CNbosOPUD5P3/s7Tx1N
 KJlFEWL6rdEM3gZdELpFRDjZrakpSaJy2uvdT7h/Z8fG4S4w+DEyKPEolmPI+QKFrlb0
 0fag==
X-Gm-Message-State: AOJu0Ywh+rNA6Jir9vG7Ayjhhs0rf/KF5ozTThFWZ/1v2K7w+tG1NKN/
 ZDkiIjbkPKT+Cw5mgc2NrDlb35Ti0fG+2tjFHohjjyZdnPQq7aKSxEaQ1aLe8JkDWxV8DoEcI42
 TirN28VHgQoulvZddzodSfss85u4t
X-Received: by 2002:a4a:3018:0:b0:56c:7428:4a35 with SMTP id
 q24-20020a4a3018000000b0056c74284a35mr1492081oof.7.1691153525464; 
 Fri, 04 Aug 2023 05:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOrbC6e26HbOemq9s/V8xZIA7GMJmKyBDN30iDQnRLjJ8J9R4Y4jCYk1e12SwM9ZEwgrCyCw==
X-Received: by 2002:a4a:3018:0:b0:56c:7428:4a35 with SMTP id
 q24-20020a4a3018000000b0056c74284a35mr1492063oof.7.1691153525185; 
 Fri, 04 Aug 2023 05:52:05 -0700 (PDT)
Received: from minerva.. ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 r19-20020a4a3713000000b0056c589d98bcsm942085oor.1.2023.08.04.05.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 05:52:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION
Date: Fri,  4 Aug 2023 14:51:43 +0200
Message-ID: <20230804125156.1387542-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
to an effective 'select FB_CORE', so any config that previously had DRM=y
and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.

This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
as reported by Arthur Grillo, e.g:

WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
  Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]

Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
be to enable DRM fbdev emulation but without a framebuffer console.

Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b51c6a141dfa..2a44b9419d4d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -135,7 +135,6 @@ config DRM_DEBUG_MODESET_LOCK
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
 	help
-- 
2.41.0

