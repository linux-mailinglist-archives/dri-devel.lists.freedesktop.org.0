Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D134175B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9368B6E9AE;
	Fri, 19 Mar 2021 08:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24BA6E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id t18so8256698ejc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=oYWlnV715tCLUBUZeEDrM0wpCjeONuoxo+3C79hxVxvB8pCEQYK+jSqFAx2gbfgfwH
 n1TztEimoVY6MF894XhvGVjWrmeVXaVorLFS8ocMbNhFlUz2t4DL8H9yv6Mi54buMcP2
 zrrtllvrV3JRgkGqf44mltxIzcxnMk8t7PnwcUJjIHICtm79tOaAYocHa45kjgQaqGIF
 E/gReLSRwchhEXGmAmFH0ZYmXlBGQ38VW6Ed/nUE783qy8NQ27hsty26IGAFI5ZZJv5E
 aYta5XBi+HF2Zq7l1JEX14Ib5cARXLIat30SuqSMDq/lG/mSrl8dk4NxJcs8BQCPG2a9
 tWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=frxqjXZj785eKLMNhmPiMTcvHsOJlHoi1LotJiTbhUHZJcLAi3TQjfK9TTTo1e4T9M
 8MIsjA2JEQ8lLqxXHHNI0/3w6wPWpmk+W50Kv0Wj5t8ZuvVNAux6QDCGrUqTZMrYa/7p
 jhXcAKw8xUI8S6PFZ3ogmiuPMihZWarrtnX6y6z7aeJTW+qqcT0MbmdJ/SG5K8J3IuNC
 SoStsKklPlK/pkaXhx0QCtsUyqUGBoe0QZlB1mzT1EOeWKCOKQY2El+xHKBrzT29hiWj
 r1Qw4HirM6dh1Xg4DHUw5MOLComGoeDir6xIGm934DMixttlp607tyURJooXQv9uTUjg
 l8iA==
X-Gm-Message-State: AOAM530qTL3yebHQnQfk/e75c2Ept0NGkEyofqPeE9Im/EPXzkBMFSlV
 /zjFldRodvb4ZebCaPmusFxYkg==
X-Google-Smtp-Source: ABdhPJxuH+2sZwvtwXnTvWJjVjs+eqo/uTPUENoEZ5KkXMAP0d9KhrIHoM6ef56AjMLywklcMo0kcA==
X-Received: by 2002:a17:906:2b46:: with SMTP id
 b6mr2916696ejg.521.1616142290404; 
 Fri, 19 Mar 2021 01:24:50 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/19] drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to
 standard comment block
Date: Fri, 19 Mar 2021 08:24:28 +0000
Message-Id: <20210319082428.3294591-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
