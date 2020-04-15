Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997701A94FB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B196E8E0;
	Wed, 15 Apr 2020 07:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0036E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so17253450wrp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PYhK9PeyHN9Se7zWckWuH+CKUAQb8wgDIX1vJ8dbfI=;
 b=EMxn3uLWNiLBg9QPG3GAvetV8BTE4dERLT4lGe7A7UC7Kx+Nl6vYMYBupbOr26MzGj
 JJ5quQtUSVT6O5DaaTplhEbnRFOzQrh1QBYYKHPORAjTpmUAIJ8D5Q8iyJWZT/fcpM6q
 fPxQ2hQIKOBsCZtKJ0aRG75irqgiLY9807UR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PYhK9PeyHN9Se7zWckWuH+CKUAQb8wgDIX1vJ8dbfI=;
 b=E6ZHFLpsq1NeTDZqPyWTZbb7eNkyeUexKSdlp3EaErVpq6lhD/9XXmkf1iIZvwBlfw
 aGYGl/w0qU9zbnhxh0kHKwadLgamKsF6WWUrcgmtK2ZIw4lkBE8PsWAYF7rNNQkpI5dC
 kL3rbX5st+dFI6rdY47lwfE3hlG09xdWhHaCPZWFDEuWPIIuZFjHfTe1sklchWn6bNsI
 UVocHyipBAhxObExtfB9WKRnLidj/EdyLlLA0AhXObscH7wtItFyxAIqZXlDY6UlHmKs
 qR76mfpH0YeApTvu23Wi75jxmayQT8mgES2z3Fs0VCllfZc1xWqEf4iohlES3Rhfcy/e
 Dk7Q==
X-Gm-Message-State: AGi0PublfrqegWDL+unZh+nY07Od0NdVxIh77HoHRALD2X44OR2vMH78
 FP4+T54wK9hABgMpFFzKiDONPg==
X-Google-Smtp-Source: APiQypLV8WXAklnMnfy9GuM7TFNlpDXlkMzsNe1juREetHB5Fq/+q5s/1uJxKuGWuPYrSXbMvAJSIA==
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr41966wrs.78.1586936500685;
 Wed, 15 Apr 2020 00:41:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 59/59] drm/bochs: Remove explicit drm_connector_register
Date: Wed, 15 Apr 2020 09:40:34 +0200
Message-Id: <20200415074034.175360-60-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is leftovers from the old drm_driver->load callback
upside-down issues. It doesn't do anything for not-hotplugged
connectors since drm_dev_register takes care of that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/bochs/bochs_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 7f4bcfad87e9..05d8373888e8 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -104,7 +104,6 @@ static void bochs_connector_init(struct drm_device *dev)
 			   DRM_MODE_CONNECTOR_VIRTUAL);
 	drm_connector_helper_add(connector,
 				 &bochs_connector_connector_helper_funcs);
-	drm_connector_register(connector);
 
 	bochs_hw_load_edid(bochs);
 	if (bochs->edid) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
