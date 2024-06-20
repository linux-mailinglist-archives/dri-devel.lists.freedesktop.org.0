Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF34910A8B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5950410EABA;
	Thu, 20 Jun 2024 15:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jcy1BjGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129B710E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:18 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-421b9068274so10564175e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898437; x=1719503237;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bErI02gK+s2eDSB3k7LB6A4Hb+chGiNlbihDYv0xDo=;
 b=jcy1BjGqET2TFRNsgKQHLtApCnI+ryh/Spz/tZtXEkXqDtHxTdPxuF6AeDf2dLseCa
 8Wfr3tcWX+Ysu/RjwfChcwnQq557Bm+pq0MJVhS9kCMQ16WOfwF2z2EFo1WZa89yYAzb
 kEjscVTt3qMOVGwwA4Y2sKbcGIYk0CSLvdhAmZlwpsYhLDePCmlnJFzSZDfLeOEtslWH
 W29WoSA9jizVFU4E+5t+d7SdZzfCeIqUKdWJrFlDEDCZxmO/ub5Vx5IMuaxP4w3q5co2
 o24M72fRkfeCU9rznbvCUh0sHsUQcyrwXN9f9hXRUbJVPQX7NcvQxeaY4xX5gL/mATRE
 HcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898437; x=1719503237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bErI02gK+s2eDSB3k7LB6A4Hb+chGiNlbihDYv0xDo=;
 b=u2cQSiJNHVh4p0lqTYMNmDr6cdmHeZffEre2T6ltx4wZWr1cRwuMeVETVyzFDBzdO0
 0GltoVxNWTre0Ob8fv0YcJVzRim+/kUChrsXe7ftf7l91svM2gdrUEdx6ghEZ+TGP2t9
 S/ebiXoaqsCS1cU1kr+vDybvNgB5d0vandkYvxRIw4qUph4FJjkqRhVcpZnF8NONmGt/
 lV+0OWhxJsx02NTyLSi0dw5t6wgy5hn/L9AYDtL8MCDsKgj3E563aUxiiNeWA/9kJsu4
 XAFTiqCGPrD3mQdaApkOzIClwawifFNx6TXFPfScwX/SSPVnanUjN7ZXwxqqkgvU/T+a
 xN+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmiY6elvdvs36ZaUv+NHWTgVprQ7rlUR8IHESMsBrykiF8PE+zHrKqlRzR9qpSdGfC9Yq5rJods6QKRZrUTNXJiqyRyntKFeSL7c5aeK2Y
X-Gm-Message-State: AOJu0YxtF8dO2UB2bR7uCsCEnLUzcIzNKIv0Sv0KgYrkDqmQHQ1PmN9J
 ER0m2pjIoIfmQyPkmN4Ry45PSrTlNuZQWRI45R9HUf/gN6pgfGGqW0g2kT3X5cLsPAUcWCjzS7m
 +/vf4H/n/GdgeDQIKsnHmweH+NNwOXNcu
X-Google-Smtp-Source: AGHT+IHgR4TaLYbG7TmcLKGF0GEh0rPkyPp2/felr0/e8C/P7RMarnSQJkoBZYgIoYuyU+MKK1WluzRSnBUp
X-Received: by 2002:a05:600c:33a9:b0:41b:fc3a:f1ef with SMTP id
 5b1f17b1804b1-4247529df1fmr46853665e9.33.1718898437461; 
 Thu, 20 Jun 2024 08:47:17 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247ea98777sm2037735e9.36.2024.06.20.08.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:17 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 31/31] drm/vc4: Enable SCALER_CONTROL early in HVS init
Date: Thu, 20 Jun 2024 16:46:32 +0100
Message-Id: <20240620154632.4125308-32-dave.stevenson@raspberrypi.com>
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

From: Tim Gover <tim.gover@raspberrypi.com>

Always enable SCALER_CONTROL before attempting other HVS
operations. It's safe to write to some parts of the HVS but
in general it's dangerous to do this because it can cause bus
lockups.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index fc147aff53c3..be2173f6c58e 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -860,6 +860,10 @@ static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 	struct vc4_dev *vc4 = hvs->vc4;
 	u32 dispctrl, reg;
 
+	dispctrl = HVS_READ(SCALER_DISPCTRL);
+	dispctrl |= SCALER_DISPCTRL_ENABLE;
+	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
+
 	reg = HVS_READ(SCALER_DISPECTRL);
 	reg &= ~SCALER_DISPECTRL_DSP2_MUX_MASK;
 	HVS_WRITE(SCALER_DISPECTRL,
@@ -881,8 +885,6 @@ static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 		  reg | VC4_SET_FIELD(3, SCALER_DISPDITHER_DSP5_MUX));
 
 	dispctrl = HVS_READ(SCALER_DISPCTRL);
-
-	dispctrl |= SCALER_DISPCTRL_ENABLE;
 	dispctrl |= SCALER_DISPCTRL_DISPEIRQ(0) |
 		    SCALER_DISPCTRL_DISPEIRQ(1) |
 		    SCALER_DISPCTRL_DISPEIRQ(2);
@@ -1078,6 +1080,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	else
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
 
+	ret = vc4_hvs_hw_init(hvs);
+	if (ret)
+		return ret;
+
 	/* Upload filter kernels.  We only have the one for now, so we
 	 * keep it around for the lifetime of the driver.
 	 */
@@ -1087,10 +1093,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = vc4_hvs_hw_init(hvs);
-	if (ret)
-		return ret;
-
 	ret = vc4_hvs_cob_init(hvs);
 	if (ret)
 		return ret;
-- 
2.34.1

