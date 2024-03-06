Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EC87414F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73B1113511;
	Wed,  6 Mar 2024 20:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=klervi.com header.i=@klervi.com header.b="mJHmo099";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3217810ECC9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 19:55:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4130e293686so505715e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 11:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=klervi.com; s=google; t=1709754944; x=1710359744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n04+kjr3Y6YgIJTaMT3u4Uzu8nklWAvbA4VZhXY8Et8=;
 b=mJHmo099M3pdp41UQhHX/Naob1Ill9yjMmpdeBwJ1WTDiQAG3rCxKkGobEoffB3OGs
 kwxV6QkYb6IlZ3Ue+1NPuR6L9IxIe4iKIzQwZRt21sfqe395dh7UJORjhQ8UGty0Pf6P
 QJOuZd+9ClqMLZdqFv1npa0BJj7i+QOZeMXVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709754944; x=1710359744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n04+kjr3Y6YgIJTaMT3u4Uzu8nklWAvbA4VZhXY8Et8=;
 b=s9+tALFHzP4sDr/f64fJBzl5G0vsD9WtC3bZgTTswNF3+tfrAOITRaaMSmYRczB9y9
 WiyrnAmqUkeKXcyVQpoCd1q4Tghq4LYR+WLDiUfOKsbmaaK9iAnev6c3B7xA1K6IDS/D
 nOmoxbOUKqUY3ufPfDsEBZJYzK0XaIC6zMtzdmQTKVbHXq+Kwvs8cKVSLHxYzL3hTmRZ
 fRaB2lkjLBhoyp9FAzAD8O+fqvfEaPNrj2DGGkn5sxrOloDpK2+8Y+SqazZaHJl727A5
 9K94kfStkX8wHOh5S/x09HGl6oGx0e3JzBc0icR+Aji5tjs2O5S9Kbi/8mYBmP89Txle
 9Erw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGdaeiugOoTvazDH7DpEUzg6UN65/PoqfIcR9lI5PxrXjdeIADdppyrgm1Etf9zUdvZxZ27Kq/JZeqQPw1uAaS1d6KNV8x8oHgpIVOIS7V
X-Gm-Message-State: AOJu0YwAFf6N2yJqn3pkeCHAQq/bELSlC22K7jPOzem72f3OD/4Wd6w2
 b4gqG5ELwZBD60kTmJ7kS6/wb6CEepxWR/rJOuQ9tWJaCeVpbonyJrKLiNwS5FkYcuoa6DOO52s
 xVJp2TS06VL3egXAe7wvGVsJEzjo0CwkcYh5th18yWZKB8Wcq0eOFsB9TuBjQ1ZuFGeceSjv1Va
 PKZtcMRC55cLjvt8i6MDuKi4Ml7Ka1ba4McTHMejwWtagTIBLpY9tYqMRzS7Gkc9Uo2dL/w16SO
 nJ1hevJ51YOexrecxYKAevPO5boi6/S6AwaC4Kt9Y+9uUHyYQ==
X-Google-Smtp-Source: AGHT+IF2gkqIB+cBn4Al0GM9/kmbswnuXzHoTEFQtziyTc9Mtd3yLVusDe1v0KZebzI18vt+6lLTlg==
X-Received: by 2002:a05:600c:510f:b0:412:dc42:73f8 with SMTP id
 o15-20020a05600c510f00b00412dc4273f8mr9417350wms.18.1709754606972; 
 Wed, 06 Mar 2024 11:50:06 -0800 (PST)
Received: from cadmium.klervi.com ([2a01:e0a:33b:ae30:d1d4:c3ea:40e3:789f])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b00412f6c695d1sm235193wmi.43.2024.03.06.11.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:50:06 -0800 (PST)
From: Pierre-Louis Dourneau <pl.dourneau@klervi.com>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Pierre-Louis Dourneau <pl.dourneau@klervi.com>,
 =?UTF-8?q?Beno=C3=AEt=20Alcaina?= <b.alcaina@klervi.com>,
 Arnaud Lahache <a.lahache@klervi.com>,
 Nicolas Georges <n.georges@klervi.com>
