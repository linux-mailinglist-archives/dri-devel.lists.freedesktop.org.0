Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DF22AB4D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 11:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91628980C;
	Thu, 23 Jul 2020 09:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D043C8980C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:05:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f18so4476529wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YwVwYWTqndxCbsk2H38cWSsg3v3dA5HnwhfyPRdygY=;
 b=Dh+hv/l6NQ3KPAUwJ3pGLveCtOWhIrkufkmB1J+B6iIB43BdLXWcJxxEw2kn1aV+//
 2JduwiOcZylMNxNHMcbMG9ZbOIEHlqKi3fhxPOpIxh10qbgq5XYcYr81SyFIWCdzFHd4
 15yPWQewJKf/16Bt+3N4M4eDj6wXOH2/RBv+0qs8XhfvzmcTQR74kceTWo/9YQOhHdlF
 O7P8bR3q3iUqAML7xw5WsywjG3nrGqFPLPvCJ/RvXDzoddRmu6iIgmgrJk3xL3Lx9OL+
 3Vynunr/OK7U/oZLr+jaCT+zxs/+6mBxrJajTs7hC+4/Ls4HRMdvH9wOOkaPBsOIxr6a
 LgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YwVwYWTqndxCbsk2H38cWSsg3v3dA5HnwhfyPRdygY=;
 b=dp1kZGVXkoIHOoNjmgWT5/pJTeRXs9YhcCtBTWuywT0OMrc3cfvFoj2NuOwiyLepxY
 7nr1yW5hbr33LSGwkqkBRsLkepOmZltmDjk/zu1n/a9nepzIpAyurvg/0HH99Jal7SQa
 gUlE3uUXs/2byMgKgjuQk40ZCoICm12gMi/ZkIjPx3moNg1VO++AMJbzf8kn5Vb+blgB
 TA9VuzBLoVjGm5wfiUfRevEvXVKjK7OgXgk/jdITWDpNRDT4HLQUTXLUbvxTp7miyeWR
 oOAmEhSQwJO46MCwkNYDu2OLvCJqLuUwWKLbXC4ff/typlLGkJQR6kfpuO2tV7aaWNfu
 iXCw==
X-Gm-Message-State: AOAM532STRKBDfB2nGFejHP1hXulBFmKhTYikTVkdBDOPPPSGiYZVprb
 EICkJx58CnjhcBhUeffZyyty8w==
X-Google-Smtp-Source: ABdhPJzM4ikkmRW1tN1fO+N5OIpr1/NNankXN3WMB2rYpcK0NBtOI2uo45JomMLql69t8i0N0TZePQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr3176646wmf.103.1595495155216; 
 Thu, 23 Jul 2020 02:05:55 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d])
 by smtp.gmail.com with ESMTPSA id 62sm2947397wrq.31.2020.07.23.02.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 02:05:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 1/2] drm/fourcc: fix Amlogic Video Framebuffer Compression
 macro
Date: Thu, 23 Jul 2020 11:05:50 +0200
Message-Id: <20200723090551.27529-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the Amlogic Video Framebuffer Compression modifier macro to
correctly add the layout options, a pair of parenthesis was missing.

Fixes: d6528ec88309 ("drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 4bee7de5f306..82f327801267 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1004,7 +1004,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
 	fourcc_mod_code(AMLOGIC, \
 			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
-			((__options) & __fourcc_mod_amlogic_options_mask \
+			(((__options) & __fourcc_mod_amlogic_options_mask) \
 			 << __fourcc_mod_amlogic_options_shift))
 
 /* Amlogic FBC Layouts */
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
