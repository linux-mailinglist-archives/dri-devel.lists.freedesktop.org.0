Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B62F4D88
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770A6EA50;
	Wed, 13 Jan 2021 14:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59F6EA50
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:23 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q18so2430580wrn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZA26LGPctNuqP7mpV6XCcQsQZ+HB0XmYF1B/7L0jYA=;
 b=YtqFI8RDxxpW9mdQOUk2m2f1SEWXkWNA5Pijok8cpdh3D28yUmkArEeHKDJHaMEw2D
 PdgSAP9Q4tLae/SkYSJ5eTZDO+n6pFatwv/TqUUoiuB320K732eTGq0iXq8oR/tNfkIH
 9Y7pMmU2dnvUJlE7Cdikh+7Q8gG1oq1Nl7lwW/RGcLXR8b/1SFcPKGDY/yVn+9vcaOw5
 ZsO4KDnuoqv4twTiAyGApWz9SY9RChb3/M/q2nVmM21sVoOCVxHdSCQemO93T1g3lrAj
 3Lx+99Zkwfs70d4L1iYYRAQVeIVTso9ON+bmqWt1gSMmPn5bt/vIUtmLPizMCW6GT2UM
 qWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZA26LGPctNuqP7mpV6XCcQsQZ+HB0XmYF1B/7L0jYA=;
 b=czj4MDMsfBViwZYhuGKNT8MHTMp4+AI8Kdb/y0FyfiY3pGmR59SKoGTh8bmMesEUUm
 eT6wHFgkueGy352HQh8E8JaoMgedcQ0budH95U9JwS5M9eKqqUjAHo/oNNsuNVQI85RV
 6KxjVdtZvzUAkCX6/fQ0hfuJyEzSvytIvjNz3Wc4L3iZn4tyiKN1fbk1LXNHWmN9YgCa
 V+nl32RxdMOMDL7NJvMqjlPtfUsYo3AUBICuwRpy9VAHXClTTev7F0Y74TkYAKEoJn51
 zBLAFJFdzSNbvC8CZRDdmm4fDZQOey0DFpwuaDPWyIT2wgmcsbZw7mPe3BrEhN39LrIX
 Yhfg==
X-Gm-Message-State: AOAM532qvCwzq4Ti4NVaWtFNxFoGWnXKWYf6zHxdQT17c5d/md/hHIb3
 NOxlpcMUrFsxME0HeOeELKPcRxgTeUOuQmec
X-Google-Smtp-Source: ABdhPJybD9xMfIqt11fPwnFfiI93H9p+YPj4ju8Xk0ywP3UrRKbDeRkdo75NDlfYMlTY1EKiKvzaMA==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr2935428wrw.379.1610549422311; 
 Wed, 13 Jan 2021 06:50:22 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/31] video: fbdev: core: fb_notify: Demote non-conformant
 kernel-doc header
Date: Wed, 13 Jan 2021 14:49:44 +0000
Message-Id: <20210113145009.1272040-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: Antonino Daplas <adaplas@pol.net>, linux-fbdev@vger.kernel.org,
 Brad Douglas <brad@neruo.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/core/fb_notify.c:44: warning: Function parameter or member 'val' not described in 'fb_notifier_call_chain'
 drivers/video/fbdev/core/fb_notify.c:44: warning: Function parameter or member 'v' not described in 'fb_notifier_call_chain'

Cc: Antonino Daplas <adaplas@pol.net>
Cc: Brad Douglas <brad@neruo.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/core/fb_notify.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
index 74c2da5288848..1f142182fb40e 100644
--- a/drivers/video/fbdev/core/fb_notify.c
+++ b/drivers/video/fbdev/core/fb_notify.c
@@ -36,9 +36,8 @@ int fb_unregister_client(struct notifier_block *nb)
 }
 EXPORT_SYMBOL(fb_unregister_client);
 
-/**
+/*
  * fb_notifier_call_chain - notify clients of fb_events
- *
  */
 int fb_notifier_call_chain(unsigned long val, void *v)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
