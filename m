Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96F494653
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 05:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04610E24C;
	Thu, 20 Jan 2022 04:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Thu, 20 Jan 2022 04:12:04 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B857810E268
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:12:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-hdJn1T2JPtqusFMUeVQfGg-1; Wed, 19 Jan 2022 23:05:32 -0500
X-MC-Unique: hdJn1T2JPtqusFMUeVQfGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD010814243;
 Thu, 20 Jan 2022 04:05:31 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA406610A8;
 Thu, 20 Jan 2022 04:05:29 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/ast: Support 1600x900 with 108MHz PCLK"
Date: Thu, 20 Jan 2022 14:05:27 +1000
Message-Id: <20220120040527.552068-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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

From: Dave Airlie <airlied@redhat.com>

This reverts commit 9bb7b689274b67ecb3641e399e76f84adc627df1.

This caused a regression reported to Red Hat.

Fixes: 9bb7b689274b ("drm/ast: Support 1600x900 with 108MHz PCLK")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ast/ast_tables.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tab=
les.h
index d9eb353a4bf0..dbe1cc620f6e 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -282,8 +282,6 @@ static const struct ast_vbios_enhtable res_1360x768[] =
=3D {
 };
=20
 static const struct ast_vbios_enhtable res_1600x900[] =3D {
-=09{1800, 1600, 24, 80, 1000,  900, 1, 3, VCLK108,=09=09/* 60Hz */
-=09 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), =
60, 3, 0x3A },
 =09{1760, 1600, 48, 32, 926, 900, 3, 5, VCLK97_75,=09=09/* 60Hz CVT RB */
 =09 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
 =09  AST2500PreCatchCRT), 60, 1, 0x3A },
--=20
2.25.4

