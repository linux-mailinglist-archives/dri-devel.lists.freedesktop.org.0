Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E937163FD
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 16:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D39210E165;
	Tue, 30 May 2023 14:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576AE10E165
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685456784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=94BTDN4VWVFQfkvjBSdpixM1dxKT80KRY3XqvsTb4ik=;
 b=Mciyg7iLMfvLruk0HK1mb9fI5ZKKaKeFWAJm3owIZRzb4bGMeKohlWcpA2Vq3rvZDNnPP/
 /qKgY0rvRw8UlkjoVW3Wcb8o1u1k20hgaPmzMEpM6erBYHpCHj7MmdwroMZ2XqIAnioTdK
 52tiPxUp4ht0yPyAIAgkGcdfepjaC9w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-sv1RyystNgaId8KJKFySLw-1; Tue, 30 May 2023 10:26:23 -0400
X-MC-Unique: sv1RyystNgaId8KJKFySLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB8562A5957E;
 Tue, 30 May 2023 14:26:21 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5A0FC154D1;
 Tue, 30 May 2023 14:26:20 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
 lyude@redhat.com
Subject: [PATCH] MAINTAINERS: Add myself as reviewer for mgag200 and ast
 drivers
Date: Tue, 30 May 2023 16:26:15 +0200
Message-Id: <20230530142615.57014-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've contributed to these two drivers, fixing bugs and performance
issues.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 250518fc70ff..92a991643b36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6398,6 +6398,7 @@ F:	drivers/gpu/drm/aspeed/
 DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Thomas Zimmermann <tzimmermann@suse.de>
+R:	Jocelyn Falempe <jfalempe@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -6549,6 +6550,7 @@ F:	drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
 DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Thomas Zimmermann <tzimmermann@suse.de>
+R:	Jocelyn Falempe <jfalempe@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc

base-commit: 8b817fded42d8fe3a0eb47b1149d907851a3c942
-- 
2.40.1

