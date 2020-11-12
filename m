Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4262B0D39
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8586E3CE;
	Thu, 12 Nov 2020 19:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9D16E3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p22so6194297wmg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwAPsdpVMxl/zDOaEKrvh3eBbThND3Sgn5s6wfB0Uyk=;
 b=Fres0t8Jfa1sMxBPb0ng+NZpGwBSuzbU/49z0C3NU890xFlv5eHKoMT2jnyDkSsUAN
 wnRBK1oLvYnOS19g9mm4bLKMsv9QVIR5nFRFSZWpq4hV9GOrTC/JGCdpMREo/tXyua0o
 yOQ+ZpxcYuoKP3bJmtqPuD29cfasJafnwYwqQ5N3PcfAC+KckZT0h88fD71xx84k1skp
 eq8Tqu+RqO9DtehkdDNiMSEVRYhVFTAgnDzbmHo0/bPuddqsieHSGFIiKKn8/3Ss8SUC
 BcPKgebo/3N3FuVsc+Wq0lAi/oI16TaiL3sJTGXmlIbX+H6M5+9j9E4xR+fS2u2xGkV9
 TW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwAPsdpVMxl/zDOaEKrvh3eBbThND3Sgn5s6wfB0Uyk=;
 b=foAEVZsiUAJuN9F+/UKkZ8rZYkavS7BuJMjBmEfeR6ETx/HKknvBqypwymIkVckc0r
 gAmCotbFW+CSyO6vU0L3yqlTuD3uFxUX6MVtFoRH/zYJKCtLb/97VQTDgcJtO/5luwyq
 h4AAPJgdjoingDBLe1c7K4h87TcWjlPKQfgt3UJPrnacFACD+aa8MhOLE/90zge9ptO8
 nPiimoz84cI8VmFmMxbVZOhLRjA+wwmkuZohQptWqIs79Z6HaQe4kIAEmo7Fo8yMokbJ
 aPKmg/2eRtdB4pdNOG9B8n7m0qYke5A4O7lvC1XfQ3Au68G2+WQWmRpCqhsQKNgsksNn
 MKng==
X-Gm-Message-State: AOAM530YZgH49fpa2iWz7MJZF7lttJFFoCiws5Pl+FoQRfrWSRQnAvoM
 TS2gN1pfn/Ehk4eREu1n4ZmYrw==
X-Google-Smtp-Source: ABdhPJwQaq6TEqkEhJtdM52YHXCBLInCKG5NdmlDOQQdgOFewzRY4CZLDjSKCrgHJpbyf0s6E3WmfA==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr1029122wmg.81.1605207697949;
 Thu, 12 Nov 2020 11:01:37 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/30] drm/vc4/vc4_debugfs: Demote non-conformant kernel-doc
 headers
Date: Thu, 12 Nov 2020 19:00:30 +0000
Message-Id: <20201112190039.2785914-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vc4/vc4_debugfs.c:25: warning: Function parameter or member 'minor' not described in 'vc4_debugfs_init'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'dev' not described in 'vc4_debugfs_add_file'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'name' not described in 'vc4_debugfs_add_file'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'show' not described in 'vc4_debugfs_add_file'
 drivers/gpu/drm/vc4/vc4_debugfs.c:62: warning: Function parameter or member 'data' not described in 'vc4_debugfs_add_file'

Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 4fbbf980a299f..6da22af4ee911 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -16,7 +16,7 @@ struct vc4_debugfs_info_entry {
 	struct drm_info_list info;
 };
 
-/**
+/*
  * Called at drm_dev_register() time on each of the minors registered
  * by the DRM device, to attach the debugfs files.
  */
@@ -46,7 +46,7 @@ static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 	return 0;
 }
 
-/**
+/*
  * Registers a debugfs file with a callback function for a vc4 component.
  *
  * This is like drm_debugfs_create_files(), but that can only be
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
