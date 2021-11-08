Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCD4480E9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D176E20C;
	Mon,  8 Nov 2021 14:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC69A6E174
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636380434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHhiP8dWU/yCrRHfZ4flhCwBp7rRmlRP7VQTJMKR8q4=;
 b=CZGeZe1k4thZwE2QJ6OPSQ8AW0fsb0etBKVitOkS13gVCqMZoKulN7gyleDJL/+joHauU9
 2YUVp2avv68PEena7tpfqoovjMDpWw6EHF7sMe0yQRGUUqWDAVAIVQa4qpDlx4tnO71G/t
 Cz+wui07KMpvKIyQr26+cEaYwW8ccR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-N2Bh7PvaOMW1cP0twK1A_g-1; Mon, 08 Nov 2021 09:07:11 -0500
X-MC-Unique: N2Bh7PvaOMW1cP0twK1A_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so5784238wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHhiP8dWU/yCrRHfZ4flhCwBp7rRmlRP7VQTJMKR8q4=;
 b=CeOYvKVe5GATtucvOO9brhwFfURxEAtP64uDoczOJp1scBAMEHCvDJ2gOFHhJ7qktL
 /Zjuy4Dc4azB10dmFaLVAUZBxCHZXlTNMWw+9Jw8gyhHm8kMLcjJzxROZPZfxIya/vqJ
 TmqrkZB2yfMCWqhwzdZlyvr7nddRdMi8VDdd52UX7PDRMqGSLqUkt5QKVs07pPKQlY5X
 nTZu3n8YwXJcn9DRMpiJJqssGrHzquVK5mpLsyO66TVRV9OfGdcTfDLRnbRaSb1CQneb
 m6JQBXtcgjA2pd4M2RWpMIQVCFd8cZoyF0dzEyDf55fy0Wfrhbu3aX63NOlE8yeKonDW
 GUXw==
X-Gm-Message-State: AOAM531dZBwy9GgrbJCVgrqqDc4uBiiIiOA9MtQAqUP6wbJTV20P5oUx
 ZPfVPB3Ms1Hyc0z9RjCKEKKzPn3ebr/PMsbxH04UOwBZgUfmAVvFL2yGKk213tm11mFHBnxpHv8
 sp8C/rrIM/XTy+rG+FHkrB4SgSytD
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr23356wri.416.1636380429730; 
 Mon, 08 Nov 2021 06:07:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBR8kNUJGMU0WDyzFvHqppXC/rJqD8zpASqe2AAp4OC/OcZbz6W8aHlANT8ClrikiGMpRVMg==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr23323wri.416.1636380429544; 
 Mon, 08 Nov 2021 06:07:09 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m14sm10081696wrp.28.2021.11.08.06.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:07:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] drm: Make the nomodeset message less sensational
Date: Mon,  8 Nov 2021 15:06:48 +0100
Message-Id: <20211108140648.795268-7-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>
References: <20211108140648.795268-1-javierm@redhat.com>
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

Changes in v4:
- Don't mention DRM drivers in the kernel message and instead explain
  that only the system framebuffer will be available.

 drivers/gpu/drm/drm_nomodeset.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git drivers/gpu/drm/drm_nomodeset.c drivers/gpu/drm/drm_nomodeset.c
index fc3acf3ab2e2..148b01f7183b 100644
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

