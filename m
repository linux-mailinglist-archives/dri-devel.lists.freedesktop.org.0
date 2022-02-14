Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3894B51DC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410EF10E5B8;
	Mon, 14 Feb 2022 13:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36710E5B8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Etof0neSgRXt027GXsgMkq+0wQ1AzPcD2BHFX9AFsyc=;
 b=bd1v2bS/soZIYMR2fHFdXMHG4K22IGIoMeOCdOOBLqcxQnwz1l5pCZ3TblCtuQr+ncQBdG
 VZ4VrhnbGExpQk08AcSnw0RtKndrlSL/Yhe03XawdnLNhBM91QB0hL8l7w6voztglSxgcX
 MBmwUXNgQ5qXA4BkCG0NH067ZxcMc1o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-manWEs5uPhmAnMRP7ww-9w-1; Mon, 14 Feb 2022 08:39:40 -0500
X-MC-Unique: manWEs5uPhmAnMRP7ww-9w-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b001e33a1c56f3so6920892wrb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 05:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Etof0neSgRXt027GXsgMkq+0wQ1AzPcD2BHFX9AFsyc=;
 b=wuLXxNN6jYsBPgCRM+dkLTya2OC4/AST1SfG869ocOFAWIlMtY1I6BAO6GMu7DQR8Y
 2E9Cwy0XLRW0c9GUbrGyadd9EXqB2RfMCd/2vuDpjhpLg6BIPRbXK4ypGkqqt17NJjKz
 bOY45QQ9+/IhdhWjog++kyykPBiSQL7rEesrCTk/ns1KvjVoYR1gjNwI0OAXwbUEiQop
 ePNjyEYWfW0paYLqmNMDBR99iw+uIphNEIQlMPCGh8IEsTBarbXufgLa66TNT3nkMu5s
 /YaPW9uGYYdmszG/9MQe1Qp0CZ7D5nUGM4bMWMBLZg1K4UJ6wtLbfqFyYNKK0VPW2MuR
 6MNw==
X-Gm-Message-State: AOAM531GGkKCEEwmcd7hQrrQozckIaw4ZfR3HLaQlYLSgcZktuJIWdPD
 RIM3/dEMwzbzG/UeLPPFf1s0FXntVG4crH+H0TvGPaOjaGY3E+dkMQr+LGeDrma+by7nXstvRtt
 Xi2e7j5/RxNAzEK8PfGixRMZXSxMj
X-Received: by 2002:a5d:4411:: with SMTP id z17mr10986767wrq.384.1644845979249; 
 Mon, 14 Feb 2022 05:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3m0kF1+a4nMfmlEayb8F11MLh6Npr5zmIcoMfkIl8FoBO9TtWTVfjOMLjIXuY3s4cdKK7qA==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr10986751wrq.384.1644845979070; 
 Mon, 14 Feb 2022 05:39:39 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l15sm11826697wmi.29.2022.02.14.05.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:39:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] dt-bindings: display: ssd1307fb: Add myself as binding
 co-maintainer
Date: Mon, 14 Feb 2022 14:39:35 +0100
Message-Id: <20220214133935.3278933-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214133710.3278506-1-javierm@redhat.com>
References: <20220214133710.3278506-1-javierm@redhat.com>
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

(no changes since v5)

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

