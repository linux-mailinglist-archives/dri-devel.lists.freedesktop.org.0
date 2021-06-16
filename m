Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9003A94F4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1505D6E523;
	Wed, 16 Jun 2021 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010966E523
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u24so1521537edy.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bAUQPXbSkvT19k/XhsYs0cmL8Bgj7Ny0WAGbdIQQDHQ=;
 b=HxP9msOguWQ3QrHteS08n9aIIpmSVL0B0jsiRk4MJRbL7uofgZCKCoapjNf/2kiwdk
 6Pb3l1Fc9AAZ/VCA3EHdMq5afGHtPvdGX2GUQdVJ0cKXTwGUpQJWgaUhzC0OOXYMGMs2
 JbdyCuOMZpj8iV/WG+xz7zoV7SR38QcnQ9FBNgOimACUD0REuMD5SPbZyBucGx/w2Vpj
 gDk4kQBGE5BXa6AxcD7Q5IgG8RSE/JYkxUGv+IjtKZYbgR5iko6rgwhIsOid1X8SXd9o
 RfsKcaUNJD8eByyW4wemDj68FQ/qrYOOCUsR3cTTWq04Y1TPeEorHNbttrukQnr3h8k0
 wXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAUQPXbSkvT19k/XhsYs0cmL8Bgj7Ny0WAGbdIQQDHQ=;
 b=Ig9hB3E/sWIur5wLgyl6A3Wu4duVUaAbVFOO263Fj2olCNaYLy+UoBuSKIAevhpp/c
 o0m74WxRibIFjQWqqubSdwQPuyXqVPSb++yvq9UbtK9RS1mf04Y2VMLQC3bM22hJgTXV
 gn9rbrS9ZAitk0A1HUn69FjV5+TlMQ/1tnVEf++edII//9ognc+FoSXij3bKzQtLVOwX
 5fPz860/qi9Yynlgjjr/uE0fjxLE8QndX6RrOEfMrXTF5AWeO896wF1SesSIWi1hCSxi
 +x8CPxtc0PmWu3K53pPRbQZrquQTEvqqBllKuk/dP6I81rIvlFZ7bPH3WbghEIIPb7kc
 KgfA==
X-Gm-Message-State: AOAM532GMmbKUGXn2wLHGlvwN60OVh2LPEfgNA27eeShzbhA8n57iTDI
 2lPbMnwghGUdcHZlWV6RWtk=
X-Google-Smtp-Source: ABdhPJwuv9+M+3+hOg8rwV487BVcNbOkILX2dYfgDgwmpTEez1b9S9OjYK3Etjby1E1nrcMXGLnRog==
X-Received: by 2002:aa7:cd77:: with SMTP id ca23mr2794529edb.259.1623832019927; 
 Wed, 16 Jun 2021 01:26:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:26:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: [PATCH 1/7] dma-buf: add some more kerneldoc to
 dma_resv_add_shared_fence
Date: Wed, 16 Jun 2021 10:26:49 +0200
Message-Id: <20210616082655.111001-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explicitly document that code can't assume that shared fences
signal after the exclusive fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43..4ab02b6c387a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -235,7 +235,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
  * @fence: the shared fence to add
  *
  * Add a fence to a shared slot, obj->lock must be held, and
- * dma_resv_reserve_shared() has been called.
+ * dma_resv_reserve_shared() has been called. The shared fences can signal in
+ * any order and there is especially no guarantee that shared fences signal
+ * after the exclusive one. Code relying on any signaling order is broken and
+ * needs to be fixed.
  */
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
-- 
2.25.1

