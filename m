Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521D12DBE6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0C589F07;
	Tue, 31 Dec 2019 21:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD42089CD9;
 Tue, 31 Dec 2019 20:57:39 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r21so35982986edq.0;
 Tue, 31 Dec 2019 12:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=/L0UDpnttYF4BqWVkxCJIlx3yMpKiM8ZTy0/08IBArQ=;
 b=QksdBBrjGEgK9wuUn1CisFauT6ltKaiIeSdhWC5YXyRot6/jzbcbbYtUu/70RF+xti
 nCyTghD7/hpqOweTC7VYhL6uYudRBFLBJ8KYgGZKmETJYqrgLo5rwJ2FjqrhWMEtGZYB
 VvSgVX6KyEU/6R8p+Q6IbLHP9ejsMfQfm4Mul3OYe0GngEikiWDVxJDtbcT8jq9fs3/Q
 jlQ0l5WZr3qeSJfk1WVlx0dwH5SdUeFmwCowEs3NIV7MFCXiFhHqCpWE0ZsNeAyIaNOA
 PQqqd4r/wTJ1/dvlTtOPozBZeQFvBDI+cr7HMCnMkHWCJdQCDP9v05oCe95pp3v6X7Wo
 QNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=/L0UDpnttYF4BqWVkxCJIlx3yMpKiM8ZTy0/08IBArQ=;
 b=K3psjKmtL6YvD6W0x2ZugolemUO2Ats26vuxlTrSBJAhv+vaRJ+VpK/lFiATWTy4ur
 jSQTvv2dTXf934H8QccSd/KsJ88ojleSdEuq/SeAT0vXV04m0PacpX2def+iQUnnHa0U
 XQC1NiarjcS4MMNimSRdLDRYU7HNox5B5Vnjw2aa2/0xU68EpBD/8ouGY9ppK9bIBoNb
 7gVxq/n3iQILeDqeUAuwiNaDoXy3zxLCPekmVDID9kaZZIzL+QCKkGq9UcqU5KIJma4X
 6p1hkwddVTjZUrLMi1qMX/EzzVaLMCeKvpw/ZXzawgQ6xQFKxF4ZGyu1WNXW81AK8Rkr
 S70w==
X-Gm-Message-State: APjAAAW184x17anidpk6pYIFsDDIr28GxV3HvNU1qv2m1KbLgbHeV6+g
 vbhGpRBZsnq9e/amU0XK9fU=
X-Google-Smtp-Source: APXvYqzHOV8xpOMmY6pgT4CHyziZ4IY9SHUbXafxJvwikQKUKZw/R+cByu8fvnA9nN3kliR7j6BW5A==
X-Received: by 2002:a50:ef17:: with SMTP id m23mr77217345eds.106.1577825858489; 
 Tue, 31 Dec 2019 12:57:38 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id u23sm6035905edq.74.2019.12.31.12.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 12:57:38 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: use NULL for pointer assignment.
Date: Tue, 31 Dec 2019 23:57:34 +0300
Message-Id: <20191231205734.1452-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 31 Dec 2019 21:04:21 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of 0 in the pointer assignment with NULL to address the
following sparse warning:
drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index d445c6f3fece..1c3104d20571 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
 			special_groups[i++] = &pwm_fan_sensor_group;
 	}
 
-	special_groups[i] = 0;
+	special_groups[i] = NULL;
 	hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
 							&nouveau_chip_info,
 							special_groups);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
