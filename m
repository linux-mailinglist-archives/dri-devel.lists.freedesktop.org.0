Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0A4B51DB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105B610E510;
	Mon, 14 Feb 2022 13:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B493E10E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0nJAs/QVKzUPfZInqWn93G2x7vjNHkbBF9qYOiGnWA=;
 b=BzuYSR8ToOYSGa/ULnUgF5t6PIqflxL07sS2S0uvTpvSvLaMCql9ql8d2NQSgfC8kDEouP
 aHl8GP5G3fV0RZaqfoc0llmb5TJkciRqwuux8pFQ3sfDLNC20SZARbTEZQgRPhQWLb4OUS
 1liYMh5npD2+oPddhezMFPhVH65jpyA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-MVqCRbNwOmK4ix6qJsUvCw-1; Mon, 14 Feb 2022 08:39:22 -0500
X-MC-Unique: MVqCRbNwOmK4ix6qJsUvCw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adf8b51000000b001e336bf3be7so6956353wra.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 05:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0nJAs/QVKzUPfZInqWn93G2x7vjNHkbBF9qYOiGnWA=;
 b=q8tRHMbPGMISESDOSuCMpvd4dkSYd6rDHaJ6AhqtMTeS7wzJ9nojqkTiN6kBn/Kmno
 MT8oA7ox9gXuCGTqyYYLrDkiNI8C6osQPwUVA08tNN9p9/nO1A8DE08JxhMy2ZzrNwnO
 8symkX888RIjWMhuK/sPyBDdWIN6ZbBu4/zbr+VkuCFgGjwVAQrBpY3W3V2SynsbjMup
 2ZK0ZolqgdJcPgahOyJxy04+Hr3VEiTNuXpE2EsZL7j7xoFBJJjS6ukosNzWocS2fnPG
 h3yuEPW4nsWmcjjP4oL4b083rdPoazn2XPVjVQaVv57eh6uVwifDuPP0VNnBBAdGYSZZ
 1vDA==
X-Gm-Message-State: AOAM532ryhjSD+isiKYW+56fK0tDgzfgI4DDbymN6SOmTw9CaRrRezds
 KySl36vbpEncVp2TY3A5vauXnZrOYkeMcBZeYzoK+z9dCRprYvNUfwcnt5tWs/LUIgzQG8dkQP3
 xZ6XCGj1GBBniwwgnsR1SfVqyng6x
X-Received: by 2002:a5d:4652:: with SMTP id j18mr9457907wrs.600.1644845961574; 
 Mon, 14 Feb 2022 05:39:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynrCAqmAm2n2lQ+jT84K1ccY7RTWNT1XbLbIiM5V2Tu7Q5FECiZBbqhtjbe/uKekjhMZ/1gA==
X-Received: by 2002:a5d:4652:: with SMTP id j18mr9457887wrs.600.1644845961377; 
 Mon, 14 Feb 2022 05:39:21 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n20sm2108941wmq.42.2022.02.14.05.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:39:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] MAINTAINERS: Add entry for Solomon SSD130x OLED
 displays DRM driver
Date: Mon, 14 Feb 2022 14:39:15 +0100
Message-Id: <20220214133915.3278886-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214133710.3278506-1-javierm@redhat.com>
References: <20220214133710.3278506-1-javierm@redhat.com>
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

(no changes since v5)

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

