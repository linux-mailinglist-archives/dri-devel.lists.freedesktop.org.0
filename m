Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B254AEDB9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA82A10E673;
	Wed,  9 Feb 2022 09:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB2210E68D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644398038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkjkJCV3RnHyv5DSE+jtNb73ClQ4fv7HXl/dV01kYKA=;
 b=V8up0W1gNdybembihHt8tLG8gm5WPwTt1i95mGkP0PLFofQh4jEPns+eO9ZjW6WR02HcLW
 vRA40cAyp2/ylIcgMmai9L67jdl6m+gbzZXxMHZzk7uQH6QGjK8i/k9gccAWp9wJzAZBeg
 46tbUiBdmDoCrnMwJVFM0kZ5tdfBDpA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-3MhrqaMZPDWppfxyql6BmA-1; Wed, 09 Feb 2022 04:13:57 -0500
X-MC-Unique: 3MhrqaMZPDWppfxyql6BmA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j8-20020adfa548000000b001e33074ac51so849223wrb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HkjkJCV3RnHyv5DSE+jtNb73ClQ4fv7HXl/dV01kYKA=;
 b=duORRUIwWxyU3P8fxwPHDjH0Y/n+4TGvBs8kirkqsDOxr/BkZc9DYDySIPjgJEOJCo
 PRt7BukWrdu0OwtXxM+iNU10+8gH4yyHflULF0eRY/1SSZZo0PmUDz4TNdZeqbnduPov
 9bU1k/B/mZnxY7wtR+Bjrua9U4UhwGzvU/d8EGcJva7p94QnhvIbilqE+yCFN0CmKAxq
 eIWqjitK4o8K8wSTvI1QBECea9XceI5fmOauWkX8Z8ZWlM12VBJab8KAHEfcE8JRqI77
 Qmc/f65Rb3b1TcH8hTS9QGGKIkGsWw9luSN0YeHCpZ6rxNS+s1ymT0zYHwJ0No7wI8x2
 sHug==
X-Gm-Message-State: AOAM5314zu7TMBj1/S2O2XT37HPoCK/yq7jPM6uHxo0BLGalqTaST8Fi
 2JkvYtnWzIfZ4qGAHjN59NdmhiL2Ja0mBGzFttuC2qa6oIlgTzNmBSimqU2zpKqUvVlF8DLk+98
 s34XDVhZutSz47kEJ7mfdhDOXoUqv
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr1221604wrw.672.1644398035773; 
 Wed, 09 Feb 2022 01:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwN9IG1QALjH1ZUKqnf6ckKETjeoTD+yjoTXUPxM8Hq+sCkIBChwrk3c3nzhT8/h+bVv4FVsQ==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr1221588wrw.672.1644398035459; 
 Wed, 09 Feb 2022 01:13:55 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id w6sm13557623wrp.51.2022.02.09.01.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:13:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] dt-bindings: display: ssd1307fb: Add myself as binding
 co-maintainer
Date: Wed,  9 Feb 2022 10:13:44 +0100
Message-Id: <20220209091344.2513662-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209090314.2511959-1-javierm@redhat.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
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
---

(no changes since v2)

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

