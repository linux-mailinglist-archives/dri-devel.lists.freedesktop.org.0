Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABA4AEDB8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429E410E67F;
	Wed,  9 Feb 2022 09:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C810E672
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644398001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrfi96tJIccNwtHX6q8UuWpfNu6nXOBFJNAE84+M6EA=;
 b=UFwmbDjMfml9outP+dU9scflsjmg8iO8JYyaaAi2+v4tBEJUkSUt+Ndw8lnVmQe5aTAdgg
 bH5WFScQ9av8vdu+HCCiQHB3usUoVwsknyEJQoeA4nQzpQFk60OPAsfMmpzRl0j5JNa3HF
 unmQTMtG48blVKBIoIdV1IIsT231Gug=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-4Zx2ox8iNlO1WclK78McFQ-1; Wed, 09 Feb 2022 04:13:19 -0500
X-MC-Unique: 4Zx2ox8iNlO1WclK78McFQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g22-20020a1c4e16000000b0037bc7a977b3so112091wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrfi96tJIccNwtHX6q8UuWpfNu6nXOBFJNAE84+M6EA=;
 b=CGl3dXRkSQaKSSkNZzSKnzh9zwocDe91TE0S1NjbcSsQSJ2eqn+BzgcaWOJ/NNadVz
 ZXH9TmcxEAxl5o6NgpHJETz7AZ1/O4JCcqtBFzVreK3iqvBNGqNdhTcIvDNxiKfRXFXx
 YvLxrekHNZ72rjMdEo5OP6k6y0IjieZC3sm8KWWZVm0Uh8ZH6D/8gAXDcYMAu8K93IPo
 S8OG9GmNI5MFKvAPZL61hvMcqUSwzoyr+Bgz9dctAh9Y9/83+CRs0AFmJ2SWCjIvpOo5
 Xk2C/n24+lfrblZ6MNCQH3ICgMHQpvjmcxdDa6jzz6PtCuxkNsVNEPiJ6R2zMokeTvzP
 GS3w==
X-Gm-Message-State: AOAM533gx0juwlTfAVukC1vMG2pKTdWtQWy8LmBeGlICctcF9VFLXY/+
 AykF553ZaM9AwIohYKwi993Vx1Cp8cb8Vigly0MCeBr2sbu9iA2TQeV1deE1wsSxbNv5dmBqGEm
 zJly+5n1cSiyYPtLWYMbtbgWCuvDQ
X-Received: by 2002:a5d:52c9:: with SMTP id r9mr1258310wrv.449.1644397998211; 
 Wed, 09 Feb 2022 01:13:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1zTRH9HjYG3ft4LFcDrPluM5RwDLJLwWrjz45XS9D+PYh5QbVpYPQLAEhlqGKHQNAri0OMg==
X-Received: by 2002:a5d:52c9:: with SMTP id r9mr1258299wrv.449.1644397998026; 
 Wed, 09 Feb 2022 01:13:18 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id v18sm11942013wrm.105.2022.02.09.01.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:13:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] MAINTAINERS: Add entry for Solomon SSD130X OLED
 displays DRM driver
Date: Wed,  9 Feb 2022 10:13:12 +0100
Message-Id: <20220209091312.2513575-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209090314.2511959-1-javierm@redhat.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
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
---

Changes in v3:
- Adapt MAINTAINERS entry to point to the new drivers/gpu/drm/solomon directory.

Changes in v2:
- Add Sam Ravnborg's acked-by to patch adding a MAINTAINERS entry (Sam Ravnborg)

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3dad0d898f5..8e6e892f99f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6163,6 +6163,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
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

