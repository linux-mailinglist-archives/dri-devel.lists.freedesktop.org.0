Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69B7A0F4C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 22:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9464910E15D;
	Thu, 14 Sep 2023 20:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3919F10E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 20:52:23 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-58ee4df08fbso19671787b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694724742; x=1695329542;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y1bfYCZeoEdKY0xCX07ePzY5ryWaYVbqIYptARC7NJg=;
 b=g0qEWlmG8HJW+FSp9ZOVY3fEtSdGRhYco0fc5PWpPFx+x0paU7ohoqvcmECXpzwqOj
 +PAXA5dbv6jn6gOQg7rh6iQcZNYItBUZABXfAZXJwPwtyu5pumygUeRau6mQW8sBycg1
 Ly8JXjXkCIMqwDQr+xzo9MnRk5OTrK64C54VTqI98r0ekoT402qMkbyCa/knytP4hjhK
 L3S6YkJxN7rvbXZSQGMCoNaRBEk+7KfaYvUTNtRPH6S5X5YbUdjBFJzTGmU4LcT1DKP2
 c5F1QrJnrBQdNSs4ijNhK3pVYYrOVLUd7vMQJoMXR2vYWypv7qBXx5Lw39xdhhEzLhxX
 GOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694724742; x=1695329542;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y1bfYCZeoEdKY0xCX07ePzY5ryWaYVbqIYptARC7NJg=;
 b=AHlTrrYIvak8e0m/1B922DAb8WwiJtRftbFrQURwToyuCbEpte+fyht4KIfqq/zsd+
 kS/8ujT8iSj8zxRnmdd4iGjJo2iMgGWYoEMeYa3BHrED4EfoCmPGMJM1KDZ7PSWCEvxd
 vdxbGaMlE5Tp/Xg33t+Zc3ANk57642w/4UgvGfD1pmTh2Ogyn6lCWmZNAFEu6xQv+X+C
 by2O+B608BuxqHcvlCQLa1G8hSEknfYT+Thc7/e3nxfmATiEknGhb9GDEihEoTLJNsou
 He1D6ZKc4NjaBpsnAii7CBeGUje/BvvAwNTD9i4fAuEd/8ec1wOqEx0JuKWcGKS1nxy/
 gkYg==
X-Gm-Message-State: AOJu0YxyYKio2NIZLRFiXIADbIN7zbdy/6P+2lzterTh9+Hfqh+Hygb8
 90bnTV438F/5AD42VV4vz3V9HeVqQ+vdL/y4JQ==
X-Google-Smtp-Source: AGHT+IFttkDgh3STEULt9nazdb9L/1U62+xkGrM5KSilaIH+f9BeV8ytqjsC9zn8dQK4VotAls06A/tr0JmiYNXTAA==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1816:b0:d0e:e780:81b3 with
 SMTP id cf22-20020a056902181600b00d0ee78081b3mr162906ybb.2.1694724742466;
 Thu, 14 Sep 2023 13:52:22 -0700 (PDT)
Date: Thu, 14 Sep 2023 20:52:21 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIVyA2UC/x2NywrCMBAAf6Xs2YU0tUX9FSklZrdxsS92NQil/
 27wNnOZ2cFYhQ1u1Q7KWUzWpUh9qiA+w5IYhYqDd75x1/qMpJJZDdP2KTxjmkPrHK7h9dYg0zB
 lskF8xIihbWJHlwd1foQS3JRH+f5n9/44fp7rBQF8AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694724741; l=1689;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=ypZuHuWedw2GdaZjNukTcmFpVtl2zdn1sIH4RGMXcEM=;
 b=a3tnv1zYiSyHEe2n2OO9Vj2FcOGK7a0XpbAyi3Lxqx4nnbv89EszV7CesMgdUuN+kDtlRMpFC
 pVAkhV0uNoXDTUPACgysTkT/3J06KPMo1mFrHQQCpMGJzRWbEQYIu7h
X-Mailer: b4 0.12.3
Message-ID: <20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v1-1-0a53a076ce20@google.com>
Subject: [PATCH] drm/gma500: refactor deprecated strncpy
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
NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---


drm/gma500: refactor deprecated strncpy
---
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
index 06b5b2d70d48..68458cbdd6d5 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
@@ -141,7 +141,7 @@ struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev)
 
 	chan->drm_dev = dev;
 	chan->reg = dev_priv->lpc_gpio_base;
-	strncpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
+	strscpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
 	chan->base.owner = THIS_MODULE;
 	chan->base.algo_data = &chan->algo;
 	chan->base.dev.parent = dev->dev;

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-a53c6d8bd62f

Best regards,
--
Justin Stitt <justinstitt@google.com>

