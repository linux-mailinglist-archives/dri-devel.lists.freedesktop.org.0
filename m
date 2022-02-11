Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FFB4B2805
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 15:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF4C10EA7C;
	Fri, 11 Feb 2022 14:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3D210EA7C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644590140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/q2y5mTkz1CvD38vxQgwPHqW1lB8ZACl+B53t5PD8iU=;
 b=DaJB9BYZIv7NPPOdrxhT4biItPRs7QyJuuFwVzXA8ABTyb6HZOjwydEG0dJWIYCtzk++w4
 0GScqxjXKl6X7oKJ5io9wPD+ha9gWS095eWhc9O5NA6ahXar9txtfu8sR/T5y7BnT7mKTG
 wkJfkXeqav4wRlJ6s60rrL6aLaks3no=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-r0KjWdg2OVu3IdBG4ukG5Q-1; Fri, 11 Feb 2022 09:35:38 -0500
X-MC-Unique: r0KjWdg2OVu3IdBG4ukG5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso5997000wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 06:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/q2y5mTkz1CvD38vxQgwPHqW1lB8ZACl+B53t5PD8iU=;
 b=RQfyk7tRiIILsHcNEmnsmJiz5knlETXy+ZxB7hN9o91/MrtBYRfC5SSgQk5DLpnjeB
 nMvQOAVi9pzYGjWjersw4qgyZITTIwubrcXITntLfdB3bFjQt4TYfGlxS4OiZD2eNSGj
 udniIqCJ4A0N4/WYWh60cpgdX3bYQaIs36ycvTxOlCuQ9Mk2PFYBSQCVNoOTIJpwgBST
 Td4V+bzS+IXLr8ej1gLB0X2icKlX7uFGEoEJpRrhM8dEaik16r/BjWDq/YQXxWSJSGOG
 LmhG/9yd68W3nOkr04UJV58NFL4ysODi3EgsWn+Axlb1Tjkb08kIOLg/+2uSFLnZ2GjM
 P/ug==
X-Gm-Message-State: AOAM5328G6EUbi9rWRIjhLz8nWaBNM1y0y8gwxdJIhnBlZ/3PV2u3X7I
 7yTB2c2gN158CwQpSU1AJ5Lzpu3At5yShXchIh4Pu4KVDTNwB+WRl/uE4hZ/F0kFhm+ZiT3pgXq
 FQ9xpoSdGI7TfSu4XcZLb38HwnnEl
X-Received: by 2002:a7b:c416:: with SMTP id k22mr512218wmi.158.1644590137757; 
 Fri, 11 Feb 2022 06:35:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3id8OPm5IthkFCnhsiPNqFQDJ42Az4r2wBgsmJz/IrKLWa1JNMZFGUIf6GnCB51Af499MQg==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr512206wmi.158.1644590137543; 
 Fri, 11 Feb 2022 06:35:37 -0800 (PST)
Received: from minerva.redhat.com ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id k5sm8578640wrw.117.2022.02.11.06.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 06:35:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] MAINTAINERS: Add entry for Solomon SSD130x OLED
 displays DRM driver
Date: Fri, 11 Feb 2022 15:35:34 +0100
Message-Id: <20220211143534.3113303-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211143358.3112958-1-javierm@redhat.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Changes in v5:
- Add Andy Shevchenko's Reviewed-by tag to patch #5.

Changes in v3:
- Adapt MAINTAINERS entry to point to the new drivers/gpu/drm/solomon directory.

Changes in v2:
- Add Sam Ravnborg's acked-by to patch adding a MAINTAINERS entry (Sam Ravnborg)

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..05c306986ab0 100644
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
+F:	drivers/gpu/drm/solomon/ssd130x*
+
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
-- 
2.34.1

