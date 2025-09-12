Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D312B56091
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBEF10E124;
	Sat, 13 Sep 2025 11:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eHF45OCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B974910E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:42:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3dae49b117bso1720467f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757695366; x=1758300166; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eLwAUPbOiAmud7bKZYKSB1YsNPeEWpmZUaenVfyVXkU=;
 b=eHF45OCdYPwA3ILMoXN3njbg45ac6avRszKB2JUxzIMFsKeXMWQJOupUDXpZygfmdg
 AtaPeNSrdmR77b1WGDN8Vo9i8LIo3OvI6sT1oKW9aE2Vv29jyGJyczZP0xcy8r77rb2V
 FI+2iFu7JBYAUQdBLWo//wgvafEUFOlLjbkB2Evf6gB5Gvm2ac9n/qExWkcPHTU3y9SD
 9/c2cSosCKeCuFjB61nAS4k5ywS3l3lkesWC5dBMQwtPlly9kCC+jmEv6x7vYFOrgPMS
 0TBlOUN7OIPG2t3Fm7Te/SqowsrQeiIyjgbiG5BFw1bymH2iUiHE1tq0ry/lQ4Fz5jCX
 MQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695366; x=1758300166;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLwAUPbOiAmud7bKZYKSB1YsNPeEWpmZUaenVfyVXkU=;
 b=Zwm/15k5VJKNaMoLRZ5rstWj+Yrezy6VVl3vuzEtvQ2kXPSh7kl8bue591AyDBfOre
 JboNMTdXpaKZd7ak38cM3OivHj8g7P2ERXamPHJKVzmBYzM84slYoFvCnDhoTr0Xi1sJ
 Haty1+fGTotC7dFNuyuRqYKq8lQmgAk6y7DZ93+VmXCnAIF7Zc6A7OlQh73LEhU2thDd
 aGXvBLfIto26u7aGRPW2UIBjZgYYOESoWzXEzA1DsMaPqH9pEafp4m+cJmijh5AIhYu1
 vt0JTJCiQ2GKHNdDGDkZ9tAg3Nqx3A7ehXed3IaEMcuXdRF89Es2zRzMWWIpOlw0S0zt
 aKoA==
X-Gm-Message-State: AOJu0YzaVl9E/GOnVto/xFSQJnHRcGhnsN6bK7B2m1zDnccIO/2yGboV
 xOW6QtY2c7qyZlgjB34FpQYXRn0OZDquxZOml5wolRAkVuikILTWhkMQ
X-Gm-Gg: ASbGncuvfhXCpm2OeF/icRgCX6z8qWoRotnekib3uar8ay+lu3sb8hwEfGhMjYrTgZ9
 eegpfFe45TqtiP4nuPFq7Oo4Khq/dk6WD/YXb0dDaCxbP6+ruTjIx6AwPGfTY2/1yvqRg9ZIfUu
 korN2iQTSWT0dGHA80/7ZdYnwpc1amw2PPgYEcuC4c1vEjdG7NTSUIR963DYF88401tQ4vls9NR
 hvaI65LejhneAVd/JDS2/xb7+0xUeJx6MHXdOnOJj5LqiF19izGX48IF/N7p2jUEi927+ATjlPl
 q4m+uHvdcmr/1eD7No+aY6sCURl0OLR9RQyYr7rxrxGoqiqCVLUDv/ena6QE06ILuUqBUgCqX/H
 zNAKmcpu0GXc/kS17tXXB7NVwfDJu8+fkprcJcU8+yDNEM4BUSSphzlDNYiJhukifeDGJJDMAFa
 k=
X-Google-Smtp-Source: AGHT+IEKnltXeeMvVDI2QemSGP+MIU6It7d9Of00qdZt9eZWQWOA1s5MS+l2BWMiGa13PqXhzaHkNA==
X-Received: by 2002:a05:6000:402b:b0:3dc:eb5:503b with SMTP id
 ffacd0b85a97d-3e765a1607cmr3933540f8f.56.1757695366194; 
 Fri, 12 Sep 2025 09:42:46 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd415sm7086696f8f.30.2025.09.12.09.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 09:42:45 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Sep 2025 18:42:13 +0200
Subject: [PATCH 5/5] drm/solomon: Enforce one assignment per line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-improve-ssd130x-v1-5-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
In-Reply-To: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

The code contains several instances of chained assignments. The Linux
kernel coding style generally favors clarity and simplicity over terse
syntax. Refactor the code to use a separate line for each assignment.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 7bdccb5140195a45d8ffd01e139dd4eb2e3cc327..a09e64719f62562126851e67c4f77d779b861148 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1864,10 +1864,14 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 
 	mode->type = DRM_MODE_TYPE_DRIVER;
 	mode->clock = 1;
-	mode->hdisplay = mode->htotal = ssd130x->width;
-	mode->hsync_start = mode->hsync_end = ssd130x->width;
-	mode->vdisplay = mode->vtotal = ssd130x->height;
-	mode->vsync_start = mode->vsync_end = ssd130x->height;
+	mode->hdisplay = ssd130x->width;
+	mode->htotal = ssd130x->width;
+	mode->hsync_start = ssd130x->width;
+	mode->hsync_end = ssd130x->width;
+	mode->vdisplay = ssd130x->height;
+	mode->vtotal = ssd130x->height;
+	mode->vsync_start = ssd130x->height;
+	mode->vsync_end = ssd130x->height;
 	mode->width_mm = 27;
 	mode->height_mm = 27;
 

-- 
2.51.0

