Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4D810FCE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8849610E76F;
	Wed, 13 Dec 2023 11:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168F10E76F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:24:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c41df5577so36561975e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 03:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702466678; x=1703071478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DQvbhLysPu3ndFWzqkdoXhfbQL7mt17avjjy+XMKqZU=;
 b=T4aWQhjkAUIjp5IgQnPtd3ebQKEdKzpgAs0QuP6AZJVgWgoqDQ25c35DsnSTaD1Iv2
 X5XBn/NcUzEyYhR3JgW8gGDL5+uAZWUh+kVnUpvWNWHfUs5zoECoevU0TV5e1D/8tR8J
 qq+Crtpx0Zz2gL6fsX2J9yYlzPn42+1fufm9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702466678; x=1703071478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DQvbhLysPu3ndFWzqkdoXhfbQL7mt17avjjy+XMKqZU=;
 b=AC7ZPnxuzmgQYRpp2ICgC19W/Z/OHO8n8BD2zMg4eaqyk8RFRx+vmKolHRVt0d+vsK
 kvNglPcfx4iPQWXIUNyzr+S3w6zF2JtlKqyumI3AJM31xhCAW3mlheQf6MtoGfq2DPmU
 zogHZBsoEsHAiNiix1ddExsTOGMtIULVKkuoCC0qdewlm0jpC8u+RGgUvNUVQLVpx3he
 TORxSZHNOWxDE299YgE1evbF4BXciP/uTQ/phvr+qI5+HJRsZV4arK//DSHescVC+8XD
 X8tWvSTL54j29jvR245KT3thw/aJ0dqHAXwLeuaLtB7IsOvCbhQpkL/tVsLuscF3gqnb
 zpKg==
X-Gm-Message-State: AOJu0YzoZooC88TAFLq0RUFLwg8LoQQnPm9+HcqFcVMXDArN4dTZUW/W
 FaX6tQg4s977dWTaZIHi5eU9Ug==
X-Google-Smtp-Source: AGHT+IGnUaoJ14140of/teVzgr5iy1MVAPb5b3vhT1bQpkqzccjQ4N3vgu9nBujQVmFkvJBUTyJ9lA==
X-Received: by 2002:a05:600c:331f:b0:40c:2c60:dc3d with SMTP id
 q31-20020a05600c331f00b0040c2c60dc3dmr1933541wmp.308.1702466677906; 
 Wed, 13 Dec 2023 03:24:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-246-113.cust.dsl.teletu.it. [93.150.246.113])
 by smtp.gmail.com with ESMTPSA id
 fj5-20020a05600c0c8500b0040b2976eb02sm20294090wmb.10.2023.12.13.03.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 03:24:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [linux-next:master] drm/panel: synaptics-r63353: adjust the includes
Date: Wed, 13 Dec 2023 12:24:32 +0100
Message-ID: <20231213112432.2002832-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Cc: neil.armstrong@linaro.org, michael@amarulasolutions.com,
 tzimmermann@suse.de, sam@ravnborg.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 dario.binacchi@amarulasolutions.com, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adjust the includes to explicitly include the correct headers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 3f61fcdc550b..169c629746c7 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -9,10 +9,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/media-bus-format.h>
 
 #include <linux/gpio/consumer.h>
-- 
2.43.0

