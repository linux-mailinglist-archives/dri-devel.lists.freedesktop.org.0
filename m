Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE24A9A38
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 14:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84F10F843;
	Fri,  4 Feb 2022 13:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA41E10E788
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643982242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGn+B4gE3kkARtCZwbp34WsdN+cmoVNQCk7A1PY1HEE=;
 b=CR8TQmSBECelYH4OH0UfI+9FGPbdgVTAaC/Dloro0zaUewwHltcHBukeHYYcOQZh8cFRC9
 Ty0CNBo5JEO/SiEu5vOHlEwtOoxeLfd3e5o9vyFq+i2VYDh66iWwHPafkHmaVVkLTss9Zy
 EKP1NvFZZHeKfCBH69H1kqkVOKZ65vU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-kXUnkFENPIqvlRRHN6Qbag-1; Fri, 04 Feb 2022 08:44:01 -0500
X-MC-Unique: kXUnkFENPIqvlRRHN6Qbag-1
Received: by mail-wr1-f72.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so2024525wrh.23
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 05:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGn+B4gE3kkARtCZwbp34WsdN+cmoVNQCk7A1PY1HEE=;
 b=s4LdjqmPRiRXopNtuMX7A/4jHrXlwg/sK1QtRp0QU4rtGZz/2z7S3HmBgZR4eJRtOY
 ljrjJISoUISHX9lWBXwQfTgyvfaDPSjgygKVe1MPPHdTmBho/GvhCy21Xd0pjOlBteAd
 IfxPHY8PN5BapcZe20HwCBEFo100APjDbL1Fz6ZTNJH1GUU/sZmSLRtbnhB5JZNECeKf
 SauH7WkH+REfMGZVrfrBHW1zQoFKWLsmzBgfAgn2NJh7S+rCrZ5cqJa72ADuZOq+V0ml
 Lmq03BUpXjGsV19+RG+RgNtHexWFbMvO6gGgssncHlAx7gEiqMTt1IIX4ZAcCMcLltgq
 QKqA==
X-Gm-Message-State: AOAM532b/UeD+8nID9EOfUqj48+igFLjJXDJe0SjO9DmgkeVrEBLi8Ql
 9AGmMJb/pOvOhW3E+Px9TbpbYOfKe3n752sbrWoXZ4nXtbrKK2be6tsgrCmH5DlOf3OCfq6OR+y
 lDqYjyX7m1X4PcGxRtM/VGtlhNDV8
X-Received: by 2002:adf:db4d:: with SMTP id f13mr2526497wrj.329.1643982239875; 
 Fri, 04 Feb 2022 05:43:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIH15SYdGMCJPbF9406dm+rwJsqjp0GPK+4c7vxU052qmuPNJJZFqWRduDtlttxDXm3iBi5w==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr2526479wrj.329.1643982239695; 
 Fri, 04 Feb 2022 05:43:59 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r3sm1871692wrt.102.2022.02.04.05.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:43:59 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] dt-bindings: display: ssd1307fb: Add myself as binding
 co-maintainer
Date: Fri,  4 Feb 2022 14:43:47 +0100
Message-Id: <20220204134347.1187749-5-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204134347.1187749-1-javierm@redhat.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
---

(no changes since v1)

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

