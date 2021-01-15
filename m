Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDD2F8367
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EDD6E480;
	Fri, 15 Jan 2021 18:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73CD6E480
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so6746937wrt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ja/1FFTGOv6AaggbEFEZcUW2YjyBuvrOQaBJpOOoCfs=;
 b=ghF0kG8rNEQVOXAUreNjXGcJ48KjNg9l5Ypq/mQHTLuOAZzim1Tgi51UYfBff6o/5k
 SqJZsUxrQ2OQ2MC4A/in2xeKuyglvlerxtbegG8LeZMZWP5cxJRHQK0X354kmcGB6Ran
 s9B8lpGNLa3wdOJvkz7ETmHhR9fgPWpeJ6rsQF3l8L7MsEelRNXwQqZqKso6zKDgNR8C
 e6DcT9hKAhYY+8mR7q/15hXGU0+6zlJjE1MoYm4ZEF8FQkcJxX1KOEhVNUBsIhSjt7kf
 cN1gw5k2GbmPbroZiq6Hv+zvbSvAQBcsJ4nrPDlKUVifSUUV8B8dCoQokTHyAQm3r3wt
 Qzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ja/1FFTGOv6AaggbEFEZcUW2YjyBuvrOQaBJpOOoCfs=;
 b=TfTBvydTOoA6GvGZb4L7SbJ3CDL1XWSkIc6mo08y4kjlxW1EN642n/wdf3+sNF8p9O
 LVa7iIQfw4ZzrRX8tFPYIINU7uQukAKtGz3ToGa8uzUKgreIffiH56FUKepZD3Stu1ve
 d/SSi6tpyIr6kA0gz6vjO79XgjjprnD7TMm9FLtC5o3UFTzevtgbS1FtPt8tojTDbrOB
 uNNUz4NlknTlzvnwOKCsdXRUXWT03y7L9duLIO0PFaz5z02f0/GZGnB0Be+smk+jCHzX
 Oded9g1/+hxq83CtGk7eHcRL6C8PpU93QBOU5PpczU/zaT5GM+SIod2EIhQ0NYr50iUv
 fFXg==
X-Gm-Message-State: AOAM533s7Ot+WxxVylL+0baImUolnThTFkwkFeFsbKastJo+7zl/e1cj
 f8yZJnYLFszKTuuK1ssnWR1tJA==
X-Google-Smtp-Source: ABdhPJxs93jdlE+R+l0+00KbInYFz0hyGWh21RRCg+gQ2ikl2wjRWfhBWoZr6RR9J0t/xrD1VNYXrg==
X-Received: by 2002:adf:ab5b:: with SMTP id r27mr14285129wrc.282.1610734411548; 
 Fri, 15 Jan 2021 10:13:31 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/40] drm/vmwgfx/vmwgfx_ttm_buffer: Supply some missing
 parameter descriptions
Date: Fri, 15 Jan 2021 18:12:44 +0000
Message-Id: <20210115181313.3431493-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:275: warning: Function parameter or member 'p_offset' not described in 'vmw_piter_start'
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:676: warning: Function parameter or member 'evict' not described in 'vmw_move_notify'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index dbb068830d800..6a44567e4ba52 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -265,6 +265,7 @@ static dma_addr_t __vmw_piter_sg_addr(struct vmw_piter *viter)
  *
  * @viter: Pointer to the iterator to initialize
  * @vsgt: Pointer to a struct vmw_sg_table to initialize from
+ * @p_offset: Pointer offset used to update current array position
  *
  * Note that we're following the convention of __sg_page_iter_start, so that
  * the iterator doesn't point to a valid page after initialization; it has
@@ -664,6 +665,7 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resourc
  * vmw_move_notify - TTM move_notify_callback
  *
  * @bo: The TTM buffer object about to move.
+ * @evict: Unused
  * @mem: The struct ttm_resource indicating to what memory
  *       region the move is taking place.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
