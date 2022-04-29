Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E217514479
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07710FCAD;
	Fri, 29 Apr 2022 08:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3EF10FC87
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vubZvz77eO0eWEbWF5Lc06RI0x4vo6zT37jaMVflNHg=;
 b=USYO35rqO1DFeIJuTk5a1ZLlJW+B7N/oh6fpgz80idfWkE1XqXt43h+JIb6VZIzwMcnaF2
 dU3l3p4WzW/hs0SylooDZOpJDt25ipFBLcUEblV2/FHpiFTiHscP4e4ZnbtlzSR/RInyEg
 14lypb9Qo9AoDqpeNjjoW8sM8Bc2yuI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-lOrEUcdmPCmcQGZhEZupwQ-1; Fri, 29 Apr 2022 04:43:12 -0400
X-MC-Unique: lOrEUcdmPCmcQGZhEZupwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l33-20020a05600c1d2100b00394059572d6so2170771wms.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vubZvz77eO0eWEbWF5Lc06RI0x4vo6zT37jaMVflNHg=;
 b=XbUU9vR5DgQs/u+rJqGZmY/WqwUWuBhfA72u8FbZSaXysqyKMKapke1j9ZFuHuoL/Y
 8kiyKfCi9bAj3PoE1p7NVEjWZVkIvRJmNNqIDuzFlesg2DSLtpafi+lzsfMgbAUb7WKd
 ovIxXIFTstwbp3hq9WUhW/wSkblWZGKkQEdXVXaNWHpHIMoDOCFA7smPdZpKHG4PNZZX
 FHpsdHwP3l/wh8pL3imlwO4pFZIA5p6AwNQEZ8GAeGMjAcabkrqurhS1o8z1fUC1rkqX
 vPhTfLJeNxx8XSxJjisc7h+Dc3zghVlcrM+jHHyifvSSbI6pBzpldUJhXDuKLaM8IcfC
 3h4w==
X-Gm-Message-State: AOAM533yY2Ltstwt/vAZ2NYysexgXvwbTaJcL0loyRgXUmxwSeVe9UpU
 7EBctz7Ce/qkl1BWT3VVUasLIlNO0Qo0Tkk+X3iK3pslCjBkscBC0TDGc0HOmOSnXEiV2r0g3Mp
 3PpJC+fJriUlb8L3G//6coTcPptRr
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id
 h12-20020a056000000c00b0020adf2e2c38mr17607752wrx.481.1651221790760; 
 Fri, 29 Apr 2022 01:43:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0tFeN1mlsIlAflE3jz2oXywVPeAUCPmToSm7Z6Ls+OM8AB5Vsy2UusgOW1eoW8qfxPH/hvw==
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id
 h12-20020a056000000c00b0020adf2e2c38mr17607737wrx.481.1651221790579; 
 Fri, 29 Apr 2022 01:43:10 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 03/11] drm/simpledrm: Set the DRM_FIRMWARE capability
Date: Fri, 29 Apr 2022 10:42:45 +0200
Message-Id: <20220429084253.1085911-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRIVER_FIRMWARE flag denotes that a DRM driver uses a framebuffer
that was initialized and provided by the system firmware for scanout,
which is the case for simpledrm.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f5b8e864a5cd..f039419d4d36 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -878,7 +878,7 @@ static struct drm_driver simpledrm_driver = {
 	.date			= DRIVER_DATE,
 	.major			= DRIVER_MAJOR,
 	.minor			= DRIVER_MINOR,
-	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET | DRIVER_FIRMWARE,
 	.fops			= &simpledrm_fops,
 };
 
-- 
2.35.1

