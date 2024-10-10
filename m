Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA2F99959D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A4310E9FC;
	Thu, 10 Oct 2024 23:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lmrgOI7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441E210E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 23:11:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4305724c12eso10620955e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728601876; x=1729206676; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s58+PumcrxFi8ai7328YyPN+Kl/m7WNPj0jROfEsr9E=;
 b=lmrgOI7y5W7ndwlnZPUEsw0pEdFX6or5MhESygzPen0TXhL1xqCPvJr0DcBbTA+Zes
 A35GtfIkhHp3vOLtZPEL/lUcQrAaWKJ2Ksnrovc7eJxSdFZoMd+6yhAEK5EGMnQipYsB
 oEjxm/i+Xo1NTP55LBGXTl+pKtbagChfoNJuYFdFr62BO20GLVhj1MHzYR/wrwI1LCiA
 wxHS3236Tt3xcNEfzXsRV5OR8gxbE7xZF/1xvDwOWPHmwwbTHUpFBBOLb89ZozOKqC96
 dFTeI+sRhLETZS+kO0CdmVCT+WAA1vK9Az41PSdAmxGejmlGdg+rpV22Aw5a9nZ17Gs+
 +xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728601876; x=1729206676;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s58+PumcrxFi8ai7328YyPN+Kl/m7WNPj0jROfEsr9E=;
 b=Gst8nEkIc/MVZUi+4vef9NvBuSWyoqCqWtV7A4A8YQ8s4eKbwRPWQqs87QZkR165P2
 QpQcVNh+D57s3tQ99xBesSuxpfOu6qVsT8K1zsigr7KI2ZDRwUFcuK+Wk8yMIMbm2vPD
 AkW97Vp7tY65uEJUNUnqgSHyDEt+eTmHK2EGxrE9QSXJuHlglhRNSLS8ANn47d/Z6kF0
 sLaAob2j0qi02JG3V21LRDZKFu0Hct6hbcbc0foB0iL08m5nLhv73qdns2HImpl53M9n
 JXuiAu4oMRKy7M3dPuq8r21l+b2hgyHZzFYyAOMmbIL9USKOJ/b1/sn/S/ZwFuRNVF9Q
 /P/g==
X-Gm-Message-State: AOJu0YxgDxhcvOx4rOykEDeFUrr8D7vMjbLk4GIGDjPcCFR4cfS8o+3F
 PKlcpZm+AVaTb5nO3ZxrdV2wN+ukSqdaDRXBsccZwZMSM9QW+onm
X-Google-Smtp-Source: AGHT+IGNpxnYI2exDYItoqZ2fn7Mvrf6IGBS7K8vHBpTFS5m8Lm+n/fI9fTxQdc0xpXrIqe0VaPpNA==
X-Received: by 2002:a05:600c:1c9e:b0:42f:8515:e479 with SMTP id
 5b1f17b1804b1-4311dea4233mr2599505e9.4.1728601876501; 
 Thu, 10 Oct 2024 16:11:16 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7934sm27465325e9.3.2024.10.10.16.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 16:11:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 01:11:09 +0200
Subject: [PATCH 2/3] drm: logicvc: switch to
 for_each_child_of_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-logicvc_layer_of_node_put-v1-2-1ec36bdca74f@gmail.com>
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
In-Reply-To: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728601870; l=1408;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=mdTdY9w48aKKYhBF3Ntc48k1ASEGObuZ88AuC7JugAw=;
 b=R4bdEpUM8fPQRj1JiSQWFTkvdkMWF74Xsg1B14H1Vp8DgAWXnCmnzvrXo7Obi8t7B9VMNikVg
 DIvUSqwtF/bDhfd3OwCcY9v+4wA6UnmtiziXgNLYpIxJWVFZNAmYoSe
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

Use the scoped variant of the macro to avoid leaking memory upon early
exits without the required call to of_node_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 52dabacd42ee..34caf5f0f619 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -581,7 +581,6 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 	struct drm_device *drm_dev = &logicvc->drm_dev;
 	struct device *dev = drm_dev->dev;
 	struct device_node *of_node = dev->of_node;
-	struct device_node *layer_node = NULL;
 	struct device_node *layers_node;
 	struct logicvc_layer *layer;
 	struct logicvc_layer *next;
@@ -594,7 +593,7 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 		goto error;
 	}
 
-	for_each_child_of_node(layers_node, layer_node) {
+	for_each_child_of_node_scoped(layers_node, layer_node) {
 		u32 index = 0;
 
 		if (!logicvc_of_node_is_layer(layer_node))
@@ -613,7 +612,6 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 
 		ret = logicvc_layer_init(logicvc, layer_node, index);
 		if (ret) {
-			of_node_put(layer_node);
 			of_node_put(layers_node);
 			goto error;
 		}

-- 
2.43.0

