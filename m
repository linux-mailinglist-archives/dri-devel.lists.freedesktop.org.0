Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMZrBIyHgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:28:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD73D4B32
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0522F10E550;
	Tue,  3 Feb 2026 05:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB83910E53D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:28:40 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-442-ErzvWeI5N-KrP7mHnnHSKA-1; Tue,
 03 Feb 2026 00:28:36 -0500
X-MC-Unique: ErzvWeI5N-KrP7mHnnHSKA-1
X-Mimecast-MFC-AGG-ID: ErzvWeI5N-KrP7mHnnHSKA_1770096515
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B7DC0195609D; Tue,  3 Feb 2026 05:28:35 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B82EE1955F1B; Tue,  3 Feb 2026 05:28:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 2/3] nouveau/vmm: increase size of vmm pte tracker struct to
 u32
Date: Tue,  3 Feb 2026 15:25:26 +1000
Message-ID: <20260203052823.2220053-3-airlied@gmail.com>
In-Reply-To: <20260203052823.2220053-1-airlied@gmail.com>
References: <20260203052823.2220053-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H70pdoofAEtP8ezUjIFBka8nDWumdaT-XPifIM8O5F0_1770096515
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DAD73D4B32
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

We need to tracker large counts of spte than previously due to unref
getting delayed sometimes.

This doesn't fix LPT tracking yet, it just creates space for it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index efc334f6104c..8b8f4b85e315 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -387,7 +387,7 @@ nvkm_vmm_sparse_ptes(const struct nvkm_vmm_desc *desc,
 =09} else
 =09if (desc->type =3D=3D LPT) {
 =09=09union nvkm_pte_tracker sparse =3D { .s.sparse =3D 1 };
-=09=09memset(&pgt->pte[ptei].u, sparse.u, ptes);
+=09=09memset32(&pgt->pte[ptei].u, sparse.u, ptes);
 =09}
 }
=20
@@ -399,7 +399,7 @@ nvkm_vmm_sparse_unref_ptes(struct nvkm_vmm_iter *it, bo=
ol pfn, u32 ptei, u32 pte
 =09=09memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
 =09else
 =09if (it->desc->type =3D=3D LPT)
-=09=09memset(&pt->pte[ptei].u, 0x00, sizeof(pt->pte[0]) * ptes);
+=09=09memset32(&pt->pte[ptei].u, 0x00, sizeof(pt->pte[0]) * ptes);
 =09return nvkm_vmm_unref_ptes(it, pfn, ptei, ptes);
 }
=20
@@ -458,7 +458,7 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09=09=09=09desc->func->sparse(vmm, pt, pteb, ptes);
 =09=09=09=09else
 =09=09=09=09=09desc->func->invalid(vmm, pt, pteb, ptes);
-=09=09=09=09memset(&pgt->pte[pteb], 0x00, ptes);
+=09=09=09=09memset32(&pgt->pte[pteb].u, 0x00, ptes);
 =09=09=09} else {
 =09=09=09=09desc->func->unmap(vmm, pt, pteb, ptes);
 =09=09=09=09while (ptes--)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index a6312a0e6b84..a8b08126e8dc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -5,11 +5,12 @@
 enum nvkm_memory_target;
=20
 union nvkm_pte_tracker {
-=09u8 u;
+=09u32 u;
 =09struct {
-=09=09u8 sparse:1;
-=09=09u8 spte_valid:1;
-=09=09u8 sptes:6;
+=09=09u32 sparse:1;
+=09=09u32 spte_valid:1;
+=09=09u32 padding:14;
+=09=09u32 sptes:16;
 =09} s;
 };
=20
--=20
2.52.0

