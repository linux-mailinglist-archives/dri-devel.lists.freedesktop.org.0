Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959512936E2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0DC6EC2A;
	Tue, 20 Oct 2020 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F49C6EC2A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:35:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so1049937wrt.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=quURMb0KajLQJPTuxMJtPjletg4QxEoaXETruI8bF9s=;
 b=X0UXpSeqBX2x0Rh3MzvoR669Llbn9pxkuyRGgX/PzVznhSPfb7rBDn2+Zj5wkUoBI+
 CBjjJ8c1gk2uysGpHMoV848bEX/Tryceb5wz5o/YpV0K4Lryj04L74YrGRwEgOvw2FRe
 Q1Rie6RSQ+SxKnIdm0pAVTvEnNSdVc3UIstQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=quURMb0KajLQJPTuxMJtPjletg4QxEoaXETruI8bF9s=;
 b=SYRHACTz2NXO9vlDa3/E5J3jLQ+//G2bNqFD2qN7dqO776Hm2svwyPyoCm/k4YtSPz
 N71KA4Rapl1dOIyjpwncVjt4IXArSLpbl4aU9lTCUgRxFXbQyxnBTbFxvj2DjyRRgan3
 OsCRLezR481Q5x4RBBILAUV40gzYlCFmTpgT3pCiUtzrDl0MWBQstVacqp9OUrOd8Xev
 4XSbAkpReXbWcrZXcOLcvFZSDqMtg0cIuzXvv7d4PO4GpSAhGC0lH1flmYwMjgc2c+4M
 owax3kIPKMmqgPR0fNarGIwXG0Zk8XyfmyzibFo/bmgN3UDZVWXzflk9XFbjogPeEiu9
 yyfg==
X-Gm-Message-State: AOAM5301B6ugSMHn+8FCzcgVaH4KNmynI51ro0PWpFEiD4+2yP4qAhvi
 jRIvvvP60fift/B5sYdeyXOrJMr+D42hYC+c
X-Google-Smtp-Source: ABdhPJwDJ3TngyFi25G47JCsJogvLsB3FgTOnNDVerlJiZ99lh5bS9qLmzUVgFiy1epsMBgJiZ8HYA==
X-Received: by 2002:adf:f0c3:: with SMTP id x3mr2123986wro.343.1603182921743; 
 Tue, 20 Oct 2020 01:35:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v6sm1608568wmj.6.2020.10.20.01.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 01:35:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vkms: Unset preferred_depth
Date: Tue, 20 Oct 2020 10:35:15 +0200
Message-Id: <20201020083515.941832-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a confusion between the preferred_depth uapi and the generic
fbdev helpers. Former wants depth, latter wants bpp, and for XRGB8888
they don't match. Which hit me with vkms, which wants that.

All other drivers setting this and using the generic fbdev helpers use
16, where both numbers match, for RGB565.

Since fixing this is a bit involved (I think for atomic drivers we
should just compute this all internally from the format list of the
first primary plane) paper over the issue in vkms by using defaults
everywhere. Then userspace will pick XRGB8888, and fbdev helpers will
do the same, and we have what we want.

Reported-by: Simon Ser <contact@emersion.fr>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 25faba5aac08..98ba844ae77d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -114,7 +114,10 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.max_height = YRES_MAX;
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
-	dev->mode_config.preferred_depth = 32;
+	/* FIXME: There's a confusion between bpp and depth between this and
+	 * fbdev helpers. We have to go with 0, meaning "pick the default",
+	 * which ix XRGB8888 in all cases. */
+	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
 	return vkms_output_init(vkmsdev, 0);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
