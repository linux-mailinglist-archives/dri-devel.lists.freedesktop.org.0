Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DECAA26D
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 08:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4789110E071;
	Sat,  6 Dec 2025 07:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVxXsEAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F3810E071
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 07:27:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso23950415e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 23:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765006044; x=1765610844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jGhpR6O2zFoAKNfdFNkxlU6+z+TxXnT6EOz7gMMWwCo=;
 b=XVxXsEAtu8eHUEELfwIsQ6PRH6HmM+PhNOOVZntGOmxtcj/hyOBa0AgXOVZpJnDzKO
 oFzTsHuO1kTZhooP3M4QHWJiCt65+ln4j8mVKpsf95wPvmTARKqCXCacVGnDTfFFme49
 V9bibiZPvDB1QirLZ2qtcWzKd0J0wHmU8VROV9NzrCepIJOC2OB0q4qUdnqaLLJduDP9
 9BpeUezRc46kmzVqQZTR1syOjZTqeOL694rJy/CDvfQgIQjC6yQYSaLTgo+fzd1Pdcq1
 iSzZGnp7R10OHcA9VlusWU6+fjgs18oaH6o/6j6+IYc0CLWV8p/IVzl2fdRzmThzrs18
 JDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765006044; x=1765610844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGhpR6O2zFoAKNfdFNkxlU6+z+TxXnT6EOz7gMMWwCo=;
 b=Dmp/wJkkHYPnBK5Z9JA4Bee8hrSVh57H4kpzx1C+vz2gXyR4Vf+6ScTnkqwYs9aEx1
 JjcHovXG4znKu2FICUAYYMCuFuiY50rUf8Ftx3lDG7yIFUHybbd2xu2HHEdLBdhSQW03
 oAr1SoITYA3L1MxxbcN84AFdZSXtHEmhNVgXdbgvqDfZ276jhR2zBPzlPVK8w+WB6pd7
 Puc5VSFCHXK9pqolmPpBcY/VUO6t2ypC5jkR6IJeWLnL9Odqo+L1XKYnZLxAqZjQNZUG
 mBsEOobuIBZfmEedY9v1JtvAkzmQ+0bNqnWJ5vdEC+9z/nVtKM0j5V+Pxv1jj8KrCamF
 uCvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/LCIlmCikNSHeJySQQXy+T06V3jc2bQqjffYTm661vD93rhwbH03+SgS1l4pRr758OCuyvjPtMWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGuw3l/knOko/kyrjucYLwbUHrmoUjCA6/ZJWeehs2EM2PmXQy
 GHzvbR3ZiwRKCQWOdrpG+SIADz0FdCMEr7l+/3MYihuHZJxbtuZkahSK
X-Gm-Gg: ASbGncs9Qd/vnxbZb/s+kqCgAYJhxGnQaAbihLRlJCgRQXlguUkW3uZyk5BmOpK1Whb
 a4XXvDlSlS//UKOtG9ATFq8Cm2fOFMug25UbEv76C4x6VMjgz8yyOsQEbHG4dMsrd23XrcRjlxU
 bJDQKhjvoohuk6NptIUkxCwd/MhoK2OCk5JILvWcQVQenNl3Q27NVmMiSPz5K+j66sK8oq0dcyZ
 ShsT/A5vjsnVbf5y2AOeOlTDoOzTzbE8+fQd4ds8oRce9QfkZQjSMJ2ej9lLQFVf6E4obz2YV+z
 x7RaaUOk6xXlNpUGOQZw/MUMFtk6thmsy78dtFxZS4FJE2s9B5AIDkLBhtTlnUZV/1A9IdNZ+5V
 aDQ4fcQPaImpzY4kM87fCOaxvrGyC/Js/FebC1/SNVnOfhtH4B5j7yQf5DQe/Tz9uz5hjpGQ4Bf
 yGfL+XXgjf8MkTeIY=
X-Google-Smtp-Source: AGHT+IFcSNJRPdN47xMM+2pb+RDdYixNneiclPN+q2YkRdM3jQKvDsax8tHHHgxDmSsm5A3RLgX0YA==
X-Received: by 2002:a05:600c:3b07:b0:46e:32d4:46a1 with SMTP id
 5b1f17b1804b1-47939e24836mr16647585e9.22.1765006043520; 
 Fri, 05 Dec 2025 23:27:23 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b140cf4sm91054435e9.5.2025.12.05.23.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 23:27:23 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-hdmi-qp: fix multi-channel audio output
Date: Sat,  6 Dec 2025 07:27:18 +0000
Message-Id: <20251206072718.2039874-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jonas Karlman <jonas@kwiboo.se>

Channel Allocation (PB4) and Level Shift Information (PB5) are
configured with values from PB1 and PB2 due to the wrong offset
being used. This results in missing audio channels or incorrect
speaker placement when playing multi-channel audio.

Use the correct offset to fix multi-channel audio output.

Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

---
buffer is a pointer to u8 while data written to PKT_AUDI_CONTENTS
is u32, so buffer contains audio infoframe header (buffer[0:2]) +
checksum (buffer[3]) + payload byte 1-10 (buffer[4:13]), e.g.

regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1)
.. will write PB0-PB3 to AUDI_CONTENTS1

regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1)
.. will write PB1-PB4 to AUDI_CONTENTS2, but should be PB4-PB7

&buffer[4] will point to payload byte 4 not payload byte 1, due
to u8/u32 and not considering the size of header+checksum (3+1).
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index f3a13da488e6..7b8a69383dc4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -845,7 +845,7 @@ static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
 
 	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
 	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
-	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
+	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[7], 1);
 
 	/* Enable ACR, AUDI, AMD */
 	dw_hdmi_qp_mod(hdmi,
-- 
2.34.1

