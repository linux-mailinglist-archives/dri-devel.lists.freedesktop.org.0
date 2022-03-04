Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BA4CDB4A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32E710F196;
	Fri,  4 Mar 2022 17:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1756 seconds by postgrey-1.36 at gabe;
 Fri, 04 Mar 2022 17:50:10 UTC
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C3110F196;
 Fri,  4 Mar 2022 17:50:10 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K9F4N3svmz9sT7;
 Fri,  4 Mar 2022 18:20:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyXhPEw7-5kd; Fri,  4 Mar 2022 18:20:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K9F4N33rfz9sT5;
 Fri,  4 Mar 2022 18:20:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56D468B779;
 Fri,  4 Mar 2022 18:20:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DBmceHuew_2J; Fri,  4 Mar 2022 18:20:52 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.129])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 130BA8B763;
 Fri,  4 Mar 2022 18:20:52 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 224HKfFE1981097
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 4 Mar 2022 18:20:41 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 224HKeEo1981096;
 Fri, 4 Mar 2022 18:20:40 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau/bios: Rename prom_init() and friends functions
Date: Fri,  4 Mar 2022 18:20:40 +0100
Message-Id: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646414439; l=2099; s=20211009;
 h=from:subject:message-id; bh=Khg4HGI1DyRpLRO9YvLyJlbsHAN+KPfyy8yNdyTdf+M=;
 b=7CmKxM1azLkVlusnQx1tTk/BpceR0kdJRAC/Kqbzcdc28wtrhUTIXtoUzvqf3p8Qk7aOfbzaAbrr
 +IhfTTqYCSwXAyGlGPijvOeRDltq/I/Otm6tCwoo0mFio3bmnIfC
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on powerpc headers, I ended up with the following error.

	drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c:48:1: error: conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *, const char *)'
	make[5]: *** [scripts/Makefile.build:288: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1

powerpc and a few other architectures have a prom_init() global function.
One day or another it will conflict with the one in shadowrom.c

Those being static, they can easily be renamed. Do it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
index ffa4b395220a..9c951e90e622 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
@@ -25,7 +25,7 @@
 #include <subdev/pci.h>
 
 static u32
-prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
+nvbios_rom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
 {
 	struct nvkm_device *device = data;
 	u32 i;
@@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
 }
 
 static void
-prom_fini(void *data)
+nvbios_rom_fini(void *data)
 {
 	struct nvkm_device *device = data;
 	nvkm_pci_rom_shadow(device->pci, true);
 }
 
 static void *
-prom_init(struct nvkm_bios *bios, const char *name)
+nvbios_rom_init(struct nvkm_bios *bios, const char *name)
 {
 	struct nvkm_device *device = bios->subdev.device;
 	if (device->card_type == NV_40 && device->chipset >= 0x4c)
@@ -57,8 +57,8 @@ prom_init(struct nvkm_bios *bios, const char *name)
 const struct nvbios_source
 nvbios_rom = {
 	.name = "PROM",
-	.init = prom_init,
-	.fini = prom_fini,
-	.read = prom_read,
+	.init = nvbios_rom_init,
+	.fini = nvbios_rom_fini,
+	.read = nvbios_rom_read,
 	.rw = false,
 };
-- 
2.34.1

