Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF253810FCB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C98410E746;
	Wed, 13 Dec 2023 11:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E62010E746
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:24:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so26395945e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 03:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702466662; x=1703071462;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fckJlCTvThg4GMc4TI++ofVYKH1qSZws0GBdMNV6LR4=;
 b=BldKX1w1sw+wcciPi34L1A6Bd8SyoK7aiNpm7ZiEJcx97ALkMe4vnV5wTjtUhZQeQX
 JcVLMhfNbXUSZy07ufRd5CAdKar6F0f8NtmX3Jow5V7/BbqTlG6a0w1+e3/k91A9n0Oy
 JzszJXwrUYYFYLVuBP9XDCeJQXa5pb8gWli5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702466662; x=1703071462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fckJlCTvThg4GMc4TI++ofVYKH1qSZws0GBdMNV6LR4=;
 b=XwYlyL380EylQR3uKG8EBwcFZ42QAAZ9pVoOPLVvDnqkDSILJQn6gQTqr1Fd7bPDiu
 JO32OEzBlG27/+JFp94i1LVhBxZ4W7v5+mnPmaK+7FtH2GqS91TFE70KuEDAlmQmWZcW
 /VGz+sb9GShJSyuOX/J0rNgquGqeKHxU1ypwfxlzWbY1ageo20cdD42KpGsMGixjxixV
 541SKol32PYt5K7EZ3dkCAU+nJHEylGjIg9aYW+tclz/Yh5bW+rvbexqKhz/WgxMSlzo
 4Fgw18Bf0eCxUoDkUjWmp6TSGCz5zrfFdmWCNmAoh80cVaDlE85F4FPtQtCai46i1TEh
 r2dA==
X-Gm-Message-State: AOJu0YzwptXkEYRxprTw6ZdFkMTw2jgWQgkgpm3om/mvgv/uXWTAOQSG
 JEzxpTVOLDeT/48bSRXVdR71EQ==
X-Google-Smtp-Source: AGHT+IFo5FtTT55gXV2TFfpKTqbQSZEQmJDDSeppxR0QOmHa0fQBm9TR+nSf6LLBy9vpP3OZ6Y6AnQ==
X-Received: by 2002:a05:600c:520e:b0:40b:5e56:7b4a with SMTP id
 fb14-20020a05600c520e00b0040b5e567b4amr3729337wmb.147.1702466662385; 
 Wed, 13 Dec 2023 03:24:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-246-113.cust.dsl.teletu.it. [93.150.246.113])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a7bcd09000000b0040c26a459b4sm666570wmj.0.2023.12.13.03.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 03:24:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [linux-next:master] drm/panel: ilitek-ili9805: adjust the includes
Date: Wed, 13 Dec 2023 12:24:01 +0100
Message-ID: <20231213112401.2000837-1-dario.binacchi@amarulasolutions.com>
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
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
index 5054d1a2b2f5..1cbc25758bd2 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
@@ -7,10 +7,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
-- 
2.43.0

