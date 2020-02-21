Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C521688E4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9FD6F569;
	Fri, 21 Feb 2020 21:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851D6F53E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so3540184wru.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BscJmdsFSiaOvame9X+vY0h/aJg9xsEkPoVs4+5NTM=;
 b=XG5+t0J0cL+jt7GtWC/achSFgQIa4yS6tTsRYRS2CYLUeyoO2NvDTK9Io/x1KJJDgc
 Qd3kYDgcjYEz6tO2EZUkV2d87e1BfdYFwLGwPyUCyf5VQKFw+3azvO0dP7PKN9JeHWsN
 rAZTSPqvsVNs5MFBaEn6tEqn+X5bLwUDdqyMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BscJmdsFSiaOvame9X+vY0h/aJg9xsEkPoVs4+5NTM=;
 b=CgLZEiMr9IWChwMDvI+d2n5/n7ZGhUGDjAyFIYN8suNkqn8nBdtpNv64LK6PoHHG0n
 x1BU6DvqA5Z6TW13UgdUv4Pd0kbt9N8r0vzU7dDwKgN0hmKo5k8axsIe4gKjNgLGmIWM
 dm4n4tcOcgV1CePj2d8d2K384ucHkaFV0zuG81T6wM7/dDkeou134vCHKy6N2ypJpEyp
 L/ugmfdIcqrhvi3g6QslrOC+q2rh9UsjxekRqxsTwVNbTfL+f3NQ8+zRPb9EkL1/9GRG
 Yh+J6qO3po37btXhcoNWTAbbQq8yCFrrXKqUrE+QTf08yH9trbqpPY/t1sDypjpNgc3j
 xqLA==
X-Gm-Message-State: APjAAAWVZ3vCTONARd4NMKVaMDfrOI0bFeFQBH91W4auElJdMSJ5VMLq
 2liMMUKHQrHH/vq6IZk3u38y3VCTDjs=
X-Google-Smtp-Source: APXvYqz/t4z42ikpCEiHwvOh1FbiJIkHH70PYcqVTlQ218faQuKUQziNAKN+sh5OtBkW1HMkkAEHnA==
X-Received: by 2002:a5d:4847:: with SMTP id n7mr49789832wrs.30.1582319043699; 
 Fri, 21 Feb 2020 13:04:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:03 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/51] drm/bochs: Remove leftover drm_atomic_helper_shutdown
Date: Fri, 21 Feb 2020 22:02:55 +0100
Message-Id: <20200221210319.2245170-28-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Small mistake that crept into

commit 81da8c3b8d3df6f05b11300b7d17ccd1f3017fab
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Feb 11 14:52:18 2020 +0100

    drm/bochs: add drm_driver.release callback

where drm_atomic_helper_shutdown was left in both places. The
->release callback really shouldn't touch hardware.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 8066d7d370d5..e8cc8156d773 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -166,6 +166,5 @@ void bochs_kms_fini(struct bochs_device *bochs)
 	if (!bochs->dev->mode_config.num_connector)
 		return;
 
-	drm_atomic_helper_shutdown(bochs->dev);
 	drm_mode_config_cleanup(bochs->dev);
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
