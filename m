Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E530A89D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DF86E454;
	Mon,  1 Feb 2021 13:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BD46E454
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:26:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v15so16557259ljk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ/JrPKNS9o2HEP+luNF+GgwglKJg4easN3w4HlyOZc=;
 b=tkD59PWpDRcAccheOBo9990b7J+O8dWhZmshW9s5O/8Gh1fBShFBMZ/Kmd5XpnmaiS
 1hBK1FQk/eUPSeWMNVyxbV5hHOuAqmF/YLwvh9bGlBl0j7MVuT+SRT0+om4X/Ghoy8Gc
 wf8KC09K0Qj+LbRuQ7vSodS+LgojPxzKHQJUJiy8ap4WF9JYLtSWMj8zFLEMzHypaZ4h
 CZSTfxAX0t7eJsxO2va6H0kDvy6V4vTj/vebFCtCAULm6wHFH674xPilljCyHutkmPS9
 htZ4rDZmWTuQl38LFXwtdrlLfyk8PLm4+JblsF0TIuzF7oO4bpon4pWgBVyw5lhR3KVY
 pBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ/JrPKNS9o2HEP+luNF+GgwglKJg4easN3w4HlyOZc=;
 b=AoHsJFyLaQ6UPPj9BmTt8s/GHzo6/3y5e0tylkuKDLxkkhyrqYXxpMSHTPqv8Bkb4H
 TVtV/H0rh+LZUGmfNybOkLzSJe+tbaNRvYcNKhP1THU93u1ZcdywZv7ol2m5DwSDC7lJ
 GJmiq8lSl4oYIwEwq3rx/OEqnhz3VDrbvTIxa7LLHRG6lf8GIZiN80WnraANfjJkS3Rt
 8eyGUKzb6AtnY3i90dsgSR7GAOLG9d+dZfWpF98/N2i+DuS4Cc5RJI55DLoZEpSmBNdB
 DUHbb7wV8lgFuTLJJwyIMp2Xk9LjUE+El5o2HLSn4dgU3O9+4grDBA7jfTRjsp0R+nF9
 KkPg==
X-Gm-Message-State: AOAM531Uu6RxX7raQcaZQuHcyOQKY1uMQwyWwyuONKzm8jUWpbbNBdGe
 a8/9QaVpnR8TNRdAhgqDF7NSZaED8xs=
X-Google-Smtp-Source: ABdhPJyQ8qGSmlL5GPWl0kvRwAScIZ3WBYa/RPoZuyS6h6dKYRe6oo4ZgJzddFgvOcaQ9HzZbVP6lQ==
X-Received: by 2002:a2e:2f19:: with SMTP id v25mr10772666ljv.184.1612185989064; 
 Mon, 01 Feb 2021 05:26:29 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id p21sm2984737lfu.227.2021.02.01.05.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:26:28 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/gma500/cdv: Remove unused code for crt init
Date: Mon,  1 Feb 2021 14:26:12 +0100
Message-Id: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.30.0
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
Cc: airlied@linux.ie, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clearly never been used so just remove it.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index c48c9d322dfb..4a9bb4994a26 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -248,8 +248,6 @@ void cdv_intel_crt_init(struct drm_device *dev,
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 
-	u32 i2c_reg;
-
 	gma_encoder = kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
 	if (!gma_encoder)
 		return;
@@ -269,24 +267,13 @@ void cdv_intel_crt_init(struct drm_device *dev,
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 
 	/* Set up the DDC bus. */
-	i2c_reg = GPIOA;
-	/* Remove the following code for CDV */
-	/*
-	if (dev_priv->crt_ddc_bus != 0)
-		i2c_reg = dev_priv->crt_ddc_bus;
-	}*/
-	gma_encoder->ddc_bus = psb_intel_i2c_create(dev,
-							  i2c_reg, "CRTDDC_A");
+	gma_encoder->ddc_bus = psb_intel_i2c_create(dev, GPIOA, "CRTDDC_A");
 	if (!gma_encoder->ddc_bus) {
 		dev_printk(KERN_ERR, dev->dev, "DDC bus registration failed.\n");
 		goto failed_ddc;
 	}
 
 	gma_encoder->type = INTEL_OUTPUT_ANALOG;
-	/*
-	psb_intel_output->clone_mask = (1 << INTEL_ANALOG_CLONE_BIT);
-	psb_intel_output->crtc_mask = (1 << 0) | (1 << 1);
-	*/
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
