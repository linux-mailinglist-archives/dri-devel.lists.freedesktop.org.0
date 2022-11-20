Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F663133A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 10:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D6010E05B;
	Sun, 20 Nov 2022 09:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C6810E05B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 09:38:35 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n17so8688584pgh.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 01:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdh47TdFCyP5Jo4EkJC1KVjModNAx4vFEonjM44Yfks=;
 b=iTynN8pTjr1cJvnkG7ZDVL9dN9LVoZhndKazXeJQj3Y7O2nWU3LFSGIj2ZFc/IYFtv
 6Up6UKsociYSjVOPCjiEqm5c1SUa0WPa6gC2KzKtSnmyvOnv1/rLY+tSITrAy7JT8Obb
 2JAHYHiVVC/ms0529NZlmf1NFId2N01IjlCiixgZYC8/i2L7HCfSazGkDVh4VdHbiZyx
 x2U50tl11xKKEyXB4+IJgXSVduiGeK4d9wDphdDlU6YIaSwLpaxfSoSYq9fr/+LE4DAL
 SSuaA5yuyjZuU0vmZGxp1hezo1hCnKisL9iCC+5EOyziXjBA4IjU0v/pbBhcfEnCBsDq
 xrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdh47TdFCyP5Jo4EkJC1KVjModNAx4vFEonjM44Yfks=;
 b=l1i/uWbntikjL2YTfTXEctvvDGCuAB8SIrcaGuCyrcs6hTs6dd06aNLZ8bxkFTLhv3
 exFx0ZH/Y8VsIukPeaKkBCC3Xg5L4DNNCix+T2vaa78g2WeFivoHZJpeEGwRMLn5vZQ0
 2LkohXIMqv6u1ETHLRmj53muDZMXNR/r5LuZzPOk7k2TEDeV8pwBiXQDIC0HgWA2Pfn9
 0gXtaHUa6EqESXEh4SCsfMqOyiyf/KFQ88bA+DeMNNgI4g2zfCSzV9bWMIjNzbo9bwic
 4yZvhCl7UKJzPp9w8/7l/N6COtJh3a/kYuhmAXH5rgWxI18rkqVnH8NCC3qnLN0//Xsy
 hjxw==
X-Gm-Message-State: ANoB5pkuzihp9Nm9jkGttkGREkF5WKocCOwHva2n+Du4VNFPRekIyHxh
 196b8EKdTg3XkOO0Ow5uG4c=
X-Google-Smtp-Source: AA0mqf7Qb9yKGUq/bxq6PgPcQNj/9pksYDg4DDniOo2q/02PSfI5myWZHtCS0qzL+zASzr55fhwVDQ==
X-Received: by 2002:a62:5f46:0:b0:56b:cc74:4bd5 with SMTP id
 t67-20020a625f46000000b0056bcc744bd5mr2154127pfb.79.1668937115008; 
 Sun, 20 Nov 2022 01:38:35 -0800 (PST)
Received: from 167-179-157-192.a7b39d.syd.nbn.aussiebb.net
 (167-179-157-192.a7b39d.syd.nbn.aussiebb.net. [167.179.157.192])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902da8700b00176a6ba5969sm7161109plx.98.2022.11.20.01.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 01:38:34 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH] drm/modes: Fix outdated drm_mode_vrefresh return value
 documentation
Date: Sun, 20 Nov 2022 20:38:29 +1100
Message-Id: <20221120093830.47225-1-net147@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Jonathan Liu <net147@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vrefresh field in drm_display_mode struct was removed so the
function no longer checks if it is set before calculating it.

Fixes: 0425662fdf05 ("drm: Nuke mode->vrefresh")
Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 drivers/gpu/drm/drm_modes.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 3c8034a8c27b..2d51ab2734a0 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -803,8 +803,7 @@ EXPORT_SYMBOL(drm_mode_set_name);
  * @mode: mode
  *
  * Returns:
- * @modes's vrefresh rate in Hz, rounded to the nearest integer. Calculates the
- * value first if it is not yet set.
+ * @modes's vrefresh rate in Hz, rounded to the nearest integer.
  */
 int drm_mode_vrefresh(const struct drm_display_mode *mode)
 {
-- 
2.38.1

