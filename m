Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF6ECBA2EB
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 03:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D9110E380;
	Sat, 13 Dec 2025 02:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CGgZUQms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8038810E380
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 02:20:28 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4ee2014c228so13679611cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765592427; x=1766197227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sB8wODuYZvbHlQE6tL+mhCiQklQJq5k9yi0b7qFeck0=;
 b=CGgZUQmstH7y0IFI4i4gxEewS2nV1B3Sa+Y0YIBG6HfKW1//VTYHhlo3u7OrcQ4o7u
 H/jWUSN1aGDMrbBulKGYGzH00Gnk5C35jyFn+wv57jT9wWDbALpTLUVH+knFh4tywtzS
 f0n9aLsydKmTcnNLRchC3k1ZPPre98kat7d69zxkRl5iGufRbDz+QEnDh7ADByMf7yUD
 anCYx427l4YQcOw+0ukXw98/HZwd1+Cs1cjEZwURbLc0kA+Urk8M3HCoCMFrIjf8Pbe3
 765O0ybHi5qm9x+26kVxP2PGmHd8VXAl9SXF7KQLImhdBxRGNhzYpt5Rdw4YQoVcant8
 gVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765592427; x=1766197227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sB8wODuYZvbHlQE6tL+mhCiQklQJq5k9yi0b7qFeck0=;
 b=w2FA528pMNd3GIBOzqee3Qxv7MT5eh5j4s9KzSMWiC1xaKvCgn7NiqFV6abGqq0H+y
 QyaT7MmERjd0j8q7PAG2pIrXFLdYHRl+l65Ip4+MHi4ektgaf4jiFPAJCCxFjccvSjGR
 xKyR1W21yRQ2u+lMow5wVDyPn9IFqFHiPFLW7j17a5GrLz47KbAUyUG1RAWc+J9GFFDs
 S5j2kYYrsvWooek35+1lT7xw0OkqPz0ycLM6fICcOEnDtG2O3ajZmQ0L8l5D6dDVbwWb
 sNzSCtUCxHWHJVupRWz409HdLGZ15AhBXv5mrBLXLuzAQAuNgxl+sy1AP6WbG7b1Vdly
 FnNQ==
X-Gm-Message-State: AOJu0Yy6opOLhISqDswXL6r9SZI9uo5OMRTZljIwGJfnHOadl6h0APYn
 vcW9selZ1AO+AMsQHuciy7BAtPJLvzioMQ3X11W/K8/m2MFwEqVrrS1oCSmRrgcx9EvuGsM63rJ
 IxYk34+DRuV/A9mioNW1yhiu24/tZsik=
X-Gm-Gg: AY/fxX7SnV9TqAHM3nFYAW13TDOKYnuR+fsMXlSiMagr0RtloCAy+PzNvFNUHU5HEAw
 BOcLX4fnI25dxiXus5tXPzL2CTxiPnAIUjqgTzK3Ocwtgrr3+PEbz4vYOdOBsVFIzLavzpBQ1kB
 5+fMK0tEekJfjlFfmCESIrME63Rdu1lNQUKt+l5yuNJsiw0rkjhnUX4FsfpKtmKYz2xlwrWTzcy
 /cJ+bh6JSp54TG4PQKxSdJsP76IlDGZgYqfyo8TuxBggi2/imFamGNtZu7epJxLoSTrj+oJPg==
X-Google-Smtp-Source: AGHT+IFTPrJodF4FgaJfiy+YxZUAy1LHE797/QEsBKky2gnjcj6Btlk0VcqDRIG2kJZBGRediSfY7d4VFg89+d1/YXo=
X-Received: by 2002:a05:622a:424a:b0:4ee:2c3c:6e with SMTP id
 d75a77b69052e-4f1d04cd38fmr57299011cf.30.1765592427554; Fri, 12 Dec 2025
 18:20:27 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 13 Dec 2025 12:20:16 +1000
X-Gm-Features: AQt7F2rk0txkk3q9ug3b1Hva1wVS4vOIRXJhvN9SkTMVL9QZYHv7Kv_wclmy0Bo
Message-ID: <CAPM=9txr+eWr=nCVWwAPA=bC8bBNnA+ReSkxGCYoQmhEhhyUmQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

This is the enqueued fixes that ended up in our fixes branch, nouveau
mostly, along with some small fixes in other places.

Regards,
Dave.

drm-fixes-2025-12-13:
drm fixes for 6.19-rc1

plane:
- Handle IS_ERR vs NULL in drm_plane_create_hotspot_properties().

ttm:
- fix devcoredump for evicted bos

panel:
- Fix stack usage warning in novatek-nt35560.

nouveau:
- alloc fwsec sb at boot to avoid s/r problems
- fix strcpy usage
- fix i2c encoder crash

bridge:
- Ignore spurious PLL_UNLOCK bit in ti-sn65dsi83.

mgag200:
- Fix bigendian handling in mgag200.

tilcdc:
- Fix probe failure in tilcdc.
The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449=
:

  Linux 6.18 (2025-11-30 14:42:10 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-12-13

for you to fetch changes up to 5300831555cc6bb45bf824262ac044e8891b581c:

  Merge tag 'drm-misc-fixes-2025-12-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-12-13 10:54:29 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc1

plane:
- Handle IS_ERR vs NULL in drm_plane_create_hotspot_properties().

ttm:
- fix devcoredump for evicted bos

panel:
- Fix stack usage warning in novatek-nt35560.

nouveau:
- alloc fwsec sb at boot to avoid s/r problems
- fix strcpy usage
- fix i2c encoder crash

bridge:
- Ignore spurious PLL_UNLOCK bit in ti-sn65dsi83.

mgag200:
- Fix bigendian handling in mgag200.

tilcdc:
- Fix probe failure in tilcdc.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/panel: novatek-nt35560: avoid on-stack device structure

Dan Carpenter (1):
      drm/plane: Fix IS_ERR() vs NULL check in
drm_plane_create_hotspot_properties()

Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2025-12-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Kory Maincent (TI.com) (1):
      drm/tilcdc: Fix removal actions in case of failed probe

Luca Ceresoli (1):
      drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors

Lyude Paul (1):
      drm/nouveau/gsp: Allocate fwsec-sb at boot

Madhur Kumar (2):
      drm/nouveau: refactor deprecated strcpy
      drm: nouveau: Replace sprintf() with sysfs_emit()

Ren=C3=A9 Rebe (2):
      drm/nouveau: fix circular dep oops from vendored i2c encoder
      drm/mgag200: Fix big-endian support

Simon Richter (1):
      drm/ttm: Avoid NULL pointer deref for evicted BOs

 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 11 +++-
 drivers/gpu/drm/drm_plane.c                        |  8 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c             | 25 +++++++++
 .../gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c | 20 -------
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 19 ++++++-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  4 ++
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  6 +--
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |  4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    | 61 +++++++++++++++---=
----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |  3 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 10 +++-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |  8 +--
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 53 ++++++++++++------=
-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  6 +++
 16 files changed, 166 insertions(+), 76 deletions(-)
