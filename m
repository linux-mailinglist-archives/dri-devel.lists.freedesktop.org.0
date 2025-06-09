Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B5AD278A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 22:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A0D10E17E;
	Mon,  9 Jun 2025 20:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="mYUCtOcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471E210E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 20:28:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6071ac9dc3eso7179056a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1749500888; x=1750105688;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=;
 b=mYUCtOcKT5H6idJWJ/leOXg1R9JfmApYj3CxBu9PmQyHxRpeLqdf17jqFJy6mQjf78
 5xY60XrczNMldLls4JAsRzRcTYKrCefloInwDO3zGGtR5ANFXjWmb+8SwvIDiITdpAho
 0QJmPMqHal6nG4EWPxZVVtuS+x0a0kLkb2aOqKaVD/+AAOlj53GEPD6g3YZGdgCQo5XV
 1PqDyULB7BigyLZ59VPYXm7icyATbCEhe4yf6SDPwkh6iSpNpoLxLRHJq14ecOtLVlsz
 mpFQbDqmvIBwcGVqKkoCYuopKeBdht1EaI9R4N2gJA6zyPeWmEV96tgQ6DB3W/HZqlsM
 Y0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749500888; x=1750105688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=;
 b=mshK2gGsKhXDnmulFrowCn+FWTq4+stC6C+qf7scGOdeeTHkxjyx1SFjI7MAu486I7
 /6hoB/nmVa7ZFHqBDpreZ6J5/oLQ09nQuZJQ8oaRCabMhDDprwSpZP6X7k0GIy96Mo22
 5kdVgMoVSnrfLDjXJM79/3FsbK/iZhZ6FFd/QXXA7REG0cOo+BRe1f77l0yjtEW2mx7b
 Juy2nyD1xQRDx6SwfC30xMaY3GvVDs5Q5AwmYgHNTSf+dOeVGxKFzxbVDcOQTTZP1zjh
 BqeKvAkzsDhfImraIrp+8BrUXIulgqDxo5wjKkt+yGvAgMuCodl2ZnJwrFOvsNW/f7du
 2S8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZcCgExFyhTYO28yBdWlKW6XJv4AlAKTZM6hC1vOAuLF1qkrKUI6lr8CpHpOrJOSzNrIIzs0R1O7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz76UdaFYLUb/99QTd7N5L4GidmmCSI6d7xRt3s0jL4Io3OsySv
 xymVVXmYm/jx4I9r2HGQbpNSlucZ8nb4pCNIcQB/WcIB9zbW7B6Fl8+I
X-Gm-Gg: ASbGncuIZVqnS0UJeiWiUvMtE9+sfuXWiUXaR0RV84qI4ic6QmZOp9GyXZn19bktQGj
 Ko18qc9wlfiiNBpxXU6wSOg3fpbAN9MnxfbqYGOIqXxS14mC0HUJjx+nnudTiKRdbWw4rgCRgAe
 rrhyumA1zm3CFQKJY8x1Jy2LLuR1B7mar83chhTOfHh/RJcOIMJUAFy3Pc4xN7yUm6QEq5Xm0Ag
 CtM1+Xki3zu2wYDv5nonyRIzS/Ufwp7iCvJxNVcUUUI2zXVyl7+cXWttDpGU8N3isrD6SsjQ1D+
 OGFBnMeaa/bXloXxC0nw0NfUMVAFdwpuVzAIWRhhECaGQvJWI7OluqQjBkaqWCO1+WgC1ZTx2XD
 RCfgOA8s+vSsmOp6q8FtaH8MNQuFCsmA62fApTh0eTnQDu8jh3DRotsvaCgwSUJLD5S563fOO5l
 O3dys2v1VMTIF8cO+EERdB4mLZQM3mFgU=
