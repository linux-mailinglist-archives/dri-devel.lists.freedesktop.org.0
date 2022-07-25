Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC0058087B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B741810F664;
	Mon, 25 Jul 2022 23:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00AA10F5F9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793186;
 bh=S+KvEmkn4PCyk8jAe64dc9p8DogM7uXqu7IxXjgMIl0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=InTFX2gn6E4oQv96BaubIU5ypmiO2K/OLk/4xl1NAW0+yZfbsvkIBr8grYkcAWooE
 eGCjkK9TdaF9NXV/hDXCvhDxK2v7RWjOHobTR7ztRVoY/JlzIx4Va5r21yNspLKPit
 yd7KS49syIKQBNVtPqN4WYwEUTdrda/ARk+5+obg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N7zBR-1nT5zm3Fqt-014zlD; Tue, 26 Jul 2022 01:53:06 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/32] drm/via: Add via_drv.c
Date: Mon, 25 Jul 2022 16:51:07 -0700
Message-Id: <20220725235127.20433-13-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fy0tr+9i1VB+QrpKGMrwTCN8JI2R1UpQ3+YUThe2kRgR1wRjT//
 ALIt985KDrK9zzjXt41LcYNTwM3s5ATOufEPXJer7cEd3+g/uUq3LqylOJmurzD1ASSWTre
 pLxFJYoVOz9ouGPEHtxzTWNasupZpXYN+GyplOt4SDWrxfdj2YRB/1d77mKG78NY/paOQzd
 MljCJMs0Ok2wAtu3wU7gA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Uw6+OWPv9c=:S7SW80BZGLFX3LjBcb2wfJ
 cCY70BYjodoTUrB6U0pXvwhyGI/DYeV9CyAxQn0zU+B3gklOJMhDEppXKo3bNbMfB16+ZkPnu
 23Y8o8d6V8UUCxCtYIzkVibo0xLzZTo3o1AreqXZOd8EGONs0/Ff7EHwafo08WjMOF2VUlIZy
 MSwg82Gxap7dEiYc+qMAWfZ4kYid31cclJd7sxMhfyq3C4nuoo4lv73Po/hIfd4yMUU7Y7oTk
 LWMrw0jVhkEvYWfX/Z144W1Oj0ESZXuDuPk2kM7bHDDQy4H6xtDpxg/ToUqhYJ6ZQ8Thi+GOV
 awLicji83ljYNq4RVVmQnsVMmIyN83vLo9PWY95DAxEVdSeeXX4Dv6fR8g3o4MRJBwxU4N+s1
 Xs6tLB4Mey7f2IWhfaLqB4KEBhoQusOxrDXPrWe+BavduLP0J0VONpdYQ6djt2f3gcTzIEn2h
 hpUMM/P4mCireg0+zrI5mZ8ppvIxqM0LZxIjtFJUanfNlWLbqkDHyup32ibejgj4tG4Tvz5dN
 1KAPP3MbXUkcY4CK0i6hMeBjqRFDw/bicm+mG0QPLEY0z8x+RKqI/IlCxPTOjGt+mYu4ZxnY9
 Eyqby6291KEcH/UVyHDtqdUc3EbybenwvGU41NxXpJvjFP7BqABOzz4+vAxIoDsI/o0WwJJjc
 S56G8Swmc+LZUMM+oK5tM5PaeQLEEwe7a0bcU1CLNY1jeH2CXaxKsE8XhgoSyseD8+CY0ExcF
 K1DZB+JQqFKQKd04xX+bZCXnhYAURk+cvL0Svj9nwsRNf8zQrH4tTjTAvbmMO0wXOADl0HaDx
 /j8uDljWWnknD14PwzSq+nfwAoFHsG7FobHfA5KeTW90lCH9Fznp9sH2/MvTtgfyNja+aq2Sg
 eDSlf1erS5aSNXAhoA30z6lMxSljbjFobb4lo9Lwxr8xvWnTrXjzO5BCMyhG4ZPXUMckQUBQq
 kmXnLPwrFFeJQ1gexdGQMLtg7muqVWwdEcaUrZESvMumtkVSSEPCTYPtd6655PqQIQXH8BJYn
 kE4t0mlZGSU1XkRIbtkxnx0hF8hh/m9CA2P/SRrfFljuAlKTqH5zFwlp1Wk+dUcvYebEY5jjZ
 Zd7NCHEl5l2rgvXbbofhzXZrijEdXTgLMuXGDOoV5ySNaPQN3kffszJeg==
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
and via_pll.c being GPL based.  Everything else is MIT license based.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_drv.c | 336 ++++++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_drv.c

diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
new file mode 100644
index 000000000000..c569649cb8b1
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_drv.c
@@ -0,0 +1,336 @@
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
+#include <uapi/drm/via_drm.h>
+
+#include "via_drv.h"
+
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
+static const struct drm_ioctl_desc via_driver_ioctls[] =3D {
+	DRM_IOCTL_DEF_DRV(VIA_GEM_CREATE, via_gem_create_ioctl, DRM_AUTH | DRM_U=
NLOCKED),
+	DRM_IOCTL_DEF_DRV(VIA_GEM_MAP, via_gem_map_ioctl, DRM_AUTH | DRM_UNLOCKE=
D),
+	DRM_IOCTL_DEF_DRV(VIA_GEM_UNMAP, via_gem_unmap_ioctl, DRM_AUTH | DRM_UNL=
OCKED),
+};
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
+	.open =3D via_driver_open,
+	.postclose =3D via_driver_postclose,
+	.lastclose =3D via_driver_lastclose,
+
+	.gem_prime_mmap =3D drm_gem_prime_mmap,
+
+	.dumb_create =3D via_driver_dumb_create,
+	.dumb_map_offset =3D via_driver_dumb_map_offset,
+
+	.major =3D DRIVER_MAJOR,
+	.minor =3D DRIVER_MINOR,
+	.patchlevel =3D DRIVER_PATCHLEVEL,
+	.name =3D DRIVER_NAME,
+	.desc =3D DRIVER_DESC,
+	.date =3D DRIVER_DATE,
+
+	.driver_features =3D DRIVER_GEM |
+				DRIVER_MODESET |
+				DRIVER_ATOMIC,
+
+	.ioctls =3D via_driver_ioctls,
+	.num_ioctls =3D ARRAY_SIZE(via_driver_ioctls),
+
+	.fops =3D &via_driver_fops,
+};
+
+static struct pci_device_id via_pci_table[] =3D {
+	{0x1106, 0x3122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x7205, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3344, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3118, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3343, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3371, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x3157, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x1122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x5122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0x1106, 0x7122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0, 0, 0}
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

