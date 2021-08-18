Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF73F0380
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619F06E55C;
	Wed, 18 Aug 2021 12:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0094A6E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629288596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5GDrPFRa2eKnOg4exCIwK3YrwGtnkSUqkhmYgDmqIcE=;
 b=GhdFVfwHz3G0ag54o4mvPGodGe3y3gJaXyADH7knMCl7WSmlR1qQzgDX8OUp1S31RvqUqb
 v3Zt/VXP0XecrAKZ+kpPDVyCH92Jrx1l0trVvAT66I0IhkK6fsuabomCjZ+/0PONB6QKll
 I4hXL/hX38t+sV8OohjsUiP1aL1jesY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-DsDD8RIsO5OfO3YpkmjbzA-1; Wed, 18 Aug 2021 08:09:55 -0400
X-MC-Unique: DsDD8RIsO5OfO3YpkmjbzA-1
Received: by mail-wr1-f70.google.com with SMTP id
 m2-20020a0560000082b0290154f6e2e51fso518015wrx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GDrPFRa2eKnOg4exCIwK3YrwGtnkSUqkhmYgDmqIcE=;
 b=dz/eqjTtyPTs6xOvYxfEK/zH9g2cdgynSnfHoWA7E7nf3+icsEiSiemnEO+e+y78Kv
 bVZSHfGuTV3SGMaZNa3mhPvba2xI2c03tPXTMfmySQmMiN6yLhHNR9RnmcTZJCg2DtG2
 7cjmVtrTp/VQUUskAH1lUA2sO3oSwEUgFT7ryqf8O+r8GVRqw4+AFZ/ZzJNJ+fi0Jqem
 W/no22a4o0cUffI2oV4ZuDAUBeX6RI4lK/3IgY3kYbLba+3HbjfJgeI2rK8BiGE0RiMn
 YIW2Sg0xXYB513P1w+2gbylKDWt5HUzyf33Vk2JJms3tHEHkSqgxLHfDf3czLg+C0Jul
 eKMw==
X-Gm-Message-State: AOAM532yo0s5gu3TkWR+sTltkj63W8zZEO4sLIOBqm4LDa3RMW+bWVkM
 LeeLvDWeLgvuYdSmYptNoSqTHCQomevI+ccT9GY45doPZipTYdkp71iM6UXvlcowiT+enNWVFVJ
 pDD0yZtq2KaZXJSa44LlKQuglowt1
X-Received: by 2002:a5d:4688:: with SMTP id u8mr10313330wrq.148.1629288593040; 
 Wed, 18 Aug 2021 05:09:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTZMSPiUP9WNF76FTt/bZHXX75asXwyrBkzDdMBM/M++3nLeesGub4u+XGerxdc379+cM+jw==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr10313297wrq.148.1629288592804; 
 Wed, 18 Aug 2021 05:09:52 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z15sm5495999wrp.30.2021.08.18.05.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:09:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Remove unused code to load the non-existing fbcon.ko
Date: Wed, 18 Aug 2021 14:09:48 +0200
Message-Id: <20210818120948.451896-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6104c37094e7 ("fbcon: Make fbcon a built-time depency for fbdev")
changed the FRAMEBUFFER_CONSOLE Kconfig symbol from tristate to bool.

But the drm_kms_helper_init() function still attempts to load the fbcon
module, even when this is always built-in since the mentioned change.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_kms_helper_common.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index f933da1656eb..47e92400548d 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -64,17 +64,6 @@ MODULE_PARM_DESC(edid_firmware,
 
 static int __init drm_kms_helper_init(void)
 {
-	/*
-	 * The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
-	 * but the module doesn't depend on any fb console symbols.  At least
-	 * attempt to load fbcon to avoid leaving the system without a usable
-	 * console.
-	 */
-	if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
-	    IS_MODULE(CONFIG_FRAMEBUFFER_CONSOLE) &&
-	    !IS_ENABLED(CONFIG_EXPERT))
-		request_module_nowait("fbcon");
-
 	return drm_dp_aux_dev_init();
 }
 
-- 
2.31.1

