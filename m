Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B384FBCC050
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73910EB4A;
	Fri, 10 Oct 2025 08:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="qqB+UAfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7910EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 00:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760055933; bh=0VTdNEpFRWjnOOzcXbrlmV0h1KaJ09ZXiLQBWRMC6P4=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=qqB+UAfpHPOOxn6g2gR3UsclcDMwa6h8qvSmvGpCoZXGWsVZtNI55huyBIEiPgS1SaA74Ea2+ohQuBkET6v6oUXjUwWpPUqq7yDZTQyDBrRuUPgR3atzaI6kjKZHwfSx6Hv8G5GtmJnEzAUFyxwWQNqemfoYDojYTwZk+y7a2rRWPWbShOgM3MrjG12y1sC47tuMWiWwr6mrbj/z+qTn+kXG3GnUKB8GSZLld/i/hw8ndAsgqLrY9C1FsS3Gc7txdKMqCo3kyVdma6nmhM/KeO+mB1LcYL9cPLRw7XGHxl04bzTcMCa6IUQJN6sCROq34Dewq6Z/5O+40aqsUAeweg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760055933; bh=nQD2tSvcyjG9WTdcPzrAaGCIeOasrHt/eSYflXgIgnA=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=VJQ80krOz4Nc+4qkum7cbMcJcNg/laR6uYhFiWLUc3SZguZWGZXN7cQC88xdmyhb5o6M4xKfN07RD65bHRGxbZ4fHS4Csyhp36+d8aoliuzGl6djdlq1n3eQpWH+gMet5239CnRc3v0GY8sIZ32/5RJYhsuJokpEJpnv/at1tXaqz5bkdilXhbhTcXZe5CLJeiUMvUasJQzKDhQjSc8C5K5dYqkE4RAsQ/LkPQTpUqpxwbRe1hbVq2cTJ/EfP+2A5lBwR/Ir5Hr5Sz9Ecbz1Dpv4wJWHEVRYD0ANnjFQJLNEVe3i+gpPpVQ1UAFQ+fphD0RjceYac3FgOnaQLeh8KQ==
