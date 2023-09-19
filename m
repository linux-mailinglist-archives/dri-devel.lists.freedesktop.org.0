Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDA7A5872
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 06:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F5A10E24A;
	Tue, 19 Sep 2023 04:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com
 [IPv6:2607:f8b0:4864:20::249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0D110E24A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 04:41:18 +0000 (UTC)
Received: by mail-oi1-x249.google.com with SMTP id
 5614622812f47-3a88fd9ef66so7771814b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695098478; x=1695703278;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=of1G2AjFUxK4T2lKuwOZsNYvvlYd/OC9AdRH6bOHIA4=;
 b=zNB39EQeUqX/9Ef58d7JLKwq7lXpU8qVEAgratj0m0ZRhMDYz9pxK62AAXhW+fGsmP
 KnM3Bxx1jglSTI/WZcS6mDdKAibIGriyAGkxv0fyIrd6llAqA3CbV86y1Pfei5IYnRBd
 Qsfc3udSgrQOiBcZ0/w0BL2UNR6pGNY6ikP4GfV1UyLS5I+DH1HY3ireMbdqp9m5BQvm
 yev9wgKS0mn2x9aDOuntlsi/qwqY9cXCOJTZubI+01Fv3uM4y/yh01mfO5FbdojTvjk9
 Mh18ZpvlbckXDhgC7oMV0Spk6gzUqjwMht8LM1zcgfIZIwZ8ISbCslJ26h8uiM4LCq2K
 /aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695098478; x=1695703278;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=of1G2AjFUxK4T2lKuwOZsNYvvlYd/OC9AdRH6bOHIA4=;
 b=DsatlTbSnLWcUrZYTf+9KUQ+QxdtUSXhbjzrKZso7hjwutwDUHVCkDDToMxncVUfZE
 tuS2kkQqbQMErNryQ8w/pJiuQagLHSNT9C3+zptKz3+cAWkoyBkqw8P6xU09BDiuKrxi
 wkK40uTIBmWZ3+F7XlIWBOdBeRo9gueMm5bWTXbccrqgQFJANFegkk+2hEvb122bjHxn
 5gnvfIq9Batzh1+p/awTCet/VomZuu2LrODzCTMQOvsgjaBt5iwCxosDooTgfyIdbtsh
 Rrb3JJfBfJzBYkryLK5FzL1aEM4VsDKuAOJyDde36eCkwPBWyi2zes4PHrNm7QhIyIgM
 WEpQ==
X-Gm-Message-State: AOJu0YwGHG9pQBmpOEaP8PkF40ZB/IEJlBWwHPYDBBw2M+/KfeTu1A0o
 MM/iLSMuFGqEBLiRVZ4/zVl3IFn4vt6jjtNfxg==
X-Google-Smtp-Source: AGHT+IGnU5s6OIGSn5cC7NWVIFxeeVBC5IQr4RpFLYJ+aIpO5DZ6NNzapgJD0y8MYnNPStPJqYpbkxJOERDAES36Jw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6808:199a:b0:3ad:29a4:f542 with
 SMTP id bj26-20020a056808199a00b003ad29a4f542mr756370oib.5.1695098478040;
 Mon, 18 Sep 2023 21:41:18 -0700 (PDT)
Date: Tue, 19 Sep 2023 04:41:16 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGsmCWUC/53NTQ6CMBCG4auYrh3TFsGflfcwhNR2KBOBkik2G
 sLdrRzB3byz+J5FRGTCKK67RTAmihTGHHq/E7Yzo0cgl1toqQt5UUdwTAk5gp9e+R7AD6aUEoJ
 5zmyob/rkYkPaggVTFrZy54erdCvy4MTY0nvD7nXujuIc+LPZSf2+fzFJgQKZMSNPlUUtbz4E3
 +PBhkHU67p+AdX0M2DlAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695098477; l=1887;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=mJhdmvY4dhQaVYSKiTNMqir+icefxTZRFVt1lST3CX4=;
 b=tMzBU+KLFc2Eppj6xXIygZ2Dq/nC2zJMApa9X+WMt7T4LpaJjlfb6RpBbKzgk5C4yKzfWUYPB
 NhfiYY2Kel9D80fFCLgHDN2zBJ88PddQysZHhrrgQAoCI2mJ91yQ9I6
X-Mailer: b4 0.12.3
Message-ID: <20230919-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v2-1-9ebe6983b4cb@google.com>
Subject: [PATCH v2] drm/gma500: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
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
Cc: Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

Since `chan->base.name` is expected to be NUL-terminated, a suitable
replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer without also unnecessarily
NUL-padding (since `chan` is kzalloc'd already).

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use sizeof() instead of I2C_NAME_SIZE (thanks Kees, Patrik)
- Link to v1: https://lore.kernel.org/r/20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v1-1-0a53a076ce20@google.com
---
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
index 06b5b2d70d48..939c53fd09e8 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
@@ -141,7 +141,7 @@ struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev)
 
 	chan->drm_dev = dev;
 	chan->reg = dev_priv->lpc_gpio_base;
-	strncpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
+	strscpy(chan->base.name, "gma500 LPC",  sizeof(chan->base.name));
 	chan->base.owner = THIS_MODULE;
 	chan->base.algo_data = &chan->algo;
 	chan->base.dev.parent = dev->dev;

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-a53c6d8bd62f

Best regards,
--
Justin Stitt <justinstitt@google.com>