Subject: [PATCH] drm/atmel-hlcdc: Release CRTC commit when destroying plane
 state
Date: Wed,  6 Mar 2024 20:49:35 +0100
Message-Id: <20240306194935.11871-1-pl.dourneau@klervi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Mar 2024 20:21:38 +0000
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

From: Arnaud Lahache <a.lahache@klervi.com>

Fixes a memory leak occurring on each modeset update.

Running a program such as libdrm's modetest[0] with this driver exhausts
all available memory after a few minutes. Enabling kmemleak yields a series
of such leak reports:

unreferenced object 0xc21acf40 (size 64):
  comm "modetest", pid 210, jiffies 4294942460 (age 331.240s)
  hex dump (first 32 bytes):
    00 a0 a1 c1 01 00 00 00 ff ff ff ff 4c cf 1a c2  ............L...
    4c cf 1a c2 ff ff ff ff 58 cf 1a c2 58 cf 1a c2  L.......X...X...
  backtrace:
    [<d68b3e09>] kmalloc_trace+0x18/0x24
    [<f858a020>] drm_atomic_helper_setup_commit+0x1e0/0x7e0
    [<26e8ab04>] drm_atomic_helper_commit+0x40/0x160
    [<49708b0c>] drm_atomic_commit+0xa8/0xf0
    [<e58c2942>] drm_mode_obj_set_property_ioctl+0x154/0x3d8
    [<5e97e57d>] drm_ioctl+0x200/0x3c4
    [<ed514ba1>] sys_ioctl+0x240/0xb48
    [<26aab344>] ret_fast_syscall+0x0/0x44

drm_atomic_helper_setup_commit() acquires a reference to a drm_crtc_commit
for each CRTC and associated connectors and planes involved in a modeset.
64-byte leaks map well to the size of a drm_crtc_commit on 32-bit
architectures, and the second 4-byte chunk in the hex dump above awfully
looks like a reference count.

We tracked this missing reference decrement down to the driver's
atmel_hlcdc_plane_atomic_destroy_state() callback. Its CRTC counterpart,
atmel_hlcdc_crtc_destroy_state(), calls into the drm_atomic helpers and
properly releases its references to the commit. Planes didn't. Using the
default helper for that purpose, __drm_atomic_helper_plane_destroy_state(),
fixes the leak and avoids reimplementing the same logic in the driver.

[0]: https://gitlab.freedesktop.org/mesa/drm/-/tree/main/tests/modetest
     Invoke with `modetest -M atmel-hlcdc -s 32:#0 -v`, assuming 32 is the
     ID of a connector.

Signed-off-by: Arnaud Lahache <a.lahache@klervi.com>
Co-developed-by: Pierre-Louis Dourneau <pl.dourneau@klervi.com>
Signed-off-by: Pierre-Louis Dourneau <pl.dourneau@klervi.com>
Co-developed-by: Benoît Alcaina <b.alcaina@klervi.com>
Signed-off-by: Benoît Alcaina <b.alcaina@klervi.com>
---
As far as our testing goes, we've been running 6 of our production units
with this patch for more than 2 weeks as per the date this patch is sent
out. We can report stable memory usage.

Admittedly, our usage of the DRM uAPI is rather simple: create 2 dumb
buffers, do an initial MODE_SETCRTC, and then MODE_PAGE_FLIP between the
two dumb buffers at the rate of once per second on average. We haven't
evaluated more complex workloads.

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index daa508504f47..390c4fc62af7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -934,8 +934,7 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 			      state->dscrs[i]->self);
 	}
 
-	if (s->fb)
-		drm_framebuffer_put(s->fb);
+	__drm_atomic_helper_plane_destroy_state(s);
 
 	kfree(state);
 }

base-commit: 9dfc46c87cdc8f5a42a71de247a744a6b8188980
-- 
2.34.1

