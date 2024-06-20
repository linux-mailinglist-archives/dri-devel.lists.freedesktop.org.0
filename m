Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04622910A8A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C09810EAA7;
	Thu, 20 Jun 2024 15:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KwUviox+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f99.google.com (mail-ej1-f99.google.com
 [209.85.218.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ACF10EAA3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:11 +0000 (UTC)
Received: by mail-ej1-f99.google.com with SMTP id
 a640c23a62f3a-a6f85f82ffeso127657466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898430; x=1719503230;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=boqszy1jK4/uc5AQ3R0CPUIduydtyOsEKWamiLMHkq4=;
 b=KwUviox+ScMhjBVAb8Xhy772ERdOWd3cn6ZE+Fw/NPpxhbSvCAfcPcKWs/UEBHvZJy
 FJau69zpRJRqNHGFyyMKtOrZwGDzzlfxc/EN3ZyqjEuoUzgpwIX0jgBbfta+Nn1va39K
 PSEky6/G6dlc2f5YIbW+x9ZfvnxDCSeNaYK4kBzaFwgRM4IMajpTJeIpl+k+Z8R/0YYH
 BgKRCD9n+cN5uRfL3ZX3HvvARbynuyx/yeLM49cBs61gc/VCttQGPP+Enw9k8cby6mbd
 6l6CfmYU2y4I8YQt3GXpmq9P/HsyzgwIMG1IWxif9fMFoOAvo7k9Uk7Bxi4NDtvAXip4
 /6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898430; x=1719503230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boqszy1jK4/uc5AQ3R0CPUIduydtyOsEKWamiLMHkq4=;
 b=AtyQMB3o57AaK2hKHrYFXMHOjnz7G9xiYvTBIrQ4aDJkh6VVzywSXAuTAQF1Aix2/h
 +IinkZbO0PfoFDrSPtt6CkN/9Z4mbgg5v8zSg8IdZmmT0Kp3H8ivyl8k4WsRd4Vkvxax
 mfziu0YGkxJ9oom+x2Wt/EUTNoldIRb3yPwAts9y3LoVg+WFWwo4vClxaHX7ObC+C1kj
 R3YZGuVVjaklTqIbx/zPEHzNVraJCRAyvcBpnIYqPm2kELo1KitAUMvzHiObWp5WNaJt
 mAOn73VbMMzxWIAEU2m3YwEjssThJc/i9+Is/xO8bBhsaQk3x0QNVY9c6o0L3pscuTbD
 6QEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV61Opb5M5GdJUGp0Dv/CJu8wKDa19lnE4Kb5o2jIp5DrODXEJSGThRxIicr5rWgyHH/yZZMx60XxxBakVM+1Oaq4Cf8FMBHhOfOnjQu7xY
X-Gm-Message-State: AOJu0YxpJBWbO3kvfn8tx/kEnq+rrMkQwq2f7/QadQzPYqB4ej0J794v
 Kxv7bVYkf/2bxqKLr/bNfBzN/o/Mx+OmslcgP2+rrvKZm0hIcZBk9TVR/ZAStxlmjzQmF+BMLUE
 mg888pVFl1rvSXvagVq135ChOJ5FPPv7H
X-Google-Smtp-Source: AGHT+IFi8TmyBBqmaUaz3fwPWcmAnLHlPiyqLcQtBUnx82Hsv330urEQGSAfesGnrx9spzgBfxBFPbNYtw3C
X-Received: by 2002:a17:906:1611:b0:a6f:5318:b8f0 with SMTP id
 a640c23a62f3a-a6fab64598fmr322304466b.37.1718898412998; 
 Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56e4e692sm27361766b.134.2024.06.20.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 20/31] drm/vc4: hvs: Remove ABORT_ON_EMPTY flag
Date: Thu, 20 Jun 2024 16:46:21 +0100
Message-Id: <20240620154632.4125308-21-dave.stevenson@raspberrypi.com>
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

From: Dom Cobley <popcornmix@gmail.com>

ABORT_ON_EMPTY chooses whether the HVS abandons the current frame
when it experiences an underflow, or attempts to continue.

In theory the frame should be black from the point of underflow,
compared to a shift of sebsequent pixels to the left.

Unfortunately it seems to put the HVS is a bad state where it is not
possible to recover simply. This typically requires a reboot
following the 'flip done timed out message'.

Discussion with Broadcom has suggested we don't use this flag.
All their testing is done with it disabled.

Additionally setting BLANK_INSERT_EN causes the HDMI to output
blank pixels on an underflow which avoids it losing sync.

After this change a 'flip done timed out' due to sdram bandwidth
starvation or too low a clock is recoverable once the situation improves.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 drivers/gpu/drm/vc4/vc4_regs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 372ac2140001..6b41153cc0f7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1597,6 +1597,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 		   VC4_HD_VID_CTL_CLRRGB |
 		   VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
 		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET |
+		   VC4_HD_VID_CTL_BLANK_INSERT_EN |
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
 		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 8ac9515554f8..c55dec383929 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -777,6 +777,7 @@ enum {
 # define VC4_HD_VID_CTL_CLRSYNC			BIT(24)
 # define VC4_HD_VID_CTL_CLRRGB			BIT(23)
 # define VC4_HD_VID_CTL_BLANKPIX		BIT(18)
+# define VC4_HD_VID_CTL_BLANK_INSERT_EN		BIT(16)
 
 # define VC4_HD_CSC_CTL_ORDER_MASK		VC4_MASK(7, 5)
 # define VC4_HD_CSC_CTL_ORDER_SHIFT		5
-- 
2.34.1

