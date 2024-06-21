Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7291296D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7610F1FC;
	Fri, 21 Jun 2024 15:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VzCn+dsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C91110F1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:48 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-4217a96de38so15997675e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983307; x=1719588107;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bErI02gK+s2eDSB3k7LB6A4Hb+chGiNlbihDYv0xDo=;
 b=VzCn+dsXRGlLmNad4LZS1DYqb4zrmteuwhws/urz+tSmVF2jGfvoQdt/D3PN0/VkWU
 +vkCc8aHFpYNiQkx/lakUHv+pl4w8G4ql3NYkFql9H2SJlzsEquP7aSwGUONQplQEc1N
 FT1BdecDzmVmcL+8WfysQltvSYZe2WYZkOJlCwdaaQE2Lou4RWA2BE53Q565zxkMqFtq
 s6PbikSRYoEbt0NVbWxcFkHflOw6Zd9El87msrqnVHF3XWRY347jsAtfdOFk1lnpwzqO
 3jbsfXzsaRLpTD1Crf4OAjZJpkFiQ9u8obaJ11AYNFhPgceM83iIOg+iaJlY7t1E23rC
 aYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983307; x=1719588107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bErI02gK+s2eDSB3k7LB6A4Hb+chGiNlbihDYv0xDo=;
 b=Y8NLa6UQsyoN+vc9fSG0qj4Cf4caQcakPIi8kSTFuZNNxLbpyoCO6v5Qpp9jARJdKw
 JmHHXBvvxIDBjjkZXUQQKWk9pw0TcYBBlp1LZPG0AY9W0eBACPpbfXk6lrwsAXiYbdkL
 StH1EgSoCWqSQHnvIvMZFtAWVAfo8Drgum6rr6herS36btw9hHbcW7wGDX8CUBthq6cF
 pOyYhvSbK/lONjLnJpyEZizcObpH9NNuRTrm3PBjEaYjZlHbaPyeh08RtFXNZHjwAYxS
 9ex8aY9PBVWbO0BLFFmmCQNwt84nZvU3OUCEDeatol9A6vhL32hiSsBdDddNwm3CvAyb
 Mx1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCYVeKrFXG0rr7GIKkODPSRcakMmxOAEUKdvMSBR/ohGPO9GSUnZ37f5xiji2RC87Rlarj2q8J2pgtAF4tCrg9po/3xNyBJN8yTRwBSB8Z
X-Gm-Message-State: AOJu0YyeTslEcY+O9VgiFu/+Qyzs2S2SO3MUkE6bJ9Pb5Rf8o75bpY/E
 4OVFa1GsTWklLfTYDsY0ymLb7DzJum+cdHfSJQsMZUrxiBqMRy/UwfvVGdXfWhLbrk0wpu17UqI
 XoEgAjVusjb4GhHE9FBuHVR3wGQchAbkq
X-Google-Smtp-Source: AGHT+IFtzaKALSPNvvw8n7em2eKZ3EFmil93ZAsHDhsnRaF6dqhkRjvbC4Hvi9gGd3rCpp/M14bsnC1wtTm9
X-Received: by 2002:a05:600c:2252:b0:424:798a:f7f2 with SMTP id
 5b1f17b1804b1-424798afd71mr55012315e9.3.1718983307092; 
 Fri, 21 Jun 2024 08:21:47 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4248179cb9asm1153165e9.14.2024.06.21.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:47 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 30/31] drm/vc4: hvs: Enable SCALER_CONTROL early in HVS init
Date: Fri, 21 Jun 2024 16:20:54 +0100
Message-Id: <20240621152055.4180873-31-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

