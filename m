Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19C51B563
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 03:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358D510E121;
	Thu,  5 May 2022 01:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C356610E121
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 01:49:10 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtxSc12pYz4xTX;
 Thu,  5 May 2022 11:49:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1651715349;
 bh=eOGlpGpxB8mZv+swMCGeOmhKXRrt+JfX+vQ3ZqDz7CI=;
 h=Date:From:To:Cc:Subject:From;
 b=IB89NgK/Rvv8TIF+aeZs6zPMsv50fDDSDhPxC3NaIgt+3fL3smzpdCKBVVvbnn5yG
 kfdKbs/Cd9szZ3rIIANjSOii2bz+Hqez5/BDVGnMlJBS535VWZxkjftde9nM6mWsbK
 a383qG9OZSrTS/4unDnh+FMvJpMYhE9SG4wMFjTt+0gxWnt4GRPeLpmci92q82kFUV
 FwSVaQ1FWhAW2UfNx4cdW2AH6/soBdsaZF66iEJIuwEOAgtnhK4P69GWTKOmQOQDD1
 QgXOBJMdl0PIEiovAEaEciuGs95iLVeI4/ReTIB26a80ItwRYTgTWIDW5jkHnZ7WuT
 G0zCdGaDLt7qw==
Date: Thu, 5 May 2022 11:48:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Dave
 Airlie <airlied@linux.ie>
Subject: linux-next: build failure after merge of the drm-msm tree
Message-ID: <20220505114859.654eb7f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tRqYI3wCpidvLUmvMjB.9aW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/tRqYI3wCpidvLUmvMjB.9aW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-msm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/msm/msm_gpu.h:17,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/a3xx_gpu.h:10,
                 from drivers/gpu/drm/msm/adreno/a3xx_gpu.c:9:
drivers/gpu/drm/msm/msm_drv.h:33:10: fatal error: drm/drm_dsc.h: No such fi=
le or directory
   33 | #include <drm/drm_dsc.h>
      |          ^~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/msm/msm_gpu.h:17,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.c:19:
drivers/gpu/drm/msm/msm_drv.h:33:10: fatal error: drm/drm_dsc.h: No such fi=
le or directory
   33 | #include <drm/drm_dsc.h>
      |          ^~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/msm/msm_gpu.h:17,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
drivers/gpu/drm/msm/msm_drv.h:33:10: fatal error: drm/drm_dsc.h: No such fi=
le or directory
   33 | #include <drm/drm_dsc.h>
      |          ^~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/msm/msm_gpu.h:17,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/a2xx_gpu.h:7,
                 from drivers/gpu/drm/msm/adreno/a2xx_gpu.c:4:
drivers/gpu/drm/msm/msm_drv.h:33:10: fatal error: drm/drm_dsc.h: No such fi=
le or directory
   33 | #include <drm/drm_dsc.h>
      |          ^~~~~~~~~~~~~~~

Caused by commits

  b9080324d6ca ("drm/msm/dsi: add support for dsc data")
  c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")

interacting with commit

  2a64b147350f ("drm/display: Move DSC header and helpers into display-help=
er module")

from the drm tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 5 May 2022 11:31:20 +1000
Subject: [PATCH] fix up for "drm/display: Move DSC header and helpers into =
display-helper module"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h | 2 +-
 drivers/gpu/drm/msm/msm_drv.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_hw_dsc.h
index 164e5f5b1002..b39ee4ed32f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -4,7 +4,7 @@
 #ifndef _DPU_HW_DSC_H
 #define _DPU_HW_DSC_H
=20
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
=20
 #define DSC_MODE_SPLIT_PANEL            BIT(0)
 #define DSC_MODE_MULTIPLEX              BIT(1)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fdbaad53eb84..08388d742d65 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -30,7 +30,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
=20
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/tRqYI3wCpidvLUmvMjB.9aW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJzLQsACgkQAVBC80lX
0Gz4BAgAivmZ+AnLWan0/jPKLFtVm0209C7US8SGJXO2ri8EYt8YRqZhpBLQqr5S
OWh8VLnbx5H1HhKi5i9wI6U+SYlMhncN1jofYmvRYB+19UCe3gpDAqHs8wyiSikf
vXQ7XPpAgonDjj+ACpzoJ1STURGk3s1b7IOXaoY7yjRWfzA0jOLqt/+zVgMPrGkc
9uwZjqy1bCmRkj+4Zj5jQsXHMWVL7DDDS8+1T8E8/xMiS9pK0GThCW3/IQgYmIzw
bRZyzjuEXx2CZl4SkRlnbUytJGk2X9jUdZqfZtbrNjAEDTl4Ubtksf6MSrDt09vT
KzLuYJ+hkeafHLm3NKjaUycL/IGnPA==
=Kgh2
-----END PGP SIGNATURE-----

--Sig_/tRqYI3wCpidvLUmvMjB.9aW--
