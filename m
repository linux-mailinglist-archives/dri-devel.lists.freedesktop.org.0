Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C4444188
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 13:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DB4892C6;
	Wed,  3 Nov 2021 12:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C0C89065
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635942511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOigLsb/AiPO+lh5JvcCRxDIH+IjKx25qTIzyzSOo+o=;
 b=DN/0UcBtp0IzqwLeHwzUBoAgdizRcIQyRxEVXGR1l8rWh7BDsyWQUFophdyY456hMT6jGO
 RAST6IDRP0aWVFqCjWlkCSBqHzv636rTXZ6+FFG1NpzKM7TXkgH6/KduBuf9+LbkWFA5uf
 Qm/oa/luxoIlByXX7pKWorqReHb2ZOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Cn6eXBN0OBy8JswzJa1l8w-1; Wed, 03 Nov 2021 08:28:30 -0400
X-MC-Unique: Cn6eXBN0OBy8JswzJa1l8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so2671500wmn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 05:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOigLsb/AiPO+lh5JvcCRxDIH+IjKx25qTIzyzSOo+o=;
 b=iC+h6IAcgvbaDsHMtQIl5SGadvmlhtU/sljlcOdgRGPaNtbss9TCGE52AuKdZ/aBUG
 GgK/OyNuLNP9mztlTeNy0/3G7m/TB8f680ZycDKOFbTGT5sA4c+UbBk7HZ+uB+U7+gOQ
 WmFShCSpmOioRUYX7HtYZD8BkI8SRvN2UQtQXmBiKSU70qNKJvGIJVSqEhUVKXOvax3U
 bk1j+CbLDDa6MzcpqzbSDdJ+un+zWBWjKz0Ri+drCrDNNgSeCRRUVQC0ljB8kVIiBeQp
 qYUFCuiBUW3pHzK8KqPin5Vh9+hbvevZt7k8A++io0+0Jhzfg0fOfp4FHhFTadTuPQJC
 D4SA==
X-Gm-Message-State: AOAM533wQqVSiTKtV+t5tgpMGwLZkcksRMbZ4APM40UCFWdZ1Vzs/ixs
 mYYOixgadWSR/5oeKoP1EXGc6bAc2S5+R9rwgcnK72yBykQEBUcfDF/CPtmPHK4y3pX/dL93HiB
 IuB0AxKt1uHsSdH4MG2cNNrHISSqM
X-Received: by 2002:a5d:6085:: with SMTP id w5mr47839164wrt.122.1635942509088; 
 Wed, 03 Nov 2021 05:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvNRpXmZFEKhQpN3/OMoF+06zLZZouJw2euobrr6tiItTsNV1bIfdLVAHT+sRPk71He+cN7g==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr47839129wrt.122.1635942508901; 
 Wed, 03 Nov 2021 05:28:28 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id w7sm1868400wru.51.2021.11.03.05.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:28:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/5] drm/i915: Fix comment about modeset parameters
Date: Wed,  3 Nov 2021 13:28:05 +0100
Message-Id: <20211103122809.1040754-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103122809.1040754-1-javierm@redhat.com>
References: <20211103122809.1040754-1-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Neal Gompa <ngompa13@gmail.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The comment mentions that the KMS is enabled by default unless either the
i915.modeset module parameter or vga_text_mode_force boot option are used.

But the latter does not exist and instead the nomodeset option was meant.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/i915/i915_module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index ab2295dd4500..c7507266aa83 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -24,8 +24,8 @@ static int i915_check_nomodeset(void)
 
 	/*
 	 * Enable KMS by default, unless explicitly overriden by
-	 * either the i915.modeset prarameter or by the
-	 * vga_text_mode_force boot option.
+	 * either the i915.modeset parameter or by the
+	 * nomodeset boot option.
 	 */
 
 	if (i915_modparams.modeset == 0)
-- 
2.33.1

