Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 175271CB1FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 16:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017C16E226;
	Fri,  8 May 2020 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669BC6E226
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 14:41:11 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mr9OA-1ikEYX0EAI-00oG15; Fri, 08 May 2020 16:40:51 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Ben Skeggs <bskeggs@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
Date: Fri,  8 May 2020 16:40:09 +0200
Message-Id: <20200508144017.3501418-2-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200508144017.3501418-1-arnd@arndb.de>
References: <20200508144017.3501418-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JWVQOgOnHysetYBnSk3CKrV5svFn5O5bRyqndsTcxkwhAVFX33K
 8QbP8gDLWPxaMFNAgd7F0Cl5FkzbK7UMEJIFy0zMaVqeRYEiRnApjKD442XntX1liV7tU8u
 +v58YzETQ9SV2Hp+cHqKt2yBzRbfWwCIKA6DW0+yHZ5CaJ628eVpggV+QV31QJGmJnChH1i
 vbw4Va8hrFgS/CW9ROAkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VzDQJ1Yexdc=:rlZgpEK/dFkEh64B04UQUI
 g+x10OM+ECzQzdguOSFhigUHOMdlbZFiI08PVo16y3npp77DmEsUma/AvaHcceM2m5b3I2o7L
 TNCu82db3goJxFTWsXeuL1ZexwTp0gb5JWPrscj83fsTSOZ/18VLYpONC2FctsWw9C/ZTKzgS
 K0HbBohnOvCR3/SHRUv1n1sX17ZLm6sZ7onWo54A55647knTetrzKq+aimZ3A3fEN/f1JRi2q
 Fz7PefVUE5BFdLOZfKP5PVlfwCyFKD6ePO31sczeohRvfZrfip4z6j5azwY53UD8A2la9VDMl
 yQ+zJZVhiTIEPExvx2yHPt8Gb4vD9nklM6omlVYpu0t7d4EINmaSrURvpa8jZGeYVMzuniupd
 GCC0Ui4hsMVN4O+BGGp4mzzSTdHxZNuUpUfZalKuY98GENhMiAjkN8T1/WrzIzIlYLjdGtodz
 i4ar0/wiV5tIOczUPF0P9sKJGaDYgVsNGNmzm403LzNNJzt1oxw6UMUJE4iRQ1Akef7DSocGP
 TPO/xZ/dimwT8pDNNP6hqgqxRCEPgk43rCb1CWF2rYxdcoPcQLVLwDgWV1VH9AhMabNUbojSm
 G8HmBR+fcLs6jSPX8Ls6tidrpGP6nsyMSNMLDV8lfryssOazCoAdn2ZG4RZJ1/o5BEegZ8I9B
 80CzFDRI32YAgnT9uC1xB8szTuFOrz1fc+/kgtYCqSk3qr4O9buMmeCmRGHuM+5J8UOGznTD8
 0YZ3ZZkh/Y2ymPOhW2NNuVL+0rXAFSSaH49WsYDVcyPjUerW4YuaddC4lv6dBUSeTDyQY4nLK
 NV8OCikn7NeFF6Uk7/uPXIkQYE5CSkZ9+DUpSoA+hw2rOqe68k=
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, nouveau@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_DEVICE_PRIVATE cannot be selected in configurations
without ZONE_DEVICE:

WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
  Depends on [n]: ZONE_DEVICE [=n]
  Selected by [y]:
  - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && DRM_NOUVEAU [=y] && MMU [=y] && STAGING [=y]
kernel/resource.c:1653:28: error: use of undeclared identifier 'PA_SECTION_SHIFT'
        size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
                                  ^
kernel/resource.c:1654:48: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'

Add a dependency for Nouveau to avoid broken randconfig builds.

Fixes: d2c63df2242e ("mm/hmm: make CONFIG_DEVICE_PRIVATE into a select")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index af5793f3e7c2..996ec5475908 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -87,6 +87,7 @@ config DRM_NOUVEAU_BACKLIGHT
 config DRM_NOUVEAU_SVM
 	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
 	depends on DRM_NOUVEAU
+	depends on ZONE_DEVICE
 	depends on MMU
 	depends on STAGING
 	select DEVICE_PRIVATE
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
