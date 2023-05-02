Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76C6F4461
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3220A10E036;
	Tue,  2 May 2023 13:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EAE10E036
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:00:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so37234755e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683032402; x=1685624402;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KN5DwxFH9ZHQdijbpvDL8/gNlVBQ0FOvg+tNx3WkTWM=;
 b=hPysCzJRgbbN0mQ6qv+ylKC7vkBf+zvIpyEkZOSenueWi+VOU8jYsZBmpUzQQPDIwQ
 KYfNa/58ehwKA2mxeBiMNuwfr+7ySqUBA5IxVS11H1fD+k4wR9reNrdSr40z7p3OoT9e
 EFKOMtv7DdVkLi/B+d9MQHSyqpA65Xd3UvUwicuRUBCNqTxaUo17h2S9FI65RFtEnwCc
 Jz1tAfuLPNRsu6HT2l4uWWIk9tRvpHGyX1XZXru0L/VIzvACAVMWYWhdKXaXNlmKz1NM
 lkabS0SskEdiYYCwjvhDC84DDi46260KZJu22k2dCuFUIedcX1ULWAukantibuFJnjIS
 FcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683032402; x=1685624402;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KN5DwxFH9ZHQdijbpvDL8/gNlVBQ0FOvg+tNx3WkTWM=;
 b=RcxXWgg24VIVYcP9NO++wJ90W+RWi0+pKuoYz2o1ZrRrIesCxEfZujwWdQS5M4Emrv
 yDIQ/lE3gImQpuGVvzIWpMqZSvsUO3UKAlOfR1eUgCTlliI9B9J2XNbJOZ6OClrMx3Qf
 nb2UUgK80rPAwABQhALkfAyxL85EvV+p+sYWmN8E0SukgacDuIwkQCLQy8PsDn6FqTrJ
 H26M3MEL1uHy7w1RUUZ9YvcyfN7b0+RZfLCb84MtOn4Bnshfmxx9lkG5S6W46seOFH+q
 lBZEdgTvzuETVpO5xeGYHz7bOBhiRhzb7jPtDPkN9AoujwvWG52O5Dx9Hhxfilr+QlzV
 byYQ==
X-Gm-Message-State: AC+VfDwmhalAreagp1s4Q2xMictqBlA8Zlgx1OOxGfvLvFRXhMECtPAX
 CLUSRRvcBinXeGBWq2RfNe3nGQ==
X-Google-Smtp-Source: ACHHUZ4xh4sT90PCCgn3h0W/yGDi9Vp52BFYj3sw0YnTDAkwtopiToJv/pjulfyRh25XpqL1UxuCVQ==
X-Received: by 2002:a1c:7312:0:b0:3f3:2e4e:c738 with SMTP id
 d18-20020a1c7312000000b003f32e4ec738mr8313404wmb.3.1683032402584; 
 Tue, 02 May 2023 06:00:02 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003f173419e7asm35184594wmf.43.2023.05.02.05.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:00:00 -0700 (PDT)
Date: Tue, 2 May 2023 15:59:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@redhat.com>, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] drm/udl: delete dead code
Message-ID: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "unode" pointer cannot be NULL here and checking for it causes
Smatch warnings:

   drivers/gpu/drm/udl/udl_main.c:259 udl_get_urb_locked()
   warn: can 'unode' even be NULL?

Fortunately, it's just harmless dead code which can be removed.  It's
left over from commit c5c354a3a472 ("drm/udl: Fix inconsistent urbs.count
value during udl_free_urb_list()").

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/udl/udl_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 061cb88c08a2..3ebe2ce55dfd 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -255,7 +255,7 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 	list_del_init(&unode->entry);
 	udl->urbs.available--;
 
-	return unode ? unode->urb : NULL;
+	return unode->urb;
 }
 
 #define GET_URB_TIMEOUT	HZ
-- 
2.39.2

