Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1755426B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A9611388C;
	Wed, 22 Jun 2022 05:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4410E944
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:40:31 +0000 (UTC)
X-QQ-mid: bizesmtp65t1655818767tu45ejch
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:39:22 +0800 (CST)
X-QQ-SSF: 0100000000700060B000D00A0000000
X-QQ-FEAT: FXvDfBZI5O6DgV0I3s0IakLWZaVbIOeZptt8jkiqdC1X/yUp5ELNdn8Vvimqw
 kdqB7vxeV000srLFqPrzmvpRv3xMNGqY/WTZykt2a5+hrZU2ouG6aJY0FwkNxIcz91BpQfG
 VqR06qnanaOXzeMMt3XsO3ofR/u0v1o+Xuvjmy/MwCxeN2KgF90IWZySikkpVqMJ8bHPXsH
 NRdlOMeNA03XnMjqUcn+s0TupNOs31NxK4wghTnvYQSVuCs/aZAMQLbyUfXO3/oIHKhjpYk
 JiuqbONKtHaOpWVxC5aL0UXAns7l7YBvcX5cguXNa3+mnNVAM1JO3eagNC3l7urNzzhZOa9
 rm3F+l7prWovBsId6MgNgmymtknZw==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/mmu: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:39:20 +0800
Message-Id: <20220621133920.8112-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia.Lawall@inria.fr, jiangjian@cdjrlc.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
line: 1051
 * have the the deepest nesting of page tables.
changed to
 * have the deepest nesting of page tables.

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index ca74775834dd..ae793f400ba1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1048,7 +1048,7 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 	__mutex_init(&vmm->mutex, "&vmm->mutex", key ? key : &_key);
 
 	/* Locate the smallest page size supported by the backend, it will
-	 * have the the deepest nesting of page tables.
+	 * have the deepest nesting of page tables.
 	 */
 	while (page[1].shift)
 		page++;
-- 
2.17.1

