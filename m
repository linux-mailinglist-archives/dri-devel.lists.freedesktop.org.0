Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9B99959F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254FF10E9FE;
	Thu, 10 Oct 2024 23:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EOW3OvH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A5F10E9FE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 23:11:21 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb3110b964so2570891fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728601879; x=1729206679; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QoDVAypqQhFaK++Sbokvz3Z0Wf7Y1INjpj4oxIzXKe0=;
 b=EOW3OvH3iiRUahf0KsZFJUGY6OY2cBF+eubhHvHGhmVnKdf3gsSEBsWBu7l3U6Cm5Z
 8W50wAUvGhddnIbr7votfSIehRIAi5fhm/aWJqVtDPQYX1uaxs/Snidu5TZ5ASr8gNIx
 5VvHpNC6T1D5wjC8cY+Fn4eFyrXs9uoGLOG8mkP8sjEPMw/62nLBZmABYGB8I7rFwTrl
 T+qccBerv6RxQj44657ke9qSfbM/W1i3Ur6XUia8fmUd7kYFo6VL8vweZ8VCoCaqQNbY
 JbbCAScMNgR2A8fb/iaKk9kwi7+yKanc3e8paIbvWQvpZcBuWdeDQb1rnrZVEawvq93E
 Nu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728601879; x=1729206679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QoDVAypqQhFaK++Sbokvz3Z0Wf7Y1INjpj4oxIzXKe0=;
 b=W+ME4zKPQVJFana4ihIjjDIherm6qzRgUuKUb9CoavKpzB/7Ek5oDSKJElxk7WHOe6
 jgn9rqdVUawvJti/5yk+LsGkTX578P6qxwhvqBNFka34/2PUEBbHbyQl9uJWy/n5q8jI
 T8sjYLdYQ06mH53VlS5PrAVc9pESVk24R454Lfq0QMR4y0mBs4Z3WIWvFLrirXkVPiVk
 jyPNX1fyKgePHwHittKp/8iQ7YpJzxBFIxLguzwJSbnU1cd1xSrQafcmQRuf+tmi7Xj3
 VY0nPcVC3ZjQBBT6Tn9AmWImksi3SP+UoUn6ANTwcNmS4eDRA6ZYVsmP0PDbdtYjG8ak
 pfPg==
X-Gm-Message-State: AOJu0Yy3FcpMVzrMECj795GLvG+8gWndN7YhYAbfSvjOoBEzvyTXxWhL
 sscZQYuVRuKwdcYo5sb0phTlo0lOExPRWT5QJlZX7ECUVE/NKG6Y
X-Google-Smtp-Source: AGHT+IElhmpWlC2qdcNgZuGCmGHV6znGXHgoxSCTjh96T2uVOnQzrc2WOk5htA5x1FIloEn2FdMlmg==
X-Received: by 2002:a05:651c:554:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fb329e7a91mr1874651fa.38.1728601878781; 
 Thu, 10 Oct 2024 16:11:18 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7934sm27465325e9.3.2024.10.10.16.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 16:11:17 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 01:11:10 +0200
Subject: [PATCH 3/3] drm: logicvc: use automatic cleanup facility for
 layers_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-logicvc_layer_of_node_put-v1-3-1ec36bdca74f@gmail.com>
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
In-Reply-To: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728601870; l=1455;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=uinenbL4FzpGTciwF347QzY3mFOrkO38x8ZvWc2oCkw=;
 b=rESW73w6bQNwfU9qYsD9vjiB0TiJRGQaTu/ideF4NtwMGTMuUj07VI2HR4vxhs94W51ewLqDK
 +4usfVuwQMhBDTEeG+WwrzapV2yArJJeDXA8h8rlPyqKvVct5mNdPzM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

Use the more robust approach provided by the __free() macro to
automatically call of_node_put() when the device node goes out of scope.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 34caf5f0f619..9d7d1b58b002 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -581,12 +581,12 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 	struct drm_device *drm_dev = &logicvc->drm_dev;
 	struct device *dev = drm_dev->dev;
 	struct device_node *of_node = dev->of_node;
-	struct device_node *layers_node;
+	struct device_node *layers_node __free(device_node) =
+		of_get_child_by_name(of_node, "layers");
 	struct logicvc_layer *layer;
 	struct logicvc_layer *next;
 	int ret = 0;
 
-	layers_node = of_get_child_by_name(of_node, "layers");
 	if (!layers_node) {
 		drm_err(drm_dev, "No layers node found in the description\n");
 		ret = -ENODEV;
@@ -611,14 +611,10 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 		}
 
 		ret = logicvc_layer_init(logicvc, layer_node, index);
-		if (ret) {
-			of_node_put(layers_node);
+		if (ret)
 			goto error;
-		}
 	}
 
-	of_node_put(layers_node);
-
 	return 0;
 
 error:

-- 
2.43.0

