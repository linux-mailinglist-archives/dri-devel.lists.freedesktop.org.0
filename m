Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70D3904CE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606156EA3A;
	Tue, 25 May 2021 15:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1269D6EA3A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621955601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G/fCjyB7iNAHQ0ure1mFwutfJ1NArBGdlauCkoAWAjw=;
 b=POW68SmHMQkwYYdfJIGZ1v/zeEqeSgv2Qhnmbajp2s4NuC15rDy4hQ7M9xJd2JH0KCuxFc
 BC/YZoWQeQ0Z9Eni0N+DhE6EQJbqHKU2ZX+4QdRO8JKzmrO5y/g9fAdSx8gwAZW3yMLEPX
 veeLlLhaVwn3m25HdjJqN/4Ms92d3po=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-5cWznGYoNnS7Z8nBKODnAw-1; Tue, 25 May 2021 11:13:17 -0400
X-MC-Unique: 5cWznGYoNnS7Z8nBKODnAw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso14696107wrh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 08:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/fCjyB7iNAHQ0ure1mFwutfJ1NArBGdlauCkoAWAjw=;
 b=seknxSKiDhiw0685XXDpCEIxilf0OhvjVxR7lfYV2kUi7AO0q7I9KJ2lPfgNSptjuL
 l5EEYCd3xS1Lb2q3zSLWzeKOK4vPtJ634NisoaYjSBBEAJhN72T7i8HP3XwT+0Y3f199
 fV6+MOzscfJHt5K4CQ//wQ1UIB/MOWqc9A+micJmJRw1CRh8XcLV/8ILppcyv9LYWzp5
 g6F0PyhvrLhvscyfrhAnvbail3Xo7GtAANqtH32wvt4yl+V8DSXOKXlTCl2SpoAXphUt
 JL96LxXIgqhideumfRya04nYM1vKhIXBfQXK7Whv9znvRJtuBlNsCHbUhr7b6qyUmU0h
 cvrw==
X-Gm-Message-State: AOAM530lNbsC4s7+cb7nVJvNWKOSJyvr07nvkSQTqc0cMQDQmXughnjp
 as/DHPyMlJo2+EGMQlDeE2ENSrSmHHM0Nesk5Vk9RpfGtLZUq5UpfCAwvLCq99tUiTJLFj6LNM7
 hj+r3TMeB1kjz+YOhEXUnQTVnfVo/
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr27334635wrw.272.1621955596536; 
 Tue, 25 May 2021 08:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRW+ZtNXlXygGeJ2boKH56TGYwHy3jnjhrNP1uaP2v8xyPBBzPxW/IypraSH2vxWBBzjo0ZA==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr27334620wrw.272.1621955596297; 
 Tue, 25 May 2021 08:13:16 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id g11sm16396801wri.59.2021.05.25.08.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:13:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/fb-helper: improve DRM fbdev emulation device names
Date: Tue, 25 May 2021 17:13:13 +0200
Message-Id: <20210525151313.3379622-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Framebuffer devices that are registered by DRM drivers for fbdev emulation
have a "drmfb" suffix in their name. But makes them to be quite confusing
for drivers that already have "drm" in their name:

$ cat /proc/fb
0 rockchipdrmdrmfb

$ cat /proc/fb
0 simpledrmdrmfb

Also, there isn't a lot of value in adding these "drmfb" suffices to their
names, since users shouldn't really care if the FB devices were registered
by a real fbdev driver or a DRM driver using the fbdev emulation.

What programs should be interested about is if there's a DRM device, and
there are better ways to query that info than reading this procfs entry.

So let's just remove the suffix, which leads to much better device names:

$ cat /proc/fb
0 rockchipdrm

$ cat /proc/fb
0 simpledrm

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Just remove the "drmfb" suffix instead of using a different one (tzimmermann).

 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f6baa204612..d77a24507d3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			       sizes->fb_width, sizes->fb_height);
 
 	info->par = fb_helper;
-	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
+	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
 		 fb_helper->dev->driver->name);
 
 }
-- 
2.31.1

