Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0081D4A9A35
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 14:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56A10E72D;
	Fri,  4 Feb 2022 13:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C362510E72D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643982240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1G5ufPFCDyg3xao5Sw4eo8sGKGFiB4HM9GwjLkAtDY=;
 b=gPpUDvlRfrqKEwgs1pocLtwg1DFuRlSHvvcXYhMW5wChfUNU7906x3YC8L/7d3NzqmFHur
 lGNzsW2Q8RPyZKfGOJv2PgNUH0ItY3nNwc3dnf06lMPwusKnpw3L8RZ6pvhAaUdc8cYUKv
 UbA2nr/eQWIMBhf9h3D6sjVdvafgCTA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624--wi1YP0VPkCsUXU3xiSX8A-1; Fri, 04 Feb 2022 08:43:59 -0500
X-MC-Unique: -wi1YP0VPkCsUXU3xiSX8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 v28-20020adfa1dc000000b001dd1cb24081so2035267wrv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 05:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1G5ufPFCDyg3xao5Sw4eo8sGKGFiB4HM9GwjLkAtDY=;
 b=qJQRPLFh4KVfNSc2/ARIeF30BKNT5cHWMvQ7ebpdAY//zeTYMlApZBZQO6tIIFk2Kt
 5D5kTf0o01i2WYi/NJq0Oo6ArldeVF9E+kLtt4+J8DpSxfMBafN+J7k4RfrGJVOO6SHs
 8bTA4EI1Tb4sYDlMoRkIEPnL/yAkcoQKDxKeo3+8E2qnmvCHnrhY3MNwDF+ngK/lkNA+
 h/nyAWPxJ2pX0rSnkR74puugtA/Bc5AMQBYFmatCNUqAN9ltlqmV1cQfijEDJCS0HOyi
 //xd+QRzFnzu05FIn6nDmSYtSsR9Q5AnxKlAtOZ2/q/nEAL/yWu3op+wS9smoZjb9aKy
 VJZA==
X-Gm-Message-State: AOAM530WQcBvvsee4Oiz/XSnu2gkzkx/ACTu42R8CGrri7KL9WGz4z7c
 Bdn1pUzTTV4flJRJssPUkpmPzFQO0TGl2WXlEdVQ4x2dMy3hbYBNm83lpsN+VSo+OsvtT2zH+XJ
 xTZz+mnLepPUgOv6FDx3PrSN5bSPR
X-Received: by 2002:adf:e54e:: with SMTP id z14mr2605811wrm.490.1643982238275; 
 Fri, 04 Feb 2022 05:43:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+QSl2du9O4I/8+CrVvIgvDAYN5ik3pP+2eWE6GqWbaie7alsXVW5weyc4o2n22Zxaig+5Rg==
X-Received: by 2002:adf:e54e:: with SMTP id z14mr2605798wrm.490.1643982238073; 
 Fri, 04 Feb 2022 05:43:58 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r3sm1871692wrt.102.2022.02.04.05.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:43:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] MAINTAINERS: Add entry for Solomon SSD130X OLED
 displays DRM driver
Date: Fri,  4 Feb 2022 14:43:46 +0100
Message-Id: <20220204134347.1187749-4-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204134347.1187749-1-javierm@redhat.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make sure that tools like the get_maintainer.pl script will suggest
to Cc me if patches are posted for this driver.

Also include the Device Tree binding for the old ssd1307fb fbdev driver
since the new DRM driver was made compatible with the existing binding.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v1)

 MAINTAINERS                         | 7 +++++++
 drivers/gpu/drm/drm_format_helper.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..9061488a4113 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6102,6 +6102,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
 
+DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
+M:	Javier Martinez Canillas <javierm@redhat.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+F:	drivers/gpu/drm/tiny/ssd130x.c
+
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index cdce4b7c25d9..c3c1372fb771 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -661,6 +661,6 @@ void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const v
 		dst_pitch = drm_rect_width(clip);
 
 	drm_fb_xrgb8888_to_gray8(dst, dst_pitch, src, fb, clip);
-	drm_fb_gray8_to_mono_reversed(dst, dst_pitch, dst, fb, clip);
+	drm_fb_gray8_to_mono_reversed(dst, dst_pitch, dst, clip);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);
-- 
2.34.1

