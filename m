Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29336863B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 19:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D41E6E542;
	Thu, 22 Apr 2021 17:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425E6E542
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 17:51:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w23so54271770ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHZSVPByUbrA9Gg8y5xUcqloIpvDd4jTgwpwNHbORV4=;
 b=P2M/l+7Xq3J+vEXbIk9mjSwXyztqvtyfn36ICb7jf07OZ7cA3/WofzdVBQAMU/Qfin
 CtIsTcur0qnh1vFIpUFQM+KDY5brv+LTX1EmRUDbKT022Ldkrd0GYAEGT8s9JdSkxQ03
 3cvxQU7O9nHEFr4C0VYv87MXoCJNeDk9PMjjh5JSU/1jdYgGZCyBU2OTum1u6+X49qKC
 RgAc0Ae8R+o7/zn4QcGVfmG6LhDy8q0tjztuBUfP6mfySJ7fWK6ZygcnxyLxoawI5T8Q
 wmmBveAZLGTM5LLTLtcJCR0V2UTJQ10pf5QTIsUoI7mLx8BGRRzmDmiwF1xVWuM5kehO
 ylhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHZSVPByUbrA9Gg8y5xUcqloIpvDd4jTgwpwNHbORV4=;
 b=nqAp9xT2p/QfoFQ8uwx0VqRNmlFlzsyMTha8kAqXVi531y/bSEGy0HZa74SKmSyarx
 l0q/SsxHxqNnMt2lAIOW6NATXN3NKECYBIAf3zsHchCBlJAOR/ISpR/W70ZX2QdvfjXK
 Q5ayq1vwD/jiD21rnbvI1cK9m2bp4d7jApt+AAkt1vSF/Hkhi03GtGC/JQE/Xuz3/+xb
 unheGNC3TEw1M60kfakVzt8ZsXoApmAjGVk1+nneVypXGXqQXnVMwZ4JNfmH62IRtx04
 2pKIlL35i4qkWdeiLKBKHoksQSttj+iTF6P//fkagu8zkhTQQPUvB4HW8F92DU8y5qbQ
 Bskg==
X-Gm-Message-State: AOAM533kKCpmwIxV7HrheqbHe3KLqR3XiB9+2KopVRS2nLe8x4amBiFT
 UZqoNq63Vr3tVS91dD+81x0=
X-Google-Smtp-Source: ABdhPJwkwcu7Cy4iPPZVfRf4BQMXzSoI+CcWDVp4DUd4kkOhtEsTwJl3W0jdhwz+VhG3WQ6vV+Hssw==
X-Received: by 2002:a17:907:72cc:: with SMTP id
 du12mr4529458ejc.436.1619113911829; 
 Thu, 22 Apr 2021 10:51:51 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id c19sm2714401edu.20.2021.04.22.10.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 10:51:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/drm_file.c: Define drm_send_event_helper() as 'static'
Date: Thu, 22 Apr 2021 19:51:46 +0200
Message-Id: <20210422175146.29840-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_send_event_helper() has not prototype, it has internal linkage and
therefore it should be defined with storage class 'static'.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7efbccffc2ea..17f38d873972 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -786,7 +786,7 @@ EXPORT_SYMBOL(drm_event_cancel_free);
  * The timestamp variant of dma_fence_signal is used when the caller
  * sends a valid timestamp.
  */
-void drm_send_event_helper(struct drm_device *dev,
+static void drm_send_event_helper(struct drm_device *dev,
 			   struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
