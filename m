Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8EC4A4FFC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4DC10E3F9;
	Mon, 31 Jan 2022 20:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CFD10E437
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643660150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P/KHNPBIlcRDaY5ETa8oTdy0xiJiz17FpbXZqN4X7V4=;
 b=OoLJot0H+vf0ohfIJX9ItZagq+Z/conCPSuJkpAUZfSlGZeOlb1E8f/RtjqYFREau6lJgE
 5LMWM7IsRPx2DOTUn9LJEPfE+RNvDwRGC00AoWFA6fF9k8I83duu78sh1hXeN90FrrsKa1
 yEH9JyG7A3VDyXPXFqbDD+bRHZuOtAI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-A3-c3FDKPG-MLbxnCaoYmw-1; Mon, 31 Jan 2022 15:15:48 -0500
X-MC-Unique: A3-c3FDKPG-MLbxnCaoYmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 q71-20020a1ca74a000000b003507f38e330so119765wme.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/KHNPBIlcRDaY5ETa8oTdy0xiJiz17FpbXZqN4X7V4=;
 b=hxbAJ3xhoXzKBOWJBH/3BKqJ03Ga0VPuCA6s8n65uOIZOdjSSkNGl9z6EXZJFDRMIx
 l1CjlR34zPp5g3Q1pyz/GgioTbxoAg8I06aF5+PjgKAyIKHjXb30GrXF63IBjyOmuwb/
 mHxP1dNfyaIgKqoXMEONcEO1fwzCoQuR4PIvbt7HyExg3E454wi3u6rT8kFwkwSa0Tfl
 rHk4dn0yx0TejBA4t+g8RjiQZuoAS3YkNSHLuH2pX4lfw7HPOz9CM+8nKxsjMQa+13TG
 vpcjyfWu6vpTl6B/ODqzDsqtk5Zg0zsIb8oIq0V3o2caD3bd1criMSepECmLmAlTKsnA
 YBcw==
X-Gm-Message-State: AOAM533slm04+OuGZ0pDwhq9LCeBUsNh+1MdU7aiOGNqL5JTUulO2iZ4
 ZSWX1x+m3lEVI3up58OmpYFilTZpQSJBhv5/D8sdUsa9t33lfxzQUsk7NaDoJP5RxFxa6dLhCRO
 9lJdnGg8n/B73RcMsbhnC54tbaEPi
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr19296557wrz.54.1643660147627; 
 Mon, 31 Jan 2022 12:15:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkX67HueJQ6/s9AOMuGXHq/iOmq0TwIP4aXBdkOVjFwHzTVLicQvA1eGq6qlRfaX+3usULDg==
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr19296541wrz.54.1643660147387; 
 Mon, 31 Jan 2022 12:15:47 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o3sm12574638wrq.70.2022.01.31.12.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:15:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: Add entry for Solomon SSD1307 OLED displays
 DRM driver
Date: Mon, 31 Jan 2022 21:15:37 +0100
Message-Id: <20220131201537.2325487-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make sure that tools like the get_maintainer.pl script will suggest
to Cc me if patches are posted for this driver.

Also include the Device Tree binding for the old ssd1307fb fbdev driver
since the new DRM driver was made compatible with the existing binding.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..2e6c3aad5d71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6102,6 +6102,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
 
+DRM DRIVER FOR SOLOMON SSD1307 OLED DISPLAYS
+M:	Javier Martinez Canillas <javierm@redhat.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+F:	drivers/gpu/drm/tiny/ssd1307.c
+
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
-- 
2.34.1