X-Google-Smtp-Source: AGHT+IFi7MkYch5ZiIQCrja1K+1GnPJzZYyvzsdQM08R79bAjY5eVBMgahZGzkClFbVhMfH45r3M0Q==
X-Received: by 2002:a05:6402:2693:b0:607:f55d:7c56 with SMTP id
 4fb4d7f45d1cf-607f55d7cedmr4103975a12.25.1749500887401; 
 Mon, 09 Jun 2025 13:28:07 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a839-7f00-f22f-74ff-fe21-0725.310.pool.telefonica.de.
 [2a02:3100:a839:7f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-607783e654asm5021219a12.69.2025.06.09.13.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 13:28:05 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
Date: Mon,  9 Jun 2025 22:27:51 +0200
Message-ID: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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

Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
frequency types") attempts to resolve video playback using 59.94Hz.
 using YUV420 by changing the clock calculation to use
Hz instead of kHz (thus yielding more precision).

The basic calculation itself is correct, however the comparisions in
meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
With the mentioend commit we convert this to Hz. Then meson_vclk
tries to find a matchig "params" entry (as the clock setup code
currently only supports specific frequencies) by taking the venc_freq
from the params and calculating the "alt frequency" (used for the
59.94Hz modes) from it, which is:
  (594000000Hz * 1000) / 1001 = 593406593Hz

Similar calculation is applied to the phy_freq (TMDS clock), which is 10
times the pixel clock.

Implement a new meson_vclk_freqs_are_matching_param() function whose
purpose is to compare if the requested and calculated frequencies. They
may not match exactly (for the reasons mentioned above). Allow the
clocks to deviate slightly to make the 59.94Hz modes again.

Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for frequency types")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Special thanks to Christian for testing (off-list) and managing so I
can do better testing myself in the future!

This is meant to be applied on top of "drm/meson: use vclk_freq instead
of pixel_freq in debug print" from [0]


[0] https://lore.kernel.org/dri-devel/20250606221031.3419353-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_vclk.c | 55 ++++++++++++++++++------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index c4123bb958e4..dfe0c28a0f05 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -110,10 +110,7 @@
 #define HDMI_PLL_LOCK		BIT(31)
 #define HDMI_PLL_LOCK_G12A	(3 << 30)
 
-#define PIXEL_FREQ_1000_1001(_freq)	\
-	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
-#define PHY_FREQ_1000_1001(_freq)	\
-	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
+#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
 
 /* VID PLL Dividers */
 enum {
@@ -772,6 +769,36 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		  pll_freq);
 }
 
+static bool meson_vclk_freqs_are_matching_param(unsigned int idx,
+						unsigned long long phy_freq,
+						unsigned long long vclk_freq)
+{
+	DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
+			 idx, params[idx].vclk_freq,
+			 FREQ_1000_1001(params[idx].vclk_freq));
+	DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
+			 idx, params[idx].phy_freq,
+			 FREQ_1000_1001(params[idx].phy_freq));
+
+	/* Match strict frequency */
+	if (phy_freq == params[idx].phy_freq &&
+	    vclk_freq == params[idx].vclk_freq)
+		return true;
+
+	/* Match 1000/1001 variant: vclk deviation has to be less than 1kHz
+	 * (drm EDID is defined in 1kHz steps, so everything smaller must be
+	 * rounding error) and the PHY freq deviation has to be less than
+	 * 10kHz (as the TMDS clock is 10 times the pixel clock, so anything
+	 * smaller must be rounding error as well).
+	 */
+	if (abs(vclk_freq - FREQ_1000_1001(params[idx].vclk_freq)) < 1000 &&
+	    abs(phy_freq - FREQ_1000_1001(params[idx].phy_freq)) < 10000)
+		return true;
+
+	/* no match */
+	return false;
+}
+
 enum drm_mode_status
 meson_vclk_vic_supported_freq(struct meson_drm *priv,
 			      unsigned long long phy_freq,
@@ -790,19 +817,7 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].vclk_freq,
-				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
-		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].phy_freq,
-				 PHY_FREQ_1000_1001(params[i].phy_freq));
-		/* Match strict frequency */
-		if (phy_freq == params[i].phy_freq &&
-		    vclk_freq == params[i].vclk_freq)
-			return MODE_OK;
-		/* Match 1000/1001 variant */
-		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
-		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
+		if (meson_vclk_freqs_are_matching_param(i, phy_freq, vclk_freq))
 			return MODE_OK;
 	}
 
@@ -1075,10 +1090,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 	}
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
-		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
-		    (vclk_freq == params[freq].vclk_freq ||
-		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
+		if (meson_vclk_freqs_are_matching_param(freq, phy_freq,
+							vclk_freq)) {
 			if (vclk_freq != params[freq].vclk_freq)
 				vic_alternate_clock = true;
 			else
-- 
2.49.0

