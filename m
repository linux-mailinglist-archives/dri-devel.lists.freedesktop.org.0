Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75057A6DE1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7502410E22A;
	Tue, 19 Sep 2023 22:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CB510E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCjo/Hem9MAnfhVLHZne2i5FM0zSf1y9nqtdKVn+f9M=;
 b=hTbKvJN0HWgC4WLdF+kMOTvx72S+Fxivt48SvZbJ7jxmEAq+fPO2HRzhu4xeUCqEP6GScl
 L/INr2fXbFllYiWN9sBC/Uw/4AoyMyICbApvmu52Qz+udeVv515RmulF85hOBZNMafCDf2
 pveofT/COBo/yvka9FDJVAputs8K2EQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-9boy7TcLPjKkApWptqZUqA-1; Tue, 19 Sep 2023 18:05:03 -0400
X-MC-Unique: 9boy7TcLPjKkApWptqZUqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8889A3822565;
 Tue, 19 Sep 2023 22:05:02 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5DFE40C2064;
 Tue, 19 Sep 2023 22:05:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 01/44] drm/nouveau/devinit/tu102-: remove attempt at
 loading PreOS
Date: Tue, 19 Sep 2023 17:55:56 -0400
Message-ID: <20230919220442.202488-2-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

From Turing, HW will already have handled this and locked-down the
falcon before we get control.  So this *should* be a no-op.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
index 81a1ad2c88a7e..40997ad1d101c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
@@ -83,17 +83,9 @@ tu102_devinit_wait(struct nvkm_device *device)
 }
 
 int
-tu102_devinit_post(struct nvkm_devinit *base, bool post)
+tu102_devinit_post(struct nvkm_devinit *init, bool post)
 {
-	struct nv50_devinit *init = nv50_devinit(base);
-	int ret;
-
-	ret = tu102_devinit_wait(init->base.subdev.device);
-	if (ret)
-		return ret;
-
-	gm200_devinit_preos(init, post);
-	return 0;
+	return tu102_devinit_wait(init->subdev.device);
 }
 
 static const struct nvkm_devinit_func
-- 
2.41.0

