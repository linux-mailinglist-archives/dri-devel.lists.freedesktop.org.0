Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0E9AD48D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 21:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F92F10E853;
	Wed, 23 Oct 2024 19:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QYHEncOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09FC10E853
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 19:13:45 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-e165fc5d94fso284875276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729710825; x=1730315625;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:mime-version
 :message-id:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=;
 b=QYHEncOHS5BqF7V2DzR29RQceEvOWP8TnfEX2JnYKW7KlZtHMz+nrL/aOr+T6Ypq1b
 BgpU351otaNI6E+6CnTlH5BEo2BG9GWwku+CG5jAdfTFceRvCSs8jmoracrWlqiwn0Ef
 v+82TVMsfZBYWqWXV0ogccxRl0ZbD979y/WOkRNLr/c7YeA7nT0HHXgdC3NVF4gJlWe4
 +wWqp0WVdTJOWqN3BB+ID/Hs0LmJGqMf467He7yclNQR4ZZUMWMg/CWz1yOLrnKklXTr
 LRP1s5DAocrvbQB54nk3ZcUNrZporQZVeCUWLbtYuqwXZe12fSkeMG29iZXCDjjwIqJ4
 eDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729710825; x=1730315625;
 h=content-transfer-encoding:cc:to:from:subject:mime-version
 :message-id:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=;
 b=YMVspqz4lQg/4DyVcgKh+NTQfI4wmut0RoNl9vcp15hfLfkyGbV3/Rf+v4KQhk7sZM
 iTxk0TD3N74d6WPY6fBMTkGC3HsacJ3TWgf9/1DPKFLryMlURfsrkQ99o08EYN1AQiQb
 DH1fus54BWqWRBBH/zV62OEDWb94yvkyYPpQPpRff4V9vOIT9YYR+OOfLko8OgxJ0b84
 lrb1Zqjwal0bAlNNCLAkHn16ShEEiY6OS46arIZ58Hpky0sYKBTMxfYjWYYRK1YLg/aG
 OBevSWG4mDP5zY7wymZqPQ4qn9FkxJ9ht+8jF4SQTGFLw0RIU3BJdFfRqT2eV56u0o2J
 JOCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkLwc5lEDNtgHYUOp9pjxuKzFILLL3IR8cfL3dwYT7vxzNmCnvdjKP0amSGGNbxSHtMOcQb6/4Rtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0wjPfqY9kUFy+jmc5vlkKPvpirIeH5awbm2fBnLV58Wnv2hWY
 2xfFUp+m5C1D4xM5G4OoMEoLc+ixzuE97NUm/2zg4w/RwwaBW/a+Rs12m8QEuZm23PYTwxEscqm
 6yjFq231EBxTX+w==
X-Google-Smtp-Source: AGHT+IGtw++CFsHM6UsXTaa07P8s7oTXdItvei/TRQB3GwOD9DmownHZlFBOwrDDCuKJGIw70cl6vC5daxpXLbk=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a5b:602:0:b0:e28:f2a5:f1d with SMTP id
 3f1490d57ef6-e2e3a632bffmr3981276.4.1729710824576; Wed, 23 Oct 2024 12:13:44
 -0700 (PDT)
Date: Wed, 23 Oct 2024 12:13:36 -0700
Message-Id: <20241023191339.1491282-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH] drm: display: Set fwnode for aux bus devices
From: Saravana Kannan <saravanak@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
 "=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?="
 <nfraprado@collabora.com>, Jon Hunter <jonathanh@nvidia.com>,
 kernel-team@android.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with =
backlight-lcd0
tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
---

Don't pull this into stable branches unless its causing a regression in
older LTS branches. fw_devlink code is complicated and it might end up
with missing dependencies picking up changes piecemeal.

-Saravana


 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/dis=
play/drm_dp_aux_bus.c
index d810529ebfb6..ec7eac6b595f 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	aux_ep->dev.parent =3D aux->dev;
 	aux_ep->dev.bus =3D &dp_aux_bus_type;
 	aux_ep->dev.type =3D &dp_aux_device_type_type;
-	aux_ep->dev.of_node =3D of_node_get(np);
+	device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
 	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
=20
 	ret =3D device_register(&aux_ep->dev);
--=20
2.47.0.105.g07ac214952-goog

