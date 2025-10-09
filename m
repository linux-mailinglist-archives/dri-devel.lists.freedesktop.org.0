Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC68BCB364
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 01:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B688010E24E;
	Thu,  9 Oct 2025 23:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4IXJ65N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3F10EB36
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so12837985e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053185; x=1760657985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61fl0QmalDC2B70Ur7984Y98C8MPZlXSrMQqbp1jaho=;
 b=G4IXJ65N+zYrqICVzkwRVUlWpySqr9iOI+P0Wwkpcea/njOnpcf5+hEJ9w3yctf4Vp
 w2yGCbX/GorlfkhnolBvjxa7+zNYhpQcgum5XgSLBc2sCqyXQJf2IDUZto1E5T1O/wsv
 2nrnf9/i2q9VhVAgBlM/sAic28a3lrru4S7LlCPLrzjONquZqwi50RCXc0dtSsnpudvR
 N74kgrdt6iac0nTglWf4rnnRSUA7md+hPUK5ajUkgFYtpdUkIJNT/wx5m5Sxlj8PbgeH
 UBO+2KTReQvjBeij+JMvbikvB+LJTMdD8cI4JeZkg3Njb/IjZ4WwqvkSdNM2MzZyV1MC
 W/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053185; x=1760657985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61fl0QmalDC2B70Ur7984Y98C8MPZlXSrMQqbp1jaho=;
 b=h2jpcxeNwxR7r7vbzDRi2dE3clOrJhxP+F5iMwL/B/5qv/EZtXZFI7D6eENNXKi7q4
 T/tHThPzI3yrwDGncPqc/Vy6VnPQK7iV6BjXrFKEVe4y0pZ12QLBvGpoh/dSd9PyoHlj
 Vua++OoWD1HM4EhDabAoV50ISC3DjMR9QxqyEd/JrcudzURsQoujJ4mMiuSrGw0AepzR
 MuSwAw7aL+l+O3lOhxB6CRuQhrfy4Ukya/EVrv7cC6TYVh8kzYPgpU5PrLY0XgxMdgFI
 44BiJ6+g7V1By54MWB0ROTYV7a2/Mhv3MIh3W6xMckBqEucl7x+xMaB89APpfyu+XiPX
 ONpQ==
X-Gm-Message-State: AOJu0Yy61kVWcOezdUpR5P1nceceUqSi74zB4w/72HxreiBth9ps00Wn
 lbhASKp000baOvL/so3zBoSinl9xDU0xrpQN2Zm5XaInNmwEfDlbxtca
X-Gm-Gg: ASbGncvDpArYWd4i3arIxDF1p2PzxhPYma6H7lNACB0KcsRhEQblaVW9AlYwqgEbVj+
 g/Udv5ecdSXf+7lJwPjp/3mOepxdNF2+S5LKZw70De9/wmc5kDKqEyX7GjsTn+fp0ldFriv6vuj
 710XWyuq840r+X75fZLjyuoYIx+lb91NaE8y5rSxjBHjI+V14co3L7o4rsyVcRzTqjVbEN8uo0L
 W22PwBy1C83BDZEffctFT5fiKgeoCj2T6U9fXGOO6oEU0fljtfJPZxF9WU5GGhOq4xOoXHPVjHK
 jEzRwDW4Y9rAO4PnRsevMFR9O/J5sE+ioLj8UsW3ifWvnBRuGeKxz9JYSbUKjjHOlg2VrWErpYM
 DUsQC+BJlexLqs4um+pgjuOUpibexW/YCAp3+PVuC7IB+BlZzUOz/
X-Google-Smtp-Source: AGHT+IGKhAP1SwjKQyd4gXEeUKmnVqILTkgIT5bozEqWpm87eGAj421N2AI9bjTAYBj21oh0zBP4/Q==
X-Received: by 2002:a05:600d:4384:b0:46e:6d12:ee2a with SMTP id
 5b1f17b1804b1-46fa29f5e70mr60200355e9.16.1760053185395; 
 Thu, 09 Oct 2025 16:39:45 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:43 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@nvidia.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Fri, 10 Oct 2025 02:38:36 +0300
Message-ID: <20251009233837.10283-5-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@nvidia.com>

Allow compressed PTE kinds to be written into PTEs when GSP-RM is
present, rather than reverting to their non-compressed versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index ecff1096a1bb..ed15a4475181 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -109,12 +109,34 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 	nvkm_done(pt->memory);
 }
 
+static inline u64
+gp100_vmm_comptag_nr(u64 size)
+{
+	return size >> 16; /* One comptag per 64KiB VRAM. */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_base(u64 addr)
+{
+	/* RM allocates enough comptags for all of VRAM, so use a 1:1 mapping. */
+	return (1 + gp100_vmm_comptag_nr(addr)) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_incr(u32 page_size)
+{
+	return gp100_vmm_comptag_nr(page_size) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
 static inline void
 gp100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map, u64 addr)
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
 		data += map->next;
@@ -195,6 +217,9 @@ gp100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO128(pt, vmm, ptei++ * 0x10, data, 0ULL);
 		data += map->next;
@@ -440,9 +465,26 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		return -EINVAL;
 	}
 
+	/* Handle compression. */
 	if (kindm[kind] != kind) {
-		/* Revert to non-compressed kind. */
-		kind = kindm[kind];
+		struct nvkm_device *device = vmm->mmu->subdev.device;
+
+		/* Compression is only supported when using GSP-RM, as
+		 * PMU firmware is required in order to initialise the
+		 * compbit backing store.
+		 */
+		if (nvkm_gsp_rm(device->gsp)) {
+			/* Turing GPUs require PTE_COMPTAGLINE to be filled,
+			 * in addition to specifying a compressed kind.
+			 */
+			if (device->card_type < GA100) {
+				map->ctag  = gp100_vmm_pte_comptagline_incr(1 << map->page->shift);
+				map->next |= map->ctag;
+			}
+		} else {
+			/* Revert to non-compressed kind. */
+			kind = kindm[kind];
+		}
 	}
 
 	map->type |= BIT(0);
-- 
2.51.0

