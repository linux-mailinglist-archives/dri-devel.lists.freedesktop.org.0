Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963055A2B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A1A10F309;
	Fri, 24 Jun 2022 20:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A5C10F309
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102789;
 bh=tmsg0U7s2Ayr2ezAuXpMITZ8PKrawfxOyaDVMh+Y1nM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IvM9Nh0YpxITUAvSzehtKi59yOI56mK0mIpJH3o+ienhst2VHfYsWEjjhns+xXQnL
 1j33A0guPr2s2OVvDUIrG8sfuVNoHVBqKTRHa/YLW8e6ubvS46ORzaCz326DnFd/mz
 VSXWIky9O4yhBme5MUAJXwGMtN4YuNjR+c3zLiQQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MaJ7v-1o8Ueu1JDB-00WHyZ; Fri, 24 Jun 2022 22:28:07 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/28] drm/via: Add via_drv.c
Date: Fri, 24 Jun 2022 15:26:16 -0500
Message-Id: <20220624202633.3978-12-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fogpkYZcitppPqn3wppTbkzAhhEpW+2+0gTBvaAr7c7DXr6XcpB
 2CD5yy4a6D9I0oDIUtQ83fV26JDoaOo9UQZ/lOb2FxW45t3RViYPoHFayWnPrX8CSzzeMjj
 XQouN4tPd4nhcdmX094XjfpvmxIjBwMA9sVwEK1J7oLxWKtKF601AVFUjTi3xbcawRsA0Ii
 eMXlx+fJ2Uq5saWUQNg4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SQimEBL7eKw=:5Kbh3VdYdHOO7c4YadX+jr
 eHM5NTJ79M/x4qcCMGR3XbHkLuNKZw//ffDqX15Tfgi1vhXGLbgOiEiyjtmePI8M8nPtaiASO
 /IwTPMct6hKULadN+rJHPY+8Bg3U4KJ4sLwP0rCNY1m6bnllRWfkqDsVAL7zsRzbA5m/3tb3X
 59dguB/W/RnqBxwSuKNuVcIs2vcYGIkCXjFbgeMj72VCOCC5olLxa/HFgc4RKdxhBBYqhA8Wn
 usVTUQsEz/L8myMsjp1ej+0xORlaYd/17QSrv0qQKwEMGxDPpfKi0Hw+2GnuqCDoM+b3X+b1b
 uoMvzrOBgFrt2jQjl2h0Ks2iTUCO3Zrjpxr0/c3qLcsDoKlQg/6DSgxt7YFCAZ0CwgtjYCklT
 Do+hqEVbdR0h3lSxMxEi+DNsFjWHfiny4r5dyXmNr7bJQEXJj5KdoXRyrtu8sGptpP4ybWe4L
 h3NfQ+WF2R91HhPomJcvfpnsXgooJJKc+n0aJQ8PqOp8Kuf4h4eZYcuT4YairthUaO5qooBis
 PfypaDvMtP235tdmBjpNgXSSajixWAoCKKMbU2GbbZvljw5UZJLjeDDNH/x+olRWpcJOI3tXN
 xEI5soIM2hZn935M1ugbseql/ahJn3Erp2UllsI8bsqSqm05lTAo7j78d9hkktBjOFOc6SCQF
 oPCRSQsJD7uBmj3JpixApJjdkH5cqaEqYZRF/safalWSk8pUk5Eeq4nZaiUx4pSEVTYpDb5KB
 mw/6AIm7GCtYpCBlb8pWDS7Tu59fba6vsV2NkLMghZYLqqpeP4rjiLOm9qyERtRLDpN2ZQXlH
 IDFfuw+i/5RTDTW3xQaYIrrF/AKpJ1iXDsvGLsvsEVfoykfTo2hq5k9XNmnAjW2rU2PI950XD
 Bv9lsLz+nI4X0dDWwmapnhDziEW+WARJK9pYtaIsR5rN6yXasNdWuzirRtD4xK/AKu/Qzq7iD
 n6JmkL0o0LIsaPgHhdgfWNYD7Tsz5rEDS+IWL4XplJM9PtHPWNGHsVOda6lAgxney97lWrbRa
 q8ED7D7EgLY0UGZr6YPQ/DdpoMlulc/srDaSUjWyYHyrF8aoT13HC1vB2eTFHOdrNlu47BigU
 r7dQnKNBASdIQMiMElMEL1fCL/4OtIrJTslYHKDwQoEBw+3kjocWiKYcw==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Note that GPL is chosen as a license type.  This is due to via_i2c.c
being GPL based.  Everything else is MIT license based.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_drv.c | 313 ++++++++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_drv.c

diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
new file mode 100644
index 000000000000..25d7967c938b
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_drv.c
@@ -0,0 +1,313 @@
+/*
+ * Copyright =C2=A9 2019-2021 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_pciids.h>
+#include <drm/drm_prime.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+
+#include "via_drv.h"
+
+
+extern const struct drm_ioctl_desc via_driver_ioctls[];
+
+/*
+ * For now, this device driver will be disabled, unless the
+ * user decides to enable it.
+ */
+int via_modeset =3D 0;
+
+MODULE_PARM_DESC(modeset, "Enable DRM device driver "
+				"(Default: Disabled, "
+				"0 =3D Disabled,"
+				"1 =3D Enabled)");
+module_param_named(modeset, via_modeset, int, 0400);
+
+static int via_driver_open(struct drm_device *dev,
+					struct drm_file *file_priv)
+{
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_driver_postclose(struct drm_device *dev,
+					struct drm_file *file_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_driver_lastclose(struct drm_device *dev)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	drm_fb_helper_lastclose(dev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static int via_driver_dumb_create(struct drm_file *file_priv,
+					struct drm_device *dev,
+					struct drm_mode_create_dumb *args)
+{
+	struct ttm_buffer_object *ttm_bo;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_bo *bo;
+	uint32_t handle, pitch;
+	uint64_t size;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * Calculate the parameters for the dumb buffer.
+	 */
+	pitch =3D args->width * ((args->bpp + 7) >> 3);
+	size =3D pitch * args->height;
+
+	ret =3D via_bo_create(dev, &dev_priv->bdev, size,
+				ttm_bo_type_device, TTM_PL_VRAM, false, &bo);
+	if (ret) {
+		goto exit;
+	}
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	ret =3D drm_gem_handle_create(file_priv, &ttm_bo->base, &handle);
+	drm_gem_object_put(&ttm_bo->base);
+	if (ret) {
+		via_bo_destroy(bo, false);
+		goto exit;
+	}
+
+	args->handle =3D handle;
+	args->pitch =3D pitch;
+	args->size =3D size;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_driver_dumb_map_offset(struct drm_file *file_priv,
+						struct drm_device *dev,
+						uint32_t handle,
+						uint64_t *offset)
+{
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+	struct via_bo *bo;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	gem =3D drm_gem_object_lookup(file_priv, handle);
+	if (!gem) {
+		ret =3D -ENOENT;
+		goto exit;
+	}
+
+	ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+	bo =3D to_ttm_bo(ttm_bo);
+	*offset =3D drm_vma_node_offset_addr(&ttm_bo->base.vma_node);
+
+	drm_gem_object_put(gem);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const struct file_operations via_driver_fops =3D {
+	.owner		=3D THIS_MODULE,
+	.open		=3D drm_open,
+	.release	=3D drm_release,
+	.unlocked_ioctl =3D drm_ioctl,
+	.mmap		=3D drm_gem_mmap,
+	.poll		=3D drm_poll,
+	.llseek		=3D noop_llseek,
+};
+
+static struct drm_driver via_driver =3D {
+	.driver_features =3D DRIVER_GEM |
+				DRIVER_MODESET |
+				DRIVER_ATOMIC,
+	.open =3D via_driver_open,
+	.postclose =3D via_driver_postclose,
+	.lastclose =3D via_driver_lastclose,
+	.gem_prime_mmap =3D drm_gem_prime_mmap,
+	.dumb_create =3D via_driver_dumb_create,
+	.dumb_map_offset =3D via_driver_dumb_map_offset,
+	.ioctls =3D via_driver_ioctls,
+	.fops =3D &via_driver_fops,
+	.name =3D DRIVER_NAME,
+	.desc =3D DRIVER_DESC,
+	.date =3D DRIVER_DATE,
+	.major =3D DRIVER_MAJOR,
+	.minor =3D DRIVER_MINOR,
+	.patchlevel =3D DRIVER_PATCHLEVEL,
+};
+
+static struct pci_device_id via_pci_table[] =3D {
+	viadrv_PCI_IDS,
+};
+
+MODULE_DEVICE_TABLE(pci, via_pci_table);
+
+static int via_pci_probe(struct pci_dev *pdev,
+				const struct pci_device_id *ent)
+{
+	struct drm_device *dev;
+	struct via_drm_priv *dev_priv;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ret =3D drm_aperture_remove_conflicting_pci_framebuffers(pdev,
+								&via_driver);
+	if (ret) {
+		goto exit;
+	}
+
+	ret =3D pci_enable_device(pdev);
+	if (ret) {
+		goto exit;
+	}
+
+	dev_priv =3D devm_drm_dev_alloc(&pdev->dev,
+					&via_driver,
+					struct via_drm_priv,
+					dev);
+	if (IS_ERR(dev_priv)) {
+		ret =3D PTR_ERR(dev_priv);
+		goto exit;
+	}
+
+	dev =3D &dev_priv->dev;
+
+	pci_set_drvdata(pdev, dev);
+
+	ret =3D via_drm_init(dev);
+	if (ret) {
+		goto error_disable_pci;
+	}
+
+	ret =3D drm_dev_register(dev, ent->driver_data);
+	if (ret) {
+		goto error_disable_pci;
+	}
+
+	drm_fbdev_generic_setup(dev, 32);
+	goto exit;
+error_disable_pci:
+	pci_disable_device(pdev);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_pci_remove(struct pci_dev *pdev)
+{
+	struct drm_device *dev =3D pci_get_drvdata(pdev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_drm_fini(dev);
+	drm_dev_unregister(dev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct dev_pm_ops via_dev_pm_ops =3D {
+	.suspend	=3D via_dev_pm_ops_suspend,
+	.resume		=3D via_dev_pm_ops_resume,
+};
+
+static struct pci_driver via_pci_driver =3D {
+	.name		=3D DRIVER_NAME,
+	.id_table	=3D via_pci_table,
+	.probe		=3D via_pci_probe,
+	.remove		=3D via_pci_remove,
+	.driver.pm	=3D &via_dev_pm_ops,
+};
+
+static int __init via_init(void)
+{
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if ((via_modeset =3D=3D -1) &&
+		(drm_firmware_drivers_only())) {
+		via_modeset =3D 0;
+	}
+
+	if (!via_modeset) {
+		ret =3D -EINVAL;
+		goto exit;
+	}
+
+	via_driver.num_ioctls =3D via_driver_num_ioctls;
+
+	ret =3D pci_register_driver(&via_pci_driver);
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void __exit via_exit(void)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!via_modeset) {
+		goto exit;
+	}
+
+	pci_unregister_driver(&via_pci_driver);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+module_init(via_init);
+module_exit(via_exit);
+
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
=2D-
2.35.1

