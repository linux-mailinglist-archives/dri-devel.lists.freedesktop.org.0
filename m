Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A7910A63
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7AE10EA9E;
	Thu, 20 Jun 2024 15:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jvWIW/+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBFE10EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:44 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6f11a2d18aso118726166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898402; x=1719503202;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTZUqjSk/X3bmEMr9JFBTlenY3fg9WCYw7DD7LJyoXY=;
 b=jvWIW/+FTn45qhZv8z8+UfGwfRxYJnK11uQBmlE74L7S72bmpz8aVY8f+C5mQ9iVO+
 VRtpfl4q8CM2PJKtcW/MdlWKeqDKq/nEFPV4Onig/pqZWwMsHRop34tyX1OVjy+Yj80l
 iDbYs3A8wmMOLJGSqP9VEq7pQybyM9YeKWgdgxEgAMXfWRhtuB7WIdJAoNGNhhkW+sT7
 OF/Ti7v5bUQQueZ1eoYoSnB9WyAW4ZIAoVvcZvpn1DSJIc11Ua4u2X9Bfv5Q5cAIBDpZ
 DULxN+1oXrWyKwzp/05uGgHdmuLpKH8D5l08Ovp4Ea/TrPL1IokH3+EsdvURithz3wNy
 SfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898402; x=1719503202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTZUqjSk/X3bmEMr9JFBTlenY3fg9WCYw7DD7LJyoXY=;
 b=IKg75Hj/cH92nNDE42QMcTiEQTUXLuNOyexJiYuuaataL4u0Wsma8YJsy+MnIQgPc0
 hIkBZyYFAdvD4yjpEBI3DDHkCS2Zv5At+7POPpP3xUSr54yr4Eo5PFHWJEpQrab+dSh0
 edNPBnvTzB9rHuFvFThREoQHuy7RPcVhsF8s0rHGab9ADKGa6kBleqakRnv8nRK88yIx
 xZrrf/5YMbMxREvGFikheP+Nxa2PaNdZ/LYWfCgofQAm16q3LH5z6fL/b2F94DnbInfk
 ibrSk7rD58UQhpnR38B6ZUafEcVGMsVhSm6IG2CYU8wZyw/MZbKc6bbn6iPEdkSQt9DA
 fB2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIvnAUd0eWjwGhCYncBE5gY5P5OuOc2x68waIwPgBpcmORKZXSWDvjT+fjR+sKFbPLZXIXwSHM6fkNUIgErJmZi0lHNuTRHnAm8Qb4QD3X
X-Gm-Message-State: AOJu0Yyf/xOb8IUYWclX0zrrg6zrY0B9Q/tUFVJZdGecDHAT8pE5NU9V
 Pl35qRhjoaRqJVD0kLux4AoR+lCFQnMxFPTj7gvojV+inUaLQCFq8QC8hQArdvc5ydCuOyOmQ3r
 gum5XDIs5muJd4h5lpuB7QkjkFbXiBAjW
X-Google-Smtp-Source: AGHT+IEJ8+wSIXeNlzEsUEU53e5fi/Kjf3EBMnWXbez2tntP+060uiVuj9F4M6sPbCYDrgh+mx3xpf4H+9Gg
X-Received: by 2002:a17:907:c283:b0:a6f:57f1:cebb with SMTP id
 a640c23a62f3a-a6fab772482mr314550666b.50.1718898402556; 
 Thu, 20 Jun 2024 08:46:42 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f7ea1ec0esm20448866b.92.2024.06.20.08.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:42 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 07/31] drm/vc4: Limit max_bpc to 8 on Pi0-3
Date: Thu, 20 Jun 2024 16:46:08 +0100
Message-Id: <20240620154632.4125308-8-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi 0-3 have no deep colour support and only 24bpp output,
so max_bpc should remain as 8, and no HDR metadata property
should be registered.

Fixes: ba8c0faebbb0 ("drm/vc4: hdmi: Enable 10/12 bpc output")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 04d32dc3e98c..afeeff660fa5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -630,6 +630,11 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	if (vc4_hdmi->variant->supports_hdr)
+		drm_connector_attach_max_bpc_property(connector, 8, 12);
+	else
+		drm_connector_attach_max_bpc_property(connector, 8, 8);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
-- 
2.34.1

