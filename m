Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0CD216E0F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 15:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883C189F24;
	Tue,  7 Jul 2020 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC3089F24
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 13:50:14 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k6so45235896wrn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LY+HM3YYct/Z+qO4ymD0ac7QxRGx261eVt0ODxM+oYs=;
 b=R27gTMhzK0XO/6RSl9/ffYF6FzHgYljcDrF/qz8oRSEVazY7UiOocx9bJMLbOv2vyV
 62wqDkAJ3mITprygXiMy1otkpp2SCIf7e/PY+IAOoZXfOK+kpCkcpoISteaq7be/LYSE
 Qix4mMTBvqA0dNYTm/bDok57jR8jbx4yVNTEsHt4Ltwpc5LlTX8BNW7u7r4U1JkTt6C4
 wJGFba4VcBFu7iH8z4fbR+Hs+obr3H6wqCtGklYdatCCkuN2tiSi9QlxQiuGikIWzNdu
 D6iVECxJ+OdSrvcEFiQS5SXo+XZXBLDdATo7uXOveYzqNFRKB4g9RZiRiPaav3inQ1xy
 KMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LY+HM3YYct/Z+qO4ymD0ac7QxRGx261eVt0ODxM+oYs=;
 b=rdsrvbAg3jJy3xdhMroPXPekWdgZCnSLL990Yxkmhj31WqQsBI+ozzjWAzSfxXGKzh
 rhRzp4HV2jVFbBcHUrNk62Dn9vWQvvDzxtKuNWZSYcCoNlidObApSHaJhVsqtm18drQx
 2In6wdN0JXE0ZZeacz+OrRQMSL/jEO/wzlSFZaE/a+1p+SsU5qjZkocYE8PgdfZ2FvJ6
 DYt9mug13AXf8v1Zo5Eor+PkCCOKR2DEbYX4t5FFWVujEiILXzEaO0vVeaKAzU1/zWAk
 MEI5WjtYz1NWIS694lltrhurEwNmrPLMyLmGAj5yk1ICf2Eyf8viXPGx2UgYJmCpKKIK
 k34Q==
X-Gm-Message-State: AOAM533LPGkT4Ja0Ov8pZlrc3b/9VRnROpDh8cbEgbC7ivAdpwn+08Sd
 BjXX4Jp+w1Tk8oed2TQn326j7dnn53PQgQ==
X-Google-Smtp-Source: ABdhPJxE2HHRInDWkh2Q2PIxGGZ9LKPoxNjzyVRAOlV/OZira6waszUIOSnvrB0UXU1NjNoNkiJc6w==
X-Received: by 2002:adf:eec8:: with SMTP id a8mr54706539wrp.421.1594129812977; 
 Tue, 07 Jul 2020 06:50:12 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 65sm1354396wmd.20.2020.07.07.06.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 06:50:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/meson: overlay: fix build failure
Date: Tue,  7 Jul 2020 15:50:09 +0200
Message-Id: <20200707135009.32474-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The recent GCC compiler is very picky with the VD_H_START() and
AFBC_DEC_PIXEL_BGN_H() macros, triggering a runtime assert error as:

In function 'meson_overlay_setup_scaler_params',
    inlined from 'meson_overlay_atomic_update' at
drivers/gpu/drm/meson/meson_overlay.c:542:2:
./include/linux/compiler.h:392:38: error: call to
'__compiletime_assert_341' declared with attribute error: FIELD_PREP:
value too large for the field

drivers/gpu/drm/meson/meson_overlay.c:413:4: note: in expansion of macro
'AFBC_DEC_PIXEL_BGN_H'
  413 |    AFBC_DEC_PIXEL_BGN_H(hd_start_lines - afbc_left) |
      |    ^~~~~~~~~~~~~~~~~~~~
./include/linux/compiler.h:392:38: error: call to
'__compiletime_assert_401' declared with attribute error: FIELD_PREP:
value too large for the field

It's not expected to overflow these fields, but the compiler did
find a case where it overflows.
We can safely ignore this, so mask the value with the field width.

Fixes: e860785d57306 ("drm/meson: overlay: setup overlay for Amlogic FBC")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Got Daniel's Ack from irc

 drivers/gpu/drm/meson/meson_overlay.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 1f7b2055e012..646e605f30f3 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -58,7 +58,8 @@
 
 /* VPP_POSTBLEND_VD1_H_START_END */
 #define VD_H_END(value)			FIELD_PREP(GENMASK(11, 0), value)
-#define VD_H_START(value)		FIELD_PREP(GENMASK(27, 16), value)
+#define VD_H_START(value)		FIELD_PREP(GENMASK(27, 16), \
+						   (value & GENMASK(13, 0)))
 
 /* VPP_POSTBLEND_VD1_V_START_END */
 #define VD_V_END(value)			FIELD_PREP(GENMASK(11, 0), value)
@@ -144,7 +145,8 @@
 #define AFBC_MIF_BLK_END_V(value)	FIELD_PREP(GENMASK(11, 0), value)
 
 /* AFBC_PIXEL_HOR_SCOPE */
-#define AFBC_DEC_PIXEL_BGN_H(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_DEC_PIXEL_BGN_H(value)	FIELD_PREP(GENMASK(28, 16), \
+						   (value & GENMASK(12, 0)))
 #define AFBC_DEC_PIXEL_END_H(value)	FIELD_PREP(GENMASK(12, 0), value)
 
 /* AFBC_PIXEL_VER_SCOPE */
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
