Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE86342F07
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 19:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FD96E09C;
	Sat, 20 Mar 2021 18:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093916E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:39:02 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id cx5so6709400qvb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6lCP9ZQXqSKw2H5nPiVfJGz/VI9ebKiogBmatzcLK0=;
 b=jLe4yv8JhEnQh8u9zlv9ojXoeX7siCrANFXrEC2KqtuZWv1D9lHLRZFhhxEbWltg5L
 vsUYAQJB3lNkCeVJhs/ffv1t7dLCo4O2cRi9EwPjd+lJ+sEDdWh+UMdZ1MvO4jWMGUTZ
 Xlk4JXvZZ4EgZ+0yXIdNidwJ9sAwcF9HgUdgCDC0P60sihoJT0s0aC/Orf5cDvvjdUqh
 /nBVcfSIz4xEcOw+KlpzCupyGaGPBwudLJtZWjmtHkAmo61gHcLV3bNWIjlKBcvEcd5m
 /myijbP2la/KF/p+KOUwcsVXhIU2JV0vR2BDNt9MN3LhHLuqMJ1KrrjbADi+ta6t2LeS
 Soag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6lCP9ZQXqSKw2H5nPiVfJGz/VI9ebKiogBmatzcLK0=;
 b=mm5KlCKnIN6mSxEk+d2TOYSgLR50xGuHk7w5lPaJPe5Kz79Jy8yWFSE9EyAZeXlJPu
 v18O9KlEj4ErliluR3qphyJMXio1OTj+RpLDqRGOjOpnnyG99ZK7LZKxHVXu9AT6rsXS
 AFomlZtiXKv1UIlWd33M7f0UUz5+vPN3GaPqrojvXzJy+ZJC1IvbiCbREUer63IZVNnI
 zZpcNO87q6g75pJjlhlUP63gjEWTlVvrrZEZO5GmuA8hwdtBLUA2XCrIT3EFsqaJSQXd
 A2qjO+cCFN5lS9EOhrR1wckQCpWW7tnTz1gv0P0buO0zDmvHGx1k4NeiD5eRoJKBbApQ
 3CpQ==
X-Gm-Message-State: AOAM5329lj8qkyk9NYaSIYCQ+LDeDljPDWe8q12GwL/IXsO8sCrC/xHP
 f+Czj7mWqnW+65k7RQqFo00=
X-Google-Smtp-Source: ABdhPJwzGPbMco6q3X62epIdFv94rQmQwe/KlKVnhpvRcQA7B9fZyDHIrCbMuF0c2UteJxdD9vBddQ==
X-Received: by 2002:a0c:c345:: with SMTP id j5mr3360366qvi.52.1616265542076;
 Sat, 20 Mar 2021 11:39:02 -0700 (PDT)
Received: from localhost.localdomain ([138.199.13.205])
 by smtp.gmail.com with ESMTPSA id x10sm5879916qtw.17.2021.03.20.11.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 11:39:01 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/atomic: Couple of typo fixes
Date: Sun, 21 Mar 2021 00:06:42 +0530
Message-Id: <20210320183642.10886-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/seralization/serialization/
s/parallism/parallelism/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index dda60051854b..e1e4500aaca4 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1148,7 +1148,7 @@ EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
  * This function walks the current configuration and adds all connectors
  * currently using @crtc to the atomic configuration @state. Note that this
  * function must acquire the connection mutex. This can potentially cause
- * unneeded seralization if the update is just for the planes on one CRTC. Hence
+ * unneeded serialization if the update is just for the planes on one CRTC. Hence
  * drivers and helpers should only call this when really needed (e.g. when a
  * full modeset needs to happen due to some change).
  *
@@ -1213,7 +1213,7 @@ EXPORT_SYMBOL(drm_atomic_add_affected_connectors);
  *
  * Since acquiring a plane state will always also acquire the w/w mutex of the
  * current CRTC for that plane (if there is any) adding all the plane states for
- * a CRTC will not reduce parallism of atomic updates.
+ * a CRTC will not reduce parallelism of atomic updates.
  *
  * Returns:
  * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
