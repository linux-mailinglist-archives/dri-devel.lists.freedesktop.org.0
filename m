Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482261E4413
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 15:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBF68977A;
	Wed, 27 May 2020 13:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8707289688;
 Wed, 27 May 2020 13:43:01 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3bjH-1ivhXw2f9X-010grN; Wed, 27 May 2020 15:42:55 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] nouveau: add fbdev dependency
Date: Wed, 27 May 2020 15:42:23 +0200
Message-Id: <20200527134254.854672-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:UwRS52SKomS1dGxg/Cr8izduWX8ZD4LmV2z+vHIfJD0wpmnsWtB
 QsS+qAKdfR75PBtRiCiim1nlfytCKTLhu6JCbh4PrnV+FnERUpJOUQRYyQq4RJp3C9DiNIG
 0xVNyeytj45f/FlCXkUhpuZF3JKkcmVsifwuOG52sLtCSYd5ofSlkPSaA8yVL02/yhRHvp5
 BNBjDEjhB8nkcGG87ChpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sZgzWgmPFv0=:z9Y1bGS9xTuXxA3csoNcb1
 UZYKzg8vEU0M/l7zTe/VPttt95Av/k+Yn3Q41pSeJcoDFb4gSzkWi9fOLhOZjjGHkOngTp2fQ
 NUt+G+8tVnTxUc7wH5ZxMhEciPR3RYCdNj9JAYH3Lo029bfAxiP5M1XMbPB8hecIiFDE5qh1x
 qX4A/NCKQ62qjL8GSFCtI4jaeFzxkD4Mt+WgS5TG8RW7qRmdUZq7+apRDedRVIxUr58XA3L0y
 8YZEzAR2nRfFGEgEGdVVaYEyjE+mdbPfeVQ0Hdzy/OvS6XXiy/wI9+SVnL6T76Qf6RUmM5wU2
 Vsycwf9eT9Yud5Qs0UL4MMs0cku4A88vyFFDoh5UG/D7rxBiYRapgml5ng77WQ1QERcmZUx+s
 KpS7DtQaVaq8ZffeajcOz2xzFgdbiCa2RYEzZs0bKoH6CB1yOjjNWg9DfESeZ8XgsL9razQEx
 h90Bo5yR/JzCwf4bRtQFKQ1ejV4vw8GMycx1xX9ehMX7W1hqa4HWCSo4P/iLEWMPlGU9EITcD
 HNIjyH5VHvidwy83N9lxY4PUmvlPYXUXcSy3N1zgzpO/pTZzJ+y6IxMpxCpcwNvjlnF//qEvr
 747xwiisizEF+y+hTyBY10KDkxab0p7xor48HZ+5yZHP/sXer85v75hEVgZH3Rom6ykdGDeZ+
 EdXThkeQRUyiKh2u+IJIIRibInnf1NMjhBuZgTioJXngiNdzomYSmmvaIcXC2PqqO8jKopUfU
 KZKDByehOUjtvpO6Ev5i0Hg9ZV7G90Au1WN00d+bbW+HZc9Sy9rHhbSlo5hojoyiUe/Rf9N+Q
 J8N30rKh6plh6ZN/IZ+e+3SdoyfSH1XWuriqB1MdUfNDLSw2VI=
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling directly into the fbdev stack only works when the
fbdev layer is built into the kernel as well, or both are
loadable modules:

drivers/gpu/drm/nouveau/nouveau_drm.o: in function `nouveau_drm_probe':
nouveau_drm.c:(.text+0x1f90): undefined reference to `remove_conflicting_pci_framebuffers'

The change seems to have been intentional, so add an explicit
dependency here but allow it to still be compiled if FBDEV
is completely disabled.

Fixes: 2dd4d163cd9c ("drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/Kconfig       | 1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 980ed09bd7f6..8c640f003358 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -18,6 +18,7 @@ config DRM_NOUVEAU
 	select THERMAL if ACPI && X86
 	select ACPI_VIDEO if ACPI && X86
 	select SND_HDA_COMPONENT if SND_HDA_CORE
+	depends on FBDEV || !FBDEV
 	help
 	  Choose this option for open-source NVIDIA support.
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index eb10c80ed853..e8560444ab57 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -697,7 +697,8 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	nvkm_device_del(&device);
 
 	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
+	if (IS_ENABLED(CONFIG_FBDEV))
+		ret = remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
 	if (ret)
 		return ret;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
