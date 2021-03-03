Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9FB32B834
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5D6E902;
	Wed,  3 Mar 2021 13:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BF86E8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v15so23747730wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKXL5BSpeJS4vDI/7s0Xoa8UxotBBglASR7mfOE+iBg=;
 b=hNtRCCCeLUyw2wuwWNSPLsnqiGi3UnjiOYd/907z/VkaGS03CORudaoeEzoKYZ21wW
 +3n5IBsv3gkbasx+n2cCWCAVea13G1Q2ZSB42y0CxowYWrDBqA8kfycGf+Er+H0FFCao
 eOSqiLNTpDXNLn+wzbAXzjtF7CDA2C9NOgQidByinmGlam0z4LrTrH+o4lYwzfAyY4cf
 pFoNb7a7tau9SJERVtEOs1XJvnlQYlOHvSXJy21Bqs3m4amKs0motl60th9pOXMi8xb1
 OP+1xku4Uf7V/QHBacsXBTLLPOqCCGr8UP9Ad8BEGyrrgUA5Jg6BxQ03ADsmG/MePKtP
 pCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKXL5BSpeJS4vDI/7s0Xoa8UxotBBglASR7mfOE+iBg=;
 b=T3YxeEnrCDBSoxPJZ76oOMTXfRtZZa5XCialG22kZYgCxPLhkOTMCbl0Zc2lCGYVEi
 0F+XrCvtpMxuE4xy3Ixp/IqrT2Jgj8gDyDth++A59oxB/W4b1f6YgqabF6H5bP5qZ5r8
 BVb/vn17WqwbsKrwQyNRUJ19tq47oEmBstx4G/kwe3Biq6jX90+M7IzKDwFPfR2pgekh
 6uVhOBPpKY3GkpWq7Cj9aT/6Gl403QH/ElhVYAPKDg7EGQsfrWdfqIC1hg6Y+OHJ+oLq
 jvDqqisF1zyRx5BzqLVPRf8McoI4qZcDJVcIj/AX356h3RbC+Aqp0SojfeZV5+2QEAyp
 d0/g==
X-Gm-Message-State: AOAM530/yI3YXU3UYhQ8VLHG/I3JtZ5bx+S9r/qm/YxLjt2Y4x4O1M8b
 5dC7QZkzSqmnw8ix42oipIjJvA==
X-Google-Smtp-Source: ABdhPJwNCO3+9KCWRQseXqqpuCUbrFtzHY3to+3rr+R+ZVPWB8etjMgXEtTt0twcjo+u4u2lpoLRhA==
X-Received: by 2002:adf:b641:: with SMTP id i1mr27693700wre.295.1614779043159; 
 Wed, 03 Mar 2021 05:44:03 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/53] drm/vmwgfx/vmwgfx_ttm_buffer: Supply some missing
 parameter descriptions
Date: Wed,  3 Mar 2021 13:42:55 +0000
Message-Id: <20210303134319.3160762-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-12-lee.jones@linaro.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