X-YMail-OSG: VbSpB3AVM1kFrdWXjzDYStmyabFzfBauQUcwFj47wWqxZxJitX1xO3ebNu4krFG
 RYQR8ULwOVgn.h1u8WtC7pNSFezlkCIP5ViSBedj010XjuCG41T6P7hnXSOyPvRuOyvo086giPHs
 QIds0t..w4ib.odZn2LDZjDhIHWe2fnN5rvSeXreWlwLP1dvLDMR5DGd.K3IM.9it2p7NkAu2Ppl
 FXVgrWOIpSZHW8KNUgnRmlqRbSLqjaFONg3F7CxdWpkgsItxyb4b3D9SLH5j9..RHFb.VfK1L.nT
 McWUQ9L_l8qxMmjrEl9nMD8FGp9m8WtLasAfs46DXOz8Dkxvv0iw94AEH6h2hIvnZgBj8IAP5K3D
 hxkPLHwnEJGiUHqbD5KVyuzYDSgwQsv1xTvfrV5k6KwN6oSiRNyT6Qt8by3ppQ0LqIri.kw4qJdR
 aFYkgmrkK_5xykJLnE2yikjGijnS0jsvgwNc42Ocn.Fd_EtgV2u9LJV18nxPhQYyF6.mtJ7h1Z7I
 4Qy1xfTpJQPzzDcVLiIPvlIi_rQbMMIfqO_ODX0dnCrMA8f0XBjzrEuSoRWsUkvT5Q8el4pyU.Sx
 jqsniHM1cJwIMMZG1BePtJTJVGeJ9vayJbK1AxPUOFvAxKyQ5AZtNuFC08Ns26RnGEHjtJshZiq8
 SOy6wM4j12ukM53E6vd_458XVaijSMPgMRIYUGr0d9.r6kqJr9xQl8qAxAcEJs2VHmVofMM1hl0o
 iCdb5TyRTUWXds_TQLL9cDTOJxIAHGyzUcbA8kKhROV400Ilt00SkvQjhBPwVts2BDqzhAua108k
 7zWYQ5QBBIEfpP16AdOOoaaRvAcNkpr1grweqrPYfKS0YIpH6rzb.Rfva_FS7WovrEI4yy38Gi.I
 8sy.MJ_aY1B0wph0Lwrk3wOeob2C7gKtPCIGqS5ccagJ7qk2fcB3r5.AfD68qxpdTVEaLUZaG_Nv
 qmWBYb3koT3A93Wzs4sgGmDf55hgOdMvEjcNLH5SGnY0W1FJqibmzN.XciwD0wnsF1zeQS6433Bf
 t7FMM72C1msUZ.2UiChbJusz9Ir73UuR9R6PViDQjlQ1IXhUdSMeMo241w6EMCPauzohk9qvXqnK
 hWHzA5pMm0ommaeD7kUHiI5UFkw3TADMdYBcW9RnJjmSeUGTxGqxLuT_IdtZ_rpeXdBMyXWybUHM
 GEyjdHkagMqG0VuoWeyl.ijKZzp728eCkgeBZA31VUICKt_DUc4TEKOLtwHDLwSENS2MIKfiohp.
 Wa.Xht25RzdeqCsaB6Y9XtzqCFu559E7PXWSE4rUDrQ2onEMXdZdJhJXNU213eieycpnZCHJXjPK
 bPJENJYq5dootkYjBkVftgyqgRrSk6W5Ovm7RwAmaJ5Qi.PF2nxheNbxLZZVMj9iOS6Juj98I7LA
 9Eexvnv_7XDhaorhNZgtiVa_oq2jwQdBE_Zqq9aKQj.GSJ0tRIjryZ.gfSPZH78xaSkD..bhrEXn
 OxuW81QoKcQJBL6LJSX6.08HG.X_DoraZZPhKHDtEJIfJEwODyca4iTdNiCbQHFRA4cI.yaYCUYN
 TaahGVo0qXY0UDgjd1uHCWBzxg6OdvWJnigmwu2q2nvHYJ1pT95pVs6JZDI98g2jkxkrIBVU9qOb
 Gc0v.rXdykiDft6kCBlc3HKS..Me0IInEiS.87.D_lsENtG3Fz5hsFZWoin_CXpiVO2w7lbGpqUt
 MQ5Mb1KTVoOoL7OcQcMWq2GheLtdDQs62HC4_nhqFqcFo4Yb9DMoKkY.qfa4wGWKNzjEVWf2EiBW
 kUVoSDKb0BT1sWoCbRyhw4tTn2azcLSZcHIyYk1nnMhqk5Ve3GsX1x02S3CFMdTgYn90GgSyP00A
 1xpgx.dO7jed9GA4eek4.APdgY32wVuhHu.ke__oEw97r6CNfV39VyJ8lIy4j.dL9MW6f7bBhq1H
 u7jscG9HxuOLJPMf92gTSBtYx84rFnspRcbCnbKhiLaeckhJWAic1UgHjCXPgXZKCoy0KGXmlIdu
 wuhFYaflNX1_W7qqs17TFf_SvbVSoMxCJqjxmmH1r.daaMTd3ksAAnMl3Wf7dTWLDs8oVtkegx.9
 azASxo8rzljyv4.6aXBVhtWPlwHha5OOcAvuCPoVk08_rj3cJFyUGoYZeWv.IoRRsYoCEJ2EKE3I
 QDw11LOeY_DY86jqNA6VqCLXdJXGKTQGQpEYmuWtmlPj0JF1e.cHZ.6u_bNLh_PEYjPrGvRbvK78
 QxCWJxQDoHB2yQeUOXI8nMu7_HUBRO0qHWmXArYrrRFOU1QogfnpbPH.qgfZ7zsTUqZBV_DGIafK
 pcnLWWaeMuHvODd4-
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: 6cc0e7b1-f593-4cd8-9102-8f489ef4c6b3
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 10 Oct 2025 00:25:33 +0000
Received: by hermes--production-bf1-798569fcb9-27qrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3c7b071a36dce4930d289eabdfc11d66; 
 Fri, 10 Oct 2025 00:25:31 +0000 (UTC)
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Subject: [PATCH] drm: rename drm_ioctl_flags() to drm_ioctl_get_flags() to fix
 kernel-doc name conflict
