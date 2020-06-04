Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82ED1EDF30
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0D66E2D3;
	Thu,  4 Jun 2020 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8C76E2B2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:12:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e1so5052546wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 01:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ys1lEmo1OrglME8cWbIXSVFR7KWfyvCPNKiL9IEbmhc=;
 b=RUvuRoaAUx3zoTg0dekOOqbI1T8Sgso/qeY9AgIY+69YkzMVoxVd2zcJLUgcBipdk7
 bfLnFFHUCXlCtl7HOikMZEY9KbeA3ZJCmbGvpYaKPSFaizoR8g1G0iiiWixkm2fyo6ve
 uHh1ScOQIMEnMrZouE9W6fbm6RZuu2BrIaMFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ys1lEmo1OrglME8cWbIXSVFR7KWfyvCPNKiL9IEbmhc=;
 b=L07hnn8CACFGNCfO9a0eT7SUsI1KhmQl976akiQD3Hh0je34hWHmhxWSQ0sLc51/Wc
 1U4AjedAekOABN7VtRtX+62PA0R4f+hB0N4ZDCToLpvYFVC2VrA1Om7B5f6jP+/qU7v+
 qi4gDk6tR9VgkKIEHjvbcQycx8IaCI419PmOTgbyemKfhBtHdJWWbJSxFO7R8YEDWgND
 LH97UYE8P2EbRGUAF2/H/lztZ09P3Ydxmf06SY90DyV2x83CEvHHq8TsPn4ggHWrzlrk
 JRMQxd48hvR5od3euIIM05+wE81BbWpQzYNqeQPH6UOAY+Lf2AcrEog5uAxGbEJ6J/eN
 edcQ==
X-Gm-Message-State: AOAM530r3KX9iZOtqccfa0oU+BI3YZf8IiVZGL0SGGRaGdK9GCqb1/sm
 j6FD8CJFIY2aBADlFEst1tP6JpeMgew=
X-Google-Smtp-Source: ABdhPJyMtbbr4YZr5XgYcavaaABocIWgVVWO+6bIVkLH86w/gWfWScj44NFGJ8WhcZD+YmTAw14Znw==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr3495849wrv.58.1591258354483; 
 Thu, 04 Jun 2020 01:12:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:12:33 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/18] dma-buf: minor doc touch-ups
Date: Thu,  4 Jun 2020 10:12:08 +0200
Message-Id: <20200604081224.863494-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just some tiny edits:
- fix link to struct dma_fence
- give slightly more meaningful title - the polling here is about
  implicit fences, explicit fences (in sync_file or drm_syncobj) also
  have their own polling

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/dma-buf/dma-buf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 01ce125f8e8d..e018ef80451e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -161,11 +161,11 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
 }
 
 /**
- * DOC: fence polling
+ * DOC: implicit fence polling
  *
  * To support cross-device and cross-driver synchronization of buffer access
- * implicit fences (represented internally in the kernel with &struct fence) can
- * be attached to a &dma_buf. The glue for that and a few related things are
+ * implicit fences (represented internally in the kernel with &struct dma_fence)
+ * can be attached to a &dma_buf. The glue for that and a few related things are
  * provided in the &dma_resv structure.
  *
  * Userspace can query the state of these implicitly tracked fences using poll()
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
