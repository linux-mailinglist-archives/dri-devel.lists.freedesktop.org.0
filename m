Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FC44E771
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6589020;
	Fri, 12 Nov 2021 13:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08D089EA9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AaO3QXEQbXfVqe2t/6/9SpNrbCP6PsY29GvZKutU2UA=;
 b=B/3wHHBXHAbiPWFaj34Zx/2KdsdWLDneuNKhD+upUnVQ6IquN+qz+oBr9yC72DDNa6WR6R
 TxbWhLr0baKMvCgjAW5eo4qM7rP+b8CUO4xf+qRqMCel6/iyn2wZI81R7gwhkjvbBrjyRI
 lklK1hafCidd/cq4hfYqCyiiQhJfNFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-eHv9QZWMN2KZjpkI6k-B5Q-1; Fri, 12 Nov 2021 08:32:55 -0500
X-MC-Unique: eHv9QZWMN2KZjpkI6k-B5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso3012771wmc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaO3QXEQbXfVqe2t/6/9SpNrbCP6PsY29GvZKutU2UA=;
 b=HQ/dRLAkBV330ejq/ZLkhJhWrmYmSXSJn09KHPpi7EIenrefW1od4Udg+rK3F7ZRiK
 QGqeSPrXRPl+Mv7ISiM1yXpZVFhoIO+t6Jopz57uYuJ1mslDQde5wCDzj9aEH9HbX4+w
 8wZfdBklSyqR704m8Rf7Jcoawo9w9Wxg/xdy6h0L6K5qwRWAaApaoa50Smat0cUFbCPU
 meKC4KbKgepC7HeON4w0oXocSxdDC9XonVF9k6DZTsXuJFddO7koe6bVaW7y97UbVncy
 +eeVbcC5oA3YOYIP1LIkyPtlN0ZMtOd9XYK8BgnGgf4+xsE32V730B8IDfZlUqBtAD6t
 R8AA==
X-Gm-Message-State: AOAM530BL3hDJWhkJ+PJAkocNNbh3oEcDGtQsYwripK2CmfEkJdTJUsi
 I2MsUqpVk+eTqy1YQp4P3AEbOHoKCWLd1TXiyBS3VAK/H++QxHyzD4VtqRf55kNtkoJqpqD41DE
 brlKb5FRRRg5dd4BWMf8defD/feCT
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr18856986wrn.294.1636723974602; 
 Fri, 12 Nov 2021 05:32:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFhz4WOPQz4XIIQurMGjApmL4pEhOMydaNTrPkUDoEb55215QS7i1Xxt0f2vAEHuNr9oDRQA==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr18856946wrn.294.1636723974379; 
 Fri, 12 Nov 2021 05:32:54 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] drm: Make the nomodeset message less sensational
Date: Fri, 12 Nov 2021 14:32:30 +0100
Message-Id: <20211112133230.1595307-7-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The message printed when nomodeset is present in the kernel command line
makes it look as if the parameter must never be used and it's a bad idea.

But there are valid reasons to use this parameter and the message should
not imply otherwise. Change the text to be more accurate and restrained.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---

(no changes since v4)

Changes in v4:
- Don't mention DRM drivers in the kernel message and instead explain
  that only the system framebuffer will be available.

 drivers/gpu/drm/drm_nomodeset.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git drivers/gpu/drm/drm_nomodeset.c drivers/gpu/drm/drm_nomodeset.c
index 287edfb18b5d..f3978d5bd3a1 100644
--- drivers/gpu/drm/drm_nomodeset.c
+++ drivers/gpu/drm/drm_nomodeset.c
@@ -15,9 +15,7 @@ static int __init disable_modeset(char *str)
 {
 	drm_nomodeset = true;
 
-	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
-	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
-	pr_warn("Unless you actually understand what nomodeset does, you should reboot without enabling it\n");
+	pr_warn("Booted with the nomodeset parameter. Only the system framebuffer will be available\n");
 
 	return 1;
 }
-- 
2.33.1

