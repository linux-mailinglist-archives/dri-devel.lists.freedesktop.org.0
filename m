Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D044E770
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07456E051;
	Fri, 12 Nov 2021 13:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801CC89010
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FqzlM6+St6bQetl39I3gwMqH+GHqZeZ7fYAU6/+0T4=;
 b=RI6DuPi0QABK0o3jmrqBE2n6lxRbjS/gn56u9K1xk8s0rwkQbqb7+oc+WB0JG/O4y1vU4v
 KBiYci0++Ph1ZhxtaYW/oqzPkNn54OWYUZkZQxBjmHdjwKCwRMtmyWiyAt5W5P+rAoV7kk
 +yI1xJecOS8FwAC5PxKpy9PiJleVGNg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-_qgKGqaRMvmOyxubFS1Yng-1; Fri, 12 Nov 2021 08:32:54 -0500
X-MC-Unique: _qgKGqaRMvmOyxubFS1Yng-1
Received: by mail-wm1-f71.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so6303620wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3FqzlM6+St6bQetl39I3gwMqH+GHqZeZ7fYAU6/+0T4=;
 b=rfBau/8SykUiSFeRg1ZG/+lcab9pV3XpXjDjf5rN8IecJdkTwAjBMNtvoWH85FZ8kj
 afkS2Pn5NCHz2wWQkAz7oMgoZ5n6gROAMl5I7HTctjL5tuOIAMSIT1nSbbLnfjXm5M2I
 gyLmUJmoNTu8k+tvWrMPbCbSsEIVBHoi+SvbzUwZPyZIWuASZGR3zeT4DjyEh6t/MlXz
 E4DEamEe7OGAM882FmlSe0xjrW4GW+mMXXV6dJnR1Z7n0bu5DrwHcOVmOsEsxEO0bbwX
 tDN5VGLuifxAe5cUJ/TEW0AAw/KxCAROpve6nKzzjemdkTvxwnxyrF0uYZBq6Pj/6wj8
 PxUQ==
X-Gm-Message-State: AOAM530wuh31r8IFs7bkvdlnwuZmNuzhYB3xe9AREYpNjX8YNGdfU7FL
 2V/7FuxNFaqLWCSge47sQejYvPUMsS4UjoaDbTGhEPPl1BgK8ny6s3vXJyh1YU2+ByMhHeZJrsS
 msRNHA9HYFjtwZj7B9vi1P8f5PfP7
X-Received: by 2002:a05:600c:c1:: with SMTP id
 u1mr34049722wmm.163.1636723973510; 
 Fri, 12 Nov 2021 05:32:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXhf8o+Hmrcc8jR2g8wf726UvSKzVQSsR1IKzZrdqoEz7h67KIvU9EZPqzf/sK1e/whAJWug==
X-Received: by 2002:a05:600c:c1:: with SMTP id
 u1mr34049692wmm.163.1636723973313; 
 Fri, 12 Nov 2021 05:32:53 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:53 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] Documentation/admin-guide: Document nomodeset kernel
 parameter
Date: Fri, 12 Nov 2021 14:32:29 +0100
Message-Id: <20211112133230.1595307-6-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel command line parameter is not documented. Its name
is quite vague and is not intuitive what's the behaviour when it is set.

Document in kernel-parameters.txt what actually happens when nomodeset
is used. That way, users could know if they want to enable this option.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---

(no changes since v4)

Changes in v4:
- Don't mention the simpledrm driver and instead explain in high level
  terms what the nomodeset option is about.

 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git Documentation/admin-guide/kernel-parameters.txt Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..f6434aff943d 100644
--- Documentation/admin-guide/kernel-parameters.txt
+++ Documentation/admin-guide/kernel-parameters.txt
@@ -3521,6 +3521,13 @@
 			shutdown the other cpus.  Instead use the REBOOT_VECTOR
 			irq.
 
+	nomodeset	Disable kernel modesetting. DRM drivers will not perform
+			display-mode changes or accelerated rendering. Only the
+			system framebuffer will be available for use if this was
+			set-up by the firmware or boot loader.
+
+			Useful as fallback, or for testing and debugging.
+
 	nomodule	Disable module load
 
 	nopat		[X86] Disable PAT (page attribute table extension of
-- 
2.33.1

