Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1204B21AA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76910EA56;
	Fri, 11 Feb 2022 09:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796610EA53
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644571383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qo5tt7qfqFuuHdwxRe62Yd9mxK2KKNk3oIAuQuMoJM4=;
 b=C34PYzMbNnAlfRQ/lVP4jXhOVSdCEBID+yOybRmtRfbkU5iqgm6USifdFHf6yE2+iTeamk
 nd0zNFNlbXkGKqt3oyg1x6hBoSYNmPERuItnB2tqGTdKMtGOAkhu0NQy+NBIZww6yQJn5f
 Agf7Uw6khAdiuu/DF1jtDuz+d/vQkHg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-3tsDGmFcOw2YKfSxd4LuCA-1; Fri, 11 Feb 2022 04:23:02 -0500
X-MC-Unique: 3tsDGmFcOw2YKfSxd4LuCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so3618513wrb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 01:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qo5tt7qfqFuuHdwxRe62Yd9mxK2KKNk3oIAuQuMoJM4=;
 b=vr0uLQqMJYFSWMVecvTcgwrdo8h+P3deYVrkLt9nChEp2TTZC2iQb/Pz3UE8frAi22
 IDcMSGtl8kHlYU/D8ZYqmBV1RrvdWg9NJVjbb4sm0mH5eZ/yUb1Ivj+dUpszVuFl+SvM
 aqp+a1JvlQ+bWci00U/CxsJw5qnMq7wECVYjvb4cISbpFCJhor2JKNOOiJ32kocMM7J1
 ztPiZ5IW+MzI0GQWbzBn2z2ujRaooFOLtLO1N9y7jS+/svE4auR4yYJIuDdtjzWphioo
 JSi/KuLJDWWsbqUO2ct/IIwm1RQ8OntZlZi80nBaYHEoi2UoTF8sRp7XfLbRTIJuRu0t
 Fy/A==
X-Gm-Message-State: AOAM532Qvkr0QiGWFIVysXiy2BcE2tRUjPJsuAFtYINolhsRWnK+fjM9
 sASQ1iiFFGMui906/roQwYBHdXPu6NLkqs2SXFFqX0wrsPIuHyrDO+tCZo0i+S+JJ3GAQYZMZ1S
 h/md7hRBHXYUOTAwMIqg5BKdRvp/N
X-Received: by 2002:a5d:4910:: with SMTP id x16mr617227wrq.360.1644571380929; 
 Fri, 11 Feb 2022 01:23:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQmkhSio3XmknDv+U+BFj72PJlq29Q9DPCbv2FXY27W3811LtmWuIDulWlfqEUKhTodynTLQ==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr617195wrq.360.1644571380540; 
 Fri, 11 Feb 2022 01:23:00 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id q76sm3795124wme.1.2022.02.11.01.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 01:23:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] dt-bindings: display: ssd1307fb: Add myself as binding
 co-maintainer
Date: Fri, 11 Feb 2022 10:22:53 +0100
Message-Id: <20220211092253.2988843-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211091927.2988283-1-javierm@redhat.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
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
---

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

