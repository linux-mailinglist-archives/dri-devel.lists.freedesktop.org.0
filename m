Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631051D49F5
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCC46EC33;
	Fri, 15 May 2020 09:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA0989798
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z72so1960348wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8SKLOOah6qSVSrH1aA7D5ryFBzonDZwW2dVBIsTM5A=;
 b=mmk7Qrl6M2xo5jxNW0veqISDJi2Rsm0L6t1q7yQBrvhlv8/b29Q4mK8Hixpi91/Twt
 kWE4D7fn5s6elkKkm6fUB/CL7+3GMyc66BV14coxnn8q8msMj15EkVqyN88JfJSh3hRu
 pEwgxhyxsmVjYcINtxNZ631YJti3ylTG2VT7I5WccyxnSB0JUWwTZhancuWGFTo+QlmK
 txjV4fRFKQi5r8ywfxsb+8MvVLED1be7/1Wd9ZbMMZH0GPlUcwc5dDpEZKAK1knCQh17
 s4B+gzVMa5zdSldfhPL6KxW5FXynbVuYcKdB8il5tzmqVG1yvUaJX5HNIYqE5kG0E1cO
 t3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8SKLOOah6qSVSrH1aA7D5ryFBzonDZwW2dVBIsTM5A=;
 b=YL9psV1HBOh5i3Jjodi14pH5C0MEar9IeqkgXYmuc3sgQnsyJ+4q+pIYjx04iaK3yM
 jC3IQi2wMWQFUt1kS3UOdAn+YDTi/uCatmFgC23trcb4x3J3tVcP8G04EUjTdFyIx46q
 AjyUNPTj8lLA+MH8HaBY9RqY/i49SOvnH5JHj7sR9E236ZnO6saIIf9qOSMY5MwM4VvC
 4WJAfBjkopOwPwtrLLlQ4Zgcv13AMEut9D23CCZZXuuETKG4pO2A6+vJvM+wbYhNzmON
 V2PtswRVVyUibQW1PB8h4hvjob0/qeyBbbGeoRpd8XjLqQ6qxtFpWcUDb3EZEKeciH2K
 N7tw==
X-Gm-Message-State: AOAM531clVrNkj8u6u94h88p2vc8XBoe1dpphaoPSbUJdmJCPGBvClqI
 0AjW36/aNg+yu2dcclj04cs3OvkC
X-Google-Smtp-Source: ABdhPJwCE5PnKIN3zFt8iUmjwgOhzeEiLFeb0Ow8K81xhdf323uP4lTXvv2DXYRJ8KkgD742L26gHw==
X-Received: by 2002:a1c:1b96:: with SMTP id b144mr3144782wmb.6.1589536442948; 
 Fri, 15 May 2020 02:54:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:02 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/38] drm: remove unused drm_gem.h include
Date: Fri, 15 May 2020 10:50:41 +0100
Message-Id: <20200515095118.2743122-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 56197ae0b2f9..954baa8a2a8f 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -51,7 +51,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include "drm_internal.h"
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
