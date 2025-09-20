Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE80AB8C5D4
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02D10E2B6;
	Sat, 20 Sep 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M/IBScA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B58D10E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 09:46:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so22634915e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 02:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758361578; x=1758966378; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U1k1X7wVhC2Ie0OtoDz9fs6zchWP2fAQ9NgE8oeXh0w=;
 b=M/IBScA7r4qeVtIO++7WMB00SHGIxr1XrYRO1lkKr5HY7UJoL0nQaXl34t6QJw+P43
 Ft2xrjh17pWsNTrEboi6/OnvSKBfrA382KnqCjgxJAT8+gTJzr9aw3xqBNK1pVhIOyr7
 7adhrXpb8GaceSulz6T1Sf7Du6v3By/YnF1kB2VZNb0jgURXxHIlPfTcwolgb8X/Hi1R
 5ME3GIz8VC429rk6ur6slLLKyBI+x2VcL6BtZcEhpQQQAKJI0yMTZOWXol0RdTK1zk8g
 E0kZ6Cb8GHY5PfL7B+hLU5mXQjDVTrZBj/hM676yfyOgnV5aOi+WNWY1/leV6b1MKYuN
 v8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361578; x=1758966378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1k1X7wVhC2Ie0OtoDz9fs6zchWP2fAQ9NgE8oeXh0w=;
 b=m22OGMlvEqiR4d3x02EMAAX+uYQQDrNLNYHf67N5s5inMQl+G1YqU0KQ6P0YlqyFjt
 cHCOWwyIWGPpHlP5hCUX20yLBQfMz7U15w74QhbmU1llmamPjFn+eLVnT1TBu9TCAbEi
 tHZ+TR6cBmPKZa4MIG4NjqPeUl0r79MmcqvUtoV4K+FWFiaBaSWo9lL4uEr7U9Qp9VsE
 5pWhYz0Iu95zzLi4ymcRKgIdurVCSRDmywkQ3IixJZFSHevsN0uZB0yvWQQlpxvAPQTJ
 AvZjXSoLzTbThNbGMIbBrbIjcNuly9xwudMwgu1LtPtHvpxXAm7iX+zyLQNh6fCLK9zC
 SQWw==
X-Gm-Message-State: AOJu0YxZ70NG4GmASp/C+H+vk8DrHS4ScCo1Sf3VmwVWWiH63H4rhwS+
 jTKplqQr4+xIvke4i2tNT66CFpmyCaAyAEox8pRgIq2DiL0VLkbZAo6u
X-Gm-Gg: ASbGnctvmS/FBczwoW2L8iogZn4vHTbGAXgm8BYEWsJtteGXabpcGCtT/slEgc9wXt4
 0ZOiVjmaPSTlt8Mut71N9XsOu+Q4qyNbiK+ylGqxdc+47ZtGX08tdzpaeWC112pRIJus2XCDt7n
 7oL28YqJQbdZ0kauIlteHe++gEqWDDfIroXo/hVhf8dGO4ZH38fkuHuIYzl59iYCt+xeXVtdEpL
 hF1JT2sifs2jPxJblCbHFs7CHyaeR8vUgJ1SLnTtuhlVoh6bR+dIgci0OET4yx+9IBpoEwjaaWA
 ph0p+FUIBSU3YGxqwwCa4I/BPX/IOsdVj49WRcm20+tQvoesz+98Yz7xPxdX7RyhS+UlJxF0gn9
 qfoU7F9vNebezjmJ+PDULkPMoVpFjqzVM1R5b5o9pEIrXu9UffYBviwPP1hdlDr4b
X-Google-Smtp-Source: AGHT+IG+MahtWTblaZT5DEDOldTm+ldFui4wqvz2L1QckgRXFnWDqec2nqXs/VZsuZMCBAulm9eIVA==
X-Received: by 2002:a05:600c:3055:b0:468:9798:1acc with SMTP id
 5b1f17b1804b1-4689798217dmr34817835e9.2.1758361577700; 
 Sat, 20 Sep 2025 02:46:17 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm163883615e9.23.2025.09.20.02.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:17 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Sat, 20 Sep 2025 11:45:44 +0200
Subject: [PATCH v2 4/5] drm/solomon: Simplify get_modes() using DRM helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-improve-ssd130x-v2-4-77721e87ae08@gmail.com>
References: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
In-Reply-To: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

The ssd130x_connector_get_modes function contains a manual implementation
to manage modes.

This pattern is common for simple displays, and the DRM core already
provides the drm_connector_helper_get_modes_fixed() helper for this exact
use case.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 6083fd9e9e5e4def670961dc46df7e4adef7462d..50528a94cd3bcfa46517c6ffccf3f458e17cf816 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1732,20 +1732,8 @@ static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
 static int ssd130x_connector_get_modes(struct drm_connector *connector)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
-	struct drm_display_mode *mode;
-	struct device *dev = ssd130x->dev;
-
-	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
-	if (!mode) {
-		dev_err(dev, "Failed to duplicated mode\n");
-		return 0;
-	}
-
-	drm_mode_probed_add(connector, mode);
-	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
 
-	/* There is only a single mode */
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &ssd130x->mode);
 }
 
 static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {

-- 
2.51.0

