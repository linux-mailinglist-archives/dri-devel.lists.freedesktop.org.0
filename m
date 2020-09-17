Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DBB26D9C2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4726EBA8;
	Thu, 17 Sep 2020 11:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30646EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:01:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3684AAFB8;
 Thu, 17 Sep 2020 11:02:13 +0000 (UTC)
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel@lists.freedesktop.org
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
Date: Thu, 17 Sep 2020 13:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
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
Content-Type: multipart/mixed; boundary="===============0503092373=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0503092373==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Az4blyo1wXXWiLdVbxGWE0QqiK1fbl0d6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Az4blyo1wXXWiLdVbxGWE0QqiK1fbl0d6
Content-Type: multipart/mixed; boundary="aS6FKj5haNA5ueDGyYgnNp1vqLY66xtdL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel@lists.freedesktop.org
Message-ID: <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
In-Reply-To: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>

--aS6FKj5haNA5ueDGyYgnNp1vqLY66xtdL
Content-Type: multipart/mixed;
 boundary="------------C61F687901F8935D6F2DAA71"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C61F687901F8935D6F2DAA71
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.20 um 12:05 schrieb Ilpo J=C3=A4rvinen:
> Hi,
>=20
> After upgrading kernel from 5.3 series to 5.6.16 something seems to=20
> prevent me from achieving high resolutions with the ast driver.

Are you able to build and run a test kernel?

I'm seriously considering moving ast to the SHMEM memory manager, which
would restore the higher resolutions.

If you're able to test, you need the git tree drm-tip/drm-tip and the
attached patch.

Alternatively, I've pushed all to

  https://gitlab.freedesktop.org/tzimmermann/linux/-/tree/ast-shmem

You'd have to checkout the tree and switch to the ast-shmem branch.

Please report back if that solves the issue for you.

Best regards
Thomas

>=20
> With 5.6.16:
>=20
> $ xrandr
> Screen 0: minimum 320 x 200, current 1600 x 1200, maximum 1920 x 2048
> VGA-1 connected primary 1600x1200+0+0 (normal left inverted right x axi=
s y axis) 519mm x 324mm
>    1600x1200     60.00*=20
>    1680x1050     59.95 =20
>    1280x1024     75.02    60.02 =20
>    1440x900      59.89 =20
>    1280x800      59.81 =20
>    1024x768      75.03    60.00 =20
>    800x600       75.00    60.32 =20
>    640x480       75.00    59.94 =20
>    1920x1200_60.0  59.95 =20
>=20
> If I try to change to that manually added high-res mode, I get:
> xrandr: Configure crtc 0 failed
>=20
> With 5.3 series I've this:
>=20
> Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 1920 x 2048
> VGA-1 connected primary 1920x1200+0+0 (normal left inverted right x axi=
s y axis) 519mm x 324mm
>    1920x1200     59.95*+
>    1600x1200     60.00 =20
>    1680x1050     59.95 =20
>    1280x1024     75.02    60.02 =20
>    1440x900      59.89 =20
>    1280x800      59.81 =20
>    1024x768      75.03    60.00 =20
>    800x600       75.00    60.32 =20
>    640x480       75.00    59.94 =20
>    1920x1200_60.0  59.95 =20
>=20
> As I've had issues in getting EDID reliably from the monitor, I provide=
 it=20
> on kernel command-line (the one dumped from the monitor I use). In=20
> addition, I've another workaround for past issues related to EDID which=
=20
> always adds that 1920x1200_60.0 mode but now I cannot use even it to
> enter a high-res mode.
>=20
> If you need some additional info or want me to test a patch, just let m=
e=20
> know (but some delay is expected in testing patches). Thanks.
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------C61F687901F8935D6F2DAA71
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ast-Convert-ast-to-SHMEM.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-drm-ast-Convert-ast-to-SHMEM.patch"

