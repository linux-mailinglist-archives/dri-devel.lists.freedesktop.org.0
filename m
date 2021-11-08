Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC2447F66
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8FE6E159;
	Mon,  8 Nov 2021 12:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8866E16D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnGe14GlJaau0OMIVugUisnX721y7g1CODOMkymf8RU=;
 b=h54CM3tZ1W9dOnd9oBkqGiBygn+mQmq/D2TgnK+UyK8HbzEof4le2kAvon5tI+wUx8QXHQ
 hN1Q8627iUR/GjVSeCrSBK7zsoR05ZxDrlZyLENIotbxdWLFtwQCRB6eieQ8l7sLPJHzCd
 YpEVQDDgwLXCFBM3GABaSc5+vJqVmqg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-tscL23EtNOqztS27t7Q5rQ-1; Mon, 08 Nov 2021 07:16:09 -0500
X-MC-Unique: tscL23EtNOqztS27t7Q5rQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so6118631wmg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnGe14GlJaau0OMIVugUisnX721y7g1CODOMkymf8RU=;
 b=QKyDCxLIN+GE+ttw6YqE7cv2Fx3kqdyoqrAzgb6iF+40mGGD8cqnQtpXU6r51eY/BM
 wsppZRVZO35lW+TTJXWHhjffIiOqr2h5HR+WPk1f1GHVsvIEU/AZubv2PMumbAvmSBl0
 lfEWdVU5JZvfcQIX3llPEE2jZfNDgy+qdF1Fh01U6c2CtR6+JN9Bz7RM8exKu8Zx8dLQ
 qmErhLocRyae1pILU07d5PbTk4Et9Hjf0A87+3jnOcnzL0MV0FrllMKzmLkQpcDV3Bbu
 u6tONygmnLtHS4MvyjXNYJzE6Kal6qxDSCtKwZjTFeZRaABOzEPHgVlOzO9+nQbs8uT0
 u0iA==
X-Gm-Message-State: AOAM532J3ZzFsAhwh28Z6Aec6A1lts/1JNMvKzyWgzuUiT6CygkvicMS
 piz52V1/YXJfO4osTARxrQz+4jQZvKzjiQakziZnCOHYsykSSOQkHcCrhnnKx2oJCK1kxnckD0B
 0WdzUNZXOcqF+f/l6jldr/RBgJrCG
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr82534223wrx.173.1636373768311; 
 Mon, 08 Nov 2021 04:16:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBgQKrPYRz0pBv/sk0n4DbT9LpRxV0KvN018VU3gUyPHYzjFByA3zdZkPSUre4xqa4mBeFug==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr82534189wrx.173.1636373768094; 
 Mon, 08 Nov 2021 04:16:08 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q4sm16866866wrs.56.2021.11.08.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:16:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] drm: Make the nomodeset message less sensational
Date: Mon,  8 Nov 2021 13:15:44 +0100
Message-Id: <20211108121544.776590-7-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>
References: <20211108121544.776590-1-javierm@redhat.com>
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
---

(no changes since v1)

 drivers/gpu/drm/drm_nomodeset.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git drivers/gpu/drm/drm_nomodeset.c drivers/gpu/drm/drm_nomodeset.c
index fc3acf3ab2e2..45e50b3497b8 100644
--- drivers/gpu/drm/drm_nomodeset.c
+++ drivers/gpu/drm/drm_nomodeset.c
@@ -15,9 +15,7 @@ static int __init disable_modeset(char *str)
 {
 	drm_nomodeset = true;
 
-	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
-	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
-	pr_warn("Unless you actually understand what nomodeset does, you should reboot without enabling it\n");
+	pr_warn("Booted with the nomodeset parameter. Graphics drivers will not be loaded\n");
 
 	return 1;
 }
-- 
2.33.1

