Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A9605FD5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D59510EC88;
	Thu, 20 Oct 2022 12:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA59610E445
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:13:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d26so46862228eje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+v29EKFl+eJvb82q1HKwVTg2HY11/VB4Svx4P9W+lo=;
 b=YqFUB2RVnHN5EsUo3VW1I9AsNIcJJQLV4S+D44r9T9b6ym2gHsJKjzGJimsfO6xmbU
 A/+REzVhwdsNLSGCWIlcXJnVzRV5XGbNg2/RaaZKNEi53jQhLaFGPH8liVB+C996ROnc
 E1C7cbICnMASBOMmLMtdY6huElsnoE+NKhqTKQuA/qOlUY6R49cmAb/38cLDHTGowhY4
 yUOGRnuAFJ5PnrBCfk8n9kco9tJZxEyyQWN+mfjRog96QiZ7rsio7eYITjKsjVmyrG7q
 jZwXCk33x8Jwjap9Zfv/JsVGZhluG1rEZaKxg0vX/31a+Q3b8L3mtUsmk97ho1lIr3Iy
 5Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+v29EKFl+eJvb82q1HKwVTg2HY11/VB4Svx4P9W+lo=;
 b=eSUL5ZVT3iBQv4f5Yk6AK9JgFH7/uGkCspOA4dlXufaOzvZXaYFRuNZxEur6pHkRxY
 hSYqZVReTsn2IsLG7YQ1nMlSNjkP5cqV7YPk2xllDR9ErjlH0sWwoeaFL2xEbG8u0+9q
 Rmk196Ho14mCYF2oduGF+q7JuCoExS3iNg9H0sSm56Mv4O4jTIwzytRV1JazMq6lOWqh
 TZaUMjRVUYdmGsq+aNGdWH/M5uvHwZ/wI1067yCjjRR4kUG5crdHGjraKOujgH55Re7r
 Ad6T0I1DDrrzFbFoSuzHwnVbVE1FicZvE4VGaG0KmyC2NBR+573lZfK30PByeAuFfZNn
 kcVQ==
X-Gm-Message-State: ACrzQf0IT8RKKpGVKsAT05yafXyfQ9FRyhNASHzlfYI1MiKlKyBsWMx7
 0viC+TMoUB7GVGEHAy95mLc=
X-Google-Smtp-Source: AMsMyM6BChwqh4PIcxBaoBdOLcOjBF6P/9MGAQWN+q+1y6+Muz30Cs5s0ZOBk0hSI0JvdUfHbEu7gA==
X-Received: by 2002:a17:907:31c4:b0:78d:9b2f:4e1a with SMTP id
 xf4-20020a17090731c400b0078d9b2f4e1amr10731462ejb.306.1666268006079; 
 Thu, 20 Oct 2022 05:13:26 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05640217cf00b0045467008dd0sm12091979edy.35.2022.10.20.05.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:13:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Subject: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
Date: Thu, 20 Oct 2022 14:13:15 +0200
Message-Id: <20221020121316.3946-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a device driver is snooping the CPU cache during access we assume
that all importers need to be able to snoop the CPU cache as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 20e109a802ae..d5c70b6fe8a4 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -28,6 +28,7 @@
 
 #include <linux/export.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
 #include <linux/rbtree.h>
 #include <linux/module.h>
 
@@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 		.size = obj->size,
 		.flags = flags,
 		.priv = obj,
+		.coherent = dev_is_dma_coherent(dev->dev),
 		.resv = obj->resv,
 	};
 
-- 
2.25.1