=46rom ea15b5d52a4538e40da9605d71ed52baa1c1cdd7 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 9 Jul 2020 14:06:43 +0200
Subject: [PATCH] drm/ast: Convert ast to SHMEM

---
 drivers/gpu/drm/ast/Kconfig      |  4 +-
 drivers/gpu/drm/ast/ast_cursor.c | 95 ++++++++------------------------
 drivers/gpu/drm/ast/ast_drv.c    |  5 +-
 drivers/gpu/drm/ast/ast_drv.h    |  8 ++-
 drivers/gpu/drm/ast/ast_main.c   |  1 -
 drivers/gpu/drm/ast/ast_mm.c     | 32 +++++++----
 drivers/gpu/drm/ast/ast_mode.c   | 75 +++++++++++++++++++------
 7 files changed, 112 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index fbcf2f45cef5..d367a90cd3de 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -2,10 +2,8 @@
 config DRM_AST
 	tristate "AST server chips"
 	depends on DRM && PCI && MMU
+	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
-	select DRM_VRAM_HELPER
-	select DRM_TTM
-	select DRM_TTM_HELPER
 	help
 	 Say yes for experimental AST GPU driver. Do not enable
 	 this driver without having a working -modesetting,
diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_c=
ursor.c
index e0f4613918ad..ad4b02967d32 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -27,79 +27,39 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
=20
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
=20
 #include "ast_drv.h"
=20
-static void ast_cursor_fini(struct ast_private *ast)
-{
-	size_t i;
-	struct drm_gem_vram_object *gbo;
-
-	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo =3D ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-	}
-}
-
-static void ast_cursor_release(struct drm_device *dev, void *ptr)
-{
-	struct ast_private *ast =3D to_ast_private(dev);
-
-	ast_cursor_fini(ast);
-}
-
 /*
  * Allocate cursor BOs and pins them at the end of VRAM.
  */
 int ast_cursor_init(struct ast_private *ast)
 {
-	struct drm_device *dev =3D &ast->base;
 	size_t size, i;
-	struct drm_gem_vram_object *gbo;
 	void __iomem *vaddr;
-	int ret;
+	u64 offset;
=20
 	size =3D roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
=20
+	vaddr =3D ast->vram + ast->vram_fb_available;
+	offset =3D ast->vram_base + ast->vram_fb_available;
+
 	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo =3D drm_gem_vram_create(dev, size, 0);
-		if (IS_ERR(gbo)) {
-			ret =3D PTR_ERR(gbo);
-			goto err_drm_gem_vram_put;
-		}
-		ret =3D drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
-		if (ret) {
-			drm_gem_vram_put(gbo);
-			goto err_drm_gem_vram_put;
-		}
-		vaddr =3D drm_gem_vram_vmap(gbo);
-		if (IS_ERR(vaddr)) {
-			ret =3D PTR_ERR(vaddr);
-			drm_gem_vram_unpin(gbo);
-			drm_gem_vram_put(gbo);
-			goto err_drm_gem_vram_put;
-		}
=20
-		ast->cursor.gbo[i] =3D gbo;
-		ast->cursor.vaddr[i] =3D vaddr;
-	}
+		if (ast->vram_fb_available < size)
+			return -ENOMEM;
=20
-	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
+		vaddr -=3D size;
+		offset -=3D size;
=20
-err_drm_gem_vram_put:
-	while (i) {
-		--i;
-		gbo =3D ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
+		ast->cursor.vaddr[i] =3D vaddr;
+		ast->cursor.offset[i] =3D offset;
+		ast->vram_fb_available -=3D size;
 	}
-	return ret;
+
+	return 0;
 }
