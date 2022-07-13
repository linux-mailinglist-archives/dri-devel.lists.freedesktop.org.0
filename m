Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8601B57319A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2C198855;
	Wed, 13 Jul 2022 08:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2004098852
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657702507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WV1sbMysUWTQnUXeMzoIvswvu0vFM2B1lJ+VzkW+y6k=;
 b=apvMl/8SnwKLYiPHVD4F3EhbsZSZJSrU2/aLeAZz6kMRVxWqL8nAcnN5jA+/Kko5w5A2f7
 lgw3IAfN4ilPAQiadpBbYIOTFKJTNybO92QiZWKrnguON2RV8/ugVcFPNkunEnAt1edGRv
 vCEqKSLaET1lOAeSm4K/Y+5P+GsxA/E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-VUJOlpKYOzCfAPv1weQRDA-1; Wed, 13 Jul 2022 04:55:06 -0400
X-MC-Unique: VUJOlpKYOzCfAPv1weQRDA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso6882354edd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 01:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WV1sbMysUWTQnUXeMzoIvswvu0vFM2B1lJ+VzkW+y6k=;
 b=lMegvx6a2eoqhLz48ilJqjk6OCFs5q/WgVgjuuDK3weyU8aatSjJC9iQ2n2I8apgAj
 gekrjgpbMFw6yb3zn896t5gsGdcbSt6eruSukxR/OlJY2tPw03cMKZ4pp/dYR6YiJxIg
 IHcGZcw4e9wmE0I+30Y72fxVNjLRyW1T+2WewFQjrCPEs8s9l01EkxAIP0h3vI1mdx47
 8UBdKIbxhTtwsFhdEUEO5u/dQjt38BSXrC+0Z0Hinu5XxXmDnrW9FCKOdfXv9a9hbfut
 33H2DhDOiPE5VKTJSemjYGMhqTP3/X9pp1T+TFOBJfQGQ2nn/UXC3WerodV8sUE6gnoK
 Ym7A==
X-Gm-Message-State: AJIora9DJOj7QCKffD6YdC+3A4KuQC3fLiiZpBViMi64aV+qkwTl9PZv
 AoM7uzgmyhXrOBb0OuaxVZ/WMPVU+PB0Q+L/W22TpApR+1T9Tzmx/q3yUYQ8edeRdMRgZPZjvM3
 nlvpASp3mXUxroxTM2B9Clk64IyWG
X-Received: by 2002:a17:907:7631:b0:72b:3a31:6cb8 with SMTP id
 jy17-20020a170907763100b0072b3a316cb8mr2299320ejc.372.1657702504862; 
 Wed, 13 Jul 2022 01:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHJQ1hmybqbUFHi9JfLGHPMl0bUlQL3+VPHCXCzTLWDo10p5guo24wdgNWCe9I5IOJ7jM9Pg==
X-Received: by 2002:a17:907:7631:b0:72b:3a31:6cb8 with SMTP id
 jy17-20020a170907763100b0072b3a316cb8mr2299307ejc.372.1657702504715; 
 Wed, 13 Jul 2022 01:55:04 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056402088200b0042dcbc3f302sm7547655edy.36.2022.07.13.01.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:55:04 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: emma@anholt.net,
	mripard@kernel.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 1/3] drm/vc4: plane: use drm managed resources
Date: Wed, 13 Jul 2022 10:54:58 +0200
Message-Id: <20220713085500.1970589-2-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713085500.1970589-1-dakr@redhat.com>
References: <20220713085500.1970589-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate the plane object with drmm_universal_plane_alloc() in order to
tie the release action to the underlying struct drm_device, where all
the userspace visible stuff is attached to, rather than to struct device.

This can prevent potential use-after free issues on driver unload or
EPROBE_DEFERRED backoff.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 1e866dc00ac3..0d88de31aa9c 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1469,7 +1469,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
 	int num_formats = 0;
-	int ret = 0;
 	unsigned i;
 	static const uint64_t modifiers[] = {
 		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
@@ -1480,11 +1479,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		DRM_FORMAT_MOD_INVALID
 	};
 
-	vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
-				 GFP_KERNEL);
-	if (!vc4_plane)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
 		if (!hvs_formats[i].hvs5_only || vc4->is_vc5) {
 			formats[num_formats] = hvs_formats[i].drm;
@@ -1492,13 +1486,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		}
 	}
 
+	vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base, 0,
+					       &vc4_plane_funcs, formats,
+					       num_formats, modifiers, type,
+					       NULL);
+	if (!vc4_plane)
+		return ERR_CAST(vc4_plane);
+
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, 0,
-				       &vc4_plane_funcs,
-				       formats, num_formats,
-				       modifiers, type, NULL);
-	if (ret)
-		return ERR_PTR(ret);
 
 	if (vc4->is_vc5)
 		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
-- 
2.36.1

