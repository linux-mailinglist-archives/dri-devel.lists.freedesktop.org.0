Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6ED4B280A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 15:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1710EAC1;
	Fri, 11 Feb 2022 14:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866910EAC1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644590185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUtEuWaqCGQh3IRK8HcXsRqsLNSC6YZZzta5hJkK91U=;
 b=ee/5eo8GC14Vzi7Vpdic2bScbij0vpmEKycqGZI4lUkMemiG2XTZETzDX9s+4N5cjIMznq
 ISAPA4m62kdB97x0zK8ZyZlj3Rczh48v+JJbZ+/HkAmxj7LPmwRdf6NovR3GezxGhErP5G
 ouFqAhuBiujztHwdVaHuNHqVCoTXfAc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-5gxGPquEOLehPwgwb3JN4Q-1; Fri, 11 Feb 2022 09:36:24 -0500
X-MC-Unique: 5gxGPquEOLehPwgwb3JN4Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso3935045wra.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 06:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mUtEuWaqCGQh3IRK8HcXsRqsLNSC6YZZzta5hJkK91U=;
 b=jaAGAuxFqtCqc4xLn7oNpdWwLSsHSek2o0MBGL7vy6xPxxjLQR581em027FSXNzk1S
 rAf4HYFlBJ255JsUWMTUUpCHPPA3jyMU0GP0ZFSUGNQqfvhDmvPEjGgh9yxTYAjjqhst
 AfxOAFnndmReWT9YBo2p2M4hN73KVXNZfXFksPGD2xVloV6gwXK8ow77C595BR3+/LbT
 egec0MFZhS1tZMBH9HXYQF9x9TktWXoNTMZWr4BTQ7PSUo04zRirlqtknMnkaV8mK1V/
 1yU9hQPnKHbPFr/BP0sFvJrhgfmcFHFKgRNXh7YL0lYAM73fWe6DE5YH8zK3OIMNLmK/
 yqjw==
X-Gm-Message-State: AOAM532aAGlqfqFwkFEjdkgJCD36Z5+CTkiJJd+zFI7C8MqLtkL6WHYV
 TNFWgCgNJPM44Z7udwrAhV5sKcZGMqlj44hHHwTvQy1HAN+T+M6wNOllsDJ9O4/oNfu5KdAJkBt
 L+eBAOdNmejuVzkkXzeeZQqEM7BXS
X-Received: by 2002:a1c:a550:: with SMTP id o77mr494932wme.121.1644590183460; 
 Fri, 11 Feb 2022 06:36:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkpykMeULk3o3z734U+NNGKDB0UPb/QdCSIArUOUfzqYPoPK1eHc9CCs2as5dGckIMzeUTXg==
X-Received: by 2002:a1c:a550:: with SMTP id o77mr494922wme.121.1644590183267; 
 Fri, 11 Feb 2022 06:36:23 -0800 (PST)
Received: from minerva.redhat.com ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id d13sm159759wri.38.2022.02.11.06.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 06:36:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] dt-bindings: display: ssd1307fb: Add myself as binding
 co-maintainer
Date: Fri, 11 Feb 2022 15:36:20 +0100
Message-Id: <20220211143620.3113464-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211143358.3112958-1-javierm@redhat.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ssd130x DRM driver also makes use of this Device Tree binding to allow
existing users of the fbdev driver to migrate without the need to change
their Device Trees.

Add myself as another maintainer of the binding, to make sure that I will
be on Cc when patches are proposed for it.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Changes in v5:
- Add Andy Shevchenko's Reviewed-by tag to patch #6.

Changes in v4:
- Add Rob Herring Acked-by tag to patch adding as DT binding co-maintainer.

Changes in v2:
- Add myself as co-maintainer of the ssd1370fb DT binding (Sam Ravnborg).

 Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 2ed2a7d0ca2f..9baafd0c42dd 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -8,6 +8,7 @@ title: Solomon SSD1307 OLED Controller Framebuffer
 
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
+  - Javier Martinez Canillas <javierm@redhat.com>
 
 properties:
   compatible:
-- 
2.34.1