=20
 static void update_cursor_image(u8 __iomem *dst, const u8 *src, int widt=
h, int height)
@@ -169,7 +129,6 @@ static void update_cursor_image(u8 __iomem *dst, cons=
t u8 *src, int width, int h
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)=

 {
 	struct drm_device *dev =3D &ast->base;
-	struct drm_gem_vram_object *gbo;
 	int ret;
 	void *src;
 	void __iomem *dst;
@@ -178,15 +137,13 @@ int ast_cursor_blit(struct ast_private *ast, struct=
 drm_framebuffer *fb)
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
=20
-	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
-
-	ret =3D drm_gem_vram_pin(gbo, 0);
+	ret =3D drm_gem_shmem_pin(fb->obj[0]);
 	if (ret)
 		return ret;
-	src =3D drm_gem_vram_vmap(gbo);
+	src =3D drm_gem_shmem_vmap(fb->obj[0]);
 	if (IS_ERR(src)) {
 		ret =3D PTR_ERR(src);
-		goto err_drm_gem_vram_unpin;
+		goto err_drm_gem_shmem_unpin;
 	}
=20
 	dst =3D ast->cursor.vaddr[ast->cursor.next_index];
@@ -194,13 +151,13 @@ int ast_cursor_blit(struct ast_private *ast, struct=
 drm_framebuffer *fb)
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
=20
-	drm_gem_vram_vunmap(gbo, src);
-	drm_gem_vram_unpin(gbo);
+	drm_gem_shmem_vunmap(fb->obj[0], src);
+	drm_gem_shmem_unpin(fb->obj[0]);
=20
 	return 0;
=20
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
+err_drm_gem_shmem_unpin:
+	drm_gem_shmem_unpin(fb->obj[0]);
 	return ret;
 }
=20
@@ -217,15 +174,7 @@ static void ast_cursor_set_base(struct ast_private *=
ast, u64 address)
=20
 void ast_cursor_page_flip(struct ast_private *ast)
 {
-	struct drm_device *dev =3D &ast->base;
-	struct drm_gem_vram_object *gbo;
-	s64 off;
-
-	gbo =3D ast->cursor.gbo[ast->cursor.next_index];
-
-	off =3D drm_gem_vram_offset(gbo);
-	if (drm_WARN_ON_ONCE(dev, off < 0))
-		return; /* Bug: we didn't pin the cursor HW BO to VRAM. */
+	u64 off =3D ast->cursor.offset[ast->cursor.next_index];
=20
 	ast_cursor_set_base(ast, off);
=20
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.=
c
index f0b4af1c390a..85748ef869d3 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -33,7 +33,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_probe_helper.h>
=20
 #include "ast_drv.h"
@@ -62,7 +62,8 @@ static struct drm_driver ast_driver =3D {
 	.minor =3D DRIVER_MINOR,
 	.patchlevel =3D DRIVER_PATCHLEVEL,
=20
-	DRM_GEM_VRAM_DRIVER
+	.gem_create_object =3D drm_gem_shmem_create_object_cached,
+	DRM_GEM_SHMEM_DRIVER_OPS
 };
=20
 /*
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.=
h
index 467049ca8430..d1fcbf7d8026 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -129,9 +129,15 @@ struct ast_private {
=20
 	int fb_mtrr;
=20
+	void __iomem	*vram;
+	unsigned long	vram_base;
+	unsigned long	vram_size;
+	unsigned long	vram_fb_available;
+
 	struct {
-		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
+		struct drm_gem_shmem_object *gbo[AST_DEFAULT_HWC_NUM];
 		void __iomem *vaddr[AST_DEFAULT_HWC_NUM];
+		u64 offset[AST_DEFAULT_HWC_NUM];
 		unsigned int next_index;
 	} cursor;
=20
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_mai=
n.c
index 77066bca8793..2e905d827df8 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -32,7 +32,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
=20
 #include "ast_drv.h"
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 8392ebde504b..6a5fbba52441 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -28,7 +28,6 @@
=20
 #include <linux/pci.h>
=20
-#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
=20
@@ -86,22 +85,33 @@ static void ast_mm_release(struct drm_device *dev, vo=
id *ptr)
 int ast_mm_init(struct ast_private *ast)
 {
 	struct drm_device *dev =3D &ast->base;
+	resource_size_t start, len;
 	u32 vram_size;
 	int ret;
=20
-	vram_size =3D ast_get_vram_size(ast);
+	/* BAR 0 is VRAM */
+	start =3D pci_resource_start(dev->pdev, 0);
+	len =3D pci_resource_len(dev->pdev, 0);
+
+	arch_io_reserve_memtype_wc(start, len);
+	ast->fb_mtrr =3D arch_phys_wc_add(start, len);
=20
-	ret =3D drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
-				    vram_size);
-	if (ret) {
-		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
-		return ret;
+	ast->vram =3D ioremap(start, len);
+	if (!ast->vram) {
+		ret =3D -ENOMEM;
+		goto err_arch_phys_wc_del;
 	}
=20
-	arch_io_reserve_memtype_wc(pci_resource_start(dev->pdev, 0),
-				   pci_resource_len(dev->pdev, 0));
-	ast->fb_mtrr =3D arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
-					pci_resource_len(dev->pdev, 0));
+	vram_size =3D ast_get_vram_size(ast);
+
+	ast->vram_base =3D start;
+	ast->vram_size =3D vram_size;
+	ast->vram_fb_available =3D vram_size;
=20
 	return drmm_add_action_or_reset(dev, ast_mm_release, NULL);
