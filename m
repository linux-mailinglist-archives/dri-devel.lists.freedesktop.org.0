Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E97DC5D4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5A10E3F7;
	Tue, 31 Oct 2023 05:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F7E10E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 05:20:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-m33VZhpzPjqbj3hie0Kr1Q-1; Tue,
 31 Oct 2023 01:19:51 -0400
X-MC-Unique: m33VZhpzPjqbj3hie0Kr1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37D773810B03;
 Tue, 31 Oct 2023 05:19:51 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37E0240C6EB9;
 Tue, 31 Oct 2023 05:19:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] nouveau/gsp: fix message signature.
Date: Tue, 31 Oct 2023 15:18:46 +1000
Message-ID: <20231031051943.1957328-3-airlied@gmail.com>
In-Reply-To: <20231031051943.1957328-1-airlied@gmail.com>
References: <20231031051943.1957328-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This original one was backwards, compared to traces from nvidia driver.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 47138d797748..b6f6b5e747d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -693,7 +693,7 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc=
)
 =09=09return NULL;
=20
 =09rpc->header_version =3D 0x03000000;
-=09rpc->signature =3D ('V' << 24) | ('R' << 16) | ('P' << 8) | 'C';
+=09rpc->signature =3D ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';
 =09rpc->function =3D fn;
 =09rpc->rpc_result =3D 0xffffffff;
 =09rpc->rpc_result_private =3D 0xffffffff;
--=20
2.41.0

