Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753F677FD9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AFB10E4D0;
	Mon, 23 Jan 2023 15:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD3B10E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:33:28 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1442977d77dso14317767fac.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RASwLuUQeThiSsPWu6gVcHRtrdGgei4NA5W2fbAqfS4=;
 b=MpkGkvAK8zg7raBn7JnAO94GpkuLzSuzhgW8dPuf69D5CpUqGcUJpiEqJiazUHuhvE
 VkLyEM3aaH1upUjucee7d8iGuquOshZPSukqf0jv0i1hHRaKks4gOkXL/mL32XTlXzdg
 txpl3ElPVgfRxJTdivlpyIDrQDnHlG1M65k/Ynie21K43or8wxhNArs8tQDLtbmebCWY
 DleOxoGE+1eEoGcLA/oOIeAOKZMONnGaRzn36JeTFIY1XeECgd6dDr+/ghbMmXOD1qp9
 togOKcMGg0BmXw3YP+3nOeBFOWmaVAgILiTg1OOsgVJIQ5VDlcXDct+aRcG7cSgiu3fh
 cAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RASwLuUQeThiSsPWu6gVcHRtrdGgei4NA5W2fbAqfS4=;
 b=A+fdoWvAxYSnKeleXNl1JV5/d+4shl5ywnTGeCUBJcOY+Er9O8irg4hZrPxpNOi1pk
 XFuiL5k4xnifmsAhrQktskwhYhwA71z/0ByAs4yrhky23AO8NIJJWvktkwNaCrMbyVv8
 2SXlqSfgT63p1wpn4GhC7CXQulAARl/LbYh9Fi3FnZm/1NmWfCEiivA5hGmlcbt3A9AB
 eWebPgllDhP6Ik/qVowqPrrL+SK3Q/TVLdGsHPFPMGIUHwAaFgzX1JXX3Dh+OA1zDsU1
 t3dcauUOtuTbG3WOKRxCQJYo+xNTSM+pSEpue5VZxZTlH7U8wO0BUn0Vfgie4kWSe7Tb
 cSGw==
X-Gm-Message-State: AFqh2kpJLqTIqwDM7Cy07XE1pXCZt9J91o8MVPhyG4svRbO5dvc3SsR3
 N/4wsX+7I35OBS5Dp9Kt9D3eiPehf1g=
X-Google-Smtp-Source: AMrXdXsbM9F4wGlpe4aZwpMgO9ORzaHzEvZ9t+bcMptOS1cBAnRUwkKGfsjwVBC3v3rt9PszGonIwA==
X-Received: by 2002:a05:6870:6a8b:b0:150:21db:43ea with SMTP id
 mv11-20020a0568706a8b00b0015021db43eamr12483416oab.36.1674488007673; 
 Mon, 23 Jan 2023 07:33:27 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a056870708100b0013b9ee734dcsm25459182oae.35.2023.01.23.07.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:33:27 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/3] drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
Date: Mon, 23 Jan 2023 09:33:20 -0600
Message-Id: <20230123153321.1314350-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123153321.1314350-1-macroalpha82@gmail.com>
References: <20230123153321.1314350-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

A later revision of the datasheet for the ST7703 refers to this command
as "SETECO".

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 86a472b01360..27049a1d9b3e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -41,8 +41,8 @@
 #define ST7703_CMD_UNKNOWN_BF	 0xBF
 #define ST7703_CMD_SETSCR	 0xC0
 #define ST7703_CMD_SETPOWER	 0xC1
+#define ST7703_CMD_SETECO	 0xC6
 #define ST7703_CMD_SETPANEL	 0xCC
-#define ST7703_CMD_UNKNOWN_C6	 0xC6
 #define ST7703_CMD_SETGAMMA	 0xE0
 #define ST7703_CMD_SETEQ	 0xE3
 #define ST7703_CMD_SETGIP1	 0xE9
@@ -266,8 +266,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 				 * ESD_DET_TIME_SEL = 0 frames
 				 */);
 
-	/* Undocumented command. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
+	dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x01, 0x00, 0xFF, 0xFF, 0x00);
 
 	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
 			  0x74, /* VBTHS, VBTLS: VGH = 17V, VBL = -11V */
-- 
2.34.1

