Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8744BD34C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF35B10E23D;
	Mon, 21 Feb 2022 02:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5740E10E243
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:01:56 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id d3so28174535qvb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 18:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xm1cMaCkcFSMVRTdtnPXUfUPWuii3wzaFgpfXsoXG2A=;
 b=Na8QdkPf6FigMgVQv+a7Y7Kx6u0cIM+zkaNaBVSaG1FBShpwJ97P+BUTV6yUBk26lj
 xSVBnFQjs6Sb9e9LEV+/dwWQ4oQ7p6KCwR89X7l0CBkicBCNITB2xlAisnQxKgVHjvyF
 sxZBZGLk4SQonSDI9Q5OQzj5XQCnwIIkdHKBJVv5+Y8Yi/Lpn5xrK7kZj3lMDCh8Auic
 hvhEmWEg0M8aiUGA/vpS19CNKR7AhQwSL5pnR6RZGCl5Cx7SKTcjA1FXTOP64k9hS1gp
 7SC/SRdgt8JDKojHYK6g8Gd4LGL5zMIxYp96V3uSZnnmIVSrQABWHeuwNPKhmJCWPYpZ
 /5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xm1cMaCkcFSMVRTdtnPXUfUPWuii3wzaFgpfXsoXG2A=;
 b=qiPjhORD+fJbx1IXTfegdxnP8mh34/8zTVthiphTLkfL8YBaKYTE9/9WwjXirgT25s
 pA0RPj/ii7xjYN1uFkPOGdW9wRtMCjZwBAUp3lSPv03WLSwPrSPjVCAOZxmwrhcQ/3MG
 CEwZqwOiJiklHgt3b3vMjVUwzgt35G3ikEeT2//zUqvg9PPwiMNXYgheM+p3iwVRsJ3Y
 qDoIuHbpFbIPTN/bJcB9YDHM3JvVh+fue8rTdMxn9wCDkOJJ57aTxyC0dJjYnxLuiqv3
 Y6Ti4MnBSzMSK3y4yh6wmVpG4aMJ69CXjY2WiMt2I7UZyXUBhb9yqB9eGd/otLlDexeW
 xrrQ==
X-Gm-Message-State: AOAM533xk67+s6FGAV9VLSxqoVuwlZWHQSns9OAHSwqySqUAGwhWMSnB
 48K4UochG7JBE0Pg+uQILEg=
X-Google-Smtp-Source: ABdhPJxf0c/OjvzGzIXOMLomQn7QEFY1yBhiwRUVfZgOYWPHyKCyJswQ2/4MsYKBC3PAFiY/tX6tgA==
X-Received: by 2002:a05:6214:5092:b0:42c:1e90:9b7c with SMTP id
 kk18-20020a056214509200b0042c1e909b7cmr13906133qvb.47.1645408915373; 
 Sun, 20 Feb 2022 18:01:55 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id w3sm30171434qta.13.2022.02.20.18.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:01:55 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: linux@armlinux.org.uk
Subject: [PATCH] drm/armada: Use of_device_get_match_data()
Date: Mon, 21 Feb 2022 02:01:48 +0000
Message-Id: <20220221020148.1925091-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/armada/armada_crtc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index b7bb90ae787f..b18daef75354 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -1026,13 +1026,8 @@ armada_lcd_bind(struct device *dev, struct device *master, void *data)
 
 		variant = (const struct armada_variant *)id->driver_data;
 	} else {
-		const struct of_device_id *match;
 		struct device_node *np, *parent = dev->of_node;
 
-		match = of_match_device(dev->driver->of_match_table, dev);
-		if (!match)
-			return -ENXIO;
-
 		np = of_get_child_by_name(parent, "ports");
 		if (np)
 			parent = np;
@@ -1043,7 +1038,7 @@ armada_lcd_bind(struct device *dev, struct device *master, void *data)
 			return -ENXIO;
 		}
 
-		variant = match->data;
+		variant = of_device_get_match_data(dev);
 	}
 
 	return armada_drm_crtc_create(drm, dev, res, irq, variant, port);
-- 
2.25.1

