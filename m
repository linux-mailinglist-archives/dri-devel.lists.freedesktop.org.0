Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AB687DDD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF7410E50A;
	Thu,  2 Feb 2023 12:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3C610E0A5;
 Thu,  2 Feb 2023 12:50:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t18so1623462wro.1;
 Thu, 02 Feb 2023 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w5NS+1c8Tu2PGFvK4AFEdfQ0iYep75esswQI1225dSM=;
 b=S7yIohgxwKAADl61gLn3ethmknWpCDOxD611Nhp4wn7OpDjidJ+3j0AyxWK+QLhJb0
 A7x2wzR8uKW8dVcVhy6KMC+9JBXqQYXP3cCLe9bdFzgMyociIRYLMdf7sOKQAOERQkVZ
 TGHtUzYkbV3daP3VDzoLDiApjv6uDFHiUcdnZ58612cUZteYbEUBa+xkaIlMyYWLO/Gq
 4x+QzKCbNdCNCVE2n4yEUAhbQGocwljziYZ20LaA1ibkMv0diz8W28XmCHtJB+KCru8w
 86teva9QCv/IGpnfPvD0VeiR0dMWyPCc6RFJWeTygEACQ3211VfsZPHHOksyfSIrI1HC
 ANpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5NS+1c8Tu2PGFvK4AFEdfQ0iYep75esswQI1225dSM=;
 b=lQf+lUUlqDhS7jPK+d1IZUa3ahQf5WXSMoACD5r9ardnz8/gtBZNvMR9Tvt7Swpa8e
 YjxBtY20awiSWFMAmuIvbTaBAENpdOC1I/9xNnflf3ynWDOSe9BjS9t7WVqHuBchVhHf
 nOfMzDktcQBa3OLGu+w14O5K/SDBLB9FuucmoVhG6lzomCA4VFo8tCt1am9xew77BcbB
 q/wroPMUP1oiE6sg5CKkN5we3t1PD7UB/vFZZ24iBXSLIZIeGAKQCmUrXke2ev2AH9wc
 kj/wT3GFvihIMzOMzDlKm75FF8Yrv8Uv59o+LyhDdIIuIY58ejVyLqRb/M4oMQp3DwqE
 pe+w==
X-Gm-Message-State: AO0yUKV4d+cj4ixbj3t+q6cQtsQ1IyJnz518YBO/D/2jB/MZUInu8Rtw
 vn01007X5i/s/XavDETjEIg=
X-Google-Smtp-Source: AK7set9GirxZBqSwgFAsMboxKE8Izp95X1pyquunjVvuEGOfw96gDntzRpcsoOrreA5T5hjVvI/7Pw==
X-Received: by 2002:a05:6000:1285:b0:2bf:ee0f:9f04 with SMTP id
 f5-20020a056000128500b002bfee0f9f04mr6115932wrx.45.1675342219853; 
 Thu, 02 Feb 2023 04:50:19 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d7-20020a056000114700b00241fab5a296sm19667773wrx.40.2023.02.02.04.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 04:50:19 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] i915/gvt: Fix spelling mistake "vender" -> "vendor"
Date: Thu,  2 Feb 2023 12:50:18 +0000
Message-Id: <20230202125018.285523-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gvt/firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index dce93738e98a..4dd52ac2043e 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -171,7 +171,7 @@ static int verify_firmware(struct intel_gvt *gvt,
 	mem = (fw->data + h->cfg_space_offset);
 
 	id = *(u16 *)(mem + PCI_VENDOR_ID);
-	VERIFY("vender id", id, pdev->vendor);
+	VERIFY("vendor id", id, pdev->vendor);
 
 	id = *(u16 *)(mem + PCI_DEVICE_ID);
 	VERIFY("device id", id, pdev->device);
-- 
2.30.2

