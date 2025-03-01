Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B48A4ABD2
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F3B10E25A;
	Sat,  1 Mar 2025 14:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a8aeFZ00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18B710E25A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:27:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2239c066347so1368565ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839240; x=1741444040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
 b=a8aeFZ00bzZ/3bsZudLofSFD9E4hxUfofcgKXbVCDKaP6U9fWTfB6OUTfj4W31pihx
 /Z6IFVLOXPCHmVeVJlJRoKgBdm4uO4jmXAanTYqODyn3mv/YOZ2OMfAlPDlGvG5MCyTh
 PMVmTwescr9HfWg+U7dAB8fcfskvHTqpl8D96Uz25e0SsmWxym3K8SaBkMgHKcEdjtJf
 h8iJYRUle1SgWuUGMpPUlI7ojcgo59bCrSvZjkf2oX4AaZn7++rlrkqgfMDiw392B8i0
 qrnJ6Z7iD7j1xN04cribhE9wjTsv7L3EDJwv2+ZNStwh75eb2zC96m74ee4nDyMu/w7W
 gE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839240; x=1741444040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
 b=ihis0pn7WTg9gBItImLSc6msaWcdL8kViAIKCrtsxO401O9CaqbbvIX4siAEhwaWYi
 ySV0XVzipr+sUnQ/DsCl0HAGRmaCMV5lWukuX0Wcq0gJ9CkNDHDHNzuh1Ssr1BlwAs8a
 MSwVjN/gL0uTHMBrze4dvIKJlEa4H/tTMGZfOJ1F13EB5qbGSPIJk0gZCcNHOzS6U0bG
 BOKSQUJbhvYD1JdnizngVKq/G6ez6+3U//vQqqmmKhojiO0QDbmcWRgcqDVQQLUtjppu
 l6WA/9Au0FcXGNJZuS7r8Xgh7yjcqB6UQtwif4rh22Epg2DfPxK8al77Y7k7Wr19RgwG
 OfOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/chvlOv87ttaMH23+6al8TFjoq93ZxKPD0DpLXI+C0LK8tZZmYy2uHLs1v0yksCJn8dLUuoj+5ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsHSNidOBJ3oYl9KkOw4eGTN2WJZkJvrHv1NgRkOXIM3Mg7V12
 T76hF2kpEQQu2hMCqouhbFc1AtRK7u+cNbrHyG2SOSa4/qzpNlvk
X-Gm-Gg: ASbGnctH7CJcprtGyZfh8HxJpDKhQ73t6bk6yjc6BbLOrToi9r/wYVpDkMGR1B5GPe6
 JHK7heBi7uf4lPBVxVvV7pVClWh3se9nrnTwCmj3ZqDt0X1LebCUUiN9o4RvVG1rkKbeNSXLH9n
 pzDE5D1Tr6bLRc5l1Fo0ui3PjfQWmVwkTBBrb3rFLDV6ftAk6t/LsyCX8Iv2C5hhZ/lYySTit1r
 Usp43KpxKCbeHD2Ye4IUhaLJJI+Oyu0PD/WzTbB4txIStDLyKmBrSONVOwYnq0dpOhfWb4cv0qE
 zwYy7eagAp2hQkSnrwIuDjjG41Uyw1trGOij80I7Y/aWwXouoNiH/sDNkYDptiElvT7hx/8RorE
 =
X-Google-Smtp-Source: AGHT+IFWKqiV0JEURaPP9WsTXinyvBYz5p+Da6Z0sy2B13n/BlJ3FGZeHRzY7pPlUCpj+eVU13KkqQ==
X-Received: by 2002:a17:902:d4c6:b0:215:7446:2151 with SMTP id
 d9443c01a7336-22368f61abbmr99234975ad.4.1740839240264; 
 Sat, 01 Mar 2025 06:27:20 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:18 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 12/18] drm/bridge: dw-hdmi: Replace open-coded parity
 calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:03 +0800
Message-Id: <20250301142409.2513835-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..833e65f33483 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -4,6 +4,7 @@
  *
  * Written and tested against the Designware HDMI Tx found in iMX6.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -171,12 +172,7 @@ static void dw_hdmi_reformat_iec958(struct snd_dw_hdmi *dw,
 
 static u32 parity(u32 sample)
 {
-	sample ^= sample >> 16;
-	sample ^= sample >> 8;
-	sample ^= sample >> 4;
-	sample ^= sample >> 2;
-	sample ^= sample >> 1;
-	return (sample & 1) << 27;
+	return parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

