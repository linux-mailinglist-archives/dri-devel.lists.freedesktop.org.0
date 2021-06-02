Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7EB398D02
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6366ECD4;
	Wed,  2 Jun 2021 14:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58FA6ECCD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1852288wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVk/K6SiOopKBeZrOFr3ETwL2h0sUuVeJjHQIvLbemo=;
 b=aOFSzbMh1MJoVmxlcUdFd7U7AXDU29/SRvovXJ/BeXWOGMTp7ZiZ5+ET8rZahi52XC
 hHDhj0Lx3Wc5PNGUDrKCNTx5QuvAelYzl4pw5OkYJPkUuResbzQ9wEWBDk1JFEgvdzvq
 7LC0I3lfvRWBsPUeCCHB0McrH101t6G/TFaIl8uVofGuk+LlX2xALid4KW3okkHvPtMl
 R8YPiaapgbSYH0BtQ0eb3VJ/P9UTdLMwwZYxGHg9ElRG7QaS+dlGKDGjJLn+HLLpoDSQ
 S5XvxR4cDDxbfSnepK0A7TgnHIpxpwUpvsYtzaydMJ+KHUWD9rv6ca2rd2QY/+PL1Kzt
 Zk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVk/K6SiOopKBeZrOFr3ETwL2h0sUuVeJjHQIvLbemo=;
 b=QQZ4we+QuDwqFQlRX4XNwj5QdYPQPu5DArcjFxPKSIvOf/41+4bjQdlxw3nqjsTt+i
 NwOVN4o5rI+FFbyNsH3gHGSgPCyGvdnNB4sphK0G3w/aaPdygfWZyzdRsTTKNMJLhOpm
 EFYI6PcKDg2WIle9x5KWPOfOmskDAPOS2dYJ/9Lrc4fYCdmJDIJqpbI30II7fdiap5PU
 mTXj2Iu7lmIpTjCLLOKA/iLzHerGz2uuencnAoBve0Ix8zGMi2WoA+OK1iEF95YmDx9w
 AgsxqlukOoPz7wG6IXiSA5TsT8ZD43F7fCYHQoIBWNRCiwt2faqsxXR/lIElgvQKion8
 oxxQ==
X-Gm-Message-State: AOAM530N882CpF0Ie85WDync4muprvPwLkdJO1lsZk+4AY5pvuoxhlut
 Xy4bJ2u/FlRUPOt8CGMg8VB4NQ==
X-Google-Smtp-Source: ABdhPJx7/89qHUI3nSWoMnefrKMkjP5VwkmsVsC8ptnnljyy095o77k3JyChKVY7mNukeFzEjN8Dfg==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr5628267wma.85.1622644416555;
 Wed, 02 Jun 2021 07:33:36 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 26/26] drm/vboxvideo/modesetting: Provide function names for
 prototype headers
Date: Wed,  2 Jun 2021 15:33:00 +0100
Message-Id: <20210602143300.2330146-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vboxvideo/modesetting.c:11: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/modesetting.c:54: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/modesetting.c:87: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vboxvideo/modesetting.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/modesetting.c b/drivers/gpu/drm/vboxvideo/modesetting.c
index 7580b90023792..10b32d986b956 100644
--- a/drivers/gpu/drm/vboxvideo/modesetting.c
+++ b/drivers/gpu/drm/vboxvideo/modesetting.c
@@ -8,9 +8,11 @@
 #include "hgsmi_channels.h"
 
 /**
- * Set a video mode via an HGSMI request.  The views must have been
- * initialised first using @a VBoxHGSMISendViewInfo and if the mode is being
- * set on the first display then it must be set first using registers.
+ * hgsmi_process_display_info - Set a video mode via an HGSMI request.
+ *                              The views must have been initialised first
+ *                              using @a VBoxHGSMISendViewInfo and if the mode
+ *                              is being set on the first display then it must
+ *                              be set first using registers.
  * @ctx:           The context containing the heap to use.
  * @display:       The screen number.
  * @origin_x:      The horizontal displacement relative to the first scrn.
@@ -51,10 +53,12 @@ void hgsmi_process_display_info(struct gen_pool *ctx, u32 display,
 }
 
 /**
- * Report the rectangle relative to which absolute pointer events should be
- * expressed.  This information remains valid until the next VBVA resize event
- * for any screen, at which time it is reset to the bounding rectangle of all
- * virtual screens.
+ * hgsmi_update_input_mapping - Report the rectangle relative to which absolute
+ *                              pointer events should be expressed.  This
+ *                              information remains valid until the next VBVA
+ *                              resize event for any screen, at which time it is
+ *                              reset to the bounding rectangle of all virtual
+ *                              screens.
  * Return: 0 or negative errno value.
  * @ctx:       The context containing the heap to use.
  * @origin_x:  Upper left X co-ordinate relative to the first screen.
@@ -84,7 +88,7 @@ int hgsmi_update_input_mapping(struct gen_pool *ctx, s32 origin_x, s32 origin_y,
 }
 
 /**
- * Get most recent video mode hints.
+ * hgsmi_get_mode_hints - Get most recent video mode hints.
  * Return: 0 or negative errno value.
  * @ctx:      The context containing the heap to use.
  * @screens:  The number of screens to query hints for, starting at 0.
-- 
2.31.1

