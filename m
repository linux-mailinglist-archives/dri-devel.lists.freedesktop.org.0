Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEBB910A62
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACBA10EA9F;
	Thu, 20 Jun 2024 15:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Mlfd9y3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0CF10EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:44 +0000 (UTC)
Received: by mail-wm1-f97.google.com with SMTP id
 5b1f17b1804b1-42172ab4b60so10471295e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898403; x=1719503203;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECm2V+hxJKtqLdNkEv2V/2Phvz//i6mISPdB5opw4k8=;
 b=Mlfd9y3alYx6kSIFzqye7mFKMLfsEVVnlobJVt/hOCpmQZfJgvWH5YVOiwlQkEFBkd
 0SpeTkuMue5JxDL42ub+R1mnyY+L3+oE7CxW88gJvFE/n9JMVuS3kgphDbgF2TllIa1x
 aqsG2JcPvkUwMKFYzZ/bliXmPwsCZcVghGIUu0Bej7VbPweZZSjb3OXdIMwbiH0Wpx2o
 sxG49bmEZMATjJ5zEVJc9Yc6hCSN8JBl20NP0FD1oM4lNUrJq0dhavQuBD/sZNCkyCEN
 FzhPv3ueZJ6mk//bbKwGrwjooXhlFJLnwGnT/FEK+nxA5aBOWgV6mVeSItLRAFexY1b7
 UdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898403; x=1719503203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECm2V+hxJKtqLdNkEv2V/2Phvz//i6mISPdB5opw4k8=;
 b=q6p/jYAzi9NbH2981nRveLhaFzUTDRuUHKSPawNR0PfHnhH2NoASRtzhd+1zy/UZ0e
 unO6AWeJ1RTSaj7/LN7uXVcj8AZhCEW2EyttNJgsZjfnHw0hmgz07vNKhrk5s7ZQaHrI
 vD/Cd8C4L5EUlmXpy928ODfGRGw29qr/DpmOymXLof9HbcSQzpzxcUJCIpv0L0MPW7HA
 A7BEoNEZNZKukNKESkJa9taNZf7f0ZghPLLk48Osam/txwXUUuexuQi2QihgBtFRKvrD
 AxXtrKzWzttLXbnVY4AeuY1wm385F4rV3mjYw0VW+clSH5EfggPZrrZfS92BLQk1b8oK
 h73A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2do5RjTIY47dNVqxDJL24e5wMYyasJcSu9vhcXi0rq/GK0xowUs2lBargeZJqjkXXZPhYSVI5IDR3cq1ON1KNUNq/PJFeLbdNwvh7eMT7
X-Gm-Message-State: AOJu0YxKhWAXPps1pbJLwM0RIk1PVRwzwWdP+ACacRJ4a6iB2SnoiJvc
 fncaYYu+wqaByJSJzBUSA2wvnoyh41YUaBk3p7w1J+DSTD1ZbjbN7LSimA84UNRtiejARf93n9Z
 xgcRGTWWEB1MYFd+slr86tdo0KaoRv5/0
X-Google-Smtp-Source: AGHT+IHz0UJwbXIc7yNc5TRN2y6TISskI1j313MQWzl2AtepU2TgIogFKQjeZnToLOZ4bNdqrUg6ZvC60THF
X-Received: by 2002:a05:600c:4ba3:b0:424:6e5a:82ba with SMTP id
 5b1f17b1804b1-424751763a0mr43182345e9.15.1718898403100; 
 Thu, 20 Jun 2024 08:46:43 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d5df726sm3020155e9.25.2024.06.20.08.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:43 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 08/31] drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
Date: Thu, 20 Jun 2024 16:46:09 +0100
Message-Id: <20240620154632.4125308-9-dave.stevenson@raspberrypi.com>
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

Now we wait for write responses and have a burst
size of 4, we can set the fifo threshold much higher.

Set it to 28 (of the 32 entry size) to keep fifo
fuller and reduce chance of underflow.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index afeeff660fa5..21046056f63d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2046,6 +2046,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
@@ -2103,11 +2104,18 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	HDMI_WRITE(HDMI_MAI_THR,
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICHIGH) |
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICLOW) |
-		   VC4_SET_FIELD(0x06, VC4_HD_MAI_THR_DREQHIGH) |
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_DREQLOW));
+	if (vc4->is_vc5)
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
+	else
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
-- 
2.34.1