+
+err_arch_phys_wc_del:
+	arch_phys_wc_del(ast->fb_mtrr);
+	arch_io_free_memtype_wc(start, len);
+	return ret;
 }
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mod=
e.c
index 834a156e3a75..7e3293e56caa 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -36,9 +36,12 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -563,6 +566,27 @@ static int ast_primary_plane_helper_atomic_check(str=
uct drm_plane *plane,
 	return 0;
 }
=20
+static void ast_handle_damage(struct ast_private *ast,
+			      struct drm_framebuffer *fb,
+			      struct drm_rect *clip)
+{
+	struct drm_device *dev =3D &ast->base;
+	void *vmap;
+
+	vmap =3D drm_gem_shmem_vmap(fb->obj[0]);
+	if (drm_WARN_ON(dev, !vmap))
+		return; /* BUG: SHMEM BO should always be vmapped */
+
+	drm_fb_memcpy_dstclip(ast->vram, vmap, fb, clip);
+
+	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+
+	ast_set_offset_reg(ast, fb);
+	ast_set_start_address_crt1(ast, (u32)0);
+
+	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+}
+
 static void
 ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
@@ -570,10 +594,12 @@ ast_primary_plane_helper_atomic_update(struct drm_p=
lane *plane,
 	struct drm_device *dev =3D plane->dev;
 	struct ast_private *ast =3D to_ast_private(dev);
 	struct drm_plane_state *state =3D plane->state;
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
 	struct drm_framebuffer *fb =3D state->fb;
 	struct drm_framebuffer *old_fb =3D old_state->fb;
+	struct drm_rect damage;
+
+	if (!fb)
+		return;
=20
 	if (!old_fb || (fb->format !=3D old_fb->format)) {
 		struct drm_crtc_state *crtc_state =3D state->crtc->state;
@@ -584,15 +610,8 @@ ast_primary_plane_helper_atomic_update(struct drm_pl=
ane *plane,
 		ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info);
 	}
=20
-	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
-	gpu_addr =3D drm_gem_vram_offset(gbo);
-	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
-		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
-
-	ast_set_offset_reg(ast, fb);
-	ast_set_start_address_crt1(ast, (u32)gpu_addr);
-
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+		ast_handle_damage(ast, fb, &damage);
 }
=20
 static void
@@ -605,8 +624,7 @@ ast_primary_plane_helper_atomic_disable(struct drm_pl=
ane *plane,
 }
=20
 static const struct drm_plane_helper_funcs ast_primary_plane_helper_func=
