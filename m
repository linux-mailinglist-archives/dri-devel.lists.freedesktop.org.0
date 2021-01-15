Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FAA2F839C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27A36E4B7;
	Fri, 15 Jan 2021 18:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EC16E48D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id e15so2001853wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2FyQ5jLhIdHZJD6YWNJEO3BdrWd8ejeRewtSriPKvY=;
 b=oo8H3DQngcMqzuyQv+p0ndzTcx2a6xa46E1LV17pUiKJmFYB/HLEV/rZzoO2TuB5Rf
 WlggPv9nQYUiOsj4KyUx0khpoZNaWM6Dj+FyMlf7zxiRftfs0AXqTWSDDhT/9JdcxuZp
 tCxeL7ReDwA/x1dZXTqfgIrQki9sQW0m3eqOzvSvIZuNEgesuZVukjlYcR+9kFOvW4a7
 BWhUcye5v59wpx3O/6PrS31N3SZPmIH1Ahzoh39Lxz5rFSX3JhzQhqVT5MKc0uETdAsx
 Tl7YjhMnuu+37Hv2pSNoIlTS2lmZoGJiGbYXAjdJfEfIdeThyga1i04Poq2MH3kQIjP6
 Q0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2FyQ5jLhIdHZJD6YWNJEO3BdrWd8ejeRewtSriPKvY=;
 b=XZFz8FKV/sq1SBhIPknMxkRvSZj2YtXo3jyHWpcFXKRUDSPr27WW51/lsGFSo4WXpq
 6Rqfvi6yM4limA1Wo4CZbCQxu8fJsiz1EbpfF0NLzH9olM075fnghY6Q1LdEekTl7itd
 IVYrYhB8BhXZ+2pTrB+WsFtiYowi2FQ0oF8CRBhpKAKHD4knczKqW854HDAfaeXNs7jd
 GNJYe3tbhAYTq6UDqYIYDoUkL7cu7sip7qwXN/VYNC0eVSbP+m/syBFFHvrSLj7gH3js
 SXElhCKYEg0w4sgphh4kr0ZR05jrJ7BDpiHJBcc2kWZLC/csFnzFamjk8abcDihmUPa2
 DLRg==
X-Gm-Message-State: AOAM530Te6JvCMruQ/eM3X3TcrW3FZBzyqXzuc/6kCif5kU7cc3S6NZj
 Fp67oADRd8HSqBVTwr82PGhSEA==
X-Google-Smtp-Source: ABdhPJwcwyOAr0PXhJz2jEx6tQz9gFzPXrNLH0m28OazHlbt4inlSogSJGqy1K3YHg7BHui7FtTezw==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr5656814wmb.98.1610734567515; 
 Fri, 15 Jan 2021 10:16:07 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/29] drm/vmwgfx/vmwgfx_cmdbuf: Fix misnaming of 'headers'
 should be plural
Date: Fri, 15 Jan 2021 18:15:33 +0000
Message-Id: <20210115181601.3432599-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:137: warning: Function parameter or member 'headers' not described in 'vmw_cmdbuf_man'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 3158924ffa852..2e23e537cdf52 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -89,7 +89,7 @@ struct vmw_cmdbuf_context {
  * @max_hw_submitted: Max number of in-flight command buffers the device can
  * handle. Immutable.
  * @lock: Spinlock protecting command submission queues.
- * @header: Pool of DMA memory for device command buffer headers.
+ * @headers: Pool of DMA memory for device command buffer headers.
  * Internal protection.
  * @dheaders: Pool of DMA memory for device command buffer headers with trailing
  * space for inline data. Internal protection.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