Date: Fri, 10 Oct 2025 01:25:20 +0100
Message-ID: <20251010002520.359824-1-adelodunolaoluwa@yahoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20251010002520.359824-1-adelodunolaoluwa.ref@yahoo.com>
X-Mailman-Approved-At: Fri, 10 Oct 2025 08:02:40 +0000
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

The function `drm_ioctl_flags()` defined in `drm_ioctl.c` shares the same
identifier name as the `enum drm_ioctl_flags` defined in
`drm_ioctl.h`. Although this naming overlap is perfectly valid in C —
since functions and enumerations exist in separate namespaces and do
not affect compilation or linkage — it causes a symbol collision in the
kernel-doc build system.

During `make htmldocs`, Sphinx reports the following warning:
  ./Documentation/gpu/drm-uapi:574: ./drivers/gpu/drm/drm_ioctl.c:915:
  WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
  Declaration is '.. c:function::
  bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.

This happens because kernel-doc processes both identifiers (the enum and
the function) under the same name, leading to a duplicate symbol entry
in the generated documentation index. The build system therefore treats
them as conflicting declarations, even though they represent different
entities in code.

To resolve this, the function has been renamed to
`drm_ioctl_get_flags()`, which both removes the naming collision and
better describes the function’s purpose—retrieving ioctl permission
flags associated with a given command number.

All affected references have been updated accordingly in:
  - `drivers/gpu/drm/drm_ioctl.c`
  - `drivers/gpu/drm/vmwgfx/vmwgfx_drv.c`
  - `include/drm/drm_ioctl.h`

No other symbols or behavior are modified.

Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
---
 drivers/gpu/drm/drm_ioctl.c         | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 include/drm/drm_ioctl.h             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..313e8bb7986a 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -912,7 +912,7 @@ long drm_ioctl(struct file *filp,
 EXPORT_SYMBOL(drm_ioctl);
 
 /**
- * drm_ioctl_flags - Check for core ioctl and return ioctl permission flags
+ * drm_ioctl_get_flags - Check for core ioctl and return ioctl permission flags
  * @nr: ioctl number
  * @flags: where to return the ioctl permission flags
  *
@@ -923,7 +923,7 @@ EXPORT_SYMBOL(drm_ioctl);
  * Returns:
  * True if the @nr corresponds to a DRM core ioctl number, false otherwise.
  */
-bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
+bool drm_ioctl_get_flags(unsigned int nr, unsigned int *flags)
 {
 	if (nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END)
 		return false;
@@ -935,4 +935,4 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
 	*flags = drm_ioctls[nr].flags;
 	return true;
 }
-EXPORT_SYMBOL(drm_ioctl_flags);
+EXPORT_SYMBOL(drm_ioctl_get_flags);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8ff958d119be..fa4644067d46 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1257,7 +1257,7 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
 			goto out_io_encoding;
 
 		flags = ioctl->flags;
-	} else if (!drm_ioctl_flags(nr, &flags))
+	} else if (!drm_ioctl_get_flags(nr, &flags))
 		return -EINVAL;
 
 	return ioctl_func(filp, cmd, arg);
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 171760b6c4a1..585dda7550b0 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -164,7 +164,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 /* Let drm_compat_ioctl be assigned to .compat_ioctl unconditionally */
 #define drm_compat_ioctl NULL
 #endif
-bool drm_ioctl_flags(unsigned int nr, unsigned int *flags);
+bool drm_ioctl_get_flags(unsigned int nr, unsigned int *flags);
 
 int drm_noop(struct drm_device *dev, void *data,
 	     struct drm_file *file_priv);
-- 
2.43.0