s =3D {
-	.prepare_fb =3D drm_gem_vram_plane_helper_prepare_fb,
-	.cleanup_fb =3D drm_gem_vram_plane_helper_cleanup_fb,
+	.prepare_fb =3D drm_gem_fb_prepare_fb,
 	.atomic_check =3D ast_primary_plane_helper_atomic_check,
 	.atomic_update =3D ast_primary_plane_helper_atomic_update,
 	.atomic_disable =3D ast_primary_plane_helper_atomic_disable,
@@ -641,6 +659,10 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane =
*plane,
 	if (!crtc || !fb)
 		return 0;
=20
+	ret =3D drm_gem_fb_prepare_fb(plane, new_state);
+	if (ret)
+		return ret;
+
 	ast =3D to_ast_private(plane->dev);
=20
 	ret =3D ast_cursor_blit(ast, fb);
@@ -1073,9 +1095,28 @@ ast_mode_config_helper_funcs =3D {
 	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
 };
=20
+static enum drm_mode_status
+ast_mode_config_mode_valid(struct drm_device *dev,
+			   const struct drm_display_mode *mode)
+{
+	static const unsigned long max_bpp =3D 4; /* DRM_FORMAT_XRGB8888 */
+	struct ast_private *ast =3D to_ast_private(dev);
+	unsigned long fbsize, fbpages, max_fbpages;
+
+	max_fbpages =3D (ast->vram_size) >> PAGE_SHIFT;
+
+	fbsize =3D mode->hdisplay * mode->vdisplay * max_bpp;
+	fbpages =3D DIV_ROUND_UP(fbsize, PAGE_SIZE);
+
+	if (fbpages > max_fbpages)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs ast_mode_config_funcs =3D {
-	.fb_create =3D drm_gem_fb_create,
-	.mode_valid =3D drm_vram_helper_mode_valid,
+	.fb_create =3D drm_gem_fb_create_with_dirty,
+	.mode_valid =3D ast_mode_config_mode_valid,
 	.atomic_check =3D drm_atomic_helper_check,
 	.atomic_commit =3D drm_atomic_helper_commit,
 };
@@ -1097,7 +1138,7 @@ int ast_mode_config_init(struct ast_private *ast)
 	dev->mode_config.min_width =3D 0;
 	dev->mode_config.min_height =3D 0;
 	dev->mode_config.preferred_depth =3D 24;
-	dev->mode_config.prefer_shadow =3D 1;
+	dev->mode_config.prefer_shadow =3D 0;
 	dev->mode_config.fb_base =3D pci_resource_start(dev->pdev, 0);
=20
 	if (ast->chip =3D=3D AST2100 ||
--=20
2.28.0


--------------C61F687901F8935D6F2DAA71--

--aS6FKj5haNA5ueDGyYgnNp1vqLY66xtdL--

--Az4blyo1wXXWiLdVbxGWE0QqiK1fbl0d6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jQhAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOveAgAm5sZTVTWadI7iuR3sY0/d71s+O1o
jlu64a/Dv48jF87mkAHd0S1NrfD+SccP91L5y6KGyZeMHCHhjBwJsJDhpDH2BFxs
vHeulkfxMxKZrR+zUq5rZhA5d7HGNgRJXQ0gLutbkib7CjtcuOly7Pl9zGrAR15K
BC759dVaMpmfU/2bacIgSfrGYYOxcSD/AOD/MbboWyVpf+nV9KdHIRVOy4EBKLtn
PVH1Kj3CO5K6bRwc7UGh9dE4VR0Da8RvPhU2A8qjCuGs8QOBxIZjJ72Xf2E7CxAC
v3d+PFj8E+TqId2Jz7nwRT5SdyqussX8OWgpVCPZ7Rhi+Sp5m2amv6RI7A==
=yRSy
-----END PGP SIGNATURE-----

--Az4blyo1wXXWiLdVbxGWE0QqiK1fbl0d6--

--===============0503092373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0503092373==--
